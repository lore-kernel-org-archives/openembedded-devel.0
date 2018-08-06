Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56F8874FAE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 08:54:20 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w768sKW6011169
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 01:54:20 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 01:54:20 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 01:54:01 -0700
Message-Id: <20180806085408.44739-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
Subject: [meta-xfce][PATCH 03/10] xfce4-hotcorner-plugin: fix library install path
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
X-List-Received-Date: Mon, 06 Aug 2018 08:54:20 -0000

The library install path may be ${CMAKE_INSTALL_PREFIX}/lib64 rather
than fixed ${CMAKE_INSTALL_PREFIX}/lib. Add a variable in CMakeLists.txt
to make it could be overrode by cmake command line. And it is overridden
with ${baselib} in meta-oe.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...1-CMakeLists.txt-fix-library-install-path.patch | 39 ++++++++++++++++++++++
 .../hotcorner/xfce4-hotcorner-plugin_0.0.2.bb      |  5 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch

diff --git a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch
new file mode 100644
index 000000000..df348dc85
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch
@@ -0,0 +1,39 @@
+Upstream-Status: Submitted [https://github.com/brianhsu/xfce4-hotcorner-plugin/pull/8]
+
+The library install path may be ${CMAKE_INSTALL_PREFIX}/lib64 rather
+than fixed ${CMAKE_INSTALL_PREFIX}/lib. Provide a variable to make it
+could override by cmake command line.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ CMakeLists.txt | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e193787..84cb52d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10,8 +10,9 @@ include(GNUInstallDirs)
+ 
+ PKG_CHECK_MODULES(GTK REQUIRED libxfce4panel-1.0 libxfce4ui-1 libwnck-3.0)
+ 
+-set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
+-set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
++set(BASE_LIB_PATH "lib" CACHE STRING "base library install path")
++set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${BASE_LIB_PATH})
++set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/${BASE_LIB_PATH})
+ set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
+  
+ INCLUDE_DIRECTORIES(${GTK_INCLUDE_DIRS})
+@@ -28,7 +29,7 @@ ADD_LIBRARY(hotcorner SHARED src/hotcorner.c src/util.c)
+  
+ TARGET_LINK_LIBRARIES(hotcorner ${GTK_LIBRARIES})
+ 
+-INSTALL(TARGETS hotcorner  LIBRARY DESTINATION lib/xfce4/panel/plugins/)
++INSTALL(TARGETS hotcorner  LIBRARY DESTINATION ${BASE_LIB_PATH}/xfce4/panel/plugins/)
+ INSTALL(FILES hotcorner.desktop DESTINATION share/xfce4/panel/plugins/)
+ GETTEXT_CREATE_TRANSLATIONS(po/xfce4-hotcorner-plugin.pot ALL po/zh_TW.po)
+ 
+-- 
+2.11.0
+
diff --git a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
index f86c92ed2..57a815b1b 100644
--- a/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
+++ b/meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotcorner-plugin_0.0.2.bb
@@ -6,6 +6,9 @@ inherit xfce-panel-plugin cmake
 
 DEPENDS += "libwnck3"
 
-SRC_URI = "https://github.com/brianhsu/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/brianhsu/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.gz \
+           file://0001-CMakeLists.txt-fix-library-install-path.patch"
 SRC_URI[md5sum] = "ac31b45cda1867cb6bd69bb285638263"
 SRC_URI[sha256sum] = "942684c92f96a158e1417e597947f822769ac56aa1993a8c9f166ee633ef2b8d"
+
+EXTRA_OECMAKE = "-DBASE_LIB_PATH=${baselib}"
-- 
2.11.0


