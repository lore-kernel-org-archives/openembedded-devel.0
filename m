Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id C17E56F348
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 17:19:54 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id e49so1879284eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wnHAXrcKSOCHkT1DD/258mXqHUHzhflEoUhb63JoGjc=;
	b=bS2efSJfgLZagfZvCoGtmqSgo2ihZfu9jX4lESqs1nrUDs2UPImFQmnst8Qi0+Z+vQ
	w6qcmfdKVPF3xmOt9CdeWHLWJGE1SQZPVHRcvqgjFqYm9CS0sB1bkIgtowzH7VL4IfKx
	PDoD0je5SBX411E1XJ51fUEt9CtvPsxxnbWdVwr7YDbq34z4ByAbHsqRtrcVN73GS+fP
	K/RfkspOcnEVXIcG2VaBg8nlsU0+ypi3/VTEBFn5TySIgzfGsEYzAMiiQeBvC6hgKn7o
	bWx3QMUXxyEmQyN6AyZOoPTyUxIXvG7WLFTv0tixMvDAlWs7MwZ9kZjvqvIoEmRqN8jR
	xqpA==
X-Received: by 10.14.99.196 with SMTP id x44mr927107eef.65.1393348795731;
	Tue, 25 Feb 2014 09:19:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm78499231een.7.2014.02.25.09.19.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 09:19:54 -0800 (PST)
Date: Tue, 25 Feb 2014 18:19:54 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140225171954.GQ26981@jama>
References: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
	<1393345975-20556-4-git-send-email-ticotimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393345975-20556-4-git-send-email-ticotimo@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-multimedia][PATCH 3/3] vlc: update to 2.1.2
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
X-List-Received-Date: Tue, 25 Feb 2014 17:19:56 -0000
X-Groupsio-MsgNum: 48349
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="213E7WwkW+nU62+Y"
Content-Disposition: inline

--213E7WwkW+nU62+Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2014 at 08:32:55AM -0800, Tim Orling wrote:
> From: Tim Orling <TicoTimo@gmail.com>
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  .../vlc/files/0001-enable-subdir-objects.patch        | 13 +++++++++++++
>  .../files/0002-glibc-does-not-provide-strlcpy.patch   | 17 +++++++++++++=
++++
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc        | 12 +++++++++---
>  meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb   | 19 +++++++++++++=
++++++
>  4 files changed, 58 insertions(+), 3 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0001-ena=
ble-subdir-objects.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/files/0002-gli=
bc-does-not-provide-strlcpy.patch
>  create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
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
> index f3d8a03..6ff8c21 100644
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
> +DEPENDS +=3D "libdvdcss libdvdread lua-native lua live555"

live555 is now in PACKAGECONFIG so you should drop it here.

> =20
>  LEAD_SONAME =3D "libvlc.so.5"
> =20
> @@ -36,6 +36,9 @@ FILES_libvlc-dbg =3D "\
> =20
>  FILES_libvlc =3D "${libdir}/lib*.so.*"
> =20
> +FILES_libvlc-staticdev =3D "${libdir}/vlc/plugins/*/*.a"
> +
> +
>  FILES_${PN} +=3D "${bindir}/vlc \
>      ${datadir}/applications \
>      ${datadir}/vlc/ \
> @@ -70,6 +73,8 @@ PACKAGECONFIG[mad] =3D "--enable-mad,--disable-mad,libm=
ad"
>  PACKAGECONFIG[id3tag] =3D "--enable-id3tag,--disable-id3tag,libid3tag"
>  PACKAGECONFIG[a52] =3D "--enable-a52,--disable-a52,liba52"
>  PACKAGECONFIG[mpeg2dec] =3D "--enable-mpeg2dec,--disable-mpeg2dec,mpeg2d=
ec"
> +PACKAGECONFIG[jack] =3D "--enable-jack,--disable-jack,jack"
> +PACKAGECONFIG[live555] =3D "--enable-live555,--disable-live555,live555"

Please rebase before sending v2

http://git.openembedded.org/meta-openembedded/commit/?id=3D0a089a36ff22f8a8=
e425de15b25a853bf92bfd15

> =20
>  do_configure() {
>      cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/=20
> @@ -80,6 +85,7 @@ do_configure() {
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
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb b/meta-m=
ultimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
> new file mode 100644
> index 0000000..40052d7
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb
> @@ -0,0 +1,19 @@
> +# This recipe packages vlc as a library as well, so qt4 dependencies
> +# can be avoided when only the library is installed.
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +require vlc.inc
> +
> +PR =3D "r6"

Remove old recipe in the same commit and drop PR.

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

--213E7WwkW+nU62+Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMM0LoACgkQN1Ujt2V2gBymWwCgulKVevIXGlUlFPr+EjZS8c54
mSYAnjYrNBAwKE5aKHPS8dU3smxx718h
=wrvt
-----END PGP SIGNATURE-----

--213E7WwkW+nU62+Y--
