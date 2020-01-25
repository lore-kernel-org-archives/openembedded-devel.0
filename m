Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCDE7FD68
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 10:52:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id t23so1977531wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 02:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ac/FadtLg8Jo5/7K7SBy0WE6GGgfsdgxQ+EYNpQ1j0=;
	b=dkfP1dIPSCjP3DfzATioS2gGXakDhXW0EZpBe9003X0tOxDgJVK7NPSbitRcUkUH/A
	fLEhm5G/WdQUrT5U+T27wAySAa7TTsfjJaQpEfccsn5XV6QlVmy4JOLFvluhfsSw16AW
	eJwNyMTc1Hvx0QvEY8vO5Z9DbUBDelGrjrp0W/eGbVYoj6MUTA2udm4EfjH17P3DWsLA
	ixaWkvpBH7F6Cfbf2Gd5t98nfXpXkyoYl3IGZ9cADbcL6Et9y6n1X2Uhbmnk4drj0RmK
	AWtmg5Bf//vBqBaAoxVyhebS42q+OjDozL4Vzr0nYcILHLb+NuDgkXIhpqvxvwByO13N
	WGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ac/FadtLg8Jo5/7K7SBy0WE6GGgfsdgxQ+EYNpQ1j0=;
	b=lty0mqbDQhhcx5Dhe/Lve4xmD0Tpd2VpPHn+Ivd2xUZ6h6Jq86w0k7fqDu8G8JCs9T
	pq5D8VA58i5OrLJDaFJpZP3pUeO/+XlEMk4N8nQAkWKT+AzknT32eoQDNyKxNlnekhUK
	g4M4Iis6iWvkURkFxr02qenmyn5Sr+cwuf4aB8kg1XZehr6xjnENDSTd8mFeoLeeKqF1
	cDZ3ibM60AirTj3KYXn0smEemDnMsEJf++lv6g7kedgvWLqwerOS/W0wm0foTHRxzJWX
	65ZyD43M+4NQdvY3hUhqGkpbR3av71EhHW2Tq0MoRx5zjNyFBReF3JUQAWB3uh1Kjx08
	qs5w==
X-Gm-Message-State: APjAAAV6UIBwHaEX8UetPn4Apb48Z+j+yMeVbsKn5JTzaDlBRYmR2B4e
	QqTWBiOpd0wDiCOnm4NVMcabFdd/
X-Google-Smtp-Source: APXvYqy8HYfBRyu3tpKN7167XtQfcDb6EVfHk5bJEfBfSl5b18GTuOHGp7TGLV1hokh3ORMn4eNz2w==
X-Received: by 2002:a7b:cae2:: with SMTP id t2mr2918172wml.180.1579949552532; 
	Sat, 25 Jan 2020 02:52:32 -0800 (PST)
Received: from localhost.localdomain (mob-31-157-190-238.net.vodafone.it.
	[31.157.190.238])
	by smtp.gmail.com with ESMTPSA id v8sm11093028wrw.2.2020.01.25.02.52.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 25 Jan 2020 02:52:31 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 10:57:53 +0100
Message-Id: <20200125095753.21694-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125095753.21694-1-costamagnagianfranco@yahoo.it>
References: <20200125095753.21694-1-costamagnagianfranco@yahoo.it>
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
X-List-Received-Date: Sat, 25 Jan 2020 10:52:33 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../mosquitto/files/1568.patch                | 67 +++++++++++++++++++
 .../mosquitto/files/1569.patch                | 25 +++++++
 .../mosquitto/files/1570.patch                | 39 +++++++++++
 .../mosquitto/files/1571.patch                | 24 +++++++
 .../mosquitto/mosquitto_1.6.8.bb              | 45 +++++--------
 5 files changed, 173 insertions(+), 27 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1568.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1569.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1570.patch
 create mode 100644 meta-networking/recipes-connectivity/mosquitto/files/1571.patch

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1568.patch b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
new file mode 100644
index 000000000..15f7a9105
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1568.patch
@@ -0,0 +1,67 @@
+Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1568]
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
index 000000000..9718b98c8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1569.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1569]
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
index 000000000..f11fc4815
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1570.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1570]
+From 775677b05190380c3736bf0dbef002ee7b9bff33 Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Date: Wed, 22 Jan 2020 12:29:41 +0100
+Subject: [PATCH] cmake: add ADNS enable/disable dynamic support
+
+Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+---
+ src/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 7898ff5b1..edae76f32 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -105,6 +105,9 @@ if (WITH_SYS_TREE)
+ 	add_definitions("-DWITH_SYS_TREE")
+ endif (WITH_SYS_TREE)
+ 
++option(WITH_ADNS
++	"Include ADNS support?" OFF)
++
+ if (CMAKE_SYSTEM_NAME STREQUAL Linux)
+ 	option(WITH_SYSTEMD
+ 		"Include systemd support?" OFF)
+@@ -137,10 +140,11 @@ set (MOSQ_LIBS ${MOSQ_LIBS} ${OPENSSL_LIBRARIES})
+ # Check for getaddrinfo_a
+ include(CheckLibraryExists)
+ check_library_exists(anl getaddrinfo_a  "" HAVE_GETADDRINFO_A)
+-if (HAVE_GETADDRINFO_A)
++if (HAVE_GETADDRINFO_A AND WITH_ADNS)
++	add_definitions("-DWITH_ADNS")
+ 	add_definitions(-DHAVE_GETADDRINFO_A)
+ 	set (MOSQ_LIBS ${MOSQ_LIBS} anl)
+-endif (HAVE_GETADDRINFO_A)
++endif (HAVE_GETADDRINFO_A AND WITH_ADNS)
+ 
+ 
+ if (UNIX)
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
new file mode 100644
index 000000000..2cfa48457
--- /dev/null
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
@@ -0,0 +1,24 @@
+Upstream-Status: Submitted [https://github.com/eclipse/mosquitto/pull/1571]
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


