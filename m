Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69554C7EE2F
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:58:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6087.1684997897816270719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="97363771"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="97363771"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:58:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 563FAC68EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 94C2420A41
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:58:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B5C92008FEDB;
	Thu, 25 May 2023 15:58:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 5.0.0 -> 5.1.0
Date: Thu, 25 May 2023 14:57:58 +0800
Message-Id: <1684997886-2137-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
References: <1684997886-2137-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--3.169300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrXLILvyEBT86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4YIq
	MJY9gyfFBqdpRdFzClMOa7gujq6mfqBtlLmaDwmeEQVnJNUdo6AuYQ/P9l8rMKGkf3dX2OS3HAw
	D4riJojHAcwZx4idu+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102839

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Revert "Moves supported python runtimes from version 3.8 to 3.10"
* Moves supported python runtimes from version 3.8 to 3.10
* Update master for stable/2023.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-stevedore_5.0.0.bb => python3-stevedore_5.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_5.0.0.bb => python3-stevedore_5.1.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.0.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
index 6b40b6c3f..d60d017d5 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "2c428d2338976279e8eb2196f7a94910960d9f7ba2f41f3988511e95ca447021"
+SRC_URI[sha256sum] = "a54534acf9b89bc7ed264807013b505bf07f74dbe4bcfa37d32bd063870b087c"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.34.1


