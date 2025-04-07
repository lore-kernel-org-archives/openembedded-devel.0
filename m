Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E226C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 10:47:50 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.43570.1744022866474065079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 03:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 7 Apr 2025 19:47:44 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.121 with ESMTP; 7 Apr 2025 19:47:44 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] digitemp: fix build failure with gcc-15.0.1
Date: Mon,  7 Apr 2025 19:47:43 +0900
Message-Id: <20250407104743.1489375-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 10:47:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116663

From: "mark.yang" <mark.yang@lge.com>

* backport fix from:
  https://github.com/bcl/digitemp/commit/fa56b0f78d12f97ac44e0a367d413a9e88611d1c
  to fix:
   src/digitemp.c:171:6: error: conflicting types for ‘free_coupler’; have ‘void(int)’
   171 | void free_coupler( int free_only )
         |      ^~~~~~~~~~~~
   In file included from src/digitemp.c:78:
   src/digitemp.h:90:6: note: previous declaration of ‘free_coupler’ with type ‘void(void)’
      90 | void free_coupler();
         |      ^~~~~~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-Fix-conflicting-prototype.patch      | 32 +++++++++++++++++++
 .../digitemp/digitemp_3.7.2.bb                |  5 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/digitemp/digitemp/0001-Fix-conflicting-prototype.patch

diff --git a/meta-oe/recipes-support/digitemp/digitemp/0001-Fix-conflicting-prototype.patch b/meta-oe/recipes-support/digitemp/digitemp/0001-Fix-conflicting-prototype.patch
new file mode 100644
index 0000000000..484fc1c3a2
--- /dev/null
+++ b/meta-oe/recipes-support/digitemp/digitemp/0001-Fix-conflicting-prototype.patch
@@ -0,0 +1,32 @@
+From fa56b0f78d12f97ac44e0a367d413a9e88611d1c Mon Sep 17 00:00:00 2001
+From: Robert Scheck <robert-scheck@users.noreply.github.com>
+Date: Thu, 16 Jan 2025 21:24:41 +0100
+Subject: [PATCH] Fix conflicting prototype
+
+src/digitemp.c:171:6: error: conflicting types for ‘free_coupler’; have ‘void(int)’
+  171 | void free_coupler( int free_only )
+      |      ^~~~~~~~~~~~
+In file included from src/digitemp.c:78:
+src/digitemp.h:90:6: note: previous declaration of ‘free_coupler’ with type ‘void(void)’
+   90 | void free_coupler();
+      |      ^~~~~~~~~~~~
+
+Upstream-Status: Backport [https://github.com/bcl/digitemp/commit/fa56b0f78d12f97ac44e0a367d413a9e88611d1c]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/digitemp.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/digitemp.h b/src/digitemp.h
+index 06d50e9..e81a7be 100644
+--- a/src/digitemp.h
++++ b/src/digitemp.h
+@@ -87,7 +87,7 @@ struct _coupler {
+ 
+ /* Prototypes */
+ void usage();
+-void free_coupler();
++void free_coupler( int free_only );
+ float c2f( float temp );
+ int build_tf( char *time_format, char *format, int sensor, 
+               float temp_c, int humidity, unsigned char *sn );
diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
index 6565097334..5272b8ea06 100644
--- a/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.7.2.bb
@@ -4,7 +4,10 @@ DEPENDS = "libusb1"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
-SRC_URI = "git://github.com/bcl/digitemp;branch=master;protocol=https"
+SRC_URI = " \
+    git://github.com/bcl/digitemp;branch=master;protocol=https \
+    file://0001-Fix-conflicting-prototype.patch \
+"
 
 SRCREV = "a162e63aad35358aab325388f3d5e88121606419"
 

