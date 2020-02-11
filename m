Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B4FC60FDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:46:35 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t26so12453533ioi.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 08:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Da/agg2mb8+LVbnYOQf6LEfRWzRkrjIaBE+0/u1F1ys=;
	b=mwNQD0FFfCRG8jRy2x1Kevdm55K9J5zF3s/y3DYNp1/sbPZwM1Ri07VNPYsZDt6GL3
	Z6ICyMB9YcdgPQfe75dfFQ+pRlOPM6/zUt4YotcgwMLy6d6sQaEv32oimRyz9xqFPVT+
	kZs795cEtLKrXaq7cfkVdrFmiNzV+OyFuW8OQLxj9qK7ASPOodkPQZgKHD3w6Fn4RYkq
	2vVQCSAfS5n8wxo1B0V41OEaLC2oq07o25GFkcBEBQYyUmF938ouHh4iXaurTMy34B+X
	88X/GOuFNEj06XhTtUmNzoK2eb5LcHp4j3SR62ySx2ZTXIhvtGOwrWJWA1Cn6L6ZGK8R
	CAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Da/agg2mb8+LVbnYOQf6LEfRWzRkrjIaBE+0/u1F1ys=;
	b=CmoeZkFgnVsUsgAEqIrHQet0ekH27W+Q3Svzjc9VrudN9BDZR/hAN7kqq+JwQnOm7J
	nb+Q/lM1thIP07ubjmJpMSOI0ZAhmM2IKXxcNZNvkYScBWLZBbcswRLd6c2vmh9b+QO3
	gJv+Cp7aZncn54pPddExx+nPTMfGpHBwUhKWFo+r/7LZdkoIcT3/MAkurchRflGrFJVK
	BjbjnR0F9m4NJ821sawqngHguQvxb5s+ANcnd0k4bS/RQkiGwKPlLccKGzFJkhE3E4nh
	hOPVjdNZM2cDInIEBFGnZgDbVOG4XFZEZGgNGfbEc7frJK35O8pOGtVQFc0zm6Gr0OYs
	5SbQ==
X-Gm-Message-State: APjAAAU4cOpZGk0Q+1WEgFkkak90i0UO2SmDrK/m8Faxxi6eUVmM04PN
	FNiUTmrzbm0PqhLRmly1PrNbRSnc5t3TEprUkxY=
X-Google-Smtp-Source: APXvYqyHIKMkOELRlPZvllkz+PbDiUqo+VvsdIxEB4Ohi1XHQ1ho/NnatdYN42GbueH9VufkIA5zv/aLZMG7JR54hEE=
X-Received: by 2002:a05:6602:242c:: with SMTP id
	g12mr13855363iob.193.1581439595902; 
	Tue, 11 Feb 2020 08:46:35 -0800 (PST)
MIME-Version: 1.0
References: <20200211164101.75963-1-okaya@kernel.org>
In-Reply-To: <20200211164101.75963-1-okaya@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2020 08:46:10 -0800
Message-ID: <CAMKF1sqk0ihBNQV_HhtBaqA-a6_VY_7L1QVxQg=SPZtHFSrnig@mail.gmail.com>
To: Sinan Kaya <okaya@kernel.org>
Cc: Sinan Kaya <sinan.kaya@microsoft.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Changyu Li <Changyu.Li@microsoft.com>
Subject: Re: [meta-oe][PATCH v4] abseil-cpp: add recipe for git version
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
X-List-Received-Date: Tue, 11 Feb 2020 16:46:35 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Sinan, this looks good. Although I wonder why do we need to add
-fPIC manually.

On Tue, Feb 11, 2020 at 8:41 AM Sinan Kaya <okaya@kernel.org> wrote:
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
>  ...n-ABSL_HAVE_VDSO_SUPPORT-conditional.patch | 35 ++++++++++++
>  .../abseil-cpp/abseil-cpp_git.bb              | 52 ++++++++++++++++++
>  3 files changed, 140 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Remove-maes-option-from-cross-compilation.patch
>  create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch
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
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch
> new file mode 100644
> index 0000000000..fab4a738ea
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch
> @@ -0,0 +1,35 @@
> +From 9384735383a0b8688e3f05ed23a53f18863eae20 Mon Sep 17 00:00:00 2001
> +From: Sinan Kaya <sinan.kaya@microsoft.com>
> +Date: Tue, 11 Feb 2020 11:36:00 -0500
> +Subject: [PATCH] Add forgotten ABSL_HAVE_VDSO_SUPPORT conditional
> +
> +Signed-off-by: Sinan Kaya <sinan.kaya@microsoft.com>
> +---
> + absl/debugging/internal/stacktrace_x86-inl.inc | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/absl/debugging/internal/stacktrace_x86-inl.inc b/absl/debugging/internal/stacktrace_x86-inl.inc
> +index ff0fd31..28607c3 100644
> +--- a/absl/debugging/internal/stacktrace_x86-inl.inc
> ++++ b/absl/debugging/internal/stacktrace_x86-inl.inc
> +@@ -171,6 +171,7 @@ static void **NextStackFrame(void **old_fp, const void *uc) {
> +     static const unsigned char *kernel_rt_sigreturn_address = nullptr;
> +     static const unsigned char *kernel_vsyscall_address = nullptr;
> +     if (num_push_instructions == -1) {
> ++#ifdef ABSL_HAVE_VDSO_SUPPORT
> +       absl::debugging_internal::VDSOSupport vdso;
> +       if (vdso.IsPresent()) {
> +         absl::debugging_internal::VDSOSupport::SymbolInfo
> +@@ -199,6 +200,9 @@ static void **NextStackFrame(void **old_fp, const void *uc) {
> +       } else {
> +         num_push_instructions = 0;
> +       }
> ++#else
> ++      num_push_instructions = 0;
> ++#endif
> +     }
> +     if (num_push_instructions != 0 && kernel_rt_sigreturn_address != nullptr &&
> +         old_fp[1] == kernel_rt_sigreturn_address) {
> +--
> +2.20.1.windows.1
> +
> diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> new file mode 100644
> index 0000000000..1f7681a563
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
> @@ -0,0 +1,52 @@
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
> +SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}                \
> +           file://0001-Remove-maes-option-from-cross-compilation.patch        \
> +           file://0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch \
> +          "
> +
> +S = "${WORKDIR}/git"
> +
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
> +
> +    if arch == "x86_64":
> +        tunes = d.getVar("TUNE_FEATURES")
> +        if not tunes:
> +            return
> +        pkgn = d.getVar("PN")
> +        pkgv = d.getVar("PV")
> +        if "corei7" not in tunes:
> +            raise bb.parse.SkipPackage("%s-%s Needs support for corei7 on x86_64" % (pkgn, pkgv))
> +
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

