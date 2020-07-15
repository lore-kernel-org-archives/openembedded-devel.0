Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.3083.1594850757083938236
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 15:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WrikPHNG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id k15so1991207lfc.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2020 15:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bK+wUasaLSC/Te9KACdPp33tntB6jzfYe/bJaAHu/tI=;
        b=WrikPHNGh6DQBuYmfexISGqhZso47HnT3f4riBWUc9Gr3FDt+qMTsR7ZYMMyK0L3Jr
         rXPR3lX6qJ8wkpgRjWDVldr0kAv9UMJ8lUzwDBqtZw+SN+7L/evnHKnCVMGSvbVa6Hab
         r0yDRLnIelYatxbKCBFmlbiDDDhNVrCGXWOCNDf57Q2+d7pgEIAm84q3jMOM1uJGxL4Q
         3Jqrrp2tacIdA9Aoou+81l6yrqEhoDDOiXyLTIaJLKXMAidnuFE4CtiSh/j7S+qHqxNb
         Y7g6XWTDyWqKGVzKUEKlvy8wj8rGZzUzZGMY8u45FmsmhYt736kbF8v/RfaVjfTohdDs
         UX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bK+wUasaLSC/Te9KACdPp33tntB6jzfYe/bJaAHu/tI=;
        b=D16jbgP9otQTG0cQmzkCwv6myaEr76kTEawL1v4mt5Flyt+nFKu4xz4P+D9Oh5tjEI
         lE6iwWTV5CHeqv0/uD3YFQ55CqPSBOtf+t+S6AQc5S7a38Y6VWRQ1kMZxCTJi27JC8Jk
         wengyj0FvNGiZKi7FLzYPSw52nasX1+OshTKqBlcHUHoFs2DRCU6lZirm3Z5Juokgjl9
         mctwC2YpGJvoJzaat2WEp/iaQlBfR16DFWB8Tk6bRBzbCqNs/HGWp5bGiD/OFlp/hg17
         BBHmw97u4GR8EEjYkbaGObxqBy2PJsxqUKdtsB16uWhdpL/7AuUdxgQTQmfNOZf765V1
         prLg==
X-Gm-Message-State: AOAM5316ygg7jXKeAno1K6f457zD+dYpAkYHwXqU87TxxObOkDE6LA/p
	bCaV7/8sFYQWFrM9iC4PxFibkpCgCrk=
X-Google-Smtp-Source: ABdhPJzv32BEzS7+oCvhjOch7lqg1y59dkk0qNyHKhG20g+PUT6T9RPjmgMdQHtqftHEFzi8DTA7fw==
X-Received: by 2002:a19:c64e:: with SMTP id w75mr549193lff.64.1594850754598;
        Wed, 15 Jul 2020 15:05:54 -0700 (PDT)
Return-Path: <dbaryshkov@gmail.com>
Received: from localhost.localdomain ([188.162.64.34])
        by smtp.gmail.com with ESMTPSA id h23sm633604lfk.37.2020.07.15.15.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 15:05:53 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [meta-oe][PATCH v2] recipes-graphics: add Khronos OpenGL ES and Vulkan CTS recipes
Date: Thu, 16 Jul 2020 01:05:52 +0300
Message-Id: <20200715220552.1664338-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add recipes packaging OpenGL ES and Vulkan conformance test suite
recipes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../files/fix-clang-private-operator.patch    | 15 ++++++++
 .../vk-gl-cts/files/fix-musl.patch            | 24 +++++++++++++
 .../vk-gl-cts/khronos-cts.inc                 | 36 +++++++++++++++++++
 .../vk-gl-cts/opengl-es-cts_3.2.6.1.bb        | 19 ++++++++++
 .../vk-gl-cts/vulkan-cts_1.2.3.0.bb           | 23 ++++++++++++
 5 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
 create mode 100644 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.0.bb

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
new file mode 100644
index 000000000000..b4573b38b558
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
@@ -0,0 +1,15 @@
+Index: git/external/glslang/src/glslang/Include/PoolAlloc.h
+===================================================================
+--- git.orig/external/glslang/src/glslang/Include/PoolAlloc.h
++++ git/external/glslang/src/glslang/Include/PoolAlloc.h
+@@ -240,8 +240,9 @@ protected:
+ 
+     int numCalls;           // just an interesting statistic
+     size_t totalBytes;      // just an interesting statistic
+-private:
++public:
+     TPoolAllocator& operator=(const TPoolAllocator&);  // don't allow assignment operator
++private:
+     TPoolAllocator(const TPoolAllocator&);  // don't allow default copy constructor
+ };
+ 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
new file mode 100644
index 000000000000..4116ae7d1455
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/files/fix-musl.patch
@@ -0,0 +1,24 @@
+Index: git/framework/delibs/dethread/CMakeLists.txt
+===================================================================
+--- git.orig/framework/delibs/dethread/CMakeLists.txt
++++ git/framework/delibs/dethread/CMakeLists.txt
+@@ -39,6 +39,7 @@ include_directories(
+ 
+ if (DE_OS_IS_UNIX)
+ 	add_definitions(-D_GNU_SOURCE)
++	add_definitions(-D_XOPEN_SOURCE=600)
+ 	set(DETHREAD_LIBS ${DETHREAD_LIBS} pthread)
+ endif ()
+ 
+Index: git/framework/qphelper/CMakeLists.txt
+===================================================================
+--- git.orig/framework/qphelper/CMakeLists.txt
++++ git/framework/qphelper/CMakeLists.txt
+@@ -28,6 +28,7 @@ set(QPHELPER_LIBS
+ if (DE_OS_IS_UNIX OR DE_OS_IS_QNX)
+ 	# For vsnprintf()
+ 	add_definitions(-D_XOPEN_SOURCE=600)
++	set(QPHELPER_LIBS ${QPHELPER_LIBS} execinfo)
+ endif ()
+ 
+ if (DE_OS_IS_WIN32 AND DE_COMPILER_IS_MSC)
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
new file mode 100644
index 000000000000..bd75cdb1f41c
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -0,0 +1,36 @@
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "\
+	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;tag=${BPN}-${PV};name=vk-gl-cts \
+	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
+	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers \
+	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools \
+	https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
+"
+
+S = "${WORKDIR}/git"
+
+SRCREV_FORMAT = "vk-gl-cts"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake
+
+DEPENDS += "libpng zlib virtual/libgles2 virtual/egl"
+
+SRC_URI_append_libc-musl = "\
+	file://fix-musl.patch \
+"
+DEPENDS_append_libc-musl = " libexecinfo"
+
+SRC_URI_append_toolchain-clang = "\
+	file://fix-clang-private-operator.patch \
+"
+
+EXTRA_OECMAKE_append = " -DDEQP_TARGET=surfaceless"
+
+CTSDIR = "/usr/lib/${BPN}"
+
+FILES_${PN} += "${CTSDIR}"
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
new file mode 100644
index 000000000000..3e336e45c3cd
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.6.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "OpenGL CTS"
+
+require khronos-cts.inc
+
+SRCREV_amber = "d26ee22dd7faab1845a531d410f7ec1db407402a"
+SRCREV_glslang = "c538b5d796fb24dd418fdd650c7f76e56bcc3dd8"
+SRCREV_spirv-headers = "e4322e3be589e1ddd44afb20ea842a977c1319b8"
+SRCREV_spirv-tools = "1eb89172a82b436d8037e8a8c29c80f7e1f7df74"
+SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}/${CTSDIR}
+	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
+	rm -r ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
+	rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
+	rm -r ${D}/${CTSDIR}/common/subgroups/*.a ${D}/${CTSDIR}/common/subgroups/cmake_install.cmake ${D}/${CTSDIR}/common/subgroups/CMakeFiles
+}
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.0.bb
new file mode 100644
index 000000000000..77064d4ede16
--- /dev/null
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.2.3.0.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Vulkan CTS"
+
+require khronos-cts.inc
+
+SRCREV_amber = "a40bef4dba98d2d80b48e5a940d8574fbfceb197"
+SRCREV_glslang = "b5f003d7a3ece37db45578a8a3140b370036fc64"
+SRCREV_spirv-headers = "f8bf11a0253a32375c32cad92c841237b96696c0"
+SRCREV_spirv-tools = "d2b486219495594f2e5d0e8d457fc234a3460b3b"
+SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+inherit features_check
+
+DEPENDS += " vulkan-loader"
+
+do_install() {
+	install -d ${D}/${CTSDIR}
+	cp -r ${B}/external/vulkancts/modules/vulkan/* ${D}/${CTSDIR}/
+	rm -r ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
+	rm -r ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
+}
-- 
2.27.0

