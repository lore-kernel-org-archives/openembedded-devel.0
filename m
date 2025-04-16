Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903F1C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.14422.1744794150323600937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FHWTpzY7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794150; x=1776330150;
  h=from:to:cc:subject:date:message-id;
  bh=ezcQWHam3k3vX5TxCFWbjPSga9lfjmF7RHe8aNDs7ak=;
  b=FHWTpzY7g3yRfjq+hdd+MpB/G+gyzOx4sBwYtWYdYAeOZfwfeW1lljnl
   1t2iHzhTfoZRosD9qBArWI5ZsP8cC+jreysvlRgPTKXSbELCS17je/YZ7
   KSQSsoXoaNJnMBe8Bv4pcP4vz41w5J4DsKu1D9magjp2+YQczGhBMm1K3
   WUD6GUgvNBsyLuY2xJPtpHjNLcbkSwgoxXqAhQhZCR1GfYBJbnVad2hph
   PJA+aT04wmJQ1veBg8mQ2LZ23QTj2tQfP09mK6m/TzVKQv47e6aQcIhT9
   0qfOPI1/5myCOTyRgJqs/BkF/0pG2BDsxbiIy4FAyBRn34FvLerKRLQkZ
   g==;
X-CSE-ConnectionGUID: BHrgMWkMSy+FEWf5Ub9rWg==
X-CSE-MsgGUID: nbwZJthuThuaFTAEQAd9Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175509499"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175509499"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2B39E8529
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B2C2D50F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB2541A0078;
	Wed, 16 Apr 2025 17:02:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/31] adw-gtk3: upgrade 5.7 -> 5.8
Date: Wed, 16 Apr 2025 17:01:46 +0800
Message-Id: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116871

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.7.bb => adw-gtk3_5.8.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.7.bb => adw-gtk3_5.8.bb} (82%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.7.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.8.bb
similarity index 82%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.7.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.8.bb
index 7d7f8a0b6f..6a24c037f2 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.7.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.8.bb
@@ -8,9 +8,9 @@ DEPENDS = "sassc-native"
 
 inherit meson
 
-SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main;tag=v${PV}"
 
 S = "${WORKDIR}/git"
-SRCREV = "88577252bb7a18f445a108d9a4d2dd046e7abb27"
+SRCREV = "72b805550d6245f18021e1530f329ce81999445e"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.43.0


