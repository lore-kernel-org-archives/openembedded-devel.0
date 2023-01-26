Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E048EC54EED
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:41 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.68536.1674717459424444693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eBItYea5;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id k10-20020a17090a590a00b0022ba875a1a4so4470099pji.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EoGgCnJ3Rnrynaho5+Z4dpmdFC5Y2mM2vzqGkaENpj4=;
        b=eBItYea52U6+kfBDeMJGZfO/CsDfrIWdBxWXZhaN65y0/X7QB02ke07scOOG76nttl
         y52iZyoeiySLGZoFP1xnnwLCAVov3xcQxQSPrtmW1TJ/GnKDdt6QZP6N5twWwaBEnQ4o
         aZv0HoMxXikj/+f1DxMV1ccyLdVjLI4qn5bBsgIxvEF8pfdOlbSpiqOORqcZnJAdHd4R
         ITsMx2yWbqq+eX8xexcezXQsZSJGRQ0sJWw1gZtbfGaXCmgOk6iTesJNbcM6CseEs6nx
         3IN71qkgLgZ7EIW8SywZRfv+o9qQ52Lac38j0wv47Dc1qU1G0/vAf4v04HfldWogyIyA
         39Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoGgCnJ3Rnrynaho5+Z4dpmdFC5Y2mM2vzqGkaENpj4=;
        b=OZ97kXRoZbgzxeiFO9zUrwpVmxD0sVUMFKo2PtpYyr0w/KaA8pEF308puYAT7Jj6Po
         x+aSu9i6oT4YCx4q/d0jeCn+8q61po4cUsqwz7BPSDNgq4nar5SyvQL+2co5c0+xsZHw
         7NvS7QMvYXc/5J0xC8GwsPJ0SKj2PHVUl12ukSL5eZmnKrRdQjuMRGmMis9HMKNUGW7J
         Ls77kJmakPrkeqVapCmFt+Cd+BSneATaT3CggmFHyMX8S29feTFmi92HDCvo3ClRobSk
         QHir9ckR4jxwYaR8yig61vUoweQCBuWqJk51FbQXH4p/rRUq6KTXUPgsSyRz1rHS6YCv
         LEHQ==
X-Gm-Message-State: AFqh2kqzwQMqFX3qg/wTaXalJ3ynRODAQVeC0O4bChuy8na96PJYXy0/
	TeUZPWcE5dYV+LXX4I1DIRsBpiNY3vn3Kg==
X-Google-Smtp-Source: AMrXdXvZ4glYQnlVtFHpBwpEuEMf7CdIykhPdGvB3IoUCga+H9Wr1KjLRQqhxBB6c442fJrUKxZVVQ==
X-Received: by 2002:a17:902:cec3:b0:194:d9b5:3bf0 with SMTP id d3-20020a170902cec300b00194d9b53bf0mr31297076plg.18.1674717458493;
        Wed, 25 Jan 2023 23:17:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/13] vulkan-cts,opengl-es-cts: Fix build with gcc-13
Date: Wed, 25 Jan 2023 23:17:23 -0800
Message-Id: <20230126071735.2444745-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100783

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Include-missing-cstdint.patch  | 34 +++++++++++
 .../files/0001-include-missing-cstdint.patch  | 61 +++++++++++++++++++
 ...01-vulkancts-Include-missing-cstdint.patch | 32 ++++++++++
 .../vk-gl-cts/files/0001-vulkancts.patch      | 40 ------------
 .../vk-gl-cts/khronos-cts.inc                 |  2 +-
 .../vk-gl-cts/opengl-es-cts_3.2.8.0.bb        |  3 +-
 .../vk-gl-cts/vulkan-cts_1.3.3.1.bb           |  5 +-
 7 files changed, 134 insertions(+), 43 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
 delete mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
new file mode 100644
index 0000000000..0dd59713a1
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
@@ -0,0 +1,34 @@
+From b07f6ecd6ab83b788301a555dc546b9a5c9dd8a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 19:19:34 -0800
+Subject: [PATCH] Include missing <cstdint>
+
+This error is seen with gcc-13 where include headers are not implicitly
+included [1]
+
+Fixes errors e.g.
+error: 'uint32_t' does not name a type
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/378]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/common/tcuDefs.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/framework/common/tcuDefs.hpp b/framework/common/tcuDefs.hpp
+index ad3d0736d..6dfac10fb 100644
+--- a/framework/common/tcuDefs.hpp
++++ b/framework/common/tcuDefs.hpp
+@@ -26,6 +26,7 @@
+ #include "deDefs.hpp"
+ #include "qpTestLog.h"
+ 
++#include <cstdint>
+ #include <string>
+ #include <stdexcept>
+ 
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..47d9fc748a
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
@@ -0,0 +1,61 @@
+From 74cf53d89529902ecdef5b230421bc4d30fd089b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 15:36:14 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc-13 exposed errors like below due to it removing indirect includes of
+these headers in libstdc++ [1]
+
+../git/external/amber/src/include/amber/shader_info.h:60:15: error: 'uint32_t' was not declared in this scope
+   60 |   std::vector<uint32_t> shader_data;
+      |               ^~~~~~~~
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Submitted [https://github.com/google/amber/pull/1016]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/amber/recipe.h                  | 1 +
+ include/amber/shader_info.h             | 1 +
+ src/descriptor_set_and_binding_parser.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/include/amber/recipe.h b/include/amber/recipe.h
+index 310a86a..1b83213 100644
+--- a/include/amber/recipe.h
++++ b/include/amber/recipe.h
+@@ -15,6 +15,7 @@
+ #ifndef AMBER_RECIPE_H_
+ #define AMBER_RECIPE_H_
+ 
++#include <cstdint>
+ #include <string>
+ #include <utility>
+ #include <vector>
+diff --git a/include/amber/shader_info.h b/include/amber/shader_info.h
+index 6c9126a..b5ce751 100644
+--- a/include/amber/shader_info.h
++++ b/include/amber/shader_info.h
+@@ -15,6 +15,7 @@
+ #ifndef AMBER_SHADER_INFO_H_
+ #define AMBER_SHADER_INFO_H_
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/src/descriptor_set_and_binding_parser.h b/src/descriptor_set_and_binding_parser.h
+index 145aa42..4b0d774 100644
+--- a/src/descriptor_set_and_binding_parser.h
++++ b/src/descriptor_set_and_binding_parser.h
+@@ -15,6 +15,7 @@
+ #ifndef SRC_DESCRIPTOR_SET_AND_BINDING_PARSER_H_
+ #define SRC_DESCRIPTOR_SET_AND_BINDING_PARSER_H_
+ 
++#include <cstdint>
+ #include <string>
+ 
+ #include "amber/result.h"
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
new file mode 100644
index 0000000000..40aea8f203
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
@@ -0,0 +1,32 @@
+From 1b7646ced0f0b969f818084887885827ed1a4244 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 May 2021 17:31:33 -0700
+Subject: [PATCH] vulkancts: Include missing <cstdint>
+
+Fixes build with gcc-13
+
+../git/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp:2798:102: error: 'uintptr_t' in namespace 'std' does not name a type
+ 2798 |                 BufferDataType type              = static_cast<BufferDataType>(reinterpret_cast<std::uintptr_t>(expectedOutputs[resultIndex].getUserData()));
+      |                                                                                                      ^~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/378]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp        | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
+index ab02be1dc..3d3ee4829 100644
+--- a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
++++ b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
+@@ -33,6 +33,7 @@
+ #include "deFloat16.h"
+ #include "vkQueryUtil.hpp"
+ #include "vkRefUtil.hpp"
++#include <cstdint>
+ #include <cstring>
+ #include <vector>
+ #include <limits>
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch
deleted file mode 100644
index 2fd1d7123a..0000000000
--- a/meta-oe/recipes-graphics/vk-gl-cts/files/0001-vulkancts.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 273df2423d9226093310cbcaa8b924bb6b5d6586 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 31 May 2021 17:31:33 -0700
-Subject: [PATCH] vulkancts:
-
-O_TRUNC value in OperationId enum collides with the macro O_TRUNC
-defined in the POSIX header fnctl.h. To avoid the collision undefine
-O_TRUNC in this particular sourcefile before its is used in enums
-down below.
-
-This is fixed upstream differently
-https://github.com/KhronosGroup/VK-GL-CTS/commit/564c6062f72fe7ecd92b4aea1558c441e651c76b
-
-But until we get this module uprev'ed to that, lets use a simpler
-workaround
-
-Upstream-Status: Inappropriate [Fixed Differently]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp     | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
-index 22e6c75fa..db7f4b54a 100644
---- a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
-+++ b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
-@@ -38,6 +38,10 @@
- #include <limits>
- #include <fenv.h>
- 
-+#ifdef O_TRUNC
-+#undef O_TRUNC
-+#endif
-+
- namespace vkt
- {
- namespace SpirVAssembly
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index c7535405b0..01f4a572f8 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -26,7 +26,7 @@ ANY_OF_DISTRO_FEATURES += "opengl wayland"
 DEPENDS += "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
 
 SRC_URI += " \
-            file://0001-vulkancts.patch \
+            file://0001-vulkancts-Include-missing-cstdint.patch \
             file://0001-use-library-sonames-for-linking.patch \
 "
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
index 024a1719d0..edfeda2bef 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.8.0.bb
@@ -12,7 +12,8 @@ SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
 SRCREV_vulkan-docs = "d70e01c0be7b8a7d20b186b30b29a75b18bba75d"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
-SRC_URI += "file://0001-Remove-dead-variable-984.patch;patchdir=external/amber/src"
+SRC_URI += "file://0001-Remove-dead-variable-984.patch;patchdir=external/amber/src \
+            file://0001-include-missing-cstdint.patch;patchdir=external/amber/src"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
index c996eb1f76..862963dd0d 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
@@ -11,7 +11,10 @@ SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
 SRCREV_vulkan-docs = "9b5562187a8ad72c171410b036ceedbc450153ba"
 SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
 
-SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch"
+SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
+            file://0001-Include-missing-cstdint.patch \
+            file://0001-include-missing-cstdint.patch;patchdir=external/amber/src \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.1


