Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOb-0007E5-RI
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:35 +0100
Received: by mail-gw0-f47.google.com with SMTP id 18so96740gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=SL5+bnnuhVcAJ8ttGY6sZGHBPiPbCqkoGNvLCyejwLg=;
	b=BdDyPwSZONW8cVqaD1RE2JUBKZ5UNx/NqFqesG33ee5vkNpwg1Jdzoekw7pNK7Rh+4
	tlxffE0cR8teb2pS77j2SriuZPY+qf4WH39cW1twzhoZfKoEyC4hN7lacV0An+CvMIep
	FgT84mNZSd3eMd4JgQ207Pqf173gQuv/fKkRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=mu5TpJq0B1bARVzI6Gdv2ja9IZRP9G9237BjQ61mYcQgzNmP63I9PoueSyIEiQsunF
	2aMQleRMzOr0f6Mc5rQDdxplLaLghDA8CSsHxO58w2KHfNPBLUYR5SJ4+wBwECgrLnPx
	QJdUIzBxB2ya5Sjok0VyVl8Lf6VSNMrfX/YTM=
Received: by 10.236.109.12 with SMTP id r12mr1869214yhg.32.1298051059127;
	Fri, 18 Feb 2011 09:44:19 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:18 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:28 +0000
Message-Id: <1298051011-10445-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 13/16] cmake: add OE qt4-tools-{native,sdk} support
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:35 -0000

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



