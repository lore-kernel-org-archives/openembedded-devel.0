Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 042C162133
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 15:17:26 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u2HFHPfM005234
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 16:17:25 +0100
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.85.179])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id u2HFHOH9029216;
	Thu, 17 Mar 2016 16:17:24 +0100
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 16:17:22 +0100
Message-Id: <1458227842-13989-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] poco: update to 1.7.1
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
X-List-Received-Date: Thu, 17 Mar 2016 15:17:27 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 ...dation-library-version-back-to-SHARED_LIB.patch | 35 ----------------------
 .../poco/{poco_1.6.1.bb => poco_1.7.1.bb}          |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch
 rename meta-oe/recipes-support/poco/{poco_1.6.1.bb => poco_1.7.1.bb} (95%)

diff --git a/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch b/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch
deleted file mode 100644
index f65bb15..0000000
--- a/meta-oe/recipes-support/poco/poco-1.6.1/0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cec5a43151a11d8afbb5dd50caf4e22fb89c6340 Mon Sep 17 00:00:00 2001
-From: Mike Gelfand <mikedld@mikedld.com>
-Date: Sun, 20 Sep 2015 03:08:19 +0300
-Subject: [PATCH] Change Foundation library version back to
- SHARED_LIBRARY_VERSION
-
-Foundation is the only library using PROJECT_VERSION as library version,
-the change accidentally introduced by commit b69fafb84c. This causes
-difference in library being linked to (libPocoFoundation.31.dylib on Mac)
-and library returned by $<TARGET_FILE:Poco::Foundation> for imported
-target (libPocoFoundation.1.6.1.dylib), causing inconvenience. Also, this
-differs from autoconf-based builds where only "31" (soversion) library is
-being created and not "1.6.1" (project version) one.
-
-Upstream-Status: Backport from 1.6.2
----
- Foundation/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Foundation/CMakeLists.txt b/Foundation/CMakeLists.txt
-index c1dd25f..25f401c 100644
---- a/Foundation/CMakeLists.txt
-+++ b/Foundation/CMakeLists.txt
-@@ -108,7 +108,7 @@ add_library( "${LIBNAME}" ${LIB_MODE} ${SRCS})
- add_library( "${POCO_LIBNAME}" ALIAS "${LIBNAME}")
- set_target_properties( "${LIBNAME}"
-     PROPERTIES
--    VERSION ${PROJECT_VERSION} SOVERSION ${SHARED_LIBRARY_VERSION}
-+    VERSION ${SHARED_LIBRARY_VERSION} SOVERSION ${SHARED_LIBRARY_VERSION}
-     OUTPUT_NAME ${POCO_LIBNAME}
-     DEFINE_SYMBOL Foundation_EXPORTS
-     )
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-support/poco/poco_1.6.1.bb b/meta-oe/recipes-support/poco/poco_1.7.1.bb
similarity index 95%
rename from meta-oe/recipes-support/poco/poco_1.6.1.bb
rename to meta-oe/recipes-support/poco/poco_1.7.1.bb
index 9822186..135d2aa 100644
--- a/meta-oe/recipes-support/poco/poco_1.6.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.1.bb
@@ -14,12 +14,11 @@ BBCLASSEXTEND = "native"
 
 SRC_URI = " \
     https://github.com/pocoproject/poco/archive/poco-${PV}-release.tar.gz \
-    file://0001-Change-Foundation-library-version-back-to-SHARED_LIB.patch \
     file://run-ptest \
    "
 
-SRC_URI[md5sum] = "208872b13d282dfb0f0580fc11df96f3"
-SRC_URI[sha256sum] = "08bc0a9bae4fb793eb694ad5ec7742c179bad48a286ae614682483021043658b"
+SRC_URI[md5sum] = "a4b755d47303b20a0e2586f281d05a36"
+SRC_URI[sha256sum] = "6dbbc2018912ad9af6af96f605933ed91354a1e7423e5dbd04d8e9a2b2d15c05"
 
 S = "${WORKDIR}/poco-poco-${PV}-release"
 
-- 
2.1.4


