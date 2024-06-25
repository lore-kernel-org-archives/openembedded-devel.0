Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04C8C3065E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.166843.1719305815138398035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CDMewkz3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305818; x=1750841818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eVPwLzHazyeSeyiouAOrvEmBN1XItlgHffXVGASlP6M=;
  b=CDMewkz38yyvcMXFaipzFXw8IADLMGnlXsuscyEXkWYkmNTgHdmupSdR
   /f0B5jouOGi8MZ3zifFgxq14DQZfg9lE/0MjcD7IFFYGzHLRBEo4DHnzh
   1EFp4sQSpoFlbryD9yrLGT3A9nlK9aeHROcs936FyyGXEVB0QfYA7z/lp
   wRKb8L21Rv1LH1BINJRcExt1n/nA6bdwuoSx1Hv7oN2Bb8w2hUa+JL2Gm
   COOif4sxdc5OyLnXRXFyBUS0KDdM4jOxVl/KWaX7T+y/i7ZYDaEgx1brr
   hyHYXZ4T4XYinwqZR7jqLnrEfwgXQOsOxeHnJk7ZHItm0nS5f1+V6DIQA
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164920896"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164920896"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B274AD800A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 059CFD52A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 907BFE2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 377851A0002;
	Tue, 25 Jun 2024 16:56:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/57] libbpf: upgrade 1.4.2 -> 1.4.3
Date: Tue, 25 Jun 2024 16:55:43 +0800
Message-Id: <1719305790-11484-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--3.410200-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytx+cvftRH+OixX
	wd9S2XGh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKrMZ+BqQt2NrBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDI3lq3YEgY6JkA75kIzNpGxFTPUQSQY9FWeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNR08OMuSP+vEhXev9WzO37vN5d9OvcR4g5JeVc4UoigYnGDbxokHz/Bcq/D12f/PUxbuh
	b9XcRCWK8ygZy0AVKmt4w9oQNFzYjKgHg/t0KH2U8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111020

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix libbpf unintentionally dropping FD_CLOEXEC flag when (internally) duping FDs.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbpf/{libbpf_1.4.2.bb => libbpf_1.4.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-kernel/libbpf/{libbpf_1.4.2.bb => libbpf_1.4.3.bb} (92%)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
similarity index 92%
rename from meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
rename to meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
index 928482ba3..665585d0c 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_1.4.2.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_1.4.3.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://../LICENSE.LGPL-2.1;md5=b370887980db5dd40659b50909238
 
 DEPENDS = "zlib elfutils"
 
-SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.2"
-SRCREV = "1b357586a7a62db7fe27af4ebe4bdefe6986cfd6"
+SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=libbpf-1.4.3"
+SRCREV = "f8c6e0393d4be665fc0b584266b2a1354a71835e"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
-- 
2.34.1


