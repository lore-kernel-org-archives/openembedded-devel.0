Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D88BC77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 07:27:16 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.2952.1686122832637343726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jun 2023 00:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=FCypHMpi;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30af86a966eso5556568f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686122831; x=1688714831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3aquWdQo81Azxvmt60rrHEsw7KgvriNZtoaQtFqK3RQ=;
        b=FCypHMpiYEaqIsTYtNPN+qSMq3r3U+uL6OohVFau533J/yxoH+jiN1p4uLJ1+nZqjY
         sOOENQXX1cotCp+/Pe2mE1z2E8Qu85TRiPRKhJspNwzvaFWg+Ns5kyFionecLItNUkAr
         I7u825JvqMWhwLlHBkZCei/qQtooISiBqr/IABiU/J3vzuRsbk7z90pZvftdEJHj5AzE
         i7KTsfUoC2wu1zGodiwUdr2nmH9uGITwh9n1OWsub+Fe9S7SevZYQf22b4QgsiSJ5ZCB
         t4PnKfiaj8BsBcdZAHYW2rAmjxJKkUGeZDucUypw2WKkrXufN8ZXAuCm7aQzoOvfmmQb
         wj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686122831; x=1688714831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aquWdQo81Azxvmt60rrHEsw7KgvriNZtoaQtFqK3RQ=;
        b=VetzEGB30Xlg/+m/33joK8eQ5y2SIyAIAt71LsNTY+TcREbQCYhfQNL9jkl69brx4d
         WR5j4ej0oN6sVM7mMs17LFoWckgelehQJkisxSBB/5iR+rcxOXqQjcIBpyW1Ug1t2J0J
         VAxZk8sW22X3l9Q/8eRqVw/C0XtXEW+4LNEHEpsDLfS5RWeGM6uEVa2DvHzu7wkQ6QBQ
         WbC6Za4KnZsf86f1CQGa2FmgJGP2oYhWrZbyEDpYuML2smn+vlgLLKYIHmybqHMtw7ql
         HMkgTqgcg3a5T3/BKDmTXp3ZonaKV4+fbgJGR52crLqnnuTYVR0aSCpZmkOspYnVhJ9i
         6qGQ==
X-Gm-Message-State: AC+VfDxenCLVRMYKpsAxlQ02UlvqmTS6879lkvIXNPeolU0kFUPPB63g
	Hy3FehhNJTtH+8QzvYtJel20Xgyac/I=
X-Google-Smtp-Source: ACHHUZ75CftdAxO5M27HDFxCH9+lqOZKWZT6RZNMrWlEYOpXDx2LdRdRdvUCWPvxEn1CponT3wgI5g==
X-Received: by 2002:a5d:4c52:0:b0:306:475d:92ff with SMTP id n18-20020a5d4c52000000b00306475d92ffmr3673512wrt.3.1686122830561;
        Wed, 07 Jun 2023 00:27:10 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b003f1978bbcd6sm6026836wmo.3.2023.06.07.00.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 00:27:10 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH v4] mpich: Upgrade to 4.1.1
Date: Wed,  7 Jun 2023 09:27:07 +0200
Message-Id: <20230607072707.660291-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jun 2023 07:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103166

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
index 000000000..35cd2e4ba
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
+
+        sed -i 's:\(CROSS_F90_INTEGER_MODEL_MAP=.*\) }"$:\1 }, ":' ${WORKDIR}/cross_values.txt
+    fi
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


