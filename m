Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03FC6CD6E46
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:13 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16949.1779875349424743691
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=srGsVEW3;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875349; x=1811411349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jzn1acQFaHxLwkmbp25jKAgamz8f9ze49dIGQH3jxss=;
  b=srGsVEW33TYrTRikDaKR3UICrws09LVnRiLLoJk466cntIf9UdEC0xwF
   6Y3Fvbx0DXyGCukukDWBlu9XKRQt+iPbVnSSzoWRuFrCGYMjbEqdvKxtv
   Y/9Yn1MLUcjrrSAha5Q2YUMLfm3BHUpLqh+KV0V7gcyNkPN7dDYyCgXH9
   ARI7G4MAxDNS91PDws6HBO9hNwemlg+r32c2PQRVDbKIqn3NzkRf6uwfn
   rxjTveVXV5yodadCSV1QadUKfhLTxl7WRuF+xjAWJmtSfw5tVCWozZgqO
   p3G+QnPxHVdD14AI+Jm2zgtQu1T5Mzkb6f2fVnpXko1z3h0NGTg5/GAq/
   A==;
X-CSE-ConnectionGUID: oev0yVSrRKedLDjgFd9u+g==
X-CSE-MsgGUID: TVWVAAVLSf2vw4McT2vLGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="219714740"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="219714740"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EB5C21C000A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:07 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9A7CE18915F6
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id AA1BC82A2CC;
	Wed, 27 May 2026 09:49:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/56] python3-libusb1: upgrade 3.3.1 -> 3.4.0
Date: Wed, 27 May 2026 17:47:39 +0800
Message-ID: <20260527094805.2039-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127237

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix Python 3.14 DeprecationWarning caused by implicit ctypes layout when
  using pack = 1.
- Bundle libusb1 1.0.29 dlls in Windows wheels
- Fix a licence inconsistency: the old pypi classifier was refering to the
  LGPL2+ instead of the LGPL2.1+ .

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-libusb1_3.3.1.bb => python3-libusb1_3.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-libusb1_3.3.1.bb => python3-libusb1_3.4.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-libusb1_3.3.1.bb b/meta-python/recipes-devtools/python/python3-libusb1_3.4.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-libusb1_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-libusb1_3.4.0.bb
index 1c2d60e6b8..1956e5fe54 100644
--- a/meta-python/recipes-devtools/python/python3-libusb1_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_3.4.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI[sha256sum] = "3951d360f2daf0e0eacf839e15d2d1d2f4f5e7830231eb3188eeffef2dd17bad"
+SRC_URI[sha256sum] = "9cf5638506d54f21bf36550d97ea63189111a23c4d8078f630103a2052135f45"
 
 RDEPENDS:${PN} = "libusb1"
 
-- 
2.43.0


