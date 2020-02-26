Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 51268615FA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:10:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,488,1574092800"; d="scan'208";a="84374108"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Feb 2020 23:10:22 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 3652650A9975
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 23:00:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 26 Feb 2020 23:10:17 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Feb 2020 23:10:00 +0800
Message-ID: <1582729800-707-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3652650A9975.A4C97
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH v3] libharu: New recipe
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
X-List-Received-Date: Wed, 26 Feb 2020 15:10:26 -0000
Content-Type: text/plain

libHaru is a library for generating PDF files.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../libharu/libharu-RELEASE_2_3_0_cmake.patch | 52 +++++++++++++++++++
 .../recipes-support/libharu/libharu_2.3.0.bb  | 23 ++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
 create mode 100644 meta-oe/recipes-support/libharu/libharu_2.3.0.bb

diff --git a/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
new file mode 100644
index 000000000..332be1b3f
--- /dev/null
+++ b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
@@ -0,0 +1,52 @@
+Backport from Fedora Project.
+https://src.fedoraproject.org/rpms/libharu
+
+Fix the install destination of some files.
+
+Upstream-Status: inappropriate
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+
+diff -urp libharu-RELEASE_2_3_0/CMakeLists.txt libharu-RELEASE_2_3_0_cmake/CMakeLists.txt
+--- libharu-RELEASE_2_3_0/CMakeLists.txt	2013-10-30 20:11:59.000000000 +0700
++++ libharu-RELEASE_2_3_0_cmake/CMakeLists.txt	2017-06-01 15:56:06.533552795 +0700
+@@ -25,7 +25,7 @@ endif(MSVC)
+ 
+ # information about libharu
+ set(LIBHPDF_MAJOR 2)
+-set(LIBHPDF_MINOR 2)
++set(LIBHPDF_MINOR 3)
+ set(LIBHPDF_PATCH 0)
+ set(LIBHPDF_VERSION ${LIBHPDF_MAJOR}.${LIBHPDF_MINOR}.${LIBHPDF_PATCH})
+ set(LIBHPDF_DESCRIPTION "libHaru is a free, cross platform, open source library for generating PDF files.")
+@@ -210,9 +210,9 @@ set(
+ install(FILES ${haru_HDRS} DESTINATION include)
+ 
+ # install various files
+-install(FILES README CHANGES INSTALL DESTINATION .)
++install(FILES README CHANGES INSTALL DESTINATION ${SHARE_INSTALL_PREFIX}/libharu)
+ if(NOT DEVPAK)
+-  install(DIRECTORY if DESTINATION .)
++  install(DIRECTORY if DESTINATION ${SHARE_INSTALL_PREFIX}/libharu)
+ endif(NOT DEVPAK)
+ if(DEVPAK)
+   install(FILES ${CMAKE_BINARY_DIR}/libharu.DevPackage DESTINATION .)
+diff -urp libharu-RELEASE_2_3_0/src/CMakeLists.txt libharu-RELEASE_2_3_0_cmake/src/CMakeLists.txt
+--- libharu-RELEASE_2_3_0/src/CMakeLists.txt	2013-10-30 20:11:59.000000000 +0700
++++ libharu-RELEASE_2_3_0_cmake/src/CMakeLists.txt	2017-06-01 16:08:45.425105746 +0700
+@@ -90,11 +90,13 @@ if(LIBHPDF_SHARED)
+   target_link_libraries(${LIBHPDF_NAME} ${ADDITIONAL_LIBRARIES})
+   if(WIN32 AND NOT CYGWIN)
+   	set_target_properties(${LIBHPDF_NAME} PROPERTIES DEFINE_SYMBOL HPDF_DLL_MAKE)
++  else(WIN32 AND NOT CYGWIN)
++  	set_target_properties(${LIBHPDF_NAME} PROPERTIES SOVERSION ${LIBHPDF_VERSION})
+   endif(WIN32 AND NOT CYGWIN)
+   install(
+     TARGETS ${LIBHPDF_NAME}
+-    ARCHIVE DESTINATION lib
+-    LIBRARY DESTINATION lib
++    ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
++    LIBRARY DESTINATION ${LIB_INSTALL_DIR}
+     RUNTIME DESTINATION bin
+   )
+ endif(LIBHPDF_SHARED)
diff --git a/meta-oe/recipes-support/libharu/libharu_2.3.0.bb b/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
new file mode 100644
index 000000000..2d1a37c42
--- /dev/null
+++ b/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "free PDF library"
+HOMEPAGE = "http://libharu.org"
+DESCRIPTION = "libHaru is a library for generating PDF files. \
+               It is free, open source, written in ANSI C and cross platform. "
+
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://README;md5=3ee6bc1f64d9cc7907f44840c8e50cb1"
+
+SRC_URI = "git://github.com/libharu/libharu.git;branch=2_3 \
+           file://libharu-RELEASE_2_3_0_cmake.patch \
+	   "
+
+SRCREV = "4ae1d5f4c84459f130bf1b1ef4c5c330af8eca5d"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+DEPENDS += "libpng zlib"
+
+do_install_append() {
+     mkdir -p ${D}/${datadir}/libharu
+     mv ${D}/libharu ${D}/${datadir}
+}
-- 
2.17.1




