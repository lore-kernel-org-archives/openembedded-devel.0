Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.4693.1619739768882384444
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Apr 2021 16:42:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OEJB5xrq;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id m37so5671233pgb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Apr 2021 16:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TT1Vx8/utE4UQKL87E06FopWxCySwtqIQi/YvJnlxuE=;
        b=OEJB5xrqHSKHIiTaQ+LtndBbWXuDt89K3DdMHbfNNTpKIEBC95t7X/I3KfART1LgU0
         SWfckFkQjioZz09qB44mais3GoKnB6gQoi6tMurRazjcBh/2TjCDaGbWd/AlNxQ/3tsl
         zJ0u/wMm8pk5lIcj0Si7MAkLpVq8uTNjWcmGgHq793A+FqWjIpcGqnQg8xq6totH7BuJ
         LKpzjj/9YuI/dH722VqTYN1T2a96vhHwyQ5BoM9aMmAzRznRNv04eFPZxpOI3LhyjSel
         7coBF42Wln0tfHqSgT8GVborv+3H5MbIm5suLtQW+CI5n3w1QafdO/DTWNtNQdog/5fx
         OX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TT1Vx8/utE4UQKL87E06FopWxCySwtqIQi/YvJnlxuE=;
        b=TJNheIEX1VRe/Kn+7ETScb/nQzmkGcULgejOFNawCAi69SlpjcRUynkGgIFUdzNfsC
         Gw6zcw7LBwJt8S6+qSeJQ8MqCH5wuLvLQmmjuBHUbuse35zDZWPG9aBE+wWLWMYcGz/a
         gmTh4cdqDy/SErc6yKOhi4emp0D0DpE927U0f7tJXzsu2j0dtDoa80d08saYKF7woYl3
         McVBXrFn5+ySO9SK2BODG/HUOXrteZEfhC+b0sQjZ518ulh7+KASkkKR5MTgAvMKSWrI
         QsFsp9uX3pNn1PkYMYA5CjMPTrmEuxH318wvQPAxAANJe0yEhaq0sosG0+P5XCrOpY1m
         FMdA==
X-Gm-Message-State: AOAM532kYxje6f8bMA1eimOwVgLiN1E6PFYYTnSPtvtcMmO/feFf6BTj
	39U3ycK4/zgH5hY9M6EJjJ3822Ce+UamSA==
X-Google-Smtp-Source: ABdhPJwbB2I97sYwV0kR/IUKYPRq7FWfvwn2H083Ct5p/9h02JZc4tbh/SAj/2F4clRKBvhz/U6oiQ==
X-Received: by 2002:aa7:904e:0:b029:25a:4469:222a with SMTP id n14-20020aa7904e0000b029025a4469222amr2158808pfo.72.1619739767844;
        Thu, 29 Apr 2021 16:42:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id j21sm1802174pjl.27.2021.04.29.16.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 16:42:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] vk-gl-cts: Fix build with GCC 11
Date: Thu, 29 Apr 2021 16:42:45 -0700
Message-Id: <20210429234245.1905266-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-limits-header-for-numeric_limits.patch | 56 ++++++++++++++
 ...-GCC-11-uninit-variable-warnings-946.patch | 73 +++++++++++++++++++
 .../vk-gl-cts/khronos-cts.inc                 |  4 +
 3 files changed, 133 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Workaround-for-GCC-11-uninit-variable-warnings-946.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
new file mode 100644
index 0000000000..26575fe4fb
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-limits-header-for-numeric_limits.patch
@@ -0,0 +1,56 @@
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
+diff --git a/framework/vulkan/vkRayTracingUtil.hpp b/framework/vulkan/vkRayTracingUtil.hpp
+index 8446d74..7711af0 100644
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
+diff --git a/modules/vulkan/api/vktApiBufferTests.cpp b/modules/vulkan/api/vktApiBufferTests.cpp
+index a64577c..97cf062 100644
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
+diff --git a/modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp b/modules/vulkan/spirv_assembly/vktSpvAsmNonSemanticInfoTests.cpp
+index bd6089d..0b59f4c 100644
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
+-- 
+2.31.1
+
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
-- 
2.31.1

