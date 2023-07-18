Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8D9C001DE
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.727.1689654365024204111
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="126111055"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="126111055"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D8275DDC63
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:25:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 194F5D9478
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:25:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9414D20077821;
	Tue, 18 Jul 2023 13:25:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-commander: upgrade 1.16.0 -> 1.16.1
Date: Tue, 18 Jul 2023 12:25:06 +0800
Message-Id: <1689654348-30702-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--2.217600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4BbKQFTrYntIMH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoqQYx5q2+cZh9k0tWBWiOf/xuhkRWK22GAl4w4lfxz2cKdE
	VEQ71Y0GxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6SGQzX0q+ra7bI
	dwnuJfB3VWC9gul7JuW4l1iH2LBVcXKUPN9wQRHTpdEV0egG0cCS6+lRrp/8oiDiGNhk5bD1J0/
	N5ha4cCiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103896

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-commander_1.16.0.bb => gnome-commander_1.16.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-commander/{gnome-commander_1.16.0.bb => gnome-commander_1.16.1.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.0.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.0.bb
rename to meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
index 8c4b79160a..6aa28fc00f 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
@@ -17,7 +17,7 @@ GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
-SRC_URI[archive.sha256sum] = "d80ac70b99a7059c8f28ca0bf37305f09daeaecfceb1528d68a435ace9e8ec5d"
+SRC_URI[archive.sha256sum] = "3f1d00c4a650fe7902167648286b32c9ca4ef86e31a5d8ccca0139f12d10d0b3"
 
 PACKAGECONFIG ??= "exiv2 taglib libgsf poppler"
 PACKAGECONFIG[exiv2] = "-Dexiv2=enabled,-Dexiv2=disabled,exiv2"
-- 
2.34.1


