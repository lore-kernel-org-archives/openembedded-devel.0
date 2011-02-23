Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsEW0-0000wn-Ak
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:12:24 +0100
Received: by gxk1 with SMTP id 1so3199525gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=SL5+bnnuhVcAJ8ttGY6sZGHBPiPbCqkoGNvLCyejwLg=;
	b=ZYlfIqFPOuy8EIAqvpMcrKP7u6YcLXhspCbY6r6JG60wjxuc6K9v5q4GDnufHqQaga
	Ponj5/gDaC6XKi1EGxDXvXOoINR0P9hpm56g92fJTlvNgayb6SFuaAntEs5jmSWyJSou
	QzrqBMMcuFsLcuDPl6d8LNaB31ljhsso+6Gww=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=sR3MJM6j8qjZ7id2m6/kAco0cUT7VyRhk4VJB/2wxW9DqDFsApZi0YOanc/LzD1Cme
	PfzwwfU1PVE0+NIN8rYTvW41EN/Cs1uGX0i9SRiF0fTYDfy1ayIAhJUu28xwSAPqH5af
	SDG6YuxFJDBBoRgif+m7TuJJEl2qiE7tQ+8Jw=
Received: by 10.236.111.43 with SMTP id v31mr7302420yhg.23.1298466475438;
	Wed, 23 Feb 2011 05:07:55 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.07.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:07:54 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:15 +0000
Message-Id: <1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 04/14] cmake: add OE qt4-tools-{native,sdk} support
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
X-List-Received-Date: Wed, 23 Feb 2011 13:12:24 -0000

 * make it find qmake2, moc4 and others
 * convert to INC_PR

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../cmake-2.8.3/support-oe-qt4-tools-names.patch   |   85 ++++++++++++++++++++
 recipes/cmake/cmake-native_2.8.3.bb                |    2 +-
 recipes/cmake/cmake-sdk_2.8.3.bb                   |    2 +-
 recipes/cmake/cmake.inc                            |    5 +-
 recipes/cmake/cmake_2.8.3.bb                       |    2 +
 5 files changed, 92 insertions(+), 4 deletions(-)
 create mode 100644 recipes/cmake/cmake-2.8.3/support-oe-qt4-tools-names.patch

diff --git a/recipes/cmake/cmake-2.8.3/support-oe-qt4-tools-names.patch b/recipes/cmake/cmake-2.8.3/support-oe-qt4-tools-names.patch
new file mode 100644
index 0000000..b456923
--- /dev/null
+++ b/recipes/cmake/cmake-2.8.3/support-oe-qt4-tools-names.patch
@@ -0,0 +1,85 @@
+--- a/Modules/FindQt4.cmake
++++ b/Modules/FindQt4.cmake
+@@ -461,7 +461,7 @@
+ # check for qmake
+ # Debian uses qmake-qt4
+ # macports' Qt uses qmake-mac
+-FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake4 qmake-qt4 qmake-mac PATHS
++FIND_PROGRAM(QT_QMAKE_EXECUTABLE NAMES qmake qmake2 qmake4 qmake-qt4 qmake-mac PATHS
+   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Qt3Versions\\4.0.0;InstallDir]/bin"
+   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\4.0.0;InstallDir]/bin"
+   "[HKEY_CURRENT_USER\\Software\\Trolltech\\Versions\\${qt_install_version};InstallDir]/bin"
+@@ -988,13 +988,13 @@
+   ENDIF(QT_QMAKE_CHANGED)
+   
+   FIND_PROGRAM(QT_MOC_EXECUTABLE
+-    NAMES moc-qt4 moc
++    NAMES moc-qt4 moc4 moc
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_UIC_EXECUTABLE
+-    NAMES uic-qt4 uic
++    NAMES uic-qt4 uic4 uic
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+@@ -1006,49 +1006,49 @@
+     )
+ 
+   FIND_PROGRAM(QT_RCC_EXECUTABLE 
+-    NAMES rcc
++    NAMES rcc4 rcc
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_DBUSCPP2XML_EXECUTABLE 
+-    NAMES qdbuscpp2xml
++    NAMES qdbuscpp2xml4 qdbuscpp2xml
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_DBUSXML2CPP_EXECUTABLE 
+-    NAMES qdbusxml2cpp
++    NAMES qdbusxml2cpp4 qdbusxml2cpp
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_LUPDATE_EXECUTABLE
+-    NAMES lupdate-qt4 lupdate
++    NAMES lupdate-qt4 lupdate4 lupdate
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_LRELEASE_EXECUTABLE
+-    NAMES lrelease-qt4 lrelease
++    NAMES lrelease-qt4 lrelease4 lrelease
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_QCOLLECTIONGENERATOR_EXECUTABLE
+-    NAMES qcollectiongenerator-qt4 qcollectiongenerator
++    NAMES qcollectiongenerator-qt4 qcollectiongenerator4 qcollectiongenerator
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_DESIGNER_EXECUTABLE
+-    NAMES designer-qt4 designer
++    NAMES designer-qt4 designer4 designer
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
+ 
+   FIND_PROGRAM(QT_LINGUIST_EXECUTABLE
+-    NAMES linguist-qt4 linguist
++    NAMES linguist-qt4 linguist4 linguist
+     PATHS ${QT_BINARY_DIR}
+     NO_DEFAULT_PATH
+     )
diff --git a/recipes/cmake/cmake-native_2.8.3.bb b/recipes/cmake/cmake-native_2.8.3.bb
index e04885f..fa5e160 100644
--- a/recipes/cmake/cmake-native_2.8.3.bb
+++ b/recipes/cmake/cmake-native_2.8.3.bb
@@ -1,7 +1,7 @@
 inherit native
 require cmake.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
 SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
diff --git a/recipes/cmake/cmake-sdk_2.8.3.bb b/recipes/cmake/cmake-sdk_2.8.3.bb
index 5035b81..2dd7a17 100644
--- a/recipes/cmake/cmake-sdk_2.8.3.bb
+++ b/recipes/cmake/cmake-sdk_2.8.3.bb
@@ -1,7 +1,7 @@
 inherit sdk
 require cmake.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
 SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
diff --git a/recipes/cmake/cmake.inc b/recipes/cmake/cmake.inc
index ef6f5aa..814743e 100644
--- a/recipes/cmake/cmake.inc
+++ b/recipes/cmake/cmake.inc
@@ -5,10 +5,11 @@ DESCRIPTION = "A cross-platform, open-source make system"
 HOMEPAGE = "http://www.cmake.org/"
 LICENSE = "Berkeley-style license"
 SECTION = "console/utils"
-PR = "r2"
+INC_PR = "r2"
 
 CMAKE_MAJOR_VERSION = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz"
+SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://support-oe-qt4-tools-names.patch"
 
 inherit autotools
 
diff --git a/recipes/cmake/cmake_2.8.3.bb b/recipes/cmake/cmake_2.8.3.bb
index 8c96388..cb5f7f7 100644
--- a/recipes/cmake/cmake_2.8.3.bb
+++ b/recipes/cmake/cmake_2.8.3.bb
@@ -1,5 +1,7 @@
 require cmake.inc
 
+PR = "${INC_PR}.0"
+
 inherit cmake
 
 DEPENDS += "curl expat zlib"
-- 
1.7.2.3



