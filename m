Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A41C27C4F
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 02:12:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.88.1718071955403664553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 19:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=khH5OLhL;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718071955; x=1749607955;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T0Avcuz7qW/eJs8ve5dqKMXLtsXc0w/hvO7soFeXQ5I=;
  b=khH5OLhLvPL/9baWueH8ZDiHLwwC89dk5OsRbVHFlS5d6QZxxc6rvYcp
   k59bPfaOMAZ66PFfYClOYeHNAWemxqVSKyvhLA/H8xwBwvMUN3r2/3czo
   R//CodWsz9F/1MewmSzXrNXWYL0bhG8HSavWW5j+P+295EbaYieFkkXjt
   aHi24TZpQ7xmiPpsN4COsFgbdjLCbZpDhs0rfaYh5vqwkcAK6Ws5zfffY
   wmFrVsZke6ezIEoNRXOLAJRWl/2ghrksyG1uTByQPoVXu1G6C50HEjO1+
   aEnCv5V8/1E6pJSCZZW9+w6ICGcZSZcF9oKi9VBdv1CtLr/BrsPWZ4HQc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="141668104"
X-IronPort-AV: E=Sophos;i="6.08,228,1712588400"; 
   d="scan'208";a="141668104"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 11:12:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99666C2AA1
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 11:12:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E07831593F
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 11:12:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68BC420050186
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 11:12:28 +0900 (JST)
Received: from ubuntu24.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E21311A0002;
	Tue, 11 Jun 2024 10:12:27 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-oe][PATCH] cmpi-bindings: Fix build error with gcc14.
Date: Tue, 11 Jun 2024 10:12:32 +0800
Message-ID: <20240611021232.117611-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28446.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28446.004
X-TMASE-Result: 10--8.201800-10.000000
X-TMASE-MatchedRID: c6n4reyclFaGnc61hHySTAPZZctd3P4BCZa9cSpBObm+f7ap9DJaDe79
	DJRUi35pTQ0JkPG2878bYA1xraQblC/7QU2czuUNGYJhRh6ssesfimmlcABuN3XH1Ot8vMTwHjg
	roVIwqhIjH86oKTknXXQq1RwaviSGf4lLpnzeK4eVOwZbcOalS7j89ydM+VlpHApIKLQpe4Sf9R
	byhp/pTwiXkugRQQkaItVkWDiBAQiR9GF2J2xqMxRFJJyf5BJerSFs54Y4wbX6C0ePs7A07cNbT
	FVOzjU8p9rI8gZcP2FvGHD45jNvpi39ouD/de/jBG1SPFBPcoQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 02:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110810

From: Lei Maohui <leimaohui@fujitsu.com>

Added patch to fix incompatible pointer type error.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...-bindings-Fix-build-error-with-gcc14.patch | 46 +++++++++++++++++++
 .../cmpi-bindings/cmpi-bindings_1.0.4.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch

diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch
new file mode 100644
index 000000000..750d10a5f
--- /dev/null
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-cmpi-bindings-Fix-build-error-with-gcc14.patch
@@ -0,0 +1,46 @@
+From 9e4063a9a3fb2fab69d906902a8432da2544654b Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Tue, 11 Jun 2024 01:38:55 +0000
+Subject: [PATCH] cmpi-bindings: Fix build error with gcc14.
+
+The build error is as the following:
+
+| build-daily-2/tmp/work/aarch64-ubinux-linux/cmpi-bindings/1.0.4/git/swig/python/../../src/target_python.c:168:21: error: passing argument 1 of 'Py_SetProgramName' from incompatible pointer type [-Wincompatible-pointer-types]
+|   168 |   Py_SetProgramName("cmpi_swig");
+|       |                     ^~~~~~~~~~~
+|       |                     |
+|       |                     char *
+| build-daily-2/tmp/work/aarch64-ubinux-linux/cmpi-bindings/1.0.4/recipe-sysroot/usr/include/python3.12/pylifecycle.h:37:56: note: expected 'const wchar_t *' {aka 'const unsigned int *'} but argument is of type 'char *'
+|    37 | Py_DEPRECATED(3.11) PyAPI_FUNC(void) Py_SetProgramName(const wchar_t *);
+|       |        
+
+Upstream-Status: Submitted
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/target_python.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/target_python.c b/src/target_python.c
+index a8dfd30..69a2515 100644
+--- a/src/target_python.c
++++ b/src/target_python.c
+@@ -154,6 +154,7 @@ cleanup:
+ static int
+ PyGlobalInitialize(const CMPIBroker* broker, CMPIStatus* st)
+ {
++  const wchar_t proname[] = L"cmpi_swig";
+ /*  _SBLIM_TRACE(1,("<%d/0x%x> PyGlobalInitialize() called", getpid(), pthread_self())); */
+   
+   if (_TARGET_INIT)
+@@ -165,7 +166,7 @@ PyGlobalInitialize(const CMPIBroker* broker, CMPIStatus* st)
+   
+   _SBLIM_TRACE(1,("<%d/0x%x> Python: Loading", getpid(), pthread_self()));
+   
+-  Py_SetProgramName("cmpi_swig");
++  Py_SetProgramName(proname);
+   Py_Initialize();
+ #if PY_MAJOR_VERSION < 3
+   SWIGEXPORT void SWIG_init(void);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
index 781dc83da..cc8860253 100644
--- a/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
+++ b/meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings_1.0.4.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/kkaempf/cmpi-bindings.git;protocol=https;branch=mast
            file://cmpi-bindings-0.4.17-no-ruby-perl.patch \
            file://cmpi-bindings-0.4.17-sblim-sigsegv.patch \
            file://0001-Fix-error.patch \
+           file://0001-cmpi-bindings-Fix-build-error-with-gcc14.patch \
            "
 
 SRCREV = "69077ee4d249816ed428155fc933dca424167e77"
-- 
2.43.0


