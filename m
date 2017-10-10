Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id A225560107
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 06:59:27 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v9A6xSZr002210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 08:59:28 +0200
Received: from dev.sbt.siemens.com ([139.16.76.113])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id v9A6xSdh006065;
	Tue, 10 Oct 2017 08:59:28 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Oct 2017 08:59:22 +0200
Message-Id: <1507618762-30618-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCHv2] rocksdb: add version 5.8
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
X-List-Received-Date: Tue, 10 Oct 2017 06:59:29 -0000

Version 5.8 does no longer includes the facebook patent grant and is
licensed under the Apache-2.0 or GPL-2.0 license.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rocksdb/rocksdb_git.bb

diff --git a/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
new file mode 100644
index 0000000..2e988bf
--- /dev/null
+++ b/meta-oe/recipes-extended/rocksdb/rocksdb_git.bb
@@ -0,0 +1,28 @@
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
+EXTRA_OECMAKE = "\
+    -DPORTABLE=ON \
+"
+
+FILES_${PN}-dev += "${libdir}/cmake"
-- 
2.1.4


