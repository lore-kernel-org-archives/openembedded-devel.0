Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F11AD3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:21 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4226.1765274240013840721
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TLSwGCwZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274240; x=1796810240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jA97Nc5flsEcT/6vyvY7YyT7+R9jDfMEM/gZ0GZOttQ=;
  b=TLSwGCwZTKnU0BJKBn5NGvwzx5tSmTwTergNMnDJMDh1E42JsSVukxit
   NKrMCxiucKir2CHwH1q+TLF8SDdjMojBsy/xua/h77Og17aVg4YVvOpJY
   OAmX3Jfb8pjJlzt8ZPbjuFC3HnwyEucDpzpvOuphsuHyhz//s6UX9JdnX
   OIcGoGdHocU6K2hYXFngilFgxvL/7pVTeFq+WcrSs6oV4C62IsKZPkHBT
   2PMR5racBnApg1dcK5ZygKYWkO+jn7/ju57/9INslW5GBPMSMJtCuXxoR
   gqFzZBUVGUUb9fmeuEM3JV/QqoN+XzziTZildsMSHlX9JqIbj0jjVqVSA
   Q==;
X-CSE-ConnectionGUID: rEnlzHbjS4qkAQ/Ga/E5VA==
X-CSE-MsgGUID: cmcQSmElRgqDvSDv2gKIaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209421599"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209421599"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:57:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 8E68B1C00192
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:18 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3F2A918019B0
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:57:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C7B2220002BA;
	Tue,  9 Dec 2025 09:57:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/38] xterm: upgrade 403 -> 404
Date: Tue,  9 Dec 2025 17:55:52 +0800
Message-ID: <20251209095552.690-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122442

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_403.bb => xterm_404.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_403.bb => xterm_404.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_403.bb b/meta-oe/recipes-graphics/xorg-app/xterm_404.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_403.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_404.bb
index a6f2b55336..944d811566 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_403.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_404.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=170620b648626a9705
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "1331b0df5919cb243ffe326dc6ff10a291e683a262f70cdf964a664be733ad83"
+SRC_URI[sha256sum] = "63332f921c227ba59e589fa07dfdad1599c10ac859ea26c72ac1dd4a41b565a4"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


