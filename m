Return-Path: <thond2009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D86C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 08:22:19 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.8287.1743668533630586619
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 01:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: gmail.com, ip: 156.147.23.51, mailfrom: thond2009@gmail.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 3 Apr 2025 17:22:12 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: thond2009@gmail.com
Received: from unknown (HELO tho3-nguyen-weboscsm.bee-live.svc.cluster.local) (10.185.60.101)
	by 156.147.1.151 with ESMTP; 3 Apr 2025 17:22:12 +0900
X-Original-SENDERIP: 10.185.60.101
X-Original-MAILFROM: thond2009@gmail.com
From: Nguyen Dat Tho <thond2009@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nguyen Dat Tho <tho3.nguyen@lge.com>
Subject: [meta-filesystems][PATCH] f2fs-tools: Fix build with gcc-15
Date: Thu,  3 Apr 2025 17:22:08 +0900
Message-Id: <20250403082208.440900-1-thond2009@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 08:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116535

From: Nguyen Dat Tho <tho3.nguyen@lge.com>

To fix error: https://errors.yoctoproject.org/Errors/Details/850170/

Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
---
 ...-f2fs_fs.h-fix-std-c23-build-failure.patch | 42 +++++++++++++++++++
 .../f2fs-tools/f2fs-tools_1.16.0.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-include-f2fs_fs.h-fix-std-c23-build-failure.patch

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-include-f2fs_fs.h-fix-std-c23-build-failure.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-include-f2fs_fs.h-fix-std-c23-build-failure.patch
new file mode 100644
index 0000000000..7b81b93715
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-include-f2fs_fs.h-fix-std-c23-build-failure.patch
@@ -0,0 +1,42 @@
+From 4a66e47406a9c651ddba035e5f6e8b1f2cc90a40 Mon Sep 17 00:00:00 2001
+From: Nguyen Dat Tho <tho3.nguyen@lge.com>
+Date: Thu, 3 Apr 2025 12:37:26 +0900
+Subject: [PATCH] include/f2fs_fs.h: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `f2fs-tools` fails as below, so only typedef u8 bool
+for __STDC_VERSION__ <= 201710L (C17)
+
+In file included from ../../git/lib/libf2fs_zoned.c:11:
+../../git/include/f2fs_fs.h:107:25: error: two or more data types in declaration specifiers
+  107 | typedef u8              bool;
+      |                         ^~~~
+../../git/include/f2fs_fs.h:107:1: warning: useless type name in empty declaration
+  107 | typedef u8              bool;
+
+Signed-off-by: Nguyen Dat Tho <tho3.nguyen@lge.com>
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-f2fs-devel/20250403040220.305573-1-thond2009@gmail.com/T/#u]
+---
+ include/f2fs_fs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
+index f890634..1be77f1 100644
+--- a/include/f2fs_fs.h
++++ b/include/f2fs_fs.h
+@@ -103,7 +103,7 @@ typedef uint16_t	u16;
+ typedef uint8_t		u8;
+ typedef u32		block_t;
+ typedef u32		nid_t;
+-#ifndef bool
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef u8		bool;
+ #endif
+ typedef unsigned long	pgoff_t;
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
index 997fa1240a..48f20b7220 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
@@ -9,6 +9,7 @@ DEPENDS = "util-linux"
 
 SRCREV = "06c027abc6153c4a97cba5317844e8dcaaee3cf7"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;branch=master \
+           file://0001-include-f2fs_fs.h-fix-std-c23-build-failure.patch \
            file://0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


