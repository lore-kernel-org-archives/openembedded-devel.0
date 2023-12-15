Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B3DC10F13
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 05:54:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.54241.1702619664429509179
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 21:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143519206"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143519206"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 14:54:22 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B431BD9D92
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:54:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EA2FFD8AFB
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:54:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F14721FC77;
	Fri, 15 Dec 2023 14:54:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libei: upgrade 1.1.0 -> 1.2.0
Date: Fri, 15 Dec 2023 11:57:20 +0800
Message-Id: <1702612640-3452-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.005
X-TMASE-Result: 10-1.302200-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmLHBvqhRdA8sja7IBuOPthEb056mCmF00ZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SnV/7o0ClhRdRIuJEMBUS9+CC5SYbB/R0kAMA269gW7AGo1
	xSs+bOkC0l3jLiJkXOWf2zauxFM/X5JnHD3SOfukTJtNtu1Q6qS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 05:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107487

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/wayland/{libei_1.1.0.bb => libei_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/wayland/{libei_1.1.0.bb => libei_1.2.0.bb} (92%)

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.1.0.bb b/meta-oe/recipes-graphics/wayland/libei_1.2.0.bb
similarity index 92%
rename from meta-oe/recipes-graphics/wayland/libei_1.1.0.bb
rename to meta-oe/recipes-graphics/wayland/libei_1.2.0.bb
index 1727ef9be..aba49de7e 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.1.0.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.2.0.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "82cdbc9129a0e2c255fcee6bcaa7abed5578ae14"
+SRCREV = "493631688437657a87e9169a76f14a3216c0024f"
 
 inherit meson pkgconfig
 
-- 
2.34.1


