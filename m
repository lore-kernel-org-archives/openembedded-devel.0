Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 267B06A35B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jan 2014 00:03:01 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jan 2014 01:02:55 +0100
Message-Id: <1390521775-32420-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-qt5][PATCH] cmake-native: disable test for Qt5Core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Jan 2014 00:03:02 -0000

Fixes the same build error as 671313d, but for the -native recipe.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../cmake/cmake-native_2.8.12.1.bbappend             | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend

diff --git a/recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend b/recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend
new file mode 100644
index 0000000..ebacf72
--- /dev/null
+++ b/recipes-devtools/cmake/cmake-native_2.8.12.1.bbappend
@@ -0,0 +1,20 @@
+# Ugly hack to work around undefined OE_QMAKE_PATH_EXTERNAL_HOST_BINS variable
+# and possibly missing qmake binary (qtbase-native can be removed from sysroot
+# e.g. in order to upgrade it, even when there is target qtbase)
+
+#| -- Performing Test run_pic_test - Success
+#| CMake Error at tmp-eglibc/sysroots/qemuarm/usr/lib/cmake/Qt5Core/Qt5CoreConfig.cmake:27 (message):
+#|   The imported target "Qt5::Core" references the file
+#|
+#|      "/qmake"
+#|
+#|   but this file does not exist.  Possible reasons include:
+
+do_configure_prepend() {
+    sed -i 's/^find_package(Qt5Core QUIET)$/#find_package(Qt5Core QUIET)/g' ${S}/Tests/RunCMake/CMakeLists.txt
+    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
+    sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutomoc/CMakeLists.txt
+    sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/Qt4And5Automoc/CMakeLists.txt
+    sed -i 's/^  find_package(Qt5Widgets QUIET NO_MODULE)/#  find_package(Qt5Widgets QUIET NO_MODULE)/g' ${S}/Tests/CMakeLists.txt
+    sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
+}
-- 
1.8.3.2


