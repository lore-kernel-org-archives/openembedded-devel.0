Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FE2C3ABAB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7601.1745900150871326977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kpuizcHF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900151; x=1777436151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NbCkjGnasQbrFoeFPoszNydgcHUY4j3GGgS1hwYgrd4=;
  b=kpuizcHFTy22rAXkoAOmbrQDxjpvBH+2ogWh9HcLSD2a/Z4au8ug7v7S
   La470V1ioS7yIP7wfgoLAneuzoUt2UfQRgeUE2bvBAMUfGmKzQruG5V6w
   S2kNEmxQRmG2HOSU6ilS55bGSNEL6KvsaqA+VkDWnzxMdyubS2DDEoem2
   CttjEqOHdn0IAoAYKmC4NeFAW4MeIZLOzSo229RdA7/xrlePCBW3kKtx2
   Y7yp257lv7ONnGr+2KRKXt1ZPTApZV/3CX9ez4Vxbvi7Fqje2ggl8oJH+
   zKtU2e8ZuoO7U/x1sZfoz9dYhhuHFUnXquJEZ6JEAEJXxxRM29M8baapW
   Q==;
X-CSE-ConnectionGUID: a2A8yM6pRaCTqDzym9G1pA==
X-CSE-MsgGUID: jRtfmVLaRMiQJKU2D9+sEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="198356477"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="198356477"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 34DF2D4C3C
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3914D4BCC
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:46 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 74A9E1A009A;
	Tue, 29 Apr 2025 12:15:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/23] gtkwave: upgrade 3.3.121 -> 3.3.122
Date: Tue, 29 Apr 2025 12:15:18 +0800
Message-Id: <1745900138-26424-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117208

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Buffer warning fix in fstVcdIDForFwrite.
- Warning fixes in vzt_read.c and fstapi.c.
- Prototype fixes for port to gcc15.
- Fixes for tcl9 compatibility.
- Added fixes for --saveonexit command line option.
- Fix for convert_real for TR_REAL traces.
- Fix for popen_san() in vcd2fst using fsdb binaries.
- Added fstWriterGetFlushContextPending() to fstapi.c/.h.
- Reenable wayland code for primary and baseline markers in wavewindow.c.
- Unnamed scope fix for fstReader.
- Opaque pointer warning fix for fstapi.c.
- Remove broken pseudo-2D array support in fst.c.
- Fix in fst.c for signals whose MSB/LSB/len mismatch.
- Libfst #15: fstReaderOpen should not fail on empty FST file.
- Fix crash introduced in 3.3.120 with legacy VCD loader caused by "Fix case of missing newline at EOF for VCD loaders."
- Fix in fst.c for duplicate string values.
- Remove duplicate string values from adjacent value changes.
- Libghw add from upstream for ghdl_rtik_type_i64.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gtkwave/{gtkwave_3.3.121.bb => gtkwave_3.3.122.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.121.bb => gtkwave_3.3.122.bb} (94%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
similarity index 94%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
index 3f94933e6a..43367aa415 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.122.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/gtkwave-gtk3-${PV}.tar.gz"
-SRC_URI[sha256sum] = "54aa45788d6d52afb659c3aef335aafde0ef2c8990a7770f8eaa64e57f227346"
+SRC_URI[sha256sum] = "6201b5f93dcaeafa92fc0ec4ad4baeaf60acf16fc8f019bbf061cf4ebf27938a"
 S = "${WORKDIR}/${BPN}-gtk3-${PV}"
 
 DEPENDS = " \
-- 
2.43.0


