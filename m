Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F73C531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:20 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44791.1784715858955716208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=axVCO1W8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715862; x=1816251862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+QAP62IMJLnakS3EzM0WbRZMRT0KAnobIf85JzMtpqs=;
  b=axVCO1W8VE5NffKGWFeld+EI740D7zsD4EEPm2THFqY7EYfmBfurixvS
   0KuRVDF324WP484kwz+pLHMhLsicoZv10XvMyPeEznntBwPeIIS/cKSyk
   LVSuRPE6SlFpH5E74ksKnEZ04VbEFZLDJPJFKGN473YvF6aG2UYSXveI2
   rgDVvlz2G61/9tROhcKoGuF6Ec2ZM9CMZOX6uwMmTuuH+tHSmJ0zjMxeV
   7k6hBK82oi4NXXJ8ikzL0vuAGdQTaNQeNbtodun/pMvLqd0i53gj1IVg5
   wTSP7K6oZ3n5FWidoFujQJ/rmXMBfM2YTFfpkTHUkcogJG/vYxNUhP3St
   w==;
X-CSE-ConnectionGUID: 8o5Httj6Rde69cCnaMltzg==
X-CSE-MsgGUID: 2jEhvY5gTgmhTXu2/1aNqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248220207"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248220207"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:20 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 466A11002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:17 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F0FA3C041C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 1CA9240433C;
	Wed, 22 Jul 2026 10:24:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/37] python3-google-auth: upgrade 2.55.2 -> 2.56.0
Date: Wed, 22 Jul 2026 18:23:04 +0800
Message-ID: <20260722102320.1019-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128391

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- auth: Implement python mtls helpers
- google-auth: add aiohttp bound for Python 3.14
- google-auth: add bounds for urllib3 and packaging dependencies
- google-auth: add cryptography bound for Python 3.14
- google-auth: add gRPC extra and clean up obsolete TODOs
- google-auth: raise rsa extra lower bound to 4.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.55.2.bb => python3-google-auth_2.56.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.55.2.bb => python3-google-auth_2.56.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.55.2.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.56.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.55.2.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.56.0.bb
index 8da1a61bf3..dab45d0be5 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.55.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.56.0.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "97ae7790ff740f2bc9db60eb864a7804f4ac19f5f02c38b3d942f2fea6e9b9ae"
+SRC_URI[sha256sum] = "f90fa030b569a92654b9d690665a073841df33d57487be53db583a9a0867a553"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


