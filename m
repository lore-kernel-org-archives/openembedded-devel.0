Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by mx.groups.io with SMTP id smtpd.web12.9664.1623424201079482227
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jun 2021 08:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=smhyNisu;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.1, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=UtcvmduY3VatlL/LlyCuX1mfs8Hcjd+lHecPOBTK5dI=;
	b=smhyNisuxOxrokNRYkFwBa6My1hg4SHWDLdxTt1Udq5aBotrWeL8uJVbWN36KOM/UOuFDCxMGyO0u
	 VrOiuQ0UZj3xrEdQT6vsmUu3D1/qj0becCOID4Ik3hxpiznME9EhzniPXsKZ4gcAuE2hTC2KtK8GdF
	 METXFt8SApqJjSsjEdfYmxtbaHEBZrFs+S69VxHD99ZFJVBMXXEujLvYWnIE7lMxt/vF0G6OC7F1C4
	 +ZOZ8nU7cpQuqVX2AvsyS96rttr7RzY0l3wG/6vb63g/wVeyKyadfI29aJCUNhqfYTD4xaZbPcirLZ
	 kcl0JDMfrcAve59b5R9iircgK95bZZw==
X-HalOne-Cookie: f111a04e8292845f39baf559f0a1ebd4c4d105ee
X-HalOne-ID: 11bdee54-cac7-11eb-b56d-d0431ea8a290
Received: from localhost.localdomain (ua-85-227-233-29.bbcust.telenor.se [85.227.233.29])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 11bdee54-cac7-11eb-b56d-d0431ea8a290;
	Fri, 11 Jun 2021 15:09:54 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [meta-oe][PATCH] hiredis: add cmake config file for pkgconfig
Date: Fri, 11 Jun 2021 17:09:47 +0200
Message-Id: <20210611150947.21195-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to be able to use pkgconfig and find_package in
cmake the file HiredisConfig.cmake need to be present
in sysroot. This commit adds a patch from Ubuntu/Debian
that fixes this. As build system for version 0.14 of Hiredis
is Makefile based this is not possible to upstream. In
later Hiredis the build system is CMake based and this is
fixed.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 ...0001-CMake-configuration-for-hiredis.patch | 117 ++++++++++++++++++
 .../hiredis/hiredis_0.14.0.bb                 |   3 +-
 2 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch

diff --git a/meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch b/meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch
new file mode 100644
index 000000000..139d13f4c
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch
@@ -0,0 +1,117 @@
+From 2dc0c7e4a3fa7ecc92ee5e22f1d8ee48c2b333a8 Mon Sep 17 00:00:00 2001
+From: Thomas Lee <debian@tomlee.co>
+Date: Sun, 4 Nov 2018 22:59:09 +0000
+Subject: [PATCH] CMake configuration for hiredis
+
+Last-Update: 2018-09-26
+
+Upstream-Status: Backport [Ubuntu 20.04]
+---
+ HiredisConfig.cmake.in        |  5 +++++
+ HiredisConfigVersion.cmake.in | 22 ++++++++++++++++++++++
+ Makefile                      | 17 ++++++++++++++++-
+ 3 files changed, 43 insertions(+), 1 deletion(-)
+ create mode 100644 HiredisConfig.cmake.in
+ create mode 100644 HiredisConfigVersion.cmake.in
+
+diff --git a/HiredisConfig.cmake.in b/HiredisConfig.cmake.in
+new file mode 100644
+index 0000000..2cce290
+--- /dev/null
++++ b/HiredisConfig.cmake.in
+@@ -0,0 +1,5 @@
++find_path(HIREDIS_INCLUDE_DIRS hiredis/hiredis.h HINTS "/usr/include")
++find_library(HIREDIS_LIB_HIREDIS NAMES hiredis HINTS "/usr/lib")
++
++set(HIREDIS_LIBRARIES ${HIREDIS_LIB_HIREDIS})
++
+diff --git a/HiredisConfigVersion.cmake.in b/HiredisConfigVersion.cmake.in
+new file mode 100644
+index 0000000..584144a
+--- /dev/null
++++ b/HiredisConfigVersion.cmake.in
+@@ -0,0 +1,22 @@
++set(PACKAGE_VERSION "@HIREDIS_VERSION@")
++
++string(REPLACE "." ";" HIREDIS_VERSION_COMPONENTS ${PACKAGE_VERSION})
++string(REPLACE "." ";" REQUESTED_VERSION_COMPONENTS ${PACKAGE_FIND_VERSION})
++
++list(GET HIREDIS_VERSION_COMPONENTS 0 HIREDIS_VERSION_MAJOR)
++list(GET HIREDIS_VERSION_COMPONENTS 1 HIREDIS_VERSION_MINOR)
++
++list(GET REQUESTED_VERSION_COMPONENTS 0 REQUESTED_VERSION_MAJOR)
++list(GET REQUESTED_VERSION_COMPONENTS 1 REQUESTED_VERSION_MINOR)
++
++if(("${HIREDIS_VERSION_MAJOR}" EQUAL "${REQUESTED_VERSION_MAJOR}") AND
++    (("${HIREDIS_VERSION_MINOR}" EQUAL "${REQUESTED_VERSION_MINOR}") OR
++     ("${HIREDIS_VERSION_MINOR}" GREATER "${REQUESTED_VERSION_MINOR}")))
++    set(PACKAGE_VERSION_COMPATIBLE TRUE)
++    if("${PACKAGE_VERSION}" VERSION_EQUAL "${PACKAGE_FIND_VERSION}")
++        set(PACKAGE_VERSION_EXACT TRUE)
++    endif()
++else()
++    set(PACKAGE_VERSION_COMPATIBLE FALSE)
++endif()
++
+diff --git a/Makefile b/Makefile
+index 339727f..43704cd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -8,6 +8,8 @@ EXAMPLES=hiredis-example hiredis-example-libevent hiredis-example-libev hiredis-
+ TESTS=hiredis-test
+ LIBNAME=libhiredis
+ PKGCONFNAME=hiredis.pc
++CMAKECONFNAME=HiredisConfig.cmake
++CMAKEVERSNAME=HiredisConfigVersion.cmake
+ 
+ HIREDIS_MAJOR=$(shell grep HIREDIS_MAJOR hiredis.h | awk '{print $$3}')
+ HIREDIS_MINOR=$(shell grep HIREDIS_MINOR hiredis.h | awk '{print $$3}')
+@@ -19,9 +21,11 @@ PREFIX?=/usr/local
+ INCLUDE_PATH?=include/hiredis
+ LIBRARY_PATH?=lib
+ PKGCONF_PATH?=pkgconfig
++CMAKE_PATH?=cmake/Hiredis
+ INSTALL_INCLUDE_PATH= $(DESTDIR)$(PREFIX)/$(INCLUDE_PATH)
+ INSTALL_LIBRARY_PATH= $(DESTDIR)$(PREFIX)/$(LIBRARY_PATH)
+ INSTALL_PKGCONF_PATH= $(INSTALL_LIBRARY_PATH)/$(PKGCONF_PATH)
++INSTALL_CMAKE_PATH= $(INSTALL_LIBRARY_PATH)/$(CMAKE_PATH)
+ 
+ # redis-server configuration used for testing
+ REDIS_PORT=56379
+@@ -150,6 +154,7 @@ check: hiredis-test
+ 
+ clean:
+ 	rm -rf $(DYLIBNAME) $(STLIBNAME) $(TESTS) $(PKGCONFNAME) examples/hiredis-example* *.o *.gcda *.gcno *.gcov
++	rm -f $(CMAKECONFNAME) $(CMAKEVERSNAME)
+ 
+ dep:
+ 	$(CC) -MM *.c
+@@ -169,7 +174,14 @@ $(PKGCONFNAME): hiredis.h
+ 	@echo Libs: -L\$${libdir} -lhiredis >> $@
+ 	@echo Cflags: -I\$${includedir} -D_FILE_OFFSET_BITS=64 >> $@
+ 
+-install: $(DYLIBNAME) $(STLIBNAME) $(PKGCONFNAME)
++$(CMAKECONFNAME): $(CMAKECONFNAME).in
++	cp $(CMAKECONFNAME).in $(CMAKECONFNAME)
++
++$(CMAKEVERSNAME): $(CMAKEVERSNAME).in
++	sed -e "s,@HIREDIS_VERSION@,$(HIREDIS_MAJOR).$(HIREDIS_MINOR).$(HIREDIS_PATCH),g" \
++		$(CMAKEVERSNAME).in >$(CMAKEVERSNAME)
++
++install: $(DYLIBNAME) $(STLIBNAME) $(PKGCONFNAME) $(CMAKECONFNAME) $(CMAKEVERSNAME)
+ 	mkdir -p $(INSTALL_INCLUDE_PATH) $(INSTALL_INCLUDE_PATH)/adapters $(INSTALL_LIBRARY_PATH)
+ 	$(INSTALL) hiredis.h async.h read.h sds.h $(INSTALL_INCLUDE_PATH)
+ 	$(INSTALL) adapters/*.h $(INSTALL_INCLUDE_PATH)/adapters
+@@ -178,6 +190,9 @@ install: $(DYLIBNAME) $(STLIBNAME) $(PKGCONFNAME)
+ 	$(INSTALL) $(STLIBNAME) $(INSTALL_LIBRARY_PATH)
+ 	mkdir -p $(INSTALL_PKGCONF_PATH)
+ 	$(INSTALL) $(PKGCONFNAME) $(INSTALL_PKGCONF_PATH)
++	mkdir -p $(INSTALL_CMAKE_PATH)
++	$(INSTALL) $(CMAKECONFNAME) $(INSTALL_CMAKE_PATH)
++	$(INSTALL) $(CMAKEVERSNAME) $(INSTALL_CMAKE_PATH)
+ 
+ 32bit:
+ 	@echo ""
+-- 
+2.27.0
+
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
index 29f8de8d2..a41888802 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
+++ b/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
@@ -7,7 +7,8 @@ DEPENDS = "redis"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
 SRCREV = "685030652cd98c5414ce554ff5b356dfe8437870"
 SRC_URI = "git://github.com/redis/hiredis;protocol=git \
-           file://0001-Makefile-remove-hardcoding-of-CC.patch"
+           file://0001-Makefile-remove-hardcoding-of-CC.patch \
+           file://0001-CMake-configuration-for-hiredis.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

