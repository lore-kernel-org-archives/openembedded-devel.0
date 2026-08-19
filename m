Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A974C5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3345.1787132213471967723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K35XzdAg;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132217; x=1818668217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HuRpOkr954QKNAnv6e9+5wSs0yFl00cM5ecZ4HB8RdM=;
  b=K35XzdAgT2jic3kkefP2PsbbORx47WOfmHcsbpTrrj4vYKh8A5/TSB+t
   nXZQFDzMNNOnuKZJzO+Cxkou78cXAT2YWfSnp+ERUuWnJpfseAysihVWs
   XN4Xfm23oTvCAqtin/RNxp1cmKVLaQPlIwGZ1hza6gEJHD3CXScWsWH45
   NkabZuMvauus338f3mt5hOOlBXHitTIyNftUghmdyXzfy42dvDxv68F0F
   52oH0U7wc2r0zQIvSn7LEAGeI7xNdwFPzkOoZDgzKYK0ZyINa8GMrsPHV
   bk5ApK9xdJVxTDJWUfdqtTs1H9CGNOCbpc9S/lUJCMmfn5LyWnQNOTZFk
   A==;
X-CSE-ConnectionGUID: MtBKMyHPSPmSrC8Fpm9ynQ==
X-CSE-MsgGUID: pVGXeoNoSjaeaK3buf+bMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="230759505"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="230759505"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:55 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BCAEB1002B81
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:51 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 739E28606D4
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7AF891801C0A;
	Wed, 19 Aug 2026 09:36:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/70] python3-pytest-timeout: upgrade 2.4.0 -> 2.5.0
Date: Wed, 19 Aug 2026 17:34:56 +0800
Message-ID: <20260819093514.1101-52-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129322

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-timeout_2.4.0.bb => python3-pytest-timeout_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-timeout_2.4.0.bb => python3-pytest-timeout_2.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
index c30e7a1ddd..40c0a2085a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.5.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-timeout/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
-SRC_URI[sha256sum] = "7e68e90b01f9eff71332b25001f85c75495fc4e3a836701876183c4bcfd0540a"
+SRC_URI[sha256sum] = "68c9d82dfe95fa65712e107010c9344e7d8b4afe8c975a7be0d273d939583a93"
 
 PYPI_PACKAGE = "pytest_timeout"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


