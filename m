Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EAA0175528
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 07:49:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5M7nJsU019663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 00:49:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 22 Jun 2018 00:49:18 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Jun 2018 15:52:18 +0800
Message-ID: <1529653938-1450-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gperftools: add the setting of COMPATIBLE_HOST back
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
X-List-Received-Date: Fri, 22 Jun 2018 07:49:19 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This setting was deleted, but on mips and glibc, we still have this
problem. So add this setting back, but limit it to glibc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
index ecac6c5cc..e475663f2 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
@@ -19,6 +19,10 @@ inherit autotools
 
 S = "${WORKDIR}/git"
 
+# On mips, we have the following error.
+#   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
+#   Segmentation fault (core dumped)
+COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
 # Disable thumb1
 # {standard input}: Assembler messages:
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
-- 
2.11.0


