Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE326CD5BA6
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:52 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19028.1779190788902791494
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ERCohxqu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190789; x=1810726789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yWJYsc0EkcZpwsXCqF8cr4V7SneTyaRPd57SG94MEqY=;
  b=ERCohxquuk6ZTAb4mITSNK9EWmfVPVvOVHfpX+gjJLal695Dw5vYpBwz
   o53pN5/XvGQ+17xi3HQKD2a9PUApCqt98mImjDO79nnVtb4wkIh0wqw7J
   7jvXrcIqjJIRnTDZDDy22NMgzSld+p6QVV8Xi9//Sa11Hn6zWM5yKSu0z
   8g0AKvmPftkwTz/pb5kjjJZCn57n6dShi2j+LAynFessyZudyV36R4L04
   utxlKbeSPRpeIxVA6HNCTOALuE129E8YgQ4xD8MCN5pCQdNmETD09P7wz
   5YIxLe6+JTJfxrRLMoWzysIv6DfPv3vrBGZe5IY6AHs6cUEr0Uso4omXN
   A==;
X-CSE-ConnectionGUID: zhw1w4nKQRyGinSb/6Erdw==
X-CSE-MsgGUID: VErOGMTiSH+ZUc2p3hTzGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="244313197"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="244313197"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:47 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 630231C1C719
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:47 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 19D87C01838
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B576C4066C7;
	Tue, 19 May 2026 11:39:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/38] libsdl2-mixer: upgrade 2.8.1 -> 2.8.2
Date: Tue, 19 May 2026 19:38:53 +0800
Message-ID: <20260519113921.655-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127072

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Improved OGG decoding speed when using stb_vorbis
 * Updated to newer versions of decoding libraries

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl2-mixer_2.8.1.bb => libsdl2-mixer_2.8.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-mixer_2.8.1.bb => libsdl2-mixer_2.8.2.bb} (94%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.2.bb
similarity index 94%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.2.bb
index 46e6ba0774..e7d85c6743 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.1.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.8.2.bb
@@ -5,7 +5,7 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbb0010b2f7cf6e8a13bcac1ef4d2455"
 
 SRC_URI = "http://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${PV}.tar.gz"
-SRC_URI[sha256sum] = "cb760211b056bfe44f4a1e180cc7cb201137e4d1572f2002cc1be728efd22660"
+SRC_URI[sha256sum] = "938dff531d00ace2296557a6599abe6f34599e2f34f0a4a08a397e2ccac8b8f7"
 
 S = "${UNPACKDIR}/SDL2_mixer-${PV}"
 
-- 
2.43.0


