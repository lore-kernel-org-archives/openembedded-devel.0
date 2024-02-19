Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF19C54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 19:23:37 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2984.1708370614539261572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 11:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHR8rZVL;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dbf1fe91fcso10822665ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 11:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708370613; x=1708975413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YIgh1CU0t+DYV361jT0ZnIXa+tbjNA1wQKwt8nRgC44=;
        b=eHR8rZVLkz87JDoxq35LG+S0osy+mxt+tq7a0zbH6Iz88uHWf0bxdE/HBn84NGldHH
         a8uLLsa7VRojkJUTQyDgXmuH07ST0OOhrib3ymbdR+QWwygRcdNgKp1mztTCiXCvLa1o
         GxLUleYDggmz5jTjOp13fVvxDZ8u/r1bEaMlFW5GgWPXqJ+2OSMoLHQu95mHsvINY9G8
         rVv02jRwfykEET+4wUsiXU9URE6ndVfGzDbJ0bBov6RxkvsCI/tC6qcUXSHoTMbkEn/X
         NiLh3bhjP2yDdQ6LKumFmeCCrTUo54Xm3xBl/2zd23c0SuWjr2S2mNWiRYxx/1PnBbi9
         d9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708370613; x=1708975413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIgh1CU0t+DYV361jT0ZnIXa+tbjNA1wQKwt8nRgC44=;
        b=H0n1tyVYJut/tncoXcry44cw1hZXXkkjD+qgdtpqE9+UYDEOo9yV/TXa6npdQ7NXEH
         u2BthfgSaCSWiX/zyph/N2UtdCXpk47pErcMFDsad//bVzU/Ln3kd7Q2u0Fte4Smmwv1
         YHvBJf4/E6m0DO/QrZSoqvCznpSIHRM0FA7pZ0Kmb0Wu3BCmIjV8CSmJjnqVybnQ8Cd7
         KaBUaIwM6G9Ig8QUVG07cc0kk9tRnW8gD9QeDpTgibkqY5aucUT4qSdBcIgIQhHWA4cq
         FejZe7sbIbTQwZbBB/1KaLkFD7W9g/A6fwQlD1nGfySBXqNV6/1UaX2ogHE7OddJHXPe
         Q0CA==
X-Gm-Message-State: AOJu0Yy1ngDL8dDD7D3ug98DjceqtAJzFm1J4JQ6oIdbHr22f8t1AA2k
	oNXc6fZcYA9JAZ0NNO35TPtIF2SzmjlPBSifk36sMATW+vAK5Un/tgQYmQdV
X-Google-Smtp-Source: AGHT+IESbKqj1njnDjlvw4sCsbhbUcUSlqFFnpAcMW/ks8aS8BGYrTkt5N563j/7b4//C+nYZ+i77g==
X-Received: by 2002:a17:902:d353:b0:1db:9a7d:2e6 with SMTP id l19-20020a170902d35300b001db9a7d02e6mr10803809plk.48.1708370613354;
        Mon, 19 Feb 2024 11:23:33 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id u10-20020a170903304a00b001d7222d8caasm4797723pla.50.2024.02.19.11.23.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 11:23:32 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/5] meta-oe: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 11:23:16 -0800
Message-Id: <647d0738c211fbe66b14ad8efc5529880c73bc38.1708370337.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708370337.git.tim.orling@konsulko.com>
References: <cover.1708370337.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 19:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108881

python2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-extended/isomd5sum/isomd5sum_1.2.4.bb    |  6 +++---
 .../libpwquality/libpwquality_1.4.5.bb               |  2 +-
 meta-oe/recipes-extended/mraa/mraa_git.bb            | 10 +++++-----
 meta-oe/recipes-extended/upm/upm_git.bb              | 10 +++++-----
 meta-oe/recipes-support/libiio/libiio_0.25.bb        | 12 ++++++------
 meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb       |  8 ++++----
 meta-oe/recipes-support/pcp/pcp_6.0.5.bb             |  2 +-
 7 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
index 0c981ebf59..5f2993dd4f 100644
--- a/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
+++ b/meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.4.bb
@@ -25,11 +25,11 @@ do_install () {
     oe_runmake install
 }
 
-PACKAGES += "${PYTHON_PN}-${BPN}"
+PACKAGES += "python3-${BPN}"
 
-RPROVIDES:${BPN}-dbg += "${PYTHON_PN}-${BPN}-dbg"
+RPROVIDES:${BPN}-dbg += "python3-${BPN}-dbg"
 
-FILES:${PYTHON_PN}-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
+FILES:python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/pyisomd5sum.so"
 
 SRCREV = "3f4c9bd3f21ec9ac75a025dfa3fa30fe3f621831"
 
diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
index 4454496f6c..f08fea7de3 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.5.bb
@@ -26,7 +26,7 @@ export BUILD_SYS
 export HOST_SYS
 
 EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
-                 --with-python-binary=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
+                 --with-python-binary=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
                  --with-pythonsitedir=${PYTHON_SITEPACKAGES_DIR} \
                  --libdir=${libdir} \
                  --with-securedir=${base_libdir}/security \
diff --git a/meta-oe/recipes-extended/mraa/mraa_git.bb b/meta-oe/recipes-extended/mraa/mraa_git.bb
index 37bd36432f..4d3baf6caa 100644
--- a/meta-oe/recipes-extended/mraa/mraa_git.bb
+++ b/meta-oe/recipes-extended/mraa/mraa_git.bb
@@ -48,20 +48,20 @@ BINDINGS:armv4 ??= "python"
 BINDINGS:armv5 ??= "python"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
- ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
+ ${@bb.utils.contains('PACKAGES', 'python3-${PN}', 'python', '', d)}"
 
-PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 PACKAGECONFIG[ft4222] = "-DUSBPLAT=ON -DFTDI4222=ON, -DUSBPLAT=OFF -DFTDI4222=OFF,, libft4222"
 
-FILES:${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}/"
-RDEPENDS:${PYTHON_PN}-${PN} += "${PYTHON_PN}"
+FILES:python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}/"
+RDEPENDS:python3-${PN} += "python3"
 
 FILES:node-${PN} = "${prefix}/lib/node_modules/"
 RDEPENDS:node-${PN} += "nodejs"
 
 ### Include desired language bindings ###
 PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'nodejs', 'node-${PN}', '', d)}"
-PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'python', '${PYTHON_PN}-${PN}', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'python', 'python3-${PN}', '', d)}"
 
 TOOLCHAIN = "gcc"
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 8468ff775d..3aa766d0bd 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -42,21 +42,21 @@ BINDINGS:armv4 ??= "python"
 BINDINGS:armv5 ??= "python"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
- ${@bb.utils.contains('PACKAGES', '${PYTHON_PN}-${PN}', 'python', '', d)}"
+ ${@bb.utils.contains('PACKAGES', 'python3-${PN}', 'python', '', d)}"
 
-PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}, -DBUILDSWIGPYTHON=OFF, swig-native ${PYTHON_PN},"
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 
 do_configure:prepend() {
     sed -i s:\"lib/${_packages_path}:\"${baselib}/${_packages_path}:g ${S}/cmake/modules/OpenCVDetectPython.cmake
 }
 
-FILES:${PYTHON_PN}-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
-RDEPENDS:${PYTHON_PN}-${PN} += "${PYTHON_PN}"
+FILES:python3-${PN} = "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:python3-${PN} += "python3"
 
 FILES:node-${PN} = "${prefix}/lib/node_modules/"
 RDEPENDS:node-${PN} += "nodejs"
 
 ### Include desired language bindings ###
 PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'nodejs', 'node-${PN}', '', d)}"
-PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'python', '${PYTHON_PN}-${PN}', '', d)}"
+PACKAGES =+ "${@bb.utils.contains('BINDINGS', 'python', 'python3-${PN}', '', d)}"
diff --git a/meta-oe/recipes-support/libiio/libiio_0.25.bb b/meta-oe/recipes-support/libiio/libiio_0.25.bb
index 3bdd445213..9f3fcc0087 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.25.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.25.bb
@@ -43,19 +43,19 @@ PACKAGECONFIG[xml_backend] = "-DWITH_XML_BACKEND=ON,${XML_BACKEND_DISABLE},libxm
 PACKAGECONFIG[dnssd] = "-DHAVE_DNS_SD=ON,-DHAVE_DNS_SD=off,avahi"
 PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
 
-PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
+PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python3"
 
-# Inheriting setuptools3 incorrectly adds the dependency on ${PYTHON_PN}-core
-# to ${PN} instead of to ${PN}-${PYTHON_PN} where it belongs.
-RDEPENDS:${PN}:remove = "${PYTHON_PN}-core"
-RDEPENDS:${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-core ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
+# Inheriting setuptools3 incorrectly adds the dependency on python3-core
+# to ${PN} instead of to ${PN}-python3 where it belongs.
+RDEPENDS:${PN}:remove = "python3-core"
+RDEPENDS:${PN}-python3 = "${PN} python3-core python3-ctypes python3-stringold"
 
 FILES:${PN}-iiod = " \
     ${sbindir}/iiod \
     ${systemd_system_unitdir}/iiod.service \
 "
 FILES:${PN}-tests = "${bindir}"
-FILES:${PN}-${PYTHON_PN} = "${PYTHON_SITEPACKAGES_DIR}"
+FILES:${PN}-python3 = "${PYTHON_SITEPACKAGES_DIR}"
 
 SYSTEMD_PACKAGES = "${PN}-iiod"
 SYSTEMD_SERVICE:${PN}-iiod = "iiod.service"
diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
index 42b9d7e048..5969220a41 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.8.2.bb
@@ -21,12 +21,12 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[disabledebug] = "--disable-debug,,"
 PACKAGECONFIG[allboardconfigs] = "--with-board-configs,,"
 PACKAGECONFIG[enableboardconfig] = "--enable-board=${BOARD},,"
-PACKAGECONFIG[python] = "--enable-python=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN},,${PYTHON_PN} ${PYTHON_PN}-native"
+PACKAGECONFIG[python] = "--enable-python=${STAGING_BINDIR_NATIVE}/python3-native/python3,,python3 python3-native"
 
 PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'python', \
-    '${PYTHON_PN}-libsoc-staticdev ${PYTHON_PN}-libsoc', '', d)}"
+    'python3-libsoc-staticdev python3-libsoc', '', d)}"
 
 RDEPENDS:${PN} = "libgcc"
 
-FILES:${PYTHON_PN}-libsoc-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*/*.a"
-FILES:${PYTHON_PN}-libsoc += "${PYTHON_SITEPACKAGES_DIR}"
+FILES:python3-libsoc-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*/*.a"
+FILES:python3-libsoc += "${PYTHON_SITEPACKAGES_DIR}"
diff --git a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
index b337df6ea4..6a93b2ec90 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.0.5.bb
@@ -69,7 +69,7 @@ do_compile:prepend() {
 		${S}/src/include/builddefs
 	sed -i -e "s,TOPDIR)/python3-pcp.list,TOPDIR)/python3-pcp.list --install-lib=${PYTHON_SITEPACKAGES_DIR},g" ${S}/src/python/GNUmakefile
 	export PYTHON=python3
-	#export PYTHON3=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
+	#export PYTHON3=${STAGING_BINDIR_NATIVE}/python3-native/python3
 }
 
 do_compile() {
-- 
2.34.1


