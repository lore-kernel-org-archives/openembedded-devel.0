Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 726C97C6B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 03:39:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x263dAo9014896
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 19:39:11 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 5 Mar 2019 19:39:10 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Mar 2019 22:39:08 -0500
Message-ID: <20190306033908.173027-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] leveldb: fix compile errors for mips with DEFAULTTUNE mips
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
X-List-Received-Date: Wed, 06 Mar 2019 03:39:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to compile leveldb for qemumips with DEFAULTTUNE 'mips':

| {standard input}: Assembler messages:
| {standard input}:8004: Error: opcode not supported on this processor:
  mips1 (mips1) `sync'
| {standard input}:10296: Error: opcode not supported on this processor:
  mips1 (mips1) `sync'
| make: *** [out-shared/db/db_bench.o] Error 1

Asm instruction 'sync' is called in platform-specific function
MemoryBarrier() which is used by AtomicPointer(). Comment out the
definition of MemoryBarrier() for mips to avoid the errors. And turn to
use AtomicPointer() based on C++11 <atomc>.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...fine-function-MemoryBarrier-for-mips.patch | 43 +++++++++++++++++++
 meta-oe/recipes-dbs/leveldb/leveldb_git.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch
new file mode 100644
index 000000000..fc7743030
--- /dev/null
+++ b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch
@@ -0,0 +1,43 @@
+It fails to compile leveldb for qemumips with default tune 'mips':
+
+| {standard input}: Assembler messages:
+| {standard input}:8004: Error: opcode not supported on this processor:
+  mips1 (mips1) `sync'
+| {standard input}:10296: Error: opcode not supported on this processor:
+  mips1 (mips1) `sync'
+| make: *** [out-shared/db/db_bench.o] Error 1
+
+Asm instruction 'sync' is called in platform-specific function
+MemoryBarrier() which is used by AtomicPointer(). Comment out the
+definition of MemoryBarrier() for mips to avoid the errors. And turn to
+use AtomicPointer() based on C++11 <atomic>.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ port/atomic_pointer.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/port/atomic_pointer.h b/port/atomic_pointer.h
+index 1c4c7aa..7025ac3 100644
+--- a/port/atomic_pointer.h
++++ b/port/atomic_pointer.h
+@@ -113,11 +113,11 @@ inline void MemoryBarrier() {
+ #define LEVELDB_HAVE_MEMORY_BARRIER
+ 
+ // MIPS
+-#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
+-inline void MemoryBarrier() {
+-  __asm__ __volatile__("sync" : : : "memory");
+-}
+-#define LEVELDB_HAVE_MEMORY_BARRIER
++//#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
++//inline void MemoryBarrier() {
++//  __asm__ __volatile__("sync" : : : "memory");
++//}
++//#define LEVELDB_HAVE_MEMORY_BARRIER
+ 
+ #endif
+ 
diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
index 8fec89c6f..10988726a 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/google/${BPN}.git \
            file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
            file://0002-makefile-build-SHARED_MEMENVLIB.patch \
            file://0001-Makefile-Fix-parallel-build.patch \
+           file://do-not-define-function-MemoryBarrier-for-mips.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.20.0


