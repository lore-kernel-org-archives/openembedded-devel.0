Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.14742.1614962909024009195
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Mar 2021 08:48:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dGg/tqU7;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d12so2495787pfo.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Mar 2021 08:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0tv0A3Wwrt7Z92m6yKKB0Bbpin0EEXuisDMUZ0ZTibc=;
        b=dGg/tqU7TQX7FDNfUhRjkyq0yq3Y/jQtPaVmeKGaURb1OnYsq5mnrFYBX+I2Z/H2UH
         1lSBQuO0WH7yQ+4LeDE9p3OHGohZ5wwwCwYRUDPfymn3IbMSkd9yP6dR3HPBF2QyIE0k
         WpyANnSULRPMQP2nuFWMEfmE4WI5WlW4BxZ0W56oIbVLUzb4DmXrJXFY/UblGfQUtYEB
         YFEPSrCXFQjMw3gkkL9hU2BjnJswaokY8+FuWk8+2C+h0Wt1KhDxxzt9FDkPc4sZNvWZ
         1dCAPLsJA3vfOrMYrWkmJcGtVKxGhffMebp/VtOeZsA+7rSn0UA6WU7to9rXTAvYbcD9
         +azg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0tv0A3Wwrt7Z92m6yKKB0Bbpin0EEXuisDMUZ0ZTibc=;
        b=ji/SI/ee1dZEYbimcUsNs2oNDN6rsEXxPwASKkBzSTskveImZjGc6Pc3YBx/cRRmm7
         t0TAYTUTAlAYYIgV59+7AntDXngoXzXBSp5rUqS+QG6aAaBRu8n1nJMr32KjP9gcIgRb
         z60p8NFpfeLA46Eeks/ndy4AAosOIVAbxXvpcVhjkU0AYg2ROXpurmwTxqjoVB2/IvqJ
         rdyN2jy9/mEx0jWfg/W7smDNJQt7UeVtEx1ddXt37kRB3Ew/tIYMDzd/uSmaSh0K6GQp
         DcvwcVyePzHMccBOLfgyi3KYeOTUPnyGFQ4sMTisUXyDCad+PhLCZAEse6ETm9ErVG3Q
         GEtQ==
X-Gm-Message-State: AOAM5336CT72UrEGc8JaKKlq/J/N/ty2hWyrDfaATrU6rWxGVkOPcB2h
	glpLztv2cVGa2Tb4ChOwEQAsUGTrJ+LTDQ==
X-Google-Smtp-Source: ABdhPJxsAxyfzpLuKU6vHVWfMlt1PdodlTbJJylpJY1MexoxMIqKOj956wthoUP1FQOQcBZpywafCQ==
X-Received: by 2002:a63:1021:: with SMTP id f33mr9520249pgl.409.1614962908392;
        Fri, 05 Mar 2021 08:48:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id z12sm2653587pjz.16.2021.03.05.08.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 08:48:28 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@telenet.be>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libiio: fix build when python bindings are enabled
Date: Fri,  5 Mar 2021 08:48:25 -0800
Message-Id: <20210305164825.4056544-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sam Van Den Berge <sam.van.den.berge@telenet.be>

See https://github.com/openembedded/meta-openembedded/issues/248

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@telenet.be>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 26 +++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index b308bde171..00c016db44 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -12,13 +12,15 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-inherit cmake python3native systemd
+DISTUTILS_SETUP_PATH ?= "${B}/bindings/python/"
 
 DEPENDS = " \
     flex-native bison-native libaio \
     ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
 "
 
+inherit cmake python3native systemd setuptools3
+
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
     -DUDEV_RULES_INSTALL_DIR=${nonarch_base_libdir}/udev/rules.d \
@@ -31,8 +33,6 @@ PACKAGECONFIG[usb_backend] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libus
 PACKAGECONFIG[network_backend] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
 PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"
 
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'distutils3-base', '', d)}
-
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
 
 RDEPENDS_${PN}-${PYTHON_PN} = "${PN} ${PYTHON_PN}-ctypes ${PYTHON_PN}-stringold"
@@ -46,3 +46,23 @@ FILES_${PN}-${PYTHON_PN} = "${PYTHON_SITEPACKAGES_DIR}"
 
 SYSTEMD_PACKAGES = "${PN}-iiod"
 SYSTEMD_SERVICE_${PN}-iiod = "iiod.service"
+
+# Explicitly define do_configure, do_compile and do_install because both cmake and setuptools3 have
+# EXPORT_FUNCTIONS do_configure do_compile do_install
+do_configure() {
+    cmake_do_configure
+}
+
+do_compile() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
+        distutils3_do_compile
+    fi
+    cmake_do_compile
+}
+
+do_install() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
+        distutils3_do_install
+    fi
+    cmake_do_install
+}
-- 
2.30.1

