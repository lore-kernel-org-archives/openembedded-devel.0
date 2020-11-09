Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.16173.1604946866176748833
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:34:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: gpanders.com, ip: 217.70.183.199, mailfrom: greg@gpanders.com)
X-Originating-IP: 98.32.4.57
Received: from localhost.localdomain (c-98-32-4-57.hsd1.nm.comcast.net [98.32.4.57])
	(Authenticated sender: greg@gpanders.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 913BDFF804;
	Mon,  9 Nov 2020 18:34:19 +0000 (UTC)
From: "Gregory Anders" <greg@gpanders.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gregory Anders <greg@gpanders.com>
Subject: [meta-python][PATCH v2] Add suitesparse
Date: Mon,  9 Nov 2020 11:34:16 -0700
Message-Id: <20201109183416.25704-1-greg@gpanders.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Add suitesparse to devtools package group.

 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 ...XXFLAGS-from-environment-in-Mongoose.patch | 43 +++++++++++
 ...serve-links-when-installing-libmetis.patch | 22 ++++++
 ...-Add-version-information-to-libmetis.patch | 49 ++++++++++++
 .../suitesparse/suitesparse_5.8.1.bb          | 77 +++++++++++++++++++
 5 files changed, 192 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
 create mode 100644 meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4d86ef977..c08d32bbd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -276,6 +276,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     rapidjson \
     sip3 \
     squashfs-tools-ng \
+    suitesparse \
     uftrace \
     libxerces-c \
     xerces-c-samples \
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
new file mode 100644
index 000000000..c955b5fa7
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch
@@ -0,0 +1,43 @@
+From 83628b471a1a79dae50bb158fca9448b668dd3a6 Mon Sep 17 00:00:00 2001
+From: Gregory Anders <greg@gpanders.com>
+Date: Wed, 21 Oct 2020 10:43:16 -0600
+Subject: [PATCH] Preserve CXXFLAGS from environment in Mongoose
+
+This allows CXXFLAGS set in the environment to also be used in the CMake
+build process, instead of overwriting them. This is useful in a cross
+compile context where the CXXFLAGS variable might contain necessary
+flags for cross compiling.
+---
+ Mongoose/CMakeLists.txt | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Mongoose/CMakeLists.txt b/Mongoose/CMakeLists.txt
+index 7e134ab..91a7f70 100644
+--- a/Mongoose/CMakeLists.txt
++++ b/Mongoose/CMakeLists.txt
+@@ -321,14 +321,14 @@ add_test(Unit_Test_EdgeSep ./tests/mongoose_unit_test_edgesep)
+ message(STATUS "CMAKE_CXX_COMPILER: " ${BoldBlue} ${CMAKE_CXX_COMPILER_ID} ${ColourReset})
+ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
+     # using Clang
+-    SET(CMAKE_CXX_FLAGS "-O3 -fwrapv")
++    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fwrapv")
+     # Debug flags for Clang
+     SET(CMAKE_CXX_FLAGS_DEBUG "--coverage -g -fwrapv")
+     SET(CMAKE_C_FLAGS_DEBUG "--coverage -g")
+     SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "--coverage -g")
+ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
+     # using GCC
+-    SET(CMAKE_CXX_FLAGS "-O3 -fwrapv")
++    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -fwrapv")
+     # Debug flags for GCC
+     if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.6")
+         set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
+@@ -339,7 +339,7 @@ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
+     SET(CMAKE_EXE_LINKER_FLAGS_DEBUG "-fprofile-arcs -ftest-coverage")
+ elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Intel")
+     # using Intel C++
+-    SET(CMAKE_CXX_FLAGS "-O3 -no-prec-div -xHOST -ipo -fwrapv")
++    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -no-prec-div -xHOST -ipo -fwrapv")
+     # Debug flags for Intel
+     SET(CMAKE_CXX_FLAGS_DEBUG "-g -O0 -Wall -fwrapv")
+     SET(CMAKE_C_FLAGS_DEBUG "-g -O0 -Wall")
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
new file mode 100644
index 000000000..190eaf164
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0002-Preserve-links-when-installing-libmetis.patch
@@ -0,0 +1,22 @@
+From 31175fb408a4f5e85e39a9aabd4a29f9d9c1fe25 Mon Sep 17 00:00:00 2001
+From: Gregory Anders <greg@gpanders.com>
+Date: Wed, 21 Oct 2020 15:26:52 -0600
+Subject: [PATCH] Preserve links when installing libmetis
+
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 7631955..57fd022 100644
+--- a/Makefile
++++ b/Makefile
+@@ -76,7 +76,7 @@ ifeq (,$(MY_METIS_LIB))
+ 	@mkdir -p $(INSTALL_LIB)
+ 	@mkdir -p $(INSTALL_INCLUDE)
+ 	@mkdir -p $(INSTALL_DOC)
+-	- $(CP) lib/libmetis.* $(INSTALL_LIB)
++	- $(CP) -d lib/libmetis.* $(INSTALL_LIB)
+ 	- $(CP) metis-5.1.0/manual/manual.pdf $(INSTALL_DOC)/METIS_manual.pdf
+ 	- $(CP) metis-5.1.0/README.txt $(INSTALL_DOC)/METIS_README.txt
+         # the following is needed only on the Mac, so *.dylib is hardcoded:
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
new file mode 100644
index 000000000..dee6039a8
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse/0003-Add-version-information-to-libmetis.patch
@@ -0,0 +1,49 @@
+From 11ab355fdda93b762fcc07ac3f7c6ab1be0a5f5a Mon Sep 17 00:00:00 2001
+From: Gregory Anders <greg@gpanders.com>
+Date: Wed, 21 Oct 2020 15:27:07 -0600
+Subject: [PATCH] Add version information to libmetis
+
+---
+ metis-5.1.0/Makefile                | 8 ++++----
+ metis-5.1.0/libmetis/CMakeLists.txt | 1 +
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/metis-5.1.0/Makefile b/metis-5.1.0/Makefile
+index 9cc03b9..c445d85 100644
+--- a/metis-5.1.0/Makefile
++++ b/metis-5.1.0/Makefile
+@@ -18,8 +18,11 @@ systype = $(shell uname -s)
+ 
+ BUILDDIR = build/$(systype)-$(cputype)
+ 
++VERNUM=5.1.0
++PKGNAME=metis-$(VERNUM)
++
+ # Process configuration options.
+-CONFIG_FLAGS = 
++CONFIG_FLAGS = -DMETIS_VERSION=$(VERNUM)
+ ifeq ($(gklib_path), not-set)
+     gklib_path = GKlib
+ endif
+@@ -52,9 +55,6 @@ ifneq ($(cc), not-set)
+     CONFIG_FLAGS += -DCMAKE_C_COMPILER=$(cc)
+ endif
+ 
+-VERNUM=5.1.0
+-PKGNAME=metis-$(VERNUM)
+-
+ JOBS ?= 1
+ 
+ define run-config
+diff --git a/metis-5.1.0/libmetis/CMakeLists.txt b/metis-5.1.0/libmetis/CMakeLists.txt
+index 120e94d..11bde87 100644
+--- a/metis-5.1.0/libmetis/CMakeLists.txt
++++ b/metis-5.1.0/libmetis/CMakeLists.txt
+@@ -4,6 +4,7 @@ include_directories(.)
+ file(GLOB metis_sources *.c)
+ # Build libmetis.
+ add_library(metis ${METIS_LIBRARY_TYPE} ${GKlib_sources} ${metis_sources})
++set_target_properties(metis PROPERTIES VERSION ${METIS_VERSION})
+ if(UNIX)
+   target_link_libraries(metis m)
+ endif()
diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
new file mode 100644
index 000000000..af8b1f856
--- /dev/null
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.8.1.bb
@@ -0,0 +1,77 @@
+LICENSE = "GPLv2 & GPLv3 & BSD-3-Clause & LGPL-2.0 & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f9f2b9d61cb769a67c4cd079e1166de7"
+SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
+           file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
+           file://0002-Preserve-links-when-installing-libmetis.patch \
+           file://0003-Add-version-information-to-libmetis.patch \
+           "
+
+SRC_URI[md5sum] = "c414679bbc9432a3def01b31ad921140"
+SRC_URI[sha256sum] = "06726e471fbaa55f792578f9b4ab282ea9d008cf39ddcc3b42b73400acddef40"
+
+SRCREV = "v${PV}"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "cmake-native lapack gmp mpfr chrpath-native"
+
+PROVIDES = "mongoose graphblas"
+RPROVIDES_${PN} = "mongoose graphblas"
+
+# The values of $CC, $CXX, and $LD that Bitbake uses have spaces in them which
+# causes problems when the SuiteSparse Makefiles try to pass these values on
+# the command line. To get around this problem, set these variables to only the
+# program name and prepend the rest of the value onto the corresponding FLAGS
+# variable.
+CFLAGS_prepend := "${@" ".join(d.getVar('CC', True).split()[1:])} "
+export CC := "${@d.getVar('CC', True).split()[0]}"
+
+CXXFLAGS_prepend := "${@" ".join(d.getVar('CXX', True).split()[1:])} "
+export CXX := "${@d.getVar('CXX', True).split()[0]}"
+
+LDFLAGS_prepend := "${@" ".join(d.getVar('LD', True).split()[1:])} "
+export LD := "${@d.getVar('LD', True).split()[0]}"
+
+export CMAKE_OPTIONS = " \
+    -DCMAKE_INSTALL_PREFIX=${D}${prefix} \
+    -DCMAKE_INSTALL_LIBDIR=${baselib} \
+"
+
+do_compile () {
+	oe_runmake library
+}
+
+do_install () {
+	oe_runmake prefix=${D}${prefix} INSTALL=${D}${prefix} install
+
+        # Remove runtime paths from shared libraries
+        for file in ${D}${libdir}/*.so.*; do
+            if [ ! -L "$file" ]; then
+                chrpath -d "$file"
+            fi
+        done
+}
+
+FILES_${PN} += " \
+    ${libdir}/libmongoose.so.* \
+    ${libdir}/libgraphblas.so.* \
+    ${libdir}/libmetis.so.* \
+    ${libdir}/libsuitesparseconfig.so.* \
+    ${libdir}/libamd.so.* \
+    ${libdir}/libbtf.so.* \
+    ${libdir}/libcamd.so.* \
+    ${libdir}/libccolamd.so.* \
+    ${libdir}/libcolamd.so.* \
+    ${libdir}/libcholmod.so.* \
+    ${libdir}/libcxsparse.so.* \
+    ${libdir}/libldl.so.* \
+    ${libdir}/libklu.so.* \
+    ${libdir}/libumfpack.so.* \
+    ${libdir}/librbio.so.* \
+    ${libdir}/libspqr.so.* \
+    ${libdir}/libsliplu.so.* \
+    ${bindir}/mongoose \
+"
+
+FILES_${PN}-staticdev += "${libdir}/libmongoose.a"
+FILES_${PN}-dev += "${includedir} ${libdir}/*.so"
-- 
2.29.2

