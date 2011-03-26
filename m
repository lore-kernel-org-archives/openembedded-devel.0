Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q3Thv-0004OU-Vc for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 14:39:12 +0100
Received: from f053040067.adsl.alicedsl.de ([78.53.40.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q3Tg7-0008Kk-8c for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 13:37:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2011 14:37:18 +0100
Message-ID: <1301146638.3979.52.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: [PATCH] xbmc: add patch to fix `error: call of overloaded 'abs(int64_t)' is ambiguous`
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
X-List-Received-Date: Sat, 26 Mar 2011 13:39:12 -0000
X-Groupsio-MsgNum: 30646
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-pcRPwg2dzjyo7WJ3LRel"

--=-pcRPwg2dzjyo7WJ3LRel
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 26 Mar 2011 14:31:46 +0100

For further information please read the commit message in the patch.

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 ...SystemGLES.cpp-use-abs-from-standard-libr.patch |   61 ++++++++++++++++=
++++
 recipes/xbmc/xbmc_svn.bb                           |    3 +-
 2 files changed, 63 insertions(+), 1 deletions(-)
 create mode 100644 recipes/xbmc/xbmc/0013-xbmc-RenderSystemGLES.cpp-use-ab=
s-from-standard-libr.patch

diff --git a/recipes/xbmc/xbmc/0013-xbmc-RenderSystemGLES.cpp-use-abs-from-=
standard-libr.patch b/recipes/xbmc/xbmc/0013-xbmc-RenderSystemGLES.cpp-use-=
abs-from-standard-libr.patch
new file mode 100644
index 0000000..32f9dd2
--- /dev/null
+++ b/recipes/xbmc/xbmc/0013-xbmc-RenderSystemGLES.cpp-use-abs-from-standar=
d-libr.patch
@@ -0,0 +1,61 @@
+From dce4c114149d61a9df63c803d3b366c4d5bb4efd Mon Sep 17 00:00:00 2001
+From: Paul Menzel <paulepanter@users.sourceforge.net>
+Date: Wed, 23 Mar 2011 00:48:46 +0100
+Subject: [PATCH] xbmc/RenderSystemGLES.cpp: use `abs` from standard librar=
y to fix build with newer GCC
+
+Using `angstrom-2010.x` (GCC 4.5.x) for `MACHINE =3D "beagleboard"` task c=
ompile fails with the following error. This error does not occur with `angs=
trom-2008.1` which uses GCC 4.3.3.
+
+	arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi -MD =
-c -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g=
gdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_L=
ARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-ab=
i=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfp=
u=3Dneon -mvectorize-with-neon-quad -fexpensive-optimizations -fomit-frame-=
pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inlines-hid=
den -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=
 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-marc=
h=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fpe=
rmissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftf=
p -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon =
-mvectorize-with-neon-quad -D_LINUX -D_FILE_DEFINED -D__STDC_CONSTANT_MACRO=
S -DBIN_INSTALL_PATH=3D"\"/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/x=
bmc\"" -DHAS_SDL_JOYSTICK -D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H =
 -I../ -I. -Ilinux -Icores -I../guilib -Iutils -IFileSystem -I/oe/build-ang=
strom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/=
freetype2 -Icores/dvdplayer -Ilib/libUPnP/Platinum/Source/Core -Ilib/libUPn=
P/Platinum/Source/Platinum -Ilib/libUPnP/Platinum/Source/Devices/MediaServe=
r -Ilib/libUPnP/Platinum/Source/Devices/MediaConnect -Ilib/libUPnP/Platinum=
/Source/Devices/MediaRenderer -Ilib/libUPnP/Neptune/Source/System/Posix -Il=
ib/libUPnP/Neptune/Source/Core -Ilib/libcdio/libcdio/include -I../lib/jsonc=
pp/jsoncpp/include -Ilib/cpluff/libcpluff -D_GNU_SOURCE=3D1 -D_REENTRANT -I=
/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/ -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include/SDL -I/oe/build-angstrom-next/angstrom-dev/sys=
roots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build-angstrom-n=
ext/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.=
0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/include/freetype2 -I/oe/build-angstrom-next/angstrom-dev/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I/oe/build-angstrom-next=
/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -=
I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include/libpng12 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv=
7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build-angstrom-nex=
t/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/incl=
ude -I/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/armv7a/i=
nclude -I/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gn=
ueabi/xbmc-10.05-r12+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git Ren=
derSystemGLES.cpp -o RenderSystemGLES.o
+	arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi -MD =
-c -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g=
gdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D6=
4 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-mar=
ch=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fP=
IC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_=
DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darm=
v7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -D_LINUX -fPI=
C -DXBMC -fexpensive-optimizations -fomit-frame-pointer -frename-registers =
-O2 -ggdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BI=
TS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -W=
a,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad=
 -D_LINUX -D_FILE_DEFINED -D__STDC_CONSTANT_MACROS -DBIN_INSTALL_PATH=3D"\"=
/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK =
-D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -D_GNU_SOURCE=3D1 -D_REEN=
TRANT -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux=
-gnueabi/usr/include/ -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7=
a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build-angstrom-next/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build-an=
gstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include=
/dbus-1.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-l=
inux-gnueabi/usr/include/freetype2 -I/oe/build-angstrom-next/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I/oe/build-angst=
rom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gl=
ib-2.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linu=
x-gnueabi/usr/include/libpng12 -I/oe/build-angstrom-next/angstrom-dev/sysro=
ots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build-angs=
trom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-=
2.0/include -I/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
armv7a/include -I/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/xbmc-10.05-r12+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe=
/git src/meta/ea_old.c -o src/meta/ea_old.o
+	arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi -MD =
-c -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g=
gdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D6=
4 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-mar=
ch=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fP=
IC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_=
DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darm=
v7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -D_LINUX -fPI=
C -DXBMC -fexpensive-optimizations -fomit-frame-pointer -frename-registers =
-O2 -ggdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BI=
TS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -W=
a,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad=
 -D_LINUX -D_FILE_DEFINED -D__STDC_CONSTANT_MACROS -DBIN_INSTALL_PATH=3D"\"=
/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK =
-D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -D_GNU_SOURCE=3D1 -D_REEN=
TRANT -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux=
-gnueabi/usr/include/ -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7=
a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build-angstrom-next/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build-an=
gstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include=
/dbus-1.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-l=
inux-gnueabi/usr/include/freetype2 -I/oe/build-angstrom-next/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I/oe/build-angst=
rom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gl=
ib-2.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linu=
x-gnueabi/usr/include/libpng12 -I/oe/build-angstrom-next/angstrom-dev/sysro=
ots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build-angs=
trom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-=
2.0/include -I/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
armv7a/include -I/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/xbmc-10.05-r12+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe=
/git src/meta/emff.c -o src/meta/emff.o
+	arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi -MD =
-c -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g=
gdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D6=
4 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-mar=
ch=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fP=
IC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_=
DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darm=
v7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -D_LINUX -fPI=
C -DXBMC -fexpensive-optimizations -fomit-frame-pointer -frename-registers =
-O2 -ggdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BI=
TS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -W=
a,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad=
 -D_LINUX -D_FILE_DEFINED -D__STDC_CONSTANT_MACROS -DBIN_INSTALL_PATH=3D"\"=
/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK =
-D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -D_GNU_SOURCE=3D1 -D_REEN=
TRANT -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux=
-gnueabi/usr/include/ -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7=
a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build-angstrom-next/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build-an=
gstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include=
/dbus-1.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-l=
inux-gnueabi/usr/include/freetype2 -I/oe/build-angstrom-next/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I/oe/build-angst=
rom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gl=
ib-2.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linu=
x-gnueabi/usr/include/libpng12 -I/oe/build-angstrom-next/angstrom-dev/sysro=
ots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build-angs=
trom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-=
2.0/include -I/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
armv7a/include -I/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/xbmc-10.05-r12+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe=
/git src/meta/fsb.c -o src/meta/fsb.o
+	arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi -MD =
-c -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g=
gdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D6=
4 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-mar=
ch=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fP=
IC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_=
DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darm=
v7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -D_LINUX -fPI=
C -DXBMC -fexpensive-optimizations -fomit-frame-pointer -frename-registers =
-O2 -ggdb2 -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BI=
TS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -W=
a,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad=
 -D_LINUX -D_FILE_DEFINED -D__STDC_CONSTANT_MACROS -DBIN_INSTALL_PATH=3D"\"=
/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/xbmc\"" -DHAS_SDL_JOYSTICK =
-D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H  -D_GNU_SOURCE=3D1 -D_REEN=
TRANT -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux=
-gnueabi/usr/include/ -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7=
a-angstrom-linux-gnueabi/usr/include/SDL -I/oe/build-angstrom-next/angstrom=
-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build-an=
gstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include=
/dbus-1.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-l=
inux-gnueabi/usr/include/freetype2 -I/oe/build-angstrom-next/angstrom-dev/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I/oe/build-angst=
rom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/gl=
ib-2.0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linu=
x-gnueabi/usr/include/libpng12 -I/oe/build-angstrom-next/angstrom-dev/sysro=
ots/armv7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build-angs=
trom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-=
2.0/include -I/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
armv7a/include -I/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-=
linux-gnueabi/xbmc-10.05-r12+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe=
/git src/meta/gca.c -o src/meta/gca.o
+	In file included from ../guilib/GraphicContext.h:47:0,
+		               from RenderSystemGLES.cpp:27:
+	../guilib/StdString.h:1597:14: note: the mangling of 'va_list' has change=
d in GCC 4.4
+	RenderSystemGLES.cpp: In member function 'virtual bool CRenderSystemGLES:=
:IsExtSupported(const char*)':
+	RenderSystemGLES.cpp:181:20: warning: comparison with string literal resu=
lts in unspecified behaviour
+	RenderSystemGLES.cpp:186:25: warning: comparison with string literal resu=
lts in unspecified behaviour
+	RenderSystemGLES.cpp: In member function 'virtual bool CRenderSystemGLES:=
:PresentRender()':
+	RenderSystemGLES.cpp:253:31: error: call of overloaded 'abs(int64_t)' is =
ambiguous
+	/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/include/stdlib.h:771:12: note: candidates are: int abs(int)
+	RenderSystemGLES.cpp:209:16: note:                 int64_t abs(int64_t)
+	/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/g=
cc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/=
include/c++/4.5.3/cstdlib:170:3: note:                 long long int __gnu_=
cxx::abs(long long int)
+	/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/g=
cc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/=
include/c++/4.5.3/cstdlib:139:3: note:                 long int std::abs(lo=
ng int)
+	RenderSystemGLES.cpp:253:43: error: call of overloaded 'abs(int64_t&)' is=
 ambiguous
+	/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnuea=
bi/usr/include/stdlib.h:771:12: note: candidates are: int abs(int)
+	RenderSystemGLES.cpp:209:16: note:                 int64_t abs(int64_t)
+	/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/g=
cc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/=
include/c++/4.5.3/cstdlib:170:3: note:                 long long int __gnu_=
cxx::abs(long long int)
+	/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/armv7a/lib/g=
cc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/=
include/c++/4.5.3/cstdlib:139:3: note:                 long int std::abs(lo=
ng int)
+	arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi -MD =
-c -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -g=
gdb2 -fpermissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_L=
ARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-ab=
i=3Dsoftfp -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfp=
u=3Dneon -mvectorize-with-neon-quad -fexpensive-optimizations -fomit-frame-=
pointer -frename-registers -O2 -ggdb2 -fpermissive -fvisibility-inlines-hid=
den -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64=
 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftfp -mno-apcs-stack-check -Wa,-marc=
h=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon -mvectorize-with-neon-quad -fexpe=
nsive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2 -fpe=
rmissive -fvisibility-inlines-hidden -fPIC -DPIC -D_REENTRANT -D_LARGEFILE6=
4_SOURCE -D_FILE_OFFSET_BITS=3D64 -g -D_DEBUG -Wall -O2 -mfloat-abi=3Dsoftf=
p -mno-apcs-stack-check -Wa,-march=3Darmv7a -mcpu=3Dcortex-a8 -mfpu=3Dneon =
-mvectorize-with-neon-quad -D_LINUX -D_FILE_DEFINED -D__STDC_CONSTANT_MACRO=
S -DBIN_INSTALL_PATH=3D"\"/usr/lib/xbmc\"" -DINSTALL_PATH=3D"\"/usr/share/x=
bmc\"" -DHAS_SDL_JOYSTICK -D'SVN_REV=3D"Unknown"' -D_ARMEL -DHAVE_CONFIG_H =
 -I../ -I. -Ilinux -Icores -I../guilib -Iutils -IFileSystem -I/oe/build-ang=
strom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/=
freetype2 -Icores/dvdplayer -Ilib/libUPnP/Platinum/Source/Core -Ilib/libUPn=
P/Platinum/Source/Platinum -Ilib/libUPnP/Platinum/Source/Devices/MediaServe=
r -Ilib/libUPnP/Platinum/Source/Devices/MediaConnect -Ilib/libUPnP/Platinum=
/Source/Devices/MediaRenderer -Ilib/libUPnP/Neptune/Source/System/Posix -Il=
ib/libUPnP/Neptune/Source/Core -Ilib/libcdio/libcdio/include -I../lib/jsonc=
pp/jsoncpp/include -Ilib/cpluff/libcpluff -D_GNU_SOURCE=3D1 -D_REENTRANT -I=
/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi=
/usr/include/ -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstr=
om-linux-gnueabi/usr/include/SDL -I/oe/build-angstrom-next/angstrom-dev/sys=
roots/armv7a-angstrom-linux-gnueabi/usr/include/alsa -I/oe/build-angstrom-n=
ext/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/dbus-1.=
0 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnu=
eabi/usr/include/freetype2 -I/oe/build-angstrom-next/angstrom-dev/sysroots/=
armv7a-angstrom-linux-gnueabi/usr/include/fribidi -I/oe/build-angstrom-next=
/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include/glib-2.0 -=
I/oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include/libpng12 -I/oe/build-angstrom-next/angstrom-dev/sysroots/armv=
7a-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -I/oe/build-angstrom-nex=
t/angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib/glib-2.0/incl=
ude -I/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/armv7a/i=
nclude -I/oe/build-angstrom-next/angstrom-dev/work/armv7a-angstrom-linux-gn=
ueabi/xbmc-10.05-r12+gitr0+e2ab481ebe964321c358ab9d6402088c714adcbe/git Key=
boardStat.cpp -o KeyboardStat.o
+	RenderSystemGLES.cpp: At global scope:
+	RenderSystemGLES.cpp:209:16: warning: 'int64_t abs(int64_t)' defined but =
not used
+	make[1]: *** [RenderSystemGLES.o] Error 1
+	make[1]: *** Waiting for unfinished jobs....
+
+This is reported in the XBMC forum [1]and I applied the suggested fix by t=
opfs2 [2] which removed the error. I could not find the upstream commit fix=
ing this error mentioned by bobo1on1 [2].
+
+[1] http://forum.xbmc.org/showthread.php?t=3D81682&page=3D1
+[2] http://forum.xbmc.org/showthread.php?t=3D81682&page=3D2
+
+Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
+---
+ xbmc/RenderSystemGLES.cpp |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/xbmc/RenderSystemGLES.cpp b/xbmc/RenderSystemGLES.cpp
+index 7a6e209..bebc98f 100644
+--- a/xbmc/RenderSystemGLES.cpp
++++ b/xbmc/RenderSystemGLES.cpp
+@@ -250,7 +250,7 @@ bool CRenderSystemGLES::PresentRender()
+     diff =3D curr - m_iSwapStamp;
+     m_iSwapStamp =3D curr;
+=20
+-    if (abs(diff - m_iSwapRate) < abs(diff))
++    if (std::abs(diff - m_iSwapRate) < std::abs(diff))
+       CLog::Log(LOGDEBUG, "%s - missed requested swap",__FUNCTION__);
+   }
+  =20
+--=20
+1.7.4.1
+
diff --git a/recipes/xbmc/xbmc_svn.bb b/recipes/xbmc/xbmc_svn.bb
index 45a7dad..0322bb5 100644
--- a/recipes/xbmc/xbmc_svn.bb
+++ b/recipes/xbmc/xbmc_svn.bb
@@ -7,7 +7,7 @@ require recipes/egl/egl.inc
 SRCREV =3D "e2ab481ebe964321c358ab9d6402088c714adcbe"
=20
 PV =3D "10.05"
-PR =3D "r12"
+PR =3D "r13"
 PR_append =3D "+gitr${SRCPV}"
=20
 SRC_URI =3D "git://xbmc.git.sourceforge.net/gitroot/xbmc/xbmc;protocol=3Dg=
it;branch=3Dmaster \
@@ -23,6 +23,7 @@ file://0009-Added-a-configure-option-disable-optical-driv=
e.patch \
 file://0010-Fixed-so-compile-worked-when-disabling-optical.patch \
 file://0011-reverted-so-normal-bootstrap-doesn-t-exclude-gnu-con.patch \
 file://0012-fix-lzo-things.patch \
+file://0013-xbmc-RenderSystemGLES.cpp-use-abs-from-standard-libr.patch \
 "
=20
 inherit autotools gettext
--=20
1.7.4.1


--=-pcRPwg2dzjyo7WJ3LRel
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2N7A4ACgkQPX1aK2wOHVhCuwCfUt+ZdKdNoZhNOpGMMK3Blubi
Ft8An2SlflVwDUOcmgw0woRS0qwx/eCZ
=GJTV
-----END PGP SIGNATURE-----

--=-pcRPwg2dzjyo7WJ3LRel--
