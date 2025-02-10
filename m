Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD0F6C021A6
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46621.1739178111389260159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TjK+9unF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178112; x=1770714112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eQA/1WBHoBufbJC92uIjU0i2FTVGuaNmvZP58CSGt+I=;
  b=TjK+9unFISVJcl1f2O/rom/7xB1FbS0E69Oew4Z4XYMILoeOc60Qwj0r
   hP0ctm/dsnV+2Hc2WmM8ODZNf7u6K/0C2bleNBOcRaQK7n4AkM7cmaHuo
   D5tSpLPPYsAEcRsMWgbNXqAFjDUH9TAOJTVHPk3vYPurby6uTaZqcFhJW
   IWwCDWvh7awai+Gc9vKHfsvWEE1dQzpGLgiap0oHVzp0EWojZxDWUTy++
   q5OIot/jygAzobtjwiDqczJUp7LV7qb/ngGdYO/Y9gNyihD4+qfXQfshw
   SphdROdMz4rD2VR48d8VCo2eS3HdcCxzhF9g2Xnslmx3UduLHYudPKN5t
   g==;
X-CSE-ConnectionGUID: IHmIBOk5SXecCRNjrWxAsg==
X-CSE-MsgGUID: AIb1o8AHRZazLX1/Bvrqyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168935917"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168935917"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:49 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4961ED6EA1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10DA2D968C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:47 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A6E661A006C;
	Mon, 10 Feb 2025 17:01:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/66] gnome-system-monitor: upgrade 47.0 -> 47.1
Date: Mon, 10 Feb 2025 17:00:35 +0800
Message-Id: <1739178095-26432-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115334

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nome-system-monitor_47.0.bb => gnome-system-monitor_47.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_47.0.bb => gnome-system-monitor_47.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_47.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_47.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_47.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_47.1.bb
index 721ae5a943..e26ae991ff 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_47.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_47.1.bb
@@ -22,7 +22,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check get
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI[archive.sha256sum] = "ede7b925eb714d8b3c2bfbf7405a1b714494fe47e02f0af08f5837b3e256547f"
+SRC_URI[archive.sha256sum] = "d3c5714fd91fa7f05d6775e6797ccdab3149f131d1aa776a3352e2addb110f01"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.43.0


