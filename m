Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id EDAC56BD11
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:56:48 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id o10so3218277eaj.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 10:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AuKnl03RJzLUNfbhpEnNWdFJsmOeSsYINxEKSFjLk9k=;
	b=d3HNBtHCiORQpf9RlLq/CmC4nzOAIXYC27eoDYoI9NQoC8EZeMDQTdBlnQeOmiTJpA
	4PL7ciHT6znjSmmqxMua6Xamxq/dnqQgxQLJ+k89VK6FIifHMs7+X9dVWyWd2Vok9XNv
	lW3z+GxMln+BzcWyt/AmI11pCBjX+0fWg6lqzn6grP9PwBzMBX3Tw6OnT8V93Dj4t4Xj
	I0DH+igLoF3H++ZntBRI+SZLIMHnT1MYVHHpuF1bHjSYNz08rJe5+Z4s2FxFNKKVALDH
	PIR5IXNOPHajroS/0VDOXu53wpXCI+vO9aLW2vgFtTNuuQs/T1nBpN4gBusbePqgwXWb
	XVAw==
X-Received: by 10.14.214.136 with SMTP id c8mr47414629eep.6.1378231009173;
	Tue, 03 Sep 2013 10:56:49 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm33423621eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 10:56:48 -0700 (PDT)
Date: Tue, 3 Sep 2013 19:58:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130903175807.GD3553@jama>
References: <1377671650-16398-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1377671650-16398-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [toolchain-layer][PATCH] gcc-4.6: Update to match gcc restructing in OE-Core
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
X-List-Received-Date: Tue, 03 Sep 2013 17:56:49 -0000
X-Groupsio-MsgNum: 46047
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline

--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 11:34:10PM -0700, Khem Raj wrote:
> The include file infra in gcc recipes recieved an overhaul
> on OE-Core. This patch matches the toolchain layer recipes
> to use the new include files

Applied, thanks!

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb    | 19 -------------=
------
>  toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb |  8 +-------
>  .../recipes-devtools/gcc/gcc-runtime_4.6.bb           |  8 +-------
>  toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb       |  5 +----
>  4 files changed, 3 insertions(+), 37 deletions(-)
>=20
> diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.=
bb b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
> index 5c2435f..29ddd67 100644
> --- a/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross-canadian_4.6.bb
> @@ -2,22 +2,3 @@ inherit cross-canadian
> =20
>  require recipes-devtools/gcc/gcc-${PV}.inc
>  require recipes-devtools/gcc/gcc-cross-canadian.inc
> -require recipes-devtools/gcc/gcc-configure-sdk.inc
> -require recipes-devtools/gcc/gcc-package-sdk.inc
> -
> -DEPENDS +=3D "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc nativesdk-el=
futils"
> -RDEPENDS_${PN} +=3D "nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
> -
> -SYSTEMHEADERS =3D "/usr/include"
> -SYSTEMLIBS =3D "/lib/"
> -SYSTEMLIBS1 =3D "/usr/lib/"
> -
> -EXTRA_OECONF +=3D "--disable-libunwind-exceptions --disable-libssp \
> -    --disable-libgomp --disable-libmudflap \
> -    --with-mpfr=3D${STAGING_DIR_HOST}${layout_exec_prefix} \
> -    --with-mpc=3D${STAGING_DIR_HOST}${layout_exec_prefix}"
> -
> -# to find libmpfr
> -# export LD_LIBRARY_PATH =3D "{STAGING_DIR_HOST}${layout_exec_prefix}"
> -
> -PARALLEL_MAKE =3D ""
> diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb b/tool=
chain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb
> index eb8896c..cdaa7e8 100644
> --- a/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/gcc-cross_4.6.bb
> @@ -1,8 +1,2 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
> -require recipes-devtools/gcc/gcc-cross4.inc
> -
> -EXTRA_OECONF +=3D "--disable-libunwind-exceptions \
> -                 --with-mpfr=3D${STAGING_DIR_NATIVE}${prefix_native} \
> -                 --with-system-zlib "
> -
> -ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_DIR_TARGET}${target_includ=
edir}"
> +require recipes-devtools/gcc/gcc-cross.inc
> diff --git a/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb b/to=
olchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb
> index 13431c8..b755f55 100644
> --- a/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/gcc-runtime_4.6.bb
> @@ -1,8 +1,2 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
> -require recipes-devtools/gcc/gcc-configure-runtime.inc
> -require recipes-devtools/gcc/gcc-package-runtime.inc
> -
> -ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> -
> -EXTRA_OECONF +=3D "--disable-libunwind-exceptions"
> -EXTRA_OECONF_append_linuxstdbase =3D " --enable-clocale=3Dgnu"
> +require recipes-devtools/gcc/gcc-runtime.inc
> diff --git a/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb b/toolchain-=
layer/recipes-devtools/gcc/gcc_4.6.bb
> index 97e6c32..6ad8973 100644
> --- a/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb
> +++ b/toolchain-layer/recipes-devtools/gcc/gcc_4.6.bb
> @@ -1,5 +1,2 @@
>  require recipes-devtools/gcc/gcc-${PV}.inc
> -require recipes-devtools/gcc/gcc-configure-target.inc
> -require recipes-devtools/gcc/gcc-package-target.inc
> -
> -ARCH_FLAGS_FOR_TARGET +=3D "-isystem${STAGING_INCDIR}"
> +require recipes-devtools/gcc/gcc-target.inc
> --=20
> 1.8.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlImIy8ACgkQN1Ujt2V2gBx5WgCgqrt/2AogOUNYUm+qG8szrHEY
GHsAn3ebVvN3x3w88uziYC8e3pwwHIrW
=CMTO
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
