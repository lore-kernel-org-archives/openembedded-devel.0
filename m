Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52798C369CB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35397.1745311772881697853
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ogOYVJ7g;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311771; x=1776847771;
  h=from:to:cc:subject:date:message-id;
  bh=G/guY7CtRkgO158LNkAJaAHRCYRyfyu0jKozgC+Knpg=;
  b=ogOYVJ7gcZgMCQIBNAgMwlzDUTlam8xIjzfj8v5lKn/HrrupwKMmxPDx
   HV9794vCzFo9Uz3A0iGrZzZTd4IHvZQEdp2xstcb9r3JvPxsQBZvTviOs
   0TGguBdYG9cUilnOdLA7fuIJFy5bmCY/EeWiCKqLQPs4EnDkjRaS3z+DP
   B2YHNRASgtZZzE6nHauzCtaxwaugySIikYNKPhqre++H30nk6TzOv0I6t
   PAEhsiT79fu3FUpnUquA+fAmWYiNVUWdSZXW5slD9qNVW9s7JgnhPSRID
   yUGjLBrX1fvSKo2/jtpisGadepTlAT0sxEEzWFiHqwVT30Hcnu+sfMDMQ
   A==;
X-CSE-ConnectionGUID: xLMfyejrT8efF1M8t0cavA==
X-CSE-MsgGUID: D9Md3sroSFyYeu7mxsR3pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197650118"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197650118"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:29 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FE36E428E
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0ED37D3F2D
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6E6441A0078;
	Tue, 22 Apr 2025 16:49:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/30] adw-gtk3: upgrade 5.8 -> 5.10
Date: Tue, 22 Apr 2025 16:48:52 +0800
Message-Id: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117022

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixes a crash in chromium browser with the light theme.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-themes/{adw-gtk3_5.8.bb => adw-gtk3_5.10.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/gnome-themes/{adw-gtk3_5.8.bb => adw-gtk3_5.10.bb} (88%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.8.bb b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
similarity index 88%
rename from meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.8.bb
rename to meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
index 6a24c037f2..b00b4a4679 100644
--- a/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.8.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/adw-gtk3_5.10.bb
@@ -11,6 +11,6 @@ inherit meson
 SRC_URI = "git://github.com/lassekongo83/adw-gtk3.git;protocol=https;branch=main;tag=v${PV}"
 
 S = "${WORKDIR}/git"
-SRCREV = "72b805550d6245f18021e1530f329ce81999445e"
+SRCREV = "c2e74c9d2a5c3895b8025ac1d4b9e4cced71fbe9"
 
 FILES:${PN} = "${datadir}/themes"
-- 
2.43.0


