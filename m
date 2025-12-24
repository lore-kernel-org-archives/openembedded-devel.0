Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82347E75442
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117310.1766567665808519559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bXEhsvmL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567664; x=1798103664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cH2af7Fa/RxPx8nsjniKG7hTRnhKrNNYYt6Z5ULdLvM=;
  b=bXEhsvmLaByEh6jXAa3HtH0D6bpkhCDQfDsYW3p9scTiqLd6JSVl2ZQG
   sF8DTi5dMLENxEwaIwF3XsIzRxub7ZoGtL7qigB+zOsFQ36FrVzCxCeYL
   IDs/mablWKEiHyZDG0L3U/fAUlrLu/SqFminmlS3hMx5/+ztppBhbhmdO
   GEUg1XGtk16qeCKWudE9wzb8ROvv4lbiiN5y+rJMSr16RhYRW8eMr5YWB
   lZ5gZMZEe6kHbeUBFZJ7Xzr10CzITwPx3Hpv6ZqWcOZqG+RV2lqeKQUvx
   Sox00WkYGIwXhiUbN0u13lvhUR27GcHNomWTVzb7UyE+vXNvGutZnKSwt
   w==;
X-CSE-ConnectionGUID: mEdeHL3WR+eUwpOPn1UR7g==
X-CSE-MsgGUID: oJ/gIc5mTHeRVUssGm3u6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="223774531"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="223774531"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:23 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4120A1461
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:24 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id F1193100085D
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 4D11720000D9;
	Wed, 24 Dec 2025 09:14:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/28] python3-google-auth: upgrade 2.43.0 -> 2.45.0
Date: Wed, 24 Dec 2025 17:12:52 +0800
Message-ID: <20251224091304.974-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122866

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Features
---------
- Adding Agent Identity bound token support and handling certificate mismatches
  with retries
- support Python 3.14
- add ecdsa p-384 support
- MDS connections use mTLS
- Implement token revocation in STS client and add revoke() method to
  ExternalAccountAuthorizedUser credentials
- Add shlex to correctly parse executable commands with spaces

Bug Fixes
---------
- Use public refresh method for source credentials in ImpersonatedCredentials
- Add temporary patch to workload cert logic to accomodate Cloud Run
  mis-configuration
- Delegate workload cert and key default lookup to helper function

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.43.0.bb => python3-google-auth_2.45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.43.0.bb => python3-google-auth_2.45.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.45.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.45.0.bb
index 1a1b035a41..17a9d7051e 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.43.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.45.0.bb
@@ -10,7 +10,7 @@ SRC_URI += " \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "88228eee5fc21b62a1b5fe773ca15e67778cb07dc8363adcb4a8827b52d81483"
+SRC_URI[sha256sum] = "90d3f41b6b72ea72dd9811e765699ee491ab24139f34ebf1ca2b9cc0c38708f3"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


