Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D79C578399
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:35:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6L7Z4cL000991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Jul 2017 00:35:04 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Jul 2017 00:35:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Jul 2017 03:34:45 -0400
Message-ID: <05ab674f1f8c9820270ad742baf5f97e355356e7.1500621886.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500621886.git.hongxu.jia@windriver.com>
References: <cover.1500621886.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 08/10] satyr: add recipe 0.23
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
X-List-Received-Date: Fri, 21 Jul 2017 07:35:04 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../satyr/files/0001-do-not-support-python2.patch  | 84 ++++++++++++++++++++++
 ...ix-compile-failure-against-musl-C-library.patch | 28 ++++++++
 meta-oe/recipes-support/satyr/satyr_0.23.bb        | 33 +++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 meta-oe/recipes-support/satyr/files/0001-do-not-support-python2.patch
 create mode 100644 meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
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
diff --git a/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch b/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
new file mode 100644
index 0000000..5827eb4
--- /dev/null
+++ b/meta-oe/recipes-support/satyr/files/0002-fix-compile-failure-against-musl-C-library.patch
@@ -0,0 +1,28 @@
+From 23f827ea94284656972652f61f2c6aad96092cc8 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 20 Jul 2017 23:00:29 -0400
+Subject: [PATCH] fix compile failure against musl C library
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lib/rpm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/rpm.c b/lib/rpm.c
+index 920e145..58140bf 100644
+--- a/lib/rpm.c
++++ b/lib/rpm.c
+@@ -188,7 +188,7 @@ sr_rpm_package_sort(struct sr_rpm_package *packages)
+     }
+ 
+     /* Sort the array. */
+-    qsort(array, count, sizeof(struct sr_rpm_package*), (comparison_fn_t)cmp_nevra_qsort_wrapper);
++    qsort(array, count, sizeof(struct sr_rpm_package*), cmp_nevra_qsort_wrapper);
+ 
+     /* Create a linked list from the sorted array. */
+     for (size_t loop = 0; loop < count; ++loop)
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/satyr/satyr_0.23.bb b/meta-oe/recipes-support/satyr/satyr_0.23.bb
new file mode 100644
index 0000000..f795c37
--- /dev/null
+++ b/meta-oe/recipes-support/satyr/satyr_0.23.bb
@@ -0,0 +1,33 @@
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
+           file://0002-fix-compile-failure-against-musl-C-library.patch \
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


