Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A49AA75FB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 03:11:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H3Besa020241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:11:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 16 Jul 2015 20:11:40 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jul 2015 11:10:00 +0800
Message-ID: <1437102603-25983-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
References: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/4] crash: upgrade from 7.0.9 to 7.1.2
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
X-List-Received-Date: Fri, 17 Jul 2015 03:11:42 -0000
Content-Type: text/plain

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-cross_add_configure_option.patch          | 34 ------------
 .../7001force_define_architecture.patch            | 13 -----
 .../crash/crash-7.0.9/7003cross_ranlib.patch       | 10 ----
 .../crash/crash-7.0.9/config-site.crash-7.0.9      |  1 -
 .../crash/0001-cross_add_configure_option.patch    | 34 ++++++++++++
 .../crash/7001force_define_architecture.patch      | 13 +++++
 .../crash/crash/7003cross_ranlib.patch             | 10 ++++
 .../crash/crash/config-site.crash-7.0.9            |  1 +
 meta-oe/recipes-kernel/crash/crash_7.0.9.bb        | 63 ----------------------
 meta-oe/recipes-kernel/crash/crash_7.1.2.bb        | 63 ++++++++++++++++++++++
 10 files changed, 121 insertions(+), 121 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9
 delete mode 100644 meta-oe/recipes-kernel/crash/crash_7.0.9.bb
 create mode 100644 meta-oe/recipes-kernel/crash/crash_7.1.2.bb

diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
deleted file mode 100644
index 229647f..0000000
--- a/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From cbaaa42933bb27b1bcff4c7d71d54c913201ee88 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 9 Jan 2015 11:51:18 +0900
-Subject: [PATCH] cross_add_configure_option
-
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 9c44633..39bebd0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -229,7 +229,7 @@ gdb_merge: force
- 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
- 	@rm -f ${PROGRAM}
- 	@if [ ! -f ${GDB}/config.status ]; then \
--	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
-+	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
- 	    --with-bugurl="" --with-expat=no --with-python=no; \
- 	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
- 	else make --no-print-directory rebuild; fi
-@@ -277,7 +277,7 @@ force:
- 
- make_configure: force
- 	@rm -f configure
--	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
-+	@cc ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
- 
- clean: make_configure
- 	@./configure ${CONF_TARGET_FLAG} -q -b
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
deleted file mode 100644
index 0d44c7f..0000000
--- a/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -uprN crash-5.1.8.org/configure.c crash-5.1.8/configure.c
---- crash-5.1.8.org/configure.c	2011-09-17 04:01:12.000000000 +0900
-+++ crash-5.1.8/configure.c	2012-09-13 13:28:45.393344108 +0900
-@@ -391,6 +391,9 @@ get_current_configuration(struct support
- 			arch_mismatch(sp);
- 	}
- 
-+	/** Force define archtecture */
-+	target_data.target = FORCE_DEFINE_ARCH;
-+
-         if ((fp = fopen("Makefile", "r")) == NULL) {
- 		perror("Makefile");
- 		goto get_release;
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
deleted file mode 100644
index d567fa0..0000000
--- a/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- crash-5.1.8/Makefile.orig	2011-12-27 11:21:58.220652105 +0900
-+++ crash-5.1.8/Makefile	2011-12-27 11:22:29.563651593 +0900
-@@ -285,6 +285,7 @@
- 
- library: make_build_data ${OBJECT_FILES}
- 	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
-+	${RANLIB} ${PROGRAM}lib.a 
- 
- gdb: force
- 	rm -f ${GDB_OFILES}
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9 b/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
deleted file mode 100644
index d6fc22f..0000000
--- a/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
+++ /dev/null
@@ -1 +0,0 @@
-bash_cv_have_mbstate_t=yes
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
new file mode 100644
index 0000000..229647f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
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
diff --git a/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch b/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
new file mode 100644
index 0000000..0d44c7f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
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
diff --git a/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
new file mode 100644
index 0000000..d567fa0
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
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
diff --git a/meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9 b/meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9
new file mode 100644
index 0000000..d6fc22f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9
@@ -0,0 +1 @@
+bash_cv_have_mbstate_t=yes
diff --git a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
deleted file mode 100644
index 586a0ba..0000000
--- a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY = "Kernel analysis utility for live systems, netdump, diskdump, kdump, LKCD or mcore dumpfiles"
-DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to\
-investigate either live systems, kernel core dumps created from the\
-netdump, diskdump and kdump packages from Red Hat Linux, the mcore kernel patch\
-offered by Mission Critical Linux, or the LKCD kernel patch."
-
-HOMEPAGE = "http://people.redhat.com/anderson"
-SECTION = "devel"
-
-inherit gettext
-
-DEPENDS = "zlib readline"
-
-SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz \
-           file://7001force_define_architecture.patch \ 
-           file://7003cross_ranlib.patch \
-           file://0001-cross_add_configure_option.patch \
-           "
-
-SRC_URI[md5sum] = "d70ad2ed0f6d210ed11e88b8e977f5fd"
-SRC_URI[sha256sum] = "c6034c6eb6b52691c60d0b72dbdec58fac4c1b3ed1cd0697c209dc48d13a577e"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
-
-EXTRA_OEMAKE = 'RPMPKG="${PV}" \
-                GDB_TARGET="${TARGET_SYS}" \
-                GDB_HOST="${BUILD_SYS}" \
-                '
-do_configure() {
-    :
-}
-
-do_compile_prepend() {
-   case ${TARGET_ARCH} in
-                arm*)     ARCH=ARM ;;
-                i*86*)    ARCH=X86 ;;
-                powerpc*) ARCH=PPC ;;
-                x86_64*)  ARCH=X86_64 ;;
-        esac
-
-    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
-    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
-    sed -i 's/&gt;/>/g' ${S}/Makefile
-}
-do_compile() {
-    oe_runmake ${EXTRA_OEMAKE}
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install -d ${D}/${mandir}/man8
-    install -d ${D}${includedir}/crash
-
-    oe_runmake DESTDIR=${D} install
-    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
-    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
-}   
-RDEPENDS_${PN} += "liblzma"
-
-# Causes gcc to get stuck and eat all available memory in qemuarm builds
-# jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
-ARM_INSTRUCTION_SET = "arm"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.2.bb b/meta-oe/recipes-kernel/crash/crash_7.1.2.bb
new file mode 100644
index 0000000..f1e02e9
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.2.bb
@@ -0,0 +1,63 @@
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
+SRC_URI[md5sum] = "04db2dde0d5e1dacbe3b820df3957742"
+SRC_URI[sha256sum] = "630664a00cbf5d7357f8dcdfc45e73ea62a2a517bd349ab73f0d704d10b01c55"
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
+
+# Causes gcc to get stuck and eat all available memory in qemuarm builds
+# jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
+ARM_INSTRUCTION_SET = "arm"
-- 
1.9.1


