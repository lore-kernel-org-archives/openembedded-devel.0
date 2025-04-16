Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F24C369D4
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.14610.1744794151722446174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pyy4NktP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794152; x=1776330152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=drLY6vNR00etpt/5VNw3l3ze4nCatPr/LNENrjnkEHA=;
  b=Pyy4NktPD6YnMEFxcP3TCwl9Xar9jr838uijjObkRsmCOwX8WHiGdjCG
   B30XC7xRd0VI3e09AXk8hfjBDfXynEGBKB9Gd3F5+NHuQr9IesyDL9IUX
   QAcx79j8Apqjch7V9Y7BhOzFdvOJ3g2mFo57AUpH5E3d0W52PDTjboEwu
   kQ8pdML2VY01TjhtGp3iNTup2TQybOKiL6Zqw4BGumfHvKDbLSdR1klqh
   1xeQQjUHI6tq78CgzxWkYfaE+I149+j7Z6q0UTVNK9ARlFaNGdfOPhABx
   hG7FOk846OijYOyv8pAr3ShmL99HrJS1Wy1DHywypMV1Sg6jg1yhxQzp0
   A==;
X-CSE-ConnectionGUID: pQQX1MRLQxSZU7ZekxCoyw==
X-CSE-MsgGUID: 9iV0o3tHTueNEdTccYmOhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="184598410"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="184598410"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F1A0DDBB8C
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DD7EBDB60
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 37A281A00AF;
	Wed, 16 Apr 2025 17:02:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/31] php: upgrade 8.4.5 -> 8.4.6
Date: Wed, 16 Apr 2025 17:01:59 +0800
Message-Id: <1744794136-908-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116881

From: Wang Mingyu <wangmy@fujitsu.com>

0003-iconv-fix-detection.patch
refreshed for 8.4.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../php/php/0003-iconv-fix-detection.patch            | 11 ++++-------
 .../php/{php_8.4.5.bb => php_8.4.6.bb}                |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.5.bb => php_8.4.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
index 46505cd329..745bc2140d 100644
--- a/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
+++ b/meta-oe/recipes-devtools/php/php/0003-iconv-fix-detection.patch
@@ -1,7 +1,7 @@
-From 35ac74fce1a60025f8d126783b8aa7014eefdf53 Mon Sep 17 00:00:00 2001
+From d9fc6b314cefe010a0deb6e591719cfb0ff226a5 Mon Sep 17 00:00:00 2001
 From: Claude Bing <cbing@cybernetics.com>
 Date: Tue, 9 Nov 2021 13:10:33 -0500
-Subject: [PATCH 3/5] iconv: fix detection
+Subject: [PATCH] iconv: fix detection
 
 Upstream-Status: Pending
 
@@ -20,10 +20,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/build/php.m4 b/build/php.m4
-index e45b22b76..1bd3ccceb 100644
+index d8a5cbf0..aee21924 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1820,7 +1820,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1829,7 +1829,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
      [Define to 1 if you have the 'libiconv' function.])
  
    dnl Check libc first if no path is provided in --with-iconv.
@@ -33,6 +33,3 @@ index e45b22b76..1bd3ccceb 100644
      dnl Reset LIBS temporarily as it may have already been included -liconv in.
      LIBS_save=$LIBS
      LIBS=
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.4.5.bb b/meta-oe/recipes-devtools/php/php_8.4.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.5.bb
rename to meta-oe/recipes-devtools/php/php_8.4.6.bb
index 7c7c425d3d..1b8c019a5d 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.6.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${WORKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "9378c78887d0cd7462fc5c17f2de30c852f20f79d28795e2573fe3250d39436e"
+SRC_URI[sha256sum] = "9cf2734509b603f6589617ab52a9712a03e0fe059951cddd2d4623df4bf7c6c6"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


