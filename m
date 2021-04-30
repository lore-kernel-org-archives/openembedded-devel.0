Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.5998.1619747515730106492
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 18:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ihMqVT2h;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id j6so8037408pfh.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 18:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g968UzJ3YaU1dsfWK1MMwTbPrh8XD24mE4yfdAMa7uQ=;
        b=ihMqVT2hDCFgDdZZii+Ppcrkt4q7SiBaN0fq9uxoiZLYCEh8lw3kTxaWFXY7ictX7W
         CCeue06nGu0awDCoHTuWRzG0cesQDO043EEEa2Q1Sgdc1IKGHnxMQ8owuRt+vB7jkbe/
         C/VpUjIGzBnwdY+id5MjYM80ev8PUkPImGGsJIHfQ0eSVQEag/ZPZBNczH1cn6o/8Dbt
         ZcnFf7izZq/LgLn4QHBW4nSpD9/XiIgti59lcw6YqCR3d67mvna1kajlb8XrDGPXSfcY
         bxeS41NC+YtnduO7JIViMrYe6O+vwDLuttPSEPCbrMVOlg0g+qajrl0DhUT/OthZ7TUw
         ZJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g968UzJ3YaU1dsfWK1MMwTbPrh8XD24mE4yfdAMa7uQ=;
        b=P0TJ86+AZXCQ0mjLsoOiWR7PREg2gQj/URNRaDyzlEjIzEAXIfqmqclC/mOAg+jROI
         aja2z96nfKIK1/FVNLhv+nPB2T3GAWGassK+ruUn3TP2ibpv0GWaeyhqUNY0/asWgDbq
         27uGSIfCren0kj/6hBnbIgbAzwBZG2m6EvG1ZNR5KmcIS92zsvSOihruGGCKhjhOszgU
         RqlOud1ax4C9KGDFEcG8lZbyQVvRBL62gQMaDA93vTZU806Bk1UYT+Qsm8NWwnPUTuvq
         8FPi8j8ycCYMczwUOs+eOK4DFmAC34k+zA3gKsLSDDvf0+zs/AiW6X7GUmQ4vm9wP7kZ
         hj5g==
X-Gm-Message-State: AOAM532jeSnbaVRI9krtrPbfBszwWFZxbyIM1QsxhpB6E+nfTvo3TPag
	M+uWvxnzyPk0SyAE0dxEf3/no2IapSKJ5w==
X-Google-Smtp-Source: ABdhPJwGY40C/Vp9jC/nus71WtjRORah28m4pAiiDYtsCxaeo7RWOT4gXD8gofrVHJ5QWKGfCHTynA==
X-Received: by 2002:aa7:948b:0:b029:25c:f974:e0b4 with SMTP id z11-20020aa7948b0000b029025cf974e0b4mr2517129pfk.81.1619747514557;
        Thu, 29 Apr 2021 18:51:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id h1sm341752pfh.72.2021.04.29.18.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 18:51:54 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] vk-gl-cts: Fix build with GCC 11
Date: Thu, 29 Apr 2021 18:51:52 -0700
Message-Id: <20210430015152.1997831-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add patches to fix with c++17
Forward port musl patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Upgrade the revisions to latest releases

 ...-not-error-on-uninitialized-warnings.patch | 28 ------
 ...ude-limits-header-for-numeric_limits.patch | 88 +++++++++++++++++++
 ...-GCC-11-uninit-variable-warnings-946.patch | 73 +++++++++++++++
 .../files/fix-clang-private-operator.patch    |  6 +-
 .../vk-gl-cts/files/fix-musl.patch            | 24 +++--
 .../vk-gl-cts/khronos-cts.inc                 |  4 +
 ...ts_3.2.6.1.bb => opengl-es-cts_3.2.7.0.bb} | 14 ++-
 ...n-cts_1.2.3.2.bb => vulkan-cts_1.2.6.0.bb} | 12 +--
 8 files changed, 189 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.6.1.bb => opengl-es-cts_3.2.7.0.bb} (70%)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.2.3.2.bb => vulkan-cts_1.2.6.0.bb} (62%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch
deleted file mode 100644
index 4f3c7554cf..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Do-not-error-on-uninitialized-warnings.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f9906a3a1b7f1ade7a6c4e1a8aa67cb3a5e663a9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Mar 2021 11:33:15 -0800
-Subject: [PATCH] Do not error on uninitialized warnings
-
-code in verifier.cc violates C/C++ aliasing rules so code should be
-perhaps changed to use a union
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- external/amber/src/CMakeLists.txt | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/external/amber/src/CMakeLists.txt b/external/amber/src/CMakeLists.txt
-index 80a0df7..4323c81 100644
---- a/external/amber/src/CMakeLists.txt
-+++ b/external/amber/src/CMakeLists.txt
-@@ -133,6 +133,7 @@ elseif("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
-     -Werror
-     -Wextra
-     -Wno-unknown-pragmas
-+    -Wno-error=uninitialized
-     -Wpedantic
-     -pedantic-errors)
- elseif(MSVC)
---
-2.30.1
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
new file mode 100644
index 0000000000..746497d047
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
@@ -0,0 +1,88 @@
+From aec0be857ed3faef8802c7fd61f3d7798a565108 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Apr 2021 16:03:42 -0700
+Subject: [PATCH] Include <limits> header for numeric_limits
+
+Fixes
+vulkancts/framework/vulkan/vkRayTracingUtil.hpp:116:32: error: 'numeric_limits' is not a member of 'std'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/vulkan/vkRayTracingUtil.hpp                           | 1 +
+ modules/vulkan/api/vktApiBufferTests.cpp                        | 1 +
+ modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp | 2 ++
+ 3 files changed, 4 insertions(+)
+
+--- a/framework/vulkan/vkRayTracingUtil.hpp
++++ b/framework/vulkan/vkRayTracingUtil.hpp
+@@ -33,6 +33,7 @@
+ #include "tcuVector.hpp"
+ #include "tcuVectorType.hpp"
+ 
++#include <limits>
+ #include <vector>
+ 
+ namespace vk
+--- a/modules/vulkan/api/vktApiBufferTests.cpp
++++ b/modules/vulkan/api/vktApiBufferTests.cpp
+@@ -35,6 +35,7 @@
+ #include "tcuPlatform.hpp"
+ 
+ #include <algorithm>
++#include <limits>
+ 
+ namespace vkt
+ {
+--- a/modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp
++++ b/modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp
+@@ -28,6 +28,8 @@
+ #include "vktSpvAsmComputeShaderCase.hpp"
+ #include "vktSpvAsmGraphicsShaderTestUtil.hpp"
+ 
++#include <limits>
++
+ namespace vkt
+ {
+ namespace SpirVAssembly
+--- a/modules/vulkan/memory/vktMemoryDeviceMemoryReportTests.cpp
++++ b/modules/vulkan/memory/vktMemoryDeviceMemoryReportTests.cpp
+@@ -40,6 +40,7 @@
+ 
+ #include "deSharedPtr.hpp"
+ 
++#include <limits>
+ #include <set>
+ #include <vector>
+ 
+--- a/modules/vulkan/draw/vktDrawDepthClampTests.cpp
++++ b/modules/vulkan/draw/vktDrawDepthClampTests.cpp
+@@ -38,6 +38,7 @@
+ #include "vkQueryUtil.hpp"
+ #include "tcuTextureUtil.hpp"
+ 
++#include <limits>
+ #include <cmath>
+ 
+ namespace vkt
+--- a/modules/vulkan/wsi/vktWsiFullScreenExclusiveTests.cpp
++++ b/modules/vulkan/wsi/vktWsiFullScreenExclusiveTests.cpp
+@@ -39,6 +39,8 @@
+ #include "tcuPlatform.hpp"
+ #include "tcuCommandLine.hpp"
+ 
++#include <limits>
++
+ #if ( DE_OS == DE_OS_WIN32 )
+ 	#define NOMINMAX
+ 	#define WIN32_LEAN_AND_MEAN
+--- a/modules/vulkan/synchronization/vktSynchronizationUtil.cpp
++++ b/modules/vulkan/synchronization/vktSynchronizationUtil.cpp
+@@ -21,6 +21,7 @@
+  * \brief Synchronization tests utilities
+  *//*--------------------------------------------------------------------*/
+ 
++#include <limits>
+ #include "vktSynchronizationUtil.hpp"
+ #include "vkTypeUtil.hpp"
+ #include "vkCmdUtil.hpp"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
new file mode 100644
index 0000000000..6c87cad0a6
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch
@@ -0,0 +1,73 @@
+From 9cd614dd5481a4fdf552effac4820f51a10092c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mika=20V=C3=A4in=C3=B6l=C3=A4?=
+ <33728696+mvainola@users.noreply.github.com>
+Date: Wed, 7 Apr 2021 13:12:17 +0300
+Subject: [PATCH] Workaround for GCC 11 uninit variable warnings (#946)
+
+Building Amber with GCC 11.0.1 produces some uninitialized variable
+warnings. This commit works around them by replacing
+reinterpret_cast with memcpy when type punning unsigned integers to
+floats.
+
+Upstream-Status: Backport [https://github.com/google/amber/commit/aa69a0ac23ea7f68dd32bbef210546a5d84c1734]
+---
+ src/float16_helper.cc | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/src/float16_helper.cc b/src/float16_helper.cc
+index 617bd72..5cb35e7 100644
+--- a/src/float16_helper.cc
++++ b/src/float16_helper.cc
+@@ -15,6 +15,7 @@
+ #include "src/float16_helper.h"
+ 
+ #include <cassert>
++#include <cstring>
+ 
+ // Float10
+ // | 9 8 7 6 5 | 4 3 2 1 0 |
+@@ -75,8 +76,11 @@ float HexFloat16ToFloat(const uint8_t* value) {
+   }
+ 
+   uint32_t hex = sign | exponent | mantissa;
+-  float* hex_float = reinterpret_cast<float*>(&hex);
+-  return *hex_float;
++  float hex_float;
++  static_assert((sizeof(uint32_t) == sizeof(float)),
++                "sizeof(uint32_t) != sizeof(float)");
++  memcpy(&hex_float, &hex, sizeof(float));
++  return hex_float;
+ }
+ 
+ // Convert float |value| whose size is 11 bits to 32 bits float
+@@ -89,8 +93,11 @@ float HexFloat11ToFloat(const uint8_t* value) {
+   uint32_t mantissa = (static_cast<uint32_t>(value[0]) & 0x3f) << 17U;
+ 
+   uint32_t hex = exponent | mantissa;
+-  float* hex_float = reinterpret_cast<float*>(&hex);
+-  return *hex_float;
++  float hex_float;
++  static_assert((sizeof(uint32_t) == sizeof(float)),
++                "sizeof(uint32_t) != sizeof(float)");
++  memcpy(&hex_float, &hex, sizeof(float));
++  return hex_float;
+ }
+ 
+ // Convert float |value| whose size is 10 bits to 32 bits float
+@@ -103,8 +110,11 @@ float HexFloat10ToFloat(const uint8_t* value) {
+   uint32_t mantissa = (static_cast<uint32_t>(value[0]) & 0x1f) << 18U;
+ 
+   uint32_t hex = exponent | mantissa;
+-  float* hex_float = reinterpret_cast<float*>(&hex);
+-  return *hex_float;
++  float hex_float;
++  static_assert((sizeof(uint32_t) == sizeof(float)),
++                "sizeof(uint32_t) != sizeof(float)");
++  memcpy(&hex_float, &hex, sizeof(float));
++  return hex_float;
+ }
+ 
+ }  // namespace
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
index b4573b38b5..ea7659c698 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
@@ -1,7 +1,5 @@
-Index: git/external/glslang/src/glslang/Include/PoolAlloc.h
-===================================================================
---- git.orig/external/glslang/src/glslang/Include/PoolAlloc.h
-+++ git/external/glslang/src/glslang/Include/PoolAlloc.h
+--- a/external/glslang/src/glslang/Include/PoolAlloc.h
++++ b/external/glslang/src/glslang/Include/PoolAlloc.h
 @@ -240,8 +240,9 @@ protected:
  
      int numCalls;           // just an interesting statistic
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
index 4116ae7d14..99cb87b301 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
@@ -1,19 +1,15 @@
-Index: git/framework/delibs/dethread/CMakeLists.txt
-===================================================================
---- git.orig/framework/delibs/dethread/CMakeLists.txt
-+++ git/framework/delibs/dethread/CMakeLists.txt
-@@ -39,6 +39,7 @@ include_directories(
- 
- if (DE_OS_IS_UNIX)
- 	add_definitions(-D_GNU_SOURCE)
+--- a/framework/delibs/dethread/CMakeLists.txt
++++ b/framework/delibs/dethread/CMakeLists.txt
+@@ -42,6 +42,7 @@ if (DE_OS_IS_UNIX)
+ 		add_definitions(-D__BSD_VISIBLE)
+ 		add_definitions(-D_XOPEN_SOURCE=600)
+ 	endif ()
 +	add_definitions(-D_XOPEN_SOURCE=600)
- 	set(DETHREAD_LIBS ${DETHREAD_LIBS} pthread)
- endif ()
+ 	add_definitions(-D_GNU_SOURCE)
  
-Index: git/framework/qphelper/CMakeLists.txt
-===================================================================
---- git.orig/framework/qphelper/CMakeLists.txt
-+++ git/framework/qphelper/CMakeLists.txt
+ 	set(DETHREAD_LIBS ${DETHREAD_LIBS} pthread)
+--- a/framework/qphelper/CMakeLists.txt
++++ b/framework/qphelper/CMakeLists.txt
 @@ -28,6 +28,7 @@ set(QPHELPER_LIBS
  if (DE_OS_IS_UNIX OR DE_OS_IS_QNX)
  	# For vsnprintf()
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index e64a935dda..d0f0e23429 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -22,6 +22,10 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 
 DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
 
+SRC_URI += "file://0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch;patchdir=external/amber/src \
+            file://0001-Include-limits-header-for-numeric_limits.patch;patchdir=external/vulkancts \
+"
+
 SRC_URI_append_libc-musl = "\
 	file://fix-musl.patch \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
similarity index 70%
rename from meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
index 184547aa76..a67992ee95 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.7.0.bb
@@ -1,16 +1,14 @@
 DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
-# opengl-es-cts-3.2.6.1
-SRCREV_vk-gl-cts = "7e023f81b4fff54b558882fe739d7c959d0a02a8"
-SRCREV_amber = "d26ee22dd7faab1845a531d410f7ec1db407402a"
-SRCREV_glslang = "c538b5d796fb24dd418fdd650c7f76e56bcc3dd8"
-SRCREV_spirv-headers = "e4322e3be589e1ddd44afb20ea842a977c1319b8"
-SRCREV_spirv-tools = "1eb89172a82b436d8037e8a8c29c80f7e1f7df74"
+# opengl-es-cts-3.2.7.0
+SRCREV_vk-gl-cts = "7cba7113c40f2ff03573c8c2c90661b2249e04fa"
+SRCREV_amber = "4d0115cccfcb3b73d20b6513b1c40748e6403c50"
+SRCREV_glslang = "ffccefddfd9a02ec0c0b6dd04ef5e1042279c97f"
+SRCREV_spirv-headers = "104ecc356c1bea4476320faca64440cd1df655a3"
+SRCREV_spirv-tools = "cd590fa3341284cd6d1ee82366155786cfd44c96"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
-SRC_URI += "file://0001-Do-not-error-on-uninitialized-warnings.patch"
-
 S = "${WORKDIR}/git"
 
 do_install() {
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.2.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
similarity index 62%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.2.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
index f07b12decd..f816c1bd17 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.2.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.6.0.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
-# vulkan-cts-1.2.3.2
-SRCREV_vk-gl-cts = "5cd2240b60825fbbf6bd9ddda6af176ee3100c70"
-SRCREV_amber = "a40bef4dba98d2d80b48e5a940d8574fbfceb197"
-SRCREV_glslang = "b5f003d7a3ece37db45578a8a3140b370036fc64"
-SRCREV_spirv-headers = "f8bf11a0253a32375c32cad92c841237b96696c0"
-SRCREV_spirv-tools = "d2b486219495594f2e5d0e8d457fc234a3460b3b"
+# vulkan-cts-1.2.6.0
+SRCREV_vk-gl-cts = "2cab49df5ad25a2d0061152367a21c6da83ed097"
+SRCREV_amber = "dabae26164714abf951c6815a2b4513260f7c6a4"
+SRCREV_glslang = "5c4f421121c4d24aad23a507e630dc5dc6c92c7c"
+SRCREV_spirv-headers = "faa570afbc91ac73d594d787486bcf8f2df1ace0"
+SRCREV_spirv-tools = "f11f7434815838bbad349124767b258ce7df41f0"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

