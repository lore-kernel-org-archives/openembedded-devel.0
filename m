Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2728C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:37:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.151937.1692149843451787484
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="129515488"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="129515488"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:37:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B3FEEC68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00B7ACFBDD
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:37:18 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7655FE20D6;
	Wed, 16 Aug 2023 10:37:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libcloudproviders: upgrade 0.3.1 -> 0.3.2
Date: Wed, 16 Aug 2023 09:36:58 +0800
Message-Id: <1692149818-4869-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--2.469400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45g61lvmEwqsx3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQ/0icJBr3cNj/KwUlk69il4jsUKDU5/XxBFng5/hHGQsZjY487fOCMUML
	nlnwMEvMf+JnGfRK+sac/sHW2Pwu20Ud23VWrFBh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:37:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104372

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcloudproviders_0.3.1.bb => libcloudproviders_0.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libcloudproviders/{libcloudproviders_0.3.1.bb => libcloudproviders_0.3.2.bb} (76%)

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.1.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.2.bb
similarity index 76%
rename from meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.1.bb
rename to meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.2.bb
index b6448b9398..401c83fcdc 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.1.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.2.bb
@@ -8,4 +8,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "4763213ca1e1fe30d422f5ae3b4f02a454f63414c1860ad142d6385f89d05929"
+SRC_URI[archive.sha256sum] = "24a9f3fffaf49f1d9d45d6ec35ba9f9e59a5a1040b51ce7835611131966c6819"
-- 
2.34.1


