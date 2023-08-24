Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5047EC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:09:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6263.1692864589027146455
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="117554448"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="117554448"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:09:46 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 329CBD772B
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:09:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 68DB7D3F2F
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:09:41 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D57D820074727;
	Thu, 24 Aug 2023 17:09:40 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] geary: update 44.0 -> 44.1
Date: Thu, 24 Aug 2023 16:09:01 +0800
Message-Id: <1692864541-2258-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.006
X-TMASE-Result: 10-2.636400-10.000000
X-TMASE-MatchedRID: lE7Cmzn5KhyvbHkumykHIyoiRKlBVkYIbnIU6uSebvSwZuykSn6+/Bti
	hBeM13D+jf84k1uW53jqXvXKPBg5Bm0Xr+fj3ww/TuctSpiuWyU2ZWOmuJUS2RdHX2eZFfZfrbL
	6wPjGii2xfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzhAMMSGmzwUoeAW
	Qc8JXTA5dKU9H3/REP02UdDY7V4wkli67/RXUqn2h6Cl3qnxhNGlCcoEu8ezs7aQ1KKfeA6q9qp
	VX4c6QbiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Numerous user interface translation updates
 * Numerous bug fixes and user interface improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/geary/{geary_44.0.bb => geary_44.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/geary/{geary_44.0.bb => geary_44.1.bb} (96%)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_44.0.bb b/meta-gnome/recipes-connectivity/geary/geary_44.1.bb
similarity index 96%
rename from meta-gnome/recipes-connectivity/geary/geary_44.0.bb
rename to meta-gnome/recipes-connectivity/geary/geary_44.1.bb
index a585929092..decae6b2c7 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_44.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_44.1.bb
@@ -39,7 +39,7 @@ SRC_URI = " \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "b72db2a5e87f2269e6359af434a4fc02fca9e9df"
+SRCREV = "37c378a563d5b1c269d57c34671edc940d1cd180"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
-- 
2.34.1


