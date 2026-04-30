Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5396CFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:08 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17446.1777546205414860099
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tF9OJ29K;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546205; x=1809082205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=inszx3ao+zjJxmvxxNLUQI192/LLhXtZDZF7N9rSVjE=;
  b=tF9OJ29K2cLD+rCjZy9y3JcsheG3Zoemqhf589iihdet+5qhRD47Z9C/
   60ppJOuOhwKr0byZ8I52Bl6zFjj3MAQSI0xVIcBs1n56OgiCruDbokZer
   69gv+n2uYg+Ll1p7QGkkpVr7tU3YDaMjPhhGEx3hiddbwnGW6dYQO6poE
   VbqW8gnkO2PrP0DB3EFYtR77bVsu/RqeJlDpT6UDI1tIMAsYnhGinVwx2
   FHg1fnJiHXoCRNMCLMR3ktZuJvNCTwsi9QMdc8/IyKOR56e4kiWNGLbhf
   PXzI+aqc/bsEyrfmRdu6Yv/RZhjLRdWC2b644flJxX3niInO666fBLRiV
   A==;
X-CSE-ConnectionGUID: l2x5Bu+JRICrZpfGfS4KNg==
X-CSE-MsgGUID: Cdd6Crq1QN2AiwVDB//wig==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226100965"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226100965"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id EF6371C01682
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:03 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A543E1801FE6
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 459B71801130;
	Thu, 30 Apr 2026 10:49:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/64] libtsm: upgrade 4.4.3 -> 4.5.0
Date: Thu, 30 Apr 2026 18:48:38 +0800
Message-ID: <20260430104924.1106-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126688

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Support for terminal bell and keyboard LEDs
- Fix build musl
- test/vte: fix memory leak in vte tests
- Refactor scrollback and selection
- screen: Fix wrong attribute for new cells when resizing
- Fix remove from sb
- Fix get next line
- Fix scrollback position
- test: robustness, make the test faster.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtsm/{libtsm_4.4.3.bb => libtsm_4.5.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.3.bb => libtsm_4.5.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
index 8168360dec..9e999fe970 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "6cdacfc452bf29d98e297fe3a96e55e94a88ce3e"
+SRCREV = "556373437d1c5f57f4dfc7c6cc1330e5088a4174"
 
 inherit meson pkgconfig
 
-- 
2.43.0


