Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PqUOX-0007E5-9t
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 18:45:29 +0100
Received: by mail-gw0-f47.google.com with SMTP id 18so96740gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 09:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=GmGZX1AeFfZg3E6dcYD9LHARz1J2eCecmNXFED86HQQ=;
	b=JLtlawFvsjUsbkTKA2wiKhAX31Re2QCdHS0hToQcBFvcHEDQuFaCmheueH0kdzuBQu
	MH5C8leP5O4VD/eml1YvJhUG98zpJDhplKRmZuySG9ZnvDnmX3gUCZv5TQKPHJG/pnLv
	HCGbU8y8DsU628uEeLlXk0YlCJgv5NFMU8wqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ArEkeaSzMo8zp2mPtjYYBHsS0lZd3twNAHhcqXP+BNFzCHfN+fQMUsNGNjp/gVI5eS
	KfFYmaaA7Ql3h/n+38qpbvhqRj1JvWi8ScW0aKXXAusKH8qzM95R8eRPDfOr/rSU0eqE
	zYAWnh4VxbC24k3Jk3ombK8sgKLmDFkCA/deU=
Received: by 10.150.7.2 with SMTP id 2mr941707ybg.437.1298051056808;
	Fri, 18 Feb 2011 09:44:16 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 23sm1480538yhl.23.2011.02.18.09.44.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Feb 2011 09:44:15 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Feb 2011 17:43:27 +0000
Message-Id: <1298051011-10445-13-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
References: <1298051011-10445-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 12/16] cmake: update from 2.8.2 to 2.8.3
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
X-List-Received-Date: Fri, 18 Feb 2011 17:45:29 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../cmake-2.8.2/dont-run-cross-binaries.patch      |   13 ------
 .../cmake-2.8.3/dont-run-cross-binaries.patch      |   13 ++++++
 recipes/cmake/cmake-native_2.8.2.bb                |   12 -----
 recipes/cmake/cmake-native_2.8.3.bb                |   12 +++++
 recipes/cmake/cmake-sdk_2.8.2.bb                   |   12 -----
 recipes/cmake/cmake-sdk_2.8.3.bb                   |   12 +++++
 recipes/cmake/cmake_2.8.2.bb                       |   46 --------------------
 recipes/cmake/cmake_2.8.3.bb                       |   46 ++++++++++++++++++++
 8 files changed, 83 insertions(+), 83 deletions(-)
 delete mode 100644 recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch
 create mode 100644 recipes/cmake/cmake-2.8.3/dont-run-cross-binaries.patch
 delete mode 100644 recipes/cmake/cmake-native_2.8.2.bb
 create mode 100644 recipes/cmake/cmake-native_2.8.3.bb
 delete mode 100644 recipes/cmake/cmake-sdk_2.8.2.bb
 create mode 100644 recipes/cmake/cmake-sdk_2.8.3.bb
 delete mode 100644 recipes/cmake/cmake_2.8.2.bb
 create mode 100644 recipes/cmake/cmake_2.8.3.bb

diff --git a/recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch b/recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch
deleted file mode 100644
index 4a006f9..0000000
--- a/recipes/cmake/cmake-2.8.2/dont-run-cross-binaries.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff -ru cmake-2.8.2.orig/CMakeLists.txt cmake-2.8.2/CMakeLists.txt
---- cmake-2.8.2.orig/CMakeLists.txt	2010-07-28 00:48:42.000000000 +0200
-+++ cmake-2.8.2/CMakeLists.txt	2010-07-28 01:05:17.000000000 +0200
-@@ -518,7 +518,8 @@
- 
- # build the remaining subdirectories
- ADD_SUBDIRECTORY(Source)
--ADD_SUBDIRECTORY(Utilities)
-+# Come on! Running the cross-binaries on host is not a good idea.
-+#ADD_SUBDIRECTORY(Utilities)
- ADD_SUBDIRECTORY(Tests)
- 
- # add a test
diff --git a/recipes/cmake/cmake-2.8.3/dont-run-cross-binaries.patch b/recipes/cmake/cmake-2.8.3/dont-run-cross-binaries.patch
new file mode 100644
index 0000000..4a006f9
--- /dev/null
+++ b/recipes/cmake/cmake-2.8.3/dont-run-cross-binaries.patch
@@ -0,0 +1,13 @@
+diff -ru cmake-2.8.2.orig/CMakeLists.txt cmake-2.8.2/CMakeLists.txt
+--- cmake-2.8.2.orig/CMakeLists.txt	2010-07-28 00:48:42.000000000 +0200
++++ cmake-2.8.2/CMakeLists.txt	2010-07-28 01:05:17.000000000 +0200
+@@ -518,7 +518,8 @@
+ 
+ # build the remaining subdirectories
+ ADD_SUBDIRECTORY(Source)
+-ADD_SUBDIRECTORY(Utilities)
++# Come on! Running the cross-binaries on host is not a good idea.
++#ADD_SUBDIRECTORY(Utilities)
+ ADD_SUBDIRECTORY(Tests)
+ 
+ # add a test
diff --git a/recipes/cmake/cmake-native_2.8.2.bb b/recipes/cmake/cmake-native_2.8.2.bb
deleted file mode 100644
index c7b3d80..0000000
--- a/recipes/cmake/cmake-native_2.8.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit native
-require cmake.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "8c967d5264657a798f22ee23976ff0d9"
-SRC_URI[sha256sum] = "766ff169af798599d7dd42e41e9f4533d73942a2bb928235115412dce5b81406"
-
-do_configure_append () {
-        sed -e 's/BUILD_CursesDialog:BOOL=ON/BUILD_CursesDialog:BOOL=OFF/' \
-                -i CMakeCache.txt
-}
diff --git a/recipes/cmake/cmake-native_2.8.3.bb b/recipes/cmake/cmake-native_2.8.3.bb
new file mode 100644
index 0000000..e04885f
--- /dev/null
+++ b/recipes/cmake/cmake-native_2.8.3.bb
@@ -0,0 +1,12 @@
+inherit native
+require cmake.inc
+
+PR = "r1"
+
+SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
+SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
+
+do_configure_append () {
+        sed -e 's/BUILD_CursesDialog:BOOL=ON/BUILD_CursesDialog:BOOL=OFF/' \
+                -i CMakeCache.txt
+}
diff --git a/recipes/cmake/cmake-sdk_2.8.2.bb b/recipes/cmake/cmake-sdk_2.8.2.bb
deleted file mode 100644
index 2c51a49..0000000
--- a/recipes/cmake/cmake-sdk_2.8.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-inherit sdk
-require cmake.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "8c967d5264657a798f22ee23976ff0d9"
-SRC_URI[sha256sum] = "766ff169af798599d7dd42e41e9f4533d73942a2bb928235115412dce5b81406"
-
-do_configure_append () {
-        sed -e 's/BUILD_CursesDialog:BOOL=ON/BUILD_CursesDialog:BOOL=OFF/' \
-                -i CMakeCache.txt
-}
diff --git a/recipes/cmake/cmake-sdk_2.8.3.bb b/recipes/cmake/cmake-sdk_2.8.3.bb
new file mode 100644
index 0000000..5035b81
--- /dev/null
+++ b/recipes/cmake/cmake-sdk_2.8.3.bb
@@ -0,0 +1,12 @@
+inherit sdk
+require cmake.inc
+
+PR = "r1"
+
+SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
+SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
+
+do_configure_append () {
+        sed -e 's/BUILD_CursesDialog:BOOL=ON/BUILD_CursesDialog:BOOL=OFF/' \
+                -i CMakeCache.txt
+}
diff --git a/recipes/cmake/cmake_2.8.2.bb b/recipes/cmake/cmake_2.8.2.bb
deleted file mode 100644
index 41ba813..0000000
--- a/recipes/cmake/cmake_2.8.2.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-require cmake.inc
-
-inherit cmake
-
-DEPENDS += "curl expat zlib"
-
-SRC_URI += "file://dont-run-cross-binaries.patch"
-
-# Strip ${prefix} from ${docdir}, set result into docdir_stripped
-python () {
-    prefix=bb.data.getVar("prefix", d, 1)
-    docdir=bb.data.getVar("docdir", d, 1)
-
-    if not docdir.startswith(prefix):
-	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
-
-    docdir_stripped = docdir[len(prefix):]
-    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
-	docdir_stripped = docdir_stripped[1:]
-
-    bb.data.setVar("docdir_stripped", docdir_stripped, d)
-}
-
-EXTRA_OECMAKE=" \
-# Override default "doc" (this is relative to ${prefix})
-    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-2.8 \
-# Using system libs spares us some cmake cross trouble.
-    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
-# This is compiler & target dependant, but it seems cmake does not in fact use this value.
-    -DKWSYS_CHAR_IS_SIGNED=1 \
-# This disables large file support. Hopefully nobody processes >2G files on the target.
-# If you want to enable this, add -DWKSYS_LFS_WORKS=1
-    -DKWSYS_LFS_DISABLE=1 \
-"
-
-SRC_URI[md5sum] = "8c967d5264657a798f22ee23976ff0d9"
-SRC_URI[sha256sum] = "766ff169af798599d7dd42e41e9f4533d73942a2bb928235115412dce5b81406"
-
-FILES_${PN} += "${datadir}/cmake-2.8"
-
-# The doc is quite... absent. Just the licensing information is there.
-# Real doc was nuked by dont-run-cross-binaries.patch. Fixing the doc
-# generation would be quite complicated, as cmake build process innovatively
-# runs the generated binaries to extract help contained in them.
-# -> Fixing this is probably not worth it.
-FILES_${PN}-doc += "${docdir}/cmake-2.8"
diff --git a/recipes/cmake/cmake_2.8.3.bb b/recipes/cmake/cmake_2.8.3.bb
new file mode 100644
index 0000000..8c96388
--- /dev/null
+++ b/recipes/cmake/cmake_2.8.3.bb
@@ -0,0 +1,46 @@
+require cmake.inc
+
+inherit cmake
+
+DEPENDS += "curl expat zlib"
+
+SRC_URI[md5sum] = "a76a44b93acf5e3badda9de111385921"
+SRC_URI[sha256sum] = "689ed02786b5cefa5515c7716784ee82a82e8ece6be5a3d629ac3cc0c05fc288"
+
+SRC_URI += "file://dont-run-cross-binaries.patch"
+
+# Strip ${prefix} from ${docdir}, set result into docdir_stripped
+python () {
+    prefix=bb.data.getVar("prefix", d, 1)
+    docdir=bb.data.getVar("docdir", d, 1)
+
+    if not docdir.startswith(prefix):
+	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+
+    docdir_stripped = docdir[len(prefix):]
+    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
+	docdir_stripped = docdir_stripped[1:]
+
+    bb.data.setVar("docdir_stripped", docdir_stripped, d)
+}
+
+EXTRA_OECMAKE=" \
+# Override default "doc" (this is relative to ${prefix})
+    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-2.8 \
+# Using system libs spares us some cmake cross trouble.
+    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+# This is compiler & target dependant, but it seems cmake does not in fact use this value.
+    -DKWSYS_CHAR_IS_SIGNED=1 \
+# This disables large file support. Hopefully nobody processes >2G files on the target.
+# If you want to enable this, add -DWKSYS_LFS_WORKS=1
+    -DKWSYS_LFS_DISABLE=1 \
+"
+
+FILES_${PN} += "${datadir}/cmake-2.8"
+
+# The doc is quite... absent. Just the licensing information is there.
+# Real doc was nuked by dont-run-cross-binaries.patch. Fixing the doc
+# generation would be quite complicated, as cmake build process innovatively
+# runs the generated binaries to extract help contained in them.
+# -> Fixing this is probably not worth it.
+FILES_${PN}-doc += "${docdir}/cmake-2.8"
-- 
1.7.2.3



