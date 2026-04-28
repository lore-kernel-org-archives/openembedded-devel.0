Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36980FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 09:36:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9026.1777368983944937478
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2026 02:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YxNpztMz;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777368984; x=1808904984;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=r4y2/8pjgBk6WMR6sLdAzEz4ZawgfUyYEGJv1H53kZE=;
  b=YxNpztMz+hJpmTq8atEi84AmXBipu70yEjjMutEU78UoR1tj1RxayGE9
   8QOFEGxsLJVPnoRkTjBMT9j7IjOZ3BiRxh4ioRrP+XxI/m+PNGatoXnST
   aiQxhV9zFUcLl4c0GtpxbHE9xTJXSZZptYaBZ8jg0nSzHtnOOmJVehnvP
   DESlICwlh7wsbdl9yWw7BBr/qCTUdyLXszU7rYVpPGo2ky0nwtJU8Deka
   4ic+JHx98LVnOonwb0tk3F5HKRi5K1vuoLvsUkxzaZrqH8IAZzLuTDb31
   lGD4MtVMViUv04Kt9p0+UnXzygG4GEhJs/eUBM8lzGwhXPcFNlfQewLig
   g==;
X-CSE-ConnectionGUID: VCtEa8BeSBCILwIuPqoBvw==
X-CSE-MsgGUID: l17bSwEfQiewAmSJie3izw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="217459420"
X-IronPort-AV: E=Sophos;i="6.23,203,1770562800"; 
   d="scan'208";a="217459420"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 18:36:22 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7394342A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:22 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1EC2118019AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:22 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E12F61800536
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:19 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH] gnome-shell: upgrade 48.7 -> 48.8
Date: Tue, 28 Apr 2026 17:36:13 +0800
Message-ID: <20260428093614.672-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428093614.672-1-liuyd.fnst@fujitsu.com>
References: <20260428093614.672-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2026 09:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126655

1.ChangeLog
  https://github.com/GNOME/gnome-shell/releases/tag/48.8

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../gnome-shell/{gnome-shell_48.7.bb => gnome-shell_48.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_48.7.bb => gnome-shell_48.8.bb} (96%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.7.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb
similarity index 96%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.7.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb
index 3f668fe410..e8b1bd6d0c 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.7.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.8.bb
@@ -34,7 +34,7 @@ GIR_MESON_OPTION = ""
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
 SRC_URI += "file://0001-shell-app-usage.c-only-include-x11-headers-if-HAVE_X.patch"
-SRC_URI[archive.sha256sum] = "2dff328d5f7e29f8c897bc21caac7d2d443be3c63ae84d7623dec800f23493c3"
+SRC_URI[archive.sha256sum] = "cb9b7d86cf362530e648e68caaf109a32af4e832874a26791ca8789773efd233"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.43.0


