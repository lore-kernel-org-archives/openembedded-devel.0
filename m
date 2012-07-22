Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SswUu-0003HA-Gq
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 15:47:00 +0200
Received: by pbbrq2 with SMTP id rq2so8196100pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9XOPe5EDOhjobprxneHqDnuf26r87DVsiOfGlP9A2eA=;
	b=V1LTq04xzaqaadinV7rYQpxEOGK8nvY0ygc9eAgxIZDw3AVpTxtLviktMtbrNcI0Zs
	ONPnyCm7Nb0JmnUiP3evbZI5LlcXWcpClh42MEXHjEd3ltlbzXdovwBHs5P88l653dvh
	68GUfcd370gkgY3yrtPXCWqS1koYaIlsfsiVW6G6sf6fjAIKY0MwAL+xb/n1AIRWWofW
	gGJBBy5Gs/MVIBslesnqIoIU5j3zOGMSmi+72UulEPtWt2EE41Jhh8CNULe+ThO23KC2
	Mpno1AgDRZUMfFlEeMybqp+d6QWr6rfPJUXNwPBgLAVeKCflwNj0xIabFfF+Db4R2QzB
	PPYw==
Received: by 10.68.130.9 with SMTP id oa9mr27896408pbb.95.1342964134055;
	Sun, 22 Jul 2012 06:35:34 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id mr1sm7932236pbb.62.2012.07.22.06.35.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Jul 2012 06:35:33 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Jul 2012 17:35:16 +0400
Message-Id: <1342964116-41035-2-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342964116-41035-1-git-send-email-elvis.dowson@gmail.com>
References: <1342964116-41035-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [poky 2/2] cmake: Update to v2.8.8.
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
X-List-Received-Date: Sun, 22 Jul 2012 13:47:00 -0000

This commit updates the cmake recipe to v2.8.8.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 meta/recipes-devtools/cmake/cmake_2.8.5.bb |   40 ----------------------------
 meta/recipes-devtools/cmake/cmake_2.8.8.bb |   40 ++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake_2.8.5.bb
 create mode 100644 meta/recipes-devtools/cmake/cmake_2.8.8.bb

diff --git a/meta/recipes-devtools/cmake/cmake_2.8.5.bb b/meta/recipes-devtools/cmake/cmake_2.8.5.bb
deleted file mode 100644
index 6145345..0000000
--- a/meta/recipes-devtools/cmake/cmake_2.8.5.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-require cmake.inc
-
-inherit cmake
-
-DEPENDS += "curl expat zlib libarchive ncurses"
-
-PR = "${INC_PR}.3"
-
-SRC_URI += "file://dont-run-cross-binaries.patch"
-
-SRC_URI[md5sum] = "3c5d32cec0f4c2dc45f4c2e84f4a20c5"
-SRC_URI[sha256sum] = "5e18bff75f01656c64f553412a8905527e1b85efaf3163c6fb81ea5aaced0b91"
-
-# Strip ${prefix} from ${docdir}, set result into docdir_stripped
-python () {
-    prefix=d.getVar("prefix", True)
-    docdir=d.getVar("docdir", True)
-
-    if not docdir.startswith(prefix):
-	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
-
-    docdir_stripped = docdir[len(prefix):]
-    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
-	docdir_stripped = docdir_stripped[1:]
-
-    d.setVar("docdir_stripped", docdir_stripped)
-}
-
-EXTRA_OECMAKE=" \
-    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
-    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
-    -DKWSYS_CHAR_IS_SIGNED=1 \
-    -DBUILD_CursesDialog=0 \
-    ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
-"
-
-FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
-FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
-
-BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/cmake/cmake_2.8.8.bb b/meta/recipes-devtools/cmake/cmake_2.8.8.bb
new file mode 100644
index 0000000..dd57f41
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake_2.8.8.bb
@@ -0,0 +1,40 @@
+require cmake.inc
+
+inherit cmake
+
+DEPENDS += "curl expat zlib libarchive ncurses"
+
+PR = "${INC_PR}.3"
+
+SRC_URI += "file://dont-run-cross-binaries.patch"
+
+SRC_URI[md5sum] = "ba74b22c788a0c8547976b880cd02b17"
+SRC_URI[sha256sum] = "2b59897864d6220ff20aa8eac64cac8994e004898a1c0f899c8cb4d7b7570b46"
+
+# Strip ${prefix} from ${docdir}, set result into docdir_stripped
+python () {
+    prefix=d.getVar("prefix", True)
+    docdir=d.getVar("docdir", True)
+
+    if not docdir.startswith(prefix):
+	raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+
+    docdir_stripped = docdir[len(prefix):]
+    if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
+	docdir_stripped = docdir_stripped[1:]
+
+    d.setVar("docdir_stripped", docdir_stripped)
+}
+
+EXTRA_OECMAKE=" \
+    -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
+    -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
+    -DKWSYS_CHAR_IS_SIGNED=1 \
+    -DBUILD_CursesDialog=0 \
+    ${@base_contains('DISTRO_FEATURES', 'largefile', '-DKWSYS_LFS_WORKS=1', '-DKWSYS_LFS_DISABLE=1', d)} \
+"
+
+FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}"
+FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5



