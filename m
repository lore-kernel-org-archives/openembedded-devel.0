Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6313EC64ED5
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.1560.1649979349484327099
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 16:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jt5iAOUG;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s137so6063454pgs.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=086vczVLpAi26KCFqHsHoKsLV7ir1WXfDZBtk9DU6/w=;
        b=Jt5iAOUGygGk23z3TUSzsWi2kdbbMf+qZviIEKQUlWg7ChQXjZole9yaBtBi1+Zbqr
         dJXkdA8X8/1q0MTG9NRQjAPzFDvXEpCHjuyT/civuVmdddWvA20MofelCvFAlTip69Bc
         d5SK7nZYiyUFWXwrOc87ATR2QJ96vG/JgI0zkuEY/dD62OB9e6QdjsVPdhsBjmO3RLd3
         2dZLA20/T4G/rUN5inuXI7snSdPrjKLOtW5uRZHJg4JhC9gYk5afAQVB/iUHvtejXxtu
         3BxTTQbvjfzpCj+/fSF01Xwvf/YLt1R09UD2zuP7zQCIEhoF3wrOVPBmWDIj8qFqXoiD
         YHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=086vczVLpAi26KCFqHsHoKsLV7ir1WXfDZBtk9DU6/w=;
        b=uQ/Muee1w3MkIsXkhOWv+kd4d9Llv3UVNDsQ1u27a9/a1j9LU0dR+1czbPH73we3MF
         uhfkj81Tw07lLGd/w0YVK7tdAw1PKLA4EFjhFQAfXUiv4xc4qVOMVRXYJDUdI2v9Bb77
         /iYNbDkkAc83Af2Xfm4OXS8xcRzmkq4K/XALK49NsVdvKdMd7vvhp00El1a1Uv2pxVO2
         7tNa7ZBGtHNh7apZ6IDSHvxzDJhxUTRadVvJkqhiAdyCLofAy6bxCZgV6K6qByAocuOj
         dCkgPpsyW7KZJoCPijEILoezyGZoiGHLmFinG62Czs4bTQog0hoNGNR8w1xZPZ/BSg4Z
         dqww==
X-Gm-Message-State: AOAM531J15LXjOqi9a1hrMseJtHeutPHkz12zBcfTZoVXydMvb0GBp50
	w6BzP4MimNkh8YncLRWzg4zS1oUpWKo=
X-Google-Smtp-Source: 
 ABdhPJyUPs9bHJPd7Vh/nn0rXzEIJfzWfV35uSZrAFExz5Ez1AGzkFYqYASkG6p8tO5SUGJcZnYmHA==
X-Received: by 2002:a63:581d:0:b0:39d:5138:1ce2 with SMTP id
 m29-20020a63581d000000b0039d51381ce2mr4126129pgb.621.1649979348412;
        Thu, 14 Apr 2022 16:35:48 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:8ba4:faed:21bc:f7bd])
        by smtp.gmail.com with ESMTPSA id
 19-20020aa79113000000b00505d5d15d80sm933562pfh.14.2022.04.14.16.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 16:35:48 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] apache2: upgrade 2.4.52 -> 2.4.53
Date: Thu, 14 Apr 2022 16:35:46 -0700
Message-Id: <20220414233546.2227884-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96656

From: Yi Zhao <yi.zhao@windriver.com>

Source: meta-openembedded
MR: 117176, 116633
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-webserver/recipes-httpd/apache2?id=81bbe65791459538ab578ac13e612f7dc6f692f0

ChangeID: 5b86888b06765a3b5aa7ff301da4f8b87f2dd154
Description:

ChangeLog:
https://downloads.apache.org/httpd/CHANGES_2.4.53

Security fixes:
CVE-2022-23943
CVE-2022-22721
CVE-2022-22720
CVE-2022-22719

Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...re-use-pkg-config-for-PCRE-detection.patch | 37 +++++++++----------
 ...the-core-size-limit-if-CoreDumpDirec.patch | 13 +++----
 ...xport-apr-apr-util-symbols-when-usin.patch | 11 +++---
 ...2-log-the-SELinux-context-at-startup.patch | 15 ++++----
 ...ace-lynx-to-curl-in-apachectl-script.patch |  4 +-
 ...-race-issue-of-parallel-installation.patch |  4 +-
 ...he2-allow-to-disable-selinux-support.patch |  8 ++--
 ...x-perl-install-directory-to-usr-bin.patch} | 10 +++--
 ...in-force-destdir-to-be-empty-string.patch} | 10 ++---
 ...use-relative-path-for-gen_test_char.patch} |  7 ++--
 .../{apache2_2.4.52.bb => apache2_2.4.53.bb}  | 10 ++---
 11 files changed, 63 insertions(+), 66 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/apache2/{apache-configure_perlbin.patch => 0008-Fix-perl-install-directory-to-usr-bin.patch} (85%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{0001-support-apxs.in-force-destdir-to-be-empty-string.patch => 0009-support-apxs.in-force-destdir-to-be-empty-string.patch} (90%)
 rename meta-webserver/recipes-httpd/apache2/apache2/{0008-apache2-do-not-use-relative-path-for-gen_test_char.patch => 0010-apache2-do-not-use-relative-path-for-gen_test_char.patch} (86%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.52.bb => apache2_2.4.53.bb} (96%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
index 6c0286457c..50775be533 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-configure-use-pkg-config-for-PCRE-detection.patch
@@ -1,44 +1,43 @@
-From d2cedfa3394365689a3f7c8cfe8e0dd56b29bed9 Mon Sep 17 00:00:00 2001
+From ba9015386cbc044e111d7c266f13e2be045e4bf1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen.kooi@linaro.org>
 Date: Tue, 17 Jun 2014 09:10:57 +0200
 Subject: [PATCH] configure: use pkg-config for PCRE detection
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [embedded specific]
 
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
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
index 85fe6ae4bd..bbe8b325b5 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0002-apache2-bump-up-the-core-size-limit-if-CoreDumpDirec.patch
@@ -1,8 +1,8 @@
-From 7df207ad4d0dcda2ad36e5642296e0dec7e13647 Mon Sep 17 00:00:00 2001
+From 5074ab3425e5f1e01fd9cfa2d9b7300ea1b3f38f Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
-Subject: [PATCH] apache2: bump up the core size limit if CoreDumpDirectory
- is configured
+Subject: [PATCH] apache2: bump up the core size limit if CoreDumpDirectory is
+ configured
 
 Bump up the core size limit if CoreDumpDirectory is
 configured.
@@ -11,16 +11,15 @@ Upstream-Status: Pending
 
 Note: upstreaming was discussed but there are competing desires;
 	there are portability oddities here too.
-
 ---
  server/core.c | 19 +++++++++++++++++++
  1 file changed, 19 insertions(+)
 
 diff --git a/server/core.c b/server/core.c
-index eacb54f..7aa841f 100644
+index 090e397..3020090 100644
 --- a/server/core.c
 +++ b/server/core.c
-@@ -4965,6 +4965,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5107,6 +5107,25 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
      apr_pool_cleanup_register(pconf, NULL, ap_mpm_end_gen_helper,
                                apr_pool_cleanup_null);
@@ -47,5 +46,5 @@ index eacb54f..7aa841f 100644
  }
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch b/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
index 081a02baa3..adb728ba31 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0003-apache2-do-not-export-apr-apr-util-symbols-when-usin.patch
@@ -1,8 +1,8 @@
-From ddd560024a6d526187fd126f306b59533ca3f7e2 Mon Sep 17 00:00:00 2001
+From 9c03ed909b8da0e1a288f53fda535a3f15bcf791 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
-Subject: [PATCH] apache2: do not export apr/apr-util symbols when using
- shared libapr
+Subject: [PATCH] apache2: do not export apr/apr-util symbols when using shared
+ libapr
 
 There is no need to "suck in" the apr/apr-util symbols when using
 a shared libapr{,util}, it just bloats the symbol table; so don't.
@@ -10,13 +10,12 @@ a shared libapr{,util}, it just bloats the symbol table; so don't.
 Upstream-Status: Pending
 
 Note: EXPORT_DIRS change is conditional on using shared apr
-
 ---
  server/Makefile.in | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/server/Makefile.in b/server/Makefile.in
-index 1fa3344..f635d76 100644
+index 8111877..8c0c396 100644
 --- a/server/Makefile.in
 +++ b/server/Makefile.in
 @@ -60,9 +60,6 @@ export_files:
@@ -30,5 +29,5 @@ index 1fa3344..f635d76 100644
  
  exports.c: export_files
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 78a04d9af4..5d82919685 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -1,4 +1,4 @@
-From dfa834ebd449df299f54e98f0fb3a7bb4008fb03 Mon Sep 17 00:00:00 2001
+From 37699e9be04d83c5923644e298f400e077f76e85 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] Log the SELinux context at startup.
@@ -8,17 +8,16 @@ Log the SELinux context at startup.
 Upstream-Status: Inappropriate [other]
 
 Note: unlikely to be any interest in this upstream
-
 ---
  configure.in  |  5 +++++
  server/core.c | 26 ++++++++++++++++++++++++++
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index dc6ea15..caa6f54 100644
+index c799aec..76811e7 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -466,6 +466,11 @@ getloadavg
+@@ -491,6 +491,11 @@ getloadavg
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -31,10 +30,10 @@ index dc6ea15..caa6f54 100644
  [AC_TRY_RUN(#define _GNU_SOURCE
  #include <unistd.h>
 diff --git a/server/core.c b/server/core.c
-index 7aa841f..79f34db 100644
+index 3020090..8fef5fd 100644
 --- a/server/core.c
 +++ b/server/core.c
-@@ -59,6 +59,10 @@
+@@ -65,6 +65,10 @@
  #include <unistd.h>
  #endif
  
@@ -45,7 +44,7 @@ index 7aa841f..79f34db 100644
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
  #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 0)
-@@ -4984,6 +4988,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
  
@@ -75,5 +74,5 @@ index 7aa841f..79f34db 100644
  }
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch b/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
index 47320a9ee5..7b4a1b932b 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0005-replace-lynx-to-curl-in-apachectl-script.patch
@@ -1,4 +1,4 @@
-From 7db1b650bb4b01a5194a34cd7573f915656a595b Mon Sep 17 00:00:00 2001
+From e59aab44a28c654e518080693d573ca472ca5a08 Mon Sep 17 00:00:00 2001
 From: Yulong Pei <Yulong.pei@windriver.com>
 Date: Thu, 1 Sep 2011 01:03:14 +0800
 Subject: [PATCH] replace lynx to curl in apachectl script
@@ -48,5 +48,5 @@ index 3281c2e..6ab4ba5 100644
  *)
      $HTTPD "$@"
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch b/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
index 227d04064b..dbaf01d2c5 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0006-apache2-fix-the-race-issue-of-parallel-installation.patch
@@ -1,4 +1,4 @@
-From 4f4d7d6b88b6e440263ebeb22dfb40c52bb30fd8 Mon Sep 17 00:00:00 2001
+From fb09f1fe4525058b16b3d4edb2e3ae693154026e Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@freescale.com>
 Date: Fri, 25 Jan 2013 18:10:50 +0800
 Subject: [PATCH] apache2: fix the race issue of parallel installation
@@ -31,5 +31,5 @@ index e2d5bb6..dde5ae0 100755
          pathcomp="$pathcomp/"
      done
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
index fed6b5010b..3ff6894409 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
@@ -1,4 +1,4 @@
-From 964ef2c1af74984602f46e7db938d3b95b148385 Mon Sep 17 00:00:00 2001
+From 0686564f64130f230870db8b4846973e3edbd646 Mon Sep 17 00:00:00 2001
 From: Wenzong Fan <wenzong.fan@windriver.com>
 Date: Mon, 1 Dec 2014 02:08:27 -0500
 Subject: [PATCH] apache2: allow to disable selinux support
@@ -11,10 +11,10 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index caa6f54..eab2090 100644
+index 76811e7..4df3ff3 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -466,10 +466,16 @@ getloadavg
+@@ -491,10 +491,16 @@ getloadavg
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -36,5 +36,5 @@ index caa6f54..eab2090 100644
  AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
  [AC_TRY_RUN(#define _GNU_SOURCE
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch b/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
similarity index 85%
rename from meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
index 61669e3641..dc5b5c88f2 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/apache-configure_perlbin.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0008-Fix-perl-install-directory-to-usr-bin.patch
@@ -1,4 +1,4 @@
-From 5412077c398dec74321388fe6e593a44c4c80de6 Mon Sep 17 00:00:00 2001
+From 443d15b91d4e4979d92405610303797663f31102 Mon Sep 17 00:00:00 2001
 From: echo <fei.geng@windriver.com>
 Date: Tue, 28 Apr 2009 03:11:06 +0000
 Subject: [PATCH] Fix perl install directory to /usr/bin
@@ -11,16 +11,15 @@ error:
 bad interpreter: No such file or directory
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  configure.in | 5 +----
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index d828512..be7bd25 100644
+index 4df3ff3..4eeb609 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -855,10 +855,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
+@@ -903,10 +903,7 @@ AC_DEFINE_UNQUOTED(SERVER_CONFIG_FILE, "${rel_sysconfdir}/${progname}.conf",
  AC_DEFINE_UNQUOTED(AP_TYPES_CONFIG_FILE, "${rel_sysconfdir}/mime.types",
  	[Location of the MIME types config file, relative to the Apache root directory])
  
@@ -32,3 +31,6 @@ index d828512..be7bd25 100644
  AC_SUBST(perlbin)
  
  dnl If we are running on BSD/OS, we need to use the BSD .include syntax.
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch b/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
similarity index 90%
rename from meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
index bdedd146c2..d1f9bb0f43 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0001-support-apxs.in-force-destdir-to-be-empty-string.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0009-support-apxs.in-force-destdir-to-be-empty-string.patch
@@ -1,10 +1,10 @@
-From 705c0a7e9d9c1e64ee09fc0b54f6b5a4e27de1ca Mon Sep 17 00:00:00 2001
+From 43a4ad04e0d8771267a73f98b5918bcd10b167ec Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Fri, 17 Apr 2020 06:31:35 -0700
 Subject: [PATCH] support/apxs.in: force destdir to be empty string
 
-If destdir is assigned to anything other than the empty string, the 
-search path for apache2 config files is appended to itself, and 
+If destdir is assigned to anything other than the empty string, the
+search path for apache2 config files is appended to itself, and
 related packages like apache-websocket will be unable to locate them:
 
 | cannot open
@@ -24,7 +24,7 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/support/apxs.in b/support/apxs.in
-index 65e1288527..9d96e33728 100644
+index b2705fa..781f2ab 100644
 --- a/support/apxs.in
 +++ b/support/apxs.in
 @@ -28,10 +28,12 @@ package apxs;
@@ -45,5 +45,5 @@ index 65e1288527..9d96e33728 100644
  my %config_vars = ();
  
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch b/meta-webserver/recipes-httpd/apache2/apache2/0010-apache2-do-not-use-relative-path-for-gen_test_char.patch
similarity index 86%
rename from meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch
rename to meta-webserver/recipes-httpd/apache2/apache2/0010-apache2-do-not-use-relative-path-for-gen_test_char.patch
index 82e9e8c35f..ced8469f3a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0008-apache2-do-not-use-relative-path-for-gen_test_char.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0010-apache2-do-not-use-relative-path-for-gen_test_char.patch
@@ -1,16 +1,15 @@
-From b62c4cd2295c98b2ebe12641e5f01590bd96ae94 Mon Sep 17 00:00:00 2001
+From d9993cbc33565c0acd29b0127d651dafa2a16975 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 17 Jul 2012 11:27:39 +0100
 Subject: [PATCH] apache2: do not use relative path for gen_test_char
 
 Upstream-Status: Inappropriate [embedded specific]
-
 ---
  server/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/server/Makefile.in b/server/Makefile.in
-index f635d76..0d48924 100644
+index 8c0c396..3544f55 100644
 --- a/server/Makefile.in
 +++ b/server/Makefile.in
 @@ -29,7 +29,7 @@ gen_test_char: $(gen_test_char_OBJECTS)
@@ -23,5 +22,5 @@ index f635d76..0d48924 100644
  util.lo: test_char.h
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
similarity index 96%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
index 10123aa2bb..225f6fc4f6 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.52.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
@@ -13,12 +13,12 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0005-replace-lynx-to-curl-in-apachectl-script.patch \
            file://0006-apache2-fix-the-race-issue-of-parallel-installation.patch \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
-           file://apache-configure_perlbin.patch \
-           file://0001-support-apxs.in-force-destdir-to-be-empty-string.patch \
+           file://0008-Fix-perl-install-directory-to-usr-bin.patch \
+           file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
           "
 
-SRC_URI_append_class-target = " \
-           file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
+SRC_URI:append:class-target = " \
+           file://0010-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
@@ -26,7 +26,7 @@ SRC_URI_append_class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "0127f7dc497e9983e9c51474bed75e45607f2f870a7675a86dc90af6d572f5c9"
+SRC_URI[sha256sum] = "d0bbd1121a57b5f2a6ff92d7b96f8050c5a45d3f14db118f64979d525858db63"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


