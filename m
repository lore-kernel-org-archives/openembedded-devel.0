Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BAE2478239
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 07:26:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y206so1379147wmd.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 00:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4LP6pfvsYG26dpdhBpCyqJIZZ5aPLisWEYreZodh4pc=;
	b=koFPZo9LzVk7t6VKY83yHoqjVTW31QRZKP97dt0nGTlZVttCNL4TqrgsipHBSUSOay
	2VY6EmH0Wy4dPXeU34lNkYgdGAAGaG2KDpruTD6HfKxRpnVCF5m1oa86lvo/bg69/O0Z
	DJhFF7qM1r6doJF/ghfgXzgLBtoSWYX7VK1tdHyXrf9uZP9lytMPATSY9sttmIC9+noE
	p6yfucX5jOrB1pwDl9h0+EZBr4HuIqa+Wfm/n/Xj9o96doCaIuJn+KNVYXgL4cabhayN
	5a45gfYpP6RmpD1VNlAX1VFyNjkpbkOifkXEcPQ7DgQrJBnrefYf8My8cnjjCSzy/Dih
	X18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4LP6pfvsYG26dpdhBpCyqJIZZ5aPLisWEYreZodh4pc=;
	b=DzTOSSvX68zFR5jjzgPJcVAspYY94ZBjnA/xsQ3FaH42SFVuzKX8GJk7qkNIvyCu8d
	oiJYBXDbfrVzM3bo8BSp38EOWdvRL5w35Tqv4JsyO2DErDqiTe7OUOgReOKsLaoWKOEN
	bC8clGXxhjHWs5Rv4YKilpnPC31EM4ZCUQBpP2dM2tTxw/N1CyIZuuxHsgN964gRg8Tj
	0NyUQyXDpfOqJktCBS7TFg4OT4qeUmIObluIERSyVEkfMpz6YaOGZawrSt5yvUlkE+E5
	337jiRm4x4nyQnx72cCS8q5YFJvXnWGNhwkadoGSgxqGw3JUyLqbVhk3MI4U0c0JnxXn
	azww==
X-Gm-Message-State: AHYfb5hWETrgShl6BA9vui2Plb3wn6eu8w0Kk4OVSUvJMKldSPSNt7xL
	VeXsRMLxuEPIt4gH
X-Received: by 10.80.183.219 with SMTP id i27mr771746ede.137.1503473193198;
	Wed, 23 Aug 2017 00:26:33 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.88])
	by smtp.gmail.com with ESMTPSA id y94sm564345ede.18.2017.08.23.00.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Aug 2017 00:26:31 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Aug 2017 09:26:13 +0200
Message-Id: <1503473173-12677-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-clang] [PATCH] clang: fix nativesdk build
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
X-List-Received-Date: Wed, 23 Aug 2017 07:26:33 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

I could not manage to build nativesdk-clang, I encountered errors as
follows: (trimmed for purpose)
| ../gcc/x86_64-pokysdk-linux/6.3.0/ld::
| cannot find crt1.o: No such file or directory
| cannot find crtbegin.o: No such file or directory
| cannot find -lgcc
| cannot find -lgcc_s

After some investigation, I found it's caused by the llvm native tools
could not compile with crosssdk toolchains. (special linking flags
are needed)

So we introduce a cmake-native class with a task to generate a native
toolchain file, it will be used to build llvm native tools by passed
with CROSS_TOOLCHAIN_FLAGS_NATIVE.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 classes/cmake-native.bbclass        | 47 +++++++++++++++++++++++++++++++++++++
 recipes-devtools/clang/clang_git.bb |  3 ++-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 classes/cmake-native.bbclass

diff --git a/classes/cmake-native.bbclass b/classes/cmake-native.bbclass
new file mode 100644
index 0000000..911476e
--- /dev/null
+++ b/classes/cmake-native.bbclass
@@ -0,0 +1,47 @@
+# We need to unset CCACHE otherwise cmake gets too confused
+CCACHE = ""
+
+# Native C/C++ compiler (without cpu arch/tune arguments)
+OECMAKE_NATIVE_C_COMPILER ?= "`echo ${BUILD_CC} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_NATIVE_CXX_COMPILER ?= "`echo ${BUILD_CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_NATIVE_AR ?= "${BUILD_AR}"
+
+# Native compiler flags
+OECMAKE_NATIVE_C_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CFLAGS}"
+OECMAKE_NATIVE_CXX_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS}"
+OECMAKE_NATIVE_C_FLAGS_RELEASE ?= "-DNDEBUG"
+OECMAKE_NATIVE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
+OECMAKE_NATIVE_C_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CPPFLAGS} ${BUILD_LDFLAGS}"
+OECMAKE_NATIVE_CXX_LINK_FLAGS ?= "${BUILD_CC_ARCH} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}"
+BUILD_CXXFLAGS += "${BUILD_CC_ARCH}"
+BUILD_CFLAGS += "${BUILD_CC_ARCH}"
+
+do_generate_native_toolchain_file() {
+        cat > ${WORKDIR}/toolchain-native.cmake <<EOF
+set( CMAKE_SYSTEM_NAME `echo ${BUILD_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
+set( CMAKE_SYSTEM_PROCESSOR ${BUILD_ARCH} )
+set( CMAKE_C_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
+set( CMAKE_CXX_COMPILER ${OECMAKE_NATIVE_CXX_COMPILER} )
+set( CMAKE_ASM_COMPILER ${OECMAKE_NATIVE_C_COMPILER} )
+set( CMAKE_AR ${OECMAKE_NATIVE_AR} CACHE FILEPATH "Archiver" )
+set( CMAKE_C_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "CFLAGS" )
+set( CMAKE_CXX_FLAGS "${OECMAKE_NATIVE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
+set( CMAKE_ASM_FLAGS "${OECMAKE_NATIVE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
+set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE STRING "Additional CFLAGS for release" )
+set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_NATIVE_CXX_FLAGS_RELEASE}" CACHE STRING "Additional CXXFLAGS for release" )
+set( CMAKE_ASM_FLAGS_RELEASE "${OECMAKE_NATIVE_C_FLAGS_RELEASE}" CACHE STRING "Additional ASM FLAGS for release" )
+set( CMAKE_C_LINK_FLAGS "${OECMAKE_NATIVE_C_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
+set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_NATIVE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
+
+set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_NATIVE} )
+set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+
+# Use native cmake modules
+list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR_NATIVE}/cmake/Modules/")
+EOF
+}
+
+addtask generate_native_toolchain_file after do_patch before do_configure
diff --git a/recipes-devtools/clang/clang_git.bb b/recipes-devtools/clang/clang_git.bb
index fb7854c..c226093 100644
--- a/recipes-devtools/clang/clang_git.bb
+++ b/recipes-devtools/clang/clang_git.bb
@@ -27,7 +27,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake cmake-native
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
 
@@ -85,6 +85,7 @@ EXTRA_OECMAKE_append_class-native = "\
 "
 EXTRA_OECMAKE_append_class-nativesdk = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
+                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                   -DCLANG_TABLEGEN=${STAGING_BINDIR_NATIVE}/clang-tblgen \
-- 
2.7.4


