Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B54C02185
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.40590.1736843359865727234
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HfKkIEsc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843361; x=1768379361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o1lRNCFws8rXyhqTRJGBNPsh5GTPjaFvR8bn+TbqPSs=;
  b=HfKkIEscmdc8UMYzZnv5B6aA2/tWDL8/f3DrNMeSn7OGNNZssXTqnvet
   Go4jqfD/t0x6cs3VWnnxf044Vqgwuc1dgWB+e2pHo+MWoIKpBIzfzVPHu
   Fv38Ba9DgbfU53P6bILelhjU/vbv7mMP767Si2LqPB61mvPibmdO3hLEN
   w4LqWpRfz68o1zxpHnNzKPtWb0yNkbZ7fV3XqWnU53g/Z9jnkxST396vg
   cFPYjyDHswk/jvKeuijOfdadkxnx5nsAPp8pzSvHD624LlbLZclVE0xxZ
   td9EYYxZRy36K4aowpywkvcNRm7+8I5XTlY/+Fhjt9TSRrUw4T2H33ER7
   Q==;
X-CSE-ConnectionGUID: s9n/PvQaQraQeb5dw0RLWg==
X-CSE-MsgGUID: smtjdvS4Qhinz7siugMqQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="165944755"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="165944755"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD61DD500F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2887D509D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 413B020071A35
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E4C241A000B;
	Tue, 14 Jan 2025 16:29:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 30/30] xdg-desktop-portal-gtk: upgrade 1.15.1 -> 1.15.2
Date: Tue, 14 Jan 2025 16:28:49 +0800
Message-Id: <1736843329-4131-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--2.534200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrw4SuXsUCGYgTpDxb/TttypZ9
	IbzcSt3iyLnStea0gnSOK96+ExbFvSUub0G/po3cA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnx4LalWvXBvTweK12oEGfuVd49c0zgWMwEcl7G0uKVGmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1oil8ikPlwmbSPsSlhFbjXUozazfVUy53HZUFzQ1A5IIx65NyCoHURsT37
	tH1uo6dutaNCiQRpg1CIBsR0h/B75npRZY6Urfk1y1Jqsedj8RTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114874

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Plug memory leak in the notification portal backend
- Implement the contrast setting
- Set correct platform data for notification activation
- Drop use of private GNOME Shell notification API
- Depend on the graphical-session target
- Ensure proper shutdown target
- Build against xdg-desktop-portal >= 1.19.1
- Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...op-portal-gtk_1.15.1.bb => xdg-desktop-portal-gtk_1.15.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal-gtk_1.15.1.bb => xdg-desktop-portal-gtk_1.15.2.bb} (95%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.2.bb
similarity index 95%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.1.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.2.bb
index 0d2b0012c5..8197a72ee2 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.2.bb
@@ -18,7 +18,7 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "54003825481c2b48fd0c42355b484469dea12020"
+SRCREV = "de133a5def77cca7de650ce331bd07488ee91e6c"
 
 PACKAGECONFIG ?= "wallpaper appchooser lockdown settings"
 
-- 
2.43.0


