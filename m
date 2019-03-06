Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2B677C6F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 01:37:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x261bC2s018660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Mar 2019 17:37:12 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 5 Mar 2019 17:37:11 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>, <joe.slater@windriver.com>
Date: Tue, 5 Mar 2019 20:37:07 -0500
Message-ID: <20190306013707.135575-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] leveldb: fix compile error with default tune 'mips'
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
X-List-Received-Date: Wed, 06 Mar 2019 01:37:11 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When build leveldb with default tune 'mips', it fails to compile with
errors:

| {standard input}: Assembler messages:
| {standard input}:8004: Error: opcode not supported on this processor:
  mips1 (mips1) `sync'
| {standard input}:10296: Error: opcode not supported on this processor:
  mips1 (mips1) `sync'
| make: *** [out-shared/db/db_bench.o] Error 1

Add 'mips32' to TUNE_FEATURES which eventually add '-march=mips32' to
CXX to fix the errors.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-dbs/leveldb/leveldb_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
index 8fec89c6f..f0e434077 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
@@ -17,6 +17,14 @@ S = "${WORKDIR}/git"
 
 inherit utils
 
+# leveldb fails to compile with default tune 'mips':
+# | {standard input}:59226: Error: opcode not supported on this processor: mips1 (mips1) `sync'
+# | make: *** [out-shared/db/db_impl.o] Error 1
+python () {
+    if 'o32' in d.getVar('TUNE_FEATURES') and d.getVar('DEFAULTTUNE') == 'mips':
+        d.appendVar('TUNE_FEATURES', ' mips32')
+}
+
 do_compile() {
     # do not use oe_runmake. oe_runmake pass to make compilation arguments and override
     # leveldb makefile variable CFLAGS and broke leveldb build.
-- 
2.20.0


