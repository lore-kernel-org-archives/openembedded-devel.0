Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F31C3DA4A
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 23:24:16 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.48496.1736119455659038775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jan 2025 15:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WnGvw2Oj;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so2686897276.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 15:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736119455; x=1736724255; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFkfYL3U/bo6/Wz0tMrew8geus4CPIfm1NjXZmjnYeI=;
        b=WnGvw2Oj3zhGYCRZCqmOXSRL5b9xv1Cg6dC1g9Q+dQJv4T9BJeBvETmdN3sbq/sYOK
         H7lAe+/JB4jTlVj8h4PKDTRgf8yOxdg9FetD2JS9SVIPgfcscaw/Hg1lZ8Mk6wz0H8Q2
         nbijaPW6mge0l6hiM5JP+B2YAPGw6KbCxCQXYLNiARZ6PhtB3DDinx/laQj0mg0LBgcW
         WUfoJk2DYSXZJINVKrcEaasg+lSfb1uRPECImbQ56KvQxyDPNMuRiWGK6+HAWsaThPf2
         6KToI9knSLGumd2ZFO3QiDnCRkG2Ku2AMQCvccKdzFAyEGmVAjWXtCADGhivMbn0QoS2
         03uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736119455; x=1736724255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFkfYL3U/bo6/Wz0tMrew8geus4CPIfm1NjXZmjnYeI=;
        b=HPZzYdmcdtQ3sT909WNVriDxTyIHqqyWoIX5XpaKZ1AaD86GmqKS2jx1UWSmqYEork
         ZUeYJawuSpPlTQpTxJIQxhb4+VvGSpjstJo+ewx/hmaX9A/fa+vFIUf98LWhIZJTgwtq
         Kje7m5wEdnfFlAHdI+loIj89e5F33hvmKzfM5rZ8QQ3BzpWga/cO/uUjXruwCw/Wst2V
         5DDiLpEb8m82UTYsKgrxFI1tFH8i9rCXqM8Q7cS/SkRQNDxfuZ/xTwdHs2I3ljJCng+g
         1fjG7YsNYIZlaSutXhKhKhDRd69EyFRHgBxqjL7qLRKltA3ov3e6DPf3jBltbywvliBT
         STAA==
X-Gm-Message-State: AOJu0YwxgXhMkDVj2kA4fkyeIm3Izvw8X6TWnSyQFXMEahcH4zuuKjEv
	2SLtAo2eK11HRYpAy0g9Zy+EKI4rHYWEWN+GkUZPsucOo+OL5ePSaznSGOFR
X-Gm-Gg: ASbGnctx9snRd7MeQ2nPmM9R11Kj5N2x3wLgcRkt+T/rpHQe1bG1DUfWhD01dc8EiwP
	PmRhygNU1S104FlwUi6hvwQEKNjYpGQIc3izO235XWiagwnFJSPSiW3+KUUNaGLJ3Qc2juBH4MV
	6LFRAAiXEHkWVfmyIROFW2vfHBpX9Dwrpq0rJaQu3fJNTKAmMCUwyf6jitKDiyJfkQSbRRgaKir
	qgacp1E+j+SMhnQet1qiE1uum9KqfifA0EF6w7RYL+gFKr88oJXg0fz0COa78BMNr+87g==
X-Google-Smtp-Source: AGHT+IFkc4BfXJ+iO9JAvTu3CgJkmx3+WCAHH55g8G7CcYwE16pLJJ3mJs3hqeYjpO0mcfv9horK8g==
X-Received: by 2002:a25:21d7:0:b0:e30:cc34:af1a with SMTP id 3f1490d57ef6-e538c39739amr31926004276.35.1736119454691;
        Sun, 05 Jan 2025 15:24:14 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:fdb3:610:ea25:f87f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e537cc1e91dsm9043004276.19.2025.01.05.15.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 15:24:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 23/24] php: upgrade 8.2.20 -> 8.2.26
Date: Sun,  5 Jan 2025 18:23:56 -0500
Message-ID: <20250105232358.1502946-23-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105232358.1502946-1-akuster808@gmail.com>
References: <20250105232358.1502946-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Jan 2025 23:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114653

From: Peter Marko <peter.marko@siemens.com>

Solves dozens of vulnerabilities. See
https://php.watch/versions/8.2/releases/8.2.21
https://php.watch/versions/8.2/releases/8.2.22
https://php.watch/versions/8.2/releases/8.2.23
https://php.watch/versions/8.2/releases/8.2.24
https://php.watch/versions/8.2/releases/8.2.25
https://php.watch/versions/8.2/releases/8.2.26

Removes CVE-2024-11233, CVE-2024-11234 and CVE-2024-11236 from
current cve metrics.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit eea7188a24eed79113ea363b9343c0579937ff77)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../php/php/0001-ext-opcache-config.m4-enable-opcache.patch   | 4 ++--
 .../php/0002-build-php.m4-don-t-unset-cache-variables.patch   | 2 +-
 .../0003-php-remove-host-specific-info-from-header-file.patch | 2 +-
 .../php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch  | 4 +++-
 .../php/php/0008-ext-imap-config.m4-fix-include-paths.patch   | 4 ++--
 .../php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch | 3 +--
 .../recipes-devtools/php/php/0010-iconv-fix-detection.patch   | 2 +-
 meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} | 2 +-
 8 files changed, 12 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.26.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
index c743697469..009d4d650f 100644
--- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
@@ -247,8 +247,8 @@ index 6bf07ad3..5d645b86 100644
 +  have_shm_mmap_posix=yes
 +  PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
  
-   PHP_NEW_EXTENSION(opcache,
- 	ZendAccelerator.c \
+   AX_CHECK_COMPILE_FLAG([-Wno-implicit-fallthrough],
+     [PHP_OPCACHE_CFLAGS="$PHP_OPCACHE_CFLAGS -Wno-implicit-fallthrough"],,
 -- 
 2.40.0
 
diff --git a/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch b/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
index 6183f49c28..2e1e752d61 100644
--- a/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
+++ b/meta-oe/recipes-devtools/php/php/0002-build-php.m4-don-t-unset-cache-variables.patch
@@ -31,7 +31,7 @@ index 9746ba28f3..93551d9ca7 100644
    unset found
    AC_CHECK_LIB($2, $1, [found=yes], [
      AC_CHECK_LIB($2, __$1, [found=yes], [found=no])
-@@ -1601,8 +1599,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
+@@ -1604,8 +1602,6 @@ dnl and as a fall back in the specified library. Defines HAVE_func and
  dnl HAVE_library if found and adds the library to LIBS.
  dnl
  AC_DEFUN([PHP_CHECK_FUNC],[
diff --git a/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch b/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
index 9637ed9516..1aa28e2add 100644
--- a/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
+++ b/meta-oe/recipes-devtools/php/php/0003-php-remove-host-specific-info-from-header-file.patch
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 1eafd62a44..90c94323aa 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1289,7 +1289,7 @@ PHP_REMOVE_USR_LIB(LDFLAGS)
+@@ -1462,7 +1462,7 @@ PHP_REMOVE_USR_LIB(LDFLAGS)
  EXTRA_LDFLAGS="$EXTRA_LDFLAGS $PHP_LDFLAGS"
  EXTRA_LDFLAGS_PROGRAM="$EXTRA_LDFLAGS_PROGRAM $PHP_LDFLAGS"
  
diff --git a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
index acf2940839..04bd40f4ff 100644
--- a/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
+++ b/meta-oe/recipes-devtools/php/php/0006-ext-phar-Makefile.frag-Fix-phar-packaging.patch
@@ -18,9 +18,11 @@ Signed-off-by: Claude Bing <cbing@cybernetics.com>
  ext/phar/Makefile.frag | 17 +++--------------
  1 file changed, 3 insertions(+), 14 deletions(-)
 
+diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
+index 7a867dd7..4dbcafd4 100644
 --- a/ext/phar/Makefile.frag
 +++ b/ext/phar/Makefile.frag
-@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir
+@@ -10,20 +10,9 @@ pharcmd: $(builddir)/phar.php $(builddir)/phar.phar
  
  PHP_PHARCMD_SETTINGS = -n -d 'open_basedir=' -d 'output_buffering=0' -d 'memory_limit=-1' -d phar.readonly=0
  PHP_PHARCMD_EXECUTABLE = ` \
diff --git a/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch b/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
index 78bae58e00..a1b93a2369 100644
--- a/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
+++ b/meta-oe/recipes-devtools/php/php/0008-ext-imap-config.m4-fix-include-paths.patch
@@ -16,7 +16,7 @@ diff --git a/ext/imap/config.m4 b/ext/imap/config.m4
 index 5086a312d0..0e938bd544 100644
 --- a/ext/imap/config.m4
 +++ b/ext/imap/config.m4
-@@ -110,7 +110,7 @@ if test "$PHP_IMAP" != "no"; then
+@@ -122,7 +122,7 @@ if test "$PHP_IMAP" != "no"; then
      PHP_NEW_EXTENSION(imap, php_imap.c, $ext_shared,, -DZEND_ENABLE_STATIC_TSRMLS_CACHE=1)
      AC_DEFINE(HAVE_IMAP,1,[ ])
  
@@ -25,7 +25,7 @@ index 5086a312d0..0e938bd544 100644
        IMAP_INC_CHK()
        el[]IMAP_INC_CHK(/include/c-client)
        el[]IMAP_INC_CHK(/include/imap)
-@@ -199,13 +199,7 @@ if test "$PHP_IMAP" != "no"; then
+@@ -211,13 +211,7 @@ if test "$PHP_IMAP" != "no"; then
        AC_MSG_ERROR(Cannot find rfc822.h. Please check your c-client installation.)
      fi
  
diff --git a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
index b5a33cca7f..d329387e6c 100644
--- a/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
+++ b/meta-oe/recipes-devtools/php/php/0009-php-don-t-use-broken-wrapper-for-mkdir.patch
@@ -10,9 +10,8 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 update patch to version 8.0.12
 Signed-off-by: Claude Bing <cbing@cybernetics.com>
----
 Upstream-Status: Pending
-
+---
  build/Makefile.global | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch b/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
index e3b8cd4707..49fb3a5886 100644
--- a/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
+++ b/meta-oe/recipes-devtools/php/php/0010-iconv-fix-detection.patch
@@ -20,7 +20,7 @@ diff --git a/build/php.m4 b/build/php.m4
 index 93551d9ca7..dba50825fb 100644
 --- a/build/php.m4
 +++ b/build/php.m4
-@@ -1919,7 +1919,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
+@@ -1945,7 +1945,8 @@ AC_DEFUN([PHP_SETUP_ICONV], [
    unset ICONV_DIR
  
    dnl Check libc first if no path is provided in --with-iconv.
diff --git a/meta-oe/recipes-devtools/php/php_8.2.20.bb b/meta-oe/recipes-devtools/php/php_8.2.26.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.20.bb
rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
index f306b16931..f5e57ab36a 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.20.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "5dec6fa61c7b9c47aa1d76666be651f2642ed2bcf6cd8638c57e3571ce2aac61"
+SRC_URI[sha256sum] = "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


