Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NVY3p-0007sO-H5
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 23:21:04 +0100
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 14 Jan 2010 23:18:49 +0100
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 14 Jan 2010 23:17:39 +0100
Received: from [192.168.1.116] ([79.7.143.47]) by FBCMCL01B03.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Thu, 14 Jan 2010 23:17:38 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2010 23:17:35 +0100
Message-Id: <1263507455.3757.37.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 14 Jan 2010 22:17:38.0982 (UTC)
	FILETIME=[61E18460:01CA9567]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: illume-image
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
X-List-Received-Date: Thu, 14 Jan 2010 22:21:05 -0000
X-Groupsio-MsgNum: 15723
Content-Type: multipart/mixed; boundary="=-7XhkNR95YOxh7KYTsak3"

--=-7XhkNR95YOxh7KYTsak3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,
every time I build the illume image I've the following failures:


First failure:
--------------
The first failure is about libefso and its deps,it has missing includes
and so it fails,long time ago I tried to fix it but at a point I
abandonned,so is it ok to remove the following from illume-image:

*libefso
*essential-dialer
*elementary-sms

By the way I'm not doing an image for a phone,my target is the bug
device.

here's svn info on a recently(today) svn checkout
$ svn info
Path: .
URL: http://svn.om.vptt.ch/trunk/libefso
Repository Root: http://svn.om.vptt.ch
Repository UUID: 757e9fe0-9496-417e-b309-215f0fa43bb9
Revision: 194
Node Kind: directory
Schedule: normal
Last Changed Author: thseiler
Last Changed Rev: 176
Last Changed Date: 2009-03-01 22:12:43 +0100 (Sun, 01 Mar 2009)

First Question:
----------
does anyone object if I remove:
libefso
essential-dialer
elementary-sms
from illume-image
?

Next error:
----------------
Collected errors:
* Cannot find package gst-plugin-modplug.

so I did the following:
$ wget
http://www.angstrom-distribution.org/unstable/feed/armv6/gstreamer/gst-plugin-modplug_0.10.6-r2.2_armv6.ipk

$ mkdir modplug
$ cd modplug
$ ar x ../ gst-plugin-modplug_0.10.6-r2.2_armv6.ipk
$ tar xvzf control.tar.gz
$ cat control
Package: gst-plugin-modplug
Version: 0.10.6-r2.2
Description: GStreamer plugin for modplug
Section: multimedia
Priority: optional
Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
License: LGPL
Architecture: armv6
OE: gst-plugins-bad
Homepage: http://www.gstreamer.net/
Depends: gstreamer (>= 0.10.22), libgobject-2.0-0 (>= 2.20.0),
libgmodule-2.0-0 (>= 2.20.0), libgthread-2.0-0 (>= 2.20.0), libc6 (>=
2.6.1), libxml2 (>= 2.7.2), libglib-2.0-0 (>= 2.20.0), libstdc++6 (>=
4.3.3), libgcc1 (>= 4.3.3)
Source:
http://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-0.10.6.tar.bz2 file://vorbisenc.h file://vorbisdec.h file://gst-plugins-directfb-fix.patch;patch=1;pnum=2 file://ivorbis-thumb.patch;patch=1

note the patches
so back into the gstreamer dir in oe I did:
~/oe/org.openembedded.dev/recipes/gstreamer $ grep
file://ivorbis-thumb.patch *
gst-plugins-bad_0.10.11.bb:
file://ivorbis-thumb.patch;patch=1"
gst-plugins-bad_0.10.12.bb:
file://ivorbis-thumb.patch;patch=1"
gst-plugins-bad_0.10.6.bb:
file://ivorbis-thumb.patch;patch=1"
gst-plugins-bad_0.10.9.bb:
file://ivorbis-thumb.patch;patch=1"

so bad was the one supposing to build it.

also(useless output removed):
$ tar tvzf data.tar.gz 
-rwxr-xr-x root/root    229860 2009-05-15
16:33 ./usr/lib/gstreamer-0.10/libgstmodplug.so

And no libgstmodplug.so in my workdir

we could also remove it,but I'm not sure it's a good idea.

Denis



--=-7XhkNR95YOxh7KYTsak3
Content-Disposition: attachment; filename="log.do_compile.15386"
Content-Type: text/plain; name="log.do_compile.15386"; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

NOTE: make
Making all in src
make[1]: Entering directory `/home/embedded/oetmp_bug/work/armv6-angstrom-l=
inux-gnueabi/libefso-0.0.1+svnr194-r0/libefso/src'
Making all in lib
make[2]: Entering directory `/home/embedded/oetmp_bug/work/armv6-angstrom-l=
inux-gnueabi/libefso-0.0.1+svnr194-r0/libefso/src/lib'
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcomp=
ile ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136j=
f-s -mfpu=3Dvfp -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -DPACKAGE=
_NAME=3D\"libefso\" -DPACKAGE_TARNAME=3D\"libefso\" -DPACKAGE_VERSION=3D\"0=
.0.1\" -DPACKAGE_STRING=3D\"libefso\ 0.0.1\" -DPACKAGE_BUGREPORT=3D\"thomas=
.seiler@swisscom.com\" -DPACKAGE=3D\"libefso\" -DVERSION=3D\"0.0.1\" -DSTDC=
_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=
=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_IN=
TTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DL=
T_OBJDIR=3D\".libs/\" -I. -I/home/embedded/oetmp_bug/staging/armv6-angstrom=
-linux-gnueabi/usr/include/glib-2.0 -I/home/embedded/oetmp_bug/staging/armv=
6-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/home/embedded/oetmp_bu=
g/staging/armv6-angstrom-linux-gnueabi/usr/include/eina-0 -I/home/embedded/=
oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/eina-0/eina -I/h=
ome/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/dbu=
s-1.0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/l=
ib/dbus-1.0/include    -isystem/home/embedded/oetmp_bug/staging/armv6-angst=
rom-linux-gnueabi/usr/include -Wall -g -isystem/home/embedded/oetmp_bug/sta=
ging/armv6-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fr=
ename-registers -fomit-frame-pointer -O2 -ggdb3 -MT efso.lo -MD -MP -MF .de=
ps/efso.Tpo -c -o efso.lo efso.c
arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux-gnu=
eabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -mfpu=3Dvfp -mfloat-abi=3Dsof=
tfp -mthumb-interwork -mno-thumb -DPACKAGE_NAME=3D\"libefso\" -DPACKAGE_TAR=
NAME=3D\"libefso\" -DPACKAGE_VERSION=3D\"0.0.1\" "-DPACKAGE_STRING=3D\"libe=
fso 0.0.1\"" -DPACKAGE_BUGREPORT=3D\"thomas.seiler@swisscom.com\" -DPACKAGE=
=3D\"libefso\" -DVERSION=3D\"0.0.1\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=
=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_M=
EMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 =
-DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -I. -I/home=
/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/glib-2=
.0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/lib/=
glib-2.0/include -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gn=
ueabi/usr/include/eina-0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-=
linux-gnueabi/usr/include/eina-0/eina -I/home/embedded/oetmp_bug/staging/ar=
mv6-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/home/embedded/oetmp_bug/=
staging/armv6-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -isystem/home=
/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include -Wall =
-g -isystem/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/us=
r/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer=
 -O2 -ggdb3 -MT efso.lo -MD -MP -MF .deps/efso.Tpo -c efso.c  -fPIC -DPIC -=
o .libs/efso.o
efso.c: In function 'efso_init':
efso.c:11: warning: implicit declaration of function 'printf'
efso.c:11: warning: incompatible implicit declaration of built-in function =
'printf'
efso.c: In function 'efso_shutdown':
efso.c:26: warning: incompatible implicit declaration of built-in function =
'printf'
efso.c: In function 'efso_get':
efso.c:95: warning: incompatible implicit declaration of built-in function =
'printf'
arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux-gnu=
eabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -mfpu=3Dvfp -mfloat-abi=3Dsof=
tfp -mthumb-interwork -mno-thumb -DPACKAGE_NAME=3D\"libefso\" -DPACKAGE_TAR=
NAME=3D\"libefso\" -DPACKAGE_VERSION=3D\"0.0.1\" "-DPACKAGE_STRING=3D\"libe=
fso 0.0.1\"" -DPACKAGE_BUGREPORT=3D\"thomas.seiler@swisscom.com\" -DPACKAGE=
=3D\"libefso\" -DVERSION=3D\"0.0.1\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=
=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_M=
EMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 =
-DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -I. -I/home=
/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/glib-2=
.0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/lib/=
glib-2.0/include -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gn=
ueabi/usr/include/eina-0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-=
linux-gnueabi/usr/include/eina-0/eina -I/home/embedded/oetmp_bug/staging/ar=
mv6-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/home/embedded/oetmp_bug/=
staging/armv6-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -isystem/home=
/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include -Wall =
-g -isystem/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/us=
r/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer=
 -O2 -ggdb3 -MT efso.lo -MD -MP -MF .deps/efso.Tpo -c efso.c -o efso.o >/de=
v/null 2>&1
mv -f .deps/efso.Tpo .deps/efso.Plo
/bin/sh ../../arm-angstrom-linux-gnueabi-libtool --tag=3DCC   --mode=3Dcomp=
ile ccache arm-angstrom-linux-gnueabi-gcc -march=3Darmv6j -mtune=3Darm1136j=
f-s -mfpu=3Dvfp -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb -DPACKAGE=
_NAME=3D\"libefso\" -DPACKAGE_TARNAME=3D\"libefso\" -DPACKAGE_VERSION=3D\"0=
.0.1\" -DPACKAGE_STRING=3D\"libefso\ 0.0.1\" -DPACKAGE_BUGREPORT=3D\"thomas=
.seiler@swisscom.com\" -DPACKAGE=3D\"libefso\" -DVERSION=3D\"0.0.1\" -DSTDC=
_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=
=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_IN=
TTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DL=
T_OBJDIR=3D\".libs/\" -I. -I/home/embedded/oetmp_bug/staging/armv6-angstrom=
-linux-gnueabi/usr/include/glib-2.0 -I/home/embedded/oetmp_bug/staging/armv=
6-angstrom-linux-gnueabi/usr/lib/glib-2.0/include -I/home/embedded/oetmp_bu=
g/staging/armv6-angstrom-linux-gnueabi/usr/include/eina-0 -I/home/embedded/=
oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/eina-0/eina -I/h=
ome/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/dbu=
s-1.0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/l=
ib/dbus-1.0/include    -isystem/home/embedded/oetmp_bug/staging/armv6-angst=
rom-linux-gnueabi/usr/include -Wall -g -isystem/home/embedded/oetmp_bug/sta=
ging/armv6-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -fr=
ename-registers -fomit-frame-pointer -O2 -ggdb3 -MT efso-dict-helper.lo -MD=
 -MP -MF .deps/efso-dict-helper.Tpo -c -o efso-dict-helper.lo efso-dict-hel=
per.c
arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux-gnu=
eabi-gcc -march=3Darmv6j -mtune=3Darm1136jf-s -mfpu=3Dvfp -mfloat-abi=3Dsof=
tfp -mthumb-interwork -mno-thumb -DPACKAGE_NAME=3D\"libefso\" -DPACKAGE_TAR=
NAME=3D\"libefso\" -DPACKAGE_VERSION=3D\"0.0.1\" "-DPACKAGE_STRING=3D\"libe=
fso 0.0.1\"" -DPACKAGE_BUGREPORT=3D\"thomas.seiler@swisscom.com\" -DPACKAGE=
=3D\"libefso\" -DVERSION=3D\"0.0.1\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=
=3D1 -DHAVE_SYS_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_M=
EMORY_H=3D1 -DHAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 =
-DHAVE_UNISTD_H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -I. -I/home=
/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include/glib-2=
.0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/lib/=
glib-2.0/include -I/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gn=
ueabi/usr/include/eina-0 -I/home/embedded/oetmp_bug/staging/armv6-angstrom-=
linux-gnueabi/usr/include/eina-0/eina -I/home/embedded/oetmp_bug/staging/ar=
mv6-angstrom-linux-gnueabi/usr/include/dbus-1.0 -I/home/embedded/oetmp_bug/=
staging/armv6-angstrom-linux-gnueabi/usr/lib/dbus-1.0/include -isystem/home=
/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/usr/include -Wall =
-g -isystem/home/embedded/oetmp_bug/staging/armv6-angstrom-linux-gnueabi/us=
r/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer=
 -O2 -ggdb3 -MT efso-dict-helper.lo -MD -MP -MF .deps/efso-dict-helper.Tpo =
-c efso-dict-helper.c  -fPIC -DPIC -o .libs/efso-dict-helper.o
efso-dict-helper.c: In function 'efso_dict_has_entry':
efso-dict-helper.c:181: warning: implicit declaration of function 'perror'
efso-dict-helper.c: In function 'efso_dict_print':
efso-dict-helper.c:220: warning: implicit declaration of function 'printf'
efso-dict-helper.c:220: warning: incompatible implicit declaration of built=
-in function 'printf'
efso-dict-helper.c: In function 'efso_get_string_array':
efso-dict-helper.c:295: warning: implicit declaration of function 'fprintf'
efso-dict-helper.c:295: warning: incompatible implicit declaration of built=
-in function 'fprintf'
efso-dict-helper.c:295: error: 'stderr' undeclared (first use in this funct=
ion)
efso-dict-helper.c:295: error: (Each undeclared identifier is reported only=
 once
efso-dict-helper.c:295: error: for each function it appears in.)
efso-dict-helper.c:310: warning: incompatible implicit declaration of built=
-in function 'fprintf'
efso-dict-helper.c:320: warning: incompatible implicit declaration of built=
-in function 'fprintf'
efso-dict-helper.c:327: warning: incompatible implicit declaration of built=
-in function 'printf'
efso-dict-helper.c: In function '_efso_dict_map':
efso-dict-helper.c:473: warning: incompatible implicit declaration of built=
-in function 'fprintf'
efso-dict-helper.c:473: error: 'stderr' undeclared (first use in this funct=
ion)
efso-dict-helper.c:480: warning: incompatible implicit declaration of built=
-in function 'fprintf'
make[2]: *** [efso-dict-helper.lo] Error 1
make[2]: Leaving directory `/home/embedded/oetmp_bug/work/armv6-angstrom-li=
nux-gnueabi/libefso-0.0.1+svnr194-r0/libefso/src/lib'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/embedded/oetmp_bug/work/armv6-angstrom-li=
nux-gnueabi/libefso-0.0.1+svnr194-r0/libefso/src'
make: *** [all-recursive] Error 1
FATAL: oe_runmake failed

--=-7XhkNR95YOxh7KYTsak3--
