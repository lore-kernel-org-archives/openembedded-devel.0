Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581F5CD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:52 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16791.1779875331619399937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B0s0RhDb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875331; x=1811411331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=88LZ+LkgB2iV61vucZ+g+YKtolb7Pk1+2/sxeGHhJlo=;
  b=B0s0RhDbxtPJTzUWwaV7zeto3gTOJQLnfoMgoUY+lJ6Pbd/dmDdVISjR
   2ZOiQCsmL51gASm6QbORSvj/jVF78txdIfp6aBk3EkLjsFOgWkhAxCaIv
   IhQE5gdB8V6pnUh0W4ka5wPKJkaKH3nD2jJMgaxWaB953MyQqAL0k9RHF
   p5mhqUv2nRhAS4B6yEvi+U4jDixwtQpzD0bsfVsazYLvt6ieVKfsglFXf
   jvUh3vDEibeyFRZ0OPODtRb0RRDFQEjlJNZwkCiZd9XhZqihFa6pZkT3z
   gjCFlDCcxsFVdmRmnvQFIgErHy8/xh9DZ+l8O7nb+gdEHyvXpJRpjdZHR
   w==;
X-CSE-ConnectionGUID: AUlmbwiVTku/Xp3s0ABudA==
X-CSE-MsgGUID: +ZGd6cuCSGWfWcKOJSWf9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="245264195"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="245264195"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3033B42A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:50 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DA4D41C135FF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 00E4E82A2CC;
	Wed, 27 May 2026 09:48:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/56] poco: upgrade 1.15.2 -> 1.15.3
Date: Wed, 27 May 2026 17:47:28 +0800
Message-ID: <20260527094805.2039-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127226

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/poco/{poco_1.15.2.bb => poco_1.15.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poco/{poco_1.15.2.bb => poco_1.15.3.bb} (97%)

diff --git a/meta-oe/recipes-support/poco/poco_1.15.2.bb b/meta-oe/recipes-support/poco/poco_1.15.3.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.15.2.bb
rename to meta-oe/recipes-support/poco/poco_1.15.3.bb
index 5a873a1d85..ed236f7a5c 100644
--- a/meta-oe/recipes-support/poco/poco_1.15.2.bb
+++ b/meta-oe/recipes-support/poco/poco_1.15.3.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 utf8proc zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-${PV};protocol=https;tag=poco-${PV}-release \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=poco-1.15.3;protocol=https;tag=poco-${PV}-release \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0002-DataTest-disable-testSQLChannel-test.patch \
            file://0003-quill-rdtsc-fallback-for-32-bit-powerpc.patch \
            file://run-ptest \
            "
-SRCREV = "afbb1ab68f29eec7079e2fdfa04b3efdbec6529d"
+SRCREV = "e8c711ce5a58006272b3950c293eb92c849caea3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


