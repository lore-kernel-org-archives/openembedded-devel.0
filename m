Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200ADD0C82B
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56076.1768299889346645221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DAX6nGSY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299889; x=1799835889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FKM9oGwS2mQCkr04i4cG/aJpuJfrwkVA/2DAjD33ToY=;
  b=DAX6nGSYkAXhrA0nx7rs4+4bVX/LtDLr40M4ooD31X95MyaAjYac1XHc
   oXkEaIB/CDvJMMN+UN653niK4PMNPaab2d4hRjsNuIYpffduHzFhn7hMm
   q+vktCj+8pb+yyIKRB0Vx3BBcQUzkzLs2YytbNfjQ4yN7fFK7goE3AYIz
   J6PjdnCs1ZmiAy+XPmxsbePwkwFhCV0wHV5HgPy1i9altd8o4HE02vPu5
   ySnHc9cDrhbi+lDTuKOleC3Ymkh0a7Ij40nUCtywXHHGLut2dQiNEyEnp
   wOVM6T4vUzbiSbpxJtQGvkYPZlU+IvOl5KTFo0FOTx36F9HR+4igxsr4u
   g==;
X-CSE-ConnectionGUID: ZfUuzgYiSTiqTB4NpJUYyA==
X-CSE-MsgGUID: G7oEFKYlRqeYIxotT8V93Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213060166"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213060166"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:48 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id EB13042A328
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9BC24C00D58
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E4B031019041;
	Tue, 13 Jan 2026 10:24:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/22] python3-starlette: upgrade 0.50.0 -> 0.51.0
Date: Tue, 13 Jan 2026 18:23:31 +0800
Message-ID: <20260113102334.605-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123425

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Add allow_private_network in CORSMiddleware
- Increase warning stacklevel on DeprecationWarning for wsgi module

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.50.0.bb => python3-starlette_0.51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.50.0.bb => python3-starlette_0.51.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.51.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.51.0.bb
index 682ec89b89..f6380bdfad 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.50.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.51.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "a2a17b22203254bcbc2e1f926d2d55f3f9497f769416b3190768befe598fa3ca"
+SRC_URI[sha256sum] = "4c4fda9b1bc67f84037d3d14a5112e523509c369d9d47b111b2f984b0cc5ba6c"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


