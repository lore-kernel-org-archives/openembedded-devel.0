Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E72C3526F
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:06 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.3063.1649829686654054905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 23:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23D61OWY018963
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 23:01:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23D61FKx007373
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Apr 2022 23:01:24 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 12 Apr 2022 23:01:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 12 Apr 2022 23:01:13 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 12 Apr 2022 23:01:13 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-webserver][PATCH] apache2: upgrade 2.4.52 -> 2.4.53
Date: Wed, 13 Apr 2022 14:01:12 +0800
Message-ID: <20220413060112.66500-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96608

From: Changqing Li <changqing.li@windriver.com>

This upgarde fix sereval CVEs:
CVE-2022-22719
CVE-2022-22720
CVE-2022-22721
CVE-2022-23943

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...re-use-pkg-config-for-PCRE-detection.patch | 35 +++++++++----------
 .../{apache2_2.4.52.bb => apache2_2.4.53.bb}  |  2 +-
 2 files changed, 18 insertions(+), 19 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.52.bb => apache2_2.4.53.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
index 6c0286457..60154f029 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
@@ -1,4 +1,4 @@
-From d2cedfa3394365689a3f7c8cfe8e0dd56b29bed9 Mon Sep 17 00:00:00 2001
+From f30e98867031ce0b01a35607af1ac7a2ff9c4925 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 17 Jun 2014 09:10:57 +0200
 Subject: [PATCH] configure: use pkg-config for PCRE detection
@@ -7,38 +7,37 @@ Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
 ---
- configure.in | 27 +++++----------------------
- 1 file changed, 5 insertions(+), 22 deletions(-)
+ configure.in | 26 +++++---------------------
+ 1 file changed, 5 insertions(+), 21 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 9feaceb..dc6ea15 100644
+index 38c1d0a..c799aec 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -215,28 +215,11 @@ fi
- AC_ARG_WITH(pcre,
- APACHE_HELP_STRING(--with-pcre=PATH,Use external PCRE library))
+@@ -221,27 +221,11 @@ else if which $with_pcre 2>/dev/null; then :; else
+ fi
+ fi
  
--AC_PATH_PROG(PCRE_CONFIG, pcre-config, false)
--if test -d "$with_pcre" && test -x "$with_pcre/bin/pcre-config"; then
--   PCRE_CONFIG=$with_pcre/bin/pcre-config
--elif test -x "$with_pcre"; then
--   PCRE_CONFIG=$with_pcre
--fi
+-AC_CHECK_TARGET_TOOLS(PCRE_CONFIG, [pcre2-config pcre-config],
+-                      [`which $with_pcre 2>/dev/null`], $with_pcre)
 -
--if test "$PCRE_CONFIG" != "false"; then
+-if test "x$PCRE_CONFIG" != "x"; then
 -  if $PCRE_CONFIG --version >/dev/null 2>&1; then :; else
--    AC_MSG_ERROR([Did not find pcre-config script at $PCRE_CONFIG])
+-    AC_MSG_ERROR([Did not find working script at $PCRE_CONFIG])
 -  fi
 -  case `$PCRE_CONFIG --version` in
+-  [1[0-9].*])
+-    AC_DEFINE(HAVE_PCRE2, 1, [Detected PCRE2]) 
+-    ;;
 -  [[1-5].*])
 -    AC_MSG_ERROR([Need at least pcre version 6.0])
 -    ;;
 -  esac
 -  AC_MSG_NOTICE([Using external PCRE library from $PCRE_CONFIG])
 -  APR_ADDTO(PCRE_INCLUDES, [`$PCRE_CONFIG --cflags`])
--  APR_ADDTO(PCRE_LIBS, [`$PCRE_CONFIG --libs`])
+-  APR_ADDTO(PCRE_LIBS, [`$PCRE_CONFIG --libs8 2>/dev/null || $PCRE_CONFIG --libs`])
 -else
--  AC_MSG_ERROR([pcre-config for libpcre not found. PCRE is required and available from http://pcre.org/])
+-  AC_MSG_ERROR([pcre(2)-config for libpcre not found. PCRE is required and available from http://pcre.org/])
 -fi
 +PKG_CHECK_MODULES([PCRE], [libpcre], [
 +  AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
@@ -49,5 +48,5 @@ index 9feaceb..dc6ea15 100644
  
  AC_MSG_NOTICE([])
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
index 10123aa2b..719185150 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
@@ -26,7 +26,7 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9"
+SRC_URI[sha256sum] = "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


