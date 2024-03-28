Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54161C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 04:32:56 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.8257.1711600370462234635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Mar 2024 21:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SNLm30Bf;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-22a1e72f683so378550fac.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Mar 2024 21:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711600369; x=1712205169; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDCZvaGQil71lhXIpuNSZicg6Pt9w2yq1+sykauJXhg=;
        b=SNLm30BfT2C66XKcp6IjQLwO5ojzTdz0M1WlWa7QIyjokDU3H01juEsanxB0el5jPy
         0P8lMzxvriXuTZkTrIBlR9mEidudbzocQTisae2hm4xSWh364FcL+V/i1JwltWgUa3/e
         jInQxvYM+KAVF5lEQM5ijxRXVpm0Em3DiEL29v4zhChMz0M1mXakz6PyYvrcdLqvjK7m
         Sb9Q4Ymn/Im1CQNgm263j6gYnWdYnyAoGZ1gb6H92HaXlFx2zgPaBAqCDTe8/AVEEjau
         T1UDQfORTuP33GJEdXVUF0kNcGki7l/ncPeKbV01ROzv79pIkHFHVAfEufefnTAPGvWp
         ZLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711600369; x=1712205169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDCZvaGQil71lhXIpuNSZicg6Pt9w2yq1+sykauJXhg=;
        b=svu+7sliGvFs0v6BT/jUaPilJnt/Lt+l+CxI/ZV1AkSmCx2pP41mWIncktvGYM4alF
         pSqtRMlhUorAF0nnNUrq4DITbaoCyl36dyvI61gyTJHNiwmyBDXIK/Z1NOQja53EyJJN
         dsczdmWD99XAmPBs5auR03O8L1zAGKS1A3Sogiii3kSGKRNGpm2636iJwLCcDiA9nluy
         5hOw7n3csLsVsERa2IBFkyimNNMMUVjKpkQ4UQ5ONsdcICsSLktdzvq/5khT1QJPlbhn
         cKIMYTOs7jzISVSj+r9eCyVxTiVRlbUmy7QscdvvT5BLl2ZXscH1CAN3VjN5yXdzMT6M
         lvjQ==
X-Gm-Message-State: AOJu0YxrqBT5z0SRGpiJZDw9nI4MteYzmrOttC1YPfh7rMlbS541+EZ8
	rcck1CnRRtsRM+kMCBcvdQTQz2+OQPyC7O6052R3+Glcgcz4Eyew81JSXA7kSQY8oT1iwb2Xwcc
	SRfohEcPdCZG4o3wU1u+8SFPsCtQ=
X-Google-Smtp-Source: AGHT+IHVvWpn0StBtGag9o8AfuYzhvRP4Ix/+a1IiMrTZwxuBtNjF6CRhI7/oOZ7aYEemz3uC69znTyV8J/HCE3nJ0k=
X-Received: by 2002:a05:6870:a50a:b0:229:fe3c:b096 with SMTP id
 o10-20020a056870a50a00b00229fe3cb096mr1818447oal.32.1711600368801; Wed, 27
 Mar 2024 21:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so8Zc4w9WuD94+H360HJtnYmG_Qt50cPh8BdB+LxdKN3Q@mail.gmail.com>
 <20240327230647.694952-1-peter.marko@siemens.com>
In-Reply-To: <20240327230647.694952-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Mar 2024 21:32:22 -0700
Message-ID: <CAMKF1sq8PuRhJHV9=k_C5jtn7DZXYFD-ExX3M_2dP0DGCytT2w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] microsoft-gsl: add new recipe including ptest
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 04:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109651

Thanks for reworking the patch, there however is still one error
popping up when ptests distro feature is enabled

https://snips.sh/f/bftvz4ANO6

This patch fixes it, but I would like to see if this warning is
already fixed or can be fixed.

https://snips.sh/f/pRVar8hlif

On Wed, Mar 27, 2024 at 4:07=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> The Guidelines Support Library (GSL) contains functions
> and types that are suggested for use by the C++ Core Guidelines
> maintained by the Standard C++ Foundation.
> This repo contains Microsoft's implementation of GSL.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> v2: adapt conditional ptest clauses per review comments
> v3: fix clang build
>
>  .../include/ptest-packagelists-meta-oe.inc    |   1 +
>  .../packagegroups/packagegroup-meta-oe.bb     |   1 +
>  ...0001-Fix-initialization-in-test-1140.patch | 113 ++++++++++++++++++
>  .../0002-Fix-gcc-build-problem.patch          |  82 +++++++++++++
>  ...eck_cxx_compiler_flag-to-cmake-3.0.2.patch |  53 ++++++++
>  .../microsoft-gsl/microsoft-gsl/run-ptest     |   4 +
>  .../microsoft-gsl/microsoft-gsl_4.0.0.bb      |  43 +++++++
>  7 files changed, 297 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/=
0001-Fix-initialization-in-test-1140.patch
>  create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/=
0002-Fix-gcc-build-problem.patch
>  create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/=
0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
>  create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/=
run-ptest
>  create mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_=
4.0.0.bb
>
> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
> index fadec1221..70e5dad08 100644
> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
> @@ -27,6 +27,7 @@ PTESTS_FAST_META_OE =3D "\
>      libxml++-5.0 \
>      libyang \
>      lmdb \
> +    microsoft-gsl \
>      minicoredumper \
>      neon \
>      nlohmann-json \
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index 6e2012dae..bc15373b6 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -310,6 +310,7 @@ RDEPENDS:packagegroup-meta-oe-devtools =3D"\
>      yasm \
>      json-schema-validator \
>      poke \
> +    microsoft-gsl \
>  "
>  RDEPENDS:packagegroup-meta-oe-devtools:append:x86 =3D " cpuid msr-tools =
pahole pmtools"
>  RDEPENDS:packagegroup-meta-oe-devtools:append:x86-64 =3D " cpuid msr-too=
ls pahole pcimem pmtools"
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fi=
x-initialization-in-test-1140.patch b/meta-oe/recipes-devtools/microsoft-gs=
l/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
> new file mode 100644
> index 000000000..84a585d3c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initi=
alization-in-test-1140.patch
> @@ -0,0 +1,113 @@
> +From 1b4d42ca2e97061042ec44a0b34ceb176c78c7e1 Mon Sep 17 00:00:00 2001
> +From: d-winsor <danwin@microsoft.com>
> +Date: Mon, 26 Feb 2024 13:17:12 -0800
> +Subject: [PATCH] Fix initialization in test (#1140)
> +
> +* Suppress unsafe-buffer-usage
> +
> +Upstream-Status: Backport [https://github.com/microsoft/GSL/commit/1b4d4=
2ca2e97061042ec44a0b34ceb176c78c7e1]
> +
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + include/gsl/span     | 10 ++++++++++
> + include/gsl/util     | 10 ++++++++++
> + tests/CMakeLists.txt | 10 ++++++++++
> + tests/span_tests.cpp |  2 +-
> + 4 files changed, 31 insertions(+), 1 deletion(-)
> +
> +diff --git a/include/gsl/span b/include/gsl/span
> +index cc8a7b9..d254e4d 100644
> +--- a/include/gsl/span
> ++++ b/include/gsl/span
> +@@ -58,6 +58,12 @@
> + #pragma GCC diagnostic ignored "-Wsign-conversion"
> + #endif
> +
> ++// Turn off clang unsafe buffer warnings as all accessed are guarded by=
 runtime checks
> ++#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#pragma clang diagnostic push
> ++#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> ++#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++
> + namespace gsl
> + {
> +
> +@@ -818,4 +824,8 @@ as_writable_bytes(span<ElementType, Extent> s) noexc=
ept
> + #pragma GCC diagnostic pop
> + #endif // __GNUC__ > 6
> +
> ++#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#pragma clang diagnostic pop
> ++#endif
> ++
> + #endif // GSL_SPAN_H
> +diff --git a/include/gsl/util b/include/gsl/util
> +index a215bad..11735a8 100644
> +--- a/include/gsl/util
> ++++ b/include/gsl/util
> +@@ -39,6 +39,12 @@
> +
> + #endif // _MSC_VER
> +
> ++// Turn off clang unsafe buffer warnings as all accessed are guarded by=
 runtime checks
> ++#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#pragma clang diagnostic push
> ++#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> ++#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++
> + #if defined(__cplusplus) && (__cplusplus >=3D 201703L)
> + #define GSL_NODISCARD [[nodiscard]]
> + #else
> +@@ -157,4 +163,8 @@ constexpr auto at(std::span<T, extent> sp, const ind=
ex i) -> decltype(sp[sp.size
> +
> + #endif // _MSC_VER
> +
> ++#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#pragma clang diagnostic pop
> ++#endif
> ++
> + #endif // GSL_UTIL_H
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index cab4e56..20de9e1 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -167,6 +167,11 @@ else()
> +         >
> +     )
> + endif(MSVC)
> ++check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> ++if (WARN_UNSAFE_BUFFER)
> ++  # This test uses very greedy heuristics such as "no pointer arithmeti=
c on raw buffer"
> ++  target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buffer=
-usage")
> ++endif()
> +
> + # for tests to find the gtest header
> + target_include_directories(gsl_tests_config SYSTEM INTERFACE
> +@@ -267,6 +272,11 @@ else()
> +         >
> +     )
> + endif(MSVC)
> ++check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> ++if (WARN_UNSAFE_BUFFER)
> ++  # This test uses very greedy heuristics such as "no pointer arithmeti=
c on raw buffer"
> ++  target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-unsa=
fe-buffer-usage")
> ++endif()
> +
> + add_executable(gsl_noexcept_tests no_exception_ensure_tests.cpp)
> + target_link_libraries(gsl_noexcept_tests
> +diff --git a/tests/span_tests.cpp b/tests/span_tests.cpp
> +index 33ccf56..3c1dfe5 100644
> +--- a/tests/span_tests.cpp
> ++++ b/tests/span_tests.cpp
> +@@ -330,7 +330,7 @@ TEST(span_test, from_array_constructor)
> +         EXPECT_TRUE(s.data() =3D=3D std::addressof(arr2d[0]));
> +     }
> +
> +-    int arr3d[2][3][2] =3D {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
> ++    int arr3d[2][3][2] =3D { { {1, 2}, {3, 4}, {5, 6} }, { {7, 8}, {9, =
10}, {11, 12} } };
> +
> + #ifdef CONFIRM_COMPILATION_ERRORS
> +     {
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fi=
x-gcc-build-problem.patch b/meta-oe/recipes-devtools/microsoft-gsl/microsof=
t-gsl/0002-Fix-gcc-build-problem.patch
> new file mode 100644
> index 000000000..2f7542c62
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-b=
uild-problem.patch
> @@ -0,0 +1,82 @@
> +From aa4fd1f57794964640005900c2b47af1a0940b7b Mon Sep 17 00:00:00 2001
> +From: Werner Henze <w.henze@avm.de>
> +Date: Fri, 1 Mar 2024 15:53:50 +0100
> +Subject: [PATCH] Fix gcc build problem
> +
> +Closes issue #1148 by fixing problems introduced in PR #1140.
> +
> +Upstream-Status: Submitted [https://github.com/microsoft/GSL/pull/1149]
> +
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + include/gsl/span | 12 ++++++++----
> + include/gsl/util | 12 ++++++++----
> + 2 files changed, 16 insertions(+), 8 deletions(-)
> +
> +diff --git a/include/gsl/span b/include/gsl/span
> +index 0de2932..d2ef9f7 100644
> +--- a/include/gsl/span
> ++++ b/include/gsl/span
> +@@ -59,10 +59,12 @@
> + #endif
> +
> + // Turn off clang unsafe buffer warnings as all accessed are guarded by=
 runtime checks
> +-#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#if defined(__clang__)
> ++#if __has_warning("-Wunsafe-buffer-usage")
> + #pragma clang diagnostic push
> + #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> +-#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#endif // __has_warning("-Wunsafe-buffer-usage")
> ++#endif // defined(__clang__)
> +
> + namespace gsl
> + {
> +@@ -824,8 +826,10 @@ as_writable_bytes(span<ElementType, Extent> s) noex=
cept
> + #pragma GCC diagnostic pop
> + #endif // __GNUC__ > 6
> +
> +-#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#if defined(__clang__)
> ++#if __has_warning("-Wunsafe-buffer-usage")
> + #pragma clang diagnostic pop
> +-#endif
> ++#endif // __has_warning("-Wunsafe-buffer-usage")
> ++#endif // defined(__clang__)
> +
> + #endif // GSL_SPAN_H
> +diff --git a/include/gsl/util b/include/gsl/util
> +index b853017..26b2f5f 100644
> +--- a/include/gsl/util
> ++++ b/include/gsl/util
> +@@ -40,10 +40,12 @@
> + #endif // _MSC_VER
> +
> + // Turn off clang unsafe buffer warnings as all accessed are guarded by=
 runtime checks
> +-#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#if defined(__clang__)
> ++#if __has_warning("-Wunsafe-buffer-usage")
> + #pragma clang diagnostic push
> + #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> +-#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#endif // __has_warning("-Wunsafe-buffer-usage")
> ++#endif // defined(__clang__)
> +
> + #if defined(__cplusplus) && (__cplusplus >=3D 201703L)
> + #define GSL_NODISCARD [[nodiscard]]
> +@@ -163,8 +165,10 @@ constexpr auto at(std::span<T, extent> sp, const in=
dex i) -> decltype(sp[sp.size
> +
> + #endif // _MSC_VER
> +
> +-#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> ++#if defined(__clang__)
> ++#if __has_warning("-Wunsafe-buffer-usage")
> + #pragma clang diagnostic pop
> +-#endif
> ++#endif // __has_warning("-Wunsafe-buffer-usage")
> ++#endif // defined(__clang__)
> +
> + #endif // GSL_UTIL_H
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Ad=
apt-check_cxx_compiler_flag-to-cmake-3.0.2.patch b/meta-oe/recipes-devtools=
/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.=
0.2.patch
> new file mode 100644
> index 000000000..ed057f524
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-che=
ck_cxx_compiler_flag-to-cmake-3.0.2.patch
> @@ -0,0 +1,53 @@
> +From 85e1c38bcf84bd4e2ce63ef74f0cfa1f5e92261e Mon Sep 17 00:00:00 2001
> +From: Peter Marko <peter.marko@siemens.com>
> +Date: Wed, 27 Mar 2024 23:46:31 +0100
> +Subject: [PATCH] Adapt check_cxx_compiler_flag to cmake 3.0.2
> +
> +Backporting commits which are upgrading cmake_minimum_required and
> +include check_cxx_compiler_flag have too many additional changes.
> +
> +Let's just do a simple adaptation of our backported patch so
> +it works with older cmake version instead.
> +
> +This can be safely removed when recipe version is upgraded.
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + tests/CMakeLists.txt | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> +index 20de9e1..54c3ac5 100644
> +--- a/tests/CMakeLists.txt
> ++++ b/tests/CMakeLists.txt
> +@@ -5,6 +5,7 @@ enable_testing()  # again, for support standalone testin=
g
> +
> + include(FindPkgConfig)
> + include(ExternalProject)
> ++include(CheckCXXCompilerFlag)
> +
> + # will make visual studio generated project group files
> + set_property(GLOBAL PROPERTY USE_FOLDERS ON)
> +@@ -167,7 +168,7 @@ else()
> +         >
> +     )
> + endif(MSVC)
> +-check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> ++CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> + if (WARN_UNSAFE_BUFFER)
> +   # This test uses very greedy heuristics such as "no pointer arithmeti=
c on raw buffer"
> +   target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buffer=
-usage")
> +@@ -272,7 +273,7 @@ else()
> +         >
> +     )
> + endif(MSVC)
> +-check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> ++CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> + if (WARN_UNSAFE_BUFFER)
> +   # This test uses very greedy heuristics such as "no pointer arithmeti=
c on raw buffer"
> +   target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-unsa=
fe-buffer-usage")
> +--
> +2.30.2
> +
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-pte=
st b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
> new file mode 100644
> index 000000000..2d5bdf4ff
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/run-ptest
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +
> +gsl_tests && echo "PASS: gsl_tests" || echo "FAIL: gsl_tests"
> +gsl_noexcept_tests && echo "PASS: gsl_noexcept_tests" || echo "FAIL: gsl=
_noexcept_tests"
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.b=
b b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> new file mode 100644
> index 000000000..7fc31486f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> @@ -0,0 +1,43 @@
> +SUMMARY =3D "GSL: Guidelines Support Library"
> +DESCRIPTION =3D "The Guidelines Support Library (GSL) contains functions=
 \
> +    and types that are suggested for use by the C++ Core Guidelines \
> +    maintained by the Standard C++ Foundation. \
> +    This repo contains Microsoft's implementation of GSL."
> +HOMEPAGE =3D "https://github.com/microsoft/GSL"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D363055e71e77071107ba2bb9a54bd=
9a7"
> +
> +SRC_URI =3D "git://github.com/microsoft/GSL.git;protocol=3Dhttps;branch=
=3Dmain \
> +    file://run-ptest \
> +    file://0001-Fix-initialization-in-test-1140.patch \
> +    file://0002-Fix-gcc-build-problem.patch \
> +    file://0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch \
> +"
> +SRCREV =3D "a3534567187d2edc428efd3f13466ff75fe5805c"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake pkgconfig ptest
> +
> +# this is header-only library
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'ptest',=
'', d)}"
> +PACKAGECONFIG[ptest] =3D "-DGSL_TEST=3DON,-DGSL_TEST=3DOFF,googletest"
> +
> +# clang disagrees with https://github.com/google/googletest/pull/3457
> +CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Dswitch-default"
> +
> +do_install_ptest() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${B}/tests/gsl_tests ${D}${bindir}
> +    install -m 0755 ${B}/tests/gsl_noexcept_tests ${D}${bindir}
> +}
> +
> +FILES:${PN}-ptest =3D "${bindir}/gsl*_tests"
> +
> +# there is already other gsl recipe, so recipe name does not match the r=
eal component name
> +CVE_PRODUCT =3D "microsoft:gsl"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109648): https://lists.openembedded.org/g/openembedde=
d-devel/message/109648
> Mute This Topic: https://lists.openembedded.org/mt/105187719/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

