Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D93CCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11087.1760433587759665531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NvPtNjbI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433589; x=1791969589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s/jvTMjLEse0/cC9T2holGhPK7eiiXpnqWRUQtSLsE8=;
  b=NvPtNjbIFMg1NRS1IRNU71Hfk+cxktczw3Q29socJMPxhH8UDgcGUF0Z
   tW3z97FK7UrTVaiIu40huEprE/LpylMpWZdH7BOFnyZBbgMYvAk+pwyYb
   vUhA3yqBQyamGEApn2LVdQKVLa98YIleylRtlWnh0ABStMTP4wMXOh7nU
   iGnNTsO3FeAOuAZcvVShdRi5aVwPPJGU3pbWRRpMW03G9sckNRI1oe41z
   mSJF/m5C1AtiOl2Q63o8KBOMqe3W+l+O/c4HE1uqntjxFDZWstnWZPwd3
   ogy14ZiU8qJtwtJdrdv7mSVF0NR0Ckkkt2IuyxBpSTfKlokRU9FYlgeRR
   w==;
X-CSE-ConnectionGUID: yvoKLEDuQt+4LOp586prjA==
X-CSE-MsgGUID: YQlIwU+yRiiM8T9VwnrtHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215886613"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215886613"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:47 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id DFB701C0008E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 9695F100027F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2CEC3101BB7D;
	Tue, 14 Oct 2025 09:19:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/44] gnome-system-monitor: upgrade 49.0 -> 49.1
Date: Tue, 14 Oct 2025 17:18:50 +0800
Message-ID: <20251014091927.493-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120561

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nome-system-monitor_49.0.bb => gnome-system-monitor_49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monitor_49.0.bb => gnome-system-monitor_49.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
index 4b981125e4..b23e8bb8f3 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_49.1.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check get
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI[archive.sha256sum] = "dcc844dd70e4a077f066524dbd14f9cfe04b09831d70b7d69a51816723cd4aa0"
+SRC_URI[archive.sha256sum] = "915b6a321ada12eba7bf578c20c9fe5e41f55d532847cbd124bbddaaec11d70f"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=true, -Dsystemd=false, systemd"
-- 
2.43.0


