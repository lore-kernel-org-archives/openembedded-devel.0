Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B58C41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7628.1690875731007171006
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126412260"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126412260"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D0C17CD7E0
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D97FD8B78
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:13 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 93B4810211;
	Tue,  1 Aug 2023 16:42:12 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 6.3.0 -> 6.7.0
Date: Tue,  1 Aug 2023 15:41:34 +0800
Message-Id: <1690875717-21608-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-0.669100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yTiEPRj9j9rvVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMO3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzfuMb6e1ezA84qj
	M2hpMMkJmzqaIWYiK5lscArSOZGoxz26FmwdSJpRm4TUvRrco1TJGc4BIEK2nECQMQnMvL5nFu5
	fz79GEuiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104175

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: change lib author to EF

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.3.0.bb => python3-web3_6.7.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.3.0.bb => python3-web3_6.7.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
index 088bfd504e..c842639678 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.7.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "A Python library for interacting with Ethereum."
 HOMEPAGE = "https://github.com/ethereum/web3.py"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "d13f17d18eaacd87f7d233b4b2c70d1579b39573628b71ec996adfcd4dac9cab"
+SRC_URI[sha256sum] = "dc05e4130ed2e1e67a18a6f012cd3095440f37c0b8334038071d5510176debb5"
 
 inherit pypi setuptools3
 
-- 
2.34.1


