Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDC237C8E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 02:31:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1J2V86l012676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2019 18:31:19 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Mon, 18 Feb 2019 18:30:58 -0800
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Feb 2019 18:30:57 -0800
Message-ID: <20190219023057.42559-2-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190219023057.42559-1-wenlin.kang@windriver.com>
References: <20190219023057.42559-1-wenlin.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-java][PATCH 1/1] openjdk: fix a random crash on JNI_CreateJavaVM
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
X-List-Received-Date: Tue, 19 Feb 2019 02:31:28 -0000
Content-Type: text/plain

When call JNI_CreateJavaVM API, sometimes it will crash(we have
reproduced it on quemuppc), this patch fixes it.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 .../openjdk-8-release-172b11-common.inc       |  1 +
 ...otspot-fix-crash-on-JNI_CreateJavaVM.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch

diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
index ad20585..b37608c 100644
--- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
+++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
@@ -21,6 +21,7 @@ PATCHES_URI = "\
     ${LIBPNG_NEON_PATCH} \
     file://handle_extra_output.patch \
     file://hotspot-handle-gcc7-format-overflow.patch \
+    file://0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
 "
 HOTSPOT_UB_PATCH = "\
     file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch b/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
new file mode 100644
index 0000000..4618b6b
--- /dev/null
+++ b/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
@@ -0,0 +1,36 @@
+From d0ebd6f108df9b0f9533de6f16280ceec136d8e6 Mon Sep 17 00:00:00 2001
+From: Wenlin Kang <wenlin.kang@windriver.com>
+Date: Sun, 17 Feb 2019 22:38:33 -0800
+Subject: [PATCH] hotspot: fix crash on JNI_CreateJavaVM
+
+In function os::pd_create_stack_guard_pages(char* addr, size_t size),
+when addr < os::Linux::initial_thread_stack_bottom(), usually munmap()
+will not be called, but when mincore()==-1, get_stack_commited_bottom()
+will make stack_extent < os::Linux::initial_thread_stack_bottom() and
+stack_extent < addr too, then munmap() is called, in such case, it may
+cause segment(we have reproduced it on linux_PPC).
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ hotspot/src/os/linux/vm/os_linux.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/hotspot/src/os/linux/vm/os_linux.cpp b/hotspot/src/os/linux/vm/os_linux.cpp
+index 044a70a6..b8246ce4 100644
+--- a/hotspot/src/os/linux/vm/os_linux.cpp
++++ b/hotspot/src/os/linux/vm/os_linux.cpp
+@@ -3078,7 +3078,8 @@ bool os::pd_create_stack_guard_pages(char* addr, size_t size) {
+     uintptr_t stack_extent = (uintptr_t) os::Linux::initial_thread_stack_bottom();
+     unsigned char vec[1];
+ 
+-    if (mincore((address)stack_extent, os::vm_page_size(), vec) == -1) {
++    if ((mincore((address)stack_extent, os::vm_page_size(), vec) == -1)
++        && ((size_t)addr > (size_t)stack_extent)) {
+       // Fallback to slow path on all errors, including EAGAIN
+       stack_extent = (uintptr_t) get_stack_commited_bottom(
+                                     os::Linux::initial_thread_stack_bottom(),
+-- 
+2.17.1
+
-- 
2.17.1


