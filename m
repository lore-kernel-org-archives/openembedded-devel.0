Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0548CC3600C
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 03:42:00 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.3738.1743738116444121174
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 20:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.52, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 4 Apr 2025 12:41:53 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.118)
	by 156.147.1.125 with ESMTP; 4 Apr 2025 12:41:53 +0900
X-Original-SENDERIP: 10.185.60.118
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-filesystems][PATCH v2] f2fs-tools: Fix build with gcc-15
Date: Fri,  4 Apr 2025 12:41:48 +0900
Message-Id: <20250404034148.65709-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 03:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116559

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

Backport patch to fix error: https://errors.yoctoproject.org/Errors/Details/850170/

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 ...-tools-use-stdbool.h-instead-of-bool.patch | 40 +++++++++++++++++++
 .../f2fs-tools/f2fs-tools_1.16.0.bb           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-use-stdbool.h-instead-of-bool.patch

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-use-stdbool.h-instead-of-bool.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-use-stdbool.h-instead-of-bool.patch
new file mode 100644
index 0000000000..4981c2151d
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-use-stdbool.h-instead-of-bool.patch
@@ -0,0 +1,40 @@
+From 6617d15a660becc23825007ab3fc2d270b5b250f Mon Sep 17 00:00:00 2001
+From: Jaegeuk Kim <jaegeuk@kernel.org>
+Date: Thu, 24 Oct 2024 20:33:38 +0000
+Subject: [PATCH] f2fs-tools: use stdbool.h instead of bool
+
+The existing bool definition is broken for c23,i where bool is now a keyword.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=6617d15a660becc23825007ab3fc2d270b5b250f]
+
+Signed-off-by: Elliott Hughes <enh@google.com>
+Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
+---
+ include/f2fs_fs.h | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
+index 9534da9..0cb9228 100644
+--- a/include/f2fs_fs.h
++++ b/include/f2fs_fs.h
+@@ -28,6 +28,7 @@
+ #include <stddef.h>
+ #include <string.h>
+ #include <time.h>
++#include <stdbool.h>
+ 
+ #ifdef HAVE_CONFIG_H
+ #include <config.h>
+@@ -119,9 +120,6 @@ typedef uint16_t	u16;
+ typedef uint8_t		u8;
+ typedef u32		block_t;
+ typedef u32		nid_t;
+-#ifndef bool
+-typedef u8		bool;
+-#endif
+ typedef unsigned long	pgoff_t;
+ typedef unsigned short	umode_t;
+ 
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
index 997fa1240a..a51c2ef8bd 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
@@ -9,6 +9,7 @@ DEPENDS = "util-linux"
 
 SRCREV = "06c027abc6153c4a97cba5317844e8dcaaee3cf7"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;branch=master \
+           file://0001-f2fs-tools-use-stdbool.h-instead-of-bool.patch \
            file://0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


