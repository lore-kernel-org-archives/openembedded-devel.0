Received: from [128.178.224.226] (helo=smtp3.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1MgMaH-0002zv-SX
	for openembedded-devel@openembedded.org; Wed, 26 Aug 2009 19:46:57 +0200
Received: (qmail 6622 invoked by uid 107); 26 Aug 2009 17:28:55 -0000
X-Virus-Scanned: ClamAV
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp3.epfl.ch (AngelmatoPhylax SMTP proxy);
	Wed, 26 Aug 2009 19:28:55 +0200
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2009 19:28:50 +0200
Message-Id: <1251307730-5802-1-git-send-email-valentin.longchamp@epfl.ch>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <4A956F2C.70301@epfl.ch>
References: <4A956F2C.70301@epfl.ch>
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
X-List-Received-Date: Wed, 26 Aug 2009 17:46:58 -0000

Based on work done by Matthew Dombroski.
We want to generate a toolchain file for cmake compilations. This
adds a task that is performed before the configure task.

Additional defines can be made in the toolchain file directly in
the recipe file by using a do_generate_toolchain_file_append().
This is especially interesting for recipes that need to define
values for additionnal libraries.

Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
---
 classes/cmake.bbclass |   28 ++++++++++++++++++++++++++--
 1 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index b5b7b86..36ed709 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -11,6 +11,29 @@ OECMAKE_SOURCEPATH ?= "."
 # "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
 OECMAKE_BUILDPATH ?= ""
 
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
@@ -20,9 +43,10 @@ cmake_do_configure() {
 
   cmake ${OECMAKE_SOURCEPATH} \
     -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-    -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
+    -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
+    -DCMAKE_VERBOSE_MAKEFILE=1 \
     ${EXTRA_OECMAKE} \
     -Wno-dev
 }
 
-EXPORT_FUNCTIONS do_configure
+EXPORT_FUNCTIONS do_configure do_generate_toolchain_file
-- 
1.6.0.4



