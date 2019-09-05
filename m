Return-Path: <yuanc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8571C6C0B7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 06:35:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,469,1559491200"; d="scan'208";a="74876224"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Sep 2019 14:35:40 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id A10F84CDE64D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2019 14:35:35 +0800 (CST)
Received: from localhost.localdomain (10.167.225.21) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 5 Sep 2019 14:35:37 +0800
From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Sep 2019 15:35:13 +0900
Message-ID: <20190905063513.40836-1-yuanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.21]
X-yoursite-MailScanner-ID: A10F84CDE64D.A10A9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yuanc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] numactl: upgrade 2.0.12 -> 2.0.13
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
X-List-Received-Date: Thu, 05 Sep 2019 06:35:49 -0000
Content-Type: text/plain

Remove patch: 0001-fix-NULL-pointer-problem.patch
since this is included in 2.0.13

Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
---
 .../0001-fix-NULL-pointer-problem.patch       | 35 -------------------
 .../recipes-support/numactl/numactl_git.bb    |  5 ++-
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch

diff --git a/meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch b/meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch
deleted file mode 100644
index 0497613dd..000000000
--- a/meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 5c16beff9909b28f55f25f48ed7ddbf98d8b1d5c Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Wed, 18 Jul 2018 09:43:55 +0800
-Subject: [PATCH] fix NULL pointer problem
-
-return 0 if distance_table is NULL
-
-Upstream-Status: Pending
-
-read_distance_table() maybe return 0, but distance_table is not set,
-if distance_table is used, and will lead to SEGFAULT
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- distance.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/distance.c b/distance.c
-index 8d472af..6a6e886 100644
---- a/distance.c
-+++ b/distance.c
-@@ -113,6 +113,8 @@ int numa_distance(int a, int b)
- 		int err = read_distance_table();
- 		if (err < 0)
- 			return 0;
-+		if(!distance_table)
-+			return 0;
- 	}
- 	if ((unsigned)a >= distance_numnodes || (unsigned)b >= distance_numnodes)
- 		return 0;
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index 279ac0415..f13b1795f 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -10,11 +10,10 @@ inherit autotools-brokensep ptest
 
 LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
 
-SRCREV = "841253d1313b01a968c380cae4f498f20c46e5aa"
-PV = "2.0.12+git${SRCPV}"
+SRCREV = "5d9f16722e3df49dc618a9f361bd482559695db7"
+PV = "2.0.13+git${SRCPV}"
 
 SRC_URI = "git://github.com/numactl/numactl \
-    file://0001-fix-NULL-pointer-problem.patch \
     file://Fix-the-test-output-format.patch \
     file://Makefile \
     file://run-ptest \
-- 
2.17.1




