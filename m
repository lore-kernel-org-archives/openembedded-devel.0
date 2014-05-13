Return-Path: <felix01.fischer@iav.de>
X-Greylist: delayed 396 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 May 2014 10:43:45 UTC
Received: from mailout03.rmx.de (unknown [217.111.120.11])
	by mail.openembedded.org (Postfix) with ESMTP id D972960196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 10:43:45 +0000 (UTC)
Received: from cryptout01.retarus.com ([172.19.21.78])
	by mailout03.rmx.de (8.14.4/8.14.5/retarus.custom) with ESMTP id
	s4DAb7hw009196 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 12:37:07 +0200
Received: from cryptout01 (localhost [127.0.0.1])
	by cryptout01.retarus.com (Postfix) with ESMTP id A911D3704C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 12:37:05 +0200 (CEST)
Received: from mailcc07.retarus.de (mailcc07.retarus.de [172.19.21.7])
	by cryptout01.retarus.com (Postfix) with SMTP id 51CB53704C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 12:37:04 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: D0867E9E:B7C0E311-C1257CD7:0035B985;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
From: Felix01 Fischer <felix01.fischer@iav.de>
Message-ID: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
Date: Tue, 13 May 2014 12:36:19 +0200
X-RouteServers: CN=SRVB02M/O=IAV;CN=SRVHUB1/O=IAV
X-MIMETrack: Serialize by Router on jaja/RetarusMail(Release 8.5.3FP3|November
	15, 2012) at 05/13/2014 12:36:23,
	Serialize complete at 05/13/2014 12:36:23
X-RMX-ID: 20140513-123623-s4DAaMQb012075-0@kdin01
X-RMX-TRACE: 2014-05-13 12:36:23 KdIn2013@kdin01/mailcc11 [0.1s]
	20140513-123623-s4DAaMQb012075-0@kdin01 0:00:00
X-RMX-TRACE: 2014-05-13 12:36:23 RmxMSO@kdin01/mailcc04 [0.1s]
	20140513-123623-s4DAaMQb012075-0@kdin01 0:00:00
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Building and running issues on Raspberry Pi
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
X-List-Received-Date: Tue, 13 May 2014 10:43:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
I'm trying to get Qt5 running on a raspberry pi using yocto and I'm facing=
=
=20
two problems:
I'm using up to date layers from poky, meta-raspberrypi and meta-qt5

First, I have to add the following to local.conf (or a=20
qtbase_5.X.Y.bbappend file)

QT_CONFIG_FLAGS +=3D " \
    -device linux-rasp-pi-g++ \
    -device-option=20
CROSS_COMPILE=3D$PATH_TO_SYSROOT_DIR/x86_64-linux/usr/bin/arm-poky-linux-g=
nueabi/arm-poky-linux-gnueabi-=20
\
    -I$PATH_TO_SYSROOT_DIR/raspberrypi/usr/include/interface/vcos/pthreads=
=
=20
\
"

then I get the following error while "bitbake qtbase":

"DEBUG: Executing python function sysroot_cleansstate
DEBUG: Python function sysroot_cleansstate finished
DEBUG: Executing shell function qmake5_base_preconfigure
DEBUG: Shell function qmake5_base_preconfigure finished
DEBUG: Executing shell function do_configure

This is the Qt Open Source Edition.

You are licensed to use this software under the terms of
the Lesser GNU General Public License (LGPL) versions 2.1.

You have already accepted the terms of the  license.

Performing shadow build...
Preparing build tree...
Symbol visibility control disabled.
-o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC bsymbolic_functions.c
/media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-gnueabi=
/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/config.tests/unix/bsymbolic_fu=
nctions.test:=20
line 14: -o: command not found
Symbolic function binding disabled.
-reduce-relocations was requested but this compiler does not support it
Re-run configure with -v for more information
WARNING:=20
/media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-gnueabi=
/qtbase/5.2.1-r0/temp/run.do_configure.5533:1=20
exit 1 from
=20
/media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-gnueabi=
/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/configure=20
-v -dont-process -opensource -confirm-license -sysroot=20
/media/yocto_build/qt5-raspb/build/tmp/sysroots/raspberrypi=20
-no-gcc-sysroot -prefix /usr -bindir /usr/bin/qt5 -libdir /usr/lib=20
-datadir /usr/share/qt5 -sysconfdir /etc/qt5 -docdir /usr/share/doc/qt5=20
-headerdir /usr/include/qt5 -archdatadir /usr/lib/qt5 -libexecdir=20
/usr/lib/qt5/libexec -plugindir /usr/lib/qt5/plugins -importdir=20
/usr/lib/qt5/imports -qmldir /usr/lib/qt5/qml -translationdir=20
/usr/share/qt5/translations -testsdir /usr/share/qt5/tests -examplesdir=20
/usr/share/qt5/examples -hostbindir /usr/bin/qt5 -hostdatadir=20
/media/yocto_build/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/lib/qt5=20
-external-hostbindir=20
/media/yocto_build/qt5-raspb/build/tmp/sysroots/x86_64-linux/usr/bin/qt5=
=20
-platform=20
/media/yocto_build/qt5-raspb/build/tmp/sysroots/x86_64-linux/usr/lib/qt5/m=
kspecs/linux-oe-g++=20
-xplatform linux-oe-g++ -reduce-relocations -shared -silent -no-pch=20
-no-rpath -pkg-config -no-accessibility -no-alsa -dbus -directfb -evdev=20
-nomake examples -no-fontconfig -freetype -opengl desktop -no-eglfs=20
-opengl es2 -eglfs -no-glib -no-gtkstyle -no-iconv -no-icu -system-libjpeg=
=
=20
-no-kms -system-libpng -make libs -linuxfb -no-mitshm -no-mtdev -no-nis=20
-openssl-linked -no-openvg -qt-pcre -pulseaudio -release -no-sm=20
-no-sql-db2 -no-sql-ibase -no-sql-mysql -no-sql-oci -no-sql-odbc=20
-no-sql-psql -no-sql-sqlite -no-sql-sqlite2 -no-sql-tds -nomake tests=20
-make tools -tslib -libudev -widgets -no-xcb -no-xcursor -no-xfixes=20
-no-xinerama -no-xinput -no-xinput2 -no-xkb -no-xrandr -no-xrender=20
-no-xshape -no-xsync -no-xvideo -system-zlib -device linux-rasp-pi-g++=20
-device-option=20
CROSS_COMPILE=3D/media/yocto_build/qt5-raspb/build/tmp/sysroots/x86_64-lin=
ux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-=20
-I/media/yocto_build/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/include/=
interface/vcos/pthreads
ERROR: Function failed: do_configure (log file is located at=20
/media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-gnueabi=
/qtbase/5.2.1-r0/temp/log.do_configure.5533)"



A look into=20
build/tmp/work/raspberrypi-poky-linux-gnueabi/qtbase/5.2.1-r0/qtbase-opens=
ource-src-5.2.1/config.tests/unix/bsymbolic_functions.test

tells me that the "COMPILER" and "SYSROOT_FLAG" variables are empty. I=20
don't know what to do here.
My workaround is to remove "-reduce-relocations" from QT_CONFIG_FLAGS in=
=20
qtbase.inc

After that the build succeeds without problems.
But, when I boot up my image and try to run a Qt5 Application from the=20
console I always get the same error:

"EGLFS: Unable to query physical screen size, defaulting to 100 dpi.
EGLFS: To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and=20
QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).
libpng warning: iCCP: Not recognizing known sRGB profile that has been=20
edited=20
EGL Error : Could not create the egl surface: error =3D 0x300b"

I'm stuck with this error and don't really know what to do.

Kind regards,

Felix Fischer

Student Employee (VC-I42)
Vehicle Cockpit - HMI Software and Code generation

IAV GmbH
Carnotstr. 1
10587 BERLIN
GERMANY

Phone: +49 30 3997-89540
Fax:       +49 30 3997-89411
E-Mail:  <mailto:felix01.fischer@iav.de>
Internet: http://www.iav.com

Sitz/Registered Office: Berlin,=20
Registergericht/Registration Court: Amtsgericht Charlottenburg,=20
Registernummer/Company Registration Number: HRB 21 280,=20
Gesch&#65533;ftsf&#65533;hrer/Managing Directors: Kurt Blumenr&#65533;der,=
 Michael Schubert,=20
Dr. R&#65533;diger Goyk
Vorsitzender des Aufsichtsrates/Chairman of the Supervisory Board: Dr.=20
Harald Ludanek
From paul.eggleton@linux.intel.com  Tue May 13 11:06:38 2014
Return-Path: <paul.eggleton@linux.intel.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3D992605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 11:06:29 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 04:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E
