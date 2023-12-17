Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FA6C46CD3
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 07:39:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.15172.1702798789477637302
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 23:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L3NyznOG;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3332efd75c9so1669990f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 23:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702798787; x=1703403587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqOgOryH/8h4GNNiTh/JkF7NlSpueZPAvQvYUwehqMQ=;
        b=L3NyznOGv0CEeOJ0e7w3wxIVyMmjk4FhSaRxfhqAjv7c3IBWDXEmGfPrNJsHsP31F+
         M2TpWdVuM/eEywaVJEy6FBTuSjcly3PCd1HG6AiE+r7/iyO6FWGHFmH49VVEzdqIdfWb
         Z+N/kvo6e0zzTl8tx2QO5uFjej+cCdxg/dnj7x6fwXxPkbtz1fvLGEDJg4+kmfsQfdwG
         yje+mD8s3MMEDV48C3KK9dcTJCylFYc5CEH3MOqd6CsQAnzXA7deJ3tNLgewapnuvnCw
         fJB/hn72Ljyj1ytMnLx+rtOyWcq6d3cetZh0Wze1lJVbQauH/C1GEseNSFCtNmXGDrgM
         rChg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702798787; x=1703403587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqOgOryH/8h4GNNiTh/JkF7NlSpueZPAvQvYUwehqMQ=;
        b=fp/z57HeLofwa6iu6SNQee2JyYrpjMgUN2ah/OANsqYI2MWNKiGHpYAo/Mrus1ct5c
         mWnywpreMZjdp2GU3J+A5BoAFBGe0Q46+mJnpmEg8aCaIxOd1/xWCnOhYzbkb4VCksA4
         TYRyVIzjrqm8dgWrM1I8NDOKYSGLPc3cElzUpJzWSys8F+1WZsZ3U4QvkpIZxTb92Vu0
         Yt1f39mSogrXBTgPUmjnkX/TRkNHdbkPxAN4wWGOlt51HQjUfJzhlpzySsw0ntUl6PPi
         zpqCaeF6lwEDl2Qp3Yz/sA/OLfnIYfrWjO4X2tei8Ut/5v4M22SjsqS7NYMZmJkOuv+I
         DxHA==
X-Gm-Message-State: AOJu0YwUvxLakQ1+8d4oZbS7jI6Tcq3NQHZ1yR+Z37B6y/AZNDDx8AUJ
	paPbehpeEaO93x+fVoUB1ek9cx7U4RQNrw==
X-Google-Smtp-Source: AGHT+IFt4UwbgPgTqXQY0TI2dDHnDIAtDZ7YJcXieVB84hGdQJsy0NltzS9usK8S19rYHe3lEA1YOQ==
X-Received: by 2002:a7b:cd87:0:b0:40b:5e59:f724 with SMTP id y7-20020a7bcd87000000b0040b5e59f724mr3791157wmj.150.1702798787315;
        Sat, 16 Dec 2023 23:39:47 -0800 (PST)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:2e8:740a:5bbd:1d48])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b0040c4886f254sm26458428wmn.13.2023.12.16.23.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 23:39:47 -0800 (PST)
From: frederic.martinsons@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [meta-oe][PATCH 1/3] crash: factorize recipe with inc file to prepare cross-canadian version
Date: Sun, 17 Dec 2023 08:39:39 +0100
Message-Id: <2e8c22b4cf9b01e32f0b3e86772260bc40bbf334.1702798681.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702798681.git.frederic.martinsons@gmail.com>
References: <cover.1702798681.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 07:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107535

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Suppress unused config-site.crash-7.0.9

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash.inc        | 92 +++++++++++++++++++
 .../crash/crash/config-site.crash-7.0.9       |  1 -
 meta-oe/recipes-kernel/crash/crash_8.0.2.bb   | 89 +-----------------
 3 files changed, 94 insertions(+), 88 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/crash/crash.inc
 delete mode 100644 meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9

diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
new file mode 100644
index 000000000..8d700ed48
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -0,0 +1,92 @@
+SUMMARY = "Kernel analysis utility for live systems, netdump, diskdump, kdump, LKCD or mcore dumpfiles"
+DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to\
+investigate either live systems, kernel core dumps created from the\
+netdump, diskdump and kdump packages from Red Hat Linux, the mcore kernel patch\
+offered by Mission Critical Linux, or the LKCD kernel patch."
+
+HOMEPAGE = "http://people.redhat.com/anderson"
+SECTION = "devel"
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "zlib readline coreutils-native ncurses-native"
+
+INC_PR = "r1"
+
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=https \
+           ${GNU_MIRROR}/gdb/gdb-10.2.tar.gz;name=gdb;subdir=git \
+           file://7001force_define_architecture.patch \
+           file://7003cross_ranlib.patch \
+           file://0001-cross_add_configure_option.patch \
+           file://donnot-extract-gdb-during-do-compile.patch \
+           file://gdb_build_jobs_and_not_write_crash_target.patch \
+           file://0001-make-src-string-const-in-strlcpy.patch \
+           "
+SRCREV = "f1cd581d1c4afa5b8ffdfaa6a3ea9f545fe4ec91"
+
+SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
+
+UPSTREAM_CHECK_URI = "https://github.com/crash-utility/crash/releases"
+
+inherit gettext
+
+TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
+
+# crash 7.1.3 and before don't support mips64/riscv64
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:mipsarchn64 = "null"
+COMPATIBLE_HOST:mipsarchn32 = "null"
+
+
+EXTRA_OEMAKE = 'RPMPKG="${PV}" \
+                GDB_TARGET="${TARGET_SYS}" \
+                GDB_HOST="${BUILD_SYS}" \
+                GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
+                LDFLAGS="${LDFLAGS}" \
+                '
+
+do_configure() {
+    :
+}
+
+do_compile:prepend() {
+    case ${TARGET_ARCH} in
+        aarch64*)    ARCH=ARM64 ;;
+        arm*)        ARCH=ARM ;;
+        i*86*)       ARCH=X86 ;;
+        x86_64*)     ARCH=X86_64 ;;
+        powerpc64*)  ARCH=PPC64 ;;
+        powerpc*)    ARCH=PPC ;;
+        mips*)       ARCH=MIPS ;;
+    esac
+
+    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
+    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
+    sed -i -e 's/#define TARGET_CFLAGS_MIPS_ON_X86_64.*/#define TARGET_CFLAGS_MIPS_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
+    sed -i 's/&gt;/>/g' ${S}/Makefile
+}
+
+do_compile() {
+    oe_runmake ${EXTRA_OEMAKE} RECIPE_SYSROOT=${RECIPE_SYSROOT}
+}
+
+do_install:prepend () {
+    install -d ${D}${bindir}
+    install -d ${D}/${mandir}/man8
+    install -d ${D}${includedir}/crash
+
+    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
+    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
+}
+
+RDEPENDS:${PN} += "liblzma"
+
+# Causes gcc to get stuck and eat all available memory in qemuarm builds
+# jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
+ARM_INSTRUCTION_SET = "arm"
+
+# http://errors.yoctoproject.org/Errors/Details/186964/
+COMPATIBLE_HOST:libc-musl = 'null'
diff --git a/meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9 b/meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9
deleted file mode 100644
index d6fc22fb3..000000000
--- a/meta-oe/recipes-kernel/crash/crash/config-site.crash-7.0.9
+++ /dev/null
@@ -1 +0,0 @@
-bash_cv_have_mbstate_t=yes
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.2.bb b/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
index f8a460b8c..cc46ab9ea 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
@@ -1,51 +1,8 @@
-SUMMARY = "Kernel analysis utility for live systems, netdump, diskdump, kdump, LKCD or mcore dumpfiles"
-DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to\
-investigate either live systems, kernel core dumps created from the\
-netdump, diskdump and kdump packages from Red Hat Linux, the mcore kernel patch\
-offered by Mission Critical Linux, or the LKCD kernel patch."
+require crash.inc
 
-HOMEPAGE = "http://people.redhat.com/anderson"
-SECTION = "devel"
-
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "zlib readline coreutils-native ncurses-native"
-
-S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=https \
-           ${GNU_MIRROR}/gdb/gdb-10.2.tar.gz;name=gdb;subdir=git \
-           file://7001force_define_architecture.patch \
-           file://7003cross_ranlib.patch \
-           file://0001-cross_add_configure_option.patch \
-           file://donnot-extract-gdb-during-do-compile.patch \
-           file://gdb_build_jobs_and_not_write_crash_target.patch \
-           file://0001-make-src-string-const-in-strlcpy.patch \
-           "
-SRCREV = "f1cd581d1c4afa5b8ffdfaa6a3ea9f545fe4ec91"
-
-SRC_URI[gdb.sha256sum] = "b33ad58d687487a821ec8d878daab0f716be60d0936f2e3ac5cf08419ce70350"
-
-UPSTREAM_CHECK_URI = "https://github.com/crash-utility/crash/releases"
-
-inherit gettext
+PR = "${INC_PR}.0"
 
 BBCLASSEXTEND = "native cross"
-TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
-
-# crash 7.1.3 and before don't support mips64/riscv64
-COMPATIBLE_HOST:riscv64 = "null"
-COMPATIBLE_HOST:riscv32 = "null"
-COMPATIBLE_HOST:mipsarchn64 = "null"
-COMPATIBLE_HOST:mipsarchn32 = "null"
-
-
-EXTRA_OEMAKE = 'RPMPKG="${PV}" \
-                GDB_TARGET="${TARGET_SYS}" \
-                GDB_HOST="${BUILD_SYS}" \
-                GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
-                LDFLAGS="${LDFLAGS}" \
-                '
 
 EXTRA_OEMAKE:class-cross = 'RPMPKG="${PV}" \
                             GDB_TARGET="${BUILD_SYS} --target=${TARGET_SYS}" \
@@ -56,40 +13,6 @@ EXTRA_OEMAKE:class-cross = 'RPMPKG="${PV}" \
 EXTRA_OEMAKE:append:class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
 EXTRA_OEMAKE:append:class-cross = " LDFLAGS='${BUILD_LDFLAGS}'"
 
-do_configure() {
-    :
-}
-
-do_compile:prepend() {
-    case ${TARGET_ARCH} in
-        aarch64*)    ARCH=ARM64 ;;
-        arm*)        ARCH=ARM ;;
-        i*86*)       ARCH=X86 ;;
-        x86_64*)     ARCH=X86_64 ;;
-        powerpc64*)  ARCH=PPC64 ;;
-        powerpc*)    ARCH=PPC ;;
-        mips*)       ARCH=MIPS ;;
-    esac
-
-    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
-    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
-    sed -i -e 's/#define TARGET_CFLAGS_MIPS_ON_X86_64.*/#define TARGET_CFLAGS_MIPS_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
-    sed -i 's/&gt;/>/g' ${S}/Makefile
-}
-
-do_compile() {
-    oe_runmake ${EXTRA_OEMAKE} RECIPE_SYSROOT=${RECIPE_SYSROOT}
-}
-
-do_install:prepend () {
-    install -d ${D}${bindir}
-    install -d ${D}/${mandir}/man8
-    install -d ${D}${includedir}/crash
-
-    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
-    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
-}
-
 do_install:class-target () {
     oe_runmake DESTDIR=${D} install
 }
@@ -102,13 +25,5 @@ do_install:class-cross () {
     install -m 0755 ${S}/crash ${D}/${bindir}
 }
 
-RDEPENDS:${PN} += "liblzma"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}:class-cross = ""
-
-# Causes gcc to get stuck and eat all available memory in qemuarm builds
-# jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
-ARM_INSTRUCTION_SET = "arm"
-
-# http://errors.yoctoproject.org/Errors/Details/186964/
-COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.34.1


