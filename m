Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7168ED1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 07:02:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2033.1765263762162504796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 23:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y2dq0ehi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765263762; x=1796799762;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=espqzPc3FlA1dF41p+E7Wq/EMbyRBi1LewiSMiJBHms=;
  b=Y2dq0ehiPznaN3Nea8zTjQfr/PmFNH2N1VdUJewOjN1dL7Qf4EEs+dqX
   23e6v7cvK3mHDSi7tJ/Bu/BH8oN4A11frxv7glNWyGUEMwWSmAiDf537c
   d+I6IVt2Zix13EWb4ExVtdhcKnpXKoiRwuuNxKaCSTHmllBVRzR/KkVSS
   xByQaHgNhcSDz6SWsXMCvIDMoZAxj2fJPqG5PUk3q5S9j4Mffb9dyjble
   yR0RIYLfkO3sZkLRFeCgubgqySPBzNU7bSeGR+ojB/WP0ACGYREdxlWmf
   GEEzh4z0W3HtfKAP4/NcS9zYqgmZNbmIGEpWIVdbIRYgvnSORD1aKqsjq
   Q==;
X-CSE-ConnectionGUID: UpDOEbsmSBer9AM8yJ2NZQ==
X-CSE-MsgGUID: gcb1odG1QG2AU5BkLaf5aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209929866"
X-IronPort-AV: E=Sophos;i="6.20,260,1758553200"; 
   d="scan'208";a="209929866"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 16:02:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 9725E142D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:40 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 429CF1C00294
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:40 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 18C041000610
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 07:02:37 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 3/3] python3-pyzstd: upgrade 0.18.0 -> 0.19.0
Date: Tue,  9 Dec 2025 15:02:26 +0800
Message-ID: <20251209070234.22481-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122401

1. Changelog
  - The project has been completely refactored to use the Zstandard implementation from the standard library ([PEP-784](https://peps.python.org/pep-0784/))
  - The refactor has some minor impact on public APIs, such as changing the exception raised on invalid input

2. Drop 0001-Bump-setuptools-dependency-from-74-to-89.patch as setuptools in requires was removed in pyproject.toml

3. HOMEPAGE has been changed to https://github.com/Rogdham/pyzstd.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-setuptools-dependency-from-74-to-89.patch | 27 -------------------
 ...std_0.18.0.bb => python3-pyzstd_0.19.0.bb} |  9 ++++---
 2 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-89.patch
 rename meta-python/recipes-devtools/python/{python3-pyzstd_0.18.0.bb => python3-pyzstd_0.19.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-89.patch b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-89.patch
deleted file mode 100644
index f7b43b12a7..0000000000
--- a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-89.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From bc9b975c9f41e43481a2eb0623b4180926baecec Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 9 Apr 2025 14:38:31 -0700
-Subject: [PATCH] Bump setuptools dependency from 74 to 89
-
-Upstream sticks to 0.74 since setuptools have dropped msvc9compiler
-support beyond that which is needed for python 3.9 on windows. We
-do not have this problem on Linux
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index dd885e4..5d4d511 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -1,6 +1,6 @@
- [build-system]
- # setuptools 64+ support --build-option
- # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 under Windows
--requires = ["setuptools>=64,<74"]
-+requires = ["setuptools>=64,<89"]
- backend-path = ["build_script"]
- build-backend = "pyzstd_pep517"
diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
index 2aee987efa..b41746dbae 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Pyzstd module provides classes and functions for compressing and \
 decompressing data, using Facebook’s Zstandard (or zstd as short name) algorithm."
-HOMEPAGE = "https://github.com/animalize/pyzstd"
+HOMEPAGE = "https://github.com/Rogdham/pyzstd"
 SECTION = "devel/python"
 
 LICENSE = "BSD-3-Clause"
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aedb5a2679cd1552fb61c181ef974b9e"
 
 PYPI_PACKAGE = "pyzstd"
 
-SRC_URI += "file://0001-Bump-setuptools-dependency-from-74-to-89.patch"
-SRC_URI[sha256sum] = "81b6851ab1ca2e5f2c709e896a1362e3065a64f271f43db77fb7d5e4a78e9861"
+SRC_URI[sha256sum] = "44e7b9be7b445aac742003ddee52ca31385d52dffb8c60adf633fad8e795f10d"
 
-inherit pypi python_setuptools_build_meta ptest-python-pytest
+inherit pypi python_setuptools_build_meta ptest-python-pytest python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native"
 
 # clang-16 with -flto segfaults on arm, therefore ignore flto for now
 do_configure:append:arm:toolchain-clang() {
-- 
2.43.0


