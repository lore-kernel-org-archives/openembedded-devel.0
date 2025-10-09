Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD215CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:24 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.5570.1759990099482867316
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qGu55AYH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990100; x=1791526100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FZEs7vJWbNYM+GU84VTgTgWwr9S1fkuRHd6Bn+ZJSZc=;
  b=qGu55AYHW3tW+vMYzxCfk92LxuXFqNjo/Dtn2U4pCDEZxSdz5YurwBkf
   TcjMaCSgB6lRKBThs8EHGYszveBo1c2j5lfRUhWjjvX5tGDbodI0Hyu+1
   jVNkBy/W83rZDZgbnkWrS/G4HMD/fZDdlJzA9o8B2p5vcn5TkXxrFjkiA
   O395XZp4aS1uWU1FPbOCrlauRuFLIXgje2KVNFrLYBFZCNaGmCkZfTJpX
   sZ6OQjVdkMluo7NpY/frFEcqvFtbuO9+je1uibRmOud+5yQkSZ0ijJlyQ
   NtNiJym4XJagE+HmZxfv3wxefVZIf9CodPXxUUyxQDX8gtKMBUbVOc+NF
   A==;
X-CSE-ConnectionGUID: V5lrhsq8SeG8xSv0ctsPqQ==
X-CSE-MsgGUID: Sv1TphsySxWNZ1uEED+DmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="215416707"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="215416707"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9AF6821FD
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:17 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4D46118019BF
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E21451001CFE;
	Thu,  9 Oct 2025 06:08:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/22] gnome-menus: upgrade 3.36.0 -> 3.38.1
Date: Thu,  9 Oct 2025 14:07:49 +0800
Message-ID: <20251009060809.445-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120399

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Add GioUnix-2.0 dependency to introspect libmenu
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-menus_3.36.0.bb => gnome-menus_3.38.1.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-menus/{gnome-menus_3.36.0.bb => gnome-menus_3.38.1.bb} (73%)

diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.38.1.bb
similarity index 73%
rename from meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
rename to meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.38.1.bb
index 47b6733e48..e5b7f3db07 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_3.38.1.bb
@@ -9,7 +9,6 @@ DEPENDS = "glib-2.0"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gettext pkgconfig gobject-introspection upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "a8fd71fcf31a87fc799d80396a526829"
-SRC_URI[archive.sha256sum] = "d9348f38bde956fc32753b28c1cde19c175bfdbf1f4d5b06003b3aa09153bb1f"
+SRC_URI[archive.sha256sum] = "1198a91cdbdcfb232df94e71ef5427617d26029e327be3f860c3b0921c448118"
 
 FILES:${PN} += "${datadir}/desktop-directories/"
-- 
2.43.0


