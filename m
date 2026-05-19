Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EA6CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19308.1779190786900405514
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QxcurGOt;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190787; x=1810726787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CaeVUh7QU0nt38ClxI3zzKQcuxudf/S/ztApNGPxLxw=;
  b=QxcurGOtXUrBdt8Rhdh0n5h6FYzBcLBtj+J1YK2HcwticemmRH3kJpz9
   Cehof734LAGUHLlFQsi2GfdKdEGGntFx4+UjMM/FZKuKOCC2Idq12WArt
   Ka5UTA2dmakcOko1zwK1DOEWZjUzzCxKSpZCWO+qXeBg2mwSpRYcWeUlL
   tbFywDF9eqy+74+A/dC1Sr1uVimQZj6wagRFl4ZnoBvkZprclXcc0TfSB
   0FZ+zGQaf+246i2N7IEK6fz0DlJMx9dQZ7wCcikQ8+dBUcjvrAcZoYSXu
   deydlYewtZVsdBeoD40Pzi3qy/Up1kvOyoseN6PPXk3vqQM/fIS/0DS5K
   w==;
X-CSE-ConnectionGUID: txBINRL7T2yP+MvLtKX1Xg==
X-CSE-MsgGUID: dQHrNYy5S6Kv7awsjBv4ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="227255585"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="227255585"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:45 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5BDA4C00093
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:45 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1341484F4B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id A8B0D4041D3;
	Tue, 19 May 2026 11:39:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/38] libei: upgrade 1.5.0 -> 1.6.0
Date: Tue, 19 May 2026 19:38:52 +0800
Message-ID: <20260519113921.655-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127071

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/wayland/{libei_1.5.0.bb => libei_1.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/wayland/{libei_1.5.0.bb => libei_1.6.0.bb} (92%)

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.5.0.bb b/meta-oe/recipes-graphics/wayland/libei_1.6.0.bb
similarity index 92%
rename from meta-oe/recipes-graphics/wayland/libei_1.5.0.bb
rename to meta-oe/recipes-graphics/wayland/libei_1.6.0.bb
index e44709759c..4acb48deaf 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.5.0.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.6.0.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
 
-SRCREV = "19b64535408aa47abbc8151bc2c925afd6583851"
+SRCREV = "8a46bf3d4b6af7f25a61be53386cf618218114ef"
 
 inherit meson pkgconfig
 
-- 
2.43.0


