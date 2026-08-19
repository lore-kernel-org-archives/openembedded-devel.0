Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FA6C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3371.1787132224605431488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cr+6/vH2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132224; x=1818668224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l6VFQRRfaq+OZLq9p2n3XmoMzrweQCkVLGdwdINu/V8=;
  b=cr+6/vH2E8gyW4VULR986Y231Xrx7HnWJjAbeMLbetYQkfjYUNy4PfKU
   nFJ6iJw16uuSM1HY0g86poDHPHceeLiyjl4XDnWUp6aEoy400IfZ1eMwz
   IXth/1/aSGqfxcVrMGeVz/aRdFSOykGKa2eJ41VrbXEK06/rb0vxExd3L
   0D4CPXDQsVBLJn7qjJSvq9Hqh2MFl7qFkZ8S3HVvMYAiYPXJQLx6YAJxJ
   S6rB+Ee9F4zMC8rQiOprxqV91kqiTqPiyccrGGKFzCuD5I5mxE8z9ngM0
   1ZlrKqKYvMN8x/Fxb2PzfkKp1bWGhBt8VkmaPaup4PU47DouQDbKwaofw
   w==;
X-CSE-ConnectionGUID: ph1SRlV7SwO0lU7IIAHoHw==
X-CSE-MsgGUID: mCvia4NoSQ+5F1oK4Hx9dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330936"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330936"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:03 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0A0181C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:03 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AF59FC020BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A2BEB1801C2D;
	Wed, 19 Aug 2026 09:37:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 58/70] python3-starlette: upgrade 1.3.1 -> 1.6.0
Date: Wed, 19 Aug 2026 17:35:02 +0800
Message-ID: <20260819093514.1101-58-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129328

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-starlette_1.3.1.bb => python3-starlette_1.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_1.3.1.bb => python3-starlette_1.6.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_1.3.1.bb b/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-starlette_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
index 17f187a5f3..45ba3a5311 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_1.6.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "05d0213193f2fbaae60e2ecb593b4add4262ad4e46536b54abe36f11a71724e0"
+SRC_URI[sha256sum] = "d4e3ac5e546444960c710297a3c9fc3f7ebae1b7e963f3d36173b49da535be9b"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


