Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BC92178DA7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:11:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w717BsfV004317
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:11:54 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:36 +0800
Message-ID: <c5fbd102fe1f6e54bf121324ff45135724bd27f0.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/16] libreport: 2.9.2 -> 2.9.5
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
X-List-Received-Date: Wed, 01 Aug 2018 07:11:53 -0000
Content-Type: text/plain

Drop 0005-remove-python2-support.patch and use option
`--with-python2/3' to replace.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Makefile.am-remove-doc-and-apidoc.patch   |   8 +-
 ...ac-remove-prog-test-of-xmlto-and-asciidoc.patch |  16 +--
 .../files/0003-without-build-plugins.patch         |   6 +-
 ...configure.ac-remove-prog-test-of-augparse.patch |  10 +-
 .../files/0005-remove-python2-support.patch        | 142 ---------------------
 .../{libreport_2.9.2.bb => libreport_2.9.5.bb}     |   5 +-
 6 files changed, 23 insertions(+), 164 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
 rename meta-oe/recipes-extended/libreport/{libreport_2.9.2.bb => libreport_2.9.5.bb} (93%)

diff --git a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
index 9b328a1..97fb097 100644
--- a/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
+++ b/meta-oe/recipes-extended/libreport/files/0001-Makefile.am-remove-doc-and-apidoc.patch
@@ -1,7 +1,7 @@
-From db32ba60ca75d288d3ac08b54256cb74d9e1581a Mon Sep 17 00:00:00 2001
+From 1f7d106c7d982fe055addc8d883b161202233175 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 26 Apr 2017 03:47:58 -0400
-Subject: [PATCH 1/3] Makefile.am: remove doc and apidoc
+Subject: [PATCH 1/4] Makefile.am: remove doc and apidoc
 
 There was a failure at do_install time, so remove doc to workaround.
 
@@ -13,7 +13,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index c6ab640..fb09fc1 100644
+index 9ad827c..34364a8 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,5 +1,5 @@
@@ -24,5 +24,5 @@ index c6ab640..fb09fc1 100644
  EXTRA_DIST = \
      libreport.pc.in \
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
index 146510e..7f5895e 100644
--- a/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
+++ b/meta-oe/recipes-extended/libreport/files/0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch
@@ -1,7 +1,7 @@
-From d8c49e6a15ab28f4ca94e03b2a53ed8df63346cd Mon Sep 17 00:00:00 2001
+From 9beadcdfca9198548f06bf18f3f26e1d11542e53 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 26 Apr 2017 03:49:45 -0400
-Subject: [PATCH 2/3] configure.ac: remove prog test of xmlto and asciidoc
+Date: Tue, 31 Jul 2018 16:53:04 +0800
+Subject: [PATCH 2/4] configure.ac: remove prog test of xmlto and asciidoc
 
 The prog of xmlto and asciidoc were used to generate documents,
 and since the doc module has already been disabled, so we should
@@ -15,12 +15,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ccefe50..ed48c88 100644
+index feafc28..aceccf4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -68,24 +68,6 @@ if test -z "$PYTHON3"; then
-     exit 1
- fi
+@@ -56,24 +56,6 @@ IT_PROG_INTLTOOL([0.35.0])
+ 
+ dnl ****** END ****************************************
  
 -AC_PATH_PROG([ASCIIDOC], [asciidoc], [no])
 -[if test "$ASCIIDOC" = "no"]
@@ -44,5 +44,5 @@ index ccefe50..ed48c88 100644
  AS_HELP_STRING([--with-bugzilla],[use Bugzilla plugin (default is YES)]),
  LIBREPORT_PARSE_WITH([bugzilla]))
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
index 3ad7774..2ff1731 100644
--- a/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
+++ b/meta-oe/recipes-extended/libreport/files/0003-without-build-plugins.patch
@@ -1,7 +1,7 @@
-From 0e96d9f23b2b166e7444e7c8e0a6d4b83c2eccd7 Mon Sep 17 00:00:00 2001
+From 41bce1de2fd2a0f79c266f245ae3e3720ccaf46a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 26 Apr 2017 03:51:03 -0400
-Subject: [PATCH 3/3] without build plugins
+Subject: [PATCH 3/4] without build plugins
 
 Upstream-Status:  Inappropriate workaround
 
@@ -22,5 +22,5 @@ index c15928c..bac02b1 100644
 -SUBDIRS = include lib plugins report-python cli client-python workflows $(sub_dirs)
 +SUBDIRS = include lib report-python cli client-python workflows $(sub_dirs)
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
index 9839e5a..4ba69c7 100644
--- a/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
+++ b/meta-oe/recipes-extended/libreport/files/0004-configure.ac-remove-prog-test-of-augparse.patch
@@ -1,7 +1,7 @@
-From cf3b646facc19078ed29f828e36dd2e552283518 Mon Sep 17 00:00:00 2001
+From c1c301502a8f69b9889197744b301a136082f09d Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 27 Apr 2017 02:15:02 -0400
-Subject: [PATCH] configure.ac: remove prog test of augparse
+Subject: [PATCH 4/4] configure.ac: remove prog test of augparse
 
 The build time does not require it.
 
@@ -13,10 +13,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index c06af2d..b90f49e 100644
+index aceccf4..83c101b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -288,14 +288,6 @@ AC_ARG_WITH(augeaslenslibdir,
+@@ -350,14 +350,6 @@ AC_ARG_WITH(augeaslenslibdir,
                             [Directory for librepor lens (default: /usr/share/augeas/lenses)])],
              [], [with_augeaslenslibdir="/usr/share/augeas/lenses"])
  AC_SUBST([AUGEAS_LENS_LIB_DIR], [$with_augeaslenslibdir])
@@ -32,5 +32,5 @@ index c06af2d..b90f49e 100644
  AC_ARG_WITH([defaultdumpdirmode],
              AS_HELP_STRING([--with-defaultdumpdirmode=OCTAL-MODE],
 -- 
-2.8.1
+2.7.4
 
diff --git a/meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch b/meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
deleted file mode 100644
index 9770f07..0000000
--- a/meta-oe/recipes-extended/libreport/files/0005-remove-python2-support.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From 06710ab89fc7d7a82a378289aa3fcd92d33074f2 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 27 Apr 2017 03:31:00 -0400
-Subject: [PATCH] remove python2 support
-
-We do not require python2, so remove it.
-
-Upstream-Status:  Inappropriate workaround
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac                               | 15 ---------------
- src/client-python/reportclient/Makefile.am |  9 ---------
- src/report-python/Makefile.am              | 19 -------------------
- 3 files changed, 43 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index eb50382..826d0fe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -166,15 +166,6 @@ do
- done
- fi dnl end NO_MANTISBT
- 
--AC_PATH_PROG([PYTHON_CONFIG], [python-config], [no])
--[if test "$PYTHON_CONFIG" = "no"]
--[then]
--    [echo "The python-config program was not found in the search path. Please ensure"]
--    [echo "that it is installed and its directory is included in the search path."]
--    [echo "Then run configure again before attempting to build libreport."]
--    [exit 1]
--[fi]
--
- AC_PATH_PROG([PYTHON3_CONFIG], [python3-config], [no])
- [if test "$PYTHON3_CONFIG" = "no"]
- [then]
-@@ -184,9 +175,6 @@ AC_PATH_PROG([PYTHON3_CONFIG], [python3-config], [no])
-     [exit 1]
- [fi]
- 
--PYTHON_CFLAGS=`python-config --cflags 2> /dev/null`
--PYTHON_LIBS=`python-config --libs 2> /dev/null`
--
- PYTHON3_CFLAGS=`python3-config --cflags 2> /dev/null`
- PYTHON3_LIBS=`python3-config --libs 2> /dev/null`
- 
-@@ -198,9 +186,6 @@ PYTHON3_DIR=`$PYTHON3 -c "import distutils.sysconfig; \
- PYTHON3_EXECDIR=`$PYTHON3 -c "import distutils.sysconfig; \
-     print(distutils.sysconfig.get_python_lib(1,0,prefix='$PYTHON3_EXEC_PREFIX'))"`
- 
--AC_SUBST(PYTHON_CFLAGS)
--AC_SUBST(PYTHON_LIBS)
--
- AC_SUBST(PYTHON3_CFLAGS)
- AC_SUBST(PYTHON3_LIBS)
- AC_SUBST(python3dir, $PYTHON3_DIR)
-diff --git a/src/client-python/reportclient/Makefile.am b/src/client-python/reportclient/Makefile.am
-index 46ac42f..fb5216a 100644
---- a/src/client-python/reportclient/Makefile.am
-+++ b/src/client-python/reportclient/Makefile.am
-@@ -4,13 +4,10 @@ PYFILES = \
-     dnfdebuginfo.py \
-     yumdebuginfo.py
- 
--py2clientdir = $(pyexecdir)/reportclient
- py3clientdir = $(py3execdir)/reportclient
- 
--py2client_PYTHON = $(PYFILES)
- py3client_PYTHON = $(PYFILES)
- 
--py2client_LTLIBRARIES = _reportclient.la
- py3client_LTLIBRARIES = _reportclient3.la
- 
- PYEXTFILES = \
-@@ -33,12 +30,6 @@ PYEXTLDFLAGS = \
-     -avoid-version \
-     -Wl,-z,relro -Wl,-z,now
- 
--_reportclient_la_SOURCES = $(PYEXTFILES)
--_reportclient_la_CPPFLAGS = $(PYEXTCPPFLAGS) $(PYTHON_CFLAGS)
--_reportclient_la_LDFLAGS = $(PYEXTLDFLAGS) \
--    -export-symbols-regex init_reportclient
--_reportclient_la_LIBADD = ../../lib/libreport.la
--
- _reportclient3_la_SOURCES = $(PYEXTFILES)
- _reportclient3_la_CPPFLAGS = $(PYEXTCPPFLAGS) $(PYTHON3_CFLAGS)
- _reportclient3_la_LDFLAGS = $(PYEXTLDFLAGS) \
-diff --git a/src/report-python/Makefile.am b/src/report-python/Makefile.am
-index 793cebd..241dcb7 100644
---- a/src/report-python/Makefile.am
-+++ b/src/report-python/Makefile.am
-@@ -1,12 +1,9 @@
- PYFILES = __init__.py accountmanager.py
- 
--pyreportexecdir = $(pyexecdir)/report
- py3reportexecdir = $(py3execdir)/report
- 
--pyreportexec_PYTHON = $(PYFILES)
- py3reportexec_PYTHON = $(PYFILES)
- 
--pyreportexec_LTLIBRARIES = _pyreport.la
- py3reportexec_LTLIBRARIES = _py3report.la
- 
- PYEXTFILES = \
-@@ -34,20 +31,6 @@ PYEXTLDFLAGS = \
-     -avoid-version \
-     -Wl,-z,relro -Wl,-z,now
- 
--_pyreport_la_SOURCES = $(PYEXTFILES)
--
--_pyreport_la_CPPFLAGS = \
--    $(PYEXTCPPFLAGS) \
--    $(PYTHON_CFLAGS)
--
--_pyreport_la_LDFLAGS = \
--   $(PYEXTLDFLAGS) \
--   -export-symbols-regex init_pyreport
--
--_pyreport_la_LIBADD = \
--    ../lib/libreport.la \
--    $(PYTHON2_LIBS)
--
- _py3report_la_SOURCES = $(PYEXTFILES)
- 
- _py3report_la_CPPFLAGS = \
-@@ -64,7 +47,6 @@ _py3report_la_LIBADD = \
- 
- # report compat:
- 
--pyreportioexecdir = $(pyexecdir)/report/io
- py3reportioexecdir = $(py3execdir)/report/io
- 
- PYIOFILES = \
-@@ -73,5 +55,4 @@ PYIOFILES = \
-     io/NewtIO.py \
-     io/TextIO.py
- 
--pyreportioexec_PYTHON = $(PYIOFILES)
- py3reportioexec_PYTHON = $(PYIOFILES)
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.5.bb
similarity index 93%
rename from meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
rename to meta-oe/recipes-extended/libreport/libreport_2.9.5.bb
index edcccd1..542956c 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.5.bb
@@ -16,9 +16,8 @@ SRC_URI += "file://0001-Makefile.am-remove-doc-and-apidoc.patch \
             file://0002-configure.ac-remove-prog-test-of-xmlto-and-asciidoc.patch \
             file://0003-without-build-plugins.patch \
             file://0004-configure.ac-remove-prog-test-of-augparse.patch \
-            file://0005-remove-python2-support.patch \
 "
-SRCREV = "cfff49f06d9d17e269d463ee71b3d94c8bfb0c58"
+SRCREV = "15f92bcaf73e5eb8958fbde655a57dcd111757a7"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
@@ -32,6 +31,8 @@ inherit gettext autotools python3native pkgconfig
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
 PACKAGECONFIG[gtk] = "--with-gtk, --without-gtk, gtk+3,"
 
+EXTRA_OECONF += "--without-python2 --with-python3"
+
 RDEPENDS_python3-libreport += "${PN}"
 
 do_patch[prefuncs] += "do_gen_version"
-- 
2.7.4


