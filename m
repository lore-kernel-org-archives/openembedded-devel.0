Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAADFD0C820
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55835.1768299864732423817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iZIaVN3f;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299863; x=1799835863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B/WvBKO51pdJYPoLzICP6l6lN1oeE7gjtoxSzQVOpU4=;
  b=iZIaVN3fSf/JDAE3z8kvNfD8b7QR+FYckaspU6m4y4jN21xiqSQUbVcA
   jVODobLvBLaPhqUOsHgDohRtqQ9VfetwhMQHQisCPaSzCzlGAfvHvjYvg
   Z9eiJKI6fJZyygDOClKcuUVt8Ho6gfGo2a2cS11UpeB6R1ktTJGbIfhZP
   uV3dOP9lgUtrz75R4le3avJ5+j+soKE+JYY5az+V/vkco2jZHnxz4Cg1g
   GlP8dWo1S2SJ+PjXvIbL8EBayB45rZ77GZiaJ/6sdefyI0QgOLJFdHoTL
   5Rh+WOklPmBhU8Q4irl+sEaLi5Rsz4HWdB6gMOSxJ/lkjqGIYXA2OO6eN
   g==;
X-CSE-ConnectionGUID: RZz69AO7QGGc7OQ+4m0/SA==
X-CSE-MsgGUID: 9xI3nSfXRdaL/KhYhmMtcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="214223663"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="214223663"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:21 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1DE73C00203
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C269D140035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F03591019049;
	Tue, 13 Jan 2026 10:24:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 07/22] nautilus: upgrade 49.2 -> 49.3
Date: Tue, 13 Jan 2026 18:23:19 +0800
Message-ID: <20260113102334.605-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123413

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Don't waste resources on images with extreme dimensions
- Consider thumbnailing finished at correct time
- Redraw view when screen scale factor changes
- Fix potential outdated view item usage
- Correctly close mime type program chooser dialog

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nautilus/{nautilus_49.2.bb => nautilus_49.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.2.bb => nautilus_49.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
index 1229fa4a80..b6c13dedb0 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_49.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_49.3.bb
@@ -24,7 +24,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext features_check mime-xdg gtk-icon-cache
 
-SRC_URI[archive.sha256sum] = "2576b34bed2781a89f09051ec9fcae3ae17eb7172cd7be678f592aa14e4c26b1"
+SRC_URI[archive.sha256sum] = "aa6bf376f08992362805eae01890b1bf5ad148f356aa7ccfe1f664eda88d413e"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl gobject-introspection-data"
 
-- 
2.43.0


