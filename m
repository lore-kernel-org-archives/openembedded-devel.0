Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD2DC54F56
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5775.1785218830103300644
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KTeGf5oC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218831; x=1816754831;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=70zzY9hvxKYIXe9VQSshmFxPEnj8PK24UNyRb5Wwew4=;
  b=KTeGf5oCq8jGqLHcfqhoDZaZ0O2Cv+CFAr3GZzaQ0R0CZ5vuuxtSmOjp
   HHDgQBIsIuVvXQlv76jImIolnLURh0SOEu1dqZOi+1o51eWFr7Byuzomz
   wCOXFwkv0jkAYiykTi+RD46fgDcZ2cZ3ffTODQDFYmALs2i6VEOAPx/Q2
   mSDfEJjFJaAdLCyZ8uFKrLjxQsec6p1eDql1kwNdIZXler3eQso2wPdH/
   wTjFxs97Umhkw5ehAVvQygs9PAbYRWLC3pCFyZZvgWOjhNCZveWtv7C+l
   A8J4lMfSvozyoLmaYqQg5kiSzr05svNarNYZUwR8TGvmeWkD1V0WA3AT7
   A==;
X-CSE-ConnectionGUID: 10MbpEpPTO6ALfcPuubbPg==
X-CSE-MsgGUID: XVpxEthzQROhaqL/0eMOuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="235013062"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="235013062"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:10 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D88BC1C000DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8D3F318019A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:09 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CEFCD10005D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:07 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-h2: upgrade 4.3.0 -> 4.4.0
Date: Tue, 28 Jul 2026 14:06:29 +0800
Message-ID: <20260728060645.819-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128486

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python-h2/{python3-h2_4.3.0.bb => python3-h2_4.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_4.3.0.bb => python3-h2_4.4.0.bb} (87%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.0.bb
similarity index 87%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.4.0.bb
index 4034ffe7c1..8766e2d558 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.4.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
-SRC_URI[sha256sum] = "6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1"
+SRC_URI[sha256sum] = "46b551bdcdc7e83cf5c04d0bf93badb8a939bd2287d9fee1abb23a445b9e0580"
 
 inherit ptest-python-pytest pypi python_setuptools_build_meta
 
-- 
2.43.0


