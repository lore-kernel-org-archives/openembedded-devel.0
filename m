Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C913174781
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 02:45:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3A2jjKT027675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Apr 2018 19:45:45 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 9 Apr 2018 19:45:45 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Apr 2018 10:46:53 +0800
Message-ID: <1523328413-24714-1-git-send-email-Qi.Chen@windriver.com>
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
X-List-Received-Date: Tue, 10 Apr 2018 02:45:44 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This setting was deleted, but on mips and glibc, we still have this
problem. So add this setting back, but limit it to glibc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
index ecac6c5cc..1d562adda 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
@@ -19,6 +19,10 @@ inherit autotools
 
 S = "${WORKDIR}/git"
 
+# On mips, we have the following error.
+#   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
+#   Segmentation fault (core dumped)
+COMPATIBLE_HOST_libc-glibc = "(i.86|x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
 # Disable thumb1
 # {standard input}: Assembler messages:
 # {standard input}:434: Error: lo register required -- `ldr pc,[sp]'
-- 
2.11.0


