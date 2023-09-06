Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7A0CCFA07
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:54:25 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2346.1693965264063746087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 18:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="130725826"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="130725826"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 10:54:21 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A5C0FC68E5
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:54:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DFBE6F943
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 10:54:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AF176BF4A;
	Wed,  6 Sep 2023 10:54:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 2.7 -> 2.8
Date: Wed,  6 Sep 2023 09:53:56 +0800
Message-Id: <1693965236-13993-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--3.291500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL+79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gH4qCLIu0mtIEukIs3g1HjeLXk
	gVQ0v4RM76TWVFie/TyIq3k1H1tm7h38bnPLEpPHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtD4r1spSGB+jmlByxQPxuZoB+EdA/8zRI62UxzGq1cP/aWGgvBD58jU5Px
	jtOUnOg4TVguFrXYKm3QfxlIqQrTbdlUfWi0Hp4HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 01:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104736

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix issue with handling OWE AKM in association reply.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.7.bb => iwd_2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.7.bb => iwd_2.8.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.7.bb b/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.7.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
index f4e70890a9..ee310d295b 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.7.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "289ff47a76fb854e7789c45c5e3e0f15de4adc5fd2e82e47ab08e3564d8961d9"
+SRC_URI[sha256sum] = "a90e621f45b9c2f9021beea0fa6477ee0334fcd2ee34beaab42e31ea0fd3be29"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.34.1


