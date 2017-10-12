Return-Path: <pascal.bach@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8A80771A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 08:20:47 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v9C8KmV0023250
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 10:20:48 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v9C8KmHt005251;
	Thu, 12 Oct 2017 10:20:48 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Oct 2017 10:20:43 +0200
Message-Id: <1507796443-11851-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCHv3] rocksdb: add version 5.8
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
X-List-Received-Date: Thu, 12 Oct 2017 08:20:49 -0000

Version 5.8 does no longer includes the facebook patent grant and is
licensed under the Apache-2.0 or GPL-2.0 license.

Tests and tools don't compile on armv5 so we disable them.
The tools are never installed anyway so it doesn't make a difference for
the resulting package.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb

diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
new file mode 100644
index 0000000..9b19c1a
--- /dev/null
+++ b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "RocksDB an embeddable, persistent key-value store"
+DESCRIPTION = "RocksDB is library that provides an embeddable, persistent key-value store for fast storage."
+HOMEPAGE = "http://rocksdb.org/"
+LICENSE = "(Apache-2.0 | GPL-2.0) & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
+
+SRCREV = "266ac245affd69555643b735d19d3715c4eff91a"
+PV = "5.8+git${SRCPV}"
+
+SRC_URI = "git://github.com/facebook/${BPN}.git"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+PACKAGECONFIG ??= "bzip2 zlib lz4"
+PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
+PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
+PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
+PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
+
+# Tools and tests currently don't compile on armv5 so we disable them
+EXTRA_OECMAKE = "\
+    -DPORTABLE=ON \
+    -DWITH_TESTS=OFF \
+    -DWITH_TOOLS=OFF \
+"
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
2.1.4


