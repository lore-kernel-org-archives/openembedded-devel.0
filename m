Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 982FACCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:56 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12612.1762847749575551211
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eo5P+W2O;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847749; x=1794383749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ATYpR3LBY1pC46W4fdYwjL/Wap3uErJdZJYC08RBYF0=;
  b=eo5P+W2O8OYWiVcKJ+T9/LoPoSaWzg0yjymd0LhZOJftXUeXUO8Yb2Ch
   VHey07MD7+3yZQ0nJSi9KxHQEvEEkxOBtlsKQxI8ERjEIv9dCxtxJ1ilj
   leimqsDcyygqAex9fjzLIDsyKAWjB01YqzInIf0xr0TJDRj4MP6zJ8iDu
   2VX1jONhU6wYCAOQPeAcoNhFiItgKa7jA2oUF5B5PrOqtDCeJ/FKL7+e2
   fWmT5kYSAxVtJLxd2R7vi/gghLG0Tpjz3/cIo6mMPJCNGQQEf8McFgZ5q
   G6/y4o57e39cUJRssAT4yz9NrSukYvuRsez1Usf4CszLucWyCHt6hbZ+k
   g==;
X-CSE-ConnectionGUID: JiNSyiLvQTyNtLgGEws3gw==
X-CSE-MsgGUID: soZCLHLvQvWEqCVqgkaSWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="197780271"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="197780271"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:48 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0BD5A26EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:48 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B3A6E1C0017E
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5C8BA1800D75;
	Tue, 11 Nov 2025 07:55:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/23] python3-icu: upgrade 2.15.3 -> 2.16
Date: Tue, 11 Nov 2025 15:55:07 +0800
Message-ID: <20251111075517.1650-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121492

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fixed issue #178
- added new enums from new unicode release in UBlockCode, UScriptCode
- added missing wrappers for ECollationStrength and EComparisonResult
- added wrapper for UIndicConjunctBreak
- added support for ICU 78.1

0001-Fix-host-contamination-of-include-files.patch
refreshed for 2.16

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Fix-host-contamination-of-include-files.patch   | 9 +++------
 .../{python3-icu_2.15.3.bb => python3-icu_2.16.bb}       | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.15.3.bb => python3-icu_2.16.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
index 7bb5ee58cc..d3a05972c3 100644
--- a/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
+++ b/meta-python/recipes-devtools/python/python3-icu/0001-Fix-host-contamination-of-include-files.patch
@@ -1,4 +1,4 @@
-From a82fea9663f0c70cf57cd06650f400e878afc5e4 Mon Sep 17 00:00:00 2001
+From 5648531ec5f77f5270ddf5c7e49ade5c160669bc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Apr 2021 10:48:36 -0700
 Subject: [PATCH] Fix host contamination of include files
@@ -16,7 +16,7 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 176c9ab..0a10268 100644
+index 8a975e5..e85fdd3 100644
 --- a/setup.py
 +++ b/setup.py
 @@ -68,7 +68,7 @@ elif platform.startswith('freebsd'):
@@ -28,7 +28,7 @@ index 176c9ab..0a10268 100644
      'freebsd': False, # not tested
      'win32': False,   # no icu-config
      'sunos5': False,  # not tested
-@@ -277,7 +277,6 @@ setup(name="PyICU",
+@@ -277,7 +277,6 @@ setup(name="pyicu",
        ext_modules=[Extension('icu._icu_',
                               [filename for filename in sorted(os.listdir(os.curdir))
                                if filename.endswith('.cpp')],
@@ -36,6 +36,3 @@ index 176c9ab..0a10268 100644
                               extra_compile_args=_cflags,
                               extra_link_args=_lflags,
                               libraries=_libraries)],
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.15.3.bb b/meta-python/recipes-devtools/python/python3-icu_2.16.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-icu_2.15.3.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.16.bb
index 1f5cf6d042..c46e4e9f8b 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.15.3.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.bb
@@ -10,7 +10,7 @@ DEPENDS += "icu"
 PYPI_PACKAGE = "pyicu"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "f32e78e1cb64d0aeb14f027e037a8944861d3114548818a6adf0081ef51aefc3"
+SRC_URI[sha256sum] = "42b3a8062e3b23e927ca727e6b5e1730d86c70279834e4887152895d2eb012d9"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.43.0


