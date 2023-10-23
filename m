Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D47EC25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:52:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.136698.1698105165272529160
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="116645061"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="116645061"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:52:42 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 90198D9DA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:52:40 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D2EF5D5EB1
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:52:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id A5A3A2FC5D89;
	Tue, 24 Oct 2023 08:52:38 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 384 -> 387
Date: Tue, 24 Oct 2023 07:52:13 +0800
Message-Id: <1698105133-32479-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27954.003
X-TMASE-Result: 10-0.607100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJogwIsQZbtzZwK0+leiJxLlcHivd5s4SnRejMOEZ5AL0SRaK
	BN6WHQO/YxMDU/DW2N3k48PxckV+kHxPMjOKY7A+OT4nXYOKERC8z+bJ2nm9UKrauXd3MZDVr47
	e0TKFoZTZD2qDqpILcL/f+oOiSFDDmhZ6+SgyE6n+X5rAksIhT3cMPn50XBDtCyq2vG/YoUDt8U
	6NOEhRuW5xOsAiVzh2ZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105714

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_384.bb => xterm_387.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_384.bb => xterm_387.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_384.bb b/meta-oe/recipes-graphics/xorg-app/xterm_387.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_384.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_387.bb
index ae046b18c2..09bb2976a6 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_384.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_387.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "31ef870740ceae020c3c4b4a9601c7f47bfd46672c1aaf2d213a565d64cbc373"
+SRC_URI[sha256sum] = "81dd59cc2ecef1e849ed21722e37a24756e02b54ec19d157cb545b273813f4b8"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


