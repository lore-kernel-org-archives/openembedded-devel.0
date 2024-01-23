Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3269C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:50:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.1578.1705974650700314646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="148610565"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="148610565"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:50:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B039D9D90
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:50:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A817DD4F62
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:50:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3793F20074726
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:50:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C9C1B1A006A;
	Tue, 23 Jan 2024 09:50:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-haversine: upgrade 2.8.0 -> 2.8.1
Date: Tue, 23 Jan 2024 09:50:31 +0800
Message-Id: <1705974631-26076-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--1.505600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr9LMB0hXFSeg8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzwpgB349Xzf7EsP
	Z63U3xtWBhIfJujDre9o9lL6mvdeww4WgKPLA2cR5SxjjbUhd1/Z4dVgsr5WXigU5LNyHfuXGYS
	aowpc6miB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108416

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Use numpy kernel when using numba

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-haversine_2.8.0.bb => python3-haversine_2.8.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.8.0.bb => python3-haversine_2.8.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.8.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-haversine_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
index 0c7b414d9..e45ae7986 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[sha256sum] = "cca39afd2ae5f1e6ed9231b332395bb8afb2e0a64edf70c238c176492e60c150"
+SRC_URI[sha256sum] = "ab750caa0c8f2168bd7b00a429757a83a8393be1aa30f91c2becf6b523189e2a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


