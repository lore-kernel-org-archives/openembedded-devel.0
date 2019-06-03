Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27DF56C102
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jun 2019 03:16:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x533GCjx000752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 2 Jun 2019 20:16:12 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 2 Jun 2019 20:16:00 -0700
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Jun 2019 11:15:58 +0800
Message-ID: <1559531758-126270-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] rocksdb: Turn off Werror to fix build failure due to GCC9 checks
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
X-List-Received-Date: Mon, 03 Jun 2019 03:16:15 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

GCC9 introduce stricter checks, deprecated-copy and pessimizing-move, while
rocksdb uses -Werror and causes the following build error.

db/version_edit.h:178:33: error: implicitly-declared 'constexpr rocksdb::FileDescriptor::FileDescriptor(const rocksdb::FileDescriptor&)' is deprecated [-Werror=deprecated-copy]

utilities/persistent_cache/persistent_cache_util.h:51:23: error: moving a local object in a return statement prevents copy elision [-Werror=pessimizing-move]

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
v2: As suggested, turn off Werror instead of the two specifc check options

 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 8d84619..5ce4c74 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -30,6 +30,7 @@ EXTRA_OECMAKE = "\
     -DPORTABLE=ON \
     -DWITH_TESTS=OFF \
     -DWITH_TOOLS=OFF \
+    -DFAIL_ON_WARNINGS=OFF \
 "
 
 do_install_append() {
-- 
2.7.4


