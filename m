Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9F3CD129A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.38879.1711982115728890440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m698kF4u;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711982117; x=1743518117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cg7Q5nlQeX7pkgeNRp9vTYg4lb2tU4ViQ7Q6/15hmag=;
  b=m698kF4uzdx3XDBWQZI11hGEVF4qcZIItfnjqfoK1T+UDLEhhwealhau
   vCVAUqr9hrJahy+CEE1e6JfKOs7JyUfl+iBxw/9ZB6urR8bnUZd5wL3wU
   JCm7oHA73mFzBBCzatHmgo5J8zuKYLTDTsrmgkCFS0kkfdCyE4eLX8H0u
   yuXiKcG/Pw5zeLV1HT+BAj12ewnsS7RG+jOYYaSFyIGugjXaE4w3tzUdU
   mi0CgFl2EG++DqNaDKG4TC5LPnFFKMl8Ah5lFGEU62R8WMPFosOl+qIqB
   oqIIVjyfdHrCkvHGQVAA+vw+5Gm2IOihx94avFcp+nm7aECvpHbqSqhWx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133053354"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133053354"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:35:16 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 337645AF62
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FC73D620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04BF02009325C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9FEDD1A000A;
	Mon,  1 Apr 2024 22:35:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 05/47] libdeflate: upgrade 1.19 -> 1.20
Date: Mon,  1 Apr 2024 22:34:22 +0800
Message-Id: <1711982104-16711-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
References: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-2.224800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mreErBoNg0DmLIgofMgahPrWeI
	Nzdk9e3E4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat0546B5jk2TXXjFIy/
	Fg1mRnqLtAdDE/EtBJIAy6p60ZV62fJ5/bZ6npdjGVuWouVipcrs4LpEchVUmhHVq5gh2WAls98
	jpwUnh5BV6Ov7gYaodGMTNvbd5NcbbqVZQRcoTrne0lNej6fBJLt6TeY+7tI+ryeZeEQ+Jx/6/2
	/nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Improved CRC-32 performance on recent x86 CPUs by adding
  VPCLMULQDQ-accelerated implementations using 256-bit and 512-bit vectors.
* Improved Adler-32 performance on recent x86 CPUs by adding
  VNNI-accelerated implementations using 256-bit and 512-bit vectors.
* Improved CRC-32 and Adler-32 performance on short inputs.
* Optimized the portable implementation of Adler-32.
* Added some basic optimizations for RISC-V.
* Dropped support for gcc versions older than v4.9 (released in 2014)
  and clang versions older than v3.9 (released in 2016).
* Dropped support for CRC-32 acceleration on 32-bit ARM using the ARMv8 pmull or
  crc32 instructions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdeflate/{libdeflate_1.19.bb => libdeflate_1.20.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libdeflate/{libdeflate_1.19.bb => libdeflate_1.20.bb} (88%)

diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.19.bb b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
similarity index 88%
rename from meta-oe/recipes-extended/libdeflate/libdeflate_1.19.bb
rename to meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
index 11cdb8290..f0a966f2b 100644
--- a/meta-oe/recipes-extended/libdeflate/libdeflate_1.19.bb
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.20.bb
@@ -9,7 +9,7 @@ DEPENDS += "gzip zlib"
 SRC_URI = "git://github.com/ebiggers/libdeflate.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-SRCREV = "dd12ff2b36d603dbb7fa8838fe7e7176fcbd4f6f"
+SRCREV = "275aa5141db6eda3587214e0f1d3a134768f557d"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


