Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE561C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 06:27:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.24036.1704176819683362055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 22:27:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="124375318"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="124375318"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 15:26:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EB38D66C3
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 15:26:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C19CD38555
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 15:26:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4518E20086329
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 15:26:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B81701A0070;
	Tue,  2 Jan 2024 14:26:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cglm: upgrade 0.9.1 -> 0.9.2
Date: Tue,  2 Jan 2024 14:26:44 +0800
Message-Id: <1704176804-7471-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-0.593000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxOaDdl7pggvcVA
	08S977kg29hQxCbxfMzGKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat05499RlPzeVuQQ1vZ
	7s3YIVDI3lq3YEgY6JmFp9qfciji9rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveafSbrzwSjfwqtq
	5d3cxkNaQDiwjPc96MC+kf/WNZjU9j2zcIFR2rtFqaB5qRzv/ysijw5kML9vlDdmLvhyf49KuHK
	qD990SHYQq5hNeoMmZ85OEuoC4wXTKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 06:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-add aabb2d
-add euler to quat functionality
-add new subtraction family of vector functions
-many others improvements and bugfixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/cglm/{cglm_0.9.1.bb => cglm_0.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.9.1.bb => cglm_0.9.2.bb} (93%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.1.bb b/meta-oe/recipes-graphics/cglm/cglm_0.9.2.bb
similarity index 93%
rename from meta-oe/recipes-graphics/cglm/cglm_0.9.1.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.9.2.bb
index 603ebe48d..b503c6ed9 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.9.1.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
 SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
 # Tag v0.9.1
-SRCREV = "cdd4d0e83e9ee79f73aeb0a4fb60b4abd8ecf947"
+SRCREV = "c8781615183ce3cb4f5d72caf70f2c01d7d4d2af"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


