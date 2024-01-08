Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382BCC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:41:45 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.6808.1704721296238964046
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="147085834"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="147085834"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:41:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC120DCC15
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:41:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 998BED6458
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:41:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25A40200932D4
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:41:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4E2A1A0072;
	Mon,  8 Jan 2024 21:41:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.3.2 -> 1.3.3
Date: Mon,  8 Jan 2024 21:38:51 +0800
Message-Id: <1704721131-30447-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--20.823300-10.000000
X-TMASE-MatchedRID: aJfGYVVmw3ijz0nOeth/ySrLqyE6Ur/j1QQ6Jx/fflbVjNsehGf0vb8c
	Qz0xJBoT+IgjxmwLmBdQOVujLcXGABLUsPoJcoufR+GtoiXVeDGZmLDnd2pI36aYkqKEtUB4oXZ
	EgRzN0sF1n6I4gpk+ovna27lE2NZKBAF1SBaD5qRg/IrbTV5uG+bD6nEJCPKbXvKcB0w2g1Wg+J
	Q+OUb093OH/XE7D0nrsyh0yKfOqaSIKyp7CdRkYD9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FH
	rw7frlu6wgz8PTKAFjMWdWOCsSsgjmuh/dvjPRUPMcAlOC0qrDhEXiLZlbM8R+hI5qKPMbWDBsH
	p9ZCSqwZDZFbAT9pgyo5vA0RfRoZOi5yT5LL+SsRyVsAxhhjrPoMe2Os6+g5UekjLrC3lTDGWjB
	VntrIrf8pW19mJIOmxewuzzaP2bWtYv/FAmebjm9OepgphdNGfS0Ip2eEHnyFh/DzryTTlvc8OJ
	c7+0VJ9xS3mVzWUuC1PimItaljun7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108148

From: Wang Mingyu <wangmy@fujitsu.com>

0001-nss-nspr-fix-for-multilib.patch
change-finding-path-of-nss.patch
ensure-search-path-non-host.patch
fix-ltmain.sh.patch
refreshed for 1.3.3

Changelog
========
-Disabled KeyValue and DEREncodedKeyValue XML nodes by default. Use the
 '--enabled-key-data' option for the xmlsec command line utility or update
 the 'keyInfoCtx->enabledKeyData' parameter if you need to re-enable these
 nodes (also see question 3.5 in the FAQ).
-Removed '--enable-size-t' ('size_t' for MSVC builds) option and made
 'xmlSecSize' to always be the same as 'size_t'.
-Removed previously deprecated functions, defines, etc.
-Fixed build for libxml2 v2.12.0.
-Removed support for OpenSSL 1.1.0 (end of life in Aug 2016).
 The minimum OpenSSL supported version is 1.1.1; the version 3.0.0 or greater is recommended.
-Added runtime check for the enabled algorithms in NSS.
-Removed NT4 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-nss-nspr-fix-for-multilib.patch        | 10 ++++------
 .../xmlsec1/change-finding-path-of-nss.patch    | 13 +++++++------
 .../xmlsec1/ensure-search-path-non-host.patch   | 17 +++++++++++++----
 .../xmlsec1/xmlsec1/fix-ltmain.sh.patch         |  6 +++---
 .../{xmlsec1_1.3.2.bb => xmlsec1_1.3.3.bb}      |  2 +-
 5 files changed, 28 insertions(+), 20 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.2.bb => xmlsec1_1.3.3.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
index 53c119765..f107f42da 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
@@ -1,4 +1,4 @@
-From 9ed3b4e628f9254d5c86006fe63c33a1eb02aee5 Mon Sep 17 00:00:00 2001
+From 4d73b85fb1b794c649359bc8a774b0111d36994a Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Tue, 4 Feb 2020 23:39:49 -0800
 Subject: [PATCH] nss/nspr: fix for multilib
@@ -6,15 +6,16 @@ Subject: [PATCH] nss/nspr: fix for multilib
 Upstream-Status: Pending
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
 ---
  configure.ac | 16 ++++++++--------
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b46d97d..39f4318 100644
+index 51621d6..3d23683 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -920,24 +920,24 @@ fi
+@@ -960,24 +960,24 @@ fi
  dnl Priority 1: User specifies the path to installation
  if test "z$NSPR_FOUND" = "zno" -a "z$with_nspr" != "z" -a "z$with_nspr" != "zyes" ; then
      AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folder)
@@ -47,6 +48,3 @@ index b46d97d..39f4318 100644
      fi
  fi
  
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
index 1451ff564..3a1531deb 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/change-finding-path-of-nss.patch
@@ -1,4 +1,4 @@
-From c1c980a95d85bcaf8802524d6148783522b300d7 Mon Sep 17 00:00:00 2001
+From 9c861646e034b1c80fafd389279b0a7da90a8ba7 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Wed, 21 Jul 2010 22:33:43 +0800
 Subject: [PATCH] change finding path of nss and nspr
@@ -8,20 +8,21 @@ Upstream-Status: Pending
 Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
 Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
- configure.ac | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 951b3eb..1fdeb0f 100644
+index ce8a278..51621d6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -866,7 +866,7 @@ MOZILLA_MIN_VERSION="1.4"
+@@ -935,7 +935,7 @@ NSS_PACKAGE=mozilla-nss
  NSPR_INCLUDE_MARKER="nspr/nspr.h"
  NSPR_LIB_MARKER="libnspr4$shrext"
  NSPR_LIBS_LIST="-lnspr4 -lplds4 -lplc4"
 -NSS_INCLUDE_MARKER="nss/nss.h"
 +NSS_INCLUDE_MARKER="nss3/nss.h"
  NSS_LIB_MARKER="libnss3$shrext"
- NSS_LIBS_LIST="-lnss3 -lsmime3"
+ NSS_LIBS_LIST="-lnss3 -lsmime3 -lnssutil3"
  
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
index a5a298af0..7b07628e5 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/ensure-search-path-non-host.patch
@@ -1,4 +1,7 @@
-xmlsec1: Fix configure QA error caused by host lookup path
+From c16d384fb64cf53351e150fb9e9b99cc6ba970b2 Mon Sep 17 00:00:00 2001
+From: Anatol Belski <anbelski@linux.microsoft.com>
+Date: Thu, 14 Jan 2021 17:36:23 +0000
+Subject: [PATCH] xmlsec1: Fix configure QA error caused by host lookup path
 
 ERROR: mc:my-sdk:xmlsec1-1.2.30-r0 do_configure: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
 
@@ -7,9 +10,15 @@ It will eventually arise after the configure QA as the configure script should o
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
 
---- a/configure.ac.orig   2021-01-13 14:37:42.254991177 +0000
-+++ b/configure.ac        2021-01-13 14:40:56.546269330 +0000
-@@ -250,8 +250,8 @@
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3d23683..baf27b7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -286,8 +286,8 @@ fi
  dnl ==========================================================================
  dnl Common installation locations
  dnl ==========================================================================
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch
index af598fe74..73c6ddb02 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/fix-ltmain.sh.patch
@@ -1,4 +1,4 @@
-From 847dc52f5a50e34ee4d6e3dc2c708711747a58ca Mon Sep 17 00:00:00 2001
+From 1b9701faf22f5a17a81a2a2732794d9627499fcb Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Thu, 21 Jan 2010 14:11:20 +0800
 Subject: [PATCH] force to use our own libtool
@@ -12,10 +12,10 @@ Signed-off-by: Yulong Pei <Yulong.pei@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ltmain.sh b/ltmain.sh
-index 147d758..a61f16b 100644
+index 1dea62a..bfb9784 100755
 --- a/ltmain.sh
 +++ b/ltmain.sh
-@@ -6969,7 +6969,7 @@ func_mode_link ()
+@@ -7225,7 +7225,7 @@ func_mode_link ()
  	dir=$func_resolve_sysroot_result
  	# We need an absolute path.
  	case $dir in
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.2.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.3.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.2.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.3.bb
index ff5b6faeb..7a5f01e4f 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.2.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.3.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
            file://ensure-search-path-non-host.patch \
            "
 
-SRC_URI[sha256sum] = "4003c56b3d356d21b1db7775318540fad6bfedaf5f117e8f7c010811219be3cf"
+SRC_URI[sha256sum] = "ab5b9a9ffd6960f46f7466d9d91f174ec37e8c31989237ba6b9eacdd816464f2"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.34.1


