Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <m.schuknecht@DResearch.de>) id 1P5ex3-0002Sv-FM
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 15:31:43 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DD871491278
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 15:03:15 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 12 Oct 2010 15:03:15 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10022)
	id 4BDF97207E; Tue, 12 Oct 2010 15:03:15 +0200 (CEST)
From: Mario Schuknecht <m.schuknecht@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 15:03:08 +0200
Message-Id: <1286888588-12182-1-git-send-email-m.schuknecht@dresearch.de>
X-Mailer: git-send-email 1.7.1
X-OriginalArrivalTime: 12 Oct 2010 13:03:15.0712 (UTC)
	FILETIME=[D55F9000:01CB6A0D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: m.schuknecht@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] linux-2.6.24: hipox machine fixed memzero.S
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
X-List-Received-Date: Tue, 12 Oct 2010 13:31:43 -0000

Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
---
 recipes/linux/linux-2.6.24/hipox/hipox.patch |  708 +++++++++++++-------------
 1 files changed, 354 insertions(+), 354 deletions(-)

diff --git a/recipes/linux/linux-2.6.24/hipox/hipox.patch b/recipes/linux/linux-2.6.24/hipox/hipox.patch
index c99ef51..6ff114b 100644
--- a/recipes/linux/linux-2.6.24/hipox/hipox.patch
+++ b/recipes/linux/linux-2.6.24/hipox/hipox.patch
@@ -1,6 +1,6 @@
 diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_dse_defconfig linux-2.6.24/arch/arm/configs/hipox_810_eabi_dse_defconfig
 --- linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_dse_defconfig	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_dse_defconfig	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_dse_defconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,1233 @@
 +#
 +# Automatically generated make config: don't edit
@@ -1237,7 +1237,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_dse_defconfig linux-2.
 +CONFIG_HAS_DMA=y
 diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_upgrade_defconfig linux-2.6.24/arch/arm/configs/hipox_810_eabi_upgrade_defconfig
 --- linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_upgrade_defconfig	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_upgrade_defconfig	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_upgrade_defconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,901 @@
 +#
 +# Automatically generated make config: don't edit
@@ -2142,7 +2142,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_upgrade_defconfig linu
 +CONFIG_HAS_DMA=y
 diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_wd_eval_defconfig linux-2.6.24/arch/arm/configs/hipox_810_eabi_wd_eval_defconfig
 --- linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_wd_eval_defconfig	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_wd_eval_defconfig	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_wd_eval_defconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,1096 @@
 +#
 +# Automatically generated make config: don't edit
@@ -3242,7 +3242,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_wd_eval_defconfig linu
 +CONFIG_HAS_DMA=y
 diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_wd_prod_defconfig linux-2.6.24/arch/arm/configs/hipox_810_eabi_wd_prod_defconfig
 --- linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_wd_prod_defconfig	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_wd_prod_defconfig	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/configs/hipox_810_eabi_wd_prod_defconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,1108 @@
 +#
 +# Automatically generated make config: don't edit
@@ -4353,8 +4353,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/configs/hipox_810_eabi_wd_prod_defconfig linu
 +CONFIG_HAS_IOPORT=y
 +CONFIG_HAS_DMA=y
 diff -Nurd linux-2.6.24.4/arch/arm/Kconfig linux-2.6.24/arch/arm/Kconfig
---- linux-2.6.24.4/arch/arm/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -409,6 +409,10 @@
  	help
  	  Support for TI's OMAP platform (OMAP1 and OMAP2).
@@ -4409,8 +4409,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/Kconfig linux-2.6.24/arch/arm/Kconfig
  endif
  
 diff -Nurd linux-2.6.24.4/arch/arm/kernel/armksyms.c linux-2.6.24/arch/arm/kernel/armksyms.c
---- linux-2.6.24.4/arch/arm/kernel/armksyms.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/kernel/armksyms.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/kernel/armksyms.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/kernel/armksyms.c	2010-10-12 14:09:58.000000000 +0200
 @@ -114,9 +114,15 @@
  EXPORT_SYMBOL(__strncpy_from_user);
  
@@ -4428,8 +4428,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/kernel/armksyms.c linux-2.6.24/arch/arm/kerne
  EXPORT_SYMBOL(__get_user_1);
  EXPORT_SYMBOL(__get_user_2);
 diff -Nurd linux-2.6.24.4/arch/arm/kernel/bios32.c linux-2.6.24/arch/arm/kernel/bios32.c
---- linux-2.6.24.4/arch/arm/kernel/bios32.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/kernel/bios32.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/kernel/bios32.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/kernel/bios32.c	2010-10-12 14:09:58.000000000 +0200
 @@ -616,7 +616,7 @@
  	}
  }
@@ -4440,8 +4440,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/kernel/bios32.c linux-2.6.24/arch/arm/kernel/
  	if (!strcmp(str, "debug")) {
  		debug_pci = 1;
 diff -Nurd linux-2.6.24.4/arch/arm/kernel/calls.S linux-2.6.24/arch/arm/kernel/calls.S
---- linux-2.6.24.4/arch/arm/kernel/calls.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/kernel/calls.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/kernel/calls.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/kernel/calls.S	2010-10-12 14:09:58.000000000 +0200
 @@ -362,6 +362,7 @@
  /* 350 */	CALL(sys_timerfd)
  		CALL(sys_eventfd)
@@ -4451,8 +4451,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/kernel/calls.S linux-2.6.24/arch/arm/kernel/c
  .equ syscalls_padding, ((NR_syscalls + 3) & ~3) - NR_syscalls
  #define syscalls_counted
 diff -Nurd linux-2.6.24.4/arch/arm/kernel/head.S linux-2.6.24/arch/arm/kernel/head.S
---- linux-2.6.24.4/arch/arm/kernel/head.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/kernel/head.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/kernel/head.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/kernel/head.S	2010-10-12 14:09:58.000000000 +0200
 @@ -59,6 +59,34 @@
  #define KERNEL_END	_end
  #endif
@@ -4653,8 +4653,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/kernel/head.S linux-2.6.24/arch/arm/kernel/he
  #ifdef CONFIG_DEBUG_LL
  	ldr	r7, [r10, #PROCINFO_IO_MMUFLAGS] @ io_mmuflags
 diff -Nurd linux-2.6.24.4/arch/arm/kernel/process.c linux-2.6.24/arch/arm/kernel/process.c
---- linux-2.6.24.4/arch/arm/kernel/process.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/kernel/process.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/kernel/process.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/kernel/process.c	2010-10-12 14:09:58.000000000 +0200
 @@ -117,7 +117,7 @@
  void (*pm_idle)(void);
  EXPORT_SYMBOL(pm_idle);
@@ -4665,8 +4665,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/kernel/process.c linux-2.6.24/arch/arm/kernel
  
  void (*arm_pm_restart)(char str) = arm_machine_restart;
 diff -Nurd linux-2.6.24.4/arch/arm/kernel/vmlinux.lds.S linux-2.6.24/arch/arm/kernel/vmlinux.lds.S
---- linux-2.6.24.4/arch/arm/kernel/vmlinux.lds.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/kernel/vmlinux.lds.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/kernel/vmlinux.lds.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/kernel/vmlinux.lds.S	2010-10-12 14:09:58.000000000 +0200
 @@ -86,8 +86,659 @@
  #endif
  	}
@@ -5330,8 +5330,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/kernel/vmlinux.lds.S linux-2.6.24/arch/arm/ke
  			*(.exception.text)
  			__exception_text_end = .;
 diff -Nurd linux-2.6.24.4/arch/arm/lib/clear_user.S linux-2.6.24/arch/arm/lib/clear_user.S
---- linux-2.6.24.4/arch/arm/lib/clear_user.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/lib/clear_user.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/lib/clear_user.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/lib/clear_user.S	2010-10-12 14:09:58.000000000 +0200
 @@ -18,7 +18,11 @@
   *          : sz   - number of bytes to clear
   * Returns  : number of bytes NOT cleared
@@ -5345,8 +5345,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/lib/clear_user.S linux-2.6.24/arch/arm/lib/cl
  		mov	r2, #0
  		cmp	r1, #4
 diff -Nurd linux-2.6.24.4/arch/arm/lib/copy_from_user.S linux-2.6.24/arch/arm/lib/copy_from_user.S
---- linux-2.6.24.4/arch/arm/lib/copy_from_user.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/lib/copy_from_user.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/lib/copy_from_user.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/lib/copy_from_user.S	2010-10-12 14:09:58.000000000 +0200
 @@ -83,7 +83,12 @@
  
  	.text
@@ -5361,8 +5361,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/lib/copy_from_user.S linux-2.6.24/arch/arm/li
  #include "copy_template.S"
  
 diff -Nurd linux-2.6.24.4/arch/arm/lib/copy_to_user.S linux-2.6.24/arch/arm/lib/copy_to_user.S
---- linux-2.6.24.4/arch/arm/lib/copy_to_user.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/lib/copy_to_user.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/lib/copy_to_user.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/lib/copy_to_user.S	2010-10-12 14:09:58.000000000 +0200
 @@ -86,7 +86,12 @@
  
  	.text
@@ -5378,7 +5378,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/lib/copy_to_user.S linux-2.6.24/arch/arm/lib/
  
 diff -Nurd linux-2.6.24.4/arch/arm/lib/hipox_copies.c linux-2.6.24/arch/arm/lib/hipox_copies.c
 --- linux-2.6.24.4/arch/arm/lib/hipox_copies.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/lib/hipox_copies.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/lib/hipox_copies.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,261 @@
 +/*
 + * linux/arch/arm/lib/nas_copies.c
@@ -5642,8 +5642,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/lib/hipox_copies.c linux-2.6.24/arch/arm/lib/
 +//}
 +
 diff -Nurd linux-2.6.24.4/arch/arm/lib/Makefile linux-2.6.24/arch/arm/lib/Makefile
---- linux-2.6.24.4/arch/arm/lib/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/lib/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/lib/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/lib/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -29,6 +29,10 @@
  endif
  endif
@@ -5656,8 +5656,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/lib/Makefile linux-2.6.24/arch/arm/lib/Makefi
  
  ifeq ($(CONFIG_CPU_32v3),y)
 diff -Nurd linux-2.6.24.4/arch/arm/lib/memcpy.S linux-2.6.24/arch/arm/lib/memcpy.S
---- linux-2.6.24.4/arch/arm/lib/memcpy.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/lib/memcpy.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/lib/memcpy.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/lib/memcpy.S	2010-10-12 14:09:58.000000000 +0200
 @@ -53,6 +53,7 @@
  
  /* Prototype: void *memcpy(void *dest, const void *src, size_t n); */
@@ -5667,19 +5667,19 @@ diff -Nurd linux-2.6.24.4/arch/arm/lib/memcpy.S linux-2.6.24/arch/arm/lib/memcpy
  
  #include "copy_template.S"
 diff -Nurd linux-2.6.24.4/arch/arm/lib/memzero.S linux-2.6.24/arch/arm/lib/memzero.S
---- linux-2.6.24.4/arch/arm/lib/memzero.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/lib/memzero.S	2010-01-14 14:01:15.000000000 +0100
-@@ -30,6 +30,7 @@
-  * memzero again.
+--- linux-2.6.24.4/arch/arm/lib/memzero.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/lib/memzero.S	2010-10-12 14:10:16.000000000 +0200
+@@ -18,6 +18,7 @@
+  * mis-aligned by, and r1 is the number of bytes.  If r1 < 4, then we
+  * don't bother; we use byte stores instead.
   */
- 
 +.section ".text.__memzero"
- ENTRY(__memzero)
- 	mov	r2, #0			@ 1
- 	ands	r3, r0, #3		@ 1 unaligned?
+ 1:	subs	r1, r1, #4		@ 1 do we have enough
+ 	blt	5f			@ 1 bytes to align with?
+ 	cmp	r3, #2			@ 1
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/ahb_mon.c linux-2.6.24/arch/arm/mach-hipox/ahb_mon.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/ahb_mon.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/ahb_mon.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/ahb_mon.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,177 @@
 +/*
 + *  linux/arch/arm/mach-hipox/ahb_mon.c
@@ -5860,7 +5860,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/ahb_mon.c linux-2.6.24/arch/arm/ma
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/cipher.c linux-2.6.24/arch/arm/mach-hipox/cipher.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/cipher.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/cipher.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/cipher.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,362 @@
 +/* linux/arch/arm/mach-hipox/cipher.c
 + *
@@ -6226,7 +6226,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/cipher.c linux-2.6.24/arch/arm/mac
 +module_exit(ox800_aeslrw_exit);
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/dma.c linux-2.6.24/arch/arm/mach-hipox/dma.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/dma.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/dma.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/dma.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,2849 @@
 +/*
 + * linux/arch/arm/mach-hipox/dma.c
@@ -9079,7 +9079,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/dma.c linux-2.6.24/arch/arm/mach-h
 +EXPORT_SYMBOL(hipox_dpe_tx_dma_settings);
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/dpe_test.c linux-2.6.24/arch/arm/mach-hipox/dpe_test.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/dpe_test.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/dpe_test.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/dpe_test.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,3051 @@
 +/*
 + * /arch/=arm/mach-hipox/dpe-test.c
@@ -12134,7 +12134,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/dpe_test.c linux-2.6.24/arch/arm/m
 +module_init(ox800dpe_init);
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_desc.c linux-2.6.24/arch/arm/mach-hipox/gmac_desc.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_desc.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_desc.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_desc.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,452 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac_desc.c
@@ -12590,7 +12590,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_desc.c linux-2.6.24/arch/arm/
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_desc.h linux-2.6.24/arch/arm/mach-hipox/gmac_desc.h
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_desc.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_desc.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_desc.h	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,315 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac_desc.h
@@ -12909,7 +12909,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_desc.h linux-2.6.24/arch/arm/
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_ethtool.c linux-2.6.24/arch/arm/mach-hipox/gmac_ethtool.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_ethtool.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_ethtool.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_ethtool.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,275 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac_ethtool.c
@@ -13188,7 +13188,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_ethtool.c linux-2.6.24/arch/a
 +}
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_ethtool.h linux-2.6.24/arch/arm/mach-hipox/gmac_ethtool.h
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_ethtool.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_ethtool.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_ethtool.h	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,26 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac_ethtool.h
@@ -13218,7 +13218,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_ethtool.h linux-2.6.24/arch/a
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac.h linux-2.6.24/arch/arm/mach-hipox/gmac.h
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac.h	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,194 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac.h
@@ -13416,7 +13416,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac.h linux-2.6.24/arch/arm/mach-
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac-napi.c linux-2.6.24/arch/arm/mach-hipox/gmac-napi.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac-napi.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac-napi.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac-napi.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,3637 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac.c
@@ -17057,7 +17057,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac-napi.c linux-2.6.24/arch/arm/
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_offload.c linux-2.6.24/arch/arm/mach-hipox/gmac_offload.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_offload.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_offload.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_offload.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,223 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac-offload.c
@@ -17284,7 +17284,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_offload.c linux-2.6.24/arch/a
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_offload.h linux-2.6.24/arch/arm/mach-hipox/gmac_offload.h
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_offload.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_offload.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_offload.h	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,163 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac-offload.h
@@ -17451,7 +17451,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_offload.h linux-2.6.24/arch/a
 +#endif // CONFIG_LEON_COPRO
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_phy.c linux-2.6.24/arch/arm/mach-hipox/gmac_phy.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_phy.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_phy.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_phy.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,318 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac_phy.c
@@ -17773,7 +17773,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_phy.c linux-2.6.24/arch/arm/m
 +}
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_phy.h linux-2.6.24/arch/arm/mach-hipox/gmac_phy.h
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_phy.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_phy.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_phy.h	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,78 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac_phy.h
@@ -17855,7 +17855,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_phy.h linux-2.6.24/arch/arm/m
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_reg.h linux-2.6.24/arch/arm/mach-hipox/gmac_reg.h
 --- linux-2.6.24.4/arch/arm/mach-hipox/gmac_reg.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gmac_reg.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gmac_reg.h	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,508 @@
 +/*
 + * linux/arch/arm/mach-hipox/gmac_reg.h
@@ -18367,7 +18367,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gmac_reg.h linux-2.6.24/arch/arm/m
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gpioTest.c linux-2.6.24/arch/arm/mach-hipox/gpioTest.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/gpioTest.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/gpioTest.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/gpioTest.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,657 @@
 +#include <asm/io.h>
 +#include <asm/bitops.h>
@@ -19028,7 +19028,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/gpioTest.c linux-2.6.24/arch/arm/m
 +module_exit(gpioTest_exit);
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/hipox-ahb-monitor.c linux-2.6.24/arch/arm/mach-hipox/hipox-ahb-monitor.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/hipox-ahb-monitor.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/hipox-ahb-monitor.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/hipox-ahb-monitor.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,374 @@
 +/*
 + *  arch/arm/mach-hipox/hipox-ahb-monitor.c
@@ -19406,7 +19406,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/hipox-ahb-monitor.c linux-2.6.24/a
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/hipox.c linux-2.6.24/arch/arm/mach-hipox/hipox.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/hipox.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/hipox.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/hipox.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,1104 @@
 +/*
 + * linux/arch/arm/mach-hipox/hipox.c
@@ -20514,7 +20514,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/hipox.c linux-2.6.24/arch/arm/mach
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/hipox-wd810-leds.c linux-2.6.24/arch/arm/mach-hipox/hipox-wd810-leds.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/hipox-wd810-leds.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/hipox-wd810-leds.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/hipox-wd810-leds.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,1021 @@
 +/*
 + * linux/arch/arm/mach-hipox/hipox-wd810-leds.c
@@ -21539,7 +21539,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/hipox-wd810-leds.c linux-2.6.24/ar
 +/******************************* End of File *********************************/
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/i2s.c linux-2.6.24/arch/arm/mach-hipox/i2s.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/i2s.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/i2s.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/i2s.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,352 @@
 +/* 
 + *  procfs3.c -  create a "file" in /proc, use the file_operation way
@@ -21895,7 +21895,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/i2s.c linux-2.6.24/arch/arm/mach-h
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/irq.c linux-2.6.24/arch/arm/mach-hipox/irq.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/irq.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/irq.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/irq.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,59 @@
 +/*
 + *  linux/arch/arm/mach-hipox/irq.c
@@ -21958,7 +21958,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/irq.c linux-2.6.24/arch/arm/mach-h
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/Kconfig linux-2.6.24/arch/arm/mach-hipox/Kconfig
 --- linux-2.6.24.4/arch/arm/mach-hipox/Kconfig	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/Kconfig	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,574 @@
 +if ARCH_HIPOX
 +
@@ -22536,7 +22536,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/Kconfig linux-2.6.24/arch/arm/mach
 +endif
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/leds.c linux-2.6.24/arch/arm/mach-hipox/leds.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/leds.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/leds.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/leds.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,212 @@
 +/*
 + * linux/arch/arm/mach-hipox/leds.c
@@ -22752,7 +22752,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/leds.c linux-2.6.24/arch/arm/mach-
 +MODULE_LICENSE("GPL");
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/ledtrig_sata.c linux-2.6.24/arch/arm/mach-hipox/ledtrig_sata.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/ledtrig_sata.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/ledtrig_sata.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/ledtrig_sata.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,69 @@
 +/*
 + * linux/arch/arm/mach-hipox/leds.c
@@ -22825,7 +22825,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/ledtrig_sata.c linux-2.6.24/arch/a
 +MODULE_LICENSE("GPL");
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/leon.c linux-2.6.24/arch/arm/mach-hipox/leon.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/leon.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/leon.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/leon.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,244 @@
 +/*
 + * linux/arch/arm/mach-hipox/leon.c
@@ -23073,7 +23073,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/leon.c linux-2.6.24/arch/arm/mach-
 +#endif // CONFIG_SUPPORT_LEON
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/Makefile linux-2.6.24/arch/arm/mach-hipox/Makefile
 --- linux-2.6.24.4/arch/arm/mach-hipox/Makefile	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/Makefile	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,43 @@
 +#
 +# Makefile for the linux kernel.
@@ -23120,14 +23120,14 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/Makefile linux-2.6.24/arch/arm/mac
 +obj-$(CONFIG_WDC_LEDS_TRIGGER_SATA_DISK) += wdc-ledtrig-sata.o
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/Makefile.boot linux-2.6.24/arch/arm/mach-hipox/Makefile.boot
 --- linux-2.6.24.4/arch/arm/mach-hipox/Makefile.boot	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/Makefile.boot	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/Makefile.boot	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,3 @@
 +initrd_phys-$(CONFIG_ARCH_HIPOX)	:= 0x48200000
 +params_phys-$(CONFIG_ARCH_HIPOX)	:= 0x48000100
 +zreladdr-$(CONFIG_ARCH_HIPOX)		:= 0x48008000
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/pci.c linux-2.6.24/arch/arm/mach-hipox/pci.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/pci.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/pci.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/pci.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,678 @@
 +/*
 + *  arch/arm/mach-hipox/pci.c
@@ -23809,7 +23809,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/pci.c linux-2.6.24/arch/arm/mach-h
 +#endif
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/power_button.c linux-2.6.24/arch/arm/mach-hipox/power_button.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/power_button.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/power_button.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/power_button.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,270 @@
 +/*
 + * linux/arch/arm/mach-hipox/power_button.c
@@ -24083,7 +24083,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/power_button.c linux-2.6.24/arch/a
 +module_exit(power_button_exit);
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/README linux-2.6.24/arch/arm/mach-hipox/README
 --- linux-2.6.24.4/arch/arm/mach-hipox/README	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/README	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/README	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,85 @@
 +
 +usb-test-modes 
@@ -24172,7 +24172,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/README linux-2.6.24/arch/arm/mach-
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/samba_reserve.c linux-2.6.24/arch/arm/mach-hipox/samba_reserve.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/samba_reserve.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/samba_reserve.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/samba_reserve.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,50 @@
 +/*
 + * linux/arch/arm/mach-hipox/samba_receive.c
@@ -24226,7 +24226,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/samba_reserve.c linux-2.6.24/arch/
 +}
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/thermAndFan.c linux-2.6.24/arch/arm/mach-hipox/thermAndFan.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/thermAndFan.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/thermAndFan.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/thermAndFan.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,738 @@
 +/*
 + * Device driver for the i2c thermostat found on the iBook G4, Albook G4
@@ -24968,7 +24968,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/thermAndFan.c linux-2.6.24/arch/ar
 +/* End of File */
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/thermistorCalibration.h linux-2.6.24/arch/arm/mach-hipox/thermistorCalibration.h
 --- linux-2.6.24.4/arch/arm/mach-hipox/thermistorCalibration.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/thermistorCalibration.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/thermistorCalibration.h	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,149 @@
 +#ifndef __THERMISTOR_LOOKUP_TABLE_10K3A_H
 +#define __THERMISTOR_LOOKUP_TABLE_10K3A_H
@@ -25121,7 +25121,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/thermistorCalibration.h linux-2.6.
 +#endif
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/time.c linux-2.6.24/arch/arm/mach-hipox/time.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/time.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/time.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/time.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,159 @@
 +/*
 + *  linux/arch/arm/mach-hipox/irq.c
@@ -25284,7 +25284,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/time.c linux-2.6.24/arch/arm/mach-
 +};
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/usb-test-mode.c linux-2.6.24/arch/arm/mach-hipox/usb-test-mode.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/usb-test-mode.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/usb-test-mode.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/usb-test-mode.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,253 @@
 +/*
 + *  arch/arm/mach-hipox/usb-test-mode.c
@@ -25541,7 +25541,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/usb-test-mode.c linux-2.6.24/arch/
 +
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/user_recovery_button.c linux-2.6.24/arch/arm/mach-hipox/user_recovery_button.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/user_recovery_button.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/user_recovery_button.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/user_recovery_button.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,260 @@
 +/*
 + * linux/arch/arm/mach-hipox/user_recovery_button.c
@@ -25805,7 +25805,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/user_recovery_button.c linux-2.6.2
 +module_exit(recovery_button_exit);
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/wdc-fan.c linux-2.6.24/arch/arm/mach-hipox/wdc-fan.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/wdc-fan.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/wdc-fan.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/wdc-fan.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,336 @@
 +/*
 + * linux/arch/arm/mach-hipox/wdc-fan.c
@@ -26145,7 +26145,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/wdc-fan.c linux-2.6.24/arch/arm/ma
 +/*EOF*/
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/wdc-leds.c linux-2.6.24/arch/arm/mach-hipox/wdc-leds.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/wdc-leds.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/wdc-leds.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/wdc-leds.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,1299 @@
 +/*
 + * linux/arch/arm/mach-hipox/wdc-leds.c
@@ -27448,7 +27448,7 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/wdc-leds.c linux-2.6.24/arch/arm/m
 +/******************************* End of File *********************************/
 diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/wdc-ledtrig-sata.c linux-2.6.24/arch/arm/mach-hipox/wdc-ledtrig-sata.c
 --- linux-2.6.24.4/arch/arm/mach-hipox/wdc-ledtrig-sata.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/arch/arm/mach-hipox/wdc-ledtrig-sata.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/arch/arm/mach-hipox/wdc-ledtrig-sata.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,78 @@
 +/*
 + * linux/arch/arm/mach-hipox/wdc-ledtrig-sata.c
@@ -27529,8 +27529,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/mach-hipox/wdc-ledtrig-sata.c linux-2.6.24/ar
 +
 +/******************************* End of File *********************************/
 diff -Nurd linux-2.6.24.4/arch/arm/Makefile linux-2.6.24/arch/arm/Makefile
---- linux-2.6.24.4/arch/arm/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -127,6 +127,7 @@
   machine-$(CONFIG_ARCH_VERSATILE)  := versatile
   machine-$(CONFIG_ARCH_IMX)	   := imx
@@ -27540,8 +27540,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/Makefile linux-2.6.24/arch/arm/Makefile
   machine-$(CONFIG_ARCH_REALVIEW)   := realview
   machine-$(CONFIG_ARCH_AT91)	   := at91
 diff -Nurd linux-2.6.24.4/arch/arm/mm/init.c linux-2.6.24/arch/arm/mm/init.c
---- linux-2.6.24.4/arch/arm/mm/init.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/mm/init.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/mm/init.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/mm/init.c	2010-10-12 14:09:58.000000000 +0200
 @@ -173,9 +173,19 @@
  #ifdef CONFIG_MMU
  	struct map_desc map;
@@ -27563,8 +27563,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/mm/init.c linux-2.6.24/arch/arm/mm/init.c
  
  	create_mapping(&map);
 diff -Nurd linux-2.6.24.4/arch/arm/mm/Kconfig linux-2.6.24/arch/arm/mm/Kconfig
---- linux-2.6.24.4/arch/arm/mm/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/mm/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/mm/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/mm/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -171,8 +171,8 @@
  # ARM926T
  config CPU_ARM926T
@@ -27577,8 +27577,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/mm/Kconfig linux-2.6.24/arch/arm/mm/Kconfig
  	select CPU_ABRT_EV5TJ
  	select CPU_CACHE_VIVT
 diff -Nurd linux-2.6.24.4/arch/arm/mm/mmu.c linux-2.6.24/arch/arm/mm/mmu.c
---- linux-2.6.24.4/arch/arm/mm/mmu.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/mm/mmu.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/mm/mmu.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/mm/mmu.c	2010-10-12 14:09:58.000000000 +0200
 @@ -617,6 +617,15 @@
  	reserve_bootmem_node(pgdat, __pa(swapper_pg_dir),
  			     PTRS_PER_PGD * sizeof(pgd_t));
@@ -27596,8 +27596,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/mm/mmu.c linux-2.6.24/arch/arm/mm/mmu.c
  	 * Hmm... This should go elsewhere, but we really really need to
  	 * stop things allocating the low memory; ideally we need a better
 diff -Nurd linux-2.6.24.4/arch/arm/mm/proc-arm926.S linux-2.6.24/arch/arm/mm/proc-arm926.S
---- linux-2.6.24.4/arch/arm/mm/proc-arm926.S	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/arch/arm/mm/proc-arm926.S	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/arch/arm/mm/proc-arm926.S	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/arch/arm/mm/proc-arm926.S	2010-10-12 14:09:58.000000000 +0200
 @@ -245,6 +245,7 @@
   *
   * (same as v4wb)
@@ -27647,8 +27647,8 @@ diff -Nurd linux-2.6.24.4/arch/arm/mm/proc-arm926.S linux-2.6.24/arch/arm/mm/pro
  ENTRY(arm926_cache_fns)
  	.long	arm926_flush_kern_cache_all
 diff -Nurd linux-2.6.24.4/block/ll_rw_blk.c linux-2.6.24/block/ll_rw_blk.c
---- linux-2.6.24.4/block/ll_rw_blk.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/block/ll_rw_blk.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/block/ll_rw_blk.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/block/ll_rw_blk.c	2010-10-12 14:09:58.000000000 +0200
 @@ -1424,6 +1424,13 @@
  	else
  		max_sectors = q->max_sectors;
@@ -27720,8 +27720,8 @@ diff -Nurd linux-2.6.24.4/block/ll_rw_blk.c linux-2.6.24/block/ll_rw_blk.c
  		case ELEVATOR_BACK_MERGE:
  			BUG_ON(!rq_mergeable(req));
 diff -Nurd linux-2.6.24.4/drivers/ata/Kconfig linux-2.6.24/drivers/ata/Kconfig
---- linux-2.6.24.4/drivers/ata/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/ata/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/ata/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/ata/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -182,15 +182,49 @@
  	  firmware in the BIOS. This driver can sometimes handle
  	  otherwise unsupported hardware.
@@ -27774,8 +27774,8 @@ diff -Nurd linux-2.6.24.4/drivers/ata/Kconfig linux-2.6.24/drivers/ata/Kconfig
  	tristate "ALi PATA support (Experimental)"
  	depends on PCI && EXPERIMENTAL
 diff -Nurd linux-2.6.24.4/drivers/ata/libata-core.c linux-2.6.24/drivers/ata/libata-core.c
---- linux-2.6.24.4/drivers/ata/libata-core.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/ata/libata-core.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/ata/libata-core.c	2010-10-12 14:08:56.000000000 +0200
++++ linux-2.6.24/drivers/ata/libata-core.c	2010-10-12 14:09:58.000000000 +0200
 @@ -140,6 +140,8 @@
   */
  void ata_tf_to_fis(const struct ata_taskfile *tf, u8 pmp, int is_cmd, u8 *fis)
@@ -29217,8 +29217,8 @@ diff -Nurd linux-2.6.24.4/drivers/ata/libata-core.c linux-2.6.24/drivers/ata/lib
  }
  
 diff -Nurd linux-2.6.24.4/drivers/ata/libata-eh.c linux-2.6.24/drivers/ata/libata-eh.c
---- linux-2.6.24.4/drivers/ata/libata-eh.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/ata/libata-eh.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/ata/libata-eh.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/ata/libata-eh.c	2010-10-12 14:09:58.000000000 +0200
 @@ -89,6 +89,8 @@
  static void __ata_ehi_pushv_desc(struct ata_eh_info *ehi, const char *fmt,
  				 va_list args)
@@ -29709,8 +29709,8 @@ diff -Nurd linux-2.6.24.4/drivers/ata/libata-eh.c linux-2.6.24/drivers/ata/libat
  	spin_lock_irqsave(ap->lock, flags);
  	if (!(ap->pflags & ATA_PFLAG_PM_PENDING) ||
 diff -Nurd linux-2.6.24.4/drivers/ata/libata-scsi.c linux-2.6.24/drivers/ata/libata-scsi.c
---- linux-2.6.24.4/drivers/ata/libata-scsi.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/ata/libata-scsi.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/ata/libata-scsi.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/ata/libata-scsi.c	2010-10-12 14:09:58.000000000 +0200
 @@ -1477,7 +1477,10 @@
  
  	qc->scsidone(cmd);
@@ -29807,8 +29807,8 @@ diff -Nurd linux-2.6.24.4/drivers/ata/libata-scsi.c linux-2.6.24/drivers/ata/lib
  	 * 12 and 16 byte CDBs use different offsets to
  	 * provide the various register values.
 diff -Nurd linux-2.6.24.4/drivers/ata/Makefile linux-2.6.24/drivers/ata/Makefile
---- linux-2.6.24.4/drivers/ata/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/ata/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/ata/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/ata/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -18,6 +18,8 @@
  obj-$(CONFIG_SATA_INIC162X)	+= sata_inic162x.o
  obj-$(CONFIG_PDC_ADMA)		+= pdc_adma.o
@@ -29820,7 +29820,7 @@ diff -Nurd linux-2.6.24.4/drivers/ata/Makefile linux-2.6.24/drivers/ata/Makefile
  obj-$(CONFIG_PATA_AMD)		+= pata_amd.o
 diff -Nurd linux-2.6.24.4/drivers/ata/ox800sata.c linux-2.6.24/drivers/ata/ox800sata.c
 --- linux-2.6.24.4/drivers/ata/ox800sata.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/drivers/ata/ox800sata.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/drivers/ata/ox800sata.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,2184 @@
 +/**************************************************************************
 + *
@@ -32006,9 +32006,9 @@ diff -Nurd linux-2.6.24.4/drivers/ata/ox800sata.c linux-2.6.24/drivers/ata/ox800
 +EXPORT_SYMBOL( hipoxsata_RAID_faults );
 +EXPORT_SYMBOL( hipoxsata_get_port_no );
 +EXPORT_SYMBOL( hipoxsata_LBA_schemes_compatible );
-diff -Nurd linux-2.6.24/drivers/ata/ox810sata.c linux-2.6.24-oxe810/drivers/ata/ox810sata.c
---- linux-2.6.24/drivers/ata/ox810sata.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24-oxe810/drivers/ata/ox810sata.c	2008-06-11 17:50:32.000000000 +0200
+diff -Nurd linux-2.6.24.4/drivers/ata/ox810sata.c linux-2.6.24/drivers/ata/ox810sata.c
+--- linux-2.6.24.4/drivers/ata/ox810sata.c	1970-01-01 01:00:00.000000000 +0100
++++ linux-2.6.24/drivers/ata/ox810sata.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,2441 @@
 +/**************************************************************************
 + *
@@ -34453,7 +34453,7 @@ diff -Nurd linux-2.6.24/drivers/ata/ox810sata.c linux-2.6.24-oxe810/drivers/ata/
 +module_exit(ox810sata_device_exit);
 diff -Nurd linux-2.6.24.4/drivers/dma/hipox_adma.c linux-2.6.24/drivers/dma/hipox_adma.c
 --- linux-2.6.24.4/drivers/dma/hipox_adma.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/drivers/dma/hipox_adma.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/drivers/dma/hipox_adma.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,272 @@
 +/*
 + * drivers/dma/hipox_adma.c
@@ -34728,8 +34728,8 @@ diff -Nurd linux-2.6.24.4/drivers/dma/hipox_adma.c linux-2.6.24/drivers/dma/hipo
 +
 +module_exit(hipox_adma_exit_module);
 diff -Nurd linux-2.6.24.4/drivers/dma/Kconfig linux-2.6.24/drivers/dma/Kconfig
---- linux-2.6.24.4/drivers/dma/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/dma/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/dma/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/dma/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -4,7 +4,7 @@
  
  menuconfig DMADEVICES
@@ -34755,8 +34755,8 @@ diff -Nurd linux-2.6.24.4/drivers/dma/Kconfig linux-2.6.24/drivers/dma/Kconfig
  	bool
  
 diff -Nurd linux-2.6.24.4/drivers/dma/Makefile linux-2.6.24/drivers/dma/Makefile
---- linux-2.6.24.4/drivers/dma/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/dma/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/dma/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/dma/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -3,3 +3,4 @@
  obj-$(CONFIG_INTEL_IOATDMA) += ioatdma.o
  ioatdma-objs := ioat.o ioat_dma.o ioat_dca.o
@@ -34764,7 +34764,7 @@ diff -Nurd linux-2.6.24.4/drivers/dma/Makefile linux-2.6.24/drivers/dma/Makefile
 +obj-$(CONFIG_HIPOX_ADMA) += hipox_adma.o
 diff -Nurd linux-2.6.24.4/drivers/i2c/algos/i2c-algo-hipox.c linux-2.6.24/drivers/i2c/algos/i2c-algo-hipox.c
 --- linux-2.6.24.4/drivers/i2c/algos/i2c-algo-hipox.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/drivers/i2c/algos/i2c-algo-hipox.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/drivers/i2c/algos/i2c-algo-hipox.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,858 @@
 +/*
 + * i2c-algo-hipox.c i2x driver algorithms for MPChipox 
@@ -35625,8 +35625,8 @@ diff -Nurd linux-2.6.24.4/drivers/i2c/algos/i2c-algo-hipox.c linux-2.6.24/driver
 +MODULE_LICENSE("GPL");
 +
 diff -Nurd linux-2.6.24.4/drivers/i2c/algos/Kconfig linux-2.6.24/drivers/i2c/algos/Kconfig
---- linux-2.6.24.4/drivers/i2c/algos/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/i2c/algos/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/i2c/algos/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/i2c/algos/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -34,6 +34,10 @@
  	  This support is also available as a module.  If so, the module 
  	  will be called i2c-algo-pca.
@@ -35639,8 +35639,8 @@ diff -Nurd linux-2.6.24.4/drivers/i2c/algos/Kconfig linux-2.6.24/drivers/i2c/alg
  	tristate "I2C SGI interfaces"
  	depends on SGI_IP22 || SGI_IP32 || X86_VISWS
 diff -Nurd linux-2.6.24.4/drivers/i2c/algos/Makefile linux-2.6.24/drivers/i2c/algos/Makefile
---- linux-2.6.24.4/drivers/i2c/algos/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/i2c/algos/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/i2c/algos/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/i2c/algos/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -5,6 +5,7 @@
  obj-$(CONFIG_I2C_ALGOBIT)	+= i2c-algo-bit.o
  obj-$(CONFIG_I2C_ALGOPCF)	+= i2c-algo-pcf.o
@@ -35651,7 +35651,7 @@ diff -Nurd linux-2.6.24.4/drivers/i2c/algos/Makefile linux-2.6.24/drivers/i2c/al
  ifeq ($(CONFIG_I2C_DEBUG_ALGO),y)
 diff -Nurd linux-2.6.24.4/drivers/i2c/busses/i2c-hipox-bitbash.c linux-2.6.24/drivers/i2c/busses/i2c-hipox-bitbash.c
 --- linux-2.6.24.4/drivers/i2c/busses/i2c-hipox-bitbash.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/drivers/i2c/busses/i2c-hipox-bitbash.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/drivers/i2c/busses/i2c-hipox-bitbash.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,158 @@
 +/*
 + * drivers/i2c/busses/i2c_hipox_bitbash.c
@@ -35812,8 +35812,8 @@ diff -Nurd linux-2.6.24.4/drivers/i2c/busses/i2c-hipox-bitbash.c linux-2.6.24/dr
 +module_exit (i2c_hipox_bitbash_exit);
 +
 diff -Nurd linux-2.6.24.4/drivers/i2c/busses/Kconfig linux-2.6.24/drivers/i2c/busses/Kconfig
---- linux-2.6.24.4/drivers/i2c/busses/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/i2c/busses/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/i2c/busses/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/i2c/busses/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -321,6 +321,15 @@
  	  This driver can also be built as a module.  If so, the module
  	  will be called i2c-nforce2.
@@ -35831,8 +35831,8 @@ diff -Nurd linux-2.6.24.4/drivers/i2c/busses/Kconfig linux-2.6.24/drivers/i2c/bu
  	tristate "OpenCores I2C Controller"
  	depends on EXPERIMENTAL
 diff -Nurd linux-2.6.24.4/drivers/i2c/busses/Makefile linux-2.6.24/drivers/i2c/busses/Makefile
---- linux-2.6.24.4/drivers/i2c/busses/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/i2c/busses/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/i2c/busses/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/i2c/busses/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -28,6 +28,7 @@
  obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
  obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
@@ -35842,8 +35842,8 @@ diff -Nurd linux-2.6.24.4/drivers/i2c/busses/Makefile linux-2.6.24/drivers/i2c/b
  obj-$(CONFIG_I2C_PASEMI)	+= i2c-pasemi.o
  obj-$(CONFIG_I2C_PCA_ISA)	+= i2c-pca-isa.o
 diff -Nurd linux-2.6.24.4/drivers/leds/Kconfig linux-2.6.24/drivers/leds/Kconfig
---- linux-2.6.24.4/drivers/leds/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/leds/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/leds/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/leds/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -62,6 +62,20 @@
  	  This option enables support for LEDs connected to GPIO lines
  	  on Samsung S3C24XX series CPUs, such as the S3C2410 and S3C2440.
@@ -35881,7 +35881,7 @@ diff -Nurd linux-2.6.24.4/drivers/leds/Kconfig linux-2.6.24/drivers/leds/Kconfig
  	depends on LEDS_TRIGGERS
 diff -Nurd linux-2.6.24.4/drivers/md/dm-ox-crypt.c linux-2.6.24/drivers/md/dm-ox-crypt.c
 --- linux-2.6.24.4/drivers/md/dm-ox-crypt.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/drivers/md/dm-ox-crypt.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/drivers/md/dm-ox-crypt.c	2010-10-12 14:09:58.000000000 +0200
 @@ -0,0 +1,791 @@
 +/* linux/drivers/md/dm-ox-crypt.c
 + *
@@ -36675,8 +36675,8 @@ diff -Nurd linux-2.6.24.4/drivers/md/dm-ox-crypt.c linux-2.6.24/drivers/md/dm-ox
 +MODULE_DESCRIPTION(DM_NAME " target for hardware encryption / decryption");
 +MODULE_LICENSE("GPL");
 diff -Nurd linux-2.6.24.4/drivers/md/Kconfig linux-2.6.24/drivers/md/Kconfig
---- linux-2.6.24.4/drivers/md/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/md/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/md/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/md/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -229,6 +229,22 @@
  
  	  If unsure, say N.
@@ -36701,8 +36701,8 @@ diff -Nurd linux-2.6.24.4/drivers/md/Kconfig linux-2.6.24/drivers/md/Kconfig
         tristate "Snapshot target (EXPERIMENTAL)"
         depends on BLK_DEV_DM && EXPERIMENTAL
 diff -Nurd linux-2.6.24.4/drivers/md/Makefile linux-2.6.24/drivers/md/Makefile
---- linux-2.6.24.4/drivers/md/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/md/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/md/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/md/Makefile	2010-10-12 14:09:58.000000000 +0200
 @@ -33,6 +33,7 @@
  obj-$(CONFIG_BLK_DEV_MD)	+= md-mod.o
  obj-$(CONFIG_BLK_DEV_DM)	+= dm-mod.o
@@ -36712,8 +36712,8 @@ diff -Nurd linux-2.6.24.4/drivers/md/Makefile linux-2.6.24/drivers/md/Makefile
  obj-$(CONFIG_DM_MULTIPATH)	+= dm-multipath.o dm-round-robin.o
  obj-$(CONFIG_DM_MULTIPATH_EMC)	+= dm-emc.o
 diff -Nurd linux-2.6.24.4/drivers/md/raid1.c linux-2.6.24/drivers/md/raid1.c
---- linux-2.6.24.4/drivers/md/raid1.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/md/raid1.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/md/raid1.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/md/raid1.c	2010-10-12 14:09:58.000000000 +0200
 @@ -34,6 +34,12 @@
  #include "dm-bio-list.h"
  #include <linux/raid/raid1.h>
@@ -36978,8 +36978,8 @@ diff -Nurd linux-2.6.24.4/drivers/md/raid1.c linux-2.6.24/drivers/md/raid1.c
  
  	set_bit(MD_RECOVERY_NEEDED, &mddev->recovery);
 diff -Nurd linux-2.6.24.4/drivers/net/Kconfig linux-2.6.24/drivers/net/Kconfig
---- linux-2.6.24.4/drivers/net/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/net/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/net/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/net/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -2368,6 +2368,14 @@
  	  To compile this driver as a module, choose M here.  The module
  	  will be called atl1.
@@ -36996,8 +36996,8 @@ diff -Nurd linux-2.6.24.4/drivers/net/Kconfig linux-2.6.24/drivers/net/Kconfig
  
  #
 diff -Nurd linux-2.6.24.4/drivers/net/mii.c linux-2.6.24/drivers/net/mii.c
---- linux-2.6.24.4/drivers/net/mii.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/net/mii.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/net/mii.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/net/mii.c	2010-10-12 14:09:58.000000000 +0200
 @@ -46,11 +46,13 @@
  	u32 advert, bmcr, lpa, nego;
  	u32 advert2 = 0, bmcr2 = 0, lpa2 = 0;
@@ -37251,8 +37251,8 @@ diff -Nurd linux-2.6.24.4/drivers/net/mii.c linux-2.6.24/drivers/net/mii.c
  EXPORT_SYMBOL(generic_mii_ioctl);
  
 diff -Nurd linux-2.6.24.4/drivers/net/via-velocity.c linux-2.6.24/drivers/net/via-velocity.c
---- linux-2.6.24.4/drivers/net/via-velocity.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/net/via-velocity.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/net/via-velocity.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/net/via-velocity.c	2010-10-12 14:09:58.000000000 +0200
 @@ -72,7 +72,6 @@
  #include <linux/mii.h>
  #include <linux/in.h>
@@ -39426,8 +39426,8 @@ diff -Nurd linux-2.6.24.4/drivers/net/via-velocity.c linux-2.6.24/drivers/net/vi
 -#endif
  #endif
 diff -Nurd linux-2.6.24.4/drivers/net/via-velocity.h linux-2.6.24/drivers/net/via-velocity.h
---- linux-2.6.24.4/drivers/net/via-velocity.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/net/via-velocity.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/net/via-velocity.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/net/via-velocity.h	2010-10-12 14:09:58.000000000 +0200
 @@ -25,8 +25,6 @@
  #ifndef VELOCITY_H
  #define VELOCITY_H
@@ -39742,8 +39742,8 @@ diff -Nurd linux-2.6.24.4/drivers/net/via-velocity.h linux-2.6.24/drivers/net/vi
   *	@vptr: velocity to configure
   *
 diff -Nurd linux-2.6.24.4/drivers/pci/probe.c linux-2.6.24/drivers/pci/probe.c
---- linux-2.6.24.4/drivers/pci/probe.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/pci/probe.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/pci/probe.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/pci/probe.c	2010-10-12 14:09:58.000000000 +0200
 @@ -991,8 +991,18 @@
  	for (func = 0; func < 8; func++, devfn++) {
  		struct pci_dev *dev;
@@ -39766,8 +39766,8 @@ diff -Nurd linux-2.6.24.4/drivers/pci/probe.c linux-2.6.24/drivers/pci/probe.c
  
  			/*
 diff -Nurd linux-2.6.24.4/drivers/rtc/rtc-ds1307.c linux-2.6.24/drivers/rtc/rtc-ds1307.c
---- linux-2.6.24.4/drivers/rtc/rtc-ds1307.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/rtc/rtc-ds1307.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/rtc/rtc-ds1307.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/rtc/rtc-ds1307.c	2010-10-12 14:09:58.000000000 +0200
 @@ -17,7 +17,7 @@
  #include <linux/rtc.h>
  #include <linux/bcd.h>
@@ -39794,8 +39794,8 @@ diff -Nurd linux-2.6.24.4/drivers/rtc/rtc-ds1307.c linux-2.6.24/drivers/rtc/rtc-
  	tmp = ds1307->regs[DS1307_REG_HOUR];
  	switch (ds1307->type) {
 diff -Nurd linux-2.6.24.4/drivers/scsi/Kconfig linux-2.6.24/drivers/scsi/Kconfig
---- linux-2.6.24.4/drivers/scsi/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/scsi/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/scsi/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/scsi/Kconfig	2010-10-12 14:09:58.000000000 +0200
 @@ -556,6 +556,15 @@
  	  To compile this driver as a module, choose M here: the
  	  module will be called arcmsr (modprobe arcmsr).
@@ -39813,8 +39813,8 @@ diff -Nurd linux-2.6.24.4/drivers/scsi/Kconfig linux-2.6.24/drivers/scsi/Kconfig
  	bool "Enable PCI Error Recovery Capability in Areca Driver(ARCMSR)"
  	depends on SCSI_ARCMSR && PCIEAER
 diff -Nurd linux-2.6.24.4/drivers/serial/8250.c linux-2.6.24/drivers/serial/8250.c
---- linux-2.6.24.4/drivers/serial/8250.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/serial/8250.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/serial/8250.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/serial/8250.c	2010-10-12 14:09:58.000000000 +0200
 @@ -2153,7 +2153,37 @@
  		serial_outp(up, UART_LCR, cval | UART_LCR_DLAB);/* set DLAB */
  	}
@@ -39868,8 +39868,8 @@ diff -Nurd linux-2.6.24.4/drivers/serial/8250.c linux-2.6.24/drivers/serial/8250
  	int parity = 'n';
  	int flow = 'n';
 diff -Nurd linux-2.6.24.4/drivers/usb/core/hcd.h linux-2.6.24/drivers/usb/core/hcd.h
---- linux-2.6.24.4/drivers/usb/core/hcd.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/core/hcd.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/core/hcd.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/core/hcd.h	2010-10-12 14:09:58.000000000 +0200
 @@ -312,7 +312,9 @@
  #define SetHubFeature		(0x2000 | USB_REQ_SET_FEATURE)
  #define SetPortFeature		(0x2300 | USB_REQ_SET_FEATURE)
@@ -39894,8 +39894,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/core/hcd.h linux-2.6.24/drivers/usb/core/h
  		enum usb_device_state new_state);
  
 diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-dbg.c linux-2.6.24/drivers/usb/host/ehci-dbg.c
---- linux-2.6.24.4/drivers/usb/host/ehci-dbg.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/ehci-dbg.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/host/ehci-dbg.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/ehci-dbg.c	2010-10-12 14:09:58.000000000 +0200
 @@ -28,11 +28,11 @@
  	dev_warn (ehci_to_hcd(ehci)->self.controller , fmt , ## args )
  
@@ -40004,8 +40004,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-dbg.c linux-2.6.24/drivers/usb/h
  
  #endif /* STUB_DEBUG_FILES */
 diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci.h linux-2.6.24/drivers/usb/host/ehci.h
---- linux-2.6.24.4/drivers/usb/host/ehci.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/ehci.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/host/ehci.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/ehci.h	2010-10-12 14:09:58.000000000 +0200
 @@ -262,14 +262,22 @@
  	/* ASYNCLISTADDR: offset 0x18 */
  	u32		async_next;	/* address of next async queue head */
@@ -40070,8 +40070,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci.h linux-2.6.24/drivers/usb/host/
  #else
  
 diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-hcd.c linux-2.6.24/drivers/usb/host/ehci-hcd.c
---- linux-2.6.24.4/drivers/usb/host/ehci-hcd.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/ehci-hcd.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/host/ehci-hcd.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/ehci-hcd.c	2010-10-12 14:09:59.000000000 +0200
 @@ -197,7 +197,7 @@
  	u32 __iomem	*reg_ptr;
  	u32		tmp;
@@ -40141,7 +40141,7 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-hcd.c linux-2.6.24/drivers/usb/h
  #include "ehci-fsl.c"
 diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-hipox.c linux-2.6.24/drivers/usb/host/ehci-hipox.c
 --- linux-2.6.24.4/drivers/usb/host/ehci-hipox.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/ehci-hipox.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/ehci-hipox.c	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,307 @@
 +/*
 + * EHCI HCD (Host Controller Driver) for USB.
@@ -40451,8 +40451,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-hipox.c linux-2.6.24/drivers/usb
 +	},
 +};
 diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-hub.c linux-2.6.24/drivers/usb/host/ehci-hub.c
---- linux-2.6.24.4/drivers/usb/host/ehci-hub.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/ehci-hub.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/host/ehci-hub.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/ehci-hub.c	2010-10-12 14:09:59.000000000 +0200
 @@ -769,6 +769,11 @@
  		dbg_port (ehci, "GetStatus", wIndex + 1, temp);
  		put_unaligned(cpu_to_le32 (status), (__le32 *) buf);
@@ -40490,8 +40490,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-hub.c linux-2.6.24/drivers/usb/h
  				 * caller must wait, then call GetPortStatus
  				 * usb 2.0 spec says 50 ms resets on root
 diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-sched.c linux-2.6.24/drivers/usb/host/ehci-sched.c
---- linux-2.6.24.4/drivers/usb/host/ehci-sched.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/ehci-sched.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/host/ehci-sched.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/ehci-sched.c	2010-10-12 14:09:59.000000000 +0200
 @@ -2109,6 +2109,7 @@
  {
  	unsigned	frame, clock, now_uframe, mod;
@@ -40534,8 +40534,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/ehci-sched.c linux-2.6.24/drivers/usb
  		if (now_uframe == clock) {
  			unsigned	now;
 diff -Nurd linux-2.6.24.4/drivers/usb/host/Kconfig linux-2.6.24/drivers/usb/host/Kconfig
---- linux-2.6.24.4/drivers/usb/host/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/host/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/Kconfig	2010-10-12 14:09:59.000000000 +0200
 @@ -41,6 +41,7 @@
  config USB_EHCI_ROOT_HUB_TT
  	bool "Root Hub Transaction Translators (EXPERIMENTAL)"
@@ -40545,8 +40545,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/Kconfig linux-2.6.24/drivers/usb/host
  	  Some EHCI chips have vendor-specific extensions to integrate
  	  transaction translators, so that no OHCI or UHCI companion
 diff -Nurd linux-2.6.24.4/drivers/usb/host/Makefile linux-2.6.24/drivers/usb/host/Makefile
---- linux-2.6.24.4/drivers/usb/host/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/host/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/host/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/host/Makefile	2010-10-12 14:09:59.000000000 +0200
 @@ -3,7 +3,11 @@
  #
  
@@ -40566,8 +40566,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/host/Makefile linux-2.6.24/drivers/usb/hos
  obj-$(CONFIG_USB_R8A66597_HCD)	+= r8a66597-hcd.o
 -
 diff -Nurd linux-2.6.24.4/drivers/usb/Kconfig linux-2.6.24/drivers/usb/Kconfig
---- linux-2.6.24.4/drivers/usb/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/drivers/usb/Kconfig	2010-10-12 14:09:59.000000000 +0200
 @@ -36,6 +36,7 @@
  	default y if ARCH_EP93XX
  	default y if ARCH_AT91
@@ -40585,8 +40585,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/Kconfig linux-2.6.24/drivers/usb/Kconfig
  
  # ARM SA1111 chips have a non-PCI based "OHCI-compatible" USB host interface.
 diff -Nurd linux-2.6.24.4/drivers/usb/misc/usbtest.c linux-2.6.24/drivers/usb/misc/usbtest.c
---- linux-2.6.24.4/drivers/usb/misc/usbtest.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/drivers/usb/misc/usbtest.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/drivers/usb/misc/usbtest.c	2010-10-12 14:08:56.000000000 +0200
++++ linux-2.6.24/drivers/usb/misc/usbtest.c	2010-10-12 14:09:59.000000000 +0200
 @@ -993,6 +993,7 @@
  
  		u->context = &context;
@@ -40595,7 +40595,7 @@ diff -Nurd linux-2.6.24.4/drivers/usb/misc/usbtest.c linux-2.6.24/drivers/usb/mi
  	}
  
  	/* queue the urbs */
-@@ -1208,7 +1209,7 @@
+@@ -1207,7 +1208,7 @@
  	int		retval = 0;
  	struct urb	*urb;
  
@@ -40604,7 +40604,7 @@ diff -Nurd linux-2.6.24.4/drivers/usb/misc/usbtest.c linux-2.6.24/drivers/usb/mi
  	if (urb == NULL)
  		return -ENOMEM;
  
-@@ -2101,6 +2102,10 @@
+@@ -2100,6 +2101,10 @@
  	/* EZ-USB devices which download firmware to replace (or in our
  	 * case augment) the default device implementation.
  	 */
@@ -40616,8 +40616,8 @@ diff -Nurd linux-2.6.24.4/drivers/usb/misc/usbtest.c linux-2.6.24/drivers/usb/mi
  	/* generic EZ-USB FX controller */
  	{ USB_DEVICE (0x0547, 0x2235),
 diff -Nurd linux-2.6.24.4/fs/adfs/file.c linux-2.6.24/fs/adfs/file.c
---- linux-2.6.24.4/fs/adfs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/adfs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/adfs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/adfs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -33,6 +33,7 @@
  	.fsync		= file_fsync,
  	.write		= do_sync_write,
@@ -40627,8 +40627,8 @@ diff -Nurd linux-2.6.24.4/fs/adfs/file.c linux-2.6.24/fs/adfs/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/affs/file.c linux-2.6.24/fs/affs/file.c
---- linux-2.6.24.4/fs/affs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/affs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/affs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/affs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -35,6 +35,7 @@
  	.open		= affs_file_open,
  	.release	= affs_file_release,
@@ -40638,8 +40638,8 @@ diff -Nurd linux-2.6.24.4/fs/affs/file.c linux-2.6.24/fs/affs/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/afs/file.c linux-2.6.24/fs/afs/file.c
---- linux-2.6.24.4/fs/afs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/afs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/afs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/afs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -32,6 +32,7 @@
  	.aio_read	= generic_file_aio_read,
  	.aio_write	= afs_file_write,
@@ -40649,8 +40649,8 @@ diff -Nurd linux-2.6.24.4/fs/afs/file.c linux-2.6.24/fs/afs/file.c
  	.fsync		= afs_fsync,
  	.lock		= afs_lock,
 diff -Nurd linux-2.6.24.4/fs/bio.c linux-2.6.24/fs/bio.c
---- linux-2.6.24.4/fs/bio.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/bio.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/bio.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/bio.c	2010-10-12 14:09:59.000000000 +0200
 @@ -133,6 +133,7 @@
  	memset(bio, 0, sizeof(*bio));
  	bio->bi_flags = 1 << BIO_UPTODATE;
@@ -40668,8 +40668,8 @@ diff -Nurd linux-2.6.24.4/fs/bio.c linux-2.6.24/fs/bio.c
  	bio_hw_segments(q, bio);
  }
 diff -Nurd linux-2.6.24.4/fs/coda/file.c linux-2.6.24/fs/coda/file.c
---- linux-2.6.24.4/fs/coda/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/coda/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/coda/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/coda/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -238,6 +238,7 @@
  	.open		= coda_open,
  	.release	= coda_release,
@@ -40679,8 +40679,8 @@ diff -Nurd linux-2.6.24.4/fs/coda/file.c linux-2.6.24/fs/coda/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/ecryptfs/file.c linux-2.6.24/fs/ecryptfs/file.c
---- linux-2.6.24.4/fs/ecryptfs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ecryptfs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ecryptfs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ecryptfs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -292,6 +292,7 @@
  	.release = ecryptfs_release,
  	.fsync = ecryptfs_fsync,
@@ -40698,8 +40698,8 @@ diff -Nurd linux-2.6.24.4/fs/ecryptfs/file.c linux-2.6.24/fs/ecryptfs/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/ext2/file.c linux-2.6.24/fs/ext2/file.c
---- linux-2.6.24.4/fs/ext2/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ext2/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ext2/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ext2/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -56,6 +56,7 @@
  	.open		= generic_file_open,
  	.release	= ext2_release_file,
@@ -40717,8 +40717,8 @@ diff -Nurd linux-2.6.24.4/fs/ext2/file.c linux-2.6.24/fs/ext2/file.c
  #endif
  
 diff -Nurd linux-2.6.24.4/fs/ext3/file.c linux-2.6.24/fs/ext3/file.c
---- linux-2.6.24.4/fs/ext3/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ext3/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ext3/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ext3/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -120,6 +120,7 @@
  	.open		= generic_file_open,
  	.release	= ext3_release_file,
@@ -40728,8 +40728,8 @@ diff -Nurd linux-2.6.24.4/fs/ext3/file.c linux-2.6.24/fs/ext3/file.c
  	.splice_write	= generic_file_splice_write,
  };
 diff -Nurd linux-2.6.24.4/fs/ext3/ialloc.c linux-2.6.24/fs/ext3/ialloc.c
---- linux-2.6.24.4/fs/ext3/ialloc.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ext3/ialloc.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ext3/ialloc.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ext3/ialloc.c	2010-10-12 14:09:59.000000000 +0200
 @@ -543,7 +543,16 @@
  		percpu_counter_inc(&sbi->s_dirs_counter);
  	sb->s_dirt = 1;
@@ -40748,8 +40748,8 @@ diff -Nurd linux-2.6.24.4/fs/ext3/ialloc.c linux-2.6.24/fs/ext3/ialloc.c
  		inode->i_gid = dir->i_gid;
  	else if (dir->i_mode & S_ISGID) {
 diff -Nurd linux-2.6.24.4/fs/ext4/file.c linux-2.6.24/fs/ext4/file.c
---- linux-2.6.24.4/fs/ext4/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ext4/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ext4/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ext4/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -120,7 +120,8 @@
  	.open		= generic_file_open,
  	.release	= ext4_release_file,
@@ -40761,8 +40761,8 @@ diff -Nurd linux-2.6.24.4/fs/ext4/file.c linux-2.6.24/fs/ext4/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/fat/file.c linux-2.6.24/fs/fat/file.c
---- linux-2.6.24.4/fs/fat/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/fat/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/fat/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/fat/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -134,6 +134,7 @@
  	.release	= fat_file_release,
  	.ioctl		= fat_generic_ioctl,
@@ -40772,8 +40772,8 @@ diff -Nurd linux-2.6.24.4/fs/fat/file.c linux-2.6.24/fs/fat/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/fuse/file.c linux-2.6.24/fs/fuse/file.c
---- linux-2.6.24.4/fs/fuse/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/fuse/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/fuse/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/fuse/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -920,6 +920,7 @@
  	.fsync		= fuse_fsync,
  	.lock		= fuse_file_lock,
@@ -40783,8 +40783,8 @@ diff -Nurd linux-2.6.24.4/fs/fuse/file.c linux-2.6.24/fs/fuse/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/gfs2/ops_file.c linux-2.6.24/fs/gfs2/ops_file.c
---- linux-2.6.24.4/fs/gfs2/ops_file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/gfs2/ops_file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/gfs2/ops_file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/gfs2/ops_file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -662,6 +662,7 @@
  	.release	= gfs2_close,
  	.fsync		= gfs2_fsync,
@@ -40794,8 +40794,8 @@ diff -Nurd linux-2.6.24.4/fs/gfs2/ops_file.c linux-2.6.24/fs/gfs2/ops_file.c
  	.splice_read	= generic_file_splice_read,
  	.splice_write	= generic_file_splice_write,
 diff -Nurd linux-2.6.24.4/fs/hpfs/file.c linux-2.6.24/fs/hpfs/file.c
---- linux-2.6.24.4/fs/hpfs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/hpfs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/hpfs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/hpfs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -137,6 +137,7 @@
  	.mmap		= generic_file_mmap,
  	.release	= hpfs_file_release,
@@ -40805,8 +40805,8 @@ diff -Nurd linux-2.6.24.4/fs/hpfs/file.c linux-2.6.24/fs/hpfs/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/jffs2/file.c linux-2.6.24/fs/jffs2/file.c
---- linux-2.6.24.4/fs/jffs2/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/jffs2/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/jffs2/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/jffs2/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -49,7 +49,8 @@
  	.ioctl =	jffs2_ioctl,
  	.mmap =		generic_file_readonly_mmap,
@@ -40818,8 +40818,8 @@ diff -Nurd linux-2.6.24.4/fs/jffs2/file.c linux-2.6.24/fs/jffs2/file.c
  
  /* jffs2_file_inode_operations */
 diff -Nurd linux-2.6.24.4/fs/jfs/file.c linux-2.6.24/fs/jfs/file.c
---- linux-2.6.24.4/fs/jfs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/jfs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/jfs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/jfs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -108,6 +108,7 @@
  	.aio_read	= generic_file_aio_read,
  	.aio_write	= generic_file_aio_write,
@@ -40829,8 +40829,8 @@ diff -Nurd linux-2.6.24.4/fs/jfs/file.c linux-2.6.24/fs/jfs/file.c
  	.splice_write	= generic_file_splice_write,
  	.fsync		= jfs_fsync,
 diff -Nurd linux-2.6.24.4/fs/minix/file.c linux-2.6.24/fs/minix/file.c
---- linux-2.6.24.4/fs/minix/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/minix/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/minix/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/minix/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -23,6 +23,7 @@
  	.aio_write	= generic_file_aio_write,
  	.mmap		= generic_file_mmap,
@@ -40840,8 +40840,8 @@ diff -Nurd linux-2.6.24.4/fs/minix/file.c linux-2.6.24/fs/minix/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/ntfs/file.c linux-2.6.24/fs/ntfs/file.c
---- linux-2.6.24.4/fs/ntfs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ntfs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ntfs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ntfs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -2274,16 +2274,11 @@
  						    mounted filesystem. */
  	.mmap		= generic_file_mmap,	 /* Mmap file. */
@@ -40861,8 +40861,8 @@ diff -Nurd linux-2.6.24.4/fs/ntfs/file.c linux-2.6.24/fs/ntfs/file.c
  
  const struct inode_operations ntfs_file_inode_ops = {
 diff -Nurd linux-2.6.24.4/fs/ocfs2/file.c linux-2.6.24/fs/ocfs2/file.c
---- linux-2.6.24.4/fs/ocfs2/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ocfs2/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ocfs2/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ocfs2/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -2206,6 +2206,7 @@
  const struct file_operations ocfs2_fops = {
  	.read		= do_sync_read,
@@ -40872,8 +40872,8 @@ diff -Nurd linux-2.6.24.4/fs/ocfs2/file.c linux-2.6.24/fs/ocfs2/file.c
  	.fsync		= ocfs2_sync_file,
  	.release	= ocfs2_file_release,
 diff -Nurd linux-2.6.24.4/fs/qnx4/file.c linux-2.6.24/fs/qnx4/file.c
---- linux-2.6.24.4/fs/qnx4/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/qnx4/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/qnx4/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/qnx4/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -25,6 +25,7 @@
  	.read		= do_sync_read,
  	.aio_read	= generic_file_aio_read,
@@ -40883,8 +40883,8 @@ diff -Nurd linux-2.6.24.4/fs/qnx4/file.c linux-2.6.24/fs/qnx4/file.c
  #ifdef CONFIG_QNX4FS_RW
  	.write		= do_sync_write,
 diff -Nurd linux-2.6.24.4/fs/read_write.c linux-2.6.24/fs/read_write.c
---- linux-2.6.24.4/fs/read_write.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/read_write.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/read_write.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/read_write.c	2010-10-12 14:09:59.000000000 +0200
 @@ -26,7 +26,8 @@
  	.read		= do_sync_read,
  	.aio_read	= generic_file_aio_read,
@@ -40931,8 +40931,8 @@ diff -Nurd linux-2.6.24.4/fs/read_write.c linux-2.6.24/fs/read_write.c
  	if (retval > 0) {
  		add_rchar(current, retval);
 diff -Nurd linux-2.6.24.4/fs/reiserfs/file.c linux-2.6.24/fs/reiserfs/file.c
---- linux-2.6.24.4/fs/reiserfs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/reiserfs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/reiserfs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/reiserfs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -292,6 +292,7 @@
  	.open = generic_file_open,
  	.release = reiserfs_file_release,
@@ -40942,8 +40942,8 @@ diff -Nurd linux-2.6.24.4/fs/reiserfs/file.c linux-2.6.24/fs/reiserfs/file.c
  	.aio_write = generic_file_aio_write,
  	.splice_read = generic_file_splice_read,
 diff -Nurd linux-2.6.24.4/fs/smbfs/file.c linux-2.6.24/fs/smbfs/file.c
---- linux-2.6.24.4/fs/smbfs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/smbfs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/smbfs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/smbfs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -283,6 +283,27 @@
  	return status;
  }
@@ -40981,8 +40981,8 @@ diff -Nurd linux-2.6.24.4/fs/smbfs/file.c linux-2.6.24/fs/smbfs/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/sysv/file.c linux-2.6.24/fs/sysv/file.c
---- linux-2.6.24.4/fs/sysv/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/sysv/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/sysv/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/sysv/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -27,6 +27,7 @@
  	.aio_write	= generic_file_aio_write,
  	.mmap		= generic_file_mmap,
@@ -40992,8 +40992,8 @@ diff -Nurd linux-2.6.24.4/fs/sysv/file.c linux-2.6.24/fs/sysv/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/udf/file.c linux-2.6.24/fs/udf/file.c
---- linux-2.6.24.4/fs/udf/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/udf/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/udf/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/udf/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -246,6 +246,8 @@
  	.aio_write		= udf_file_aio_write,
  	.release		= udf_release_file,
@@ -41004,8 +41004,8 @@ diff -Nurd linux-2.6.24.4/fs/udf/file.c linux-2.6.24/fs/udf/file.c
  };
  
 diff -Nurd linux-2.6.24.4/fs/ufs/file.c linux-2.6.24/fs/ufs/file.c
---- linux-2.6.24.4/fs/ufs/file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/ufs/file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/ufs/file.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/ufs/file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -63,5 +63,6 @@
  	.mmap		= generic_file_mmap,
  	.open           = generic_file_open,
@@ -41014,8 +41014,8 @@ diff -Nurd linux-2.6.24.4/fs/ufs/file.c linux-2.6.24/fs/ufs/file.c
  	.splice_read	= generic_file_splice_read,
  };
 diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.c linux-2.6.24/fs/xfs/linux-2.6/xfs_buf.c
---- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/linux-2.6/xfs_buf.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/linux-2.6/xfs_buf.c	2010-10-12 14:09:59.000000000 +0200
 @@ -330,20 +330,26 @@
  
  	ASSERT(list_empty(&bp->b_hash_list));
@@ -41116,8 +41116,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.c linux-2.6.24/fs/xfs/linux-2
  	return NULL;
  }
 diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.h linux-2.6.24/fs/xfs/linux-2.6/xfs_buf.h
---- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/linux-2.6/xfs_buf.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/linux-2.6/xfs_buf.h	2010-10-12 14:09:59.000000000 +0200
 @@ -63,7 +63,7 @@
  
  	/* flags used only internally */
@@ -41128,8 +41128,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_buf.h linux-2.6.24/fs/xfs/linux-2
  	_XBF_DELWRI_Q = (1 << 21),   /* buffer on delwri queue		   */
  } xfs_buf_flags_t;
 diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_file.c linux-2.6.24/fs/xfs/linux-2.6/xfs_file.c
---- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_file.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/linux-2.6/xfs_file.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_file.c	2010-10-12 14:08:56.000000000 +0200
++++ linux-2.6.24/fs/xfs/linux-2.6/xfs_file.c	2010-10-12 14:09:59.000000000 +0200
 @@ -122,6 +122,28 @@
  }
  
@@ -41159,7 +41159,7 @@ diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_file.c linux-2.6.24/fs/xfs/linux-
  xfs_file_splice_read(
  	struct file		*infilp,
  	loff_t			*ppos,
-@@ -501,8 +523,11 @@
+@@ -502,8 +524,11 @@
  	.llseek		= generic_file_llseek,
  	.read		= do_sync_read,
  	.write		= do_sync_write,
@@ -41171,7 +41171,7 @@ diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_file.c linux-2.6.24/fs/xfs/linux-
  	.splice_read	= xfs_file_splice_read,
  	.splice_write	= xfs_file_splice_write,
  	.unlocked_ioctl	= xfs_file_ioctl,
-@@ -524,6 +549,7 @@
+@@ -525,6 +550,7 @@
  	.write		= do_sync_write,
  	.aio_read	= xfs_file_aio_read_invis,
  	.aio_write	= xfs_file_aio_write_invis,
@@ -41180,8 +41180,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_file.c linux-2.6.24/fs/xfs/linux-
  	.splice_write	= xfs_file_splice_write_invis,
  	.unlocked_ioctl	= xfs_file_ioctl_invis,
 diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_lrw.c linux-2.6.24/fs/xfs/linux-2.6/xfs_lrw.c
---- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_lrw.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/linux-2.6/xfs_lrw.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/linux-2.6/xfs_lrw.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/linux-2.6/xfs_lrw.c	2010-10-12 14:09:59.000000000 +0200
 @@ -271,6 +271,48 @@
  }
  
@@ -41232,8 +41232,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/linux-2.6/xfs_lrw.c linux-2.6.24/fs/xfs/linux-2
  	xfs_inode_t		*ip,
  	struct file		*infilp,
 diff -Nurd linux-2.6.24.4/fs/xfs/Makefile-linux-2.6 linux-2.6.24/fs/xfs/Makefile-linux-2.6
---- linux-2.6.24.4/fs/xfs/Makefile-linux-2.6	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/Makefile-linux-2.6	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/Makefile-linux-2.6	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/Makefile-linux-2.6	2010-10-12 14:09:59.000000000 +0200
 @@ -15,13 +15,20 @@
  # along with this program; if not, write the Free Software Foundation,
  # Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
@@ -41256,8 +41256,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/Makefile-linux-2.6 linux-2.6.24/fs/xfs/Makefile
  
  obj-$(CONFIG_XFS_FS)		+= xfs.o
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_alloc_btree.c linux-2.6.24/fs/xfs/xfs_alloc_btree.c
---- linux-2.6.24.4/fs/xfs/xfs_alloc_btree.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_alloc_btree.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_alloc_btree.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_alloc_btree.c	2010-10-12 14:09:59.000000000 +0200
 @@ -221,7 +221,7 @@
  			 */
  			bno = be32_to_cpu(agf->agf_roots[cur->bc_btnum]);
@@ -41319,8 +41319,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_alloc_btree.c linux-2.6.24/fs/xfs/xfs_alloc
  	left->bb_rightsib = cpu_to_be32(rbno);
  	right->bb_leftsib = cpu_to_be32(lbno);
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_alloc.c linux-2.6.24/fs/xfs/xfs_alloc.c
---- linux-2.6.24.4/fs/xfs/xfs_alloc.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_alloc.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_alloc.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_alloc.c	2010-10-12 14:09:59.000000000 +0200
 @@ -592,7 +592,7 @@
  		if (!(args->wasfromfl)) {
  
@@ -41383,8 +41383,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_alloc.c linux-2.6.24/fs/xfs/xfs_alloc.c
  		logflags |= XFS_AGF_BTREEBLKS;
  	}
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_attr_leaf.c linux-2.6.24/fs/xfs/xfs_attr_leaf.c
---- linux-2.6.24.4/fs/xfs/xfs_attr_leaf.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_attr_leaf.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_attr_leaf.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_attr_leaf.c	2010-10-12 14:09:59.000000000 +0200
 @@ -319,7 +319,7 @@
  	memcpy(sfe->nameval, args->name, args->namelen);
  	memcpy(&sfe->nameval[args->namelen], args->value, args->valuelen);
@@ -41535,8 +41535,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_attr_leaf.c linux-2.6.24/fs/xfs/xfs_attr_le
  	hdr_d->freemap[0].size = cpu_to_be16(be16_to_cpu(hdr_d->firstused)
  			      - be16_to_cpu(hdr_d->freemap[0].base));
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_bmap_btree.c linux-2.6.24/fs/xfs/xfs_bmap_btree.c
---- linux-2.6.24.4/fs/xfs/xfs_bmap_btree.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_bmap_btree.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_bmap_btree.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_bmap_btree.c	2010-10-12 14:09:59.000000000 +0200
 @@ -631,7 +631,7 @@
  		memcpy(lrp, rrp, numrrecs * sizeof(*lrp));
  		xfs_bmbt_log_recs(cur, lbp, numlrecs + 1, numlrecs + numrrecs);
@@ -41604,8 +41604,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_bmap_btree.c linux-2.6.24/fs/xfs/xfs_bmap_b
  	cur->bc_nlevels++;
  	cur->bc_ptrs[level + 1] = 1;
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_da_btree.c linux-2.6.24/fs/xfs/xfs_da_btree.c
---- linux-2.6.24.4/fs/xfs/xfs_da_btree.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_da_btree.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_da_btree.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_da_btree.c	2010-10-12 14:09:59.000000000 +0200
 @@ -511,12 +511,12 @@
  		 * Move the req'd B-tree elements from high in node1 to
  		 * low in node2.
@@ -41667,8 +41667,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_da_btree.c linux-2.6.24/fs/xfs/xfs_da_btree
  	xfs_da_log_buf(tp, save_blk->bp,
  		XFS_DA_LOGRANGE(save_node, &save_node->hdr,
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_block.c linux-2.6.24/fs/xfs/xfs_dir2_block.c
---- linux-2.6.24.4/fs/xfs/xfs_dir2_block.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_dir2_block.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_dir2_block.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_dir2_block.c	2010-10-12 14:09:59.000000000 +0200
 @@ -271,7 +271,7 @@
  		}
  		lfloglow = toidx + 1 - (be32_to_cpu(btp->stale) - 1);
@@ -41706,8 +41706,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_block.c linux-2.6.24/fs/xfs/xfs_dir2_b
  	/*
  	 * Remove the leaf entry by marking it stale.
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_data.c linux-2.6.24/fs/xfs/xfs_dir2_data.c
---- linux-2.6.24.4/fs/xfs/xfs_dir2_data.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_dir2_data.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_dir2_data.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_dir2_data.c	2010-10-12 14:09:59.000000000 +0200
 @@ -587,7 +587,7 @@
  		/*
  		 * Fix up the new big freespace.
@@ -41727,8 +41727,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_data.c linux-2.6.24/fs/xfs/xfs_dir2_da
  			cpu_to_be16((char *)prevdup - (char *)d);
  		xfs_dir2_data_log_unused(tp, bp, prevdup);
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_leaf.c linux-2.6.24/fs/xfs/xfs_dir2_leaf.c
---- linux-2.6.24.4/fs/xfs/xfs_dir2_leaf.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_dir2_leaf.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_dir2_leaf.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_dir2_leaf.c	2010-10-12 14:09:59.000000000 +0200
 @@ -359,7 +359,7 @@
  			bestsp--;
  			memmove(&bestsp[0], &bestsp[1],
@@ -41802,8 +41802,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_leaf.c linux-2.6.24/fs/xfs/xfs_dir2_le
  	xfs_dir2_leaf_log_tail(tp, lbp);
  	xfs_dir2_leaf_log_bests(tp, lbp, 0, be32_to_cpu(ltp->bestcount) - 1);
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_node.c linux-2.6.24/fs/xfs/xfs_dir2_node.c
---- linux-2.6.24.4/fs/xfs/xfs_dir2_node.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_dir2_node.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_dir2_node.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_dir2_node.c	2010-10-12 14:09:59.000000000 +0200
 @@ -254,7 +254,7 @@
  				(be16_to_cpu(leaf->hdr.count) - index) * sizeof(*lep));
  		lfloglow = index;
@@ -41865,8 +41865,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_dir2_node.c linux-2.6.24/fs/xfs/xfs_dir2_no
  		}
  		/*
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_fsops.c linux-2.6.24/fs/xfs/xfs_fsops.c
---- linux-2.6.24.4/fs/xfs/xfs_fsops.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_fsops.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_fsops.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_fsops.c	2010-10-12 14:09:59.000000000 +0200
 @@ -318,7 +318,7 @@
  		}
  		ASSERT(bp);
@@ -41886,8 +41886,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_fsops.c linux-2.6.24/fs/xfs/xfs_fsops.c
  		       be32_to_cpu(agi->agi_length));
  		xfs_alloc_log_agf(tp, bp, XFS_AGF_LENGTH);
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_ialloc_btree.c linux-2.6.24/fs/xfs/xfs_ialloc_btree.c
---- linux-2.6.24.4/fs/xfs/xfs_ialloc_btree.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_ialloc_btree.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_ialloc_btree.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_ialloc_btree.c	2010-10-12 14:09:59.000000000 +0200
 @@ -189,7 +189,7 @@
  			 */
  			bno = be32_to_cpu(agi->agi_root);
@@ -41955,8 +41955,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_ialloc_btree.c linux-2.6.24/fs/xfs/xfs_iall
  	left->bb_rightsib = cpu_to_be32(args.agbno);
  	right->bb_leftsib = cpu_to_be32(lbno);
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_ialloc.c linux-2.6.24/fs/xfs/xfs_ialloc.c
---- linux-2.6.24.4/fs/xfs/xfs_ialloc.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_ialloc.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_ialloc.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_ialloc.c	2010-10-12 14:09:59.000000000 +0200
 @@ -301,8 +301,8 @@
  		}
  		xfs_trans_inode_alloc_buf(tp, fbuf);
@@ -41998,8 +41998,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_ialloc.c linux-2.6.24/fs/xfs/xfs_ialloc.c
  		down_read(&mp->m_peraglock);
  		mp->m_perag[agno].pagi_freecount++;
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_inode.c linux-2.6.24/fs/xfs/xfs_inode.c
---- linux-2.6.24.4/fs/xfs/xfs_inode.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_inode.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_inode.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_inode.c	2010-10-12 14:09:59.000000000 +0200
 @@ -1158,6 +1158,16 @@
  	if ((prid != 0) && (ip->i_d.di_version == XFS_DINODE_VERSION_1))
  		xfs_bump_ino_vers2(tp, ip);
@@ -42018,8 +42018,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_inode.c linux-2.6.24/fs/xfs/xfs_inode.c
  		ip->i_d.di_gid = pip->i_d.di_gid;
  		if ((pip->i_d.di_mode & S_ISGID) && (mode & S_IFMT) == S_IFDIR) {
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_inode.h linux-2.6.24/fs/xfs/xfs_inode.h
---- linux-2.6.24.4/fs/xfs/xfs_inode.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_inode.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_inode.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_inode.h	2010-10-12 14:09:59.000000000 +0200
 @@ -495,6 +495,11 @@
  #define XFS_INHERIT_GID(pip)	\
  	(((pip)->i_mount->m_flags & XFS_MOUNT_GRPID) || \
@@ -42033,8 +42033,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_inode.h linux-2.6.24/fs/xfs/xfs_inode.h
  /*
   * Flags for xfs_iget()
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log.c linux-2.6.24/fs/xfs/xfs_log.c
---- linux-2.6.24.4/fs/xfs/xfs_log.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_log.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_log.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_log.c	2010-10-12 14:09:59.000000000 +0200
 @@ -399,10 +399,10 @@
  {
  	xlog_t *log = mp->m_log;
@@ -43354,8 +43354,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log.c linux-2.6.24/fs/xfs/xfs_log.c
  #endif
  	/* return non-zero if log IOERROR transition had already happened */
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log.h linux-2.6.24/fs/xfs/xfs_log.h
---- linux-2.6.24.4/fs/xfs/xfs_log.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_log.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_log.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_log.h	2010-10-12 14:09:59.000000000 +0200
 @@ -23,7 +23,7 @@
  #define CYCLE_LSN(lsn) ((uint)((lsn)>>32))
  #define BLOCK_LSN(lsn) ((uint)(lsn))
@@ -43366,8 +43366,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log.h linux-2.6.24/fs/xfs/xfs_log.h
  #ifdef __KERNEL__
  /*
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log_priv.h linux-2.6.24/fs/xfs/xfs_log_priv.h
---- linux-2.6.24.4/fs/xfs/xfs_log_priv.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_log_priv.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_log_priv.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_log_priv.h	2010-10-12 14:09:59.000000000 +0200
 @@ -55,29 +55,19 @@
  	BTOBB(XLOG_MAX_ICLOGS << (XFS_SB_VERSION_HASLOGV2(&log->l_mp->m_sb) ? \
  	 XLOG_MAX_RECORD_BSHIFT : XLOG_BIG_RECORD_BSHIFT))
@@ -43509,8 +43509,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log_priv.h linux-2.6.24/fs/xfs/xfs_log_priv
  extern int	 xlog_recover_finish(xlog_t *log, int mfsi_flags);
  extern void	 xlog_pack_data(xlog_t *log, xlog_in_core_t *iclog, int);
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log_recover.c linux-2.6.24/fs/xfs/xfs_log_recover.c
---- linux-2.6.24.4/fs/xfs/xfs_log_recover.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_log_recover.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_log_recover.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_log_recover.c	2010-10-12 14:09:59.000000000 +0200
 @@ -198,7 +198,7 @@
  	cmn_err(CE_DEBUG, "    log : uuid = ");
  	for (b = 0; b < 16; b++)
@@ -44103,8 +44103,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_log_recover.c linux-2.6.24/fs/xfs/xfs_log_r
  	if (tail_blk != head_blk) {
  		/* There used to be a comment here:
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_trans.c linux-2.6.24/fs/xfs/xfs_trans.c
---- linux-2.6.24.4/fs/xfs/xfs_trans.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_trans.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_trans.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_trans.c	2010-10-12 14:09:59.000000000 +0200
 @@ -567,26 +567,26 @@
  	 */
  	if (!xfs_sb_version_haslazysbcount(&(tp->t_mountp->m_sb))) {
@@ -44165,8 +44165,8 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_trans.c linux-2.6.24/fs/xfs/xfs_trans.c
  	}
  	if (tp->t_rextslog_delta) {
 diff -Nurd linux-2.6.24.4/fs/xfs/xfs_vnodeops.c linux-2.6.24/fs/xfs/xfs_vnodeops.c
---- linux-2.6.24.4/fs/xfs/xfs_vnodeops.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/fs/xfs/xfs_vnodeops.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/fs/xfs/xfs_vnodeops.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/fs/xfs/xfs_vnodeops.c	2010-10-12 14:09:59.000000000 +0200
 @@ -3558,11 +3558,11 @@
  		if (iip && iip->ili_last_lsn) {
  			xlog_t		*log = mp->m_log;
@@ -44184,7 +44184,7 @@ diff -Nurd linux-2.6.24.4/fs/xfs/xfs_vnodeops.c linux-2.6.24/fs/xfs/xfs_vnodeops
  				if (flags & FLUSH_SYNC)
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/ahb_mon.h linux-2.6.24/include/asm-arm/arch-hipox/ahb_mon.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/ahb_mon.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/ahb_mon.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/ahb_mon.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,27 @@
 +/* linux/include/asm-arm/arch-hipox/ahb_mon.h
 + *
@@ -44215,7 +44215,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/ahb_mon.h linux-2.6.24/incl
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/cipher.h linux-2.6.24/include/asm-arm/arch-hipox/cipher.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/cipher.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/cipher.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/cipher.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,139 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/cipher.h
@@ -44358,7 +44358,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/cipher.h linux-2.6.24/inclu
 +#endif
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/debug-macro.S linux-2.6.24/include/asm-arm/arch-hipox/debug-macro.S
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/debug-macro.S	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/debug-macro.S	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/debug-macro.S	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,47 @@
 +/* linux/include/asm-arm/arch-hipox/debug-macro.S
 + *
@@ -44409,7 +44409,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/debug-macro.S linux-2.6.24/
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/desc_alloc.h linux-2.6.24/include/asm-arm/arch-hipox/desc_alloc.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/desc_alloc.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/desc_alloc.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/desc_alloc.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,62 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/dma.h
@@ -44475,7 +44475,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/desc_alloc.h linux-2.6.24/i
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/dma.h linux-2.6.24/include/asm-arm/arch-hipox/dma.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/dma.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/dma.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/dma.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,299 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/dma.h
@@ -44778,7 +44778,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/dma.h linux-2.6.24/include/
 +#endif // __ASM_ARCH_DMA_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/entry-macro.S linux-2.6.24/include/asm-arm/arch-hipox/entry-macro.S
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/entry-macro.S	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/entry-macro.S	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/entry-macro.S	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,40 @@
 +/*
 + * include/asm-arm/arch-hipox/entry-macro.S
@@ -44822,7 +44822,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/entry-macro.S linux-2.6.24/
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/GPIO_PST_FunctionEnables.inc linux-2.6.24/include/asm-arm/arch-hipox/GPIO_PST_FunctionEnables.inc
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/GPIO_PST_FunctionEnables.inc	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/GPIO_PST_FunctionEnables.inc	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/GPIO_PST_FunctionEnables.inc	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,91 @@
 +/**
 + * -- GPIO Function Enable Mappings --
@@ -44917,7 +44917,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/GPIO_PST_FunctionEnables.in
 +#define  TERTIARY_FUNCTION_ENABLE_UART1_DTR_N            (34) //  As Output
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/hardware.h linux-2.6.24/include/asm-arm/arch-hipox/hardware.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/hardware.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/hardware.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/hardware.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,760 @@
 +/* linux/include/asm-arm/arch-hipox/hardware.h
 + *
@@ -45681,7 +45681,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/hardware.h linux-2.6.24/inc
 +#endif // __ASM_ARCH_HARDWARE_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/i2s.h linux-2.6.24/include/asm-arm/arch-hipox/i2s.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/i2s.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/i2s.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/i2s.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,1023 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/i2s.h
@@ -46708,7 +46708,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/i2s.h linux-2.6.24/include/
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/io.h linux-2.6.24/include/asm-arm/arch-hipox/io.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/io.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/io.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/io.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,17 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/io.h
@@ -46729,7 +46729,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/io.h linux-2.6.24/include/a
 +#endif //__ASM_ARM_ARCH_IO_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/irqs.h linux-2.6.24/include/asm-arm/arch-hipox/irqs.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/irqs.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/irqs.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/irqs.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,42 @@
 +/* linux/include/asm-arm/arch-hipox/irqs.h
 + *
@@ -46775,7 +46775,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/irqs.h linux-2.6.24/include
 +#endif // __ASM_ARCH_IRQ_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/leon.h linux-2.6.24/include/asm-arm/arch-hipox/leon.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/leon.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/leon.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/leon.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,36 @@
 +/*
 + * linux/arch/arm/mach-hipox/leon.h
@@ -46815,7 +46815,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/leon.h linux-2.6.24/include
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/leon-power-button-prog.h linux-2.6.24/include/asm-arm/arch-hipox/leon-power-button-prog.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/leon-power-button-prog.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/leon-power-button-prog.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/leon-power-button-prog.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,73 @@
 +static const s8 leon_srec[] =
 +"S01400006C656F6E2D706F7765722D627574746F6E1A\n"
@@ -46892,7 +46892,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/leon-power-button-prog.h li
 +"S7059801E00081\n";
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/leon-program.h linux-2.6.24/include/asm-arm/arch-hipox/leon-program.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/leon-program.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/leon-program.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/leon-program.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,404 @@
 +static const s8 leon_srec[] =
 +"S00700006C656F6E4A\n"
@@ -47300,7 +47300,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/leon-program.h linux-2.6.24
 +"S7059801E00081\n";
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/memory.h linux-2.6.24/include/asm-arm/arch-hipox/memory.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/memory.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/memory.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/memory.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,107 @@
 +/*
 + *  linux/include/asm-arm/arch-hipox/memory.h
@@ -47411,7 +47411,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/memory.h linux-2.6.24/inclu
 +#endif // __ASM_ARCH_MEMORY_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/ox810sata.h linux-2.6.24/include/asm-arm/arch-hipox/ox810sata.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/ox810sata.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/ox810sata.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/ox810sata.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,162 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/sata.h
@@ -47577,7 +47577,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/ox810sata.h linux-2.6.24/in
 +#endif  /*  #if !defined(__ASM_ARCH_SATA_H__) */
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/sata.h linux-2.6.24/include/asm-arm/arch-hipox/sata.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/sata.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/sata.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/sata.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,181 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/sata.h
@@ -47762,7 +47762,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/sata.h linux-2.6.24/include
 +#endif  /*  #if !defined(__ASM_ARCH_SATA_H__) */
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/system.h linux-2.6.24/include/asm-arm/arch-hipox/system.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/system.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/system.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/system.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,103 @@
 +/* linux/include/asm-arm/arch-hipox/system.h
 + *
@@ -47869,7 +47869,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/system.h linux-2.6.24/inclu
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/taco.h linux-2.6.24/include/asm-arm/arch-hipox/taco.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/taco.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/taco.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/taco.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,227 @@
 +/*
 + * linux/include/asm-arm/arch-hipox/tacho.h
@@ -48100,7 +48100,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/taco.h linux-2.6.24/include
 +
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/timex.h linux-2.6.24/include/asm-arm/arch-hipox/timex.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/timex.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/timex.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/timex.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,23 @@
 +/* linux/include/asm-arm/arch-hipox/timex.h
 + *
@@ -48127,7 +48127,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/timex.h linux-2.6.24/includ
 +#endif // __ASM_ARCH_TIMEX_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/uncompress.h linux-2.6.24/include/asm-arm/arch-hipox/uncompress.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/uncompress.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/uncompress.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/uncompress.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,43 @@
 +/* linux/include/asm-arm/arch-hipox0/uncompress.h
 + *
@@ -48174,7 +48174,7 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/uncompress.h linux-2.6.24/i
 +#endif // __ASM_ARCH_UNCOMPRESS_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/vmalloc.h linux-2.6.24/include/asm-arm/arch-hipox/vmalloc.h
 --- linux-2.6.24.4/include/asm-arm/arch-hipox/vmalloc.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/arch-hipox/vmalloc.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/asm-arm/arch-hipox/vmalloc.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,29 @@
 +/* linux/include/asm-arm/arch-hipox/vmalloc.h
 + *
@@ -48206,8 +48206,8 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/arch-hipox/vmalloc.h linux-2.6.24/incl
 +
 +#endif // __ASM_ARCH_VMALLOC_H
 diff -Nurd linux-2.6.24.4/include/asm-arm/assembler.h linux-2.6.24/include/asm-arm/assembler.h
---- linux-2.6.24.4/include/asm-arm/assembler.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/assembler.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/asm-arm/assembler.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/asm-arm/assembler.h	2010-10-12 14:09:59.000000000 +0200
 @@ -48,8 +48,10 @@
  
  /*
@@ -48221,8 +48221,8 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/assembler.h linux-2.6.24/include/asm-a
  #else
  #define PLD(code...)
 diff -Nurd linux-2.6.24.4/include/asm-arm/io.h linux-2.6.24/include/asm-arm/io.h
---- linux-2.6.24.4/include/asm-arm/io.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/io.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/asm-arm/io.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/asm-arm/io.h	2010-10-12 14:09:59.000000000 +0200
 @@ -108,27 +108,24 @@
   *
   * The {in,out}[bwl] macros are for emulating x86-style PCI/ISA IO space.
@@ -48267,8 +48267,8 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/io.h linux-2.6.24/include/asm-arm/io.h
  #define outb_p(val,port)	outb((val),(port))
  #define outw_p(val,port)	outw((val),(port))
 diff -Nurd linux-2.6.24.4/include/asm-arm/uaccess.h linux-2.6.24/include/asm-arm/uaccess.h
---- linux-2.6.24.4/include/asm-arm/uaccess.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/uaccess.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/asm-arm/uaccess.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/asm-arm/uaccess.h	2010-10-12 14:09:59.000000000 +0200
 @@ -383,9 +383,30 @@
  
  
@@ -48349,8 +48349,8 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/uaccess.h linux-2.6.24/include/asm-arm
  }
  
 diff -Nurd linux-2.6.24.4/include/asm-arm/unaligned.h linux-2.6.24/include/asm-arm/unaligned.h
---- linux-2.6.24.4/include/asm-arm/unaligned.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/unaligned.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/asm-arm/unaligned.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/asm-arm/unaligned.h	2010-10-12 14:09:59.000000000 +0200
 @@ -40,16 +40,16 @@
   */
  
@@ -48373,8 +48373,8 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/unaligned.h linux-2.6.24/include/asm-a
  #define __get_unaligned_8_le(__p)					\
  	((unsigned long long)__get_unaligned_4_le((__p+4)) << 32 |	\
 diff -Nurd linux-2.6.24.4/include/asm-arm/unistd.h linux-2.6.24/include/asm-arm/unistd.h
---- linux-2.6.24.4/include/asm-arm/unistd.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/asm-arm/unistd.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/asm-arm/unistd.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/asm-arm/unistd.h	2010-10-12 14:09:59.000000000 +0200
 @@ -379,6 +379,7 @@
  #define __NR_timerfd			(__NR_SYSCALL_BASE+350)
  #define __NR_eventfd			(__NR_SYSCALL_BASE+351)
@@ -48384,8 +48384,8 @@ diff -Nurd linux-2.6.24.4/include/asm-arm/unistd.h linux-2.6.24/include/asm-arm/
  /*
   * The following SWIs are ARM private.
 diff -Nurd linux-2.6.24.4/include/linux/bio.h linux-2.6.24/include/linux/bio.h
---- linux-2.6.24.4/include/linux/bio.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/bio.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/bio.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/bio.h	2010-10-12 14:09:59.000000000 +0200
 @@ -114,6 +114,15 @@
  	void			*bi_private;
  
@@ -48403,8 +48403,8 @@ diff -Nurd linux-2.6.24.4/include/linux/bio.h linux-2.6.24/include/linux/bio.h
  
  /*
 diff -Nurd linux-2.6.24.4/include/linux/byteorder/generic.h linux-2.6.24/include/linux/byteorder/generic.h
---- linux-2.6.24.4/include/linux/byteorder/generic.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/byteorder/generic.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/byteorder/generic.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/byteorder/generic.h	2010-10-12 14:09:59.000000000 +0200
 @@ -146,6 +146,36 @@
  #define htons(x) ___htons(x)
  #define ntohs(x) ___ntohs(x)
@@ -48443,8 +48443,8 @@ diff -Nurd linux-2.6.24.4/include/linux/byteorder/generic.h linux-2.6.24/include
  
  #endif /* _LINUX_BYTEORDER_GENERIC_H */
 diff -Nurd linux-2.6.24.4/include/linux/byteorder/swab.h linux-2.6.24/include/linux/byteorder/swab.h
---- linux-2.6.24.4/include/linux/byteorder/swab.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/byteorder/swab.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/byteorder/swab.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/byteorder/swab.h	2010-10-12 14:09:59.000000000 +0200
 @@ -61,26 +61,37 @@
   * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
   */
@@ -48512,8 +48512,8 @@ diff -Nurd linux-2.6.24.4/include/linux/byteorder/swab.h linux-2.6.24/include/li
   * provide defaults when no architecture-specific optimization is detected
   */
 diff -Nurd linux-2.6.24.4/include/linux/fs.h linux-2.6.24/include/linux/fs.h
---- linux-2.6.24.4/include/linux/fs.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/fs.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/fs.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/fs.h	2010-10-12 14:09:59.000000000 +0200
 @@ -1147,7 +1147,7 @@
  	int error;
  } read_descriptor_t;
@@ -48559,8 +48559,8 @@ diff -Nurd linux-2.6.24.4/include/linux/fs.h linux-2.6.24/include/linux/fs.h
  extern ssize_t generic_file_splice_read(struct file *, loff_t *,
  		struct pipe_inode_info *, size_t, unsigned int);
 diff -Nurd linux-2.6.24.4/include/linux/i2c-id.h linux-2.6.24/include/linux/i2c-id.h
---- linux-2.6.24.4/include/linux/i2c-id.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/i2c-id.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/i2c-id.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/i2c-id.h	2010-10-12 14:09:59.000000000 +0200
 @@ -203,6 +203,7 @@
  #define I2C_HW_B_CX2341X	0x010020 /* Conexant CX2341X MPEG encoder cards */
  #define I2C_HW_B_INTELFB	0x010021 /* intel framebuffer driver */
@@ -48570,8 +48570,8 @@ diff -Nurd linux-2.6.24.4/include/linux/i2c-id.h linux-2.6.24/include/linux/i2c-
  /* --- PCF 8584 based algorithms					*/
  #define I2C_HW_P_LP		0x020000 /* Parallel port interface */
 diff -Nurd linux-2.6.24.4/include/linux/leds.h linux-2.6.24/include/linux/leds.h
---- linux-2.6.24.4/include/linux/leds.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/leds.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/leds.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/leds.h	2010-10-12 14:09:59.000000000 +0200
 @@ -123,5 +123,11 @@
  	struct gpio_led *leds;
  };
@@ -48585,8 +48585,8 @@ diff -Nurd linux-2.6.24.4/include/linux/leds.h linux-2.6.24/include/linux/leds.h
  
  #endif		/* __LINUX_LEDS_H_INCLUDED */
 diff -Nurd linux-2.6.24.4/include/linux/libata.h linux-2.6.24/include/linux/libata.h
---- linux-2.6.24.4/include/linux/libata.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/libata.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/libata.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/libata.h	2010-10-12 14:09:59.000000000 +0200
 @@ -238,7 +238,7 @@
  	/* various lengths of time */
  	ATA_TMOUT_BOOT		= 30 * HZ,	/* heuristic */
@@ -48631,8 +48631,8 @@ diff -Nurd linux-2.6.24.4/include/linux/libata.h linux-2.6.24/include/linux/liba
  
  struct ata_port_info {
 diff -Nurd linux-2.6.24.4/include/linux/mii.h linux-2.6.24/include/linux/mii.h
---- linux-2.6.24.4/include/linux/mii.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/mii.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/mii.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/mii.h	2010-10-12 14:09:59.000000000 +0200
 @@ -21,18 +21,18 @@
  #define MII_EXPANSION       0x06        /* Expansion register          */
  #define MII_CTRL1000        0x09        /* 1000BASE-T control          */
@@ -48733,8 +48733,8 @@ diff -Nurd linux-2.6.24.4/include/linux/mii.h linux-2.6.24/include/linux/mii.h
   * mii_duplex
   * @duplex_lock: Non-zero if duplex is locked at full
 diff -Nurd linux-2.6.24.4/include/linux/net.h linux-2.6.24/include/linux/net.h
---- linux-2.6.24.4/include/linux/net.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/net.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/net.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/net.h	2010-10-12 14:09:59.000000000 +0200
 @@ -172,6 +172,8 @@
  				      struct vm_area_struct * vma);
  	ssize_t		(*sendpage)  (struct socket *sock, struct page *page,
@@ -48745,8 +48745,8 @@ diff -Nurd linux-2.6.24.4/include/linux/net.h linux-2.6.24/include/linux/net.h
  
  struct net_proto_family {
 diff -Nurd linux-2.6.24.4/include/linux/raid/raid1.h linux-2.6.24/include/linux/raid/raid1.h
---- linux-2.6.24.4/include/linux/raid/raid1.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/raid/raid1.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/raid/raid1.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/raid/raid1.h	2010-10-12 14:09:59.000000000 +0200
 @@ -61,6 +61,10 @@
  
  	mempool_t *r1bio_pool;
@@ -48759,8 +48759,8 @@ diff -Nurd linux-2.6.24.4/include/linux/raid/raid1.h linux-2.6.24/include/linux/
  
  typedef struct r1_private_data_s conf_t;
 diff -Nurd linux-2.6.24.4/include/linux/serial_reg.h linux-2.6.24/include/linux/serial_reg.h
---- linux-2.6.24.4/include/linux/serial_reg.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/serial_reg.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/serial_reg.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/serial_reg.h	2010-10-12 14:09:59.000000000 +0200
 @@ -133,6 +133,15 @@
  
  #define UART_SCR	7	/* I/O: Scratch Register */
@@ -48778,8 +48778,8 @@ diff -Nurd linux-2.6.24.4/include/linux/serial_reg.h linux-2.6.24/include/linux/
   * DLAB=1
   */
 diff -Nurd linux-2.6.24.4/include/linux/syscalls.h linux-2.6.24/include/linux/syscalls.h
---- linux-2.6.24.4/include/linux/syscalls.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/linux/syscalls.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/linux/syscalls.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/linux/syscalls.h	2010-10-12 14:09:59.000000000 +0200
 @@ -611,6 +611,7 @@
  			    const struct itimerspec __user *utmr);
  asmlinkage long sys_eventfd(unsigned int count);
@@ -48790,7 +48790,7 @@ diff -Nurd linux-2.6.24.4/include/linux/syscalls.h linux-2.6.24/include/linux/sy
  
 diff -Nurd linux-2.6.24.4/include/linux/trustees.h linux-2.6.24/include/linux/trustees.h
 --- linux-2.6.24.4/include/linux/trustees.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/include/linux/trustees.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/include/linux/trustees.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,108 @@
 +/*
 + * Trustees ACL Project
@@ -48901,8 +48901,8 @@ diff -Nurd linux-2.6.24.4/include/linux/trustees.h linux-2.6.24/include/linux/tr
 +
 +#endif /* _LINUX_TRUSTEE_STRUCT_H */
 diff -Nurd linux-2.6.24.4/include/net/sock.h linux-2.6.24/include/net/sock.h
---- linux-2.6.24.4/include/net/sock.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/net/sock.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/net/sock.h	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/include/net/sock.h	2010-10-12 14:09:59.000000000 +0200
 @@ -549,6 +549,8 @@
  					int *addr_len);
  	int			(*sendpage)(struct sock *sk, struct page *page,
@@ -48913,8 +48913,8 @@ diff -Nurd linux-2.6.24.4/include/net/sock.h linux-2.6.24/include/net/sock.h
  					struct sockaddr *uaddr, int addr_len);
  
 diff -Nurd linux-2.6.24.4/include/net/tcp.h linux-2.6.24/include/net/tcp.h
---- linux-2.6.24.4/include/net/tcp.h	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/include/net/tcp.h	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/include/net/tcp.h	2010-10-12 14:08:56.000000000 +0200
++++ linux-2.6.24/include/net/tcp.h	2010-10-12 14:09:59.000000000 +0200
 @@ -285,6 +285,7 @@
  extern int			tcp_sendmsg(struct kiocb *iocb, struct socket *sock,
  					    struct msghdr *msg, size_t size);
@@ -48924,8 +48924,8 @@ diff -Nurd linux-2.6.24.4/include/net/tcp.h linux-2.6.24/include/net/tcp.h
  extern int			tcp_ioctl(struct sock *sk, 
  					  int cmd, 
 diff -Nurd linux-2.6.24.4/kernel/printk.c linux-2.6.24/kernel/printk.c
---- linux-2.6.24.4/kernel/printk.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/kernel/printk.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/kernel/printk.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/kernel/printk.c	2010-10-12 14:09:59.000000000 +0200
 @@ -625,6 +625,11 @@
  	return r;
  }
@@ -48951,8 +48951,8 @@ diff -Nurd linux-2.6.24.4/kernel/printk.c linux-2.6.24/kernel/printk.c
  	 * Copy the output into log_buf.  If the caller didn't provide
  	 * appropriate log level tags, we insert them here
 diff -Nurd linux-2.6.24.4/kernel/softirq.c linux-2.6.24/kernel/softirq.c
---- linux-2.6.24.4/kernel/softirq.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/kernel/softirq.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/kernel/softirq.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/kernel/softirq.c	2010-10-12 14:09:59.000000000 +0200
 @@ -72,7 +72,7 @@
  {
  	unsigned long flags;
@@ -48975,8 +48975,8 @@ diff -Nurd linux-2.6.24.4/kernel/softirq.c linux-2.6.24/kernel/softirq.c
  #ifdef CONFIG_TRACE_IRQFLAGS
  	local_irq_save(flags);
 diff -Nurd linux-2.6.24.4/mm/filemap.c linux-2.6.24/mm/filemap.c
---- linux-2.6.24.4/mm/filemap.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/mm/filemap.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/mm/filemap.c	2010-10-12 14:08:56.000000000 +0200
++++ linux-2.6.24/mm/filemap.c	2010-10-12 14:09:59.000000000 +0200
 @@ -884,12 +884,31 @@
  	unsigned int prev_offset;
  	int error;
@@ -49300,8 +49300,8 @@ diff -Nurd linux-2.6.24.4/mm/filemap.c linux-2.6.24/mm/filemap.c
  do_readahead(struct address_space *mapping, struct file *filp,
  	     pgoff_t index, unsigned long nr)
 diff -Nurd linux-2.6.24.4/mm/shmem.c linux-2.6.24/mm/shmem.c
---- linux-2.6.24.4/mm/shmem.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/mm/shmem.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/mm/shmem.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/mm/shmem.c	2010-10-12 14:09:59.000000000 +0200
 @@ -1681,7 +1681,7 @@
  		 * "pos" here (the actor routine has to update the user buffer
  		 * pointers and the remaining count).
@@ -49312,8 +49312,8 @@ diff -Nurd linux-2.6.24.4/mm/shmem.c linux-2.6.24/mm/shmem.c
  		index += offset >> PAGE_CACHE_SHIFT;
  		offset &= ~PAGE_CACHE_MASK;
 diff -Nurd linux-2.6.24.4/net/ipv4/af_inet.c linux-2.6.24/net/ipv4/af_inet.c
---- linux-2.6.24.4/net/ipv4/af_inet.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/net/ipv4/af_inet.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/net/ipv4/af_inet.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/net/ipv4/af_inet.c	2010-10-12 14:09:59.000000000 +0200
 @@ -838,6 +838,7 @@
  	.recvmsg	   = sock_common_recvmsg,
  	.mmap		   = sock_no_mmap,
@@ -49323,8 +49323,8 @@ diff -Nurd linux-2.6.24.4/net/ipv4/af_inet.c linux-2.6.24/net/ipv4/af_inet.c
  	.compat_setsockopt = compat_sock_common_setsockopt,
  	.compat_getsockopt = compat_sock_common_getsockopt,
 diff -Nurd linux-2.6.24.4/net/ipv4/tcp.c linux-2.6.24/net/ipv4/tcp.c
---- linux-2.6.24.4/net/ipv4/tcp.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/net/ipv4/tcp.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/net/ipv4/tcp.c	2010-10-12 14:08:56.000000000 +0200
++++ linux-2.6.24/net/ipv4/tcp.c	2010-10-12 14:09:59.000000000 +0200
 @@ -269,6 +269,8 @@
  #include <asm/uaccess.h>
  #include <asm/ioctls.h>
@@ -49384,8 +49384,8 @@ diff -Nurd linux-2.6.24.4/net/ipv4/tcp.c linux-2.6.24/net/ipv4/tcp.c
  #define TCP_OFF(sk)	(sk->sk_sndmsg_off)
  
 diff -Nurd linux-2.6.24.4/net/socket.c linux-2.6.24/net/socket.c
---- linux-2.6.24.4/net/socket.c	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/net/socket.c	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/net/socket.c	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/net/socket.c	2010-10-12 14:09:59.000000000 +0200
 @@ -113,6 +113,9 @@
  static ssize_t sock_sendpage(struct file *file, struct page *page,
  			     int offset, size_t size, loff_t *ppos, int more);
@@ -49427,8 +49427,8 @@ diff -Nurd linux-2.6.24.4/net/socket.c linux-2.6.24/net/socket.c
  					 struct sock_iocb *siocb)
  {
 diff -Nurd linux-2.6.24.4/security/Kconfig linux-2.6.24/security/Kconfig
---- linux-2.6.24.4/security/Kconfig	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/security/Kconfig	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/security/Kconfig	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/security/Kconfig	2010-10-12 14:09:59.000000000 +0200
 @@ -103,6 +103,32 @@
  	  
  	  If you are unsure how to answer this question, answer N.
@@ -49463,8 +49463,8 @@ diff -Nurd linux-2.6.24.4/security/Kconfig linux-2.6.24/security/Kconfig
  
  endmenu
 diff -Nurd linux-2.6.24.4/security/Makefile linux-2.6.24/security/Makefile
---- linux-2.6.24.4/security/Makefile	2008-03-24 19:49:18.000000000 +0100
-+++ linux-2.6.24/security/Makefile	2010-01-14 14:01:15.000000000 +0100
+--- linux-2.6.24.4/security/Makefile	2008-01-24 23:58:37.000000000 +0100
++++ linux-2.6.24/security/Makefile	2010-10-12 14:09:59.000000000 +0200
 @@ -12,6 +12,7 @@
  
  # Object file lists
@@ -49475,7 +49475,7 @@ diff -Nurd linux-2.6.24.4/security/Makefile linux-2.6.24/security/Makefile
  obj-$(CONFIG_SECURITY_CAPABILITIES)	+= commoncap.o capability.o
 diff -Nurd linux-2.6.24.4/security/trustees/fs.c linux-2.6.24/security/trustees/fs.c
 --- linux-2.6.24.4/security/trustees/fs.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/security/trustees/fs.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/security/trustees/fs.c	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,273 @@
 +/*
 + * Trustees ACL Project
@@ -49752,7 +49752,7 @@ diff -Nurd linux-2.6.24.4/security/trustees/fs.c linux-2.6.24/security/trustees/
 +}
 diff -Nurd linux-2.6.24.4/security/trustees/funcs.c linux-2.6.24/security/trustees/funcs.c
 --- linux-2.6.24.4/security/trustees/funcs.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/security/trustees/funcs.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/security/trustees/funcs.c	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,810 @@
 +/*
 + * Trustees ACL Project
@@ -50566,7 +50566,7 @@ diff -Nurd linux-2.6.24.4/security/trustees/funcs.c linux-2.6.24/security/truste
 +}
 diff -Nurd linux-2.6.24.4/security/trustees/init.c linux-2.6.24/security/trustees/init.c
 --- linux-2.6.24.4/security/trustees/init.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/security/trustees/init.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/security/trustees/init.c	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,57 @@
 +/*
 + * Trustees ACL Project
@@ -50627,7 +50627,7 @@ diff -Nurd linux-2.6.24.4/security/trustees/init.c linux-2.6.24/security/trustee
 +fs_initcall(trustees_init);
 diff -Nurd linux-2.6.24.4/security/trustees/internal.h linux-2.6.24/security/trustees/internal.h
 --- linux-2.6.24.4/security/trustees/internal.h	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/security/trustees/internal.h	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/security/trustees/internal.h	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,100 @@
 +/*
 + * Trustees ACL Project
@@ -50731,7 +50731,7 @@ diff -Nurd linux-2.6.24.4/security/trustees/internal.h linux-2.6.24/security/tru
 +#endif				/* _LINUX_TRUSTEES_H */
 diff -Nurd linux-2.6.24.4/security/trustees/Makefile linux-2.6.24/security/trustees/Makefile
 --- linux-2.6.24.4/security/trustees/Makefile	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/security/trustees/Makefile	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/security/trustees/Makefile	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,8 @@
 +ifeq ($(CONFIG_SECURITY_TRUSTEES_DEBUG),y)
 +	EXTRA_CFLAGS += -DTRUSTEES_DEBUG
@@ -50743,7 +50743,7 @@ diff -Nurd linux-2.6.24.4/security/trustees/Makefile linux-2.6.24/security/trust
 +	init.o funcs.o ../commoncap.o
 diff -Nurd linux-2.6.24.4/security/trustees/security.c linux-2.6.24/security/trustees/security.c
 --- linux-2.6.24.4/security/trustees/security.c	1970-01-01 01:00:00.000000000 +0100
-+++ linux-2.6.24/security/trustees/security.c	2010-01-14 14:01:15.000000000 +0100
++++ linux-2.6.24/security/trustees/security.c	2010-10-12 14:09:59.000000000 +0200
 @@ -0,0 +1,423 @@
 +/*
 + * Trustees ACL Project
-- 
1.7.1



