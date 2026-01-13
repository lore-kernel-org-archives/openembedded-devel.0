Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF99FCF45DE
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55830.1768299844688680591
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pIcjHECt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299843; x=1799835843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T/X7H39ET9WNbyDznRPcGlqgN2lXgmjxSo2ORtzDV2M=;
  b=pIcjHECtIO7UdhIBqk7eegipleGNrFzKOa7X3S6BfMOj4Bxp+P1BXpkq
   tYp2vFlDlL7H5uNEug1sIE6BYlT0L9NaymHoFMayw/ULCLFdouPjwlGlV
   v31wGGcY+jswFlSBqRsp9Dj+k5a182bVk7EEKJ4QVInytbRLatrpvUAgK
   KRZ3omBHMXuQxvv9aXtDXBnIi93o/xihn+oNLXSPsTxW/D3utSXItSKmQ
   pFFb4UpWA7sDDWcOMNjvxewiWBW1NApBnpt7+qDV9QaLt/jrWe51z7p8P
   fg6lVSpt3mxfpKVrJCYxp+kvXFnXHhzHUdsfbRa1fs18/4aI/pMMbx1WP
   A==;
X-CSE-ConnectionGUID: lH+wFoGoQCesPs0Y6orknw==
X-CSE-MsgGUID: KBx2J8kZRvuX1f6vQHHDZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225654339"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225654339"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:02 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 20AC51002B85
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C8DA41400353
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F378E1019046;
	Tue, 13 Jan 2026 10:23:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 04/22] eog: upgrade 47.0 -> 49.1
Date: Tue, 13 Jan 2026 18:23:16 +0800
Message-ID: <20260113102334.605-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123410

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix frequent crashes when with gdk-pixbuf 2.44
- Add image/avif to the MimeType list in the .desktop
- appdata: Add missing developer name
- Set prgname to application ID
- data: Rename appdata to metainfo and use rDNS app id
- metadata: Hide unreachable help URL
- desktop: Add more keywords
- content type to mime type conversion
- Official website has been retired
- org.gnome.eog.desktop should list image/heic as MimeType
- Segfault SIGSEGV when switching images

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/eog/{eog_47.0.bb => eog_49.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_47.0.bb => eog_49.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_47.0.bb b/meta-gnome/recipes-gnome/eog/eog_49.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/eog/eog_47.0.bb
rename to meta-gnome/recipes-gnome/eog/eog_49.1.bb
index a82cd60cc9..202d68700a 100644
--- a/meta-gnome/recipes-gnome/eog/eog_47.0.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_49.1.bb
@@ -22,7 +22,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES = "opengl gobject-introspection-data"
 
-SRC_URI[archive.sha256sum] = "db5edbf5224d75126a7b7d8ee4e9272a2f30a953331d5baf6d3f3c0ce0cbde66"
+SRC_URI[archive.sha256sum] = "fadd12e14ba9cd2be6989dfbcef40001645b63440ceed8e04867b07587b066dc"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.43.0


