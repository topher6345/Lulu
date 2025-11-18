<CsoundSynthesizer>
<CsInstruments>

sr  = 44100
ksmps = 1
0dbfs = 1
nchnls = 2
  gir   ftgen  10, 0, 8192, 10, 1 
  gares   init   0
instr 1 

  aalfo poscil3 .3, 1.5, gir
  aalfo = aalfo * .2 + .5
  
  kblfo poscil3 .3, 1.3, gir
  kblfo = kblfo * .2 + .5

  kenv  mxadsr   .02, 2, 1, .9 

  ares  foscili  p4 * aalfo, cpsmidinn(p5), 1,1 , 2* kblfo*kenv, gir 
  aenv  mxadsr   3, p3, 1, 3
  gares = ares * aenv
  gares butlp gares, 200 
  outs gares, gares
endin

instr 2

  aoutL, aoutR  reverbsc   gares, gares, .7, 9001
outs aoutL, aoutR
clear gares
endin

instr 3

  aadsr   madsr  .001, 1, .01, 1 
  ares  foscili  p4 * aadsr * 0.02, cpsmidinn(p5), 1, 1, 1, gir 
  gares = ares
  outs gares, gares
endin

</CsInstruments>
<CsScore>
t 0 82
i2 0 326
{ 8 CNT ;320
i1 [0 + 40 * $CNT] 9 .2 60 
i1 [0 + 40 * $CNT] 9 .2 67 
i1 [0 + 40 * $CNT] 9 .2 69 
i1 [0 + 40 * $CNT] 9 .2 72 

i1 [10 + 40 * $CNT] 9 .2 62 
i1 [10 + 40 * $CNT] 9 .2 69 
i1 [10 + 40 * $CNT] 9 .2 71 
i1 [10 + 40 * $CNT] 9 .2 74 

i1 [20 + 40 * $CNT] 9 .2 64 
i1 [20 + 40 * $CNT] 9 .2 67 
i1 [20 + 40 * $CNT] 9 .2 71 
i1 [20 + 40 * $CNT] 9 .2 76 

i1 [30 + 40 * $CNT] 9 .2 62 
i1 [30 + 40 * $CNT] 9 .2 66 
i1 [30 + 40 * $CNT] 9 .2 69 
i1 [30 + 40 * $CNT] 9 .2 74 
}

{80 CNT

i3 [48 + 3 * $CNT ] .2 .4 60
i3 [49 + 3 * $CNT ] .2 .4 67
i3 [50 + 3 * $CNT ] .2 .4 69
}

{60 CNT

i3 [80 + 4 * $CNT ] .2 .4 72
i3 [81 + 4 * $CNT ] .2 .4 62
i3 [82 + 4 * $CNT ] .2 .4 60
i3 [83 + 4 * $CNT ] .2 .4 62
}

{20 CNT

i1 [120 + 8 * $CNT ] 2 .8 53
i1 [122 + 8 * $CNT ] 2 .8 55
i1 [124 + 8 * $CNT ] 2 .8 57
i1 [126 + 8 * $CNT ] 2 .8 55
}
</CsScore>
</CsoundSynthesizer>
