Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 456DA6C1C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2019 09:34:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3P9XbPe004610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Apr 2019 02:34:08 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 25 Apr 2019 02:33:56 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 25 Apr 2019 02:33:56 -0700
Message-ID: <20190425093356.121617-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rrdtool: Upgrade to 1.7.1
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
X-List-Received-Date: Thu, 25 Apr 2019 09:34:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

Backport 3 patches to fix below error:
ERROR: rrdtool-1.7.1-r0 do_package: SYSTEMD_SERVICE_rrdcached value rrdcached.socket does not exist

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...rrdcached-default-lsb.in-to-tarball-.patch | 45 +++++++++
 ...-files-via-EXTRA_DIST-fixes-956-some.patch | 93 +++++++++++++++++++
 ...-to-make-target-etc-rrdcached.socket.patch | 51 ++++++++++
 .../{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb}    |  7 +-
 4 files changed, 194 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch
 create mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch
 create mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch
new file mode 100644
index 000000000..701ab2c5b
--- /dev/null
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool/0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch
@@ -0,0 +1,45 @@
+From 35aae13a34728e14150706b2a4b1a57fabe00e98 Mon Sep 17 00:00:00 2001
+From: Tobias Oetiker <tobi@oetiker.ch>
+Date: Mon, 4 Feb 2019 16:25:06 +0100
+Subject: [PATCH 1/3] add missing etc/rrdcached-default-lsb.in to tarball -
+ fixes #956
+
+Add missing etc/rrdcached-default-lsb.in to tarball - fixes #956
+
+Upstream-Status: Backport [https://github.com/oetiker/rrdtool-1.x/commit/35aae13a34728e14150706b2a4b1a57fabe00e98]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.am | 2 +-
+ Makefile.in | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5a15db6c..6bec092e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,7 @@ EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
+              rrdtool.spec favicon.ico bootstrap \
+              libtool \
+              m4/snprintf.m4 \
+-             etc/rrdcached-default-redhat etc/rrdcached-init-redhat \
++             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
+              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
+              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
+              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
+diff --git a/Makefile.in b/Makefile.in
+index 607193c1..c9b1939f 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -432,7 +432,7 @@ EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
+              rrdtool.spec favicon.ico bootstrap \
+              libtool \
+              m4/snprintf.m4 \
+-             etc/rrdcached-default-redhat etc/rrdcached-init-redhat \
++             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
+              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
+              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
+              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch
new file mode 100644
index 000000000..0385ae6d6
--- /dev/null
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool/0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch
@@ -0,0 +1,93 @@
+From 3e469b4c4b5c219469b0be299ce75c4fac09afc9 Mon Sep 17 00:00:00 2001
+From: Tobias Oetiker <tobi@oetiker.ch>
+Date: Mon, 4 Feb 2019 17:17:25 +0100
+Subject: [PATCH 2/3] properly add etc files via EXTRA_DIST - fixes #956 some more
+
+Add etc files via EXTRA_DIST - fixes #956 some more
+
+Upstream-Status: Backport [https://github.com/oetiker/rrdtool-1.x/commit/3e469b4c4b5c219469b0be299ce75c4fac09afc9]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.am     | 3 +--
+ Makefile.in     | 5 ++---
+ etc/Makefile.am | 3 +++
+ etc/Makefile.in | 3 +++
+ 4 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6bec092e..c3e2c303 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -5,7 +5,7 @@ RSYNC = rsync --rsh=ssh
+ 
+ # build the following subdirectories
+ 
+-SUBDIRS = po src bindings tests
++SUBDIRS = po src bindings tests etc
+ 
+ if BUILD_DOCS
+ SUBDIRS += doc
+@@ -20,7 +20,6 @@ EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
+              rrdtool.spec favicon.ico bootstrap \
+              libtool \
+              m4/snprintf.m4 \
+-             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
+              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
+              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
+              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
+diff --git a/Makefile.in b/Makefile.in
+index c9b1939f..6a1280e4 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -168,7 +168,7 @@ am__define_uniq_tagged_files = \
+ ETAGS = etags
+ CTAGS = ctags
+ CSCOPE = cscope
+-DIST_SUBDIRS = po src bindings tests doc examples
++DIST_SUBDIRS = po src bindings tests etc doc examples
+ am__DIST_COMMON = $(srcdir)/Makefile.in \
+ 	$(top_srcdir)/conftools/compile \
+ 	$(top_srcdir)/conftools/config.guess \
+@@ -427,12 +427,11 @@ top_srcdir = @top_srcdir@
+ RSYNC = rsync --rsh=ssh
+ 
+ # build the following subdirectories
+-SUBDIRS = po src bindings tests $(am__append_1) $(am__append_2)
++SUBDIRS = po src bindings tests etc $(am__append_1) $(am__append_2)
+ EXTRA_DIST = COPYRIGHT CHANGES TODO CONTRIBUTORS THREADS VERSION LICENSE \
+              rrdtool.spec favicon.ico bootstrap \
+              libtool \
+              m4/snprintf.m4 \
+-             etc/rrdcached-default-redhat etc/rrdcached-init-redhat etc/rrdcached-default-lsb.in \
+              win32/build-rrdtool.dot win32/build-rrdtool.pdf win32/build-rrdtool.svg \
+              win32/librrd-4.def win32/librrd-4.rc win32/librrd-4.vcxproj \
+              win32/Makefile.msc win32/README win32/README-MinGW-w64 win32/rrdcgi.rc win32/rrd_config.h \
+diff --git a/etc/Makefile.am b/etc/Makefile.am
+index f5503f0c..ab763dc8 100644
+--- a/etc/Makefile.am
++++ b/etc/Makefile.am
+@@ -1,3 +1,6 @@
++EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-lsb.in \ 
++	rrdcached.socket.in rrdcached.service.in
++
+ if HAVE_SYSTEMD
+ systemdsystemunit_DATA = \
+ 	etc/rrdcached.socket \
+diff --git a/etc/Makefile.in b/etc/Makefile.in
+index c67f9214..74b914b9 100644
+--- a/etc/Makefile.in
++++ b/etc/Makefile.in
+@@ -364,6 +364,9 @@ target_vendor = @target_vendor@
+ top_build_prefix = @top_build_prefix@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
++EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-lsb.in \
++	rrdcached.socket.in rrdcached.service.in
++
+ @HAVE_SYSTEMD_TRUE@systemdsystemunit_DATA = \
+ @HAVE_SYSTEMD_TRUE@	etc/rrdcached.socket \
+ @HAVE_SYSTEMD_TRUE@	etc/rrdcached.service
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch
new file mode 100644
index 000000000..b929e31f8
--- /dev/null
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool/0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch
@@ -0,0 +1,51 @@
+From 865a9bade72f93cf72ca59954c6df01e8c48915d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jaroslav=20=C5=A0karvada?= <jskarvad@redhat.com>
+Date: Tue, 5 Feb 2019 15:04:34 +0100
+Subject: [PATCH 3/3] Fixed 'No rule to make target 'etc/rrdcached.socket'
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixed 'No rule to make target 'etc/rrdcached.socket'
+
+Upstream-Status: Backport [https://github.com/oetiker/rrdtool-1.x/commit/865a9bade72f93cf72ca59954c6df01e8c48915d]
+
+Signed-off-by: Jaroslav Škarvada <jskarvad@redhat.com
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ etc/Makefile.am | 4 ++--
+ etc/Makefile.in | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/etc/Makefile.am b/etc/Makefile.am
+index ab763dc8..7d18178a 100644
+--- a/etc/Makefile.am
++++ b/etc/Makefile.am
+@@ -3,6 +3,6 @@ EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-ls
+ 
+ if HAVE_SYSTEMD
+ systemdsystemunit_DATA = \
+-	etc/rrdcached.socket \
+-	etc/rrdcached.service
++	rrdcached.socket \
++	rrdcached.service
+ endif
+\ No newline at end of file
+diff --git a/etc/Makefile.in b/etc/Makefile.in
+index 74b914b9..d512fd59 100644
+--- a/etc/Makefile.in
++++ b/etc/Makefile.in
+@@ -368,8 +368,8 @@ EXTRA_DIST = rrdcached-default-redhat rrdcached-init-redhat rrdcached-default-ls
+ 	rrdcached.socket.in rrdcached.service.in
+ 
+ @HAVE_SYSTEMD_TRUE@systemdsystemunit_DATA = \
+-@HAVE_SYSTEMD_TRUE@	etc/rrdcached.socket \
+-@HAVE_SYSTEMD_TRUE@	etc/rrdcached.service
++@HAVE_SYSTEMD_TRUE@	rrdcached.socket \
++@HAVE_SYSTEMD_TRUE@	rrdcached.service
+ 
+ all: all-am
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
index 4a6c44669..63cdb7aee 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.7.1.bb
@@ -6,11 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
 
 DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native python-setuptools-native"
 
-SRCREV = "bfc82d5242855628b826018479df00e0ec4e8360"
-PV = "1.7.0"
+SRCREV = "34e6ff6218bb0372eb545f886dec96dd3d20be47"
+PV = "1.7.1"
 
 SRC_URI = "\
     git://github.com/oetiker/rrdtool-1.x.git;branch=master;protocol=http; \
+    file://0001-add-missing-etc-rrdcached-default-lsb.in-to-tarball-.patch \
+    file://0002-properly-add-etc-files-via-EXTRA_DIST-fixes-956-some.patch \
+    file://0003-Fixed-No-rule-to-make-target-etc-rrdcached.socket.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


