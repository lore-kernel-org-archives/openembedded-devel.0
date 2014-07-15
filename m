Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 157C17029A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:17:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6F9HUqH001220
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 02:17:30 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 15 Jul 2014 02:17:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Jul 2014 17:17:29 +0800
Message-ID: <1405415849-4199-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] libee: add recipe
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
X-List-Received-Date: Tue, 15 Jul 2014 09:17:30 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The core idea of libee is to provide a small but hopefully convenient
API layer above the CEE standard.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/libee/libee.inc            |   39 ++++++++++++++++++++
 meta-oe/recipes-support/libee/libee/ezapi1.sh      |   14 +++++++
 .../libee/libee/libee-parallel-make.patch          |   20 ++++++++++
 meta-oe/recipes-support/libee/libee/run-ptest      |    3 ++
 meta-oe/recipes-support/libee/libee_0.4.1.bb       |    4 ++
 5 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-support/libee/libee.inc
 create mode 100755 meta-oe/recipes-support/libee/libee/ezapi1.sh
 create mode 100644 meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
 create mode 100755 meta-oe/recipes-support/libee/libee/run-ptest
 create mode 100644 meta-oe/recipes-support/libee/libee_0.4.1.bb

diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes-support/libee/libee.inc
new file mode 100644
index 0000000..5b552ca
--- /dev/null
+++ b/meta-oe/recipes-support/libee/libee.inc
@@ -0,0 +1,39 @@
+SUMMARY = "An Event Expression Library inspired by CEE"
+DESCRIPTION = "The core idea of libee is to provide a small \
+but hopefully convenient API layer above the CEE standard."
+
+HOMEPAGE = "http://www.libee.org"
+SECTION = "base"
+
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1c2687de35e36ba3b999136236a66cd6"
+
+SRC_URI = "http://www.libee.org/download/files/download/${BPN}-${PV}.tar.gz\
+           file://libee-parallel-make.patch \
+           file://run-ptest \
+           file://ezapi1.sh \
+"
+
+inherit autotools ptest pkgconfig
+
+DEPENDS += "libestr"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'ptest', 'testbench', '', d)}"
+
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
+PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
+
+TESTDIR = "tests"
+
+# We presume the tests we are going to install so just build them directly.
+#
+do_compile_ptest() {
+	oe_runmake -C ${TESTDIR} genfile ezapi1
+}
+
+do_install_ptest() {
+	install -d ${D}${PTEST_PATH}
+	install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
+	install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
+	install -m 0755 ${WORKDIR}/ezapi1.sh ${D}${PTEST_PATH}
+}
diff --git a/meta-oe/recipes-support/libee/libee/ezapi1.sh b/meta-oe/recipes-support/libee/libee/ezapi1.sh
new file mode 100755
index 0000000..e9db5e6
--- /dev/null
+++ b/meta-oe/recipes-support/libee/libee/ezapi1.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+#
+echo ---------------------------------------------------------------------------
+echo A very basic test for the event class
+echo ---------------------------------------------------------------------------
+rm -f infile
+./genfile 100 > infile
+./ezapi1 -iinfile
+if [ $? -ne 0 ] ; then
+   echo "FAIL: $0"
+   exit 1
+fi
+echo "PASS: $0"
+rm -f infile
diff --git a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
new file mode 100644
index 0000000..25e5c6a
--- /dev/null
+++ b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
@@ -0,0 +1,20 @@
+fix parallel compiling problem
+
+without specifying libee_convert_DEPENDENCIES = libee.la, libee_convert
+can't find libee.la when linking as libee is not generated yet.
+ 
+Upstream-Status: pending
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 08aaa9e..f0c78f7 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -46,5 +46,6 @@ libee_la_LDFLAGS = -version-info 0:0:0
+ libee_convert_SOURCES = convert.c
+ libee_convert_CPPFLAGS =  -I$(top_srcdir) $(LIBEE_CFLAGS) $(LIBESTR_CFLAGS) $(LIBXML2_CFLAGS)
+ libee_convert_LDADD = $(LIBEE_LIBS) $(LIBXML2_LIBS) $(LIBESTR_LIBS)
++libee_convert_DEPENDENCIES = libee.la
+ 
+ include_HEADERS = 
diff --git a/meta-oe/recipes-support/libee/libee/run-ptest b/meta-oe/recipes-support/libee/libee/run-ptest
new file mode 100755
index 0000000..3cb6607
--- /dev/null
+++ b/meta-oe/recipes-support/libee/libee/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+#
+./ezapi1.sh
diff --git a/meta-oe/recipes-support/libee/libee_0.4.1.bb b/meta-oe/recipes-support/libee/libee_0.4.1.bb
new file mode 100644
index 0000000..ef2c20d
--- /dev/null
+++ b/meta-oe/recipes-support/libee/libee_0.4.1.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "7bbf4160876c12db6193c06e2badedb2"
+SRC_URI[sha256sum] = "c0dac01938593deee06c3d161e4eda4ecc0fd7317e1321bd96e301aceb7fb027"
-- 
1.7.10.4


