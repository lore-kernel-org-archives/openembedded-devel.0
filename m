Return-Path: <diego.sueiro@gmail.com>
X-Greylist: delayed 1359 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 May 2014 13:12:59 UTC
Received: from mail-qg0-f47.google.com (unknown [209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id D3B7465EDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 13:12:59 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id j107so7939625qga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 May 2014 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=EvliT/2Ww9x6SSt9KzYZfkA8fQGwoMJ7rdk39vNpBsc=;
	b=NszTH4JjPDpkHd6RIKFQtgftuwC76AA0EiIMiLSwXlyiTPjhuYbzInzMdUL//2Y9EB
	7MZRT0gEJd3lHHjhtT3JcEkj+NJWFzk8/VQBiUsNjQxwzGzmULFqMJ5fsQjRYIFizry6
	Z/11QkokASQi+jiND9YRPgzaBMaIObkRVMaWale1wJbepNORkELsYBk6/r8t7DntoqZ/
	hA18D9ESoyt0Wgsz2UHqkZoQQUVYGs4eBO844wlNLh5EUPY0i9STF1Qw7n878DuJueKL
	tOu0eXikntms+Iu0C3VUBj8+yDSMzx+FXaubAis6VOHJt/75Rhrs4YKq7yjcNsvHQymP
	j/Jw==
X-Received: by 10.224.20.72 with SMTP id e8mr6068266qab.86.1400848925667; Fri,
	23 May 2014 05:42:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Fri, 23 May 2014 05:41:45 -0700 (PDT)
In-Reply-To: <OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
References: <OFD0867E9E.B7C0E311-ONC1257CD7.0035B985-C1257CD7.003A4198@retarus.de>
	<OF06526D97.F40A4898-ONC1257CE1.003879C4-C1257CE1.00388073@retarus.de>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 23 May 2014 09:41:45 -0300
Message-ID: <CAMCfZKFghRYxxCHEsQ0MJ9_VcK2h7XOocGn0BAfviZ4ECkrHUQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 23 May 2014 13:13:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Are u running on X11 environment?

Do you have mali module and lib onto your system? I'm not sure if
meta-raspberrypi provides mali support. If not you fave to use a X11 image.

I had this same problem in another machine and I applied this patch to get
Cinematics Experience working with eglfs.:

Index:
qtbase-opensource-src-5.2.1/src/plugins/platforms/eglfs/qeglfshooks_stub.cp=
p
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---
qtbase-opensource-src-5.2.1.orig/src/plugins/platforms/eglfs/qeglfshooks_st=
ub.cpp
  2014-02-01 18:37:36.000000000 -0200
+++
qtbase-opensource-src-5.2.1/src/plugins/platforms/eglfs/qeglfshooks_stub.cp=
p
   2014-05-15 17:04:19.117306579 -0300
@@ -251,7 +251,12 @@
     Q_UNUSED(platformWindow);
     Q_UNUSED(size);
     Q_UNUSED(format);
-    return 0;
+//    return 0;
+   static struct mali_native_window native_window =3D {
+        .width =3D (short unsigned int)size.width(),
+        .height =3D (short unsigned int)size.height(),
+    };
+    return &native_window;
 }

 void QEglFSHooks::destroyNativeWindow(EGLNativeWindowType window)


This patch comes from this link:
http://wickwire2099.blogspot.com.br/2014/02/qt5-on-cubieboard-a10a20.html


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=3Dassinatura=
_diego&utm_medium=3De-mail&utm_campaign=3DAssinatura%20Email%20Diego>

/*long live rock 'n roll*/


On Fri, May 23, 2014 at 7:17 AM, Felix01 Fischer <felix01.fischer@iav.de>wr=
ote:

> No suggestions?
>
>
>
>
>
> openembedded-devel-bounces@lists.openembedded.org schrieb am 13.05.2014
> 12:36:19:
>
> > Von: Felix01 Fischer <felix01.fischer@iav.de>
> > An: openembedded-devel@lists.openembedded.org,
> > Datum: 13.05.2014 15:11
> > Betreff: [oe] [meta-qt5] Building and running issues on Raspberry Pi
> > Gesendet von: openembedded-devel-bounces@lists.openembedded.org
> >
> > Hello,
> > I'm trying to get Qt5 running on a raspberry pi using yocto and I'm
> facing
> > two problems:
> > I'm using up to date layers from poky, meta-raspberrypi and meta-qt5
> >
> > First, I have to add the following to local.conf (or a
> > qtbase_5.X.Y.bbappend file)
> >
> > QT_CONFIG_FLAGS +=3D " \
> >     -device linux-rasp-pi-g++ \
> >     -device-option
> > CROSS_COMPILE=3D$PATH_TO_SYSROOT_DIR/x86_64-linux/usr/bin/arm-poky-
> > linux-gnueabi/arm-poky-linux-gnueabi-
> > \
> > -I$PATH_TO_SYSROOT_DIR/raspberrypi/usr/include/interface/vcos/pthreads
> > \
> > "
> >
> > then I get the following error while "bitbake qtbase":
> >
> > "DEBUG: Executing python function sysroot_cleansstate
> > DEBUG: Python function sysroot_cleansstate finished
> > DEBUG: Executing shell function qmake5_base_preconfigure
> > DEBUG: Shell function qmake5_base_preconfigure finished
> > DEBUG: Executing shell function do_configure
> >
> > This is the Qt Open Source Edition.
> >
> > You are licensed to use this software under the terms of
> > the Lesser GNU General Public License (LGPL) versions 2.1.
> >
> > You have already accepted the terms of the  license.
> >
> > Performing shadow build...
> > Preparing build tree...
> > Symbol visibility control disabled.
> > -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC
> bsymbolic_functions.c
> > /media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > gnueabi/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/config.tests/
> > unix/bsymbolic_functions.test:
> > line 14: -o: command not found
> > Symbolic function binding disabled.
> > -reduce-relocations was requested but this compiler does not support it
> > Re-run configure with -v for more information
> > WARNING:
> > /media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > gnueabi/qtbase/5.2.1-r0/temp/run.do_configure.5533:1
> > exit 1 from
> >
> > /media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > gnueabi/qtbase/5.2.1-r0/qtbase-opensource-src-5.2.1/configure
> > -v -dont-process -opensource -confirm-license -sysroot
> > /media/yocto_build/qt5-raspb/build/tmp/sysroots/raspberrypi
> > -no-gcc-sysroot -prefix /usr -bindir /usr/bin/qt5 -libdir /usr/lib
> > -datadir /usr/share/qt5 -sysconfdir /etc/qt5 -docdir /usr/share/doc/qt5
> > -headerdir /usr/include/qt5 -archdatadir /usr/lib/qt5 -libexecdir
> > /usr/lib/qt5/libexec -plugindir /usr/lib/qt5/plugins -importdir
> > /usr/lib/qt5/imports -qmldir /usr/lib/qt5/qml -translationdir
> > /usr/share/qt5/translations -testsdir /usr/share/qt5/tests -examplesdir
> > /usr/share/qt5/examples -hostbindir /usr/bin/qt5 -hostdatadir
> > /media/yocto_build/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/lib/qt5
> > -external-hostbindir
> > /media/yocto_build/qt5-raspb/build/tmp/sysroots/x86_64-linux/usr/bin/qt=
5
>
> > -platform
> > /media/yocto_build/qt5-raspb/build/tmp/sysroots/x86_64-linux/usr/
> > lib/qt5/mkspecs/linux-oe-g++
> > -xplatform linux-oe-g++ -reduce-relocations -shared -silent -no-pch
> > -no-rpath -pkg-config -no-accessibility -no-alsa -dbus -directfb -evdev
> > -nomake examples -no-fontconfig -freetype -opengl desktop -no-eglfs
> > -opengl es2 -eglfs -no-glib -no-gtkstyle -no-iconv -no-icu
> -system-libjpeg
> > -no-kms -system-libpng -make libs -linuxfb -no-mitshm -no-mtdev -no-nis
> > -openssl-linked -no-openvg -qt-pcre -pulseaudio -release -no-sm
> > -no-sql-db2 -no-sql-ibase -no-sql-mysql -no-sql-oci -no-sql-odbc
> > -no-sql-psql -no-sql-sqlite -no-sql-sqlite2 -no-sql-tds -nomake tests
> > -make tools -tslib -libudev -widgets -no-xcb -no-xcursor -no-xfixes
> > -no-xinerama -no-xinput -no-xinput2 -no-xkb -no-xrandr -no-xrender
> > -no-xshape -no-xsync -no-xvideo -system-zlib -device linux-rasp-pi-g++
> > -device-option
> > CROSS_COMPILE=3D/media/yocto_build/qt5-raspb/build/tmp/sysroots/
> > x86_64-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-
> > -I/media/yocto_build/qt5-raspb/build/tmp/sysroots/raspberrypi/usr/
> > include/interface/vcos/pthreads
> > ERROR: Function failed: do_configure (log file is located at
> > /media/yocto_build/qt5-raspb/build/tmp/work/raspberrypi-poky-linux-
> > gnueabi/qtbase/5.2.1-r0/temp/log.do_configure.5533)"
> >
> >
> >
> > A look into
> > build/tmp/work/raspberrypi-poky-linux-gnueabi/qtbase/5.2.1-r0/
> > qtbase-opensource-src-5.2.1/config.tests/unix/bsymbolic_functions.test
> >
> > tells me that the "COMPILER" and "SYSROOT_FLAG" variables are empty. I
> > don't know what to do here.
> > My workaround is to remove "-reduce-relocations" from QT_CONFIG_FLAGS i=
n
>
> > qtbase.inc
> >
> > After that the build succeeds without problems.
> > But, when I boot up my image and try to run a Qt5 Application from the
> > console I always get the same error:
> >
> > "EGLFS: Unable to query physical screen size, defaulting to 100 dpi.
> > EGLFS: To override, set QT_QPA_EGLFS_PHYSICAL_WIDTH and
> > QT_QPA_EGLFS_PHYSICAL_HEIGHT (in millimeters).
> > libpng warning: iCCP: Not recognizing known sRGB profile that has been
> > edited
> > EGL Error : Could not create the egl surface: error =3D 0x300b"
> >
> > I'm stuck with this error and don't really know what to do.
> >
> > Kind regards,
> >
> > Felix Fischer
> >
> > Student Employee (VC-I42)
> > Vehicle Cockpit - HMI Software and Code generation
> >
> > IAV GmbH
> > Carnotstr. 1
> > 10587 BERLIN
> > GERMANY
> >
> > Phone: +49 30 3997-89540
> > Fax:       +49 30 3997-89411
> > E-Mail:  <mailto:felix01.fischer@iav.de>
> > Internet: http://www.iav.com
> >
> > Sitz/Registered Office: Berlin,
> > Registergericht/Registration Court: Amtsgericht Charlottenburg,
> > Registernummer/Company Registration Number: HRB 21 280,
> > Gesch=E4ftsf=FChrer/Managing Directors: Kurt Blumenr=F6der, Michael Sch=
ubert,
> > Dr. R=FCdiger Goyk
> > Vorsitzender des Aufsichtsrates/Chairman of the Supervisory Board: Dr.
> > Harald Ludanek
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

