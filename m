Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCCA708B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 20:03:28 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so2347480wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iuN83tHfWbK68D1Pnj6EmwlMT8NJ9i5NdwaT24y7t4I=;
	b=iGHB2fzhyhah9sMMsQfuyrIFTXYW9rIARqVO9BSvI2Y7CBHKtVBrweqDEmPQWHe6Se
	KmKlSsnrpeCyIaI7chzhZaJUHxr+Gr2orj7OqBDqXlQAKnbSmGLnWIK5fbUw0VTWd/gc
	rG00s3RcOowPBANfqDgNNoINEaRVNPvz464dZYRMAGP5AZAYYns2S1k3eefBlC7zJ6vX
	LTxRQEtWVe6ikG9PqIVwaYqDo0r0pBlSc/oVPPL8bDHZObr9mdvAMlEVa2Hxgg3QG2xK
	3W7ZBLADhPGv9yzuTauPC/72PWRKhsWJuUq8oCVKxxJBPHoZck+V3JlgDZS16+al8Nzh
	u3aw==
X-Received: by 10.194.89.67 with SMTP id bm3mr10539127wjb.80.1412366609615;
	Fri, 03 Oct 2014 13:03:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wm6sm8978405wjb.5.2014.10.03.13.03.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 13:03:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Oct 2014 22:04:26 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141003200426.GM25706@jama>
References: <1412151555-19865-1-git-send-email-schnitzeltony@googlemail.com>
	<1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1412151555-19865-5-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe 04/15] network-manager-applet: update to 0.9.8.10
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
X-List-Received-Date: Fri, 03 Oct 2014 20:03:32 -0000
X-Groupsio-MsgNum: 52347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tc49Tft5g1TIuAea"
Content-Disposition: inline

--Tc49Tft5g1TIuAea
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2014 at 10:19:04AM +0200, Andreas M=FCller wrote:
> * add libsecret to DEPENDS
> * remove libglade from DEPENDS
> * wireless (nm-signal-*.png) icons were updated upstream
> * inherit gnomebase instead of gnome
> * make bluetooth PACKAGECONFIG - disabled by default

For some reason it has now the same problem as navit (through gypsy.la)

| x86_64-oe-linux-libtool: compile:  x86_64-oe-linux-gcc -m64 -march=3Dcore=
2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D/home/jenkins/oe/world/s=
hr-core/tmp-glibc/sysroots/qemux86-64 -DHAVE_CONFIG_H -I. -I/home/jenkins/o=
e/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network-manager-applet/0.=
9.8.10-r0/network-manager-applet-0.9.8.10/src/utils -I../.. -pthread -I/hom=
e/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/gtk-2=
=2E0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/li=
b/gtk-2.0/include -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemu=
x86-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sy=
sroots/qemux86-64/usr/include/atk-1.0 -I/home/jenkins/oe/world/shr-core/tmp=
-glibc/sysroots/qemux86-64/usr/include/cairo -I/home/jenkins/oe/world/shr-c=
ore/tmp-glibc/sysroots/qemux86-64/usr/include/pixman-1 -I/home/jenkins/oe/w=
orld/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/libpng16 -I/home/je=
nkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/gdk-pixbu=
f-2.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/i=
nclude/libpng16 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux8=
6-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysr=
oots/qemux86-64/usr/include/harfbuzz -I/home/jenkins/oe/world/shr-core/tmp-=
glibc/sysroots/qemux86-64/usr/include/pango-1.0 -I/home/jenkins/oe/world/sh=
r-core/tmp-glibc/sysroots/qemux86-64/usr/include/glib-2.0 -I/home/jenkins/o=
e/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/glib-2.0/include -I/=
home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/home/jenkins/o=
e/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freetype2 -I/hom=
e/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/freet=
ype2 -pthread -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-=
64/usr/include/libnm-glib -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysro=
ots/qemux86-64/usr/include/NetworkManager -I/home/jenkins/oe/world/shr-core=
/tmp-glibc/sysroots/qemux86-64/usr/include/libnm-glib -I/home/jenkins/oe/wo=
rld/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/NetworkManager -I/ho=
me/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/include/dbus=
-1.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/li=
b/dbus-1.0/include -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qem=
ux86-64/usr/include/glib-2.0 -I/home/jenkins/oe/world/shr-core/tmp-glibc/sy=
sroots/qemux86-64/usr/lib/glib-2.0/include -DGLIB_VERSION_MIN_REQUIRED=3DGL=
IB_VERSION_2_26 -DGDK_VERSION_MIN_REQUIRED=3DGDK_VERSION_3_0 -DGCONF_DISABL=
E_DEPRECATED -DGCONF_DISABLE_SINGLE_INCLUDES -DBONOBO_DISABLE_DEPRECATED -D=
BONOBO_DISABLE_SINGLE_INCLUDES -DBONOBO_UI_DISABLE_DEPRECATED -DBONOBO_UI_D=
ISABLE_SINGLE_INCLUDES -DGNOME_DISABLE_DEPRECATED -DGNOME_DISABLE_SINGLE_IN=
CLUDES -DLIBGLADE_DISABLE_DEPRECATED -DLIBGLADE_DISABLE_SINGLE_INCLUDES -DG=
NOME_VFS_DISABLE_DEPRECATED -DGNOME_VFS_DISABLE_SINGLE_INCLUDES -DWNCK_DISA=
BLE_DEPRECATED -DWNCK_DISABLE_SINGLE_INCLUDES -DLIBSOUP_DISABLE_DEPRECATED =
-DLIBSOUP_DISABLE_SINGLE_INCLUDES -I/home/jenkins/oe/world/shr-core/tmp-gli=
bc/work/core2-64-oe-linux/network-manager-applet/0.9.8.10-r0/network-manage=
r-applet-0.9.8.10/src -Wall -std=3Dgnu89 -O2 -pipe -g -feliminate-unused-de=
bug-types -Wshadow -Wmissing-declarations -Wmissing-prototypes -Wdeclaratio=
n-after-statement -Wstrict-prototypes -Wfloat-equal -Wno-unused-parameter -=
Wno-sign-compare -fno-strict-aliasing -Wno-unused-but-set-variable -c /home=
/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/network-manager=
-applet/0.9.8.10-r0/network-manager-applet-0.9.8.10/src/utils/utils.c -o li=
butils_la-utils.o >/dev/null 2>&1
| ../../x86_64-oe-linux-libtool  --tag=3DCC   --mode=3Dlink x86_64-oe-linux=
-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmath=3Dsse --sysroot=3D=
/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64  -Wall -std=
=3Dgnu89  -O2 -pipe -g -feliminate-unused-debug-types -Wshadow -Wmissing-de=
clarations -Wmissing-prototypes -Wdeclaration-after-statement -Wstrict-prot=
otypes -Wfloat-equal -Wno-unused-parameter -Wno-sign-compare -fno-strict-al=
iasing -Wno-unused-but-set-variable   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--=
as-needed -o libutils.la  libutils_la-utils.lo -lgtk-x11-2.0 -lgdk-x11-2.0 =
-lpangocairo-1.0 -latk-1.0 -lcairo -lgdk_pixbuf-2.0 -lgio-2.0 -lpangoft2-1.=
0 -lpango-1.0 -lgobject-2.0 -lglib-2.0 -lfontconfig -lfreetype  -lgio-2.0 -=
lnm-glib -lnm-util -lnm-glib-vpn -ldbus-glib-1 -ldbus-1 -lgobject-2.0 -Wl,-=
-export-dynamic -lgmodule-2.0 -pthread -lglib-2.0
| /bin/grep: /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/=
usr/lib/libgudev-1.0.la: No such file or directory
| sed: can't read /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux8=
6-64/usr/lib/libgudev-1.0.la: No such file or directory
| x86_64-oe-linux-libtool: link: `/home/jenkins/oe/world/shr-core/tmp-glibc=
/sysroots/qemux86-64/usr/lib/libgudev-1.0.la' is not a valid libtool archive
| make[5]: *** [libutils.la] Error 1
| make[5]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/core2-64-oe-linux/network-manager-applet/0.9.8.10-r0/build/src/utils'
| make[4]: *** [all-recursive] Error 1
| make[4]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc/wor=
k/core2-64-oe-linux/network-manager-applet/0.9.8.10-r0/build/src/utils'


>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...ses-and-properties-which-are-not-supporte.patch |  42 ++++-----------=
------
>  .../files/icons/nm-signal-00.png                   | Bin 494 -> 0 bytes
>  .../files/icons/nm-signal-100.png                  | Bin 413 -> 0 bytes
>  .../files/icons/nm-signal-25.png                   | Bin 500 -> 0 bytes
>  .../files/icons/nm-signal-50.png                   | Bin 496 -> 0 bytes
>  .../files/icons/nm-signal-75.png                   | Bin 474 -> 0 bytes
>  ...9.8.0.bb =3D> network-manager-applet_0.9.8.10.bb} |  21 ++++-------
>  7 files changed, 15 insertions(+), 48 deletions(-)
>  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-apple=
t/files/icons/nm-signal-00.png
>  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-apple=
t/files/icons/nm-signal-100.png
>  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-apple=
t/files/icons/nm-signal-25.png
>  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-apple=
t/files/icons/nm-signal-50.png
>  delete mode 100644 meta-gnome/recipes-connectivity/network-manager-apple=
t/files/icons/nm-signal-75.png
>  rename meta-gnome/recipes-connectivity/network-manager-applet/{network-m=
anager-applet_0.9.8.0.bb =3D> network-manager-applet_0.9.8.10.bb} (59%)
>=20
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files=
/0001-remove-classes-and-properties-which-are-not-supporte.patch b/meta-gno=
me/recipes-connectivity/network-manager-applet/files/0001-remove-classes-an=
d-properties-which-are-not-supporte.patch
> index b8ba181..4bd0e4f 100644
> --- a/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-r=
emove-classes-and-properties-which-are-not-supporte.patch
> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/files/0001-r=
emove-classes-and-properties-which-are-not-supporte.patch
> @@ -1,8 +1,7 @@
> -From 023b17f53d888dfb45981b141ce4dc151ab140f0 Mon Sep 17 00:00:00 2001
> +From c7d75ce38fa392c04c39a75e7b7e068666a7b1e7 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> -Date: Thu, 4 Apr 2013 20:23:00 +0200
> -Subject: [PATCH] remove classes and properties which are not supported by
> - gtk+
> +Date: Tue, 8 Apr 2014 15:22:54 +0200
> +Subject: [PATCH] remove classes and properties which are not supported b=
y gtk+
>  MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
> @@ -13,12 +12,11 @@ Upstream-Status: Inappropriate [configuration]
> =20
>  Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>  ---
> - src/connection-editor/ce-page-general.ui      |    7 +------
> - src/connection-editor/nm-connection-editor.ui |    2 +-
> - 2 files changed, 2 insertions(+), 7 deletions(-)
> + src/connection-editor/ce-page-general.ui | 3 ---
> + 1 file changed, 3 deletions(-)
> =20
>  diff --git a/src/connection-editor/ce-page-general.ui b/src/connection-e=
ditor/ce-page-general.ui
> -index f505c14..a3e8d2b 100644
> +index b05f0df..049432b 100644
>  --- a/src/connection-editor/ce-page-general.ui
>  +++ b/src/connection-editor/ce-page-general.ui
>  @@ -37,8 +37,6 @@
> @@ -38,32 +36,6 @@ index f505c14..a3e8d2b 100644
>           <property name=3D"use_underline">True</property>
>           <property name=3D"xalign">0</property>
>           <property name=3D"draw_indicator">True</property>
> -@@ -86,11 +83,9 @@
> -       </packing>
> -     </child>
> -     <child>
> --      <object class=3D"GtkBox" id=3D"box2">
> -+      <object class=3D"GtkVBox" id=3D"box2">
> -         <property name=3D"visible">True</property>
> -         <property name=3D"can_focus">False</property>
> --        <property name=3D"valign">start</property>
> --        <property name=3D"vexpand">True</property>
> -         <property name=3D"spacing">6</property>
> -         <child>
> -           <object class=3D"GtkLabel" id=3D"firewall_zone_label">
> -diff --git a/src/connection-editor/nm-connection-editor.ui b/src/connect=
ion-editor/nm-connection-editor.ui
> -index 74ee266..6f1e166 100644
> ---- a/src/connection-editor/nm-connection-editor.ui
> -+++ b/src/connection-editor/nm-connection-editor.ui
> -@@ -11,7 +11,7 @@
> -     <property name=3D"icon_name">preferences-system-network</property>
> -     <property name=3D"type_hint">dialog</property>
> -     <child internal-child=3D"vbox">
> --      <object class=3D"GtkBox" id=3D"dialog-vbox2">
> -+      <object class=3D"GtkVBox" id=3D"dialog-vbox2">
> -         <property name=3D"visible">True</property>
> -         <property name=3D"can_focus">False</property>
> -         <property name=3D"orientation">vertical</property>
>  --=20
> -1.7.6.5
> +1.8.3.1
> =20
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files=
/icons/nm-signal-00.png b/meta-gnome/recipes-connectivity/network-manager-a=
pplet/files/icons/nm-signal-00.png
> deleted file mode 100644
> index 836e723a2f53624d375650a8939dcc20b6a582eb..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>=20
> literal 494
> zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Txr+V|l6HlUDVW=3DKSdbAE1aYF-JD%fR4Vl$uzQ
> znxasiS(2d;l98(5?&%wlyJ0#|iqX&0#WBR<^xKeye$I{pbMDUEyTsq5LrtT}QK;#l
> zeW;9zMU$g|%Ks)6MaM>EM)#~!>L1+s8Q<@?F6Q-FLE_rmyKmpTJ9Cfe|F_#|wvU$^
> z*WFE8m7jV&eEL?#j57sgbra85GiwWNEC2TFeD#)n+z(v2EI1duWbN5~d-kn+OD*jz
> zTa_N<ZIIj<#>U5LX13j^XNtq~Qz2)z%Q3!G)=3D_dOKM=3DO&$H#~J+Dr{B`1txA)B>7J
> z^XE*`J+9s5&bjzvm1FAyC!N*@Un1W=3DYgnFp`e!54M5b$7I+=3D8|R32B$_^bJ6vt8lk
> zdHnI;W{o8t8p2Z#EOIC}*~Sv#CBfI;s=3DuV;&u>Ylr9P~x5}e0_5*Dsn^~SojW6Jif
> zg9_=3D(oyyNA)oI>au&Uuv;*uA4cJH$9eRqF$SC+wxADT<^1R|fkE%<lymd^4;#<JWw
> h7i<4Aul~{hMsyCpzWI&?evY7E_jL7hS?83{1OS4L#;*VX
>=20
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files=
/icons/nm-signal-100.png b/meta-gnome/recipes-connectivity/network-manager-=
applet/files/icons/nm-signal-100.png
> deleted file mode 100644
> index def2da969fda37993833a33a96df7c25f344eb90..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>=20
> literal 413
> zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Txbfbfx(cYs2QnIRD+&iT2ysd*(pE(3#eQEFmI
> zYKlU6W=3DV!ZNJgrHyQgnJ?uO|gxxbz+jv*GO-%dFz*kmBkD(}T8mdH5GLAm76MZX;9
> zqs>(Xb1pKiac14LJ8nvfa$-oqo*BXW{_NQ!eu(M+x3^-Ycji~mu`zkP?%cA?!Jl5F
> zzuY0$|GUFB{{6gTkN7UCGxRNNEsVct&CPtEXmhwt2U|Y3x!d%N6=3DFaCOnMx?xV}WR
> z`>msW-J)IR7g?&zF|W%ti!0e!D|poL_~o0KCI6czEPX7>t*~rUx&d>K!uGhMHu2H!
> zJ_1@<YRU|;TQ?kbOiW`7&YZ~*JT>dyjG()dPCF(hF;-q&Ss>$_;Pv*#)3D>~3>*VO
> z!y<YXSj1nEn?L*1vfo-!*^UWzFBgjZUvZa#^LIa=3D(I=3D&eppfu%^>bP0l+XkKkVl`x
>=20
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files=
/icons/nm-signal-25.png b/meta-gnome/recipes-connectivity/network-manager-a=
pplet/files/icons/nm-signal-25.png
> deleted file mode 100644
> index 362960b8e744e5dcf34a29e85dff27670d043900..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>=20
> literal 500
> zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Tv_Yn`O8IZ#M3GbEzKIX^cyHLnE7WngeFN=3D+<D
> zO;IS%EXhy^$w*aj_w)_O-7p;}#Ter0;uvCa`fZ4z7mK67ns@8w-FR@o!$(iV(D1&v
> z#*9u5wxk!_JbxP&DoAvsH9b2d`GZ0Jf%lc!h8JYh^ZnmX3-x)kCVhMMs@1#LfArty
> zdl_jz>%?lQ$+a`*&Yc&+q|ll0|AE2$?`+H1*Q{B${e1P7eQXaVmaLF$xWX+FKK=3DRB
> znuyJNH?!|@4pk5?D`hLQnl`OnvW>@J>$#vU(dFzvBcHu92z9VB+P8P-It5OqqsN|!
> zonh)}SyJwMHmlcqR=3DNsX^HC?Rrq;+3Ctvlw*^K?KrhVowsVMMRrC$_r@WPqrmw)_t
> zl=3D(2ZxnPU+p5=3DlEnNM|lB}gT%@-S)_DPP>q)WPwt^7mOz<;@~)PG=3DTumN+gUc>KI&
> zxbhw6x=3D<FTRi+ZFvdlhvKPdE(*uT#t-Mm6M+|2xJNP4zRat>p=3Dz%17^4bEFr3Mc0;
> mTVyC3oOJ8^EB1Mh?7PhU#q3uc5qB;G1-_@NpUXO@geCxTwZc9C
>=20
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files=
/icons/nm-signal-50.png b/meta-gnome/recipes-connectivity/network-manager-a=
pplet/files/icons/nm-signal-50.png
> deleted file mode 100644
> index 1add41dcbd48a18c4637d46868b1c5b1cf3f3e35..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>=20
> literal 496
> zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> z3=3DG`DAk4@xYmNj^kiEpy*OmP)3#Txr*{dh@kAOmonIRD+&iT2ysd*(pE(3#eQEFmI
> zYKlU6W=3DV!ZNJgrHyQgnJ?uO|=3DDaHU#7sn8b({Dqp{SG?_)PD9p%PQdO)spd|mbXPI
> zP{GS@f|2+F7pFxXCo~-vI&3Luh*2plo7VJWbD07s+eL$`Z*F}4@@(%-)_;$;H(P!4
> zmwvwHz?F4p^77XiGYNDS6jp{_vu0lXwV<Np(z<eqzY+&#uWEE<IO2C;#-01ATQ)uW
> z@<t|$Ese?a%`M3rS2omN&`%7h7MM17X-0n@+tpQP&nTQ>czdG4WL~PPoy-@-OU)~q
> z9<?u1YCU$};Qhy^Th&^fveQ;-M(lVQ%Uu!GGbf}ra@iubm4+f4-<rtvrdO|)Zh5%i
> z{}aKE(|fWq7*=3DbvNKV`~;ZfqRm}eK6lV*hT_$sbiDzb=3D6h%rCu&ASg9R-9vuc-DRE
> zu~Wdb7DeOfX?0vOHcD6A%FA1R+Wc%c-J5x6Ph@hre*?49CmYr<!7H4nW|c11-?nJ4
> kZ04HZ^Zp(P{^S0U?~!Npu0{X$^nwE3)78&qol`;+02w#XW&i*H
>=20
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/files=
/icons/nm-signal-75.png b/meta-gnome/recipes-connectivity/network-manager-a=
pplet/files/icons/nm-signal-75.png
> deleted file mode 100644
> index 6b509e804f87099546e29af21d4901d2cd33961e..0000000000000000000000000=
000000000000000
> GIT binary patch
> literal 0
> HcmV?d00001
>=20
> literal 474
> zcmeAS@N?(olHy`uVBq!ia0vp^Vj#@H1|*Mc$*~4fY)RhkE)4%caKYZ?lYt_f1s;*b
> z3=3DG`DAk4@xYmNj^kiEpy*OmP)3n!nErvHMqJU}7E%#er@=3DltB<)VvZPmw~~#C^fMp
> zHASI3vm`?yBqLS9-P1Q9cf)j`6r+`=3Di(`nz>9-+<en$)hWZvHj|J<Q1xM<;d_jS%w
> z_B=3DTCn?Y6RZY?thYk=3DZG=3D6A9Mo^N8MgpTtCz0*^WT6XHzr<Ag?oCoszd5u5T%)IJ)
> zI&-<!?w$Lzco<CCo{LYv`zs~sb()2prSv-gjK3lWW^d&?!sDPWn7s9#$lLElhV7+%
> zE^KPj*B!&|*za{=3DvSt>3pL=3DvcDMNs8=3DbYjMr2}tPTIAcZ7r*|<czAbpo$q0JCw)<|
> zBU8@jImCR6ey3okc{O8Eg?fMZ>$4ZH^ByWPtQTOtV*XKHso@L9ji$~8Y3$m0r;o4j
> zV=3D@VemEFUXC@mVzeV9ioSVw6>z;P>veJdx|zJL9MNATc_6RezzI3iy!e5KiT=3D=3DyCF
> zNtefR-5yRd3o>STtceTUTc0xV@x}Db^SctQf@-$M|2Yu+$NdKjt4HyK2JyNmP!M~%
> L`njxgN@xNAAqunS
>=20
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/netwo=
rk-manager-applet_0.9.8.0.bb b/meta-gnome/recipes-connectivity/network-mana=
ger-applet/network-manager-applet_0.9.8.10.bb
> similarity index 59%
> rename from meta-gnome/recipes-connectivity/network-manager-applet/networ=
k-manager-applet_0.9.8.0.bb
> rename to meta-gnome/recipes-connectivity/network-manager-applet/network-=
manager-applet_0.9.8.10.bb
> index 95c6802..e3c7663 100644
> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-mana=
ger-applet_0.9.8.0.bb
> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-mana=
ger-applet_0.9.8.10.bb
> @@ -2,27 +2,26 @@ SUMMARY =3D "GTK+ applet for NetworkManager"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> =20
> -PNBLACKLIST[network-manager-applet] =3D "BROKEN: depends on broken netwo=
rkmanager"
> +DEPENDS =3D "polkit-gnome libnotify libsecret networkmanager dbus-glib g=
conf gnome-keyring libgnome-keyring iso-codes"
> =20
> -DEPENDS =3D "gnome-bluetooth polkit-gnome libnotify networkmanager dbus-=
glib libglade gconf gnome-keyring libgnome-keyring iso-codes"
> -
> -inherit gnome gtk-icon-cache
> +inherit gnomebase gtk-icon-cache
> =20
>  GNOME_COMPRESS_TYPE =3D "xz"
> =20
>  SRC_URI +=3D " \
>      file://0001-remove-classes-and-properties-which-are-not-supporte.pat=
ch \
> -    file://images/* \
>  "
> -SRC_URI[archive.md5sum] =3D "531ce56c51ec86c5d2dc4cbe58649583"
> -SRC_URI[archive.sha256sum] =3D "1afb6e736870ba95132bf0d211c46849e02a820b=
a3902a059a616be888053590"
> +SRC_URI[archive.md5sum] =3D "5148348c139229c6a753f815f3f11e1c"
> +SRC_URI[archive.sha256sum] =3D "46fee9a1e667d1826e6a94bb6bd2e6bdbde535fc=
995e534542f5f7e8b8dae0cb"
> =20
>  # GTK2.x mode
>  EXTRA_OECONF +=3D " \
>      --with-gtkver=3D2 \
> -    --with-bluetooth=3Dyes \
>  "
> =20
> +PACKAGECONFIG[bluetooth] =3D "--with-bluetooth,--without-bluetooth,gnome=
-bluetooth,gnome-bluetooth"
> +PACKAGECONFIG ??=3D ""
> +
>  do_configure_append() {
>      rm config.log
>      # Sigh... --enable-compile-warnings=3Dno doesn't actually turn off -=
Werror
> @@ -31,12 +30,8 @@ do_configure_append() {
>      done
>  }
> =20
> -do_install_append() {
> -    install -m 0644 ${WORKDIR}/icons/* ${D}/usr/share/icons/hicolor/22x2=
2/apps/
> -}
> -
>  RDEPENDS_${PN} =3D+ "networkmanager"
> -RRECOMMENDS_${PN} =3D+ "gnome-bluetooth gnome-keyring"
> +RRECOMMENDS_${PN} =3D+ "gnome-keyring"
> =20
>  FILES_${PN} +=3D " \
>      ${datadir}/nm-applet/ \
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tc49Tft5g1TIuAea
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQvAUoACgkQN1Ujt2V2gByTMACguZBbJlUiltgTOwfDKkaAkLQd
HnUAn1Q6nEkwENmoRNXF0Sg7DImoo68N
=9kCg
-----END PGP SIGNATURE-----

--Tc49Tft5g1TIuAea--
