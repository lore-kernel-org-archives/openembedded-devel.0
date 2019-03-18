Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6929D60807
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Mar 2019 02:33:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2I2XIIF022840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Mar 2019 19:33:18 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 17 Mar 2019 19:33:17 -0700
From: <zhe.he@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Mar 2019 10:33:16 +0800
Message-ID: <1552876396-183037-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] utilities: Fix build failure with -Werror=maybe-uninitialized
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
X-List-Received-Date: Mon, 18 Mar 2019 02:33:17 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Initialize magic_number to zero to avoid such failure.
utilities/blob_db/blob_log_format.cc:91:3: error: 'magic_number' may be used
uninitialized in this function [-Werror=maybe-uninitialized]
   if (magic_number != kMagicNumber) {
   ^~

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ix-build-failure-with-Werror-maybe-uninit.patch | 35 ++++++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb         |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch
new file mode 100644
index 0000000..ef0429a
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch
@@ -0,0 +1,35 @@
+From 8996f075e64da0e6ffeda57632ef31f8710defcc Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Fri, 15 Mar 2019 16:47:03 +0800
+Subject: [PATCH] utilities: Fix build failure with -Werror=maybe-uninitialized
+
+Summary:
+Initialize magic_number to zero to avoid such failure.
+utilities/blob_db/blob_log_format.cc:91:3: error: 'magic_number' may be used
+uninitialized in this function [-Werror=maybe-uninitialized]
+   if (magic_number != kMagicNumber) {
+   ^~
+
+Upstream-Status: Accepted [expected version 5.19]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ utilities/blob_db/blob_log_format.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utilities/blob_db/blob_log_format.cc b/utilities/blob_db/blob_log_format.cc
+index 2bf7028..8726cb8 100644
+--- a/utilities/blob_db/blob_log_format.cc
++++ b/utilities/blob_db/blob_log_format.cc
+@@ -82,7 +82,7 @@ Status BlobLogFooter::DecodeFrom(Slice src) {
+   uint32_t src_crc = 0;
+   src_crc = crc32c::Value(src.data(), BlobLogFooter::kSize - sizeof(uint32_t));
+   src_crc = crc32c::Mask(src_crc);
+-  uint32_t magic_number;
++  uint32_t magic_number = 0;
+   if (!GetFixed32(&src, &magic_number) || !GetFixed64(&src, &blob_count) ||
+       !GetFixed64(&src, &expiration_range.first) ||
+       !GetFixed64(&src, &expiration_range.second) || !GetFixed32(&src, &crc)) {
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 78520f9..27c7b20 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -12,6 +12,7 @@ PV = "5.18.2"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-Disable-Wshadow-and-do-not-mark-default-copy-constru.patch \
+           file://0001-utilities-Fix-build-failure-with-Werror-maybe-uninit.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


