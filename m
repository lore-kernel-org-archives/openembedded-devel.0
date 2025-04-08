Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF26C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 06:02:17 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.68561.1744092135431408890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 23:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.53 with ESMTP; 8 Apr 2025 15:02:12 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.125 with ESMTP; 8 Apr 2025 15:02:12 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] dhex: fix error with gcc-15
Date: Tue,  8 Apr 2025 15:02:11 +0900
Message-Id: <20250408060211.972934-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 06:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116691

From: "mark.yang" <mark.yang@lge.com>

* A strict error handling for function parameters in gcc-15 causes errors.
output.c:9:6: error: conflicting types for 'initcolors'; have 'void(tOutput *)' {aka 'void(struct _tOutput *)'}
    9 | void initcolors(tOutput* output)
      |      ^~~~~~~~~~
In file included from output.c:7:
output.h:10:6: note: previous declaration of 'initcolors' with type 'void(void)'
   10 | void initcolors();
      |      ^~~~~~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...laration-conflict-error-with-empty-p.patch | 38 +++++++++++++++++++
 meta-oe/recipes-support/dhex/dhex_0.69.bb     |  5 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/dhex/dhex/0001-Fix-function-declaration-conflict-error-with-empty-p.patch

diff --git a/meta-oe/recipes-support/dhex/dhex/0001-Fix-function-declaration-conflict-error-with-empty-p.patch b/meta-oe/recipes-support/dhex/dhex/0001-Fix-function-declaration-conflict-error-with-empty-p.patch
new file mode 100644
index 0000000000..b4d7656aff
--- /dev/null
+++ b/meta-oe/recipes-support/dhex/dhex/0001-Fix-function-declaration-conflict-error-with-empty-p.patch
@@ -0,0 +1,38 @@
+From 86491a25b9057576234d1eaf4da020413e7259ad Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 8 Apr 2025 14:43:29 +0900
+Subject: [PATCH] Fix function declaration conflict error with empty parameters
+ in gcc-15
+
+* A strict error handling for function parameters in gcc-15 causes errors.
+output.c:9:6: error: conflicting types for 'initcolors'; have 'void(tOutput *)' {aka 'void(struct _tOutput *)'}
+    9 | void initcolors(tOutput* output)
+      |      ^~~~~~~~~~
+In file included from output.c:7:
+output.h:10:6: note: previous declaration of 'initcolors' with type 'void(void)'
+   10 | void initcolors();
+      |      ^~~~~~~~~~
+
+
+* This component is a personal project and is maintained through the maintainer's personal email. 
+  I have sent the patch via email and am waiting for a response.
+
+Upstream-Status: Pending
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ output.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/output.h b/output.h
+index cef29e9..b2b5e38 100644
+--- a/output.h
++++ b/output.h
+@@ -7,7 +7,7 @@
+ #include "machine_type.h"
+ #include "datatypes.h"
+ 
+-void initcolors();
++void initcolors(tOutput* output);
+ void colorpair(tOutput* output,uicolors uicol,short fg,short bg,int attr);
+ void pairsinit(tOutput* output);
+ void setcolor(tOutput* output,uicolors col);
diff --git a/meta-oe/recipes-support/dhex/dhex_0.69.bb b/meta-oe/recipes-support/dhex/dhex_0.69.bb
index e0026f92dc..14e6ec7112 100644
--- a/meta-oe/recipes-support/dhex/dhex_0.69.bb
+++ b/meta-oe/recipes-support/dhex/dhex_0.69.bb
@@ -7,7 +7,10 @@ DEPENDS = "ncurses"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://README.txt;beginline=229;endline=241;md5=6f252a421b65bcecf624382ba3c899da"
 
-SRC_URI = "http://www.dettus.net/dhex/dhex_0.69.tar.gz"
+SRC_URI = " \
+	http://www.dettus.net/dhex/dhex_0.69.tar.gz \
+	file://0001-Fix-function-declaration-conflict-error-with-empty-p.patch \
+"
 SRC_URI[sha256sum] = "52730bcd1cf16bd4dae0de42531be9a4057535ec61ca38c0804eb8246ea6c41b"
 
 S = "${WORKDIR}/dhex_${PV}"

