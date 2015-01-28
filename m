Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1E436718E9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 19:59:58 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id rp18so24255810iec.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 11:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xPAL3Sqo5YFaO9/bidLnTBr1Fd5FdVq/SYkK2IaWni8=;
	b=CMa4DUeX5a24EZW9TLJ4DS8mQWmF2lQ7fdRw5JuATnLjr9gvHC8hztgLQ+VXl+huzL
	TPjWtZnqz2A+s31aOk86LW5GPv8IIxGurgAdD2fzGRsoXzTL1d0KMAyRTwcG6Z6WtyJ/
	ncdRXyNOnH2mIRYX9nDVA2bQVhuEtn8a63iyL05usUv5cxqIZexdCr+LwweWUwf0L3Qf
	BCjLUvFjSAYVlgaw8O6lYV0W0JWluT51jxjTgtncdgtzDiYE2+PBeiK+2hXJsHT3hlq9
	5jgyUUqX/t7BHrFivlGfTxCG2YfIEdWsX+QsX/S2e95WG5BOMa9rcTcmFKM+7mkvr1s+
	AnNQ==
X-Received: by 10.50.43.169 with SMTP id x9mr5756144igl.28.1422475199111;
	Wed, 28 Jan 2015 11:59:59 -0800 (PST)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id s17sm9947499igr.2.2015.01.28.11.59.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Jan 2015 11:59:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:59:47 -0800
Message-Id: <1422475187-9011-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][PATCH] libcap-ng: move pakage from other layers
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
X-List-Received-Date: Wed, 28 Jan 2015 19:59:59 -0000

From: Armin Kuster <akuster@mvista.com>

Please consider this package for inclusion to meta-oe so we
can remove it from both meta-security and meta-selinux.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libcap-ng/libcap-ng/python.patch               | 39 ++++++++++++++++++++++
 .../recipes-support/libcap-ng/libcap-ng_0.7.4.bb   | 37 ++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
 create mode 100644 meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb

diff --git a/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch b/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
new file mode 100644
index 0000000..d82ceb4
--- /dev/null
+++ b/meta-oe/recipes-support/libcap-ng/libcap-ng/python.patch
@@ -0,0 +1,39 @@
+configure.ac - Avoid an incorrect check for python.
+Makefile.am - avoid hard coded host include paths.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- libcap-ng-0.6.5/configure.ac.orig	2012-01-17 13:59:03.645898989 -0600
++++ libcap-ng-0.6.5/configure.ac	2012-01-17 13:59:46.353959252 -0600
+@@ -120,17 +120,8 @@
+ else
+ AC_MSG_RESULT(testing)
+ AM_PATH_PYTHON
+-if test -f /usr/include/python${am_cv_python_version}/Python.h ; then
+-	python_found="yes"
+-	AC_MSG_NOTICE(Python bindings will be built)
+-else
+-	python_found="no"
+-	if test x$use_python = xyes ; then
+-		AC_MSG_ERROR([Python explicitly required and python headers found])
+-	else
+-		AC_MSG_WARN("Python headers not found - python bindings will not be made")
+-	fi
+-fi
++python_found="yes"
++AC_MSG_NOTICE(Python bindings will be built)
+ fi
+ AM_CONDITIONAL(HAVE_PYTHON, test ${python_found} = "yes")
+ 
+--- libcap-ng-0.6.5/bindings/python/Makefile.am.orig	2010-11-03 12:31:59.000000000 -0500
++++ libcap-ng-0.6.5/bindings/python/Makefile.am	2012-01-17 14:05:50.199834467 -0600
+@@ -24,7 +24,8 @@
+ CONFIG_CLEAN_FILES = *.loT *.rej *.orig
+ AM_CFLAGS = -fPIC -DPIC
+ PYLIBVER ?= python$(PYTHON_VERSION)
+-INCLUDES = -I. -I$(top_builddir) -I/usr/include/$(PYLIBVER)
++PYINC ?= /usr/include/$(PYLIBVER)
++INCLUDES = -I. -I$(top_builddir) -I$(PYINC)
+ LIBS = $(top_builddir)/src/libcap-ng.la
+ pyexec_PYTHON = capng.py
+ pyexec_LTLIBRARIES = _capng.la
diff --git a/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb b/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb
new file mode 100644
index 0000000..2e778cb
--- /dev/null
+++ b/meta-oe/recipes-support/libcap-ng/libcap-ng_0.7.4.bb
@@ -0,0 +1,37 @@
+SUMMARY = "An alternate posix capabilities library"
+DESCRIPTION = "The libcap-ng library is intended to make programming \
+with POSIX capabilities much easier than the traditional libcap library."
+HOMEPAGE = "http://freecode.com/projects/libcap-ng"
+SECTION = "base"
+LICENSE = "GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
+
+SRC_URI = "http://people.redhat.com/sgrubb/${BPN}/${BP}.tar.gz \
+	   file://python.patch"
+
+inherit lib_package autotools pythonnative
+
+SRC_URI[md5sum] = "55c57c0673b944ea1a755bcb2636dabd"
+SRC_URI[sha256sum] = "48a2083276f9820cb92dcb05d001b30733bcbf48c14c230303cac3cd08b45b6b"
+
+DEPENDS += "swig-native python"
+
+EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
+
+PACKAGES += "${PN}-python"
+
+FILES_${PN}-dbg += "${libdir}/python${PYTHON_BASEVERSION}/*/.debug"
+FILES_${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
+
+BBCLASSEXTEND = "native"
+
+do_install_append() {
+	# Moving libcap-ng to base_libdir
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		mkdir -p ${D}/${base_libdir}/
+		mv -f ${D}${libdir}/libcap-ng.so.* ${D}${base_libdir}/
+		relpath=${@os.path.relpath("${base_libdir}", "${libdir}")}
+		ln -sf ${relpath}/libcap-ng.so.0.0.0 ${D}${libdir}/libcap-ng.so
+	fi
+}
-- 
1.9.1


