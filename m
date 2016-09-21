Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 171BE6093C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 08:16:23 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id w84so178177940wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Sep 2016 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=S4V4FOOqWLfB6yDdY1rfjk3hfnS3Ciix+u+o53DSIno=;
	b=b+TNkvuiX3sJ5Oq31TSVagMqObrD6uQH9/KrDxTHIU9mIVvNe2/ZzhJzqD33kye+PO
	enF3BcMbJ+vtsTXsFZqqKdZinpD3YtEGwm1czjZb74QUQYUVgwuV0LyXs2rEyVEIl7Ab
	ddLex4JpUVWA3tPLjd2dNlKrb4fac6Yz9ID6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S4V4FOOqWLfB6yDdY1rfjk3hfnS3Ciix+u+o53DSIno=;
	b=GnuEr1zf7oREhQ6XSXnIbQaXKWqPP5rlYlg8kmRbXQgCQUlWmAvRlqGacxfkvgJO5R
	zNZNF46wt5JxWgb6oHnUdkXYrBvs989X5SbDonvvS+LSmdhsXcNQyLgzCtkoAsiuFOO4
	gfsaYJZ+8tRScni9c66Y3nZgarfC5qfhzkEzvFYLivVFCQ3kyG6kC1QPR1NSShW+XUMC
	1ve+wy3RFrOEO0RCFRbjFF5MLudfxzknbkrxbxlbQpJOkwjFTSgPxNUQyjlTS3BJpUgq
	QiS1S82m5nmRtvewBspKEfMQVsCshODTbBQpzB/zV/qbGKK+gQpJrfi9S9qbGfNNFQSR
	R2uw==
X-Gm-Message-State: AE9vXwPURVPfxXNwZhT4JR487S6b3ASJMdzweGI5U2HUQL1jVXK8ktFkFsqgnCadbOTkK/Qh
X-Received: by 10.28.64.86 with SMTP id n83mr2006140wma.127.1474445784822;
	Wed, 21 Sep 2016 01:16:24 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118]) by smtp.gmail.com with ESMTPSA id
	uw3sm32318984wjb.21.2016.09.21.01.16.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Sep 2016 01:16:23 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Sep 2016 10:16:19 +0200
Message-Id: <1474445779-22477-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.11
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] mozjs: fix crash on non-x86 64 bit systems
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
X-List-Received-Date: Wed, 21 Sep 2016 08:16:26 -0000

Mozjs is mozillaware, meaning that it barely works on x86 and is plain broken on everything else. This time mozjs assumes that noone will ever have more than 47bit for VA, breaking aarch64 which can have more. Thanks to polkit developers using mozjs systemd will crash early during boot when using polkit.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../mozjs/Manually_mmap_heap_memory_esr17.patch    | 115 +++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb     |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch b/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
new file mode 100644
index 0000000..15ad03f
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/Manually_mmap_heap_memory_esr17.patch
@@ -0,0 +1,115 @@
+From a0c0f32299419359b44ac0f880c1ea9073ae51e1 Mon Sep 17 00:00:00 2001
+From: Zheng Xu <zheng.xu@linaro.org>
+Date: Fri, 2 Sep 2016 17:40:05 +0800
+Subject: [PATCH] Bug 1143022 - Manually mmap on arm64 to ensure high 17 bits
+ are clear. r=ehoogeveen
+
+There might be 48-bit VA on arm64 depending on kernel configuration.
+Manually mmap heap memory to align with the assumption made by JS engine.
+
+Change-Id: Ic5d2b2fe4b758b3c87cc0688348af7e71a991146
+
+Upstream-status: Backport
+
+---
+ js/src/gc/Memory.cpp | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 71 insertions(+), 2 deletions(-)
+
+diff --git a/js/src/gc/Memory.cpp b/js/src/gc/Memory.cpp
+index 5b386a2..38101cf 100644
+--- a/js/src/gc/Memory.cpp
++++ b/js/src/gc/Memory.cpp
+@@ -306,6 +306,75 @@ InitMemorySubsystem()
+         MOZ_CRASH();
+ }
+ 
++static inline void *
++MapMemory(size_t length, int prot, int flags, int fd, off_t offset)
++{
++#if defined(__ia64__)
++    /*
++     * The JS engine assumes that all allocated pointers have their high 17 bits clear,
++     * which ia64's mmap doesn't support directly. However, we can emulate it by passing
++     * mmap an "addr" parameter with those bits clear. The mmap will return that address,
++     * or the nearest available memory above that address, providing a near-guarantee
++     * that those bits are clear. If they are not, we return NULL below to indicate
++     * out-of-memory.
++     *
++     * The addr is chosen as 0x0000070000000000, which still allows about 120TB of virtual
++     * address space.
++     *
++     * See Bug 589735 for more information.
++     */
++    void *region = mmap((void*)0x0000070000000000, length, prot, flags, fd, offset);
++    if (region == MAP_FAILED)
++        return MAP_FAILED;
++    /*
++     * If the allocated memory doesn't have its upper 17 bits clear, consider it
++     * as out of memory.
++     */
++    if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
++        JS_ALWAYS_TRUE(0 == munmap(region, length));
++        return MAP_FAILED;
++    }
++    return region;
++#elif defined(__aarch64__)
++   /*
++    * There might be similar virtual address issue on arm64 which depends on
++    * hardware and kernel configurations. But the work around is slightly
++    * different due to the different mmap behavior.
++    *
++    * TODO: Merge with the above code block if this implementation works for
++    * ia64 and sparc64.
++    */
++    const uintptr_t start = UINT64_C(0x0000070000000000);
++    const uintptr_t end   = UINT64_C(0x0000800000000000);
++    const uintptr_t step  = ChunkSize;
++   /*
++    * Optimization options if there are too many retries in practice:
++    * 1. Examine /proc/self/maps to find an available address. This file is
++    *    not always available, however. In addition, even if we examine
++    *    /proc/self/maps, we may still need to retry several times due to
++    *    racing with other threads.
++    * 2. Use a global/static variable with lock to track the addresses we have
++    *    allocated or tried.
++    */
++    uintptr_t hint;
++    void* region = MAP_FAILED;
++    for (hint = start; region == MAP_FAILED && hint + length <= end; hint += step) {
++        region = mmap((void*)hint, length, prot, flags, fd, offset);
++        if (region != MAP_FAILED) {
++            if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
++                if (munmap(region, length)) {
++                    MOZ_ASSERT(errno == ENOMEM);
++                }
++                region = MAP_FAILED;
++            }
++        }
++    }
++    return region == MAP_FAILED ? NULL : region;
++#else
++    return mmap(NULL, length, prot, flags, fd, offset);
++#endif
++}
++
+ void *
+ MapAlignedPages(size_t size, size_t alignment)
+ {
+@@ -319,12 +388,12 @@ MapAlignedPages(size_t size, size_t alignment)
+ 
+     /* Special case: If we want page alignment, no further work is needed. */
+     if (alignment == PageSize) {
+-        return mmap(NULL, size, prot, flags, -1, 0);
++        return MapMemory(size, prot, flags, -1, 0);
+     }
+ 
+     /* Overallocate and unmap the region's edges. */
+     size_t reqSize = Min(size + 2 * alignment, 2 * size);
+-    void *region = mmap(NULL, reqSize, prot, flags, -1, 0);
++    void *region = MapMemory(reqSize, prot, flags, -1, 0);
+     if (region == MAP_FAILED)
+         return NULL;
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index d477f4b..24631e4 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://fix_milestone_compile_issue.patch \
     file://0010-fix-cross-compilation-on-i586-targets.patch;patchdir=../../ \
     file://0001-add-support-for-big-endian-32bit-ARM.patch;patchdir=../../ \
+    file://Manually_mmap_heap_memory_esr17.patch;patchdir=../../ \
   "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-- 
2.4.11


