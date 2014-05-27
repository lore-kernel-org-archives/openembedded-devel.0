Return-Path: <felix01.fischer@iav.de>
Received: from mailout03.rmx.de (unknown [217.111.120.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1A4B6FA95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 10:09:03 +0000 (UTC)
Received: from cryptout02.retarus.com ([172.19.21.79])
	by mailout03.rmx.de (8.14.4/8.14.5/retarus.custom) with ESMTP id
	s4RA8u1m027199 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 12:09:02 +0200
Received: from cryptout02 (localhost [127.0.0.1])
	by cryptout02.retarus.com (Postfix) with ESMTP id A0ED11FFC74
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 12:09:01 +0200 (CEST)
Received: from mailcc08.retarus.de (mailcc08.retarus.de [172.19.21.8])
	by cryptout02.retarus.com (Postfix) with SMTP id 2EAB41FF18B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2014 12:09:01 +0200 (CEST)
In-Reply-To: <CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>	<OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
	<CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-KeepSent: 6B0899B3:11047F13-C1257CE5:00369E8D;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF39 May 13, 2013
From: Felix01 Fischer <felix01.fischer@iav.de>
Message-ID: <OF6B0899B3.11047F13-ONC1257CE5.00369E8D-C1257CE5.0037B77C@retarus.de>
Date: Tue, 27 May 2014 12:08:37 +0200
X-RouteServers: CN=SRVB02M/O=IAV;CN=SRVHUB1/O=IAV
X-MIMETrack: Serialize by Router on jaja/RetarusMail(Release 8.5.3FP3|November
	15, 2012) at 27.05.2014 12:08:45,
	Serialize complete at 27.05.2014 12:08:45
X-RMX-ID: 20140527-120845-s4RA8jQ0008130-0@kdin02
X-RMX-TRACE: 2014-05-27 12:08:45 KdIn2013@kdin02/mailcc07 [0.1s]
	20140527-120845-s4RA8jQ0008130-0@kdin02 0:00:00
X-RMX-TRACE: 2014-05-27 12:08:46 RmxMSO@kdin02/mailcc03 [0.0s]
	20140527-120845-s4RA8jQ0008130-0@kdin02 0:00:01
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Building and running issues on Raspberry Pi
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
X-List-Received-Date: Tue, 27 May 2014 10:09:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

It's not possible to have hardware-accelerated QT on the raspberry pi when =

you are running an X11 environment, therefore I want to use eglfs=20
directly.

The raspberry pi doesn't have a mali graphics core, AFAIK.

Nevertheless, applying your patch gives me an error while compiling.

"
[...]/qeglfshooks=5Fstub.cpp: In member function 'virtual void*=20
QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const=20
QSurfaceFormat&)':
[...]/qeglfshooks=5Fstub.cpp:256:38: error: variable=20
'QEglFSHooks::createNativeWindow(QPlatformWindow*, const QSize&, const=20
QSurfaceFormat&)::mali=5Fnative=5Fwindow native=5Fwindow' has initializer b=
ut=20
incomplete type
     static struct mali=5Fnative=5Fwindow native=5Fwindow =3D {
                                      ^
[...]/qeglfshooks=5Fstub.cpp:261:1: warning: control reaches end of non-voi=
d=20
function [-Wreturn-type]
 }
 ^
make[4]: *** [.obj/qeglfshooks=5Fstub.o] Error 1
"

Any suggestions?




openembedded-devel-bounces@lists.openembedded.org schrieb am 23.05.2014=20
14:41:45:

> Von: Diego Sueiro <diego.sueiro@gmail.com>
> An: openembedded-devel@lists.openembedded.org,=20
> Datum: 23.05.2014 15:15
> Betreff: Re: [oe] [meta-qt5] Building and running issues on Raspberry Pi
> Gesendet von: openembedded-devel-bounces@lists.openembedded.org
>=20
> Are u running on X11 environment?
>=20
> Do you have mali module and lib onto your system? I'm not sure if
> meta-raspberrypi provides mali support. If not you fave to use a X11=20
image.
>=20
> I had this same problem in another machine and I applied this patch to=20
get
> Cinematics Experience working with eglfs.:
>=20
> Index:
>=20
qtbase-opensource-src-5.2.1/src/plugins/platforms/eglfs/qeglfshooks=5Fstub.=
cpp
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---
> qtbase-opensource-src-5.2.1.orig/src/plugins/platforms/eglfs/
> qeglfshooks=5Fstub.cpp
>   2014-02-01 18:37:36.000000000 -0200
> +++
>=20
qtbase-opensource-src-5.2.1/src/plugins/platforms/eglfs/qeglfshooks=5Fstub.=
cpp
>    2014-05-15 17:04:19.117306579 -0300
> @@ -251,7 +251,12 @@
>      Q=5FUNUSED(platformWindow);
>      Q=5FUNUSED(size);
>      Q=5FUNUSED(format);
> -    return 0;
> +//    return 0;
> +   static struct mali=5Fnative=5Fwindow native=5Fwindow =3D {
> +        .width =3D (short unsigned int)size.width(),
> +        .height =3D (short unsigned int)size.height(),
> +    };
> +    return &native=5Fwindow;
>  }
>=20
>  void QEglFSHooks::destroyNativeWindow(EGLNativeWindowType window)
>=20
>=20
> This patch comes from this link:
>=20
http://wickwire2099.blogspot.com.br/2014/02/qt5-on-cubieboard-a10a20.html
>=20
>=20
> Regards,
>=20
> --
> *dS
> Diego Sueiro
>=20
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?
> utm=5Fsource=3Dassinatura=5Fdiego&utm=5Fmedium=3De-
> mail&utm=5Fcampaign=3DAssinatura%20Email%20Diego>
>=20
> /*long live rock 'n roll*/
>=20
>=20
> On Fri, May 23, 2014 at 7:17 AM, Felix01 Fischer=20
> <felix01.fischer@iav.de>wrote:
>=20
> > No suggestions?
> >
> >
> >
> >
> >
> > openembedded-devel-bounces@lists.openembedded.org schrieb am=20
13.05.2014
> > 12:36:19:
> >
> > > Von: Felix01 Fischer <felix01.fischer@iav.de>
> > > An: openembedded-devel@lists.openembedded.org,
> > > Datum: 13.05.2014 15:11
> > > Betreff: [oe] [meta-qt5] Building and running issues on Raspberry Pi
> > > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> > >
> > > Hello,
> > > I'm trying to get Qt5 running on a raspberry pi using yocto and I'm
> > facing
> > > two problems:
> > > I'm using up to date layers from poky, meta-raspberrypi and meta-qt5
> > >
> > > First, I have to add the following to local.conf (or a
> > > qtbase=5F5.X.Y.bbappend file)
> > >
> > > QT=5FCONFIG=5FFLAGS +=3D " \
> > >     -device linux-rasp-pi-g++ \
> > >     -device-option
> > > CROSS=5FCOMPILE=3D$PATH=5FTO=5FSYSROOT=5FDIR/x86=5F64-linux/usr/bin/a=
rm-poky-
> > > linux-gnueabi/arm-poky-linux-gnueabi-
> > > \
> > >=20
-I$PATH=5FTO=5FSYSROOT=5FDIR/raspberrypi/usr/include/interface/vcos/pthreads
> > > \
> > > "
> > >
> > > then I get the following error while "bitbake qtbase":
> > >
> > > "DEBUG: Executing python function sysroot=5Fcleansstate
> > > DEBUG: Python function sysroot=5Fcleansstate finished
> > > DEBUG: Executing shell function qmake5=5Fbase=5Fpreconfigure
> > > DEBUG: Shell function qmake5=5Fbase=5Fpreconfigure finished
> > > DEBUG: Executing shell function do=5Fconfigure
> > >
> > > This is the Qt Open Source Edition.
> > >
> > > You are licensed to use this software under the terms of
> > > the Lesser GNU General Public License (LGPL) versions 2.1.
> > >
> > > You have already accepted the terms of the  license.
> > >
> > > Performing shadow build...
> > > Preparing build tree...
> > > Symbol visibility control disabled.
> > > -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC
> > bsymbolic=5Ffunctions.c
> > > /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > > gnueabi/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/config.tests/
> > > unix/bsymbolic=5Ffunctions.test:
> > > line 14: -o: command not found
> > > Symbolic function binding disabled.
> > > -reduce-relocations was requested but this compiler does not support =

it
> > > Re-run configure with -v for more information
> > > WARNING:
> > > /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > > gnueabi/qtbase/5.2.1-r0/temp/run.do=5Fconfigure.5533:1
> > > exit 1 from
> > >
> > > /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > > gnueabi/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/configure
> > > -v -dont-process -opensource -confirm-license -sysroot
> > > /media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/raspberrypi
> > > -no-gcc-sysroot -prefix /usr -bindir /usr/bin/qt5 -libdir /usr/lib
> > > -datadir /usr/share/qt5 -sysconfdir /etc/qt5 -docdir=20
/usr/share/doc/qt5
> > > -headerdir /usr/include/qt5 -archdatadir /usr/lib/qt5 -libexecdir
> > > /usr/lib/qt5/libexec -plugindir /usr/lib/qt5/plugins -importdir
> > > /usr/lib/qt5/imports -qmldir /usr/lib/qt5/qml -translationdir
> > > /usr/share/qt5/translations -testsdir /usr/share/qt5/tests=20
-examplesdir
> > > /usr/share/qt5/examples -hostbindir /usr/bin/qt5 -hostdatadir
> > >=20
/media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/lib/qt5
> > > -external-hostbindir
> > >=20
/media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/x86=5F64-linux/usr/bin/qt5
> >
> > > -platform
> > > /media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/x86=5F64-linux/usr/
> > > lib/qt5/mkspecs/linux-oe-g++
> > > -xplatform linux-oe-g++ -reduce-relocations -shared -silent -no-pch
> > > -no-rpath -pkg-config -no-accessibility -no-alsa -dbus -directfb=20
-evdev
> > > -nomake examples -no-fontconfig -freetype -opengl desktop -no-eglfs
> > > -opengl es2 -eglfs -no-glib -no-gtkstyle -no-iconv -no-icu
> > -system-libjpeg
> > > -no-kms -system-libpng -make libs -linuxfb -no-mitshm -no-mtdev=20
-no-nis
> > > -openssl-linked -no-openvg -qt-pcre -pulseaudio -release -no-sm
> > > -no-sql-db2 -no-sql-ibase -no-sql-mysql -no-sql-oci -no-sql-odbc
> > > -no-sql-psql -no-sql-sqlite -no-sql-sqlite2 -no-sql-tds -nomake=20
tests
> > > -make tools -tslib -libudev -widgets -no-xcb -no-xcursor -no-xfixes
> > > -no-xinerama -no-xinput -no-xinput2 -no-xkb -no-xrandr -no-xrender
> > > -no-xshape -no-xsync -no-xvideo -system-zlib -device=20
linux-rasp-pi-g++
> > > -device-option
> > > CROSS=5FCOMPILE=3D/media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/
> > > x86=5F64-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-
> > > -I/media/yocto=5Fbuild/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/
> > > include/interface/vcos/pthreads
> > > ERROR: Function failed: do=5Fconfigure (log file is located at
> > > /media/yocto=5Fbuild/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > > gnueabi/qtbase/5.2.1-r0/temp/log.do=5Fconfigure.5533)"
> > >
> > >
> > >
> > > A look into
> > > build/tmp/work/raspberrypi-poky-linux-gnueabi/qtbase/5.2.1-r0/
> > >=20
qtbase-opensource-src-5.2.1/config.tests/unix/bsymbolic=5Ffunctions.test
> > >
> > > tells me that the "COMPILER" and "SYSROOT=5FFLAG" variables are empty=
.=20
I
> > > don't know what to do here.
> > > My workaround is to remove "-reduce-relocations" from=20
QT=5FCONFIG=5FFLAGS in
> >
> > > qtbase.inc
> > >
> > > After that the build succeeds without problems.
> > > But, when I boot up my image and try to run a Qt5 Application from=20
the
> > > console I always get the same error:
> > >
> > > "EGLFS: Unable to query physical screen size, defaulting to 100 dpi.
> > > EGLFS: To override, set QT=5FQPA=5FEGLFS=5FPHYSICAL=5FWIDTH and
> > > QT=5FQPA=5FEGLFS=5FPHYSICAL=5FHEIGHT (in millimeters).
> > > libpng warning: iCCP: Not recognizing known sRGB profile that has=20
been
> > > edited
> > > EGL Error : Could not create the egl surface: error =3D 0x300b"
> > >
> > > I'm stuck with this error and don't really know what to do.
> > >
> > > Kind regards,
> > >
> > > Felix Fischer
> > >
> > > Student Employee (VC-I42)
> > > Vehicle Cockpit - HMI Software and Code generation
> > >
> > > IAV GmbH
> > > Carnotstr. 1
> > > 10587 BERLIN
> > > GERMANY
> > >
> > > Phone: +49 30 3997-89540
> > > Fax:       +49 30 3997-89411
> > > E-Mail:  <mailto:felix01.fischer@iav.de>
> > > Internet: http://www.iav.com
> > >
> > > Sitz/Registered Office: Berlin,
> > > Registergericht/Registration Court: Amtsgericht Charlottenburg,
> > > Registernummer/Company Registration Number: HRB 21 280,
> > > Gesch=E4ftsf=FChrer/Managing Directors: Kurt Blumenr=F6der, Michael=20
Schubert,
> > > Dr. R=FCdiger Goyk
> > > Vorsitzender des Aufsichtsrates/Chairman of the Supervisory Board:=20
Dr.
> > > Harald Ludanek
> > > --
> > > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

