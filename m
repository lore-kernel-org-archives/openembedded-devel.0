Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6A6CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:34 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21220.1780394910240609966
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dO8g7YN3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394913; x=1811930913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GoCCSUKrx52fR0tOtKivI6Wtxv9YvsX8iflGmNh9IxE=;
  b=dO8g7YN3OeuLcPS8qNM5lot0zHrdVjsj6n5z3/ozz31QRiTdw+Gu4fij
   O0aXnbvW2jh28iDj4xvMnLJwDdnXyaYygMhRIaImad6urDCFbKeo2my4Z
   mHLY+cniGQuI+1oKMKgPBBcuXF9TGLnC9RTi2I/HNBSolt/HDsapUGUGN
   7dXCJXTH1Qq83mwsWwNmnnSoKiuWBiyRWk2LcLEta9Qe49mzodDtBPbCP
   5paM1oY1TxAQrh+W2X7W+Jc7yIi9U2WaipNHC0EJcMq+kQL4Pbo4yaXlP
   uapAQRji70o2hTSXYgxTxkFazMhPZR6WWmcvr1cXh9MdqAOiRaDWVeEIa
   Q==;
X-CSE-ConnectionGUID: C/sFuPC6QSGVwFm5NcHxwQ==
X-CSE-MsgGUID: WPJH0pQDT8uHNizzZP/cAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230702036"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230702036"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:33 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2C4141C1C739
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:33 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D7EA7861242
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E214018005BD;
	Tue,  2 Jun 2026 10:08:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/38] python3-httptools: upgrade 0.7.1 -> 0.8.0
Date: Tue,  2 Jun 2026 18:07:33 +0800
Message-ID: <20260602100755.2117-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127339

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Allow-building-with-latest-setuptools.patch
removed since it's included in 0.8.0

Changelog:
===========
- Add http-parser and llhttp licenses into the wheels
- Mark cython module as free-threading compatible
- Fix all typing issues
- Bump llhttp to 9.4.1
- Security: fix URL truncation issue
- Allow building with latest setuptools

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...llow-building-with-latest-setuptools.patch | 23 -------------------
 ...ls_0.7.1.bb => python3-httptools_0.8.0.bb} |  3 +--
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch
 rename meta-python/recipes-devtools/python/{python3-httptools_0.7.1.bb => python3-httptools_0.8.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch b/meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch
deleted file mode 100644
index cad199f275..0000000000
--- a/meta-python/recipes-devtools/python/python3-httptools/0001-Allow-building-with-latest-setuptools.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 61e4a5acc1ec27ca295f4c0f288b97208fec1f78 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Sat, 14 Mar 2026 16:55:54 +0100
-Subject: [PATCH] Allow building with latest setuptools
-
-Upstream-Status: Submitted [https://github.com/MagicStack/httptools/pull/138]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index e2acba3..86c46de 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- build-backend = "setuptools.build_meta"
--requires = ["setuptools==80.9.0"]
-+requires = ["setuptools>=80.9.0,<=82.0.1"]
- 
- [project]
- name = "httptools"
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb b/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
index 01e317732b..96565a7885 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
@@ -5,5 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "abd72556974f8e7c74a259655924a717a2365b236c882c3f6f8a45fe94703ac9"
-SRC_URI += "file://0001-Allow-building-with-latest-setuptools.patch"
+SRC_URI[sha256sum] = "6b2a32f18d97e16e90827d7a819ffa8dbd8cc245fc4e1fa9d1095b54ef4bd999"
-- 
2.43.0


