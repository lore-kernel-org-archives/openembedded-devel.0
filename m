Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36980C369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 02:11:57 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.25092.1744251110987296706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 19:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 10 Apr 2025 11:11:48 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.125 with ESMTP; 10 Apr 2025 11:11:48 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] nbench-byte: fix build error with gcc-15
Date: Thu, 10 Apr 2025 11:11:47 +0900
Message-Id: <20250410021147.249324-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 02:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116747

From: "mark.yang" <mark.yang@lge.com>

* Fix the following build error with gcc-15:
nbench1.c:3520:13: error: conflicting types for 'adjust_mid_wts'; have 'void(int)'
 3520 | static void adjust_mid_wts(int patt)
      |             ^~~~~~~~~~~~~~
In file included from nbench1.c:64:
nbench1.h:373:13: note: previous declaration of 'adjust_mid_wts' with type 'void(void)'
  373 | static void adjust_mid_wts();
      |             ^~~~~~~~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-Fix-build-error-with-gcc-15.patch    | 34 +++++++++++++++++++
 .../nbench-byte/nbench-byte_2.2.3.bb          |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/0001-Fix-build-error-with-gcc-15.patch

diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/0001-Fix-build-error-with-gcc-15.patch b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/0001-Fix-build-error-with-gcc-15.patch
new file mode 100644
index 0000000000..8e01e17e91
--- /dev/null
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/0001-Fix-build-error-with-gcc-15.patch
@@ -0,0 +1,34 @@
+From 3ee8798764919cd3f7d983f99f6189bbb940d639 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 10 Apr 2025 10:53:14 +0900
+Subject: [PATCH] Fix build error with gcc-15
+
+* Fix the following build error with gcc-15:
+nbench1.c:3520:13: error: conflicting types for 'adjust_mid_wts'; have 'void(int)'
+ 3520 | static void adjust_mid_wts(int patt)
+      |             ^~~~~~~~~~~~~~
+In file included from nbench1.c:64:
+nbench1.h:373:13: note: previous declaration of 'adjust_mid_wts' with type 'void(void)'
+  373 | static void adjust_mid_wts();
+      |             ^~~~~~~~~~~~~~
+
+Upstream-Status: Inappropriate [no upstream]
+
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ nbench1.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nbench1.h b/nbench1.h
+index 13a5907..b81ca82 100644
+--- a/nbench1.h
++++ b/nbench1.h
+@@ -370,7 +370,7 @@ static void do_out_error(int patt);
+ static void worst_pass_error();
+ static void do_mid_error();
+ static void adjust_out_wts();
+-static void adjust_mid_wts();
++static void adjust_mid_wts(int patt);
+ static void do_back_pass(int patt);
+ static void move_wt_changes();
+ static int check_out_error();
diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
index 9e1cedc2df..da03ebb291 100644
--- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
+++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
@@ -9,7 +9,8 @@ SECTION = "console/utils"
 
 SRC_URI = "https://fossies.org/linux/misc/old/${BP}.tar.gz \
            file://nbench_32bits.patch \
-           file://Makefile-add-more-dependencies-to-pointer.h.patch"
+           file://Makefile-add-more-dependencies-to-pointer.h.patch \
+           file://0001-Fix-build-error-with-gcc-15.patch"
 
 SRC_URI[sha256sum] = "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac488d8f5aed9101ac"
 

