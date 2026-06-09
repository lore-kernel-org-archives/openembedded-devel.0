Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42198CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:30:12 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76247.1781001003126934637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:30:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cUbD5SOe;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781001008; x=1812537008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ozgpBj644BAejI3qAFPAvAeDuV01PW/YhJXu6ffn8rY=;
  b=cUbD5SOe4eVWinQrVNO7G3CdHr/NeaihiT+q01YQiVYF2yDZuzE9mkaF
   bOVqBqtQRcZcbX/A/xo/87LDcGMeeGZ+85Wj/MDPUfkHVak0cNjWiskCj
   uSptY71moHb7W78jVSGwKIGe4AN6NgEPCLwevK0MeoD6kDG8y+RLfyrBy
   GoSKH/9Xu5mJ1SHg0KpmGzvHJB3emFIx2RaHte7Pc8mQqIgaVOpE1a4Km
   QStVmJbuGmL4HQYjxwqEZSn0E+6n9REfymVLItph4TjDvqUScwdAfh/+C
   DD1pgrh/6K4j183/47//PJ0eeHv+YIMvtpBLmp8zPbRG8P6Jplf+PGVsV
   A==;
X-CSE-ConnectionGUID: WZpEhPCHS36mkTP9VzCaZw==
X-CSE-MsgGUID: 6yWuKdjUSiaFCgFXFh5V1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="221210066"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="221210066"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 98BBBC00416
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 50646C07376
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:30:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7765C10003CF;
	Tue,  9 Jun 2026 10:30:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/30] python3-pytest-aiohttp: upgrade 1.1.0 -> 1.1.1
Date: Tue,  9 Jun 2026 18:29:05 +0800
Message-ID: <20260609102913.2204-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127476

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Drop Python 3.9
- Typing improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-aiohttp_1.1.0.bb => python3-pytest-aiohttp_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-aiohttp_1.1.0.bb => python3-pytest-aiohttp_1.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.1.bb
index 9a5c0b3bf4..91a619eab1 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "\
     python3-aiohttp-native \
 "
 
-SRC_URI[sha256sum] = "147de8cb164f3fc9d7196967f109ab3c0b93ea3463ab50631e56438eab7b5adc"
+SRC_URI[sha256sum] = "3aa9c9fe26e543eaccc7eb0add381c685ba3ed3e2fed0af74540f63bcd31458d"
 
 PYPI_PACKAGE = "pytest_aiohttp"
 
-- 
2.43.0


