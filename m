Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC3FC83F39
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:23 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.15849.1752648078231295549
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l96N0351;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648078; x=1784184078;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CquIv4QdRjMplvXMUaFG8emq9uqaHV8JmtVY4wjgG+I=;
  b=l96N0351wNhg96JmpAkJF6RBpamlk1vpkD6EPL012gvndJdT6ODiwg5q
   72pU2KNI18sCA8jpXAzpGz99MGAVQDF0la9E/7/HgvND2nij73K5mL8mw
   VRdLuAo7dZQK9VA5fZ10atzYyGGvHCYI5y+R4lGolzLXwRAjbZmKCwRVT
   mKKucP4sX5PZXo/WWd/pUzaiZnrcRGa1tmN+wqU+L5xya3TIP/BELPYwn
   zfj5YMT2n3TxX11YuwXkzOD47tGf7QD/bYz5af8dJO8o4vKeZROx4nivp
   tbNBFjgGgII1j0rgGeCJYFMCbKs8/sx0gW0DiVuAahm7orc7Tfo+0d0oh
   g==;
X-CSE-ConnectionGUID: fguqWXSMQDCHbhAKcVdQmg==
X-CSE-MsgGUID: UKaXKtFARIeXSshnq/p5nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="207004596"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="207004596"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 953A542A309
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:16 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E56551C00163
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 69D7C1A0078;
	Wed, 16 Jul 2025 14:41:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/14] iptraf-ng: upgrade 1.2.1 -> 1.2.2
Date: Wed, 16 Jul 2025 14:40:52 +0800
Message-ID: <20250716064102.1813-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118574

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- small cleanups: remove unused code/variable, correct format specifiers
- serv.c: fix and validate port/ranges entering/loading/saving
- SECURITY FIX: CVE-2024-52949: interface names: limit length to IFNAMSIZ

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.2.1.bb => iptraf-ng_1.2.2.bb} (89%)

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.2.bb
similarity index 89%
rename from meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
rename to meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.2.bb
index f9e2c7873c..3bfe100138 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.2.bb
@@ -24,12 +24,12 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e2b3850593b899b1a17594ed4cc4c731"
 DEPENDS = "ncurses"
 
-SRC_URI = "https://src.fedoraproject.org/repo/pkgs/iptraf-ng/v${PV}.tar.gz/sha512/44d36fc92cdbf379f62cb63638663c3ee610225b9c28d60ee55e62e358f398a6b0db281129327b3472e45fb553ee3dd605af09c129f2233f8839ae3dbd799384/v${PV}.tar.gz \
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/iptraf-ng/v${PV}.tar.gz/sha512/275a345ffd3ab9578c4d159c3a8667326224b4a58b2e7787c4db518b81973d87c04b4b6c5275a721858d01a9b44a0200f8defc06c6f88655aa38d4fa6146ea1d/v${PV}.tar.gz \
            file://iptraf-ng-tmpfiles.conf \
            file://ncurses-config.patch \
            file://0001-make-Make-CC-weak-assignment.patch \
            "
-SRC_URI[sha256sum] = "9f5cef584065420dea1ba32c86126aede1fa9bd25b0f8362b0f9fd9754f00870"
+SRC_URI[sha256sum] = "75fd653745ea0705995c25e6c07b34252ecc2563c6a91b007a3a8c26f29cc252"
 
 inherit pkgconfig
 
-- 
2.43.0


