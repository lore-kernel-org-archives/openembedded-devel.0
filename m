Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A02160B10
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 07:54:17 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id o18so1757961qvf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Feb 2020 23:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eHAOxRCbUU+GPr4NXjVcNZowoHnWXHY0LQv6qG/J2KQ=;
	b=Mh/yDXJtfcCtai/xrYQKs7xlizG6w3bfX3/IfEH0VzrnXPkzzC0feFUiz5lL4eR9wC
	4HVvISS51UqJAGgfr6skBvGEyVuci73c+6AC+8xctHNIqYlUSTK9OahAbo4EP05dTyBr
	NGQEqdvbVxl4tA/O7kXzoyy14p45qy5UpXKpLBS8sCNVY1jbdh+/xJ8sxv6W2ruUeVsU
	/2vInF8ku3NnhEa7wRNntmNkwIiKd8WzwmFPjeUqa2gMXqx6fam/WUybTVIe+RMhW7xZ
	KZ1K1o9SOGJid0i6uMAaXJjPgMNtE2xvLHegb9i6AJ1lqQEH24Evjo8kGa5bzApy5UgR
	OE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eHAOxRCbUU+GPr4NXjVcNZowoHnWXHY0LQv6qG/J2KQ=;
	b=KelGsnh+SqKpbOohFriBiwTfQogpdIRP85Ry/qXqr/496l9ypXDWZZ1R2DinevuI2y
	UqXwmQCR+pbXtap2XHxqeBwS85T+QC8IoRD6mwBSLhSEtMGwuSzvl6MgtCt3eWMcwmUB
	ML46zkh94nq/1wPiJtAj2XfvDNwMvLwVuDCNYvcFUMtb02PBcqPKuNadYlc8pfiFvLkh
	nVTUmxaBAoH/2O80OfPd84REWlUUQfhwPCkgZjX6EEZGRMtY+OYEEMFnz0y2a36ok9Op
	Mao227WFkU5tXLOdusqIrIdFa9kPUINmBTcuUw6+H2POiWWUlMdH5XSqKwm04E8eQ6l7
	x5BA==
X-Gm-Message-State: APjAAAVeqk0IHQM40rEfe8vBdc6VTb02grjjqaMw2d+O68yFbOFONbpx
	gnAnNle73Swr6J+D8wpN8CxPZEiqzriQQKsn4K4=
X-Google-Smtp-Source: APXvYqxUA2NsuamY1VUvWe8+WMC+CRuUQatZTd9tLc5xxfHnuBCWBZ20T4ei3XiuqU9FUyXH+SvAMDpjlwgiiuvWkeY=
X-Received: by 2002:a0c:8605:: with SMTP id p5mr5453881qva.109.1581234857908; 
	Sat, 08 Feb 2020 23:54:17 -0800 (PST)
MIME-Version: 1.0
References: <20200209034641.19378-1-okaya@kernel.org>
In-Reply-To: <20200209034641.19378-1-okaya@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 8 Feb 2020 23:53:51 -0800
Message-ID: <CAMKF1sorVApNQ69i3QOUiK6yF1gCvubzNvT=VMkjPcFtK+XC+w@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyi Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Sun, 09 Feb 2020 07:54:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 8, 2020 at 7:56 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> The repository contains the Abseil C++ library code. Abseil is an
> open-source collection of C++ code (compliant to C++11) designed to
> augment the C++ standard library.
>
> https://github.com/abseil/abseil-cpp
>
> Signed-off-by: Changyi Li <Changyu.Li@microsoft.com>
> Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
> ---
>  ...e-maes-option-from-cross-compilation.patch | 53 +++++++++++++++++++
>  .../abseil-cpp/abseil-cpp_git.bb              | 27 ++++++++++
>  2 files changed, 80 insertions(+)
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
> index 0000000000..c7077c129f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "Abseil is a cpp library like STL"
> +DESCRIPTION = "It's got containers, algorithms, useful stuff!"

maybe we can be more specific about it from
https://github.com/abseil/abseil-cpp/blob/master/README.md

> +HOMEPAGE = ""

perhaps https://abseil.io/ instead of leaving it empty is better.

> +SECTION = "libs"
> +LICENSE = "Apache-2"

The current value is not wrong but Apache-2.0 would be better to match SPDX

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
> +TARGET_CXXFLAGS += "${@bb.utils.contains('TARGET_ARCH', 'x64', ' -maes -msse4.1', '', d)}"
> +
> +CXXFLAGS_append_class-nativesdk = " -Wl,--no-as-needed -fPIC"
> +CXXFLAGS_append_class-native = " -Wl,--no-as-needed -fPIC"

perhaps use ASNEEDED_<override> = ""

> +CXXFLAGS_append_class-target = " -fPIC"
> +
> +inherit cmake
> +
> +BBCLASSEXTEND = "native nativesdk"
> +ALLOW_EMPTY_${PN} = "1"

why do we need this ?

