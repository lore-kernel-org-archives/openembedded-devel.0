Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2491B6E791
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 18:13:09 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id lx4so2431249iec.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 10:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eGh7cQongjfaM+9VoHbZnNpFdtyi8PMT0x0SEEFnQqA=;
	b=K7SoG44jitbHoAfvh9YQuYXkSVKNqOvGFY8FNhB5ZbZhTxVwoL0/ZJSXH61kNwRJAo
	PIW1CDSgORZzYm6g0bERdYn6g7dcTl1MGdivaGQr2pAQxM7UrCT15FgDKmsybeJylvZo
	7Dup++I8ixb3cZWxogF4EHvhXXVm2tuDx2SJHPTemGfNLXR5iWfwxcx3mob6bZ/mSHp4
	Galb7Ob5vnlgVS0M/rmrn3CsjipzoBCkpZ8h5Ad95nHOhJBA1KS9Ld4GlW4wDe/BXonx
	691j8yGOSNCIghVSHc32y0t9x5uxeQCZJMSfdQua2c3Tt11BxLSZfvMiz4S5R8F7gx80
	A4xg==
X-Received: by 10.50.43.131 with SMTP id w3mr29674359igl.17.1391019189978;
	Wed, 29 Jan 2014 10:13:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Wed, 29 Jan 2014 10:12:39 -0800 (PST)
In-Reply-To: <1391018608-8719-1-git-send-email-krzysztof.m.sywula@intel.com>
References: <1391018608-8719-1-git-send-email-krzysztof.m.sywula@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2014 10:12:39 -0800
Message-ID: <CAMKF1soAse4ESWuO_6bA9Bp_PEu3tb4P8jPCB+aF5p1UUXTu1g@mail.gmail.com>
To: krzysztof.m.sywula@intel.com
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 29 Jan 2014 18:13:10 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 29, 2014 at 10:03 AM,  <krzysztof.m.sywula@intel.com> wrote:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>
> Regenerated Khem's patch for assembler-arm.cc, skipped:
> deps/v8/src/platform-linux.cc since it is already correct
> in current nodejs version
>
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  ...erating-Khem-s-patch-for-assembler-arm.cc.patch | 31 +++++++++++
>  ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ----------------------
>  .../nodejs/{nodejs_0.8.18.bb => nodejs_0.10.25.bb} | 12 ++---
>  3 files changed, 37 insertions(+), 66 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch
>  delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
>  rename meta-oe/recipes-devtools/nodejs/{nodejs_0.8.18.bb => nodejs_0.10.25.bb} (73%)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch
> new file mode 100644
> index 0000000..19b4b6d
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch
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
> +diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assembler-arm.cc
> +index 9be62a4..f919ff1 100644
> +--- a/deps/v8/src/arm/assembler-arm.cc
> ++++ b/deps/v8/src/arm/assembler-arm.cc
> +@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
> +   // If the compiler is allowed to use VFP then we can use VFP too in our code
> +   // generation even when generating snapshots. ARMv7 and hardware floating
> +   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> +-#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> ++#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
> +     && !defined(__SOFTFP__)
> +   answer |= 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
> +-#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
> ++#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
> +         // && !defined(__SOFTFP__)
> + #endif  // _arm__
> +   if (answer & (1u << ARMv7)) {
> +--
> +1.7.12.2
> +
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
> deleted file mode 100644
> index 6268d69..0000000
> --- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Wed, 30 Jan 2013 10:43:47 +0100
> -Subject: [PATCH] gcc has a builtin define to denote hard abi when in use, e.g.
> - when using -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore
> - we should check that to determine which calling convention is in use and not
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
> -diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assembler-arm.cc
> -index 1787d15..c64ef58 100644
> ---- a/deps/v8/src/arm/assembler-arm.cc
> -+++ b/deps/v8/src/arm/assembler-arm.cc
> -@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
> -   // If the compiler is allowed to use VFP then we can use VFP too in our code
> -   // generation even when generating snapshots. ARMv7 and hardware floating
> -   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
> --#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
> -+#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
> -     && !defined(__SOFTFP__)
> -   answer |= 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
> --#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
> -+#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
> -         // && !defined(__SOFTFP__)
> - #endif  // _arm__
> -
> -diff --git a/deps/v8/src/platform-linux.cc b/deps/v8/src/platform-linux.cc
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
> -
> ---
> -1.8.1
> -
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> similarity index 73%
> rename from meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> rename to meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> index ec9e4cf..a6e8c3f 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
> @@ -1,15 +1,15 @@
>  DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
>  HOMEPAGE = "http://nodejs.org"
>  LICENSE = "MIT & BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4a31e6c424761191227143b86f58a1ef"
>


what changed in license please specify in commit message and use git
format-patch -M
so git can try harder to detect renames.


>  DEPENDS = "openssl"
>
> -SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> -           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
> -"
> -SRC_URI[md5sum] = "25ed6aa5710ac46b867ff3f17a4da1d6"
> -SRC_URI[sha256sum] = "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
> +SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
> +#           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
> +
> +SRC_URI[md5sum] = "153bdbf77b4473df2600b8ce123ef331"
> +SRC_URI[sha256sum] = "46eef3b9d5475a2081dc2b2f7cf1f4c3a56824d1fc9b04e7ed1d7a88e8f6b36f"
>
>  S = "${WORKDIR}/node-v${PV}"
>
> --
> 1.7.12.2
>

