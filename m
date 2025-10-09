Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4D9CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:09:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5582.1759990143316186734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TYhYO3Fu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990143; x=1791526143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R2ZJM/lEFEw29IydFZQTCdhFMCoE331xoj/Vi97EwCo=;
  b=TYhYO3FuPm3yGqjEtqQ/GhORitfL8kyJelUcCOmtRBMQxMpno/1PokPt
   Jq57uX+Bn0LN+O5zMsbi/73NsTc5Dst3nWRHD/CNFEiKoVtAHzjfWbgAb
   PIKd5Jcm+K1TuGJ4x5/FYrCY6i32T/5gcT1apriUqEKNTE/CyXHinkDTC
   fOT/XQoEMyA9qwwFHkDxj1qrT/hQKpxQ94r3Sgak+vx4BQVYIYP4x5Oi6
   tTuK03UNR9BFeg6jWD39rAqy5mzOUo4Jdwr6OPAE+Cff+PO7NusJtIYGC
   6Wd7wHEQigpjfodUkhKhRxmC36Y6EhJT5CTXOI8yXfDyNUriBuYNkC8Kt
   w==;
X-CSE-ConnectionGUID: uQ1bOavFQ+mU4lqdZFZiLA==
X-CSE-MsgGUID: c+eigqQGRsq/9oCSaWto3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="203965831"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="203965831"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:52 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A9562C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 64E8AC02F36
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 193F61001CFB;
	Thu,  9 Oct 2025 06:08:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/22] python3-txaio: upgrade 25.6.1 -> 25.9.2
Date: Thu,  9 Oct 2025 14:08:07 +0800
Message-ID: <20251009060809.445-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120419

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-txaio_25.6.1.bb => python3-txaio_25.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-txaio_25.6.1.bb => python3-txaio_25.9.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb b/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb
rename to meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
index 460c0cd0f8..3e41c05801 100644
--- a/meta-python/recipes-devtools/python/python3-txaio_25.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-txaio_25.9.2.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
 
-SRC_URI[sha256sum] = "d8c03dca823515c9bca920df33504923ae54f2dabf476cc5a9ed5cc1691ed687"
+SRC_URI[sha256sum] = "e42004a077c02eb5819ff004a4989e49db113836708430d59cb13d31bd309099"
 
 inherit pypi setuptools3
 
-- 
2.43.0


