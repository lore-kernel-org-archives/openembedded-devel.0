Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8978CD1297
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:56:06 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12763.1762847762632186507
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WLB2tjFs;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847762; x=1794383762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W6ZoPcKgyxQJrJQ8aRA3b8Ihjbm2XQ7a+dpggohKLg0=;
  b=WLB2tjFs7BFm5u8fM7MnOZjgVICFMptPUkawooRW2tpfjqSNv/Gcnq+e
   +ZaY/7BbczmhxN/n2+/pz5EEz/IvF3Ezi4t0qdn2PRKy8hAQww/wH/Vug
   wPI1zQAl1b6uoTSpM56cnXbOQI+pZ4gmZm5bXLEcktzxbs/UJhR+OUl0G
   TEvwIiy+GiXZdClNBZ/nMSYKyKcoGvbzyYmp/Pf5NzWNr7idTaJGlRJxm
   Qx+bnpPh4KCk5gUTQfBJ6J8r8TRtC6LoOWZiRYewb3TmpeT8pjnsH8F/d
   59Pf5TLCCST6kS/BigMiKnWuso6EcjFdvSlQ46mMJC/Y+7GXwoRFMOi2f
   g==;
X-CSE-ConnectionGUID: dR3wPj7yQ865C3sx9+Qukw==
X-CSE-MsgGUID: X61zo35JRtyn3C1ojYquaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="197780299"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="197780299"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:56:01 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2A8561C1C73A
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:01 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D771AC008A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4E92A1800D7D;
	Tue, 11 Nov 2025 07:55:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/23] python3-starlette: upgrade 0.49.1 -> 0.50.0
Date: Tue, 11 Nov 2025 15:55:14 +0800
Message-ID: <20251111075517.1650-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121499

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Ignore if-modified-since header if if-none-match is present in StaticFiles
- Relax strictness on Middleware type
- Drop Python 3.9 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.49.1.bb => python3-starlette_0.50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.49.1.bb => python3-starlette_0.50.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.49.1.bb b/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.49.1.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
index f295b9b050..9b9adca6fc 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.49.1.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "481a43b71e24ed8c43b11ea02f5353d77840e01480881b8cb5a26b8cae64a8cb"
+SRC_URI[sha256sum] = "a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe598fa3ca"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


