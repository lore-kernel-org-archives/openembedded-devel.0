Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CDF7860F06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 18:18:00 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so8975198wrd.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 10:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F2u0y/h8C5xse8/eFYV4YwTNb4BdXhoN4w5tddSH1G8=;
	b=QhbQeYMa0x/kGoGadvALx56WxJYRMHUQNWDxm0gLq3TptLYTPO5/IZgmsz7kkTGek+
	Y7qmSHfqWxiTpZJJO3tWaSCAiLpzHX5SX5R5qI3WfwClrzq1bKX85LREzF59iYKa9s9R
	LqrqgZLHMpJJ46Dx7TozkD4wsWxtQonXTnb9vilCAKSpPSQrJSGsTx7ntqYoC7fJb6T1
	t9KXySfAf3VYUbBrao362493ywnlwz1+XUYL4/5YIWzVwz+JScP7dEJGyFzmV7B1mo3X
	LAD8vWFO/t0DJo1BuZoGt5uhgVmFXwLZjvWsBGwxVIT9VWTTebUZkA71dbVa/x0BeCLw
	LrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F2u0y/h8C5xse8/eFYV4YwTNb4BdXhoN4w5tddSH1G8=;
	b=oW7e18LYxgcFqx9NrksTrmnQznuKJl3w82GpV/Qmwia7om8o3cOAeVtrG6oC7WTyll
	+qUxiakYJs7np/iBE1r4iqJkBoVt99QLaaqBdvPEEYJuxFkyxkqyUvtVlt5GoHtt6bwN
	UZGYT8Ogpdr6jz7iac/AFqrnkIWOiK8aWjox+WUUCqKYUAbLnkOZphdVa1M22Z058QrU
	pjdVb/OUzgEI7eSl+5H9cc91ENh8cdsxAqJXHz6B8kI4eLU8nb4oV7s3yFVkdVM0rEJn
	drqa0IG0SSbobKKoWOSSI21V/zC4sc6/96zv5Aj4HHIrHt9mpflv3cetMEx2paSMDLc/
	9i5Q==
X-Gm-Message-State: APjAAAXCyGgQlzTO3V3MNpLGqYvu0645JoI6vkYZYc6NwZ7aaJaDMElN
	LlKsQJBmqhhr3acegUO4UjC3z6IM+HnEU+wmRgo=
X-Google-Smtp-Source: APXvYqxpq7rFvI54TPv2/rRcyeST3xkocdaZQZbESKeB09/J/WeeHJBKvuiXVPpAMSdpJL8K9omyvlW+eTgQIfhkh8k=
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr3384526wrs.247.1581358681484; 
	Mon, 10 Feb 2020 10:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20200210174720.31886-1-okaya@kernel.org>
In-Reply-To: <20200210174720.31886-1-okaya@kernel.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 10 Feb 2020 19:17:50 +0100
Message-ID: <CAHtQpK4FHyyhkmayDhcNJXs+0kp9+K1fULG21q9P+C=OtFDpLw@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyu Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH v2] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Mon, 10 Feb 2020 18:18:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 6:47 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> The repository contains the Abseil C++ library code. Abseil is an
> open-source collection of C++ code (compliant to C++11) designed to
> augment the C++ standard library.
>
> https://github.com/abseil/abseil-cpp
>
> Signed-off-by: Changyu Li <Changyu.Li@microsoft.com>
> Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
> ---
>  ...e-maes-option-from-cross-compilation.patch | 53 +++++++++++++++++++
>  .../abseil-cpp/abseil-cpp_git.bb              | 42 +++++++++++++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
>
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
> new file mode 100644
> index 0000000000..4c41cd8902
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
> @@ -0,0 +1,53 @@
> +From 70926666f7c5c35add363e3bcade6eaabace7206 Mon Sep 17 00:00:00 2001
> +From: Sinan Kaya <sinan.kaya@microsoft.com>
> +Date: Mon, 3 Feb 2020 03:25:57 +0000
> +Subject: [PATCH] Remove maes option from cross-compilation
> +
> +---
> + absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
> + absl/copts/GENERATED_copts.bzl         | 4 ----
> + absl/copts/copts.py                    | 4 ----
> + 3 files changed, 12 deletions(-)
> +
> +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
> +index 01bd40b..af99694 100644
> +--- a/absl/copts/GENERATED_AbseilCopts.cmake
> ++++ b/absl/copts/GENERATED_AbseilCopts.cmake
> +@@ -230,7 +230,3 @@ list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
> +     "/Ob2"
> + )
> +
> +-list(APPEND ABSL_RANDOM_HWAES_X64_FLAGS
> +-    "-maes"
> +-    "-msse4.1"
> +-)
> +diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
> +index 82f332f..9a548d1 100644
> +--- a/absl/copts/GENERATED_copts.bzl
> ++++ b/absl/copts/GENERATED_copts.bzl
> +@@ -231,7 +231,3 @@ ABSL_RANDOM_HWAES_MSVC_X64_FLAGS = [
> +     "/Ob2",
> + ]
> +
> +-ABSL_RANDOM_HWAES_X64_FLAGS = [
> +-    "-maes",
> +-    "-msse4.1",
> +-]
> +diff --git a/absl/copts/copts.py b/absl/copts/copts.py
> +index 068abce..c2f70fb 100644
> +--- a/absl/copts/copts.py
> ++++ b/absl/copts/copts.py
> +@@ -203,10 +203,6 @@ COPT_VARS = {
> +     # to improve performance of some random bit generators.
> +     "ABSL_RANDOM_HWAES_ARM64_FLAGS": ["-march=armv8-a+crypto"],
> +     "ABSL_RANDOM_HWAES_ARM32_FLAGS": ["-mfpu=neon"],
> +-    "ABSL_RANDOM_HWAES_X64_FLAGS": [
> +-        "-maes",
> +-        "-msse4.1",
> +-    ],
> +     "ABSL_RANDOM_HWAES_MSVC_X64_FLAGS": [
> +         "/O2",  # Maximize speed
> +         "/Ob2",  # Aggressive inlining
> +--
> +2.23.0
> +
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> new file mode 100644
> index 0000000000..5090dc9fae
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "Abseil is a cpp library like STL"
> +DESCRIPTION = "Abseil provides pieces missing from the C++ standard. Contains \
> +additional useful libraries like algorithm, container, debugging, hash, memory, \
> +meta, numeric, strings, synchronization, time, types and utility"
> +HOMEPAGE = "https://abseil.io/"
> +SECTION = "libs"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
> +
> +SRCREV = "aa844899c937bde5d2b24f276b59997e5b668bde"
> +BRANCH = "lts_2019_08_08"
> +SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
> +           file://0001-Remove-maes-option-from-cross-compilation.patch \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'aarch64', ' -march=armv8-a+crypto', '', d)}"

This cannot be enforced, as it would break those AArch64 derivatives,
which does not have Crypto extension. See my comment above, where I
extracted 2 sets of tune features for Cortex-A53. That means that
there are SoCs there from different vendors, and some vendors decided
to license Crypto extensions from ARM to include it in their RTL, but
some opted out to save either space on a die or cost of the processor.

If you would base your build with '+crypto' unconditionally, then the
binary would segfault on those SoCs which has Crypto opted out.

Moreover, enabling crypto extension in GCC automatically enables
inlined NEON and VFP opcodes (see [1]), and there are more side
effects to be expected on those SOCs which does not have those
integrated.

> +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes -msse4.1', '', d)}"
> +
> +CXXFLAGS_append = " -fPIC"
> +ASNEEDED_class-native = ""
> +ASNEEDED_class-nativesdk = ""
> +
> +inherit cmake
> +
> +BBCLASSEXTEND = "native nativesdk"
> +ALLOW_EMPTY_${PN} = "1"
> +
> +python () {
> +    arch = d.getVar("TARGET_ARCH")
> +
> +    if arch == "aarch64":
> +        tunes = d.getVar("TUNE_FEATURES")
> +        if not tunes:
> +            return
> +        pkgn = d.getVar("PN")
> +        pkgv = d.getVar("PV")
> +        if "crypto" not in tunes:
> +            raise bb.parse.SkipPackage("%s-%s Needs support for crypto on armv8" % (pkgn, pkgv))
> +}
> +
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

[1]: https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html#aarch64-feature-modifiers


-- 
Regards,
Andrey.

