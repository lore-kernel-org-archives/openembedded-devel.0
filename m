Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94A616FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 08:44:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6R8iXk0028262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 27 Jul 2017 01:44:33 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 01:44:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Jul 2017 04:44:23 -0400
Message-ID: <9a8f3b3b988d86861b41591062e0ad441023a434.1501142861.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1501142861.git.hongxu.jia@windriver.com>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/6] libreport: add recipe 2.9.1
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
X-List-Received-Date: Thu, 27 Jul 2017 08:44:32 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Makefile.am-remove-doc-and-apidoc.patch   |  28 ++++
 ...ac-remove-prog-test-of-xmlto-and-asciidoc.patch |  48 +++++++
 .../files/0003-without-build-plugins.patch         |  26 ++++
 ...configure.ac-remove-prog-test-of-augparse.patch |  36 ++++++
 .../files/0005-remove-python2-support.patch        | 142 +++++++++++++++++++++
 .../recipes-extended/libreport/libreport_2.9.1.bb  |  43 +++++++
 6 files changed, 323 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
 create mode 100644 meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
 create mode 100644 meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
 create mode 100644 meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
 create mode 100644 meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
 create mode 100644 meta-oe/recipes-extended/libreport/libreport_2.9.1.bb

diff --git a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
new file mode 100644
index 0000000..9b328a1
--- /dev/null
+++ b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
@@ -0,0 +1,28 @@
+From db32ba60ca75d288d3ac08b54256cb74d9e1581a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 26 Apr 2017 03:47:58 -0400
+Subject: [PATCH 1/3] Makefile.am: remove doc and apidoc
+
+There was a failure at do_install time, so remove doc to workaround.
+
+Upstream-Status:  Inappropriate workaround
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index c6ab640..fb09fc1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,5 @@
+ ACLOCAL_AMFLAGS = -I m4
+-SUBDIRS = po src tests doc apidoc
++SUBDIRS = po src tests
+ 
+ EXTRA_DIST = \
+     libreport.pc.in \
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
new file mode 100644
index 0000000..146510e
--- /dev/null
+++ b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
@@ -0,0 +1,48 @@
+From d8c49e6a15ab28f4ca94e03b2a53ed8df63346cd Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 26 Apr 2017 03:49:45 -0400
+Subject: [PATCH 2/3] configure.ac: remove prog test of xmlto and asciidoc
+
+The prog of xmlto and asciidoc were used to generate documents,
+and since the doc module has already been disabled, so we should
+remove the prog test.
+
+Upstream-Status:  Inappropriate workaround
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 18 ------------------
+ 1 file changed, 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ccefe50..ed48c88 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,24 +68,6 @@ if test -z "$PYTHON3"; then
+     exit 1
+ fi
+ 
+-AC_PATH_PROG([ASCIIDOC], [asciidoc], [no])
+-[if test "$ASCIIDOC" = "no"]
+-[then]
+-    [echo "The asciidoc program was not found in the search path. Please ensure"]
+-    [echo "that it is installed and its directory is included in the search path."]
+-    [echo "Then run configure again before attempting to build libreport."]
+-    [exit 1]
+-[fi]
+-
+-AC_PATH_PROG([XMLTO], [xmlto], [no])
+-[if test "$XMLTO" = "no"]
+-[then]
+-    [echo "The xmlto program was not found in the search path. Please ensure"]
+-    [echo "that it is installed and its directory is included in the search path."]
+-    [echo "Then run configure again before attempting to build libreport."]
+-    [exit 1]
+-[fi]
+-
+ AC_ARG_WITH(bugzilla,
+ AS_HELP_STRING([--with-bugzilla],[use Bugzilla plugin (default is YES)]),
+ LIBREPORT_PARSE_WITH([bugzilla]))
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
new file mode 100644
index 0000000..3ad7774
--- /dev/null
+++ b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
@@ -0,0 +1,26 @@
+From 0e96d9f23b2b166e7444e7c8e0a6d4b83c2eccd7 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 26 Apr 2017 03:51:03 -0400
+Subject: [PATCH 3/3] without build plugins
+
+Upstream-Status:  Inappropriate workaround
+
+Rebase to 2.9.1
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index c15928c..bac02b1 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -8,4 +8,4 @@ if BUILD_NEWT
+ sub_dirs += report-newt
+ endif
+ 
+-SUBDIRS = include lib plugins report-python cli client-python workflows $(sub_dirs)
++SUBDIRS = include lib report-python cli client-python workflows $(sub_dirs)
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
new file mode 100644
index 0000000..9839e5a
--- /dev/null
+++ b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
@@ -0,0 +1,36 @@
+From cf3b646facc19078ed29f828e36dd2e552283518 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 27 Apr 2017 02:15:02 -0400
+Subject: [PATCH] configure.ac: remove prog test of augparse
+
+The build time does not require it.
+
+Upstream-Status:  Inappropriate workaround
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c06af2d..b90f49e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -288,14 +288,6 @@ AC_ARG_WITH(augeaslenslibdir,
+                            [Directory for librepor lens (default: /usr/share/augeas/lenses)])],
+             [], [with_augeaslenslibdir="/usr/share/augeas/lenses"])
+ AC_SUBST([AUGEAS_LENS_LIB_DIR], [$with_augeaslenslibdir])
+-AC_PATH_PROG(AUGPARSE, augparse, no)
+-[if test "$AUGPARSE" = "no"]
+-[then]
+-    [echo "The augparse program was not found in the search path. Please ensure"]
+-    [echo "that it is installed and its directory is included in the search path."]
+-    [echo "Then run configure again before attempting to build libreport."]
+-    [exit 1]
+-[fi]
+ 
+ AC_ARG_WITH([defaultdumpdirmode],
+             AS_HELP_STRING([--with-defaultdumpdirmode=OCTAL-MODE],
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch b/meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
new file mode 100644
index 0000000..9770f07
--- /dev/null
+++ b/meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
@@ -0,0 +1,142 @@
+From 06710ab89fc7d7a82a378289aa3fcd92d33074f2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 27 Apr 2017 03:31:00 -0400
+Subject: [PATCH] remove python2 support
+
+We do not require python2, so remove it.
+
+Upstream-Status:  Inappropriate workaround
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac                               | 15 ---------------
+ src/client-python/reportclient/Makefile.am |  9 ---------
+ src/report-python/Makefile.am              | 19 -------------------
+ 3 files changed, 43 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index eb50382..826d0fe 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -166,15 +166,6 @@ do
+ done
+ fi dnl end NO_MANTISBT
+ 
+-AC_PATH_PROG([PYTHON_CONFIG], [python-config], [no])
+-[if test "$PYTHON_CONFIG" = "no"]
+-[then]
+-    [echo "The python-config program was not found in the search path. Please ensure"]
+-    [echo "that it is installed and its directory is included in the search path."]
+-    [echo "Then run configure again before attempting to build libreport."]
+-    [exit 1]
+-[fi]
+-
+ AC_PATH_PROG([PYTHON3_CONFIG], [python3-config], [no])
+ [if test "$PYTHON3_CONFIG" = "no"]
+ [then]
+@@ -184,9 +175,6 @@ AC_PATH_PROG([PYTHON3_CONFIG], [python3-config], [no])
+     [exit 1]
+ [fi]
+ 
+-PYTHON_CFLAGS=`python-config --cflags 2> /dev/null`
+-PYTHON_LIBS=`python-config --libs 2> /dev/null`
+-
+ PYTHON3_CFLAGS=`python3-config --cflags 2> /dev/null`
+ PYTHON3_LIBS=`python3-config --libs 2> /dev/null`
+ 
+@@ -198,9 +186,6 @@ PYTHON3_DIR=`$PYTHON3 -c "import distutils.sysconfig; \
+ PYTHON3_EXECDIR=`$PYTHON3 -c "import distutils.sysconfig; \
+     print(distutils.sysconfig.get_python_lib(1,0,prefix='$PYTHON3_EXEC_PREFIX'))"`
+ 
+-AC_SUBST(PYTHON_CFLAGS)
+-AC_SUBST(PYTHON_LIBS)
+-
+ AC_SUBST(PYTHON3_CFLAGS)
+ AC_SUBST(PYTHON3_LIBS)
+ AC_SUBST(python3dir, $PYTHON3_DIR)
+diff --git a/src/client-python/reportclient/Makefile.am b/src/client-python/reportclient/Makefile.am
+index 46ac42f..fb5216a 100644
+--- a/src/client-python/reportclient/Makefile.am
++++ b/src/client-python/reportclient/Makefile.am
+@@ -4,13 +4,10 @@ PYFILES = \
+     dnfdebuginfo.py \
+     yumdebuginfo.py
+ 
+-py2clientdir = $(pyexecdir)/reportclient
+ py3clientdir = $(py3execdir)/reportclient
+ 
+-py2client_PYTHON = $(PYFILES)
+ py3client_PYTHON = $(PYFILES)
+ 
+-py2client_LTLIBRARIES = _reportclient.la
+ py3client_LTLIBRARIES = _reportclient3.la
+ 
+ PYEXTFILES = \
+@@ -33,12 +30,6 @@ PYEXTLDFLAGS = \
+     -avoid-version \
+     -Wl,-z,relro -Wl,-z,now
+ 
+-_reportclient_la_SOURCES = $(PYEXTFILES)
+-_reportclient_la_CPPFLAGS = $(PYEXTCPPFLAGS) $(PYTHON_CFLAGS)
+-_reportclient_la_LDFLAGS = $(PYEXTLDFLAGS) \
+-    -export-symbols-regex init_reportclient
+-_reportclient_la_LIBADD = ../../lib/libreport.la
+-
+ _reportclient3_la_SOURCES = $(PYEXTFILES)
+ _reportclient3_la_CPPFLAGS = $(PYEXTCPPFLAGS) $(PYTHON3_CFLAGS)
+ _reportclient3_la_LDFLAGS = $(PYEXTLDFLAGS) \
+diff --git a/src/report-python/Makefile.am b/src/report-python/Makefile.am
+index 793cebd..241dcb7 100644
+--- a/src/report-python/Makefile.am
++++ b/src/report-python/Makefile.am
+@@ -1,12 +1,9 @@
+ PYFILES = __init__.py accountmanager.py
+ 
+-pyreportexecdir = $(pyexecdir)/report
+ py3reportexecdir = $(py3execdir)/report
+ 
+-pyreportexec_PYTHON = $(PYFILES)
+ py3reportexec_PYTHON = $(PYFILES)
+ 
+-pyreportexec_LTLIBRARIES = _pyreport.la
+ py3reportexec_LTLIBRARIES = _py3report.la
+ 
+ PYEXTFILES = \
+@@ -34,20 +31,6 @@ PYEXTLDFLAGS = \
+     -avoid-version \
+     -Wl,-z,relro -Wl,-z,now
+ 
+-_pyreport_la_SOURCES = $(PYEXTFILES)
+-
+-_pyreport_la_CPPFLAGS = \
+-    $(PYEXTCPPFLAGS) \
+-    $(PYTHON_CFLAGS)
+-
+-_pyreport_la_LDFLAGS = \
+-   $(PYEXTLDFLAGS) \
+-   -export-symbols-regex init_pyreport
+-
+-_pyreport_la_LIBADD = \
+-    ../lib/libreport.la \
+-    $(PYTHON2_LIBS)
+-
+ _py3report_la_SOURCES = $(PYEXTFILES)
+ 
+ _py3report_la_CPPFLAGS = \
+@@ -64,7 +47,6 @@ _py3report_la_LIBADD = \
+ 
+ # report compat:
+ 
+-pyreportioexecdir = $(pyexecdir)/report/io
+ py3reportioexecdir = $(py3execdir)/report/io
+ 
+ PYIOFILES = \
+@@ -73,5 +55,4 @@ PYIOFILES = \
+     io/NewtIO.py \
+     io/TextIO.py
+ 
+-pyreportioexec_PYTHON = $(PYIOFILES)
+ py3reportioexec_PYTHON = $(PYIOFILES)
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
new file mode 100644
index 0000000..459f0f2
--- /dev/null
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.1.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "Libraries providing API for reporting different problems in applications \
+to different bug targets like Bugzilla, ftp, trac, etc..."
+SUMMARY = "Generic library for reporting various problems"
+HOMEPAGE = "https://abrt.readthedocs.org/"
+LICENSE = "GPLv2+"
+DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
+        json-c libtar libnewt libproxy rpm \
+        augeas satyr systemd gtk+3 \
+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+
+SRC_URI = "https://github.com/abrt/${BPN}/archive/${PV}/${BPN}}-%{PV}.tar.gz"
+SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
+            file://0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch \
+            file://0003-without-build-plugins.patch \
+            file://0004-configure.ac-remove-prog-test-of-augparse.patch \
+            file://0005-remove-python2-support.patch \
+"
+
+SRC_URI[md5sum] = "f732a63dcc68cf96f0df02bcfc5fccc7"
+SRC_URI[sha256sum] = "484e15759a079730608b708ea9ae74a045ebe74f35dbfe9c9c16834c4462bcd4"
+
+inherit distro_features_check
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+inherit gettext autotools python3native pkgconfig
+
+RDEPENDS_${PN}-python3 += "${PN}"
+
+do_patch[prefuncs] += "do_gen_version"
+do_gen_version() {
+    cd ${S}
+    ./gen-version
+}
+
+PACKAGES += "python3-${PN}"
+
+FILES_${PN} += "${datadir}/*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug"
+FILES_python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
+
-- 
2.8.1


