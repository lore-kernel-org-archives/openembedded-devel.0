Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDBCC36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 11:50:12 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.16786.1743508207575619022
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 04:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 1 Apr 2025 20:50:05 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.121.109)
	by 156.147.1.126 with ESMTP; 1 Apr 2025 20:50:04 +0900
X-Original-SENDERIP: 10.177.121.109
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] xmlrpc-c: Stick to C17
Date: Tue,  1 Apr 2025 20:50:03 +0900
Message-Id: <20250401115003.1886649-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 11:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116474

From: "mark.yang" <mark.yang@lge.com>

* Fix build error with gcc-15.0.1
  http://errors.yoctoproject.org/Errors/Details/850147/
    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false' as enumeration constant
    13 |     false = 0,
        |     ^~~~~
    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '-std=c23' onwards
    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier or '(' before 'bool'
    15 | } bool;
        |   ^~~~
    srcdir/lib/util/include/bool.h:15:3: warning: useless type name in empty declaration
    In file included from sleep.c:2:
    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false' as enumeration constant
    13 |     false = 0,
        |     ^~~~~
    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '-std=c23' onwards
    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier or '(' before 'bool'
    15 | } bool;
        |   ^~~~

    In C23, bool, true, and false are added as reserved keywords, causing build errors.
    However, modifying the source code just for this would be risky, so we set the C standard to C17.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
index 62ba0f53e6..cca745cd51 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
@@ -46,3 +46,8 @@ do_install:append:class-target() {
 BBCLASSEXTEND = "native"
 
 CLEANBROKEN = "1"
+
+# http://errors.yoctoproject.org/Errors/Details/850147/
+# srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '-std=c23' onwards
+# srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier or '(' before 'bool'
+CFLAGS += "-std=gnu17"
-- 
2.34.1


