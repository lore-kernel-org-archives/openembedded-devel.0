Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A25DCFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:12:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13195.1764061935140671735
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hLubHMKQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061936; x=1795597936;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=falKGaP0ZN4wmmsvu9jB/jtv0KB+zOHNozxM9bOIsmE=;
  b=hLubHMKQ0yEr0De4QsB9xh+55QPjGB3JqROBwtzrPamcN6PhKlYJ2vo+
   dTb01h9MdVUEOQII26ZAmWI/ac1IpTqD3vSS/DJCe+1J2kww/9K4U3QXq
   pU93EassuQDlYm4dLIxpYwp4cHRJ1sRQDyBiu3uhBdrisw37dYTKqO1S6
   0Uo5QUpqFY6tzYgKBswLg4GuWsVEqqN2VCGUGAHVYnXHmlKC6wE2nIzJw
   8gHpSCVuyUGBPeznd9Eg126ydVEqhweGDJlOmx/6+3m5zVLRxWntuJJWG
   M/AI4KQkO2tub9OX2lNoJtdU0B26B6GJEZONk9Q7CpKQH0uBv2pERd4zR
   g==;
X-CSE-ConnectionGUID: SFUDuxYYShCTuvc+f8X6DA==
X-CSE-MsgGUID: tozXfeI+TYS6PnBpiCsSwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="199293538"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="199293538"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:12:11 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E96A01471
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 933C01C002FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4C9A014001E8;
	Tue, 25 Nov 2025 09:12:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/26] lcms: upgrade 2.16 -> 2.17
Date: Tue, 25 Nov 2025 17:11:34 +0800
Message-ID: <20251125091156.1376-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add fuzzers foundation. Many thanks to Amir Montazery and Open Source Technology Improvement Fund (ostif.org), Google, for funding that.
- Add ability to disable building tests in meson
- Fixed gamut warning not working on certain conditions
- Mac sequoia added to test beds
- Add the possibility of duplicating a NULL context for cloning defaults.
- Small cleanup of CGATS parser
- Change computation of profile ID to follow actual ICC spec (yes, they changed the spec!)
- Allow to apply color management on memory blocks > 4Gb
- Get rid of samples on meson compilation
- Increase coverage of premultiplied alpha.
- Bug fixing and cosmetical work on sources.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.16.bb => lcms_2.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.16.bb => lcms_2.17.bb} (82%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.16.bb b/meta-oe/recipes-support/lcms/lcms_2.17.bb
similarity index 82%
rename from meta-oe/recipes-support/lcms/lcms_2.16.bb
rename to meta-oe/recipes-support/lcms/lcms_2.17.bb
index 9422c7330b..616bb323c0 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.16.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.17.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51"
+SRC_URI[sha256sum] = "d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074"
 
 DEPENDS = "tiff"
 
-- 
2.43.0


