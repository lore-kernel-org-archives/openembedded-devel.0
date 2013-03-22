Received: from mail-pd0-f177.google.com ([209.85.192.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyTB-00084D-L4
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 10:41:06 +0100
Received: by mail-pd0-f177.google.com with SMTP id y14so1491076pdi.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tjIxTDmQXD7AQvKZM0b8vJwNzJTJZiIRfmcHLgHg4L0=;
	b=pXCs1MQ5YBPk4RXzo4WMPS5Af+VRj8a5HUfQFGOEXoE8sBY+2NsBPPmLRq9iSMkZJS
	kgF0KfuiwA4nqqVA8t2xdbincWtpbXpfQtZ+L57FpXpObu07/FbUTfGU3hQ1TwECNG41
	YP7Gw+V2LXgVa6H+wkx3GMPibsdUX1u0pj31OIjmRIBDxXjPB3t+IvSxGZ8U5bIcGGeH
	QxkGTeWarT10xaxncVQPM/0JsJLrB3BcJKFT0BAxV8etrCz0wa0AUY+0uNb5f8AFqJq0
	NpftnjFOkxsCzK4mTXsizmfRN/yb7S0Mi3SxsEkkxtfm2d1uJ7GkaMkrSoLt5YX0sXev
	Rppg==
X-Received: by 10.66.232.230 with SMTP id tr6mr2197297pac.83.1363944251289;
	Fri, 22 Mar 2013 02:24:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id iv3sm1708211pbc.40.2013.03.22.02.24.08
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:24:10 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:24:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130322092409.GP3219@jama>
References: <1363209826-5929-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1363209826-5929-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] xfsprogs: fix compile with uclibc
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
X-List-Received-Date: Fri, 22 Mar 2013 09:41:08 -0000
X-Groupsio-MsgNum: 43657
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7ZMy3ZKywLyoHonN"
Content-Disposition: inline

--7ZMy3ZKywLyoHonN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 10:23:46PM +0100, Andreas Oberritter wrote:
> Uclibc doesn't have aio.h, which xfsprogs checks for.
> However, xfsprogs doesn't use aio.

Applied, thanks!

>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../drop-configure-check-for-aio.patch             |   99 ++++++++++++++=
++++++
>  meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb |   10 +-
>  2 files changed, 108 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-=
configure-check-for-aio.patch
>=20
> diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configu=
re-check-for-aio.patch b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/dr=
op-configure-check-for-aio.patch
> new file mode 100644
> index 0000000..a1c6042
> --- /dev/null
> +++ b/meta-oe/recipes-support/xfsprogs/xfsprogs-3.1.8/drop-configure-chec=
k-for-aio.patch
> @@ -0,0 +1,99 @@
> +Upstream-Status: Pending
> +
> +From a38bf800a655ea32cbddd6504e15c2f18597fd13 Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Wed, 13 Mar 2013 14:40:13 +0100
> +Subject: [PATCH] xfsprogs: drop configure check for aio
> +
> +It's unused and breaks compilation with uclibc.
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +---
> + configure.in         |    6 +++---
> + m4/Makefile          |    1 -
> + m4/package_aiodev.m4 |   37 -------------------------------------
> + 3 files changed, 3 insertions(+), 41 deletions(-)
> + delete mode 100644 m4/package_aiodev.m4
> +
> +diff --git a/configure.in b/configure.in
> +index 664c0e9..f7d35f1 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -46,6 +46,9 @@ AC_ARG_ENABLE(lib64,
> + 	enable_lib64=3Dyes)
> + AC_SUBST(enable_lib64)
> +=20
> ++librt=3D"-lrt"
> ++AC_SUBST(librt)
> ++
> + #
> + # If the user specified a libdir ending in lib64 do not append another
> + # 64 to the library names.
> +@@ -91,9 +94,6 @@ AC_PACKAGE_GLOBALS(xfsprogs)
> + AC_PACKAGE_UTILITIES(xfsprogs)
> + AC_MULTILIB($enable_lib64)
> +=20
> +-AC_PACKAGE_NEED_AIO_H
> +-AC_PACKAGE_NEED_LIO_LISTIO
> +-
> + AC_PACKAGE_NEED_UUID_H
> + AC_PACKAGE_NEED_UUIDCOMPARE
> +=20
> +diff --git a/m4/Makefile b/m4/Makefile
> +index 654a4fb..d282f0a 100644
> +--- a/m4/Makefile
> ++++ b/m4/Makefile
> +@@ -14,7 +14,6 @@ CONFIGURE =3D \
> +=20
> + LSRCFILES =3D \
> + 	manual_format.m4 \
> +-	package_aiodev.m4 \
> + 	package_blkid.m4 \
> + 	package_globals.m4 \
> + 	package_libcdev.m4 \
> +diff --git a/m4/package_aiodev.m4 b/m4/package_aiodev.m4
> +deleted file mode 100644
> +index 490d9c8..0000000
> +--- a/m4/package_aiodev.m4
> ++++ /dev/null
> +@@ -1,37 +0,0 @@
> +-#
> +-# Check if we have a libaio.h installed
> +-#
> +-AC_DEFUN([AC_PACKAGE_WANT_AIO],
> +-  [ AC_CHECK_HEADERS(libaio.h, [ have_aio=3Dtrue ], [ have_aio=3Dfalse =
])
> +-    AC_SUBST(have_aio)
> +-  ])
> +-
> +-#
> +-# Check if we have an aio.h installed
> +-#
> +-AC_DEFUN([AC_PACKAGE_NEED_AIO_H],
> +-  [ AC_CHECK_HEADERS(aio.h)
> +-    if test $ac_cv_header_aio_h =3D no; then
> +-	echo
> +-	echo 'FATAL ERROR: could not find a valid <aio.h> header.'
> +-	exit 1
> +-    fi
> +-  ])
> +-
> +-#
> +-# Check if we have the lio_listio routine in either libc/librt
> +-#
> +-AC_DEFUN([AC_PACKAGE_NEED_LIO_LISTIO],
> +-  [ AC_CHECK_FUNCS(lio_listio)
> +-    if test $ac_cv_func_lio_listio =3D yes; then
> +-	librt=3D""
> +-    else
> +-	AC_CHECK_LIB(rt, lio_listio,, [
> +-	    echo
> +-	    echo 'FATAL ERROR: could not find a library with lio_listio.'
> +-	    exit 1],[-lpthread])
> +-	librt=3D"-lrt"
> +-    fi
> +-    AC_SUBST(librt)
> +-  ])
> +-
> +--=20
> +1.7.10.4
> +
> diff --git a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb b/meta-oe=
/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
> index f83561d..ef5224b 100644
> --- a/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
> +++ b/meta-oe/recipes-support/xfsprogs/xfsprogs_3.1.8.bb
> @@ -5,10 +5,11 @@ LICENSE =3D "GPLv2"
>  LICENSE_libhandle =3D "LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Ddbdb5f4329b7e7145de650e9e=
cd4ac2a"
>  DEPENDS =3D "util-linux"
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
>  	file://remove-install-as-user.patch \
> +	file://drop-configure-check-for-aio.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "f70b2e7200d4c29f0af1cf70e7be1db6"
> @@ -26,6 +27,13 @@ FILES_libhandle =3D "${base_libdir}/libhandle${SOLIBS}"
> =20
>  EXTRA_OECONF =3D "--enable-gettext=3Dno"
>  do_configure () {
> +	# Prevent Makefile from calling configure without arguments,
> +	# when do_configure gets called for a second time.
> +	rm -f include/builddefs include/platform_defs.h
> +	# Recreate configure script.
> +	rm -f configure
> +	oe_runmake configure
> +	# Configure.
>  	export DEBUG=3D"-DNDEBUG"
>  	gnu-configize --force
>  	oe_runconf
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7ZMy3ZKywLyoHonN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIzkACgkQN1Ujt2V2gBz05ACfRk5g+gKjqI6W2EH2o7uAcKEq
MQcAoII9KiDD3z69IaRQkv79XyFC1LHI
=a9vj
-----END PGP SIGNATURE-----

--7ZMy3ZKywLyoHonN--
