Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40869C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3430.1784112034336037888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ex8n7d6w;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112037; x=1815648037;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mBVwM5A6I19m1Xjes6tnwj1Fjtd4OQjvJV2kqg8JJsQ=;
  b=ex8n7d6wwja1Fk2A5MlOtBeSeenoxnvprXnlu3DLpryANpwGsSki7vDE
   z3imwLBHzrHIR9HOS/wtUIOiKYeBQeaLFXwLEX1SDID06XVJz5KkWWiAL
   nxNjjmlrjcbAtoCC6sYcRV9JKrjro7RELeeHKGwK1l6zJYuCwE4IzOFgM
   jwPSJraw9RBBrq+88mkCfmyJvO14avT25lc9w4izURPLYfcQJGYWOPTsb
   PeLitb4rlNykUweebm3cC8A9Q7dWjHAKunUtGwe7oGbbwBf/WJUCp1qdP
   jalrskhO4PS1s4x6PNlUTlFSSKS9udzpbLKiRjNPrL+tOLI8axx3RqNCD
   g==;
X-CSE-ConnectionGUID: /gaknDi1QAuRhYoFqzSzyw==
X-CSE-MsgGUID: U9etBV9IQgK1A+SHhYeynA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440448"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440448"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B03C4407579
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:32 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 60C02102095F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6FD261801122;
	Wed, 15 Jul 2026 10:40:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 36/44] xkbutils: upgrade 1.0.6 -> 1.0.7
Date: Wed, 15 Jul 2026 18:39:06 +0800
Message-ID: <20260715103914.2120-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128209

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xkbutils_1.0.6.bb => xkbutils_1.0.7.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbutils_1.0.6.bb => xkbutils_1.0.7.bb} (75%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.7.bb
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.7.bb
index 0274608d05..90d7b424be 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbutils_1.0.7.bb
@@ -9,9 +9,9 @@ It includes: \
     xkbvleds - display the state of LEDs on an XKB keyboard in a window \
     xkbwatch - reports changes in the XKB keyboard state \
 "
-LIC_FILES_CHKSUM = "file://COPYING;md5=6767a97a97e21260134637b657b922ae"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4f2fa564ec5be0f310ad939a8444a0bb"
 
 DEPENDS += "libxaw libxkbfile"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "31a2bbee1e09ccba01de92897b8f540b545de812f318d31de07bd3a5a75ee25e"
+SRC_URI[sha256sum] = "5f37be0ee31ada114415780c562638a1b4f03b385e56449927bf0d5665787a26"
-- 
2.43.0


