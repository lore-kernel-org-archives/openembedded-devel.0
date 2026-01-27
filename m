Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1283BD2D8CC
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:44:48 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7132.1769507081158420318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WBJybb3p;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507081; x=1801043081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4jToWYqJPSm0Gpm1Y/VGwSYAZvVnZpv78WyRnSxvQQo=;
  b=WBJybb3p8152oDLTZxX82blhYgt8xvFOTDzTiEnWxWHJwHxVgTE2B5at
   nEMgFO4m1DD3HENsxwzuORwioV81Thxy/GMpq4Xm9QjTE/p4p13tDk/DJ
   0CoaKrRNqlFU25hkU+A2r81CgLCvK7eS0dSVeCe+NGt/YmMfMM03Yz6N5
   Hr5p8ONs4VREXkxHolRywhUP2bAhnPt3SlGjHcvvNPOV0kUQfVjcaJpY+
   Sj2jgfwaFwbjNDAAahAnt3fKy+tt+QZ8huVgrUz8dyEsNLfoorLE8Xjhe
   XduXfPSEp8ZZjlFQ2pmqIWex7QTbJQZFvonHlCmlBUmCJLUNrSyLmOgf7
   A==;
X-CSE-ConnectionGUID: XBTqoiAWQDa9IFuDl58MDw==
X-CSE-MsgGUID: euBq3092QbmiVG378z4Fsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="206239886"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="206239886"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:44:39 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id B1FC0100034F
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:39 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6A9CD180322E
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id E29042000218;
	Tue, 27 Jan 2026 09:44:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/25] softhsm: upgrade 2.6.1 -> 2.7.0
Date: Tue, 27 Jan 2026 17:43:39 +0800
Message-ID: <20260127094339.1081-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123927

From: Wang Mingyu <wangmy@fujitsu.com>

0001-avoid-unnecessary-check-for-sqlite3-binary.patch
removed since it's included in 2.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...unnecessary-check-for-sqlite3-binary.patch | 40 -------------------
 .../{softhsm_2.6.1.bb => softhsm_2.7.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch
 rename meta-oe/recipes-security/softhsm/{softhsm_2.6.1.bb => softhsm_2.7.0.bb} (92%)

diff --git a/meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch b/meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch
deleted file mode 100644
index 7dddcdb78b..0000000000
--- a/meta-oe/recipes-security/softhsm/files/0001-avoid-unnecessary-check-for-sqlite3-binary.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 88d968346184058df18dc69171dcd4fd612c2341 Mon Sep 17 00:00:00 2001
-From: Jan Luebbe <sho@stratum0.net>
-Date: Mon, 30 Jan 2023 12:48:23 +0100
-Subject: [PATCH] avoid unnecessary check for sqlite3 binary
-
-Only the library is used, not the sqlite3 binary. Drop this check to simplify
-cross-compilation (as no native sqlite3 binary is needed).
-
-Upstream-Status: Submitted [https://github.com/opendnssec/SoftHSMv2/pull/694]
----
- m4/acx_sqlite3.m4 | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/m4/acx_sqlite3.m4 b/m4/acx_sqlite3.m4
-index fd942a75e1a6..17c126d161f5 100644
---- a/m4/acx_sqlite3.m4
-+++ b/m4/acx_sqlite3.m4
-@@ -4,19 +4,13 @@ AC_DEFUN([ACX_SQLITE3],[
- 		[
- 			SQLITE3_INCLUDES="-I$withval/include"
- 			SQLITE3_LIBDIRS="-L$withval/lib"
--			AC_PATH_PROGS(SQLITE3, sqlite3, sqlite3, $withval/bin)
- 			
- 		],[
- 			SQLITE3_INCLUDES=""
- 			SQLITE3_LIBDIRS=""
--			AC_PATH_PROGS(SQLITE3, sqlite3, sqlite3, $PATH)
- 		])
- 
- 	
--	if ! test -x "$SQLITE3"; then
--		AC_MSG_ERROR([sqlite3 command not found])
--	fi
--	
- 	AC_MSG_CHECKING(what are the SQLite3 includes)
- 	AC_MSG_RESULT($SQLITE3_INCLUDES)
- 
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
similarity index 92%
rename from meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
rename to meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
index 30b4fc71d8..5d75cf0fb4 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.7.0.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 DEPENDS = "sqlite3"
 
 SRC_URI = "git://github.com/softhsm/SoftHSMv2.git;protocol=https;branch=main;tag=${PV} \
-           file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
            file://0002-Prevent-accessing-of-global-c-objects-once-they-are-.patch \
 "
-SRCREV = "7f99bedae002f0dd04ceeb8d86d59fc4a68a69a0"
+SRCREV = "13e6e86b83748fef74046dbf0c91f664b7acc1c3"
 
 inherit autotools pkgconfig siteinfo
 
-- 
2.43.0


