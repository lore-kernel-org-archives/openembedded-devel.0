Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E347E7550F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 03:20:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6A3KZgN002584
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jul 2018 20:20:35 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 20:20:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jul 2018 11:20:27 +0800
Message-ID: <1531192828-46910-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
References: <1531192828-46910-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] satyr: upgrade 0.23 -> 0.26
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
X-List-Received-Date: Tue, 10 Jul 2018 03:20:35 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../satyr/files/0001-do-not-support-python2.patch  | 84 ----------------------
 ...ix-compile-failure-against-musl-C-library.patch |  2 +-
 .../satyr/{satyr_0.23.bb => satyr_0.26.bb}         |  5 +-
 3 files changed, 3 insertions(+), 88 deletions(-)
 delete mode 100644 meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
 rename meta-oe/recipes-support/satyr/{satyr_0.23.bb => satyr_0.26.bb} (81%)

diff --git a/meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch b/meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
deleted file mode 100644
index 9e95a3f..0000000
--- a/meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 206f334d62da17093e784094c9d9e80c853f704f Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 12 May 2017 03:03:46 -0400
-Subject: [PATCH] do not support python2
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac       | 16 ----------------
- python/Makefile.am | 24 ------------------------
- 2 files changed, 40 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 200a7cc..8431c51 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -22,22 +22,6 @@ AM_MISSING_PROG([AUTOM4TE], [autom4te])
- # Needed by tests/atlocal.in.
- AC_SUBST([O0CFLAGS], [`echo $CFLAGS | sed 's/-O[[0-9]] *//'`])
- 
--AM_PATH_PYTHON
--AM_CONDITIONAL([HAVE_PYTHON], test -n "$PYTHON")
--[if test -z "$PYTHON"; then]
--    [echo "The python interpreter was not found in the search path. The Python language bindings"]
--    [echo "will not be built.  If you want to build the Python language bindings, please ensure"]
--    [echo "that python is installed and its directory is included in the search path."]
--    [echo "Then run configure again before attempting to build Satyr."]
--[fi]
--
--# Just PKG_CHECK_MODULES([PYTHON], [python]) works only with python2.7+
--# Below, if python is not found, we set up for python2.6 w/o checking:
--PKG_CHECK_MODULES([PYTHON], [python2],,[
--    PYTHON_LIBS='-L/usr/lib64 -lpython2.6'
--    PYTHON_CFLAGS='-I/usr/include/python2.6'
--])
--
- AC_ARG_ENABLE([python-manpage],
-               [AS_HELP_STRING([--disable-python-manpage],
-                               [Disable python bindings manpage build])],
-diff --git a/python/Makefile.am b/python/Makefile.am
-index 36fc2e9..0b73f66 100644
---- a/python/Makefile.am
-+++ b/python/Makefile.am
-@@ -1,12 +1,5 @@
- SUBDIRS = . doc
- 
--py2satyrdir = $(pyexecdir)/satyr
--
--py2satyr_PYTHON = \
--    __init__.py
--
--py2satyr_LTLIBRARIES = _satyr.la
--
- PYEXTFILES = \
-     py_cluster.h \
-     py_cluster.c \
-@@ -75,23 +68,6 @@ PYEXTLDFLAGS = \
-     -module \
-     -avoid-version
- 
--_satyr_la_SOURCES = $(PYEXTFILES)
--_satyr_la_CPPFLAGS = \
--    $(PYEXTCPPFLAGS) \
--    $(PYTHON_CFLAGS)
--_satyr_la_LDFLAGS = \
--    $(PYEXTLDFLAGS) \
--    -export-symbols-regex init_satyr
--
--# Depending on the configure option, we either link libsatyr.so dynamically (as
--# is usual), or directly include its object files (by including the
--# convenience library).
--if ENABLE_STATIC_PYTHON_MODULE
--_satyr_la_LIBADD = ../lib/libsatyr_conv.la
--else
--_satyr_la_LIBADD = ../lib/libsatyr.la
--endif
--
- if WITH_PYTHON3
- py3satyrdir = $(py3execdir)/satyr
- 
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch b/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
index 5827eb4..b6c32c4 100644
--- a/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
+++ b/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
@@ -14,7 +14,7 @@ diff --git a/lib/rpm.c b/lib/rpm.c
 index 920e145..58140bf 100644
 --- a/lib/rpm.c
 +++ b/lib/rpm.c
-@@ -188,7 +188,7 @@ sr_rpm_package_sort(struct sr_rpm_package *packages)
+@@ -191,7 +191,7 @@ sr_rpm_package_sort(struct sr_rpm_package *packages)
      }
  
      /* Sort the array. */
diff --git a/meta-oe/recipes-support/satyr/satyr_0.23.bb b/meta-oe/recipes-support/satyr/satyr_0.26.bb
similarity index 81%
rename from meta-oe/recipes-support/satyr/satyr_0.23.bb
rename to meta-oe/recipes-support/satyr/satyr_0.26.bb
index f795c37..a09bea2 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.23.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.26.bb
@@ -8,10 +8,9 @@ LICENSE = "GPLv2"
 inherit autotools-brokensep python3native pkgconfig
 
 SRC_URI = "git://github.com/abrt/satyr.git \
-           file://0001-do-not-support-python2.patch \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "4742fd4857c446b96f712d52e2e4cd0b6cfe7398"
+SRCREV = "4baa0c765071054314d1e7e78547ce6b7c133fbc"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -24,8 +23,8 @@ PACKAGES += "python3-${PN}"
 FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/${BPN}"
 
 PACKAGECONFIG ??= "python3 rpm"
+PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
-PACKAGECONFIG[pythonmanpage] = "--enable-python-manpage, --disable-python-manpage"
 PACKAGECONFIG[rpm] = "--with-rpm, --without-rpm, rpm"
 
 do_configure_prepend() {
-- 
2.7.4


