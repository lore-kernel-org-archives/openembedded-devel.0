Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484C4C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3436.1784111985275195768
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SA1WnRTR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111985; x=1815647985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U38W3LSVvOrHmzm/KlJxjjtiB3svXTsDlNDI6pAPjTo=;
  b=SA1WnRTRS5kkX/zbLvdhBS608dFQjNUdCdIdWDF7ezjg682vHv0e4fFL
   PyBz7n0BPQuuSMEmOShoIHiw5OlcvLRX1t1/RUcINSSOZNTWx7jFoylmb
   vZHTallKZti5FCqxqpRCjBRN3DCrUm38wpaYZt5oOI4WoHgrB+qV7T/jk
   6bqy1ql16YajX0Zf+tAI+oT6LErbAbRVnrxjRuutJvbMSfS23jgZ40dUX
   RYdtAxFEQzvSvl/ShEz7cZiP9Lu6QCrsngfhOgweLQFUAQKPWBg62IoG4
   2AYetGtWwTgZpyHFMXuwlvT2rJHs0rRJr3FsWSl1Zd0rFIB4SkBhyhcCI
   A==;
X-CSE-ConnectionGUID: Y9hx72iqQuuDcARPm7ukcg==
X-CSE-MsgGUID: 7qUO27btQduhdWcjdBNrgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="246968124"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="246968124"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:43 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id ACF191C01699
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:43 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 62200181AE9C
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 86E761800B81;
	Wed, 15 Jul 2026 10:39:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-xfce] [PATCH 05/44] libxfce4ui: upgrade 4.21.8 -> 4.21.9
Date: Wed, 15 Jul 2026 18:38:35 +0800
Message-ID: <20260715103914.2120-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128178

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- xfce-open: Quote all arguments passed to --launch
- Remove G_GNUC_CONST
- kbd: work around gdk-wayland bug around super key in shortcut dialog
- Translation Updates:
  Azerbaijani, Kazakh, Spanish, Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxfce4ui/{libxfce4ui_4.21.8.bb => libxfce4ui_4.21.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.21.8.bb => libxfce4ui_4.21.9.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.8.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.9.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.8.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.9.bb
index 70891aaf8d..e45a81be95 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.8.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.9.bb
@@ -20,7 +20,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11','openg
 
 # TODO: Check if 0001-... can go
 SRC_URI += " file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "e6caafc6fe5e07765e22dd849a19b21e5aa44f51c66fa1d7db74b94330bd457b"
+SRC_URI[sha256sum] = "d2072e0c3c27e39e1c38050c660f34806e34e8b1abba660684db586f8c4f7142"
 
 EXTRA_OEMESON = "-Dvala=disabled -Dvendor-info=${DISTRO}"
 
-- 
2.43.0


