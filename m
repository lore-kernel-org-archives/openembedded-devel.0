Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78B1C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:01:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.473.1705971663124619754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:01:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146922954"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146922954"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:01:01 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00765D9DAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:00:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37C8BD21AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:00:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C793B2007B73D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:00:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D9B71A006A;
	Tue, 23 Jan 2024 09:00:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libdecor: upgrade 0.2.1 -> 0.2.2
Date: Tue, 23 Jan 2024 08:59:35 +0800
Message-Id: <1705971575-24553-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLoj21zNtGCrhtybdvWAMHwngIgpj8eDcAZ1CdBJOsoY9mzcdRxL+xwKra
	uXd3MZDWowPTCbnblA3wdNh2N94a1RIUt07Ex4jkdD56x9v4Ok612aQ4cEkrOUrOgYotescxXtX
	HhD2aCHuhgjnCB8VH0DiNMw75/wSvXLUmqx52PxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108384

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdecor/{libdecor_0.2.1.bb => libdecor_0.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.1.bb => libdecor_0.2.2.bb} (94%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.1.bb b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.2.bb
similarity index 94%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.2.1.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.2.2.bb
index 4c9c64c28..6621389b5 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.1.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.2.bb
@@ -15,7 +15,7 @@ DEPENDS = " \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "060fe7611aedb5779929e6b1468419c2d4e7168f"
+SRCREV = "7807ae3480f5c6a37c5e8505d94af1e764aaf704"
 
 PACKAGECONFIG ?= "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', d)}"
 
-- 
2.34.1


