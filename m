Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C180CD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16800.1779875362281806675
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K2YKHN5x;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875362; x=1811411362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sp6SKgBb2bPDG536l1dHjtbJO2VE5dKVBMoanMKRaNM=;
  b=K2YKHN5xO5Fqi18OH4JyDwWLqc+QQ05gXRQwOqe6uzzyyc0w8vrs7zvq
   jStXOkwzx9WqvVeHby95RvqRfjFr7nDdE1sfoE3vrPmtiGjnUSntyphs2
   9wz6s25xTOKhJxMcE+Uu0k+bWb1sv7T6DXJNuUDd9xuZTX1I4WuXBjFsf
   RrQztCaFI8KCttLKVWybU4zWUTZSNlNrp6JA7gJNIqa9+WsL+/80KnDGP
   vW99BSO/U+cB4c9u8VCXccF0U/OCr4hJsgUf0+9eWvWLCNfYK3rJu4R7d
   0ZRwvZAYcqSfiI+Vt3e468mN/e0yKCdlic4OHCs30KYQ/ZOAIDgzUTsP0
   g==;
X-CSE-ConnectionGUID: bbh13sIlRD6DUaieaBgwhA==
X-CSE-MsgGUID: qQ4gKuqnTnm1hWIMAqGT+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264229"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264229"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:20 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CC133C00379
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:20 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 849ACC0918A
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 870EE82A2D2;
	Wed, 27 May 2026 09:49:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/56] python3-responses: upgrade 0.26.0 -> 0.26.1
Date: Wed, 27 May 2026 17:47:47 +0800
Message-ID: <20260527094805.2039-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127245

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Added Spanish translation of the README (''README.es.rst'')
* When both 'content_type' and 'headers['content-type']' are in a response mock file,
  'content_type' is now used.
* Added strict_match to urlencoded_params_matcher, enabling partial request parameter
  matching.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.26.0.bb => python3-responses_0.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.26.0.bb => python3-responses_0.26.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.26.0.bb b/meta-python/recipes-devtools/python/python3-responses_0.26.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-responses_0.26.0.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.26.1.bb
index 4d1884225d..45b8eadb67 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.26.0.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.26.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "c7f6923e6343ef3682816ba421c006626777893cb0d5e1434f674b649bac9eb4"
+SRC_URI[sha256sum] = "2eb3218553cc8f79b57d257bac23af5e1bf381f5b9390b1767816f0843e01dc2"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.43.0


