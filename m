Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA55CD4F57
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19043.1779190844427182849
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GiRUR75t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190844; x=1810726844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U9ehsN+fDxZSYk/xpdpa1aQSM6n/K/sAb4HxmUoLWj8=;
  b=GiRUR75tmpHlIVxYVnTnYV5dpckzR885WBhLh5FKZz7tx2yoMwPieILi
   j1GqbWxw4Zyblkid2Ba5SN9we80hOCBC3os/pVcsPlqSwn3bNmgLyM1Zq
   Bos5uxxKhjlLtlimyb5himyQkFrBP4nEIBsCvhHWMmGeiMZiuHKlLJRAH
   R8j61jAcijn/NO/rSEQpBrS3mQgYfBymotbQIwEUVnho3f23smNPLMoJD
   l+86vn+6G9CL4TkOXRYBHlUlxWBqk8QI/hfGpv5ZzOkcw6PxWE6WJk7ea
   fKN5JXh7/CebR/pplC1WwZddEDv8j1PvChA8PsiYihI7NksPX015hpJZ5
   g==;
X-CSE-ConnectionGUID: f+9vbnnLR2SAwEX9l27ekQ==
X-CSE-MsgGUID: pH1ef3EcQF6cgdb+GYv9uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="240515101"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="240515101"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:42 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DD3FE1002B9C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:42 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 960A21401237
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 3E8D54066E3;
	Tue, 19 May 2026 11:40:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/38] python3-pytest-codspeed: upgrade 4.5.0 -> 5.0.2
Date: Tue, 19 May 2026 19:39:07 +0800
Message-ID: <20260519113921.655-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127086

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- chore: bump instrument-hooks
- Remove CFFI in favor of native extension to support free-threaded mode
- feat(hooks): declare native extension free-thread safe
- feat: use instrument-hook markers in walltime
- build: enable free-threaded wheels in cibuildwheel
- feat: skip Python runtime objects in callgrind

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-codspeed_4.5.0.bb => python3-pytest-codspeed_5.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_4.5.0.bb => python3-pytest-codspeed_5.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.2.bb
index 20cf02504f..4397f0e851 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_5.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
 DEPENDS = "python3-cffi-native"
-SRC_URI[sha256sum] = "deb6ab9c9b07eba56fcb7b97206c7e48aaff697b6f73a013d8dbe4f62e76afd3"
+SRC_URI[sha256sum] = "93fea30b2d7266343dd505a182bdf1eb47f96f5fa2929f1d9aff01d3b60e1589"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


