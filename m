Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BA5ECE570
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 20:41:40 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.16604.1725741691465656839
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 13:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DVP+tD35;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d889ba25f7so2189166a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 13:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725741690; x=1726346490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mEtTu+DOQlMSVTaHumSMv8QqIb7LKz7GApbX9QcrVHs=;
        b=DVP+tD35K9oIcPFjeHmuvnh6wniElRZLPzBZWC87AzaXmjKIvRxsF9NxflryezVOMN
         CDxCclU5D2Kgmng73HzV8WtQvc67WAv6Fxbecp5PIQvJC6eRiQMdR6hA1U2TfVtf/sy2
         DvHYRSWjeOf7Zn9m2VBFgM1bSgkhMBitRnNvCmF2UMNrW9JPCLvQQmISy2BvwMgLeJuH
         fhdmo7S89Q9pok4OSj4LSAFwLQjJjuOWOvXoh73K3+4Wvi5L5qJiratl1E8ndndWuKF1
         yToc9ItSnJPfjQxdnpBv7DBzL36+W4l263v2HjhJWPEbtj5UpbFNUQarExyMW83shYRu
         2ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725741690; x=1726346490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEtTu+DOQlMSVTaHumSMv8QqIb7LKz7GApbX9QcrVHs=;
        b=rh7FWeX2hb9U3Db/1P2JDYl/U43JVwBwwLE+Fj01kDhoEAc6Y6191WJ7gH4OF3Ywz7
         SwDOYFpX6Qkl9GSDNn8db5NMP2DpN1QWW9j3KUpG2JEm9fx494aeHgGfT1LBadI/7/PY
         tBHXdJHrihUwfLa5Wr3nwmlf6Im+Pln/N3aKJDTY6IOfj4mkxhW1+NUbwyyE5+wAxu8g
         ot5tfN87Kjwqo1c7MSZTkWn8f9p1Z3JpkQdPSXUSlVuEaVa+H0Bw+JTl6axWMwBxEUjg
         Z2ADSW4I65BAIQv8/HQAcFCLMI0nqlxLhyLxDcwTww9iUFEYSUSYyT0bJbRLx+9AnLfK
         M7hA==
X-Gm-Message-State: AOJu0YyPlISNDwez6+luFEoyltF6XXbHFATZuDLp4L/0FHq2QwwsX3p+
	J2QJWJQFImpLEpLdEHKaXJRjT+GLKatOkwWE4mai2gmhyOzgqwlU4mPDsg/I
X-Google-Smtp-Source: AGHT+IH3vWvl4Hvu1MKRr65rxNLpvQ/3IcprFL6yhZxDGRWawTLf2N7Kq0Dt60KrG6ms1MHYUnRJGw==
X-Received: by 2002:a17:90a:f48b:b0:2c1:9892:8fb with SMTP id 98e67ed59e1d1-2dad4de4c5bmr6985302a91.5.1725741690179;
        Sat, 07 Sep 2024 13:41:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4cdb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c59c9sm1694058a91.24.2024.09.07.13.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 13:41:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opengl-es-cts,vulkan-cts: Upgrade recipes to 3.2.11.0 and 1.3.9.2
Date: Sat,  7 Sep 2024 13:41:27 -0700
Message-ID: <20240907204127.121045-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 20:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112120

- Drop patches which are upstreamed.
- Move common patches to files/ dir
- Use gcc to compile for now as it does not work with clang+libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch |  22 ++--
 ...0001-use-library-sonames-for-linking.patch | 123 ++++++++++++++++++
 ...1-vulkan-cts-include-missing-cstdint.patch |  34 -----
 ...01-vulkancts-Include-missing-cstdint.patch |  32 -----
 .../files/fix-clang-private-operator.patch    |   2 +-
 .../vk-gl-cts/files/fix-musl.patch            |   4 +-
 .../vk-gl-cts/files/gen-framework-path.patch  |  20 ---
 .../vk-gl-cts/khronos-cts.inc                 |  29 +++--
 ...0001-use-library-sonames-for-linking.patch | 114 ----------------
 ...s_3.2.9.3.bb => opengl-es-cts_3.2.11.0.bb} |  24 ++--
 ...0001-use-library-sonames-for-linking.patch | 114 ----------------
 .../vk-gl-cts/vulkan-cts_1.3.7.3.bb           |  41 ------
 .../vk-gl-cts/vulkan-cts_1.3.9.2.bb           |  32 +++++
 13 files changed, 194 insertions(+), 397 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkan-cts-include-missing-cstdint.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts/0001-use-library-sonames-for-linking.patch
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.9.3.bb => opengl-es-cts_3.2.11.0.bb} (61%)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-use-library-sonames-for-linking.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
index f659e36066..9eef9a702e 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
@@ -15,15 +15,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/framework/platform/CMakeLists.txt
 +++ b/framework/platform/CMakeLists.txt
-@@ -73,8 +73,9 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
- 			add_definitions(-DDEQP_SUPPORT_WAYLAND=1)
- 			include_directories(lnx/wayland)
- 
--			pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
+@@ -83,8 +83,9 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
+ 				configure_file(${WAYLAND_XDG_SHELL_SRC_DIR}/xdg-shell.c ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.c COPYONLY)
+ 				configure_file(${WAYLAND_XDG_SHELL_SRC_DIR}/xdg-shell.h ${DEQP_XDG_SHELL_GEN_OUTPUTS_DIR}/xdg-shell.h COPYONLY)
+ 			else ()
+-				pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
 -
-+			if (NOT WAYLAND_PROTOCOLS_DIR)
-+				pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
-+			endif()
- 			if (NOT WAYLAND_SCANNER)
- 				pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
- 			endif()
++				if (NOT WAYLAND_PROTOCOL_DIR)
++					pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
++				endif()
+ 				if (NOT WAYLAND_SCANNER)
+ 					pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
+ 				endif()
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
new file mode 100644
index 0000000000..774b7aefee
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
@@ -0,0 +1,123 @@
+From acd25c4b8d5b7e420a7a89bdfd6551c70de828b3 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Thu, 23 Sep 2021 19:36:43 -0400
+Subject: [PATCH] use library sonames for linking
+
+The recommended "best practices" for applications is to link to library
+sonames (e.g. libGL.so.1) instead of library names (e.g. libGL.so). This
+ensures that applications don't try to use libraries if an incompatible ABI
+change occurs.
+
+Upstream-Status: Denied [https://github.com/KhronosGroup/VK-GL-CTS/pull/288]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ framework/egl/egluGLContextFactory.cpp                      | 4 ++--
+ framework/egl/wrapper/eglwLibrary.cpp                       | 2 +-
+ framework/platform/android/tcuAndroidPlatform.cpp           | 2 +-
+ framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp   | 2 +-
+ .../platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp | 2 +-
+ framework/platform/surfaceless/tcuSurfacelessPlatform.cpp   | 6 +++---
+ 6 files changed, 9 insertions(+), 9 deletions(-)
+
+--- a/framework/egl/egluGLContextFactory.cpp
++++ b/framework/egl/egluGLContextFactory.cpp
+@@ -63,7 +63,7 @@ using std::vector;
+ #if (DE_OS == DE_OS_WIN32)
+ #define DEQP_GLES2_LIBRARY_PATH "libGLESv2.dll"
+ #else
+-#define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
++#define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
+ #endif
+ #endif
+ 
+@@ -75,7 +75,7 @@ using std::vector;
+ #if (DE_OS == DE_OS_WIN32)
+ #define DEQP_OPENGL_LIBRARY_PATH "opengl32.dll"
+ #else
+-#define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
++#define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
+ #endif
+ #endif
+ 
+--- a/framework/egl/wrapper/eglwLibrary.cpp
++++ b/framework/egl/wrapper/eglwLibrary.cpp
+@@ -145,7 +145,7 @@ DefaultLibrary::~DefaultLibrary(void)
+ const char *DefaultLibrary::getLibraryFileName(void)
+ {
+ #if (DE_OS == DE_OS_ANDROID) || (DE_OS == DE_OS_UNIX)
+-    return "libEGL.so";
++    return "libEGL.so.1";
+ #elif (DE_OS == DE_OS_WIN32)
+     return "libEGL.dll";
+ #else
+--- a/framework/platform/android/tcuAndroidPlatform.cpp
++++ b/framework/platform/android/tcuAndroidPlatform.cpp
+@@ -56,7 +56,7 @@ static const eglu::NativeWindow::Capabil
+ class NativeDisplay : public eglu::NativeDisplay
+ {
+ public:
+-    NativeDisplay(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so")
++    NativeDisplay(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so.1")
+     {
+     }
+     virtual ~NativeDisplay(void)
+@@ -223,7 +223,7 @@ class VulkanLibrary : public vk::Library
+ {
+ public:
+     VulkanLibrary(const char *libraryPath)
+-        : m_library(libraryPath != DE_NULL ? libraryPath : "libvulkan.so")
++        : m_library(libraryPath != DE_NULL ? libraryPath : "libvulkan.so.1")
+         , m_driver(m_library)
+     {
+     }
+--- a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
++++ b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
+@@ -77,7 +77,7 @@ using tcu::TextureLevel;
+ class Library : public eglw::DefaultLibrary
+ {
+ public:
+-    Library(void) : eglw::DefaultLibrary("libEGL.so")
++    Library(void) : eglw::DefaultLibrary("libEGL.so.1")
+     {
+     }
+ 
+--- a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
++++ b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
+@@ -64,7 +64,7 @@ public:
+     Display(MovePtr<wayland::Display> waylandDisplay)
+         : NativeDisplay(CAPABILITIES, EGL_PLATFORM_WAYLAND_KHR, "EGL_KHR_platform_wayland")
+         , m_display(waylandDisplay)
+-        , m_library("libEGL.so")
++        , m_library("libEGL.so.1")
+     {
+     }
+ 
+--- a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
++++ b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
+@@ -69,7 +69,7 @@ using std::vector;
+ 
+ // Default library names
+ #if !defined(DEQP_GLES2_LIBRARY_PATH)
+-#define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
++#define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
+ #endif
+ 
+ #if !defined(DEQP_GLES3_LIBRARY_PATH)
+@@ -77,7 +77,7 @@ using std::vector;
+ #endif
+ 
+ #if !defined(DEQP_OPENGL_LIBRARY_PATH)
+-#define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
++#define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
+ #endif
+ 
+ #if !defined(DEQP_VULKAN_LIBRARY_PATH)
+@@ -258,7 +258,7 @@ glu::RenderContext *ContextFactory::crea
+ 
+ EglRenderContext::EglRenderContext(const glu::RenderConfig &config, const tcu::CommandLine &cmdLine,
+                                    const glu::RenderContext *sharedContext)
+-    : m_egl("libEGL.so")
++    : m_egl("libEGL.so.1")
+     , m_contextType(config.type)
+     , m_eglDisplay(EGL_NO_DISPLAY)
+     , m_eglContext(EGL_NO_CONTEXT)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkan-cts-include-missing-cstdint.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkan-cts-include-missing-cstdint.patch
deleted file mode 100644
index 0dd59713a1..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkan-cts-include-missing-cstdint.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b07f6ecd6ab83b788301a555dc546b9a5c9dd8a2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jan 2023 19:19:34 -0800
-Subject: [PATCH] Include missing <cstdint>
-
-This error is seen with gcc-13 where include headers are not implicitly
-included [1]
-
-Fixes errors e.g.
-error: 'uint32_t' does not name a type
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/378]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- framework/common/tcuDefs.hpp | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/framework/common/tcuDefs.hpp b/framework/common/tcuDefs.hpp
-index ad3d0736d..6dfac10fb 100644
---- a/framework/common/tcuDefs.hpp
-+++ b/framework/common/tcuDefs.hpp
-@@ -26,6 +26,7 @@
- #include "deDefs.hpp"
- #include "qpTestLog.h"
- 
-+#include <cstdint>
- #include <string>
- #include <stdexcept>
- 
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
deleted file mode 100644
index 40aea8f203..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1b7646ced0f0b969f818084887885827ed1a4244 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 May 2021 17:31:33 -0700
-Subject: [PATCH] vulkancts: Include missing <cstdint>
-
-Fixes build with gcc-13
-
-../git/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp:2798:102: error: 'uintptr_t' in namespace 'std' does not name a type
- 2798 |                 BufferDataType type              = static_cast<BufferDataType>(reinterpret_cast<std::uintptr_t>(expectedOutputs[resultIndex].getUserData()));
-      |                                                                                                      ^~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/378]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp        | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
-index ab02be1dc..3d3ee4829 100644
---- a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
-+++ b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
-@@ -33,6 +33,7 @@
- #include "deFloat16.h"
- #include "vkQueryUtil.hpp"
- #include "vkRefUtil.hpp"
-+#include <cstdint>
- #include <cstring>
- #include <vector>
- #include <limits>
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
index 4ecc371ca4..af59dd3e61 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
@@ -2,7 +2,7 @@ Upstream-Status: Pending
 
 --- a/external/glslang/src/glslang/Include/PoolAlloc.h
 +++ b/external/glslang/src/glslang/Include/PoolAlloc.h
-@@ -240,8 +240,9 @@ protected:
+@@ -245,8 +245,9 @@ protected:
  
      int numCalls;           // just an interesting statistic
      size_t totalBytes;      // just an interesting statistic
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
index 58dc1f24dd..717d489786 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
@@ -2,9 +2,9 @@ Upstream-Status: Pending
 
 --- a/framework/delibs/dethread/CMakeLists.txt
 +++ b/framework/delibs/dethread/CMakeLists.txt
-@@ -42,6 +42,7 @@ if (DE_OS_IS_UNIX)
+@@ -41,6 +41,7 @@ if (DE_OS_IS_UNIX)
+ 	if (${CMAKE_SYSTEM_NAME} STREQUAL "FreeBSD")
  		add_definitions(-D__BSD_VISIBLE)
- 		add_definitions(-D_XOPEN_SOURCE=600)
  	endif ()
 +	add_definitions(-D_XOPEN_SOURCE=600)
  	add_definitions(-D_GNU_SOURCE)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
deleted file mode 100644
index 8a8d8d2c32..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Prepend instead of append to the module search path, as this script needs to use
-the local module build, not the host module build.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/external/vulkancts/scripts/gen_framework.py b/external/vulkancts/scripts/gen_framework.py
-index 83c5329ce..10e720910 100755
---- a/external/vulkancts/scripts/gen_framework.py
-+++ b/external/vulkancts/scripts/gen_framework.py
-@@ -33 +33 @@ from collections import OrderedDict
--sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
-+sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
-diff --git a/external/vulkancts/scripts/gen_framework_c.py b/external/vulkancts/scripts/gen_framework_c.py
-index 95587e642..84b878cb2 100644
---- a/external/vulkancts/scripts/gen_framework_c.py
-+++ b/external/vulkancts/scripts/gen_framework_c.py
-@@ -28 +28 @@ import re
--sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
-+sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 09f1fbcaee..5f8cbbdfd2 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -3,20 +3,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "\
 	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
-	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
-	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=main \
-	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=main \
-	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=main \
-        git://github.com/open-source-parsers/jsoncpp.git;protocol=https;destsuffix=git/external/jsoncpp/src;name=jsoncpp;branch=master \
-        git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;destsuffix=git/external/vulkan-docs/src;name=vulkan-docs;branch=main \
-        https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
-        git://github.com/Igalia/ESExtractor.git;protocol=https;destsuffix=git/external/ESExtractor/src;name=ESExtractor;branch=main \
-        git://github.com/Igalia/vk_video_samples.git;protocol=https;destsuffix=git/external/nvidia-video-samples/src;name=video-parser;nobranch=1 \
+	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;nobranch=1 \
+	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;nobranch=1 \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;nobranch=1 \
+	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;nobranch=1 \
+	git://github.com/open-source-parsers/jsoncpp.git;protocol=https;destsuffix=git/external/jsoncpp/src;name=jsoncpp;nobranch=1 \
+	git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;destsuffix=git/external/vulkan-docs/src;name=vulkan-docs;nobranch=1 \
+	git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;destsuffix=git/external/vulkan-validationlayers/src;name=vulkan-validationlayers;nobranch=1 \
+	git://github.com/Igalia/ESExtractor.git;protocol=https;destsuffix=git/external/ESExtractor/src;name=ESExtractor;nobranch=1 \
+	git://github.com/Igalia/vk_video_samples.git;protocol=https;destsuffix=git/external/nvidia-video-samples/src;name=video-parser;nobranch=1 \
+	https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
 "
 
-S = "${WORKDIR}/git"
-
-SRCREV_FORMAT = "vk-gl-cts_amber_glslang_spirv-headers_spirv-tools_jsoncpp_vulkan-docs"
+SRCREV_FORMAT = "vk-gl-cts_amber_glslang_spirv-headers_spirv-tools_jsoncpp_video-parser_vulkan-docs_vulkan-validationlayers"
 
 S = "${WORKDIR}/git"
 
@@ -27,7 +26,7 @@ ANY_OF_DISTRO_FEATURES += "opengl vulkan"
 DEPENDS += "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
 
 SRC_URI += " \
-            file://0001-vulkancts-Include-missing-cstdint.patch \
+            file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
             file://0001-use-library-sonames-for-linking.patch \
 "
 
@@ -81,3 +80,7 @@ python __anonymous() {
 CTSDIR = "/usr/lib/${BPN}"
 
 FILES:${PN} += "${CTSDIR}"
+
+# does not work with libc++-19 due
+# error: implicit instantiation of undefined template 'std::char_traits<unsigned int>'
+TOOLCHAIN = "gcc"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts/0001-use-library-sonames-for-linking.patch
deleted file mode 100644
index b5a1d331ed..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts/0001-use-library-sonames-for-linking.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From acd25c4b8d5b7e420a7a89bdfd6551c70de828b3 Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <twoerner@gmail.com>
-Date: Thu, 23 Sep 2021 19:36:43 -0400
-Subject: [PATCH] use library sonames for linking
-
-The recommended "best practices" for applications is to link to library
-sonames (e.g. libGL.so.1) instead of library names (e.g. libGL.so). This
-ensures that applications don't try to use libraries if an incompatible ABI
-change occurs.
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/288]
-Signed-off-by: Trevor Woerner <twoerner@gmail.com>
----
- framework/egl/egluGLContextFactory.cpp                      | 4 ++--
- framework/egl/wrapper/eglwLibrary.cpp                       | 2 +-
- framework/platform/android/tcuAndroidPlatform.cpp           | 2 +-
- framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp   | 2 +-
- .../platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp | 2 +-
- framework/platform/surfaceless/tcuSurfacelessPlatform.cpp   | 6 +++---
- 6 files changed, 9 insertions(+), 9 deletions(-)
-
---- a/framework/egl/egluGLContextFactory.cpp
-+++ b/framework/egl/egluGLContextFactory.cpp
-@@ -63,7 +63,7 @@ using std::vector;
- #	if (DE_OS == DE_OS_WIN32)
- #		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.dll"
- #	else
--#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
-+#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
- #	endif
- #endif
- 
-@@ -75,7 +75,7 @@ using std::vector;
- #	if (DE_OS == DE_OS_WIN32)
- #		define DEQP_OPENGL_LIBRARY_PATH "opengl32.dll"
- #	else
--#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
-+#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
- #	endif
- #endif
- 
---- a/framework/egl/wrapper/eglwLibrary.cpp
-+++ b/framework/egl/wrapper/eglwLibrary.cpp
-@@ -148,7 +148,7 @@ DefaultLibrary::~DefaultLibrary (void)
- const char* DefaultLibrary::getLibraryFileName (void)
- {
- #if (DE_OS == DE_OS_ANDROID) || (DE_OS == DE_OS_UNIX)
--	return "libEGL.so";
-+	return "libEGL.so.1";
- #elif (DE_OS == DE_OS_WIN32)
- 	return "libEGL.dll";
- #else
---- a/framework/platform/android/tcuAndroidPlatform.cpp
-+++ b/framework/platform/android/tcuAndroidPlatform.cpp
-@@ -57,7 +57,7 @@ static const eglu::NativeWindow::Capabil
- class NativeDisplay : public eglu::NativeDisplay
- {
- public:
--									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so") {}
-+									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so.1") {}
- 	virtual							~NativeDisplay			(void) {}
- 
- 	virtual EGLNativeDisplayType	getLegacyNative			(void)			{ return EGL_DEFAULT_DISPLAY;	}
---- a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
-+++ b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
-@@ -75,7 +75,7 @@ class Library : public eglw::DefaultLibr
- {
- public:
- 	Library (void)
--		: eglw::DefaultLibrary("libEGL.so")
-+		: eglw::DefaultLibrary("libEGL.so.1")
- 	{
- 	}
- 
---- a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
-+++ b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
-@@ -66,7 +66,7 @@ public:
- 													 EGL_PLATFORM_WAYLAND_KHR,
- 													 "EGL_KHR_platform_wayland")
- 									, m_display		(waylandDisplay)
--									, m_library		("libEGL.so") {}
-+									, m_library		("libEGL.so.1") {}
- 
- 	~Display(void) {}
- 	wayland::Display&			getWaylandDisplay	(void)	{ return *m_display; }
---- a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
-+++ b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
-@@ -69,7 +69,7 @@ using std::vector;
- 
- // Default library names
- #if !defined(DEQP_GLES2_LIBRARY_PATH)
--#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
-+#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
- #endif
- 
- #if !defined(DEQP_GLES3_LIBRARY_PATH)
-@@ -77,7 +77,7 @@ using std::vector;
- #endif
- 
- #if !defined(DEQP_OPENGL_LIBRARY_PATH)
--#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
-+#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
- #endif
- 
- #if !defined(DEQP_VULKAN_LIBRARY_PATH)
-@@ -234,7 +234,7 @@ glu::RenderContext* ContextFactory::crea
- }
- 
- EglRenderContext::EglRenderContext(const glu::RenderConfig& config, const tcu::CommandLine& cmdLine)
--	: m_egl("libEGL.so")
-+	: m_egl("libEGL.so.1")
- 	, m_contextType(config.type)
- 	, m_eglDisplay(EGL_NO_DISPLAY)
- 	, m_eglContext(EGL_NO_CONTEXT)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
similarity index 61%
rename from meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
index 0656d724b4..7dd60dffd8 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.11.0.bb
@@ -1,25 +1,20 @@
 DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
-# opengl-es-cts-3.2.9.3
-SRCREV_vk-gl-cts = "7f5fb62245d535a1fc0bf50b2c7e5a342dc551fe"
-SRCREV_amber = "933ecb4d6288675a92eb1650e0f52b1d7afe8273"
-SRCREV_glslang = "a0ad0d7067521fff880e36acfb8ce453421c3f25"
-SRCREV_spirv-headers = "87d5b782bec60822aa878941e6b13c0a9a954c9b"
-SRCREV_spirv-tools = "f98473ceeb1d33700d01e20910433583e5256030"
+# opengl-es-cts-3.2.11.0
+SRCREV_vk-gl-cts = "66956d195169596472e956e3aebf2df8e3bd960d"
+SRCREV_amber = "0f003c2785489f59cd01bb2440fcf303149100f2"
+SRCREV_glslang = "4da479aa6afa43e5a2ce4c4148c572a03123faf3"
+SRCREV_spirv-headers = "ff2afc3afc48dff4eec2a10f0212402a80708e38"
+SRCREV_spirv-tools = "148c97f6876e427efd76d2328122c3075eab4b8f"
 SRCREV_ESExtractor = "ce5d7ebcf0ebb0d78385ee4cc34653eb6764bfc4"
 # Not yet needed
 SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
-SRCREV_vulkan-docs = "9a2e576a052a1e65a5d41b593e693ff02745604b"
-SRCREV_video-parser = "7d68747d3524842afaf050c5e00a10f5b8c07904"
+SRCREV_vulkan-docs = "ed4ba0242beb89a1795d6084709fa9e713559c94"
+SRCREV_vulkan-validationlayers = "a92629196a4fed15e59c74aa965dd47bd5ece3b7"    
+SRCREV_video-parser = "6821adf11eb4f84a2168264b954c170d03237699"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
-SRC_URI += "\
-        git://github.com/nvpro-samples/vk_video_samples.git;protocol=https;destsuffix=git/external/video-parser/src;name=video-parser;branch=main \
-        file://gen-framework-path.patch \
-        "
-S = "${WORKDIR}/git"
-
 do_install() {
 	install -d ${D}/${CTSDIR}
 	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
@@ -37,4 +32,3 @@ do_install() {
 
 SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
 LTO = ""
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-use-library-sonames-for-linking.patch
deleted file mode 100644
index f12abd0c1a..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-use-library-sonames-for-linking.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From acd25c4b8d5b7e420a7a89bdfd6551c70de828b3 Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <twoerner@gmail.com>
-Date: Thu, 23 Sep 2021 19:36:43 -0400
-Subject: [PATCH] use library sonames for linking
-
-The recommended "best practices" for applications is to link to library
-sonames (e.g. libGL.so.1) instead of library names (e.g. libGL.so). This
-ensures that applications don't try to use libraries if an incompatible ABI
-change occurs.
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/288]
-Signed-off-by: Trevor Woerner <twoerner@gmail.com>
----
- framework/egl/egluGLContextFactory.cpp                      | 4 ++--
- framework/egl/wrapper/eglwLibrary.cpp                       | 2 +-
- framework/platform/android/tcuAndroidPlatform.cpp           | 2 +-
- framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp   | 2 +-
- .../platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp | 2 +-
- framework/platform/surfaceless/tcuSurfacelessPlatform.cpp   | 6 +++---
- 6 files changed, 9 insertions(+), 9 deletions(-)
-
---- a/framework/egl/egluGLContextFactory.cpp
-+++ b/framework/egl/egluGLContextFactory.cpp
-@@ -63,7 +63,7 @@ using std::vector;
- #	if (DE_OS == DE_OS_WIN32)
- #		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.dll"
- #	else
--#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
-+#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
- #	endif
- #endif
- 
-@@ -75,7 +75,7 @@ using std::vector;
- #	if (DE_OS == DE_OS_WIN32)
- #		define DEQP_OPENGL_LIBRARY_PATH "opengl32.dll"
- #	else
--#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
-+#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
- #	endif
- #endif
- 
---- a/framework/egl/wrapper/eglwLibrary.cpp
-+++ b/framework/egl/wrapper/eglwLibrary.cpp
-@@ -148,7 +148,7 @@ DefaultLibrary::~DefaultLibrary (void)
- const char* DefaultLibrary::getLibraryFileName (void)
- {
- #if (DE_OS == DE_OS_ANDROID) || (DE_OS == DE_OS_UNIX)
--	return "libEGL.so";
-+	return "libEGL.so.1";
- #elif (DE_OS == DE_OS_WIN32)
- 	return "libEGL.dll";
- #else
---- a/framework/platform/android/tcuAndroidPlatform.cpp
-+++ b/framework/platform/android/tcuAndroidPlatform.cpp
-@@ -57,7 +57,7 @@ static const eglu::NativeWindow::Capabil
- class NativeDisplay : public eglu::NativeDisplay
- {
- public:
--									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so") {}
-+									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so.1") {}
- 	virtual							~NativeDisplay			(void) {}
- 
- 	virtual EGLNativeDisplayType	getLegacyNative			(void)			{ return EGL_DEFAULT_DISPLAY;	}
---- a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
-+++ b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
-@@ -75,7 +75,7 @@ class Library : public eglw::DefaultLibr
- {
- public:
- 	Library (void)
--		: eglw::DefaultLibrary("libEGL.so")
-+		: eglw::DefaultLibrary("libEGL.so.1")
- 	{
- 	}
- 
---- a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
-+++ b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
-@@ -66,7 +66,7 @@ public:
- 													 EGL_PLATFORM_WAYLAND_KHR,
- 													 "EGL_KHR_platform_wayland")
- 									, m_display		(waylandDisplay)
--									, m_library		("libEGL.so") {}
-+									, m_library		("libEGL.so.1") {}
- 
- 	~Display(void) {}
- 	wayland::Display&			getWaylandDisplay	(void)	{ return *m_display; }
---- a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
-+++ b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
-@@ -69,7 +69,7 @@ using std::vector;
- 
- // Default library names
- #if !defined(DEQP_GLES2_LIBRARY_PATH)
--#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
-+#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
- #endif
- 
- #if !defined(DEQP_GLES3_LIBRARY_PATH)
-@@ -77,7 +77,7 @@ using std::vector;
- #endif
- 
- #if !defined(DEQP_OPENGL_LIBRARY_PATH)
--#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
-+#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
- #endif
- 
- #if !defined(DEQP_VULKAN_LIBRARY_PATH)
-@@ -237,7 +237,7 @@ glu::RenderContext* ContextFactory::crea
- }
- 
- EglRenderContext::EglRenderContext(const glu::RenderConfig& config, const tcu::CommandLine& cmdLine, const glu::RenderContext *sharedContext)
--	: m_egl("libEGL.so")
-+	: m_egl("libEGL.so.1")
- 	, m_contextType(config.type)
- 	, m_eglDisplay(EGL_NO_DISPLAY)
- 	, m_eglContext(EGL_NO_CONTEXT)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
deleted file mode 100644
index 7492fe9aa4..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DESCRIPTION = "Vulkan CTS"
-
-require khronos-cts.inc
-
-SRC_URI += "git://github.com/Igalia/vk_video_samples.git;protocol=https;destsuffix=git/external/nvidia-video-samples/src;name=video-parser;nobranch=1"
-
-# vulkan-cts-1.3.7.3
-SRCREV_vk-gl-cts = "d71a36db16d98313c431829432a136dbda692a08"
-SRCREV_amber = "933ecb4d6288675a92eb1650e0f52b1d7afe8273"
-SRCREV_glslang = "c5117b328afc86e16edff6ed6afe0fe7872a7cf3"
-SRCREV_spirv-headers = "b8b9eb8640c8c0107ba580fbcb10f969022ca32c"
-SRCREV_spirv-tools = "bfc94f63a7adbcf8ae166f5f108ac9f69079efc0"
-SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
-SRCREV_vulkan-docs = "b9aad705f0d9e5e6734ac2ad671d5d1de57b05e0"
-SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
-# Not yet needed
-SRCREV_ESExtractor = "75ffcaf55bb069f7a23764194742d2fb78c7f71f"
-SRCREV_video-parser = "138bbe048221d315962ddf8413aa6a08cc62a381"
-
-SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
-            file://0001-vulkan-cts-include-missing-cstdint.patch \
-"
-
-TOOLCHAIN = "gcc"
-
-# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
-OECMAKE_CXX_FLAGS:remove:toolchain-gcc = "-O2"
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
-	rm -rf ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
-	rm -rf ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
-}
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
new file mode 100644
index 0000000000..4ba761b676
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.9.2.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Vulkan CTS"
+
+require khronos-cts.inc
+
+# vulkan-cts-1.3.9.2
+SRCREV_vk-gl-cts = "24c1b1498ba4f05777f47541968ffe686265c645"
+SRCREV_amber = "0f003c2785489f59cd01bb2440fcf303149100f2"
+SRCREV_glslang = "2b19bf7e1bc0b60cf2fe9d33e5ba6b37dfc1cc83"
+SRCREV_spirv-headers = "db5a00f8cebe81146cafabf89019674a3c4bf03d"
+SRCREV_spirv-tools = "4c7e1fa5c3d988cca0e626d359d30b117b9c2822"
+SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
+SRCREV_vulkan-docs = "7bb606eb87cde1d34f65f36f4d4c6f2c78f072c8"
+SRCREV_vulkan-validationlayers = "a92629196a4fed15e59c74aa965dd47bd5ece3b7"
+SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+# Not yet needed
+SRCREV_ESExtractor = "75ffcaf55bb069f7a23764194742d2fb78c7f71f"
+SRCREV_video-parser = "6821adf11eb4f84a2168264b954c170d03237699"
+
+# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
+OECMAKE_CXX_FLAGS:remove:toolchain-gcc = "-O2"
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

