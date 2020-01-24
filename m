Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 957F27FD8D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 13:43:12 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id q6so2016519wro.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2020 05:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LVmC3sMqFHE0Jx58X4Uk73zULo3627aNuGi/LaYGsFo=;
	b=o7bksyuXntFGEWwR5O/d9QIWH+rDGfJimIPxYZhyn3eLfhZ/cJi3fVGnP3sIbCuLdI
	MeK6zoBJKb1bqtA0TSl4AJZzJI9bemOkcPa12AKYy3gp00M1OSmpLNW7exR13tdAVI1p
	hnqLClNRS9aKCNb4iBijg+JwOIDDv9+daW3u4zHOaX4Qct+QMwJGUugeFM3Gy3CZY78F
	/Fcq6ZUoawkQD1bFEAQJs//+uoI3dlvKESUMkEFsQSab+Jho3fdsYGByZu4vE21uYvAP
	xTYVE3dyChfzC52js0TNBgG1Vs6CWG4vm+iWgsA0sFPBMP4mLVpX3Zvgmr6nsggDB3dX
	0G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LVmC3sMqFHE0Jx58X4Uk73zULo3627aNuGi/LaYGsFo=;
	b=amId2lTLXp01fcY9wcXwZiq1TJC5ikqnJb6KjbPuUjrnWMxdDI+UU85cvomYxqrcXn
	JfOYXIDniVI5ppVGGRFM1WEV+UYgP8sd+YpI8+38yEG+AE9H9F8PemEllT0zddJqx6Qf
	fFp/6H1NLwVbRdiBvMGG1Ki0+3V0BtqJW6JTKQrCCt7yov86qcKi+ogYsqitVuggZI6b
	n95/VxydShHpJvKPhPDD6kvpiyboK2ciGhLkGRR/QO12MyYK+gc2GpWqxl9cfJCAMwEx
	0FmJKptZLHHT0E5N2ZvZQesDrVVfotNRbe/pBfx7MgFiFPo1X7bwZnVe7DEKEnqxg3Ir
	tNiw==
X-Gm-Message-State: APjAAAWmQ2hYNkyNSTLkrC5sbyKSFZifRyjv/q4rmh0VhkELdhWGKPk4
	vaIcmcK5G3za4UmZchpAKZe1TtZf
X-Google-Smtp-Source: APXvYqzx7hKNeU2YCsqladwg2kOHwORz066aAbojfTA02uwiAxOkRTAO7iUuyEONqYQo7tgO+cNc3Q==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr4414965wrv.120.1579873392876; 
	Fri, 24 Jan 2020 05:43:12 -0800 (PST)
Received: from Unimatrix05-Bionic.lan
	([2001:b07:5d32:c012:804e:5376:3822:b356])
	by smtp.gmail.com with ESMTPSA id
	z11sm7673048wrt.82.2020.01.24.05.43.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 05:43:12 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2020 14:43:04 +0100
Message-Id: <20200124134304.21057-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200124134304.21057-1-costamagnagianfranco@yahoo.it>
References: <20200124134304.21057-1-costamagnagianfranco@yahoo.it>
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 2/2] mosquitto: apply upstream proposed patches to use cmake build system, simplifying a lot the build and install process.
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
X-List-Received-Date: Fri, 24 Jan 2020 13:43:12 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../mosquitto/files/1568.patch                | 66 +++++++++++++++++++
 .../mosquitto/files/1569.patch                | 24 +++++++
 .../mosquitto/files/1570.patch                | 28 ++++++++
 .../mosquitto/files/1571.patch                | 23 +++++++
 .../mosquitto/mosquitto_1.6.8.bb              | 45 +++++--------
 5 files changed, 159 insertions(+), 27 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1568.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1569.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1570.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1571.patch

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1568.patch b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
new file mode 100644
index 000000000..2ac1373f2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
@@ -0,0 +1,66 @@
+From 50bfc79cae5764a6e513b684a5eb5bef2b35c856 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Wed, 22 Jan 2020 12:30:25 +0100
+Subject: [PATCH] Bugfix: include "deps" directory only if BUNDLED_DEPS has
+ been provided and set to true
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+---
+ config.mk          | 5 ++++-
+ lib/CMakeLists.txt | 5 ++++-
+ test/unit/Makefile | 6 +++++-
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index 51e36e0d0..0ac24b3d4 100644
+--- a/config.mk
++++ b/config.mk
+@@ -135,7 +135,10 @@ endif
+ 
+ STATIC_LIB_DEPS:=
+ 
+-LIB_CPPFLAGS=$(CPPFLAGS) -I. -I.. -I../lib -I../src/deps
++LIB_CPPFLAGS=$(CPPFLAGS) -I. -I.. -I../lib
++ifeq ($(WITH_BUNDLED_DEPS),yes)
++	LIB_CPPFLAGS:=$(LIB_CPPFLAGS) -I../src/deps
++endif
+ LIB_CFLAGS:=$(CFLAGS)
+ LIB_CXXFLAGS:=$(CXXFLAGS)
+ LIB_LDFLAGS:=$(LDFLAGS)
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index e1521f12a..891046a81 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -1,11 +1,14 @@
+ add_subdirectory(cpp)
+ 
+ include_directories(${mosquitto_SOURCE_DIR} ${mosquitto_SOURCE_DIR}/lib
+-			${mosquitto_SOURCE_DIR}/src/deps
+ 			${STDBOOL_H_PATH} ${STDINT_H_PATH}
+ 			${OPENSSL_INCLUDE_DIR} ${PTHREAD_INCLUDE_DIR})
+ link_directories(${mosquitto_SOURCE_DIR}/lib)
+ 
++if (WITH_BUNDLED_DEPS)
++        include_directories(${mosquitto_SOURCE_DIR} ${mosquitto_SOURCE_DIR}/src/deps)
++endif (WITH_BUNDLED_DEPS)
++
+ set(C_SRC
+ 	actions.c
+ 	callbacks.c
+diff --git a/test/unit/Makefile b/test/unit/Makefile
+index 9d422428d..928579492 100644
+--- a/test/unit/Makefile
++++ b/test/unit/Makefile
+@@ -2,7 +2,11 @@ include ../../config.mk
+ 
+ .PHONY: all check test test-broker test-lib clean coverage
+ 
+-CPPFLAGS:=$(CPPFLAGS) -I../.. -I../../lib -I../../src -I../../src/deps
++CPPFLAGS:=$(CPPFLAGS) -I../.. -I../../lib -I../../src
++ifeq ($(WITH_BUNDLED_DEPS),yes)
++        CPPFLAGS:=$(CPPFLAGS) -I../../src/deps
++endif
++
+ CFLAGS:=$(CFLAGS) -coverage -Wall -ggdb
+ LDFLAGS:=$(LDFLAGS) -coverage
+ LDADD:=$(LDADD) -lcunit
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1569.patch b/meta-networking/recipes-connectivity/mosquitto/files/1569.patch
new file mode 100644
index 000000000..d088ab3f7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1569.patch
@@ -0,0 +1,24 @@
+From fda932612afce2cead2fd2ca1c8ea543b2892177 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Wed, 22 Jan 2020 12:31:01 +0100
+Subject: [PATCH] Bugfix: enabling DLT was overriding everything else on linker
+ flags because of error in cmake set keyword
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 7898ff5b1..6dfbba5e6 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -130,7 +130,7 @@ add_definitions (-DWITH_BROKER)
+ if (WITH_DLT)
+     message(STATUS "DLT_LIBDIR = ${DLT_LIBDIR}")
+     link_directories(${DLT_LIBDIR})
+-    set (MOSQ_LIBS ${DLT_LIBRARIES})
++    set (MOSQ_LIBS ${MOSQ_LIBS} ${DLT_LIBRARIES})
+ endif (WITH_DLT)
+ 
+ set (MOSQ_LIBS ${MOSQ_LIBS} ${OPENSSL_LIBRARIES})
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1570.patch b/meta-networking/recipes-connectivity/mosquitto/files/1570.patch
new file mode 100644
index 000000000..62b3acdb2
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1570.patch
@@ -0,0 +1,28 @@
+From 9a6470d31d212522a56cab94b81f99a7b6967f76 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Wed, 22 Jan 2020 12:29:41 +0100
+Subject: [PATCH] cmake: add ADNS enable/disable dynamic support
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+---
+ src/CMakeLists.txt | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 7898ff5b1..11c24e2cc 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -105,6 +105,13 @@ if (WITH_SYS_TREE)
+ 	add_definitions("-DWITH_SYS_TREE")
+ endif (WITH_SYS_TREE)
+ 
++option(WITH_ADNS
++	"Include ADNS support?" OFF)
++if (WITH_ADNS)
++	add_definitions("-DWITH_ADNS")
++	set (MOSQ_LIBS ${MOSQ_LIBS} anl)
++endif (WITH_ADNS)
++
+ if (CMAKE_SYSTEM_NAME STREQUAL Linux)
+ 	option(WITH_SYSTEMD
+ 		"Include systemd support?" OFF)
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
new file mode 100644
index 000000000..4e4f804e0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
@@ -0,0 +1,23 @@
+From 3fe5468f1bdca1bff1d18cf43c9e338f41aa9e32 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Wed, 22 Jan 2020 12:39:49 +0100
+Subject: [PATCH] Add dynamic symbols linking with cmake too
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+---
+ lib/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index e1521f12a..14ba12739 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -88,6 +88,8 @@ set_target_properties(libmosquitto PROPERTIES
+ 	OUTPUT_NAME mosquitto
+ 	VERSION ${VERSION}
+ 	SOVERSION 1
++	LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/linker.version
++	LINK_FLAGS "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/linker.version"
+ )
+ 
+ install(TARGETS libmosquitto RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}")
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
index ea533d8a0..6079555a0 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.8.bb
@@ -16,45 +16,36 @@ DEPENDS = "uthash"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
+           file://1568.patch \
+           file://1569.patch \
+           file://1570.patch \
+           file://1571.patch \
 "
 
 SRC_URI[md5sum] = "24a0e567c845b3e41b75e237d200edf8"
 SRC_URI[sha256sum] = "7df23c81ca37f0e070574fe74414403cf25183016433d07add6134366fb45df6"
 
-inherit systemd update-rc.d useradd
+inherit systemd update-rc.d useradd cmake
 
-PACKAGECONFIG ??= "ssl uuid \
+PACKAGECONFIG ??= "ssl dlt websockets dns-srv\
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
                   "
 
-PACKAGECONFIG[dns-srv] = "WITH_SRV=yes,WITH_SRV=no,c-ares"
-PACKAGECONFIG[ssl] = "WITH_TLS=yes WITH_TLS_PSK=yes,WITH_TLS=no WITH_TLS_PSK=no,openssl"
-PACKAGECONFIG[uuid] = "WITH_UUID=yes,WITH_UUID=no,util-linux"
-PACKAGECONFIG[systemd] = "WITH_SYSTEMD=yes,WITH_SYSTEMD=no,systemd"
-PACKAGECONFIG[websockets] = "WITH_WEBSOCKETS=yes,WITH_WEBSOCKETS=no,libwebsockets"
-
-EXTRA_OEMAKE = " \
-    prefix=${prefix} \
-    mandir=${mandir} \
-    localedir=${localedir} \
-    ${PACKAGECONFIG_CONFARGS} \
-    STRIP=/bin/true \
-    WITH_DOCS=no \
-    WITH_BUNDLED_DEPS=no \
-"
-
-export LIB_SUFFIX = "${@d.getVar('baselib').replace('lib', '')}"
+PACKAGECONFIG[dns-srv] = "-DWITH_SRV=ON,-DWITH_SRV=OFF,c-ares"
+PACKAGECONFIG[ssl] = "-DWITH_TLS=ON -DWITH_TLS_PSK=ON -DWITH_EC=ON,-DWITH_TLS=OFF -DWITH_TLS_PSK=OFF -DWITH_EC_OFF,openssl"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
+PACKAGECONFIG[websockets] = "-DWITH_WEBSOCKETS=ON,-DWITH_WEBSOCKETS=OFF,libwebsockets"
+PACKAGECONFIG[dlt] = "-DWITH_DLT=ON,-DWITH_DLT=OFF,dlt-daemon"
 
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
+EXTRA_OECMAKE = " \
+    -DWITH_BUNDLED_DEPS=OFF \
+    -DWITH_ADNS=ON \
+"
 
+do_install_append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/service/systemd/mosquitto.service.notify ${D}${systemd_unitdir}/system/mosquitto.service
 
-    install -d ${D}${sysconfdir}/mosquitto
-    install -m 0644 ${D}${sysconfdir}/mosquitto/mosquitto.conf.example \
-                    ${D}${sysconfdir}/mosquitto/mosquitto.conf
-
     install -d ${D}${sysconfdir}/init.d/
     install -m 0755 ${WORKDIR}/mosquitto.init ${D}${sysconfdir}/init.d/mosquitto
     sed -i -e 's,@SBINDIR@,${sbindir},g' \
@@ -77,9 +68,9 @@ FILES_${PN} = "${sbindir}/mosquitto \
 
 CONFFILES_${PN} += "${sysconfdir}/mosquitto/mosquitto.conf"
 
-FILES_libmosquitto1 = "${libdir}/libmosquitto.so.1"
+FILES_libmosquitto1 = "${libdir}/libmosquitto.so.*"
 
-FILES_libmosquittopp1 = "${libdir}/libmosquittopp.so.1"
+FILES_libmosquittopp1 = "${libdir}/libmosquittopp.so.*"
 
 FILES_${PN}-clients = "${bindir}/mosquitto_pub \
                        ${bindir}/mosquitto_sub \
-- 
2.17.1


