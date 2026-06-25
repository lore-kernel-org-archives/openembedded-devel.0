Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B943CCDB47F
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:02:28 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7238.1782378145643549391
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PATwhpTl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378147; x=1813914147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/IiiFVeBlCOhNe/9G3TUbFCxTTnE1QIs+dl/TJU6ZEE=;
  b=PATwhpTlvH8mwNyj7M8LCWKPW9PLDkgMxjeY1dj2x6n5wcXfjJ9M13F/
   QSpmqtUu9XykcfbwM38s9lnxpeR6+kS13uewdT+BPAmVrwrYVg5Or5hUA
   BF+mFQoxqa+2hklaOKHso94Nf+ERPVChlbtmKxwjRCflXiCCMMOCVgAwk
   hKe3gyCcN+EZl4SAqTFIHuJv+jocmfMAnVyT3LIw68F2XYqBVqrg1q3ZA
   T2dRaBtaL9gDZzuzeI3MUwjWlcVZQgT+cxwUm3ztL99CxYXgW6bq554Jl
   3v6kbqB23FBtjAivD90FOO9kjqg/P8rnX6u44bFtQsC5mL3SyQBx6yVk8
   w==;
X-CSE-ConnectionGUID: sUOYIPVgRs++sQCyraxa7Q==
X-CSE-MsgGUID: 6hq1XyRLRjOGt7TzQeqRxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="224184853"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="224184853"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:02:27 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 103CB820C2F
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:27 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BF35F8267BD
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C3C8D1017325;
	Thu, 25 Jun 2026 09:02:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/47] python3-scikit-build: upgrade 0.19.0 -> 0.19.1
Date: Thu, 25 Jun 2026 17:01:15 +0800
Message-ID: <20260625090127.1563-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127767

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-scikit-build_0.19.0.bb => python3-scikit-build_0.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build_0.19.0.bb => python3-scikit-build_0.19.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build_0.19.0.bb b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-scikit-build_0.19.0.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
index 78a9ee29a3..aff4ba4b68 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build_0.19.1.bb
@@ -9,7 +9,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "46e1b2d71343d14e4c07d7e60902e673c78defb9a2c282b70ad80fb8502ade2e"
+SRC_URI[sha256sum] = "b9a8d07fca2d5d10d93220bc57a685161d72af1fc76285d55c564ddaa862e584"
 
 RDEPENDS:${PN} = " \
 	python3-distro \
-- 
2.43.0


