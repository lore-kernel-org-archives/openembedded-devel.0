Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288D9C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:29 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9718.1788344961208514763
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j7LQYdsm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344961; x=1819880961;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mhgdV93KgFNF+WUZ7d/fp9SwNe9NVV92QtB6EbjnRsQ=;
  b=j7LQYdsmPcEvp/p1qBVrLM4GNmHMcX9rEn288Trk/CBpofqQzwrmgEFt
   kho23OhXZwv2s6liEyPwwM/zg9wLFgGd3Q1Xti7iouQ5yldV+V/DHyTEM
   fL+qYoCnad1vke47TR5GOOKsGUasZQU5u0mTZhQyi5Mv2/Jq+40CwFO2k
   TizAV5QQll8fFWRgRGvJXoKMCxgvnScZ+yhonan5ipbYBLnOMkqnkiqP9
   +oRGVL2t78RmwcKcnE9Ylu2NR2bx9uQDVfrMcRfC8xMmoivB2CkLDxs8O
   vi6qjSdkwSxiFVwThCtSmBUBtkTN6GnqMHrtNcmUuIteq2BpTAz3s9mG4
   g==;
X-CSE-ConnectionGUID: 5S/QqYODRGat3Vn2n+i45g==
X-CSE-MsgGUID: yJPW4o0gSXWwOfpa8rBmsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="253071022"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="253071022"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:19 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A499E42A309
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:19 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 59374C0129D
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 750E12000772;
	Wed,  2 Sep 2026 10:29:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/34] nanopb-generator,nanopb-runtime: upgrade 0.4.9.1 -> 0.4.92,0.4.9.1 -> 0.4.92
Date: Wed,  2 Sep 2026 18:28:34 +0800
Message-ID: <20260902102900.1296-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129667

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nanopb-generator_0.4.9.1.bb => nanopb-generator_0.4.92.bb} | 0
 .../{nanopb-runtime_0.4.9.1.bb => nanopb-runtime_0.4.92.bb}   | 0
 .../meta-python/recipes-devtools/nanopb/nanopb.inc            | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb-generator_0.4.9.1.bb => nanopb-generator_0.4.92.bb} (100%)
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/{nanopb-runtime_0.4.9.1.bb => nanopb-runtime_0.4.92.bb} (100%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.9.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.92.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.9.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-generator_0.4.92.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.9.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.92.bb
similarity index 100%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.9.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb-runtime_0.4.92.bb
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
index 4fe3995cd5..62dc3ec947 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/nanopb/nanopb.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "Protocol Buffers with small code size"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9db4b73a55a3994384112efcdb37c01f"
 
-SRC_URI = "git://github.com/nanopb/nanopb.git;branch=maintenance_0.4;protocol=https"
-SRCREV = "cad3c18ef15a663e30e3e43e3a752b66378adec1"
+SRC_URI = "git://github.com/nanopb/nanopb.git;branch=maintenance_0.4;protocol=https;tag=${PV}"
+SRCREV = "160d4f09e5fabb2b66aa2dea32d4f38ace2c4b3f"
 
 
 inherit cmake
-- 
2.43.0


