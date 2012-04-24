Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SMTZk-0002va-Fu
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 02:25:48 +0200
Received: from mizar.localdomain (87.5.26.19) by smtp206.alice.it (8.6.023.02)
	id 4F1836AD0B325C23; Tue, 24 Apr 2012 02:16:14 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Apr 2012 02:16:12 +0200
Message-Id: <1335226572-12789-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-initramfs][PATCH] klibc_1.5.25: add patches to build with 3.2 kernel headers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Apr 2012 00:25:48 -0000

* kernel_3.2__aligned_u64.patch is already upstream
* hack around the missing headers (now in /generated/asm)
* bump INC_PR
* waiting for klibc_2.0 release

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../klibc-1.5.25/kernel_3.2__aligned_u64.patch     |   46 ++++++++++++++++++++
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |    3 +-
 .../recipes-devtools/klibc/klibc_1.5.25.bb         |   13 ++++++
 3 files changed, 61 insertions(+), 1 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/kernel_3.2__aligned_u64.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/kernel_3.2__aligned_u64.patch b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/kernel_3.2__aligned_u64.patch
new file mode 100644
index 0000000..c2369cd
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-1.5.25/kernel_3.2__aligned_u64.patch
@@ -0,0 +1,46 @@
+From 7f47891c1678874cccca66cd25e6a13486c86d78 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
+Date: Sun, 6 Nov 2011 14:33:40 -0800
+Subject: [PATCH] [klibc] include: [sys/types.h] -> linux/types.h and
+ __aligned_u64
+
+When building klibc 1.5.25 against linux/master (ie. post 3.1) I'm seeing:
+
+klibc/generated/include/linux/if_packet.h:176: error: expected
+specifier-qualifier-list before '__aligned_u64'
+
+which seems to come from upstream commits:
+0d4691ce112be025019999df5f2a5e00c03f03c2 remotes/linux/master~90^2~408  (origin)
+96c131842aab45b5d139d0bcb417796819f5ee92 remotes/linux/master~90^2~169
+ (change from aligned_u64 to __aligned_u64)
+
+and collides with klibc/usr/include/sys/types.h
+
+/* Keeps linux/types.h from getting included elsewhere */
+#define _LINUX_TYPES_H
+
+not defining __aligned_u64 like the kernel's include/linux/types.h does.
+
+Signed-off-by: maximilian attems <max@stro.at>
+---
+ usr/include/sys/types.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/usr/include/sys/types.h b/usr/include/sys/types.h
+index 6780ed1..3a4c738 100644
+--- a/usr/include/sys/types.h
++++ b/usr/include/sys/types.h
+@@ -100,6 +100,10 @@ typedef uint16_t __sum16;
+ typedef uint32_t __sum32;
+ typedef uint64_t __sum64;
+ 
++#define __aligned_u64 __u64 __attribute__((aligned(8)))
++#define __aligned_be64 __be64 __attribute__((aligned(8)))
++#define __aligned_le64 __le64 __attribute__((aligned(8)))
++
+ /*
+  * Some headers seem to require this...
+  */
+-- 
+1.7.6.5
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 0f7cbbe..6a15e0c 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -34,6 +34,7 @@ SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch \
             file://dash_readopt.patch \
             file://wc.patch \
             file://staging.patch \
+            file://kernel_3.2__aligned_u64.patch  \
             "
 
 S = "${WORKDIR}/git"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
index 8a50628..ae43753 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
@@ -2,6 +2,19 @@ PR = "${INC_PR}.0"
 
 export INST = "${D}"
 
+do_compile_prepend() {
+
+    # after kernel 3.1 the headers are moved in /generated
+    if [ ! -e ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/bitsperlong.h ]
+    then
+        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/bitsperlong.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/bitsperlong.h
+        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/errno.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/errno.h
+        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/ioctl.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/ioctl.h
+        ln -sf ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/generated/asm/poll.h ${STAGING_KERNEL_DIR}/arch/${TARGET_ARCH}/include/asm/poll.h
+    fi
+
+}
+
 do_install() {
 
         oe_runmake install
-- 
1.7.3.4



