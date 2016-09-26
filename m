Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 57675606B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 07:47:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q7loM3027255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 00:47:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 26 Sep 2016 00:47:49 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Sep 2016 15:47:48 +0800
Message-ID: <1474876068-6032-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] gperftools: fix to work on aarch64
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
X-List-Received-Date: Mon, 26 Sep 2016 07:47:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add '--disable-libunwind' to make it work on aarch64. This would avoid
system hanging when using libtcmalloc.so.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.5.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
index 1572d4c..2e4479c 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.5.bb
@@ -14,5 +14,6 @@ inherit autotools
 # On mips, we have the following error.
 #   do_page_fault(): sending SIGSEGV to ls for invalid read access from 00000008
 #   Segmentation fault (core dumped)
-# On aarch64, system hangs when using libtcmalloc.so.
-COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|arm).*-linux*"
+COMPATIBLE_HOST = "(i.86|x86_64|powerpc|powerpc64|arm|aarch64).*-linux*"
+# On aarch64, add this option to avoid system hanging when using libtcmalloc.so.
+EXTRA_OECONF_aarch64 += "--disable-libunwind"
-- 
1.9.1


