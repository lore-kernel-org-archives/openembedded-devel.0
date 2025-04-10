Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A91C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 10:19:30 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.30964.1744280359876754136
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 03:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 10 Apr 2025 19:19:16 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.127 with ESMTP; 10 Apr 2025 19:19:16 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-networking][PATCH] tcpreplay: fix build error with gcc-15
Date: Thu, 10 Apr 2025 19:19:14 +0900
Message-Id: <20250410101914.1363306-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 10:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116766

From: "mark.yang" <mark.yang@lge.com>

There are two types of errors:
1. Linker errors for txring.c
TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'

The txring file needs to include config.h to build properly.
Surprisingly, in the same environment with gcc14, HAVE_TX_RING is not declared in config.h because it fails during the configure stage.

The config.log below is from the same environment with gcc14.
configure:26549: result: no
configure:26557: checking for TX_RING socket sending support
configure:26579: conftest.c >&5
In file included from conftest.c:130:
/linux/if_packet.h:14:8: error: redefinition of 'struct sockaddr_ll'
   14 | struct sockaddr_ll {
      |        ^~~~~~~~~~~
Therefore, it seems that the linker error did not occur previously.

2. Incompatible type assignment in txring.c when allocating memory for txring_t structure

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-Fix-linker-error-for-TX_RING.patch   | 71 +++++++++++++++++++
 ...mpatible-type-assignment-in-txring.c.patch | 31 ++++++++
 .../tcpreplay/tcpreplay_4.5.1.bb              |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch
new file mode 100644
index 0000000000..d8f0ab270c
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/0001-Fix-linker-error-for-TX_RING.patch
@@ -0,0 +1,71 @@
+From 36e038d9e4047ae42a148f671f18971cc6a68558 Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 10 Apr 2025 18:30:52 +0900
+Subject: [PATCH] Fix linker error for TX_RING
+
+Found similar issue in gcc 15 build environment.
+- See more details at: http://errors.yoctoproject.org/Errors/Details/851800/
+```
+TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
+/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
+TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
+/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
+TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
+/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
+TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
+/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
+TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket':
+/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:328:(.text+0x1be): undefined reference to `txring_put'
+TOPDIR/tmp/work/core2-64-oe-linux/tcpreplay/4.5.1/recipe-sysroot-native/usr/bin/x86_64-oe-linux/../../libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/15.0.1/ld: ./common/libcommon.a(sendpacket.o): in function `sendpacket_open_pf':
+/usr/src/debug/tcpreplay/4.5.1/src/common/sendpacket.c:1088:(.text+0x7ea): undefined reference to `txring_init'
+```
+- The result of "nm -u txring.o" shows no symbols exist.
+
+- The config.h has HAVE_TX_RING defined but txring.c is not aware of it.
+  txring.c and txring.h include config.h at the beginning.
+
+- This resulted in a successful build in my build environment.
+
+It may
+Fixes #731
+Fixes #904
+
+Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/924]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/common/txring.c | 3 +++
+ src/common/txring.h | 4 ++--
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/common/txring.c b/src/common/txring.c
+index d5768d75..f522893d 100644
+--- a/src/common/txring.c
++++ b/src/common/txring.c
+@@ -31,6 +31,9 @@
+  * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#include "defines.h"
++#include "config.h"
++
+ #ifdef HAVE_TX_RING
+ 
+ #include "txring.h"
+diff --git a/src/common/txring.h b/src/common/txring.h
+index 309da84c..3f14cac0 100644
+--- a/src/common/txring.h
++++ b/src/common/txring.h
+@@ -33,11 +33,11 @@
+ 
+ #pragma once
+ 
+-#ifdef HAVE_TX_RING
+-
+ #include "defines.h"
+ #include "config.h"
+ 
++#ifdef HAVE_TX_RING
++
+ #if __GLIBC__ >= 2 && __GLIBC_MINOR >= 1
+ #include <net/ethernet.h> /* the L2 protocols */
+ #include <netpacket/packet.h>
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch
new file mode 100644
index 0000000000..906c30e147
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/0002-fix-incompatible-type-assignment-in-txring.c.patch
@@ -0,0 +1,31 @@
+From 5615e8f7bbf83f03acacd6d6ba9ff8dc6fdc91df Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 10 Apr 2025 18:49:51 +0900
+Subject: [PATCH] fix incompatible type assignment in txring.c
+
+* There is an incompatible type assignment error in txring.c.
+  txring.c:200:12: error: incompatible types when assigning to type 'txring_t' {aka 'struct txring_s'} from type 'txring_t *' {aka 'struct txring_s *'}
+  200 |     *txp = (txring_t *)safe_malloc(sizeof(txring_t));
+      |            ^
+
+  txp is allocated as txring_t *, so I fixed it.
+
+Upstream-Status: Submitted [https://github.com/appneta/tcpreplay/pull/924]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/common/txring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/txring.c b/src/common/txring.c
+index f522893d..b062dac2 100644
+--- a/src/common/txring.c
++++ b/src/common/txring.c
+@@ -197,7 +197,7 @@ txring_init(int fd, unsigned int mtu)
+     txring_t *txp;
+ 
+     /* allocate memory for structure and fill it with different stuff*/
+-    *txp = (txring_t *)safe_malloc(sizeof(txring_t));
++    txp = (txring_t *)safe_malloc(sizeof(txring_t));
+     txp->treq = (struct tpacket_req *)safe_malloc(sizeof(struct tpacket_req));
+ 
+     txring_mkreq(txp->treq, mtu);
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
index f01bbb95a5..46e06a928e 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.5.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-libopts.m4-set-POSIX_SHELL-to-bin-sh.patch \
+    file://0001-Fix-linker-error-for-TX_RING.patch \
+    file://0002-fix-incompatible-type-assignment-in-txring.c.patch \
 "
 
 SRC_URI[sha256sum] = "2de79bfd67ec92ca9ae2ffb50456dd1d53ff40f3fa71b422c65e8062013c9e85"

