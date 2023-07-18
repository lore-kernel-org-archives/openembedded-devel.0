Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB48DC05053
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.730.1689654366337396837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124880106"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124880106"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:04 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BDBD8CA1F1
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 052CDBF496
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:01 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DA5D20077821;
	Tue, 18 Jul 2023 13:26:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 2.6 -> 2.7
Date: Tue, 18 Jul 2023 12:25:09 +0800
Message-Id: <1689654348-30702-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--3.291500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL+79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gH4qCLIu0mtIEukIs3g1HjeLXk
	gVQ0v4RM76TWVFie/TyIq3k1H1tm7h38bnPLEpPHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtOX5bMde3BAH7XNVoZpIUPnoPMgvz8xQZMifpuGteOmS5RTEKznakN+3rm
	l11o5ZsOgBx8p/c5DMtR5Q6vSmCgoNA4lz9ChaWHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103899

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix issue with handling FT-8021X and SHA256 PMKID derivation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.6.bb => iwd_2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.6.bb => iwd_2.7.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.6.bb b/meta-oe/recipes-connectivity/iwd/iwd_2.7.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.6.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.7.bb
index 64d6232883..f4e70890a9 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.6.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.7.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "f7ac93aeef672604f5b5194ca038035ae222925be392c4345873c9742f477797"
+SRC_URI[sha256sum] = "289ff47a76fb854e7789c45c5e3e0f15de4adc5fd2e82e47ab08e3564d8961d9"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.34.1


