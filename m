Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749C4C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5780.1785218838054026039
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e1U4jgoE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218838; x=1816754838;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pFVLEg0tGsPUL68tthBl+a/TfOFBfBXZPXjYb7kbexw=;
  b=e1U4jgoEmqK8Y4EG6/RN2mvkNPRvUI3I3Ru4s6ED9m3hTc9fdX0O4oiw
   agwLUaDnb4U4Yw2v6sDWS/FT+0eOQHNBtNEm9jTpaeo82rfOWiknieP/1
   eyhzOtPF1v7pFF/oxV33gpjr4FqtOXO/Lf08rrV0qdSaWpemXK/71vmal
   S6nR/VRA/qiZSJQUGno0VpAIK1Pyi4Q6FHhxNVlB77Oroq2Guu92GSVai
   lDAEhFx61Yrca9ZcLeubSJHi2c7ZIzx6xUuAWTjOthgYyy1pz5r1a57gn
   V9WDRl5l6E0pSE8f+pTlWNhZB41LRVOMEZHhOovi6DcqAfTHl0ci3JNgg
   A==;
X-CSE-ConnectionGUID: AWYBKwFNS9q3r55vX4iJVg==
X-CSE-MsgGUID: PoHKcd1fT0WrqGKjUNxCKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="227717816"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="227717816"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:16 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 54A0D1C1C717
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:16 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 0F21CC011A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:16 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 6EE9D10005F3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:14 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-pyproject-api: upgrade 1.10.1 -> 1.11.0
Date: Tue, 28 Jul 2026 14:06:34 +0800
Message-ID: <20260728060645.819-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128491

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pyproject-api_1.10.1.bb => python3-pyproject-api_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.10.1.bb => python3-pyproject-api_1.11.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
index ba9a04064a..4df56aa8df 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.11.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "c2b2726bd7aa9217b6c50b621fef5b2ae5def4d55b779c9e0694c15e0a8517ba"
+SRC_URI[sha256sum] = "b8807d85a293e6c9f133e6575946fed45f1d42b22d58c780b33aa2421a799549"
 
 PYPI_PACKAGE = "pyproject_api"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


