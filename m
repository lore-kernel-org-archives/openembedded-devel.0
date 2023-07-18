Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D26CBC04FE1
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.686.1689654373914029342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="126111088"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="126111088"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3034CA1EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B341CD5C25
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 44A7420077821;
	Tue, 18 Jul 2023 13:26:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-engineio: upgrade 4.4.1 -> 4.5.1
Date: Tue, 18 Jul 2023 12:25:28 +0800
Message-Id: <1689654348-30702-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-0.735400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mraEANKbBJN11QWIO4YO+fPf44
	pYPD16CL4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWY5v+NllnxQoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJCp9OHlTUzIa/1BYqKatRcnSgYsqmx3uFOqo
	z5zLWGwXJL6kSCTMbTZDssDkZIoOKE86n19f1HxGxfktdmCxJT+7ytYUN8Q63+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103916

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Restore support for old versions of eventlet #321
    Configure eventlet's websocket max frame length #319
    Remove old Python 2 syntax in super() calls

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.4.1.bb => python3-engineio_4.5.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.4.1.bb => python3-engineio_4.5.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb b/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
index b20a6413f6..d97248891c 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.5.1.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "eb3663ecb300195926b526386f712dff84cd092c818fb7b62eeeda9160120c29"
+SRC_URI[sha256sum] = "b167a1b208fcdce5dbe96a61a6ca22391cfa6715d796c22de93e3adf9c07ae0c"
-- 
2.34.1


