Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id F232378554
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:44:47 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v8DBimk0023197
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 13:44:48 +0200
Received: from dev.sbt.siemens.com ([139.16.24.231])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v8DBilV5031577;
	Wed, 13 Sep 2017 13:44:48 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Sep 2017 13:44:38 +0200
Message-Id: <1505303078-14023-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] flatbuffers: add version 1.7.1
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
X-List-Received-Date: Wed, 13 Sep 2017 11:44:48 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../files/0001-correct-version-for-so-lib.patch    | 26 +++++++++++++++++
 .../flatbuffers/flatbuffers_1.7.1.bb               | 34 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch
 create mode 100644 meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb

diff --git a/meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch b/meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch
new file mode 100644
index 0000000..a7a42f9
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatbuffers/files/0001-correct-version-for-so-lib.patch
@@ -0,0 +1,26 @@
+From 8b44dc65d98d50b462843ac9dab6fe3fc25abe36 Mon Sep 17 00:00:00 2001
+From: Pascal Bach <pascal.bach@siemens.com>
+Date: Fri, 12 May 2017 13:54:49 +0200
+Subject: [PATCH] correct version for so lib
+
+Upstream-Status: Pending
+
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3670afe..f4fcd2c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -172,6 +172,7 @@ endif()
+ if(FLATBUFFERS_BUILD_SHAREDLIB)
+   add_library(flatbuffers_shared SHARED ${FlatBuffers_Library_SRCS})
+   set_target_properties(flatbuffers_shared PROPERTIES OUTPUT_NAME flatbuffers)
++  set_target_properties(flatbuffers_shared PROPERTIES VERSION "${PV}")
+ endif()
+ 
+ function(compile_flatbuffers_schema_to_cpp SRC_FBS)
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb
new file mode 100644
index 0000000..9e939ee
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.7.1.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Memory Efficient Serialization Library"
+HOMEPAGE = "https://github.com/google/flatbuffers"
+SECTION = "console/tools"
+LICENSE = "Apache-2.0"
+
+PACKAGE_BEFORE_PN = "${PN}-compiler"
+
+RDEPENDS_${PN}-compiler = "${PN}"
+RDEPENDS_${PN}-dev += "${PN}-compiler"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
+
+SRCREV = "25a15950f5a24d7217689739ed8f6dac64912d62"
+
+SRC_URI = "git://github.com/google/flatbuffers.git \
+           file://0001-correct-version-for-so-lib.patch"
+
+# Make sure C++11 is used, required for example for GCC 4.9
+CXXFLAGS += "-std=c++11"
+BUILD_CXXFLAGS += "-std=c++11"
+
+EXTRA_OECMAKE += "\
+	-DFLATBUFFERS_BUILD_TESTS=OFF \
+	-DFLATBUFFERS_BUILD_SHAREDLIB=ON \
+  -DPV=${PV} \
+  "
+
+inherit cmake
+
+S = "${WORKDIR}/git"
+
+FILES_${PN}-compiler = "${bindir}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


