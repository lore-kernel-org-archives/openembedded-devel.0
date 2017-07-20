Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7AF78284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:44:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6K7iljN024046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 20 Jul 2017 00:44:47 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 00:44:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jul 2017 03:44:33 -0400
Message-ID: <b6f696a6b89d0373705f4d3777918c03a5f8435e.1500536448.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500536448.git.hongxu.jia@windriver.com>
References: <cover.1500536448.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 6/8] satyr: add recipe 0.23
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 07:44:46 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../satyr/files/0001-do-not-support-python2.patch  | 84 ++++++++++++++++++++++
 meta-oe/recipes-support/satyr/satyr_0.23.bb        | 32 +++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
 create mode 100644 meta-oe/recipes-support/satyr/satyr_0.23.bb

diff --git a/meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch b/meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
new file mode 100644
index 0000000..9e95a3f
--- /dev/null
+++ b/meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
@@ -0,0 +1,84 @@
+From 206f334d62da17093e784094c9d9e80c853f704f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 12 May 2017 03:03:46 -0400
+Subject: [PATCH] do not support python2
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac       | 16 ----------------
+ python/Makefile.am | 24 ------------------------
+ 2 files changed, 40 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 200a7cc..8431c51 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -22,22 +22,6 @@ AM_MISSING_PROG([AUTOM4TE], [autom4te])
+ # Needed by tests/atlocal.in.
+ AC_SUBST([O0CFLAGS], [`echo $CFLAGS | sed 's/-O[[0-9]] *//'`])
+ 
+-AM_PATH_PYTHON
+-AM_CONDITIONAL([HAVE_PYTHON], test -n "$PYTHON")
+-[if test -z "$PYTHON"; then]
+-    [echo "The python interpreter was not found in the search path. The Python language bindings"]
+-    [echo "will not be built.  If you want to build the Python language bindings, please ensure"]
+-    [echo "that python is installed and its directory is included in the search path."]
+-    [echo "Then run configure again before attempting to build Satyr."]
+-[fi]
+-
+-# Just PKG_CHECK_MODULES([PYTHON], [python]) works only with python2.7+
+-# Below, if python is not found, we set up for python2.6 w/o checking:
+-PKG_CHECK_MODULES([PYTHON], [python2],,[
+-    PYTHON_LIBS='-L/usr/lib64 -lpython2.6'
+-    PYTHON_CFLAGS='-I/usr/include/python2.6'
+-])
+-
+ AC_ARG_ENABLE([python-manpage],
+               [AS_HELP_STRING([--disable-python-manpage],
+                               [Disable python bindings manpage build])],
+diff --git a/python/Makefile.am b/python/Makefile.am
+index 36fc2e9..0b73f66 100644
+--- a/python/Makefile.am
++++ b/python/Makefile.am
+@@ -1,12 +1,5 @@
+ SUBDIRS = . doc
+ 
+-py2satyrdir = $(pyexecdir)/satyr
+-
+-py2satyr_PYTHON = \
+-    __init__.py
+-
+-py2satyr_LTLIBRARIES = _satyr.la
+-
+ PYEXTFILES = \
+     py_cluster.h \
+     py_cluster.c \
+@@ -75,23 +68,6 @@ PYEXTLDFLAGS = \
+     -module \
+     -avoid-version
+ 
+-_satyr_la_SOURCES = $(PYEXTFILES)
+-_satyr_la_CPPFLAGS = \
+-    $(PYEXTCPPFLAGS) \
+-    $(PYTHON_CFLAGS)
+-_satyr_la_LDFLAGS = \
+-    $(PYEXTLDFLAGS) \
+-    -export-symbols-regex init_satyr
+-
+-# Depending on the configure option, we either link libsatyr.so dynamically (as
+-# is usual), or directly include its object files (by including the
+-# convenience library).
+-if ENABLE_STATIC_PYTHON_MODULE
+-_satyr_la_LIBADD = ../lib/libsatyr_conv.la
+-else
+-_satyr_la_LIBADD = ../lib/libsatyr.la
+-endif
+-
+ if WITH_PYTHON3
+ py3satyrdir = $(py3execdir)/satyr
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/satyr/satyr_0.23.bb b/meta-oe/recipes-support/satyr/satyr_0.23.bb
new file mode 100644
index 0000000..b3faecc
--- /dev/null
+++ b/meta-oe/recipes-support/satyr/satyr_0.23.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Satyr is a collection of low-level algorithms for program \
+failure processing, analysis, and reporting supporting kernel space, user \
+space, Python, and Java programs"
+
+HOMEPAGE = "https://github.com/abrt/satyr"
+LICENSE = "GPLv2"
+
+inherit autotools-brokensep python3native pkgconfig
+
+SRC_URI = "git://github.com/abrt/satyr.git \
+           file://0001-do-not-support-python2.patch \
+"
+SRCREV = "4742fd4857c446b96f712d52e2e4cd0b6cfe7398"
+S = "${WORKDIR}/git"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS += " \
+    gdb \
+"
+
+PACKAGES += "python3-${PN}"
+FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/${BPN}"
+
+PACKAGECONFIG ??= "python3 rpm"
+PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
+PACKAGECONFIG[pythonmanpage] = "--enable-python-manpage, --disable-python-manpage"
+PACKAGECONFIG[rpm] = "--with-rpm, --without-rpm, rpm"
+
+do_configure_prepend() {
+    ${S}/gen-version
+}
-- 
2.8.1


