Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59AECD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21216.1780394892635992359
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ayAJwi3n;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394893; x=1811930893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c7wuE/y7kNTOVqr7hKuLrhJSWE4ZWjqvxUFFFnB0fNo=;
  b=ayAJwi3n2+1s67FtCjHP4YYAdCkpMCjggRKgd3OzYnDwTDUpxaIj4lCW
   SdG7THCmgor1gzsieg/v5esSfRQbFVhYhZcoJf3znc2L8NmSeUVodKwiH
   kLVMWQeWismK2XVV9PjSBMsEoxfHtCgGL+Y3WtoCvbhgSqcVi9MfZqPNZ
   DXz6W3uMF42XY2yuk9XgOPe4P2e4qlYong6tjWRDfT5rBl9p2YQAWyi/S
   Lj/dxneYd/FP9Bkmq30P7n1eXmNc8DRILfdqt6ACcXFZIbIUeO/duQtUP
   iaZckrpOxv7lL2t3IybmN2buokbIJ0tyH7fCzg4FOtkYrmq621QcT+N8t
   Q==;
X-CSE-ConnectionGUID: W0SE5F/KTxqdcrH1VMiKGw==
X-CSE-MsgGUID: KFgoDXjfTuKe9hyd+V0EsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242741656"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242741656"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1EF751C00095
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:11 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C3D7818026D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id DAC881800587;
	Tue,  2 Jun 2026 10:08:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/38] gdm: upgrade 50.0 -> 50.1
Date: Tue,  2 Jun 2026 18:07:21 +0800
Message-ID: <20260602100755.2117-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127327

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fixed issue where GDM failed to properly terminate conflicting graphical sessions
  started outside of GDM (e.g. ThinLinc, TigerVNC). GDM now queries logind directly
  to find and terminate all conflicting sessions
* Fixed plymouth hanging indefinitely on headless systems or systems without monitors,
  which prevented the system from reaching graphical.target
* Fixed XDG_DATA_DIRS construction to prevent gnome-shell from failing to find its
  files when /usr/share had higher precedence than /usr/local/share
* Fixed bug where GDM would set XDG_SESSION_TYPE=wayland on X11 sessions
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_50.0.bb => gdm_50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_50.0.bb => gdm_50.1.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_50.0.bb b/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gdm/gdm_50.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
index 858933a4b3..9332c7836c 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_50.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_50.1.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 
-SRC_URI[archive.sha256sum] = "646f53d68f2d2d147146ffaeb85047ded8b813dcb1c104d8f0ec36ca609eb5bf"
+SRC_URI[archive.sha256sum] = "770159373512192410f412b5d0c4678ec1573f1ae4b39c81fe75861fe8890174"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] = "-Dplymouth=enabled,-Dplymouth=disabled,plymouth"
-- 
2.43.0


