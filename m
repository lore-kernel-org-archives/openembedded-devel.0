Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5F278F4C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 01:46:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7E1kMoo010392
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 18:46:23 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 13 Aug 2018 18:46:10 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 18:46:10 -0700
Message-ID: <20180814014610.40143-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] kernel-selftest: compatible with latest kernel
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
X-List-Received-Date: Tue, 14 Aug 2018 01:46:23 -0000
Content-Type: text/plain

There are some new program added for bpf. So we make corresponding
modifications.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 27d98a304..e09831f76 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -79,7 +79,7 @@ do_configure() {
     :
 }
 
-do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_clang_related"
+do_patch[prefuncs] += "copy_kselftest_source_from_kernel remove_unrelated"
 python copy_kselftest_source_from_kernel() {
     sources = (d.getVar("KERNEL_SELFTEST_SRC") or "").split()
     src_dir = d.getVar("STAGING_KERNEL_DIR")
@@ -94,8 +94,9 @@ python copy_kselftest_source_from_kernel() {
             bb.utils.copyfile(src, dest)
 }
 
-remove_clang_related() {
-	sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' ${S}/tools/testing/selftests/bpf/Makefile
+remove_unrelated() {
+	sed -i -e '/test_pkt_access/d' -e '/test_pkt_md_access/d' -e '/sockmap_verdict_prog/d' ${S}/tools/testing/selftests/bpf/Makefile
+    sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.11.0


