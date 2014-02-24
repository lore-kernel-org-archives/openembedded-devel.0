Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id C32CC6E759
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 09:22:58 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id n15so1822739ead.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 01:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6rB38c6IlSFRSM685Ij+N5zkcG13T6LhdYHYqsXL6Eo=;
	b=mBPB6shwcN01iIXv0gzc7ZrxAJSscv921Q/b9xJDx1hUf1JK6kB6Y5DfHCDq4jZtQ6
	V5zbZSwPEnEnCrnVELhOdkZjNjd6FAYTWJmFr/GnIvjE+7oKHXdClfR12LmhUOiDcycy
	GGYQxA0GxMWaPdn/QsNRs/XW3NyVucDnLfPleIBja9W9KSjFu8/crKTnkqnqKsAvfi/+
	0xkAmwu4qo0cfCJzmky9f6q9ga4tIVe5osfRyIlog56c/Gy4JRDxm1m3BSbWbgdDBANd
	ZpxCmYt5Y8Vt7gVyUP76t8WHKYcDyc2UMb2iJ6eiRD8VP/PIrcXQPGI21imZTWpdn9xC
	rExQ==
X-Received: by 10.15.75.193 with SMTP id l41mr23239822eey.114.1393233778374;
	Mon, 24 Feb 2014 01:22:58 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm61519007een.7.2014.02.24.01.22.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 01:22:57 -0800 (PST)
Date: Mon, 24 Feb 2014 10:22:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140224092256.GA26981@jama>
References: <1393194113-24177-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1393194113-24177-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-oe][meta-efl][PATCH] ode: Move to nonworking
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
X-List-Received-Date: Mon, 24 Feb 2014 09:22:59 -0000
X-Groupsio-MsgNum: 48294
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2014 at 11:21:53PM +0100, Martin Jansa wrote:
> * according to http://www.openembedded.org/wiki/Bitbake_World_Status
>   it's broken at least since 2013-10-30 and nobody seems to care

mokomaze depends on ode, so I'll try to fix this one instead.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../nonworking/ode/ode/install.patch               | 23 ++++++++++++++++=
+++++
>  meta-oe/recipes-support/nonworking/ode/ode_0.9.bb  | 24 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/ode/ode/install.patch      | 23 ----------------=
-----
>  meta-oe/recipes-support/ode/ode_0.9.bb             | 24 ----------------=
------
>  4 files changed, 47 insertions(+), 47 deletions(-)
>  create mode 100644 meta-oe/recipes-support/nonworking/ode/ode/install.pa=
tch
>  create mode 100644 meta-oe/recipes-support/nonworking/ode/ode_0.9.bb
>  delete mode 100644 meta-oe/recipes-support/ode/ode/install.patch
>  delete mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb
>=20
> diff --git a/meta-oe/recipes-support/nonworking/ode/ode/install.patch b/m=
eta-oe/recipes-support/nonworking/ode/ode/install.patch
> new file mode 100644
> index 0000000..2f6cdb0
> --- /dev/null
> +++ b/meta-oe/recipes-support/nonworking/ode/ode/install.patch
> @@ -0,0 +1,23 @@
> +--- ode-0.9.orig/Makefile.am	2007-02-21 15:54:54.000000000 +0100
> ++++ ode-0.9/Makefile.am	2010-08-21 16:15:55.000000000 +0200
> +@@ -25,13 +25,13 @@
> +=20
> + if USE_SONAME
> + install-exec-hook:
> +-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> +-	$(libdir)/libode.so
> +-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> +-	$(libdir)/@ODE_SONAME@
> +-	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> +-	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
> +-	/sbin/ldconfig
> ++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> ++	$(DESTDIR)/$(libdir)/libode.so
> ++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> ++	$(DESTDIR)/$(libdir)/@ODE_SONAME@
> ++	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> ++	$(DESTDIR)/$(libdir)/@ODE_SONAME@.@ODE_REVISION@
> ++	echo /sbin/ldconfig
> + else
> + install-exec-hook:
> + endif
> diff --git a/meta-oe/recipes-support/nonworking/ode/ode_0.9.bb b/meta-oe/=
recipes-support/nonworking/ode/ode_0.9.bb
> new file mode 100644
> index 0000000..1f3a5ca
> --- /dev/null
> +++ b/meta-oe/recipes-support/nonworking/ode/ode_0.9.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "ODE is an Open Source Physics Engine"
> +SECTION =3D "libs"
> +HOMEPAGE =3D "http://www.ode.org"
> +LICENSE =3D "LGPLv2.1 & BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE-BSD.TXT;md5=3Dc74e6304a772117e05945=
8fb9763a928 \
> +                    file://LICENSE.TXT;md5=3D771782cb6245c7fbbe74bc0ec05=
9beff"
> +
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
> +           file://install.patch"
> +
> +SRC_URI[md5sum] =3D "4c03759b76a0649a6d5108c8e172e1e4"
> +SRC_URI[sha256sum] =3D "460d0851b743b1f144ef2a8259004d6774504c95d08e9357=
a96a296111496feb"
> +
> +inherit autotools binconfig
> +
> +EXTRA_OECONF =3D "--disable-demos --enable-soname"
> +
> +do_configure_append() {
> +    echo "#define dInfinity DBL_MAX" >>include/ode/config.h
> +}
> +
> +FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> +
> diff --git a/meta-oe/recipes-support/ode/ode/install.patch b/meta-oe/reci=
pes-support/ode/ode/install.patch
> deleted file mode 100644
> index 2f6cdb0..0000000
> --- a/meta-oe/recipes-support/ode/ode/install.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> ---- ode-0.9.orig/Makefile.am	2007-02-21 15:54:54.000000000 +0100
> -+++ ode-0.9/Makefile.am	2010-08-21 16:15:55.000000000 +0200
> -@@ -25,13 +25,13 @@
> -=20
> - if USE_SONAME
> - install-exec-hook:
> --	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> --	$(libdir)/libode.so
> --	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> --	$(libdir)/@ODE_SONAME@
> --	ln -s $(libdir)/@ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> --	$(libdir)/@ODE_SONAME@.@ODE_REVISION@
> --	/sbin/ldconfig
> -+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> -+	$(DESTDIR)/$(libdir)/libode.so
> -+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> -+	$(DESTDIR)/$(libdir)/@ODE_SONAME@
> -+	ln -s @ODE_SONAME@.@ODE_REVISION@.@ODE_AGE@ \
> -+	$(DESTDIR)/$(libdir)/@ODE_SONAME@.@ODE_REVISION@
> -+	echo /sbin/ldconfig
> - else
> - install-exec-hook:
> - endif
> diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-sup=
port/ode/ode_0.9.bb
> deleted file mode 100644
> index 1f3a5ca..0000000
> --- a/meta-oe/recipes-support/ode/ode_0.9.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY =3D "ODE is an Open Source Physics Engine"
> -SECTION =3D "libs"
> -HOMEPAGE =3D "http://www.ode.org"
> -LICENSE =3D "LGPLv2.1 & BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSE-BSD.TXT;md5=3Dc74e6304a772117e05945=
8fb9763a928 \
> -                    file://LICENSE.TXT;md5=3D771782cb6245c7fbbe74bc0ec05=
9beff"
> -
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
> -           file://install.patch"
> -
> -SRC_URI[md5sum] =3D "4c03759b76a0649a6d5108c8e172e1e4"
> -SRC_URI[sha256sum] =3D "460d0851b743b1f144ef2a8259004d6774504c95d08e9357=
a96a296111496feb"
> -
> -inherit autotools binconfig
> -
> -EXTRA_OECONF =3D "--disable-demos --enable-soname"
> -
> -do_configure_append() {
> -    echo "#define dInfinity DBL_MAX" >>include/ode/config.h
> -}
> -
> -FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> -
> --=20
> 1.9.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMLD3AACgkQN1Ujt2V2gBxdHACfb5d/MEmEtHwYShNi+6tpln+h
FaUAoINZ20D3iDQJaaJaKnj76qjTFk2u
=UMFy
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
