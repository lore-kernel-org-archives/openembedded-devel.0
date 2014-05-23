Return-Path: <felix01.fischer@iav.de>
X-Greylist: delayed 963 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 May 2014 10:33:26 UTC
Received: from mailout04.rmx.de (unknown [94.199.90.94])
	by mail.openembedded.org (Postfix) with ESMTP id 984FD65FC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 10:33:26 +0000 (UTC)
Received: from cryptout02.retarus.com ([172.19.21.79])
	by mailout04.rmx.de (8.14.4/8.14.5/retarus.custom) with ESMTP id
	s4NAHLJC024961 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 12:17:21 +0200
Received: from cryptout02 (localhost [127.0.0.1])
	by cryptout02.retarus.com (Postfix) with ESMTP id 6ED8E203C0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 12:17:21 +0200 (CEST)
Received: from mailcc07.retarus.de (mailcc07.retarus.de [172.19.21.7])
	by cryptout02.retarus.com (Postfix) with SMTP id 30709203C0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 12:17:21 +0200 (CEST)
In-Reply-To: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 06526D97:F40A4898-C1257CE1:003879C4;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
From: Felix01 Fischer <felix01.fischer@iav.de>
Message-ID: <OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
Date: Fri, 23 May 2014 12:17:15 +0200
X-RouteServers: CN=SRVB02M/O=IAV;CN=SRVHUB1/O=IAV
X-MIMETrack: Serialize by Router on jaja/RetarusMail(Release 8.5.3FP3|November
	15, 2012) at 05/23/2014 12:17:15,
	Serialize complete at 05/23/2014 12:17:15
X-RMX-ID: 20140523-121715-s4NAHEqK010320-0@kdin02
X-RMX-TRACE: 2014-05-23 12:17:15 KdIn2013@kdin02/mailcc08 [0.1s]
	20140523-121715-s4NAHEqK010320-0@kdin02 0:00:00
X-RMX-TRACE: 2014-05-23 12:17:16 RmxMSO@kdin02/mailcc05 [0.0s]
	20140523-121715-s4NAHEqK010320-0@kdin02 0:00:01
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
X-List-Received-Date: Fri, 23 May 2014 10:33:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

No suggestions?





openembedded-devel-bounces@lists.openembedded.org schrieb am 13.05.2014=20
12:36:19:

> Von: Felix01 Fischer <felix01.fischer@iav.de>
> An: openembedded-devel@lists.openembedded.org,=20
> Datum: 13.05.2014 15:11
> Betreff: [oe] [meta-qt5] Building and running issues on Raspberry Pi
> Gesendet von: openembedded-devel-bounces@lists.openembedded.org
>=20
> Hello,
> I'm trying to get Qt5 running on a raspberry pi using yocto and I'm=20
facing=20
> two problems:
> I'm using up to date layers from poky, meta-raspberrypi and meta-qt5
>=20
> First, I have to add the following to local.conf (or a=20
> qtbase=5F5.X.Y.bbappend file)
>=20
> QT=5FCONFIG=5FFLAGS +=3D " \
>     -device linux-rasp-pi-g++ \
>     -device-option=20
> CROSS=5FCOMPILE=3D$PATH=5FTO=5FSYSROOT=5FDIR/x86=5F64-linux/usr/bin/arm-p=
oky-
> linux-gnueabi/arm-poky-linux-gnueabi-=20
> \
> -I$PATH=5FTO=5FSYSROOT=5FDIR/raspberrypi/usr/include/interface/vcos/pthre=
ads=20
> \
> "
>=20
> then I get the following error while "bitbake qtbase":
>=20
> "DEBUG: Executing python function sysroot=5Fcleansstate
> DEBUG: Python function sysroot=5Fcleansstate finished
> DEBUG: Executing shell function qmake5=5Fbase=5Fpreconfigure
> DEBUG: Shell function qmake5=5Fbase=5Fpreconfigure finished
> DEBUG: Executing shell function do=5Fconfigure
>=20
> This is the Qt Open Source Edition.
>=20
> You are licensed to use this software under the terms of
> the Lesser GNU General Public License (LGPL) versions 2.1.
>=20
> You have already accepted the terms of the  license.
>=20
> Performing shadow build...
> Preparing build tree...
> Symbol visibility control disabled.
> -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC=20
bsymbolic=5Ffunctions.c
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> gnueabi/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/config.tests/
> unix/bsymbolic=5Ffunctions.test:=20
> line 14: -o: command not found
> Symbolic function binding disabled.
> -reduce-relocations was requested but this compiler does not support it
> Re-run configure with -v for more information
> WARNING:=20
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> gnueabi/qtbase/5.2.1-r0/temp/run.do=5Fconfigure.5533:1=20
> exit 1 from
>=20
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> gnueabi/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/configure=20
> -v -dont-process -opensource -confirm-license -sysroot=20
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/raspberrypi=20
> -no-gcc-sysroot -prefix /usr -bindir /usr/bin/qt5 -libdir /usr/lib=20
> -datadir /usr/share/qt5 -sysconfdir /etc/qt5 -docdir /usr/share/doc/qt5=20
> -headerdir /usr/include/qt5 -archdatadir /usr/lib/qt5 -libexecdir=20
> /usr/lib/qt5/libexec -plugindir /usr/lib/qt5/plugins -importdir=20
> /usr/lib/qt5/imports -qmldir /usr/lib/qt5/qml -translationdir=20
> /usr/share/qt5/translations -testsdir /usr/share/qt5/tests -examplesdir=20
> /usr/share/qt5/examples -hostbindir /usr/bin/qt5 -hostdatadir=20
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/lib/qt5=
=20
> -external-hostbindir=20
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/x86=5F64-linux/usr/bin/=
qt5=20

> -platform=20
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/x86=5F64-linux/usr/
> lib/qt5/mkspecs/linux-oe-g++=20
> -xplatform linux-oe-g++ -reduce-relocations -shared -silent -no-pch=20
> -no-rpath -pkg-config -no-accessibility -no-alsa -dbus -directfb -evdev=20
> -nomake examples -no-fontconfig -freetype -opengl desktop -no-eglfs=20
> -opengl es2 -eglfs -no-glib -no-gtkstyle -no-iconv -no-icu=20
-system-libjpeg=20
> -no-kms -system-libpng -make libs -linuxfb -no-mitshm -no-mtdev -no-nis=20
> -openssl-linked -no-openvg -qt-pcre -pulseaudio -release -no-sm=20
> -no-sql-db2 -no-sql-ibase -no-sql-mysql -no-sql-oci -no-sql-odbc=20
> -no-sql-psql -no-sql-sqlite -no-sql-sqlite2 -no-sql-tds -nomake tests=20
> -make tools -tslib -libudev -widgets -no-xcb -no-xcursor -no-xfixes=20
> -no-xinerama -no-xinput -no-xinput2 -no-xkb -no-xrandr -no-xrender=20
> -no-xshape -no-xsync -no-xvideo -system-zlib -device linux-rasp-pi-g++=20
> -device-option=20
> CROSS=5FCOMPILE=3D/media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/
> x86=5F64-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-=20
> -I/media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/
> include/interface/vcos/pthreads
> ERROR: Function failed: do=5Fconfigure (log file is located at=20
> /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> gnueabi/qtbase/5.2.1-r0/temp/log.do=5Fconfigure.5533)"
>=20
>=20
>=20
> A look into=20
> build/tmp/work/raspberrypi-poky-linux-gnueabi/qtbase/5.2.1-r0/
> qtbase-opensource-src-5.2.1/config.tests/unix/bsymbolic=5Ffunctions.test
>=20
> tells me that the "COMPILER" and "SYSROOT=5FFLAG" variables are empty. I =

> don't know what to do here.
> My workaround is to remove "-reduce-relocations" from QT=5FCONFIG=5FFLAGS=
 in=20

> qtbase.inc
>=20
> After that the build succeeds without problems.
> But, when I boot up my image and try to run a Qt5 Application from the=20
> console I always get the same error:
>=20
> "EGLFS: Unable to query physical screen size, defaulting to 100 dpi.
> EGLFS: To override, set QT=5FQPA=5FEGLFS=5FPHYSICAL=5FWIDTH and=20
> QT=5FQPA=5FEGLFS=5FPHYSICAL=5FHEIGHT (in millimeters).
> libpng warning: iCCP: Not recognizing known sRGB profile that has been=20
> edited=20
> EGL Error : Could not create the egl surface: error =3D 0x300b"
>=20
> I'm stuck with this error and don't really know what to do.
>=20
> Kind regards,
>=20
> Felix Fischer
>=20
> Student Employee (VC-I42)
> Vehicle Cockpit - HMI Software and Code generation
>=20
> IAV GmbH
> Carnotstr. 1
> 10587 BERLIN
> GERMANY
>=20
> Phone: +49 30 3997-89540
> Fax:       +49 30 3997-89411
> E-Mail:  <mailto:felix01.fischer@iav.de>
> Internet: http://www.iav.com
>=20
> Sitz/Registered Office: Berlin,=20
> Registergericht/Registration Court: Amtsgericht Charlottenburg,=20
> Registernummer/Company Registration Number: HRB 21 280,=20
> Gesch=E4ftsf=FChrer/Managing Directors: Kurt Blumenr=F6der, Michael Schub=
ert,=20
> Dr. R=FCdiger Goyk
> Vorsitzender des Aufsichtsrates/Chairman of the Supervisory Board: Dr.=20
> Harald Ludanek
> --=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

