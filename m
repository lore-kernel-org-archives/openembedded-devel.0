Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6F06FF7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 09:36:45 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id bs8so5461418wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 02:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z+Blck6JR9GC/cEXJvB0+ZyzAmTKJqZkADh+rN+aGwk=;
	b=etTq0oB41ELJ4mpajUliB2AoTBBd6NUS5tsuhXj0MN7WAdXyATqq/zLZZ1hynwHZue
	j24VGNfQHVVl/0MQbgqTkOmg75gr01bLDXToZPDtoHODW/g+wqb/87rJUzP2ReAk/yxY
	k3zOjwCmTp40Rej7qX7Oru46e0PxF0bt9QfR8rlQpaJzKjqTcMYsZu3nsdB/sd8tykw/
	YmFLF+hqlafMoBDTJjgXHtFrIUAfX9XDeKQwEoVwIFfQ4IfFk1RkmyOiH9bpLOQBM+VV
	lGvEtG7mWVSIqMXvtuQf1OIdhf/Ub77zrpB31cEbLwAZl7NP+69xiGmWpurl6/KuVW5x
	gNqA==
X-Gm-Message-State: ALoCoQm2F8jfjG9Mzado9YvalOD45hQG/tQCdAld+xzOIiCkM01xTxwpryaKMC8VJ02FufrWKzBH
X-Received: by 10.194.240.196 with SMTP id wc4mr35058718wjc.63.1402997805101; 
	Tue, 17 Jun 2014 02:36:45 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	cz4sm19155671wib.23.2014.06.17.02.36.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jun 2014 02:36:44 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 11:36:38 +0200
Message-Id: <1402997798-28328-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCHv2] php 5.4.14: use pkg-config for libxml2 detection
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
X-List-Received-Date: Tue, 17 Jun 2014 09:36:46 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...cinclude-use-pkgconfig-for-libxml2-config.patch | 89 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_5.4.14.bb         |  4 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
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


