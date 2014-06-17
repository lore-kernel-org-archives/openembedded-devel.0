Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id CCC3B6FEB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 08:15:26 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so5327397wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 01:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NXEicVxQnvdJAzrk5W64Z8LXpF8Szolt8KORdheadOY=;
	b=SCtK+x6Ysb9iBTXXmS9h1Sbl2k4BYvC/CMBnf5JR9WiotTQQDYjRLG6lWCIOz2APfg
	FsPLUdNR/gGEigvwuDdUYHkUnyYkiiWrDOCl5tl34VdISWTkguZXD9hcqkES4qxpBr86
	tE96LEW2yLBeZ3UlIGUqn6LYlMvBe05Q44rWGJtCYfaJQpK3JgC+UoUVvIi2veN7277C
	vDBamRWHArNbKkZEwmfpc8q/wUAr6BncnFL8r4X60ZcRG8JnzalhAxsFxqtaCmC4l+Sg
	34WzYN4dGq7S6o3TiA50fRBhvQeVf4LcejJOL2g2atRIT1CTbcE4jr6ChCC0JsRHfNM1
	IYmg==
X-Gm-Message-State: ALoCoQlud2v36aKN9+qw8Xx5eHtvLU5q0esYKKOEbvX1pfkb32ugD9TR6lyLfKLaMS9vbL1oYSGr
X-Received: by 10.194.119.34 with SMTP id kr2mr36258353wjb.34.1402992926795;
	Tue, 17 Jun 2014 01:15:26 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	gp6sm18801789wib.12.2014.06.17.01.15.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jun 2014 01:15:26 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 10:15:24 +0200
Message-Id: <1402992924-28244-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] php 5.4.14: use pkg-config for libxml2 detection
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jun 2014 08:15:36 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...cinclude-use-pkgconfig-for-libxml2-config.patch | 89 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.4.14.bb         |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch

diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
new file mode 100644
index 0000000..479688c
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
@@ -0,0 +1,89 @@
+From 8d758d381b3c2c2118cc486a1dac312e98cfb971 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Tue, 17 Jun 2014 09:53:00 +0200
+Subject: [PATCH] acinclude: use pkgconfig for libxml2 config
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+Upstream-Status: pending
+---
+ acinclude.m4 | 62 +++++++++++++++++++++---------------------------------------
+ 1 file changed, 22 insertions(+), 40 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index c41c507..b89db84 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2528,48 +2528,30 @@ dnl
+ dnl Common setup macro for libxml
+ dnl
+ AC_DEFUN([PHP_SETUP_LIBXML], [
+-AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
+-[
+-
+-      ac_cv_php_xml2_config_path="$PHP_LIBXML_DIR/xml2-config"
+-
++PKG_CHECK_MODULES([LIBXML], [libxml-2.0 > 2.6.11], [
++  PHP_EVAL_LIBLINE($LIBXML_LIBS, $1)
++  PHP_EVAL_INCLINE($LIBXML_CFLAGS)
++
++  dnl Check that build works with given libs
++  AC_CACHE_CHECK(whether libxml build works, php_cv_libxml_build_works, [
++    PHP_TEST_BUILD(xmlInitParser,
++    [
++      php_cv_libxml_build_works=yes
++    ], [
++      AC_MSG_RESULT(no)
++      AC_MSG_ERROR([build test failed.  Please check the config.log for details.])
++    ], [
++      [$]$1
++    ])
++  ])
++  if test "$php_cv_libxml_build_works" = "yes"; then
++    AC_DEFINE(HAVE_LIBXML, 1, [ ])
++    $2
++  fi
++], [
++  AC_MSG_ERROR([$LIBXML_PKG_ERRORS])
+ ])
+ 
+-  if test -x "$ac_cv_php_xml2_config_path"; then
+-    XML2_CONFIG="$ac_cv_php_xml2_config_path"
+-    libxml_full_version=`$XML2_CONFIG --version`
+-    ac_IFS=$IFS
+-    IFS="."
+-    set $libxml_full_version
+-    IFS=$ac_IFS
+-    LIBXML_VERSION=`expr [$]1 \* 1000000 + [$]2 \* 1000 + [$]3`
+-    if test "$LIBXML_VERSION" -ge "2006011"; then
+-      LIBXML_LIBS=`$XML2_CONFIG --libs`
+-      LIBXML_INCS=`$XML2_CONFIG --cflags`
+-      PHP_EVAL_LIBLINE($LIBXML_LIBS, $1)
+-      PHP_EVAL_INCLINE($LIBXML_INCS)
+-
+-      dnl Check that build works with given libs
+-      AC_CACHE_CHECK(whether libxml build works, php_cv_libxml_build_works, [
+-        PHP_TEST_BUILD(xmlInitParser,
+-        [
+-          php_cv_libxml_build_works=yes
+-        ], [
+-          AC_MSG_RESULT(no)
+-          AC_MSG_ERROR([build test failed.  Please check the config.log for details.])
+-        ], [
+-          [$]$1
+-        ])
+-      ])
+-      if test "$php_cv_libxml_build_works" = "yes"; then
+-        AC_DEFINE(HAVE_LIBXML, 1, [ ])
+-      fi
+-      $2
+-    else
+-      AC_MSG_ERROR([libxml2 version 2.6.11 or greater required.])
+-    fi
+-ifelse([$3],[],,[else $3])
+-  fi
+ ])
+ 
+ dnl -------------------------------------------------------------------------
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-devtools/php/php_5.4.14.bb b/meta-oe/recipes-devtools/php/php_5.4.14.bb
index 4e0efb1..ad878e5 100644
--- a/meta-oe/recipes-devtools/php/php_5.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_5.4.14.bb
@@ -13,6 +13,7 @@ SRC_URI_append_pn-php += "file://iconv.patch \
             file://phar-makefile.patch \
             file://php_exec_native.patch \
             file://fix-fpm-cross-compile.patch \
+            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
 "
-- 
1.9.3


