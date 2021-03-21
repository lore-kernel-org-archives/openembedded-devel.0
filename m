Subject: Re: [meta-java][PATCH] openjdk-8: use relative path to build-aux in configure.ac
To: openembedded-devel@lists.openembedded.org
From: konstantin.kletschke@inside-m2m.de
X-Originating-Location: Heinsberg, North Rhine-Westphalia, DE (94.31.101.76)
X-Originating-Platform: Mac Safari 14.1
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 21 Mar 2021 02:50:20 -0700
References: <10715.1616102384809166671@lists.openembedded.org>
In-Reply-To: <10715.1616102384809166671@lists.openembedded.org>
Message-ID: <16632.1616320220450473506@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KU3DRi6Yeprp1YN18FwA"

--KU3DRi6Yeprp1YN18FwA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I incorporated two patches into my local meta-java layer. Then openjre-14 b=
uilds also!

*diff --git a/recipes-core/openjdk/openjdk-14-common.inc b/recipes-core/op=
enjdk/openjdk-14-common.inc*

*index 36451b8..df99626 100644*

*--- a/recipes-core/openjdk/openjdk-14-common.inc*

*+++ b/recipes-core/openjdk/openjdk-14-common.inc*

@@ -30,6 +30,8 @@ SRC_URI =3D "\

https://hg.openjdk.java.net/jdk-updates/jdk14u/archive/jdk-${PV}-ga.tar.bz=
2;name=3Djdk \

file://0001-make-autoconf-remove-hard-dependency-on-cups.patch \

file://0002-make-autoconf-toolchain-remove-invalid-compiler-chec.patch \

+=C2=A0 =C2=A0 file://0066-autoconf-fix-build-aux-path.patch \

+=C2=A0 =C2=A0 file://0067-sysctl-path-fix.patch \

"

*cat patches-openjdk-14/0066-autoconf-fix-build-aux-path.patch*

diff --color -Nur jdk14u-jdk-14.0.1-ga.ORIG/make/autoconf/configure.ac jdk=
14u-jdk-14.0.1-ga/make/autoconf/configure.ac

--- jdk14u-jdk-14.0.1-ga.ORIG/make/autoconf/configure.ac 2020-03-05 13:10:=
05.000000000 +0100

+++ jdk14u-jdk-14.0.1-ga/make/autoconf/configure.ac 2021-03-20 15:59:41.98=
5648025 +0100

@@ -33,7 +33,7 @@

AC_PREREQ([2.69])

AC_INIT(OpenJDK, openjdk, build-dev@openjdk.java.net,,http://openjdk.java.=
net)

-AC_CONFIG_AUX_DIR([$TOPDIR/make/autoconf/build-aux])

+AC_CONFIG_AUX_DIR([build-aux])

m4_include([build-aux/pkg.m4])

# Include these first...

*cat patches-openjdk-14/0067-sysctl-path-fix.patch*

diff --color -Nur jdk14u-jdk-14.0.1-ga.ORIG/src/jdk.incubator.jpackage/uni=
x/native/libapplauncher/PosixPlatform.cpp jdk14u-jdk-14.0.1-ga/src/jdk.incu=
bator.jpackage/unix/native/libapplauncher/PosixPlatform.cpp

--- jdk14u-jdk-14.0.1-ga.ORIG/src/jdk.incubator.jpackage/unix/native/libap=
plauncher/PosixPlatform.cpp 2020-03-05 13:10:05.000000000 +0100

+++ jdk14u-jdk-14.0.1-ga/src/jdk.incubator.jpackage/unix/native/libapplaun=
cher/PosixPlatform.cpp 2021-03-20 19:15:37.959412799 +0100

@@ -33,7 +33,7 @@

#include <stdbool.h>

#include <sys/types.h>

#include <unistd.h>

-#include <sys/sysctl.h>

+#include <linux/sysctl.h>

#include <sys/file.h>

#include <sys/stat.h>

#include <sys/wait.h>

--KU3DRi6Yeprp1YN18FwA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I incorporated two patches into my local meta-java layer. Then openjre-14 b=
uilds also!<br /><br />
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;"><strong>diff --git a/recipes-core/=
openjdk/openjdk-14-common.inc b/recipes-core/openjdk/openjdk-14-common.inc<=
/strong></span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;"><strong>index 36451b8..df99626 100=
644</strong></span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;"><strong>--- a/recipes-core/openjdk=
/openjdk-14-common.inc</strong></span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;"><strong>+++ b/recipes-core/openjdk=
/openjdk-14-common.inc</strong></span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #2eaebb;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">@@ -30,6 +30,8 @@</span><span styl=
e=3D"font-variant-ligatures: no-common-ligatures; color: #000000;"> SRC_URI=
 =3D "\</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;&nbsp; &nbsp; https://hg.ope=
njdk.java.net/jdk-updates/jdk14u/archive/jdk-${PV}-ga.tar.bz2;name=3Djdk \<=
/span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;&nbsp; &nbsp; file://0001-ma=
ke-autoconf-remove-hard-dependency-on-cups.patch \</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;&nbsp; &nbsp; file://0002-ma=
ke-autoconf-toolchain-remove-invalid-compiler-chec.patch \</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #2fb41d;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">+&nbsp; &nbsp; file://0066-autocon=
f-fix-build-aux-path.patch \</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #2fb41d;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">+&nbsp; &nbsp; file://0067-sysctl-=
path-fix.patch \</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;&nbsp; &nbsp; "<br /><br /><=
br /><br /></span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;"><strong>cat patches-openjdk-14/006=
6-autoconf-fix-build-aux-path.patch</strong>&nbsp;</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">diff --color -Nur jdk14u-jdk-14.0.=
1-ga.ORIG/make/autoconf/configure.ac jdk14u-jdk-14.0.1-ga/make/autoconf/con=
figure.ac</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">--- jdk14u-jdk-14.0.1-ga.ORIG/make=
/autoconf/configure.ac<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;"> </span>2020-03-05 13:10:05.000000000 +0100</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">+++ jdk14u-jdk-14.0.1-ga/make/auto=
conf/configure.ac<span class=3D"Apple-tab-span" style=3D"white-space: pre;"=
> </span>2021-03-20 15:59:41.985648025 +0100</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">@@ -33,7 +33,7 @@</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;AC_PREREQ([2.69])</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;AC_INIT(OpenJDK, openjdk, bu=
ild-dev@openjdk.java.net,,http://openjdk.java.net)</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000; min-height: 13px;"><s=
pan style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp;</span></p=
>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">-AC_CONFIG_AUX_DIR([$TOPDIR/make/a=
utoconf/build-aux])</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">+AC_CONFIG_AUX_DIR([build-aux])</s=
pan></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;m4_include([build-aux/pkg.m4=
])</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000; min-height: 13px;"><s=
pan style=3D"font-variant-ligatures: no-common-ligatures;">&nbsp;</span></p=
>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;">&nbsp;</p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;# Include these first...</sp=
an></p>
<div><span style=3D"font-variant-ligatures: no-common-ligatures;"><span st=
yle=3D"font-variant-ligatures: no-common-ligatures;"><br /><br /></span></s=
pan>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><strong><span style=
=3D"font-variant-ligatures: no-common-ligatures;">cat patches-openjdk-14/0=
067-sysctl-path-fix.patch&nbsp;</span></strong></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">diff --color -Nur jdk14u-jdk-14.0.=
1-ga.ORIG/src/jdk.incubator.jpackage/unix/native/libapplauncher/PosixPlatfo=
rm.cpp jdk14u-jdk-14.0.1-ga/src/jdk.incubator.jpackage/unix/native/libappla=
uncher/PosixPlatform.cpp</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">--- jdk14u-jdk-14.0.1-ga.ORIG/src/=
jdk.incubator.jpackage/unix/native/libapplauncher/PosixPlatform.cpp<span cl=
ass=3D"Apple-tab-span" style=3D"white-space: pre;"> </span>2020-03-05 13:10=
:05.000000000 +0100</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">+++ jdk14u-jdk-14.0.1-ga/src/jdk.i=
ncubator.jpackage/unix/native/libapplauncher/PosixPlatform.cpp<span class=
=3D"Apple-tab-span" style=3D"white-space: pre;"> </span>2021-03-20 19:15:3=
7.959412799 +0100</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">@@ -33,7 +33,7 @@</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;#include &lt;stdbool.h&gt;</=
span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;#include &lt;sys/types.h&gt;=
</span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;#include &lt;unistd.h&gt;</s=
pan></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">-#include &lt;sys/sysctl.h&gt;</sp=
an></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">+#include &lt;linux/sysctl.h&gt;</=
span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;#include &lt;sys/file.h&gt;<=
/span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;#include &lt;sys/stat.h&gt;<=
/span></p>
<p style=3D"margin-bottom: 0px; font-stretch: normal; font-size: 11px; lin=
e-height: normal; font-family: Menlo; color: #000000;"><span style=3D"font-=
variant-ligatures: no-common-ligatures;">&nbsp;#include &lt;sys/wait.h&gt;<=
/span></p>
</div>

--KU3DRi6Yeprp1YN18FwA--
