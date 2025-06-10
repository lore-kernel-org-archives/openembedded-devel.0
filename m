Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AB0C7114B
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.78429.1749526421768345370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gHurcaFx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526423; x=1781062423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5oXqnbvEZhqlHfxKZBBx4Zbm1a5N3jkBxrTA5TFgLkE=;
  b=gHurcaFxJw6wa5lFMaEdtM5UYbWz1pOBe5w1VvE9OlJkslgJ853xEtty
   pZBZbc5QRj00UdPioCnzRqYm0RqJmrwA/mIZZX0gu6dcP6+VL0UCzi6RN
   PLIofPoYwynnwJS4OoKMYbgCSkUw4klwoRbg2S6J26RmMzS53ek3j5Lqe
   gB6Yc6SZu5GzPc0bI94XJeZYxVPRvi7tfqvdPRFjVVRPdbDaElsOtWwPp
   MACzsG+eDuO+tuP9/IV+vy8an/QYTOebkwPduymU4/hb50o1G1ta8LfjC
   hC66ra59BJ8xtHVzBOVc6y0edlpFS1tkPwrJww+rasHSoxcQDD8//DARK
   w==;
X-CSE-ConnectionGUID: JMJrw4/zTCmso/qyqmIGAg==
X-CSE-MsgGUID: /jkbDVkvRmWxaSCRpTxeIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="201453582"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="201453582"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:40 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E655BD8033
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 83423BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D2091A009A;
	Tue, 10 Jun 2025 11:33:36 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/64] googlebenchmark: upgrade 1.9.3 -> 1.9.4
Date: Tue, 10 Jun 2025 11:32:35 +0800
Message-ID: <20250610033330.924-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117803

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Update build instructions for Visual Studio
- MaybeReenterWithoutASLR(): be more cautious about argument types
- Fix MaybeReenterWithoutASLR() in docker
- Enable Google Benchmark to run in WebAssembly with filesystem disabled
- wheels: Build Linux ARM wheels natively on ARM runners

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.9.3.bb => googlebenchmark_1.9.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.9.3.bb => googlebenchmark_1.9.4.bb} (90%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.3.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
similarity index 90%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.3.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
index 3eba27c3c1..8fda2990d8 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.3.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.9.4.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "299e5928955cc62af9968370293b916f5130916f"
+SRCREV = "eddb0241389718a23a42db6af5f0164b6e0139af"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


