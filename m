Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BF2D474591
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 10:08:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6NA8chp031263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jul 2018 03:08:38 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 23 Jul 2018 03:08:37 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Mon, 23 Jul 2018 03:08:36 -0700
Message-ID: <20180723100836.12809-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180723100836.12809-1-hongzhi.song@windriver.com>
References: <20180723100836.12809-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v3 1/1] kernel-selftest: add support for musllibc and perfect the recipe
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
X-List-Received-Date: Mon, 23 Jul 2018 10:08:38 -0000
Content-Type: text/plain

1. Add support for musllibc
2. Use PACKAGECONFIG to add dependency

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../kernel-selftest/kernel-selftest.bb             | 30 ++++++++--------------
 ...bpf-test_progs.c-add-support-for-musllibc.patch | 25 ++++++++++++++++++
 2 files changed, 35 insertions(+), 20 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 2c23b26b5..71e3bf9b0 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -5,27 +5,17 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \
 "
 
-# vm
-SRC_URI += "file://COPYING \
-"
+# for musl libc
 SRC_URI_libc-musl += "file://userfaultfd.patch \
+                      file://0001-bpf-test_progs.c-add-support-for-musllibc.patch \
 "
 
-# for bpf and vm
-DEPENDS = " \
-    elfutils \
-    libcap \
-    libcap-ng \
-    fuse \
-    util-linux \
-    rsync-native \
-"
-# for vm
-RDEPENDS_${PN} += "libgcc \
-                   bash \
-"
+PACKAGECONFIG ??= "bpf vm"
+
+PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
+PACKAGECONFIG[vm] = ",,,libgcc bash"
 
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_patch[depends] += "virtual/kernel:do_shared_workdir"
 
 inherit linux-kernel-base kernel-arch
 
@@ -69,10 +59,10 @@ do_compile() {
 do_install() {
     for i in ${TEST_LIST}
     do
-        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/opt/kselftest/${i} install
+        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/usr/kernel-selftest/${i} install
     done
 
-    chown root:root  -R ${D}/opt/kselftest
+    chown root:root  -R ${D}/usr/kernel-selftest
 }
 
 do_configure() {
@@ -101,4 +91,4 @@ remove_clang_related() {
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
-FILES_${PN} += "/opt/kselftest/"
+FILES_${PN} += "/usr/kernel-selftest"
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
new file mode 100644
index 000000000..5f2542681
--- /dev/null
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
@@ -0,0 +1,25 @@
+From a2e6b8fde28b743b69990a4e16c296e099631ed4 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Mon, 23 Jul 2018 00:56:19 -0700
+Subject: [PATCH] bpf: test_progs.c add support for musllibc
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ tools/testing/selftests/bpf/test_progs.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
+index 11ee25c..21b27b7 100644
+--- a/tools/testing/selftests/bpf/test_progs.c
++++ b/tools/testing/selftests/bpf/test_progs.c
+@@ -4,6 +4,7 @@
+  * modify it under the terms of version 2 of the GNU General Public
+  * License as published by the Free Software Foundation.
+  */
++#define __always_inline __inline __attribute__ ((__always_inline__))
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <errno.h>
+-- 
+2.11.0
+
-- 
2.11.0


