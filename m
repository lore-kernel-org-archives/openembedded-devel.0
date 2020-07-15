Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.3084.1594850761139954536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 15:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pn42afzQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id k17so1991627lfg.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2020 15:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bK+wUasaLSC/Te9KACdPp33tntB6jzfYe/bJaAHu/tI=;
        b=pn42afzQwGmlAu9/8+CN9/z560mfgBN8iBPdkGgtOjkffZDhfGLcdAvVfSaJiBOB1U
         x9gtnusem1h0d78CeO5LJY27xaYTsGIno6o2haGH2ij3xquP8IfK+Idtw6dkMyZ8xa4H
         wUpvGNpQh4RhnmZwXpmmRf1++FKG7sUcSx3RD1BTGsPbQCuJbOmdQN5ncAPn036J2vZ9
         6eprx6qI1FSBfTR5CgQ9Q9xoViAumgfx8xQINe8x/tkhlbQ/DR8yyCheAtvpj7+f6lNK
         z1tAAMA+8RzCKHS7fuWBztNJyrZBF9lXEUCfdggwejKo9X1B5GykiEzf4v212TPaql0w
         VZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bK+wUasaLSC/Te9KACdPp33tntB6jzfYe/bJaAHu/tI=;
        b=oZEiskXzChjGFYZZkMDoRmeJormVLRvFvIJ0lLdpNNteqrZTATXlXtbXiB0zDSqv5y
         Dd3PLeMdqNqwUtoFw30E27MQ8JAcR2juFXCqnFabSXuF65p493Zx59qhb+1iilNthKNu
         dnXF83NpYnczxQGKj69DtLHdmxQMmnqJ2Ehe+TFAN/X2m4Isz/BfDwLVmRsPCOMys6ni
         tgnqpQ/imcv16Jz8OedIqLQfSjNFqqWuZMf1wHsuJLptOtJdon+1Cd80lN/W9M/P7Ce0
         J+pQ3pSst6WDDQHaJDRJMOzTFtai6jGxUgCURv6uWpr03Xl8brrZgriWJSb+phJiPK5V
         mgng==
X-Gm-Message-State: AOAM533S0cruxCnGEin8UohWtFP98pTH3UTrSDLgMwEPIWjK7cfh4KxZ
	zY7aOXrH1YSVnGrIIxYOo/j4kABk4/U=
X-Google-Smtp-Source: ABdhPJwxCkRbyCAreELDjAkpVPEhVxnDR2PUrvQXt2qFtwQtGrKKERXySn+PWhbvcvSy0RwRlOv9dw==
X-Received: by 2002:a19:2209:: with SMTP id i9mr546244lfi.46.1594850758820;
        Wed, 15 Jul 2020 15:05:58 -0700 (PDT)
Return-Path: <dbaryshkov@gmail.com>
Received: from localhost.localdomain ([188.162.64.34])
        by smtp.gmail.com with ESMTPSA id a5sm745231lfh.15.2020.07.15.15.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 15:05:58 -0700 (PDT)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [meta-oe][PATCH v2] recipes-graphics: add Khronos OpenGL ES and Vulkan CTS recipes
Date: Thu, 16 Jul 2020 01:05:56 +0300
Message-Id: <20200715220556.1671129-1-dbaryshkov@gmail.com>
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

