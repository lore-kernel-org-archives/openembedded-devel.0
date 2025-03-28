Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0735FC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 16:01:18 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.15008.1743177676160102175
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 09:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.52, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 29 Mar 2025 01:01:13 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.91)
	by 156.147.1.127 with ESMTP; 29 Mar 2025 01:01:13 +0900
X-Original-SENDERIP: 10.185.60.91
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "tho3.nguyen" <tho3.nguyen@lge.com>
Subject: [meta-multimedia][PATCHv2] libcamera: Fix build with gcc-15
Date: Sat, 29 Mar 2025 01:00:46 +0900
Message-Id: <20250328160046.17484-2-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 16:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116356

From: "tho3.nguyen" <tho3.nguyen@lge.com>

Backport patch to fix the following error:
...
In file included from ../git/src/libcamera/dma_buf_allocator.cpp:9:
../git/include/libcamera/internal/dma_buf_allocator.h:66:19: error: 'uint64_t' has not been declared
   66 |         void sync(uint64_t step);
      |                   ^~~~~~~~
../git/include/libcamera/internal/dma_buf_allocator.h:17:1: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
...

Signed-off-by: tho3.nguyen <tho3.nguyen@lge.com>
---
 ...ssing-stdint.h-include-to-dma_buf_al.patch | 38 +++++++++++++++++++
 .../libcamera/libcamera_0.4.0.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
new file mode 100644
index 0000000000..18ba353de2
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch
@@ -0,0 +1,38 @@
+From 91de550243121056984e5b9b693b486860655d31 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Sat, 28 Dec 2024 19:11:19 +0000
+Subject: [PATCH] libcamera: Add missing <stdint.h> include to
+ dma_buf_allocator.h
+
+Without the change the build fails on upcoming `gcc-15` as:
+
+    In file included from ../src/libcamera/dma_buf_allocator.cpp:9:
+    ../include/libcamera/internal/dma_buf_allocator.h:66:19: error: 'uint64_t' has not been declared
+       66 |         void sync(uint64_t step);
+          |                   ^~~~~~~~
+
+Signed-off-by: Sergei Trofimovich <slyich@gmail.com>
+Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
+Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+Upstream-Status: Backport [https://git.libcamera.org/libcamera/libcamera.git/commit/?id=91de550243121056984e5b9b693b486860655d31]
+---
+ include/libcamera/internal/dma_buf_allocator.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/libcamera/internal/dma_buf_allocator.h b/include/libcamera/internal/dma_buf_allocator.h
+index d26f8a74..13600915 100644
+--- a/include/libcamera/internal/dma_buf_allocator.h
++++ b/include/libcamera/internal/dma_buf_allocator.h
+@@ -8,6 +8,7 @@
+ #pragma once
+ 
+ #include <memory>
++#include <stdint.h>
+ #include <string>
+ #include <vector>
+ 
+-- 
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index ef424c84e6..3d43b4f1da 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "\
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
         file://0001-media_device-Add-bool-return-type-to-unlock.patch \
+        file://0002-libcamera-Add-missing-stdint.h-include-to-dma_buf_al.patch \
 "
 
 SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
-- 
2.34.1


