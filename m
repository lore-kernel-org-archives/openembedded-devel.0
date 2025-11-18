Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6DE1CED24D
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8403.1763456945757813106
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SJi1TcM8;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456945; x=1794992945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jjIR679UCRaGPSCQ/3Kvj9Y9gDFUbSM1jwKvG7D2Pm8=;
  b=SJi1TcM8s0v45+HOYSrQZOSfxvmVNlIJ60g+w04Vz/GVub3TI97Dy4Tm
   NMGileFS5SpyL88tYr6bybUBxMqr26fGs9jDpcdsgQCFbLT/UCVlCeaJo
   Mi2EOxxgFWkRQZkaOYU/3++N8r9OYJ0576AiiBEqL8Lz1oXP/+eZH3izB
   5b4gwGSzto/+76nIjYxOTflAuPBRnpvuoFCzwJZd/CZaQ4Vp7lMI2Y/4w
   OlDQop8GxLRCEUt4GcsE0RvFusmhqIg93UypJWi6D7kIVE0k9hGKGzq3s
   h/ouPc5kjgy0CWshxgkpfg/fGazeQCtgThyjscE97AUmmAqCA0OTeKSCJ
   g==;
X-CSE-ConnectionGUID: EstXXtf+RWuyVItuIsz/TA==
X-CSE-MsgGUID: 8hHJ6UDTQ7aarGs2a1YwhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="198455879"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="198455879"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:03 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 2D50D42A333
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:04 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D66F310000F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5455A1400252;
	Tue, 18 Nov 2025 09:09:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/29] lprng: upgrade 3.8.C -> 3.9.0
Date: Tue, 18 Nov 2025 17:08:24 +0800
Message-ID: <20251118090846.1484-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121818

From: Wang Mingyu <wangmy@fujitsu.com>

0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch
removed since it's included in 3.9.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Do-not-define-Mail_fd-multiple-times.patch | 34 -------------------
 .../lprng/{lprng_3.8.C.bb => lprng_3.9.0.bb}  |  6 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch
 rename meta-oe/recipes-extended/lprng/{lprng_3.8.C.bb => lprng_3.9.0.bb} (78%)

diff --git a/meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch b/meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch
deleted file mode 100644
index 5748690445..0000000000
--- a/meta-oe/recipes-extended/lprng/lprng/0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6358561d5bad34f0003ebd415142d504fe53045a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Aug 2020 11:42:08 -0700
-Subject: [PATCH] checkpc: Do not define Mail_fd multiple times
-
-Its also defines in var.c via lp.h this is flagged when -fno-common is
-used
-
-Fixes
-TOPDIR/build/tmp/work/core2-32-yoe-linux/lprng/3.8.C-r0/recipe-sysroot-native/usr/bin/i686-yoe-linux/i686-yoe-linux-ld: vars.o:/usr/src/debug/lprng/3.8.C-r0/build/src/../../lprng-3.8.C/src/include/lp.h:72: multiple definition of `Mail_fd'; checkpc.o:/usr/src/debug/lprng/3.8.C-r0/build/src/../../lprng-3.8.C/src/common/checkpc.c:35: first defined here
-clang-11: error: linker command failed with exit code 1 (use -v to see invocation)
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/common/checkpc.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/common/checkpc.c b/src/common/checkpc.c
-index aa03b08..7334094 100644
---- a/src/common/checkpc.c
-+++ b/src/common/checkpc.c
-@@ -32,8 +32,6 @@ static int Remove;
- static char *User_specified_printer;
- static time_t Current_time;
- static int Check_path_list( char *plist, int allow_missing );
--int Mail_fd;
--
- 
- /* pathnames of the spool directory (sd) and control directory (cd) */
- 
--- 
-2.28.0
-
diff --git a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb b/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
similarity index 78%
rename from meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
rename to meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
index fd20860a03..04376b66ed 100644
--- a/meta-oe/recipes-extended/lprng/lprng_3.8.C.bb
+++ b/meta-oe/recipes-extended/lprng/lprng_3.9.0.bb
@@ -3,10 +3,8 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6570d8d699af1883db9d0e733ac9bfb"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://0001-checkpc-Do-not-define-Mail_fd-multiple-times.patch \
-          "
-SRC_URI[sha256sum] = "694a1747a96385b89e93f43343bf35cee5c8c73353a83814106911c99f09de10"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[sha256sum] = "c92597671f4c7cbe8bb3f38fbc4283354db84c6abff1efb675fa2e120421915d"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/lprng/files/lprng/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


