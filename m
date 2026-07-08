Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA39C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4716.1783503927890855105
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oVhaFb7Z;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503929; x=1815039929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=307SMaEQzAjVhwxB6C+f8U/XaPMfWjv2p0hjKQzNG7w=;
  b=oVhaFb7ZOOWDX3dZ4GhGF5wWNbbmIpDqkKWdOt45DRo7vEuIMdaioXNA
   SJnxN2TjZgqD33pNEh6F/m1/QeaQRWkpcPyw05GH34LuhKj/WKeMhTkNG
   N0UG32MFIGgpDUXLahZpS3Ehj+oE3Z/vQoy75YgaQh4geXKz5iP1wTVmZ
   I0fHLEzinv56vjiauhD6pQyWIWgaKQA62tSuRt5Zy09tHXq7kFRmsomWv
   5iGe2uMcK1RtO6ssiPcSdT9pfNFNvz9f0IQ1IB+S0USBEPpBQmCVFVz5k
   sY2qymcUzkN64wAkd1e6b0d25G1ELQaJp/il+44wBy8WtoLtSUYI6UE2h
   g==;
X-CSE-ConnectionGUID: DMFC6Ph+SHqVg+99wHWw4Q==
X-CSE-MsgGUID: QgrW9v68SkqF4RAi7Jgy4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246703332"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246703332"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:26 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C9421C01B20
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:25 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 842C2C008BA
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id AC8751801133;
	Wed,  8 Jul 2026 09:45:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/37] libsdl3: upgrade 3.4.10 -> 3.4.12
Date: Wed,  8 Jul 2026 17:44:17 +0800
Message-ID: <20260708094508.2060-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128079

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.4.10.bb => libsdl3_3.4.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.10.bb => libsdl3_3.4.12.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.10.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.10.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
index aba096976e..07c542d3af 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.10.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.12.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "12b34280415ec8418c864408b93d008a20a6530687ee613d60bfbd20411f2785"
+SRC_URI[sha256sum] = "f07b958a9ac5020fb7a44cadb957f658b2149c3c8abb4f63145fac9303249db7"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


