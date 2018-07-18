Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 316CF78493
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:31:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6I7VcKh012401
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:31:38 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 18 Jul 2018 00:31:37 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2018 15:31:23 +0800
Message-ID: <1531899089-395618-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
References: <1531899089-395618-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH][meta-oe] numactl: 2.0.11 -> 2.0.12
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
X-List-Received-Date: Wed, 18 Jul 2018 07:31:38 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

License-Update: license file name updated
                format changed, but most content is remain
                add mail of related person.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../numactl/0001-fix-NULL-pointer-problem.patch    | 35 ++++++++++++++++++++++
 .../numactl/numactl/fix-null-pointer.patch         | 28 -----------------
 meta-oe/recipes-support/numactl/numactl_git.bb     |  8 ++---
 3 files changed, 39 insertions(+), 32 deletions(-)
 create mode 100644 meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch
 delete mode 100644 meta-oe/recipes-support/numactl/numactl/fix-null-pointer.patch

diff --git a/meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch b/meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch
new file mode 100644
index 0000000..0497613
--- /dev/null
+++ b/meta-oe/recipes-support/numactl/numactl/0001-fix-NULL-pointer-problem.patch
@@ -0,0 +1,35 @@
+From 5c16beff9909b28f55f25f48ed7ddbf98d8b1d5c Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Wed, 18 Jul 2018 09:43:55 +0800
+Subject: [PATCH] fix NULL pointer problem
+
+return 0 if distance_table is NULL
+
+Upstream-Status: Pending
+
+read_distance_table() maybe return 0, but distance_table is not set,
+if distance_table is used, and will lead to SEGFAULT
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ distance.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/distance.c b/distance.c
+index 8d472af..6a6e886 100644
+--- a/distance.c
++++ b/distance.c
+@@ -113,6 +113,8 @@ int numa_distance(int a, int b)
+ 		int err = read_distance_table();
+ 		if (err < 0)
+ 			return 0;
++		if(!distance_table)
++			return 0;
+ 	}
+ 	if ((unsigned)a >= distance_numnodes || (unsigned)b >= distance_numnodes)
+ 		return 0;
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/numactl/numactl/fix-null-pointer.patch b/meta-oe/recipes-support/numactl/numactl/fix-null-pointer.patch
deleted file mode 100644
index 53952ae..0000000
--- a/meta-oe/recipes-support/numactl/numactl/fix-null-pointer.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-[PATCH] return 0 if distance_table is NULL
-
-Upstream-Status: Pending
-
-read_distance_table() maybe return 0, but distance_table is not set,
-if distance_table is used, and will lead to SEGFAULT
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- distance.c |    2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/distance.c b/distance.c
-index 4a26972..c6ca021 100755
---- a/distance.c
-+++ b/distance.c
-@@ -113,6 +113,8 @@ int numa_distance(int a, int b)
- 		int err = read_distance_table();
- 		if (err < 0)
- 			return 0;
-+		if (!distance_table)
-+			return 0;
- 	}
- 	return distance_table[a * distance_numnodes + b];
- }
--- 
-1.7.10.4
-
diff --git a/meta-oe/recipes-support/numactl/numactl_git.bb b/meta-oe/recipes-support/numactl/numactl_git.bb
index b9cbcf0..c1c3879 100644
--- a/meta-oe/recipes-support/numactl/numactl_git.bb
+++ b/meta-oe/recipes-support/numactl/numactl_git.bb
@@ -9,13 +9,13 @@ RDEPENDS_${PN} = "perl"
 
 inherit autotools-brokensep ptest
 
-LIC_FILES_CHKSUM = "file://README;beginline=19;endline=32;md5=5644cc3851cb2499f6c48e52fe198bd9"
+LIC_FILES_CHKSUM = "file://README.md;beginline=19;endline=32;md5=f8ff2391624f28e481299f3f677b21bb"
 
-SRCREV = "ea3a70681c2f523fe58e1d44527f478ca76db74e"
-PV = "2.0.11+git${SRCPV}"
+SRCREV = "841253d1313b01a968c380cae4f498f20c46e5aa"
+PV = "2.0.12+git${SRCPV}"
 
 SRC_URI = "git://github.com/numactl/numactl \
-    file://fix-null-pointer.patch \
+    file://0001-fix-NULL-pointer-problem.patch \
     file://Fix-the-test-output-format.patch \
     file://Makefile \
     file://run-ptest \
-- 
2.7.4


