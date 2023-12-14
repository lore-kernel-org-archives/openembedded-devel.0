Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FAAC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:04:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.17907.1702544637690861022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:03:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="122646278"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="122646278"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:03:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3CF43D9DA6
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:03:53 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DEC2DA225
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:03:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FCBB883E1;
	Thu, 14 Dec 2023 18:03:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.6.0 -> 4.6.1
Date: Thu, 14 Dec 2023 17:03:29 +0800
Message-Id: <1702544609-28337-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--0.147800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSC3IpruVSJ50r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrU/UlWgPMZ09W8/xBzVif+W2V+lLAcUFqWAFu0NCHW+z5D74ZT0K3tH5wTsyYyNMzU5EU
	ZrSfBtby+pP0PpMhLTtSVYQvSDtmB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107445

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
   https://www.mongodb.com/community/forums/t/pymongo-4-6-1-released/255752

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.6.0.bb => python3-pymongo_4.6.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.6.0.bb => python3-pymongo_4.6.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
index 18e29a17b..2704637d3 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "fb1c56d891f9e34303c451998ef62ba52659648bb0d75b03c5e4ac223a3342c2"
+SRC_URI[sha256sum] = "31dab1f3e1d0cdd57e8df01b645f52d43cc1b653ed3afd535d2891f4fc4f9712"
 
 inherit pypi setuptools3
 
-- 
2.34.1


