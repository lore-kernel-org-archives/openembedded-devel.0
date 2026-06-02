Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40528CD6E61
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:24 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21488.1780394901598788535
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BNADP3Y6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394901; x=1811930901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+EY1Wg/7RPScZVIZuueIF6fUMpqIZ0hLOhdWN8B1UAA=;
  b=BNADP3Y6Fmrhfr9c8NJx2s5DlWI79YB/ePSh4nbGt4b5/3P5fC5Kh/cX
   yrt3EBNMlie2Owx4Ct1lXI3k+729YHCcrThZqEMzAGp4bwnkDE3SO6pkm
   UVuEISRG/yzB50MnrTywURM5Kh/zkP2x7XpgLLHX08PBJMYnlne8T8xjU
   lCEntPdri8FTxRyDCfHgsCskRuc9uqq+u+LRRBuDtpNwPrC0hLwsGG2cw
   eXer1L52X865T/SKtJXbG2TYwABVt86ofRosCQwG4u2vaF0qMhRSEjbOZ
   rfLFNeRZKotR7ZA/IycQ/H3yOg0f67TnJivNXtKnH+SEGzWnc6o7OXTWF
   g==;
X-CSE-ConnectionGUID: adW1UF30TQyZg4zdCsIPSg==
X-CSE-MsgGUID: xr6d7iM9S62/lJNuoeh3Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230702013"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230702013"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 079441C00095
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:20 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B0B6A1C1C25F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id C3D57180051C;
	Tue,  2 Jun 2026 10:08:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/38] libsdl3: upgrade 3.4.8 -> 3.4.10
Date: Tue,  2 Jun 2026 18:07:26 +0800
Message-ID: <20260602100755.2117-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127332

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.4.8.bb => libsdl3_3.4.10.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.8.bb => libsdl3_3.4.10.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.10.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.10.bb
index 34211a88ee..aba096976e 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.10.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "e9fff7467fb60f037e6708da18b25560649e4c63edc2a69bb871b960d9cbfbba"
+SRC_URI[sha256sum] = "12b34280415ec8418c864408b93d008a20a6530687ee613d60bfbd20411f2785"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


