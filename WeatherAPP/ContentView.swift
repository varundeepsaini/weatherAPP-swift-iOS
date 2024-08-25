//
//  ContentView.swift
//  WeatherAPP
//
//  Created by Varun Deep Saini on 25/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false;
    
    var body: some View {
        ZStack{
          
            BackgroundGradientView(isNight: $isNight)
            
            VStack(spacing : 10){
                CityTextView(cityName: "Bengaluru , Karnataka")
                
                CurrentWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 83)
                
                HStack(spacing : 20){
                    
                    WeatherDayView(dayOfTheWeek: "Tue", 
                                   imageName: "sun.dust.fill",
                                   temperature: 82)
                    
                    WeatherDayView(dayOfTheWeek: "Wed",
                                   imageName: "sun.rain.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfTheWeek: "Thu",
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 67)
                    
                    WeatherDayView(dayOfTheWeek: "Fri",
                                   imageName: "cloud.rain.fill",
                                   temperature: 69)
                
                    WeatherDayView(dayOfTheWeek: "Sat",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    
                }
                
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    ChangeDayTimeButtonView(title: "Change Day / Night", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
        
            }
            
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfTheWeek : String
    var imageName : String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(dayOfTheWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundGradientView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
                                                    isNight ? .black : .blue,
                                                    isNight ? .gray : Color("lightBlue")
                                                  ]
                                         ),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium , design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {
    
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


