Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69975C25B76
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.6638.1714628965884571594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DKnpOqd4;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628965; x=1746164965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3w3K6DEwXhttt0Z2XAKdkG3Xn09axMDVhSZrWm2udS4=;
  b=DKnpOqd4KQ2x94OovOSlhz2Pf1kmzOtuXKrxU4SrdNnnm4BnDdoEJndm
   HgWQhAN/Lm0sp0UZOpKuS/ErVw76xTpI2L2qr5dlLV6WEgSAF5taa9Y9x
   WxZIvkuATlE+01OVPudjhlT8GFyFI8CNoMlEUlJnSxy0cqGMoa4H6uVHM
   B+X0MRuFjy28Xb+iLMVrVLxg9Y5UiyeEkzcLVJcDbUFtGuuLyZcjqs6A4
   I1477LtzRTqJhPc9IaY3auRjwgAxspCrE+LgGr+MVfGtkVssGBPpclo1s
   6UNnH2aUpo67q3hGezm9usBLRI23++Rj74fLDPF4EztpiJmJl+3gFUQHj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="145211188"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="145211188"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:22 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC071D770E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D636CFAB0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CDB8223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:19 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47F4A1A0002;
	Thu,  2 May 2024 13:49:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/30] iniparser: upgrade 4.1 -> 4.2
Date: Thu,  2 May 2024 10:48:01 -0400
Message-Id: <20240502144829.241208-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--3.323400-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yXg2y0j5vXZGK2GKtdiFmTl/iZ1aNsYG7v44
	pYPD16CLKqrQ7lLcMnwt/DPtuO0OwdzZGrP764sO/HTKStsDGMJyGvikEsYi8AfxTM57BPHDvwU
	evDt+uW40gGvDuBPXdC//MlDRqI8mcfRJq1ctTfwTF1LtYW9la8/aUFVt7PuTtXl9IxEPXOqNxG
	pCKB1jXVuK2T8HKn/Cn3Z4KP0yChmQPDv33jKxaNyBRU/cKn69mJAMgmwOyledAuliTV06YsbAn
	KAUKx9i7QHQxPxLQSSAMuqetGVetnyef22ep6XYxlblqLlYqXLXYMlch5UBTzj0NaTlc11LiW/t
	sp3PIOUtKtfy9J3j4LA4p1mZPEk+Mp0yznJFV5Uf10cfBaol7ev7VQX19im6U6N9xPwdO6IRZbR
	sQk5MBUB1QPq9bxnWZkAxAwjIrrMHz/H0kiLyEqGAtHMDjkk9
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110212

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

CVE-2023-33461.patch
removed since it's included in 4.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../iniparser/iniparser/CVE-2023-33461.patch  | 48 -------------------
 .../{iniparser_4.1.bb => iniparser_4.2.bb}    |  7 ++-
 2 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
 rename meta-oe/recipes-support/iniparser/{iniparser_4.1.bb => iniparser_4.2.bb} (76%)

diff --git a/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch b/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
deleted file mode 100644
index db5fb06aa..000000000
--- a/meta-oe/recipes-support/iniparser/iniparser/CVE-2023-33461.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-CVE: CVE-2023-33461
-Upstream-Status: Backport [https://github.com/ndevilla/iniparser/pull/146/commits/ace9871f65d11b5d73f0b9ee8cf5d2807439442d]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-
-From ace9871f65d11b5d73f0b9ee8cf5d2807439442d Mon Sep 17 00:00:00 2001
-From: Antonio <antoniolrt@gmail.com>
-Date: Fri, 2 Jun 2023 15:03:10 -0300
-Subject: [PATCH] Handle null return from iniparser_getstring
-
-Fix handling of NULL returns from iniparser_getstring in
-iniparser_getboolean, iniparser_getlongint and iniparser_getdouble,
-avoiding a crash.
----
- src/iniparser.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/iniparser.c b/src/iniparser.c
-index f1d1658..dbceb20 100644
---- a/src/iniparser.c
-+++ b/src/iniparser.c
-@@ -456,7 +456,7 @@ long int iniparser_getlongint(const dictionary * d, const char * key, long int n
-     const char * str ;
- 
-     str = iniparser_getstring(d, key, INI_INVALID_KEY);
--    if (str==INI_INVALID_KEY) return notfound ;
-+    if (str==NULL || str==INI_INVALID_KEY) return notfound ;
-     return strtol(str, NULL, 0);
- }
- 
-@@ -511,7 +511,7 @@ double iniparser_getdouble(const dictionary * d, const char * key, double notfou
-     const char * str ;
- 
-     str = iniparser_getstring(d, key, INI_INVALID_KEY);
--    if (str==INI_INVALID_KEY) return notfound ;
-+    if (str==NULL || str==INI_INVALID_KEY) return notfound ;
-     return atof(str);
- }
- 
-@@ -553,7 +553,7 @@ int iniparser_getboolean(const dictionary * d, const char * key, int notfound)
-     const char * c ;
- 
-     c = iniparser_getstring(d, key, INI_INVALID_KEY);
--    if (c==INI_INVALID_KEY) return notfound ;
-+    if (c==NULL || c==INI_INVALID_KEY) return notfound ;
-     if (c[0]=='y' || c[0]=='Y' || c[0]=='1' || c[0]=='t' || c[0]=='T') {
-         ret = 1 ;
-     } else if (c[0]=='n' || c[0]=='N' || c[0]=='0' || c[0]=='f' || c[0]=='F') {
diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.2.bb
similarity index 76%
rename from meta-oe/recipes-support/iniparser/iniparser_4.1.bb
rename to meta-oe/recipes-support/iniparser/iniparser_4.2.bb
index c80668d27..d44772590 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "The iniParser library is a simple C library offering INI file parsing
 SECTION = "libs"
 HOMEPAGE = "https://github.com/ndevilla/iniparser"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e02baf71c76e0650e667d7da133379ac"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8474d3b745f77e203f1fc82fb0bb7678"
 
 DEPENDS = "doxygen-native"
 
@@ -10,11 +10,10 @@ PV .= "+git"
 
 SRC_URI = "git://github.com/ndevilla/iniparser.git;protocol=https;branch=master \
            file://0001-iniparser.pc-Make-libpath-a-variable.patch \
-	   file://Add-CMake-support.patch \
-           file://CVE-2023-33461.patch \
+           file://Add-CMake-support.patch \
 "
 
-SRCREV= "deb85ad4936d4ca32cc2260ce43323d47936410d"
+SRCREV = "9f5a6da1c245b44f49a46212ec0d81ffb1f821aa"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


