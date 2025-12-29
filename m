Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23697E9271B
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:30:11 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40572.1767000604401113718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MaWqQYEm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000604; x=1798536604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G8+0S/lGJNTMyadNEOamo1MxeFp/uUrdzRgfESNp8Ns=;
  b=MaWqQYEmtfzCFVdCQdaBMUxierwx1QDvwuc9/Q4uuSV28H/lvKIatmN7
   VWSZi/aIpjr6BKliCZVIYpHxeVCb1uLTbAjmCQnHL3DbkX2+EUcECK1AF
   C4cee4T3b5tT+vtvpqVDiA5q1h5peTBKWSfCrI+I1kywofN0aSI9ISsMC
   TClRE2+nuwghzePqlXjRowFuwQawmR+V2DWJuW9cJlGI8jICwcC0V9rh3
   OPNtwnX99a4YfrsL+61lZyoEKJfgSNVmGm9jQgHdKUVIg69iLeDUgDWHg
   emMI4otkgvXCs9Dh8CGceJ/7qU5J36codqxRPDSapXHhb/DTGOXudCmBY
   Q==;
X-CSE-ConnectionGUID: cn1GohVuRwi/JyR8VEG/pA==
X-CSE-MsgGUID: LD2CWtTTShmMDuMiCLlbxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="224199184"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="224199184"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:30:02 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id B6AC61C1C711
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:02 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6EEE718002FD
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0406210003AE;
	Mon, 29 Dec 2025 09:29:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/10] tesseract: upgrade 5.5.1 -> 5.5.2
Date: Mon, 29 Dec 2025 17:29:36 +0800
Message-ID: <20251229092936.1483-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122974

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Simplify code for osdetect
- Fix and improve configuration for cmake builds
- Modernize some for loops and fix some signed/unsigned issues
- Cmake optimization with warp2
- Update checkout action
- chore: fix cyrillic typo
- Move version info. to appropriate ALTO element
- CI: Remove unneeded export statements from cmake workflow for macOS
- Bump actions/checkout from 5 to 6
- Bump github/codeql-action from 2 to 4
- Bump actions/upload-artifact from 4 to 5
- Bump mikepenz/action-junit-report from 4 to 6
- Bump actions/upload-artifact from 5 to 6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tesseract/{tesseract_5.5.1.bb => tesseract_5.5.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/tesseract/{tesseract_5.5.1.bb => tesseract_5.5.2.bb} (87%)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
similarity index 87%
rename from meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
rename to meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
index f01cf8e138..46b789cbc4 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_5.5.1.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_5.5.2.bb
@@ -5,8 +5,8 @@ BUGTRACKER = "https://github.com/tesseract-ocr/tesseract/issues"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "3b7c70e34dea179549ed3e995872e2e019eb8477"
-SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https"
+SRCREV = "6e1d56a847e697de07b38619356550e5cf4e8633"
+SRC_URI = "git://github.com/${BPN}-ocr/${BPN}.git;branch=main;protocol=https;tag=${PV}"
 
 
 DEPENDS = "leptonica"
-- 
2.43.0


