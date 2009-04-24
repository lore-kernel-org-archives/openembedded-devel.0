Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LxOWQ-0006e4-3m
	for openembedded-devel@openembedded.org; Fri, 24 Apr 2009 18:45:11 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090424164019.ZFXS27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>;
	Fri, 24 Apr 2009 12:40:19 -0400
Received: from localhost.localdomain ([68.230.63.214])
	by fed1rmimpo03.cox.net with bizsmtp
	id jUgH1b00L4dMFYL04UgJtv; Fri, 24 Apr 2009 12:40:18 -0400
X-Authority-Analysis: v=1.0 c=1 a=mNPykItSPH8A:10 a=KYTzC4MK2aEA:10
	a=4HVRqb_MAAAA:8 a=pGLkceISAAAA:8 a=DRi_eEeSPefMijpgFhwA:9
	a=6mK5LvVlk5GCqyiI0MAA:7 a=2jKFNxAu7d8XD5NYD9b5U5H1fg0A:4
	a=k-kO48AawpMA:10 a=0pA2U7TmfLoA:10 a=MSl-tDqOz04A:10
X-CM-Score: 0.00
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Date: Fri, 24 Apr 2009 09:11:51 -0700
Message-Id: <1240589520-1104-4-git-send-email-trini@kernel.crashing.org>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
References: <1240589520-1104-1-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-2-git-send-email-trini@kernel.crashing.org>
	<1240589520-1104-3-git-send-email-trini@kernel.crashing.org>
Subject: [PATCH][STABLE] meta-toolchain, canadian-sdk: Move C++ headers into the correct location, bump PR
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
X-List-Received-Date: Fri, 24 Apr 2009 16:46:02 -0000

From: Tom Rini <trini@embeddedalley.com>

Acked-by: Florian Boor <florian.boor@kernelconcepts.de>
Acked-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Tom Rini <trini@embeddedalley.com>
---
 recipes/meta/canadian-sdk.bb            |    8 +++++++-
 recipes/meta/meta-toolchain-fso.bb      |    2 +-
 recipes/meta/meta-toolchain-gpe-sbox.bb |    3 ++-
 recipes/meta/meta-toolchain-gpe.bb      |    3 ++-
 recipes/meta/meta-toolchain-neuros.bb   |    2 +-
 recipes/meta/meta-toolchain-openmoko.bb |    2 +-
 recipes/meta/meta-toolchain-opie.bb     |    1 +
 recipes/meta/meta-toolchain-sbox.bb     |    1 +
 recipes/meta/meta-toolchain.bb          |    6 ++++++
 9 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
index 150c752..9126c7e 100644
--- a/recipes/meta/canadian-sdk.bb
+++ b/recipes/meta/canadian-sdk.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
 DEPENDS = "ipkg-native ipkg-utils-native fakeroot-native sed-native zip-native"
-PR = "r2"
+PR = "r3"
 
 inherit canadian-sdk meta
 
@@ -100,6 +100,12 @@ do_populate_sdk() {
 	# gcc-cross-sdk get built :( (30/11/07)
 	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/libgcc_s.so
 
+	# With sysroot support, gcc expects the default C++ headers to be
+	# in a specific place.
+	install -d ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include
+	mv ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/usr/include/c++ \
+		${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include/
+
 	# Fix or remove broken .la files
 	for i in `find ${SDK_OUTPUT}/${prefix}/${TARGET_SYS} -name \*.la`; do
 		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${layout_base_libdir},\1${prefix}/${TARGET_SYS}${layout_base_libdir},g" \
diff --git a/recipes/meta/meta-toolchain-fso.bb b/recipes/meta/meta-toolchain-fso.bb
index fbfbb0a..4873c42 100644
--- a/recipes/meta/meta-toolchain-fso.bb
+++ b/recipes/meta/meta-toolchain-fso.bb
@@ -1,4 +1,4 @@
-PR = "r0"
+PR = "r1"
 
 TOOLCHAIN_TARGET_TASK = "task-fso-toolchain-target"
 TOOLCHAIN_HOST_TASK = "task-fso-toolchain-host"
diff --git a/recipes/meta/meta-toolchain-gpe-sbox.bb b/recipes/meta/meta-toolchain-gpe-sbox.bb
index 74ba038..29e39c5 100644
--- a/recipes/meta/meta-toolchain-gpe-sbox.bb
+++ b/recipes/meta/meta-toolchain-gpe-sbox.bb
@@ -1,3 +1,4 @@
+PR = "r1"
 TOOLCHAIN_TARGET_TASK = "\
     task-sdk-base \
     task-sdk-sbox \
@@ -9,4 +10,4 @@ TOOLCHAIN_TARGET_TASK = "\
 
 require meta-toolchain.bb
 
-SDK_SUFFIX = "toolchain-gpe-sbox"
\ No newline at end of file
+SDK_SUFFIX = "toolchain-gpe-sbox"
diff --git a/recipes/meta/meta-toolchain-gpe.bb b/recipes/meta/meta-toolchain-gpe.bb
index bcfb1e1..7b962bf 100644
--- a/recipes/meta/meta-toolchain-gpe.bb
+++ b/recipes/meta/meta-toolchain-gpe.bb
@@ -1,3 +1,4 @@
+PR = "r1"
 TOOLCHAIN_TARGET_TASK = "\
     task-sdk-base \
     task-sdk-x11 \
@@ -6,4 +7,4 @@ TOOLCHAIN_TARGET_TASK = "\
 
 require meta-toolchain.bb
 
-SDK_SUFFIX = "toolchain-gpe"
\ No newline at end of file
+SDK_SUFFIX = "toolchain-gpe"
diff --git a/recipes/meta/meta-toolchain-neuros.bb b/recipes/meta/meta-toolchain-neuros.bb
index f60fbf0..161231a 100644
--- a/recipes/meta/meta-toolchain-neuros.bb
+++ b/recipes/meta/meta-toolchain-neuros.bb
@@ -1,6 +1,6 @@
 # Toolchain for neuros-osd devices
 
-PR = "r3"
+PR = "r6"
 
 TOOLCHAIN_HOST_TASK = "task-sdk-host \
                        qmake2-sdk uicmoc4-sdk"
diff --git a/recipes/meta/meta-toolchain-openmoko.bb b/recipes/meta/meta-toolchain-openmoko.bb
index b7e5626..b265615 100644
--- a/recipes/meta/meta-toolchain-openmoko.bb
+++ b/recipes/meta/meta-toolchain-openmoko.bb
@@ -1,4 +1,4 @@
-PR = "r1"
+PR = "r2"
 
 TOOLCHAIN_TARGET_TASK = "task-openmoko-toolchain-target"
 TOOLCHAIN_HOST_TASK = "task-openmoko-toolchain-host"
diff --git a/recipes/meta/meta-toolchain-opie.bb b/recipes/meta/meta-toolchain-opie.bb
index c72208c..9f4b9ac 100644
--- a/recipes/meta/meta-toolchain-opie.bb
+++ b/recipes/meta/meta-toolchain-opie.bb
@@ -1,3 +1,4 @@
+PR = "r1"
 TOOLCHAIN_TARGET_TASK = "\
     task-sdk-base \
     task-sdk-opie"
diff --git a/recipes/meta/meta-toolchain-sbox.bb b/recipes/meta/meta-toolchain-sbox.bb
index 1283c59..0138329 100644
--- a/recipes/meta/meta-toolchain-sbox.bb
+++ b/recipes/meta/meta-toolchain-sbox.bb
@@ -1,3 +1,4 @@
+PR = "r1"
 TOOLCHAIN_TARGET_TASK = "\
     task-sdk-bare \
     task-sdk-sbox"
diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
index f892d22..b641be1 100644
--- a/recipes/meta/meta-toolchain.bb
+++ b/recipes/meta/meta-toolchain.bb
@@ -117,6 +117,12 @@ do_populate_sdk() {
 	# gcc-cross-sdk get built :( (30/11/07)
 	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/libgcc_s.so
 
+	# With sysroot support, gcc expects the default C++ headers to be
+	# in a specific place.
+	install -d ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include
+	mv ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/usr/include/c++ \
+		${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include/
+
 	# Fix or remove broken .la files
 	for i in `find ${SDK_OUTPUT}/${prefix}/${TARGET_SYS} -name \*.la`; do
 		sed -i 	-e "/^dependency_libs=/s,\([[:space:]']\)${layout_base_libdir},\1${prefix}/${TARGET_SYS}${layout_base_libdir},g" \
-- 
1.5.6.3



