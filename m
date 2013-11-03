Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 75AEC6B21A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Nov 2013 21:37:19 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id t10so734174eei.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Nov 2013 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gfO5qgYDtWT3Q+bbkyRNLXddw9Kj7g+8ybAuz9HRxdY=;
	b=gV9A8w9fCG5kDt+chuVe+9i6aZAm9i9aUEOgh3G5lARRG3w239etif98E7CC+O8gd8
	EXhFcpSblX+KxGOg2VmDMplpCBnOnQdevA34hW9iLNZpg3JDXVlEtrNeqsDxNbAEcTtb
	0M0BNkrJlNny8Yf6OcxqR0dunaDNXZtRyZGdiwNfJDGEvqPtIyXxgCi72r1gQvDu3Uum
	29ZgXqppc6X5Wh+DEsdW1/9neQeaSvDSy7mMv3878FGg7i+7q0FGHJgtPRKlPc9PHm6p
	TEZH1Y/yScflwtzxnYI3tvDjF1z5RxJo9D1USGM+Zj/Q6BhOO6ijkUjJQRpVxET49wXE
	r/6A==
X-Received: by 10.15.91.3 with SMTP id r3mr15104751eez.4.1383514640532;
	Sun, 03 Nov 2013 13:37:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id m54sm38139833eex.2.2013.11.03.13.37.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Nov 2013 13:37:19 -0800 (PST)
Date: Sun, 3 Nov 2013 22:37:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131103213727.GB3684@jama>
References: <1383141430-30778-1-git-send-email-cazfi74@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1383141430-30778-1-git-send-email-cazfi74@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][PATCH] libsdl2-mixer: add recipe
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
X-List-Received-Date: Sun, 03 Nov 2013 21:37:20 -0000
X-Groupsio-MsgNum: 46993
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZAtKRhVyVSsbBD2"
Content-Disposition: inline

--7ZAtKRhVyVSsbBD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2013 at 03:57:10PM +0200, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> ---
>  .../libsdl2-mixer/libsdl2-mixer/configure.patch    | 26 +++++++++++++++
>  .../libsdl2-mixer/libsdl2-mixer_2.0.0.bb           | 39 ++++++++++++++++=
++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixe=
r/configure.patch
>  create mode 100644 meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixe=
r_2.0.0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer/confi=
gure.patch b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer/configu=
re.patch
> new file mode 100644
> index 0000000..43477e0
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer/configure.pa=
tch
> @@ -0,0 +1,26 @@
> +Upstream-Status: Inappropriate [configure]
> +
> +Adopted from similar patch for libsdl-mixer.
> +
> +Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> +diff -Nurd SDL2_mixer-2.0.0/configure.in SDL2_mixer-2.0.0/configure.in
> +--- SDL2_mixer-2.0.0/configure.in	2013-08-10 20:39:55.000000000 +0300
> ++++ SDL2_mixer-2.0.0/configure.in	2013-10-30 15:40:40.508477024 +0200
> +@@ -1,6 +1,5 @@
> + dnl Process this file with autoconf to produce a configure script.
> + AC_INIT(README.txt)
> +-AC_CONFIG_AUX_DIR(build-scripts)
> +=20
> + dnl Set various version strings - taken gratefully from the GTk sources
> +=20
> +@@ -40,10 +39,6 @@
> + AC_SUBST(LT_REVISION)
> + AC_SUBST(LT_AGE)
> +=20
> +-dnl Detect the canonical build and host environments
> +-AC_CONFIG_AUX_DIRS($srcdir/build-scripts)
> +-dnl AC_CANONICAL_HOST
> +-
> + dnl Check for tools
> + AC_PROG_LIBTOOL
> + AC_PROG_CC
> diff --git a/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer_2.0.0=
=2Ebb b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer_2.0.0.bb
> new file mode 100644
> index 0000000..f016e84
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libsdl2-mixer/libsdl2-mixer_2.0.0.bb
> @@ -0,0 +1,39 @@
> +DESCRIPTION =3D "Simple DirectMedia Layer mixer library."
> +SECTION =3D "libs"
> +DEPENDS =3D "virtual/libsdl2 flac libmikmod libvorbis"
> +LICENSE =3D "Zlib"
> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7d198f6396c6f21fa575129c5=
b2fe8fe"
> +
> +SRC_URI =3D "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer=
-${PV}.tar.gz \
> +           file://configure.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "65f6d80df073a1fb3bb537fbda031b50"
> +SRC_URI[sha256sum] =3D "a8ce0e161793791adeff258ca6214267fdd41b3c073d2581=
cd5265c8646f725b"
> +
> +S =3D "${WORKDIR}/SDL2_mixer-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_AUTORECONF +=3D "--include=3Dacinclude"
> +EXTRA_OECONF =3D "--disable-music-mp3 --enable-music-ogg --enable-music-=
ogg-tremor LIBS=3D-L${STAGING_LIBDIR}"
> +
> +PACKAGECONFIG[mad] =3D "--enable-music-mp3-mad-gpl,--disable-music-mp3-m=
ad-gpl,libmad"


do_compile fails with:
| In file included from mixer.c:41:0:
| dynamic_ogg.h:24:25: fatal error: ivorbisfile.h: No such file or
directory
|  #include <ivorbisfile.h>
|                          ^
| compilation terminated.

Full log
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20=
131102_233937.log/bitbake.log


> +
> +do_configure () {
> +    # Remove old libtool macros.
> +    MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
> +    for i in ${MACROS}; do
> +        rm -f acinclude/$i
> +    done
> +    cp build-scripts/* . || true
> +    rm -rf build-scripts/
> +    export SYSROOT=3D$PKG_CONFIG_SYSROOT_DIR
> +
> +    autotools_do_configure
> +
> +    rm config.log
> +    for i in $(find -name "Makefile") ; do
> +        sed -i -e 's:-L/usr/lib:-L${STAGING_LIBDIR}:g' $i
> +    done
> +}
> --=20
> 1.8.4.rc3
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7ZAtKRhVyVSsbBD2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJ2whcACgkQN1Ujt2V2gBxKtgCglgWGx7NpchFndR5TtnQgfR0U
dB0AoJnp20D+iWpH+Q7tOOe2oEy2Uv3Z
=NM+V
-----END PGP SIGNATURE-----

--7ZAtKRhVyVSsbBD2--
