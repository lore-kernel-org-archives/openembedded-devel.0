Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 19CE06F78E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 15:26:44 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id c13so3819142eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C1CwykiaCPamTkGl235QJXR5FQbYDrtfrRlPNnIia0w=;
	b=o5WQElra8Tsk/OJgbbLea8n5iCKBAkImit+33k8Ygk0yHqkKKu+9v5gbeUAwJ2ze6X
	s8CTrdqbmNBG4zYVZVC1NpFG9BxpwH6Eo21G8Pgnb0pT84VNnx6nW5Ni4wrQIaWfLFq3
	cKQBiu2ibwEFeO01fO+q9sYB7HDb1uvS1KebULTEA/QQqilNM8jEVPDk1IZhNl1QVB8/
	UpzE4VaOcZ8IegfISgLU/OAkJNgtFKTBgmBwH2YzjF82cr/yU4Rs0ThbTnbMfkjnfCEq
	MW9THXAHS+RhL3Ri9baPiOVO0sKHodgWRUGmT6KVp43TkoEeypQuVdpK8WLz4cW2XHsW
	CfaA==
X-Received: by 10.15.56.8 with SMTP id x8mr4272766eew.83.1394551605383;
	Tue, 11 Mar 2014 08:26:45 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm58598452eep.17.2014.03.11.08.26.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 08:26:44 -0700 (PDT)
Date: Tue, 11 Mar 2014 16:26:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140311152656.GH2137@jama>
References: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
	<1393393197-23806-4-git-send-email-ticotimo@gmail.com>
	<20140305175641.GY26981@jama>
	<CANx9H-CN6DaJsC=8nhAzAKjaeT1rPy0N9N39tfg=y-A9MS+K=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANx9H-CN6DaJsC=8nhAzAKjaeT1rPy0N9N39tfg=y-A9MS+K=w@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH v2 3/3] vlc: update to 2.1.2
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
X-List-Received-Date: Tue, 11 Mar 2014 15:26:50 -0000
X-Groupsio-MsgNum: 48599
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wj9ZLJVQDRFjGSdK"
Content-Disposition: inline

--wj9ZLJVQDRFjGSdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 08, 2014 at 08:54:31PM -0800, Tim Orling wrote:
> Can you check the build directory to see if
> arm-nodistro-linux-gnueabi-libtool was created? I'm building in angstrom,
> so I see arm-angstrom-linux-gnueabi-libtool... This was not being found by
> the doltlibtool script, which was the reason for the sed fix in vlc.inc. I
> suspect it is behaving differently in your environment. It's on my list to
> duplicate your build environment, including jenkins, but I haven't done it
> yet.

It doesn't exist in WORKDIR
OE qemuarm@ ~/oe/shr-core-branches/shr-core $ find
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/vlc/2.1.2-r0
-name arm-nodistro-linux-gnueabi-libtool

or sysroot

OE qemuarm@ ~/oe/shr-core-branches/shr-core $ find
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm
-name arm-nodistro-linux-gnueabi-libtool

only libtool I have is:
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr=
/bin/crossscripts/libtoolize
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/usr=
/bin/crossscripts/arm-oe-linux-gnueabi-libtool
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/bin/x86_64-linux-libtool
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/bin/libtoolize

> > > +    sed -i -e
> > s:'${top_builddir_slash}libtool':${TARGET_ARCH}-${DISTRO}-${TARGET_OS}-=
libtool:g
> > doltlibtool

I guess you should use ${TARGET_SYS}-libtool here.

Because TARGET_VENDOR !=3D ${DISTRO}

I'll change it in master-next and check it in my build, please test it
in your angstrom build as well and let me know.

> --Tim
>=20
>=20
> On Wed, Mar 5, 2014 at 9:56 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > On Tue, Feb 25, 2014 at 09:39:57PM -0800, Tim Orling wrote:
> > > From: Tim Orling <TicoTimo@gmail.com>
> > >
> > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > ---
> > >  .../vlc/files/0001-enable-subdir-objects.patch        | 13 +++++++++=
++++
> > >  .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17
> > +++++++++++++++++
> > >  meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 10 +++++++---
> > >  meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb  | 19
> > -------------------
> > >  meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 17
> > +++++++++++++++++
> > >  5 files changed, 54 insertions(+), 22 deletions(-)
> > >  create mode 100644
> > meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objects=
=2Epatch
> > >  create mode 100644
> > meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-provid=
e-strlcpy.patch
> > >  delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11=
=2Ebb
> > >  create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.=
bb
> >
> > Hi,
> >
> > it fails to build in world verification:
> >
> > | make[1]: Entering directory
> >
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2'
> > | Making all in compat
> > | make[2]: Entering directory
> >
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > | make  all-am
> > | make[3]: Entering directory
> >
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > | ../doltcompile arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm
> > -mthumb-interwork
> >
> > --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysr=
oots/qemuarm
> > -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I..   -I../include -I../include   -O2
> > -pipe -g -feliminate-unused-debug-types -Wall -Wextra -Wsign-compare
> > -Wundef -Wpointer-arith -Wbad-function-cast -Wwrite-strings
> > -Wmissing-prototypes -Wvolatile-register-var
> > -Werror-implicit-function-declaration -pipe -fvisibility=3Dhidden
> > -ffast-math -funroll-loops -fomit-frame-pointer -c -o dummy.lo dummy.c
> > | ../doltcompile arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm
> > -mthumb-interwork
> >
> > --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysr=
oots/qemuarm
> > -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I..   -I../include -I../include   -O2
> > -pipe -g -feliminate-unused-debug-types -Wall -Wextra -Wsign-compare
> > -Wundef -Wpointer-arith -Wbad-function-cast -Wwrite-strings
> > -Wmissing-prototypes -Wvolatile-register-var
> > -Werror-implicit-function-declaration -pipe -fvisibility=3Dhidden
> > -ffast-math -funroll-loops -fomit-frame-pointer -c -o strlcpy.lo
> > strlcpy.c
> > | ../doltlibtool  --tag=3DCC   --mode=3Dlink arm-oe-linux-gnueabi-gcc
> > -march=3Darmv5te -marm -mthumb-interwork
> >
> > --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysr=
oots/qemuarm
> > -std=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wextra
> > -Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast
> > -Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var
> > -Werror-implicit-function-declaration -pipe -fvisibility=3Dhidden
> > -ffast-math -funroll-loops -fomit-frame-pointer -no-undefined -static
> > -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libcompat.la -rpath
> > /usr/lib/vlc dummy.lo strlcpy.lo
> > | ../doltlibtool: line 18: exec: arm-nodistro-linux-gnueabi-libtool: not
> > found
> > | make[3]: *** [libcompat.la] Error 127
> > | make[3]: Leaving directory
> >
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > | make[2]: *** [all] Error 2
> > | make[2]: Leaving directory
> >
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
> > | make[1]: *** [all-recursive] Error 1
> > | make[1]: Leaving directory
> >
> > `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2'
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_compile (log file is located at
> >
> > /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/vlc/2.1.2-r0/temp/log.do_compile.6302)
> > NOTE: recipe vlc-2.1.2-r0: task do_compile: Failed
> >
> > Can you please check? I'll send updated bitbake world status later today
> > or tomorrow (with full log)
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >
> > >
> > > diff --git
> > a/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objec=
ts.patch
> > b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objec=
ts.patch
> > > new file mode 100644
> > > index 0000000..9f0e708
> > > --- /dev/null
> > > +++
> > b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-objec=
ts.patch
> > > @@ -0,0 +1,13 @@
> > > +Index: vlc-2.1.2/configure.ac
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- vlc-2.1.2.orig/configure.ac
> > > ++++ vlc-2.1.2/configure.ac
> > > +@@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
> > > + AC_CANONICAL_HOST
> > > + AC_PRESERVE_HELP_ORDER
> > > +
> > > +-AM_INIT_AUTOMAKE(tar-ustar color-tests foreign)
> > > ++AM_INIT_AUTOMAKE(tar-ustar color-tests foreign subdir-objects)
> > > + AC_CONFIG_HEADERS([config.h])
> > > +
> > > + # Disable with "./configure --disable-silent-rules" or "make V=3D1"
> > > diff --git
> > a/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-prov=
ide-strlcpy.patch
> > b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-prov=
ide-strlcpy.patch
> > > new file mode 100644
> > > index 0000000..6d2a46f
> > > --- /dev/null
> > > +++
> > b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-prov=
ide-strlcpy.patch
> > > @@ -0,0 +1,17 @@
> > > +Index: vlc-2.1.2/src/input/subtitles.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- vlc-2.1.2.orig/src/input/subtitles.c
> > > ++++ vlc-2.1.2/src/input/subtitles.c
> > > +@@ -44,6 +44,12 @@
> > > + #include "input_internal.h"
> > > +
> > > + /**
> > > ++ * Drepper's alternative
> > > ++ *
> > http://en.wikibooks.org/wiki/C_Programming/C_Reference/nonstandard/strl=
cpy
> > > ++ */
> > > ++#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) =3D '=
\0'
> > > ++
> > > ++/**
> > > +  * We are not going to autodetect more subtitle files than this.
> > > +  */
> > > + #define MAX_SUBTITLE_FILES 128
> > > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > index 6400719..976c3bf 100644
> > > --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > > @@ -5,13 +5,13 @@ SECTION =3D "multimedia"
> > >
> > >  DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/li=
bsdl
> > qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluids=
ynth
> > alsa-lib"
> > >
> > > -SRC_URI =3D "
> > http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
> > > +SRC_URI =3D "
> > http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.xz"
> > >
> > >  inherit autotools gettext
> > >
> > >  ARM_INSTRUCTION_SET =3D "arm"
> > >
> > > -DEPENDS +=3D "libdvdcss libdvdread lua5.1-native lua5.1"
> > > +DEPENDS +=3D "libdvdcss libdvdread lua-native lua"
> > >
> > >  LEAD_SONAME =3D "libvlc.so.5"
> > >
> > > @@ -36,6 +36,8 @@ FILES_libvlc-dbg =3D "\
> > >
> > >  FILES_libvlc =3D "${libdir}/lib*.so.*"
> > >
> > > +FILES_libvlc-staticdev =3D "${libdir}/vlc/plugins/*/*.a"
> > > +
> > >  FILES_${PN} +=3D "${bindir}/vlc \
> > >      ${datadir}/applications \
> > >      ${datadir}/vlc/ \
> > > @@ -71,6 +73,7 @@ PACKAGECONFIG[id3tag] =3D
> > "--enable-id3tag,--disable-id3tag,libid3tag"
> > >  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
> > >  PACKAGECONFIG[mpeg2dec] =3D
> > "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2dec"
> > >  PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> > > +PACKAGECONFIG[live555] =3D "--enable-live555,--disable-live555,live5=
55"
> > >
> > >  do_configure() {
> > >      cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/
> > > @@ -81,6 +84,7 @@ do_configure() {
> > >      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
> > >      oe_runconf
> > >      rm config.log
> > > -    sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
> > > +    #sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
> > >      sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\
> > -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
> > > +    sed -i -e
> > s:'${top_builddir_slash}libtool':${TARGET_ARCH}-${DISTRO}-${TARGET_OS}-=
libtool:g
> > doltlibtool
> > >  }
> > > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bbb/me=
ta-multimedia/recipes-multimedia/vlc/
> > vlc_1.1.11.bb
> > > deleted file mode 100644
> > > index 368db59..0000000
> > > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
> > > +++ /dev/null
> > > @@ -1,19 +0,0 @@
> > > -# This recipe packages vlc as a library as well, so qt4 dependencies
> > > -# can be avoided when only the library is installed.
> > > -
> > > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ded7e492ee44e70125a5d42e11=
8354a13"
> > > -
> > > -require vlc.inc
> > > -
> > > -SRC_URI +=3D
> > "file://0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch"
> > > -SRC_URI +=3D "file://0002-fix-build-with-newer-freetype.patch"
> > > -SRC_URI +=3D "file://0003-fix-build-with-newer-flac-1.3.0.patch"
> > > -
> > > -PR =3D "r4"
> > > -
> > > -# work around build failure
> > > -EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
> > > -
> > > -SRC_URI[md5sum] =3D "a64846d6f21ea179ae8e8bfb6f9447fe"
> > > -SRC_URI[sha256sum] =3D
> > "682560be08b82bedfaf30d8a611d80093c5883c1de72fcbcf05715b8e9f4e1cb"
> > > -
> > > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bbb/met=
a-multimedia/recipes-multimedia/vlc/
> > vlc_2.1.2.bb
> > > new file mode 100644
> > > index 0000000..a33f93f
> > > --- /dev/null
> > > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
> > > @@ -0,0 +1,17 @@
> > > +# This recipe packages vlc as a library as well, so qt4 dependencies
> > > +# can be avoided when only the library is installed.
> > > +
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263"
> > > +
> > > +require vlc.inc
> > > +
> > > +# work around build failure
> > > +EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
> > > +
> > > +SRC_URI +=3D "file://0001-enable-subdir-objects.patch \
> > > +            file://0002-glibc-does-not-provide-strlcpy.patch \
> > > +"
> > > +
> > > +SRC_URI[md5sum] =3D "fb6787ad749aadcfaeab3471939b3426"
> > > +SRC_URI[sha256sum] =3D
> > "219b812be1bc2eba40faa86419d0aa2c479a7380af8af216e8bfa22eb6fc8ec4"
> > > +
> > > --
> > > 1.8.3.2
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wj9ZLJVQDRFjGSdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfK0AACgkQN1Ujt2V2gBzpxwCglg23od/zKRbdajYDx6X5L+bn
ewoAn2vbFRoOcpay69UOInG5pQsjSnH3
=ljdn
-----END PGP SIGNATURE-----

--wj9ZLJVQDRFjGSdK--
