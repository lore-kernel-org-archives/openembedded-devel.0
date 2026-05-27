Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14248CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:44 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16966.1779875379898269362
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZpCgktpL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875380; x=1811411380;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=reFGcaTl6H3P+VqRCqXvlXn01LInH7Oj8vVZ/YKL6pQ=;
  b=ZpCgktpLC1ygGMouTaL99YnsK10VL3ugAunOgzYS8bOmD6z/ANhI2D9e
   PDjMufh/2gEd5JM3RAwChgiIRa0Wadm8vdBx2QdfAx8FUnRhq++PYSr+4
   FJ6Gz7kau4SGTSsWv6iKDLzopiyXdg64AL2ZGH8+ezh5ho48Cg/rE6dnH
   7wHiKsiMdBBbOZxZmw8ihAHhkJHuCM6KGtjeu6ijJavO5gg8owfHUqAQP
   l1YH0buEZ6NYBOgH3OGbB17AL+ow+1HuCwgpJFbjrlfxE9fV8suVyExuW
   OjoG3cT8eiv0KNK45VI9rd3N5ol9q49lar2Lhz0FqKZz2PHXfhP0k1vWi
   g==;
X-CSE-ConnectionGUID: uaq68bs4Qm+mBnmYB5OOWA==
X-CSE-MsgGUID: KHvO8wraSH+xPtyWNE2dUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="228171233"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="228171233"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:38 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7B3BD42A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:38 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 31D55C006D8
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 440B882A2D2;
	Wed, 27 May 2026 09:49:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 49/56] python3-wrapt: upgrade 2.1.2 -> 2.2.1
Date: Wed, 27 May 2026 17:47:58 +0800
Message-ID: <20260527094805.2039-49-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127256

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wrapt_2.1.2.bb => python3-wrapt_2.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.1.2.bb => python3-wrapt_2.2.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.2.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.2.1.bb
index ee57717a5c..859e36c55f 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.2.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=63a78af2900bfcc5ce482f3b8d445898"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "3996a67eecc2c68fd47b4e3c564405a5777367adfd9b8abb58387b63ee83b21e"
+SRC_URI[sha256sum] = "6744f504375775d7609c82c8d3d94af1c9a6f05586984536905908ba905277b9"
 
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0


