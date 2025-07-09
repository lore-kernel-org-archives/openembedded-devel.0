Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBBCC83F14
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 20:47:07 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.7668.1752094021626954488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 13:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+YHzzhL;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-879d2e419b9so339747a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752094021; x=1752698821; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrx3KGrWbNBgRg4jMpnb9tzdeTQskiL/9/n86iwU61g=;
        b=Z+YHzzhLBUbsCITAhQKzBPMZdOh0/nUNVYHl3W6F7YHnSt5zf+vco6C52dUJbCrpMz
         G8sDZSLHNKcN7eHNAvt0GshroVw8ZFiy8PHITPrUa/NYa8wLHV7Qw+q+kbv2vrSfAKkT
         McnX/V2f3KB21tUpXd4cmwsb3ExZpLFWomsHGuboVceONuj/CXROXgJwVJfB0I42CKGD
         GVJUtKB768oubDgSmJMdqTHSgPqn74NJdJ/nxlOWSx1FXEewTL7KBuLFdgQYJ7ikG8uE
         JqFLNh16+1Z+/H1uaOIdY4yayjS0yuN90oxZ1J+rfFmWzjLpUv0OGD0M2l/qY3smOfB7
         ylXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752094021; x=1752698821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrx3KGrWbNBgRg4jMpnb9tzdeTQskiL/9/n86iwU61g=;
        b=EoO/86OPq2Kie1DWlnom8A9rGbH99jLpoNL5cF9HOgjrH4/VlTQQxsrUyMgxkAu7X8
         Z02z0NXamNbsX+Hi43Lzg1n7TJd6yuLYdY3Jr8xs1+8JNvlrnGBQOFIrdllfkgjt5zo7
         cYyt4i0uchowp64WYgTtSxIx304AB7mQuCwChMBORvHkC+c502YkwWgsnG4jMe8ntPub
         1iY3diXm1PDMm83/zGcNlYF6K7ITzCJOZxufdTqTQhnIMYaAYvPqI4bWY/X1WGC3vNiM
         TElzTwaRY4gc5cJhO7ebJfp/zJifKEbxOTJ38O1VXs45W56dlgHoOSG0i0uve6bqlrcv
         ePag==
X-Gm-Message-State: AOJu0YxgFedfDoPRPi/dqZ+KLb1SNUdFujKgijWZPhPEXUCcZjSqThaV
	Jic2VGc0PBvT1fIFKn4qmyYArzIJX2aOmRXuhexpW1Nv9F7/zHjlXp1ppt1Bgp4RFdLeUplUFbq
	Pf5GhOSyyr46FqLz4wEhd9qm82FMcMgk=
X-Gm-Gg: ASbGncu9yVRFg2cF/LTDisBvqoBGMhULcvS3uiLMvyRYhEAwi6hQes8K3GMDXClZ2md
	RJYd7pxSB065itMDHNEQbEsxt0YQoJQwX9RX6uj8dqkpNjIbnsQnFhozfzMrcv34ahM/aX4Ihe9
	ukQ2yO5/KFcZYG3hOrZ5is++paWwitfX1MjfiJF14suyM=
X-Google-Smtp-Source: AGHT+IEjfcMi3fD/9eQD21TVr5IWKD7/LordumBHsU3KHqniATvaV782E+fC2ZnQ9w4c5qFJFcFyl9YQqAzll01+IY4=
X-Received: by 2002:a17:90b:2752:b0:311:b0d3:85d with SMTP id
 98e67ed59e1d1-31c2fccda71mr6266480a91.2.1752094020705; Wed, 09 Jul 2025
 13:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-18-alperyasinak1@gmail.com> <ac940ffa-c809-40a3-bdc3-e57286df03c4@gmail.com>
In-Reply-To: <ac940ffa-c809-40a3-bdc3-e57286df03c4@gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Wed, 9 Jul 2025 23:46:47 +0300
X-Gm-Features: Ac12FXxbdiWdrwvizl_6uZHP8BPMXQzOJiMsUANuUYC7UdjL8JcxjY8sFZX7rKY
Message-ID: <CAGpma=5qgXiAmSTKjD66Ufs-K4d=gjXSgk7u3pkUoHdVWNaKFQ@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 18/20] microsoft-gsl: Upgrade
 4.0.0 -> 4.2.0 to allow CMake 4+ compatibility
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 20:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118384

Sent a v2 patch ->
https://lists.openembedded.org/g/openembedded-devel/message/118383

Khem Raj <raj.khem@gmail.com>, 9 Tem 2025 =C3=87ar, 19:08 tarihinde =C5=9Fu=
nu yazd=C4=B1:
>
> this fails to build with clang
>
> https://errors.yoctoproject.org/Errors/Details/869560/
>
> On 7/8/25 12:56 PM, Alper Ak via lists.openembedded.org wrote:
> > - Drop patches because already fixed in newer version
> >
> > Changelog:
> >
> > https://github.com/microsoft/GSL/compare/v4.0.0...v4.2.0
> > https://github.com/microsoft/GSL/releases/tag/v4.2.0
> > https://github.com/microsoft/GSL/releases/tag/v4.1.0
> >
> > Fix:
> >
> > | CMake Error at tests/CMakeLists.txt:1 (cmake_minimum_required):
> > |   Compatibility with CMake < 3.5 has been removed from CMake.
> > |
> > |   Update the VERSION argument <min> value.  Or, use the <min>...<max>=
 syntax
> > |   to tell CMake that the project requires at least <min> but has been=
 updated
> > |   to work with policies introduced by <max> or earlier.
> > |
> > |   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring any=
way.
> > |
> > |
> > | -- Configuring incomplete, errors occurred!
> >
> > Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> > ---
> >   ...0001-Fix-initialization-in-test-1140.patch | 113 -----------------=
-
> >   .../0002-Fix-gcc-build-problem.patch          |  82 -------------
> >   ...eck_cxx_compiler_flag-to-cmake-3.0.2.patch |  53 --------
> >   ...ft-gsl_4.0.0.bb =3D> microsoft-gsl_4.2.0.bb} |   8 +-
> >   4 files changed, 2 insertions(+), 254 deletions(-)
> >   delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-g=
sl/0001-Fix-initialization-in-test-1140.patch
> >   delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-g=
sl/0002-Fix-gcc-build-problem.patch
> >   delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-g=
sl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
> >   rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.0.0.bb=
 =3D> microsoft-gsl_4.2.0.bb} (87%)
> >
> > diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-=
Fix-initialization-in-test-1140.patch b/meta-oe/recipes-devtools/microsoft-=
gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
> > deleted file mode 100644
> > index 84a585d3c5..0000000000
> > --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-ini=
tialization-in-test-1140.patch
> > +++ /dev/null
> > @@ -1,113 +0,0 @@
> > -From 1b4d42ca2e97061042ec44a0b34ceb176c78c7e1 Mon Sep 17 00:00:00 2001
> > -From: d-winsor <danwin@microsoft.com>
> > -Date: Mon, 26 Feb 2024 13:17:12 -0800
> > -Subject: [PATCH] Fix initialization in test (#1140)
> > -
> > -* Suppress unsafe-buffer-usage
> > -
> > -Upstream-Status: Backport [https://github.com/microsoft/GSL/commit/1b4=
d42ca2e97061042ec44a0b34ceb176c78c7e1]
> > -
> > -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ----
> > - include/gsl/span     | 10 ++++++++++
> > - include/gsl/util     | 10 ++++++++++
> > - tests/CMakeLists.txt | 10 ++++++++++
> > - tests/span_tests.cpp |  2 +-
> > - 4 files changed, 31 insertions(+), 1 deletion(-)
> > -
> > -diff --git a/include/gsl/span b/include/gsl/span
> > -index cc8a7b9..d254e4d 100644
> > ---- a/include/gsl/span
> > -+++ b/include/gsl/span
> > -@@ -58,6 +58,12 @@
> > - #pragma GCC diagnostic ignored "-Wsign-conversion"
> > - #endif
> > -
> > -+// Turn off clang unsafe buffer warnings as all accessed are guarded =
by runtime checks
> > -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#pragma clang diagnostic push
> > -+#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> > -+#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage"=
)
> > -+
> > - namespace gsl
> > - {
> > -
> > -@@ -818,4 +824,8 @@ as_writable_bytes(span<ElementType, Extent> s) noe=
xcept
> > - #pragma GCC diagnostic pop
> > - #endif // __GNUC__ > 6
> > -
> > -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#pragma clang diagnostic pop
> > -+#endif
> > -+
> > - #endif // GSL_SPAN_H
> > -diff --git a/include/gsl/util b/include/gsl/util
> > -index a215bad..11735a8 100644
> > ---- a/include/gsl/util
> > -+++ b/include/gsl/util
> > -@@ -39,6 +39,12 @@
> > -
> > - #endif // _MSC_VER
> > -
> > -+// Turn off clang unsafe buffer warnings as all accessed are guarded =
by runtime checks
> > -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#pragma clang diagnostic push
> > -+#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> > -+#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage"=
)
> > -+
> > - #if defined(__cplusplus) && (__cplusplus >=3D 201703L)
> > - #define GSL_NODISCARD [[nodiscard]]
> > - #else
> > -@@ -157,4 +163,8 @@ constexpr auto at(std::span<T, extent> sp, const i=
ndex i) -> decltype(sp[sp.size
> > -
> > - #endif // _MSC_VER
> > -
> > -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#pragma clang diagnostic pop
> > -+#endif
> > -+
> > - #endif // GSL_UTIL_H
> > -diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> > -index cab4e56..20de9e1 100644
> > ---- a/tests/CMakeLists.txt
> > -+++ b/tests/CMakeLists.txt
> > -@@ -167,6 +167,11 @@ else()
> > -         >
> > -     )
> > - endif(MSVC)
> > -+check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER=
)
> > -+if (WARN_UNSAFE_BUFFER)
> > -+  # This test uses very greedy heuristics such as "no pointer arithme=
tic on raw buffer"
> > -+  target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buff=
er-usage")
> > -+endif()
> > -
> > - # for tests to find the gtest header
> > - target_include_directories(gsl_tests_config SYSTEM INTERFACE
> > -@@ -267,6 +272,11 @@ else()
> > -         >
> > -     )
> > - endif(MSVC)
> > -+check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER=
)
> > -+if (WARN_UNSAFE_BUFFER)
> > -+  # This test uses very greedy heuristics such as "no pointer arithme=
tic on raw buffer"
> > -+  target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-un=
safe-buffer-usage")
> > -+endif()
> > -
> > - add_executable(gsl_noexcept_tests no_exception_ensure_tests.cpp)
> > - target_link_libraries(gsl_noexcept_tests
> > -diff --git a/tests/span_tests.cpp b/tests/span_tests.cpp
> > -index 33ccf56..3c1dfe5 100644
> > ---- a/tests/span_tests.cpp
> > -+++ b/tests/span_tests.cpp
> > -@@ -330,7 +330,7 @@ TEST(span_test, from_array_constructor)
> > -         EXPECT_TRUE(s.data() =3D=3D std::addressof(arr2d[0]));
> > -     }
> > -
> > --    int arr3d[2][3][2] =3D {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
> > -+    int arr3d[2][3][2] =3D { { {1, 2}, {3, 4}, {5, 6} }, { {7, 8}, {9=
, 10}, {11, 12} } };
> > -
> > - #ifdef CONFIRM_COMPILATION_ERRORS
> > -     {
> > ---
> > -2.30.2
> > -
> > diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-=
Fix-gcc-build-problem.patch b/meta-oe/recipes-devtools/microsoft-gsl/micros=
oft-gsl/0002-Fix-gcc-build-problem.patch
> > deleted file mode 100644
> > index 2f7542c62c..0000000000
> > --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc=
-build-problem.patch
> > +++ /dev/null
> > @@ -1,82 +0,0 @@
> > -From aa4fd1f57794964640005900c2b47af1a0940b7b Mon Sep 17 00:00:00 2001
> > -From: Werner Henze <w.henze@avm.de>
> > -Date: Fri, 1 Mar 2024 15:53:50 +0100
> > -Subject: [PATCH] Fix gcc build problem
> > -
> > -Closes issue #1148 by fixing problems introduced in PR #1140.
> > -
> > -Upstream-Status: Submitted [https://github.com/microsoft/GSL/pull/1149=
]
> > -
> > -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ----
> > - include/gsl/span | 12 ++++++++----
> > - include/gsl/util | 12 ++++++++----
> > - 2 files changed, 16 insertions(+), 8 deletions(-)
> > -
> > -diff --git a/include/gsl/span b/include/gsl/span
> > -index 0de2932..d2ef9f7 100644
> > ---- a/include/gsl/span
> > -+++ b/include/gsl/span
> > -@@ -59,10 +59,12 @@
> > - #endif
> > -
> > - // Turn off clang unsafe buffer warnings as all accessed are guarded =
by runtime checks
> > --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#if defined(__clang__)
> > -+#if __has_warning("-Wunsafe-buffer-usage")
> > - #pragma clang diagnostic push
> > - #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> > --#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage"=
)
> > -+#endif // __has_warning("-Wunsafe-buffer-usage")
> > -+#endif // defined(__clang__)
> > -
> > - namespace gsl
> > - {
> > -@@ -824,8 +826,10 @@ as_writable_bytes(span<ElementType, Extent> s) no=
except
> > - #pragma GCC diagnostic pop
> > - #endif // __GNUC__ > 6
> > -
> > --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#if defined(__clang__)
> > -+#if __has_warning("-Wunsafe-buffer-usage")
> > - #pragma clang diagnostic pop
> > --#endif
> > -+#endif // __has_warning("-Wunsafe-buffer-usage")
> > -+#endif // defined(__clang__)
> > -
> > - #endif // GSL_SPAN_H
> > -diff --git a/include/gsl/util b/include/gsl/util
> > -index b853017..26b2f5f 100644
> > ---- a/include/gsl/util
> > -+++ b/include/gsl/util
> > -@@ -40,10 +40,12 @@
> > - #endif // _MSC_VER
> > -
> > - // Turn off clang unsafe buffer warnings as all accessed are guarded =
by runtime checks
> > --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#if defined(__clang__)
> > -+#if __has_warning("-Wunsafe-buffer-usage")
> > - #pragma clang diagnostic push
> > - #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> > --#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage"=
)
> > -+#endif // __has_warning("-Wunsafe-buffer-usage")
> > -+#endif // defined(__clang__)
> > -
> > - #if defined(__cplusplus) && (__cplusplus >=3D 201703L)
> > - #define GSL_NODISCARD [[nodiscard]]
> > -@@ -163,8 +165,10 @@ constexpr auto at(std::span<T, extent> sp, const =
index i) -> decltype(sp[sp.size
> > -
> > - #endif // _MSC_VER
> > -
> > --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> > -+#if defined(__clang__)
> > -+#if __has_warning("-Wunsafe-buffer-usage")
> > - #pragma clang diagnostic pop
> > --#endif
> > -+#endif // __has_warning("-Wunsafe-buffer-usage")
> > -+#endif // defined(__clang__)
> > -
> > - #endif // GSL_UTIL_H
> > ---
> > -2.30.2
> > -
> > diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-=
Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch b/meta-oe/recipes-devtoo=
ls/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-=
3.0.2.patch
> > deleted file mode 100644
> > index ed057f5243..0000000000
> > --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-c=
heck_cxx_compiler_flag-to-cmake-3.0.2.patch
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -From 85e1c38bcf84bd4e2ce63ef74f0cfa1f5e92261e Mon Sep 17 00:00:00 2001
> > -From: Peter Marko <peter.marko@siemens.com>
> > -Date: Wed, 27 Mar 2024 23:46:31 +0100
> > -Subject: [PATCH] Adapt check_cxx_compiler_flag to cmake 3.0.2
> > -
> > -Backporting commits which are upgrading cmake_minimum_required and
> > -include check_cxx_compiler_flag have too many additional changes.
> > -
> > -Let's just do a simple adaptation of our backported patch so
> > -it works with older cmake version instead.
> > -
> > -This can be safely removed when recipe version is upgraded.
> > -
> > -Upstream-Status: Inappropriate
> > -
> > -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ----
> > - tests/CMakeLists.txt | 5 +++--
> > - 1 file changed, 3 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> > -index 20de9e1..54c3ac5 100644
> > ---- a/tests/CMakeLists.txt
> > -+++ b/tests/CMakeLists.txt
> > -@@ -5,6 +5,7 @@ enable_testing()  # again, for support standalone test=
ing
> > -
> > - include(FindPkgConfig)
> > - include(ExternalProject)
> > -+include(CheckCXXCompilerFlag)
> > -
> > - # will make visual studio generated project group files
> > - set_property(GLOBAL PROPERTY USE_FOLDERS ON)
> > -@@ -167,7 +168,7 @@ else()
> > -         >
> > -     )
> > - endif(MSVC)
> > --check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER=
)
> > -+CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER=
)
> > - if (WARN_UNSAFE_BUFFER)
> > -   # This test uses very greedy heuristics such as "no pointer arithme=
tic on raw buffer"
> > -   target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buff=
er-usage")
> > -@@ -272,7 +273,7 @@ else()
> > -         >
> > -     )
> > - endif(MSVC)
> > --check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER=
)
> > -+CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER=
)
> > - if (WARN_UNSAFE_BUFFER)
> > -   # This test uses very greedy heuristics such as "no pointer arithme=
tic on raw buffer"
> > -   target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-un=
safe-buffer-usage")
> > ---
> > -2.30.2
> > -
> > diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0=
.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
> > similarity index 87%
> > rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.=
bb
> > rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
> > index 2fbbf8f06a..610c45a298 100644
> > --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> > +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
> > @@ -9,13 +9,9 @@ LICENSE =3D "MIT"
> >   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D363055e71e77071107ba2bb9a5=
4bd9a7"
> >
> >   SRC_URI =3D "git://github.com/microsoft/GSL.git;protocol=3Dhttps;bran=
ch=3Dmain \
> > -    file://run-ptest \
> > -    file://0001-Fix-initialization-in-test-1140.patch \
> > -    file://0002-Fix-gcc-build-problem.patch \
> > -    file://0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch \
> > +        file://run-ptest \
> >   "
> > -SRCREV =3D "a3534567187d2edc428efd3f13466ff75fe5805c"
> > -
> > +SRCREV =3D "2828399820ef4928cc89b65605dca5dc68efca6e"
> >
> >   inherit cmake pkgconfig ptest
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#118340): https://lists.openembedded.org/g/openembed=
ded-devel/message/118340
> > Mute This Topic: https://lists.openembedded.org/mt/114053267/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

