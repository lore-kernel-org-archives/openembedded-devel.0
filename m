Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BAD5E78699
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 17:43:12 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g130so14502577wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Nov 2017 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Rkv7WZYaWnhc3MWnYPQsgNf17X6PuX+rlbWoGwIzE+Q=;
	b=EX37jiSBgKHZOu5C9BWZZsxYSGC7StNMlHIh90qBKrBsaPVsRZr/Q6b/oiuEqYHuRI
	voglbVGINklqPRGveQnJGKBVz+ZWee2A/54bULNdukhrjrrsEQocMljgDg9twWK7tEaJ
	NhYKfM+TIWkfj33lUtI+KDpOUZj3uhvzj0Pi9JkR/+DaDFElMb/dNI6FOQu4/ECebZeP
	4Qod+rcxCqdVrSfvy65dYeKP7u7T0hyj1UYLWT86jU9AK5Eor2uDpCzpwlA+yGRTvpzF
	r1itLNMGbw8UCrq1keN0G7ffhE8mJTzut6yJ6kl/n9D4u8sOIR4LG8cz1TcOWSBiJbAs
	oWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Rkv7WZYaWnhc3MWnYPQsgNf17X6PuX+rlbWoGwIzE+Q=;
	b=nqn4ZGa33xNPefI0MqdfO/Wj6RKANck9M+7Wq97xiQilLcPBhcQNt8T54OOr0IhmDp
	Mqgqxpd1X2yoVXv4HT2Ui/u7PTeB3JadAH4BvbgRJ3xErnrR6CL3BsZExSB8sNzi/skm
	YBq58fk+Lhsm4p+7k05cIKioD9OmKqIgOBtisXHsm2B7sfnCwHy3PVqze3nRHwEon0Jy
	z558TsC+sQp2EJVvSlK1+YoLGiCG/JcDZCWb/9BRkDFiVmIivnIIJr6cczk6xwaIb3CE
	m4iRb9qwPJXQZfYhFJzbg71EI5IL0WlgF435+7GRFPbjcX/lFgZAloCG2Zykz2HcUsRm
	IMiw==
X-Gm-Message-State: AJaThX69vcE+T2w9gsfVbaMpN3840f5ea/LKlL9OqbV5qIJOm5MJlKj1
	iu8FYQW5V0JyycYfRa5SE2mDSg==
X-Google-Smtp-Source: AGs4zMbs6W5ULS64hPRKf2nMWcsHBHdeJAY8nWAtU/c7TWr4HHuoGgnlLdTS3I/CPqj/V4ndVNbX0g==
X-Received: by 10.28.198.75 with SMTP id w72mr4753307wmf.2.1511372593307;
	Wed, 22 Nov 2017 09:43:13 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m37sm11751077wrm.4.2017.11.22.09.43.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Nov 2017 09:43:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Nov 2017 18:47:18 +0100
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20171122174718.GA4166@jama>
References: <20171122163030.10224-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171122163030.10224-1-alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] neon: add the recipe from oe-core
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
X-List-Received-Date: Wed, 22 Nov 2017 17:43:13 -0000
X-Groupsio-MsgNum: 69711
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2017 at 06:30:30PM +0200, Alexander Kanavin wrote:
> It is still required by libmusicbrainz, but is no longer needed
> by oe-core. Switch the upstream to debian as webdav.org is down.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta-oe/recipes-support/neon/neon/pkgconfig.patch | 15 +++++++++
>  meta-oe/recipes-support/neon/neon_0.30.2.bb       | 38 +++++++++++++++++=
++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-support/neon/neon/pkgconfig.patch
>  create mode 100644 meta-oe/recipes-support/neon/neon_0.30.2.bb
>=20
> diff --git a/meta-oe/recipes-support/neon/neon/pkgconfig.patch b/meta-oe/=
recipes-support/neon/neon/pkgconfig.patch
> new file mode 100644
> index 000000000..239dba8e2
> --- /dev/null
> +++ b/meta-oe/recipes-support/neon/neon/pkgconfig.patch
> @@ -0,0 +1,15 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +---
> + neon.pc.in |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- neon-0.30.1.orig/neon.pc.in
> ++++ neon-0.30.1/neon.pc.in
> +@@ -7,5 +7,5 @@ Name: neon
> + Description: HTTP/WebDAV client library
> + Version: @NEON_VERSION@
> + Libs: -L${libdir} -lneon @NEON_PC_LIBS@
> +-Libs.private: @NEON_LIBS@
> ++Libs.private: -L${libdir} -lz -lgcrypt -lgpg-error -lexpat -lgnutls
> + Cflags: -I${includedir}/neon @NEON_CFLAGS@
> diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipe=
s-support/neon/neon_0.30.2.bb
> new file mode 100644
> index 000000000..12a2e0b37
> --- /dev/null
> +++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "An HTTP and WebDAV client library with a C interface"
> +HOMEPAGE =3D "http://www.webdav.org/neon/"
> +SECTION =3D "libs"
> +LICENSE =3D "LGPLv2+"
> +LIC_FILES_CHKSUM =3D "file://src/COPYING.LIB;md5=3Df30a9716ef3762e3467a2=
f62bf790f0a \
> +                    file://src/ne_utils.h;beginline=3D1;endline=3D20;md5=
=3D2caca609538eddaa6f6adf120a218037"
> +
> +SRC_URI =3D "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
> +           file://pkgconfig.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "e28d77bf14032d7f5046b3930704ef41"
> +SRC_URI[sha256sum] =3D "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b15371=
8d1b15d3d967fbca"
> +
> +inherit autotools binconfig-disabled lib_package pkgconfig
> +
> +# Enable gnutls or openssl, not both
> +PACKAGECONFIG ?=3D "expat gnutls libproxy webdav zlib"
> +PACKAGECONFIG_class-native =3D "expat gnutls webdav zlib"
> +
> +PACKAGECONFIG[expat] =3D "--with-expat,--without-expat,expat"
> +PACKAGECONFIG[gnutls] =3D "--with-ssl=3Dgnutls,,gnutls"
> +PACKAGECONFIG[gssapi] =3D "--with-gssapi,--without-gssapi,krb5"
> +PACKAGECONFIG[libproxy] =3D "--with-libproxy,--without-libproxy,libproxy"
> +PACKAGECONFIG[libxml2] =3D "--with-libxml2,--without-libxml2,libxml2"
> +PACKAGECONFIG[openssl] =3D "--with-ssl=3Dopenssl,,openssl"
> +PACKAGECONFIG[webdav] =3D "--enable-webdav,--disable-webdav,"
> +PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
> +
> +EXTRA_OECONF +=3D "--enable-shared"
> +
> +do_compile_append() {
> +	oe_runmake -C test

Use 4 spaces for indentation instead of tabs.

> +}
> +
> +BINCONFIG =3D "${bindir}/neon-config"
> +
> +BBCLASSEXTEND =3D "native"
> --=20
> 2.15.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWhW4JQAKCRA3VSO3ZXaA
HNwqAKCgjUF+4zwVJLPX4YNbCES60rbHvACfVgEXQXklCCEugLWTn7BduRv3fKU=
=/xhw
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
