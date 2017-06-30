Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6AF4A78275
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z6so17027160pfk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NCQgWXf1WniMSFVG5dJJ5fRgJXN2H3/697ucKPA4eTU=;
	b=LYxrNo/A23GmFLCozh4Vz6ghGHgjYMqkDGLgYmwmEVHCfdeQQAF5vtjqnQDDZ57scB
	kRBj5Mfd9ibN/ZSPqOYMZJGv9jFBppSNh+jj1fx96z8JcxU6ixLBR2vlJclwOhe59WUO
	p+V5P4EYhQJyjYjlk+a/CVy4VvhPoCVP3ICncK2hNu2JWq4ufUlz5RtviBR8fQj4pcRg
	48Qo6HmZ0gGBSYk4FxHpUhZlFzQ5jyFmpdHa0dYkydeCmOtGQ8BtFXHO80/mCi0F1quA
	myBnEA8svxLT/qa6nzKUccfQRIQUvcH+8I1RkKqMHYu/bPhu3j1fz/mJT71FKo5mE9S8
	vl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NCQgWXf1WniMSFVG5dJJ5fRgJXN2H3/697ucKPA4eTU=;
	b=LtF3A3ddwe9JymJO8xvAuCI95vfLhaFDTSpX+O4ZZWPavfq+4NWGK0qJuVxeD647Bc
	Abl13um/vr5yhN71jMxxBrL9nPTYF5Fh9t2C/zeG+BEeyuzkzOvKso01XjnDIrgwYdIr
	xKrIxhmzruNe8XTSBtxwEqJn/rxyaszhXeA1EPFFHIetsgJ4iBKTPduGHbIsicLBx2pp
	r9IfqZDkVEBmfHl52r1XT2C8NjyR94ELeK+WOlKwwgnGld4L2N0XkaNLQtBPCYVNRKbe
	lboRIsUepJB4qZrpZc3HGuftzI3MSPsFoRtGQ1y/qvUylDqStNccCQ3FhCLPPg3qepOO
	jS9Q==
X-Gm-Message-State: AKS2vOz6dNFOZyWVVIBdwsfheymcBEgWvJhitngHmVo2krmFC6zLJ/Z/
	JXAMxYAcoAQH5UFl
X-Received: by 10.98.53.134 with SMTP id c128mr22190932pfa.36.1498827632981;
	Fri, 30 Jun 2017 06:00:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:54 -0700
Message-Id: <20170630125957.3342-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/17] libtorrent: Implement 64bit atomics for mips32
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:34 -0000

Fixes build errors e.g.

| /mnt/a/oe/build/tmp/work/mips32r2-bec-linux/rtorrent/0.9.6+gitAUTOINC+226e670dec-r0/recipe-sysroot/usr/lib/../lib/libtorrent.so: undefined reference to `__sync_fetch_and_and_8'
| /mnt/a/oe/build/tmp/work/mips32r2-bec-linux/rtorrent/0.9.6+gitAUTOINC+226e670dec-r0/recipe-sysroot/usr/lib/../lib/libtorrent.so: undefined reference to `__sync_add_and_fetch_8'
| collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-implement-64bit-atomic-for-mips.patch     | 263 +++++++++++++++++++++
 .../libtorrent/libtorrent_git.bb                   |   5 +-
 2 files changed, 266 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch

diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch
new file mode 100644
index 000000000..84e0772a7
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent/0001-implement-64bit-atomic-for-mips.patch
@@ -0,0 +1,263 @@
+From d7b6df5808e7bef5930b61a82e880699a9f9e208 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Jun 2017 15:39:19 -0700
+Subject: [PATCH] implement 64bit atomic for mips
+
+GCC does not provide 64bit atomics for mips32
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.am |   1 +
+ src/atomic64.c  | 228 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 229 insertions(+)
+ create mode 100644 src/atomic64.c
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 99aaace0..cbbbbee9 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -27,6 +27,7 @@ libtorrent_la_LIBADD = \
+ 	utils/libsub_utils.la
+ 
+ libtorrent_la_SOURCES = \
++	atomic64.c \
+ 	globals.cc \
+ 	globals.h \
+ 	manager.cc \
+diff --git a/src/atomic64.c b/src/atomic64.c
+new file mode 100644
+index 00000000..f841b39b
+--- /dev/null
++++ b/src/atomic64.c
+@@ -0,0 +1,228 @@
++/*===----- atomic64.c - Support functions for 64-bit atomic operations.-----===
++ *
++ *                     The LLVM Compiler Infrastructure
++ *
++ * This file is dual licensed under the MIT and the University of Illinois Open
++ * Source Licenses. See LICENSE.TXT for details.
++ *
++ *===-----------------------------------------------------------------------===
++ *
++ *  atomic64.c defines a set of functions for performing atomic accesses on
++ *  64-bit memory locations. It also implements spinlock synchronization
++ *  operations.
++ *
++ *===-----------------------------------------------------------------------===
++ */
++
++#include <stdint.h>
++#include <stdbool.h>
++
++/*
++ * only need these on MIPS, since it lacks hardware 64-bit atomics,
++ * unlike x86 and ARM.
++ */
++#if defined(__mips__) || defined(__mipsel__)
++
++static void __spin_lock(volatile int *lock) {
++  while (__sync_lock_test_and_set(lock, 1))
++    while (*lock) {}
++}
++
++static void __spin_unlock(volatile int *lock) {
++  __sync_lock_release(lock);
++}
++
++/*
++ * Make sure the lock is on its own cache line to prevent false sharing.
++ * Put it inside a struct that is aligned and padded to the typical MIPS
++ * cacheline which is 32 bytes.
++ */
++static struct {
++  int lock;
++  char pad[32 - sizeof(int)];
++} __attribute__((aligned (32))) lock = { 0 };
++
++
++uint64_t __sync_fetch_and_add_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr;
++  *ptr = ret + val;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_fetch_and_sub_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr;
++  *ptr = ret - val;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_fetch_and_and_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr;
++  *ptr = ret & val;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_fetch_and_or_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr;
++  *ptr = ret | val;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_fetch_and_xor_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr;
++  *ptr = ret ^ val;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_add_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr + val;
++  *ptr = ret;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_sub_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr - val;
++  *ptr = ret;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_and_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr & val;
++  *ptr = ret;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_or_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr | val;
++  *ptr = ret;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_xor_and_fetch_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr ^ val;
++  *ptr = ret;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++bool __sync_bool_compare_and_swap_8(volatile uint64_t *ptr,
++                                         uint64_t oldval, uint64_t newval) {
++  bool ret = false;
++
++  __spin_lock(&lock.lock);
++
++  if (*ptr == oldval) {
++    *ptr = newval;
++    ret = true;
++  }
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_val_compare_and_swap_8(volatile uint64_t *ptr,
++                                            uint64_t oldval, uint64_t newval) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr;
++  if (ret == oldval)
++    *ptr = newval;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++uint64_t __sync_lock_test_and_set_8(volatile uint64_t *ptr, uint64_t val) {
++  uint64_t ret;
++
++  __spin_lock(&lock.lock);
++
++  ret = *ptr;
++  *ptr = val;
++
++  __spin_unlock(&lock.lock);
++
++  return ret;
++}
++
++void __sync_lock_release_8(volatile uint64_t *ptr) {
++  __spin_lock(&lock.lock);
++
++  *ptr = 0;
++
++  __spin_unlock(&lock.lock);
++}
++
++#endif
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
index aaebc5f1b..0febebd93 100644
--- a/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
+++ b/meta-oe/recipes-connectivity/libtorrent/libtorrent_git.bb
@@ -7,8 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 DEPENDS = "zlib libsigc++-2.0 openssl cppunit"
 
 SRC_URI = "git://github.com/rakshasa/libtorrent \
-    file://don-t-run-code-while-configuring-package.patch \
-"
+           file://don-t-run-code-while-configuring-package.patch \
+           file://0001-implement-64bit-atomic-for-mips.patch \
+           "
 SRCREV = "c167c5a9e0bcf0df23ae5efd91396aae0e37eb87"
 
 PV = "0.13.6+git${SRCPV}"
-- 
2.13.2


