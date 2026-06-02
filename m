Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC4CCD6E61
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21224.1780394925815658717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HgPimduZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394925; x=1811930925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bm7kR/+R5ts5J+4jj+oKHCkNZdlUuHQPbZIPDJ0kOCs=;
  b=HgPimduZtTpy94FG/9+eUIumYRr/pxAV9Tw34wH15M+9s7ON/bEzki4L
   ZcyPCAqkV441Z23HKXfUWvBVybJmsSSWdcw0xCkiqSVtuWA8LTRQG2ZYp
   fcXO8tRokZdC53m0Y8W7Qer0x07QnZnC8UW5VPkmRKKo/JiELJ+5zZt/i
   q+9FO+IBEwS0BY9bCKb7biITFy0YDJ9S06spH19uSt1FTwdwqAJY4oGIZ
   fG+ujXuiI0VnrgNu0GDcy8xTQ+p2oRqJtgk4ZiFmF8DCHrzbgIa7l4v+z
   PaHJaFF488toY3fa9TvCOAQ2yVwne0SjtPZi01jYJPUJOIqTOcg2M4zRq
   A==;
X-CSE-ConnectionGUID: Pmlt2WnFR/+5AP8rR58L4A==
X-CSE-MsgGUID: WvKJY4GDQGiPf6vtCFvgjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230702045"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230702045"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:44 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 498AA304A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:44 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id EE2C31C1C25F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0D2FD1800107;
	Tue,  2 Jun 2026 10:08:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/38] python3-pytest-asyncio: upgrade 1.3.0 -> 1.4.0
Date: Tue,  2 Jun 2026 18:07:40 +0800
Message-ID: <20260602100755.2117-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127346

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-asyncio_1.3.0.bb => python3-pytest-asyncio_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_1.3.0.bb => python3-pytest-asyncio_1.4.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.3.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
index 50fb5e6ef0..7f237932a7 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "d7f52f36d231b80ee124cd216ffb19369aa168fc10095013c6b014a34d3ee9e5"
+SRC_URI[sha256sum] = "c6c0d2259945122819f171a32ecea2c349ead889ee28176caaf492143424be42"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


