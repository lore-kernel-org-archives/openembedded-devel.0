Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56F2C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 06:46:14 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.5755.1743144368984261351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 23:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.51, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 28 Mar 2025 15:46:06 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.40)
	by 156.147.1.127 with ESMTP; 28 Mar 2025 15:46:06 +0900
X-Original-SENDERIP: 10.185.60.40
X-Original-MAILFROM: thond2009@gmail.com
From: thond2009 <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "tho3.nguyen" <tho3.nguyen@lge.com>
Subject: [PATCH] libcamera: Fix build with gcc-15
Date: Fri, 28 Mar 2025 15:46:03 +0900
Message-Id: <20250328064604.138959-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 06:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116346

From: "tho3.nguyen" <tho3.nguyen@lge.com>

To fix the following error:
...
In file included from ../git/src/libcamera/dma_buf_allocator.cpp:9:
../git/include/libcamera/internal/dma_buf_allocator.h:66:19: error: 'uint64_t' has not been declared
   66 |         void sync(uint64_t step);
      |                   ^~~~~~~~
../git/include/libcamera/internal/dma_buf_allocator.h:17:1: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
...

Signed-off-by: tho3.nguyen <tho3.nguyen@lge.com>
---
 ...uf_allocator.h-Fix-build-with-gcc-15.patch | 36 +++++++++++++++++++
 .../libcamera/libcamera_0.4.0.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-dma_buf_allocator.h-Fix-build-with-gcc-15.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-dma_buf_allocator.h-Fix-build-with-gcc-15.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-dma_buf_allocator.h-Fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..39db748e51
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-dma_buf_allocator.h-Fix-build-with-gcc-15.patch
@@ -0,0 +1,36 @@
+From cc890633721df67f362e72eb7d099cc04f47982d Mon Sep 17 00:00:00 2001
+From: "tho3.nguyen" <tho3.nguyen@lge.com>
+Date: Fri, 28 Mar 2025 13:20:56 +0900
+Subject: [PATCH] dma_buf_allocator.h: Fix build with gcc-15
+
+To fix:
+...
+In file included from ../git/src/libcamera/dma_buf_allocator.cpp:9:
+../git/include/libcamera/internal/dma_buf_allocator.h:66:19: error: 'uint64_t' has not been declared
+   66 |         void sync(uint64_t step);
+      |                   ^~~~~~~~
+../git/include/libcamera/internal/dma_buf_allocator.h:17:1: note: 'uint64_t' is defined in header '<cstdint>'; this is probably fixable by adding '#include <cstdint>'
+...
+
+Upstream-Status: Submitted [https://patchwork.libcamera.org/patch/23066/]
+
+Signed-off-by: tho3.nguyen <tho3.nguyen@lge.com>
+---
+ include/libcamera/internal/dma_buf_allocator.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/libcamera/internal/dma_buf_allocator.h b/include/libcamera/internal/dma_buf_allocator.h
+index fc5de2c1..973aec47 100644
+--- a/include/libcamera/internal/dma_buf_allocator.h
++++ b/include/libcamera/internal/dma_buf_allocator.h
+@@ -10,6 +10,7 @@
+ #include <memory>
+ #include <string>
+ #include <vector>
++#include <cstdint>
+ 
+ #include <libcamera/base/flags.h>
+ #include <libcamera/base/shared_fd.h>
+-- 
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index ef424c84e6..1939f6ea92 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "\
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
         file://0001-media_device-Add-bool-return-type-to-unlock.patch \
+        file://0002-dma_buf_allocator.h-Fix-build-with-gcc-15.patch \
 "
 
 SRCREV = "35ed4b91291d9f3d08e4b51acfb51163e65df8f8"
-- 
2.34.1


