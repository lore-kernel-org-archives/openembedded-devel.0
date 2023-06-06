Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA18C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:02:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.6067.1686049316832042249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qyM8t23K;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30e5289105cso192854f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 04:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686049315; x=1688641315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okjpth2IuVrauLmYUXGMUWpQbkMgEgIJIyssGYhjRv4=;
        b=qyM8t23Krt3wWbxw/O2RFCB+F/twuCnS5Grr5R/xBP2JnzWbEJfvLd4gg5WUslTdf3
         e0oOwiz8B1j9KqPDBDgg5RXvYeSkrZp+1HgA6sdFppTNSEKsLjuU86Sv7LvLynAPimx+
         I1BBxmzxpVPuWjPPZXYxC1gF+KiSFITSn++sKCVqPXeeV73KfXNxGWMFEkVzLN8lbv3I
         HZvKhS556+uaK8O1X4ZDJ95j02az6q1665AONTeMXQnnJB9WWX2Y7t+sAkJXqWsbBOmT
         tdTBHLZ6XWs/VhbqvBj+TVfUDbJ4T7YtXRLsEttqk8oiW4Xa8v6a97EvSCXDe7/6XmEZ
         gaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686049315; x=1688641315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okjpth2IuVrauLmYUXGMUWpQbkMgEgIJIyssGYhjRv4=;
        b=M3XF3S0dOKhfWbcAt8MDTOk+8asjbEaCaxzP0M+dXRjIVZk3OrMjZ2cx8PfgbKjyet
         VFCbv9O8H7eNjr6+Y3MO5k25xZ5HQhBJ0mbTNxFMkWSumxaHFcfRVTby40vvXEXGhZTc
         rOHp/D5HUntMkRD0GwddHnVFu6p7XSq2WpqTuvjXWxmwJiJzfikBreT4mYrXjHBdIr/n
         7miYqXBhXBJYm+xm43A9UUTvjuB4q5ixO5ovISoighMM+gcJUhpzmbM46rdZsW/FnPz3
         v01nQQaMq+22r1uSgN+4GCeVnBmgP45LfPEPUwAyBApNEuniixJ1Hu+1dp94mKfc1c9z
         XDew==
X-Gm-Message-State: AC+VfDypc/Li5H9D4hVq5x1KW4Vxo81mn8kya9LtBnb8cPyf+jp7CMbo
	IUEbK6yg8Y9OI/V1giZNWUb03+x64fyn1Q==
X-Google-Smtp-Source: ACHHUZ5gzOJ2MC6mpErPpMCxKPSpukDPHZWVRcjANRqIul8j6KgzLh5LDiuG/BvVL7Q4/OONCWS1Uw==
X-Received: by 2002:a5d:5490:0:b0:30e:3dc2:6f2f with SMTP id h16-20020a5d5490000000b0030e3dc26f2fmr5571932wrv.12.1686049314676;
        Tue, 06 Jun 2023 04:01:54 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id n24-20020a7bc5d8000000b003f17848673fsm13726105wmk.27.2023.06.06.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:01:54 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH] mpich: Upgrade to 4.1.1
Date: Tue,  6 Jun 2023 13:01:47 +0200
Message-Id: <20230606110147.1797218-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 11:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103138

mpich 4.1+ has its own official way to allow cross-compiling,
use it.

Remove the old PACKAGECONFIG[x11], the configuration option
does not exist anymore.

Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
enable either by default to keep the current minimalistic build.

Remove configuration options that don't exist in the new version.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 ------------------
 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
 create mode 100644 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb b/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
deleted file mode 100644
index 000f73981..000000000
--- a/meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb
+++ /dev/null
@@ -1,58 +0,0 @@
-SUMMARY = "Message Passing Interface (MPI) implementation"
-HOMEPAGE = "http://www.mpich.org/"
-SECTION = "devel"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
-
-SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "17406ea90a6ed4ecd5be39c9ddcbfac9343e6ab4f77ac4e8c5ebe4a3e3b6c501"
-
-RDEPENDS:${PN} += "bash perl libxml2"
-
-EXTRA_OECONF = "--enable-debuginfo \
-    --enable-fast \
-    --enable-shared  \
-    --with-pm=gforker  \
-    --disable-rpath \
-    --disable-f77 \
-    --disable-fc \
-    --disable-fortran \
-    --disable-cxx \
-    BASH_SHELL='${USRBINPATH}/env bash' \
-    PERL='${USRBINPATH}/env perl' \
-    --with-device=ch3:nemesis \
-    --with-rdmacm=no \
-    --disable-numa \
-"
-
-PACKAGECONFIG += " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
-"
-PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
-
-# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
-LDFLAGS:append:x86-64 = " -lgcc"
-LDFLAGS:append:x86 = " -lgcc"
-
-inherit autotools gettext pkgconfig
-
-do_configure() {
-    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
-        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb \
-        modules/yaksa/m4 modules/json-c modules/ucx modules/hwloc/config \
-        test/mpi/dtpools/confdb src/mpl/confdb src/mpi/romio/confdb;  do
-        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
-        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
-    done
-#    cd ${S}
-#    autoupdate
-#    autoreconf --verbose --install --force
-#    cd ${B}
-    oe_runconf
-}
-
-do_install:append() {
-    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
-    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
-}
diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
new file mode 100644
index 000000000..990400f5c
--- /dev/null
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
@@ -0,0 +1,61 @@
+SUMMARY = "Message Passing Interface (MPI) implementation"
+HOMEPAGE = "http://www.mpich.org/"
+SECTION = "devel"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f1804c45b8b4e816e53eb1f175d810f3"
+
+SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
+SRC_URI[sha256sum] = "ee30471b35ef87f4c88f871a5e2ad3811cd9c4df32fd4f138443072ff4284ca2"
+
+RDEPENDS:${PN} += "bash perl libxml2"
+
+EXTRA_OECONF = "--enable-debuginfo \
+    --enable-fast \
+    --enable-shared  \
+    --with-pm=gforker  \
+    BASH_SHELL='${USRBINPATH}/env bash' \
+    PERL='${USRBINPATH}/env perl' \
+    --with-device=ch3:nemesis \
+    --with-cross=${WORKDIR}/cross_values.txt \
+"
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx"
+PACKAGECONFIG[fortran] = "--enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfortran"
+
+# libmpi.so needs symbols like __multf3 and somehow it does not respect --rtlib option passed by clang
+LDFLAGS:append:x86-64 = " -lgcc"
+LDFLAGS:append:x86 = " -lgcc"
+
+inherit autotools gettext pkgconfig qemu
+
+DEPENDS += "qemu-native"
+
+do_configure() {
+    qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+    cat > ${WORKDIR}/qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+    chmod +x ${WORKDIR}/qemuwrapper
+
+    sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKDIR}/t`;:' ${S}/maint/gen_cross.pl
+
+    cd ${WORKDIR}
+    perl ${S}/maint/gen_cross.pl
+
+    sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=.*\) }"$:\1 }, ":' ${WORKDIR}/cross_values.txt
+
+    cd ${S}
+    ./autogen.sh
+
+    cd ${B}
+    oe_runconf
+}
+
+do_install:append() {
+    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
+    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
+}
-- 
2.40.1


