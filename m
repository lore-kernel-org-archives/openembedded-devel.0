Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB71C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 20:42:57 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.7556.1752093769333150901
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 13:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VvCP5GVW;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b6a349ccso322955e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 13:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752093767; x=1752698567; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mHnj9WaR/zrUyv6IT+mpHgK0jMpgA+AB7xs0Helx69U=;
        b=VvCP5GVWdCS+42X/ByRyFtjneVj+SehRqHqhuurta7HZJU3FvokJs4cgKHDzXkYUuc
         pME1r4/Q/3eikTVyQ/i+WuNVNZTONOtAK5Wvfu1UasSrQkrpJ1naDFqNp8k00IZN8wBQ
         kne866pJa/gBibYlfx7ZfZixLf8EvyiWyNNdtWJI0XDPFHJmiZk/MErCxPOzaw9KhvBp
         YbutsyCCC717lh8TWeZcrMukOdurhJb/XoU1Ug7UkkgBCuV80w/SghYpAigT+t3/w495
         c7Pes+iyIa2lIyzG0m+rVfK8kAbm44trAvgTnzIT3Mn8OhL7mdUBru62vKdVCXhNdJek
         hh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752093767; x=1752698567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHnj9WaR/zrUyv6IT+mpHgK0jMpgA+AB7xs0Helx69U=;
        b=sEXLbt0fpvw5eoYrBK5xCitFyJk0PzlvIpVKhqSSs11wCAJAvEnbY/FJJto9G7GTSv
         a2K4nOBMkGku1O2x74BIk15rSHNXW4UQxdRfh01Nee6J83noDUtav78b5caq8GrFU+Qb
         WSBgmDllo7FgbHfR/0Z/Zgz4D1jkrO5RNKvRUroYAL0xIoFp2cZYUwBTeDHJ1uhcn+3f
         JZ80RusMlCWpnAGH5L6bJpcupAMBVyAPIU0qn6oWWF8wgKlaIWgQBZlsKRbLb4bu6CZf
         5XhGGnKJ6KHeC+I8Jmge3+/j/hzs/eYs4y3pmnqErAyyVNjkm5WweTG9/WRvSYvNfvMl
         ZnFA==
X-Gm-Message-State: AOJu0Yyzt5vSTc1jqn949OVyCOZs3q+T+jsg5jHkOFX/KB/+X+zI/GwP
	mpOz7StbIsWCXcYiZ1heIZzzsVKRRdp/xDePATaarrCk4ksBMgeNFxB/XPpv0w==
X-Gm-Gg: ASbGncthDHUYbUFZdynCgg3YWJ+ciGo6ZwEtpXeHJzzFVvaoN7O551/AfZJLvdqpOMP
	yR0VGjOiK/ryyqz+2M5Zav2MowzHIX35LvmDaHu3EcQw8dhn2wCnVUgfaCfTBO2f4Rzr3jhB6/o
	r8ElSoga60ZEfnsLMY307xRJCuTy9qlQiT2Og8zAWl913/KaDXXHyYiqHvxNQN85zGjyBOFZ3ZC
	uXf8w/JZFjR23zy0bKQgR2UPtOSGMe+svhQsXWBb1scKSVSp0ZbnwQS5rUXCiOTObcaP67bfmAP
	ZjSAbd/NVA5w60LrEN9WgOAYFhAAx4Kzqicsbfq3hA8u7R9HJ7c4skYwGFgArjrcALrpoXhiG+d
	XfDU=
X-Google-Smtp-Source: AGHT+IHG1rVmEJk6ji7gN5Rv+1XCF8JUFPAO0xw408blRNSE3JUnKUZHPXi21CGSpEHfZbnVViCQVQ==
X-Received: by 2002:a05:6512:33c9:b0:554:f76a:bac1 with SMTP id 2adb3069b0e04-5592650775cmr64728e87.0.1752093766674;
        Wed, 09 Jul 2025 13:42:46 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbd4asm13693e87.2.2025.07.09.13.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:42:45 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv2] microsoft-gsl: Upgrade 4.0.0 -> 4.2.0 to allow CMake 4+ compatibility
Date: Wed,  9 Jul 2025 23:41:54 +0300
Message-ID: <20250709204154.653799-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 20:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118383

- Drop patches because already fixed in newer version

- Fix compile error when compiled with Clang:

assertion_tests.cpp:40:1: error: use of the 'maybe_unused' attribute is a C++17 extension [-Werror,-Wc++17-attribute-extensions]
   40 | TEST(assertion_tests, expects)
      | ^

According to the upstream recommendation, passing the -DGSL_CXX_STANDARD=17 flag to CMake resolves the problem.
This patch applies the suggested workaround until a more permanent solution is provided from upstream.

Upstream discussion -> https://github.com/microsoft/GSL/issues/1178

Changelog:

https://github.com/microsoft/GSL/compare/v4.0.0...v4.2.0
https://github.com/microsoft/GSL/releases/tag/v4.2.0
https://github.com/microsoft/GSL/releases/tag/v4.1.0

Fix:

| CMake Error at tests/CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...0001-Fix-initialization-in-test-1140.patch | 113 ------------------
 .../0002-Fix-gcc-build-problem.patch          |  82 -------------
 ...eck_cxx_compiler_flag-to-cmake-3.0.2.patch |  53 --------
 ...ft-gsl_4.0.0.bb => microsoft-gsl_4.2.0.bb} |  10 +-
 4 files changed, 4 insertions(+), 254 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
 delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch
 delete mode 100644 meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
 rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.0.0.bb => microsoft-gsl_4.2.0.bb} (87%)

diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
deleted file mode 100644
index 84a585d3c5..0000000000
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0001-Fix-initialization-in-test-1140.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 1b4d42ca2e97061042ec44a0b34ceb176c78c7e1 Mon Sep 17 00:00:00 2001
-From: d-winsor <danwin@microsoft.com>
-Date: Mon, 26 Feb 2024 13:17:12 -0800
-Subject: [PATCH] Fix initialization in test (#1140)
-
-* Suppress unsafe-buffer-usage
-
-Upstream-Status: Backport [https://github.com/microsoft/GSL/commit/1b4d42ca2e97061042ec44a0b34ceb176c78c7e1]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- include/gsl/span     | 10 ++++++++++
- include/gsl/util     | 10 ++++++++++
- tests/CMakeLists.txt | 10 ++++++++++
- tests/span_tests.cpp |  2 +-
- 4 files changed, 31 insertions(+), 1 deletion(-)
-
-diff --git a/include/gsl/span b/include/gsl/span
-index cc8a7b9..d254e4d 100644
---- a/include/gsl/span
-+++ b/include/gsl/span
-@@ -58,6 +58,12 @@
- #pragma GCC diagnostic ignored "-Wsign-conversion"
- #endif
- 
-+// Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
-+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#pragma clang diagnostic push
-+#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
-+#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+
- namespace gsl
- {
- 
-@@ -818,4 +824,8 @@ as_writable_bytes(span<ElementType, Extent> s) noexcept
- #pragma GCC diagnostic pop
- #endif // __GNUC__ > 6
- 
-+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#pragma clang diagnostic pop
-+#endif
-+
- #endif // GSL_SPAN_H
-diff --git a/include/gsl/util b/include/gsl/util
-index a215bad..11735a8 100644
---- a/include/gsl/util
-+++ b/include/gsl/util
-@@ -39,6 +39,12 @@
- 
- #endif // _MSC_VER
- 
-+// Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
-+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#pragma clang diagnostic push
-+#pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
-+#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+
- #if defined(__cplusplus) && (__cplusplus >= 201703L)
- #define GSL_NODISCARD [[nodiscard]]
- #else
-@@ -157,4 +163,8 @@ constexpr auto at(std::span<T, extent> sp, const index i) -> decltype(sp[sp.size
- 
- #endif // _MSC_VER
- 
-+#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#pragma clang diagnostic pop
-+#endif
-+
- #endif // GSL_UTIL_H
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index cab4e56..20de9e1 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -167,6 +167,11 @@ else()
-         >
-     )
- endif(MSVC)
-+check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
-+if (WARN_UNSAFE_BUFFER)
-+  # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
-+  target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buffer-usage")
-+endif()
- 
- # for tests to find the gtest header
- target_include_directories(gsl_tests_config SYSTEM INTERFACE
-@@ -267,6 +272,11 @@ else()
-         >
-     )
- endif(MSVC)
-+check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
-+if (WARN_UNSAFE_BUFFER)
-+  # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
-+  target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-unsafe-buffer-usage")
-+endif()
- 
- add_executable(gsl_noexcept_tests no_exception_ensure_tests.cpp)
- target_link_libraries(gsl_noexcept_tests
-diff --git a/tests/span_tests.cpp b/tests/span_tests.cpp
-index 33ccf56..3c1dfe5 100644
---- a/tests/span_tests.cpp
-+++ b/tests/span_tests.cpp
-@@ -330,7 +330,7 @@ TEST(span_test, from_array_constructor)
-         EXPECT_TRUE(s.data() == std::addressof(arr2d[0]));
-     }
- 
--    int arr3d[2][3][2] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
-+    int arr3d[2][3][2] = { { {1, 2}, {3, 4}, {5, 6} }, { {7, 8}, {9, 10}, {11, 12} } };
- 
- #ifdef CONFIRM_COMPILATION_ERRORS
-     {
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch
deleted file mode 100644
index 2f7542c62c..0000000000
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0002-Fix-gcc-build-problem.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From aa4fd1f57794964640005900c2b47af1a0940b7b Mon Sep 17 00:00:00 2001
-From: Werner Henze <w.henze@avm.de>
-Date: Fri, 1 Mar 2024 15:53:50 +0100
-Subject: [PATCH] Fix gcc build problem
-
-Closes issue #1148 by fixing problems introduced in PR #1140.
-
-Upstream-Status: Submitted [https://github.com/microsoft/GSL/pull/1149]
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- include/gsl/span | 12 ++++++++----
- include/gsl/util | 12 ++++++++----
- 2 files changed, 16 insertions(+), 8 deletions(-)
-
-diff --git a/include/gsl/span b/include/gsl/span
-index 0de2932..d2ef9f7 100644
---- a/include/gsl/span
-+++ b/include/gsl/span
-@@ -59,10 +59,12 @@
- #endif
- 
- // Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
--#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#if defined(__clang__)
-+#if __has_warning("-Wunsafe-buffer-usage")
- #pragma clang diagnostic push
- #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
--#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#endif // __has_warning("-Wunsafe-buffer-usage")
-+#endif // defined(__clang__)
- 
- namespace gsl
- {
-@@ -824,8 +826,10 @@ as_writable_bytes(span<ElementType, Extent> s) noexcept
- #pragma GCC diagnostic pop
- #endif // __GNUC__ > 6
- 
--#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#if defined(__clang__)
-+#if __has_warning("-Wunsafe-buffer-usage")
- #pragma clang diagnostic pop
--#endif
-+#endif // __has_warning("-Wunsafe-buffer-usage")
-+#endif // defined(__clang__)
- 
- #endif // GSL_SPAN_H
-diff --git a/include/gsl/util b/include/gsl/util
-index b853017..26b2f5f 100644
---- a/include/gsl/util
-+++ b/include/gsl/util
-@@ -40,10 +40,12 @@
- #endif // _MSC_VER
- 
- // Turn off clang unsafe buffer warnings as all accessed are guarded by runtime checks
--#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#if defined(__clang__)
-+#if __has_warning("-Wunsafe-buffer-usage")
- #pragma clang diagnostic push
- #pragma clang diagnostic ignored "-Wunsafe-buffer-usage"
--#endif // defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#endif // __has_warning("-Wunsafe-buffer-usage")
-+#endif // defined(__clang__)
- 
- #if defined(__cplusplus) && (__cplusplus >= 201703L)
- #define GSL_NODISCARD [[nodiscard]]
-@@ -163,8 +165,10 @@ constexpr auto at(std::span<T, extent> sp, const index i) -> decltype(sp[sp.size
- 
- #endif // _MSC_VER
- 
--#if defined(__clang__) && __has_warning("-Wunsafe-buffer-usage")
-+#if defined(__clang__)
-+#if __has_warning("-Wunsafe-buffer-usage")
- #pragma clang diagnostic pop
--#endif
-+#endif // __has_warning("-Wunsafe-buffer-usage")
-+#endif // defined(__clang__)
- 
- #endif // GSL_UTIL_H
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
deleted file mode 100644
index ed057f5243..0000000000
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl/0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 85e1c38bcf84bd4e2ce63ef74f0cfa1f5e92261e Mon Sep 17 00:00:00 2001
-From: Peter Marko <peter.marko@siemens.com>
-Date: Wed, 27 Mar 2024 23:46:31 +0100
-Subject: [PATCH] Adapt check_cxx_compiler_flag to cmake 3.0.2
-
-Backporting commits which are upgrading cmake_minimum_required and
-include check_cxx_compiler_flag have too many additional changes.
-
-Let's just do a simple adaptation of our backported patch so
-it works with older cmake version instead.
-
-This can be safely removed when recipe version is upgraded.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- tests/CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 20de9e1..54c3ac5 100644
---- a/tests/CMakeLists.txt
-+++ b/tests/CMakeLists.txt
-@@ -5,6 +5,7 @@ enable_testing()  # again, for support standalone testing
- 
- include(FindPkgConfig)
- include(ExternalProject)
-+include(CheckCXXCompilerFlag)
- 
- # will make visual studio generated project group files
- set_property(GLOBAL PROPERTY USE_FOLDERS ON)
-@@ -167,7 +168,7 @@ else()
-         >
-     )
- endif(MSVC)
--check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
-+CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
- if (WARN_UNSAFE_BUFFER)
-   # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
-   target_compile_options(gsl_tests_config INTERFACE "-Wno-unsafe-buffer-usage")
-@@ -272,7 +273,7 @@ else()
-         >
-     )
- endif(MSVC)
--check_cxx_compiler_flag("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
-+CHECK_CXX_COMPILER_FLAG("-Wno-unsafe-buffer-usage" WARN_UNSAFE_BUFFER)
- if (WARN_UNSAFE_BUFFER)
-   # This test uses very greedy heuristics such as "no pointer arithmetic on raw buffer"
-   target_compile_options(gsl_tests_config_noexcept INTERFACE "-Wno-unsafe-buffer-usage")
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
similarity index 87%
rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
index 2fbbf8f06a..16a0af334d 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
@@ -9,16 +9,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
 
 SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=main \
-    file://run-ptest \
-    file://0001-Fix-initialization-in-test-1140.patch \
-    file://0002-Fix-gcc-build-problem.patch \
-    file://0003-Adapt-check_cxx_compiler_flag-to-cmake-3.0.2.patch \
+        file://run-ptest \
 "
-SRCREV = "a3534567187d2edc428efd3f13466ff75fe5805c"
-
+SRCREV = "2828399820ef4928cc89b65605dca5dc68efca6e"
 
 inherit cmake pkgconfig ptest
 
+EXTRA_OECMAKE += "-DGSL_CXX_STANDARD=17"
+
 # this is header-only library
 ALLOW_EMPTY:${PN} = "1"
 
-- 
2.43.0


