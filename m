Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 50AF4605B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 08:06:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA9865ve027798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Nov 2016 00:06:05 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 00:06:04 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Nov 2016 15:58:52 +0800
Message-ID: <20161109075853.12636-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161109075853.12636-1-kai.kang@windriver.com>
References: <20161109075853.12636-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libhugetlbfs: 1.19 -> 1.20
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
X-List-Received-Date: Wed, 09 Nov 2016 08:06:04 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade libhugetlbfs from 1.19 to 1.20.

* Remove libhugetlbfs-avoid-using-restrict-as-var-name.patch which is
  fixed in upstream.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ugetlbfs-avoid-using-restrict-as-var-name.patch | 34 ----------------------
 .../libhugetlbfs/libhugetlbfs_git.bb               |  5 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch
deleted file mode 100644
index b77cfe1..0000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-using-restrict-as-var-name.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Avoid using keyword restrict as variable name which causes error with gcc 5.x:
-
-| hugeutils.c: In function '__lh_hugetlbfs_setup_env':
-| hugeutils.c:304:40: error: expected identifier or '(' before 'restrict'
-|    char *p, *tok, *exe, buf[MAX_EXE+1], restrict[MAX_EXE];
-|                                         ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/hugeutils.c b/hugeutils.c
-index 53a7fbd..b9d7001 100644
---- a/hugeutils.c
-+++ b/hugeutils.c
-@@ -301,14 +301,14 @@ void hugetlbfs_setup_env()
- 
- 	env = getenv("HUGETLB_RESTRICT_EXE");
- 	if (env) {
--		char *p, *tok, *exe, buf[MAX_EXE+1], restrict[MAX_EXE];
-+		char *p, *tok, *exe, buf[MAX_EXE+1], restricted[MAX_EXE];
- 		int found = 0;
- 
- 		exe = get_exe_name(buf, sizeof buf);
- 		DEBUG("Found HUGETLB_RESTRICT_EXE, this exe is \"%s\"\n", exe);
--		strncpy(restrict, env, sizeof restrict);
--		restrict[sizeof(restrict)-1] = 0;
--		for (p = restrict; (tok = strtok(p, ":")) != NULL; p = NULL) {
-+		strncpy(restricted, env, sizeof restricted);
-+		restricted[sizeof(restricted)-1] = 0;
-+		for (p = restricted; (tok = strtok(p, ":")) != NULL; p = NULL) {
- 			DEBUG("  ...check exe match for \"%s\"\n",  tok);
- 			if (strcmp(tok, exe) == 0) {
- 				found = 1;
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 301b550..72553cf 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -7,10 +7,10 @@ DEPENDS = "sysfsutils perl"
 RDEPENDS_${PN} += "bash perl python python-io python-lang python-subprocess python-resource ${PN}-perl"
 RDEPENDS_${PN}-tests += "bash"
 
-PV = "2.19"
+PV = "2.20"
 PE = "1"
 
-SRCREV = "426c22d65415fcb8927f68fbc5887e075a8dc40a"
+SRCREV = "e44180072b796c0e28e53c4d01ef6279caaa2a99"
 SRC_URI = " \
     git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https \
     file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
@@ -18,7 +18,6 @@ SRC_URI = " \
     file://tests-Makefile-install-static-4G-edge-testcases.patch \
     file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
     file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
-    file://libhugetlbfs-avoid-using-restrict-as-var-name.patch \
     file://Force-text-segment-alignment-to-0x08000000-for-i386-.patch \
 "
 
-- 
2.10.1


