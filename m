Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95519CDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7014.1782378127692358631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tvgny/v0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378133; x=1813914133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTXUWjJZlnrckBQUU1n+GMacDcMs9Cp63K5zKJJfYTA=;
  b=Tvgny/v0hch520AFGzP530ZjrkEHZxgcsN82wMpr8C9Bw1ww2E9OlsCH
   nNWskRSMLCoc/Vw3Lokk9atFy3W6//zqww166Bh8H/4wH3nIL0ntSwE1M
   CGojGPWEO5WWED7bmaRZ4Z4a2jSEzLCjNxTh2gDd3bhppqnabKgnGpka+
   vZ/RH5QG7gZlcY1lEk8G68BW3OmuAcHD+1yGUqmfI9mo5JT879uLJx//F
   gEzXuYfNMUJvj+9sOyQQ5bLW6cvIX/iuRkP0vtEykIke541HB+Bl2NBDa
   4LgtfUUELOjbtfsDKlihXAS9jXkHwyxUonwYW/qzkKKos33O/Lv5qKsTZ
   Q==;
X-CSE-ConnectionGUID: AlKcfc3ZQxWbiqd2PWwImA==
X-CSE-MsgGUID: sMlniZMlSRCXJvy1Kuhndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="232700748"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="232700748"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:12 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 861221C00183
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:12 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3DB481C2FB95
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 533E5101732E;
	Thu, 25 Jun 2026 09:02:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/47] python3-jsbeautifier: upgrade 1.15.4 -> 2.0.1
Date: Thu, 25 Jun 2026 17:01:06 +0800
Message-ID: <20260625090127.1563-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127758

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-jsbeautifier_1.15.4.bb => python3-jsbeautifier_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsbeautifier_1.15.4.bb => python3-jsbeautifier_2.0.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.4.bb b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.4.bb
rename to meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb
index ad24df2da6..a8c3edf3ae 100644
--- a/meta-python/recipes-devtools/python/python3-jsbeautifier_1.15.4.bb
+++ b/meta-python/recipes-devtools/python/python3-jsbeautifier_2.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5bb18d9efb9331d825735fbc5360ee8f1aac5e52780042803943aa7f854f7592"
+SRC_URI[sha256sum] = "45603b2097410feee8d3a6ef8ad5a8e0a0e89f347331888a97e46f332ce8d953"
 
 PYPI_PACKAGE = "jsbeautifier"
 
-- 
2.43.0


