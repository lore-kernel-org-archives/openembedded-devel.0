Received: from [203.97.33.68] (helo=smtp5.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1MfoyP-0000GK-Uk
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 07:53:40 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp5.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KOX00AOD3JNDS10@smtp5.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Tue,
	25 Aug 2009 17:35:49 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id 81AEC5CE258	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:35:47 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id 2tv2Q7Z9RUuw	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:35:46 +1200 (NZST)
Received: from [192.168.1.129] (unknown [192.168.1.129])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id DE4715CE14F	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:35:46 +1200 (NZST)
Date: Tue, 25 Aug 2009 17:35:45 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
To: openembedded dev <openembedded-devel@lists.openembedded.org>
Message-id: <4A937831.2000304@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
X-Spam-Flag: NO
X-Spam-Score: -1.44
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-Spam-Status: No, score=-1.44 tagged_above=-99 required=5
	tests=[ALL_TRUSTED=-1.44]
X-Spam-Level: 
Subject: [PATCH] Add toolchain file generation to cmake bbclass
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
X-List-Received-Date: Tue, 25 Aug 2009 05:53:43 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit

It is possible to make cmake use a toolchain file that defines flags, search
paths and any other cmake options.

The main reason for making openembedded generate a toolchain file is
to enable the building of complex packages. Without it a package
requiring Qt4 or boost (or one of many other packages) probably wont find
the right libs and won't build properly.

I have added compiler flags mainly for use outside of openembedded, so I
can copy the generated toolchain file and use it manually.
---
  classes/cmake.bbclass |   67 
++++++++++++++++++++++++++++++++++++++++++++++++-
  1 files changed, 66 insertions(+), 1 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index b5b7b86..38bed63 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -11,6 +11,67 @@ OECMAKE_SOURCEPATH ?= "."
  # "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
  OECMAKE_BUILDPATH ?= ""

+# C/C++ Compiler (without cpu arch/tune arguments)
+OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
+OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
+
+# Compiler flags
+OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${BUILD_CPPFLAGS}"
+OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} 
${BUILD_CPPFLAGS} -fpermissive"
+OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
+OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
+
+
+#
+# Generate cmake toolchain file
+#
+cmake_generate_toolchain_file() {
+  rm -f ${WORKDIR}/toolchain.cmake
+  touch ${WORKDIR}/toolchain.cmake
+
+# CMake system name must be something like "Linux".
+# This is important for cross-compiling.
+  echo "set( CMAKE_SYSTEM_NAME" `echo ${SDK_OS} | sed 's/^./\u&/'` ")" 
 >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )" >> 
${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )" >> 
${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_C_FLAGS \"${OECMAKE_C_FLAGS}\" CACHE STRING 
\"OpenEmbedded CFLAGS\" )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_CXX_FLAGS \"${OECMAKE_CXX_FLAGS}\" CACHE STRING 
\"OpenEmbedded CXXFLAGS\" )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_C_FLAGS_RELEASE \"${OECMAKE_C_FLAGS_RELEASE}\" CACHE 
STRING \"CFLAGS for release\" )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_CXX_FLAGS_RELEASE \"${OECMAKE_CXX_FLAGS_RELEASE}\" 
CACHE STRING \"CXXFLAGS for release\" )" >> ${WORKDIR}/toolchain.cmake
+
+# only search in the paths provided (from openembedded) so cmake doesnt 
pick
+# up libraries and tools from the native build machine
+  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} 
${STAGING_DIR_NATIVE} ${CROSS_DIR} )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )" >> 
${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >> 
${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> 
${WORKDIR}/toolchain.cmake
+# Use native cmake modules
+  echo "set( CMAKE_MODULE_PATH 
${STAGING_DIR_NATIVE}/usr/share/cmake-2.6/Modules/ )" >> 
${WORKDIR}/toolchain.cmake
+
+# Boost libraries have an unusual naming convention thanks to bjam
+  echo "set( Boost_COMPILER \"-gcc\" CACHE STRING \"Boost gcc string\" 
)" >> ${WORKDIR}/toolchain.cmake
+
+# Qt4 support is complex because FindQt4.cmake requires a lot of 
information
+# about the Qt environment.
+  if [ ${QMAKESPEC} ]
+  then
+# In the bbfile inherit one of qmake2/qt4e/qt4x11 and this section will be
+# filled out
+    echo "set( QT_HEADERS_DIR ${OE_QMAKE_INCDIR_QT} CACHE STRING \"Qt4 
include dir\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_LIBRARY_DIR ${OE_QMAKE_LIBDIR_QT} CACHE STRING \"Qt4 
library dir\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_QMAKE_EXECUTABLE ${OE_QMAKE_QMAKE} CACHE STRING 
\"qmake2 binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_MOC_EXECUTABLE ${OE_QMAKE_MOC} CACHE STRING \"Qt4 moc 
binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_UIC_EXECUTABLE ${OE_QMAKE_UIC} CACHE STRING \"Qt4 uic 
binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_UIC3_EXECUTABLE ${OE_QMAKE_UIC3} CACHE STRING \"Qt4 
uic3 binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_RCC_EXECUTABLE ${OE_QMAKE_RCC} CACHE STRING \"Qt4 rcc 
binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_DBUSXML2CPP_EXECUTABLE ${OE_QMAKE_QDBUSXML2CPP} CACHE 
STRING \"Qt4 dbus xml2cpp binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_DBUSCPP2XML_EXECUTABLE ${OE_QMAKE_QDBUSCPP2XML} CACHE 
STRING \"Qt4 dbus cpp2xml binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_LRELEASE_EXECUTABLE ${OE_QMAKE_LRELEASE} CACHE STRING 
\"Qt4 lrelease binary\" )" >> ${WORKDIR}/toolchain.cmake
+    echo "set( QT_LUPDATE_EXECUTABLE ${OE_QMAKE_LUPDATE} CACHE STRING 
\"Qt4 lupdate binary\" )" >> ${WORKDIR}/toolchain.cmake
+  fi
+}
+
+
  cmake_do_configure() {
    if [ ${OECMAKE_BUILDPATH} ]
    then
@@ -18,9 +79,13 @@ cmake_do_configure() {
      cd ${OECMAKE_BUILDPATH}
    fi

+  cmake_generate_toolchain_file
+
    cmake ${OECMAKE_SOURCEPATH} \
+    -DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain.cmake \
      -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
-    -DCMAKE_FIND_ROOT_PATH=${STAGING_DIR_HOST} \
+    -DCMAKE_VERBOSE_MAKEFILE=1 \
+    -DCMAKE_BUILD_TYPE=Release \
      ${EXTRA_OECMAKE} \
      -Wno-dev
  }
--
1.6.3.3



