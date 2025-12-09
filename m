Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29551D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 05:56:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.868.1765259781435105011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 21:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nT6P0Gc6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765259781; x=1796795781;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qtN7syngCK/liBBKcaCC+g8DNul7JcB60DJcKPBKwdI=;
  b=nT6P0Gc6x7RxlGG+iPJEiRdlA5Izl7JSDqmisgkaF7qQRBay+I5Cx7j7
   Hriu6xjlTRwAYyfmiFRlxTgS9OPpW/4NceCkUWXc0Ph+mkY5v9cmETSnD
   S7fg3/b1B67ymc6aYs3H8syjkT47xyJKh6dgrk96pdA1BfdI0g4CVI9o4
   HV0IwfsdUb4oE0j2YeDCXKjox5DP0MpvUB5vKq1QQr0HEkycCdZjgx1b9
   SOMiqTTSGybfi4IKeJnZ/NvYfw68Hc4QPqU7OJe0Sypi71T/W6Rd7qn2F
   2t7gcIJUWUUPS3MCu6xSqgkZKypu8ibGkUwfKAHQvuDAzRuNqSiWK70gd
   Q==;
X-CSE-ConnectionGUID: ANQAUl+DRe6AF06eq6zu/w==
X-CSE-MsgGUID: yWpmvrc1RtOkZiI1ln1HzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209385626"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="209385626"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 14:56:20 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 17A9025F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:56:20 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C17401800BC6
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:56:19 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9218318004CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 05:56:17 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 3/5] poppler: upgrade 25.11.0 -> 25.12.0
Date: Tue,  9 Dec 2025 13:56:00 +0800
Message-ID: <20251209055600.22341-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 05:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122396

Change log:
  core:
   * Be less strict about the Page Annots object being correct. Issue #1641
   * Fix rendering of some annotations. Issue #1642
   * TextOuputDev: change default line ending to \n
   * Splash: Performance improvements
   * Ignore color operators when painting a Type3 font with d1
   * Internal code improvements
   * Fix crashes in malformed documents

  utils:
   * pdfsig: specify search order for NSS certificate database on the man page

  build system:
   * Switch to C++23

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../poppler/{poppler_25.11.0.bb => poppler_25.12.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_25.11.0.bb => poppler_25.12.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_25.11.0.bb b/meta-oe/recipes-support/poppler/poppler_25.12.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_25.11.0.bb
rename to meta-oe/recipes-support/poppler/poppler_25.12.0.bb
index 7f079ec641..71bff6d70d 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.11.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.12.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
            "
-SRC_URI[sha256sum] = "63f155142b77349e2bccaef148e754e7506ab1641e713b83af4f54a8f8b15369"
+SRC_URI[sha256sum] = "c18b40eb36b1a0c5b86e29ca054bf0770304583da4f2cdd42fe86eca6a20de48"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.43.0


