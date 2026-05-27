Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E70CD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:42 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16783.1779875320302951136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lJ3cPwrw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875321; x=1811411321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H+9xUcNaw8/SEf96ArRj7Hn96Wva0nVWzKWYHjAgsEc=;
  b=lJ3cPwrwABlwUjsQ2182a3Wvi1/+TIgS2AY5OtiRA6sU7jNrQ55JiNj+
   e0aZOmKAP0rBobFLqW+BFKDYYGEo+JOOkKEpI5dhIQ0vNrpvuL/Tq1htJ
   hkeBl9sIhB552tNqUD2fV45bGaREDd38DRnN6kG0TQESH9y3T8oHIO2uJ
   hu9AMle/AG6xj+pUDnh1GyfOgelqydvf70wGA1t0H6cso+XNECEsjLpuu
   ty0oLoN8vWLRKrUr2lhQuSFXKer5ozh7gdLLYg3pPrzzOL8SdSRR5Uy7l
   voV/ugnRxHE6Rs0pOPd8ycITvODSYKfOmPTJUkZbdMAqLx09uiGgAS06E
   Q==;
X-CSE-ConnectionGUID: CkcirYvpQ5iFnf0r4nS5fg==
X-CSE-MsgGUID: 9nLSjpemSxOvinbiVVkjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="219714699"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="219714699"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:40 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 82D868203D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 38BA81410CB1
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3CDF582A2CC;
	Wed, 27 May 2026 09:48:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/56] libsdl2-net: upgrade 2.2.0 -> 2.4.0
Date: Wed, 27 May 2026 17:47:22 +0800
Message-ID: <20260527094805.2039-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127220

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Changelog:
  Added SDLNet_TCP_OpenServer() and SDLNet_TCP_OpenClient()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl/{libsdl2-net_2.2.0.bb => libsdl2-net_2.4.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-net_2.2.0.bb => libsdl2-net_2.4.0.bb} (66%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.4.0.bb
similarity index 66%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-net_2.4.0.bb
index 4a7ada94cb..12e6d3f0dc 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.2.0.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-net_2.4.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Simple DirectMedia Layer networking library."
 SECTION = "libs/network"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=68a088513da90254b2fbe664f42af315"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=036a54229112040a743509a86b30c80c"
 
 SRC_URI = " \
   https://www.libsdl.org/projects/SDL_net/release/SDL2_net-${PV}.tar.gz \
@@ -12,6 +12,6 @@ inherit cmake pkgconfig
 
 DEPENDS = "virtual/libsdl2"
 
-SRC_URI[sha256sum] = "4e4a891988316271974ff4e9585ed1ef729a123d22c08bd473129179dc857feb"
+SRC_URI[sha256sum] = "9cbca2527feb3f1a622d48ba65cc7dee9b1e3f2c55ceafb7d7720bb058aafb30"
 
 FILES:${PN} += "${datadir}/licenses"
-- 
2.43.0


