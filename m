Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397321112260
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7093.1775096128011006245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ol7eJ/VB;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096126; x=1806632126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oz+yWeaxGiKFoGisG3P1hq7EWuxYvCk2vqI7CzIZqz4=;
  b=ol7eJ/VB19AcvxLA+41n0uln4LB5h2CEAhuVj13JQpFgjrwvCrLJBU1R
   o4YJZFTo2PP77YzRDo6nAbbmTuwr1qj3PyyVdhj/5KTIu7+INJqjWHpci
   Ir+g63QHB0xTm88VF8raBOwRdF4aP6KtiQvSieqbauvM/3FgJh6W9EDMq
   I0OaNpveNCYpkk0CTaxZNZ50MhLfTMHKAZxMdTKfb/mijnAZQ2xy4XdqU
   U5oCCVTxS/D3HNfgLVq3Xy22ADm+aBe7HRxYd4fZXEqmZ7Ov+kTzsBEHf
   Ioll67mr4K8Cfds1FbGOAvcrw6vml62174bn0prmk2EvL3xhe11S8G9wB
   w==;
X-CSE-ConnectionGUID: lppLOJ52TSmzdSe14QF6qQ==
X-CSE-MsgGUID: y2j02AIGQs+Sr6/E9cFTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="224160998"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="224160998"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:25 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 99A501C001B2
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:26 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4C761C012B8
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id BF7C81003742;
	Thu,  2 Apr 2026 02:15:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 13/39] ngtcp2: upgrade 1.21.0 -> 1.22.0
Date: Thu,  2 Apr 2026 10:13:28 +0800
Message-ID: <20260402021355.1324-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125928

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ngtcp2/{ngtcp2_1.21.0.bb => ngtcp2_1.22.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/ngtcp2/{ngtcp2_1.21.0.bb => ngtcp2_1.22.0.bb} (93%)

diff --git a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.0.bb
similarity index 93%
rename from meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb
rename to meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.0.bb
index f71de5aa07..f7c0ee0d4f 100644
--- a/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.21.0.bb
+++ b/meta-networking/recipes-protocols/ngtcp2/ngtcp2_1.22.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de0966c8ff4f62661a3da92967a75434"
 
 SRC_URI = "gitsm://github.com/ngtcp2/ngtcp2;protocol=https;branch=main;tag=v${PV};name=ngtcp2"
-SRCREV = "9e32add590fc74707b62f61aa5e0aa5c6f8a2c60"
+SRCREV = "2a441e8540d192b0707989b146ce80efcae5f0d6"
 
 DEPENDS = "brotli libev nghttp3"
 
-- 
2.43.0


