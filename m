Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5789C25B41
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:13:09 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.116077.1698048787679154119
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116573364"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116573364"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:13:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 360ECD618B
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:13:03 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 799EBF80F
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:13:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FA082FC6ECB;
	Mon, 23 Oct 2023 17:13:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] adw-gtk3: upgrade 4.9 -> 5.1
Date: Mon, 23 Oct 2023 16:12:48 +0800
Message-Id: <1698048768-24147-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-2.825800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyshm837eIt7zb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74CC7C2rJeUToWFHVj+6F+rIa+2
	jJ5e7tWCxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzoHBF1/NqfSK+pv
	ha3plW4yJFIlP+0B5/jYyMiMdisxtfERIxsXGnsHdJYRCYUrNNH0ZWQUC79hWU5A2N41YhwxyDa
	XlbzbC7iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105630

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Fix Headerbar Buttons Width error.
Fix Geary sidebar looks broken error.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_4.9.bb => adw-gtk3_5.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_4.9.bb => adw-gtk3_5.1.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.9.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.1.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.9.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.1.bb
index d7b7eef977..577acda59b 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_4.9.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.1.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "08d3dfbde51d4cb0a3bb8e58a81aa61064857d89"
+SRCREV = "a3e1050341956fcae53b2b4403affcf2578a42f4"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.34.1


