Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f48.google.com (mail-pg0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id DD3C77803F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Sep 2017 00:12:10 +0000 (UTC)
Received: by mail-pg0-f48.google.com with SMTP id m9so7204212pgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZGMByBYPUOxmUfgXOx7oYPmdav0O9OfbULfARaAmxI0=;
	b=BeMZZfjjExHmMpKuHYO92hdeABehr3gZlkxpxMoAb6IRg0b692PcvbjiVucTUEvcR5
	Oa5I9QmKY99M/8+Fv1ziOzKL4NZpkfeX5fiYXYCCQZtMIbrYlxly90aY9PRel5B/Ymrj
	enJn9aPE1eOxNEQbzc4IMKUNzLf6BuLTzyIW3hbsEX6KIVMqT/eH/0s27WjDKV5d3GJg
	iVV7yDo604Mvp4FKUUsrym9SV0kN8TCajUt9CWaahbgbEzZO5jtHeMcV5QOz0G1r/0Ts
	LRoefX4hjvh+rDOaw6PY8E0U/T55ggU67oxIV5EnaFzG2unD7o99vQ1jSasFo6HgQEjq
	WwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZGMByBYPUOxmUfgXOx7oYPmdav0O9OfbULfARaAmxI0=;
	b=NZZt6BVYMozhE0Qj2r97inQ+l8v1ZBFXGR6Dpg0I+ZDP4I7rGsbasDBSYCMZlWOufL
	rQJhVK7JocGgs6ljsBF5amZEngrsUNzI2K6eCOuk7gYO7EIzuGGruYMerS7WO2G122+v
	S3WwwSrrBKbqLaqi5eooZY7lZ9Kx9mZINA87qGsvg8uI+70e9i2ppEMDx8OUv2xQ9SMq
	4vJs/0ws2p4Lwio/RoqPnJqKjHXld6//iw/qxuMWdgqS2ITWhKvM5itVOThmefMhWeHR
	EtRdhpLeLxSq1keGYa10+5anikklmiqbzGwUpUoEBWI+mS+29D68BLreUTnGVIqzcGeG
	sCmw==
X-Gm-Message-State: AHPjjUiAQRaK+0zdItyfczOfiHt+Gw0zmyOqU+4qBH/iF+/mIvO2d0tq
	g9TbXySZEIaEmiwO
X-Google-Smtp-Source: ADKCNb4bTxPKAOF5JCbdm9W/tEVcJtyTVR32AUY467LQMaqKwM+Ft2LQFTH7e0OmXqGB1pVXV7RQig==
X-Received: by 10.98.178.133 with SMTP id z5mr4871928pfl.312.1504915931654;
	Fri, 08 Sep 2017 17:12:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::be3d])
	by smtp.gmail.com with ESMTPSA id m9sm4512330pgt.49.2017.09.08.17.12.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 17:12:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Sep 2017 17:12:03 -0700
Message-Id: <20170909001203.29615-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH V2] fluentbit: Upgrade to 0.12.1
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
X-List-Received-Date: Sat, 09 Sep 2017 00:12:11 -0000

Drop upstreamed patches
Fix jemalloc build with musl
Fix linking errors due to missing -lpthread

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
changes in V2: Added a patch to link in -lpthread to libfluent-bit.so

 ...proxy-go-Add-missing-dependency-on-jemall.patch | 24 ---------------
 ...0001-fluent-bit-shared-Link-with-lpthread.patch | 35 ++++++++++++++++++++++
 ...pack-Add-comment-for-intended-fallthrough.patch | 28 -----------------
 .../fluentbit/fluentbit/jemalloc.patch             | 18 +++++++++++
 .../{fluentbit_0.11.11.bb => fluentbit_0.12.1.bb}  | 10 +++----
 5 files changed, 58 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_0.11.11.bb => fluentbit_0.12.1.bb} (59%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
deleted file mode 100644
index 90242aeb6..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 84d70b6bc744cd348e66a0bc6c7958cdfa9ce670 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Jun 2017 12:56:21 -0700
-Subject: [PATCH] flb-plugin-proxy-go: Add missing dependency on jemalloc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/proxy/go/CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/proxy/go/CMakeLists.txt b/src/proxy/go/CMakeLists.txt
-index 3273346..02a54c2 100644
---- a/src/proxy/go/CMakeLists.txt
-+++ b/src/proxy/go/CMakeLists.txt
-@@ -2,3 +2,6 @@ set(src
-   go.c)
- 
- add_library(flb-plugin-proxy-go STATIC ${src})
-+if(FLB_JEMALLOC)
-+  target_link_libraries(flb-plugin-proxy-go libjemalloc)
-+endif()
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch
new file mode 100644
index 000000000..e9eed24b3
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-fluent-bit-shared-Link-with-lpthread.patch
@@ -0,0 +1,35 @@
+From 62fa9bceb15a9d160dd5d624a6d46907c1019c5c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Sep 2017 17:02:55 -0700
+Subject: [PATCH] fluent-bit-shared: Link with -lpthread
+
+This fixes a reference to pthread_atfork in libfluent-bit.so
+otherwise we get undefined reference to the symbols in binaries
+which are linked with libfluent-bit.so
+
+Fixes errors like
+arm-bec-linux-gnueabi-ld: ../../bin/hello_world: hidden symbol `pthread_atfork' in /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/fluentbit/0.12.1-r0/recipe-sysroot/usr/lib/libpthread_nonshared.a(pthread_atfork.oS) is referenced by DSO
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 425a246..1264e59 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -168,7 +168,7 @@ set(FLB_DEPS
+ # Shared Library
+ if(NOT FLB_WITHOUT_SHARED_LIB)
+   add_library(fluent-bit-shared SHARED ${src})
+-  target_link_libraries(fluent-bit-shared ${FLB_DEPS})
++  target_link_libraries(fluent-bit-shared ${FLB_DEPS} -lpthread)
+   set_target_properties(fluent-bit-shared
+     PROPERTIES OUTPUT_NAME fluent-bit)
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
deleted file mode 100644
index 35cdb18ad..000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-msgpack-Add-comment-for-intended-fallthrough.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d95c2977da074be0d3913e94fb8fb5ed1c64404a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Apr 2017 10:04:03 -0700
-Subject: [PATCH 2/2] msgpack: Add comment for intended fallthrough
-
-Helps fixing build with gcc7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h b/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
-index a6dae6f..651e6c2 100644
---- a/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
-+++ b/lib/msgpack-c-0b7cabd/include/msgpack/unpack_template.h
-@@ -248,7 +248,7 @@ msgpack_unpack_func(int, _execute)(msgpack_unpack_struct(_context)* ctx, const c
- 
-             _fixed_trail_again:
-                 ++p;
--
-+            // fallthrough
-             default:
-                 if((size_t)(pe - p) < trail) { goto _out; }
-                 n = p;  p += trail - 1;
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
new file mode 100644
index 000000000..abaf92c05
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
@@ -0,0 +1,18 @@
+Add  --with-jemalloc-prefix=je_ so it compiles on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: fluent-bit-0.12.1/CMakeLists.txt
+===================================================================
+--- fluent-bit-0.12.1.orig/CMakeLists.txt
++++ fluent-bit-0.12.1/CMakeLists.txt
+@@ -325,7 +325,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME}
+   # Link to Jemalloc as an external dependency
+   ExternalProject_Add(jemalloc
+     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc
+-    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
++    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure --with-jemalloc-prefix=je_ ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
+     CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
+     BUILD_COMMAND ${MAKE}
+     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
similarity index 59%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
index 521d00bf6..e2edd095a 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.11.11.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.1.bb
@@ -2,12 +2,12 @@ SUMMARY = "Fast data collector for Embedded Linux"
 HOMEPAGE = "http://fluentbit.io"
 BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
 
-SRC_URI = "http://fluentbit.io/releases/0.11/fluent-bit-${PV}.tar.gz \
-           file://0001-flb-plugin-proxy-go-Add-missing-dependency-on-jemall.patch \
-           file://0002-msgpack-Add-comment-for-intended-fallthrough.patch \
+SRC_URI = "http://fluentbit.io/releases/0.12/fluent-bit-${PV}.tar.gz \
+           file://jemalloc.patch \
+           file://0001-fluent-bit-shared-Link-with-lpthread.patch \
            "
-SRC_URI[md5sum] = "7bce8091c41fb6412b7fe0185b3cb8d6"
-SRC_URI[sha256sum] = "93b1bdd14db20f2823cd31c6f1a2f3fcb7c94ec3e0c8daefabf130310b7fc4ed"
+SRC_URI[md5sum] = "6b4472cb7e7213a01425af9121576827"
+SRC_URI[sha256sum] = "8ec05365baea723033165687611b3bba3e67a77dce72e282e9f000f7acf9e37b"
 
 S = "${WORKDIR}/fluent-bit-${PV}"
 
-- 
2.14.1


