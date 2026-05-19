Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42B0CD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19335.1779190858645000548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bDeCGCsz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190858; x=1810726858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wN4dIt2VyxVtLQDlZ2+32H0TquSJeBcrPy/DmzDG7eY=;
  b=bDeCGCszc1RvXODIp7klhWa6JOQUc40WqLiB4WuNsUVhG/K0a38NnbHr
   4uDkGYxzv+fVRlC3+vnTSHPtYVpicj7U0w6AHC712V/dzzuMvGp5VhdGw
   fFunMA1QQHtbDQAujgnABx64WTr22mdjbB3MNq+hW+VHIZ84WM7dUrqIB
   RTLkiIYvOvY+bnNM3XxPI3y6Yc6NuAZ/5ImzMVI+5l0OUCULXnWvBrTSt
   1RFtd5G/hqqOJrpTtn88fBtjv7n5ae72mJZWNTKnnCQjw00sRqF2t0iEZ
   t/UDrjsITEglqbCHNjc54WXvvp2JydbkRRvU2l8kl84zDJI3/ZwPe57NA
   Q==;
X-CSE-ConnectionGUID: x3FspIWQQIKVjjibdgT3nw==
X-CSE-MsgGUID: wqajoSa+Sse+q+Mz+vKBcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="244313274"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="244313274"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:57 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 32FEE7329
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:57 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E04251C1747C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 559534066E3;
	Tue, 19 May 2026 11:40:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/38] python3-sentry-sdk: upgrade 2.59.0 -> 2.60.0
Date: Tue, 19 May 2026 19:39:12 +0800
Message-ID: <20260519113921.655-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127091

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.59.0.bb => python3-sentry-sdk_2.60.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.59.0.bb => python3-sentry-sdk_2.60.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.59.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.60.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.59.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.60.0.bb
index b0bb943518..90809e8a92 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.59.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.60.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "cd265808ef8bf3f3edf69b527c0a0b2b6b1322762679e55b8987db2e9584aec1"
+SRC_URI[sha256sum] = "0bd25e54e78ca02d0be512529fa644bbbf9e8470d7b26371294012d4ca93c978"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


