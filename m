Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 987CC6FC96
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 06:04:35 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id u56so1836995wes.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 23:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dGGO+V6dknDGbjo1BE3Hv2ee5vGND+8++73wIaUm6Fo=;
	b=fPRe+cAZUQU00PUxyi7o7dStfomDkREfNzqya2ESwSQ+CvoDRDIoHSU9h5ZDmaOQtQ
	z/ZD9LkKEXqrImJGOiysMRWLpN3qhhqDZSOrvqGpxMq1hhEFkY12esNlVbMido+flVD7
	pAWlZ8blJcHfwBy+VFfBRagSHvE+SqKDzVTXgX6BQuOepVzvMCkDpL6q6FJsM3hZcceY
	CanDhsF2BFKSOp5/qJfY5HVXHnh1PymoTDSqwe9d4YTqIhxFMp5rhwOGNDGEB0EJju0z
	WSq2rwzKdKrn5V19gBleKqTqmLQ4CfGPW1tx7enB283CGMJwJ6MpdWXtQJXHYAiSyJaC
	DemQ==
X-Gm-Message-State: ALoCoQl45xzXzdTrD1HFUUdi52D9CMO9JS6l5hvAqc/bJdrmsPmZObk4Jx6yXnOzhWQBUDXQIl9b
X-Received: by 10.181.8.198 with SMTP id dm6mr3402767wid.30.1403157876499;
	Wed, 18 Jun 2014 23:04:36 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	hs8sm30201358wib.10.2014.06.18.23.04.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jun 2014 23:04:35 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 08:04:33 +0200
Message-Id: <1403157873-7960-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv3] php 5.4.14: use pkg-config for libxml2 detection
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
X-List-Received-Date: Thu, 19 Jun 2014 06:04:38 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---

Changes since v2:
	* AC_MSG_RESULT(yes) on success

php-native builds, but php still errors out with xml errors.

 ...cinclude-use-pkgconfig-for-libxml2-config.patch | 90 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.4.14.bb         |  4 +-
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch

diff --git a/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
new file mode 100644
index 0000000..acace8e
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0001-acinclude-use-pkgconfig-for-libxml2-config.patch
@@ -0,0 +1,90 @@
+From 0ff5d4adc9f5950d66738272b3ba88ef74f69117 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Tue, 17 Jun 2014 09:53:00 +0200
+Subject: [PATCH] acinclude: use pkgconfig for libxml2 config
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+Upstream-Status: pending
+---
+ acinclude.m4 | 63 ++++++++++++++++++++++--------------------------------------
+ 1 file changed, 23 insertions(+), 40 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 9c7a305..211dbd3 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2529,48 +2529,31 @@ dnl
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
++      AC_MSG_RESULT(yes)
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
index 4e0efb1..3c9d3c0 100644
--- a/meta-oe/recipes-devtools/php/php_5.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_5.4.14.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb564efdf78cce8ea6e4b5a4f7c05d97"
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://acinclude-xml2-config.patch \
-            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch"
+            file://0001-php-don-t-use-broken-wrapper-for-mkdir.patch \
+            file://0001-acinclude-use-pkgconfig-for-libxml2-config.patch \
+           "
 
 SRC_URI_append_pn-php += "file://iconv.patch \
             file://imap-fix-autofoo.patch \
-- 
1.9.3


