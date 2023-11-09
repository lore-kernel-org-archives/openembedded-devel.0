Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3255C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 04:38:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.114859.1699504675680187334
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 20:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="140571013"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="140571013"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 13:37:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 60482D3EAF
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:37:51 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A51E8D9732
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 13:37:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9274F2FC7261;
	Thu,  9 Nov 2023 13:37:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] neatvnc: upgrade 0.7.0 -> 0.7.1
Date: Thu,  9 Nov 2023 12:36:38 +0800
Message-Id: <1699504598-16458-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27986.002
X-TMASE-Result: 10-3.087300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrYdBG+bhhiNS6pZ/o2Hu2YeqX
	KqCHfANyYhy/v6R0jDkMyw6hMrtYUO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTfW2EXohiB6drdCok3ibXlQX0tCKdnhB58I/9UW5M5dRM+8F
	JNGdxYq46HM5rqDwqtkhP2fSzPlssX9rCDFlJkxto8YS/XI5MPnC9uDBn/XxLyiYbRgvvonYXAz
	H+nMb9BozLrbesMGaNg1qFqrw+bmuUajNCjd6hsHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 04:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106499

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 server: Fix double-free on failed Apple DH
 crypto: Initialise AES-ECB decode context correctly
 server: Remove DNS lookup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../neatvnc/{neatvnc_0.7.0.bb => neatvnc_0.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_0.7.0.bb => neatvnc_0.7.1.bb} (95%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.0.bb b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.1.bb
similarity index 95%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.0.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.1.bb
index c8ac09f234..99e63318a1 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.0.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94fc374e7174f41e3afe0f027ee59ff7"
 
 SRC_URI = "git://github.com/any1/neatvnc;branch=v0.7;protocol=https"
 
-SRCREV = "112391140a76f0b362fa0df92fc1183c4a48ef3d"
+SRCREV = "b5b330b22c6a0fdeb718a9e7ee0732cc406863fa"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


