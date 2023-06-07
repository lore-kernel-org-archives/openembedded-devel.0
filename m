Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D161C7EE29
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:23:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2908.1686122606167987103
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AGkUpgNZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30af159b433so6889471f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 00:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686122604; x=1688714604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n5dYShkTVC8oSPPu1/oSzVTsv7sdddHk6689jlBGGFg=;
        b=AGkUpgNZpbQe4qb/Ly0qUbxaiDXJGGEiAGiDmm+pJ7wUa+pJCAHppb21Opme3NpZsp
         QRs5wwEyv8542QN8EfFUEvYpKZPbAeCZ18nevLAbUkQZxAE06u23SjdJEbIPYGsRk2LZ
         Q6+zW9JdxsrwzYCJev/jy7xRIBcLwoO4VyzYAVaIzPOejTirmnH8ypUzpEeabG0ViHh+
         PTFISUNSjvBz/1+Q38pf2yKFB3GM6evSOhQYMiTnCa9ntCQEZ4nD4n+PBfWEbD6ev5il
         5e8uftnTM4kZA6PgvhX+nrdSOXALIx6FgbR0XtGXwS87ZCJyzo4a2qNbyazC3mnP6NPd
         KhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122604; x=1688714604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5dYShkTVC8oSPPu1/oSzVTsv7sdddHk6689jlBGGFg=;
        b=lBVuqWAvtjq7eeM2TDDnp7zqwhsQQzBlPnmrLC43+vxna0oDRkPN1WTQlGgI8I+kWC
         6hDwltOAKvQC9FcjK8EjC53XQDlS9PvRDHJzqJu17IvjWL7wzrpHAy2rC7zmjrtlq1Zh
         Z0FhvotLDQe0kuTCioSxHJ6+7wxYxGq9KX3tBLmri2kMTsiS4nyRXbHm0xvf6jFATMyc
         gHN0qkQ67V7YORLy1iXtVyZ1KBopxT2mZljmzuSZ2ncj9jetNhdbiMjOA/ssH6bz7m1F
         NP6CALTCo/ta3mENM/+yyLXWO0lXMBWhm0h+yo8Ii7zCae2r80kGRGw+FBFV14aS+etq
         mvYQ==
X-Gm-Message-State: AC+VfDyN0P/AFbxrg2lPqlze6yfOcefRXu4n12E46sGWw2d2XnX0a+fX
	EPQyjI7GqjjwHA1ujAzT0GK5b1/lvUA=
X-Google-Smtp-Source: ACHHUZ5XZVi766d9pkPh4lA81U6/n6eZt4xiR5FmJs3EWbjOeO5pzszTER7FGcPTg2BtdLfQgXWeMA==
X-Received: by 2002:adf:fec3:0:b0:30e:3caa:9721 with SMTP id q3-20020adffec3000000b0030e3caa9721mr4100556wrs.31.1686122604072;
        Wed, 07 Jun 2023 00:23:24 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id y4-20020adfe6c4000000b00307bc4e39e5sm14542953wrm.117.2023.06.07.00.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:23:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH v3] mpich: Upgrade to 4.1.1
Date: Wed,  7 Jun 2023 09:23:21 +0200
Message-Id: <20230607072321.589315-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 07:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103165

mpich 4.1+ has its own official way to allow cross-compiling,
use it.

Remove the old PACKAGECONFIG[x11], the configuration option
does not exist anymore.

Add PACKAGECONFIG knobs to allow building the C++ and FORTRAN
parts. Both are needed by intel-oneapi-mkl in meta-intel. Don't
enable either by default to keep the current minimalistic build.

Remove configuration options that don't exist in the new version.

Set TOOLCHAIN = "gcc".

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_4.0.3.bb | 58 -----------------
 meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb | 64 +++++++++++++++++++
 2 files changed, 64 insertions(+), 58 deletions(-)
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
index 000000000..cb9c0f1dd
--- /dev/null
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.1.1.bb
@@ -0,0 +1,64 @@
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
+TOOLCHAIN = "gcc"
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
+"
+
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx"
+PACKAGECONFIG[fortran] = "--with-cross=${WORKDIR}/cross_values.txt --enable-fortran,--disable-f77 --disable-fc --disable-fortran,libgfortran"
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
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', d)}" = "1" ]; then
+        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        cat > ${WORKDIR}/qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+        chmod +x ${WORKDIR}/qemuwrapper
+
+        sed -i 's:my \(.*\) ./t`;:my \1 ${WORKDIR}/qemuwrapper ${WORKDIR}/t`;:' ${S}/maint/gen_cross.pl
+
+        cd ${WORKDIR}
+        perl ${S}/maint/gen_cross.pl
+    fi
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


