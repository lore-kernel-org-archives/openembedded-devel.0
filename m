Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E133DC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:18:49 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.116127.1698049120547596653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136999074"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136999074"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:18:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 428DFD4F5B
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:18:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B7A7D5EB0
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:18:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AAE7A2005932A;
	Mon, 23 Oct 2023 17:18:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-calculator: upgrade 45.0 -> 45.0.2
Date: Mon, 23 Oct 2023 16:17:46 +0800
Message-Id: <1698049066-24370-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--1.141400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ8eC2pVr1wbynRTeH3LeMsuce7gFxhKa1V4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SQUgTRTxlo9L+igLMeO3dHcvUa5iW9DS60c/xzw2ttUPAu3
	HMq5kuARQdn4oChAbozgbLy3edyXFvpVLR4HHbpwLY8AHlvCPzS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105635

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-calculator_45.0.bb => gnome-calculator_45.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_45.0.bb => gnome-calculator_45.0.2.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
index ed2cb854d7..cde2e1d3cb 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "e58df0b5646111baf93ec5309b225d27b7c7f45deeee484af7914331b8cd2822"
+SRC_URI[archive.sha256sum] = "7dcbf32384897171cbe5483ec664d994e5e755e912ae1df911624f03c90867c2"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.34.1


