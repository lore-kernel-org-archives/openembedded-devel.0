Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439E3C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10302.1785820695610840664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Hwz7def/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820696; x=1817356696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=79n8iGXJMjA7qUt4FhMn9kN9BsmOfocTv/plDxR+vHE=;
  b=Hwz7def/uG+zDAiR9apZTIffRJcbplmc2esaQUkoNS5Z+JHiOfF65Vec
   QT4+Et4TpZC4lzBVof/8uRPUTCtq25OhBCG+O+viuEhxCKgVN6jpywrzs
   UwYvoZ8ewFNXL1/1X9clIJkpZQOFbfuRqUQcSgkLVYNA6lqwuAxwv01hy
   YvXiHhgGDruedqPSmvda2VV8fl33aiUMC+9llsGPZo/U4JHb+mfGtLw9a
   SctPyKERtc5eaB3GyERgNT79olyBMa6QI7fVN5ePOBO3NupvjKMXdfR3E
   nNWYleCHynoB8AIOggGlToGyiyXk5+ZKJS4nL9VHHLtaBN9niHh4sYbZq
   w==;
X-CSE-ConnectionGUID: xVKYqqfaQkC6N2r0c5Lalg==
X-CSE-MsgGUID: Vvk2qhVETNu8tdEKU5tRjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249629851"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249629851"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:14 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E6BE78204FF
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:13 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9CD248493B3
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9D1991800592;
	Tue,  4 Aug 2026 05:18:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/28] python3-coverage: upgrade 7.15.2 -> 7.15.3
Date: Tue,  4 Aug 2026 13:17:09 +0800
Message-ID: <20260804051726.1489-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128716

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.15.2.bb => python3-coverage_7.15.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.15.2.bb => python3-coverage_7.15.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.15.2.bb b/meta-python/recipes-devtools/python/python3-coverage_7.15.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.15.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.15.3.bb
index 346d970313..b74fd1db58 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.15.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "3df60dc267f0a2ca23cb7a9ab1109c62b9335ffbf519fcfe167157c28c09b81d"
+SRC_URI[sha256sum] = "ae7ea5a4614acf399ef0483c4cb34f8f8f01df848d8fcbe7d3ce0865733f1c4d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


