Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF5BCD5484
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:37:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2300.1695109039383780445
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:37:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120422811"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120422811"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:37:17 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 005A1C3F9A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:37:14 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38864D5E9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:37:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 62DBB2FC6B2A;
	Tue, 19 Sep 2023 16:37:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-antlr4-runtime: upgrade 4.13.0 -> 4.13.1
Date: Tue, 19 Sep 2023 15:37:04 +0800
Message-Id: <1695109024-7348-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10-0.366000-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mr7G01sD+YgcyQ09taPgt9LJ9J
	wiLvjNDmsOkqiHn42ahCNEei2kg1tFN77hC5g6Q272Rb2bEJC+0Hw3hIDAYijsfASe7knCtt3LF
	uyqUR8Gw5nL2jFiogyEm2yRLiv911pyip7+9DnXQD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpienmD2BglYMumrz6r91+/1zsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVr3FLeZXNZS4JFOlJCK/1ftnZK9A1nWbvdgK5rnlU/OwSG0R35aRrvjDARp
	FTCsu17MQgLQ+HU8EQnptJZeMG7H1sHOToiAfqyNwLrECvxkm6tIm1HSTaIYL4DhUiI7eZH+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104972

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- change signatures for ReportAttemptingFullContext() and
  ReportContextSensitivity() to be identical to all other targets
- Move GetText(), SetText(), and String() from CommonToken to BaseToken
- Restore "Obtained from string" source name.
- fix: Fix very minor code issues spotted by goreportcard.com
- Java: suppress this-escape warning introduced in JDK 21.
- Adds default targets for babel configuration
- fix dependabot warnings
- Add Antlr4Dynamic product
- Cleanup duplicate SwiftTarget code
- Fix for #4320--export additional types

License-Update: Version updated to 4.13.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lr4-runtime_4.13.0.bb => python3-antlr4-runtime_4.13.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-antlr4-runtime_4.13.0.bb => python3-antlr4-runtime_4.13.1.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.0.bb b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.0.bb
rename to meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
index 870152c74f..431d37c7d7 100644
--- a/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-antlr4-runtime_4.13.1.bb
@@ -1,8 +1,8 @@
 SUMMARY = "ANTLR runtime for Python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b38bac4871765ce562806c44d2f18cf1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4b18e4a9f93178eaa50a9a37f26da7f7"
 
-SRC_URI[sha256sum] = "0d5454928ae40c8a6b653caa35046cd8492c8743b5fbc22ff4009099d074c7ae"
+SRC_URI[sha256sum] = "3cd282f5ea7cfb841537fe01f143350fdb1c0b1ce7981443a2fa8513fddb6d1a"
 
 PYPI_PACKAGE = "antlr4-python3-runtime"
 
-- 
2.34.1


