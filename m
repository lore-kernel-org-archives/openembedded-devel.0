Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A35D4400A
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:26 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.37273.1731922221603755468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fcJaV/Ic;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922222; x=1763458222;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aVPYUhhVQeFqMarUX8/0w80/79sDA26HdBHOM3r661o=;
  b=fcJaV/IcVUfaPgIb0GZ5EN2ke9KIKO7qA3hWcnQEZYSAQtimeAh38GSE
   8CYMQJUnzdmo/3Z9S30PMOZYBgHufvJ42nKGVR3f0YtWA9gx0uh14laYU
   UHDFBQjoB/zP+PZNNdAqZBHs8W1wwO7W2taOKyG3GAUW+/b2KyX9IjYIh
   6Tm+hmgFQ3YY8Y+rfgdoPnG3/bPETQ3U+yylhaWWNY6kRuubvEVlm9NYq
   +ZhEbftrRPHAWPbPk3aFhWQgBRy4OFqEfkTnwZsm8AvnGkoWZdVsclgvj
   MtndzAwVCCl1rYYMPUZbk+XaDxJgF8O2dMG0uj8Aik9OKsbUHRRx11MbM
   g==;
X-CSE-ConnectionGUID: 9Qr7jWJgRb+VyBGJ7fNPhA==
X-CSE-MsgGUID: VbolCeY+QhOmtBCrDvuw8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="180997135"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="180997135"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 43559D4808
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D0245BDC8F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D1FB20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E7621A01E9;
	Mon, 18 Nov 2024 17:30:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/32] python3-yappi: upgrade 1.6.0 -> 1.6.10
Date: Mon, 18 Nov 2024 17:29:52 +0800
Message-Id: <1731922195-5266-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--13.291600-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhFYM
	JR3dIrh2C7dFQIvqCd9MNbrUuyXyo4grKnsJ1GRgv5rsfD7H2pk/xRB6OGnb2rKw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmijejKCMx4rt5KzjuZtPtIBBmyTBaqiJvc6Mw4RnkAvRIVIl
	GHvBrEHxZ65xuSzpC2Byr+B49eIH/f4QuvZbYDrnzmmMD/HXF+jmXg+SUr0/tQnnYsWF8zq6Vgb
	rw0BQUq+HFTsVYedX7G04KgnWpcv6+/EguYor8cFEUknJ/kEl6Ax/bc87r9b/oLR4+zsDTtFEAk
	LaTcFnqFRYKtt/7ztLwss2kNIhQKOn39WRIYCpavgJp+Ytt8Ew==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113897

From: Wang Mingyu <wangmy@fujitsu.com>

py3.13.patch
removed since it's included in 1.6.10

Changelog:
=========
- Fix source distribution not released
- Fix error not cleared from an internal PyObject_GetAttrString call

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-yappi/py3.13.patch         | 43 -------------------
 ...yappi_1.6.0.bb => python3-yappi_1.6.10.bb} | 12 +++---
 2 files changed, 5 insertions(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-yappi/py3.13.patch
 rename meta-python/recipes-devtools/python/{python3-yappi_1.6.0.bb => python3-yappi_1.6.10.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi/py3.13.patch b/meta-python/recipes-devtools/python/python3-yappi/py3.13.patch
deleted file mode 100644
index 48d81d56e..000000000
--- a/meta-python/recipes-devtools/python/python3-yappi/py3.13.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From defc0291039184b640779e38471ece5e6d3c8cb8 Mon Sep 17 00:00:00 2001
-From: Alfredo Moralejo <amoralej@redhat.com>
-Date: Tue, 2 Jul 2024 10:48:24 +0200
-Subject: [PATCH] Add support for python 3.13
-
-_PyEval_SetProfile() has been moved to internal pycore_ceval.h and it is
-not longer exported [1]. PyEval_SetProfileAllThreads was introduced in 3.12 [2].
-
-[1] https://github.com/python/cpython/commit/c494fb333b57bdf43fc90189fc29a00c293b2987
-[2] https://github.com/python/cpython/commits/76af5c9153394f3d07562427168711a68f54ec66
-
-Upstream-Status: Backport [https://github.com/sumerc/yappi/commit/defc0291039184b640779e38471ece5e6d3c8cb8]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- yappi/_yappi.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/yappi/_yappi.c b/yappi/_yappi.c
-index 459f4dd..56187c9 100644
---- a/yappi/_yappi.c
-+++ b/yappi/_yappi.c
-@@ -1284,7 +1284,9 @@ _resume_greenlet_ctx(_ctx *ctx)
- static void 
- _eval_setprofile(PyThreadState *ts)
- {
--#if PY_VERSION_HEX > 0x030b0000
-+#if PY_VERSION_HEX > 0x030c0000
-+    PyEval_SetProfileAllThreads(_yapp_callback, NULL);
-+#elif PY_VERSION_HEX > 0x030b0000
-     _PyEval_SetProfile(ts, _yapp_callback, NULL);
- #elif PY_VERSION_HEX < 0x030a00b1
-     ts->use_tracing = 1;
-@@ -1298,7 +1300,9 @@ _eval_setprofile(PyThreadState *ts)
- static void
- _eval_unsetprofile(PyThreadState *ts)
- {
--#if PY_VERSION_HEX > 0x030b0000
-+#if PY_VERSION_HEX > 0x030c0000
-+    PyEval_SetProfileAllThreads(NULL, NULL);
-+#elif PY_VERSION_HEX > 0x030b0000
-     _PyEval_SetProfile(ts, NULL, NULL);
- #elif PY_VERSION_HEX < 0x030a00b1
-     ts->use_tracing = 0;
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb b/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
index 80d5012be..c87d5aca6 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
@@ -4,14 +4,12 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[sha256sum] = "a9aaf72009d8c03067294151ee0470ac7a6dfa7b33baab40b198d6c1ef00430a"
+SRC_URI[sha256sum] = "463b822727658937bd95a7d80ca9758605b8cd0014e004e9e520ec9cb4db0c92"
 
-SRC_URI += " \
-    file://run-ptest \
-    file://0001-test_functionality-convert-line-endings-to-Unix.patch \
-    file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
-    file://py3.13.patch \
-"
+SRC_URI += "file://run-ptest \
+           file://0001-test_functionality-convert-line-endings-to-Unix.patch \
+           file://0002-Fix-import-of-tests.utils-to-enable-pytest.patch \
+           "
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


