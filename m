Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D1EC0015E
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:24 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7461.1687850055949722603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110071653"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110071653"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:13 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CF67D29E9
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:11 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CEFFD531C
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 75BAB88C9E;
	Tue, 27 Jun 2023 16:14:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 2.5 -> 2.6
Date: Tue, 27 Jun 2023 15:12:01 +0800
Message-Id: <1687849939-19941-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--4.918500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy+f7ap9DJaDe79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gH4qCLIu0mtIEukIs3g1HjeLXk
	gVQ0v4RM76TWVFie/TyIq3k1H1tm7h38bnPLEpPHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtd8i815uYIa+eYf/1Nd1fxnNFz+ENFPNMWh35UV4fnnwxBtDheN33IaxIC
	FwRDUvrl/e9zQs1BU91p+iHnvZRovz/b9dvv77sHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103596

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Add support for setting driver specific quirks.
  Add support for disabling power saving mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.5.bb => iwd_2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.5.bb => iwd_2.6.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.5.bb b/meta-oe/recipes-connectivity/iwd/iwd_2.6.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.5.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.6.bb
index e1f21c3bab..64d6232883 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.5.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.6.bb
@@ -8,7 +8,7 @@ DEPENDS = "ell"
 SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            "
-SRC_URI[sha256sum] = "3441effed58297b63779e706c74884234acb874b07872f8b55e0da28729fda32"
+SRC_URI[sha256sum] = "f7ac93aeef672604f5b5194ca038035ae222925be392c4345873c9742f477797"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.34.1


