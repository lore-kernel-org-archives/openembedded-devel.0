Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0216C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:34 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.11383.1662276925814915864
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zck2MKEl;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 ev6-20020a17090aeac600b0020031370f86so1305518pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=czqrpXljYbsHkkWEWXiy84AqFv8FDlMllVLSK7jEDe8=;
        b=Zck2MKElO8TOwfT97+qYAxohKG7eQ6Coqabp2t3G8vvvnsGUb/oiwrSFmmanbEbJPU
         q7WUIAcTcU2eEAKedzDs9KRbg+iyAX99m4B+a96KPmZLxJeActgtDF5ciW5FsSA4WpnM
         3IPswIKwfxV9AWo+d6J8NDWOBa/Pb5qe9BSEgUjv4eazr0Z8iaGF91rHm6G0XFnNlNCo
         ZZNB9+0gSXsyXGFssXKczmsOM93bSgg+G7QxlEs4elOawKRxmPDy4hG0f7iJ+PCmb6KJ
         +U8WAzl4dsUZWYu81JRcrmybzqkony9ikEMPM1kgKudBzPEBy1f+k6kKAyyrIOWhpLeY
         0QQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=czqrpXljYbsHkkWEWXiy84AqFv8FDlMllVLSK7jEDe8=;
        b=ePeks5S6+5AP3IVbc/bQ03NWNgsLPrNLSWiTbRO6/SXQKlj4xd5HnqYF/tdCvfFbVg
         YmDz43vt09GSED1SuOODwPAu0KluKqWWNWenmXC04st+p0ul4ktgvqs3XQ2k/iX5A/TC
         jQ7HNvkmc32UurMWJGMq3o71DBM778fv/XZXvh7CGwgIuSARICs4M5dWZQazhpdcKyN6
         zSvQgvkG/FkCTvnPuDM7D4ArbXyF2V9ig1Ra9vDWOnNFn2yI7Uzi22HtEYER5SinUJ8J
         G0UUTHMVzI5FhhyTj+S5EzGtmLVreQxnVkq7Ri9yksii/JjqBqUW07mVRGDvZhUYw8Jb
         DP8A==
X-Gm-Message-State: ACgBeo1PHZH/+IgOQcZIKuF6DBopNUkJLny/sS/yeOobOQ2xH5WkmKiS
	8uwizokaOj6s1W+wfDpJzKpU3m1K8kAU/g==
X-Google-Smtp-Source: 
 AA6agR7FcdGxnkzu2td6nJzcKLdVtE3Ea6mOTqOTRNYBX7m4vBHAjwiJc9QKZupYwVA8rdrL9b8BKg==
X-Received: by 2002:a17:90b:4b86:b0:1f7:6fbf:116 with SMTP id
 lr6-20020a17090b4b8600b001f76fbf0116mr13254576pjb.56.1662276924734;
        Sun, 04 Sep 2022 00:35:24 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 63/63] vulkan-cts,opengl-es-cts: Upgrade to1.3.3.1
 and 3.2.8 respectively
Date: Sun,  4 Sep 2022 00:34:17 -0700
Message-Id: <20220904073417.3251865-63-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98656

Add needed depednency on vulkan-docs, jsoncpp and python3-xml-native as they are
added newly in these versions.

Delete patches already applied in this release

Backport one amber patch to fix compile with clang

Forward port the remaining patches

Add mechanism to run target test binaries using qemu usermode

Override WAYLAND_SCANNER and WAYLAND_PROTOCOLS_DIR

Let these variables be set via cmake cmdline before enquiring via pkg-config

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-limits-header-for-numeric_limits.patch | 88 -------------------
 .../files/0001-Remove-dead-variable-984.patch | 34 +++++++
 ...-GCC-11-uninit-variable-warnings-946.patch | 73 ---------------
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 37 ++++++++
 ...0001-use-library-sonames-for-linking.patch | 20 +----
 .../vk-gl-cts/khronos-cts.inc                 | 30 +++++--
 .../vk-gl-cts/opengl-es-cts_3.2.7.0.bb        | 31 -------
 .../vk-gl-cts/opengl-es-cts_3.2.8.0.bb        | 36 ++++++++
 .../vk-gl-cts/vulkan-cts_1.2.6.0.bb           | 24 -----
 .../vk-gl-cts/vulkan-cts_1.3.3.1.bb           | 28 ++++++
 10 files changed, 161 insertions(+), 240 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
deleted file mode 100644
index 746497d047..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From aec0be857ed3faef8802c7fd61f3d7798a565108 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Apr 2021 16:03:42 -0700
-Subject: [PATCH] Include <limits> header for numeric_limits
-
-Fixes
-vulkancts/framework/vulkan/vkRayTracingUtil.hpp:116:32: error: 'numeric_limits' is not a member of 'std'
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- framework/vulkan/vkRayTracingUtil.hpp                           | 1 +
- modules/vulkan/api/vktApiBufferTests.cpp                        | 1 +
- modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp | 2 ++
- 3 files changed, 4 insertions(+)
-
---- a/framework/vulkan/vkRayTracingUtil.hpp
-+++ b/framework/vulkan/vkRayTracingUtil.hpp
-@@ -33,6 +33,7 @@
- #include "tcuVector.hpp"
- #include "tcuVectorType.hpp"
- 
-+#include <limits>
- #include <vector>
- 
- namespace vk
---- a/modules/vulkan/api/vktApiBufferTests.cpp
-+++ b/modules/vulkan/api/vktApiBufferTests.cpp
-@@ -35,6 +35,7 @@
- #include "tcuPlatform.hpp"
- 
- #include <algorithm>
-+#include <limits>
- 
- namespace vkt
- {
---- a/modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp
-+++ b/modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp
-@@ -28,6 +28,8 @@
- #include "vktSpvAsmComputeShaderCase.hpp"
- #include "vktSpvAsmGraphicsShaderTestUtil.hpp"
- 
-+#include <limits>
-+
- namespace vkt
- {
- namespace SpirVAssembly
---- a/modules/vulkan/memory/vktMemoryDeviceMemoryReportTests.cpp
-+++ b/modules/vulkan/memory/vktMemoryDeviceMemoryReportTests.cpp
-@@ -40,6 +40,7 @@
- 
- #include "deSharedPtr.hpp"
- 
-+#include <limits>
- #include <set>
- #include <vector>
- 
---- a/modules/vulkan/draw/vktDrawDepthClampTests.cpp
-+++ b/modules/vulkan/draw/vktDrawDepthClampTests.cpp
-@@ -38,6 +38,7 @@
- #include "vkQueryUtil.hpp"
- #include "tcuTextureUtil.hpp"
- 
-+#include <limits>
- #include <cmath>
- 
- namespace vkt
---- a/modules/vulkan/wsi/vktWsiFullScreenExclusiveTests.cpp
-+++ b/modules/vulkan/wsi/vktWsiFullScreenExclusiveTests.cpp
-@@ -39,6 +39,8 @@
- #include "tcuPlatform.hpp"
- #include "tcuCommandLine.hpp"
- 
-+#include <limits>
-+
- #if ( DE_OS == DE_OS_WIN32 )
- 	#define NOMINMAX
- 	#define WIN32_LEAN_AND_MEAN
---- a/modules/vulkan/synchronization/vktSynchronizationUtil.cpp
-+++ b/modules/vulkan/synchronization/vktSynchronizationUtil.cpp
-@@ -21,6 +21,7 @@
-  * \brief Synchronization tests utilities
-  *//*--------------------------------------------------------------------*/
- 
-+#include <limits>
- #include "vktSynchronizationUtil.hpp"
- #include "vkTypeUtil.hpp"
- #include "vkCmdUtil.hpp"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
new file mode 100644
index 0000000000..c29d80aa10
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
@@ -0,0 +1,34 @@
+From 0d863b444c9a54a92dab176b1b656c116923e1ca Mon Sep 17 00:00:00 2001
+From: alan-baker <alanbaker@google.com>
+Date: Wed, 30 Mar 2022 12:59:28 -0400
+Subject: [PATCH] Remove dead variable (#984)
+
+Upstream-Status: Backport [https://github.com/google/amber/commit/627ee453d6047ced0e2dd13cde983b341d0615e3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/vkscript/command_parser.cc | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/vkscript/command_parser.cc b/src/vkscript/command_parser.cc
+index 610c7e6..3429d4d 100644
+--- a/src/vkscript/command_parser.cc
++++ b/src/vkscript/command_parser.cc
+@@ -486,7 +486,6 @@ Result CommandParser::ParseValues(const std::string& name,
+                                   std::vector<Value>* values) {
+   assert(values);
+ 
+-  uint32_t row_index = 0;
+   auto token = tokenizer_->NextToken();
+   size_t seen = 0;
+   while (!token->IsEOL() && !token->IsEOS()) {
+@@ -515,7 +514,6 @@ Result CommandParser::ParseValues(const std::string& name,
+     values->push_back(v);
+     token = tokenizer_->NextToken();
+ 
+-    ++row_index;
+     ++seen;
+   }
+ 
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
deleted file mode 100644
index 6c87cad0a6..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 9cd614dd5481a4fdf552effac4820f51a10092c7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mika=20V=C3=A4in=C3=B6l=C3=A4?=
- <33728696+mvainola@users.noreply.github.com>
-Date: Wed, 7 Apr 2021 13:12:17 +0300
-Subject: [PATCH] Workaround for GCC 11 uninit variable warnings (#946)
-
-Building Amber with GCC 11.0.1 produces some uninitialized variable
-warnings. This commit works around them by replacing
-reinterpret_cast with memcpy when type punning unsigned integers to
-floats.
-
-Upstream-Status: Backport [https://github.com/google/amber/commit/aa69a0ac23ea7f68dd32bbef210546a5d84c1734]
----
- src/float16_helper.cc | 22 ++++++++++++++++------
- 1 file changed, 16 insertions(+), 6 deletions(-)
-
-diff --git a/src/float16_helper.cc b/src/float16_helper.cc
-index 617bd72..5cb35e7 100644
---- a/src/float16_helper.cc
-+++ b/src/float16_helper.cc
-@@ -15,6 +15,7 @@
- #include "src/float16_helper.h"
- 
- #include <cassert>
-+#include <cstring>
- 
- // Float10
- // | 9 8 7 6 5 | 4 3 2 1 0 |
-@@ -75,8 +76,11 @@ float HexFloat16ToFloat(const uint8_t* value) {
-   }
- 
-   uint32_t hex = sign | exponent | mantissa;
--  float* hex_float = reinterpret_cast<float*>(&hex);
--  return *hex_float;
-+  float hex_float;
-+  static_assert((sizeof(uint32_t) == sizeof(float)),
-+                "sizeof(uint32_t) != sizeof(float)");
-+  memcpy(&hex_float, &hex, sizeof(float));
-+  return hex_float;
- }
- 
- // Convert float |value| whose size is 11 bits to 32 bits float
-@@ -89,8 +93,11 @@ float HexFloat11ToFloat(const uint8_t* value) {
-   uint32_t mantissa = (static_cast<uint32_t>(value[0]) & 0x3f) << 17U;
- 
-   uint32_t hex = exponent | mantissa;
--  float* hex_float = reinterpret_cast<float*>(&hex);
--  return *hex_float;
-+  float hex_float;
-+  static_assert((sizeof(uint32_t) == sizeof(float)),
-+                "sizeof(uint32_t) != sizeof(float)");
-+  memcpy(&hex_float, &hex, sizeof(float));
-+  return hex_float;
- }
- 
- // Convert float |value| whose size is 10 bits to 32 bits float
-@@ -103,8 +110,11 @@ float HexFloat10ToFloat(const uint8_t* value) {
-   uint32_t mantissa = (static_cast<uint32_t>(value[0]) & 0x1f) << 18U;
- 
-   uint32_t hex = exponent | mantissa;
--  float* hex_float = reinterpret_cast<float*>(&hex);
--  return *hex_float;
-+  float hex_float;
-+  static_assert((sizeof(uint32_t) == sizeof(float)),
-+                "sizeof(uint32_t) != sizeof(float)");
-+  memcpy(&hex_float, &hex, sizeof(float));
-+  return hex_float;
- }
- 
- }  // namespace
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
new file mode 100644
index 0000000000..d7000b7da1
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
@@ -0,0 +1,37 @@
+From ec12bb7bda60cdf2c848e13df67452a7d30a42be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Sep 2022 18:52:42 -0700
+Subject: [PATCH] cmake: Define WAYLAND_SCANNER and WAYLAND_PROTOCOLS_DIR if
+ not already defined
+
+This helps with cross compiling and providing these knobs from cmake
+cmdline
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/platform/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/framework/platform/CMakeLists.txt b/framework/platform/CMakeLists.txt
+index c3ac463e4..030163f6c 100644
+--- a/framework/platform/CMakeLists.txt
++++ b/framework/platform/CMakeLists.txt
+@@ -73,8 +73,12 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
+ 			add_definitions(-DDEQP_SUPPORT_WAYLAND=1)
+ 			include_directories(lnx/wayland)
+ 
+-			pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
+-			pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
++			if (NOT DEFINED WAYLAND_PROTOCOLS_DIR)
++				pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
++			endif()
++			if (NOT DEFINED WAYLAND_SCANNER)
++				pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
++			endif()
+ 
+ 			set(DEQP_XDG_SHELL_PROTOCOL ${WAYLAND_PROTOCOLS_DIR}/stable/xdg-shell/xdg-shell.xml)
+ 			set(DEQP_XDG_SHELL_GEN_OUTPUTS_DIR ${PROJECT_BINARY_DIR}/framework/platform)
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
index cb396c37d7..b5a1d331ed 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
@@ -19,8 +19,6 @@ Signed-off-by: Trevor Woerner <twoerner@gmail.com>
  framework/platform/surfaceless/tcuSurfacelessPlatform.cpp   | 6 +++---
  6 files changed, 9 insertions(+), 9 deletions(-)
 
-diff --git a/framework/egl/egluGLContextFactory.cpp b/framework/egl/egluGLContextFactory.cpp
-index 8fbea2af1..8d42f19eb 100644
 --- a/framework/egl/egluGLContextFactory.cpp
 +++ b/framework/egl/egluGLContextFactory.cpp
 @@ -63,7 +63,7 @@ using std::vector;
@@ -41,8 +39,6 @@ index 8fbea2af1..8d42f19eb 100644
  #	endif
  #endif
  
-diff --git a/framework/egl/wrapper/eglwLibrary.cpp b/framework/egl/wrapper/eglwLibrary.cpp
-index d7e07fe18..ebdf68b14 100644
 --- a/framework/egl/wrapper/eglwLibrary.cpp
 +++ b/framework/egl/wrapper/eglwLibrary.cpp
 @@ -148,7 +148,7 @@ DefaultLibrary::~DefaultLibrary (void)
@@ -54,11 +50,9 @@ index d7e07fe18..ebdf68b14 100644
  #elif (DE_OS == DE_OS_WIN32)
  	return "libEGL.dll";
  #else
-diff --git a/framework/platform/android/tcuAndroidPlatform.cpp b/framework/platform/android/tcuAndroidPlatform.cpp
-index b9a4c716f..05cec0b49 100644
 --- a/framework/platform/android/tcuAndroidPlatform.cpp
 +++ b/framework/platform/android/tcuAndroidPlatform.cpp
-@@ -57,7 +57,7 @@ static const eglu::NativeWindow::Capability		WINDOW_CAPABILITIES		= (eglu::Nativ
+@@ -57,7 +57,7 @@ static const eglu::NativeWindow::Capabil
  class NativeDisplay : public eglu::NativeDisplay
  {
  public:
@@ -67,11 +61,9 @@ index b9a4c716f..05cec0b49 100644
  	virtual							~NativeDisplay			(void) {}
  
  	virtual EGLNativeDisplayType	getLegacyNative			(void)			{ return EGL_DEFAULT_DISPLAY;	}
-diff --git a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
-index 009c05e18..237c5e16f 100644
 --- a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
 +++ b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
-@@ -75,7 +75,7 @@ class Library : public eglw::DefaultLibrary
+@@ -75,7 +75,7 @@ class Library : public eglw::DefaultLibr
  {
  public:
  	Library (void)
@@ -80,8 +72,6 @@ index 009c05e18..237c5e16f 100644
  	{
  	}
  
-diff --git a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
-index 97bc3a0ed..3a20d63d3 100644
 --- a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
 +++ b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
 @@ -66,7 +66,7 @@ public:
@@ -93,8 +83,6 @@ index 97bc3a0ed..3a20d63d3 100644
  
  	~Display(void) {}
  	wayland::Display&			getWaylandDisplay	(void)	{ return *m_display; }
-diff --git a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
-index 9783eaeab..a1d8ac667 100644
 --- a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
 +++ b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
 @@ -69,7 +69,7 @@ using std::vector;
@@ -114,8 +102,8 @@ index 9783eaeab..a1d8ac667 100644
 +#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
  #endif
  
- namespace tcu
-@@ -238,7 +238,7 @@ glu::RenderContext* ContextFactory::createContext(const glu::RenderConfig& confi
+ #if !defined(DEQP_VULKAN_LIBRARY_PATH)
+@@ -234,7 +234,7 @@ glu::RenderContext* ContextFactory::crea
  }
  
  EglRenderContext::EglRenderContext(const glu::RenderConfig& config, const tcu::CommandLine& cmdLine)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 7d73bfbf31..f9074556f1 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -7,23 +7,24 @@ SRC_URI = "\
 	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=master \
 	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=master \
 	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=master \
-	https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
+        git://github.com/open-source-parsers/jsoncpp.git;protocol=https;destsuffix=git/external/jsoncpp/src;name=jsoncpp;branch=master \
+        git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;destsuffix=git/external/vulkan-docs/src;name=vulkan-docs;branch=main \
+        https://raw.githubusercontent.com/baldurk/renderdoc/fcdea67879fa1991e56cf7734ce0ce27866b665f/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
 "
 
 S = "${WORKDIR}/git"
 
-SRCREV_FORMAT = "vk-gl-cts_amber_glslang_spirv-headers_spirv-tools"
+SRCREV_FORMAT = "vk-gl-cts_amber_glslang_spirv-headers_spirv-tools_jsoncpp_vulkan-docs"
 
 S = "${WORKDIR}/git"
 
-inherit pkgconfig cmake features_check
+inherit pkgconfig cmake features_check python3native qemu
 
 ANY_OF_DISTRO_FEATURES += "opengl wayland"
 
-DEPENDS += "libpng zlib virtual/libgles2"
+DEPENDS += "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
 
-SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
-            file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
+SRC_URI += " \
             file://0001-vulkancts.patch \
             file://0001-use-library-sonames-for-linking.patch \
 "
@@ -37,6 +38,8 @@ SRC_URI:append:toolchain-clang = "\
 	file://fix-clang-private-operator.patch \
 "
 
+EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper -DWAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner -DWAYLAND_PROTOCOLS_DIR=${STAGING_DATADIR}/wayland-protocols"
+
 # The best thing for the user to do is to not specify any of the following
 # PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its own
 # probing and build what it thinks is appropriate.
@@ -44,11 +47,22 @@ SRC_URI:append:toolchain-clang = "\
 # to override this behaviour.
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[surfaceless] = "-DDEQP_TARGET=surfaceless,,,,,wayland x11_egl x11_glx x11_egl_glx"
-PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,,wayland,,,surfaceless x11_egl x11_glx x11_egl_glx"
+PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,,wayland-native wayland wayland-protocols,,,surfaceless x11_egl x11_glx x11_egl_glx"
 PACKAGECONFIG[x11_egl] = "-DDEQP_TARGET=x11_egl,,virtual/libx11 virtual/egl,,,surfaceless wayland x11_glx x11_egl_glx"
 PACKAGECONFIG[x11_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11,,,surfaceless wayland x11_egl x11_egl_glx"
 PACKAGECONFIG[x11_egl_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11 virtual/egl,,,surfaceless wayland x11_egl x11_glx"
 
+do_configure:append() {
+        # Write out a qemu wrapper that will be used by cmake
+        # so that it can run target helper binaries through that.
+        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        cat > ${WORKDIR}/qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+        chmod +x ${WORKDIR}/qemuwrapper
+}
+
 python __anonymous() {
     # if the user doesn't specify any PACKAGECONFIG then the cts build system
     # is going to probe the sysroot to try to figure out what to build
@@ -57,7 +71,7 @@ python __anonymous() {
     distrofeatures = (d.getVar("DISTRO_FEATURES") or "")
     if not bb.utils.contains_any("PACKAGECONFIG", ["surfaceless", "wayland", "x11_egl", "x11_glx", "x11_egl_glx"], True, False, d):
         if "wayland" in distrofeatures:
-            d.appendVar("DEPENDS", " wayland ")
+            d.appendVar("DEPENDS", " wayland-native wayland wayland-protocols")
         if "x11" in distrofeatures:
             d.appendVar("DEPENDS", " virtual/libx11 virtual/egl ")
 }
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
deleted file mode 100644
index 1c1371b032..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "OpenGL CTS"
-
-require khronos-cts.inc
-# opengl-es-cts-3.2.7.0
-SRCREV_vk-gl-cts = "7cba7113c40f2ff03573c8c2c90661b2249e04fa"
-SRCREV_amber = "4d0115cccfcb3b73d20b6513b1c40748e6403c50"
-SRCREV_glslang = "ffccefddfd9a02ec0c0b6dd04ef5e1042279c97f"
-SRCREV_spirv-headers = "104ecc356c1bea4476320faca64440cd1df655a3"
-SRCREV_spirv-tools = "cd590fa3341284cd6d1ee82366155786cfd44c96"
-SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}/${CTSDIR}
-	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
-
-	install -m 0755 ${B}/modules/egl/deqp-egl ${D}/${CTSDIR}
-	install -m 0755 ${B}/modules/gles2/deqp-gles2 ${D}/${CTSDIR}
-	install -m 0755 ${B}/modules/gles3/deqp-gles3 ${D}/${CTSDIR}
-	install -m 0755 ${B}/modules/gles31/deqp-gles31 ${D}/${CTSDIR}
-	install -m 0755 ${B}/modules/internal/de-internal-tests ${D}/${CTSDIR}
-
-	rm -r ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
-	rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
-	rm -r ${D}/${CTSDIR}/common/subgroups/*.a ${D}/${CTSDIR}/common/subgroups/cmake_install.cmake ${D}/${CTSDIR}/common/subgroups/CMakeFiles
-}
-
-SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
-LTO = ""
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
new file mode 100644
index 0000000000..024a1719d0
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "OpenGL CTS"
+
+require khronos-cts.inc
+# opengl-es-cts-3.2.8.0
+SRCREV_vk-gl-cts = "317f467fac032b88a4789e4345421f92c4e8716d"
+SRCREV_amber = "209d92e2c27a333e723d24497e8c7a07b2f2eb39"
+SRCREV_glslang = "9158061398a96033c990e69156bd28c67114544b"
+SRCREV_spirv-headers = "449bc986ba6f4c5e10e32828783f9daef2a77644"
+SRCREV_spirv-tools = "ee30773650eca50b1cd3c913babcc2b50d7b91fd"
+# Not yet needed
+SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
+SRCREV_vulkan-docs = "d70e01c0be7b8a7d20b186b30b29a75b18bba75d"
+SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+
+SRC_URI += "file://0001-Remove-dead-variable-984.patch;patchdir=external/amber/src"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}/${CTSDIR}
+	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
+
+	install -m 0755 ${B}/modules/egl/deqp-egl ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles2/deqp-gles2 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles3/deqp-gles3 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles31/deqp-gles31 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/internal/de-internal-tests ${D}/${CTSDIR}
+
+	rm -rf ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
+	rm -rf ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
+	rm -rf ${D}/${CTSDIR}/common/subgroups/*.a ${D}/${CTSDIR}/common/subgroups/cmake_install.cmake ${D}/${CTSDIR}/common/subgroups/CMakeFiles
+}
+
+SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+LTO = ""
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
deleted file mode 100644
index f816c1bd17..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Vulkan CTS"
-
-require khronos-cts.inc
-# vulkan-cts-1.2.6.0
-SRCREV_vk-gl-cts = "2cab49df5ad25a2d0061152367a21c6da83ed097"
-SRCREV_amber = "dabae26164714abf951c6815a2b4513260f7c6a4"
-SRCREV_glslang = "5c4f421121c4d24aad23a507e630dc5dc6c92c7c"
-SRCREV_spirv-headers = "faa570afbc91ac73d594d787486bcf8f2df1ace0"
-SRCREV_spirv-tools = "f11f7434815838bbad349124767b258ce7df41f0"
-SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
-
-S = "${WORKDIR}/git"
-
-REQUIRED_DISTRO_FEATURES = "vulkan"
-inherit features_check
-
-DEPENDS += " vulkan-loader"
-
-do_install() {
-	install -d ${D}/${CTSDIR}
-	cp -r ${B}/external/vulkancts/modules/vulkan/* ${D}/${CTSDIR}/
-	rm -r ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
-	rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
-}
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
new file mode 100644
index 0000000000..c996eb1f76
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Vulkan CTS"
+
+require khronos-cts.inc
+# vulkan-cts-1.3.3.1
+SRCREV_vk-gl-cts = "6024a88390942876147a88dce82bbed73b866c1b"
+SRCREV_amber = "8b145a6c89dcdb4ec28173339dd176fb7b6f43ed"
+SRCREV_glslang = "7dda6a6347b0bd550e202942adee475956ef462a"
+SRCREV_spirv-headers = "b765c355f488837ca4c77980ba69484f3ff277f5"
+SRCREV_spirv-tools = "b930e734ea198b7aabbbf04ee1562cf6f57962f0"
+SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
+SRCREV_vulkan-docs = "9b5562187a8ad72c171410b036ceedbc450153ba"
+SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+
+SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+inherit features_check
+
+DEPENDS += " vulkan-loader"
+
+do_install() {
+	install -d ${D}/${CTSDIR}
+	cp -r ${B}/external/vulkancts/modules/vulkan/* ${D}/${CTSDIR}/
+	rm -rf ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
+	rm -rf ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
+}
-- 
2.37.3


