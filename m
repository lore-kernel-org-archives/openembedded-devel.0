Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F973C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:57:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.2933.1742461074467816481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O1pEq/db;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742461074; x=1773997074;
  h=from:to:cc:subject:date:message-id;
  bh=DvkqdFugItMYoaVCc/0NMT9QLPsU5iKzKK6XiQIFiBs=;
  b=O1pEq/dbakXonlNJOtCxTyHh1zKN0KPaFcMV6Iv1YxzTiQZD9LnqcbSi
   RFWF/JOp9wFQH23d+1GCegnZq+zwIXB+NyEm2FjsDuwjVpXpZqd5w77sM
   riVPnRTeqo1EMaUfhSvJ1RfGnYSnA5AUo5sT9BN0U9ipGWdjfz8mKa29k
   PzdW88QjmTOJ/NQr0mg2KIgVmZ7hgwfDo6B1MtqyzTf7iUJCCP4X6KaXh
   0YsG9lhF0KL14Yuvb0LYPMqgvDUHk3k0i9r1rLAnXHvn6k75/Li7fT8CA
   y9SlclgpwdqKLIPTI5OaXk2AuvHZ/RtfyJXu7v1C0IPofxJRbnsrJxbuf
   Q==;
X-CSE-ConnectionGUID: gr8Y327jQHmTeNXh6Y5Aog==
X-CSE-MsgGUID: ptsF2D+ATQCSgnsZrk9Smg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="193976761"
X-IronPort-AV: E=Sophos;i="6.14,261,1736780400"; 
   d="scan'208";a="193976761"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:57:51 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FFC4E076A
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57341D5110
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A187F1A009A;
	Thu, 20 Mar 2025 16:57:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 1/5] cmpi-bindings: upgrade 1.0.4 -> 1.0.5
Date: Thu, 20 Mar 2025 16:57:39 +0800
Message-Id: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116124

From: Wang Mingyu <wangmy@fujitsu.com>

0001-cmpi-bindings-Fix-build-error-with-gcc14.patch
removed since it's included in 1.0.5

Changelog:
===============
- Fix build error with gcc14
- Update Python initialization for Python 3.11
- Reduce compiler warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-bindings-Fix-build-error-with-gcc14.patch | 46 -------------------
 ...ndings_1.0.4.bb => cmpi-bindings_1.0.5.bb} |  5 +-
 2 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch
 rename meta-oe/recipes-extended/cmpi-bindings/{cmpi-bindings_1.0.4.bb => cmpi-bindings_1.0.5.bb} (91%)

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch
deleted file mode 100644
index 750d10a5f1..0000000000
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 9e4063a9a3fb2fab69d906902a8432da2544654b Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Tue, 11 Jun 2024 01:38:55 +0000
-Subject: [PATCH] cmpi-bindings: Fix build error with gcc14.
-
-The build error is as the following:
-
-| build-daily-2/tmp/work/aarch64-ubinux-linux/cmpi-bindings/1.0.4/git/swig/python/../../src/target_python.c:168:21: error: passing argument 1 of 'Py_SetProgramName' from incompatible pointer type [-Wincompatible-pointer-types]
-|   168 |   Py_SetProgramName("cmpi_swig");
-|       |                     ^~~~~~~~~~~
-|       |                     |
-|       |                     char *
-| build-daily-2/tmp/work/aarch64-ubinux-linux/cmpi-bindings/1.0.4/recipe-sysroot/usr/include/python3.12/pylifecycle.h:37:56: note: expected 'const wchar_t *' {aka 'const unsigned int *'} but argument is of type 'char *'
-|    37 | Py_DEPRECATED(3.11) PyAPI_FUNC(void) Py_SetProgramName(const wchar_t *);
-|       |        
-
-Upstream-Status: Submitted
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- src/target_python.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/target_python.c b/src/target_python.c
-index a8dfd30..69a2515 100644
---- a/src/target_python.c
-+++ b/src/target_python.c
-@@ -154,6 +154,7 @@ cleanup:
- static int
- PyGlobalInitialize(const CMPIBroker* broker, CMPIStatus* st)
- {
-+  const wchar_t proname[] = L"cmpi_swig";
- /*  _SBLIM_TRACE(1,("<%d/0x%x> PyGlobalInitialize() called", getpid(), pthread_self())); */
-   
-   if (_TARGET_INIT)
-@@ -165,7 +166,7 @@ PyGlobalInitialize(const CMPIBroker* broker, CMPIStatus* st)
-   
-   _SBLIM_TRACE(1,("<%d/0x%x> Python: Loading", getpid(), pthread_self()));
-   
--  Py_SetProgramName("cmpi_swig");
-+  Py_SetProgramName(proname);
-   Py_Initialize();
- #if PY_MAJOR_VERSION < 3
-   SWIGEXPORT void SWIG_init(void);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
similarity index 91%
rename from meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
rename to meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
index 541a360765..e1f6c558df 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.5.bb
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b19ee058d2d5f69af45da98051d91064"
 SECTION = "Development/Libraries"
 DEPENDS = "swig-native sblim-cmpi-devel python3-setuptools-native"
 
-SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=main \
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
            file://0001-Fix-error.patch \
-           file://0001-cmpi-bindings-Fix-build-error-with-gcc14.patch \
            "
 
-SRCREV = "69077ee4d249816ed428155fc933dca424167e77"
+SRCREV = "49d6dcfc71ca421100fcf325e31625817c469fc9"
 S = "${WORKDIR}/git"
 
 inherit cmake python3targetconfig
-- 
2.43.0


