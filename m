Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A556DC54F55
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5632.1785218827523995408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BztsCAAm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218833; x=1816754833;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=1Dbj4lRJZHRsuPk1j/yf5lt1gKhqFahr0TQbpth9i4Y=;
  b=BztsCAAmDQbL4NnwVm7jfNp3jwQ6WhevYHKzk/M9y0aDoQyjkWniG+O8
   CrCvhlY5umeBsDN7xP1VHbEPcA+TZYqi5TFhW8qPXNkWlsxCWADu/h/w/
   RLeH5aA1Y08kNK/zQzDuOH/xSEWo6trs5dXqc6Tw3sbtOHvLGLgZXyRgO
   NC7iMH5xEcWUK2iLntVm4UIM91SPdOIAI19j6T1BgN/HlhPEo3Pb3IDFQ
   GOJfqm9H8AO3Emsys/m5HPpVOoxJN/T3J322WYklkg4nex7vpOlYzw7qI
   KOEqFiEUkdaGy0MQ6aNiVjqzuCAqk+dDSNPjYpj5qIPt7UaFrIddfm8hY
   g==;
X-CSE-ConnectionGUID: hOkwzAipRU2V9UuUiO4vTA==
X-CSE-MsgGUID: aZX2WLHoS0edSxCg9iJsXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="246995067"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="246995067"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:12 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6474FC0009E
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:12 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1E23B18000A6
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:12 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7845710005F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-huey: upgrade 3.2.1 -> 3.3.0
Date: Tue, 28 Jul 2026 14:06:31 +0800
Message-ID: <20260728060645.819-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128488

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_3.2.1.bb => python3-huey_3.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_3.2.1.bb => python3-huey_3.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_3.2.1.bb b/meta-python/recipes-devtools/python/python3-huey_3.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-huey_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-huey_3.3.0.bb
index 080ecf5c11..105f0e6220 100644
--- a/meta-python/recipes-devtools/python/python3-huey_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_3.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "79cd63d117e5b8da2de58420dcde4e2d0f963e362d67a9b3872ce565eec5c3dc"
+SRC_URI[sha256sum] = "e0c2a1542e6c3acb894821cde895cf9dbf72e42deb25f55b2d44096aa30f8f24"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


