Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC027C760
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 23:51:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x24NpXET020102
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Mar 2019 15:51:33 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 4 Mar 2019 15:51:32 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Mar 2019 15:51:32 -0800
Message-ID: <20190304235132.188006-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] leveldb: restrict building for mips64
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
X-List-Received-Date: Mon, 04 Mar 2019 23:51:32 -0000
Content-Type: text/plain

Do not try to build lib32-leveldb.  libn32-leveldb will build.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-oe/recipes-dbs/leveldb/leveldb_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
index 8fec89c..908ad3e 100644
--- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
+++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
@@ -35,3 +35,7 @@ do_install() {
 
 PACKAGES =+ "${PN}-ptest"
 FILES_${PN}-ptest = "${bindir}"
+
+# Do not try to build lib32-leveldb for mips64, but allow libn32-leveldb.
+#
+COMPATIBLE_HOST_mipsarcho32_pn-lib32-leveldb = "null"
-- 
2.7.4


