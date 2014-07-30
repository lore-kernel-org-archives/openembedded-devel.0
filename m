Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id D692270657
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 12:27:35 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so1133883wes.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nB7shiWakbYejDMW1IFvvS/c1l9mH8OJhlc9MmJc4mY=;
	b=mSRQtpQ4O55LUfymCyU3tGHpT/+V5lzCFg4A9ggbpuN/NO/UK1CmXUuOInxuK/j7Ck
	xxH/zXiACeBp6Ykuh8Nc/sHrMAYMKeXBlOVqsTUiHfavcpMCSTx4pz/wS/t/1cj/9Exm
	y2J95kH+Zbq5S9Exa9yrEV89xf1JYKGg8cFVTIWmqQRiiwKL+d09MyZLhc81ewiaOo2M
	mOFLQ1s4OQZdpiIsM90cek5rXqelfBtFnUY7QUu6goykpQqRPq/bogjYLpQy/U5NnX+G
	gQAFxra1UpKtSJrN1E74UOMFcCH5arUV1e40rgCW/EfD8bMzQQRl9wibhHyqlK0PYBT7
	0G0w==
X-Received: by 10.180.221.108 with SMTP id qd12mr5442780wic.83.1406723256292; 
	Wed, 30 Jul 2014 05:27:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ch5sm5222731wjb.18.2014.07.30.05.27.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 05:27:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 14:27:58 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140730122758.GN16445@jama>
References: <1406637609-27046-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
In-Reply-To: <1406637609-27046-1-git-send-email-Matthieu.Crapet@ingenico.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] jq: upgrade to 1.4
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
X-List-Received-Date: Wed, 30 Jul 2014 12:27:40 -0000
X-Groupsio-MsgNum: 51322
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jh06fhy6YTawvwPV"
Content-Disposition: inline

--jh06fhy6YTawvwPV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 02:40:09PM +0200, Matthieu Crapet wrote:
> Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
> ---
>  .../jq/files/automake-once-fix.patch               | 29 ----------------=
------
>  meta-oe/recipes-devtools/jq/jq_1.3.bb              | 23 -----------------
>  meta-oe/recipes-devtools/jq/jq_1.4.bb              | 23 +++++++++++++++++
>  3 files changed, 23 insertions(+), 52 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/jq/files/automake-once-fix.p=
atch
>  delete mode 100644 meta-oe/recipes-devtools/jq/jq_1.3.bb
>  create mode 100644 meta-oe/recipes-devtools/jq/jq_1.4.bb
>=20
> diff --git a/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch b/=
meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
> deleted file mode 100644
> index 0a1d1a2..0000000
> --- a/meta-oe/recipes-devtools/jq/files/automake-once-fix.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -Upstream-Status: Applied
> -https://github.com/stedolan/jq/commit/f0d1c39b5bbb4ccc517773eb635ba7f38e=
c7da1a
> -
> -Fixes build with automake-1.14
> -
> -diff --git a/configure.ac b/configure.ac
> -index 76a49a9..d6d2d38 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -4,7 +4,7 @@ AC_INIT([jq], [1.3], [mu@netsoc.tcd.ie],
> - dnl Created autoconf implementation thompson@dtosolutions, 26NOV12
> - AC_PREREQ([2.61])
> - AC_CONFIG_AUX_DIR([config])
> --AM_INIT_AUTOMAKE([parallel-tests foreign])
> -+AM_INIT_AUTOMAKE([parallel-tests foreign -Wall])
> - AM_SILENT_RULES([yes])
> - AC_PROG_CC
> - AC_PROG_CC_STDC
> -@@ -66,7 +66,6 @@ AC_SUBST([BUNDLER], ["$bundle_cmd"])
> -=20
> - dnl AC_CONFIG_MACRO_DIR([m4])
> - AC_CONFIG_HEADERS(config.h)
> --AM_INIT_AUTOMAKE([-Wall])
> - AC_CONFIG_FILES([Makefile])
> - AC_OUTPUT
> -=20
> ---=20
> -1.8.5.4
> -
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.3.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.3.bb
> deleted file mode 100644
> index c58b472..0000000
> --- a/meta-oe/recipes-devtools/jq/jq_1.3.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY =3D "Lightweight and flexible command-line JSON processor"
> -DESCRIPTION =3D "jq is like sed for JSON data, you can use it to slice a=
nd \
> -               filter and map and transform structured data with the sam=
e \
> -               ease that sed, awk, grep and friends let you play with te=
xt."
> -HOMEPAGE =3D "http://stedolan.github.io/jq/"
> -BUGTRACKER =3D "https://github.com/stedolan/jq/issues"
> -SECTION =3D "utils"
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D244a1fb9cf472474a062d67069dec=
653"
> -
> -DEPENDS =3D "flex-native bison-native"
> -
> -SRC_URI =3D "http://stedolan.github.io/${BPN}/download/source/${BP}.tar.=
gz \
> -           file://automake-once-fix.patch \
> -"
> -SRC_URI[md5sum] =3D "26081b05d22525eca5cbdd8f9f4db17d"
> -SRC_URI[sha256sum] =3D "623f23c36abfc1d96d85020cf421b56f90a229d566f26a4a=
0d3e8536244bfed7"
> -
> -inherit autotools
> -
> -# Don't build documentation (generation requires ruby)
> -EXTRA_OECONF =3D "--disable-docs"
> diff --git a/meta-oe/recipes-devtools/jq/jq_1.4.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.4.bb
> new file mode 100644
> index 0000000..c58b472
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/jq/jq_1.4.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Lightweight and flexible command-line JSON processor"
> +DESCRIPTION =3D "jq is like sed for JSON data, you can use it to slice a=
nd \
> +               filter and map and transform structured data with the sam=
e \
> +               ease that sed, awk, grep and friends let you play with te=
xt."
> +HOMEPAGE =3D "http://stedolan.github.io/jq/"
> +BUGTRACKER =3D "https://github.com/stedolan/jq/issues"
> +SECTION =3D "utils"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D244a1fb9cf472474a062d67069dec=
653"
> +
> +DEPENDS =3D "flex-native bison-native"
> +
> +SRC_URI =3D "http://stedolan.github.io/${BPN}/download/source/${BP}.tar.=
gz \
> +           file://automake-once-fix.patch \

^ you have removed this file, but you still have it in SRC_URI, fix it
and resend with -M.

> +"
> +SRC_URI[md5sum] =3D "26081b05d22525eca5cbdd8f9f4db17d"
> +SRC_URI[sha256sum] =3D "623f23c36abfc1d96d85020cf421b56f90a229d566f26a4a=
0d3e8536244bfed7"
> +
> +inherit autotools
> +
> +# Don't build documentation (generation requires ruby)
> +EXTRA_OECONF =3D "--disable-docs"
> --=20
> 2.0.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jh06fhy6YTawvwPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPY5M4ACgkQN1Ujt2V2gBwRYACfYi1kXjEPuf5ej1CUIDa9TDF8
IAwAn3AviFeWcSWVObPjU7DYm4hf98nf
=wB92
-----END PGP SIGNATURE-----

--jh06fhy6YTawvwPV--
