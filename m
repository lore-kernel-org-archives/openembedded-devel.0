Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B113CCF9F2
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.27235.1761696927747319639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GC2Sm+MI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696928; x=1793232928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iIvwoW4PBHvD0Mmg6G2fgMsBrv7t3unKO6kPn6CUgos=;
  b=GC2Sm+MIOs2/S9iphzXixN+GzXeDtXu9JcGMjqLDoc0DOCHdGwpzjX7a
   XHS1H/WuOhzfgemrkV1VlL1Bm1WxIQHPanG4jhWGWwkdCcbeOdmKj3PR+
   tAwk+/ynniiRND8Cn63IU3ZRT5ZL4zSAJIxMUU4DHfJJhqayUzbfvHAGL
   ROvsJqgnWngTYvNeLXxPY9hOs82c4yjR/0O1vYyRqFImOXY94Z8J+iByx
   K1Oep1woSx9FcBTjbT6c3Oy79fq9zhhVXUpXK0/WQP0mTf1fdhGpr7dBT
   em7Uekf0KqMvmF5hsv6Etj0ZFpOHmaUPyzOmA+wzkrIQ2tHX8jKHXTDpA
   g==;
X-CSE-ConnectionGUID: YfHkxg/gReu8NpQJGicOKA==
X-CSE-MsgGUID: BOxVACg+RGyTgsBnaov/ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="205948834"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="205948834"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:26 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1C1A0100034D
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:26 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D7E5018019AB
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4221482C0F2;
	Wed, 29 Oct 2025 00:15:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 06/32] libcompress-raw-lzma-perl: upgrade 2.213 -> 2.214
Date: Wed, 29 Oct 2025 08:14:39 +0800
Message-ID: <20251029001505.528-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121112

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-lzma-perl_2.213.bb => libcompress-raw-lzma-perl_2.214.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.213.bb => libcompress-raw-lzma-perl_2.214.bb} (80%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.214.bb
similarity index 80%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.214.bb
index 6f18bae7dd..d0b8de0455 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.213.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.214.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2a0fd6d30eaf88289587b776f74c2886"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=db84d74e3df088dfbcfd6b30da2749c8"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "6b979a8347701ced3ac26123d428c1f202b7999850444da19c4aedbb7c862cb7"
+SRC_URI[sha256sum] = "1dcc4448969acad4550376476e3fcd2ed96bfaaae7d9622958fd8f9a1ab4c87d"
 
 DEPENDS += "xz"
 
-- 
2.43.0


