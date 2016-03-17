Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 164D8612E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 21:44:29 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l124so10423227wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Dc1nUZipqx5xxu7n/JLrUyQ7YUKxkfQVoNgzok0ce2Q=;
	b=L3JKPqJaz+HLp8O8i/T7o3LgAMXilZxnBMQVcm/HyjYfa1hVZ+1T6TKgZGTlNhthZp
	PAcLWaEMoD8HS3XTbzPMlG/vPBMDAqx3mBmymiU1q/QojIy1CmtoxThIjHwRyyYQo+qe
	lQerGK4Ig95hp6xV0W1Xap+0vQJTaEpKicetnFq8DGXV1//HPA0Ri7zQ3bYxexeh0ig3
	dx6F2sFOgi0+YWj987K52UucOSb8igk07mQatWD0C96p5s2TrjHVXGO36OoL2HljXmmX
	o18gWMTfJYvtS/uI7qwefHm3V97xkNqOk64UBVDUS4L0oia/6Bn4y2SsSALpwbKD/whQ
	WqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Dc1nUZipqx5xxu7n/JLrUyQ7YUKxkfQVoNgzok0ce2Q=;
	b=jlBHytSgyyXYVTcASbKwfuJCygpCAimn0a0o0vzZtzFkYvNucd8RzMRq0RNQQ5WGQ5
	ekLRuwHxGDW6IO9eaMO0xFc6d8D3/LIlKU/gCTi+uaCx03f945nt/N2o9jHNwnwQEskU
	I8O9YIOQWL4fyNkPHwEPEKfoB79a924dZLVWgKqt5rXC5zfthPb9otgpk79xE9Ia+noh
	/dM7tSrmzK4OwxlwQl84yWcLcbzpjeBNDSoWrhAzIMeO9KdoA5+dk73xiSmZbpP7nNI0
	TBtWEwsFZqn/7lomb6d85W5WMRJ4EW074eTn9CGoXNhRMaKfSfq1VkEhQOzZx6OxUvRk
	79Cg==
X-Gm-Message-State: AD7BkJKW/AhFwPQUYhLWE0lRWS2bP0d1b85ibGMoq5+W37bSh49pPPVo5EtGCoHDNh5tEQ==
X-Received: by 10.28.5.203 with SMTP id 194mr40568812wmf.101.1458251069544;
	Thu, 17 Mar 2016 14:44:29 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id ka7sm9478458wjb.8.2016.03.17.14.44.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Mar 2016 14:44:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Mar 2016 22:48:12 +0100
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Message-ID: <20160317214812.GI2553@jama>
References: <1457957618-32168-1-git-send-email-ricardo.ribalda@gmail.com>
	<1457957618-32168-4-git-send-email-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1457957618-32168-4-git-send-email-ricardo.ribalda@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 4/4] opencv: Fix pkg-config file.
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
X-List-Received-Date: Thu, 17 Mar 2016 21:44:33 -0000
X-Groupsio-MsgNum: 60554
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ev7mvGV+3JQuI2Eo"
Content-Disposition: inline

--ev7mvGV+3JQuI2Eo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 01:13:38PM +0100, Ricardo Ribalda Delgado wrote:
> It was pointing to the wrong location
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch | 12 ++++++++++=
++
>  meta-oe/recipes-support/opencv/opencv_3.1.bb             |  3 ++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/fixpkgconfig.pa=
tch
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch b/m=
eta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
> new file mode 100644
> index 000000000000..4ac3e888e1f0
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/fixpkgconfig.patch
> @@ -0,0 +1,12 @@
> +diff --git a/cmake/OpenCVGenPkgconfig.cmake b/cmake/OpenCVGenPkgconfig.c=
make
> +index b8cb8777c06b..081c62dafd77 100644
> +--- a/cmake/OpenCVGenPkgconfig.cmake
> ++++ b/cmake/OpenCVGenPkgconfig.cmake
> +@@ -66,6 +66,7 @@ ocv_list_unique(_3rdparty)
> +=20
> + set(OPENCV_PC_LIBS
> +   "-L\${exec_prefix}/${OPENCV_LIB_INSTALL_PATH}"
> ++  "-L\${exec_prefix}/${OPENCV_3P_LIB_INSTALL_PATH}"
> +   "${_modules}"
> + )
> + if (BUILD_SHARED_LIBS)
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recip=
es-support/opencv/opencv_3.1.bb
> index 9fd3b12e3631..c403852cf405 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -16,7 +16,8 @@ SRCREV_opencv =3D "92387b1ef8fad15196dd5f7fb4931444a68b=
c93a"
>  SRCREV_contrib =3D "5409d5ad560523c85c6796cc5a009347072d883c"
>  SRCREV_FORMAT =3D "opencv"
>  SRC_URI =3D "git://github.com/Itseez/opencv.git;name=3Dopencv \
> -	   git://github.com/Itseez/opencv_contrib.git;destsuffix=3Dcontrib;name=
=3Dcontrib"
> +	   git://github.com/Itseez/opencv_contrib.git;destsuffix=3Dcontrib;name=
=3Dcontrib \
> +	   file://fixpkgconfig.patch"

Please don't mix tabs and spaces, use 4 spaces everywhere.

3.1 doesn't fails with ffmpeg 3.0 but this fix isn't enough, still shows:

ERROR: QA Issue: opencv.pc failed sanity test (tmpdir) in path
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/open=
cv/3.1+gitAUTOINC+92387b1ef8-r0/sysroot-destdir/usr/lib/pkgconfig
[pkgconfig]

http://errors.yoctoproject.org/Errors/Details/56596/

> =20
>  PV =3D "3.1+git${SRCPV}"
> =20
> --=20
> 2.7.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ev7mvGV+3JQuI2Eo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbrJhUACgkQN1Ujt2V2gBwzCwCeOKgPwKuzcZvFLCNA0c7dsxjQ
GowAoJ1TD0Ug5CHKxZP/prV7WRgCyVy/
=bqOk
-----END PGP SIGNATURE-----

--ev7mvGV+3JQuI2Eo--
