Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1N0xSW-000151-8i
	for openembedded-devel@openembedded.org; Thu, 22 Oct 2009 15:12:07 +0200
Received: (qmail 6742 invoked by uid 107); 22 Oct 2009 13:11:00 -0000
X-Virus-Scanned: ClamAV
Received: from lsro1pc40.epfl.ch (128.178.145.86) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 22 Oct 2009 15:11:00 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 15:08:31 +0200
Message-Id: <1256216911-693-2-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1256216911-693-1-git-send-email-valentin.longchamp@epfl.ch>
References: <1256216911-693-1-git-send-email-valentin.longchamp@epfl.ch>
X-SA-Exim-Connect-IP: 128.178.224.219
X-SA-Exim-Mail-From: valentin.longchamp@epfl.ch
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Valentin Longchamp <valentin.longchamp@epfl.ch>
Subject: [PATCH 1/1] add toolchain file for cmake compilations
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2009 13:12:07 -0000

Based on work done by Matthew Dombroski.
We want to generate a toolchain file for cmake compilations. This
adds a task that is performed before the configure task.

Additional defines can be made in the toolchain file directly in
the recipe file by using a do_generate_toolchain_file_append().
This is especially interesting for recipes that need to define
values for additionnal libraries.

Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
---
 classes/cmake.bbclass |   39 +++++++++++++++++++++++++++++++++++++--
 1 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index b5b7b86..e3ec533 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -11,6 +11,39 @@ OECMAKE_SOURCEPATH ?= "."
 # "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
 OECMAKE_BUILDPATH ?= ""
 
+# C/C++ Compiler (without cpu arch/tune arguments)
+OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+
+# Compiler flags
+OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${BUILD_CPPFLAGS}"
+OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${BUILD_CPPFLAGS} -fpermissive"
+OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
+OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
+
+cmake_do_generate_toolchain_file() {
+# CMake system name must be something like "Linux".
+# This is important for cross-compiling.
+  echo "set( CMAKE_SYSTEM_NAME" `echo ${SDK_OS} | sed 's/^./\u&/'` ")" > ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_C_FLAGS \"${OECMAKE_C_FLAGS}\" CACHE STRING \"OpenEmbedded CFLAGS\" )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_CXX_FLAGS \"${OECMAKE_CXX_FLAGS}\" CACHE STRING \"OpenEmbedded CXXFLAGS\" )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_C_FLAGS_RELEASE \"${OECMAKE_C_FLAGS_RELEASE}\" CACHE STRING \"CFLAGS for release\" )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_CXX_FLAGS_RELEASE \"${OECMAKE_CXX_FLAGS_RELEASE}\" CACHE STRING \"CXXFLAGS for release\" )" >> ${WORKDIR}/toolchain.cmake
+
+# only search in the paths provided (from openembedded) so cmake doesnt pick
+# up libraries and tools from the native build machine
+  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
+# Use native cmake modules
+  echo "set( CMAKE_MODULE_PATH ${STAGING_DIR_NATIVE}/usr/share/cmake-2.6/Modules/ )" >> ${WORKDIR}/toolchain.cmake
+}
+
+addtask generate_toolchain_file after do_patch before do_configure
+
 cmake_do_configure() {
   if [ ${OECMAKE_BUILDPATH} ]
   then
@@ -20,9 +53,11 @@ cmake_do_configure() {
 
   cmake ${OECMAKE_SOURCEPATH} \
     -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-    -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
+    -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
+    -DCMAKE_VERBOSE_MAKEFILE=1 \
     ${EXTRA_OECMAKE} \
     -Wno-dev
+
 }
 
-EXPORT_FUNCTIONS do_configure
+EXPORT_FUNCTIONS do_configure do_generate_toolchain_file
-- 
1.6.0.4



