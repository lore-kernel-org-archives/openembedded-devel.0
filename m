Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAA4C001DC
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2282.1687157427260781352
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="122527018"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="122527018"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:25 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C559DF0760
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:22 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 05B8EBF4B0
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 275592FC8442;
	Mon, 19 Jun 2023 15:50:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.88.0 -> 2.89.0
Date: Mon, 19 Jun 2023 14:48:16 +0800
Message-Id: <1687157308-17342-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--4.591100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrMVx/3ZYby79tsf15Uhq/5P4Q
	R/7oUDJy4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7U9a
	6zfLFA1bss9r//dw7twYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtYsk6Y4ixvYd4/U65EegFXI3Z7GwKuR5n8DqTNkDLR9HxnE7etzGZkc20Q
	fm12GBraf0VcLF9d3jmYrSxxC12oYcSikjwZ2aeHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103368

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Remove faulty version matcher in setup.py (#2152) (0a865da), closes #2151

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ent_2.88.0.bb => python3-google-api-python-client_2.89.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.88.0.bb => python3-google-api-python-client_2.89.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.88.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.89.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.88.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.89.0.bb
index 6ea78ee81..a62d59913 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.88.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.89.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "37068453f79ea28e5394a8fe20a4ba620594e7f8541068bea2e844dacdcc9d33"
+SRC_URI[sha256sum] = "0b0c9503df2da92692ffceee88423ca593cbf0b939d879e2c46fbdc1a39cf091"
 
 inherit pypi setuptools3
 
-- 
2.34.1


