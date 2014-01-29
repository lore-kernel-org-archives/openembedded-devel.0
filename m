Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id AABC46D8FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 18:28:25 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so1110661eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 10:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=u0CwS2CIUjR+LyUrlLaoFqFVctXUA4QJ25AqyfA/yrw=;
	b=LSnaAkHmwYnnGabRUC7phL9FI/NokWKjyy5s23pCp47sis4o0Q8iqMCzp8HZNmhiy9
	ir0wwfRkR76mKyrxXNtlyc22Sdfkit5YpfBHv9KZogdXZUpmu/TB8jS5jklfj2a0ayE6
	piKpCF1v29hQCRfLWzNbETszZk5ARLJFo/RQpORYHr0w/y+dai070M5d378jEhSzzTs6
	4SltF7N9+rozB/WJIKTvSi+3Z/vhBsD6Smya/sKfBD2IVJ2UBoeGC471rqRWYsc2e8Xm
	3zCL5P6nNMsEN+ksisK3a41/4irCo8xPltBFKHMgFd1/9Ev4w/5ua6KUigY1LoMPPvHu
	Fl4Q==
X-Received: by 10.14.69.200 with SMTP id n48mr5445001eed.54.1391020105448;
	Wed, 29 Jan 2014 10:28:25 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id a8sm11937890eeo.3.2014.01.29.10.28.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jan 2014 10:28:24 -0800 (PST)
Date: Wed, 29 Jan 2014 19:28:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140129182830.GQ3718@jama>
References: <1391018608-8719-1-git-send-email-krzysztof.m.sywula@intel.com>
MIME-Version: 1.0
In-Reply-To: <1391018608-8719-1-git-send-email-krzysztof.m.sywula@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: koen@dominion.thruhere.net
Subject: Re: [PATCH] nodejs 0.8.18: update to 0.10.25
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
X-List-Received-Date: Wed, 29 Jan 2014 18:28:27 -0000
X-Groupsio-MsgNum: 47947
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tqSMaTz1cCSspCQ4"
Content-Disposition: inline

--tqSMaTz1cCSspCQ4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2014 at 06:03:28PM +0000, krzysztof.m.sywula@intel.com wrot=
e:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>=20
> Regenerated Khem's patch for assembler-arm.cc, skipped:
> deps/v8/src/platform-linux.cc since it is already correct
> in current nodejs version

Have you tried to build cloud9?

Last time I've tried:
http://patchwork.openembedded.org/patch/48253/

cloud9 wasn't compatible with 0.10*

> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  ...erating-Khem-s-patch-for-assembler-arm.cc.patch | 31 +++++++++++
>  ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ----------------=
------
>  .../nodejs/{nodejs_0.8.18.bb =3D> nodejs_0.10.25.bb} | 12 ++---
>  3 files changed, 37 insertions(+), 66 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerat=
ing-Khem-s-patch-for-assembler-arm.cc.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a=
-builtin-define-to-denote-hard-abi-when-in-.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_0.8.18.bb =3D> nodejs_0.1=
0.25.bb} (73%)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khe=
m-s-patch-for-assembler-arm.cc.patch b/meta-oe/recipes-devtools/nodejs/node=
js/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch
> new file mode 100644
> index 0000000..19b4b6d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-pat=
ch-for-assembler-arm.cc.patch
> @@ -0,0 +1,31 @@
> +From 9febf23ae39c6b7a49b3e9a43319ec9dca8ea771 Mon Sep 17 00:00:00 2001
> +From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> +Date: Wed, 29 Jan 2014 17:32:13 +0000
> +Subject: [PATCH] Regenerating Khem's patch for assembler-arm.cc
> +
> +deps/v8/src/platform-linux.cc is already fixed in this version of nodejs,
> +so no need to patch it again.
> +---
> + deps/v8/src/arm/assembler-arm.cc | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assemble=
r-arm.cc
> +index 9be62a4..f919ff1 100644
> +--- a/deps/v8/src/arm/assembler-arm.cc
> ++++ b/deps/v8/src/arm/assembler-arm.cc
> +@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
> +   // If the compiler is allowed to use VFP then we can use VFP too in o=
ur code
> +   // generation even when generating snapshots. ARMv7 and hardware floa=
ting
> +   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> +-#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> ++#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
> +     && !defined(__SOFTFP__)
> +   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
> +-#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
> ++#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
> +         // && !defined(__SOFTFP__)
> + #endif  // _arm__
> +   if (answer & (1u << ARMv7)) {
> +--=20
> +1.7.12.2
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builti=
n-define-to-denote-hard-abi-when-in-.patch b/meta-oe/recipes-devtools/nodej=
s/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
> deleted file mode 100644
> index 6268d69..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-defin=
e-to-denote-hard-abi-when-in-.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Wed, 30 Jan 2013 10:43:47 +0100
> -Subject: [PATCH] gcc has a builtin define to denote hard abi when in use=
, e.g.
> - when using -mfloat-abi=3Dhard it will define __ARM_PCS_VFP to 1 and the=
refore
> - we should check that to determine which calling convention is in use an=
d not
> - __VFP_FP__ which merely indicates presence of VFP unit
> -
> -The fix has been provided by Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Forwarded
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> - deps/v8/src/arm/assembler-arm.cc | 4 ++--
> - deps/v8/src/platform-linux.cc    | 4 ++--
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assemble=
r-arm.cc
> -index 1787d15..c64ef58 100644
> ---- a/deps/v8/src/arm/assembler-arm.cc
> -+++ b/deps/v8/src/arm/assembler-arm.cc
> -@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
> -   // If the compiler is allowed to use VFP then we can use VFP too in o=
ur code
> -   // generation even when generating snapshots. ARMv7 and hardware floa=
ting
> -   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> --#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> -+#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
> -     && !defined(__SOFTFP__)
> -   answer |=3D 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
> --#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
> -+#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
> -         // && !defined(__SOFTFP__)
> - #endif  // _arm__
> -=20
> -diff --git a/deps/v8/src/platform-linux.cc b/deps/v8/src/platform-linux.=
cc
> -index ed9eb79..10d1879 100644
> ---- a/deps/v8/src/platform-linux.cc
> -+++ b/deps/v8/src/platform-linux.cc
> -@@ -170,7 +170,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
> - // calling this will return 1.0 and otherwise 0.0.
> - static void ArmUsingHardFloatHelper() {
> -   asm("mov r0, #0":::"r0");
> --#if defined(__VFP_FP__) && !defined(__SOFTFP__)
> -+#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> -   // Load 0x3ff00000 into r1 using instructions available in both ARM
> -   // and Thumb mode.
> -   asm("mov r1, #3":::"r1");
> -@@ -195,7 +195,7 @@ static void ArmUsingHardFloatHelper() {
> - #else
> -   asm("vmov d0, r0, r1");
> - #endif  // __thumb__
> --#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
> -+#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
> -   asm("mov r1, #0":::"r1");
> - }
> -=20
> ---=20
> -1.8.1
> -
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/r=
ecipes-devtools/nodejs/nodejs_0.10.25.bb
> similarity index 73%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> index ec9e4cf..a6e8c3f 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> @@ -1,15 +1,15 @@
>  DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE =3D "http://nodejs.org"
>  LICENSE =3D "MIT & BSD"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D95a589a3257ab7dfe37d8a8379e3c=
72d"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a31e6c424761191227143b86f58a=
1ef"
> =20
>  DEPENDS =3D "openssl"
> =20
> -SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> -           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-=
in-.patch \
> -"
> -SRC_URI[md5sum] =3D "25ed6aa5710ac46b867ff3f17a4da1d6"
> -SRC_URI[sha256sum] =3D "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda=
3b71306fe9ae00f9"
> +SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
> +#           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when=
-in-.patch=20
> +
> +SRC_URI[md5sum] =3D "153bdbf77b4473df2600b8ce123ef331"
> +SRC_URI[sha256sum] =3D "46eef3b9d5475a2081dc2b2f7cf1f4c3a56824d1fc9b04e7=
ed1d7a88e8f6b36f"
> =20
>  S =3D "${WORKDIR}/node-v${PV}"
> =20
> --=20
> 1.7.12.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tqSMaTz1cCSspCQ4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLpSE4ACgkQN1Ujt2V2gBwI/ACeOEafXP7ID3IwGpLsfAV5jgpP
0TsAoLCh8WODnWNCaWWJmo0UvNNNlGds
=TwqM
-----END PGP SIGNATURE-----

--tqSMaTz1cCSspCQ4--
