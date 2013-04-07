Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1UOxIZ-0003KY-OH
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Apr 2013 23:38:53 +0200
Received: from localhost (176-26-190-109.dsl.ovh.fr [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 21CE6EA048
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Apr 2013 23:29:21 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 31BB0A40354; Sun,  7 Apr 2013 23:21:59 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Apr 2013 23:21:50 +0200
Message-Id: <13dc6b9c505779843135603d89b41ed517b08c55.1365368283.git.apelete@seketeli.net>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365368283.git.apelete@seketeli.net>
References: <cover.1365368283.git.apelete@seketeli.net>
In-Reply-To: <cover.1365368283.git.apelete@seketeli.net>
References: <cover.1365368283.git.apelete@seketeli.net>
Subject: [meta-handheld][PATCH v2 1/1] linux-jlime-ben-nanonote: fix GCC-4.6 build errors
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
X-List-Received-Date: Sun, 07 Apr 2013 21:38:56 -0000

The following changes fix build errors occuring on linux kernel 2.6.36
for the ben-nanonote machine:
- add LIC_FILES_CHKSUM,
- add "fix-gcc-4.6.0-build-errors.patch" patch file to fix an issue
  where gcc errors on 'unused but set variables' in kernel code. Issue
  fixed as in upstream mainline kernel in changesets #f1b6a505,
  #c726b822, #7a6e4ca1, #91b51f30, #71271aab and #d3ce0e98.

Signed-off-by: Apelete Seketeli <apelete@seketeli.net>
---
 .../fix-gcc-4.6.0-build-errors.patch               |  114 ++++++++++++++++++++
 .../linux/linux-jlime-ben-nanonote_2.6.36.bb       |    5 +-
 2 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch

diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch b/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch
new file mode 100644
index 0000000..afbd2c0
--- /dev/null
+++ b/recipes-kernel/linux/linux-jlime-ben-nanonote-2.6.36/fix-gcc-4.6.0-build-errors.patch
@@ -0,0 +1,114 @@
+diff --git a/arch/mips/jz4740/dma.c b/arch/mips/jz4740/dma.c
+index 5ebe75a..d7feb89 100644
+--- a/arch/mips/jz4740/dma.c
++++ b/arch/mips/jz4740/dma.c
+@@ -242,9 +242,7 @@ EXPORT_SYMBOL_GPL(jz4740_dma_get_residue);
+ 
+ static void jz4740_dma_chan_irq(struct jz4740_dma_chan *dma)
+ {
+-	uint32_t status;
+-
+-	status = jz4740_dma_read(JZ_REG_DMA_STATUS_CTRL(dma->id));
++	(void) jz4740_dma_read(JZ_REG_DMA_STATUS_CTRL(dma->id));
+ 
+ 	jz4740_dma_write_mask(JZ_REG_DMA_STATUS_CTRL(dma->id), 0,
+ 		JZ_DMA_STATUS_CTRL_ENABLE | JZ_DMA_STATUS_CTRL_TRANSFER_DONE);
+diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
+index 5922342..dbbe0ce 100644
+--- a/arch/mips/kernel/signal.c
++++ b/arch/mips/kernel/signal.c
+@@ -84,7 +84,7 @@ static int protected_save_fp_context(struct sigcontext __user *sc)
+ 
+ static int protected_restore_fp_context(struct sigcontext __user *sc)
+ {
+-	int err, tmp;
++	int err, tmp __maybe_unused;
+ 	while (1) {
+ 		lock_fpu_owner();
+ 		own_fpu_inatomic(0);
+diff --git a/arch/mips/kernel/signal32.c b/arch/mips/kernel/signal32.c
+index a0ed0e0..aae9866 100644
+--- a/arch/mips/kernel/signal32.c
++++ b/arch/mips/kernel/signal32.c
+@@ -115,7 +115,7 @@ static int protected_save_fp_context32(struct sigcontext32 __user *sc)
+ 
+ static int protected_restore_fp_context32(struct sigcontext32 __user *sc)
+ {
+-	int err, tmp;
++	int err, tmp __maybe_unused;
+ 	while (1) {
+ 		lock_fpu_owner();
+ 		own_fpu_inatomic(0);
+diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
+index 1dc6edf..18cd6f9 100644
+--- a/arch/mips/kernel/syscall.c
++++ b/arch/mips/kernel/syscall.c
+@@ -383,12 +383,11 @@ save_static_function(sys_sysmips);
+ static int __used noinline
+ _sys_sysmips(nabi_no_regargs struct pt_regs regs)
+ {
+-	long cmd, arg1, arg2, arg3;
++	long cmd, arg1, arg2;
+ 
+ 	cmd = regs.regs[4];
+ 	arg1 = regs.regs[5];
+ 	arg2 = regs.regs[6];
+-	arg3 = regs.regs[7];
+ 
+ 	switch (cmd) {
+ 	case MIPS_ATOMIC_SET:
+diff --git a/arch/mips/math-emu/ieee754int.h b/arch/mips/math-emu/ieee754int.h
+index 1a846c5..9f867cd 100644
+--- a/arch/mips/math-emu/ieee754int.h
++++ b/arch/mips/math-emu/ieee754int.h
+@@ -71,7 +71,7 @@
+ 
+ 
+ #define COMPXSP \
+-  unsigned xm; int xe; int xs; int xc
++  unsigned xm; int xe; int xs __maybe_unused; int xc
+ 
+ #define COMPYSP \
+   unsigned ym; int ye; int ys; int yc
+@@ -105,7 +105,7 @@
+ 
+ 
+ #define COMPXDP \
+-u64 xm; int xe; int xs; int xc
++u64 xm; int xe; int xs __maybe_unused; int xc
+ 
+ #define COMPYDP \
+ u64 ym; int ye; int ys; int yc
+diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
+index 6721ee2..8b24bcd 100644
+--- a/arch/mips/mm/c-r4k.c
++++ b/arch/mips/mm/c-r4k.c
+@@ -1076,7 +1076,6 @@ static int __cpuinit probe_scache(void)
+ 	unsigned long flags, addr, begin, end, pow2;
+ 	unsigned int config = read_c0_config();
+ 	struct cpuinfo_mips *c = &current_cpu_data;
+-	int tmp;
+ 
+ 	if (config & CONF_SC)
+ 		return 0;
+@@ -1109,7 +1108,6 @@ static int __cpuinit probe_scache(void)
+ 
+ 	/* Now search for the wrap around point. */
+ 	pow2 = (128 * 1024);
+-	tmp = 0;
+ 	for (addr = begin + (128 * 1024); addr < end; addr = begin + pow2) {
+ 		cache_op(Index_Load_Tag_SD, addr);
+ 		__asm__ __volatile__("nop; nop; nop; nop;"); /* hazard... */
+diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
+index 2efcbd2..279599e 100644
+--- a/arch/mips/mm/init.c
++++ b/arch/mips/mm/init.c
+@@ -324,7 +324,7 @@ int page_is_ram(unsigned long pagenr)
+ void __init paging_init(void)
+ {
+ 	unsigned long max_zone_pfns[MAX_NR_ZONES];
+-	unsigned long lastpfn;
++	unsigned long lastpfn __maybe_unused;
+ 
+ 	pagetable_init();
+ 
diff --git a/recipes-kernel/linux/linux-jlime-ben-nanonote_2.6.36.bb b/recipes-kernel/linux/linux-jlime-ben-nanonote_2.6.36.bb
index 3df3f63..c2c1ade 100644
--- a/recipes-kernel/linux/linux-jlime-ben-nanonote_2.6.36.bb
+++ b/recipes-kernel/linux/linux-jlime-ben-nanonote_2.6.36.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Linux 2.6.36 kernel for the Ben Nanonote"
 SECTION = "kernel"
 LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 DEPENDS += "u-boot-mkimage-native"
 
@@ -15,7 +16,9 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kristoffer/linux-hpc.gi
 	   file://logo_linux_clut224.tar.gz \
 	   file://modifier-keys.patch \
 	   file://config-ben-nanonote \
-	   file://jz4740-udc.patch"
+	   file://jz4740-udc.patch \
+	   file://fix-gcc-4.6.0-build-errors.patch \
+	   "
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10.4



