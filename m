Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFB2C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:17:24 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.28196.1701159442918836714
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="128889653"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="128889653"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:17:19 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0752DD9DA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:17:18 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37899F99F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:17:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2296E8418A;
	Tue, 28 Nov 2023 17:17:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnfdragora: upgrade 2.1.4 -> 2.1.5
Date: Tue, 28 Nov 2023 16:13:44 +0800
Message-Id: <1701159224-27689-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.005
X-TMASE-Result: 10-3.534800-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhGQgIVrmBL5HVX
	Q3/qdw5ytfzRNo3PTRgdSNPQF8GlGhLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6pByRBJ91zJEgYjLCuO5t1r4JCzA6K3s86N/cDgNNi4VXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJljHS2r3PZ5iJb5vns58udM/lomt/WRLwQSXrkL+b2fcfS6
	GREYbRObP1dDlL0l3C/vvtjj3pylFY15wBrDY5RyOKh6UviXxpLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107070

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fixed Segfault error when there is no package description.
-Added Info window after transaction.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnfdragora/{dnfdragora_2.1.4.bb => dnfdragora_2.1.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/dnfdragora/{dnfdragora_2.1.4.bb => dnfdragora_2.1.5.bb} (95%)

diff --git a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.4.bb b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.5.bb
similarity index 95%
rename from meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.4.bb
rename to meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.5.bb
index 25b16121e..1d6ffa331 100644
--- a/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.4.bb
+++ b/meta-oe/recipes-graphics/dnfdragora/dnfdragora_2.1.5.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/manatools/dnfdragora.git;branch=master;protocol=http
            file://0001-To-fix-error-when-do_package.patch \
            "
 
-SRCREV = "e38e1127e56f5c7cc38e22c6dd4c2728fc4f0b3c"
+SRCREV = "d808904fc6082578c02d7c8bf543380ed447e925"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


