Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97445C4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3454.1784112043810041881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LGn9MAHJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112044; x=1815648044;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wYt7HMnxSG+npFx5ZmW/ZfMu850KIjAlsdqkRd8j6A4=;
  b=LGn9MAHJJC57t2ZhwimpZ+9RzwlGtAEuHz2SUH+I7NNyeyGeH63S4KI1
   13nVCIBdQ6E0xjV//gY3M6/Ng5tsoexOg5q7kPZtBxvCjHCXnqBbIC+Gm
   Ui84R6ja2dcfEBmb/NK+ZUhgH2HWRVXuutnysUg3s2VYGjgY/e6lmhyPs
   Cg8NSGCLLaSfyQh9IYhMSM1CzFvKflgmz+JsTupc8Hl8QI4ObfvkA47T0
   5E+o1Lk7JkMmn6lFEFQbjMzfrnUGIk1tXCqhaq2y6VyHFOXLdmhOoNPUc
   Z23jnxM4tKkS3vYHb3nyk7o4QjtsbJZ9LCqJZSqSaorXsm8CsXRqIHjbE
   w==;
X-CSE-ConnectionGUID: qwgpIZiyQKSaDdL+hsQWGQ==
X-CSE-MsgGUID: uZx23y8PRiWXllqz6NQphw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="225218968"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="225218968"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:42 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 451A0100014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E71BEC013C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id E92571801122;
	Wed, 15 Jul 2026 10:40:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 42/44] xstdcmap: upgrade 1.0.5 -> 1.0.6
Date: Wed, 15 Jul 2026 18:39:12 +0800
Message-ID: <20260715103914.2120-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128215

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xstdcmap_1.0.5.bb => xstdcmap_1.0.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xstdcmap_1.0.5.bb => xstdcmap_1.0.6.bb} (83%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.6.bb
similarity index 83%
rename from meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.6.bb
index 7d3aab501c..7c2b6f9ea2 100644
--- a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.6.bb
@@ -12,5 +12,5 @@ DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "365847e379398499ec9ad9a299cc47a0d6e7feba9546dfd4e5b422204b5ac180"
+SRC_URI[sha256sum] = "062a15722769799524eee542fc82ae778f5ac180b618295d913f34962b134ffe"
 
-- 
2.43.0


