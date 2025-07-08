Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374B3C83F15
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 19:57:59 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.5758.1752004672247999199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 12:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cyusd6lB;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b7123edb9so54953971fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 12:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752004670; x=1752609470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5tSBVJZY2ISFzMueFGBx5pxjXQZv4C8j3fDtLqgF0k=;
        b=cyusd6lB1nIDkTkv3ggxUQcNRMaMUnJY5AkxfVPDiif0Poh2Zz4/doTuu82WQe+UP5
         pIvmTw6pggsxY+xVD9MLaXFHOp6S6s7ukyltlfMQc3mjsgvsvr/K0oljo3EfATSf6ugK
         4SUEZGPdEzbBr0AObZ8jSgG1SvnIHt8Q+DHfKagouyPnH4t6FOmlLS6I9YTrQuh4NXiB
         pmz2IdiHPZBdGSQy9oLG20TXmdpqZ/B24r3j7e0to3QHYETA5iw0eKpUyYLmq9YAhho7
         l4OIUaGa0sXmOCdBpw6ki2lra39yKHpOhzVugy0SlZw0ZoUpJVaIqWSRfK0ZZ4WSmY/2
         4CAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752004670; x=1752609470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5tSBVJZY2ISFzMueFGBx5pxjXQZv4C8j3fDtLqgF0k=;
        b=Die9dMPe7BPWA3tu/IoyYuRyiKBSc4R7Leoqo0QnV34jcHYcF5DwGuM3zQ2duzk5Lp
         RLhCFY4qaajl+XgXaz5ACRTi5wJcllq21i/tu3fW3JkIS8CBsYe5u224HDrPxJxWQWiL
         i/AGXG+Xsku/2Y4BUatQKgJETeLRkF+RieuiRVYxkOXqFj1xA9yhol1cdYkuTYaA4na/
         Q5dXZ1oENIBfwF7Mx/WT3XsQVEBDnDwJx+SIYkndTqnV0jWDTk+kQoGryaRfyzhrYnMj
         uhBXrZcw4if6+yKtk2j/94CiptaEtBFlvauL1yj6sLY7yvShQTqPUxaQ2GVF/8T8/ArC
         SWRw==
X-Gm-Message-State: AOJu0Yxj+Tp5xCNks0PaT/UGY9Pr7AUI7ruClXDO7IZr2Dnkg4peJND3
	UdPuFtUQjv3oeaq4RggflG3PJCghBRep1t6Kkx00a9dPeAUN/C33OeGewpWhhQ==
X-Gm-Gg: ASbGncvMi+dbOO1vRZJQFgjTHceCxPdBfG9NV8GFeTR/Us8qotj7PhdEFBS/on1YCB+
	XEPSI3b4rNcTOFfPijixiShqpHRT3JfONI7aGUCMccA1TDpDIvdCw4w73fNtTyy5lDFTbaJNimv
	0YXiTr6EzSitm0u0zwTIlpfq0QO+OAHbP2zLO9in5VPBmqgEDFm6HPvr/tf4yUlwUxfLCb04gNB
	yYHPGFI4orWU24iz91XBFsa08luWH04n6xF5I6ohXQHW0WZdc4PLQZ/LXhQkf1ViyiRpf/3pfPp
	SicqTuQpC7YYc/H+l4s2VtqvNpSpve2la4xMohB4XwdLO6LwxM0dw/bj7ynTEcho8y529QRnOQx
	PZKq+rGyadSHAGQ==
X-Google-Smtp-Source: AGHT+IHYZxvha4r/lRSURZwE884pN78U2Sj5UmeGPqqSQ4bEv/1Wbc+iK8Mci+XU2D3skoQ2yZyxaw==
X-Received: by 2002:a05:651c:e0c:b0:32b:5672:41fb with SMTP id 38308e7fff4ca-32e5f5f9951mr40767731fa.19.1752004669740;
        Tue, 08 Jul 2025 12:57:49 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3debsm16003981fa.44.2025.07.08.12.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 12:57:49 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 18/20] microsoft-gsl: Upgrade 4.0.0 -> 4.2.0 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 22:56:34 +0300
Message-ID: <20250708195636.1678606-18-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708195636.1678606-1-alperyasinak1@gmail.com>
References: <20250708195636.1678606-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 19:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118340

- Drop patches because already fixed in newer version

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
 ...ft-gsl_4.0.0.bb => microsoft-gsl_4.2.0.bb} |   8 +-
 4 files changed, 2 insertions(+), 254 deletions(-)
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
index 2fbbf8f06a..610c45a298 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.0.0.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
@@ -9,13 +9,9 @@ LICENSE = "MIT"
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
 
-- 
2.43.0


