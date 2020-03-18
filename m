Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1292A60ADF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 01:49:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,565,1574092800"; d="scan'208";a="86504536"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 09:49:47 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id EE4B550A9985
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 09:39:39 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 09:49:44 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Mar 2020 09:49:53 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 00:19:51 -0700
Message-ID: <1584515992-22564-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: EE4B550A9985.A69FC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] rocksdb: upgrade 6.5.2 -> 6.6.4
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
X-List-Received-Date: Wed, 18 Mar 2020 01:49:47 -0000
Content-Type: text/plain

0001-Fix-build-breakage-from-lock_guard-error-6161.patch
removed since it is included in 6.6.4

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...-breakage-from-lock_guard-error-6161.patch | 36 -------------------
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb    |  7 ++--
 2 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
deleted file mode 100644
index ac87d0c60..000000000
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-Fix-build-breakage-from-lock_guard-error-6161.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From b626703de7ece507f360507e49d3ecb448b12e07 Mon Sep 17 00:00:00 2001
-From: Maysam Yabandeh <myabandeh@fb.com>
-Date: Thu, 12 Dec 2019 13:48:50 -0800
-Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
-
-Summary:
-This change fixes a source issue that caused compile time error which breaks build for many fbcode services in that setup. The size() member function of channel is a const member, so member variables accessed within it are implicitly const as well. This caused error when clang fails to resolve to a constructor that takes std::mutex because the suitable constructor got rejected due to loss of constness for its argument. The fix is to add mutable modifier to the lock_ member of channel.
-Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
-
-Differential Revision: D18967685
-
-Pulled By: maysamyabandeh
-
-Upstream-Status: Backport
-
-fbshipit-source-id: 698b6a5153c3c92eeacb842c467aa28cc350d432
----
- util/channel.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util/channel.h b/util/channel.h
-index 0225482c0..a8a47680a 100644
---- a/util/channel.h
-+++ b/util/channel.h
-@@ -60,7 +60,7 @@ class channel {
- 
-  private:
-   std::condition_variable cv_;
--  std::mutex lock_;
-+  mutable std::mutex lock_;
-   std::queue<T> buffer_;
-   bool eof_;
- };
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 713d5bb14..e82b77e14 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE.Apache;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.leveldb;md5=fb04ff57a14f308f2eed4a9b87d45837"
 
-SRCREV = "4cfbd87afd08a16df28436fb990ef6b154ee6114"
-SRCBRANCH = "6.5.fb"
-PV = "6.5.2"
+SRCREV = "551a110918493a19d11243f53408b97485de1411"
+SRCBRANCH = "6.6.fb"
+PV = "6.6.4"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
-           file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
            file://0001-db-write_thread.cc-Initialize-state.patch \
           "
 
-- 
2.17.1




