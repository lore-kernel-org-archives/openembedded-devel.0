Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBC7265D48
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:37:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7H9bGd5032240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:37:17 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 02:37:16 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Aug 2018 17:47:48 +0800
Message-ID: <1534499269-29908-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] kernel-selftest: compatible with latest kernel
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
X-List-Received-Date: Fri, 17 Aug 2018 09:37:16 -0000
Content-Type: text/plain

From: "Hongzhi.Song" <hongzhi.song@windriver.com>

There are some new program added for bpf. So we make corresponding
modifications.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 27d98a3..d5ccace 100644
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
+	sed -i '/llc/d' ${S}/tools/testing/selftests/bpf/Makefile
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.7.4


