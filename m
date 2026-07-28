Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33783C54F55
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5784.1785218844532924823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AwqOBeLS;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218844; x=1816754844;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kTjCIKHYzBSmPikSg2EYP0RAeLUtVas+VESPxJRpeVE=;
  b=AwqOBeLSPgIPU0ip8ZnMR7TJn0mJw5ld1RUG1VQxLqTM7EDkTB0ZVebn
   cbP6/EwROxIZZQ51xKcYJcrW6SyW69RbrXrQAxth9KHbpWOI7vL4klxHB
   ow3UydxUKPTqgyrFdLPfreW246S2VfzMcnyuOb7D4EbUWNPRVOOfMYFCj
   fOUzVvewyfpNRCMe4bXzgy7kZVlUSn6mRyVeSymdDeJs65h9XnSp4rmzV
   uGu2A+vo9rjldM7/UY5VtunIZBXU+s6UtSwpxAvCsJsMVUgLFgSqHGjOP
   xGWc9WEPH56Wt4lgYPyp32IKPPz75SjXSLr8yQdgoWEOIKTTAOtJZR8oc
   w==;
X-CSE-ConnectionGUID: QAoNNJ7HShOsdqqwuWV/kA==
X-CSE-MsgGUID: Hqn6Df0ySreR8dqFH3pSew==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="236277051"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="236277051"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:23 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id F1D3B1002B85
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:22 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A7A428D29D1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:22 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 114D410005EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-tox: upgrade 4.57.0 -> 4.58.0
Date: Tue, 28 Jul 2026 14:06:39 +0800
Message-ID: <20260728060645.819-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128496

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.57.0.bb => python3-tox_4.58.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.57.0.bb => python3-tox_4.58.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.57.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.58.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.57.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.58.0.bb
index 37dd27ebd1..30b3056621 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.58.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "b2f758011dfbad7be4b4cc39d2cae21deeb3c3c186e6d7a92d7630eade4218cf"
+SRC_URI[sha256sum] = "ab0b126a04dd56bc18e6d216386db09335247f2289b54cf534deb5c4ae3a8d2e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


