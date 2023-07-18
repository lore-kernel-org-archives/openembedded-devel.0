Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F94C3DA40
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:26 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.691.1689654381913818393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="126111126"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="126111126"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 097C9D3EB4
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B32B14302
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B562120077821;
	Tue, 18 Jul 2023 13:26:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 383 -> 384
Date: Tue, 18 Jul 2023 12:25:48 +0800
Message-Id: <1689654348-30702-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-0.607100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJogwIsQZbtzZwK0+leiJxLlcHivd5s4SnRejMOEZ5AL0SRaK
	BN6WHQO/YxMDU/DW2N3k48PxckV+kHxPMjOKY7A+OT4nXYOKERC8z+bJ2nm9UKrauXd3MZDVr47
	e0TKFoZTZD2qDqpILcL/f+oOiSFDDmhZ6+SgyE6n+X5rAksIhTnaGMP+rcrouSR5kSh9zOeWt+j
	MiXN+BZqC+7zq0HKjoN3Nev8Voz8VPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103938

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_383.bb => xterm_384.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_383.bb => xterm_384.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_383.bb b/meta-oe/recipes-graphics/xorg-app/xterm_384.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_383.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_384.bb
index cac0003e46..ae046b18c2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_383.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_384.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "a06613bcda508c2a1bff6d4230895da74a798799a2e39a23bac82089d7b9a998"
+SRC_URI[sha256sum] = "31ef870740ceae020c3c4b4a9601c7f47bfd46672c1aaf2d213a565d64cbc373"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


