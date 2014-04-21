Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id F1D8F65D90
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 11:32:16 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id t10so3511656eei.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HtDg33OfY620y3D+tTOMwGqQd+AtVv448TqseoBGWFE=;
	b=eoU/a+uEpkTAbBqi3j+bj0lUt7e1Z6PioSSp9aPflPCHpTmSO6QxuMqla7iW1eRtTL
	hPKM/FQWXKs7FlWKtlXPvHij/DnYFnD6MKz2e/gR3AI+Buei01sg1hPX1K7u7mEwr1EG
	SlTdOVAxEuNRVNB79knwgbyMyd06+niPIB7QYAWTEOeZnh4n3/5j4tLPzOOxEFdNEwl2
	WAs0Bl2r4PxqNyRlstjDvw+Z4U0Lryhvdm83Onkinw92uKTAPoKKrBX4PyooSjUb+rhv
	h6EHIUCo2A/E2n3leOhuAL0Nswu1lV0BxPy0wNhUlwPP9vig6N5kDIEiZ3A+EkEkKrnf
	zpjw==
X-Received: by 10.15.44.3 with SMTP id y3mr46791682eev.58.1398079937155;
	Mon, 21 Apr 2014 04:32:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u1sm102826354eex.31.2014.04.21.04.32.15 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 04:32:16 -0700 (PDT)
Date: Mon, 21 Apr 2014 13:32:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140421113222.GX2486@jama>
References: <1397914696-12292-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1397914696-12292-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v3] glcompbench: Create 2012.08 version
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
X-List-Received-Date: Mon, 21 Apr 2014 11:32:17 -0000
X-Groupsio-MsgNum: 49390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="i/mq3IMNEv8uWibA"
Content-Disposition: inline

--i/mq3IMNEv8uWibA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2014 at 10:38:16AM -0300, Otavio Salvador wrote:
> From: Lauren Post <lauren.post@freescale.com>
>=20
> glcompbench is a benchmark tool for GL(ES)2 based
> compositing operations

Merged, thanks
>=20
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes for v3:
> - Drop duplicated depends (Khem)
>=20
>  .../glcompbench/glbench-compile-fix.patch          | 35 ++++++++++++++++=
++++++
>  .../glcompbench/glcompbench_2012.08.bb             | 14 +++++++++
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench/glbe=
nch-compile-fix.patch
>  create mode 100644 meta-oe/recipes-graphics/glcompbench/glcompbench_2012=
=2E08.bb
>=20
> diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-com=
pile-fix.patch b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-c=
ompile-fix.patch
> new file mode 100644
> index 0000000..374a6cf
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/glcompbench/glcompbench/glbench-compile-fi=
x.patch
> @@ -0,0 +1,35 @@
> +From c4bc44c3abf69f26e4c2b7684f4da4670a51f993 Mon Sep 17 00:00:00 2001
> +From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> +Date: Tue, 5 Nov 2013 11:03:04 -0600
> +Subject: [PATCH] to make compilable
> +
> +Upstream Status: Inappropriate [workaround]
> +
> +Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
> +---
> + src/composite-test-simple-blur.cc | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/src/composite-test-simple-blur.cc b/src/composite-test-simp=
le-blur.cc
> +index 170ad64..d7f77cf 100644
> +--- a/src/composite-test-simple-blur.cc
> ++++ b/src/composite-test-simple-blur.cc
> +@@ -347,6 +347,7 @@ CompositeTestSimpleBlur::CompositeTestSimpleBlur() :
> +=20
> + CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
> + {
> ++#if 0
> +     for (BlurWindowMapType::iterator winIt =3D priv_->windowMap.begin();
> +          winIt !=3D priv_->windowMap.end();
> +          winIt++)
> +@@ -354,6 +355,7 @@ CompositeTestSimpleBlur::~CompositeTestSimpleBlur()
> +         RenderWindowBlur* ro =3D winIt->second;
> +         delete ro;
> +     }
> ++#endif
> +     delete priv_;
> + }
> +=20
> +--=20
> +1.8.1.2
> +
> diff --git a/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb =
b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
> new file mode 100644
> index 0000000..51f57b9
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/glcompbench/glcompbench_2012.08.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "A benchmark for GL(ES)2 based compositing operations"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27defe1e96c2e1ecd4e0c9be8967=
949"
> +
> +DEPENDS =3D "virtual/libgl virtual/egl virtual/libgles1 virtual/libgles2=
 \
> +           virtual/libx11 libxcomposite pixman libxrender libpng12"
> +
> +SRC_URI =3D "https://launchpad.net/glcompbench/trunk/${PV}/+download/${B=
PN}-${PV}.tar.gz \
> +           file://glbench-compile-fix.patch"
> +
> +SRC_URI[md5sum] =3D "c939d9156fe940960098f38707fea827"
> +SRC_URI[sha256sum] =3D "b04b738cec06c6786ceafa86e4735fd8b971c07826575485=
4ef356b0379542ee"
> +
> +inherit pkgconfig waf
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--i/mq3IMNEv8uWibA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVAcYACgkQN1Ujt2V2gBxxqACgoVWG0sxHLGwtX5RTVNBtimDG
zgUAn0NBEcbblCdJxxhfSGKvvNBxrN84
=jFas
-----END PGP SIGNATURE-----

--i/mq3IMNEv8uWibA--
