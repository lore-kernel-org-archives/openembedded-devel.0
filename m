Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlcF8-0008AK-3H
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 10:16:43 +0100
Received: by mail-ea0-f173.google.com with SMTP id i13so1198918eaa.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 01:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=dto9ogyClpoEwbpMpwp3T/HP2YTpTpwZKI46sIVb5kw=;
	b=rKpxMRQJUpspnSyPNvzU2R6c2yVhhn63hqe/14zCgcEIlrbQk2mRAty/29VqX2wng2
	nkvTMm/RZaMH/3kUyKwcePgtsBhrejkAFm/K6xL4jYepcP7zyL4UvcRb0ApciWr6PDBL
	Gvx2cKpV8/s97qYs8ZuLkRalfTV6oOw8ymdt+mEL6Ircx8bsUycfA5hqQjwEY9jll0Ab
	CWrWH8tioUUjnSgVyuUfnokXvFCaIBuAzeZshiYIYEKEmZjhZeAKIFrAn2fdCfaSfE3b
	FLr65El9HBmT6X9mNPolAqBJaFmE5XccK4HunFZMLNBYH5VjpTa7VANlHwYRIaX9a5j8
	FKXQ==
X-Received: by 10.14.225.4 with SMTP id y4mr21618963eep.6.1355994117879;
	Thu, 20 Dec 2012 01:01:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm14163378eep.12.2012.12.20.01.01.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 01:01:56 -0800 (PST)
Date: Thu, 20 Dec 2012 10:01:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121220090157.GA30089@jama>
References: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1355934731-32281-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v2 1/3] Revert "openmotif: remove due to lack of libxp in repository"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 09:16:43 -0000
X-Groupsio-MsgNum: 42265
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline

--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 19, 2012 at 02:32:09PM -0200, Otavio Salvador wrote:
> This reverts commit 14b68506078a4133e743491d35245775a58a1317.
>=20
> Change-Id: I3dd4afe60d217e96fef08377c2d32f5c793af992
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Unfortunately still fails here:
| gcc  -DHAVE_CONFIG_H -I. -I../../include -I../../lib/Xm     -O2 -pipe
-g -feliminate-unused-debug-types -Wall -g -fno-strict-aliasing
-Wno-unused -Wno-comment -fno-tree-ter
-I/OE/jansa-test/shr-core/tmp-eglibc/sysroots/qemuarm/usr/include/freetype2
-c makestrs.c
| makestrs.c:51:21: fatal error: X11/Xos.h: No such file or directory
| compilation terminated.
| make: *** [makestrs.o] Error 1
| make: Leaving directory
`/OE/jansa-test/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/openmotif=
/2.3.3-r2/openmotif-2.3.3/config/util'

Cheers,

> ---
>  .../openmotif/openmotif/configure.patch            |   15 ++++++++
>  .../recipes-support/openmotif/openmotif_2.3.3.bb   |   38 ++++++++++++++=
++++++
>  2 files changed, 53 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/openmotif/openmotif/configure=
=2Epatch
>  create mode 100644 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
>=20
> diff --git a/meta-oe/recipes-support/openmotif/openmotif/configure.patch =
b/meta-oe/recipes-support/openmotif/openmotif/configure.patch
> new file mode 100644
> index 0000000..8868e80
> --- /dev/null
> +++ b/meta-oe/recipes-support/openmotif/openmotif/configure.patch
> @@ -0,0 +1,15 @@
> +--- a/configure.ac~	2009-10-27 14:10:23.000000000 -0200
> ++++ b/configure.ac	2011-05-31 10:51:00.207232036 -0300
> +@@ -3,12 +3,6 @@
> + AC_CONFIG_SRCDIR([lib/Xm/Form.c])
> + AC_PREREQ(2.52)
> + AC_CONFIG_AUX_DIR(.)
> +-AC_CHECK_FILE(/usr/X/include/X11/X.h,
> +-  AC_PREFIX_DEFAULT(/usr/X),
> +-  AC_PREFIX_DEFAULT(/usr))
> +-AC_CHECK_FILE(/usr/X11R6/include/X11/X.h,
> +-  AC_PREFIX_DEFAULT(/usr/X11R6),
> +-  AC_PREFIX_DEFAULT(/usr))
> +=20
> + dnl AM_MAINTAINER_MODE
> + AC_CANONICAL_TARGET
> diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-=
oe/recipes-support/openmotif/openmotif_2.3.3.bb
> new file mode 100644
> index 0000000..2e9c2de
> --- /dev/null
> +++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
> @@ -0,0 +1,38 @@
> +SECTION =3D "libs"
> +DESCRIPTION =3D "OSM/Motif implementation."
> +LICENSE =3D "OGPL"
> +DEPENDS =3D "xbitmaps virtual/libx11 libxt libxp"
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D14f692c82491db3d52419929d2f3b=
343"
> +
> +SRC_URI =3D "http://openmotif.com/files/public_downloads/openmotif/2.3/2=
=2E3.3/openmotif-2.3.3.tar.gz \
> +           file://configure.patch;patch=3D1"
> +
> +SRC_URI[md5sum] =3D "fd27cd3369d6c7d5ef79eccba524f7be"
> +SRC_URI[sha256sum] =3D "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a=
568eee4fc10cd103"
> +
> +inherit autotools
> +
> +PACKAGES +=3D "${PN}-bin"
> +
> +FILES_${PN}-bin =3D "${bindir}"
> +
> +do_compile() {
> +	(
> +		# HACK: build a native binaries need during the build
> +		unset CC LD CXX CCLD CFLAGS
> +		oe_runmake -C config/util CC=3D"${BUILD_CC}" LD=3D"${BUILD_LD}" CXX=3D=
"${BUILD_CXX}" LIBS=3D"" makestrs
> +    )
> +    if [ "$?" !=3D "0" ]; then
> +        exit 1
> +    fi
> +    oe_runmake -C lib
> +    oe_runmake -C include
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} -C lib install
> +    oe_runmake DESTDIR=3D${D} -C include install
> +}
> +
> +LEAD_SONAME =3D "libXm.so.4"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDS1AUACgkQN1Ujt2V2gByVjgCeLRvRrOeAkUyQ0CSNbAbv/L37
TAsAoKRcdKpXKiRnFIx2QPravLJbFuvR
=wIvZ
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
