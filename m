Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB3E6E8E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 10:02:27 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z10so989010ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 02:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dtls69fKUc+6W9RwtxgZCUxms+LcqZJZw1F9skLuAK0=;
	b=uP7mVa2g5Qa/WU5BAW9OfDK9D+dnZbr+BxfsiEDfEVcP7/f8PvV50AeNgThaFb0d+O
	1diJf5OWGBBkJ+90Yg/6lyTvCzjeCjgAtKyqWqSJQsU/5/HU6FMAAnh092+zu/lnf3my
	8LHHfoSGLWqV8unbflHTrY13i+C6ayfzCZjRSVISgVMO529P3P7isPzS1yDgwxN8l605
	1raswL/pYx9P6u/I4bn9xFzCeIxgpHVw+KLtgZrOJ+2RsJqeq78hZwI1FlURFMg/++pu
	jiCqONtHS0WA7ITomiUKwwrR1Q7RFYlMmVBRdxbSIbzPHdG6/AtWVQDBhPgUHdqrA2GP
	Segg==
X-Received: by 10.14.177.1 with SMTP id c1mr3013230eem.8.1392199347218;
	Wed, 12 Feb 2014 02:02:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j41sm79171435eeg.10.2014.02.12.02.02.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Feb 2014 02:02:25 -0800 (PST)
Date: Wed, 12 Feb 2014 11:02:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: abdul razak <abdul.razak2005@gmail.com>
Message-ID: <20140212100241.GC3776@jama>
References: <CAKxnpWa2Zb2FaAZrTMZAh2Te9Pc50e=2XR_tgiog3mQ4zHUjOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKxnpWa2Zb2FaAZrTMZAh2Te9Pc50e=2XR_tgiog3mQ4zHUjOg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Query regarding building meta-qt5 using yocto
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
X-List-Received-Date: Wed, 12 Feb 2014 10:02:29 -0000
X-Groupsio-MsgNum: 48121
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline

--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2014 at 10:03:43PM -0500, abdul razak wrote:
> Hi Martin,
>=20
> Sorry to disturb you this way, but I am new to yocto and stuck with this
> issue with meta-qt5.

Please use openembedded-devel@lists.openembedded.org for questions like
this.

> I am trying to build QT5 using yocto for BeagleBone. I am facing the below
> issue.
>=20
> The OpenGL functionality test failed!
>  You might need to modify the include and library search paths by editing
>  QMAKE_INCDIR_OPENGL, QMAKE_LIBDIR_OPENGL and QMAKE_LIBS_OPENGL

See
meta-qt5/recipes-qt/qt5/qtbase.inc

# gl or gles needs to be enabled in order to build qtdeclarative
# http://qt.gitorious.org/qt/qtdeclarative/commit/e988998a08b1420ed10bd02d9=
d4b3b8ed2289df9
PACKAGECONFIG_GL ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', =
'', d)}"

# gl or gles2 is needed in order to build qtdeclarative
# (qtdeclarative.do_configure fails to find quick module without)
PACKAGECONFIG[gl] =3D "-opengl desktop -no-eglfs,,virtual/libgl"
PACKAGECONFIG[gles2] =3D "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl"

It defaults to "full" desktop GL, you probably want just gles2 for
beaglebone. You need to change PACKAGECONFIG_GL in your .bbappend or
distro/local.conf

Cheers,

> I have attached the complete log.
>=20
> Below are the steps i followed:
>=20
> 1) git clone git://git.yoctoproject.org/poky
> cd poky
> git clone https://github.com/openembedded/meta-oe
> git clone git://git.yoctoproject.org/meta-ti
> git clone -b dora https://github.com/meta-qt5/meta-qt5.git
>  In build/conf/local.conf add
> EXTRA_IMAGE_FEATURES =3D "debug-tweaks ssh-server-openssh "
> IMAGE_INSTALL_append =3D " gcc g++ binutils libgcc libgcc-dev libstdc++
> libstdc++-dev libstdc++-staticdev \
> tslib-conf tslib-tests tslib-calibrate openssh-sftp-server alsa-lib
> alsa-tools alsa-state alsa-utils-alsaconf \
> tslib evtest dbus nano qtbase qtbase-fonts qtbase-plugins qtbase-examples
> cinematicexperience gstreamer \
> cairo pango fontconfig freetype pulseaudio "
>  DISTRO_FEATURES_remove =3D "x11 wayland"
>  bitbake core-image-minimal
>=20
>=20
> Hope you can help. Looking forward for your reply.
>=20
> --=20
>=20
>=20
> Regards,
> Abdul Razak

> DEBUG: Executing python function sysroot_cleansstate
> DEBUG: Python function sysroot_cleansstate finished
> DEBUG: Executing shell function qmake5_base_preconfigure
> DEBUG: Shell function qmake5_base_preconfigure finished
> DEBUG: Executing shell function do_configure
> Performing shadow build...
> Preparing build tree...
> arm-poky-linux-gnueabi-g++ -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/home/abdul/BeagleBone/poky/build/tmp/sy=
sroots/beaglebone -c -fvisibility=3Dhidden fvisibility.c
> Symbol visibility control enabled.
> arm-poky-linux-gnueabi-g++ -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/home/abdul/BeagleBone/poky/build/tmp/sy=
sroots/beaglebone -o libtest.so -shared -Wl,-Bsymbolic-functions -fPIC bsym=
bolic_functions.c
> Symbolic function binding enabled.
>=20
> This is the Qt Open Source Edition.
>=20
> You are licensed to use this software under the terms of
> the Lesser GNU General Public License (LGPL) versions 2.1.
>=20
> You have already accepted the terms of the  license.
>=20
> Running configuration tests...
> Determining architecture... ()
> arm-poky-linux-gnueabi-g++  -march=3Darmv7-a -mthumb-interwork -mfloat-ab=
i=3Dsoftfp -mfpu=3Dneon --sysroot=3D/home/abdul/BeagleBone/poky/build/tmp/s=
ysroots/beaglebone -c -pipe  -O2 -pipe -g -feliminate-unused-debug-types -f=
permissive -fvisibility-inlines-hidden -g -Wall -W -fPIE  -I/home/abdul/Bea=
gleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.1.1=
-r0/qtbase-opensource-src-5.1.1/mkspecs/linux-oe-g++ -I/home/abdul/BeagleBo=
ne/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.1.1-r0/q=
tbase-opensource-src-5.1.1/config.tests/arch -I. -o arch.o /home/abdul/Beag=
leBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.1.1-=
r0/qtbase-opensource-src-5.1.1/config.tests/arch/arch.cpp
> arm-poky-linux-gnueabi-g++  -march=3Darmv7-a -mthumb-interwork -mfloat-ab=
i=3Dsoftfp -mfpu=3Dneon --sysroot=3D/home/abdul/BeagleBone/poky/build/tmp/s=
ysroots/beaglebone -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o arch a=
rch.o   =20
>     Found architecture in binary
> CFG_ARCH=3D"arm"
> CFG_CPUFEATURES=3D" neon"
> Determining architecture... ()
> arm-poky-linux-gnueabi-g++  -march=3Darmv7-a -mthumb-interwork -mfloat-ab=
i=3Dsoftfp -mfpu=3Dneon --sysroot=3D/home/abdul/BeagleBone/poky/build/tmp/s=
ysroots/beaglebone -c -pipe  -O2 -pipe -g -feliminate-unused-debug-types -f=
permissive -fvisibility-inlines-hidden -g -Wall -W -fPIE  -I/home/abdul/Bea=
gleBone/poky/build/tmp/sysroots/x86_64-linux/usr/lib/qt5/mkspecs/linux-oe-g=
++ -I/home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-=
gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/arch -I. -=
o arch.o /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-li=
nux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/arch/a=
rch.cpp
> arm-poky-linux-gnueabi-g++  -march=3Darmv7-a -mthumb-interwork -mfloat-ab=
i=3Dsoftfp -mfpu=3Dneon --sysroot=3D/home/abdul/BeagleBone/poky/build/tmp/s=
ysroots/beaglebone -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o arch a=
rch.o   =20
>     Found architecture in binary
> CFG_HOST_ARCH=3D"arm"
> CFG_HOST_CPUFEATURES=3D" neon"
> System architecture: 'arm'
> Host architecture: 'arm'
> C++11 auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/com=
mon/c++11/c++11.cpp
> linking c++11
> C++11 enabled.
> floatmath auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/uni=
x/floatmath/floatmath.cpp
> /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnu=
eabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/unix/floatmat=
h/floatmath.cpp:44:5: warning: unused parameter 'argc' [-Wunused-parameter]
>  int main(int argc, char **argv)
>      ^
> /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnu=
eabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/unix/floatmat=
h/floatmath.cpp:44:5: warning: unused parameter 'argv' [-Wunused-parameter]
> linking floatmath
> floatmath enabled.
> sse2 auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/com=
mon/sse2/sse2.cpp
> arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-mss=
e2'
> make: *** [sse2.o] Error 1
> sse2 disabled.
> sse3 auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/com=
mon/sse3/sse3.cpp
> arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-mss=
e3'
> make: *** [sse3.o] Error 1
> sse3 disabled.
> ssse3 auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/com=
mon/ssse3/ssse3.cpp
> arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-mss=
se3'
> make: *** [ssse3.o] Error 1
> ssse3 disabled.
> sse4_1 auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/com=
mon/sse4_1/sse4_1.cpp
> arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-mss=
e4.1'
> make: *** [sse4_1.o] Error 1
> sse4_1 disabled.
> sse4_2 auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/com=
mon/sse4_2/sse4_2.cpp
> arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-mss=
e4.2'
> make: *** [sse4_2.o] Error 1
> sse4_2 disabled.
> avx auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/com=
mon/avx/avx.cpp
> arm-poky-linux-gnueabi-g++: error: unrecognized command line option '-mav=
x'
> make: *** [avx.o] Error 1
> avx disabled.
> neon auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/uni=
x/neon/neon.cpp
> linking neon
> neon enabled.
> Cups auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/uni=
x/cups/cups.cpp
> /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnu=
eabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/unix/cups/cup=
s.cpp:42:23: fatal error: cups/cups.h: No such file or directory
>  #include <cups/cups.h>
>                        ^
> compilation terminated.
> make: *** [cups.o] Error 1
> Cups disabled.
> D-Bus auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/uni=
x/dbus/dbus.cpp
> linking dbus
> D-Bus enabled.
> PulseAudio auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/uni=
x/pulseaudio/pulseaudio.cpp
> linking pulseaudio
> PulseAudio enabled.
> OpenGL auto-detection... ()
> compiling /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky=
-linux-gnueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/config.tests/uni=
x/opengldesktop/opengldesktop.cpp
> linking opengldesktop
> /home/abdul/BeagleBone/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/a=
rmv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.8.2/ld: cann=
ot find -lGL
> collect2: error: ld returned 1 exit status
> make: *** [opengldesktop] Error 1
> OpenGL disabled.
> The OpenGL functionality test failed!
>  You might need to modify the include and library search paths by editing
>  QMAKE_INCDIR_OPENGL, QMAKE_LIBDIR_OPENGL and QMAKE_LIBS_OPENGL in
>  /home/abdul/BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gn=
ueabi/qtbase/5.1.1-r0/qtbase-opensource-src-5.1.1/mkspecs/linux-oe-g++.
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_configure (log file is located at /home/abdul/=
BeagleBone/poky/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.=
1.1-r0/temp/log.do_configure.14298)


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlL7RsEACgkQN1Ujt2V2gBylhwCgsmki15aB9bW2/FT/IWu+r46e
uUkAnA1VVihy1MHECLP2mDkzcX07kRk/
=9mmK
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
