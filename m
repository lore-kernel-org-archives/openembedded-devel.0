Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16FAC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:48:37 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.840.1635274116470131217
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=7GqugCqn;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id u11so898817lfs.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aALsaZZmCwxre9MAIvn1+B9ibriQo4NZSCieIkwP8Pk=;
        b=7GqugCqnPdApn+0BaCuNbBlE2diDcCy4Bu4s1FrzeaQh5F4/Y7ktCHvX1/HcvfIDty
         rCChQBeHpgEOHgtOZLKcrQKiB81HfzicMjsdpkphtbCuiL62Odvt6BR9bjSZG/3N13JL
         qXUcEBzzNeCdoL4+ufqW6zG9bGoig7kHvul/PfDrpBGokyErC0Zf9WoyDm3/Eo4f1vT/
         JEbYK02t3V+gl99iyk9EpT7zR5WMVGDklrOiXTPGGcMCf2oa4eY8MSPuKZnYViSs8J/5
         cKdFelMV22P5RHhRJgANkuXC3/mE8tjt6iiZqLXYWAFfeFFidD32Lh+OuSoNqu4zpfVM
         iiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aALsaZZmCwxre9MAIvn1+B9ibriQo4NZSCieIkwP8Pk=;
        b=jyl521rsSq1i8L1DUys3N3GpcGeIFi8Z3qI9Jr7TiN/r72O+Md05LkKMuaab0ztbFF
         dPLqx3FvXIYTkjHsThesrcwcYcQVGB2toMGIWU8Rz9z0L2wCpwkKPWPKFyEwgYbTpDu7
         IydMbXAHTqlK2YBDMAUbgVPY0g2of5fL0jbMyToIhsn/SuCtqG1tlz5HZnpK7NNPqFxJ
         9yoMjqBgoAKChTSUpK+DYGeqC4cb/QHkv7K2mEkTYam/YS4ILPFobVNDbWMmEn8GKYdb
         3Q/qkrTITuKtNZBImnbb5K/Rp3BvFPAeH8SxB9AVCM/nbI5TjDjrNcZ5bAfxxTzBFP/P
         pVfw==
X-Gm-Message-State: AOAM532Kk/oxQGFZE9Izy+9zcx94l8as+KXMiAM+Dj0KD6o9OblMd7LH
	a4Rmk4YlL4+IOok6Tr/mh5tc2PPCWn+AcJ3z
X-Google-Smtp-Source: 
 ABdhPJw6dKLfRh9hkRuxEDXcKVlClpkhE85gX3yCEz2kiFogik6/qilCSkEqdWmuM0wDtvUX7gUNqA==
X-Received: by 2002:ac2:434a:: with SMTP id
 o10mr24176298lfl.171.1635274113791;
        Tue, 26 Oct 2021 11:48:33 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 g18sm1484841lfv.25.2021.10.26.11.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:48:33 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] hiredis: update to 1.0.2
Date: Tue, 26 Oct 2021 20:48:31 +0200
Message-Id: <20211026184831.1058487-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 18:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93609

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...0001-CMake-configuration-for-hiredis.patch | 117 ------------------
 ...001-Makefile-remove-hardcoding-of-CC.patch |  28 -----
 .../hiredis/hiredis_0.14.0.bb                 |  24 ----
 .../recipes-extended/hiredis/hiredis_1.0.2.bb |  14 +++
 4 files changed, 14 insertions(+), 169 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch
 delete mode 100644 meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
 delete mode 100644 meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
 create mode 100644 meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb

diff --git a/meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch b/meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch
deleted file mode 100644
index 139d13f4c..000000000
--- a/meta-oe/recipes-extended/hiredis/files/0001-CMake-configuration-for-hiredis.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 2dc0c7e4a3fa7ecc92ee5e22f1d8ee48c2b333a8 Mon Sep 17 00:00:00 2001
-From: Thomas Lee <debian@tomlee.co>
-Date: Sun, 4 Nov 2018 22:59:09 +0000
-Subject: [PATCH] CMake configuration for hiredis
-
-Last-Update: 2018-09-26
-
-Upstream-Status: Backport [Ubuntu 20.04]
----
- HiredisConfig.cmake.in        |  5 +++++
- HiredisConfigVersion.cmake.in | 22 ++++++++++++++++++++++
- Makefile                      | 17 ++++++++++++++++-
- 3 files changed, 43 insertions(+), 1 deletion(-)
- create mode 100644 HiredisConfig.cmake.in
- create mode 100644 HiredisConfigVersion.cmake.in
-
-diff --git a/HiredisConfig.cmake.in b/HiredisConfig.cmake.in
-new file mode 100644
-index 0000000..2cce290
---- /dev/null
-+++ b/HiredisConfig.cmake.in
-@@ -0,0 +1,5 @@
-+find_path(HIREDIS_INCLUDE_DIRS hiredis/hiredis.h HINTS "/usr/include")
-+find_library(HIREDIS_LIB_HIREDIS NAMES hiredis HINTS "/usr/lib")
-+
-+set(HIREDIS_LIBRARIES ${HIREDIS_LIB_HIREDIS})
-+
-diff --git a/HiredisConfigVersion.cmake.in b/HiredisConfigVersion.cmake.in
-new file mode 100644
-index 0000000..584144a
---- /dev/null
-+++ b/HiredisConfigVersion.cmake.in
-@@ -0,0 +1,22 @@
-+set(PACKAGE_VERSION "@HIREDIS_VERSION@")
-+
-+string(REPLACE "." ";" HIREDIS_VERSION_COMPONENTS ${PACKAGE_VERSION})
-+string(REPLACE "." ";" REQUESTED_VERSION_COMPONENTS ${PACKAGE_FIND_VERSION})
-+
-+list(GET HIREDIS_VERSION_COMPONENTS 0 HIREDIS_VERSION_MAJOR)
-+list(GET HIREDIS_VERSION_COMPONENTS 1 HIREDIS_VERSION_MINOR)
-+
-+list(GET REQUESTED_VERSION_COMPONENTS 0 REQUESTED_VERSION_MAJOR)
-+list(GET REQUESTED_VERSION_COMPONENTS 1 REQUESTED_VERSION_MINOR)
-+
-+if(("${HIREDIS_VERSION_MAJOR}" EQUAL "${REQUESTED_VERSION_MAJOR}") AND
-+    (("${HIREDIS_VERSION_MINOR}" EQUAL "${REQUESTED_VERSION_MINOR}") OR
-+     ("${HIREDIS_VERSION_MINOR}" GREATER "${REQUESTED_VERSION_MINOR}")))
-+    set(PACKAGE_VERSION_COMPATIBLE TRUE)
-+    if("${PACKAGE_VERSION}" VERSION_EQUAL "${PACKAGE_FIND_VERSION}")
-+        set(PACKAGE_VERSION_EXACT TRUE)
-+    endif()
-+else()
-+    set(PACKAGE_VERSION_COMPATIBLE FALSE)
-+endif()
-+
-diff --git a/Makefile b/Makefile
-index 339727f..43704cd 100644
---- a/Makefile
-+++ b/Makefile
-@@ -8,6 +8,8 @@ EXAMPLES=hiredis-example hiredis-example-libevent hiredis-example-libev hiredis-
- TESTS=hiredis-test
- LIBNAME=libhiredis
- PKGCONFNAME=hiredis.pc
-+CMAKECONFNAME=HiredisConfig.cmake
-+CMAKEVERSNAME=HiredisConfigVersion.cmake
- 
- HIREDIS_MAJOR=$(shell grep HIREDIS_MAJOR hiredis.h | awk '{print $$3}')
- HIREDIS_MINOR=$(shell grep HIREDIS_MINOR hiredis.h | awk '{print $$3}')
-@@ -19,9 +21,11 @@ PREFIX?=/usr/local
- INCLUDE_PATH?=include/hiredis
- LIBRARY_PATH?=lib
- PKGCONF_PATH?=pkgconfig
-+CMAKE_PATH?=cmake/Hiredis
- INSTALL_INCLUDE_PATH= $(DESTDIR)$(PREFIX)/$(INCLUDE_PATH)
- INSTALL_LIBRARY_PATH= $(DESTDIR)$(PREFIX)/$(LIBRARY_PATH)
- INSTALL_PKGCONF_PATH= $(INSTALL_LIBRARY_PATH)/$(PKGCONF_PATH)
-+INSTALL_CMAKE_PATH= $(INSTALL_LIBRARY_PATH)/$(CMAKE_PATH)
- 
- # redis-server configuration used for testing
- REDIS_PORT=56379
-@@ -150,6 +154,7 @@ check: hiredis-test
- 
- clean:
- 	rm -rf $(DYLIBNAME) $(STLIBNAME) $(TESTS) $(PKGCONFNAME) examples/hiredis-example* *.o *.gcda *.gcno *.gcov
-+	rm -f $(CMAKECONFNAME) $(CMAKEVERSNAME)
- 
- dep:
- 	$(CC) -MM *.c
-@@ -169,7 +174,14 @@ $(PKGCONFNAME): hiredis.h
- 	@echo Libs: -L\$${libdir} -lhiredis >> $@
- 	@echo Cflags: -I\$${includedir} -D_FILE_OFFSET_BITS=64 >> $@
- 
--install: $(DYLIBNAME) $(STLIBNAME) $(PKGCONFNAME)
-+$(CMAKECONFNAME): $(CMAKECONFNAME).in
-+	cp $(CMAKECONFNAME).in $(CMAKECONFNAME)
-+
-+$(CMAKEVERSNAME): $(CMAKEVERSNAME).in
-+	sed -e "s,@HIREDIS_VERSION@,$(HIREDIS_MAJOR).$(HIREDIS_MINOR).$(HIREDIS_PATCH),g" \
-+		$(CMAKEVERSNAME).in >$(CMAKEVERSNAME)
-+
-+install: $(DYLIBNAME) $(STLIBNAME) $(PKGCONFNAME) $(CMAKECONFNAME) $(CMAKEVERSNAME)
- 	mkdir -p $(INSTALL_INCLUDE_PATH) $(INSTALL_INCLUDE_PATH)/adapters $(INSTALL_LIBRARY_PATH)
- 	$(INSTALL) hiredis.h async.h read.h sds.h $(INSTALL_INCLUDE_PATH)
- 	$(INSTALL) adapters/*.h $(INSTALL_INCLUDE_PATH)/adapters
-@@ -178,6 +190,9 @@ install: $(DYLIBNAME) $(STLIBNAME) $(PKGCONFNAME)
- 	$(INSTALL) $(STLIBNAME) $(INSTALL_LIBRARY_PATH)
- 	mkdir -p $(INSTALL_PKGCONF_PATH)
- 	$(INSTALL) $(PKGCONFNAME) $(INSTALL_PKGCONF_PATH)
-+	mkdir -p $(INSTALL_CMAKE_PATH)
-+	$(INSTALL) $(CMAKECONFNAME) $(INSTALL_CMAKE_PATH)
-+	$(INSTALL) $(CMAKEVERSNAME) $(INSTALL_CMAKE_PATH)
- 
- 32bit:
- 	@echo ""
--- 
-2.27.0
-
diff --git a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch b/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
deleted file mode 100644
index 1af5d26ac..000000000
--- a/meta-oe/recipes-extended/hiredis/files/0001-Makefile-remove-hardcoding-of-CC.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d13b918a3ff8b0ebfd1e7b18b198b4b45841d720 Mon Sep 17 00:00:00 2001
-From: Andrea Galbusera <gizero@gmail.com>
-Date: Fri, 31 Jul 2015 16:42:08 +0200
-Subject: [PATCH] Makefile: remove hardcoding of CC
-
-* upgrade previous patch to avoid wiping CFLAGS. This fixes build on arm
-platforms which previously caused and issue due to -fPIC being lost
-
-Signed-off-by: Andrea Galbusera <gizero@gmail.com>
----
- Makefile | 5 -----
- 1 file changed, 5 deletions(-)
-
---- a/Makefile
-+++ b/Makefile
-@@ -35,12 +35,6 @@ define REDIS_TEST_CONFIG
- endef
- export REDIS_TEST_CONFIG
- 
--# Fallback to gcc when $CC is not in $PATH.
--CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
--CXX:=$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
--OPTIMIZATION?=-O3
--WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
--DEBUG_FLAGS?= -g -ggdb
- REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG_FLAGS)
- REAL_LDFLAGS=$(LDFLAGS)
- 
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
deleted file mode 100644
index ed8185919..000000000
--- a/meta-oe/recipes-extended/hiredis/hiredis_0.14.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Minimalistic C client library for Redis"
-HOMEPAGE = "http://github.com/redis/hiredis"
-LICENSE = "BSD-3-Clause"
-SECTION = "libs"
-DEPENDS = "redis"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
-SRCREV = "685030652cd98c5414ce554ff5b356dfe8437870"
-SRC_URI = "git://github.com/redis/hiredis;protocol=git \
-           file://0001-Makefile-remove-hardcoding-of-CC.patch \
-           file://0001-CMake-configuration-for-hiredis.patch"
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig
-
-EXTRA_OEMAKE = "PREFIX=${prefix} LIBRARY_PATH=${baselib}"
-
-# By default INSTALL variable in Makefile is equal to 'cp -a', which preserves
-# ownership and causes host-user-contamination QA issue.
-# And PREFIX defaults to /usr/local.
-do_install:prepend() {
-  export INSTALL='cp -r'
-}
diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb
new file mode 100644
index 000000000..9452547f3
--- /dev/null
+++ b/meta-oe/recipes-extended/hiredis/hiredis_1.0.2.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Minimalistic C client library for Redis"
+HOMEPAGE = "http://github.com/redis/hiredis"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d84d659a35c666d23233e54503aaea51"
+SECTION = "libs"
+
+DEPENDS = "redis"
+
+SRC_URI = "git://github.com/redis/hiredis;protocol=git"
+SRCREV = "b731283245f3183af527237166261ad0768ba7d4"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.25.1


