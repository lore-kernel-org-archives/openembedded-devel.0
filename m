Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486B4CD1296
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:33 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.39470.1711983091759055255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bDRPHfZ8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983092; x=1743519092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cg7Q5nlQeX7pkgeNRp9vTYg4lb2tU4ViQ7Q6/15hmag=;
  b=bDRPHfZ84BOm+ceavIcDLZjg34TJNU2xSltTSkRZ09UnRTJn1WypKanW
   KjvnCS+DNY3DogZy8CEnH8kM0Vsp5TFwFgkYt/8B+g2ozreo6WoSPhqa3
   ORdNfINRwBC53Shl9SvYzyNp5yGHMgVHre1nRoMLM/SEoxeu8JJweAOYm
   5vCd3m02/K85m3Tyx0Tbe9rQ7dyJ5sHV6CRwPVP5C90jqcj4yAmY+mvO3
   bpBC8wfbE8QzcXUNQvZc3LCcaJGDtWZT4pTWI/jShAWhikHnAf9O/iisv
   2TF0eEIYHU9TE2hOaeTS9jWwvgskMSbhl2eN6+1nZTq2l0zZVvniC9Ear
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154135859"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154135859"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CFCB4C36E1
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CD864D620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F2D820093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 256111A000A;
	Mon,  1 Apr 2024 22:51:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/47 v2] libdeflate: upgrade 1.19 -> 1.20
Date: Mon,  1 Apr 2024 22:50:37 +0800
Message-Id: <1711983079-16849-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109722

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


