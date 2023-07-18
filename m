Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAEDFC3DA41
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:26 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.740.1689654384340185665
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="112937805"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="112937805"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:21 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E72D7D29E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19DF8D5C39
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B99520077821;
	Tue, 18 Jul 2023 13:26:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis-plus-plus: upgrade 1.3.9 -> 1.3.10
Date: Tue, 18 Jul 2023 12:25:42 +0800
Message-Id: <1689654348-30702-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--0.704200-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNTfUZT83lbkEOPO
	cKRDnC9E+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CC7C2rJeUToe63p3Evo7CY1+0
	KsXaxWz7i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBqXokuvB2OazXoDF0pVF7Z0Zf
	zlbmMSdAo1cXKJWXE0PmO055+nOazIa3ncEL/8aXhrlRB7mqGLv9Z07dk0BczAj4Sf9xiwo+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103934

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix TLS support on async interface

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{redis-plus-plus_1.3.9.bb => redis-plus-plus_1.3.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.9.bb => redis-plus-plus_1.3.10.bb} (95%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.9.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.10.bb
similarity index 95%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.9.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.10.bb
index a8a93868e8..2df5e09194 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.9.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.10.bb
@@ -8,7 +8,7 @@ DEPENDS += "hiredis"
 
 SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https \
            file://0001-CMakeLists.txt-fix-substitution-for-static-libs.patch"
-SRCREV = "0c4ba0370e46c3d0d443c0368d02195faa791219"
+SRCREV = "8b9ce389099608cf9bae617d79d257d2cc05e12f"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


