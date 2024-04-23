Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E60C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 01:40:39 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.8907.1713836434081099279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 18:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OGSZXX0t;
 spf=pass (domain: mvista.com, ip: 209.85.160.171, mailfrom: vanusuri@mvista.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-43716ff5494so52712891cf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1713836432; x=1714441232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iqIJ0U63Zggc8I0mu3HtPe993qAtJIj0AXa39He1MM=;
        b=OGSZXX0ty7xxR45ak2KCv81zElnuwVd3HSyyIFBVmFjwf6psSqGDLwN8Z3JMGtIZiO
         obhEmAfKoa8pFPYolLhitgjnDGPEjZI5omnC3JVkNhJqgn71hFHV6imYuB9CumEqHMBe
         SQeMiqmo5PLkS2TmTF5OCLShB+QsVEW5HhLDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713836432; x=1714441232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iqIJ0U63Zggc8I0mu3HtPe993qAtJIj0AXa39He1MM=;
        b=kXBErHoVgbNivXehdPAI3qnlUol9J5TbhmPdPDVxhltTy1IHCguEANXxKcEGEZQCpB
         DW1gYo/4dqv6ByEnB1c+mgH6EXdbO13ePlWWnilKlGosUivdFHno6SSvx0eMHCmNXy+z
         w7dXQkDi0o1bIcmoNflmpMLMG2A00ZPijOICVsD1caBff9X1zitLzDWd+u8dwQABf4cL
         Bm4hvCzY3/r9fJGe8gY1zUDPcfII4f5msxAS1ABLaTm40NDBnamxAhSMzNwlbLx8AbTF
         gHLw12orshCqR4/ZJY1nzbcv4qySX3IBIkLaeLuQTjKAPdV8YwlaT/ubcIBL2qPNnRMR
         Kwpg==
X-Gm-Message-State: AOJu0YwexL5Up/iJeGf5ez6jdskB6HLyFCDkmQqSGUn8ZDLxZcvPbhHH
	SZzgIIDXk/uYxc/47389LGMdPNk6t8ixaULplHRlisxTeivhuJFdzcysO3721EGvESgOnlpGvFf
	s9VY=
X-Google-Smtp-Source: AGHT+IHFF5w4HQKMxcM6dlJJLyxo/4u02O+nAYkP/D7eIyZEvNhozzJRqJf3K7QXV87OmxVQYKyTog==
X-Received: by 2002:a05:6214:2e0b:b0:69b:6c70:3207 with SMTP id mx11-20020a0562142e0b00b0069b6c703207mr3003709qvb.28.1713836432643;
        Mon, 22 Apr 2024 18:40:32 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882c:2958:d4ed:c83a:5880:67b1])
        by smtp.gmail.com with ESMTPSA id j18-20020a0cf312000000b0069b59fb5829sm4759132qvl.44.2024.04.22.18.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 18:40:32 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-webserver][kirkstone][PATCH] apache2: upgrade 2.4.58 -> 2.4.59
Date: Tue, 23 Apr 2024 07:10:22 +0530
Message-Id: <20240423014022.36657-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 01:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110110

From: Vijay Anusuri <vanusuri@mvista.com>

This upgrade incorporates the CVE-2024-27316 CVE-2024-24795
CVE-2023-38709 fixes and other bugfixes.

Updated below patches
0004-apache2-log-the-SELinux-context-at-startup.patch
0007-apache2-allow-to-disable-selinux-support.patch

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.59

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...pache2-log-the-SELinux-context-at-startup.patch | 14 +++++++-------
 ...-apache2-allow-to-disable-selinux-support.patch | 12 ++++++------
 .../{apache2_2.4.58.bb => apache2_2.4.59.bb}       |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.58.bb => apache2_2.4.59.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index a652b7969..9ee7cc356 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -14,10 +14,10 @@ Note: unlikely to be any interest in this upstream
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index ea6cec3..92b74b7 100644
+index 352711a..f58620f 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -491,6 +491,11 @@ getloadavg
+@@ -514,6 +514,11 @@ gettid
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -26,11 +26,11 @@ index ea6cec3..92b74b7 100644
 +   APR_ADDTO(AP_LIBS, [-lselinux])
 +])
 +
- AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
- [AC_TRY_RUN(#define _GNU_SOURCE
- #include <unistd.h>
+ if test $ac_cv_func_gettid = no; then
+   # On Linux before glibc 2.30, gettid() is only usable via syscall()
+   AC_CACHE_CHECK([for gettid() via syscall], ap_cv_gettid,
 diff --git a/server/core.c b/server/core.c
-index 4da7209..d3ca25b 100644
+index 30b317e..81f145f 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -65,6 +65,10 @@
@@ -44,7 +44,7 @@ index 4da7209..d3ca25b 100644
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
  #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
-@@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5139,6 +5143,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
  
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
index 3ff689440..7f6aaa525 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
@@ -11,10 +11,10 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 76811e7..4df3ff3 100644
+index f58620f..da1521b 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -491,10 +491,16 @@ getloadavg
+@@ -514,10 +514,16 @@ gettid
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -28,13 +28,13 @@ index 76811e7..4df3ff3 100644
 +
 +if test x$enable_selinux != xno; then
 +    AC_CHECK_LIB(selinux, is_selinux_enabled, [
-+        AC_DEFINE(HAVE_SELINUX, 1, [Defined if SELinux is supported])
-+        APR_ADDTO(AP_LIBS, [-lselinux])
++	AC_DEFINE(HAVE_SELINUX, 1, [Defined if SELinux is supported])
++	APR_ADDTO(AP_LIBS, [-lselinux])
 +    ])
 +fi
  
- AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
- [AC_TRY_RUN(#define _GNU_SOURCE
+ if test $ac_cv_func_gettid = no; then
+   # On Linux before glibc 2.30, gettid() is only usable via syscall()
 -- 
 2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index 84b19de59..7740b4e33 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5"
+SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e321323"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


