Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.14661.1627188752013978042
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dDuL7Ank;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so9461124pji.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M+u7PJ+EabKfvmBy3WzI5u+GXvq4NmGtdCeMhXJu31Y=;
        b=dDuL7Ank3dpge9XpWUbj4A++fCXNq7e9hTYgAs6xPN3PREw9XsQvtjGRYfRYlTj+Bq
         WQpc+GVnnQeGasD+gUWnX13juUsAF7KYX5ThVPZCwpeJM41N2syd6hLkOUQi67LN/fm8
         IwdeYqvkx9s6d4m2rwgafJA5MGxftD/xf3G/1nsMgYG7t1OnAzjXo6cZoxdzsbP3iEus
         JQgxeUdC4a+9jFkUnb0zh3Dgu7MG600NQ/sWb0nzPxVvri6m3UNoj4OGf+Nj6h79FL10
         3xBFBsWZYK7YsHeomjUe+ZPtJ4L1v15YLA72VCfKc8mIUUAIuLEzWVUzf71I4PZiYXX7
         /b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M+u7PJ+EabKfvmBy3WzI5u+GXvq4NmGtdCeMhXJu31Y=;
        b=OmKMG23i8xBry1mXbm+6oBugDrrr94spM0iCKROkuCcaxfByVfk+oB95OgCWtYldRj
         6k7LJrxbHTHwyRspZ3h+kjT3XM/3uol8KcN33k/B6QTkxbP/Tyu371GMQVawUhX3g/fG
         Ez2f6HgGk2tTSZ44fw0qwdUWVl02pzAQCEIEWKb+rc7l2RZpVi8b2anZWC5EBf5lYZdw
         TllgY8eOAMYnLZwt3QpG+FmP3DiJcPpcEfVKTulIkQltuh5sOoGa34RQ0S8chR25FtXY
         odwMC/pvdihFx2RddelnxD09I2fgI4crSD9L0tEzQCpxEEja3MtTlMYg98VvtzG8S680
         zZYw==
X-Gm-Message-State: AOAM531T0LAoUGJwjCnCOdZiiRIS50KHGOf3GIp6+UdfuzQIHLQwvG1w
	YwW0vUX81oJwQKdC0ek7AI+xjKLakJE37A==
X-Google-Smtp-Source: ABdhPJz8YcvNg85lcJbuDdtWvMMAvtPbnHq/s0tbcwpSXqpqccTZNYX2CCOM5CzippG5q0NAR76Y9g==
X-Received: by 2002:a62:8209:0:b029:32e:54d4:7e27 with SMTP id w9-20020a6282090000b029032e54d47e27mr11949405pfd.10.1627188751345;
        Sat, 24 Jul 2021 21:52:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:30 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/15] vboxguestdrivers: fix failed to compile with kernel 5.8.0
Date: Sat, 24 Jul 2021 21:52:08 -0700
Message-Id: <8d62c9d4c949341515df2b808b17d6744fde2a7e.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport patches from upstream [1] to fix the issue

It also requires to apply a patch on 5.8 kernel [2]

[1] https://www.virtualbox.org/ticket/19644
[2] https://www.virtualbox.org/raw-attachment/ticket/19644/local_patches

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9c10ed4baa95648b7735757121e3af8b0aeb8e06)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-fixes_for_mm_struct.patch            | 176 ++++++++++++++++++
 .../0002-fixes_for_module_memory.patch        |  65 +++++++
 ...03-fixes_for_changes_in_cpu_tlbstate.patch |  39 ++++
 .../vboxguestdrivers/kernel-5.8-4.patch       |  19 ++
 .../vboxguestdrivers_6.1.12.bb                |   7 +-
 5 files changed, 305 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fixes_for_mm_struct.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-fixes_for_module_memory.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0003-fixes_for_changes_in_cpu_tlbstate.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.8-4.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fixes_for_mm_struct.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fixes_for_mm_struct.patch
new file mode 100644
index 0000000000..1ad5ce51bf
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-fixes_for_mm_struct.patch
@@ -0,0 +1,176 @@
+From 98070c936931879d2b8e22939724b5a0689721d0 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 18 Aug 2020 17:48:29 +0800
+Subject: [PATCH 1/3] fixes_for_mm_struct
+
+Upstream-Status: Backport [https://www.virtualbox.org/ticket/19644]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../Runtime/r0drv/linux/memobj-r0drv-linux.c  | 74 +++++++++++++++++--
+ 1 file changed, 67 insertions(+), 7 deletions(-)
+
+diff --git a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
+index 37389bcc..cdc7e8e6 100644
+--- a/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
++++ b/src/VBox/Runtime/r0drv/linux/memobj-r0drv-linux.c
+@@ -222,9 +222,17 @@ static void *rtR0MemObjLinuxDoMmap(RTR3PTR R3PtrFixed, size_t cb, size_t uAlignm
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 5, 0)
+         ulAddr = vm_mmap(NULL, R3PtrFixed, cb, fLnxProt, MAP_SHARED | MAP_ANONYMOUS | MAP_FIXED, 0);
+ #else
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+         down_write(&pTask->mm->mmap_sem);
++#else
++        down_write(&pTask->mm->mmap_lock);
++#endif
+         ulAddr = do_mmap(NULL, R3PtrFixed, cb, fLnxProt, MAP_SHARED | MAP_ANONYMOUS | MAP_FIXED, 0);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+         up_write(&pTask->mm->mmap_sem);
++#else
++        up_write(&pTask->mm->mmap_lock);
++#endif
+ #endif
+     }
+     else
+@@ -232,9 +240,17 @@ static void *rtR0MemObjLinuxDoMmap(RTR3PTR R3PtrFixed, size_t cb, size_t uAlignm
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 5, 0)
+         ulAddr = vm_mmap(NULL, 0, cb, fLnxProt, MAP_SHARED | MAP_ANONYMOUS, 0);
+ #else
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+         down_write(&pTask->mm->mmap_sem);
++#else
++        down_write(&pTask->mm->mmap_lock);
++#endif
+         ulAddr = do_mmap(NULL, 0, cb, fLnxProt, MAP_SHARED | MAP_ANONYMOUS, 0);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+         up_write(&pTask->mm->mmap_sem);
++#else
++        up_write(&pTask->mm->mmap_lock);
++#endif
+ #endif
+         if (    !(ulAddr & ~PAGE_MASK)
+             &&  (ulAddr & (uAlignment - 1)))
+@@ -269,13 +285,29 @@ static void rtR0MemObjLinuxDoMunmap(void *pv, size_t cb, struct task_struct *pTa
+     Assert(pTask == current); RT_NOREF_PV(pTask);
+     vm_munmap((unsigned long)pv, cb);
+ #elif defined(USE_RHEL4_MUNMAP)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+     down_write(&pTask->mm->mmap_sem);
++#else
++    down_write(&pTask->mm->mmap_lock);
++#endif
+     do_munmap(pTask->mm, (unsigned long)pv, cb, 0); /* should it be 1 or 0? */
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+     up_write(&pTask->mm->mmap_sem);
+ #else
++    up_write(&pTask->mm->mmap_lock);
++#endif
++#else
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+     down_write(&pTask->mm->mmap_sem);
++#else
++    down_write(&pTask->mm->mmap_lock);
++#endif
+     do_munmap(pTask->mm, (unsigned long)pv, cb);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+     up_write(&pTask->mm->mmap_sem);
++#else
++    up_write(&pTask->mm->mmap_lock);
++#endif
+ #endif
+ }
+ 
+@@ -593,7 +625,11 @@ DECLHIDDEN(int) rtR0MemObjNativeFree(RTR0MEMOBJ pMem)
+                 size_t              iPage;
+                 Assert(pTask);
+                 if (pTask && pTask->mm)
+-                    down_read(&pTask->mm->mmap_sem);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++		    down_read(&pTask->mm->mmap_sem);
++#else
++		    down_read(&pTask->mm->mmap_lock);
++#endif
+ 
+                 iPage = pMemLnx->cPages;
+                 while (iPage-- > 0)
+@@ -608,7 +644,11 @@ DECLHIDDEN(int) rtR0MemObjNativeFree(RTR0MEMOBJ pMem)
+                 }
+ 
+                 if (pTask && pTask->mm)
+-                    up_read(&pTask->mm->mmap_sem);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++		    up_read(&pTask->mm->mmap_sem);
++#else
++		    up_read(&pTask->mm->mmap_lock);
++#endif
+             }
+             /* else: kernel memory - nothing to do here. */
+             break;
+@@ -1076,7 +1116,11 @@ DECLHIDDEN(int) rtR0MemObjNativeLockUser(PPRTR0MEMOBJINTERNAL ppMem, RTR3PTR R3P
+     papVMAs = (struct vm_area_struct **)RTMemAlloc(sizeof(*papVMAs) * cPages);
+     if (papVMAs)
+     {
+-        down_read(&pTask->mm->mmap_sem);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++	down_read(&pTask->mm->mmap_sem);
++#else
++	down_read(&pTask->mm->mmap_lock);
++#endif
+ 
+         /*
+          * Get user pages.
+@@ -1162,7 +1206,11 @@ DECLHIDDEN(int) rtR0MemObjNativeLockUser(PPRTR0MEMOBJINTERNAL ppMem, RTR3PTR R3P
+                 papVMAs[rc]->vm_flags |= VM_DONTCOPY | VM_LOCKED;
+             }
+ 
+-            up_read(&pTask->mm->mmap_sem);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++	    up_read(&pTask->mm->mmap_sem);
++#else
++	    up_read(&pTask->mm->mmap_lock);
++#endif
+ 
+             RTMemFree(papVMAs);
+ 
+@@ -1189,7 +1237,11 @@ DECLHIDDEN(int) rtR0MemObjNativeLockUser(PPRTR0MEMOBJINTERNAL ppMem, RTR3PTR R3P
+ #endif
+         }
+ 
+-        up_read(&pTask->mm->mmap_sem);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++	up_read(&pTask->mm->mmap_sem);
++#else
++	up_read(&pTask->mm->mmap_lock);
++#endif
+ 
+         RTMemFree(papVMAs);
+         rc = VERR_LOCK_FAILED;
+@@ -1604,7 +1656,11 @@ DECLHIDDEN(int) rtR0MemObjNativeMapUser(PPRTR0MEMOBJINTERNAL ppMem, RTR0MEMOBJ p
+             const size_t    cPages    = (offSub + cbSub) >> PAGE_SHIFT;
+             size_t          iPage;
+ 
+-            down_write(&pTask->mm->mmap_sem);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++	    down_write(&pTask->mm->mmap_sem);
++#else
++	    down_write(&pTask->mm->mmap_lock);
++#endif
+ 
+             rc = VINF_SUCCESS;
+             if (pMemLnxToMap->cPages)
+@@ -1721,7 +1777,11 @@ DECLHIDDEN(int) rtR0MemObjNativeMapUser(PPRTR0MEMOBJINTERNAL ppMem, RTR0MEMOBJ p
+             }
+ #endif /* CONFIG_NUMA_BALANCING */
+ 
+-            up_write(&pTask->mm->mmap_sem);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++	    up_write(&pTask->mm->mmap_sem);
++#else
++	    up_write(&pTask->mm->mmap_lock);
++#endif
+ 
+             if (RT_SUCCESS(rc))
+             {
+-- 
+2.18.2
+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-fixes_for_module_memory.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-fixes_for_module_memory.patch
new file mode 100644
index 0000000000..a3cfc3b370
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0002-fixes_for_module_memory.patch
@@ -0,0 +1,65 @@
+From bb580f7b601e5395a2f8fcb2485387035273320f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 18 Aug 2020 17:49:34 +0800
+Subject: [PATCH 2/3] fixes_for_module_memory
+
+Upstream-Status: Backport [https://www.virtualbox.org/ticket/19644]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../Runtime/r0drv/linux/alloc-r0drv-linux.c    | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/src/VBox/Runtime/r0drv/linux/alloc-r0drv-linux.c b/src/VBox/Runtime/r0drv/linux/alloc-r0drv-linux.c
+index bbb8acc6..45cd34c7 100644
+--- a/src/VBox/Runtime/r0drv/linux/alloc-r0drv-linux.c
++++ b/src/VBox/Runtime/r0drv/linux/alloc-r0drv-linux.c
+@@ -153,6 +153,8 @@ RT_EXPORT_SYMBOL(RTR0MemExecDonate);
+ 
+ 
+ #ifdef RTMEMALLOC_EXEC_VM_AREA
++
++
+ /**
+  * Allocate executable kernel memory in the module range.
+  *
+@@ -168,7 +170,12 @@ static PRTMEMHDR rtR0MemAllocExecVmArea(size_t cb)
+     struct vm_struct   *pVmArea;
+     size_t              iPage;
+ 
++# if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 8, 0)
++    pVmArea = __get_vm_area_caller(cbAlloc, VM_ALLOC, MODULES_VADDR, MODULES_END,
++		    		   __builtin_return_address(0));
++#else
+     pVmArea = __get_vm_area(cbAlloc, VM_ALLOC, MODULES_VADDR, MODULES_END);
++#endif
+     if (!pVmArea)
+         return NULL;
+     pVmArea->nr_pages = 0;    /* paranoia? */
+@@ -201,14 +208,21 @@ static PRTMEMHDR rtR0MemAllocExecVmArea(size_t cb)
+ # endif
+         pVmArea->nr_pages = cPages;
+         pVmArea->pages    = papPages;
+-        if (!map_vm_area(pVmArea, PAGE_KERNEL_EXEC,
++# if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 8, 0)
++	unsigned long start = (unsigned long)pVmArea->addr;
++	unsigned long size = get_vm_area_size(pVmArea);
++
++	if (!map_kernel_range(start, size, PAGE_KERNEL_EXEC, papPages))
++#else
++	if (!map_vm_area(pVmArea, PAGE_KERNEL_EXEC,
+ # if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0)
+                          &papPagesIterator
+ # else
+                          papPages
+ # endif
+                          ))
+-        {
++#endif
++	{
+             PRTMEMLNXHDREX pHdrEx = (PRTMEMLNXHDREX)pVmArea->addr;
+             pHdrEx->pVmArea     = pVmArea;
+             pHdrEx->pvDummy     = NULL;
+-- 
+2.18.2
+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0003-fixes_for_changes_in_cpu_tlbstate.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0003-fixes_for_changes_in_cpu_tlbstate.patch
new file mode 100644
index 0000000000..6a3e63f63d
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0003-fixes_for_changes_in_cpu_tlbstate.patch
@@ -0,0 +1,39 @@
+From 6089974a81b1b44e1d2dfa5af1fdc110dfee40c1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 18 Aug 2020 17:51:24 +0800
+Subject: [PATCH 3/3] fixes_for_changes_in_cpu_tlbstate
+
+Upstream-Status: Backport [https://www.virtualbox.org/ticket/19644]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/VBox/HostDrivers/Support/linux/SUPDrv-linux.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/VBox/HostDrivers/Support/linux/SUPDrv-linux.c b/src/VBox/HostDrivers/Support/linux/SUPDrv-linux.c
+index c7d0d99a..2e7aa6e1 100644
+--- a/src/VBox/HostDrivers/Support/linux/SUPDrv-linux.c
++++ b/src/VBox/HostDrivers/Support/linux/SUPDrv-linux.c
+@@ -757,12 +757,19 @@ EXPORT_SYMBOL(SUPDrvLinuxIDC);
+ RTCCUINTREG VBOXCALL supdrvOSChangeCR4(RTCCUINTREG fOrMask, RTCCUINTREG fAndMask)
+ {
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 20, 0)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+     RTCCUINTREG uOld = this_cpu_read(cpu_tlbstate.cr4);
++#else
++    RTCCUINTREG uOld = __read_cr4();
++#endif
+     RTCCUINTREG uNew = (uOld & fAndMask) | fOrMask;
+     if (uNew != uOld)
+     {
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
+         this_cpu_write(cpu_tlbstate.cr4, uNew);
+         __write_cr4(uNew);
++#endif
++        ASMSetCR4(uNew);
+     }
+ #else
+     RTCCUINTREG uOld = ASMGetCR4();
+-- 
+2.18.2
+
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.8-4.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.8-4.patch
new file mode 100644
index 0000000000..cb4148fc79
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/kernel-5.8-4.patch
@@ -0,0 +1,19 @@
+Description: Fix kernel 5.8 forbidding use of vermagic.h header file
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Origin: https://www.virtualbox.org/ticket/19644
+Bug-Ubuntu: https://launchpad.net/bugs/1884652
+Last-Update: 2020-08-10
+
+--- virtualbox-6.1.12-dfsg.orig/src/VBox/Additions/linux/sharedfolders/vfsmod.c
++++ virtualbox-6.1.12-dfsg/src/VBox/Additions/linux/sharedfolders/vfsmod.c
+@@ -53,7 +53,9 @@
+ #include <linux/seq_file.h>
+ #include <linux/vfs.h>
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 5, 62)
+-# include <linux/vermagic.h>
++# if LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0)
++#  include <linux/vermagic.h>
++# endif
+ #endif
+ #include <VBox/err.h>
+ #include <iprt/path.h>
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
index dfa15da2db..e57df58d6c 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.12.bb
@@ -12,12 +12,17 @@ COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
 VBOX_NAME = "VirtualBox-${PV}"
 
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
+    file://0001-fixes_for_mm_struct.patch \
+    file://0002-fixes_for_module_memory.patch \
+    file://0003-fixes_for_changes_in_cpu_tlbstate.patch \
+    file://kernel-5.8-4.patch \
     file://Makefile.utils \
 "
 SRC_URI[md5sum] = "3c351f7fd6376e0bb3c8489505a9450c"
 SRC_URI[sha256sum] = "05eff0321daa72f6d00fb121a6b4211f39964778823806fa0b7b751667dec362"
 
-S = "${WORKDIR}/vbox_module"
+S ?= "${WORKDIR}/vbox_module"
+S_task-patch = "${WORKDIR}/${VBOX_NAME}"
 
 export BUILD_TARGET_ARCH="${ARCH}"
 export BUILD_TARGET_ARCH_x86-64="amd64"
-- 
2.25.1

