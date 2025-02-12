Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E0EC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 07:52:14 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.9944.1739346727954228252
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 23:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OdgPw4J3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739346728; x=1770882728;
  h=from:to:cc:subject:date:message-id;
  bh=2m2pSssLrydf9jwM5cg4lehpDAyFOSzIEyj/iRwASqg=;
  b=OdgPw4J3RVAiRHvrizKbQQ4/AT541ZIZzrMEtYn4k2qiH12IgRBkLw6+
   9X6D1+iTB4+q5u5CQi6Zq7YVIxl9/55FK+YeJHRTGJDvlGPXW3TUvmZBa
   Mnk6znYXUzcyYu04hKG1LiLUpXLw3ApkEkbpwgQ8S2DRoy93Mvbuw8/OL
   EtmPptmfBoG0IUt6SHI0CBE6bLdAon3FvCjqAoVvXTJSvl+OjeCUPoQIr
   rBVG/c+1Srq3+go4Jcz8a/TmGPKbG++BTAu2Pffuoq9B4+3VOJfm0X81D
   u+tMEZrKf6PzokAfge52b/9QjkHGf91RIS8C7RljGQoOy+QkEc4/b7zUV
   Q==;
X-CSE-ConnectionGUID: iFlIStKeSRqjA5oJjBcFLw==
X-CSE-MsgGUID: 6FpqUvjmSz2YtBFIOApB2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="177009064"
X-IronPort-AV: E=Sophos;i="6.13,279,1732546800"; 
   d="scan'208";a="177009064"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 16:52:05 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 53DC8C2260
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 16:52:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19A4ED4BF8
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 16:52:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 953CB1A000B;
	Wed, 12 Feb 2025 15:52:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] xmlsec1: upgrade 1.3.5 -> 1.3.7
Date: Wed, 12 Feb 2025 15:51:59 +0800
Message-Id: <1739346719-3479-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 07:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115440

From: Wang Mingyu <wangmy@fujitsu.com>

0001-nss-nspr-fix-for-multilib.patch
makefile-ptest.patch
xmlsec1-examples-allow-build-in-separate-dir.patch
refreshed for 1.3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xmlsec1/0001-nss-nspr-fix-for-multilib.patch  | 15 +++++++++------
 .../xmlsec1/xmlsec1/makefile-ptest.patch          |  8 ++++----
 ...ec1-examples-allow-build-in-separate-dir.patch |  6 +++---
 .../{xmlsec1_1.3.5.bb => xmlsec1_1.3.7.bb}        |  4 ++--
 4 files changed, 18 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.5.bb => xmlsec1_1.3.7.bb} (95%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
index 697a8ee355..9bb017b63b 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-nss-nspr-fix-for-multilib.patch
@@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7f137c0..e15f5bc 100644
+index 40e9c0d..8f42d4d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -958,24 +958,24 @@ fi
+@@ -966,24 +966,24 @@ fi
  dnl Priority 1: User specifies the path to installation
  if test "z$NSPR_FOUND" = "zno" -a "z$with_nspr" != "z" -a "z$with_nspr" != "zyes" ; then
      AC_MSG_CHECKING(for nspr library installation in "$with_nspr" folder)
@@ -27,8 +27,8 @@ index 7f137c0..e15f5bc 100644
          NSPR_FOUND="yes"
          AC_MSG_RESULT([yes])
      else
--        AC_MSG_ERROR([not found: "$with_nspr/include/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/lib/$NSPR_LIB_MARKER" files don't exist), typo?])
-+        AC_MSG_ERROR([not found: "$with_nspr/${includedir}/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/${libdir}/$NSPR_LIB_MARKER" files don't exist), typo?])
+-        AC_MSG_ERROR([not found: "$with_nspr/include/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/lib/$NSPR_LIB_MARKER"])
++        AC_MSG_ERROR([not found: "$with_nspr/${includedir}/$NSPR_INCLUDE_MARKER" and/or "$with_nspr/${libdir}/$NSPR_LIB_MARKER"])
      fi
  fi
  if test "z$NSS_FOUND" = "zno" -a "z$with_nss" != "z" -a "z$with_nss" != "zyes" ; then
@@ -42,8 +42,11 @@ index 7f137c0..e15f5bc 100644
          NSS_FOUND="yes"
          AC_MSG_RESULT([yes])
      else
--        AC_MSG_ERROR([not found: "$with_nss/include/$NSS_INCLUDE_MARKER" and/or "$with_nss/lib/$NSS_LIB_MARKER" files don't exist), typo?])
-+        AC_MSG_ERROR([not found: "$with_nss/${includedir}/$NSS_INCLUDE_MARKER" and/or "$with_nss/${libdir}/$NSS_LIB_MARKER" files don't exist), typo?])
+-        AC_MSG_ERROR([not found: "$with_nss/include/$NSS_INCLUDE_MARKER" and/or "$with_nss/lib/$NSS_LIB_MARKER"])
++        AC_MSG_ERROR([not found: "$with_nss/${includedir}/$NSS_INCLUDE_MARKER" and/or "$with_nss/${libdir}/$NSS_LIB_MARKER"])
      fi
  fi
  
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
index 26ebce343d..55ae9887f2 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/makefile-ptest.patch
@@ -14,11 +14,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index 02480c2..cbc2661 100644
+index 0b352bc..de3c217 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
-@@ -8,9 +8,17 @@ PROGRAMS = \
- 	decrypt1 decrypt2 decrypt3 \
+@@ -12,9 +12,17 @@ PROGRAMS = \
+ 	$(PROGRAMS_DEC) \
  	xmldsigverify
  
 +ifndef CC
@@ -38,5 +38,5 @@ index 02480c2..cbc2661 100644
  all: $(PROGRAMS)
  
 -- 
-2.25.1
+2.43.0
 
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
index 9e6a6a840f..50706793b2 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1/xmlsec1-examples-allow-build-in-separate-dir.patch
@@ -11,10 +11,10 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/examples/Makefile b/examples/Makefile
-index cbc2661..e882b61 100644
+index de3c217..2e0ab6e 100644
 --- a/examples/Makefile
 +++ b/examples/Makefile
-@@ -12,8 +12,10 @@ ifndef CC
+@@ -16,8 +16,10 @@ ifndef CC
  CC	= gcc
  endif
  
@@ -28,5 +28,5 @@ index cbc2661..e882b61 100644
  DESTDIR = /usr/share/xmlsec1
  install-ptest:
 -- 
-2.25.1
+2.43.0
 
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
similarity index 95%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
index 50c387d250..2fdfd55f24 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.5.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 
 SECTION = "libs"
 
-SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PR}/${BP}.tar.gz \
+SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz \
            file://fix-ltmain.sh.patch \
            file://change-finding-path-of-nss.patch \
            file://makefile-ptest.patch \
@@ -22,7 +22,7 @@ SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PR}/${BP}.tar.gz
            file://ensure-search-path-non-host.patch \
            "
 
-SRC_URI[sha256sum] = "2ffd4ad1f860ec93e47a680310ab2bc94968bd07566e71976bd96133d9504917"
+SRC_URI[sha256sum] = "d82e93b69b8aa205a616b62917a269322bf63a3eaafb3775014e61752b2013ea"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.43.0


