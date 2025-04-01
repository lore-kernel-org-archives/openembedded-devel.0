Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A59C36014
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 10:08:41 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.15360.1743502116787591177
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 03:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 1 Apr 2025 19:08:34 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.126 with ESMTP; 1 Apr 2025 19:08:34 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] mcpp: Stick to C17
Date: Tue,  1 Apr 2025 19:08:32 +0900
Message-Id: <20250401100832.1477718-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 10:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116470

From: "mark.yang" <mark.yang@lge.com>

* Fix build error with gcc-15 by renaming goto labels
  see more details:
  http://errors.yoctoproject.org/Errors/Details/850149/
  ../../mcpp-2.7.2/src/system.c:3436:15: error: expected identifier or '*' before 'true'

  true, false are reserved keywords in gcc-15
  Rename goto 'labels' from 'ture' to 'true_label', from 'false' 'false_label' to avoid conflicts.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
index 0c1815732f..dfa77770a7 100644
--- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -21,3 +21,7 @@ BBCLASSEXTEND = "native nativesdk"
 # http://errors.yoctoproject.org/Errors/Details/766883/
 # mcpp-2.7.2/src/expand.c:713:21: error: assignment to 'char *' from incompatible pointer type 'LOCATION *' {aka 'struct location *'} [-Wincompatible-pointer-types]
 CFLAGS += "-Wno-error=incompatible-pointer-types"
+
+# http://errors.yoctoproject.org/Errors/Details/850149/
+# ../../mcpp-2.7.2/src/system.c:3436:15: error: expected identifier or '*' before 'true'
+CFLAGS += "-std=gnu17"
-- 
2.34.1


