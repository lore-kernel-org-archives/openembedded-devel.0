Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6415DE7718B
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.154112.1734709061962836002
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BqI6H94U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20241220153739cefcdc19b7e1ee6bb8-c8zfha@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20241220153739cefcdc19b7e1ee6bb8
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=sBYE5nPZ//apLP2+RNawD7lOQfw8Xic5YDTj5i/Q1qw=;
 b=BqI6H94U9L1DldvvYWSB8DGyBPFHTB7lvwW2oVbsP2DqOoXgITn7cDaEZKnrBPfVx5Q3yP
 tXbSe7FiciYLkQvVI/1PRPUaZJbOj2m4iSJd2stRLD5OhvY9+j+izHDb7YgWHyBm2u1vUv2d
 8Pyr9Me7NNgkZ1jXLiWrrWYe2EotvrBZ3IwsQHO5yQFBu921bVyclGEPmePDSWpBTvvoRBU0
 iOy+sRFTeq0ASqQCjd9D8GRW/2aLFWcci3wJ6FcDm1mOuLggFrUE7v9YEYxe5H9kdusqJre4
 9sTg2rUwfI24MJE/xWOLhgN7gBfnxi+i0Xx5+vtnDbe4EQ+45ztU5fKw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 05/11] php: upgrade 8.2.20 -> 8.2.26
Date: Fri, 20 Dec 2024 16:36:23 +0100
Message-Id: <20241220153629.2499631-6-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114441

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
2.30.2


