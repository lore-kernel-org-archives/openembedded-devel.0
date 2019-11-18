Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1398A7F8AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:04:07 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 193so9740368pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Q9BEvsVTXu/YFEGYfmnOjvIaF/ws3hihhNeCO2L1Kj0=;
	b=uaFHg+3ZKV7Lcx2XVRy5x6xhAIhp2bM0fTuAzJu3K+8fC4wotZ+zsbJlxE59exESDv
	YEIkpObP2KWARTcnQqaWn4PlUpcLvFC6wC4GZnfcXkItmz5pP5VQIyps+MMD46hTa4xX
	5Q/gSCrZmiJIbfUNL+5BfyKhZZD098vjdGHMqTf4yu8r0to8b84fqMZ2HT491J9le3YJ
	xCq8O9rGqtGKeg6h8k4ebzLZlF331UifDfP9x8+KZmApx2+mI2DcDGBftxwhosH9Mys+
	Ew6GOIWd4MXOHp2r9rAKv3xqT5YExHQxx2F/st3cN7Lmake7homJQvcKeXC/Zzth0zwN
	wBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q9BEvsVTXu/YFEGYfmnOjvIaF/ws3hihhNeCO2L1Kj0=;
	b=pQi12ePxvbNwKa6e3Ovf79B93HVvHBpOdh4iMwhk2V2SL6zJbA/sIzkKn8yQy9jA3p
	fKDR4RoN6whdW8P0/PnxROM5puDTGo4Ef3x5bjeY/8sqEXmF4K3MEATnYskSFzMpmdWH
	DMPQIXui/DmsM4mPNZGfz6IwAVeAF0x8sqfIe7C5I/6SPnjGScfKykeFGvuYfh/QCGHW
	NWAwEYjlV4V5gvGQNC0pGv5sY1ylMYCQXc+LsiedkCRd0NLAbqbR9vIVsk028ZpAasbQ
	8i6ZCoDRHJrNy2l+ivd/rv1lZenD3Dp0578LifEqfn6bONl6XAwV9wFVjdJWvGtiPomY
	H48Q==
X-Gm-Message-State: APjAAAVOLLEIpAph0R/anYaksnaZz/qBr+d3VgqfbYzwxQ2tKKAc5rA/
	qKbWtadX2GKOfVwMeNyC3Y9zWN+Hr7U=
X-Google-Smtp-Source: APXvYqzPWbUm/nttUgPKwZjJ/STofXqsUgRdV2c3Q+NzgRXTzqeDVlBJp1X1JL6FytaexpLZ9csRAw==
X-Received: by 2002:aa7:9592:: with SMTP id z18mr16951714pfj.176.1574053448623;
	Sun, 17 Nov 2019 21:04:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	y6sm16881131pfm.12.2019.11.17.21.04.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 21:04:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 21:03:51 -0800
Message-Id: <20191118050352.1379153-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118050352.1379153-1-raj.khem@gmail.com>
References: <20191118050352.1379153-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] libtorrent: Drop 64bit atomics patch for mips/ppc
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
X-List-Received-Date: Mon, 18 Nov 2019 05:04:08 -0000
Content-Transfer-Encoding: 8bit

These patches are no longer needed with latest gcc/clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-64bit-atomic-helpers-for-ppc-32-bit.patch |  30 --
 ...0001-implement-64bit-atomic-for-mips.patch | 263 ------------------
 .../libtorrent/libtorrent_git.bb              |   2 -
 3 files changed, 295 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch
 delete mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch
deleted file mode 100644
index 4d0979710c..0000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c9859a38a58996b8767a30e14febc03845f66f95 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 1 Jul 2017 13:10:53 -0700
-Subject: [PATCH] Define 64bit atomic helpers for ppc 32-bit
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/atomic64.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/atomic64.c b/src/atomic64.c
-index f841b39b..35c7c9d8 100644
---- a/src/atomic64.c
-+++ b/src/atomic64.c
-@@ -18,10 +18,10 @@
- #include <stdbool.h>
- 
- /*
-- * only need these on MIPS, since it lacks hardware 64-bit atomics,
-+ * only need these on MIPS & PPC32, since it lacks hardware 64-bit atomics,
-  * unlike x86 and ARM.
-  */
--#if defined(__mips__) || defined(__mipsel__)
-+#if defined(__mips__) || defined(__mipsel__) || defined(__powerpc__)
- 
- static void __spin_lock(volatile int *lock) {
-   while (__sync_lock_test_and_set(lock, 1))
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch
deleted file mode 100644
index 84e0772a79..0000000000
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch
+++ /dev/null
@@ -1,263 +0,0 @@
-From d7b6df5808e7bef5930b61a82e880699a9f9e208 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 29 Jun 2017 15:39:19 -0700
-Subject: [PATCH] implement 64bit atomic for mips
-
-GCC does not provide 64bit atomics for mips32
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile.am |   1 +
- src/atomic64.c  | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 2 files changed, 229 insertions(+)
- create mode 100644 src/atomic64.c
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 99aaace0..cbbbbee9 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -27,6 +27,7 @@ libtorrent_la_LIBADD = \
- 	utils/libsub_utils.la
- 
- libtorrent_la_SOURCES = \
-+	atomic64.c \
- 	globals.cc \
- 	globals.h \
- 	manager.cc \
-diff --git a/src/atomic64.c b/src/atomic64.c
-new file mode 100644
-index 00000000..f841b39b
---- /dev/null
-+++ b/src/atomic64.c
-@@ -0,0 +1,228 @@
-+/*===----- atomic64.c - Support functions for 64-bit atomic operations.-----===
-+ *
-+ *                     The LLVM Compiler Infrastructure
-+ *
-+ * This file is dual licensed under the MIT and the University of Illinois Open
-+ * Source Licenses. See LICENSE.TXT for details.
-+ *
-+ *===-----------------------------------------------------------------------===
-+ *
-+ *  atomic64.c defines a set of functions for performing atomic accesses on
-+ *  64-bit memory locations. It also implements spinlock synchronization
-+ *  operations.
-+ *
-+ *===-----------------------------------------------------------------------===
-+ */
-+
-+#include <stdint.h>
-+#include <stdbool.h>
-+
-+/*
-+ * only need these on MIPS, since it lacks hardware 64-bit atomics,
-+ * unlike x86 and ARM.
-+ */
-+#if defined(__mips__) || defined(__mipsel__)
-+
-+static void __spin_lock(volatile int *lock) {
-+  while (__sync_lock_test_and_set(lock, 1))
-+    while (*lock) {}
-+}
-+
-+static void __spin_unlock(volatile int *lock) {
-+  __sync_lock_release(lock);
-+}
-+
-+/*
-+ * Make sure the lock is on its own cache line to prevent false sharing.
-+ * Put it inside a struct that is aligned and padded to the typical MIPS
-+ * cacheline which is 32 bytes.
-+ */
-+static struct {
-+  int lock;
-+  char pad[32 - sizeof(int)];
-+} __attribute__((aligned (32))) lock = { 0 };
-+
-+
-+uint64_t __sync_fetch_and_add_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr;
-+  *ptr = ret + val;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_fetch_and_sub_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr;
-+  *ptr = ret - val;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_fetch_and_and_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr;
-+  *ptr = ret & val;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_fetch_and_or_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr;
-+  *ptr = ret | val;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_fetch_and_xor_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr;
-+  *ptr = ret ^ val;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_add_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr + val;
-+  *ptr = ret;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_sub_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr - val;
-+  *ptr = ret;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_and_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr & val;
-+  *ptr = ret;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_or_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr | val;
-+  *ptr = ret;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_xor_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr ^ val;
-+  *ptr = ret;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+bool __sync_bool_compare_and_swap_8(volatile uint64_t *ptr,
-+                                         uint64_t oldval, uint64_t newval) {
-+  bool ret = false;
-+
-+  __spin_lock(&lock.lock);
-+
-+  if (*ptr == oldval) {
-+    *ptr = newval;
-+    ret = true;
-+  }
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_val_compare_and_swap_8(volatile uint64_t *ptr,
-+                                            uint64_t oldval, uint64_t newval) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr;
-+  if (ret == oldval)
-+    *ptr = newval;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+uint64_t __sync_lock_test_and_set_8(volatile uint64_t *ptr, uint64_t val) {
-+  uint64_t ret;
-+
-+  __spin_lock(&lock.lock);
-+
-+  ret = *ptr;
-+  *ptr = val;
-+
-+  __spin_unlock(&lock.lock);
-+
-+  return ret;
-+}
-+
-+void __sync_lock_release_8(volatile uint64_t *ptr) {
-+  __spin_lock(&lock.lock);
-+
-+  *ptr = 0;
-+
-+  __spin_unlock(&lock.lock);
-+}
-+
-+#endif
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index fa106ea41d..a3902b25f6 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -8,8 +8,6 @@ DEPENDS = "zlib libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent \
            file://don-t-run-code-while-configuring-package.patch \
-           file://0001-implement-64bit-atomic-for-mips.patch \
-           file://0001-Define-64bit-atomic-helpers-for-ppc-32-bit.patch \
            "
 SRCREV = "756f70010779927dc0691e1e722ed433d5d295e1"
 
-- 
2.24.0


