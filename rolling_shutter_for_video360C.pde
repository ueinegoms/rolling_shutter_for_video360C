import processing.video.*;
import java.util.*;

Capture video;
List<Cortes> todoscortes = new LinkedList<Cortes>();
int frame;

void setup(){
  video = new Capture(this, 640, 480, 25);
  size(640, 360);
  //frameRate(60); //nem sei se funfa
  //video.frameRate(60); //framerate do video
  //video.loop(); //mudar pra play quando for exportar
  video.start();
  for (int altura = 0; altura < 180; altura++){
    Cortes c0;
    c0 = new Cortes();
    todoscortes.add(c0);
  }
}

void movieEvent(Movie video){
  video.read();
}

void draw(){
  video.read();
  frame += 1;
  image(video, 0, 0);
  

  for (int i = 0; i<180; i++){
      PImage c = get(0, i*2, 640, 2);
      todoscortes.get(i).cheia(0+(i+1));
      todoscortes.get(i).insere(c);    
      todoscortes.get(i).mostrar(i*2, 0+(i+1));
  }
    
  //saveFrame("output/render_#####.png");
}


public class Cortes {
  
  private List<PImage> cortes = new LinkedList<PImage>();
  
  public void insere(PImage corte) {
    // implementação
    this.cortes.add(corte);
  }

  public void cheia(int max) {
    // implementação
     if (this.cortes.size() == max) {
       this.cortes.remove(0);  
     }
  }
  
  public void mostrar(int altura, int max){
    if (this.cortes.size()==max){
      image (this.cortes.get(0), 0, altura);
    }     
    
  }
}
