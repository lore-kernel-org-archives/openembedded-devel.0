Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0AA67EB92
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jan 2020 06:07:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00867esk007917
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jan 2020 22:07:40 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 7 Jan 2020 22:07:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jan 2020 14:09:03 +0800
Message-ID: <1578463743-72832-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] rocksdb: Fix compile error for DEBUG_BUILD
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
X-List-Received-Date: Wed, 08 Jan 2020 06:07:40 -0000
Content-Type: text/plain

Fixed do_compile error when DEBUG_BUILD = "1":
db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-db-write_thread.cc-Initialize-state.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb         |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch
new file mode 100644
index 0000000..97ddbce
--- /dev/null
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-db-write_thread.cc-Initialize-state.patch
@@ -0,0 +1,31 @@
+From 49dcd22dcf1aae5995c42eac0fda68516fc1cd43 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 19 Jun 2019 17:57:24 +0800
+Subject: [PATCH] db/write_thread.cc: Initialize state
+
+Fixed an error when compiled without -O2:
+db/write_thread.cc:183:14: error: 'state' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ db/write_thread.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/db/write_thread.cc b/db/write_thread.cc
+index 835992c..6f99a11 100644
+--- a/db/write_thread.cc
++++ b/db/write_thread.cc
+@@ -59,7 +59,7 @@ uint8_t WriteThread::BlockingAwaitState(Writer* w, uint8_t goal_mask) {
+ 
+ uint8_t WriteThread::AwaitState(Writer* w, uint8_t goal_mask,
+                                 AdaptationContext* ctx) {
+-  uint8_t state;
++  uint8_t state = 0;
+ 
+   // 1. Busy loop using "pause" for 1 micro sec
+   // 2. Else SOMETIMES busy loop using "yield" for 100 micro sec (default)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
index 68c6bc2..44a451c 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_git.bb
@@ -12,6 +12,7 @@ PV = "6.5.2"
 
 SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH} \
            file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \
+           file://0001-db-write_thread.cc-Initialize-state.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


