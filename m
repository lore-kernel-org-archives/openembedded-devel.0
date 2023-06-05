Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667D9C7EE37
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2113.1685951608827785697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="120638927"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="120638927"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:26 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 110BFD29E9
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:24 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 45FB9D947A
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:23 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 56FAA2FC85E5;
	Mon,  5 Jun 2023 16:53:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 381 -> 382
Date: Mon,  5 Jun 2023 15:52:58 +0800
Message-Id: <1685951589-29920-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-0.607100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJogwIsQZbtzZwK0+leiJxLlcHivd5s4SnRejMOEZ5AL0SRaK
	BN6WHQO/YxMDU/DW2N3k48PxckV+kHxPMjOKY7A+OT4nXYOKERC8z+bJ2nm9UKrauXd3MZDXDqO
	QgFBM185ZIXQ4no1P6v7JUsqrxHRI+0fqxpxr8wORZmpKjhHGF157QHvPcmyeHP0iUydNWHBCSt
	aFTvdiaTmGb8ilQofEN3Nev8Voz8VPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103116

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_381.bb => xterm_382.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_381.bb => xterm_382.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_381.bb b/meta-oe/recipes-graphics/xorg-app/xterm_382.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_381.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_382.bb
index f3a034884e..3bae13658c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_381.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_382.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "924dd6ab1471d486d219aba4edb881a03dd4129fd55ee556390f7a1648f523bd"
+SRC_URI[sha256sum] = "0cd0bcf3d0aa746a840ea3f1366ea29a74263694d535b5c777f27eb65d7fceed"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


