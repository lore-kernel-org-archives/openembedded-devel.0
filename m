Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 60E73736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 01:29:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7Q1ToHh025245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 18:29:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 25 Aug 2015 18:29:49 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Aug 2015 09:25:25 +0800
Message-ID: <1440552325-29335-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440552325-29335-1-git-send-email-kai.kang@windriver.com>
References: <1440552325-29335-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libhugetlbfs: avoid using keyword restrict as var name
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 01:29:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When compile with gcc 5.x, libhugetlbfs fails with:

| hugeutils.c: In function '__lh_hugetlbfs_setup_env':
| hugeutils.c:304:40: error: expected identifier or '(' before restrict'
|    char *p, *tok, *exe, buf[MAX_EXE+1], restrict[MAX_EXE];
|                                         ^

Rename variable to avoid using keyword restrict as variable name to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ugetlbfs-avoid-using-restrict-as-var-name.patch | 34 ++++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch
new file mode 100644
index 0000000..b77cfe1
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch
@@ -0,0 +1,34 @@
+Avoid using keyword restrict as variable name which causes error with gcc 5.x:
+
+| hugeutils.c: In function '__lh_hugetlbfs_setup_env':
+| hugeutils.c:304:40: error: expected identifier or '(' before 'restrict'
+|    char *p, *tok, *exe, buf[MAX_EXE+1], restrict[MAX_EXE];
+|                                         ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/hugeutils.c b/hugeutils.c
+index 53a7fbd..b9d7001 100644
+--- a/hugeutils.c
++++ b/hugeutils.c
+@@ -301,14 +301,14 @@ void hugetlbfs_setup_env()
+ 
+ 	env = getenv("HUGETLB_RESTRICT_EXE");
+ 	if (env) {
+-		char *p, *tok, *exe, buf[MAX_EXE+1], restrict[MAX_EXE];
++		char *p, *tok, *exe, buf[MAX_EXE+1], restricted[MAX_EXE];
+ 		int found = 0;
+ 
+ 		exe = get_exe_name(buf, sizeof buf);
+ 		DEBUG("Found HUGETLB_RESTRICT_EXE, this exe is \"%s\"\n", exe);
+-		strncpy(restrict, env, sizeof restrict);
+-		restrict[sizeof(restrict)-1] = 0;
+-		for (p = restrict; (tok = strtok(p, ":")) != NULL; p = NULL) {
++		strncpy(restricted, env, sizeof restricted);
++		restricted[sizeof(restricted)-1] = 0;
++		for (p = restricted; (tok = strtok(p, ":")) != NULL; p = NULL) {
+ 			DEBUG("  ...check exe match for \"%s\"\n",  tok);
+ 			if (strcmp(tok, exe) == 0) {
+ 				found = 1;
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index ae5e46a..b7cc416 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
+    file://libhugetlbfs-avoid-using-restrict-as-var-name.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


