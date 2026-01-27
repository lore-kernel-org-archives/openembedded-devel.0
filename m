Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104A8D2D8CB
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6883.1769507058044176162
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rLLj9Z09;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507059; x=1801043059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CElcNpYCsjx4p6vF/gySnReVEmOTOq/9pECAwYiUSMs=;
  b=rLLj9Z09w8Q3B4ZuMC7+uVI/UcXOxFys4KIh9xvU4926ICC0LqgDUnsv
   Ps9qmZirVHtdUn48cj9WgRpyfbB67qXMsJli5ld89JRMXoDYHWIwnAYmS
   UHmiVN7R2FovxEKq4j2/NK85oflMq2dkN3jI9jmuBsdOiyQJJl6ska6zy
   cWGBlHzRa8P0A78N+gW/LpyFNpKabz6p26hPzljR+10C0Ao/I2UipzOv1
   xuvcpLLIh+wI3AzixaDbUWRo7XjwOzduI0bzRnze+43jXcrO63Du9lgSt
   7b1t3KHVL8Ulqv64ngaRVUCu9izf2HFVrhFAWZaep32fnhDUp5qNbtWJ0
   Q==;
X-CSE-ConnectionGUID: Ceovr3/mS7C1Xpd54DjbCQ==
X-CSE-MsgGUID: 565zqzmPRai9MO+zHxFyuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227252715"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="227252715"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:43:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2499542A334
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BE0471C00F98
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 516112000210;
	Tue, 27 Jan 2026 09:43:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/25] graphviz: upgrade 14.0.4 -> 14.1.2
Date: Tue, 27 Jan 2026 17:43:20 +0800
Message-ID: <20260127094339.1081-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123921

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_14.0.4.bb => graphviz_14.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_14.0.4.bb => graphviz_14.1.2.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.4.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.2.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_14.0.4.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.1.2.bb
index 3188c8afd5..9a1d9927ce 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_14.0.4.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "a005977de2fec13753f5bde767cf97fdc28ac54bfd6a2737c563748bc4f32317"
+SRC_URI[sha256sum] = "65572cd29317cfb96eac8434fac1d8861c905e9b761bd0442beb2cfcc0211354"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


