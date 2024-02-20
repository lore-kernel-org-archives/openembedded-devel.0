Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ADBC5478B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:10:51 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.6202.1708402242271323467
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7ZwMSnH;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dba6b9b060so23762525ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708402241; x=1709007041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+tbLPmEKnZXwcJY4QzXXEvfI/Wg4oBUdXfu8RXyzkc=;
        b=e7ZwMSnH0BTCyNPlTQ1RbxQ0keqxFv7Ty3jZjbHMHsDgPt8Sic+rdblJEsy3dE9b6i
         Z7rbsS4+qpFxWSJa5uAh8ssTRElLFX2UlTjNO1TU60jfkgCKQNpsFZA2jK00y85zNDtp
         UQtZv3MTOTL8x8HU9DnQ7fPDSVyno/1uq3C6g3deVbGB69GIVn9FZqeanXdRNzfgEWcr
         fK+u6e/ASeMcuO24GNm8LakL94RLiKVYHTQjK/IitZhaSXSutjRMJQMfHAT4M6lQju7l
         517PWRNzvLs0gDK3H1q7VW6NG2omWXUlSMFCfI0MtsOY6Gxo7b5x1THzfTrTOTKfHzAs
         vFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708402241; x=1709007041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+tbLPmEKnZXwcJY4QzXXEvfI/Wg4oBUdXfu8RXyzkc=;
        b=M/0pnSzeLr6t4bj71fVa9/81zNrx1c8cdj+iei8FTefMfS9whUrZ2jvmWZEulRWqn5
         uOjlJbPGOuEfNZCGKRqziwTMDIXUUsJ/2Zy0yO2C1Lzk22Yrpi6EU29ON9GXit+F3c77
         h9tD5SpmGygTvvrxpmgWYJ3Bx1Xa911hzL0nIhTzMK+uKhXNBCzYyh/VbmBHEbP52p1V
         INI1nkt5QogHW6u0aiXbXQmcubdJZmGW5G/zU1dyfhGM3NgM8kZ4W0t7onKogNxJou4p
         0aoW8IjmnSnT936XHUU9Vz3Uw/njhYQ0PF5s9A098HMWFroIC1cD765jNtHJ0RHmxgKi
         PJeQ==
X-Gm-Message-State: AOJu0Yx2Z3stYwSjY1wcnNQZagtWNIG1G/8o7R7FGdmiPq2w7G6g74jf
	+aNsxhxKh7T9hJBF7PNhIDVjzoO2aKeN+0IPu2eWweLAbLsf2xTzXLIWyMAE
X-Google-Smtp-Source: AGHT+IEhhgRV5eYrQ8cA+aQLfHPmB22do7cA2fc7MKXV375rVKxfZvlhzRWR6rz91o8zEAjCFDs+3Q==
X-Received: by 2002:a17:902:7c8c:b0:1db:47bb:671b with SMTP id y12-20020a1709027c8c00b001db47bb671bmr18296021pll.19.1708402240853;
        Mon, 19 Feb 2024 20:10:40 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001db45ab819asm5229733plc.106.2024.02.19.20.10.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:10:40 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/5] meta-oe: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 20:10:25 -0800
Message-Id: <2170473603eac4124c4041bd3bb99f0c8fb4f54a.1708401702.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708401702.git.tim.orling@konsulko.com>
References: <cover.1708401702.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108903

python2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Rebase on top of master-next

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


