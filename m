Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0C2C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:18:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.6232.1692865078563007299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129138842"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129138842"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:17:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E76D3CA1E6
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:17:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CDA6D601E
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:17:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B397B6BECE;
	Thu, 24 Aug 2023 17:17:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymetno: upgrade 0.10.0 -> 0.11.0
Date: Thu, 24 Aug 2023 16:16:42 +0800
Message-Id: <1692865002-2824-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.005
X-TMASE-Result: 10-0.311000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrovzuwAG3GnSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2YkAyCbA7KV6B5jk2TXXjFlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz5dMQR0pedFSek+
	pGqsrIc8tcDMZoj+8Kh7vIYHkIkg8+jbXX+UP48uejEzEtbiLZDLOA7wyNOmYTo5vkgoDIXhRYx
	vCXOrFNiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104577

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Expose dew point

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymetno_0.10.0.bb => python3-pymetno_0.11.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymetno_0.10.0.bb => python3-pymetno_0.11.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.10.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.11.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymetno_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pymetno_0.11.0.bb
index c5ab635927..d66c4c2ce3 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
 
 SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
-SRCREV = "5fc18d7c5d627a9d9b2529db98d4e7e01a37dbf9"
+SRCREV = "d7a6161c7765bff19a276b29a6a689a59b03a63c"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.34.1


