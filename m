Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 7933E77E7A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 08:05:03 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v5284xTT012639
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 2 Jun 2017 10:04:59 +0200
Received: from dev.sbt.siemens.com ([139.16.116.248])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v5284xiw017049;
	Fri, 2 Jun 2017 10:04:59 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 10:04:53 +0200
Message-Id: <1496390693-8675-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] leveldb: update to 1.20
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
X-List-Received-Date: Fri, 02 Jun 2017 08:05:04 -0000

The tmalloc patch went upstream in the meantime

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../leveldb/0001-Explicitly-disable-tcmalloc.patch | 48 ----------------------
 meta-oe/recipes-extended/leveldb/leveldb_git.bb    |  8 ++--
 2 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch

diff --git a/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch b/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
deleted file mode 100644
index 4b76dd0..0000000
--- a/meta-oe/recipes-extended/leveldb/leveldb/0001-Explicitly-disable-tcmalloc.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d6daac04dab4b3acf4b88f16742d1b402cdc3d83 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 1 Oct 2014 18:54:04 +0200
-Subject: [PATCH] Explicitly disable tcmalloc
-
-Without this change leveldb autodetects tcmalloc from sysroot and
-sometimes became dependant on gperftools
-
-Disable autodetection without TCMALLOC_ENABLED=true pased to make
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- build_detect_platform | 16 +++++++++-------
- 1 file changed, 9 insertions(+), 7 deletions(-)
-
-diff --git a/build_detect_platform b/build_detect_platform
-index bb76c4f..a586364 100755
---- a/build_detect_platform
-+++ b/build_detect_platform
-@@ -201,15 +201,17 @@ EOF
-         PLATFORM_LIBS="$PLATFORM_LIBS -lsnappy"
-     fi
- 
--    # Test whether tcmalloc is available
--    $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
--      int main() {}
-+    if [ "$TCMALLOC_ENABLED" = "true" ]; then
-+        # Test whether tcmalloc is available
-+        $CXX $CXXFLAGS -x c++ - -o $CXXOUTPUT -ltcmalloc 2>/dev/null  <<EOF
-+          int main() {}
- EOF
--    if [ "$?" = 0 ]; then
--        PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
--    fi
-+        if [ "$?" = 0 ]; then
-+            PLATFORM_LIBS="$PLATFORM_LIBS -ltcmalloc"
-+        fi
- 
--    rm -f $CXXOUTPUT 2>/dev/null
-+        rm -f $CXXOUTPUT 2>/dev/null
-+    fi
- fi
- 
- PLATFORM_CCFLAGS="$PLATFORM_CCFLAGS $COMMON_FLAGS"
--- 
-2.1.1
-
diff --git a/meta-oe/recipes-extended/leveldb/leveldb_git.bb b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
index a6a3024..8c66055 100644
--- a/meta-oe/recipes-extended/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-extended/leveldb/leveldb_git.bb
@@ -4,12 +4,10 @@ HOMEPAGE = "http://leveldb.googlecode.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92d1b128950b11ba8495b64938fc164d"
 
-SRCREV = "803d69203a62faf50f1b77897310a3a1fcae712b"
-PV = "1.18+git${SRCPV}"
+SRCREV = "a53934a3ae1244679f812d998a4f16f2c7f309a6"
+PV = "1.20+git${SRCPV}"
 
-SRC_URI = "git://github.com/google/${BPN}.git \
-    file://0001-Explicitly-disable-tcmalloc.patch \
-"
+SRC_URI = "git://github.com/google/${BPN}.git"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


