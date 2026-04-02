Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7491D1112275
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7120.1775096162335174097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DbLOgEX1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096168; x=1806632168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8YZG1mzToNj/+f1x1hrlug1yiX1cntcgrpB6E9li9Sw=;
  b=DbLOgEX1nLeAmEkCPzWeSFwzUz/oofBU9jFLoCQTXyiDfi3HYibGevUq
   vsAU1XG5AeNSWogKaMR5Y2wGruj0Y5cKf5vDgt1GqIdv5pHIEDVr0AaUS
   q2LMBr9942WorYtaQxMgmQgU/6d9GIYyFIWiypv7MrUOQeZW85OqQXchY
   mp638UHGQIsgGsLtDWBOR09aJfKvo0kFFwokP9yrR/yGEZ4YiFbS0QszX
   rVpF9xxxa/zvvzCKgGX0aCBffVHRCB5+MSb8q7yXatmvs8YzcHHkrOr0T
   iUIFy6WFBpjOhvT5fnDVREn7EbiGtEK4DUR1oNZ1ss1KcSTRNNqNrMg4W
   Q==;
X-CSE-ConnectionGUID: YpG2HotJSHmwOpc3u2U5Yg==
X-CSE-MsgGUID: 6u1zES6GR6W4HWw+OubOWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235493554"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235493554"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:16:08 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0C1CA407540
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id B00141000395
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3CFB31003742;
	Thu,  2 Apr 2026 02:16:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-xfce] [PATCH 39/39] thunar: upgrade 4.21.4 -> 4.21.5
Date: Thu,  2 Apr 2026 10:13:54 +0800
Message-ID: <20260402021355.1324-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125953

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Popup menu at tab label on keybord activated
- Add keyboard support for context menu on terminal
- Add keyboard support for history menu on back and forward buttons
- Add keyboard support for context menu on toolbar
- Popup menu on tree view item for keyboard activated
- Popup menu at focused widget on keyboard activated
- Disable overlay scrolling by default (#367)
- Wrap long filenames in error dialogs (#1412)
- Limit filname length for create/rename (#1812)
- Add fallback for backdrop highlight color
- Properties dialog - add separator for fs data
- Show filesystem type in preferences
- At tooltips to 'Capacity' and 'Usage' (#1806)
- Show as well 'usable' size in 'Capacity' row (#1806)
- Differ between total and usable fs space (#1806)
- Add help text for URL arguments
- Call xfconf_shutdown before exit
- Store pending column size changes on close (#1318)
- Use GtkTreeModelFilter for tree view side pane (#1460)
- Tree-view pane: Fix wrong selection on open new window
- Prevent shortcuts view focus lost (#1675)
- Add 'grab_focus' parameter to 'set directory' calls (#1675)
- Expose drag-drop-mode in preferences
- Init media_fs_uuids on startup
- Never ask twice on replace/overwrite (#1794)
- Fix translations for XML file (#1790)
- Improve statusbar loading text (#1787)
- Detect CDROM media changes using ID_FD_UUID udev property
- Add %d to strings to fix some transl. (#939)
- Pass current dir to catfish (#1785)
- Ignore G_IO_ERROR_NOT_SUPPORTED (#1782)
- Show selection busy information on statusbar

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-xfce/thunar/{thunar_4.21.4.bb => thunar_4.21.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.21.4.bb => thunar_4.21.5.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.21.4.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.21.4.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
index af2580e7df..32d4c39aa5 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.21.4.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.21.5.bb
@@ -13,7 +13,7 @@ inherit xfce gobject-introspection features_check mime-xdg perlnative gtk-doc
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "85f2c7fba6e891eb0df04b94139d519778130ecde95a6e629ac611d8cc9c6a7c"
+SRC_URI[sha256sum] = "eddbd4bab29c73718734e0bfcf650ceea8b4fcc8cb2cbb0b24fe22b286a2be00"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[pcre] = "-Dpcre2=enabled,-Dpcre2=disabled,libpcre2"
-- 
2.43.0


