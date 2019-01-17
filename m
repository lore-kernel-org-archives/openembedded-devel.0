Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B97D6C10B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 07:27:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0H7QsAm001984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2019 23:27:05 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 16 Jan 2019 23:26:44 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Jan 2019 02:26:36 -0500
Message-ID: <20190117072636.87188-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rocksdb: fix qa warning of buildpaths
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
X-List-Received-Date: Thu, 17 Jan 2019 07:27:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

rocksdb fails qa check buildpaths:

| WARNING: rocksdb-5.17.2-r0 do_package_qa: QA Issue: File
| /work/core2-64-poky-linux/rocksdb/5.17.2-r0/packages-split/rocksdb-dev/usr/lib64/cmake/rocksdb/RocksDBTargets.cmake
| in package contained reference to tmpdir [buildpaths]

Removing buildpath info from the cmake file.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 67822477e..c926d4472 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -29,3 +29,8 @@ EXTRA_OECMAKE = "\
     -DWITH_TESTS=OFF \
     -DWITH_TOOLS=OFF \
 "
+
+do_install_append() {
+    # fix for qa check buildpaths
+    sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/rocksdb/RocksDBTargets.cmake
+}
-- 
2.20.0


