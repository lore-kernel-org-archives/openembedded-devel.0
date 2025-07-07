Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9688DC83F10
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.55572.1751879241281785293
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HFCpgd20;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879241; x=1783415241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wFIol5uUL3+9cDgarV/l4yMJ/Wdnmt8/ldBh7yzIZek=;
  b=HFCpgd20yuIGE4FcqFEabqFUb7VOSR/PPCmsVOv63P5EZfaYZJDfbm2x
   Jkps9CIg/ym+LBIcgl/cpens2XclqABBVqTVDIJE+OHi37yYS7IJI57pT
   WIw5e7Edwdlybz6wCROGrYxiRMwInk6ia/QqV70vpII6w4IxpQBS14OjS
   iFLlPZ2UNQIh32hmkJqHciuTMOuK+ro/dDLJbEqZef5FIwXIaVuRvpcT4
   kaCudiGRvBvcoOP7K7BSaPmSVW6iddqbGNsayQrBiw6UP7CaQP54gFq7C
   XM+X8IsLfxOsHTCLDIUiN4GJai9SDKyflLwspINgVLYnNICfn1hUTikno
   A==;
X-CSE-ConnectionGUID: 0fHyTpRCQe+0r7eQU5cdsA==
X-CSE-MsgGUID: pvhZdm2RRoSdHA4DzXO5aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="192895266"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="192895266"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:20 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5E0051446
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:20 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 96289C0022C
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:19 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7F0ED4F46
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:18 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 832321A0074;
	Mon,  7 Jul 2025 17:07:18 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/35] python3-scikit-build-core: upgrade 0.11.4 -> 0.11.5
Date: Mon,  7 Jul 2025 17:06:51 +0800
Message-ID: <20250707090656.1216-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118278

From: Wang Mingyu <wangmy@fujitsu.com>

0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
refreshed for 0.11.5

Changelog:
===============
- Improve .gitignore iteration speed
- Warn on 3.13.4 on Windows
- Add debug logging explaining why a file is included/excluded
- Fix a typo in a column-name of the platform-machine table

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch          | 6 +++---
 ...d-core_0.11.4.bb => python3-scikit-build-core_0.11.5.bb} | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.11.4.bb => python3-scikit-build-core_0.11.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
index 36eff85334..6d52086aab 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
@@ -1,4 +1,4 @@
-From 3f5d2be717d200406126537eb2f3ed4de92bd2c1 Mon Sep 17 00:00:00 2001
+From 0aee90d953406414f09740a6ef851ed7e666dc9e Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 27 Jan 2025 19:17:48 +0200
 Subject: [PATCH] builder.py: Check PYTHON_INCLUDE_DIR
@@ -15,7 +15,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/scikit_build_core/builder/builder.py b/src/scikit_build_core/builder/builder.py
-index 532d328..0c99ef3 100644
+index d05065f..b01d621 100644
 --- a/src/scikit_build_core/builder/builder.py
 +++ b/src/scikit_build_core/builder/builder.py
 @@ -228,7 +228,7 @@ class Builder:
@@ -26,4 +26,4 @@ index 532d328..0c99ef3 100644
 +        python_include_dir = os.getenv("PYTHON_INCLUDE_DIR") or get_python_include_dir()
          numpy_include_dir = get_numpy_include_dir()
  
-         # Classic Find Python
+         # Warning for CPython 3.13.4 Windows bug
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.4.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.4.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.5.bb
index d1b2fde166..fd175feebf 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.4.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_0.11.5.bb
@@ -10,6 +10,6 @@ DEPENDS = "python3-hatch-vcs-native"
 inherit pypi python_hatchling
 
 SRC_URI += "file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch"
-SRC_URI[sha256sum] = "5b194bbb04092ae327d294b23e4bbffb6181adce4259440a86c9cf6abb8eaa6c"
+SRC_URI[sha256sum] = "8f0a1edb86cb087876f3c699d2a2682012efd8867b390ed37355f13949d0628e"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


