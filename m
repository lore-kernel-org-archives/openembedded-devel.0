Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE40C4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:21 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3427.1784112018605150041
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OC6AoEer;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112018; x=1815648018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XN1WyZWyY06fjhg2SmOovOwOlSitDSKTzlwaptzaf/Y=;
  b=OC6AoEerw9DtT3+H4IqFI9wr7xxhowi30hdUuTJ7ADB54CtRjFq7o6e0
   9pqHv3ZA7uCRPBXWJp7wf5hxVO1GKt1fAI63cWLCe6XwCOn7BxDWUlC61
   BFtvmIh/s8YXSEZYlI+3SeExshZAWwMcoiOL47v+5uaL5P2udYMWALezl
   eSLl723eM6ru7ItWWEgL4nn/h2E+pfRk6ZhI67o4NA+15cPB13qblIiTG
   Bl6y0QUu8eWgivHZXNjAq/p/9KqYxqHb61mFZZGewaPgRSqYm3nDDmGOB
   bbZV858GVzf4GzXt6Xne+oCbuXr2gmhdaw2HNUHvj0q/dj9EkXDldH2Xr
   g==;
X-CSE-ConnectionGUID: bWoWIkKrS6S0oVADcMVUnQ==
X-CSE-MsgGUID: A4d4G0BOSy6w+VN1YqrO3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="226398042"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="226398042"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:16 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EACC9407579
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:16 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 927A6102095F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9D1471801122;
	Wed, 15 Jul 2026 10:40:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/44] python3-regex: upgrade 2026.6.28 -> 2026.7.10
Date: Wed, 15 Jul 2026 18:38:56 +0800
Message-ID: <20260715103914.2120-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128199

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2026.6.28.bb => python3-regex_2026.7.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.6.28.bb => python3-regex_2026.7.10.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.6.28.bb b/meta-python/recipes-devtools/python/python3-regex_2026.7.10.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.6.28.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.7.10.bb
index afad386715..2b10c91293 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.6.28.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.7.10.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3cb4b6c5cb3060cc31efdc1fbb27c25fb9b29044afd87e40601a1c4d9db54342"
+SRC_URI[sha256sum] = "1050fedf0a8a92e843971120c2f57c3a99bea86c0dfa1d63a9fac053fe54b135"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.43.0


