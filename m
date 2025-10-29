Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700E1CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.27237.1761696929984963551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RebAxl0i;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696935; x=1793232935;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lCtLU3HKPYyAVcrAJ1yCoOG+fO2PHfaOO3p07tgEqjM=;
  b=RebAxl0iNOjbEj6s9ZFtYXo2MLw1yKnBFQy1Y+wSTnYPN3kDzdvg3sPn
   lEzSeNz3C2DgUrhb+9CuPDslARXguGRaOxumaouZtFbPazHYlzaURokUU
   ZqIuowNkyP2GUsaJ115wpSJZWj32qzs94y9XotHrE1IIGUvmazQBcMJ66
   jC+B94i4BKSDt6wtUv4Qns5TX85HZQL9Tc4NVJGREs1awbDBkZE8JeCxm
   3IhmXPfZdK19S0mx0DUMdnUAVlzozV8f6NQTZeehfavCa1U5klAL/ms6C
   Yhjt/Ip+9FuWZTTQJFizmlD2wvUpk/bg2d/4Eb5oL8L1SFkVZZWgx2Zt0
   A==;
X-CSE-ConnectionGUID: PP/fuJCXTh+PorsdepZjsA==
X-CSE-MsgGUID: PR2imme0RkymV45S4ELxyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216775287"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="216775287"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:35 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 50A261C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:34 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 09F091800523
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6938A826FD3;
	Wed, 29 Oct 2025 00:15:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/32] libio-compress-perl: upgrade 2.213 -> 2.214
Date: Wed, 29 Oct 2025 08:14:43 +0800
Message-ID: <20251029001505.528-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121116

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...io-compress-perl_2.213.bb => libio-compress-perl_2.214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-perl_2.213.bb => libio-compress-perl_2.214.bb} (86%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb b/meta-perl/recipes-perl/libio/libio-compress-perl_2.214.bb
similarity index 86%
rename from meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
rename to meta-perl/recipes-perl/libio/libio-compress-perl_2.214.bb
index ce764334f1..bb49841422 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-perl_2.214.bb
@@ -14,11 +14,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=254a3b5756814db98ee483c8974736c6"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=6af707e7b2ec1d8f995b973c427fb244"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "ae4d01ae574e4568c5f2fb0573e74631e2720b71ad3bc5a3ffe9480f1cb9a851"
+SRC_URI[sha256sum] = "0cfbc4b4ac9b28f7cbf22f114e09c9a49ace9e0b6c3778432afa2cde55512d69"
 
 S = "${UNPACKDIR}/IO-Compress-${PV}"
 
-- 
2.43.0


