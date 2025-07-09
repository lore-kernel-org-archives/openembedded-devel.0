Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8410CC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 16:08:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.939.1752077307718567593
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 09:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3vU8fJc;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-237e6963f63so281695ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 09:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752077307; x=1752682107; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MiJrdqxazYosBlol0CkTFeBtCa61Fj5tlFoHuO1ZdAQ=;
        b=e3vU8fJcHlzaHMtnIc+fDxxqpeQ53B3xTvAoYY6N+fLntJ2h6xNOv2A6WgvaSgbGjc
         LAb3cMxifvkiT9QwcPgALoozghZUO5pLg2DE5WQwL0LSKTvWCkCsPKMm4zyM1mYIF2/B
         MWJ7BMCnvffvwiEKml5QpA7DyPiZa4l70KZTNczy+ZpmEB+TgLKiQFyMUnBVUA6NvyYh
         ps8d06yXTveglLvtiB1S+AVv0cB4Ftn51q1cuaPvoa5algE0oKse3lZI5R6U3jylhXVi
         yquat8iP/4tWrdw2sicT2OKAMxN6pnvGLmFbPR4XrzL9xAwnirX8VXW4VQxXoLP426tx
         7OJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752077307; x=1752682107;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MiJrdqxazYosBlol0CkTFeBtCa61Fj5tlFoHuO1ZdAQ=;
        b=v0scVk3rw2CKOb4HkobFlZyF0RmHwgiBTo6y3GBYBvav32XxnltP6GOG/PhdvQgxS2
         I+JCABQKdShnSeg6GaX7Nm5iZkxIFWrsbzi51bzhk0ae7ftP8fIegtP1iZp+ap4+HI3X
         Ai4y0L0dVMvXc4A1ofdWCtNWNk6H0pkzbAF1qXi/4qz0RuZvjj0rZ4MDecjr1gOfk6cH
         /UlTDKip8ayzndJf4Q+1S7n+90WpTJiLxghP+0phnJx7CbZlsS6aKiYYAkli9mwb/be4
         V8iRW8qGSxS/qZGj8Q27ON+2/SyORE6m2UqyGk6kUzavmVOJAapYZ1RrsB882HXcWnaV
         7oDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvsNxvt4PkIJghBX2/9i4+eGsnU/lt2mg2RR+53GfwXUAoxGrFuxjl5iqh63uFkJ0i5UCrDccr+AY1pc2dcwqsCng=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxYg6Dl0go3WtD+xQOjNDyxZD1sQ86eGoxgwwikAQe44yxTyoXi
	b0cR8sY/2ESEWzjKMXoIwGjnFPKNLJ8lrbhs9qQEyoAxL2c8+KvgFzXYhV4M7urp
X-Gm-Gg: ASbGncvxBYcE6Hdce7wUlBk2IO3d7pRCST33N0CAwIfzcONjc3t+YIczDl4g36f/1xZ
	FiuuEO/40F6l7nP1taLltMJmgxxyJ14ElaO98SqmNzEK300d0/04Px8tPAIkiVP3+6rAxTMCXEe
	pgXmyF4H+Xr828IYJlQU2sr2NzhcwRpRL+HpBeO0oxY7AMGYb+mJyRdCl7UzLo+oxpk4PFfiCL4
	sF1tp2AotennHengOCT7jwvB1x+Mlv/FC7SL9rcvVwNDfWctDyIm0mtT8u2iGUJDarWJNeJIbwi
	XvCxlSNz4OBZ3+5nRk2Xkf5DIYy0clKhXeVV2t/91brlNzSWq6WqKad70K4M86cikIXhri0qz9q
	B0GSODtnuiVpUcj4Tj2fMGDFqMLNjFfj1LwRQOOO31hidDxqbEw==
X-Google-Smtp-Source: AGHT+IFAbnD+qhlp44lBaNMnAHq1Aa3BtnFYewxUcLHJ+I9jJgp5K5wL5MWI511qbPuOm4wdZbwIZA==
X-Received: by 2002:a17:902:c951:b0:23c:8f17:644c with SMTP id d9443c01a7336-23ddb30e1d1mr51850875ad.35.1752077306745;
        Wed, 09 Jul 2025 09:08:26 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:d1b7:aad6:2c95:a1d8? ([2601:646:8201:fd20:d1b7:aad6:2c95:a1d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e9e1sm150079745ad.175.2025.07.09.09.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 09:08:26 -0700 (PDT)
Message-ID: <ac940ffa-c809-40a3-bdc3-e57286df03c4@gmail.com>
Date: Wed, 9 Jul 2025 09:08:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][PATCH 18/20] microsoft-gsl: Upgrade
 4.0.0 -> 4.2.0 to allow CMake 4+ compatibility
To: alperyasinak1@gmail.com, openembedded-devel@lists.openembedded.org
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
 <20250708195636.1678606-18-alperyasinak1@gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250708195636.1678606-18-alperyasinak1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 16:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118352

this fails to build with clang

https://errors.yoctoproject.org/Errors/Details/869560/

On 7/8/25 12:56 PM, Alper Ak via lists.openembedded.org wrote:
> - Drop patches because already fixed in newer version
> 
> Changelog:
> 
> https://github.com/microsoft/GSL/compare/v4.0.0...v4.2.0
> https://github.com/microsoft/GSL/releases/tag/v4.2.0
> https://github.com/microsoft/GSL/releases/tag/v4.1.0
> 
> Fix:
> 
> | CMake Error at tests/CMakeLists.txt:1 (cmake_minimum_required):
> |   Compatibility with CMake < 3.5 has been removed from CMake.
> |
> |   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
> |   to tell CMake that the project requires at least <min> but has been updated
> |   to work with policies introduced by <max> or earlier.
> |
> |   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
> |
> |
> | -- Configuring incomplete, errors occurred!
> 
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>   ...0001-Fix-initialization-in-test-1140.patch | 113 ------------------
>   .../0002-Fix-gcc-build-problem.patch          |  82 -------------
>   ...eck_cxx_compiler_flag-to-cmake-3.0.2.patch |  53 --------
>   ...ft-gsl_4.0.0.bb => microsoft-gsl_4.2.0.bb} |   8 +-
>   4 files changed, 2 insertions(+), 254 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
>   delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch
>   delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
>   rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.0.0.bb => microsoft-gsl_4.2.0.bb} (87%)
> 
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
> deleted file mode 100644
> index 84a585d3c5..0000000000
> --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
> +++ /dev/null
> @@ -1,113 +0,0 @@
> -From 1b4d42ca2e97061042ec44a0b34ceb176c78c7e1 Mon Sep 17 00:00:00 2001
> -From: d-winsor <danwin@microsoft.com>
> -Date: Mon, 26 Feb 2024 13:17:12 -0800
> -Subject: [PATCH] Fix initialization in test (#1140)
> -
> -* Suppress unsafe-buffer-usage
> -
> -Upstream-Status: Backport [https://github.com/microsoft/GSL/commit/1b4d42ca2e97061042ec44a0b34ceb176c78c7e1]
> -
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - include/gsl/span     | 10 ++++++++++
> - include/gsl/util     | 10 ++++++++++
> - tests/CMakeLists.txt | 10 ++++++++++
> - tests/span_tests.cpp |  2 +-
> - 4 files changed, 31 insertions(+), 1 deletion(-)
> -
> -diff --git a/include/gsl/span b/include/gsl/span
> -index cc8a7b9..d254e4d 100644
> ---- a/include/gsl/span
> -+++ b/include/gsl/span
> -@@ -58,6 +58,12 @@
> - #pragma GCC diagnostic ignored "-Wsign-conversion"
> - #endif
> -
> -+// Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
> -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#pragma clang diagnostic push
> -+#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> -+#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+
> - namespace gsl
> - {
> -
> -@@ -818,4 +824,8 @@ as_writable_bytes(span<ElementType, Extent> s) noexcept
> - #pragma GCC diagnostic pop
> - #endif // __GNUC__ > 6
> -
> -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#pragma clang diagnostic pop
> -+#endif
> -+
> - #endif // GSL_SPAN_H
> -diff --git a/include/gsl/util b/include/gsl/util
> -index a215bad..11735a8 100644
> ---- a/include/gsl/util
> -+++ b/include/gsl/util
> -@@ -39,6 +39,12 @@
> -
> - #endif // _MSC_VER
> -
> -+// Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
> -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#pragma clang diagnostic push
> -+#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> -+#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+
> - #if defined(__cplusplus) && (__cplusplus >= 201703L)
> - #define GSL_NODISCARD [[nodiscard]]
> - #else
> -@@ -157,4 +163,8 @@ constexpr auto at(std::span<T, extent> sp, const index i) -> decltype(sp[sp.size
> -
> - #endif // _MSC_VER
> -
> -+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#pragma clang diagnostic pop
> -+#endif
> -+
> - #endif // GSL_UTIL_H
> -diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> -index cab4e56..20de9e1 100644
> ---- a/tests/CMakeLists.txt
> -+++ b/tests/CMakeLists.txt
> -@@ -167,6 +167,11 @@ else()
> -         >
> -     )
> - endif(MSVC)
> -+check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> -+if (WARN_UNSAFE_BUFFER)
> -+  # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
> -+  target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buffer-usage")
> -+endif()
> -
> - # for tests to find the gtest header
> - target_include_directories(gsl_tests_config SYSTEM INTERFACE
> -@@ -267,6 +272,11 @@ else()
> -         >
> -     )
> - endif(MSVC)
> -+check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> -+if (WARN_UNSAFE_BUFFER)
> -+  # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
> -+  target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-unsafe-buffer-usage")
> -+endif()
> -
> - add_executable(gsl_noexcept_tests no_exception_ensure_tests.cpp)
> - target_link_libraries(gsl_noexcept_tests
> -diff --git a/tests/span_tests.cpp b/tests/span_tests.cpp
> -index 33ccf56..3c1dfe5 100644
> ---- a/tests/span_tests.cpp
> -+++ b/tests/span_tests.cpp
> -@@ -330,7 +330,7 @@ TEST(span_test, from_array_constructor)
> -         EXPECT_TRUE(s.data() == std::addressof(arr2d[0]));
> -     }
> -
> --    int arr3d[2][3][2] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
> -+    int arr3d[2][3][2] = { { {1, 2}, {3, 4}, {5, 6} }, { {7, 8}, {9, 10}, {11, 12} } };
> -
> - #ifdef CONFIRM_COMPILATION_ERRORS
> -     {
> ---
> -2.30.2
> -
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch
> deleted file mode 100644
> index 2f7542c62c..0000000000
> --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From aa4fd1f57794964640005900c2b47af1a0940b7b Mon Sep 17 00:00:00 2001
> -From: Werner Henze <w.henze@avm.de>
> -Date: Fri, 1 Mar 2024 15:53:50 +0100
> -Subject: [PATCH] Fix gcc build problem
> -
> -Closes issue #1148 by fixing problems introduced in PR #1140.
> -
> -Upstream-Status: Submitted [https://github.com/microsoft/GSL/pull/1149]
> -
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - include/gsl/span | 12 ++++++++----
> - include/gsl/util | 12 ++++++++----
> - 2 files changed, 16 insertions(+), 8 deletions(-)
> -
> -diff --git a/include/gsl/span b/include/gsl/span
> -index 0de2932..d2ef9f7 100644
> ---- a/include/gsl/span
> -+++ b/include/gsl/span
> -@@ -59,10 +59,12 @@
> - #endif
> -
> - // Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
> --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#if defined(__clang__)
> -+#if __has_warning("-Wunsafe-buffer-usage")
> - #pragma clang diagnostic push
> - #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> --#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#endif // __has_warning("-Wunsafe-buffer-usage")
> -+#endif // defined(__clang__)
> -
> - namespace gsl
> - {
> -@@ -824,8 +826,10 @@ as_writable_bytes(span<ElementType, Extent> s) noexcept
> - #pragma GCC diagnostic pop
> - #endif // __GNUC__ > 6
> -
> --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#if defined(__clang__)
> -+#if __has_warning("-Wunsafe-buffer-usage")
> - #pragma clang diagnostic pop
> --#endif
> -+#endif // __has_warning("-Wunsafe-buffer-usage")
> -+#endif // defined(__clang__)
> -
> - #endif // GSL_SPAN_H
> -diff --git a/include/gsl/util b/include/gsl/util
> -index b853017..26b2f5f 100644
> ---- a/include/gsl/util
> -+++ b/include/gsl/util
> -@@ -40,10 +40,12 @@
> - #endif // _MSC_VER
> -
> - // Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
> --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#if defined(__clang__)
> -+#if __has_warning("-Wunsafe-buffer-usage")
> - #pragma clang diagnostic push
> - #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
> --#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#endif // __has_warning("-Wunsafe-buffer-usage")
> -+#endif // defined(__clang__)
> -
> - #if defined(__cplusplus) && (__cplusplus >= 201703L)
> - #define GSL_NODISCARD [[nodiscard]]
> -@@ -163,8 +165,10 @@ constexpr auto at(std::span<T, extent> sp, const index i) -> decltype(sp[sp.size
> -
> - #endif // _MSC_VER
> -
> --#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
> -+#if defined(__clang__)
> -+#if __has_warning("-Wunsafe-buffer-usage")
> - #pragma clang diagnostic pop
> --#endif
> -+#endif // __has_warning("-Wunsafe-buffer-usage")
> -+#endif // defined(__clang__)
> -
> - #endif // GSL_UTIL_H
> ---
> -2.30.2
> -
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
> deleted file mode 100644
> index ed057f5243..0000000000
> --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From 85e1c38bcf84bd4e2ce63ef74f0cfa1f5e92261e Mon Sep 17 00:00:00 2001
> -From: Peter Marko <peter.marko@siemens.com>
> -Date: Wed, 27 Mar 2024 23:46:31 +0100
> -Subject: [PATCH] Adapt check_cxx_compiler_flag to cmake 3.0.2
> -
> -Backporting commits which are upgrading cmake_minimum_required and
> -include check_cxx_compiler_flag have too many additional changes.
> -
> -Let's just do a simple adaptation of our backported patch so
> -it works with older cmake version instead.
> -
> -This can be safely removed when recipe version is upgraded.
> -
> -Upstream-Status: Inappropriate
> -
> -Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ----
> - tests/CMakeLists.txt | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
> -index 20de9e1..54c3ac5 100644
> ---- a/tests/CMakeLists.txt
> -+++ b/tests/CMakeLists.txt
> -@@ -5,6 +5,7 @@ enable_testing()  # again, for support standalone testing
> -
> - include(FindPkgConfig)
> - include(ExternalProject)
> -+include(CheckCXXCompilerFlag)
> -
> - # will make visual studio generated project group files
> - set_property(GLOBAL PROPERTY USE_FOLDERS ON)
> -@@ -167,7 +168,7 @@ else()
> -         >
> -     )
> - endif(MSVC)
> --check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> -+CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> - if (WARN_UNSAFE_BUFFER)
> -   # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
> -   target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buffer-usage")
> -@@ -272,7 +273,7 @@ else()
> -         >
> -     )
> - endif(MSVC)
> --check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> -+CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
> - if (WARN_UNSAFE_BUFFER)
> -   # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
> -   target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-unsafe-buffer-usage")
> ---
> -2.30.2
> -
> diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
> index 2fbbf8f06a..610c45a298 100644
> --- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
> +++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
> @@ -9,13 +9,9 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
>   
>   SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=main \
> -    file://run-ptest \
> -    file://0001-Fix-initialization-in-test-1140.patch \
> -    file://0002-Fix-gcc-build-problem.patch \
> -    file://0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch \
> +        file://run-ptest \
>   "
> -SRCREV = "a3534567187d2edc428efd3f13466ff75fe5805c"
> -
> +SRCREV = "2828399820ef4928cc89b65605dca5dc68efca6e"
>   
>   inherit cmake pkgconfig ptest
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118340): https://lists.openembedded.org/g/openembedded-devel/message/118340
> Mute This Topic: https://lists.openembedded.org/mt/114053267/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


