Return-Path: <prvs=7010ab24f=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 29EE575547
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:04:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,243,1526335200"; d="scan'208";a="10922071"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jun 2018 15:04:47 +0200
Message-ID: <20180619130449.6650-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180619130449.6650-1-richard.leitner@skidata.com>
References: <20180619130449.6650-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH v2] 1/3] oeqa: runtime: add java & javac testcases
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 13:04:46 -0000
Content-Type: text/plain

These testcases verify that java and javac are working. They will be
used as "quality-gate" test for accepting patches in the future.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 lib/oeqa/files/test.jar         | Bin 0 -> 8164 bytes
 lib/oeqa/files/test.java        |   8 ++++++
 lib/oeqa/runtime/cases/java.py  |  60 ++++++++++++++++++++++++++++++++++++++++
 lib/oeqa/runtime/cases/javac.py |  32 +++++++++++++++++++++
 4 files changed, 100 insertions(+)
 create mode 100644 lib/oeqa/files/test.jar
 create mode 100644 lib/oeqa/files/test.java
 create mode 100644 lib/oeqa/runtime/cases/java.py
 create mode 100644 lib/oeqa/runtime/cases/javac.py

diff --git a/lib/oeqa/files/test.jar b/lib/oeqa/files/test.jar
new file mode 100644
index 0000000000000000000000000000000000000000..a539b22991dc516ec6057d43a5e8f3a42c4d8f51
GIT binary patch
literal 8164
zcmbt(1z1$;_BS<@fHVvp(h@_LG{O)=cXtk*3Mk<qT}p>^cPfH(iXf#l4Beol2z+qQ
zxgXwh&pF?B{{J=4>}St2YrX5;d&Rrf`l%`+qYxsXqoX4<#SbYV{6d5XC<w~3nv(2b
z$YV}rNeK9{tcE6s^5d%k1O%-}5GIl&mh6SZ9v4Y+(Qcg=JV^Iz=v<K=Eb@W-GcO(X
zI^P4a81br2qn!0LAKTh^oI1HCSj@Su5S>YrxMB`vN7l2nzzH!ku>WN?Hu?wm?`ZwH
z$3#-!$HC<h<T|NS6WZfF34$448wbD7;NlXiDx#qWtIc$|-fS@a=Bs+MZA=6NbcFxf
zHp<Pv&TclGf6amQJBO8pqn(Sp)!%U9{(;lp(&KNqfq%kn=j37K=49shH)70xCuVQv
zX6JNsadbAbv~v5`Dt~S*;eW7-0$4%X*~#6*%*n%@!@|+b-900I#%W9f7j_MWIHew;
zU;{Ag>Ld*04RNHjB;^yA>!K+{YBF5xp!jT_E7N^mKAaV?O^b*=%w2-YFM?xZo2KTR
zz1Fg(rp^z)&v>t>_HN@RlFo;G*7XQ&J!SFg?q|kpp>fT9egO}WGnR;;{uW0b2CZig
zl}taN2~+IjDN{MK;rJm+8qs44$030EYuJ?((9I}}#qssmq*qv)2vUM|48pBM-i@n~
z^4BlKX-k27_DM?w;Qo6mMu>x04%QUd+cm?>P4lb$t2qI3>c_tE0Dr{SX(KqNLEApC
zjDpelC#kzX_009NpYx%PBv|KAcDHh+x>qa1eiChRQPeSvsd*ZJJi+cy3f4T7JNYf8
z-Nj0d6og6NJ!gkmZB6UR5T%30iE|$2v!%pClaU&Li6=6!xo3*=Hq0Ma8?Lt47inLo
zyyGhSq@M|{>uqBm4xi;wmTjbb()t{EV4lXI-lh>kDVr2kP?B}e=W%hLrnnVz>nRfF
zd0VWA=vKmeis)Hx<xdfqIIc2}Cf~PB6zU)g)SS0@kHuhz&hC%R=7|cdB`C)HxYoYN
zlFV&qHdx{%d&ka6G}C9yKMLx=xHQ0N!)#EKh%1t*L)qdQ07CXlfyNBR!w0B`<yZ@h
z6;@|BhjUm9^z;1($Z$E}JVQYGl0TdY7@)wEmyvgw458aC&Ug7qH2mSC;Z_~7O%EAa
zopuFf-!aN&Q){|!%MZY94C)@P2QeTaAdDja7K4B8jPn1)8O_|(-Q6sd{^j5gl+B#%
ztgYNVz)sfAzqw|)s<H|a2-hEAX{85fcjlzxl_Z!;V2VNmkzp0#b#`m$VS3bhDK{pc
z)rzM09H5=$M%KQNQ5Gy#7T#4dS$Hq7PhIKUXMUd?hZ~Ejn(B=1<%%@j&ng?g;>eM3
zxq!ZUO~Rby(~uL+rdF`WNZpin1ltrzm|ao84o$Br&N=-leFf^3mH=U(S@Kwjvup7d
zo(eup;rqQYei<>r^yd#3Q`2arkDbU^pFMcZ+lw_d4GE>yiFw+=K;lk?=>k+xF78_0
zXk|NM-+xR8B}Nn7iVfw>B6PQA2KU*0-!A}<`|gVSsEfZiN#K??vs?^%+_BiO9Ea1D
zQl}m8b6%ylbCK^A{xlBc0nQ{TP5=WexplCe5u*>OZzNNaYSWF&fi1=3>ydHZ$HIjC
z<T(<b;S=9X^LgS%wVaJ8L}rWjQ9@N(&58L4;_e>kOLJFY*`7TH@}z31LWheAbILuY
zTdQ7id^0vhL_iq0vFvT${Bx^{{7<d=yCHRa4K=?IU2$NEk{Z7<<)Uquk7VrRhUB;+
z^U(!Gf1<$)32GR!SVN2vosT`8*Hxa$QyguX+zW$39UY<X?8(ruCY*{3?9w<k=L;@c
z_n%sPxUfb=CH*nTIrQ^zt@Y{fqxIQ+zxDJBD*tcUwahZA=l}pxDgKG6d`wDDQEn(~
z*{QF}aIS%uhqr7B)*YHM0)Iz2T`|>6AwqmOPk4qh5L)lA-#1>?KJw|x?9mz~VWq&s
z&N*gP(xP4BgZc;XcUhAPT7=oUrU6}5M<*-tADq1HE(<tR@xWcYwP_72PpwDSae&cn
zseNN^6=9f<c{}lSNxu@LxYdlUX0|hKCV%jJrbO)-6|%})gj<vnZx7<@wNq(=hUF1u
z5o)-EwZ*d(SJ`a^r%pNEXO#089Evj#R5sA&AReP+lH1}A{K3LvK+P3q!tA(9Po|!u
zSc`USSf6yyFwULuQDPnTsYJ9yeH)x5@I=Ojo1buEE?Z`gwt`T15d#>e>a)HQMD3y9
zt)<(6``JmeHWG2pwR2KJ>J7W<#Sv09uZ~IrwW4cOkk#1BF+R&}eZ%g0bacZm=_whW
zM=UNF*u#X!<Kx9ea={V|{!sA9>&ps~hC02#5<7DD#8kqEB(}aKg>iCIEo@Tojp;uA
zq42bKa|PYAA^vSKG!+SDt;UPr+9)RNn=f_4v@o4;RUhFgdP|QNne$D$<mNWJZ;<FF
zeomc=S9yu5P>mz1mD{#<E&iBw(gJze)O|`sE_4kij@!4U2t@$%Wi0iOty-0@zUmkq
zYr`9@H!_WINDS?<Ch9j!i>#pXkK-x#(h`u7-x&o}NyK>+evaYaiG41&raI2fFs-#C
zgLW^DUs$0N3Hw~eMmfKn4~*Tc>5&r=&>VI&twd%0s;_U4Su#d~B^!F=_fWD@qFsv?
z@Dzn(D9RXz?dL{k?W$xZy=oe}DzLiXS~4%cN$&;Yx%TEtZi}Uqk}Sm&#vrvx31=hi
zDbcI@9ja|rAG6Ffy1AV2R8jH0n)#)m<ljuc3M3WstoOh2tpVt=;*&B|aNCR-vnOX1
zWEwPJqU|u|*AV(LD4A+dQJ;LA&M4(H&>SNx@}WLq^T}+pa_=t^d_L1h8Ekb%ocYwK
zV#p&R&6<ZtOXO)d<x4=i+(S|jN`olDYQj5nMm;{XJrwO8zeecj)=yxWdBG?)-Y4|@
z+9&faN?F=`vPz3^z1SLsA#8gL<L;xE4PJa`ox9L%Tlc3;<@L1=zI8(}Ul!j4eTgsk
zrPMwYrZCsCeCfRjp|h)%tYP|;Q4apXC0$NDQ@-ojSHS%q(OLbVr|d-v66<_qBl;^n
zr37t_B<K@sR+}6KjdLfW(?u?4RE)_ek8*~udUjJB<)8D?j2B^^KFvx?-sq0lq6DAI
zceM{bIRcL$9nkEum(+4Dn$u57rpWuY<I8a6T$H+-52;|E9pJEu9sJI#Jhtj`oE18j
z36*m0*nI|Qp10&%&JEdtnA0U>%=s+k6j5?5KU``BCeKD|#uVN!qWM9J!Av!%j|?Qi
z1Nfpe2)^XLs@*Jkq>pUId1pVV4dwRMpL?v^L2B5dN(I@sn_@KR-OQ!B<y>K#<qN6f
zmWi5c;QeVaaA{2OnV^{DHH?=jwdxqlpJLy5MkiclX$+GpbN)MyV1-x?oZ^#)LSu@`
z>x96qH#$=iuNQfcGSoU<H|(PL!z{4}p+mf|aZ+vNL`1$oV6|OQN}y3WbyoK}ksrr;
zc#?%qw?&ORYp&bCiq=7dp3v}Re<_Wu<6N8_ubzXo71jOZI=zUsp)zj3w@Kraq^z!t
zCkc%1RhAFjnZL2dXB`l7lBcXx^5_MBQ`50eJbjG=SQyIePjF~}?n-pUZhl8mU;qTX
zfrp;q#n|e)`d@!SoM%T`a)IhrT*`E-9P+U8csi&~%E6`$&R&F@z;$*WLuwZKXVHlV
zptZg_u!Ti$%mB8C?L6{PWTFpA<80$_SC;Q`M9<<I{GwgcIGC<-;FV|Ol<owXUyuSN
zS|JHGkT?PUtp0u0Zy@fuvK>rh*lrUghIvse+h*K{F}5Zs>=eKs<uRC#I=Nb9wb{_i
zk>X?TR1Nn=ia|R6?%H)<M2x8Q#o6#rS+zM*1&Et!n<1<b%P@*tY@!a~niKwvWz9@1
ze?W+%Fg&6f;dK+CRufW0o`S1LmijUMvMvR%cY<a7F%#|%lvLW5f^CbsYr58^s;0%I
zeqZp(szbiBtc9AET6Yg2|6DLbyTSsB_6g)od87FZX@d??KCbdo0cdAWG&=w7;M~+|
zxQ%lE>?Xl$vEh%O@0}{YsT5%DscQTzXHw$FBATRl*~;3A<D;#-0K_^Wp3LVOP3b6)
z>elKG(s+>$e_CUM`Fd!+cpJkEIS#{|Hqin^YY5vGd`IO_jr6Dq@j}R(M4SZ240~^F
z2XvC@$_p1w6_q)~mxTwfTLhEDh8`llk7Z6;!gA`RtZN`WU6%C$NjIQ?-lK5lkGnbc
zW{d#Cq{n?pR{h4`6LNMA3JE|K)|QAO(@g>ht?3>FXG9MWZ^f$#B}dD5vuXGoM=#5d
zXY_0X6xRpj{V|=R_|rS*G0L_X%$*&w+VFt&Ps#o98!yNrf<m@^Fi*3j#O0{h<a0c!
z6uSF+;HFxKf?{r%4#8cg6s)Tzm=;7#8a^9b;lWH#Y`4qWmhPcZw=uC%ftS==gRX{>
zbOilqgIz_=QD)^Epzs0fZzTYoZ?%>f`eA<L+GcDYd>RgckJ0d^q9`|HQ7&KNpL*H9
z3u|(sQ*ZXo*gQFy?@1_?IaEC3UMTUQe@0=Fy~+j*tAsn$84jz&R`Q^}7+(l?UQCm5
zdc+SmIODJ0m7r{uUSVi(bWIuejpP=)^8S(`7bge`WO~wj&?3JCTP~_(t1N~rU67Ly
z%|_sJZ}*auXi-c1`WqeR5C#O0ec+H7rdt>yFIk=bd@tt9m#iLYl+Fb|vS%Eof>#0N
z@t&nE@5gLQv#7dAR|PFf2?`O{W@+rXWKhYDT$BBH`av1Vdh`9;qf~I}bYyR*WtMC3
z^<db_hrSXd`=a&_LaZxi;+aECu85n_tvFIAC)Y@~wb*o`BoaLa0>U%=zpKT>|3NKw
zTV89aE8VnwPF5BkcFs<}_k0=#8e^)sS2%=7v;Y>>_XaDI<T7|fwk;BfvdEE!!krfK
zDh|T5n-7YYoe#cjL<Z6G{Md*TA8=LCSIA!N4o%<5oVz@kdDQ&u>gp^E^3haL3av9|
zIZ@L|*SdSz{_SFE!LIw4N%s1(<^tu=)eXR2iAbiy&c3ZsZ^PTAv}ktPE?o9)YLAJv
z)+g;fBR0D4*6k!8b`}wz>Af>jcVCBLNqbM$DPIdoi&pSiSXI1~Uja%96}DNi=BNas
zyf8aZccfdm2MYigZCI0zD5W`T#o)YcE~M5^r_B+9Ijt5;WPjn5zIr-l(Pw)-hsRo2
zyQTl?oQ@K;zep%f+EA0G(x2Byw#x_Ki3<yGRgmlCDDV(P1AYZFD*n;jI(STPZy}n^
zCpwIsV!YK&36LgDbiHqZZ;qwF0|1<YAiU@<bA;VES+oFbM$$13t0!FjBlRB|#cF9R
z$S^PtdF(yYwVYJ9jR4@hja|&Zfht^QfJ2L2f?9!)Cc{VW$U1)~!2N?*LEL@HJt3_x
zi-Yre0{GCHhW(fjIV^AT7mi!npIu{o0$J_r3_6x;U7e5&i-{v<ciS~!Vd)z6n4p<M
z3&@L^>H-u{Pz0W?qkfMlaknOi8hH0?^@W^vJI}~R?`<L}R<67>qsIG#ysXe^EqdwU
zqxe8Tu{Mh8p8C(%yA{0=ZG3=jbGj#fh1Ln6P+9$;96f_rVnOq5w@UlZSTS`_ZslXA
z1F3q9h=#J>vX>pCP-`X$n^0Yqcwunjh_nr--TsF0*NgaKg1-JEfshZe(}9S>7sz9R
z0Ek4-gNiuf(zh14cr>xL_tBN)=_Jwm>0gdMd$lK(XLKJw9|`{`qthFW<Pbr-7`R=9
zCE!{LfD<s__Sg1THu*<3$A#@DkIG{dM#s%7UH6=^tl>aF&v1R+f?lK=Fn)uR4)*Fk
zYA-d}9FE#ilOm|=kWUbm2HI51+;cIuZ1}{8MO0ZWDVmeqLH-^)d>kon=-F+2ooKWS
ze!uB+mH>YjUsC@(zBD}CtjwVDW=@ulR&KwASiUAygFuHc0D}LO!LjYJ%xC+1#7gp}
zS|hBc`g!W=8b$9zlC*gg-2$x==RCZZk8F<EKD;rR0b)mgJVHC7K2|JTpXZVUZ)}Io
zrYEhZe^0MnpI^B0xnRp7l?F?Pa4nxV7ch%>@!_roFz`YJ2wNS5)>>C*IH;p-v_hOY
z&;op+Z>#WsbO`HK&4$zaVS_r_T8~G$jqp-!=0f&rEC7;{Ry2kj%taP&o7ZNGEmB8>
zESkNN=?#@Lg25yh)k2kYaHZCn=cvKB%J~sSG)JTx5=_~Rrp@NnURCTrwH#*fLM+?a
z3?Oj^aX-R9#CubSv^r<vEj-&)m8`Qu!=AE2b&rx_h0UIEM{XWH-C~KiSXK#OjwsPY
z!cM{<AsRjT_)~o>*X;Shfl0h*IessZVM4->s@GE{N-6fUQx~>D#`QlXs+35@#EI_r
zd3hIpKlf1U#m(-tfoQn;1>s?LhTOBsMs=d??nIXwydUf-GD~l$P;af|-2WgKmAeoB
zUC^}G8w&gkl}7k7X)hF;vE3)BG*F~Tal}hj(0NdKL$MxX5(Iu3nO3vnkDLWZ<SaUC
zwH9gzdMVCah}v5hT7;t&(ph7P#y{HZC@+fU^?SS_Zm{YKwUImHHl1v<_y{UZO4J}w
z6bXs*;+y76=_EM!UmphQtI-i-tsD}0n`-$Qu!T5^*hUn$t4u6b`?L2Jgc^4iT7+@N
z{cI4<#G|QP2@ljNb4`&5u~!cGIm2gHD|n4^wD8caHkWU~3@)klYISfVXz7JkL|+#7
zaE%4^*N44c<0V}>?^8{PqgsHrr*x5nA*3s(%$NtjxEOpzwM4!RKd);3;S==hUb&dF
zB;Tkm&NA7NL7SLx3K=Zv$d<5sWyb;|X9!>kFgM#+hwM@HKK_h(*=gxc?L$RBIH?Xl
zPi|$bV8=vO8o-i<>l*|v!{dtd#Z{W&3Y|JD_A+CzpIBjP#gtOueq7&{XI`OjfE0&D
zudZ88^wZFd0R=^EJ*r8N|I6*(KB&SawwQPa$&_$w*>bUrC$|@Gf}v6X0WH}EO^L<1
z2NHdWBW(ELsX&ir4+tw^e-|p+ZS>F_iIc0C><nV2IE1ReT!NZc7mYn(jFI+LU4wne
zAkmxxxY~!E30Kw7w^fKpFQ>)JWYgxnLb(m^Dqi#_&Nss;5Zd2`H~4=U-jB^JJe=Kp
ze;;gU8ad-j5<WtHl|QKe!>o96T3w&{-t@!<xw6U2uFxpP^7xIJDy7YMtHw_pj8}x$
z07m;<MzJ4@G2HWd=x<Oj-lXjK%{?7{dpg@6aD8~r7T*+cL57bNCE>-s<g+KsTxQHv
zV<?V4x}G_)JbG;R4QU>4R2U=w`_C@1sJz9?-r0R0DgL(vfNxPS!cMoC4{M3Nmlel#
za|Dn)+9B1K&i;6M?&iRn=-$qeXgyN?9Ttd%eG!jky8GS_!XDMS${>d8qqyzn&!A3g
zE1ZHUb9ug?=n-&idf>xEU_4Q6JvvManT#7tXy&*(LGlCp3eWrrir!A!l5xa}+WMgt
ztFX5;Ozz~_NJ6}dAeHnyt-*tUQ}ZfoHoCNJ@9i}|<t^ZB4i*Dwt0{^Sd*;KDLx|~{
z=SK0$@5x+Z6!fwffc14wt>aa_E=QcQTg*9mUHq>;qM;IJ+f*ZrwPDZZiJA1#V5YZe
zC|s*C*7Fd4p6%5vF}&o}oJp|RqTDQOmk`d`EWshZ8jX_%gc}VAfESSPc{e-}>ePSK
zl{{q)TXXQR@1c5b+|s39e}c%iZ@$2nn$$<~^)aRhp+TFc@T%OrZXqRn4mF#H>_I<i
zt%~cwpy6DZf7hhJO6!}moF7zdNnfc)^{*Zq){Tp0$G62|GrjUv0Dh%^=byuDcF&4p
zBw0O;z@9*B+<Z&qD1lUsI%W`Dsy;BLesp$%m@S^(uAoviD)@l<g;h7`G~i!l-h>Me
z73k&|^1s0=?w|_rA267kGYY}uW*qv<;6L~eEcgG-a?AIdLqb&tAxM(AWlQxtHJCw*
z2E;0h?aJd_$UPBZg;A-dO+I8UNYW=}UT9HS`Dn_bXNUo>s%>cT3D!pVjK(I69xaGx
znIJ%1OldkzS>u>>(2#{-10mwBU)GoUT7XJjsvyEoR?HIs>4v#Yo)wN<G&9<JV~?o-
zuo@<5*GJf>bgj$CCR~~=wtbgkG5Md?Eg?}>9jf21P`$#iny`RmyHA}#O@-#b=yw^d
zVSM9Qn%7fXEe{k>_$Sqv6hFVBn6xnmzHQ9Y%p(!qAg-2_;v>enpJ0P0!tDx)VRtm^
zZR3}QhV}JuoRCJ!DW9*D%^O=sMt=8^nHf(!v#xsbnU^Y@t@sooekQMz4RFKq=k~}Q
z&b3ut!{_e!xr7#8xmhb)9UHIrig~&gse?$0pp<#I+s2LuKCfELKVSXU))a4xUzXL7
z7gQa?NE@7>-4K9yn_1HC`5~&`3`z0-H6%quB1E_wll}@#-Qs5dNq>c+sVX8OVIurB
zjCHq4<IU}Fpw?eY+`?LSG<9=(D{%*M{k7yR%ymb|H_!O1<ZqzYUrXP@UUvlg6X{<-
zu)kjB76!W`+rL}pzd*77G{&zO#Vss$M-~5I)&B;`Zq4<p(SMzq-y$A&By!^ce|&}i
z_a*#c_X__H{Ns;Wf9(%%C-QfMhx$L%`dilcqoQ96<=b}ijxug?&j0V@{YCTnM`gbr
z+qbp%9bMk^!T(U%pH$+1)c0%py)6drXqNbYr|&;XgIl%#j_^Or?RRQJZo=sIOn>KP
nx4Hh;v~!#5@2K$KB6pczRS|IG1PBN?H=pDiC*&u;{q=tUep+_)

literal 0
HcmV?d00001

diff --git a/lib/oeqa/files/test.java b/lib/oeqa/files/test.java
new file mode 100644
index 0000000..a661972
--- /dev/null
+++ b/lib/oeqa/files/test.java
@@ -0,0 +1,8 @@
+package test;
+
+public class test {
+	public static void main(String[] args) {
+		System.out.println("the answer is 42");
+	}
+
+}
diff --git a/lib/oeqa/runtime/cases/java.py b/lib/oeqa/runtime/cases/java.py
new file mode 100644
index 0000000..feb572b
--- /dev/null
+++ b/lib/oeqa/runtime/cases/java.py
@@ -0,0 +1,60 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class JavaTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        myfilesdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '../../files/')
+        src = os.path.join(myfilesdir, 'test.jar')
+        dst = '/tmp/test.jar'
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        dst = '/tmp/test.jar'
+        cls.tc.target.run('rm %s' % dst)
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    def test_java_exists(self):
+        status, output = self.target.run('which java')
+        msg = 'java binary not in PATH or not on target.'
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['java.JavaTest.test_java_exists'])
+    def test_java_version(self):
+        status, output = self.target.run('java -version')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+        # check java version (somehow...)
+
+    @OETestDepends(['java.JavaTest.test_java_exists'])
+    def test_java_jar_works(self):
+        status, output = self.target.run('java -jar /tmp/test.jar')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect output: %s' % output
+        self.assertEqual(output, "the answer is 42", msg=msg)
+
+    @OETestDepends(['java.JavaTest.test_java_exists'])
+    def test_java_jar_int_mode(self):
+        status, output = self.target.run('java -showversion -Xint -jar /tmp/test.jar')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect mode: %s' % output
+        self.assertIn(', interpreted mode)', output, msg=msg)
+
+    @OETestDepends(['java.JavaTest.test_java_exists'])
+    def test_java_jar_comp_mode(self):
+        status, output = self.target.run('java -showversion -Xcomp -jar /tmp/test.jar')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        msg = 'Incorrect mode: %s' % output
+        self.assertIn(', compiled mode)', output, msg=msg)
diff --git a/lib/oeqa/runtime/cases/javac.py b/lib/oeqa/runtime/cases/javac.py
new file mode 100644
index 0000000..ad6de25
--- /dev/null
+++ b/lib/oeqa/runtime/cases/javac.py
@@ -0,0 +1,32 @@
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.runtime.decorator.package import OEHasPackage
+
+class JavacTest(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        myfilesdir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '../../files/')
+        src = os.path.join(myfilesdir, 'test.java')
+        dst = '/tmp/test.java'
+        cls.tc.target.copyTo(src, dst)
+
+    @classmethod
+    def tearDownClass(cls):
+        dst = '/tmp/test.java /tmp/test.class'
+        cls.tc.target.run('rm %s' % dst)
+
+    @OETestDepends(['java.JavaTest.test_java_exists'])
+    def test_javac_exists(self):
+        status, output = self.target.run('which javac')
+        msg = 'javac binary not in PATH or not on target.'
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['javac.JavacTest.test_javac_exists'])
+    def test_javac_works(self):
+        status, output = self.target.run('javac /tmp/test.java')
+        msg = 'Exit status was not 0. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
-- 
2.11.0


