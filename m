Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF72C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 05:32:48 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web11.27626.1744263165782805252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 22:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 10 Apr 2025 14:32:43 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.126 with ESMTP; 10 Apr 2025 14:32:43 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] dhrystone: fix build error with gcc-15
Date: Thu, 10 Apr 2025 14:32:41 +0900
Message-Id: <20250410053241.887224-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 05:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116757

From: "mark.yang" <mark.yang@lge.com>

* fix too many arguments error
dhry_1.c: In function 'main':
dhry_1.c:176:23: error: too many arguments to function 'Func_1'; expected 0, have 2
  176 |       if (Enum_Loc == Func_1 (Ch_Index, 'C'))
      |                       ^~~~~~  ~~~~~~~~
dhry_1.c:33:17: note: declared here
   33 | Enumeration     Func_1 ();
      |                 ^~~~~~

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...ix-too-many-arguments-error-in-gcc15.patch | 32 +++++++++++++++++++
 .../dhrystone/dhrystone_2.1.bb                |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/0001-fix-too-many-arguments-error-in-gcc15.patch

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/0001-fix-too-many-arguments-error-in-gcc15.patch b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/0001-fix-too-many-arguments-error-in-gcc15.patch
new file mode 100644
index 0000000000..63701d9c97
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/0001-fix-too-many-arguments-error-in-gcc15.patch
@@ -0,0 +1,32 @@
+From a0a976c0c4c2b92d61e71e00be4adfd8ea6d0d8f Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 10 Apr 2025 14:14:15 +0900
+Subject: [PATCH] fix too many arguments error in gcc15
+
+dhry_1.c: In function 'main':
+dhry_1.c:176:23: error: too many arguments to function 'Func_1'; expected 0, have 2
+  176 |       if (Enum_Loc == Func_1 (Ch_Index, 'C'))
+      |                       ^~~~~~  ~~~~~~~~
+dhry_1.c:33:17: note: declared here
+   33 | Enumeration     Func_1 ();
+      |                 ^~~~~~
+
+Upstream-Status: Inactive-Upstream [lastrelease: 1988]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ dhry_1.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dhry_1.c b/dhry_1.c
+index b081b86..e5a4873 100644
+--- a/dhry_1.c
++++ b/dhry_1.c
+@@ -30,7 +30,7 @@ char            Ch_1_Glob,
+ int             Arr_1_Glob [50];
+ int             Arr_2_Glob [50] [50];
+ 
+-Enumeration     Func_1 ();
++Enumeration     Func_1 (Capital_Letter Ch_1_Par_Val, Capital_Letter Ch_2_Par_Val);
+   /* forward declaration necessary since Enumeration may not simply be int */
+ 
+ #ifndef REG
diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
index 4cc1999cf1..e56433805d 100644
--- a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d1
 SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
            file://dhrystone.patch \
            file://dhrystone-c89.patch \
+           file://0001-fix-too-many-arguments-error-in-gcc15.patch \
 "
 SRC_URI[sha256sum] = "038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e"
 

