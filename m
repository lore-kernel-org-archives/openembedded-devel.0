Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF65F60068
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:25:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5U7PQvq008657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Jun 2017 00:25:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Jun 2017 00:25:25 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 30 Jun 2017 03:25:24 -0400
Message-ID: <1498807524-74825-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] unionfs-fuse: 0.26 -> 2.0
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
X-List-Received-Date: Fri, 30 Jun 2017 07:25:30 -0000
Content-Type: text/plain

- Fix 0.26's do_compile failure by inheriting cmake and pkgconfig

- Update upstream to github

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-support-cross-compiling.patch       | 32 ++++++++++++++++++++++
 .../{unionfs-fuse_0.26.bb => unionfs-fuse_2.0.bb}  | 23 ++++++++--------
 2 files changed, 43 insertions(+), 12 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
 rename meta-filesystems/recipes-filesystems/unionfs-fuse/{unionfs-fuse_0.26.bb => unionfs-fuse_2.0.bb} (25%)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
new file mode 100644
index 0000000..bf363ca
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
@@ -0,0 +1,32 @@
+From 449cec34c123b86b792627553c6ec7471d2ee7ed Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 30 Jun 2017 14:46:51 +0800
+Subject: [PATCH] support cross compiling
+
+Do not override OE CMAKE variables
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10,9 +10,9 @@ IF(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
+ ENDIF(NOT CMAKE_CONFIGURATION_TYPES AND NOT CMAKE_BUILD_TYPE)
+ 
+ # Select flags.
+-SET(CMAKE_C_FLAGS "-pipe -W -Wall -DFORTIFY_SOURCE=2")
++SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pipe -W -Wall -DFORTIFY_SOURCE=2")
+ SET(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g")
+-SET(CMAKE_C_FLAGS_RELEASE "-O2")
++SET(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")
+ SET(CMAKE_C_FLAGS_DEBUG "-O0 -g -DDEBUG")
+ 
+ if (UNIX AND APPLE)
+-- 
+2.8.1
+
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
similarity index 25%
rename from meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
rename to meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
index 2520429..b89d8db 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_2.0.bb
@@ -1,19 +1,18 @@
 SUMMARY = "A FUSE based implemention of unionfs"
-HOMEPAGE = "http://podgorny.cz/moin/UnionFsFuse"
+HOMEPAGE = "https://github.com/rpodgorny/unionfs-fuse"
 SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
-DEPENDS = "fuse"
-LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8abab00b483a1b7943a32"
-
-SRC_URI = "http://podgorny.cz/unionfs-fuse/releases/${BP}.tar.xz"
+LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8abab00b483a1b7943a32 \
+                    file://LICENSE;md5=7e5a37fce17307066eec6b23546da3b3 \
+"
 
-SRC_URI[md5sum] = "689c636484756f6f7a728ef354cbeac2"
-SRC_URI[sha256sum] = "8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719c9f662"
+SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master \
+           file://0001-support-cross-compiling.patch \
+"
+SRCREV = "c8d23a9a75f1a62988593671839e8a168a79f3e5"
 
-do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
-}
+DEPENDS = "fuse"
 
-RDEPENDS_${PN} += "bash"
+S = "${WORKDIR}/git"
 
-PNBLACKLIST[unionfs-fuse] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130648/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+inherit cmake pkgconfig
-- 
2.8.1


