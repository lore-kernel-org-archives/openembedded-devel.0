Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A3AC4450C
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3448.1784112021685138766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n0lPzoCC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112032; x=1815648032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3xed4XXo8yTEr4UO9B+PQJhzGAQPOxpRhbztB6WJMhQ=;
  b=n0lPzoCCFK1CL0hVeQ78ErB+GWbhj8qkK6r/QxkeZMGlRaJqiqfbo823
   yuiFa4T0yjjCgbAUmngzXgb+r2IkACeypC36cKJWYCSFYou5LHafqjGMm
   J1KORuwXugHWHQ/v5pNHyY5jBIRh22C4Sm8z4dpqqzfmOE08bzTK6XlXl
   pADDN8Qz8fcyc8EEqmsFy5A3hfiqPwX3emsnNfWAtLLegbulK2wHJFsRz
   g7X1CUeYWzgmlUdjPCRhReR3UVesjml8HcPCOIAhpA/Ukn3LmR/lhd0Ut
   hlp6zGQcgtboOVWFCH6UGhr9bqMMVgwSoIv71B7Jup8L686+3dbcXrWLr
   w==;
X-CSE-ConnectionGUID: ARqjH4bwQRGvVZRzUcHCAA==
X-CSE-MsgGUID: 3uLbHO5oQsqsTe3l5oBnEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="250999072"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="250999072"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:31 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8D4ED3D1B
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:29 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3C7ACC073F1
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 420701800B81;
	Wed, 15 Jul 2026 10:40:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 34/44] thrift: upgrade 0.23.0 -> 0.24.0
Date: Wed, 15 Jul 2026 18:39:04 +0800
Message-ID: <20260715103914.2120-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128207

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../thrift/{thrift_0.23.0.bb => thrift_0.24.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.23.0.bb => thrift_0.24.0.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.23.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.23.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb
index 4f90628b4a..6a5efdabdf 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.23.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.24.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
            "
-SRC_URI[sha256sum] = "1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f"
+SRC_URI[sha256sum] = "e0fa5839a4c5c1d631b0931cf2c554ebbfa4e2fee3a9fb3ffd4f82ce4396c6e4"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


