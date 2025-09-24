Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED78CAC5B9
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8225.1758704439250344584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m8llmFCe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704441; x=1790240441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GdO+L3RXOA59J3x8D7giw3YnxzrJ1aluQhTP00ZEPkM=;
  b=m8llmFCeCRumzn939RtWNrXzD1hxrGjOlGoqkDTzqfa5jG51fpIuGGfp
   HojZbWm5YDOL7/Ul2XBnh2bofIOoKCTmGoD8ouIq+/0GC79nt9e2zf5Gf
   OxCeXcA7neRHaQIp1r1qCieZmvWdgWlJFI5mnghT02WXQzzqOZMvugeJd
   t2xmj/o3lg0TfoFrXCN0sdcu+D/KvZGlJAkgDq4IdP3I2v4RSqkHp4kjm
   htT2uhtehxJ0aniSQOp8QgBQlP+X9On7AZ+JqZnv40jgvV9jm+YMrzHV/
   esTC28/1wvXwvUWPXUSYHyRV41ooyTTSohOgBW06sLlFOWqujzeTTXKkY
   g==;
X-CSE-ConnectionGUID: 5fZLORJzRueYSULDZPzDxw==
X-CSE-MsgGUID: BC9WyQuPSwywQmZKMXyzJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="213113615"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="213113615"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:41 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 8CCEA1002BB0
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4A4D71400614
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id BE75C1802251;
	Wed, 24 Sep 2025 09:00:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 17E8E1A0087;
	Wed, 24 Sep 2025 17:00:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/29] gnome-system-monitor: upgrade 48.1 -> 49.0
Date: Wed, 24 Sep 2025 17:00:06 +0800
Message-ID: <20250924090029.1786-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119769

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nome-system-monitor_48.1.bb => gnome-system-monitor_49.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_48.1.bb => gnome-system-monitor_49.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.0.bb
index db07eaa27a..4b981125e4 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.0.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check get
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI[archive.sha256sum] = "133c3a6e286366e659fd2d80582409a7bd5edae456e63c4f69ccf66ed6fc6638"
+SRC_URI[archive.sha256sum] = "dcc844dd70e4a077f066524dbd14f9cfe04b09831d70b7d69a51816723cd4aa0"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.43.0


