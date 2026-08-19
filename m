Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35FFC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3256.1787132126639430283
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L+fRBeH9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132130; x=1818668130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z7zOtPENaMGXvCM8gnoVJ9MmpYbWIN72WQ9vgczNQcQ=;
  b=L+fRBeH95+XRum6wRcyghzDlzUpf4PTrRtOHzV/d11B5RT2u7eyklFue
   f2fKIKgTzJyypr3jMygLcCBNLdl79FQss2rHpOknkF3rqN8fVwEf6yPrG
   8UrNASb3u+Qoq/cAdz9c/xrMNowfqFCFATTG52BBTlan421jJOGNQqowy
   v90rYWXAqXyamT3GyCqwZHCutbmJmBb7j3vFxcDpw5zajeP3g6CVp/02T
   DmkAG1itEd20QI61gkxdiHPpheOBJ2Wa7fWmgkSxxT04spSAGGrhSXIRP
   NRq0ZYpiKbxH93q3kPeIHjKBhe9cliX6W9XWkdPRlA3mP8Gjg8bdDWcRr
   A==;
X-CSE-ConnectionGUID: SZCZsqVIT3y1uGh01fdiKA==
X-CSE-MsgGUID: xYIFSI2WRyeHaxAk4UABKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251356945"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251356945"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CBD451C1C71B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:24 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 87FC0C041D0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 851281801C28;
	Wed, 19 Aug 2026 09:35:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 03/70] babl: upgrade 0.1.126 -> 0.1.128
Date: Wed, 19 Aug 2026 17:34:07 +0800
Message-ID: <20260819093514.1101-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129273

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- avx512 support is now more extensively checked at runtime, fixes for macOS
  exported symbols and library version, initial WASM support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.126.bb => babl_0.1.128.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.126.bb => babl_0.1.128.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.126.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.128.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.126.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.128.bb
index 10e2c482a5..3dc0a1bd9e 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.126.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.128.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3f090f4b2a61fecf7c8dc60a5804bbc77cefd8d778af2ded059f0e367a52930e"
+SRC_URI[sha256sum] = "e676507b421d414d49db8627415dc1eadbd787536baa7d6fe94a1f1971cbe73e"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


