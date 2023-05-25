Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8287FC7EE32
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.6217.1684997897794110954
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117891606"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117891606"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DB88F088A
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 866EB15700
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1670A20098E35;
	Thu, 25 May 2023 15:58:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.2.3 -> 2.3.0
Date: Thu, 25 May 2023 14:58:02 +0800
Message-Id: <1684997886-2137-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10-0.869700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFNpnI6bOS9Iafpjsft1p58MVBa
	SsMk4pYNqrIo8C6aE/pkXbsOxDnrc3JXKUxdQ3xVkNGAEcIpOVAE5tRApw/m89+UM/zaGx0ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102838

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Improve sequence/all restriction checks for XSD 1.1
 Add schema argument to Wsdl11Document

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_2.2.3.bb => python3-xmlschema_2.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.2.3.bb => python3-xmlschema_2.3.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.2.3.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.3.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.3.0.bb
index 8e48dc5b2..48bb3883c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
 
-SRC_URI[sha256sum] = "d21ba86af4432720231fb4b40f1205fa75fd718d6856ec3b8118984de31c225b"
+SRC_URI[sha256sum] = "c2d583f7d07c6bac157d075889d15c128f34afdc79e4f70b4fb3c6adedc59bfe"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


