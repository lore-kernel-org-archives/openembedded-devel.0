Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97401C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3258.1787132144375481651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OyZxwDKm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132148; x=1818668148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zMHcKjQS3YZAUDOBR1suHwBp7yKgvYvNKY9tJLzFMA0=;
  b=OyZxwDKm4th1lyn3+RlWwNjR7jGbnXaq2TydWAoLlQNNAXi/q2VyGrUb
   eYpBVEnP2JZUWzQU6u7uZrtyne7RgO6XFB9FsiIpCRvl/fswCnHWqL9Fl
   gkLh2lIROMSFvHSjw4YeYSCzb+5vBBLOM69Oimld7dToSihk/OE/KlhaW
   cxGhe8NlhM+JLEp/4utGdRq33QMSRBkVpgs4aYKM2OeZcTJO03V8GnaUp
   vTvPsiufvfjypm5gaRARW6K2a00+PvZjxgPwdCAErRnyS14hWrigolTtC
   GbmhjZGaLw8wbPjSqq3bFzxALmAR/O3NwUZm3555cm8m7Kbnapf580oDZ
   Q==;
X-CSE-ConnectionGUID: QQTfLzbgToaDpcsg9W2wrQ==
X-CSE-MsgGUID: 08W2EiDoR6uJ8WWRlby8JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507792"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507792"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:46 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 93DBE1002B81
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:42 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4E0E3181ED58
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5EC6F1801C11;
	Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/70] libtsm: upgrade 4.6.0 -> 4.7.1
Date: Wed, 19 Aug 2026 17:34:17 +0800
Message-ID: <20260819093514.1101-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129283

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- A new tsm_screen_get_cursor_style() interface is available, that provides the current style of the cursor.
- screen/vte: add cursor style support via DECSCUSR (CSI Ps SP q)
- Fix backward selection
- Fix also clear the character value for multi-width character.
- screen: don't clear cells when resizing
- libtsm: fix tsm_screen_attr2_t
- Fix 3 out of bound reads

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtsm/{libtsm_4.6.0.bb => libtsm_4.7.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.6.0.bb => libtsm_4.7.1.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.7.1.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.7.1.bb
index 45ef8a4357..3c493bca0a 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.7.1.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "e1e4d296f0963d1641456f1f778f0ac090429a3e"
+SRCREV = "ef0a1a40c30d164913f413c47de5bbd8383a6daa"
 
 inherit meson pkgconfig
 
-- 
2.43.0


