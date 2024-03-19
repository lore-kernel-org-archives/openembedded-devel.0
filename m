Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B0BC54E77
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8148.1710827176933255811
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WO/yC69f;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827176; x=1742363176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9gZUOq1dfQXA5UPCHAcvHr+clzlM+sDxRNYe1lyTMUc=;
  b=WO/yC69fgqylSGNPNr23X8mmD+JL0Z01w2czqrnzrER2kPjp7dO9tEPe
   JSVvOZORcZ2fBPLB7OK2IFien518tq6OtXdQPVCYZeAvSh6FRCfbuOR2C
   rtCXKo6Ruw5y/4ddSoMytfyF7xyHP/onIENtimiVHLh6avWAQ1BKqS5el
   xHtPV5uFGQ1GR9vpzDeOlaAAifiJIGA6OFggWrXRyu3Anu9HRYnmXJFM2
   SgaP1fLtGXX5OObemg8aLAgb/XvR9nNWAe79NNR60OAXpTrf6u53iWBlH
   a1y1gwRYcREL6Ge91D0c9UHmOWimSfdhjnuQSQowAnxvRnYVm+Sye7G6d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="141150140"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="141150140"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:13 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 216D3D3EA9
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C8F0D4241
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0415D2235E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A1EDF1A006D;
	Tue, 19 Mar 2024 13:46:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/50] libopus: upgrade 1.4 -> 1.5.1
Date: Tue, 19 Mar 2024 13:44:58 +0800
Message-Id: <1710827139-30056-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--1.117500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/ySAWHOR37+ATLN3VUPmiykOcLFKhI2Zz6wi2
	JCCmfQi+4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054/67wpKrIJNBK6H
	Qs3v+pqMWm/gAtjCd7AYUFsN5WfiFzmzFHFKmrObqcdt4G7kuea4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJV/Hpl/zcOjl5MIx11wv+CPGVuWouVipcr0BRkWtRiDXUtExLLxlZYsUdXlAY13MGEnXB
	3mTiZdRul9i7RZYky+pt3ykgNwz8opbVHsVhS3MLP3cqKxlVQZ0P2gM7yo3/f6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109427

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2023.

Changelog:
===========
-Significant improvement to packet loss robustness using Deep Redundancy (DRED)
-Improved packet loss concealment through Deep PLC
-Low-bitrate speech quality enhancement down to 6 kb/s wideband
-Improved x86 (AVX2) and Arm (Neon) optimizations
-Support for 4th and 5th order ambisonics

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libopus/{libopus_1.4.bb => libopus_1.5.1.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.4.bb => libopus_1.5.1.bb} (93%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.5.1.bb
similarity index 93%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.5.1.bb
index 127c8be18..4ce6dd202 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.4.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.5.1.bb
@@ -6,10 +6,10 @@ technology from Skype's SILK codec and Xiph.Org's CELT codec."
 HOMEPAGE = "http://www.opus-codec.org/"
 SECTION = "libs/multimedia"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e304cdf74c2a1b0a33a5084c128a23a3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4b365c2155d66e550e1447075d6744a5"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[sha256sum] = "c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f"
+SRC_URI[sha256sum] = "b84610959b8d417b611aa12a22565e0a3732097c6389d19098d844543e340f85"
 
 S = "${WORKDIR}/opus-${PV}"
 
-- 
2.34.1


