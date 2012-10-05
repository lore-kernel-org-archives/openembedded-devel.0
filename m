Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1TKE3I-0008DB-A4 for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 21:59:16 +0200
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id E9F54E02A7;
	Fri,  5 Oct 2012 19:46:13 +0000 (UTC)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id D92DE703B8B; Fri,  5 Oct 2012 21:46:13 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  5 Oct 2012 21:46:04 +0200
Message-Id: <575b8d75820eff386c5a67e7f5356013995c827a.1349466172.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
References: <366eb039e4231b2285f46a74effced4b4f919d51.1349466172.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1349466172.git.sledz@dresearch-fe.de>
References: <cover.1349466172.git.sledz@dresearch-fe.de>
Subject: [meta-java 4/5] icedtea6-native: fix compile error
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
X-List-Received-Date: Fri, 05 Oct 2012 19:59:16 -0000

Don't return booleans from methods returning pointers.

see also: <http://hg.openjdk.java.net/hsx/hotspot-rt/hotspot/rev/f457154eee8b>

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 .../icedtea-hotspot-dont-return-booleans.patch             |   12 ++++++++++++
 .../icedtea-hotspot-dont-return-booleans.patch             |   12 ++++++++++++
 recipes-core/icedtea/icedtea6-native_1.7.10.bb             |    4 +++-
 recipes-core/icedtea/icedtea6-native_1.8.11.bb             |    4 +++-
 4 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-dont-return-booleans.patch
 create mode 100644 recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-booleans.patch

diff --git a/recipes-core/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-dont-return-booleans.patch b/recipes-core/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-dont-return-booleans.patch
new file mode 100644
index 0000000..73f90b3
--- /dev/null
+++ b/recipes-core/icedtea/icedtea6-native-1.7.10/icedtea-hotspot-dont-return-booleans.patch
@@ -0,0 +1,12 @@
+diff -Nurd openjdk/hotspot/src/share/vm/opto/loopnode.cpp openjdk/hotspot/src/share/vm/opto/loopnode.cpp
+--- openjdk/hotspot/src/share/vm/opto/loopnode.cpp	2012-10-05 14:18:19.725747261 +0200
++++ openjdk/hotspot/src/share/vm/opto/loopnode.cpp	2012-10-05 14:18:40.751035242 +0200
+@@ -534,7 +534,7 @@
+ Node* CountedLoopNode::match_incr_with_optional_truncation(
+                       Node* expr, Node** trunc1, Node** trunc2, const TypeInt** trunc_type) {
+   // Quick cutouts:
+-  if (expr == NULL || expr->req() != 3)  return false;
++  if (expr == NULL || expr->req() != 3)  return NULL;
+ 
+   Node *t1 = NULL;
+   Node *t2 = NULL;
diff --git a/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-booleans.patch b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-booleans.patch
new file mode 100644
index 0000000..73f90b3
--- /dev/null
+++ b/recipes-core/icedtea/icedtea6-native-1.8.11/icedtea-hotspot-dont-return-booleans.patch
@@ -0,0 +1,12 @@
+diff -Nurd openjdk/hotspot/src/share/vm/opto/loopnode.cpp openjdk/hotspot/src/share/vm/opto/loopnode.cpp
+--- openjdk/hotspot/src/share/vm/opto/loopnode.cpp	2012-10-05 14:18:19.725747261 +0200
++++ openjdk/hotspot/src/share/vm/opto/loopnode.cpp	2012-10-05 14:18:40.751035242 +0200
+@@ -534,7 +534,7 @@
+ Node* CountedLoopNode::match_incr_with_optional_truncation(
+                       Node* expr, Node** trunc1, Node** trunc2, const TypeInt** trunc_type) {
+   // Quick cutouts:
+-  if (expr == NULL || expr->req() != 3)  return false;
++  if (expr == NULL || expr->req() != 3)  return NULL;
+ 
+   Node *t1 = NULL;
+   Node *t2 = NULL;
diff --git a/recipes-core/icedtea/icedtea6-native_1.7.10.bb b/recipes-core/icedtea/icedtea6-native_1.7.10.bb
index a3edb98..4e86dac 100644
--- a/recipes-core/icedtea/icedtea6-native_1.7.10.bb
+++ b/recipes-core/icedtea/icedtea6-native_1.7.10.bb
@@ -2,7 +2,7 @@ require ${PN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI = "\
 	http://icedtea.classpath.org/download/source/icedtea6-${PV}.tar.gz;name=iced \
@@ -27,6 +27,7 @@ ICEDTEA_PATCHES = "\
 	file://icedtea-hotspot-make-arch-sane-for-x86.patch;apply=no \
 	file://icedtea-jdk-sane-x86-arch.patch;apply=no \
 	file://icedtea-unbreak-float.patch;apply=no \
+	file://icedtea-hotspot-dont-return-booleans.patch;apply=no \
 	"
 
 export DISTRIBUTION_PATCHES = "\
@@ -36,4 +37,5 @@ export DISTRIBUTION_PATCHES = "\
 	patches/icedtea-hotspot-make-arch-sane-for-x86.patch \
 	patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
+	patches/icedtea-hotspot-dont-return-booleans.patch \
 	"
diff --git a/recipes-core/icedtea/icedtea6-native_1.8.11.bb b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
index 7c2e6ea..65f29ea 100644
--- a/recipes-core/icedtea/icedtea6-native_1.8.11.bb
+++ b/recipes-core/icedtea/icedtea6-native_1.8.11.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI = "\
 	http://icedtea.classpath.org/download/source/icedtea6-${PV}.tar.gz;name=iced \
@@ -44,6 +44,7 @@ ICEDTEA_PATCHES = "\
         file://icedtea-jdk-sane-x86-arch.patch;apply=no \
         file://icedtea-unbreak-float.patch;apply=no \
         file://icedtea-jdk-avoid-cdef-collision.patch;apply=no \
+	file://icedtea-hotspot-dont-return-booleans.patch;apply=no \
 	"
 
 export DISTRIBUTION_PATCHES = "\
@@ -54,6 +55,7 @@ export DISTRIBUTION_PATCHES = "\
         patches/icedtea-jdk-sane-x86-arch.patch \
 	patches/icedtea-unbreak-float.patch \
         patches/icedtea-jdk-avoid-cdef-collision.patch \
+	patches/icedtea-hotspot-dont-return-booleans.patch \
 	"
 
 EXTRA_OECONF += " --with-jaxws-drop-zip=${DL_DIR}/jdk6-jaxws-2009_10_27.zip \
-- 
1.7.10.4



