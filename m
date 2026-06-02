Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7625CD6E6A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21490.1780394905802162692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eUjvuM1b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394906; x=1811930906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8S0WoFQk09C1FxfSlq2mlX5wBZCL6u5+ygDO8tQDt8c=;
  b=eUjvuM1b6D8k7c7Ra9SPAVxr2hmoR/7dOYu4PoZx2k1ltFRsTzstdrvn
   I1ybp4eUVyOOYKUyb4xXhWlwy9UqdTlgz279xxQ2uQJ/J1PIUM6sV/X1D
   1E00/TaphKGmxObeIG9IxGrUnW4mzryKpZLvvbdq4oEwGdWqq46MBx8Tn
   M76QLyiAEPAPq9qJlI6WXryrbp+O/bFYiK1xxQS6ggPDDq44xv2B6d8Ci
   /GWHF5z6B6eaT7Qpyw5NrI2uZncVhJ7OdP6tSW9jNLIa7sk5Jxp/M5m/M
   ChsvcCLEcWuNNd/5OQF5yIHTz9nV7wsPG+UT9yoJen9irWls9q7JN+9Ac
   w==;
X-CSE-ConnectionGUID: 1A3W7ZiHTW+msT1fHeW1uA==
X-CSE-MsgGUID: rQpLPgnLTyuIQeE6nriaWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242743055"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242743055"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:25 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 385411002B84
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:24 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E33D2181AA54
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id ED8D418005AE;
	Tue,  2 Jun 2026 10:08:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-xfce] [PATCH 12/38] libxfce4windowing: upgrade 4.20.5 -> 4.20.6
Date: Tue,  2 Jun 2026 18:07:28 +0800
Message-ID: <20260602100755.2117-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127334

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add xfw_screen_get_monitor_for_gdk_monitor()
- Add missing "New in 4.20.6" docs section
- Add missing chain up to parent class
- I18n: Update po/LINGUAS list
- XfwMonitor: Fix (xdg_)output_done event handling
- XfwMonitor: Fix typo and initialize class member
- Ignore workarea/workspace count mismatches
- Fix incorrect max to clamp workspace number to
- Implement workspace geometry for wayland
- Add XfwWorkspace:geometry property
- Fix missing workspace signal connections in test program
- Add test program to enumerate workspaces
- Fix X11 workspace geometry and layout getting out of date
- Fix incorrect col & row ordering for Wayland workspace coordinates
- Fix width -> height typo for XfwWorkspaceX11 geometry
- Add fallback monitor on X11 if XRandR doesn't report anything
- Don't depend on wayland-scanner and wayland-protocols
- XfwWindowWayland: Connect to XfwScreen::monitor-added
- XfwWindowWayland: Connect to XfwScreen::monitor-removed
- Translation Updates:
  Georgian, Kazakh, Korean, Lao, Russian, Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{libxfce4windowing_4.20.5.bb => libxfce4windowing_4.20.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4windowing/{libxfce4windowing_4.20.5.bb => libxfce4windowing_4.20.6.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.5.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.6.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.5.bb
rename to meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.6.bb
index 59374d7947..615367a684 100644
--- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.5.bb
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
 DEPENDS = "xfce4-dev-tools-native glib-2.0 gtk+3"
 
 XFCEBASEBUILDCLASS = "meson"
-SRC_URI[sha256sum] = "6b4e19a66db650c9c8a88f00bbf266e9ced0070b7dbc0aaeea05be0fc6a2eb4d"
+SRC_URI[sha256sum] = "2d06b6a567c965afbca1a51419fc728fd83bd0460e30ab62c34564d5e0aac9e3"
 
 inherit features_check gobject-introspection gtk-doc xfce vala gettext
 
-- 
2.43.0


