Return-Path: <martin.jansa@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA486A35D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 11:00:01 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kq12so4131392pab.40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2013 04:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UafCVY6oGLevlrckcFuxqvVbaXeQC9HVMBJ4KU9kXn0=;
	b=dn7Od5HoMsaZQn0EHpU3RR1PRHj4cy/ppuHre+fkt5Z7J6vUAPo7H6PV2o8fAp7OSu
	2N8+aivCKrkkgjx4iqGWOXxW188QcobdswnQICGujWKAosPMpq7sk1QuEXTUednxLKQJ
	GC8EtzwskoinwEL3yWMWD6ieVbBDPUwtu86kO6mJap9yGs2MCnmiXhGzv0Ogxmtd25IZ
	A5G1LWMiM4H8i4+gfvogP2BcdTC3DPmeCHUvezR5IU7I+Nmbz5SuDfuAQInhh+X13+jZ
	L7UejkPBwOGe6JAnxOngla2kyxEU8QpMijaOJxnvPRme/gnaabQ2/rX/58TrSXKkGGWi
	rmBQ==
X-Received: by 10.68.180.132 with SMTP id do4mr17305417pbc.96.1369393202401;
	Fri, 24 May 2013 04:00:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	qb1sm15763644pbb.33.2013.05.24.04.00.00 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 04:00:01 -0700 (PDT)
Date: Fri, 24 May 2013 12:59:59 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130524105959.GT32431@jama>
References: <1369388677-15423-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
In-Reply-To: <1369388677-15423-1-git-send-email-eric@eukrea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 1/2] qtjsbackend: fix hardfloat detection in v8
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
X-List-Received-Date: Fri, 24 May 2013 11:00:01 -0000
X-Groupsio-MsgNum: 44855
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xUq7mlTLx96rFlBf"
Content-Disposition: inline

--xUq7mlTLx96rFlBf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 24, 2013 at 11:44:36AM +0200, Eric B=E9nard wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  recipes-qt/qt5/qtjsbackend.inc                     |    1 +
>  .../qtjsbackend/0001-Fix-hardfloat-detection.patch |   33 ++++++++++++++=
++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detecti=
on.patch

Looks good, but have you tried that the same patch does apply to all 4
versions we currently have?
=20
> diff --git a/recipes-qt/qt5/qtjsbackend.inc b/recipes-qt/qt5/qtjsbackend.=
inc
> index 4479654..a0dc632 100644
> --- a/recipes-qt/qt5/qtjsbackend.inc
> +++ b/recipes-qt/qt5/qtjsbackend.inc
> @@ -13,4 +13,5 @@ INC_PR =3D "r0"
> =20
>  SRC_URI +=3D " \
>      file://0002-v8.pro-respect-external-host-bindir-when-set.patch \
> +    file://0001-Fix-hardfloat-detection.patch \
>  "
> diff --git a/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patc=
h b/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch
> new file mode 100644
> index 0000000..3d86fbf
> --- /dev/null
> +++ b/recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch
> @@ -0,0 +1,33 @@
> +From 05a87fccb76447ce3cb4b926128af929f26469bb Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Eric=3D20B=3DC3=3DA9nard?=3D <eric@eukrea.com>
> +Date: Wed, 22 May 2013 18:50:01 +0200
> +Subject: [PATCH] Fix hardfloat detection
> +
> +based on the same patch for nodejs which says :
> +
> +gcc has a builtin define to denote hard abi when in use, e.g. when
> +using -mfloat-abi=3Dhard it will define __ARM_PCS_VFP to 1 and therefore
> +we should check that to determine which calling convention is in use
> +and not __VFP_FP__ which merely indicates presence of VFP unit
> +
> +The fix has been provided by Khem Raj <raj.khem@gmail.com>
> +---
> + src/3rdparty/v8/src/platform-linux.cc |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/3rdparty/v8/src/platform-linux.cc b/src/3rdparty/v8/src=
/platform-linux.cc
> +index f6db423..8ae2249 100644
> +--- a/src/3rdparty/v8/src/platform-linux.cc
> ++++ b/src/3rdparty/v8/src/platform-linux.cc
> +@@ -167,7 +167,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
> + // calling this will return 1.0 and otherwise 0.0.
> + static void ArmUsingHardFloatHelper() {
> +   asm("mov r0, #0":::"r0");
> +-#if defined(__VFP_FP__) && !defined(__SOFTFP__)
> ++#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> +   // Load 0x3ff00000 into r1 using instructions available in both ARM
> +   // and Thumb mode.
> +   asm("mov r1, #3":::"r1");
> +--=20
> +1.7.10.4
> +
> --=20
> 1.7.10.4
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xUq7mlTLx96rFlBf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGfSC8ACgkQN1Ujt2V2gBxdGACgof4/GLoQw20CuA40V/CxHutX
hBEAoKPKCfsVbF5kgU3Qz08Xcb7U3c6Y
=W9Ny
-----END PGP SIGNATURE-----

--xUq7mlTLx96rFlBf--
