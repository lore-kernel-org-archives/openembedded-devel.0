Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB6B6A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 04:39:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9D4dBGb020652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 21:39:12 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 12 Oct 2014 21:39:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Oct 2014 12:39:14 +0800
Message-ID: <1413175154-19149-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] modphp: using PKGCONFIG and PACKAGECONFIG for libxml and soap
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
X-List-Received-Date: Mon, 13 Oct 2014 04:39:13 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../0001-using-pkgconfig-to-check-libxml.patch     |   74 ++++++++++++++++++++
 meta-webserver/recipes-php/modphp/modphp5.inc      |    6 +-
 2 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch

diff --git a/meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch b/meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch
new file mode 100644
index 0000000..bab5ff2
--- /dev/null
+++ b/meta-webserver/recipes-php/modphp/files/0001-using-pkgconfig-to-check-libxml.patch
@@ -0,0 +1,74 @@
+[PATCH] using pkgconfig to check libxml
+
+Upstream-Status: Pending
+
+Use pkg-config for the libxml2 dependency, not the -config script.
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ acinclude.m4 | 48 ++++++------------------------------------------
+ 1 file changed, 6 insertions(+), 42 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index d348f57..9f691a5 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2530,49 +2530,13 @@ dnl
+ dnl Common setup macro for libxml
+ dnl
+ AC_DEFUN([PHP_SETUP_LIBXML], [
+-AC_CACHE_CHECK([for xml2-config path], ac_cv_php_xml2_config_path,
+-[
+-  for i in $PHP_LIBXML_DIR /usr/local /usr; do
+-    if test -x "$i/bin/xml2-config"; then
+-      ac_cv_php_xml2_config_path="$i/bin/xml2-config"
+-      break
+-    fi
+-  done
+-])
++  PKG_CHECK_MODULES(PKG_XML2, [libxml-2.0],,)
++  if test "x$PKG_XML2_CFLAGS" != "x"; then
++    PHP_EVAL_INCLINE($PKG_XML2_CFLAGS, $1)
++    PHP_EVAL_LIBLINE($PKG_XML2_LIBS)
++    AC_DEFINE(HAVE_LIBXML, 1, [ ])
++    $2
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
+ ifelse([$3],[],,[else $3])
+   fi
+ ])
+-- 
+1.9.1
+
diff --git a/meta-webserver/recipes-php/modphp/modphp5.inc b/meta-webserver/recipes-php/modphp/modphp5.inc
index 6932429..c1cdf72 100644
--- a/meta-webserver/recipes-php/modphp/modphp5.inc
+++ b/meta-webserver/recipes-php/modphp/modphp5.inc
@@ -8,13 +8,14 @@ SRC_URI = "http://www.php.net/distributions/php-${PV}.tar.bz2 \
            file://configure.patch \
            file://pthread-check-threads-m4.patch \
            file://70_mod_php5.conf \
+           file://0001-using-pkgconfig-to-check-libxml.patch \
 "
 
 S = "${WORKDIR}/php-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=52dd90569008fee5bcdbb22d945b1108"
 
-inherit autotools
+inherit autotools pkgconfig
 
 CFLAGS += " -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED -I${STAGING_INCDIR}/apache2"
 
@@ -32,7 +33,6 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
                 --disable-xmlreader \
                 --disable-xmlwriter \
                 --disable-simplexml \
-                --disable-libxml \
                 --disable-dom \
                 --disable-rpath \
                 --libdir=${libdir}/php5 \
@@ -47,6 +47,8 @@ EXTRA_OECONF = "--with-apxs2=${STAGING_BINDIR_CROSS}/apxs \
 PACKAGECONFIG ??= "mysql"
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config,--without-mysqli,mysql5"
 PACKAGECONFIG[pgsql] = "--with-pgsql=${STAGING_DIR_TARGET}${exec_prefix},--without-pgsql,mysql5"
+PACKAGECONFIG[libxml] = "--enable-libxml,--disable-libxml,libxml2"
+PACKAGECONFIG[soap] = "--enable-libxml --enable-soap, --disable-soap, libxml2"
 
 acpaths = ""
 
-- 
1.7.10.4


