Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351F2C4707B
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:47:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.6949.1704721657933929380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="145719692"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="145719692"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:47:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6857CD9D8F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:47:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FAD327FFA
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:47:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E74A56BEE2
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:47:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A147E1A0072;
	Mon,  8 Jan 2024 21:47:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.25.2 -> 2.26.1
Date: Mon,  8 Jan 2024 21:47:05 +0800
Message-Id: <1704721625-30749-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-0.354400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTJDl9FKHbrnITPTa+uKHEtMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFO9i1iuS13yQdt745r7ROY2gDJ
	Zvpidcb+8aBFBEFvJkTnA02WviybaF3i0LjYXnXdC7NOnSM4DIGsYU/fiaZcWlvBZ0JwAay+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Ensure that refresh worker is pickle-able.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.25.2.bb => python3-google-auth_2.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.25.2.bb => python3-google-auth_2.26.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.25.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.26.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.25.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.26.1.bb
index 2f527611e..1a4913b71 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.26.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "42f707937feb4f5e5a39e6c4f343a17300a459aaf03141457ba505812841cc40"
+SRC_URI[sha256sum] = "54385acca5c0fbdda510cd8585ba6f3fcb06eeecf8a6ecca39d3ee148b092590"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


