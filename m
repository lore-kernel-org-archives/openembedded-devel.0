Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ODYjm-000282-IR
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 May 2010 09:58:18 +0200
Received: by pva18 with SMTP id 18so88691pva.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 May 2010 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=zM9F57Se1EJ4GugWdawFkpu4fdVLc3NlRvH6MJCnbP0=;
	b=sZXnTAbNlIQfnYBpRxuQ4TqzuKW1GZ0tqbH0THQ71eWwTx2Hcbq00iK1905dhn/k7t
	yygAJHxkXW3sEc0URD1zQdOqnwzUgwrxkfGFNCb4akFi/gSaIbcIK3KgF18pjoe2bsXF
	TzLRz4ESBSrr1XtLuCc1QBCYh28Y5FYzPmd8c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=YJ10RlFj1zOMPtXoG1MzMvwlsYdCXWRijlEmz7ORnLsLc8lo3e3P2MnWdJZqi1+/sJ
	wrJ5Mg32cSoeGUkB8Ia3N51bAao/JuoRfIHL8M+I2TJ6vJNrhmBo7/Abx0WbYNQyxA+n
	x+dP0/It2WrErpHqYbpdvJwD4o+jYythvT6iI=
Received: by 10.115.81.33 with SMTP id i33mr2994431wal.46.1273996432038;
	Sun, 16 May 2010 00:53:52 -0700 (PDT)
Received: from localhost (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n32sm37321030wae.10.2010.05.16.00.53.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 16 May 2010 00:53:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 May 2010 00:53:45 -0700
Message-Id: <1273996425-6635-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] qemu-0.12.4: Add recipes for 0.12.4
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
X-List-Received-Date: Sun, 16 May 2010 07:58:18 -0000

* Tested by booting arm, ppc, mips, sh4, and x86 systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/qemu/qemu-0.12.4/02_kfreebsd.patch         |   13 +
 .../03_support_pselect_in_linux_user_arm.patch     |  175 ++++++++++++
 recipes/qemu/qemu-0.12.4/05_bochs_vbe.diff         |   66 +++++
 recipes/qemu/qemu-0.12.4/06_sh4.diff               |  287 ++++++++++++++++++++
 .../3f26c1227e3b08010f2a65379cecf4cb4b5933fa.patch |  134 +++++++++
 recipes/qemu/qemu-0.12.4/91-oh-sdl-cursor.patch    |   18 ++
 .../c5883be23519921254c6940873ee8db04979c20a.patch |   61 ++++
 .../fallback.to.safe.mmap_min_addr.patch           |   37 +++
 .../qemu/qemu-0.12.4/fix_baum_c_compilation.patch  |   30 ++
 .../fix_fortify_source_compilation.patch           |   15 +
 recipes/qemu/qemu-0.12.4/leftover.patch            |   25 ++
 recipes/qemu/qemu_0.12.4.bb                        |   39 +++
 12 files changed, 900 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qemu/qemu-0.12.4/02_kfreebsd.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/03_support_pselect_in_linux_user_arm.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/05_bochs_vbe.diff
 create mode 100644 recipes/qemu/qemu-0.12.4/06_sh4.diff
 create mode 100644 recipes/qemu/qemu-0.12.4/3f26c1227e3b08010f2a65379cecf4cb4b5933fa.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/91-oh-sdl-cursor.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/c5883be23519921254c6940873ee8db04979c20a.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/fallback.to.safe.mmap_min_addr.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/fix_baum_c_compilation.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/fix_fortify_source_compilation.patch
 create mode 100644 recipes/qemu/qemu-0.12.4/leftover.patch
 create mode 100644 recipes/qemu/qemu_0.12.4.bb

diff --git a/recipes/qemu/qemu-0.12.4/02_kfreebsd.patch b/recipes/qemu/qemu-0.12.4/02_kfreebsd.patch
new file mode 100644
index 0000000..67fb663
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/02_kfreebsd.patch
@@ -0,0 +1,13 @@
+diff --git a/usb-bsd.c b/usb-bsd.c
+index 48567a3..a761b61 100644
+--- a/usb-bsd.c
++++ b/usb-bsd.c
+@@ -35,7 +35,7 @@
+ 
+ #include <sys/ioctl.h>
+ #ifndef __DragonFly__
+-#include <dev/usb/usb.h>
++#include <legacy/dev/usb/usb.h>
+ #else
+ #include <bus/usb/usb.h>
+ #endif
diff --git a/recipes/qemu/qemu-0.12.4/03_support_pselect_in_linux_user_arm.patch b/recipes/qemu/qemu-0.12.4/03_support_pselect_in_linux_user_arm.patch
new file mode 100644
index 0000000..4f21420
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/03_support_pselect_in_linux_user_arm.patch
@@ -0,0 +1,175 @@
+downloaded from: http://bazaar.launchpad.net/%7Eubuntu-server-edgers/ubuntu/lucid/qemu-kvm/qemu-kvm-dailies-packaging.trunk/annotate/head%3A/debian/patches/This-patch-adds-support-for-the-pselect-syscall-in-l.patch
+
+see also: http://lists.gnu.org/archive/html/qemu-devel/2010-02/msg01026.html
+
+From 2c28192f9eb4a23cda0787c97cdb78c33735803e Mon Sep 17 00:00:00 2001
+From: Michael Casadevall <mcasadevall@ubuntu.com>
+Date: Tue, 16 Feb 2010 05:31:19 -0500
+Subject: [PATCH] This patch adds support for the pselect syscall in linux-user emulation and also adds several support functions required to translate the timespec structs between the target and the host.
+
+Signed-off-by: Michael Casadevall <mcasadevall@ubuntu.com>
+---
+ linux-user/arm/syscall_nr.h |    2 +-
+ linux-user/syscall.c        |  119 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 120 insertions(+), 1 deletions(-)
+
+diff --git a/linux-user/arm/syscall_nr.h b/linux-user/arm/syscall_nr.h
+index b1db341..79a216a 100644
+--- a/linux-user/arm/syscall_nr.h
++++ b/linux-user/arm/syscall_nr.h
+@@ -338,7 +338,7 @@
+ #define TARGET_NR_readlinkat			(332)
+ #define TARGET_NR_fchmodat			(333)
+ #define TARGET_NR_faccessat			(334)
+-					/* 335 for pselect6 */
++#define TARGET_NR_pselect6			(335)
+ 					/* 336 for ppoll */
+ #define TARGET_NR_unshare			(337)
+ #define TARGET_NR_set_robust_list		(338)
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 9fb493f..3663451 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -850,6 +850,38 @@ static inline abi_long copy_to_user_timeval(abi_ulong target_tv_addr,
+     return 0;
+ }
+ 
++static inline abi_long copy_from_user_timespec(struct timespec *ts,
++                                              abi_ulong target_ts_addr)
++{
++    struct target_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_READ, target_ts, target_ts_addr, 1))
++        return -TARGET_EFAULT;
++
++    __get_user(ts->tv_sec, &target_ts->tv_sec);
++    __get_user(ts->tv_nsec, &target_ts->tv_nsec);
++
++    unlock_user_struct(target_ts, target_ts_addr, 0);
++
++    return 0;
++}
++
++
++static inline abi_long copy_to_user_timespec(abi_ulong target_ts_addr,
++                                            const struct timespec *ts)
++{
++    struct target_timespec *target_ts;
++
++    if (!lock_user_struct(VERIFY_WRITE, target_ts, target_ts_addr, 0))
++        return -TARGET_EFAULT;
++
++    __put_user(ts->tv_sec, &target_ts->tv_sec);
++    __put_user(ts->tv_nsec, &target_ts->tv_nsec);
++
++    unlock_user_struct(target_ts, target_ts_addr, 1);
++
++    return 0;
++}
+ #if defined(TARGET_NR_mq_open) && defined(__NR_mq_open)
+ #include <mqueue.h>
+ 
+@@ -949,6 +981,75 @@ static abi_long do_select(int n,
+     return ret;
+ }
+ 
++#ifdef TARGET_NR_pselect6
++/* do_pselect() must return target values and target errnos. */
++static abi_long do_pselect(int n,
++                          abi_ulong rfd_addr, abi_ulong wfd_addr,
++                          abi_ulong efd_addr, abi_ulong target_tv_addr,
++                          abi_ulong set_addr)
++{
++    fd_set rfds, wfds, efds;
++    fd_set *rfds_ptr, *wfds_ptr, *efds_ptr;
++    struct timespec tv, *tv_ptr;
++    sigset_t set, *set_ptr;
++    abi_long ret;
++
++    if (rfd_addr) {
++        if (copy_from_user_fdset(&rfds, rfd_addr, n))
++            return -TARGET_EFAULT;
++        rfds_ptr = &rfds;
++    } else {
++        rfds_ptr = NULL;
++    }
++    if (wfd_addr) {
++        if (copy_from_user_fdset(&wfds, wfd_addr, n))
++            return -TARGET_EFAULT;
++        wfds_ptr = &wfds;
++    } else {
++        wfds_ptr = NULL;
++    }
++    if (efd_addr) {
++        if (copy_from_user_fdset(&efds, efd_addr, n))
++            return -TARGET_EFAULT;
++        efds_ptr = &efds;
++    } else {
++        efds_ptr = NULL;
++    }
++
++    if (target_tv_addr) {
++        if (copy_from_user_timespec(&tv, target_tv_addr))
++            return -TARGET_EFAULT;
++        tv_ptr = &tv;
++    } else {
++        tv_ptr = NULL;
++    }
++
++    /* We don't need to return sigmask to target */
++    if (set_addr) {
++        target_to_host_old_sigset(&set, &set_addr);
++        set_ptr = &set;
++    } else {
++        set_ptr = NULL;
++    }
++
++    ret = get_errno(pselect(n, rfds_ptr, wfds_ptr, efds_ptr, tv_ptr, set_ptr));
++
++    if (!is_error(ret)) {
++        if (rfd_addr && copy_to_user_fdset(rfd_addr, &rfds, n))
++            return -TARGET_EFAULT;
++        if (wfd_addr && copy_to_user_fdset(wfd_addr, &wfds, n))
++            return -TARGET_EFAULT;
++        if (efd_addr && copy_to_user_fdset(efd_addr, &efds, n))
++            return -TARGET_EFAULT;
++
++        if (target_tv_addr && copy_to_user_timespec(target_tv_addr, &tv))
++            return -TARGET_EFAULT;
++    }
++
++    return ret;
++}
++#endif
++
+ static abi_long do_pipe2(int host_pipe[], int flags)
+ {
+ #ifdef CONFIG_PIPE2
+@@ -5136,6 +5237,24 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
+         }
+         break;
+ #endif
++
++#ifdef TARGET_NR_pselect6
++    case TARGET_NR_pselect6:
++        {
++            abi_ulong inp, outp, exp, tvp, set;
++            long nsel;
++
++            nsel = tswapl(arg1);
++            inp = tswapl(arg2);
++            outp = tswapl(arg3);
++            exp = tswapl(arg4);
++            tvp = tswapl(arg5);
++            set = tswapl(arg6);
++
++            ret = do_pselect(nsel, inp, outp, exp, tvp, set);
++        }
++        break;
++#endif
+     case TARGET_NR_symlink:
+         {
+             void *p2;
+-- 
+1.6.6.1
+
diff --git a/recipes/qemu/qemu-0.12.4/05_bochs_vbe.diff b/recipes/qemu/qemu-0.12.4/05_bochs_vbe.diff
new file mode 100644
index 0000000..da6092d
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/05_bochs_vbe.diff
@@ -0,0 +1,66 @@
+commit af92284bec7ddbd76ddd105c40718627dda3407e
+Author: Gerd Hoffmann <kraxel@redhat.com>
+Date:   Thu Mar 25 11:38:52 2010 +0100
+
+    update bochs vbe interface
+    
+    The bochs vbe interface got a new register a while back, which specifies
+    the linear framebuffer size in 64k units.  This patch adds support for
+    the new register to qemu.  With this patch applied vgabios 0.6c works
+    with qemu.
+    
+    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+diff --git a/hw/vga.c b/hw/vga.c
+index 6a1a059..bb65677 100644
+--- a/hw/vga.c
++++ b/hw/vga.c
+@@ -522,7 +522,7 @@ static uint32_t vbe_ioport_read_data(void *opaque, uint32_t addr)
+     VGACommonState *s = opaque;
+     uint32_t val;
+ 
+-    if (s->vbe_index <= VBE_DISPI_INDEX_NB) {
++    if (s->vbe_index < VBE_DISPI_INDEX_NB) {
+         if (s->vbe_regs[VBE_DISPI_INDEX_ENABLE] & VBE_DISPI_GETCAPS) {
+             switch(s->vbe_index) {
+                 /* XXX: do not hardcode ? */
+@@ -542,6 +542,8 @@ static uint32_t vbe_ioport_read_data(void *opaque, uint32_t addr)
+         } else {
+             val = s->vbe_regs[s->vbe_index];
+         }
++    } else if (s->vbe_index == VBE_DISPI_INDEX_VIDEO_MEMORY_64K) {
++        val = s->vram_size / (64 * 1024);
+     } else {
+         val = 0;
+     }
+@@ -1955,7 +1957,7 @@ void vga_common_reset(VGACommonState *s)
+ #ifdef CONFIG_BOCHS_VBE
+     s->vbe_index = 0;
+     memset(s->vbe_regs, '\0', sizeof(s->vbe_regs));
+-    s->vbe_regs[VBE_DISPI_INDEX_ID] = VBE_DISPI_ID0;
++    s->vbe_regs[VBE_DISPI_INDEX_ID] = VBE_DISPI_ID5;
+     s->vbe_start_addr = 0;
+     s->vbe_line_offset = 0;
+     s->vbe_bank_mask = (s->vram_size >> 16) - 1;
+diff --git a/hw/vga_int.h b/hw/vga_int.h
+index 23a42ef..6a46a43 100644
+--- a/hw/vga_int.h
++++ b/hw/vga_int.h
+@@ -47,13 +47,15 @@
+ #define VBE_DISPI_INDEX_VIRT_HEIGHT     0x7
+ #define VBE_DISPI_INDEX_X_OFFSET        0x8
+ #define VBE_DISPI_INDEX_Y_OFFSET        0x9
+-#define VBE_DISPI_INDEX_NB              0xa
++#define VBE_DISPI_INDEX_NB              0xa /* size of vbe_regs[] */
++#define VBE_DISPI_INDEX_VIDEO_MEMORY_64K 0xa /* read-only, not in vbe_regs */
+ 
+ #define VBE_DISPI_ID0                   0xB0C0
+ #define VBE_DISPI_ID1                   0xB0C1
+ #define VBE_DISPI_ID2                   0xB0C2
+ #define VBE_DISPI_ID3                   0xB0C3
+ #define VBE_DISPI_ID4                   0xB0C4
++#define VBE_DISPI_ID5                   0xB0C5
+ 
+ #define VBE_DISPI_DISABLED              0x00
+ #define VBE_DISPI_ENABLED               0x01
diff --git a/recipes/qemu/qemu-0.12.4/06_sh4.diff b/recipes/qemu/qemu-0.12.4/06_sh4.diff
new file mode 100644
index 0000000..9e5fbec
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/06_sh4.diff
@@ -0,0 +1,287 @@
+commit 507dd07316e8b529def4f0f429c72b98e37d13d5
+Author: Aurelien Jarno <aurelien@aurel32.net>
+Date:   Sat Jan 30 20:41:33 2010 +0100
+
+    SH4/R2D: fix poweroff
+    
+    The write the the PA_POWOFF register is currently ignored. Fix that by
+    calling qemu_system_shutdown_request() when a poweroff is requested.
+    
+    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+diff --git a/hw/r2d.c b/hw/r2d.c
+index e4c02f0..8769a12 100644
+--- a/hw/r2d.c
++++ b/hw/r2d.c
+@@ -66,7 +66,6 @@ typedef struct {
+     uint16_t keyctlclr;
+     uint16_t pad0;
+     uint16_t pad1;
+-    uint16_t powoff;
+     uint16_t verreg;
+     uint16_t inport;
+     uint16_t outport;
+@@ -128,7 +127,7 @@ static uint32_t r2d_fpga_read(void *opaque, target_phys_addr_t addr)
+     case PA_OUTPORT:
+ 	return s->outport;
+     case PA_POWOFF:
+-	return s->powoff;
++	return 0x00;
+     case PA_VERREG:
+ 	return 0x10;
+     }
+@@ -150,8 +149,10 @@ r2d_fpga_write(void *opaque, target_phys_addr_t addr, uint32_t value)
+ 	s->outport = value;
+ 	break;
+     case PA_POWOFF:
+-	s->powoff = value;
+-	break;
++        if (value & 1) {
++            qemu_system_shutdown_request();
++        }
++        break;
+     case PA_VERREG:
+ 	/* Discard writes */
+ 	break;
+
+
+commit e6df0efdf7d4e304fe4a099cef625d8e4f60b320
+Author: Aurelien Jarno <aurelien@aurel32.net>
+Date:   Mon Feb 1 20:02:23 2010 +0100
+
+    target-sh4: MMU: simplify call to tlb_set_page()
+    
+    tlb_set_page() doesn't need addresses with offset, but simply the
+    page aligned addresses.
+    
+    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+diff --git a/target-sh4/helper.c b/target-sh4/helper.c
+index e7c494f..f9bf5e2 100644
+--- a/target-sh4/helper.c
++++ b/target-sh4/helper.c
+@@ -464,7 +464,7 @@ static int get_physical_address(CPUState * env, target_ulong * physical,
+ int cpu_sh4_handle_mmu_fault(CPUState * env, target_ulong address, int rw,
+ 			     int mmu_idx, int is_softmmu)
+ {
+-    target_ulong physical, page_offset, page_size;
++    target_ulong physical;
+     int prot, ret, access_type;
+ 
+     access_type = ACCESS_INT;
+@@ -511,11 +511,8 @@ int cpu_sh4_handle_mmu_fault(CPUState * env, target_ulong address, int rw,
+ 	return 1;
+     }
+ 
+-    page_size = TARGET_PAGE_SIZE;
+-    page_offset =
+-	(address - (address & TARGET_PAGE_MASK)) & ~(page_size - 1);
+-    address = (address & TARGET_PAGE_MASK) + page_offset;
+-    physical = (physical & TARGET_PAGE_MASK) + page_offset;
++    address &= TARGET_PAGE_MASK;
++    physical &= TARGET_PAGE_MASK;
+ 
+     return tlb_set_page(env, address, physical, prot, mmu_idx, is_softmmu);
+ }
+
+
+commit fc1a70eb8792472b7d18ad21f40763d4b32f9413
+Author: Aurelien Jarno <aurelien@aurel32.net>
+Date:   Tue Feb 2 19:50:51 2010 +0100
+
+    target-sh4: MMU: optimize UTLB accesses
+    
+    With the current code, the QEMU TLB is setup to match the read/write
+    mode of the MMU fault. This means when read access is done, the page
+    is setup in read-only mode. When the page is later accessed in write
+    mode, an MMU fault happened, and the page is switch in write-only
+    mode. This flip-flop causes a lot of calls to the MMU code and slow
+    down the emulation.
+    
+    This patch changes the MMU emulation, so that the QEMU TLB is setup
+    to match the UTLB protection key. This impressively increase the
+    speed of the emulation.
+    
+    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+diff --git a/target-sh4/helper.c b/target-sh4/helper.c
+index 589efe4..2d00dfa 100644
+--- a/target-sh4/helper.c
++++ b/target-sh4/helper.c
+@@ -386,38 +386,28 @@ static int get_mmu_address(CPUState * env, target_ulong * physical,
+ 	n = find_utlb_entry(env, address, use_asid);
+ 	if (n >= 0) {
+ 	    matching = &env->utlb[n];
+-	    switch ((matching->pr << 1) | ((env->sr & SR_MD) ? 1 : 0)) {
+-	    case 0:		/* 000 */
+-	    case 2:		/* 010 */
+-		n = (rw == 1) ? MMU_DTLB_VIOLATION_WRITE :
+-		    MMU_DTLB_VIOLATION_READ;
+-		break;
+-	    case 1:		/* 001 */
+-	    case 4:		/* 100 */
+-	    case 5:		/* 101 */
+-		if (rw == 1)
+-		    n = MMU_DTLB_VIOLATION_WRITE;
+-		else
+-		    *prot = PAGE_READ;
+-		break;
+-	    case 3:		/* 011 */
+-	    case 6:		/* 110 */
+-	    case 7:		/* 111 */
+-		*prot = (rw == 1)? PAGE_WRITE : PAGE_READ;
+-		break;
+-	    }
++            if (!(env->sr & SR_MD) && !(matching->pr & 2)) {
++                n = (rw == 1) ? MMU_DTLB_VIOLATION_WRITE :
++                    MMU_DTLB_VIOLATION_READ;
++            } else if ((rw == 1) && !(matching->pr & 1)) {
++                n = MMU_DTLB_VIOLATION_WRITE;
++            } else if ((rw == 1) & !matching->d) {
++                n = MMU_DTLB_INITIAL_WRITE;
++            } else {
++                *prot = PAGE_READ;
++                if ((matching->pr & 1) && matching->d) {
++                    *prot |= PAGE_WRITE;
++                }
++            }
+ 	} else if (n == MMU_DTLB_MISS) {
+ 	    n = (rw == 1) ? MMU_DTLB_MISS_WRITE :
+ 		MMU_DTLB_MISS_READ;
+ 	}
+     }
+     if (n >= 0) {
++	n = MMU_OK;
+ 	*physical = ((matching->ppn << 10) & ~(matching->size - 1)) |
+ 	    (address & (matching->size - 1));
+-	if ((rw == 1) & !matching->d)
+-	    n = MMU_DTLB_INITIAL_WRITE;
+-	else
+-	    n = MMU_OK;
+     }
+     return n;
+ }
+
+
+commit d7b30bf685e88c3cac4a5f470ef42b0b3c37aed9
+Author: Aurelien Jarno <aurelien@aurel32.net>
+Date:   Wed Feb 3 02:32:49 2010 +0100
+
+    target-sh4: MMU: reduce the size of a TLB entry
+    
+    Reduce the size of the TLB entry from 32 to 16 bytes, reorganising
+    members and using a bit field.
+    
+    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+diff --git a/target-sh4/cpu.h b/target-sh4/cpu.h
+index 015d598..85f221d 100644
+--- a/target-sh4/cpu.h
++++ b/target-sh4/cpu.h
+@@ -72,21 +72,20 @@
+  * The use of DELAY_SLOT_TRUE flag makes us accept such SR_T modification.
+  */
+ 
+-/* XXXXX The structure could be made more compact */
+ typedef struct tlb_t {
+-    uint8_t asid;		/* address space identifier */
+     uint32_t vpn;		/* virtual page number */
+-    uint8_t v;			/* validity */
+     uint32_t ppn;		/* physical page number */
+-    uint8_t sz;			/* page size */
+-    uint32_t size;		/* cached page size in bytes */
+-    uint8_t sh;			/* share status */
+-    uint8_t c;			/* cacheability */
+-    uint8_t pr;			/* protection key */
+-    uint8_t d;			/* dirty */
+-    uint8_t wt;			/* write through */
+-    uint8_t sa;			/* space attribute (PCMCIA) */
+-    uint8_t tc;			/* timing control */
++    uint32_t size;		/* mapped page size in bytes */
++    uint8_t asid;		/* address space identifier */
++    uint8_t v:1;		/* validity */
++    uint8_t sz:2;		/* page size */
++    uint8_t sh:1;		/* share status */
++    uint8_t c:1;		/* cacheability */
++    uint8_t pr:2;		/* protection key */
++    uint8_t d:1;		/* dirty */
++    uint8_t wt:1;		/* write through */
++    uint8_t sa:3;		/* space attribute (PCMCIA) */
++    uint8_t tc:1;		/* timing control */
+ } tlb_t;
+ 
+ #define UTLB_SIZE 64
+
+
+commit efcf683080924841f7ef32920fb79019a04dc681
+Author: Aurelien Jarno <aurelien@aurel32.net>
+Date:   Wed Feb 3 02:33:00 2010 +0100
+
+    target-sh4: MMU: remove dead code
+    
+    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+diff --git a/target-sh4/helper.c b/target-sh4/helper.c
+index 2d00dfa..9b3a259 100644
+--- a/target-sh4/helper.c
++++ b/target-sh4/helper.c
+@@ -261,24 +261,6 @@ static int find_tlb_entry(CPUState * env, target_ulong address,
+ 	    continue;		/* Invalid entry */
+ 	if (!entries[i].sh && use_asid && entries[i].asid != asid)
+ 	    continue;		/* Bad ASID */
+-#if 0
+-	switch (entries[i].sz) {
+-	case 0:
+-	    size = 1024;	/* 1kB */
+-	    break;
+-	case 1:
+-	    size = 4 * 1024;	/* 4kB */
+-	    break;
+-	case 2:
+-	    size = 64 * 1024;	/* 64kB */
+-	    break;
+-	case 3:
+-	    size = 1024 * 1024;	/* 1MB */
+-	    break;
+-	default:
+-	    assert(0);
+-	}
+-#endif
+ 	start = (entries[i].vpn << 10) & ~(entries[i].size - 1);
+ 	end = start + entries[i].size - 1;
+ 	if (address >= start && address <= end) {	/* Match */
+
+
+commit 2c8bbb9fabadf3687017694bae1008bee7fedc7c
+Author: Aurelien Jarno <aurelien@aurel32.net>
+Date:   Fri Apr 2 12:16:04 2010 +0200
+
+    hw/r2d: add a USB keyboard
+    
+    The R2D board does not have a PS/2 port, and only support a keyboard on
+    the USB bus.
+    
+    Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
+
+diff --git a/hw/r2d.c b/hw/r2d.c
+index 8769a12..ec075db 100644
+--- a/hw/r2d.c
++++ b/hw/r2d.c
+@@ -34,6 +34,7 @@
+ #include "sh7750_regs.h"
+ #include "ide.h"
+ #include "loader.h"
++#include "usb.h"
+ 
+ #define SDRAM_BASE 0x0c000000 /* Physical location of SDRAM: Area 3 */
+ #define SDRAM_SIZE 0x04000000
+@@ -240,6 +241,9 @@ static void r2d_init(ram_addr_t ram_size,
+     for (i = 0; i < nb_nics; i++)
+         pci_nic_init_nofail(&nd_table[i], "rtl8139", i==0 ? "2" : NULL);
+ 
++    /* USB keyboard */
++    usbdevice_create("keyboard");
++
+     /* Todo: register on board registers */
+     if (kernel_filename) {
+       int kernel_size;
diff --git a/recipes/qemu/qemu-0.12.4/3f26c1227e3b08010f2a65379cecf4cb4b5933fa.patch b/recipes/qemu/qemu-0.12.4/3f26c1227e3b08010f2a65379cecf4cb4b5933fa.patch
new file mode 100644
index 0000000..143b005
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/3f26c1227e3b08010f2a65379cecf4cb4b5933fa.patch
@@ -0,0 +1,134 @@
+From 3f26c1227e3b08010f2a65379cecf4cb4b5933fa Mon Sep 17 00:00:00 2001
+From: Riku Voipio <riku.voipio@nokia.com>
+Date: Mon, 25 Jan 2010 13:17:32 +0000
+Subject: target-arm: refactor cp15.c13 register access
+
+Access the cp15.c13 TLS registers directly with TCG ops instead of with
+a slow helper. If the the cp15 read/write was not TLS register access,
+fall back to the cp15 helper.
+
+This makes accessing __thread variables in linux-user when apps are compiled
+with -mtp=cp15 possible. legal cp15 register to acces from linux-user are
+already checked in cp15_user_ok.
+
+While at it, make the cp15.c13 Thread ID registers available only on
+ARMv6K and newer.
+
+Signed-off-by: Riku Voipio <riku.voipio@nokia.com>
+---
+diff --git a/target-arm/helper.c b/target-arm/helper.c
+index b3aec99..27001e8 100644
+--- a/target-arm/helper.c
++++ b/target-arm/helper.c
+@@ -511,7 +511,6 @@ void HELPER(set_cp15)(CPUState *env, uint32_t insn, uint32_t val)
+ uint32_t HELPER(get_cp15)(CPUState *env, uint32_t insn)
+ {
+     cpu_abort(env, "cp15 insn %08x\n", insn);
+-    return 0;
+ }
+ 
+ /* These should probably raise undefined insn exceptions.  */
+@@ -1491,15 +1490,6 @@ void HELPER(set_cp15)(CPUState *env, uint32_t insn, uint32_t val)
+               tlb_flush(env, 0);
+             env->cp15.c13_context = val;
+             break;
+-        case 2:
+-            env->cp15.c13_tls1 = val;
+-            break;
+-        case 3:
+-            env->cp15.c13_tls2 = val;
+-            break;
+-        case 4:
+-            env->cp15.c13_tls3 = val;
+-            break;
+         default:
+             goto bad_reg;
+         }
+@@ -1779,12 +1769,6 @@ uint32_t HELPER(get_cp15)(CPUState *env, uint32_t insn)
+             return env->cp15.c13_fcse;
+         case 1:
+             return env->cp15.c13_context;
+-        case 2:
+-            return env->cp15.c13_tls1;
+-        case 3:
+-            return env->cp15.c13_tls2;
+-        case 4:
+-            return env->cp15.c13_tls3;
+         default:
+             goto bad_reg;
+         }
+diff --git a/target-arm/translate.c b/target-arm/translate.c
+index 5cf3e06..786c329 100644
+--- a/target-arm/translate.c
++++ b/target-arm/translate.c
+@@ -2455,6 +2455,57 @@ static int cp15_user_ok(uint32_t insn)
+     return 0;
+ }
+ 
++static int cp15_tls_load_store(CPUState *env, DisasContext *s, uint32_t insn, uint32_t rd)
++{
++    TCGv tmp;
++    int cpn = (insn >> 16) & 0xf;
++    int cpm = insn & 0xf;
++    int op = ((insn >> 5) & 7) | ((insn >> 18) & 0x38);
++
++    if (!arm_feature(env, ARM_FEATURE_V6K))
++        return 0;
++
++    if (!(cpn == 13 && cpm == 0))
++        return 0;
++
++    if (insn & ARM_CP_RW_BIT) {
++        tmp = new_tmp();
++        switch (op) {
++        case 2:
++            tcg_gen_ld_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls1));
++            break;
++        case 3:
++            tcg_gen_ld_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls2));
++            break;
++        case 4:
++            tcg_gen_ld_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls3));
++            break;
++        default:
++            dead_tmp(tmp);
++            return 0;
++        }
++        store_reg(s, rd, tmp);
++
++    } else {
++        tmp = load_reg(s, rd);
++        switch (op) {
++        case 2:
++            tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls1));
++            break;
++        case 3:
++            tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls2));
++            break;
++        case 4:
++            tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls3));
++            break;
++        default:
++            return 0;
++        }
++        dead_tmp(tmp);
++    }
++    return 1;
++}
++
+ /* Disassemble system coprocessor (cp15) instruction.  Return nonzero if
+    instruction is not defined.  */
+ static int disas_cp15_insn(CPUState *env, DisasContext *s, uint32_t insn)
+@@ -2489,6 +2540,10 @@ static int disas_cp15_insn(CPUState *env, DisasContext *s, uint32_t insn)
+         return 0;
+     }
+     rd = (insn >> 12) & 0xf;
++
++    if (cp15_tls_load_store(env, s, insn, rd))
++        return 0;
++
+     tmp2 = tcg_const_i32(insn);
+     if (insn & ARM_CP_RW_BIT) {
+         tmp = new_tmp();
+--
+cgit v0.8.2.1
diff --git a/recipes/qemu/qemu-0.12.4/91-oh-sdl-cursor.patch b/recipes/qemu/qemu-0.12.4/91-oh-sdl-cursor.patch
new file mode 100644
index 0000000..335f4fb
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/91-oh-sdl-cursor.patch
@@ -0,0 +1,18 @@
+=== modified file 'sdl.c'
+---
+ sdl.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu/sdl.c
+===================================================================
+--- qemu/sdl.c.orig	2008-04-24 20:15:45.000000000 +0100
++++ qemu/sdl.c	2008-04-24 20:16:12.000000000 +0100
+@@ -247,7 +247,7 @@
+ 
+     if (kbd_mouse_is_absolute()) {
+         SDL_ShowCursor(1);
+-        SDL_SetCursor(sdl_cursor_hidden);
++        /* SDL_SetCursor(sdl_cursor_hidden); */
+     } else {
+         SDL_ShowCursor(0);
+     }
diff --git a/recipes/qemu/qemu-0.12.4/c5883be23519921254c6940873ee8db04979c20a.patch b/recipes/qemu/qemu-0.12.4/c5883be23519921254c6940873ee8db04979c20a.patch
new file mode 100644
index 0000000..bbdab11
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/c5883be23519921254c6940873ee8db04979c20a.patch
@@ -0,0 +1,61 @@
+From c5883be23519921254c6940873ee8db04979c20a Mon Sep 17 00:00:00 2001
+From: Paul Brook <paul@codesourcery.com>
+Date: Tue, 23 Feb 2010 14:45:16 +0000
+Subject: ARM CP15 tls fix
+
+Fix temporary handling in cp15 tls register load/store.
+
+Signed-off-by: Paul Brook <paul@codesourcery.com>
+---
+diff --git a/target-arm/translate.c b/target-arm/translate.c
+index 8b3b12d..ac04996 100644
+--- a/target-arm/translate.c
++++ b/target-arm/translate.c
+@@ -2469,19 +2469,17 @@ static int cp15_tls_load_store(CPUState *env, DisasContext *s, uint32_t insn, ui
+         return 0;
+ 
+     if (insn & ARM_CP_RW_BIT) {
+-        tmp = new_tmp();
+         switch (op) {
+         case 2:
+-            tcg_gen_ld_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls1));
++            tmp = load_cpu_field(cp15.c13_tls1);
+             break;
+         case 3:
+-            tcg_gen_ld_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls2));
++            tmp = load_cpu_field(cp15.c13_tls2);
+             break;
+         case 4:
+-            tcg_gen_ld_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls3));
++            tmp = load_cpu_field(cp15.c13_tls3);
+             break;
+         default:
+-            dead_tmp(tmp);
+             return 0;
+         }
+         store_reg(s, rd, tmp);
+@@ -2490,18 +2488,18 @@ static int cp15_tls_load_store(CPUState *env, DisasContext *s, uint32_t insn, ui
+         tmp = load_reg(s, rd);
+         switch (op) {
+         case 2:
+-            tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls1));
++            store_cpu_field(tmp, cp15.c13_tls1);
+             break;
+         case 3:
+-            tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls2));
++            store_cpu_field(tmp, cp15.c13_tls2);
+             break;
+         case 4:
+-            tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUARMState, cp15.c13_tls3));
++            store_cpu_field(tmp, cp15.c13_tls3);
+             break;
+         default:
++            dead_tmp(tmp);
+             return 0;
+         }
+-        dead_tmp(tmp);
+     }
+     return 1;
+ }
+--
+cgit v0.8.2.1
diff --git a/recipes/qemu/qemu-0.12.4/fallback.to.safe.mmap_min_addr.patch b/recipes/qemu/qemu-0.12.4/fallback.to.safe.mmap_min_addr.patch
new file mode 100644
index 0000000..fb1080f
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/fallback.to.safe.mmap_min_addr.patch
@@ -0,0 +1,37 @@
+From c313f89c33217ac0e471554dace2144718f86669 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 13 May 2010 12:23:40 +0200
+Subject: [PATCH] linux-user: use default mmap_min_addr 65536 when /proc/sys/vm/mmap_min_addr cannot be read
+
+* 65536 is default at least for ubuntu and fedora.
+---
+ linux-user/main.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/linux-user/main.c b/linux-user/main.c
+index 18b52c0..cf2cc59 100644
+--- a/linux-user/main.c
++++ b/linux-user/main.c
+@@ -2728,6 +2728,7 @@
+      * When user has explicitly set the quest base, we skip this
+      * test.
+      */
++#define MMAP_MIN_ADDR_DEFAULT 65536
+     if (!have_guest_base) {
+         FILE *fp;
+ 
+@@ -2736,8 +2737,14 @@
+             if (fscanf(fp, "%lu", &tmp) == 1) {
+                 mmap_min_addr = tmp;
+                 qemu_log("host mmap_min_addr=0x%lx\n", mmap_min_addr);
++            } else {
++                qemu_log("cannot read value from /proc/sys/vm/mmap_min_addr, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
++                mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
+             }
+             fclose(fp);
++        } else {
++            qemu_log("cannot open /proc/sys/vm/mmap_min_addr for reading, assuming %d\n", MMAP_MIN_ADDR_DEFAULT);
++            mmap_min_addr = MMAP_MIN_ADDR_DEFAULT;
+         }
+     }
+ #endif /* CONFIG_USE_GUEST_BASE */
diff --git a/recipes/qemu/qemu-0.12.4/fix_baum_c_compilation.patch b/recipes/qemu/qemu-0.12.4/fix_baum_c_compilation.patch
new file mode 100644
index 0000000..a2eb438
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/fix_baum_c_compilation.patch
@@ -0,0 +1,30 @@
+Index: trunk/hw/baum.c
+===================================================================
+--- trunk.orig/hw/baum.c	2008-11-29 05:12:40.418390606 +0300
++++ trunk/hw/baum.c	2008-11-29 05:13:11.498378426 +0300
+@@ -569,8 +569,10 @@ CharDriverState *chr_baum_init(void)
+     CharDriverState *chr;
+     brlapi_handle_t *handle;
+ #ifdef CONFIG_SDL
++#ifdef SDL_VIDEO_DRIVER_X11
+     SDL_SysWMinfo info;
+ #endif
++#endif
+     int tty;
+
+     baum = qemu_mallocz(sizeof(BaumDriverState));
+@@ -605,12 +607,14 @@ CharDriverState *chr_baum_init(void)
+     }
+
+ #ifdef CONFIG_SDL
++#ifdef SDL_VIDEO_DRIVER_X11
+     memset(&info, 0, sizeof(info));
+     SDL_VERSION(&info.version);
+     if (SDL_GetWMInfo(&info))
+         tty = info.info.x11.wmwindow;
+     else
+ #endif
++#endif
+         tty = BRLAPI_TTY_DEFAULT;
+
+     if (brlapi__enterTtyMode(handle, tty, NULL) == -1) {
diff --git a/recipes/qemu/qemu-0.12.4/fix_fortify_source_compilation.patch b/recipes/qemu/qemu-0.12.4/fix_fortify_source_compilation.patch
new file mode 100644
index 0000000..db507b3
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/fix_fortify_source_compilation.patch
@@ -0,0 +1,15 @@
+Index: qemu-0.12.3/block/vvfat.c
+===================================================================
+--- qemu-0.12.3.orig/block/vvfat.c
++++ qemu-0.12.3/block/vvfat.c
+@@ -868,7 +868,9 @@ static int init_directories(BDRVVVFATSta
+     {
+ 	direntry_t* entry=array_get_next(&(s->directory));
+ 	entry->attributes=0x28; /* archive | volume label */
+-	snprintf((char*)entry->name,11,"QEMU VVFAT");
++	// snprintf((char*)entry->name,11,"QEMU VVFAT");
++	snprintf(entry->name, sizeof(entry->name), "QEMU VV");
++	snprintf(entry->extension, sizeof(entry->extension), "FAT");
+     }
+ 
+     /* Now build FAT, and write back information into directory */
diff --git a/recipes/qemu/qemu-0.12.4/leftover.patch b/recipes/qemu/qemu-0.12.4/leftover.patch
new file mode 100644
index 0000000..c840d3e
--- /dev/null
+++ b/recipes/qemu/qemu-0.12.4/leftover.patch
@@ -0,0 +1,25 @@
+Index: qemu-0.10.0/hw/pc.c
+===================================================================
+--- qemu-0.10.0.orig/hw/pc.c	2009-03-07 13:47:27.000000000 +0100
++++ qemu-0.10.0/hw/pc.c	2009-03-07 13:47:30.000000000 +0100
+@@ -390,7 +390,8 @@
+     case 0x400:
+     case 0x401:
+         fprintf(stderr, "BIOS panic at rombios.c, line %d\n", val);
+-        exit(1);
++        /* according to documentation, these can be safely ignored */
++        break;
+     case 0x402:
+     case 0x403:
+ #ifdef DEBUG_BIOS
+@@ -413,8 +414,9 @@
+         /* LGPL'ed VGA BIOS messages */
+     case 0x501:
+     case 0x502:
++        /* according to documentation, these can be safely ignored */
+         fprintf(stderr, "VGA BIOS panic, line %d\n", val);
+-        exit(1);
++        break;
+     case 0x500:
+     case 0x503:
+ #ifdef DEBUG_BIOS
diff --git a/recipes/qemu/qemu_0.12.4.bb b/recipes/qemu/qemu_0.12.4.bb
new file mode 100644
index 0000000..05eb4c8
--- /dev/null
+++ b/recipes/qemu/qemu_0.12.4.bb
@@ -0,0 +1,39 @@
+LICENSE = "GPL"
+DEPENDS = "zlib"
+
+PR = "r0"
+
+SRC_URI = "\
+    http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz;name=qemu-${PV} \
+    file://02_kfreebsd.patch;patch=1 \
+    file://03_support_pselect_in_linux_user_arm.patch;patch=1 \
+    file://05_bochs_vbe.diff;patch=1 \
+    file://06_sh4.diff;patch=1 \
+    file://leftover.patch;patch=1 \
+    file://3f26c1227e3b08010f2a65379cecf4cb4b5933fa.patch;patch=1 \
+    file://c5883be23519921254c6940873ee8db04979c20a.patch;patch=1 \
+    file://91-oh-sdl-cursor.patch;patch=1 \
+    file://fix_baum_c_compilation.patch;patch=1 \
+    file://fix_fortify_source_compilation.patch;patch=1 \
+    file://fallback.to.safe.mmap_min_addr.patch;patch=1 \
+    "
+
+SRC_URI[qemu-0.12.4.md5sum] = "93e6b134dff89b2799f57b7d9e0e0fc5"
+SRC_URI[qemu-0.12.4.sha256sum] = "1a29a5b5151162d1de035c4926d1a1dbffee4a145ef61ee865d6b82aaea0602e"
+
+BBCLASSEXTEND="native"
+
+S = "${WORKDIR}/qemu-${PV}"
+
+EXTRA_OECONF += " --disable-curl --disable-sdl --disable-strip \
+                "
+
+inherit autotools
+
+do_configure_prepend_virtclass-native() {
+	export QEMU_CFLAGS="-I${STAGING_INCDIR_NATIVE} ${QEMU_CFLAGS}"
+}
+
+do_configure() {
+	${S}/configure --prefix=${prefix} ${EXTRA_OECONF}
+}
-- 
1.7.0.4



