Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A0CBA71633
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 03:53:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55895699"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jan 2015 11:49:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0C3qjeM031862
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 11:52:45 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 12 Jan 2015 11:53:20 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Jan 2015 11:52:35 +0800
Message-ID: <1421034755-50702-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [meta-oe][V2 PATCH] crash: add new recipe
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
X-List-Received-Date: Mon, 12 Jan 2015 03:53:26 -0000
Content-Type: text/plain

crash core analysis suite

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../0001-cross_add_configure_option.patch          | 34 +++++++++++++
 .../7001force_define_architecture.patch            | 13 +++++
 .../crash/crash-7.0.9/7003cross_ranlib.patch       | 10 ++++
 .../crash/crash-7.0.9/config-site.crash-7.0.9      |  1 +
 meta-oe/recipes-kernel/crash/crash_7.0.9.bb        | 59 ++++++++++++++++++++++
 5 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
 create mode 100644 meta-oe/recipes-kernel/crash/crash_7.0.9.bb

diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
new file mode 100644
index 0000000..229647f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
@@ -0,0 +1,34 @@
+From cbaaa42933bb27b1bcff4c7d71d54c913201ee88 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 9 Jan 2015 11:51:18 +0900
+Subject: [PATCH] cross_add_configure_option
+
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9c44633..39bebd0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -229,7 +229,7 @@ gdb_merge: force
+ 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
+ 	@rm -f ${PROGRAM}
+ 	@if [ ! -f ${GDB}/config.status ]; then \
+-	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
++	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
+ 	    --with-bugurl="" --with-expat=no --with-python=no; \
+ 	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
+ 	else make --no-print-directory rebuild; fi
+@@ -277,7 +277,7 @@ force:
+ 
+ make_configure: force
+ 	@rm -f configure
+-	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
++	@cc ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
+ 
+ clean: make_configure
+ 	@./configure ${CONF_TARGET_FLAG} -q -b
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
new file mode 100644
index 0000000..0d44c7f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
@@ -0,0 +1,13 @@
+diff -uprN crash-5.1.8.org/configure.c crash-5.1.8/configure.c
+--- crash-5.1.8.org/configure.c	2011-09-17 04:01:12.000000000 +0900
++++ crash-5.1.8/configure.c	2012-09-13 13:28:45.393344108 +0900
+@@ -391,6 +391,9 @@ get_current_configuration(struct support
+ 			arch_mismatch(sp);
+ 	}
+ 
++	/** Force define archtecture */
++	target_data.target = FORCE_DEFINE_ARCH;
++
+         if ((fp = fopen("Makefile", "r")) == NULL) {
+ 		perror("Makefile");
+ 		goto get_release;
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
new file mode 100644
index 0000000..d567fa0
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
@@ -0,0 +1,10 @@
+--- crash-5.1.8/Makefile.orig	2011-12-27 11:21:58.220652105 +0900
++++ crash-5.1.8/Makefile	2011-12-27 11:22:29.563651593 +0900
+@@ -285,6 +285,7 @@
+ 
+ library: make_build_data ${OBJECT_FILES}
+ 	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
++	${RANLIB} ${PROGRAM}lib.a 
+ 
+ gdb: force
+ 	rm -f ${GDB_OFILES}
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9 b/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
new file mode 100644
index 0000000..d6fc22f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
@@ -0,0 +1 @@
+bash_cv_have_mbstate_t=yes
diff --git a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
new file mode 100644
index 0000000..8d62481
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
@@ -0,0 +1,59 @@
+SUMMARY = "Kernel analysis utility for live systems, netdump, diskdump, kdump, LKCD or mcore dumpfiles"
+DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to\
+investigate either live systems, kernel core dumps created from the\
+netdump, diskdump and kdump packages from Red Hat Linux, the mcore kernel patch\
+offered by Mission Critical Linux, or the LKCD kernel patch."
+
+HOMEPAGE = "http://people.redhat.com/anderson"
+SECTION = "devel"
+
+inherit gettext
+
+DEPENDS = "zlib readline"
+
+SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz \
+           file://7001force_define_architecture.patch \ 
+           file://7003cross_ranlib.patch \
+           file://0001-cross_add_configure_option.patch \
+           "
+
+SRC_URI[md5sum] = "d70ad2ed0f6d210ed11e88b8e977f5fd"
+SRC_URI[sha256sum] = "c6034c6eb6b52691c60d0b72dbdec58fac4c1b3ed1cd0697c209dc48d13a577e"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
+
+EXTRA_OEMAKE = 'RPMPKG="${PV}" \
+                GDB_TARGET="${TARGET_SYS}" \
+                GDB_HOST="${BUILD_SYS}" \
+                '
+do_configure() {
+    :
+}
+
+do_compile_prepend() {
+   case ${TARGET_ARCH} in
+                arm*)     ARCH=ARM ;;
+                i*86*)    ARCH=X86 ;;
+                powerpc*) ARCH=PPC ;;
+                x86_64*)  ARCH=X86_64 ;;
+        esac
+
+    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
+    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
+    sed -i 's/&gt;/>/g' ${S}/Makefile
+}
+do_compile() {
+    oe_runmake ${EXTRA_OEMAKE}
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}/${mandir}/man8
+    install -d ${D}${includedir}/crash
+
+    oe_runmake DESTDIR=${D} install
+    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
+    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
+}   
+RDEPENDS_${PN} += "liblzma"
-- 
1.8.4.2


