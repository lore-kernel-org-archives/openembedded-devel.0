Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F331AFED2FE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18738.1773312750110677663
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LOFnactl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312750; x=1804848750;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U3E5AUBfdvEdLlejHCE9qvxDbqR1iakDqzbRzyrTkok=;
  b=LOFnactlK1tnzVfbUCQ2m2ZL3aMpDLV057lktN1e9lGq7mGM3GKkd1Pr
   q9hRkQXu2G7hVMJ2QrZfDsXyxuP4W8Cf2iLJyHD9Wk5roadDEBFMtvTc8
   Zy7jemirYX3FHvYJr4op0snGBBIVA5jpBl33jBm0+0UgViAsVzmQOCf6E
   3qrvJpUZSq8h2HVzSs71qEXTp0lMABWhw+I8xingwh6Kf4DbB8wvS1h3T
   7KlmP0Oa7BuBr4m8bgK/mQo9WJaWGOVbtxilO/Qceolq7vdPHYWppyKtC
   2y70L86rDyHy8GBzo1j1rA/NxDYp9XmeVfVNtU5bGi6RH80sgmZm6xKeh
   g==;
X-CSE-ConnectionGUID: R126p4REQOOLWFdZ87sxew==
X-CSE-MsgGUID: OFxjloW0T+acCiyFJAFHOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233687955"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233687955"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:28 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 76A821000A13
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:28 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 273051003BF5
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3E69A18005B4;
	Thu, 12 Mar 2026 10:52:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/64] castxml: upgrade 0.6.13 -> 0.7.0
Date: Thu, 12 Mar 2026 18:51:17 +0800
Message-ID: <20260312105220.1856-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125101

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../castxml/{castxml_0.6.13.bb => castxml_0.7.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/castxml/{castxml_0.6.13.bb => castxml_0.7.0.bb} (86%)

diff --git a/meta-oe/recipes-devtools/castxml/castxml_0.6.13.bb b/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
similarity index 86%
rename from meta-oe/recipes-devtools/castxml/castxml_0.6.13.bb
rename to meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
index 9e506a8709..43eeeeace7 100644
--- a/meta-oe/recipes-devtools/castxml/castxml_0.6.13.bb
+++ b/meta-oe/recipes-devtools/castxml/castxml_0.7.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "C-family abstract syntax tree XML output tool."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "13e1572729981289a7a96d762960994134f73f76"
+SRCREV = "2d52b47cfd88b703d3247f77bb7c3ad7372bc9cb"
 SRC_URI = "git://github.com/CastXML/CastXML;protocol=https;branch=master;tag=v${PV}"
 
 DEPENDS = "clang"
-- 
2.43.0


