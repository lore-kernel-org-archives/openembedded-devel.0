Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA951112265
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7221.1775096136442485621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=snv+EO3J;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096136; x=1806632136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mx5zsLHGGl9VVADFuuhXNiAANqiVGlZRxekcxkCd/68=;
  b=snv+EO3JI4h75n0Is/xSVhBkiSxhkiCYUdA4bvvZu01qgerEu3tzWpEp
   0VOc2xjNmV/z+XE7BFeu9we9wRyeRmCyTrXrI1Psm1Z+GW00OpAnOoQER
   kDRItY/pm8NKXOsZvP91udDXdJx0RpPqRRoHHnty05kJcm86VGD3vR0eR
   r96ptwgvhzfcyPiIHURJkZ25gZsfOLhacYlQU3JbuEcbKVbpBeUUAXRXa
   wzUv43m6eksp7w82634Ue+CXsYaI0vNGxxoXD9MYVGsDeSYr7ExyqJiZF
   4UUSWNm908NO4UL2f5xilKhOx9SopucS0JdlDb0FhBrFtMpiOv5/XhJjm
   Q==;
X-CSE-ConnectionGUID: CkSkH9JwQdG7mS1BDNoBKQ==
X-CSE-MsgGUID: vlUmkH1bTHCuCbUjgKkNMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="222970428"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="222970428"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EAC5F1C001B3
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:34 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 99A2B188C99A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 1DE26100249C;
	Thu,  2 Apr 2026 02:15:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/39] python3-bleak: upgrade 3.0.0 -> 3.0.1
Date: Thu,  2 Apr 2026 10:13:33 +0800
Message-ID: <20260402021355.1324-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125933

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fixed AttributeError in start_notify() and stop_notify() on Android.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bleak_3.0.0.bb => python3-bleak_3.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_3.0.0.bb => python3-bleak_3.0.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_3.0.0.bb b/meta-python/recipes-devtools/python/python3-bleak_3.0.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-bleak_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-bleak_3.0.1.bb
index d4cae1b418..89f7c973d5 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_3.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "f137b19257abe27b4700b5ab0f5303a1461f6c70"
+SRCREV = "3f967abe9ef454bd494055612a067f2128944df2"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S};tag=v${PV}"
 
 SRC_URI:append = " file://run-ptest"
-- 
2.43.0


