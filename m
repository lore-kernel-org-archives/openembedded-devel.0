Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2358C788BF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jan 2018 21:09:10 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id n9so2271136wrg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2018 13:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=i4cGG3KbZw39k/6PpFBzYZj6U6ryBoTOtYcJTvzlvJs=;
	b=vYlbRfk+mAjJkcV0SoHKDklhNsX8AsOEmCczS+T4p8Rsu4a6w9ZQO5dO3Gxmm6o057
	jVx3V0DW06bBd7uFCvOIbhGEd+LMfJCOcKgQzXB70n0bnF/9jDT/aPoTuqJA+wL0MUD1
	hBkR5dryZzidANP/G+TQKqxQe+8FAgYwacgrsD0ABCYB5PoZuElIyzCwP9JR4t8TPwRk
	Op8QmH9r/PxIQrmASAx5kNCMe6w8HOzEu3CqLxdhYJR7JVMVkF3bl6pT+wjiWh0Og/vc
	ZSwTLH7hsoIH1xX1lu+CPwL+PtSDxxu84sxa6muGbjV19/HdO2zJwUGg71ToX8pT+eoS
	EipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i4cGG3KbZw39k/6PpFBzYZj6U6ryBoTOtYcJTvzlvJs=;
	b=XYONfzVa3KNtMMYNIXzxuNhO3PXlfPhXBB7/8jnPUr0MGyFexhidZCM+Tte0Ko/mwX
	fhgN31CRRJSBLlSGUCXDhW68G8kGWqm0UY2K7bS8NdvWV8ycM4QCNgqTeRzZF9r5ENqL
	fNTNavYD6pkVeMPr/oBPaWvR256d5rDmLB5SY14sqtvAAwRwH8zJi3o3MNoBGizXy1m5
	EI+Fp5rzpSupqNE/2CixeMga5iTD0Z78z5XomzPSaE+1rtZu/ay7mQcayMZnius42cVh
	tKwMMGL6lt+1/81W5EsM+GIayTGIaNZNsZebcBRFZeWP6pfda2XG93mSpcWgGyoRVcXV
	gdKA==
X-Gm-Message-State: AKGB3mIB9uq6nvUdYsPxyC1BG1lHPPgLh9vZ5UpbJbG9DUe49FBhxkoa
	4Wt/7qXm42zYgrrMa9ezjOB3Ww==
X-Google-Smtp-Source: ACJfBovHzoVK56yUWril6DOVI6SMpIpDpyktPrugpzA7Do9G1w3hGxBAI8Q+PJyosuGQIGflEVN4MA==
X-Received: by 10.223.174.236 with SMTP id y99mr4601753wrc.117.1515445751617; 
	Mon, 08 Jan 2018 13:09:11 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b11sm10119434wrf.23.2018.01.08.13.09.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 13:09:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jan 2018 21:09:08 +0000
Message-Id: <1515445748-704-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libyui-ncurses: fix indentation, include SRCPV in PV, don't use += and append.
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
X-List-Received-Date: Mon, 08 Jan 2018 21:09:11 -0000

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/libyui/libyui-ncurses_git.bb  | 39 +++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
index 02bcf44..e445ee0 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
@@ -1,15 +1,14 @@
 SUMMARY = "Character Based User Interface for libyui"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
-                    file://COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
-                   "
+    file://COPYING.lgpl-2.1;md5=4fbd65380cdd255951079008b364516c \
+"
 
-SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
-           "
+SRC_URI = "git://github.com/libyui/libyui-ncurses.git"
 
-SRC_URI_append_class-target += " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
+SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-PV = "2.48.3+git"
+PV = "2.48.3+git${SRCPV}"
 SRCREV = "7b251c2ff541df6139f3d210d0a0a27d042926bd"
 
 S = "${WORKDIR}/git"
@@ -21,26 +20,26 @@ DEPENDS += "boost libyui ncurses"
 BBCLASSEXTEND = "nativesdk"
 
 do_configure_prepend () {
-         cd ${S}
-         git checkout bootstrap.sh
-         sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" bootstrap.sh
-         ./bootstrap.sh
-         mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
-         cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so* ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
-         cd -
-         sed -i "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${S}/CMakeLists.txt
-         sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/LibyuiLibraryDepends-release.cmake
+    cd ${S}
+    git checkout bootstrap.sh
+    sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" bootstrap.sh
+    ./bootstrap.sh
+    mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
+    cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so* ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
+    cd -
+    sed -i "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${S}/CMakeLists.txt
+    sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/LibyuiLibraryDepends-release.cmake
 }
 
 do_install_append () {
-        if [ "${libdir}" = "${base_prefix}/usr/lib" ] && [ -d ${D}/usr/lib64 ]; then
-            mv ${D}/usr/lib64 ${D}/usr/lib
-        fi
+    if [ "${libdir}" = "${base_prefix}/usr/lib" ] && [ -d ${D}/usr/lib64 ]; then
+        mv ${D}/usr/lib64 ${D}/usr/lib
+    fi
 }
 
 do_install_append_class-nativesdk () {
-        mkdir -p ${D}/${base_prefix}
-        mv ${D}/usr ${D}/${base_prefix}
+    mkdir -p ${D}/${base_prefix}
+    mv ${D}/usr ${D}/${base_prefix}
 }
 
 FILES_${PN} += "${datadir}/*"
-- 
2.7.4


