Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF66CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4472.1764669136963812832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dwx9AS9O;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669136; x=1796205136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Beg1cVjUhM9/TYGcG3RXv0FMxLQzI0j6XhjxUz2dgt8=;
  b=Dwx9AS9OVl0DhaYpLVSYp97cnNjUUKKnw7yMJr1loPIORSyj6kHmnMCF
   V4+K4yZjlBSuPasQFOJ9bJxIJpeqcvz6hxEqnIUQLBF9IBhOMJF3Q6Lqx
   l8SqvJqANAfEUBKGSkxZ5yg/2uWoyp/UMrkhbgJwVPTzEc+YO8b1QytgC
   bWvNTu+GzfdettwS24wgV/MCsP65j/aSoNGJxPgpg2bUmrkFszyEpwtd6
   yBBs5Q4gsdsUWREOdgJVqwd6n14natLiyyCC54IGhqNHfftPMZr6stZFk
   z2jOp6ymJsCHCyzPXYEXOtT+nBdPdr82mN7kvFLP8coqGB7pvsoU3bYCx
   g==;
X-CSE-ConnectionGUID: g1DFcjjyTwqXzweIMZ5WJQ==
X-CSE-MsgGUID: eZDea/UnS3SB8co1qxOnig==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="220569803"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="220569803"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:15 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 80C358203C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 334B9C01816
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B9443101A430;
	Tue,  2 Dec 2025 09:52:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/25] python3-pyppmd: upgrade 1.2.0 -> 1.3.1
Date: Tue,  2 Dec 2025 17:51:26 +0800
Message-ID: <20251202095132.652-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122252

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix several issues in ThreadDecoder.c
- Fix the double call of Ppmd7_Free from both Ppmd7T_Free and Ppmd7Decoder_dealloc
- Fix the double call of Ppmd8_Free from both Ppmd8T_Free and Ppmd8Decoder_dealloc
- Fix the issue in PyPY
- Fix initialization order in ffi_build.py
- Fix eof handling in cffi_ppmd.py
- Add support for Python 3.14
- Add compile and link flag for building C++ with -pthread
- Minimum required python to be 3.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyppmd_1.2.0.bb => python3-pyppmd_1.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyppmd_1.2.0.bb => python3-pyppmd_1.3.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyppmd_1.2.0.bb b/meta-python/recipes-devtools/python/python3-pyppmd_1.3.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyppmd_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyppmd_1.3.1.bb
index 046dca271b..4a06c9f01b 100644
--- a/meta-python/recipes-devtools/python/python3-pyppmd_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyppmd_1.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cc04af92f1d26831ec96963439dfb27c96467b5452b94436a6af696649a121fd"
+SRC_URI[sha256sum] = "ced527f08ade4408c1bfc5264e9f97ffac8d221c9d13eca4f35ec1ec0c7b6b2e"
 
 DEPENDS += " \
     python3-setuptools-scm-native \
-- 
2.43.0


