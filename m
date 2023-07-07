Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3CDC3DA40
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:17 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.4901.1688699651366715484
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123689283"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123689283"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:12 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED6ECE8524
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40D1BD219F
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FB51881D9;
	Fri,  7 Jul 2023 12:14:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 382 -> 383
Date: Fri,  7 Jul 2023 11:13:36 +0800
Message-Id: <1688699627-2519-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-0.607100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJogwIsQZbtzZwK0+leiJxLlcHivd5s4SnRejMOEZ5AL0SRaK
	BN6WHQO/YxMDU/DW2N3k48PxckV+kHxPMjOKY7A+OT4nXYOKERC8z+bJ2nm9UKrauXd3MZDVr47
	e0TKFoZTZD2qDqpILcL/f+oOiSFDDmhZ6+SgyE6n+X5rAksIhTwL2qbf7zYRiF7JcRPAS7/0Rc2
	Jtw8+M6TvQFf7zFxlVjgo81taOvxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103697

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_382.bb => xterm_383.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_382.bb => xterm_383.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_382.bb b/meta-oe/recipes-graphics/xorg-app/xterm_383.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_382.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_383.bb
index 3bae13658c..cac0003e46 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_382.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_383.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "0cd0bcf3d0aa746a840ea3f1366ea29a74263694d535b5c777f27eb65d7fceed"
+SRC_URI[sha256sum] = "a06613bcda508c2a1bff6d4230895da74a798799a2e39a23bac82089d7b9a998"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


