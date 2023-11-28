Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3F7C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:47:34 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.28530.1701161254045473828
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="141441952"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="141441952"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:47:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DAA6AD9D90
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:47:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7A03BF499
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:47:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18BE020077831;
	Tue, 28 Nov 2023 17:47:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade 68.2.0.1 -> 68.2.0.2
Date: Tue, 28 Nov 2023 16:44:02 +0800
Message-Id: <1701161042-28580-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28024.006
X-TMASE-Result: 10-3.043600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrGEfoClqBl86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3BF2OdN6oAASl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFF3eHj4HTi7kjoOuCHjrAOSNbt
	gf3Nb8AfGVGt69RghMWUV1Qu9hsb3075tpVJNowPtUUhGYg/OIdjLLPkwV23v3bC4zHj7df+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107090

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Third-party stubs: remove unused type: ignores

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools_68.2.0.1.bb => python3-types-setuptools_68.2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_68.2.0.1.bb => python3-types-setuptools_68.2.0.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.1.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.2.bb
index 106121335..4042ab55f 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.2.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8f31e8201e7969789e0eb23463b53ebe5f67d92417df4b648a6ea3c357ca4f51"
+SRC_URI[sha256sum] = "09efc380ad5c7f78e30bca1546f706469568cf26084cfab73ecf83dea1d28446"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


