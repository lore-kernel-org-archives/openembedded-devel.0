Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id BDD6D7C127
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 08:07:50 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id q127so15546668pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 00:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JVJoCjq9NYOixFODjICmgQ9/P3lt6sFjcTO3JidNR+Q=;
	b=mdVZfM5zEaPx0yV96EcZC6lxtio8xOsgeh26BlRgYW1X0aDa3kEy2Ar0NX3yg108Xm
	jF2Gn8EvHr9wuQeQnaWlvO3xkoB9N82HoYgqKYrfebSkik9FPiPejHQmZEMRn0FYJnal
	jUAS+5oltSFaGwyAOgCKWGUk78152eaVKbu+VuYpVjoxrQN5akOp9l64o1AiSrURpRwO
	OIm3U/74OMiaouHPDUJpiAVUl0/s5dt33a6tpIjCNsXI1WaC8V8tfXlMMLYnmmiOVXmr
	XtcCDA3cL2oxbciW8U7UP61Ko6lN3YkA7rIXnjqug8ti9ssYHsNukD0R9kkq5zEDRc9d
	E0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JVJoCjq9NYOixFODjICmgQ9/P3lt6sFjcTO3JidNR+Q=;
	b=dbdASoAG0DKMnKKv97DxejYah/sU4Foe3SDTQ1bsQfuRQtX1XbwcppoGd8Wqe2bZxd
	Ng5YeYspmD4+sNxI4jHUMDwC/fE1lO+fJrHZgtlhftglrb5Uoh/Cr3rOvNBDiHcZrdjd
	xFQ6Zc9lkky+Rr6DL2LHzwS0ZF2q8MrxukSFBJDOQEJG6qqv9KkMYFpL+C1LYwB7TMHq
	KfOP3CRMo29O6RlEfF18s+1d4c2dVcLjU72QmGaehw+zwzjnr04jpFr+tTOyq5aaHUMh
	b1qdtyYRHj7dTKh5rVmfU+tGiP7+2tH7OOT63ztNHjfsKoeyfUBB2FyX8t6DpD6WHrfO
	Q37Q==
X-Gm-Message-State: APjAAAV+GJkHd0gDB9ms3D6N68U4UymIl7uNYnaSbNmQHToQ9qNrxycb
	oKN4lkJoScK1OmeGuTkt+HlGoQQEHFQ=
X-Google-Smtp-Source: APXvYqyP1m028NTtWULDPrLGRwkYCJ/WrqrH48JlCK/3thFbBpJSg9aEB/ifWTd8DjlJtPiPSIkRpg==
X-Received: by 2002:a63:dc0d:: with SMTP id s13mr57139264pgg.129.1577520471373;
	Sat, 28 Dec 2019 00:07:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	r66sm44135124pfc.74.2019.12.28.00.07.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 00:07:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Dec 2019 00:07:40 -0800
Message-Id: <20191228080740.63169-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191228080740.63169-1-raj.khem@gmail.com>
References: <20191228080740.63169-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] fluentbit: Upgrade to 1.3.5
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
X-List-Received-Date: Sat, 28 Dec 2019 08:07:50 -0000
Content-Transfer-Encoding: 8bit

Sync recipe with the one in sourcecode
Record Accessor feature requires Flex and Bison
fts dependency is needed on musl
Delete cmake_multilib.patch its fixed upstream
Mark it systemd-only, since it does not have runtime script for sysvinit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fluentbit/fluentbit/cmake_multilib.patch  | 18 ------
 .../cross-build-init-system-detection.patch   | 38 +++++++++++++
 .../fluentbit/fluentbit/jemalloc.patch        | 16 +++---
 .../fluentbit/fluentbit_0.12.19.bb            | 30 ----------
 .../fluentbit/fluentbit_1.3.5.bb              | 56 +++++++++++++++++++
 5 files changed, 101 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
deleted file mode 100644
index 8fe9f3e703..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/cmake_multilib.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Use CMAKE_INSTALL_LIBDIR instead of hardcoding lib path
-
-Helps build on platforms where libpaths are not lib/ but say lib64/
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -182,7 +182,7 @@ if(NOT FLB_WITHOUT_SHARED_LIB)
-     PROPERTIES OUTPUT_NAME fluent-bit)
- 
-   # Library install routines
--  install(TARGETS fluent-bit-shared LIBRARY DESTINATION lib)
-+  install(TARGETS fluent-bit-shared LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
- endif()
- 
- # Static Library
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
new file mode 100644
index 0000000000..a185789992
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
@@ -0,0 +1,38 @@
+Define CMake variables to indicate init system for target
+incase of cross compile, detecting systemd support based on
+host directory structure is not right thing to do
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.kheem@gmail.com>
+
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -317,7 +317,7 @@ if(FLB_BINARY)
+   install(TARGETS fluent-bit-bin RUNTIME DESTINATION ${FLB_INSTALL_BINDIR})
+ 
+   # Detect init system, install upstart, systemd or init.d script
+-  if(IS_DIRECTORY /lib/systemd/system)
++  if(IS_DIRECTORY /lib/systemd/system OR FLB_SYSTEMD)
+     set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
+     configure_file(
+       "${PROJECT_SOURCE_DIR}/init/systemd.in"
+@@ -325,7 +325,7 @@ if(FLB_BINARY)
+       )
+     install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
+     install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
+-  elseif(IS_DIRECTORY /usr/share/upstart)
++  elseif(IS_DIRECTORY /usr/share/upstart OR FLB_UPSTART)
+     set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
+     configure_file(
+       "${PROJECT_SOURCE_DIR}/init/upstart.in"
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -70,6 +70,8 @@ option(FLB_RECORD_ACCESSOR    "Enable re
+ option(FLB_SYSTEM_STRPTIME    "Use strptime in system libc"  Yes)
+ option(FLB_STATIC_CONF        "Build binary using static configuration")
+ option(FLB_STREAM_PROCESSOR   "Enable Stream Processor"      Yes)
++option(FLB_SYSTEMD            "Enable systemd init system"   No)
++option(FLB_UPSTART            "Enable upstart init system"   No)
+ option(FLB_CORO_STACK_SIZE    "Set coroutine stack size")
+ 
+ # Metrics: Experimental Feature, disabled by default on 0.12 series
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
index abaf92c052..67b3397a6f 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
@@ -3,16 +3,14 @@ Add  --with-jemalloc-prefix=je_ so it compiles on musl
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: fluent-bit-0.12.1/CMakeLists.txt
-===================================================================
---- fluent-bit-0.12.1.orig/CMakeLists.txt
-+++ fluent-bit-0.12.1/CMakeLists.txt
-@@ -325,7 +325,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME}
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -523,7 +523,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME}
    # Link to Jemalloc as an external dependency
    ExternalProject_Add(jemalloc
-     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc
--    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
-+    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc/configure --with-jemalloc-prefix=je_ ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
+     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1
+-    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1/configure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
++    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1/configure ${AUTOCONF_HOST_OPT} --with-jemalloc-prefix=je_ --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
      CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
-     BUILD_COMMAND ${MAKE}
+     BUILD_COMMAND $(MAKE)
      INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
deleted file mode 100644
index 27b910b8be..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_0.12.19.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Fast data collector for Embedded Linux"
-HOMEPAGE = "http://fluentbit.io"
-BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
-
-SRC_URI = "http://fluentbit.io/releases/0.12/fluent-bit-${PV}.tar.gz \
-           file://jemalloc.patch \
-           file://cmake_multilib.patch \
-           "
-SRC_URI[md5sum] = "7c8708312ac9122faacf9e2a4751eb34"
-SRC_URI[sha256sum] = "23a81087edf0e2c6f2d49411c6a82308afc5224f67bbaa45729c057af62e9241"
-
-S = "${WORKDIR}/fluent-bit-${PV}"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
-
-DEPENDS = "zlib"
-INSANE_SKIP_${PN}-dev += "dev-elf"
-
-inherit cmake systemd
-
-EXTRA_OECMAKE = "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
-
-# With Ninja it fails with:
-# ninja: error: build.ninja:134: bad $-escape (literal $ must be written as $$)
-OECMAKE_GENERATOR = "Unix Makefiles"
-
-SYSTEMD_SERVICE_${PN} = "td-agent-bit.service"
-
-TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
new file mode 100644
index 0000000000..4057696edd
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Fast Log processor and Forwarder"
+DESCRIPTION = "Fluent Bit is a data collector, processor and  \
+forwarder for Linux. It supports several input sources and \
+backends (destinations) for your data. \
+"
+
+HOMEPAGE = "http://fluentbit.io"
+BUGTRACKER = "https://github.com/fluent/fluent-bit/issues"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
+SECTION = "net"
+
+SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
+           file://jemalloc.patch \
+           file://cross-build-init-system-detection.patch \
+          "
+SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
+SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
+
+S = "${WORKDIR}/fluent-bit-${PV}"
+DEPENDS = "zlib bison-native flex-native"
+DEPENDS_append_libc-musl = " fts "
+
+INSANE_SKIP_${PN}-dev += "dev-elf"
+
+# Use CMake 'Unix Makefiles' generator
+OECMAKE_GENERATOR ?= "Unix Makefiles"
+
+# Fluent Bit build options
+# ========================
+
+# Host related setup
+EXTRA_OECMAKE += "-DGNU_HOST=${HOST_SYS} -DFLB_ALL=ON -DFLB_TD=1"
+
+# Disable LuaJIT and filter_lua support
+EXTRA_OECMAKE += "-DFLB_LUAJIT=Off -DFLB_FILTER_LUA=Off "
+
+# Disable Library and examples
+EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
+
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On','',d)}"
+
+# Kafka Output plugin (disabled by default): note that when
+# enabling Kafka output plugin, the backend library librdkafka
+# requires 'openssl' as a dependency.
+#
+# DEPENDS += "openssl "
+# EXTRA_OECMAKE += "-DFLB_OUT_KAFKA=On "
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+inherit cmake systemd features_check
+
+SYSTEMD_SERVICE_${PN} = "td-agent-bit.service"
+TARGET_CC_ARCH_append = " ${SELECTED_OPTIMIZATION}"
-- 
2.24.1


