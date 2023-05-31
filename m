Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6F7C7EE24
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:41:00 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8566.1685518859085581814
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118923613"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118923613"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:56 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DB02C68EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EEAAD3F2E
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F000468957;
	Wed, 31 May 2023 16:40:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 380 -> 381
Date: Wed, 31 May 2023 15:40:20 +0800
Message-Id: <1685518820-20028-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-0.607100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJogwIsQZbtzZwK0+leiJxLlcHivd5s4SnRejMOEZ5AL0SRaK
	BN6WHQO/YxMDU/DW2N3k48PxckV+kHxPMjOKY7A+OT4nXYOKERC8z+bJ2nm9UKrauXd3MZDUum2
	Z3hsbYckSdIHzOtp/3p41nizM7leV4MpKtkJ5sodqJ8x/pL05y2Cx6r8kwD1cXzHt8fpGncD8v9
	RbtMq3DMwv7ihv2ZTTXLUmqx52PxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102925

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_380.bb => xterm_381.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_380.bb => xterm_381.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_380.bb b/meta-oe/recipes-graphics/xorg-app/xterm_381.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_380.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_381.bb
index 377c2758b..f3a034884 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_380.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_381.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "0c1dc1fa800fa64b5c58d16ddb905e700b27ca538a65be8c03b2ba5761106c38"
+SRC_URI[sha256sum] = "924dd6ab1471d486d219aba4edb881a03dd4129fd55ee556390f7a1648f523bd"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


