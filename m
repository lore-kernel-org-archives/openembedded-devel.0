Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 491 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 18 Jan 2019 13:28:56 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 8142B7C232
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 13:28:56 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x0IDKjH0012963
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jan 2019 14:20:45 +0100
Received: from dev.vm6.ccp.siemens.com ([167.87.26.5])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id x0IDKjoV030823;
	Fri, 18 Jan 2019 14:20:45 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 6717810D47AA;
	Fri, 18 Jan 2019 14:20:44 +0100 (CET)
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jan 2019 14:19:39 +0100
Message-Id: <20190118131939.1845-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH] rocksdb: make resulting cmake config relocatable
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
X-List-Received-Date: Fri, 18 Jan 2019 13:28:57 -0000

RocksDB is still using CMake 2.8 and thus does not make use of importet targets.
This leads to hardcoded paths to the build directory in the resulting packaged files.

The workaround for the issue is to bypass CMakes detection and let the linker deal with finding the right library.

This is necessary until RocksDB moves to a more modern CMake.
It's also applied in the Poco recipe right now.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 67822477e..60afa7147 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -18,9 +18,9 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 PACKAGECONFIG ??= "bzip2 zlib lz4"
-PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON,-DWITH_BZ2=OFF,bzip2"
-PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON,-DWITH_LZ4=OFF,lz4"
-PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON,-DWITH_ZLIB=OFF,zlib"
+PACKAGECONFIG[bzip2] = "-DWITH_BZ2=ON -DBZIP2_LIBRARIES:STRING=bz2,-DWITH_BZ2=OFF,bzip2"
+PACKAGECONFIG[lz4] = "-DWITH_LZ4=ON -DLZ4_LIBRARIES:STRING=lz4,-DWITH_LZ4=OFF,lz4"
+PACKAGECONFIG[zlib] = "-DWITH_ZLIB=ON -DZLIB_LIBRARIES:STRING=z,-DWITH_ZLIB=OFF,zlib"
 PACKAGECONFIG[lite] = "-DROCKSDB_LITE=ON,-DROCKSDB_LITE=OFF"
 
 # Tools and tests currently don't compile on armv5 so we disable them
-- 
2.11.0


