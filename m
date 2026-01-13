Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B68D2502E
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55833.1768299860680141455
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VWwfNaLB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299860; x=1799835860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uC/+ctpIwISUptGjySqAfIUkQKkZ00SJn+PyOy2cLjo=;
  b=VWwfNaLBjRrsbBmEpD2xobPrUK067/z4Tyz3GJ4QAKAOuiWi3lQIjGfr
   o2l3QpCyMS0swqFz9RMLBb3AYcQ3215LXeZpQc/CE7MVDBuCVJN3FXaWN
   LGMpfkbYImuiS2uMm6UGLaYBcTJ39azZ3vQ6acSLZNkQA9gFmZz5ANWLS
   91TJ10ctWXLV5PLhUKwdaf+HEVsh56h1eCU8Wk+3DcopgG7mROd76nmBe
   6Pz8qfzG+aXqeIW30VZA5PsJ9mZZFTIomGGTUPE62o6YfNayuHRQL1VMW
   rSaOocY3HPTp5LGj04dP4k9/CS2U0sRmh0r0xR3ohc/WpPQVVHlyAzZ04
   A==;
X-CSE-ConnectionGUID: uXPJ7QPySLSiBCWna5MKdw==
X-CSE-MsgGUID: dvD6yjYZTNaUsva152a6mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225618002"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225618002"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:18 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 00C33C00203
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AD3E9140035B
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id DAF981019048;
	Tue, 13 Jan 2026 10:24:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/22] lcms: upgrade 2.17 -> 2.18
Date: Tue, 13 Jan 2026 18:23:17 +0800
Message-ID: <20260113102334.605-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123411

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add an extra check for completeness only.
- Fix a signed integer overflow which could trigger a FPE_INTOVF
- Fix Microsoft'2 MHC2 private tag
- Added projects for XCode 26 & Visual Studio 2026
- Added documentation for PCS illuminants and chromatic adaptation
- Check for a possible out-of-bounds in softproofing transforms when using cmsCreateExtendedTransform
- Fix for a out-of-bound read,  issue #522
- Add an extra check for out-of-bounds read when misusing a support function
- avoid divide by zero, special case from spec. notes on CAM02
- Fix CGATS parser bug when number has a "+" sign
- Fix a typo when handling a special case for BPC
- Fixed a loss of precision when Lab16 is used as input color space on integer transforms
- Fixes hypotetical corrupted pointer in non-happy path. Cannot happen in real world
- Fix a theoretical memory leak.
- Add support of localized descriptions in v2 profiles for MacOS
- Mark some tables as const
- Make the param of cmsCreateLab4Profile() to refer to the media white instead of the illuminant
- fix a warning in unit tests
- Remove redundant check. Fixes #497
- Update autotools
- fix plugins soname + add oklab to transicc (experimental)
- meson: ability to disable .so.version libraries
- Fix black point detection when using darker colorant.
- testcms2.c: Fix incorrect string comparisons
- Fix CICp tag size.
- Fix broken linkicc
- meson: Bump minimum Meson version to 0.52 for visibility:hidden
- meson: Disable unused fs import
- Add a guard against a wrong use of flags
- Fix for #469 heap buffer overflow on convert_utf16_to_utf32()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.17.bb => lcms_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.17.bb => lcms_2.18.bb} (82%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.17.bb b/meta-oe/recipes-support/lcms/lcms_2.18.bb
similarity index 82%
rename from meta-oe/recipes-support/lcms/lcms_2.17.bb
rename to meta-oe/recipes-support/lcms/lcms_2.18.bb
index 616bb323c0..79e4a6f694 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.17.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.18.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074"
+SRC_URI[sha256sum] = "ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347"
 
 DEPENDS = "tiff"
 
-- 
2.43.0


