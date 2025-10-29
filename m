Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7B4CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:32 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.24205.1761696982465912451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GqerW5XJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696983; x=1793232983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ig5lh+44eGd10npmBe3Zg1n4He0HZXIYQl3cNyJWH/g=;
  b=GqerW5XJdmk5kjK/bwVsbQc45L3CX0XosKRerqORkjdSwvGUyQQhfWll
   /xnlOIVbxLA20IlMGroigP17I/tNjPQvUGkTizpm3qfjEqyWUPFQJkVR+
   WylfWsq7uql+8bA0YJgkRRLNUCCPx0PR7yYw5KfCr8ABQL54BqGlIW45M
   Vv7BdZdQIXTZiAYtlI05XPD/ww12SUIb2hquh43nhVWRvrt+fjDeGbeYa
   Zpl1k+tDylX/vdPz5qWAlPSxLEGA+mmLSscCOR/Xqpl9id+MJGYHDPi/A
   4U7J3iembj2HTAhCG1hBg5JB6X2nW8tA/TCb8OFEUMZc7MaDVey/mBLF3
   A==;
X-CSE-ConnectionGUID: 4K9oET+7T9iasOnwAKYRkQ==
X-CSE-MsgGUID: rdYU6PxcSEOhzT34uhSNzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217368444"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217368444"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:21 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DB3141002B89
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:20 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 920E28D2064
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D3AF1826FD2;
	Wed, 29 Oct 2025 00:16:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/32] xterm: upgrade 402 -> 403
Date: Wed, 29 Oct 2025 08:15:05 +0800
Message-ID: <20251029001505.528-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121138

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_402.bb => xterm_403.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_402.bb => xterm_403.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_402.bb b/meta-oe/recipes-graphics/xorg-app/xterm_403.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_402.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_403.bb
index 65e1295575..db59b10a15 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_402.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_403.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=170620b648626a9705
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "5260c5793cd564c69e53ef6f528c00af066ae67b42d02137fb7ef8fafe70bb7a"
+SRC_URI[sha256sum] = "1331b0df5919cb243ffe326dc6ff10a291e683a262f70cdf964a664be733ad83"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


