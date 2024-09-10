Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE91EDE9A5
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:32 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.18329.1725959003028888389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NP6YkAfO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959004; x=1757495004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5meG1lirnWfpsUtqw7aSOD9KLKfXYW5BiLEm8+pFOAU=;
  b=NP6YkAfOPF+Y6741FISybiy0mhSqgW76AFzEUBJcENZNfAkCj78Jkksj
   5DbJnCSVC2Av26wGWJxxWukh206rwzrmVLsRlm3Dl82Ixu32UnGMLbnsD
   7/6lj55xEv6uHJZCy6Z838TfCht11K/AbPfSPgInRm3ZmN6smwzBi1cZ9
   U4qsoG45ihEBYYkjgnn3NRS7F215GbPK3l9wabloeoWeYpdZ8JowJvDtK
   tWr3HlyPjhm8nXiSZFdJvfcUWa6FRBG1d4cVeLMe6ocG+2kmQbO/oRNFq
   qDaDTTsSXzeowQdheA+7HX87E/qjrOtpUuSKtPw+CUAXcydmzxNlmSUQC
   g==;
X-CSE-ConnectionGUID: nkkhXHidTSKjGfc2//EwSA==
X-CSE-MsgGUID: z+ISrAB7QlKPB5VRTJj6Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="172474618"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="172474618"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 85203D800D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C5084BF493
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 58469200894B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B9871A000B;
	Tue, 10 Sep 2024 17:03:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/42] libbpf: upgrade 1.4.5 -> 1.4.6
Date: Tue, 10 Sep 2024 17:02:35 +0800
Message-Id: <1725958990-5719-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--1.134200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrWaKvOaBFthR4YeSlHZYFoqIL
	whR702Zp4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKrMZ+BqQt2NrBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6JkA75kIzNpGxFTPUQSQY9FWeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZBZqHnL/kRNOiIKfZy/HU8ch2Av6DimVRigRy8zuZyyWP8A4K5ssfXrRR9rlkD2wpnee
	WpOLWQqdt0gn//20yvvY7m7jdz7EtctSarHnY/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112192

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- BPF skeleton forward compatibility fix
- BTF endianness inheritance bug fix

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbpf/{libbpf_1.4.5.bb => libbpf_1.4.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.5.bb => libbpf_1.4.6.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
index 5ee770148..914ac9f08 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.5.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.6.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.5"
-SRCREV = "a5086158dc90593b4e4b3ddbafab9bdaf9ec97ef"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.6"
+SRCREV = "fdf402b384cc42ce29bb9e27011633be3cbafe1e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.34.1


