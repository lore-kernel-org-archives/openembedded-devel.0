Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id B7E9873D89
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jul 2015 05:12:19 +0000 (UTC)
Received: by pdbnt7 with SMTP id nt7so42240149pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=lZHzFZAEoT2eljXmi4EKkvlgSNZJm4JNrJ69pTPVOsM=;
	b=MnR+erlJu/dA28OPCD2tmiSxFoAGaqbmqY3YsL8/GZ09Zqr9rHVIN98tprb8p8wxOE
	oKypgGpAgAMxtLaVKrJ+3bizDEg+7DssXpt721+KshAhBxWiTIgJ6KrCIE+F8OXv7/g+
	mAGa6cCcnwV6Voe2AMBVfqS8EXPd4GU9JbTOcxccvPpQhTnbTOAvcT01bYLioafck0Kl
	iqV+s6l7FlNlUiordKtziP8NaMa8VeAHPn2yn/Rx+jTZ7hVlPeLMKk/JnjX7u0EMKg6A
	KTzVhYh7pCg4fiPM4jBhYZU3QA4rY8vLlYqZnNA79li9hMzWSvZ2xWG9lZZ75pSLJE+k
	gq/g==
X-Received: by 10.70.44.199 with SMTP id g7mr35519118pdm.152.1437455540180;
	Mon, 20 Jul 2015 22:12:20 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:7879:5e78:5a27:38d9?
	([2601:202:4000:1239:7879:5e78:5a27:38d9])
	by smtp.googlemail.com with ESMTPSA id
	pn6sm24787681pdb.72.2015.07.20.22.12.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 22:12:19 -0700 (PDT)
Message-ID: <55ADD4AD.3030009@gmail.com>
Date: Mon, 20 Jul 2015 22:12:13 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1435059341-19973-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1435059341-19973-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][fido][PATCH] nodejs: fix qemuarm build without thumb and drop unused patch
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
X-List-Received-Date: Tue, 21 Jul 2015 05:12:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to staging

- armin

On 06/23/2015 04:35 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ----------------------
>   .../nodejs/nodejs/enable-armv5e-build.patch        | 22 ++++++++
>   meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb   |  4 +-
>   3 files changed, 25 insertions(+), 61 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
>   create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
>
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
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch b/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
> new file mode 100644
> index 0000000..cc7c9ab
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
> @@ -0,0 +1,22 @@
> +Building for qemuarm without thumb enabled is using -march=armv5e which isn't
> +recognized here. Fix it by adding __ARM_ARCH_5E__.
> +
> +v0.12.2 branch of node doesn't seem to be affected, because it's using
> +different version of v8
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +
> +diff -uNr node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h
> +--- node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h	2015-04-01 00:13:01.000000000 +0200
> ++++ node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h	2015-04-28 14:30:43.119509207 +0200
> +@@ -156,7 +156,7 @@
> +
> + // This tests against any known ARMv5 variant.
> + #elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || \
> +-      defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
> ++      defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
> +
> + // The kernel also provides a helper function to perform an atomic
> + // compare-and-swap operation at the hard-wired address 0xffff0fc0.
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
> index 945d9b4..0e789f9 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
> @@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
>
>   DEPENDS = "openssl"
>
> -SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
> +SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
> +    file://enable-armv5e-build.patch \
> +"
>   SRC_URI[md5sum] = "b7f4a9f2e361a7026789a7d6c45a6d30"
>   SRC_URI[sha256sum] = "ac7e78ade93e633e7ed628532bb8e650caba0c9c33af33581957f3382e2a772d"
>
>

