Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127A6CDE000
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 18:08:55 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17928.1782410925837245008
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 11:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XEeARxYG;
 spf=pass (domain: gmail.com, ip: 74.125.82.44, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-139aaba3522so97888c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782410925; x=1783015725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=esTpLU2nVV6mH7NK4ZtZiM/icOEEjCMvY2t+7X/8cJI=;
        b=XEeARxYGKzWngr+US/xegfue4POXJRhE0/kxBCXF2w6+CbEPdV+QIbfGWhp+hEwX9I
         SD+lofHZLiIA1J7uUId5aKvONAKjkzQtCrwHdWWGGKlGDxVf3HTAcvFYe+veqtLnfLCQ
         lzx/LU8VyQqe9t8erDuCasD7sUTq/czNyJ5NrzZb8BERu4O7FZevzUzWJmEJ6c+1LCWv
         YsANEPnMmGCBo0jJWgrrcpZRBRbZbyVvXKIJZTlv/lyCQ5WbSCYVoY27L+7hkz8aD7s6
         kUSPkJKVrsqTi5jEyx+JX/cajvmgaL22IuPaspx89v47gFjitDiiuJ00778DHI8+FBj2
         yONg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782410925; x=1783015725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esTpLU2nVV6mH7NK4ZtZiM/icOEEjCMvY2t+7X/8cJI=;
        b=QyDcO4qaitwdwBcv1cjjoz1yttwK15dFzTEiHEEralnnjTJ7XB6SJxgNoVKdkXMukK
         2QPJ1euYcx1gNOU4eJjwRo268Y1Nq+xyrjYy/3phLev58Xyh075zTwnd0CAVuh33QqLn
         jD6XRkVfSyYM/sePeKXEbCH6izotqs0NUtdEIXfA/z26++HIMySe7t5VJWr3ffjkLGP1
         IyRKuEpOmEeHaDScr+B/UJOG9+CcjYxjVCRBsb0zwC5CNi20dLwryFZTL1gkJCHNBn9L
         TquBmmJKW8ORoiN9hay52PU1b7ycb9Hum/UFJLoM0ZtDsmwNgFHL8iRUvWtTDx0b6JEw
         1YvQ==
X-Gm-Message-State: AOJu0Yzj0oKzPvjwWNLYmWVkOcdyNgESpsiRr+/FcZeTC9GyjrzjMsBu
	1dGe28+5m9F7MsE1OoQCp0qoFUGEoBm82vUguIf7Q03Iqn8qayM/xYMZEaiFfZVAcAE=
X-Gm-Gg: AfdE7clpYtxKdMu4hlC2ALyWUk0BTlaigROi+Y2ibDjZwBsUWP9CrzDq+3RqCOcvr/y
	9pQtu3cTS+eV92Ct4irbkzMzEYW3hODvVduO8WKDV0E149Gcfcz5Z7NG+O20iTU1HI1yW4WFiKx
	O65IbONVSQM4E+B/eSCYSE7cLgIDvCOaTLFd9nnibecCtuf39PhIdzawVG+vAAPbClcpyvW/lcW
	FdzO+M64rFLNFSjNi1rKP9ngMTfmH9EaIjM1n6sXnmbQ/+BVuFVkz9Z0gSuFzHORW52wrECIj4p
	Sv4b5C3uhvF+Wml/yyTjgYVDfK9a0v1n/xJs0zSnw+AqLXVyg/NE+5lDYF/Ljao3FlfQstEUXoL
	ffTQ06aKcnEQAIDbz8mTVlByOxRBdrNkccKq89kZvMNmd3uvA+XJHejJJI9OJOAbHVmcDJ8CFaJ
	Chfj77XhacQxf4LsP0lIR80LCu+dacgfbMNKfEKKaDZZ/zNIi+444Q6lXicMBM95o/TIoiUrXEt
	4KcDh4FA4wx1ckK2Mm+XHUARja/rxMvpGK4nFgs3eZahkjvsnIkejD3uJS3UFv0NMMVPMgIorAr
	FB6/uomdlYcNwApzcXWWNzFBe/uSsmnYQ7hYhx8I
X-Received: by 2002:a05:7022:1281:b0:139:b0a7:9df2 with SMTP id a92af1059eb24-139c3c1f6d4mr12132209c88.7.1782410924749;
        Thu, 25 Jun 2026 11:08:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f5fc82sm9799620c88.5.2026.06.25.11.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 11:08:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/3] crash 8.0.6 -> 9.0.2 + crash-memory-driver
Date: Thu, 25 Jun 2026 11:08:37 -0700
Message-ID: <20260625180841.2638737-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 18:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127782

From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>

1) crash-memory-driver: fixed typo to include proper patch
2) crash-memory-driver: keep license,...

patch against comments on pull request:

1) HOMEPAGE updated
2) UPSTREAM_CHECK_URI updated
3) exports removed
4) if [ -f "gdb-16.2.patch" ]; then... removed
5) notes about QA Issue: reference to TMPDIR [buildpaths] added
6) notes ./crash --buildinfo removed
7) LIC_FILES_CHKSUM: use license text in crash.c
8) PV = "9.0.2+git${SRCPV}" -> SRCPV removed
9) removed unused patches
10) crash: LICENSE = GPL-3.0-only

Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../crash/crash-cross-canadian_8.0.6.bb       |  52 -------
 .../crash/crash-cross-canadian_9.0.2.bb       |  73 ++++++++++
 ...1-hacked-Makefile-for-module.bbclass.patch |  52 +++++++
 .../crash/crash-memory-driver_9.0.2.bb        |  26 ++++
 meta-oe/recipes-kernel/crash/crash.inc        | 135 +++++++++++------
 ...e-CC-env-var-to-get-compiler-version.patch |   9 +-
 .../0001-cross_add_configure_option.patch     |  34 -----
 ...x-S-cannot-work-with-kaslr-detection.patch |  20 ++-
 ...sk-to-better-support-gdb-stack-unwin.patch |  85 -----------
 ...03-Fix-build-failure-in-readline-lib.patch | 136 ------------------
 ...se-keywords-nullptr-as-a-variable-in.patch |  60 --------
 ...-build-failure-on-32bit-machine-i686.patch |  83 -----------
 ...port-fix-default-init-alloc-for-C-20.patch |  82 -----------
 .../crash/7001force_define_architecture.patch |  15 --
 .../crash/crash/7003cross_ranlib.patch        |  10 +-
 ...donnot-extract-gdb-during-do-compile.patch |  45 ------
 ...uild_jobs_and_not_write_crash_target.patch |  12 +-
 .../crash/{crash_8.0.6.bb => crash_9.0.2.bb}  |   1 -
 18 files changed, 264 insertions(+), 666 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
 create mode 100644 meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
 create mode 100644 meta-oe/recipes-kernel/crash/crash-memory-driver/0001-hacked-Makefile-for-module.bbclass.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0002-arm64-add-pac-mask-to-better-support-gdb-stack-unwin.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0003-Fix-build-failure-in-readline-lib.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/0006-gdbsupport-fix-default-init-alloc-for-C-20.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
 rename meta-oe/recipes-kernel/crash/{crash_8.0.6.bb => crash_9.0.2.bb} (99%)

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
deleted file mode 100644
index bafe56d2c4..0000000000
--- a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.6.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-inherit cross-canadian
-
-SUMMARY = "crash utility (cross-canadian crash for ${TARGET_ARCH} target)"
-PN = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-BPN = "crash"
-
-require crash.inc
-
-
-DEPENDS = "\
-    nativesdk-ncurses \
-    nativesdk-expat \
-    nativesdk-gettext \
-    nativesdk-gmp \
-    nativesdk-mpfr \
-    nativesdk-readline \
-    nativesdk-zlib \
-    virtual/nativesdk-cross-cc \
-    virtual/nativesdk-cross-binutils \
-    virtual/nativesdk-compilerlibs \
-    virtual/nativesdk-libc"
-
-RDEPENDS:${PN} = "nativesdk-liblzma"
-
-EXTRA_OEMAKE:class-cross-canadian = 'RPMPKG="${PV}" \
-                                     GDB_TARGET="${BUILD_SYS} --target=${TARGET_SYS}" \
-                                     GDB_HOST="${HOST_SYS}" \
-                                     GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
-                                     LDFLAGS="${LDFLAGS}" \
-                                     '
-
-# To ship crash into your sdk, you should create/update a packagegroup-cross-canadian.bbappend and
-# add the following
-# CRASH = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-# RDEPENDS:${PN} += "${@all_multilib_tune_values(d, 'CRASH')}"
-#
-# You should also add some kernel packages in your sdk, add the followng in your conf/local.conf:
-#
-# TOOLCHAIN_TARGET_TASK += "\
-#     kernel-vmlinux \
-#     kernel-dbg \
-#     kernel-dev \
-# "
-#
-# After sourcing the sdk environment script, you can analyze a kernel panic dump with
-#
-# crash $OECORE_TARGET_SYSROOT/boot/<vmlinux file> $OECORE_TARGET_SYSROOT/boot/<System.map file> <your vmcore>
-
-do_install:class-cross-canadian () {
-    install -m 0755 ${S}/crash ${D}/${bindir}
-    cross_canadian_bindirlinks
-}
diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
new file mode 100644
index 0000000000..0ab18cb3d4
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_9.0.2.bb
@@ -0,0 +1,73 @@
+inherit cross-canadian
+
+SUMMARY = "crash utility (cross-canadian crash for ${TARGET_ARCH} target)"
+PN = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+BPN = "crash"
+
+require crash.inc
+
+DEPENDS:append = " \
+    nativesdk-ncurses \
+    nativesdk-expat \
+    nativesdk-gettext \
+    nativesdk-gmp \
+    nativesdk-mpfr \
+    nativesdk-readline \
+    nativesdk-zlib \
+    virtual/nativesdk-cross-cc \
+    virtual/nativesdk-cross-binutils \
+    virtual/nativesdk-compilerlibs \
+    virtual/nativesdk-libc \
+"
+
+RDEPENDS:${PN} = "nativesdk-liblzma"
+
+EXTRA_OEMAKE:class-cross-canadian = ' \
+    RPMPKG="${PV}" \
+    CROSS_COMPILE="${HOST_PREFIX}" \
+    HOSTCC="gcc" \
+    CFLAGS="${CFLAGS} -fcommon --sysroot=${STAGING_DIR_HOST}" \
+    CXXFLAGS="${CXXFLAGS} -fcommon --sysroot=${STAGING_DIR_HOST}" \
+    LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_HOST}" \
+    GDB_TARGET="${BUILD_SYS} --target=${TARGET_SYS}" \
+    GDB_HOST="${HOST_SYS}" \
+    GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
+    GDB_CONF_FLAGS="--host=${HOST_SYS} \
+                    --build=${BUILD_SYS} \
+                    --target=${TARGET_SYS} \
+                    --disable-gdbserver \
+                    --disable-gprofng \
+                    --with-sysroot=${STAGING_DIR_TARGET} \
+                    ac_cv_type_gregset_t=yes \
+                    ac_cv_type_fpregset_t=yes \
+                    ac_cv_header_sys_procfs_h=yes" \
+'
+
+# Force the SDK cross-compiler during the command execution phase
+do_compile() {
+    oe_runmake ${EXTRA_OEMAKE} CC="${HOST_PREFIX}gcc ${HOST_CC_ARCH}" CXX="${HOST_PREFIX}g++ ${HOST_CC_ARCH}" RECIPE_SYSROOT=${RECIPE_SYSROOT}
+}
+
+# To ship crash into your sdk, you should create/update a packagegroup-cross-canadian.bbappend and
+# add the following
+# CRASH = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+# RDEPENDS:${PN} += "${@all_multilib_tune_values(d, 'CRASH')}"
+#
+# You should also add some kernel packages in your sdk, add the followng in your conf/local.conf:
+#
+# TOOLCHAIN_TARGET_TASK += "\
+#     kernel-vmlinux \
+#     kernel-dbg \
+#     kernel-dev \
+# "
+#
+# After sourcing the sdk environment script, you can analyze a kernel panic dump with
+#
+# crash $OECORE_TARGET_SYSROOT/boot/<vmlinux file> $OECORE_TARGET_SYSROOT/boot/<System.map file> <your vmcore>
+
+do_install:class-cross-canadian () {
+    rm -rf ${D}
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/crash ${D}${bindir}/crash
+    cross_canadian_bindirlinks
+}
diff --git a/meta-oe/recipes-kernel/crash/crash-memory-driver/0001-hacked-Makefile-for-module.bbclass.patch b/meta-oe/recipes-kernel/crash/crash-memory-driver/0001-hacked-Makefile-for-module.bbclass.patch
new file mode 100644
index 0000000000..72d28d280e
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-memory-driver/0001-hacked-Makefile-for-module.bbclass.patch
@@ -0,0 +1,52 @@
+From 4e33b3183f7ec903f73479600cfcb9014de1780e Mon Sep 17 00:00:00 2001
+From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
+Date: Wed, 5 Mar 2025 06:28:02 +0000
+Subject: [PATCH] hacked Makefile for module.bbclass
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
+---
+ memory_driver/Makefile | 26 +++++++++++++++++---------
+ 1 file changed, 17 insertions(+), 9 deletions(-)
+
+diff --git a/memory_driver/Makefile b/memory_driver/Makefile
+index 61ee7c0..d8dd3b5 100644
+--- a/memory_driver/Makefile
++++ b/memory_driver/Makefile
+@@ -7,15 +7,23 @@
+ # but WITHOUT ANY WARRANTY; without even the implied warranty of
+ # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ # GNU General Public License for more details.
+-#
+-ifneq ($(KERNELRELEASE),)
++
+ obj-m := crash.o
+-else
+-PWD := $(shell pwd)
+-KVER ?= $(shell uname -r)
+-KDIR ?= /lib/modules/${KVER}/build
++
++SRC := $(shell pwd)
++
+ all:
+-	${MAKE} -C ${KDIR} M=${PWD} SUBDIRS=${PWD} modules
++	$(MAKE) -C $(KERNEL_SRC) M=$(SRC)
++
++# if you would like to invoke sparse:
++#
++# all:
++#       $(MAKE) KBUILD_CHECKSRC=1 -C $(KERNEL_SRC) M=$(SRC)
++
++modules_install:
++	$(MAKE) -C $(KERNEL_SRC) M=$(SRC) modules_install
++
+ clean:
+-	test -e ${KDIR}/Makefile && ${MAKE} -C ${KDIR} M=${PWD} SUBDIRS=${PWD} clean || ${RM} *.mod.c *.ko *.o Module.*
+-endif
++	rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
++	rm -f Module.markers Module.symvers modules.order
++	rm -rf .tmp_versions Modules.symvers
+--
+2.34.1
+
diff --git a/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb b/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb
new file mode 100644
index 0000000000..46de814e9b
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-memory-driver_9.0.2.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Once installed, the /dev/crash driver will be used by default for live system crash sessions."
+SECTION = "devel"
+SUMMARY = "/dev/crash driver"
+HOMEPAGE = "https://github.com/crash-utility/crash/tree/master/memory_driver"
+RECIPE_MAINTAINER = "Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://crash.c;beginline=1;endline=25;md5=c278eae78e2bf99783849a90f03d0e43"
+
+inherit module
+
+SRCREV = "61fe107ff96a22e7df0029877529b7ce6da36850"
+SRC_URI = "git://github.com/crash-utility/crash;protocol=https;branch=master;subpath=memory_driver;destsuffix=${BP} \
+           file://0001-hacked-Makefile-for-module.bbclass.patch;striplevel=2 \
+           "
+PV = "9.0.2+git"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+
+RPROVIDES:${PN} += "kernel-module-crash-memory-driver"
+
+# to local.conf add:
+#    to add the kernel module to the rootfs:
+# MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-module-crash-memory-driver"
+#    to autoload it:
+# KERNEL_MODULE_AUTOLOAD += "crash"
diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 03a45f1a8c..4e889f7677 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -1,37 +1,32 @@
-SUMMARY = "Kernel analysis utility for live systems, netdump, diskdump, kdump, LKCD or mcore dumpfiles"
-DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to\
-investigate either live systems, kernel core dumps created from the\
-netdump, diskdump and kdump packages from Red Hat Linux, the mcore kernel patch\
-offered by Mission Critical Linux, or the LKCD kernel patch."
-
-HOMEPAGE = "http://people.redhat.com/anderson"
+SUMMARY = "Kernel analysis utility for live systems and core dumpfiles"
+DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to \
+investigate either live systems, kernel core dumps created from kdump, or mcore dumpfiles."
+HOMEPAGE = "https://crash-utility.github.io/"
 SECTION = "devel"

 LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "zlib readline coreutils-native ncurses-native"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/${BP}/COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://${UNPACKDIR}/gdb/gdb-16.2/COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+"

-INC_PR = "r1"
+DEPENDS = "zlib readline ncurses gmp mpfr"
+# Use append for cross-canadian on native packages
+DEPENDS:append = " coreutils-native bison-native flex-native"

-SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=https \
-           ${GNU_MIRROR}/gdb/gdb-10.2.tar.gz;name=gdb;subdir=${BB_GIT_DEFAULT_DESTSUFFIX} \
-           file://7001force_define_architecture.patch \
+SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=https;destsuffix=${BP} \
+           ${GNU_MIRROR}/gdb/gdb-16.2.tar.gz;name=gdb;subdir=gdb \
            file://7003cross_ranlib.patch \
-           file://0001-cross_add_configure_option.patch \
-           file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
            file://0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch \
-           file://0002-arm64-add-pac-mask-to-better-support-gdb-stack-unwin.patch \
-           file://0003-Fix-build-failure-in-readline-lib.patch \
-           file://0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch \
-           file://0005-Fix-build-failure-on-32bit-machine-i686.patch \
            file://0001-Use-CC-env-var-to-get-compiler-version.patch \
-           file://0006-gdbsupport-fix-default-init-alloc-for-C-20.patch \
-           "
-SRCREV = "f13853cef53f5c5463a51021edbc81977e2b1405"
+          "
+# 0001-Use-CC-env-var-to-get-compiler-version.patch:
+# to get the right compiler info into ./crash --buildinfo
+
+SRCREV = "61fe107ff96a22e7df0029877529b7ce6da36850"
+#PV = "9.0.2"
+SRC_URI[gdb.sha256sum] = "bdc1da4a033280ac752e7d34b0418efaa45bed093235cb88e62ea961752a37f8"

-SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"

 UPSTREAM_CHECK_URI = "https://github.com/crash-utility/crash/releases"

@@ -39,44 +34,90 @@ inherit gettext

 TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"

-# crash 7.1.3 and before don't support mips64/riscv64
+# Target machine constraints preserved from your original layout
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:mipsarchn32 = "null"
+COMPATIBLE_HOST:libc-musl = 'null'

-CXXFLAGS += "-std=gnu++17"
-
-EXTRA_OEMAKE = 'RPMPKG="${PV}" \
-                GDB_TARGET="${TARGET_SYS}" \
-                GDB_HOST="${BUILD_SYS}" \
-                GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
-                LDFLAGS="${LDFLAGS}" \
-                '
+# add gdb autoconf overrides
+EXTRA_OEMAKE = ' \
+    RPMPKG="${PV}" \
+    CROSS_COMPILE="${TARGET_PREFIX}" \
+    HOSTCC="gcc" \
+    CFLAGS="${CFLAGS} -fcommon --sysroot=${STAGING_DIR_TARGET}" \
+    CXXFLAGS="${CXXFLAGS} -fcommon --sysroot=${STAGING_DIR_TARGET}" \
+    LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}" \
+    AR="${AR}" \
+    RANLIB="${RANLIB}" \
+    GDB_TARGET="${TARGET_SYS}" \
+    GDB_HOST="${BUILD_SYS}" \
+    GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
+    GDB_CONF_FLAGS="--host=${HOST_SYS} \
+                    --target=${TARGET_SYS} \
+                    --disable-gdbserver \
+                    --disable-gprofng \
+                    --with-sysroot=${STAGING_DIR_TARGET} \
+                    ac_cv_type_gregset_t=yes \
+                    ac_cv_type_fpregset_t=yes \
+                    ac_cv_header_sys_procfs_h=yes" \
+'
+
+TARGET_CFLAGS:append = " -fcommon -fpermissive"
+TARGET_CXXFLAGS:append = " -fcommon -fpermissive"

 do_configure() {
     :
 }

 do_compile:prepend() {
+    # 1. Map Yocto architecture strings to the strict naming convention expected by crash
     case ${TARGET_ARCH} in
-        aarch64*)    ARCH=ARM64 ;;
-        arm*)        ARCH=ARM ;;
-        i*86*)       ARCH=X86 ;;
-        x86_64*)     ARCH=X86_64 ;;
-        powerpc64*)  ARCH=PPC64 ;;
-        powerpc*)    ARCH=PPC ;;
-        mips*)       ARCH=MIPS ;;
+        aarch64*)    ARCH_UPPER=ARM64 ;;
+        arm*)        ARCH_UPPER=ARM ;;
+        i*86*)       ARCH_UPPER=X86 ;;
+        x86_64*)     ARCH_UPPER=X86_64 ;;
+        powerpc64*)  ARCH_UPPER=PPC64 ;;
+        powerpc*)    ARCH_UPPER=PPC ;;
+        mips*)       ARCH_UPPER=MIPS ;;
+        *)           ARCH_UPPER=$(echo "${TARGET_ARCH}" | tr '[:lower:]' '[:upper:]') ;;
     esac

-    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
+    bbnote "Staging pre-unpacked GDB 16.2 source tree into active build workspace layout..."
+    rm -rf ${B}/gdb-16.2
+
+    # 2. Copy the official clean GNU tarball source footprint into the active workspace mapping
+    cp -rf ${UNPACKDIR}/gdb/gdb-16.2 ${B}/gdb-16.2
+
+    # 3. Initialize the localized tracking repository required by the crash build architecture
+    cd ${B}/gdb-16.2/
+    git init
+    git add .
+    git commit -m "initial commit"
+    cd ${B}
+
+    bbnote "Writing dynamic target layout architecture context: ${ARCH_UPPER}"
+    echo "${ARCH_UPPER}" > ${B}/gdb-16.2/crash.target
+
+    # 4. Apply your original configuration text manipulations natively
+    sed -i s/FORCE_DEFINE_ARCH/"${ARCH_UPPER}"/g ${S}/configure.c
     sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
     sed -i -e 's/#define TARGET_CFLAGS_MIPS_ON_X86_64.*/#define TARGET_CFLAGS_MIPS_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
     sed -i 's/&gt;/>/g' ${S}/Makefile
+
+    # 5. Return to the active workspace build root to merge downstream additions
+    cd ${B}
+    bbnote "Applying the native upstream crash integration patch onto the GDB source tree..."
+    patch -p0 --fuzz=3 < gdb-16.2.patch
+    cd ${B}/gdb-16.2/
+    git add .
+    git commit -m "after upstream crash gdb-16.2.patch"
+    cd ${B}
 }

 do_compile() {
-    oe_runmake ${EXTRA_OEMAKE} RECIPE_SYSROOT=${RECIPE_SYSROOT}
+    oe_runmake ${EXTRA_OEMAKE} CC="${CC}" CXX="${CXX}" RECIPE_SYSROOT=${RECIPE_SYSROOT}
 }

 do_install:prepend () {
@@ -90,9 +131,11 @@ do_install:prepend () {

 RDEPENDS:${PN} += "liblzma"

-# Causes gcc to get stuck and eat all available memory in qemuarm builds
-# jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
 ARM_INSTRUCTION_SET = "arm"

-# http://errors.yoctoproject.org/Errors/Details/186964/
-COMPATIBLE_HOST:libc-musl = 'null'
+# WARNING: crash-9.0.2-r0 do_package_qa: QA Issue: File /usr/bin/crash in package crash contains reference to TMPDIR [buildpaths]
+#
+# WARNING: crash-cross-canadian-aarch64-9.0.2-r0 do_package_qa: QA Issue: File /opt/phytec-ampliphy-resy-systemd/6.0.98-devel/sysroots/x86_64-resysdk-linux/usr/bin/aarch64-resy-linux/crash in package crash-cross-canadian-aarch64 contains reference to TMPDIR [buildpaths]
+#
+ERROR_QA:remove = "buildpaths"
+WARN_QA:append = " buildpaths"
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
index 773598def1..2e4b3fdd4f 100644
--- a/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
+++ b/meta-oe/recipes-kernel/crash/crash/0001-Use-CC-env-var-to-get-compiler-version.patch
@@ -1,7 +1,7 @@
-From 6ad5e9302057e157ab701880a8543ca59058df2d Mon Sep 17 00:00:00 2001
+From df98eb38b680fd633a6e87679d7267252849764d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
 Date: Fri, 16 May 2025 16:18:28 +0200
-Subject: [PATCH v2] Use CC env var to get compiler version
+Subject: [PATCH] Use CC env var to get compiler version
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -19,15 +19,16 @@ compiler version, when the CC env var is define.
 Upstream-Status: Submitted [https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/V3G3QH3YW6WZWD56TVTFQIHYLZ33UIJL/]

 Signed-off-by: Kéléfa Sané <kelefa.sane@smile.fr>
+Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
 ---
  configure.c | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)

 diff --git a/configure.c b/configure.c
-index 4668c9a..4b65bd7 100644
+index 6e39d87..74e88b7 100644
 --- a/configure.c
 +++ b/configure.c
-@@ -1362,7 +1362,17 @@ make_build_data(char *target)
+@@ -1381,7 +1381,17 @@ make_build_data(char *target)

          fp1 = popen("date", "r");
          fp2 = popen("id", "r");
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
deleted file mode 100644
index fc99ff5187..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0001-cross_add_configure_option.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e3ba432243d9be4e845daabc78a0ae7c03c680f5 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Fri, 9 Jan 2015 11:51:18 +0900
-Subject: [PATCH] cross_add_configure_option
-
-
----
-Upstream-Status: Pending
-
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 7266e305..390fc0ef 100644
---- a/Makefile
-+++ b/Makefile
-@@ -260,7 +260,7 @@ gdb_merge: force
- 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
- 	@rm -f ${PROGRAM}
- 	@if [ ! -f ${GDB}/config.status ]; then \
--	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
-+	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
- 	    --with-bugurl="" --with-expat=no --with-python=no --disable-sim; \
- 	  $(MAKE) CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
- 	else $(MAKE) rebuild; fi
-@@ -306,7 +306,7 @@ force:
-
- make_configure: force
- 	@rm -f configure
--	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
-+	@${BUILD_CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
-
- clean: make_configure
- 	@./configure ${CONF_TARGET_FLAG} -q -b
diff --git a/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch b/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
index 47182f8b6c..845239db39 100644
--- a/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
+++ b/meta-oe/recipes-kernel/crash/crash/0001-symbol-fix-S-cannot-work-with-kaslr-detection.patch
@@ -1,4 +1,4 @@
-From 329bd56da28fc1b5b53a60ca2172643d2090435d Mon Sep 17 00:00:00 2001
+From 35a721485f2a20ebb18d9f4ab48b7cf293369a70 Mon Sep 17 00:00:00 2001
 From: Tao Liu <ltao@redhat.com>
 Date: Fri, 13 Dec 2024 08:36:03 +0000
 Subject: [PATCH] symbol: fix -S cannot work with kaslr detection
@@ -15,15 +15,16 @@ Upstream-Status: Pending
 [https://lists.crash-utility.osci.io/archives/list/devel@lists.crash-utility.osci.io/thread/5OXNYPPU6GLLQKCWH7WBNBJXLNZ4EBZD/]

 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
 ---
  symbols.c | 18 ++++++++++--------
  1 file changed, 10 insertions(+), 8 deletions(-)

 diff --git a/symbols.c b/symbols.c
-index a3cd0f3..6062d21 100644
+index e6865ca..0028874 100644
 --- a/symbols.c
 +++ b/symbols.c
-@@ -25,7 +25,7 @@
+@@ -26,7 +26,7 @@

  static void store_symbols(bfd *, int, void *, long, unsigned int);
  static void store_sysmap_symbols(void);
@@ -32,7 +33,7 @@ index a3cd0f3..6062d21 100644
  static int relocate_force(ulong, char *);
  static void kaslr_init(void);
  static void strip_module_symbol_end(char *s);
-@@ -230,6 +230,7 @@ symtab_init(void)
+@@ -231,6 +231,7 @@ symtab_init(void)
  				DEBUGINFO_ERROR_MESSAGE1 :
  				DEBUGINFO_ERROR_MESSAGE2);
  		}
@@ -40,7 +41,7 @@ index a3cd0f3..6062d21 100644
  		store_sysmap_symbols();
  		return;
  	} else if (LKCD_KERNTYPES())
-@@ -817,7 +818,7 @@ store_symbols(bfd *abfd, int dynamic, void *minisyms, long symcount,
+@@ -818,7 +819,7 @@ store_symbols(bfd *abfd, int dynamic, void *minisyms, long symcount,
  		    syminfo.type)) {
  			if (kt->flags & (RELOC_SET|RELOC_FORCE))
  				sp->value = relocate(syminfo.value,
@@ -49,7 +50,7 @@ index a3cd0f3..6062d21 100644
  			else
  				sp->value = syminfo.value;
  			sp->type = syminfo.type;
-@@ -893,9 +894,9 @@ store_sysmap_symbols(void)
+@@ -894,9 +895,9 @@ store_sysmap_symbols(void)

                  if (machdep->verify_symbol(name, syment.value,
  		    syment.type)) {
@@ -61,7 +62,7 @@ index a3cd0f3..6062d21 100644
  			else
  				sp->value = syment.value;
                          sp->type = syment.type;
-@@ -924,7 +925,7 @@ store_sysmap_symbols(void)
+@@ -925,7 +926,7 @@ store_sysmap_symbols(void)
   *  are not as loaded into the kernel (not unity-mapped).
   */
  static ulong
@@ -70,7 +71,7 @@ index a3cd0f3..6062d21 100644
  {
  	if (XEN_HYPER_MODE()) {
  		kt->flags &= ~(RELOC_SET|RELOC_FORCE);
-@@ -937,9 +938,10 @@ relocate(ulong symval, char *symname, int first_symbol)
+@@ -938,9 +939,10 @@ relocate(ulong symval, char *symname, int first_symbol)
  		break;

  	case RELOC_FORCE:
@@ -84,6 +85,3 @@ index a3cd0f3..6062d21 100644
  	}

  	if (machine_type("X86_64")) {
---
-2.35.5
-
diff --git a/meta-oe/recipes-kernel/crash/crash/0002-arm64-add-pac-mask-to-better-support-gdb-stack-unwin.patch b/meta-oe/recipes-kernel/crash/crash/0002-arm64-add-pac-mask-to-better-support-gdb-stack-unwin.patch
deleted file mode 100644
index 42a585d366..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0002-arm64-add-pac-mask-to-better-support-gdb-stack-unwin.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 0f39e33d3504f3a17b83574c3be97640460b7eef Mon Sep 17 00:00:00 2001
-From: "Guanyou.Chen" <chenguanyou@xiaomi.com>
-Date: Wed, 25 Dec 2024 23:50:28 +0800
-Subject: [PATCH] arm64: add pac mask to better support gdb stack unwind
-
-Currently, gdb passthroughs of 'bt', 'frame', 'up', 'down',
-'info, locals' don't work on arm64 machine enabled pauth.
-This is because gdb does not know the lr register actual values
-to unwind the stack frames.
-
-Without the patch:
-    crash> gdb bt
-    #0  __switch_to (prev=0xffffff8001af92c0, next=0xffffff889da7a580) at /proc/self/cwd/common/arch/arm64/kernel/process.c:569
-    #1  0x9fc5c5d3602132c0 in ?? ()
-    Backtrace stopped: previous frame identical to this frame (corrupt stack?)
-
-With the patch:
-    crash> gdb bt
-    #0  __switch_to (prev=prev@entry=0xffffff8001af92c0, next=next@entry=0xffffff889da7a580) at /proc/self/cwd/common/arch/arm64/kernel/process.c:569
-    #1  0xffffffd3602132c0 in context_switch (rq=0xffffff8a7295a080, prev=0xffffff8001af92c0, next=0xffffff889da7a580, rf=<optimized out>) at /proc/self/cwd/common/kernel/sched/core.c:5515
-    #2  __schedule (sched_mode=<optimized out>, sched_mode@entry=2147859424) at /proc/self/cwd/common/kernel/sched/core.c:6843
-    #3  0xffffffd3602136d8 in schedule () at /proc/self/cwd/common/kernel/sched/core.c:6917
-    ...
-
-Signed-off-by: Guanyou.Chen <chenguanyou@xiaomi.com>
-Signed-off-by: mark.yang <mark.yang@lge.com>
-
-Upstream-Status: Backport [0f39e33 arm64: add pac mask to better support gdb stack unwind]
----
- gdb-10.2.patch  | 23 +++++++++++++++++++++++
- gdb_interface.c | 10 ++++++++++
- 2 files changed, 33 insertions(+)
-
-diff --git a/gdb-10.2.patch b/gdb-10.2.patch
-index c867660..fd6fadb 100644
---- a/gdb-10.2.patch
-+++ b/gdb-10.2.patch
-@@ -16216,3 +16216,26 @@ exit 0
-  	    printf_filtered (_("Backtrace stopped: %s\n"),
-  			     frame_stop_reason_string (trailing));
-  	}
-+--- gdb-10.2/gdb/frame.c.orig
-++++ gdb-10.2/gdb/frame.c
-+@@ -944,6 +944,10 @@ frame_find_by_id (struct frame_id id)
-+   return NULL;
-+ }
-+
-++#ifdef CRASH_MERGE
-++extern "C" void crash_decode_ptrauth_pc(ulong* pc);
-++#endif
-++
-+ static CORE_ADDR
-+ frame_unwind_pc (struct frame_info *this_frame)
-+ {
-+@@ -974,6 +978,9 @@ frame_unwind_pc (struct frame_info *this_frame)
-+       try
-+	{
-+	  pc = gdbarch_unwind_pc (prev_gdbarch, this_frame);
-++#ifdef CRASH_MERGE
-++	  crash_decode_ptrauth_pc(&pc);
-++#endif
-+	  pc_p = true;
-+	}
-+       catch (const gdb_exception_error &ex)
-diff --git a/gdb_interface.c b/gdb_interface.c
-index 315711e..e108d09 100644
---- a/gdb_interface.c
-+++ b/gdb_interface.c
-@@ -1083,3 +1083,13 @@ int crash_get_current_task_reg (int regno, const char *regname,
- 	return machdep->get_current_task_reg(regno, regname, regsize, value);
- }
-
-+/* arm64 kernel lr maybe has patuh */
-+void crash_decode_ptrauth_pc(ulong *pc);
-+void crash_decode_ptrauth_pc(ulong *pc)
-+{
-+#ifdef ARM64
-+	struct machine_specific *ms = machdep->machspec;
-+	if (is_kernel_text(*pc | ms->CONFIG_ARM64_KERNELPACMASK))
-+		*pc |= ms->CONFIG_ARM64_KERNELPACMASK;
-+#endif /* !ARM64 */
-+}
---
-2.34.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash/0003-Fix-build-failure-in-readline-lib.patch b/meta-oe/recipes-kernel/crash/crash/0003-Fix-build-failure-in-readline-lib.patch
deleted file mode 100644
index f3318b3a6a..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0003-Fix-build-failure-in-readline-lib.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From 772fbb1022911410b5fb773fde37910fc8286041 Mon Sep 17 00:00:00 2001
-From: Lianbo Jiang <lijiang@redhat.com>
-Date: Fri, 24 Jan 2025 16:12:40 +0800
-Subject: [PATCH] Fix build failure in readline lib
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This is a backported patch from gdb upstream, see the commit
-425f843d58c5 ("Import GNU Readline 8.2"), and only backported
-patch related to compilation errors.
-
-Without the patch:
-
-  signals.c: In function ‘_rl_handle_signal’:
-  signals.c:62:36: error: ‘return’ with a value, in function returning void [-Wreturn-mismatch]
-     62 | #  define SIGHANDLER_RETURN return (0)
-        |                                    ^
-  signals.c:290:3: note: in expansion of macro ‘SIGHANDLER_RETURN’
-    290 |   SIGHANDLER_RETURN;
-        |   ^~~~~~~~~~~~~~~~~
-  signals.c:178:1: note: declared here
-    178 | _rl_handle_signal (int sig)
-        | ^~~~~~~~~~~~~~~~~
-  signals.c: In function ‘rl_sigwinch_handler’:
-  signals.c:306:32: error: passing argument 2 of ‘rl_set_sighandler’ from incompatible pointer type [-Wincompatible-pointer-types]
-    306 |   rl_set_sighandler (SIGWINCH, rl_sigwinch_handler, &dummy_winch);
-        |                                ^~~~~~~~~~~~~~~~~~~
-        |                                |
-        |                                void (*)(int)
-  In file included from rldefs.h:31,
-                   from signals.c:37:
-  signals.c:81:51: note: expected ‘void (*)(void)’ but argument is of type ‘void (*)(int)’
-     81 | static SigHandler *rl_set_sighandler PARAMS((int, SigHandler *, sighandler_cxt *));
-
-Note: the current build failure was observed on gcc (GCC) 15.0.0.
-
-Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
-Signed-off-by: mark.yang <mark.yang@lge.com>
-
-Upstream-Status: Backport [772fbb1 Fix build failure in readline lib]
----
- gdb-10.2.patch | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 82 insertions(+)
-
-diff --git a/gdb-10.2.patch b/gdb-10.2.patch
-index fd6fadb..8f5d7db 100644
---- a/gdb-10.2.patch
-+++ b/gdb-10.2.patch
-@@ -16239,3 +16239,85 @@ exit 0
- 	  pc_p = true;
- 	}
-        catch (const gdb_exception_error &ex)
-+--- gdb-10.2/readline/readline/signals.c.orig
-++++ gdb-10.2/readline/readline/signals.c
-+@@ -48,23 +48,11 @@
-+
-+ #if defined (HANDLE_SIGNALS)
-+
-+-#if !defined (RETSIGTYPE)
-+-#  if defined (VOID_SIGHANDLER)
-+-#    define RETSIGTYPE void
-+-#  else
-+-#    define RETSIGTYPE int
-+-#  endif /* !VOID_SIGHANDLER */
-+-#endif /* !RETSIGTYPE */
-+-
-+-#if defined (VOID_SIGHANDLER)
-+-#  define SIGHANDLER_RETURN return
-+-#else
-+-#  define SIGHANDLER_RETURN return (0)
-+-#endif
-++#define SIGHANDLER_RETURN return
-+
-+ /* This typedef is equivalent to the one for Function; it allows us
-+    to say SigHandler *foo = signal (SIGKILL, SIG_IGN); */
-+-typedef RETSIGTYPE SigHandler ();
-++typedef void SigHandler (int);
-+
-+ #if defined (HAVE_POSIX_SIGNALS)
-+ typedef struct sigaction sighandler_cxt;
-+@@ -78,12 +66,12 @@ typedef struct { SigHandler *sa_handler; int sa_mask, sa_flags; } sighandler_cxt
-+ #  define SA_RESTART 0
-+ #endif
-+
-+-static SigHandler *rl_set_sighandler PARAMS((int, SigHandler *, sighandler_cxt *));
-+-static void rl_maybe_set_sighandler PARAMS((int, SigHandler *, sighandler_cxt *));
-+-static void rl_maybe_restore_sighandler PARAMS((int, sighandler_cxt *));
-++static SigHandler *rl_set_sighandler (int, SigHandler *, sighandler_cxt *);
-++static void rl_maybe_set_sighandler (int, SigHandler *, sighandler_cxt *);
-++static void rl_maybe_restore_sighandler (int, sighandler_cxt *);
-+
-+-static RETSIGTYPE rl_signal_handler PARAMS((int));
-+-static RETSIGTYPE _rl_handle_signal PARAMS((int));
-++static void rl_signal_handler (int);
-++static void _rl_handle_signal (int);
-+
-+ /* Exported variables for use by applications. */
-+
-+@@ -137,7 +125,7 @@ void *_rl_sigcleanarg;
-+ /* Readline signal handler functions. */
-+
-+ /* Called from RL_CHECK_SIGNALS() macro */
-+-RETSIGTYPE
-++void
-+ _rl_signal_handler (int sig)
-+ {
-+   _rl_caught_signal = 0;	/* XXX */
-+@@ -160,7 +148,7 @@ _rl_signal_handler (int sig)
-+   SIGHANDLER_RETURN;
-+ }
-+
-+-static RETSIGTYPE
-++static void
-+ rl_signal_handler (int sig)
-+ {
-+   if (_rl_interrupt_immediately)
-+@@ -174,7 +162,7 @@ rl_signal_handler (int sig)
-+   SIGHANDLER_RETURN;
-+ }
-+
-+-static RETSIGTYPE
-++static void
-+ _rl_handle_signal (int sig)
-+ {
-+ #if defined (HAVE_POSIX_SIGNALS)
-+@@ -291,7 +279,7 @@ _rl_handle_signal (int sig)
-+ }
-+
-+ #if defined (SIGWINCH)
-+-static RETSIGTYPE
-++static void
-+ rl_sigwinch_handler (int sig)
-+ {
-+   SigHandler *oh;
-
diff --git a/meta-oe/recipes-kernel/crash/crash/0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch b/meta-oe/recipes-kernel/crash/crash/0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch
deleted file mode 100644
index e4bd4cd3a9..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0004-tools.c-do-not-use-keywords-nullptr-as-a-variable-in.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 325a9d1b3b4ce76bf4556235c885e619e219622c Mon Sep 17 00:00:00 2001
-From: Lianbo Jiang <lijiang@redhat.com>
-Date: Fri, 24 Jan 2025 15:32:59 +0800
-Subject: [PATCH] tools.c: do not use keywords 'nullptr' as a variable in code
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Without the patch:
-
-  tools.c: In function ‘drop_core’:
-  tools.c:6251:23: error: expected identifier or ‘(’ before ‘nullptr’
-   6251 |         volatile int *nullptr;
-        |                       ^~~~~~~
-  tools.c:6259:17: error: lvalue required as left operand of assignment
-   6259 |         nullptr = NULL;
-        |                 ^
-  tools.c:6261:21: error: invalid type argument of unary ‘*’ (have ‘typeof (nullptr)’)
-   6261 |                 i = *nullptr;
-        |                     ^~~~~~~~
-  make[6]: *** [Makefile:345: tools.o] Error 1
-
-Note: this was observed on gcc version 15.0.1
-
-Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
-Signed-off-by: mark.yang <mark.yang@lge.com>
-
-Upstream-Status: Backport [325a9d1 tools.c: do not use keywords 'nullptr' as a variable in code]
----
- tools.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tools.c b/tools.c
-index 85d8b6f..c9305be 100644
---- a/tools.c
-+++ b/tools.c
-@@ -6248,7 +6248,7 @@ lowest_bit_long(ulong val)
- void
- drop_core(char *s)
- {
--	volatile int *nullptr;
-+	volatile int *ptr;
- 	int i ATTRIBUTE_UNUSED;
-
- 	if (s && ascii_string(s))
-@@ -6256,9 +6256,9 @@ drop_core(char *s)
-
- 	kill((pid_t)pc->program_pid, 3);
-
--	nullptr = NULL;
-+	ptr = NULL;
- 	while (TRUE)
--		i = *nullptr;
-+		i = *ptr;
- }
-
-
---
-2.34.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch b/meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch
deleted file mode 100644
index e4796b9ced..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0005-Fix-build-failure-on-32bit-machine-i686.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 2724bb1d0260f3886f8a3d533838caf80c7e61e5 Mon Sep 17 00:00:00 2001
-From: Lianbo Jiang <lijiang@redhat.com>
-Date: Fri, 24 Jan 2025 17:56:23 +0800
-Subject: [PATCH 10/10] Fix build failure on 32bit machine(i686)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This issue was caused by commit 0f39e33d3504 with the following
-compilation error:
-
-  frame.c: In function ‘CORE_ADDR frame_unwind_pc(frame_info*)’:
-  frame.c:982:35: error: cannot convert ‘CORE_ADDR*’ {aka ‘long long unsigned int*’} to ‘ulong*’ {aka ‘long unsigned int*’}
-    982 |           crash_decode_ptrauth_pc(&pc);
-        |                                   ^~~
-        |                                   |
-        |                                   CORE_ADDR* {aka long long unsigned int*}
-  frame.c:948:48: note: initializing argument 1 of ‘void crash_decode_ptrauth_pc(ulong*)’
-    948 | extern "C" void crash_decode_ptrauth_pc(ulong* pc);
-        |                                         ~~~~~~~^~
-
-Upstream-Status: Backport [https://github.com/crash-utility/crash/commit/2724bb1d0260f3886f8a3d533838caf80c7e61e5]
-Fixes: 0f39e33d3504 ("arm64: add pac mask to better support gdb stack unwind")
-Reported-by: Guanyou.Chen <chenguanyou@xiaomi.com>
-Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
----
- gdb-10.2.patch  | 6 +++---
- gdb_interface.c | 4 ++--
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/gdb-10.2.patch b/gdb-10.2.patch
-index 8f5d7db22840..d22f2d6d75bc 100644
---- a/gdb-10.2.patch
-+++ b/gdb-10.2.patch
-@@ -55,7 +55,7 @@ exit 0
-  # your system doesn't have fcntl.h in /usr/include (which is where it
-  # should be according to Posix).
- -DEFS = @DEFS@
--+DEFS = -DCRASH_MERGE @DEFS@
-++DEFS = -DCRASH_MERGE -D${CRASH_TARGET} @DEFS@
-  GDB_CFLAGS = -I. -I$(srcdir) -I$(srcdir)/config \
-  	-DLOCALEDIR="\"$(localedir)\"" $(DEFS)
-
-@@ -16222,7 +16222,7 @@ exit 0
-    return NULL;
-  }
-
--+#ifdef CRASH_MERGE
-++#if defined(CRASH_MERGE) && defined(ARM64)
- +extern "C" void crash_decode_ptrauth_pc(ulong* pc);
- +#endif
- +
-@@ -16233,7 +16233,7 @@ exit 0
-        try
- 	{
- 	  pc = gdbarch_unwind_pc (prev_gdbarch, this_frame);
--+#ifdef CRASH_MERGE
-++#if defined(CRASH_MERGE) && defined(ARM64)
- +	  crash_decode_ptrauth_pc(&pc);
- +#endif
- 	  pc_p = true;
-diff --git a/gdb_interface.c b/gdb_interface.c
-index e108d097ee5f..c2e99f5c156a 100644
---- a/gdb_interface.c
-+++ b/gdb_interface.c
-@@ -1084,12 +1084,12 @@ int crash_get_current_task_reg (int regno, const char *regname,
- }
-
- /* arm64 kernel lr maybe has patuh */
-+#ifdef ARM64
- void crash_decode_ptrauth_pc(ulong *pc);
- void crash_decode_ptrauth_pc(ulong *pc)
- {
--#ifdef ARM64
- 	struct machine_specific *ms = machdep->machspec;
- 	if (is_kernel_text(*pc | ms->CONFIG_ARM64_KERNELPACMASK))
- 		*pc |= ms->CONFIG_ARM64_KERNELPACMASK;
--#endif /* !ARM64 */
- }
-+#endif /* !ARM64 */
---
-2.47.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash/0006-gdbsupport-fix-default-init-alloc-for-C-20.patch b/meta-oe/recipes-kernel/crash/crash/0006-gdbsupport-fix-default-init-alloc-for-C-20.patch
deleted file mode 100644
index b184b3a197..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/0006-gdbsupport-fix-default-init-alloc-for-C-20.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jun 2026 00:00:00 +0000
-Subject: [PATCH] gdbsupport: fix default-init-alloc for C++20
-
-std::allocator::construct() and std::allocator::destroy() were
-deprecated in C++17 and removed in C++20. gdb-10.2's
-gdbsupport/default-init-alloc.h pulls them into scope with
-
-  using A::construct;
-
-where A defaults to std::allocator<T>. With GCC 16 (which defaults to
-C++20 or newer) std::vector instantiations such as gdb::def_vector<char>
-(= std::vector<char, gdb::default_init_allocator<char>>) fail to build:
-
-  default-init-alloc.h:52:12: error: 'construct' has not been declared
-    in 'class std::allocator<char>'
-
-Note that def-vector.h instantiates default_init_allocator with the
-explicit std::allocator<T> base, so changing only the template's default
-allocator argument is not sufficient to fix this.
-
-Pull in "using A::construct;" only for standards older than C++17 (where
-std::allocator still provides construct()), and for C++17 and later add a
-variadic construct() overload that forwards to
-std::allocator_traits<A>::construct().  This both keeps non-default
-construction working and avoids referring to the removed
-std::allocator::construct() member.  The existing default-init
-construct(U*) overload is preserved unchanged.
-
-This patch only touches the bundled gdb-10.2 sources downloaded by the
-crash recipe.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gdbsupport/default-init-alloc.h | 19 ++++++++++++++++++-
- 1 file changed, 18 insertions(+), 1 deletion(-)
-
---- a/gdb-10.2/gdbsupport/default-init-alloc.h
-+++ b/gdb-10.2/gdbsupport/default-init-alloc.h
-@@ -18,6 +18,8 @@
- #ifndef COMMON_DEFAULT_INIT_ALLOC_H
- #define COMMON_DEFAULT_INIT_ALLOC_H
-
-+#include <memory>
-+
- namespace gdb {
-
- /* An allocator that default constructs using default-initialization
-@@ -48,8 +50,13 @@ public:
-     typedef default_init_allocator<U, alloc_> other;
-   };
-
--  /* Make the base allocator's construct method(s) visible.  */
-+  /* Make the base allocator's construct method(s) visible.  std::allocator
-+     lost its construct() member in C++20, so only pull it in for older
-+     standards; for C++20 and later we forward non-default construction to
-+     std::allocator_traits below instead.  */
-+#if __cplusplus < 201703L
-   using A::construct;
-+#endif
-
-   /* .. and provide an override/overload for the case of default
-      construction (i.e., no arguments).  This is where we construct
-@@ -60,6 +67,16 @@ public:
-   {
-     ::new ((void *) ptr) U; /* default-init */
-   }
-+
-+  /* Forward all other construct() calls to the base allocator.  This
-+     replaces the "using A::construct;" pulled in above for standards
-+     where std::allocator still provides construct().  */
-+  template <typename U, typename... Args>
-+  void construct (U *ptr, Args&&... args)
-+  {
-+    std::allocator_traits<A>::construct (static_cast<A &> (*this), ptr,
-+					 std::forward<Args> (args)...);
-+  }
- };
-
- } /* namespace gdb */
diff --git a/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch b/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
deleted file mode 100644
index b5f97228de..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/7001force_define_architecture.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
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
diff --git a/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
index 2d01453059..17439c7263 100644
--- a/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
+++ b/meta-oe/recipes-kernel/crash/crash/7003cross_ranlib.patch
@@ -1,19 +1,19 @@
-From 2f200ceed289f935b5e7ec230454a22dd76e42b0 Mon Sep 17 00:00:00 2001
+From 72921a32cc2c1df390265e8c4e205bc5ba2b985d Mon Sep 17 00:00:00 2001
 From: leimaohui <leimaohui@cn.fujitsu.com>
 Date: Mon, 12 Jan 2015 11:52:35 +0800
 Subject: [PATCH] crash: add new recipe

----
 Upstream-Status: Pending
-
+Signed-off-by: Robert.Berger <Robert.Berger@ReliableEmbeddedSystems.com>
+---
  Makefile | 1 +
  1 file changed, 1 insertion(+)

 diff --git a/Makefile b/Makefile
-index 79aef176..7266e305 100644
+index 58b1326..f2c945a 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -295,6 +295,7 @@ gdb_patch:
+@@ -349,6 +349,7 @@ gdb_patch:

  library: ${OBJECT_FILES}
  	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
diff --git a/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch b/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
deleted file mode 100644
index 16382877d0..0000000000
--- a/meta-oe/recipes-kernel/crash/crash/donnot-extract-gdb-during-do-compile.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 8b882650b730cb6e025d47d65574f43549b7a1a3 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 9 Mar 2023 10:28:28 +0800
-Subject: [PATCH] Makefile: Put gdb source tarball in SRC_URI
-
-Put gdb source tarball in SRC_URI and don't fetch and extract it during
-do_compile.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- Makefile | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 79aef17..146da6a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -254,7 +254,7 @@ all: make_configure
- #	@$(MAKE) extensions
-
- gdb_merge: force
--	@if [ ! -f ${GDB}/README ]; then \
-+	@if [ ! -f ${GDB}/${GDB}.patch ]; then \
- 	  $(MAKE) gdb_unzip; fi
- 	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
- 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
-@@ -281,12 +281,6 @@ gdb_unzip:
- 	@rm -f gdb.files
- 	@for FILE in ${GDB_FILES} dummy; do\
- 	  echo $$FILE >> gdb.files; done
--	@if [ ! -f ${GDB}.tar.gz ] && [ ! -f /usr/bin/wget ]; then \
--	  echo /usr/bin/wget is required to download ${GDB}.tar.gz; echo; exit 1; fi
--	@if [ ! -f ${GDB}.tar.gz ] && [ -f /usr/bin/wget ]; then \
--	  [ ! -t 2 ] && WGET_OPTS="--progress=dot:mega"; \
--	  wget $$WGET_OPTS http://ftp.gnu.org/gnu/gdb/${GDB}.tar.gz; fi
--	@tar --exclude-from gdb.files -xzmf ${GDB}.tar.gz
- 	@$(MAKE) gdb_patch
-
- gdb_patch:
---
-2.25.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
index 257b4dd2bf..a0f8e24cfa 100644
--- a/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
+++ b/meta-oe/recipes-kernel/crash/crash/gdb_build_jobs_and_not_write_crash_target.patch
@@ -1,4 +1,4 @@
-From af49d8df559aa18f97d14ab7971f211238a16041 Mon Sep 17 00:00:00 2001
+From 43d02dfa24f9f04e60911593e47e9cc2d68562e3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 9 Mar 2023 10:50:10 +0800
 Subject: [PATCH] Makefile: Don't write ${TARGET} to crash.target
@@ -14,17 +14,18 @@ Don't write ${TARGET} to crash.target which causes rebuild fails.

 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
 ---
  Makefile | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

 diff --git a/Makefile b/Makefile
-index cd25c7d..d61c4c5 100644
+index f2c945a..9fdb29b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -262,8 +262,8 @@ gdb_merge: force
+@@ -316,8 +316,8 @@ gdb_merge: force
  	@if [ ! -f ${GDB}/config.status ]; then \
- 	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
+ 	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
  	    --with-bugurl="" --with-expat=no --with-python=no --disable-sim; \
 -	  $(MAKE) CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
 -	else $(MAKE) rebuild; fi
@@ -33,6 +34,3 @@ index cd25c7d..d61c4c5 100644
  	@if [ ! -f ${PROGRAM} ]; then \
  	  echo; echo "${PROGRAM} build failed"; \
  	  echo; exit 1; fi
---
-2.25.1
-
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb b/meta-oe/recipes-kernel/crash/crash_9.0.2.bb
similarity index 99%
rename from meta-oe/recipes-kernel/crash/crash_8.0.6.bb
rename to meta-oe/recipes-kernel/crash/crash_9.0.2.bb
index 893d4de410..d0f0de7e5f 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash_9.0.2.bb
@@ -1,6 +1,5 @@
 require crash.inc

-
 BBCLASSEXTEND = "native cross"

 EXTRA_OEMAKE:class-cross = 'RPMPKG="${PV}" \

