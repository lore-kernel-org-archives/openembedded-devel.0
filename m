Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED0171720
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:19:26 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi2so1081423wib.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2014 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=Fcdc/ekBjKkzJAKL8MQn5h2xMGNDX8Lf2ynER79hBE4=;
	b=Vc0Srl3hwBzmj7osRhskgj7vpTb4aeEGmv//IUbdB7/85wSGHRI7FZ5GMOIRKJ30av
	t2n+xwlygffj01Ub9IUk2B5lVBUw/qHbqriHrhHK8Fv6FcWOx5+kmNbFv/feTXKGE4Rc
	iU6mSZumBGExNFMWalgwC93nPnyj/ICg6pcGu4JaKEVDBRyGhi0RrVdF5WyiT7IlboKA
	YOtyvFYDKgJF+5+7HhiOhf9Jwi+z4zSncTkL9r9BYOdZKpnAUcYEoPdxvaNV2pOlz3lv
	4tig/XcyC3EOEBMqAA6MJ+S9F2ttd2jjHENbFlpxb1o0yzFUFouf4lvrwtKM6R6RxXA6
	BblA==
X-Received: by 10.180.97.98 with SMTP id dz2mr12226076wib.26.1412151567382;
	Wed, 01 Oct 2014 01:19:27 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-251.hsi05.unitymediagroup.de. [176.198.252.251])
	by mx.google.com with ESMTPSA id kx2sm340789wjb.6.2014.10.01.01.19.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 01:19:26 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Oct 2014 10:19:04 +0200
Message-Id: <1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe 04/15] network-manager-applet: update to 0.9.8.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Oct 2014 08:19:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add libsecret to DEPENDS
* remove libglade from DEPENDS
* wireless (nm-signal-*.png) icons were updated upstream
* inherit gnomebase instead of gnome
* make bluetooth PACKAGECONFIG - disabled by default

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ses-and-properties-which-are-not-supporte.patch |  42 ++++-----------------
 .../files/icons/nm-signal-00.png                   | Bin 494 -> 0 bytes
 .../files/icons/nm-signal-100.png                  | Bin 413 -> 0 bytes
 .../files/icons/nm-signal-25.png                   | Bin 500 -> 0 bytes
 .../files/icons/nm-signal-50.png                   | Bin 496 -> 0 bytes
 .../files/icons/nm-signal-75.png                   | Bin 474 -> 0 bytes
 ...9.8.0.bb => network-manager-applet_0.9.8.10.bb} |  21 ++++-------
 7 files changed, 15 insertions(+), 48 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png
 delete mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_0.9.8.0.bb => network-manager-applet_0.9.8.10.bb} (59%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
index b8ba181..4bd0e4f 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
@@ -1,8 +1,7 @@
-From 023b17f53d888dfb45981b141ce4dc151ab140f0 Mon Sep 17 00:00:00 2001
+From c7d75ce38fa392c04c39a75e7b7e068666a7b1e7 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 4 Apr 2013 20:23:00 +0200
-Subject: [PATCH] remove classes and properties which are not supported by
- gtk+
+Date: Tue, 8 Apr 2014 15:22:54 +0200
+Subject: [PATCH] remove classes and properties which are not supported by gtk+
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,12 +12,11 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- src/connection-editor/ce-page-general.ui      |    7 +------
- src/connection-editor/nm-connection-editor.ui |    2 +-
- 2 files changed, 2 insertions(+), 7 deletions(-)
+ src/connection-editor/ce-page-general.ui | 3 ---
+ 1 file changed, 3 deletions(-)
 
 diff --git a/src/connection-editor/ce-page-general.ui b/src/connection-editor/ce-page-general.ui
-index f505c14..a3e8d2b 100644
+index b05f0df..049432b 100644
 --- a/src/connection-editor/ce-page-general.ui
 +++ b/src/connection-editor/ce-page-general.ui
 @@ -37,8 +37,6 @@
@@ -38,32 +36,6 @@ index f505c14..a3e8d2b 100644
          <property name="use_underline">True</property>
          <property name="xalign">0</property>
          <property name="draw_indicator">True</property>
-@@ -86,11 +83,9 @@
-       </packing>
-     </child>
-     <child>
--      <object class="GtkBox" id="box2">
-+      <object class="GtkVBox" id="box2">
-         <property name="visible">True</property>
-         <property name="can_focus">False</property>
--        <property name="valign">start</property>
--        <property name="vexpand">True</property>
-         <property name="spacing">6</property>
-         <child>
-           <object class="GtkLabel" id="firewall_zone_label">
-diff --git a/src/connection-editor/nm-connection-editor.ui b/src/connection-editor/nm-connection-editor.ui
-index 74ee266..6f1e166 100644
---- a/src/connection-editor/nm-connection-editor.ui
-+++ b/src/connection-editor/nm-connection-editor.ui
-@@ -11,7 +11,7 @@
-     <property name="icon_name">preferences-system-network</property>
-     <property name="type_hint">dialog</property>
-     <child internal-child="vbox">
--      <object class="GtkBox" id="dialog-vbox2">
-+      <object class="GtkVBox" id="dialog-vbox2">
-         <property name="visible">True</property>
-         <property name="can_focus">False</property>
-         <property name="orientation">vertical</property>
 -- 
-1.7.6.5
+1.8.3.1
 
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png
deleted file mode 100644
index 836e723a2f53624d375650a8939dcc20b6a582eb..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 494
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmP)3#Txr+V|l6HlUDVW=KSdbAE1aYF-JD%fR4Vl$uzQ
znxasiS(2d;l98(5?&%wlyJ0#|iqX&0#WBR<^xKeye$I{pbMDUEyTsq5LrtT}QK;#l
zeW;9zMU$g|%Ks)6MaM>EM)#~!>L1+s8Q<@?F6Q-FLE_rmyKmpTJ9Cfe|F_#|wvU$^
z*WFE8m7jV&eEL?#j57sgbra85GiwWNEC2TFeD#)n+z(v2EI1duWbN5~d-kn+OD*jz
zTa_N<ZIIj<#>U5LX13j^XNtq~Qz2)z%Q3!G)=_dOKM=O&$H#~J+Dr{B`1txA)B>7J
z^XE*`J+9s5&bjzvm1FAyC!N*@Un1W=YgnFp`e!54M5b$7I+=8|R32B$_^bJ6vt8lk
zdHnI;W{o8t8p2Z#EOIC}*~Sv#CBfI;s=uV;&u>Ylr9P~x5}e0_5*Dsn^~SojW6Jif
zg9_=(oyyNA)oI>au&Uuv;*uA4cJH$9eRqF$SC+wxADT<^1R|fkE%<lymd^4;#<JWw
h7i<4Aul~{hMsyCpzWI&?evY7E_jL7hS?83{1OS4L#;*VX

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png
deleted file mode 100644
index def2da969fda37993833a33a96df7c25f344eb90..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 413
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmP)3#Txbfbfx(cYs2QnIRD+&iT2ysd*(pE(3#eQEFmI
zYKlU6W=V!ZNJgrHyQgnJ?uO|gxxbz+jv*GO-%dFz*kmBkD(}T8mdH5GLAm76MZX;9
zqs>(Xb1pKiac14LJ8nvfa$-oqo*BXW{_NQ!eu(M+x3^-Ycji~mu`zkP?%cA?!Jl5F
zzuY0$|GUFB{{6gTkN7UCGxRNNEsVct&CPtEXmhwt2U|Y3x!d%N6=FaCOnMx?xV}WR
z`>msW-J)IR7g?&zF|W%ti!0e!D|poL_~o0KCI6czEPX7>t*~rUx&d>K!uGhMHu2H!
zJ_1@<YRU|;TQ?kbOiW`7&YZ~*JT>dyjG()dPCF(hF;-q&Ss>$_;Pv*#)3D>~3>*VO
z!y<YXSj1nEn?L*1vfo-!*^UWzFBgjZUvZa#^LIa=(I=&eppfu%^>bP0l+XkKkVl`x

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png
deleted file mode 100644
index 362960b8e744e5dcf34a29e85dff27670d043900..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 500
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmP)3#Tv_Yn`O8IZ#M3GbEzKIX^cyHLnE7WngeFN=+<D
zO;IS%EXhy^$w*aj_w)_O-7p;}#Ter0;uvCa`fZ4z7mK67ns@8w-FR@o!$(iV(D1&v
z#*9u5wxk!_JbxP&DoAvsH9b2d`GZ0Jf%lc!h8JYh^ZnmX3-x)kCVhMMs@1#LfArty
zdl_jz>%?lQ$+a`*&Yc&+q|ll0|AE2$?`+H1*Q{B${e1P7eQXaVmaLF$xWX+FKK=RB
znuyJNH?!|@4pk5?D`hLQnl`OnvW>@J>$#vU(dFzvBcHu92z9VB+P8P-It5OqqsN|!
zonh)}SyJwMHmlcqR=NsX^HC?Rrq;+3Ctvlw*^K?KrhVowsVMMRrC$_r@WPqrmw)_t
zl=(2ZxnPU+p5=lEnNM|lB}gT%@-S)_DPP>q)WPwt^7mOz<;@~)PG=TumN+gUc>KI&
zxbhw6x=<FTRi+ZFvdlhvKPdE(*uT#t-Mm6M+|2xJNP4zRat>p=z%17^4bEFr3Mc0;
mTVyC3oOJ8^EB1Mh?7PhU#q3uc5qB;G1-_@NpUXO@geCxTwZc9C

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png
deleted file mode 100644
index 1add41dcbd48a18c4637d46868b1c5b1cf3f3e35..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 496
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmP)3#Txr*{dh@kAOmonIRD+&iT2ysd*(pE(3#eQEFmI
zYKlU6W=V!ZNJgrHyQgnJ?uO|=DaHU#7sn8b({Dqp{SG?_)PD9p%PQdO)spd|mbXPI
zP{GS@f|2+F7pFxXCo~-vI&3Luh*2plo7VJWbD07s+eL$`Z*F}4@@(%-)_;$;H(P!4
zmwvwHz?F4p^77XiGYNDS6jp{_vu0lXwV<Np(z<eqzY+&#uWEE<IO2C;#-01ATQ)uW
z@<t|$Ese?a%`M3rS2omN&`%7h7MM17X-0n@+tpQP&nTQ>czdG4WL~PPoy-@-OU)~q
z9<?u1YCU$};Qhy^Th&^fveQ;-M(lVQ%Uu!GGbf}ra@iubm4+f4-<rtvrdO|)Zh5%i
z{}aKE(|fWq7*=bvNKV`~;ZfqRm}eK6lV*hT_$sbiDzb=6h%rCu&ASg9R-9vuc-DRE
zu~Wdb7DeOfX?0vOHcD6A%FA1R+Wc%c-J5x6Ph@hre*?49CmYr<!7H4nW|c11-?nJ4
kZ04HZ^Zp(P{^S0U?~!Npu0{X$^nwE3)78&qol`;+02w#XW&i*H

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png
deleted file mode 100644
index 6b509e804f87099546e29af21d4901d2cd33961e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 474
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmP)3n!nErvHMqJU}7E%#er@=ltB<)VvZPmw~~#C^fMp
zHASI3vm`?yBqLS9-P1Q9cf)j`6r+`=i(`nz>9-+<en$)hWZvHj|J<Q1xM<;d_jS%w
z_B=TCn?Y6RZY?thYk=ZG=6A9Mo^N8MgpTtCz0*^WT6XHzr<Ag?oCoszd5u5T%)IJ)
zI&-<!?w$Lzco<CCo{LYv`zs~sb()2prSv-gjK3lWW^d&?!sDPWn7s9#$lLElhV7+%
zE^KPj*B!&|*za{=vSt>3pL=vcDMNs8=bYjMr2}tPTIAcZ7r*|<czAbpo$q0JCw)<|
zBU8@jImCR6ey3okc{O8Eg?fMZ>$4ZH^ByWPtQTOtV*XKHso@L9ji$~8Y3$m0r;o4j
zV=@VemEFUXC@mVzeV9ioSVw6>z;P>veJdx|zJL9MNATc_6RezzI3iy!e5KiT==yCF
zNtefR-5yRd3o>STtceTUTc0xV@x}Db^SctQf@-$M|2Yu+$NdKjt4HyK2JyNmP!M~%
L`njxgN@xNAAqunS

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
similarity index 59%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
index 95c6802..e3c7663 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.10.bb
@@ -2,27 +2,26 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PNBLACKLIST[network-manager-applet] = "BROKEN: depends on broken networkmanager"
+DEPENDS = "polkit-gnome libnotify libsecret networkmanager dbus-glib gconf gnome-keyring libgnome-keyring iso-codes"
 
-DEPENDS = "gnome-bluetooth polkit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring libgnome-keyring iso-codes"
-
-inherit gnome gtk-icon-cache
+inherit gnomebase gtk-icon-cache
 
 GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI += " \
     file://0001-remove-classes-and-properties-which-are-not-supporte.patch \
-    file://images/* \
 "
-SRC_URI[archive.md5sum] = "531ce56c51ec86c5d2dc4cbe58649583"
-SRC_URI[archive.sha256sum] = "1afb6e736870ba95132bf0d211c46849e02a820ba3902a059a616be888053590"
+SRC_URI[archive.md5sum] = "5148348c139229c6a753f815f3f11e1c"
+SRC_URI[archive.sha256sum] = "46fee9a1e667d1826e6a94bb6bd2e6bdbde535fc995e534542f5f7e8b8dae0cb"
 
 # GTK2.x mode
 EXTRA_OECONF += " \
     --with-gtkver=2 \
-    --with-bluetooth=yes \
 "
 
+PACKAGECONFIG[bluetooth] = "--with-bluetooth,--without-bluetooth,gnome-bluetooth,gnome-bluetooth"
+PACKAGECONFIG ??= ""
+
 do_configure_append() {
     rm config.log
     # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
@@ -31,12 +30,8 @@ do_configure_append() {
     done
 }
 
-do_install_append() {
-    install -m 0644 ${WORKDIR}/icons/* ${D}/usr/share/icons/hicolor/22x22/apps/
-}
-
 RDEPENDS_${PN} =+ "networkmanager"
-RRECOMMENDS_${PN} =+ "gnome-bluetooth gnome-keyring"
+RRECOMMENDS_${PN} =+ "gnome-keyring"
 
 FILES_${PN} += " \
     ${datadir}/nm-applet/ \
-- 
1.8.3.1


