Return-Path: <gerharddeclercq@outlook.com>
Received: from BLU004-OMC4S21.hotmail.com (blu004-omc4s21.hotmail.com
	[65.55.111.160])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5696E64A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 13:44:19 +0000 (UTC)
Received: from BLU436-SMTP35 ([65.55.111.135]) by BLU004-OMC4S21.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Tue, 15 Dec 2015 05:44:20 -0800
X-TMN: [NlSSgtmerquDJSV2W5HU3dIFnpn8TrtNcpd92YE9CWs=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <BLU436-SMTP356AEAEB3304E2D897685EB8EE0@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 15:44:12 +0200
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <e2e7c19968164da7ac5990857dc0fade@XCH-ALN-008.cisco.com>
References: <BLU436-SMTP207C9BA27436C22DD6BBA47B8EE0@phx.gbl>
	<e2e7c19968164da7ac5990857dc0fade@XCH-ALN-008.cisco.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Dec 2015 13:44:17.0992 (UTC)
	FILETIME=[B1BD2C80:01D1373E]
Subject: Re: Build Qt5 with X11 backend for EGLFS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Dec 2015 13:44:20 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Yes that was a stupid mistake and I just realized it a few moments befo=
re your=20
mail. Just xcb is probably not enough though after looking at the heade=
rs and=20
I used

EGLFS_PLATFORM_HOOKS_LIBS =3D -lX11 -lX11-xcb -lxcb

It's still compiling though and I'll have to see if this works.

--=20
Regards,
Gerhard de Clercq
On Tuesday 15 Dec 2015 13:26:57 Julien Brianceau wrote:
> Hi,
>=20
> From what I see, you just need to define EGLFS_PLATFORM_HOOKS_LIBS.
>=20
> Your do_configure_prepend() should look like this:
>=20
> do_configure_prepend() {
> =09cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
> EGLFS_PLATFORM_HOOKS_SOURCES =3D \$\$PWD/qeglfshooks_x11.cpp
> EGLFS_PLATFORM_HOOKS_LIBS =3D -lxcb
> EOF
> =09# copy the hook in the mkspecs directory OE is using
> =09cp ${S}/src/plugins/platforms/eglfs/qeglfshooks_x11.cpp=20
${S}/mkspecs/linux-
> oe-g++/
> }
>=20
> Of course, you can add other xcb libraries if needed (-lxcb-shm,
> -lxcb-keysyms, etc ...)
>=20
> Julien
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =
Of
> Gerhard de Clercq Sent: mardi 15 d=E9cembre 2015 13:46
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] Build Qt5 with X11 backend for EGLFS
>=20
> Hi,
>=20
> I am trying to build Qt5 on Fido for my Tegra 3 based device that onl=
y
> provides hardware acceleration through X11 but does have EGL. I have =
been
> using the XCB backend but have run into tearing issues and have found=
 that
> everyone regards switching to EGLFS as the best solution.
>=20
> I initially thought this was not an option but have recently found th=
at one
> can use EGLFS with an X11 backend. To do so I created a qtbase_git.bb=
append
> in my layer and filled it with the following:
>=20
> PACKAGECONFIG[gles2] =3D "-opengl es2 -xcb -eglfs -no-kms,,virtual/li=
bgles2
> virtual/egl"
>=20
> do_configure_prepend() {
> =09cat >> ${S}/mkspecs/linux-oe-g++/qmake.conf <<EOF
> EGLFS_PLATFORM_HOOKS_SOURCES =3D \$\$PWD/qeglfshooks_x11.cpp
> EOF
> =09# copy the hook in the mkspecs directory OE is using
> =09cp ${S}/src/plugins/platforms/eglfs/qeglfshooks_x11.cpp=20
${S}/mkspecs/linux-
> oe-g++/
> }
>=20
> Unfortunately when I try to compile Qt, I get hit with a lot of error=
s
>=20
> relating to xcb references like:
> | /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp=
-neon-
>=20
> angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
> r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:159: error: undefined=

> reference to 'xcb_wait_for_event'
>=20
> | /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp=
-neon-
>=20
> angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
> r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:219: error: undefined=

> reference to 'XOpenDisplay'
>=20
> | /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp=
-neon-
>=20
> angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
> r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:223: error: undefined=

> reference to 'XSetEventQueueOwner'
>=20
> | /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp=
-neon-
>=20
> angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
> r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:224: error: undefined=

> reference to 'XGetXCBConnection'
>=20
> | /home/gerhard/Toradex-New/yocto/build/out-glibc/work/armv7at2hf-vfp=
-neon-
>=20
> angstrom-linux-gnueabi/qtbase/5.4.2+gitAUTOINC+2cb17c1fb9-
> r0/git/mkspecs/linux-oe-g++/qeglfshooks_x11.cpp:228: error: undefined=

> reference to 'xcb_get_setup'
>=20
> Those aren't all the errors but they all seem to point to the fact th=
at xcb
> (I guess libxcb) is not being linked to Qt. I thought adding "-xcb" t=
o the
> packageconfig might have helped but I did not seem to do so. What I c=
an I
> do to try and fix this?
>=20
> PS. Considering it is possible to build the proper XCB backend I gues=
s the
> files must exist somewhere...


