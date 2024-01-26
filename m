Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E10C47DDB
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 17:25:28 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.4046.1706289920219622247
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jan 2024 09:25:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K0SHgWI9;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ddb1115e82so683444b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 09:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706289919; x=1706894719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gzz+vdajCSsnUNvuaNuoDNWo/BsPX89HdEThY3CmMe4=;
        b=K0SHgWI9FXrJwNcHNZGUiUB522Qy4dsH4fkkSGyg/mL03d1146cwX09NiipHF4kv/e
         toSQNe6U87lhzkogs4r01noxFjGRvXRa+pcAAt1bJLTLZNE8kWRMVMe0QRaJNQRzEygu
         I1Q9iiVLJwanWBIOF/rxplgkrs7rguR9Ywuza77jHT2gsSIAct67xh9w0z7p/l/V5g28
         DOHaqshTJIrqBe3/G97B6dK5S36U8/w199WIz1Rpz2DPVz24yIxWqKYcjrwODb+chrKT
         pl9oveLV1sv9JT8dNMEmgghsCFj/+jik02g6p3+bmX0osSDzEmTbmr6kWtInfVStbZcM
         50Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706289919; x=1706894719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gzz+vdajCSsnUNvuaNuoDNWo/BsPX89HdEThY3CmMe4=;
        b=ClmY7Sf/k5rO2ev5Se1tCXF+8Xp8pwG2JXsJ32NvYtNR0VxE6gXZ6zGwVNcQx7aCX7
         gedS0s0XMIcR5ic3UkmmwD/b2YIjpVy14LOpxuBg/4uPmcv27sZJcHeU0WD8ENx0Xwi+
         VkJv2n+fOGjDr0Ta7yJdPUhjWDMr+7cf3pQUyMAJwAaY66uq05hWZkHFjbpgdyNTqdgb
         hOlgP63hi9hBAPTSdQIeq464gmfGXwJdhNY2ii12HLzmMAi9POA17dNuw+fiow+ry7af
         zu33j++H5FmbhRq7+fFbfXOrhHJMTcLhPHpxf6WoLHII7I7SVa2TdsrOcF4toT0mw5G1
         Zo0w==
X-Gm-Message-State: AOJu0YxjqefYiSEp95Tgm8EyeLrWqFl3HBPa+aBRTXL1VjEVwG45xWVR
	RNvgzUHdNl2Np8cqC2uSRISmc8HozSujvpbyRzEOXTwcl7QiIfnKaSziz+HNAN8=
X-Google-Smtp-Source: AGHT+IGNwTJ7NSMoqXndDPx6eIwIVFpVPhzETWYaC3+VloQRsWnRFlIpu0jSPfFWiAK6+6xd6O8PLQ==
X-Received: by 2002:aa7:8c16:0:b0:6dd:8349:e333 with SMTP id c22-20020aa78c16000000b006dd8349e333mr136738pfd.40.1706289918959;
        Fri, 26 Jan 2024 09:25:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::edce])
        by smtp.gmail.com with ESMTPSA id ld10-20020a056a004f8a00b006d99f930607sm1367804pfb.140.2024.01.26.09.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 09:25:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] vulkan-cts: Upgrade to 1.3.7.3
Date: Fri, 26 Jan 2024 09:25:16 -0800
Message-ID: <20240126172516.3108163-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 17:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108465

Adjust for different patches between vulkan-cts and opengl-es-cts
Use gcc to compile vulkan-cts for now, it does not like libc++ headers
from clang-18

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch | 20 ++----
 .../files/0001-include-missing-cstdint.patch  | 61 -------------------
 .../vk-gl-cts/khronos-cts.inc                 |  3 +-
 ...0001-use-library-sonames-for-linking.patch |  0
 .../vk-gl-cts/opengl-es-cts_3.2.9.3.bb        |  4 ++
 ...0001-use-library-sonames-for-linking.patch |  4 +-
 ...n-cts_1.3.3.1.bb => vulkan-cts_1.3.7.3.bb} | 24 +++++---
 7 files changed, 27 insertions(+), 89 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
 copy meta-oe/recipes-graphics/vk-gl-cts/{files => opengl-es-cts}/0001-use-library-sonames-for-linking.patch (100%)
 rename meta-oe/recipes-graphics/vk-gl-cts/{files => vulkan-cts}/0001-use-library-sonames-for-linking.patch (96%)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.3.3.1.bb => vulkan-cts_1.3.7.3.bb} (53%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
index d7000b7da1..f659e36066 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
@@ -13,25 +13,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  framework/platform/CMakeLists.txt | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
 
-diff --git a/framework/platform/CMakeLists.txt b/framework/platform/CMakeLists.txt
-index c3ac463e4..030163f6c 100644
 --- a/framework/platform/CMakeLists.txt
 +++ b/framework/platform/CMakeLists.txt
-@@ -73,8 +73,12 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
+@@ -73,8 +73,9 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
  			add_definitions(-DDEQP_SUPPORT_WAYLAND=1)
  			include_directories(lnx/wayland)
  
 -			pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
--			pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
-+			if (NOT DEFINED WAYLAND_PROTOCOLS_DIR)
+-
++			if (NOT WAYLAND_PROTOCOLS_DIR)
 +				pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
 +			endif()
-+			if (NOT DEFINED WAYLAND_SCANNER)
-+				pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
-+			endif()
- 
- 			set(DEQP_XDG_SHELL_PROTOCOL ${WAYLAND_PROTOCOLS_DIR}/stable/xdg-shell/xdg-shell.xml)
- 			set(DEQP_XDG_SHELL_GEN_OUTPUTS_DIR ${PROJECT_BINARY_DIR}/framework/platform)
--- 
-2.37.3
-
+ 			if (NOT WAYLAND_SCANNER)
+ 				pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
+ 			endif()
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
deleted file mode 100644
index 47d9fc748a..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 74cf53d89529902ecdef5b230421bc4d30fd089b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 25 Jan 2023 15:36:14 -0800
-Subject: [PATCH] include missing <cstdint>
-
-gcc-13 exposed errors like below due to it removing indirect includes of
-these headers in libstdc++ [1]
-
-../git/external/amber/src/include/amber/shader_info.h:60:15: error: 'uint32_t' was not declared in this scope
-   60 |   std::vector<uint32_t> shader_data;
-      |               ^~~~~~~~
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Upstream-Status: Submitted [https://github.com/google/amber/pull/1016]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/amber/recipe.h                  | 1 +
- include/amber/shader_info.h             | 1 +
- src/descriptor_set_and_binding_parser.h | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/include/amber/recipe.h b/include/amber/recipe.h
-index 310a86a..1b83213 100644
---- a/include/amber/recipe.h
-+++ b/include/amber/recipe.h
-@@ -15,6 +15,7 @@
- #ifndef AMBER_RECIPE_H_
- #define AMBER_RECIPE_H_
- 
-+#include <cstdint>
- #include <string>
- #include <utility>
- #include <vector>
-diff --git a/include/amber/shader_info.h b/include/amber/shader_info.h
-index 6c9126a..b5ce751 100644
---- a/include/amber/shader_info.h
-+++ b/include/amber/shader_info.h
-@@ -15,6 +15,7 @@
- #ifndef AMBER_SHADER_INFO_H_
- #define AMBER_SHADER_INFO_H_
- 
-+#include <cstdint>
- #include <string>
- #include <vector>
- 
-diff --git a/src/descriptor_set_and_binding_parser.h b/src/descriptor_set_and_binding_parser.h
-index 145aa42..4b0d774 100644
---- a/src/descriptor_set_and_binding_parser.h
-+++ b/src/descriptor_set_and_binding_parser.h
-@@ -15,6 +15,7 @@
- #ifndef SRC_DESCRIPTOR_SET_AND_BINDING_PARSER_H_
- #define SRC_DESCRIPTOR_SET_AND_BINDING_PARSER_H_
- 
-+#include <cstdint>
- #include <string>
- 
- #include "amber/result.h"
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 04e4227915..09f1fbcaee 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -11,8 +11,7 @@ SRC_URI = "\
         git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;destsuffix=git/external/vulkan-docs/src;name=vulkan-docs;branch=main \
         https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
         git://github.com/Igalia/ESExtractor.git;protocol=https;destsuffix=git/external/ESExtractor/src;name=ESExtractor;branch=main \
-        git://github.com/nvpro-samples/vk_video_samples.git;protocol=https;destsuffix=git/external/video-parser/src;name=video-parser;branch=main \
-        file://gen-framework-path.patch \
+        git://github.com/Igalia/vk_video_samples.git;protocol=https;destsuffix=git/external/nvidia-video-samples/src;name=video-parser;nobranch=1 \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts/0001-use-library-sonames-for-linking.patch
similarity index 100%
copy from meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
copy to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts/0001-use-library-sonames-for-linking.patch
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
index 67ce5f2b9d..0656d724b4 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
@@ -14,6 +14,10 @@ SRCREV_vulkan-docs = "9a2e576a052a1e65a5d41b593e693ff02745604b"
 SRCREV_video-parser = "7d68747d3524842afaf050c5e00a10f5b8c07904"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
+SRC_URI += "\
+        git://github.com/nvpro-samples/vk_video_samples.git;protocol=https;destsuffix=git/external/video-parser/src;name=video-parser;branch=main \
+        file://gen-framework-path.patch \
+        "
 S = "${WORKDIR}/git"
 
 do_install() {
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-use-library-sonames-for-linking.patch
similarity index 96%
rename from meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-use-library-sonames-for-linking.patch
index b5a1d331ed..f12abd0c1a 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts/0001-use-library-sonames-for-linking.patch
@@ -103,10 +103,10 @@ Signed-off-by: Trevor Woerner <twoerner@gmail.com>
  #endif
  
  #if !defined(DEQP_VULKAN_LIBRARY_PATH)
-@@ -234,7 +234,7 @@ glu::RenderContext* ContextFactory::crea
+@@ -237,7 +237,7 @@ glu::RenderContext* ContextFactory::crea
  }
  
- EglRenderContext::EglRenderContext(const glu::RenderConfig& config, const tcu::CommandLine& cmdLine)
+ EglRenderContext::EglRenderContext(const glu::RenderConfig& config, const tcu::CommandLine& cmdLine, const glu::RenderContext *sharedContext)
 -	: m_egl("libEGL.so")
 +	: m_egl("libEGL.so.1")
  	, m_contextType(config.type)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
similarity index 53%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
index f491385b33..1008a5fd42 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bb
@@ -1,24 +1,28 @@
 DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
-# vulkan-cts-1.3.3.1
-SRCREV_vk-gl-cts = "6024a88390942876147a88dce82bbed73b866c1b"
-SRCREV_amber = "8b145a6c89dcdb4ec28173339dd176fb7b6f43ed"
-SRCREV_glslang = "7dda6a6347b0bd550e202942adee475956ef462a"
-SRCREV_spirv-headers = "b765c355f488837ca4c77980ba69484f3ff277f5"
-SRCREV_spirv-tools = "b930e734ea198b7aabbbf04ee1562cf6f57962f0"
+
+SRC_URI += "git://github.com/Igalia/vk_video_samples.git;protocol=https;destsuffix=git/external/nvidia-video-samples/src;name=video-parser;nobranch=1"
+
+# vulkan-cts-1.3.7.3
+SRCREV_vk-gl-cts = "d71a36db16d98313c431829432a136dbda692a08"
+SRCREV_amber = "933ecb4d6288675a92eb1650e0f52b1d7afe8273"
+SRCREV_glslang = "c5117b328afc86e16edff6ed6afe0fe7872a7cf3"
+SRCREV_spirv-headers = "b8b9eb8640c8c0107ba580fbcb10f969022ca32c"
+SRCREV_spirv-tools = "bfc94f63a7adbcf8ae166f5f108ac9f69079efc0"
 SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
-SRCREV_vulkan-docs = "9b5562187a8ad72c171410b036ceedbc450153ba"
+SRCREV_vulkan-docs = "b9aad705f0d9e5e6734ac2ad671d5d1de57b05e0"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 # Not yet needed
-SRCREV_ESExtractor = "ce5d7ebcf0ebb0d78385ee4cc34653eb6764bfc4"
-SRCREV_video-parser = "7d68747d3524842afaf050c5e00a10f5b8c07904"
+SRCREV_ESExtractor = "75ffcaf55bb069f7a23764194742d2fb78c7f71f"
+SRCREV_video-parser = "138bbe048221d315962ddf8413aa6a08cc62a381"
 
 SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
             file://0001-vulkan-cts-include-missing-cstdint.patch \
-            file://0001-include-missing-cstdint.patch;patchdir=external/amber/src \
 "
 
+TOOLCHAIN = "gcc"
+
 S = "${WORKDIR}/git"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
-- 
2.43.0


