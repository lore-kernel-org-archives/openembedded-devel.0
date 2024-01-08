Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475A2C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:03:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7321.1704722605206342718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="133842421"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="133842421"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 23:03:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D615D7AD8
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:03:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C3369D9C5F
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:03:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 627156C827
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 23:03:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1B36D1A0072;
	Mon,  8 Jan 2024 22:03:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xerces-c: upgrade 3.2.4 -> 3.2.5
Date: Mon,  8 Jan 2024 22:03:08 +0800
Message-Id: <1704722588-31235-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--2.884700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIS3Fe1CtDUbdz4cH5hW96YOwpfLMeBwRtr9+Kgn2XgeFc4zbE9ZfrklIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoQBpRCTkRk5SfoLR4+zsDTt8fxdFDBKE7tlH4
	V++Li2b59SbILny4PuECtr6e2ve5CQrz/0tHzvl7vrOJMJW1Ope+mFY/8JNJm2OGRwRQHPfNQAH
	Wa+l2shFUmT7CQdYi3yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 14:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108166

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xerces-c/{xerces-c_3.2.4.bb => xerces-c_3.2.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/xerces-c/{xerces-c_3.2.4.bb => xerces-c_3.2.5.bb} (94%)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.4.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
similarity index 94%
rename from meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.4.bb
rename to meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
index 582c29379..1643af254 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.4.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "74aa626fc71e729ee227602870dd29a5a01cd8c9c1c7330837a51da2eb5722cc"
+SRC_URI[sha256sum] = "1db4028c9b7f1f778efbf4a9462d65e13f9938f2c22f9e9994e12c49ba97e252"
 
 inherit autotools
 
-- 
2.34.1


