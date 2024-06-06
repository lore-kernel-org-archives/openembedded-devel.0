Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD7DC2B9FB
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9830.1717664821953039349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZTfELm76;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664821; x=1749200821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IAAhEQQlNQdG5Tqdumi5cxBhqI1wFvJQcI8WpoBEgh8=;
  b=ZTfELm76m1pSO5MDcko8eD/A2BPisJXf+5NDD2hmnYEqRKv1E5y2M9JF
   3Kas8T/4/bzR+Ww1AGXeWLsjmH9W3plQmZLhcGr/aRDh/P2JBdh7bOTx5
   QsrNN56fjc2tqlhaAZ1VOAnAExk47qsL8Aa96lPXkxvSrfPOngDY942MR
   gcG8IXfuNMDjXch/bES88CZG3l8n+gl4TwRk5lykq6x3NOGXWmeVWt+i4
   StZtStXHYb9+yiCnUgd0wMxKSuGW2RUGW/MiOKjyZqDCEdiRLK3dgi9Xa
   AwhiJEnH8S6esT27M2ucpg989TB/EL9rrJoNeg5YVy1c91WzPQFjlAeOf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="150462582"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="150462582"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C0D0FADA61
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 10A38D0900
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 86E2620081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 338941A000A;
	Thu,  6 Jun 2024 17:06:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 18/36] libcompress-raw-zlib-perl: upgrade 2.206 -> 2.212
Date: Thu,  6 Jun 2024 17:06:17 +0800
Message-Id: <1717664795-13902-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--0.161100-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8AtH/ey8zRp8SiwizsgluQdTe
	gpK7QnXFvQZuQp/ypDOuLFZZYlisfHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAU/JImdeFQln7vk3
	qW4kn7Rlc1psLLFRG+Lb/5wZsHRhkIdgk5SDXU7gytOEsjjFd1PwSr7EMXyYH4e1buOlKTxy0EJ
	6nGZ4PA7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110726

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
  Copyright year updated to 2024.
  zlib updated to 1.3.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-zlib-perl_2.206.bb => libcompress-raw-zlib-perl_2.212.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-zlib-perl_2.206.bb => libcompress-raw-zlib-perl_2.212.bb} (78%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.206.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.212.bb
similarity index 78%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.206.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.212.bb
index 47fe8e003..d79a710a7 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.206.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-zlib-perl_2.212.bb
@@ -6,11 +6,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Zlib"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=45bba5fa4937353fd4f505fa2108a6bf"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=17;md5=1bb3479faca6bb2086c05a33a934f62a"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Zlib-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "46785a6a383a1c843895b7f9f25d5d759e7c305159f9d1e04a3604eb74c77374"
+SRC_URI[sha256sum] = "6d9de0c11921fd520dfd99a3f6b0ca9f1fd9850274f8bec10bbaa4f6803cc049"
 
 DEPENDS += "zlib"
 
-- 
2.34.1


