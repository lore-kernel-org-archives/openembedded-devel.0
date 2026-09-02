Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6E6C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9733.1788344978385417533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=osAfEjdU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344982; x=1819880982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pxGsQZmk+ebna8w0s3j/A790d9EpPPmtIgo1YDCAW7E=;
  b=osAfEjdUqAOTlpP+BPufF2kIBgbqPu4e3KqWcBnxftjmu7X3otEl3rJ3
   EMCULM+fpxVbODNaOmNq4DJ3dDasZu9fxaqNB/ub3/v5NKViWSaZZq0Id
   vumvAy02Q9PCX9ukFjM0V22a4GtlshWtpBPgBzdfN0eAbKi8HQ0ILjmCH
   qYE2GO6EB1sy9judmBmGVupX9foLfR9SWnQp599jSLntZpTcq4b7PH4jc
   uXMvAhZ+HCpTgVPOCMWJii890ocw0IqLx1COqxJ52bdhueVrZO2n9FnM0
   FTLNCTpXSjHEgvOjZMGfd/RzY5+ISBakmP3Weub1K8N+Dtw8ODiPcUtT5
   w==;
X-CSE-ConnectionGUID: seg+mpHBRna9HclTarxhzA==
X-CSE-MsgGUID: LDjM+9LgSR+KeBMZ+Ybc7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="239767244"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="239767244"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:41 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D05081C000E0
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:36 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8040918026DE
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8807F2000224;
	Wed,  2 Sep 2026 10:29:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/34] python3-importlib-metadata: upgrade 9.0.0 -> 9.0.1
Date: Wed,  2 Sep 2026 18:28:42 +0800
Message-ID: <20260902102900.1296-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129675

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_9.0.0.bb => python3-importlib-metadata_9.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_9.0.0.bb => python3-importlib-metadata_9.0.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.1.bb
index 61f531a9c1..e75edc908c 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_9.0.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "a4f57ab599e6a2e3016d7595cfd72eb4661a5106e787a95bcc90c7105b831efc"
+SRC_URI[sha256sum] = "ab830580bc0ef3db61ce8fae716389e5462b67e033018bab6d8f80ef17172f99"
 
 S = "${UNPACKDIR}/importlib_metadata-${PV}"
 
-- 
2.43.0


