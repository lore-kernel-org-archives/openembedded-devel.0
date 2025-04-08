Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5D8C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:10:29 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.71301.1744107023643163127
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 8 Apr 2025 19:10:21 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.121 with ESMTP; 8 Apr 2025 19:10:21 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] freeipmi: fix error with gcc-15
Date: Tue,  8 Apr 2025 19:10:20 +0900
Message-Id: <20250408101020.1884253-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 10:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116697

From: "mark.yang" <mark.yang@lge.com>

* backport fix from:
  https://lists.gnu.org/archive/html/freeipmi-devel/2025-02/msg00000.html

  to fix:
  http://errors.yoctoproject.org/Errors/Details/851185/
  Error occurs with gcc version 15.
  In gcc-15, C23 is the default and 'bool' is used as a reserved keyword.
  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...0001-Fix-for-GCC15-C23-build-failure.patch | 42 +++++++++++++++++++
 .../freeipmi/freeipmi_1.6.15.bb               |  5 ++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch b/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch
new file mode 100644
index 0000000000..13f02f2f7a
--- /dev/null
+++ b/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch
@@ -0,0 +1,42 @@
+From 5afe6492735938e0053ae78817399fa433f0f8c7 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Tue, 8 Apr 2025 19:05:53 +0900
+Subject: [PATCH] Fix for GCC15 / C23 build failure
+
+* backport fix from:
+  https://lists.gnu.org/archive/html/freeipmi-devel/2025-02/msg00000.html
+
+  to fix:
+  http://errors.yoctoproject.org/Errors/Details/851185/
+  Error occurs with gcc version 15.
+  In gcc-15, C23 is the default and 'bool' is used as a reserved keyword.
+  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+Upstream-Status: Backport [https://lists.gnu.org/archive/html/freeipmi-devel/2025-02/msg00000.html]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ common/toolcommon/tool-config-file-common.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/common/toolcommon/tool-config-file-common.c b/common/toolcommon/tool-config-file-common.c
+index 609e7a3..20dfad5 100644
+--- a/common/toolcommon/tool-config-file-common.c
++++ b/common/toolcommon/tool-config-file-common.c
+@@ -78,14 +78,14 @@ _config_file_bool (conffile_t cf,
+                    void *app_ptr,
+                    int app_data)
+ {
+-  int *bool;
++  int *value;
+ 
+   assert (data);
+   assert (optionname);
+   assert (option_ptr);
+ 
+-  bool = (int *)option_ptr;
+-  *bool = data->boolval;
++  value = (int *)option_ptr;
++  *value = data->boolval;
+   return (0);
+ }
+ 
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
index e977bbcd9e..e04ebfb0c6 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
@@ -13,7 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.pstdout;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
-SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
+SRC_URI = " \
+    ${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
+    file://0001-Fix-for-GCC15-C23-build-failure.patch \
+"
 SRC_URI[sha256sum] = "d6929c354639f5ce75b5b1897e8b366eb63625c23e5c4590a7aea034fe2b8caf"
 
 DEPENDS = "libgcrypt"

