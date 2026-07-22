Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FD3C4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44629.1784715883426398199
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rhech8EO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715883; x=1816251883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oBAgXCAe/gybi/21gQr7BmxpbmZG1G6VVDl9UewJ7g4=;
  b=rhech8EOtwiHdntwAM6W8nHe4zxvXhmc9WRr08BDBTY5VYDd/HzMxC0L
   YI7lk2OEBLyKD1nXCWrwafOyHHPtkQyySyjyCPBr9C212+FxIrPjSAoY5
   qSOh21cdY1UznJkRZmGI9MeGV5qR9xbrc3YbJrMbkPIwtKvBj1XsNMBMX
   yIU8t5MNzzkdtQQP92BqBiWkfKUUd6Q9w7HPHvGTt1DTH1DEn2D8V6tkM
   L2EKVGDtdYHeEfDGfDLCgWULW2eNJBVFEBXmF8x51GATRvbNBiXinKgDv
   q4HFqnaCJrKO5Ur4SIAZ9M5NlqOlGrm816/Av6gHQc55fqnC5qHSybpQn
   Q==;
X-CSE-ConnectionGUID: 2tSlylYhRSKFeibRvVJ8Og==
X-CSE-MsgGUID: Fakwe3wxRxiXEIlcqoUvHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="235655343"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="235655343"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:42 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D506182008F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:41 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8AA4EC091B2
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 9E07B4064B2;
	Wed, 22 Jul 2026 10:24:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/37] python3-tomlkit: upgrade 0.15.0 -> 0.15.1
Date: Wed, 22 Jul 2026 18:23:12 +0800
Message-ID: <20260722102320.1019-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128399

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.15.0.bb => python3-tomlkit_0.15.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.15.0.bb => python3-tomlkit_0.15.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.15.0.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.15.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.15.0.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.15.1.bb
index 1cca29af60..b0c51f21c5 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.15.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "7d1a9ecba3086638211b13814ea79c90dd54dd11993564376f3aa92271f5c7a3"
+SRC_URI[sha256sum] = "e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.43.0


