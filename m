Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE49010A3D63
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46423.1774526252335136448
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GcNhBYBg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526252; x=1806062252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dHRPe1djvegAvn19wwR8+tPLDkjJMleoOiii5/yVUG8=;
  b=GcNhBYBgyGG/+wDokwphpLGmEA4xR10symW0JojQUNMaz95WoNLluk7b
   p2uXapkhqCIo9BnHX1nz98Y7p6/0Spus27spzS5Xqqiwwspfoj/ljgnoi
   yr6Y334KZgNPGKkTsjpePope9ovekJXf8OMN84rEhYNGT+eTEYaeEkqQZ
   P6joQlP4IvUIeDuXOrFcj8bEnjo7wOUe0lwxII0Am/2dBusBiHGbMbWmE
   GH59mWkxtTROmfPnv6Qrz8jeR4s56+BQG+29l13DtMtw+uL8dRSp8/+Gk
   Yoyr3aINdfdCGckDaG3ENOGzScWcvsQhHfxnwYx2OL+zynBqiey/RvHHA
   A==;
X-CSE-ConnectionGUID: 4leFAQ4aRwmslYO7DVJX0w==
X-CSE-MsgGUID: s4TSJQ3lQx2EWkUrJv2Jvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718871"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718871"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:31 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CD5485C1C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:30 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7D7D218009EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 065CC1807148;
	Thu, 26 Mar 2026 11:57:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/63] python3-coverage: upgrade 7.13.4 -> 7.13.5
Date: Thu, 26 Mar 2026 19:56:01 +0800
Message-ID: <20260326115634.1199-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125686

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix: issue 2138 describes a memory leak that happened when repeatedly using
  the Coverage API with in-memory data. This is now fixed.
- Fix: the markdown-formatted coverage report didn't fully escape special
  characters in file paths (issue 2141). This would be very unlikely to cause a
  problem, but now it's done properly
- Fix: the C extension wouldn't build on VS2019, but now it does

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.13.4.bb => python3-coverage_7.13.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.13.4.bb => python3-coverage_7.13.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.13.4.bb b/meta-python/recipes-devtools/python/python3-coverage_7.13.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.13.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.13.5.bb
index b02f38e568..3cdce95d34 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.13.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "e5c8f6ed1e61a8b2dcdf31eb0b9bbf0130750ca79c1c49eb898e2ad86f5ccc91"
+SRC_URI[sha256sum] = "c81f6515c4c40141f83f502b07bbfa5c240ba25bbe73da7b33f1e5b6120ff179"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


