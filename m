Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DABE175791
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 07:29:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98762745"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 15:33:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N7RnZ6017960
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:27:49 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 23 Jul 2015 15:29:37 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 23 Jul 2015 15:29:31 +0800
Message-ID: <1437636571-4435-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH] libcap-ng: upgrade 0.7.4 -> 0.7.7
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
X-List-Received-Date: Thu, 23 Jul 2015 07:29:41 -0000
Content-Type: text/plain

Update python.patch,since the contents has been changed.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../libcap-ng/libcap-ng/python.patch               | 55 +++++++++++++++-------
 .../{libcap-ng_0.7.4.bb => libcap-ng_0.7.7.bb}     |  8 ++--
 2 files changed, 42 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-support/libcap-ng/{libcap-ng_0.7.4.bb => libcap-ng_0.7.7.bb} (85%)

diff --git a/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch b/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
index d82ceb4..59591eb 100644
--- a/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
+++ b/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
@@ -1,16 +1,44 @@
-configure.ac - Avoid an incorrect check for python.
-Makefile.am - avoid hard coded host include paths.
+From b01bb2694f66cd981e6d61523433dc3eb5ed32f2 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Sat, 18 Jul 2015 23:03:30 +0900
+Subject: [PATCH] configure.ac - Avoid an incorrect check for python.
+ Makefile.am - avoid hard coded host include paths.
+
+Upstream-Status: pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
+---
+ bindings/python/Makefile.am |  3 ++-
+ configure.ac                | 15 ++-------------
+ 2 files changed, 4 insertions(+), 14 deletions(-)
 
---- libcap-ng-0.6.5/configure.ac.orig	2012-01-17 13:59:03.645898989 -0600
-+++ libcap-ng-0.6.5/configure.ac	2012-01-17 13:59:46.353959252 -0600
-@@ -120,17 +120,8 @@
+diff --git a/bindings/python/Makefile.am b/bindings/python/Makefile.am
+index 82b9bb8..f9fe7a8 100644
+--- a/bindings/python/Makefile.am
++++ b/bindings/python/Makefile.am
+@@ -23,7 +23,8 @@ SUBDIRS = test
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+ AM_CFLAGS = -fPIC -DPIC
+ PYLIBVER ?= python$(PYTHON_VERSION)
+-AM_CPPFLAGS = -I. -I$(top_builddir) -I@PYINCLUDEDIR@
++PYINC ?= /usr/include/$(PYLIBVER)
++AM_CPPFLAGS = -I. -I$(top_builddir) -I$(PYINC)
+ LIBS = $(top_builddir)/src/libcap-ng.la
+ SWIG_FLAGS = -python
+ SWIG_INCLUDES = ${AM_CPPFLAGS}
+diff --git a/configure.ac b/configure.ac
+index 1d777d5..9d90f64 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -123,19 +123,8 @@ if test x$use_python = xno ; then
  else
  AC_MSG_RESULT(testing)
  AM_PATH_PYTHON
--if test -f /usr/include/python${am_cv_python_version}/Python.h ; then
+-PYINCLUDEDIR=`python${am_cv_python_version} -c "from distutils import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'))"`
+-if test -f ${PYINCLUDEDIR}/Python.h ; then
 -	python_found="yes"
+-	AC_SUBST(PYINCLUDEDIR)
 -	AC_MSG_NOTICE(Python bindings will be built)
 -else
 -	python_found="no"
@@ -25,15 +53,6 @@ Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
  fi
  AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
  
---- libcap-ng-0.6.5/bindings/python/Makefile.am.orig	2010-11-03 12:31:59.000000000 -0500
-+++ libcap-ng-0.6.5/bindings/python/Makefile.am	2012-01-17 14:05:50.199834467 -0600
-@@ -24,7 +24,8 @@
- CONFIG_CLEAN_FILES = *.loT *.rej *.orig
- AM_CFLAGS = -fPIC -DPIC
- PYLIBVER ?= python$(PYTHON_VERSION)
--INCLUDES = -I. -I$(top_builddir) -I/usr/include/$(PYLIBVER)
-+PYINC ?= /usr/include/$(PYLIBVER)
-+INCLUDES = -I. -I$(top_builddir) -I$(PYINC)
- LIBS = $(top_builddir)/src/libcap-ng.la
- pyexec_PYTHON = capng.py
- pyexec_LTLIBRARIES = _capng.la
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb b/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
similarity index 85%
rename from meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb
rename to meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
index 8823dad..5bf3459 100644
--- a/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb
+++ b/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
@@ -8,15 +8,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar.gz \
-	   file://python.patch"
+           file://python.patch"
 
 inherit lib_package autotools pythonnative
 
-SRC_URI[md5sum] = "55c57c0673b944ea1a755bcb2636dabd"
-SRC_URI[sha256sum] = "48a2083276f9820cb92dcb05d001b30733bcbf48c14c230303cac3cd08b45b6b"
+SRC_URI[md5sum] = "3d7d126b29e2869a0257c17c8b0d9b2e"
+SRC_URI[sha256sum] = "615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963f6d06b"
 
 DEPENDS += "swig-native python"
 
+EXTRA_OECONF += "--without-python3"
+
 EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
 
 PACKAGES += "${PN}-python"
-- 
1.8.4.2


