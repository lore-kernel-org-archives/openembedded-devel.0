Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BC510A1E94
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:12 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46409.1774526225173007194
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ukr1TmcT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526225; x=1806062225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fAkZ1rlF04T1L6z4081fuG7xDAvwEqXqxZFVLecKNsk=;
  b=Ukr1TmcTSPeBLznN8uvaz+6WM5MST6ZFdHfunlI3lEl6Iu8SJaVH5MSF
   gnmUzAkArFgTFb8dVbXen8hAV15EeknlZxYRcDlkve9gOQzJwUyHjsPuZ
   6EgZO75u5mS/k0dNj21AqOZtKX0n6fqJguJIlFZwl5OEB6tmnnmgvZWHv
   ModWDeVarHs+9NnjlGtq/5R6e9qkcYyKbQ8Zu/X/UQgijSoS0JyxKKpNO
   rKOhHcE2Cf1rNHUpz/Dk/Y86Cv/8Z3YfxouQ7ugBme/wpNCJzwTshBhFu
   7l8Cjhujy23FD2Dcs2K3bznDGeI1YIe40ZYJQzdsqklIQhaGVAXog8hVz
   A==;
X-CSE-ConnectionGUID: LqOFuiEuQaaPuZ/0FHETKQ==
X-CSE-MsgGUID: WuGT/l9JSQOgH5Thr18cdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234153991"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234153991"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:04 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AE8F0407561
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:03 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5A1FD1846191
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id D2B421807149;
	Thu, 26 Mar 2026 11:57:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 14/63] gnome-text-editor: upgrade 49.1 -> 50.0
Date: Thu, 26 Mar 2026 19:55:44 +0800
Message-ID: <20260326115634.1199-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125669

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-text-editor_49.1.bb => gnome-text-editor_50.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-text-editor/{gnome-text-editor_49.1.bb => gnome-text-editor_50.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_49.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_50.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_49.1.bb
rename to meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_50.0.bb
index a8dd3d5cab..81224f7718 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_50.0.bb
@@ -18,7 +18,7 @@ inherit gnomebase gtk-icon-cache itstool gnome-help mime-xdg features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "f0448f247bb5979a50c60222c44c4511880ad474e25495765e5ed2246e54dbb1"
+SRC_URI[archive.sha256sum] = "9dc299da4daa085423b5d48db59f0021ad55e74143a5cb8ab2e5ffe17967f45b"
 
 FILES:${PN} += " \
     ${datadir}/metainfo \
-- 
2.43.0


