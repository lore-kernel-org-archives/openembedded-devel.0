Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE8510A1E8E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46406.1774526221922271628
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KGZ4fGqM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526223; x=1806062223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zR1s0Hl+7fViC0p11UpVMNT6vQNyj5o4pZOQsRK3zMg=;
  b=KGZ4fGqMAKr+iV62IXlCQOs4DB+mEYb215M+2rrX0rzMMVheM+ZD4ToJ
   xL6DSPgyoIkbmqwiQQW7ZNn0kVch9GpKSLJPA44ru9qaZLvtETrZFr6Jy
   3iEFgi2yBzxbTsOYjNbRI9RpWCUkLruH9Mz6jKNp8beIdRbIIaH+ICQsd
   xb1IqsUB1vjAOq7h8AHDUHvr6mVtLAnND1/bn6ML5z+FMQ5r9p4v28kx+
   /lYvF756cna4X+wELQb+aaL+i2O9QrKUwmGohDK+0nA8FIsBQ3veI/F+y
   2D9B0swDwL+0HUWOm4tSbSfbWzQCYCdpWH5hW/nahLSbcZBl0v4qRRG8c
   Q==;
X-CSE-ConnectionGUID: 9p74Czi0QHuyIpvQqSjLxw==
X-CSE-MsgGUID: bNMDY15pTZCa4lw7MyzUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234669344"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234669344"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1FEDA407577
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C37351800E9E
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4B8F1180714D;
	Thu, 26 Mar 2026 11:56:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 13/63] gnome-system-monitor: upgrade 49.1 -> 50.0
Date: Thu, 26 Mar 2026 19:55:43 +0800
Message-ID: <20260326115634.1199-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125668

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nome-system-monitor_49.1.bb => gnome-system-monitor_50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_49.1.bb => gnome-system-monitor_50.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_50.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_50.0.bb
index b23e8bb8f3..5d3c4b1401 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_50.0.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check get
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI[archive.sha256sum] = "915b6a321ada12eba7bf578c20c9fe5e41f55d532847cbd124bbddaaec11d70f"
+SRC_URI[archive.sha256sum] = "a4138aa754b4584c46de91fad1d685e27b12bc2457de761863b6be02d84c4862"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.43.0


