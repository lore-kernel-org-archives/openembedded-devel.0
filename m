Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA64CD6E64
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21226.1780394930928172450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PZQZViMD;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394931; x=1811930931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N8NCNWzOWT8YbZb+RXgA/NBz57CPZsszG2icr5sZxSo=;
  b=PZQZViMDBoVGgDTo95nm6+Sic348D8aGKJLiYECbcr2yCExob5Ejp58W
   556Vv6J211IchmFQ01sK8tYAa0Imy2+8EG2Rqjy/t9XZtb77fZtx/+RiG
   52KsrCZo75zMX3uzD17gJgJ2WXPfDuJIaVtLhdphz7GnFGLmcmSqtZxAF
   TVMRdqn1hAmTQ2ix3WbYr4xhQuRNzUdhURObTrXJF2I4oqhBvi7f5jJuB
   tHH5pyn/7Mm7s/K33NDamyq1j1RWHdYvdWZBtjnc4slkp066Utt7iKnxp
   XAjs3SD+SOM/jDF2PW5ttftXZUA/DCzPLBDdx8aXFg/0Xw+fuq1wJv3YT
   g==;
X-CSE-ConnectionGUID: +zXGpnFHTBCzcPekWZo97w==
X-CSE-MsgGUID: MvwVoOYXT92qA0H8FZeUIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="220405989"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="220405989"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:49 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8AC8942A337
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:49 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3EF3B180CCF5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id D4BAF1800583;
	Tue,  2 Jun 2026 10:08:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/38] python3-sentry-sdk: upgrade 2.60.0 -> 2.61.0
Date: Tue,  2 Jun 2026 18:07:43 +0800
Message-ID: <20260602100755.2117-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127349

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.60.0.bb => python3-sentry-sdk_2.61.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.60.0.bb => python3-sentry-sdk_2.61.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.60.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.60.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.0.bb
index 90809e8a92..4cc2462383 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.60.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "0bd25e54e78ca02d0be512529fa644bbbf9e8470d7b26371294012d4ca93c978"
+SRC_URI[sha256sum] = "1ca9b4bb777eb5be67004edab7eb894f21c6301f1d05ed64966719ad5d1764ce"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


