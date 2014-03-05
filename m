Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 73AC26E713
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:56:35 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id l9so1214715eaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1DOtS5oPiLcUn6LF1t0/g8JrsTTWwbgZi7CUBcSOG7I=;
	b=KETDYR1k8PZ+xZMbE2bccMdV63RvWQcRBE4hG9vSi+hnB4uuEBQpJnNcBLr8w2Y5DL
	S3IPbtFJw8GpUFItnK3mz1gAY1RnMqV1oDafdZiN2gP8SIGlrIZqoBgZO/tAiwDauwlx
	XofRSReSlFHujSpa8ZNVP2eL5yhMPJu7K4cUSA+rAN5PHiycHV53+Uqa0xZi8xK3sFZe
	kMIkqi/jx3r9nSdSk4Mr7n+g3GFMi6pVe3ScB3p2ffGVxIKnW7yUdwtVu2BLwn9baWmi
	qnZcwuaqYUDPHzzuEnYji+rqdEZvzvg2/TH3za/nR5GEiji4ktRn97+ayDWojE1gAtvN
	uSbQ==
X-Received: by 10.14.47.133 with SMTP id t5mr4206647eeb.96.1394042195877;
	Wed, 05 Mar 2014 09:56:35 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	43sm11785289eeh.13.2014.03.05.09.56.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 09:56:34 -0800 (PST)
Date: Wed, 5 Mar 2014 18:56:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140305175641.GY26981@jama>
References: <1393393197-23806-1-git-send-email-ticotimo@gmail.com>
	<1393393197-23806-4-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393393197-23806-4-git-send-email-ticotimo@gmail.com>
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
X-List-Received-Date: Wed, 05 Mar 2014 17:56:36 -0000
X-Groupsio-MsgNum: 48525
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS9klqLmw6ZV6yuC"
Content-Disposition: inline

--zS9klqLmw6ZV6yuC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 09:39:57PM -0800, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../vlc/files/0001-enable-subdir-objects.patch        | 13 +++++++++++++
>  .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17 +++++++++++++=
++++
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 10 +++++++---
>  meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb  | 19 -------------=
------
>  meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 17 +++++++++++++=
++++
>  5 files changed, 54 insertions(+), 22 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0001-ena=
ble-subdir-objects.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0002-gli=
bc-does-not-provide-strlcpy.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb

Hi,=20

it fails to build in world verification:

| make[1]: Entering directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2'
| Making all in compat
| make[2]: Entering directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
| make  all-am
| make[3]: Entering directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
| ../doltcompile arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm
-mthumb-interwork
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemuarm
-std=3Dgnu99 -DHAVE_CONFIG_H -I. -I..   -I../include -I../include   -O2
-pipe -g -feliminate-unused-debug-types -Wall -Wextra -Wsign-compare
-Wundef -Wpointer-arith -Wbad-function-cast -Wwrite-strings
-Wmissing-prototypes -Wvolatile-register-var
-Werror-implicit-function-declaration -pipe -fvisibility=3Dhidden
-ffast-math -funroll-loops -fomit-frame-pointer -c -o dummy.lo dummy.c
| ../doltcompile arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm
-mthumb-interwork
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemuarm
-std=3Dgnu99 -DHAVE_CONFIG_H -I. -I..   -I../include -I../include   -O2
-pipe -g -feliminate-unused-debug-types -Wall -Wextra -Wsign-compare
-Wundef -Wpointer-arith -Wbad-function-cast -Wwrite-strings
-Wmissing-prototypes -Wvolatile-register-var
-Werror-implicit-function-declaration -pipe -fvisibility=3Dhidden
-ffast-math -funroll-loops -fomit-frame-pointer -c -o strlcpy.lo
strlcpy.c
| ../doltlibtool  --tag=3DCC   --mode=3Dlink arm-oe-linux-gnueabi-gcc
-march=3Darmv5te -marm -mthumb-interwork
--sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots=
/qemuarm
-std=3Dgnu99  -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wextra
-Wsign-compare -Wundef -Wpointer-arith -Wbad-function-cast
-Wwrite-strings -Wmissing-prototypes -Wvolatile-register-var
-Werror-implicit-function-declaration -pipe -fvisibility=3Dhidden
-ffast-math -funroll-loops -fomit-frame-pointer -no-undefined -static
-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o libcompat.la -rpath
/usr/lib/vlc dummy.lo strlcpy.lo
| ../doltlibtool: line 18: exec: arm-nodistro-linux-gnueabi-libtool: not
found
| make[3]: *** [libcompat.la] Error 127
| make[3]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2/compat'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/vlc/2.1.2-r0/vlc-2.1.2'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linu=
x-gnueabi/vlc/2.1.2-r0/temp/log.do_compile.6302)
NOTE: recipe vlc-2.1.2-r0: task do_compile: Failed

Can you please check? I'll send updated bitbake world status later today
or tomorrow (with full log)
http://www.openembedded.org/wiki/Bitbake_World_Status

>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-sub=
dir-objects.patch b/meta-multimedia/recipes-multimedia/vlc/files/0001-enabl=
e-subdir-objects.patch
> new file mode 100644
> index 0000000..9f0e708
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/vlc/files/0001-enable-subdir-obj=
ects.patch
> @@ -0,0 +1,13 @@
> +Index: vlc-2.1.2/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- vlc-2.1.2.orig/configure.ac
> ++++ vlc-2.1.2/configure.ac
> +@@ -24,7 +24,7 @@ AC_CANONICAL_BUILD
> + AC_CANONICAL_HOST
> + AC_PRESERVE_HELP_ORDER
> +=20
> +-AM_INIT_AUTOMAKE(tar-ustar color-tests foreign)
> ++AM_INIT_AUTOMAKE(tar-ustar color-tests foreign subdir-objects)
> + AC_CONFIG_HEADERS([config.h])
> +=20
> + # Disable with "./configure --disable-silent-rules" or "make V=3D1"
> diff --git a/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does=
-not-provide-strlcpy.patch b/meta-multimedia/recipes-multimedia/vlc/files/0=
002-glibc-does-not-provide-strlcpy.patch
> new file mode 100644
> index 0000000..6d2a46f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/vlc/files/0002-glibc-does-not-pr=
ovide-strlcpy.patch
> @@ -0,0 +1,17 @@
> +Index: vlc-2.1.2/src/input/subtitles.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- vlc-2.1.2.orig/src/input/subtitles.c
> ++++ vlc-2.1.2/src/input/subtitles.c
> +@@ -44,6 +44,12 @@
> + #include "input_internal.h"
> +=20
> + /**
> ++ * Drepper's alternative=20
> ++ * http://en.wikibooks.org/wiki/C_Programming/C_Reference/nonstandard/s=
trlcpy
> ++ */
> ++#define strlcpy(dst, src, n) *((char* ) mempcpy(dst, src, n)) =3D '\0'
> ++
> ++/**
> +  * We are not going to autodetect more subtitle files than this.
> +  */
> + #define MAX_SUBTITLE_FILES 128
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index 6400719..976c3bf 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -5,13 +5,13 @@ SECTION =3D "multimedia"
> =20
>  DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/libsdl=
 qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac libxpm fluidsynt=
h alsa-lib"
> =20
> -SRC_URI =3D "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${P=
V}.tar.bz2"
> +SRC_URI =3D "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${P=
V}.tar.xz"
> =20
>  inherit autotools gettext
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> =20
> -DEPENDS +=3D "libdvdcss libdvdread lua5.1-native lua5.1"
> +DEPENDS +=3D "libdvdcss libdvdread lua-native lua"
> =20
>  LEAD_SONAME =3D "libvlc.so.5"
> =20
> @@ -36,6 +36,8 @@ FILES_libvlc-dbg =3D "\
> =20
>  FILES_libvlc =3D "${libdir}/lib*.so.*"
> =20
> +FILES_libvlc-staticdev =3D "${libdir}/vlc/plugins/*/*.a"
> +
>  FILES_${PN} +=3D "${bindir}/vlc \
>      ${datadir}/applications \
>      ${datadir}/vlc/ \
> @@ -71,6 +73,7 @@ PACKAGECONFIG[id3tag] =3D "--enable-id3tag,--disable-id=
3tag,libid3tag"
>  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
>  PACKAGECONFIG[mpeg2dec] =3D "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2d=
ec"
>  PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> +PACKAGECONFIG[live555] =3D "--enable-live555,--disable-live555,live555"
> =20
>  do_configure() {
>      cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/=20
> @@ -81,6 +84,7 @@ do_configure() {
>      cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
>      oe_runconf
>      rm config.log
> -    sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
> +    #sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
>      sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/in=
clude\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
> +    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_ARCH}-${DISTRO}-=
${TARGET_OS}-libtool:g doltlibtool
>  }
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-=
multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
> deleted file mode 100644
> index 368db59..0000000
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# This recipe packages vlc as a library as well, so qt4 dependencies
> -# can be avoided when only the library is installed.
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ded7e492ee44e70125a5d42e118354=
a13"
> -
> -require vlc.inc
> -
> -SRC_URI +=3D "file://0001-V4L2-mark-horizontal-and-vertical-center-contr=
ols-ob.patch"
> -SRC_URI +=3D "file://0002-fix-build-with-newer-freetype.patch"
> -SRC_URI +=3D "file://0003-fix-build-with-newer-flac-1.3.0.patch"
> -
> -PR =3D "r4"
> -
> -# work around build failure
> -EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
> -
> -SRC_URI[md5sum] =3D "a64846d6f21ea179ae8e8bfb6f9447fe"
> -SRC_URI[sha256sum] =3D "682560be08b82bedfaf30d8a611d80093c5883c1de72fcbc=
f05715b8e9f4e1cb"
> -
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb b/meta-m=
ultimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
> new file mode 100644
> index 0000000..a33f93f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
> @@ -0,0 +1,17 @@
> +# This recipe packages vlc as a library as well, so qt4 dependencies
> +# can be avoided when only the library is installed.
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +require vlc.inc
> +
> +# work around build failure
> +EXTRA_OECONF +=3D " --enable-libxml2=3Dno"
> +
> +SRC_URI +=3D "file://0001-enable-subdir-objects.patch \
> +            file://0002-glibc-does-not-provide-strlcpy.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "fb6787ad749aadcfaeab3471939b3426"
> +SRC_URI[sha256sum] =3D "219b812be1bc2eba40faa86419d0aa2c479a7380af8af216=
e8bfa22eb6fc8ec4"
> +
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zS9klqLmw6ZV6yuC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXZVkACgkQN1Ujt2V2gBy1yACgi+NnCZc+ZeAZihEjx/re20MX
31wAn3PupR7zV6lVPf/tEkIlXfbqsAhG
=m8CQ
-----END PGP SIGNATURE-----

--zS9klqLmw6ZV6yuC--
