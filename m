Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECE9C7DE75
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Jun 2019 03:04:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5534Smm005564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Jun 2019 20:04:28 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 4 Jun 2019 20:04:27 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Jun 2019 11:03:57 +0800
Message-ID: <1559703841-263740-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
References: <1559703841-263740-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] rrdtool: upgrade 1.7.1 -> 1.7.2
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
X-List-Received-Date: Wed, 05 Jun 2019 03:04:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

License-Update: Update year in COPYRIGHT and Update FSF address and fix UTF8

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-etc-rrdcached-default-lsb.in-to-tarball-.patch | 45 -----------
 ...d-etc-files-via-EXTRA_DIST-fixes-956-some.patch | 93 ----------------------
 ...-rule-to-make-target-etc-rrdcached.socket.patch | 51 ------------
 .../rrdtool/{rrdtool_1.7.1.bb => rrdtool_1.7.2.bb} |  9 +--
 4 files changed, 3 insertions(+), 195 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.1.bb => rrdtool_1.7.2.bb} (91%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch
deleted file mode 100644
index 701ab2c..0000000
--- a/meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 35aae13a34728e14150706b2a4b1a57fabe00e98 Mon Sep 17 00:00:00 2001
-From: Tobias Oetiker <tobi@oetiker.ch>
-Date: Mon, 4 Feb 2019 16:25:06 +0100
-Subject: [PATCH 1/3] add missing etc/rrdcached-default-lsb.in to tarball -
- fixes #956
-
-Add missing etc/rrdcached-default-lsb.in to tarball - fixes #956
-
-Upstream-Status: Backport [https://github.com/oetiker/rrdtool-1.x/commit/35aae13a34728e14150706b2a4b1a57fabe00e98]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- Makefile.am | 2 +-
- Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 5a15db6c..6bec092e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -20,7 +20,7 @@ EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
-              rrdtool.spec favicon.ico bootstrap \
-              libtool \
-              m4/snprintf.m4 \
--             etc/rrdcached-default-redhat etc/rrdcached-init-redhat \
-+             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
-              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
-              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
-              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
-diff --git a/Makefile.in b/Makefile.in
-index 607193c1..c9b1939f 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -432,7 +432,7 @@ EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
-              rrdtool.spec favicon.ico bootstrap \
-              libtool \
-              m4/snprintf.m4 \
--             etc/rrdcached-default-redhat etc/rrdcached-init-redhat \
-+             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
-              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
-              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
-              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch
deleted file mode 100644
index 0385ae6..0000000
--- a/meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 3e469b4c4b5c219469b0be299ce75c4fac09afc9 Mon Sep 17 00:00:00 2001
-From: Tobias Oetiker <tobi@oetiker.ch>
-Date: Mon, 4 Feb 2019 17:17:25 +0100
-Subject: [PATCH 2/3] properly add etc files via EXTRA_DIST - fixes #956 some more
-
-Add etc files via EXTRA_DIST - fixes #956 some more
-
-Upstream-Status: Backport [https://github.com/oetiker/rrdtool-1.x/commit/3e469b4c4b5c219469b0be299ce75c4fac09afc9]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- Makefile.am     | 3 +--
- Makefile.in     | 5 ++---
- etc/Makefile.am | 3 +++
- etc/Makefile.in | 3 +++
- 4 files changed, 9 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 6bec092e..c3e2c303 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -5,7 +5,7 @@ RSYNC = rsync --rsh=ssh
- 
- # build the following subdirectories
- 
--SUBDIRS = po src bindings tests
-+SUBDIRS = po src bindings tests etc
- 
- if BUILD_DOCS
- SUBDIRS += doc
-@@ -20,7 +20,6 @@ EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
-              rrdtool.spec favicon.ico bootstrap \
-              libtool \
-              m4/snprintf.m4 \
--             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
-              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
-              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
-              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
-diff --git a/Makefile.in b/Makefile.in
-index c9b1939f..6a1280e4 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -168,7 +168,7 @@ am__define_uniq_tagged_files = \
- ETAGS = etags
- CTAGS = ctags
- CSCOPE = cscope
--DIST_SUBDIRS = po src bindings tests doc examples
-+DIST_SUBDIRS = po src bindings tests etc doc examples
- am__DIST_COMMON = $(srcdir)/Makefile.in \
- 	$(top_srcdir)/conftools/compile \
- 	$(top_srcdir)/conftools/config.guess \
-@@ -427,12 +427,11 @@ top_srcdir = @top_srcdir@
- RSYNC = rsync --rsh=ssh
- 
- # build the following subdirectories
--SUBDIRS = po src bindings tests $(am__append_1) $(am__append_2)
-+SUBDIRS = po src bindings tests etc $(am__append_1) $(am__append_2)
- EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
-              rrdtool.spec favicon.ico bootstrap \
-              libtool \
-              m4/snprintf.m4 \
--             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
-              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
-              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
-              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
-diff --git a/etc/Makefile.am b/etc/Makefile.am
-index f5503f0c..ab763dc8 100644
---- a/etc/Makefile.am
-+++ b/etc/Makefile.am
-@@ -1,3 +1,6 @@
-+EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-lsb.in \ 
-+	rrdcached.socket.in rrdcached.service.in
-+
- if HAVE_SYSTEMD
- systemdsystemunit_DATA = \
- 	etc/rrdcached.socket \
-diff --git a/etc/Makefile.in b/etc/Makefile.in
-index c67f9214..74b914b9 100644
---- a/etc/Makefile.in
-+++ b/etc/Makefile.in
-@@ -364,6 +364,9 @@ target_vendor = @target_vendor@
- top_build_prefix = @top_build_prefix@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
-+EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-lsb.in \
-+	rrdcached.socket.in rrdcached.service.in
-+
- @HAVE_SYSTEMD_TRUE@systemdsystemunit_DATA = \
- @HAVE_SYSTEMD_TRUE@	etc/rrdcached.socket \
- @HAVE_SYSTEMD_TRUE@	etc/rrdcached.service
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch
deleted file mode 100644
index b929e31..0000000
--- a/meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 865a9bade72f93cf72ca59954c6df01e8c48915d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
-Date: Tue, 5 Feb 2019 15:04:34 +0100
-Subject: [PATCH 3/3] Fixed 'No rule to make target 'etc/rrdcached.socket'
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixed 'No rule to make target 'etc/rrdcached.socket'
-
-Upstream-Status: Backport [https://github.com/oetiker/rrdtool-1.x/commit/865a9bade72f93cf72ca59954c6df01e8c48915d]
-
-Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- etc/Makefile.am | 4 ++--
- etc/Makefile.in | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/etc/Makefile.am b/etc/Makefile.am
-index ab763dc8..7d18178a 100644
---- a/etc/Makefile.am
-+++ b/etc/Makefile.am
-@@ -3,6 +3,6 @@ EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-ls
- 
- if HAVE_SYSTEMD
- systemdsystemunit_DATA = \
--	etc/rrdcached.socket \
--	etc/rrdcached.service
-+	rrdcached.socket \
-+	rrdcached.service
- endif
-\ No newline at end of file
-diff --git a/etc/Makefile.in b/etc/Makefile.in
-index 74b914b9..d512fd59 100644
---- a/etc/Makefile.in
-+++ b/etc/Makefile.in
-@@ -368,8 +368,8 @@ EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-ls
- 	rrdcached.socket.in rrdcached.service.in
- 
- @HAVE_SYSTEMD_TRUE@systemdsystemunit_DATA = \
--@HAVE_SYSTEMD_TRUE@	etc/rrdcached.socket \
--@HAVE_SYSTEMD_TRUE@	etc/rrdcached.service
-+@HAVE_SYSTEMD_TRUE@	rrdcached.socket \
-+@HAVE_SYSTEMD_TRUE@	rrdcached.service
- 
- all: all-am
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
similarity index 91%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
index eaa5c71..1962a2d 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.2.bb
@@ -2,18 +2,15 @@ SUMMARY = "High performance data logging and graphing system for time series dat
 HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39df84cfd8a5e18bf988f277f7946676"
 
 DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python-setuptools-native"
 
-SRCREV = "34e6ff6218bb0372eb545f886dec96dd3d20be47"
-PV = "1.7.1"
+SRCREV = "56a83f4f52e6745cd4352f9ee008be3183a6dedf"
+PV = "1.7.2"
 
 SRC_URI = "\
     git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http; \
-    file://0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch \
-    file://0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch \
-    file://0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


