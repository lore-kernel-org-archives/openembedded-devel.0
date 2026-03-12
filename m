Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A601049509
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:27 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18762.1773312803689470156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=clHRdlG7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312802; x=1804848802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4kQhnUUvnlp4adOQB2QKNzQC6vkxsx+v207990bn54g=;
  b=clHRdlG7VRHXheloRofnNyC4G5fSPZ+nDVrq0SyA0ScrPs7sBPPJ03+o
   paasdHpV5kL3AjFLdl6eZYNDfLLJcoHDDfWZ2WNw6TdS3zSwfTHW5Nin8
   uQ33tWYDDx1HxiqJKMsGFAambc7ksayinF2DGHBbSxSW9zIXPH6Qq/rFq
   IamEILG/1wQjipbNrrb4lc6Ce2fRbEaPRCauCBipTbHcmbvw0dUHxi+lk
   zCw9dtwi1xd7hadxdrHN5gkIzZWGAsRiXi8W/0JrEELNQ3jo/2yrXp5IB
   40huGoazX9L7/bhz7fWoCnN1RIWKWAb75YeyzJIP4mJpntp+a9/CXKKyl
   Q==;
X-CSE-ConnectionGUID: Nf6AIv7sReq3bWr2zAvsgA==
X-CSE-MsgGUID: LBQDZuHcTcu9DxOGmtyi7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233021508"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233021508"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:20 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1763182071C
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:22 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BA68A14042C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BF56F18005B4;
	Thu, 12 Mar 2026 10:53:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/64] python3-black: upgrade 26.1.0 -> 26.3.0
Date: Thu, 12 Mar 2026 18:51:42 +0800
Message-ID: <20260312105220.1856-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125126

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-black_26.1.0.bb => python3-black_26.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-black_26.1.0.bb => python3-black_26.3.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-black_26.1.0.bb b/meta-python/recipes-devtools/python/python3-black_26.3.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-black_26.1.0.bb
rename to meta-python/recipes-devtools/python/python3-black_26.3.0.bb
index bcb0f0f408..eaffe06563 100644
--- a/meta-python/recipes-devtools/python/python3-black_26.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-black_26.3.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
                     file://docs/license.md;md5=d826b3c5269f21a8a0272af3f00d15c0 \
                     file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
 
-SRC_URI[sha256sum] = "d294ac3340eef9c9eb5d29288e96dc719ff269a88e27b396340459dd85da4c58"
+SRC_URI[sha256sum] = "4d438dfdba1c807c6c7c63c4f15794dda0820d2222e7c4105042ac9ddfc5dd0b"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


