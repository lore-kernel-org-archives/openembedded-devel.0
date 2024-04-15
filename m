Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833DFC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 18:21:53 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.219.1713205303578954998
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 11:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GeqtceVQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56fff9d2651so3669528a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 11:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713205301; x=1713810101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k6V5d9KtWY+GYLIlRFf34j/haG4Fwo+1HOrDuZonSak=;
        b=GeqtceVQgkYfUzoLhMlSFPJazk/877pGyV4KiFp6xJwxv2dOc2fr6Rn7H0hgpN5zpu
         n/U7+8r5u40RkIIKOYUReMtZzjHFrDz5GY/zwpO0k+1clWkx/nxWHoZhvDl9S9T2oQO3
         5NWH3J1p8Xa4Dj2wLnLqKdXFT+6mJJpCrki2344y8JUL52fjU254J/2PJBuoFuOmbup4
         5f7ZmIi4O9LxWrReWZXmU0fy/S5XTdgaEjiDOvndw81b0mlXumFLhSyqt0L4ZLrQLmtL
         f2X+QvvYtqthElhl0xmR+Xxs8aJMKa9eGcE/yccZ6CI8Jn7/xhggShZN9KuH5BJxTwNt
         dpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713205301; x=1713810101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6V5d9KtWY+GYLIlRFf34j/haG4Fwo+1HOrDuZonSak=;
        b=kOaBdL5uClA4GChLyLo2990CZWTDjq5WueKfKLKY5rsoJwnu5FByBZwY7TdX3FLYdE
         /2H+6yLwVKeqKnF6G6aRoaqXl+A07QzRZOkbCAr2qOxR5GBRhG9dF+SMvrG7l3ampKw1
         jTeQ4uPvIi2loMaryziyjXx5JJXmY3EMKmqGmj6x4eZgFfZ5OrBi0S8sNcxbxf7i951f
         k3eyKoW/MFCMQGBdK25pZch8w54O8kbrYRF08pcutUILBDCXXpQfYOVGPT2ZikOpQYuR
         4xjI7HOdGiFS/8T++84lweZ+7voRFrsfB/a11p9hEmUd5Jr32FK7s+JO27algP2apA99
         AAzQ==
X-Gm-Message-State: AOJu0YydHpr2fsl2DBAYFS4fFpsQ4aj5eaJ5Cf3r0wOUcN3rZmTRvm6Z
	2s5v93j8WSupl0OqVTMiz2T+2eVSJ4SxwHqYli6mGeu9NAedtGImpZSo6w==
X-Google-Smtp-Source: AGHT+IGSEB18VYhZl2pRLnWMg3Cv7BJKHoEQikNx1ttFSQ45IXPHyxNmHeKFdfAWF4AKP1EcTQjKyw==
X-Received: by 2002:a17:907:724c:b0:a54:e183:6249 with SMTP id ds12-20020a170907724c00b00a54e1836249mr1533715ejc.56.1713205301111;
        Mon, 15 Apr 2024 11:21:41 -0700 (PDT)
Received: from localhost.localdomain ([176.33.68.217])
        by smtp.gmail.com with ESMTPSA id r16-20020a170906281000b00a5267ee40efsm1913968ejc.18.2024.04.15.11.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 11:21:40 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH] Use PYTHON_SITEPACKAGES_DIR instead of hard-coded site-packages directory path
Date: Mon, 15 Apr 2024 21:19:59 +0300
Message-Id: <20240415181959.734913-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 18:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109967

The following paths have been replaced with PYTHON_SITEPACKAGES_DIR:

- "${libdir}/${PYTHON_DIR}/site-packages"
- "${libdir}/python${PYTHON_BASEVERSION}/site-packages"
- "${libdir}/python*/site-packages"
- "${libdir}/python3.*/site-packages"

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libiec61850/libiec61850_1.5.1.bb                 |  4 ++--
 .../recipes-support/libldb/libldb_2.8.0.bb           |  4 ++--
 .../recipes-support/libtalloc/libtalloc_2.4.2.bb     |  2 +-
 .../recipes-support/libtdb/libtdb_1.4.10.bb          |  2 +-
 .../recipes-support/libtevent/libtevent_0.16.0.bb    |  2 +-
 .../recipes-connectivity/lirc/lirc_0.10.2.bb         |  2 +-
 .../konkretcmpi/konkretcmpi_0.9.2.bb                 |  4 ++--
 .../libblockdev/libblockdev_3.1.1.bb                 |  2 +-
 .../libimobiledevice/libplist_2.3.0.bb               |  6 +++---
 .../libimobiledevice/libplist_git.bb                 |  6 +++---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb    |  4 ++--
 meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb  |  2 +-
 meta-oe/recipes-security/audit/audit_4.0.1.bb        |  4 ++--
 .../canonical-multitouch/geis_2.2.17.bb              | 10 +++++-----
 meta-oe/recipes-support/libftdi/libftdi_1.5.bb       |  2 +-
 .../telepathy/telepathy-python3_0.15.19.bb           | 12 ++++++------
 .../python/python3-dateutil_2.9.0.bb                 |  2 +-
 .../python/python3-pydantic-core_2.16.3.bb           |  4 ++--
 .../recipes-devtools/python/python3-pyzmq_25.1.2.bb  |  2 +-
 .../recipes-devtools/python/python3-tornado_6.4.bb   |  2 +-
 20 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
index 3e5fc91da..63476d349 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.1.bb
@@ -33,6 +33,6 @@ RDEPENDS:${PN}-python = " python3-core "
 RDEPENDS:${PN} = " python3-core "
 
 FILES:${PN} += " \
-    ${libdir}/${PYTHON_DIR}/site-packages/iec61850.py \
-    ${libdir}/${PYTHON_DIR}/site-packages/_iec61850.so \
+    ${PYTHON_SITEPACKAGES_DIR}/iec61850.py \
+    ${PYTHON_SITEPACKAGES_DIR}/_iec61850.so \
 "
diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb b/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
index 58d683eab..bdd87993d 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
@@ -63,10 +63,10 @@ FILES:${PN}-dbg += "${bindir}/.debug/* \
                     ${libdir}/ldb/.debug/* \
                     ${libdir}/ldb/modules/ldb/.debug/*"
 
-FILES:pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
+FILES:pyldb = "${PYTHON_SITEPACKAGES_DIR}/* \
                ${libdir}/libpyldb-util.*.so.* \
               "
-FILES:pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
+FILES:pyldb-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug \
                    ${libdir}/.debug/libpyldb-util.*.so.*"
 FILES:pyldb-dev = "${libdir}/libpyldb-util.*.so"
 
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
index 394c17628..b617f097c 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
@@ -53,7 +53,7 @@ PACKAGES += "pytalloc pytalloc-dev"
 
 RPROVIDES:${PN}-dbg += "pytalloc-dbg"
 
-FILES:pytalloc = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
+FILES:pytalloc = "${PYTHON_SITEPACKAGES_DIR}/* \
                   ${libdir}/libpytalloc-util.so.2 \
                   ${libdir}/libpytalloc-util.so.2.1.1 \
                  "
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
index f23b157e8..bd3f9f63a 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.10.bb
@@ -58,6 +58,6 @@ RPROVIDES:${PN}-dbg += "python3-tdb-dbg"
 
 FILES:${PN} = "${libdir}/*.so.*"
 FILES:tdb-tools = "${bindir}/*"
-FILES:python3-tdb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES:python3-tdb = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS:python3-tdb = "python3"
 INSANE_SKIP:${MLPREFIX}python3-tdb = "dev-so"
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
index 67f36083b..ac80f3733 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
@@ -57,6 +57,6 @@ PACKAGES += "python3-tevent"
 
 RPROVIDES:${PN}-dbg += "python3-tevent-dbg"
 
-FILES:python3-tevent = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES:python3-tevent = "${PYTHON_SITEPACKAGES_DIR}/*"
 
 INSANE_SKIP:${MLPREFIX}python3-tevent = "dev-so"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
index 3d474305d..d348ef8be 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/lirc/lirc_0.10.2.bb
@@ -101,7 +101,7 @@ FILES:${PN} += "${systemd_unitdir}/system/lircd.service"
 FILES:${PN} += "${systemd_unitdir}/system/lircd.socket"
 FILES:${PN} += "${libdir}/tmpfiles.d/lirc.conf"
 FILES:${PN}-dbg += "${libdir}/lirc/plugins/.debug"
-FILES:${PN}-python += "${bindir}/irdb-get ${bindir}/irtext2udp ${bindir}/lircd-setup ${bindir}/pronto2lirc ${libdir}/python*/site-packages"
+FILES:${PN}-python += "${bindir}/irdb-get ${bindir}/irtext2udp ${bindir}/lircd-setup ${bindir}/pronto2lirc ${PYTHON_SITEPACKAGES_DIR}"
 
 INITSCRIPT_PACKAGES = "lirc lirc-exec"
 INITSCRIPT_NAME:lirc-exec = "lircexec"
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index 15a796593..6b60d8918 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/rnovacek/konkretcmpi.git;branch=master;protocol=http
 SRCREV = "ad28225e6eceff88417a60c1ba8896c8e40f21a7"
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake python3-dir
 
 EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
                  ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
@@ -34,6 +34,6 @@ PACKAGES =+ "${PN}-python"
 
 RPROVIDES:${PN}-dbg += "${PN}-python-dbg"
 
-FILES:${PN}-python = "${libdir}/python*/site-packages/konkretmof.py* ${libdir}/python*/site-packages/_konkretmof.so"
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/konkretmof.py* ${PYTHON_SITEPACKAGES_DIR}/_konkretmof.so"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
index dd1514628..1ad8036d7 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.1.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.1.x-devel;prot
 SRCREV = "68aaff5556afe26be749c29a2b7cbd714dce3050"
 S = "${WORKDIR}/git"
 
-FILES:${PN} += "${libdir}/python3.*/site-packages"
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
 PACKAGECONFIG ??= "python3 lvm lvm-dbus dm parted fs escrow btrfs crypto mdraid mpath nvdimm tools"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
index 69e80ac0c..81a3c26e0 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
@@ -26,8 +26,8 @@ do_configure:prepend() {
 }
 
 do_install:append () {
-    if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
-        chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
+    if [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/plist/_plist.so ]; then
+        chrpath -d ${D}${PYTHON_SITEPACKAGES_DIR}/plist/_plist.so
     fi
 }
 
@@ -38,4 +38,4 @@ PACKAGES =+ "${PN}-utils \
 FILES:${PN} = "${libdir}/libplist-2.0${SOLIBS}"
 FILES:${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
 FILES:${PN}-utils = "${bindir}/*"
-FILES:${PN}-python = "${libdir}/python*/site-packages/*"
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
index 26dd821f9..bfd4af053 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
@@ -28,8 +28,8 @@ do_configure:prepend() {
 }
 
 do_install:append () {
-    if [ -e ${D}${libdir}/python*/site-packages/plist/_plist.so ]; then
-        chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
+    if [ -e ${D}${PYTHON_SITEPACKAGES_DIR}/plist/_plist.so ]; then
+        chrpath -d ${D}${PYTHON_SITEPACKAGES_DIR}/plist/_plist.so
     fi
 }
 
@@ -40,4 +40,4 @@ PACKAGES =+ "${PN}-utils \
 FILES:${PN} = "${libdir}/libplist-2.0${SOLIBS}"
 FILES:${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
 FILES:${PN}-utils = "${bindir}/*"
-FILES:${PN}-python = "${libdir}/python*/site-packages/*"
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
index f0c083c6d..cbe1af285 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.8.0.bb
@@ -124,8 +124,8 @@ RDEPENDS:${PN}-perl = "perl perl-module-lib perl-module-getopt-long perl-module-
 
 DESCRIPTION:${PN}-python = \
 "The ${PN}-python package includes RRDtool bindings for python."
-FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS:${PN}-python = "python3"
 
 FILES:${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/RRDs/.debug \
-    ${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug"
+    ${PYTHON_SITEPACKAGES_DIR}/.debug"
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
index 4d40ee4de..2700142e5 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
@@ -101,7 +101,7 @@ PACKAGE_WRITE_DEPS += "qemu-native"
 
 PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
 
-FILES:${PN}-python += "${libdir}/python*/site-packages/ ${libdir}/graphviz/python/"
+FILES:${PN}-python += "${PYTHON_SITEPACKAGES_DIR}/ ${libdir}/graphviz/python/"
 FILES:${PN}-perl += "${libdir}/perl5/*/vendor_perl/ ${libdir}/graphviz/perl/"
 FILES:${PN}-demo += "${datadir}/graphviz/demo/"
 
diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.1.bb
index 96ed6ff3d..a37ae3bb8 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -44,8 +44,8 @@ EXTRA_OECONF = " \
 
 EXTRA_OEMAKE = " \
         PYTHON=python3 \
-        pythondir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
-        pyexecdir=${libdir}/python${PYTHON_BASEVERSION}/site-packages \
+        pythondir=${PYTHON_SITEPACKAGES_DIR} \
+        pyexecdir=${PYTHON_SITEPACKAGES_DIR} \
         STDINC='${STAGING_INCDIR}' \
         "
 
diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index aa595ebe5..139649b97 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -48,12 +48,12 @@ RDEPENDS:${PN}-bin = " \
 
 FILES:${PN} += " \
     ${datadir}/geisview \
-    ${libdir}/${PYTHON_DIR}/site-packages/geis* \
-    ${libdir}/${PYTHON_DIR}/site-packages/_*.so \
+    ${PYTHON_SITEPACKAGES_DIR}/geis* \
+    ${PYTHON_SITEPACKAGES_DIR}/_*.so \
 "
 
-FILES:${PN}-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug"
+FILES:${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
 
-FILES:${PN}-dev += "${libdir}/${PYTHON_DIR}/site-packages/_*.la"
+FILES:${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/_*.la"
 
-FILES:${PN}-staticdev += "${libdir}/${PYTHON_DIR}/site-packages/_*.a"
+FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/_*.a"
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
index 7f0cfa237..eae1c02f0 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.5.bb
@@ -37,4 +37,4 @@ BBCLASSEXTEND = "native nativesdk"
 PACKAGES =+ "${PN}-python ftdi-eeprom"
 
 FILES:ftdi-eeprom = "${bindir}/ftdi_eeprom"
-FILES:${PN}-python = "${libdir}/${PYTHON_DIR}/site-packages/"
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/"
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index 31f6ae37f..23c216504 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -20,14 +20,14 @@ SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
 SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
 
 FILES:${PN} += "\
-    ${libdir}/python*/site-packages/telepathy/*.py \
-    ${libdir}/python*/site-packages/telepathy/*/*.py \
+    ${PYTHON_SITEPACKAGES_DIR}/telepathy/*.py \
+    ${PYTHON_SITEPACKAGES_DIR}/telepathy/*/*.py \
 "
 
 do_install:append () {
-    rm -fr ${D}${libdir}/python*/site-packages/telepathy/__pycache__
-    rm -fr ${D}${libdir}/python*/site-packages/telepathy/__pycache__
-    rm -fr ${D}${libdir}/python*/site-packages/telepathy/*/__pycache__
-    rm -fr ${D}${libdir}/python*/site-packages/telepathy/*/__pycache__
+    rm -fr ${D}${PYTHON_SITEPACKAGES_DIR}/telepathy/__pycache__
+    rm -fr ${D}${PYTHON_SITEPACKAGES_DIR}/telepathy/__pycache__
+    rm -fr ${D}${PYTHON_SITEPACKAGES_DIR}/telepathy/*/__pycache__
+    rm -fr ${D}${PYTHON_SITEPACKAGES_DIR}/telepathy/*/__pycache__
 }
 RDEPENDS:${PN} += "python3-dbus"
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index ac76ccc96..1f7a4a03f 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE = "python-dateutil"
 inherit pypi python_setuptools_build_meta
 
 PACKAGES =+ "${PN}-zoneinfo"
-FILES:${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
+FILES:${PN}-zoneinfo = "${PYTHON_SITEPACKAGES_DIR}/dateutil/zoneinfo"
 
 DEPENDS += "python3-setuptools-scm-native"
 
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
index 934e3e2bb..faa291ea6 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.16.3.bb
@@ -36,12 +36,12 @@ RDEPENDS:${PN}-ptest += "\
 "
 
 do_install:append() {
-    for f in ${D}/${libdir}/${PYTHON_DIR}/site-packages/pydantic_core/_pydantic_core.*.so
+    for f in ${D}/${PYTHON_SITEPACKAGES_DIR}/pydantic_core/_pydantic_core.*.so
     do
         fname=`basename $f`
         lname=`echo $fname | sed 's/musl/gnu/'`
         if [ "$fname" != "$lname" ]; then
-            mv $f ${D}/${libdir}/${PYTHON_DIR}/site-packages/pydantic_core/$lname
+            mv $f ${D}/${PYTHON_SITEPACKAGES_DIR}/pydantic_core/$lname
         fi
     done
 }
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
index 540aa6200..2a6993c14 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_25.1.2.bb
@@ -22,7 +22,7 @@ PACKAGES =+ "\
 "
 
 FILES:${PN}-test += "\
-    ${libdir}/${PYTHON_DIR}/site-packages/*/tests \
+    ${PYTHON_SITEPACKAGES_DIR}/*/tests \
 "
 
 RDEPENDS:${PN} += "\
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
index 08c8672eb..b01c1cec2 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.4.bb
@@ -35,7 +35,7 @@ PACKAGES =+ "\
 "
 
 FILES:${PN}-test = " \
-    ${libdir}/${PYTHON_DIR}/site-packages/*/test \
+    ${PYTHON_SITEPACKAGES_DIR}/*/test \
 "
 
 BBCLASSEXTEND  += "native nativesdk"
-- 
2.25.1


