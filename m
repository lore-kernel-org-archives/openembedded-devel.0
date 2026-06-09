Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D41B0CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:01 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76243.1781000995194882629
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ag1D1c8b;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000997; x=1812536997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRCkZC6T/Der0q68PnQLI+kt1b8zLCvF0xuPyDPrXmU=;
  b=ag1D1c8b6kUFCmLevyHZ+8fl96V6R/C6mLZeqQCrlvB1fjTEhvx8co4b
   4QTmAI0hch/TmOqyszmsNj0lqiGiPYKRYY6q20wdkMhSBH67PclnzAUGt
   Ki8hiHpuM1naBfhzZe6W7eFCMmpsVkjasOKpj9kZJcUVIO4irjBU3jcyE
   TR5u+V9fB4mb+x8XAi2GXtyE1wZZuwZE2EoOS7EQjDA7uY0qgNH/6atVy
   d9so2jXIGXo/Z6kKz3qCl55Gs3TPmD83IDiv0LE5x5eB/n//xMo2w7kNX
   2spDNQiZux5YcND5p8y+nVoYihh2g4soDfpQCIOqkvQml3XvP1ac42iWM
   g==;
X-CSE-ConnectionGUID: fkjD2RMWSNKG6Jlth3LvFg==
X-CSE-MsgGUID: SB/ZouDhTSe5NjPk22XSbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="231500944"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="231500944"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:57 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B89DD1002B85
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:56 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 6D6FBC170A9
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 90E4F10003CF;
	Tue,  9 Jun 2026 10:29:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/30] python3-cmd2: upgrade 3.5.1 -> 4.0.0
Date: Tue,  9 Jun 2026 18:28:58 +0800
Message-ID: <20260609102913.2204-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127469

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_3.5.1.bb => python3-cmd2_4.0.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_3.5.1.bb => python3-cmd2_4.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_3.5.1.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.0.0.bb
index 1d57d7a8b9..13c84adff7 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "1637f765e764b022dfa617f4711fb441599732082eb6310cf8739fbaec2335a0"
+SRC_URI[sha256sum] = "97956c491be8ae2c5239ba1e7658b52804f0e54b401b15cae80c6b85c9dce74f"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


