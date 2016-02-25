Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA7B771BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:36:11 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c200so36915146wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 08:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yL8llp+UCqnqnuGwLdWdOI/1CI4K0gobxM8SXFhrRy8=;
	b=I/1YC8FM6Iny5uc7XM+6mp7uBngi/Uhezzpy7VQU1NxDlOXdHtINUUmaSs7qZ4q5bK
	OO09xRhnBnHDVb/IP4B4rgFyeVlG6K+DRSYypGiHrtoUen023tyJ0pYPDP2Qf6cFxdQT
	muHMbtxFmisjN/ZHzJPs6FLiNqfIb+ABMog5UR7FiOcbUIOHTgf5zjlcHeicvioXK8gK
	AaJyBYsDdQVM4maabi0DjZ5pQCd0zSK1PKGNR04fGm4K1W0CAe+3zq1hsiLUfZWw4M+V
	RyO28qhqUjVjqgNurxjHzIHARRKM1/SerOoxZghQK9fL7Lw9Jg3GJwe4Uf1giPcNf2Dh
	TOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yL8llp+UCqnqnuGwLdWdOI/1CI4K0gobxM8SXFhrRy8=;
	b=Zq/FX/UJB1qPmtdiDZkpCzpeC43QJpzOBotoFxaWg+8ppBmz3qa1QfnCW/w9pSTulk
	fgtooLcmjUGFLZ7zI7x4TGmib796jATj/ikMjfAb5JY5/S1KqMzS6ntlOeZLcZ1Mx9EB
	qZZz2wO1iLPgwrP8NkqJ/lVk2jisrl1HP52nPQm+7NFnH0mj1TzZldDydAnkOFA9wsV2
	0JUBc4veQW/7T9V8O2EKJxLXPkFL0LOcCzYvSwB+DRBhcyClq6SEaJxcCa568+o8tBNp
	LcMuQiDIV/PZu34vGRaUbbU0idBQmw65+vcFN35ZnUt1V1vo0MLevwvlDlA1WOgCaYFn
	J05w==
X-Gm-Message-State: AG10YOSjDSf/I7HgcUqlRjHahdjEqF1A63H2P6ZhjnqD35bRlDtvoLGPeDITYIaOX+v+yQ==
X-Received: by 10.28.1.196 with SMTP id 187mr4472235wmb.68.1456418171684;
	Thu, 25 Feb 2016 08:36:11 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z127sm3965398wme.5.2016.02.25.08.36.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 08:36:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 17:37:23 +0100
Message-Id: <1456418243-11769-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-oe] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Thu, 25 Feb 2016 16:36:12 -0000

* Using "cp -a" leaks UID of user running the builds, causing
  many QA warnings.
* See this thread for details:
  http://lists.openembedded.org/pipermail/openembedded-core/2015-November/112904.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-edbus.inc              |  2 +-
 meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb           |  2 +-
 meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb   |  2 +-
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  2 +-
 .../recipes-support/cim-schema/cim-schema-docs_2.40.0.bb       |  2 +-
 .../recipes-support/cim-schema/cim-schema-exper_2.39.0.bb      |  2 +-
 .../recipes-support/cim-schema/cim-schema-final_2.40.0.bb      |  2 +-
 meta-oe/recipes-benchmark/fio/fio_2.2.6.bb                     |  2 +-
 meta-oe/recipes-devtools/lua/lua_5.3.2.bb                      |  2 +-
 meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb          |  2 +-
 meta-oe/recipes-multimedia/live555/live555.inc                 | 10 +++++-----
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb                |  2 +-
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb             |  4 ++--
 meta-oe/recipes-support/tbb/tbb_4.1.bb                         |  2 +-
 meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb    |  2 +-
 15 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-edbus.inc b/meta-efl/recipes-devtools/python/python-edbus.inc
index 1d8098f..3e72261 100644
--- a/meta-efl/recipes-devtools/python/python-edbus.inc
+++ b/meta-efl/recipes-devtools/python/python-edbus.inc
@@ -39,7 +39,7 @@ do_install_append() {
         done
         cd ${S}
         install -d ${D}${datadir}/${PN}/
-        cp -a examples ${D}${datadir}/${PN}/
+        cp -R --no-dereference --preserve=mode,links -v examples ${D}${datadir}/${PN}/
         find ${D}${datadir}/${PN}/examples -name ".svn" | xargs rm -rf
     fi
 }
diff --git a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
index 7cc0ec7..71e2bfc 100644
--- a/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
+++ b/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb
@@ -19,7 +19,7 @@ do_install() {
     install -d ${D}${libdir}
     install -m 0644 libebml.a ${D}${libdir}
     install -m 0755 libebml.so.* ${D}${libdir}
-    cp -a libebml.so ${D}${libdir}
+    cp -R --no-dereference --preserve=mode,links -v libebml.so ${D}${libdir}
 
     install -d ${D}${includedir}/ebml
     for i in ../../ebml/*.h; do
diff --git a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
index 19a7edb..1ad87cb 100644
--- a/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
+++ b/meta-multimedia/recipes-mkv/libmatroska/libmatroska_1.4.1.bb
@@ -21,7 +21,7 @@ do_install() {
     install -d ${D}${libdir}
     install -m 0644 libmatroska.a ${D}${libdir}
     install -m 0755 libmatroska.so.* ${D}${libdir}
-    cp -a libmatroska.so ${D}${libdir}
+    cp -R --no-dereference --preserve=mode,links -v libmatroska.so ${D}${libdir}
 
     install -d ${D}${includedir}/matroska
     for i in ../../matroska/*.h; do
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index e8df06c..06f3707 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -85,7 +85,7 @@ do_install_ptest() {
     for i in ${S}/dist ${S}/include ${B}/include ${S}/mibs ${S}/configure \
         ${B}/net-snmp-config ${S}/testing; do
         if [ -e "$i" ]; then
-            cp -a "$i" ${D}${PTEST_PATH}
+            cp -R --no-dereference --preserve=mode,links -v "$i" ${D}${PTEST_PATH}
         fi
     done
     echo `autoconf -V|awk '/autoconf/{print $NF}'` > ${D}${PTEST_PATH}/dist/autoconf-version
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
index 093f0d4..31875ea 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-docs_2.40.0.bb
@@ -18,7 +18,7 @@ do_unpack() {
 
 do_install() {
         install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}-docs
-        cp -a ${S}/* ${D}${datadir}/doc/cim-schema-${PV}-docs
+        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/doc/cim-schema-${PV}-docs
 }
 
 FILES_${PN} = "${datadir}/doc/*"
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
index e4ed7b3..4b07c0b 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
@@ -16,7 +16,7 @@ do_install() {
         install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
         install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
-        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
+        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/	
         chown -R root:root ${D}${datadir}/mof/cimv${PV}
         for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
                 sed -i -e 's/\r//g' $i
diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
index 7ab9c4d..5675384 100644
--- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
+++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
@@ -21,7 +21,7 @@ do_install() {
         install -d -m 0755 ${D}${datadir}/doc/cim-schema-${PV}
         install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
 
-        cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
+        cp -R --no-dereference --preserve=mode,links -v ${S}/* ${D}${datadir}/mof/cimv${PV}/	
         chown -R root:root ${D}${datadir}/mof/cimv${PV}/
         for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
                 sed -i -e 's/\r//g' $i
diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
index 5bf387c..db67173 100644
--- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
@@ -37,5 +37,5 @@ do_configure() {
 do_install() {
     oe_runmake install DESTDIR=${D} prefix=${prefix} mandir=${mandir}
     install -d ${D}/${docdir}/${PN}
-    cp -a ${S}/examples ${D}/${docdir}/${PN}/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/examples ${D}/${docdir}/${PN}/
 }
diff --git a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
index f97ed50..07a1a43 100644
--- a/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
+++ b/meta-oe/recipes-devtools/lua/lua_5.3.2.bb
@@ -55,7 +55,7 @@ do_install () {
 }
 
 do_install_ptest () {
-        cp -a ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
+        cp -R --no-dereference --preserve=mode,links -v ${WORKDIR}/lua-${PV}-tests ${D}${PTEST_PATH}/test
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
index 85035d9..0ac8fad 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.bb
@@ -33,7 +33,7 @@ do_install_append() {
     install ${B}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
 
     install -d ${D}${sysconfdir}
-    cp -a ${S}/scripts/etc/* ${D}${sysconfdir}/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/scripts/etc/* ${D}${sysconfdir}/
     chown -R root:root ${D}${sysconfdir}
 }
 
diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index 0c8208a..0d11de9 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -34,11 +34,11 @@ do_install() {
     install -d ${D}${includedir}/liveMedia
     install -d ${D}${includedir}/UsageEnvironment
     install -d ${D}${libdir}
-    cp -a ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
-    cp -a ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
-    cp -a ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
-    cp -a ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
-    cp -a ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
+    cp -R --no-dereference --preserve=mode,links -v ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
     # Find all the headers
     for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
         install ${i} ${D}${includedir}
diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
index 617afbc..40a6df3 100644
--- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
+++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
@@ -23,7 +23,7 @@ do_configure_prepend() {
 }
 do_install_append() {
     install -d ${D}${datadir}/orrery
-    cp -a ${S}/data/* ${D}${datadir}/orrery
+    cp -R --no-dereference --preserve=mode,links -v ${S}/data/* ${D}${datadir}/orrery
     chown -R root:root ${D}${datadir}/orrery
     install -d ${D}${datadir}/icons
     install -m 0755 ${WORKDIR}/orrery.png ${D}${datadir}/icons
diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index 18979d5..35c891e 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -19,10 +19,10 @@ EXTRA_OECONF = "--without-x \
 
 do_configure() {
     export topdir=${S}
-    cp -a ${S}/autoconf/configure.in ${S}
+    cp -R --no-dereference --preserve=mode,links -v ${S}/autoconf/configure.in ${S}
 
     if ! [ -d ${S}/platforms/${DISTRO} ] ; then
-        cp -a ${S}/platforms/unknown ${S}/platforms/${DISTRO} 
+        cp -R --no-dereference --preserve=mode,links -v ${S}/platforms/unknown ${S}/platforms/${DISTRO} 
     fi
 
     gnu-configize --force
diff --git a/meta-oe/recipes-support/tbb/tbb_4.1.bb b/meta-oe/recipes-support/tbb/tbb_4.1.bb
index 55212dc..09ed6ec 100644
--- a/meta-oe/recipes-support/tbb/tbb_4.1.bb
+++ b/meta-oe/recipes-support/tbb/tbb_4.1.bb
@@ -26,7 +26,7 @@ do_compile() {
 do_install() {
     install -d ${D}${includedir} ${D}${libdir}/pkgconfig
     rm ${S}/include/tbb/index.html -f
-    cp -a ${S}/include/tbb ${D}${includedir}
+    cp -R --no-dereference --preserve=mode,links -v ${S}/include/tbb ${D}${includedir}
     install -m 0755 ${B}/build/linux_*_release/lib*.so* ${D}${libdir}
     install -m 0644 ${WORKDIR}/tbb.pc ${D}${libdir}/pkgconfig
 }
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
index b8faf12..ac32185 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
@@ -20,7 +20,7 @@ inherit allarch
 
 do_install() {
     install -d ${D}${datadir}/${BPN}
-    cp -a * ${D}${datadir}/${BPN}
+    cp -R --no-dereference --preserve=mode,links -v * ${D}${datadir}/${BPN}
     chown -R root:root ${D}${datadir}/${BPN}
     # Don't install patches to target
     rm -rf ${D}${datadir}/${BPN}/patches
-- 
2.7.1


