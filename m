Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73FAC36011
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.61113.1742893339873671576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sbyrR7Ez;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893344; x=1774429344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vQrxWbZrr0+jGcv4Qj3OPUt5dRgru+mv5QZNR76Joxs=;
  b=sbyrR7EzMNc6yL2+GMV4bz3/HiepLyMYWfwqC41USgwhtt7ueIk6RsJN
   FCJOf1+oHr6ON36Lp4xc20N+yI9gwSRnBOVyAdx1MbWE/2uMvtpBcZYaA
   niCMdQURkWTCBj0VTu3MigMk8rZg48egiRN+Jk0M+mOYVSmjZkycKY756
   in5Dw7Wi9ulnyA+ydQbuxFm7lXxsjS3GskFvNAuQPJNRkU2UkxW4HWVg0
   HR0BY/H0hrmP69RlNzIBqgO8u3eTKSnRQEuLLhDhtjxX4PNd33m9poigr
   lEuAdBjMQMRzbFh6pzcCm6KfGYfMu5KykPsmV/AJo9eab70XfnqFztpfZ
   A==;
X-CSE-ConnectionGUID: taPKrepUQF+f3RZyNHoXOg==
X-CSE-MsgGUID: nWfkADSPRuy1e1ml61DMpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194490888"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194490888"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:23 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4054196705
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F163CD50E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B20C31A0078;
	Tue, 25 Mar 2025 17:02:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 45/45] xdg-desktop-portal-gtk: upgrade 1.15.2 -> 1.15.3
Date: Tue, 25 Mar 2025 17:01:52 +0800
Message-Id: <1742893312-3809-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116267

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix build against newer xdg-desktop-portal
- Fix return value for the access portal

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...op-portal-gtk_1.15.2.bb => xdg-desktop-portal-gtk_1.15.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/xdg-desktop-portal/{xdg-desktop-portal-gtk_1.15.2.bb => xdg-desktop-portal-gtk_1.15.3.bb} (95%)

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.2.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
similarity index 95%
rename from meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.2.bb
rename to meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
index 8197a72ee2..0f6a9291b8 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.2.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gtk_1.15.3.bb
@@ -18,7 +18,7 @@ REQUIRED_DISTRO_FEATURES = "polkit"
 SRC_URI = "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protocol=https;branch=main"
 
 S = "${WORKDIR}/git"
-SRCREV = "de133a5def77cca7de650ce331bd07488ee91e6c"
+SRCREV = "337202d4e7179857bc37b03c1a6d8c9d92e47c44"
 
 PACKAGECONFIG ?= "wallpaper appchooser lockdown settings"
 
-- 
2.43.0


