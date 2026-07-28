Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A700C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:04:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5594.1785218642207532273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SeGaDNZb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218642; x=1816754642;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yb8zNPIx/kRnWmtxiG2yTD/RqpiVVpRdTo5g3AuI+Y8=;
  b=SeGaDNZbvvyS0VJvutRYvMiBee7bw42rzLrBfgh9r9boGCnyCb7c9UHj
   o4D4YWmyRmug11SawmN3wljoOJ5y9AlQGaIWl6WQC35+syPXKET6XKc1i
   ii5R0hUV09yJ/aArEaQPqgSdu5VOAz51jcb6odkKKF+wWEFuPiv4p2XWD
   AqFYa/XoaVR/6VBFBS1uE/Po/ujetzIEz2ZIl8vhuJaDcXZkELPKJxtS1
   8yS148FRhEV/UX+Jwh7PSigqz0JRSlRa/bTUYptEsnyXpGT4WuacmiEhA
   2Chka1c4NPHwNE2snLEFf/eMiplC0IEgvqfTpQq2mJePYTdZubfxYaa9g
   g==;
X-CSE-ConnectionGUID: ncpUiycGRwW9yKO+8PDLbg==
X-CSE-MsgGUID: fvXSqI5aRpy4NXgbO0N9kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="252386296"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="252386296"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:04:00 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 357E21000361
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:04:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E0B1818ABD25
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:03:59 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 38EC01019074
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:03:57 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libraqm: upgrade 0.10.5 -> 0.11.0
Date: Tue, 28 Jul 2026 14:03:56 +0800
Message-ID: <20260728060356.759-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128468

Update the license checksum as copyright years updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libraqm_0.10.5.bb => libraqm_0.11.0.bb}  | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libraqm/{libraqm_0.10.5.bb => libraqm_0.11.0.bb} (46%)

diff --git a/meta-oe/recipes-graphics/libraqm/libraqm_0.10.5.bb b/meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb
similarity index 46%
rename from meta-oe/recipes-graphics/libraqm/libraqm_0.10.5.bb
rename to meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb
index 8eaaee4492..12b1d20fee 100644
--- a/meta-oe/recipes-graphics/libraqm/libraqm_0.10.5.bb
+++ b/meta-oe/recipes-graphics/libraqm/libraqm_0.11.0.bb
@@ -11,10 +33,10 @@ BUGTRACKER = "https://github.com/HOST-Oman/libraqm/issues"
 SECTION = "graphics"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7dc444a99e2824eac906383266fe4fa6"
+LIC_FILES_CHKSUM = "file://COPYING;md5=af4502a870b471d3ac78abacb7abfa37"
 
 SRC_URI = "git://github.com/HOST-Oman/libraqm.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "3a6b891a3db0e0db1364aa38088422f68d8d81e6"
+SRCREV = "08ee1537e63f93bf926498e12b12ed15ee383216"
 
 DEPENDS = "freetype fribidi harfbuzz"
 
-- 
2.43.0


