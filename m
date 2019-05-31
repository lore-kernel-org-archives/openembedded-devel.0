Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD857E40A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 02:53:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4V2qf5P016738
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 19:52:52 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 30 May 2019 19:52:18 -0700
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 May 2019 10:52:17 +0800
Message-ID: <1559271137-240663-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rocksdb: Fix build failure due to GCC9 deprecated-copy pessimizing-move
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
X-List-Received-Date: Fri, 31 May 2019 02:53:01 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

GCC9 introduce more stricter checks deprecated-copy and pessimizing-move, while
rocksdb uses -Werror and causes the following build error.

db/version_edit.h:178:33: error: implicitly-declared 'constexpr rocksdb::FileDescriptor::FileDescriptor(const rocksdb::FileDescriptor&)' is deprecated [-Werror=deprecated-copy]

utilities/persistent_cache/persistent_cache_util.h:51:23: error: moving a local object in a return statement prevents copy elision [-Werror=pessimizing-move]

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 8d84619..bbd8e4f 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -31,6 +31,9 @@ EXTRA_OECMAKE = "\
     -DWITH_TESTS=OFF \
     -DWITH_TOOLS=OFF \
 "
+do_compile_prepend() {
+    sed -i 's/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow")/set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Werror -Wno-error=shadow -Wno-error=deprecated-copy -Wno-error=pessimizing-move")/' ${S}/CMakeLists.txt
+}
 
 do_install_append() {
     # fix for qa check buildpaths
-- 
2.7.4


