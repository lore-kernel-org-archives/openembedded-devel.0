Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UVP9V-0005Th-Vx
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 18:36:10 +0200
Received: by mail-ea0-f174.google.com with SMTP id z16so1339987ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 09:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=V7D9zvSdnk4Sn/BPkC6xUe7zXE4CXLZFHMm9mKJ9iT0=;
	b=ycGaBxxQz3ySwXz47qodXXndDAymu1Pf4iFGQmcxZVvgv0kISC5ET1/VGz066SLXP1
	bgnGNxzioJ0k9oYthB1xusVqli4eVFKubXUTfvIil7hBr+6urIQMcroTJJ+IDON2yreq
	YGzlxvsxVrnZrgO4/r/tL17AxnEbL9QQB/wjPZxyEsbGBYhzK36me/6Jg1n76bvWWv8j
	wBVgV2Yx+/4Xrvfvea0kG5azv/XrBHnTd2W4B0ycWI6VH6MGwr5a6GQRChXj19RjPN5i
	am9uOFlRUE85OPUe0NNo2MzLlc+35FhKx37P7xr/vrEPiKYcfEesHAtYBO3fXeLKRWFE
	aGqg==
X-Received: by 10.14.182.72 with SMTP id n48mr77545216eem.3.1366906706599;
	Thu, 25 Apr 2013 09:18:26 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id cd3sm11122257eeb.6.2013.04.25.09.18.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 09:18:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2013 18:16:02 +0200
Message-Id: <1366906562-30093-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1366906562-30093-1-git-send-email-schnitzeltony@googlemail.com>
References: <1366906562-30093-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe 2/2] network-manager-applet: update to 0.9.8.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 16:36:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ses-and-properties-which-are-not-supporte.patch |   69 ++++++++++++++++++++
 .../files/icons/nm-signal-00.png                   |  Bin 0 -> 494 bytes
 .../files/icons/nm-signal-100.png                  |  Bin 0 -> 413 bytes
 .../files/icons/nm-signal-25.png                   |  Bin 0 -> 500 bytes
 .../files/icons/nm-signal-50.png                   |  Bin 0 -> 496 bytes
 .../files/icons/nm-signal-75.png                   |  Bin 0 -> 474 bytes
 .../network-manager-applet_0.9.8.0.bb}             |   26 +++++--
 7 files changed, 87 insertions(+), 8 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png
 rename meta-gnome/recipes-connectivity/{networkmanager/network-manager-applet_0.9.2.0.bb => network-manager-applet/network-manager-applet_0.9.8.0.bb} (61%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
new file mode 100644
index 0000000..b8ba181
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-remove-classes-and-properties-which-are-not-supporte.patch
@@ -0,0 +1,69 @@
+From 023b17f53d888dfb45981b141ce4dc151ab140f0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 4 Apr 2013 20:23:00 +0200
+Subject: [PATCH] remove classes and properties which are not supported by
+ gtk+
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+unsupported classes caused nm-connection editor to crash
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/connection-editor/ce-page-general.ui      |    7 +------
+ src/connection-editor/nm-connection-editor.ui |    2 +-
+ 2 files changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/src/connection-editor/ce-page-general.ui b/src/connection-editor/ce-page-general.ui
+index f505c14..a3e8d2b 100644
+--- a/src/connection-editor/ce-page-general.ui
++++ b/src/connection-editor/ce-page-general.ui
+@@ -37,8 +37,6 @@
+       <object class="GtkComboBox" id="dependent_vpn_combo">
+         <property name="visible">True</property>
+         <property name="can_focus">False</property>
+-        <property name="margin_left">26</property>
+-        <property name="margin_bottom">12</property>
+         <property name="model">dependent_vpn_model</property>
+         <child>
+           <object class="GtkCellRendererText" id="renderer1"/>
+@@ -59,7 +57,6 @@
+         <property name="visible">True</property>
+         <property name="can_focus">True</property>
+         <property name="receives_default">False</property>
+-        <property name="margin_bottom">12</property>
+         <property name="use_underline">True</property>
+         <property name="xalign">0</property>
+         <property name="draw_indicator">True</property>
+@@ -86,11 +83,9 @@
+       </packing>
+     </child>
+     <child>
+-      <object class="GtkBox" id="box2">
++      <object class="GtkVBox" id="box2">
+         <property name="visible">True</property>
+         <property name="can_focus">False</property>
+-        <property name="valign">start</property>
+-        <property name="vexpand">True</property>
+         <property name="spacing">6</property>
+         <child>
+           <object class="GtkLabel" id="firewall_zone_label">
+diff --git a/src/connection-editor/nm-connection-editor.ui b/src/connection-editor/nm-connection-editor.ui
+index 74ee266..6f1e166 100644
+--- a/src/connection-editor/nm-connection-editor.ui
++++ b/src/connection-editor/nm-connection-editor.ui
+@@ -11,7 +11,7 @@
+     <property name="icon_name">preferences-system-network</property>
+     <property name="type_hint">dialog</property>
+     <child internal-child="vbox">
+-      <object class="GtkBox" id="dialog-vbox2">
++      <object class="GtkVBox" id="dialog-vbox2">
+         <property name="visible">True</property>
+         <property name="can_focus">False</property>
+         <property name="orientation">vertical</property>
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-00.png
new file mode 100644
index 0000000000000000000000000000000000000000..836e723a2f53624d375650a8939dcc20b6a582eb
GIT binary patch
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

literal 0
HcmV?d00001

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-100.png
new file mode 100644
index 0000000000000000000000000000000000000000..def2da969fda37993833a33a96df7c25f344eb90
GIT binary patch
literal 413
zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
z3=G`DAk4@xYmNj^kiEpy*OmP)3#Txbfbfx(cYs2QnIRD+&iT2ysd*(pE(3#eQEFmI
zYKlU6W=V!ZNJgrHyQgnJ?uO|gxxbz+jv*GO-%dFz*kmBkD(}T8mdH5GLAm76MZX;9
zqs>(Xb1pKiac14LJ8nvfa$-oqo*BXW{_NQ!eu(M+x3^-Ycji~mu`zkP?%cA?!Jl5F
zzuY0$|GUFB{{6gTkN7UCGxRNNEsVct&CPtEXmhwt2U|Y3x!d%N6=FaCOnMx?xV}WR
z`>msW-J)IR7g?&zF|W%ti!0e!D|poL_~o0KCI6czEPX7>t*~rUx&d>K!uGhMHu2H!
zJ_1@<YRU|;TQ?kbOiW`7&YZ~*JT>dyjG()dPCF(hF;-q&Ss>$_;Pv*#)3D>~3>*VO
z!y<YXSj1nEn?L*1vfo-!*^UWzFBgjZUvZa#^LIa=(I=&eppfu%^>bP0l+XkKkVl`x

literal 0
HcmV?d00001

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-25.png
new file mode 100644
index 0000000000000000000000000000000000000000..362960b8e744e5dcf34a29e85dff27670d043900
GIT binary patch
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

literal 0
HcmV?d00001

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-50.png
new file mode 100644
index 0000000000000000000000000000000000000000..1add41dcbd48a18c4637d46868b1c5b1cf3f3e35
GIT binary patch
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

literal 0
HcmV?d00001

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png b/meta-gnome/recipes-connectivity/network-manager-applet/files/icons/nm-signal-75.png
new file mode 100644
index 0000000000000000000000000000000000000000..6b509e804f87099546e29af21d4901d2cd33961e
GIT binary patch
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

literal 0
HcmV?d00001

diff --git a/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
similarity index 61%
rename from meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
index 85ea5c8..7dca91c 100644
--- a/meta-gnome/recipes-connectivity/networkmanager/network-manager-applet_0.9.2.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_0.9.8.0.bb
@@ -4,14 +4,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 DEPENDS = "gnome-bluetooth polkit-gnome libnotify networkmanager dbus-glib libglade gconf gnome-keyring libgnome-keyring iso-codes"
 
-inherit gnome
+inherit gnome gtk-icon-cache
 
-SRC_URI[archive.md5sum] = "feaf2c8427d23924dde7de52ff4c5078"
-SRC_URI[archive.sha256sum] = "287301692224cc1bb20abe8bc52140461f565e58898a99daef11a188bb29b362"
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI += " \
+    file://0001-remove-classes-and-properties-which-are-not-supporte.patch \
+    file://images/* \
+"
+SRC_URI[archive.md5sum] = "531ce56c51ec86c5d2dc4cbe58649583"
+SRC_URI[archive.sha256sum] = "1afb6e736870ba95132bf0d211c46849e02a820ba3902a059a616be888053590"
 
 # GTK2.x mode
-EXTRA_OECONF += "--with-gtkver=2 \
-                 --with-bluetooth=yes \
+EXTRA_OECONF += " \
+    --with-gtkver=2 \
+    --with-bluetooth=yes \
 "
 
 do_configure_append() {
@@ -22,13 +29,16 @@ do_configure_append() {
     done
 }
 
+do_install_append() {
+    install -m 0644 ${WORKDIR}/icons/* ${D}/usr/share/icons/hicolor/22x22/apps/
+}
+
 RDEPENDS_${PN} =+ "networkmanager"
 RRECOMMENDS_${PN} =+ "gnome-bluetooth gnome-keyring"
 
-FILES_${PN} += "${datadir}/nm-applet/ \
+FILES_${PN} += " \
+    ${datadir}/nm-applet/ \
     ${datadir}/libnm-gtk/wifi.ui \
-    ${datadir}/gnome-vpn-properties/ \
-    ${datadir}/gnome/autostart/ \
 "
 
 FILES_${PN} += "${libdir}/gnome-bluetooth/plugins/*.so"
-- 
1.7.6.5



