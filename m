Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D74147D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 06:41:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x686ffq1006572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jul 2019 23:41:41 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 23:41:40 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 14:38:59 +0800
Message-ID: <20190708063901.13914-7-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20190708063901.13914-1-yongxin.liu@windriver.com>
References: <20190708063901.13914-1-yongxin.liu@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 7/9] keyutils: fix library install path
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
X-List-Received-Date: Mon, 08 Jul 2019 06:41:40 -0000
Content-Type: text/plain

From: Armin Kuster <akuster808@gmail.com>

[v2]
fix multilib support
Als add native support

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 files/fix_library_install_path.patch | 28 ++++++++++++++++++++++++++++
 keyutils_1.6.bb                      | 14 ++++++++------
 2 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 files/fix_library_install_path.patch

diff --git a/files/fix_library_install_path.patch b/files/fix_library_install_path.patch
new file mode 100644
index 000000000..938fe2eb5
--- /dev/null
+++ b/files/fix_library_install_path.patch
@@ -0,0 +1,28 @@
+From b0355cc205543ffd33752874295139d57c4fbc3e Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Tue, 26 Sep 2017 07:59:51 +0000
+Subject: [PATCH] Subject: [PATCH] keyutils: use relative path for link
+
+The absolute path of the symlink will be invalid
+when populated in sysroot, so use relative path instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+{rebased for 1.6]
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: keyutils-1.6/Makefile
+===================================================================
+--- keyutils-1.6.orig/Makefile
++++ keyutils-1.6/Makefile
+@@ -184,7 +184,7 @@ ifeq ($(NO_SOLIB),0)
+ 	$(INSTALL) -D $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(LIBNAME)
+ 	$(LNS) $(LIBNAME) $(DESTDIR)$(LIBDIR)/$(SONAME)
+ 	mkdir -p $(DESTDIR)$(USRLIBDIR)
+-	$(LNS) $(LIBDIR)/$(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
++	$(LNS) $(SONAME) $(DESTDIR)$(USRLIBDIR)/$(DEVELLIB)
+ 	sed \
+ 	-e 's,@VERSION\@,$(VERSION),g' \
+ 	-e 's,@prefix\@,$(PREFIX),g' \
diff --git a/keyutils_1.6.bb b/keyutils_1.6.bb
index c961fa293..4d3a96f29 100644
--- a/keyutils_1.6.bb
+++ b/keyutils_1.6.bb
@@ -12,13 +12,13 @@ LICENSE = "LGPLv2.1+ & GPLv2.0+"
 LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
                     file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
 
-
-inherit siteinfo ptest
+inherit siteinfo autotools-brokensep ptest
 
 SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
            file://keyutils-test-fix-output-format.patch \
            file://keyutils-fix-error-report-by-adding-default-message.patch \
            file://run-ptest \
+           file://fix_library_install_path.patch \
            "
 
 SRC_URI[md5sum] = "191987b0ab46bb5b50efd70a6e6ce808"
@@ -28,14 +28,15 @@ EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     NO_ARLIB=1 \
     BINDIR=${base_bindir} \
     SBINDIR=${base_sbindir} \
-    LIBDIR=${base_libdir} \
-    USRLIBDIR=${base_libdir} \
+    LIBDIR=${libdir} \
+    USRLIBDIR=${libdir} \
+    INCLUDEDIR=${includedir} \
     BUILDFOR=${SITEINFO_BITS}-bit \
     NO_GLIBC_KEYERR=1 \
     "
 
 do_install () {
-    install -d ${D}/${nonarch_base_libdir}/pkgconfig
+    install -d ${D}/${libdir}/pkgconfig
     oe_runmake DESTDIR=${D} install
 }
 
@@ -44,8 +45,9 @@ do_install_ptest () {
     sed -i -e 's/OSDIST=Unknown/OSDIST=${DISTRO}/' ${D}${PTEST_PATH}/tests/prepare.inc.sh
 }
 
-FILES_${PN}-dev += "${nonarch_base_libdir}/pkgconfig/libkeyutils.pc"
 
 RDEPENDS_${PN}-ptest += "lsb"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.14.4


