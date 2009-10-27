Received: from [209.85.219.209] (helo=mail-ew0-f209.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2ks5-0002Pn-JG
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 13:09:57 +0100
Received: by mail-ew0-f209.google.com with SMTP id 5so76676ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=le0Yhvfu0lvYCrsevd6JYJMB+oCiyzHb8/LdW5OJOeM=;
	b=vQL4GC1u7WSznNLX1xD/aetDbEBQ585LhkBywO1+vp61SJy07ZzlU0Hgiq9XZOBOER
	eyt1LbdA7Nrs4LT0afNs+0HOPjAcZih1PeCdm6nnsQOmA5RngNiK/h6J5pps+Q1bFgLe
	2lxVh32btUwhfulCinuFpngf+btViKDoRbgfA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=KtcdmvbsfP9E/u817HVuYFzLDSWFgEb+UTdiEZjauAWLu+cQUlVbilgC/f3+q/cjUz
	5IZy7L0VW0TbIKx+r3fBHLcaJ+qaWt/ac+VamLNGhDYUPcL3IpZE7uhbXsYG+XKn2/sm
	7V/u7LdVIfV1Pl9HjmsgmgtZ+rD5ftLV+uF3A=
Received: by 10.211.174.13 with SMTP id b13mr1632958ebp.73.1256645329764;
	Tue, 27 Oct 2009 05:08:49 -0700 (PDT)
Received: from localhost.localdomain (248.Red-213-97-239.staticIP.rima-tde.net
	[213.97.239.248])
	by mx.google.com with ESMTPS id 5sm2206947eyf.9.2009.10.27.05.08.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 27 Oct 2009 05:08:48 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Oct 2009 13:08:44 +0100
Message-Id: <1256645324-3210-2-git-send-email-eballetbo@gmail.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1256645324-3210-1-git-send-email-eballetbo@gmail.com>
References: <1256645324-3210-1-git-send-email-eballetbo@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.209
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH v2 2/2] u-boot: add IGEP v2 support to 2009.08 release
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
X-List-Received-Date: Tue, 27 Oct 2009 12:09:57 -0000

From: Enric Balletbo i Serra <eballetbo@iseebcn.com>


Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
---
 conf/machine/igep0020.conf                         |    2 +
 ...dd-board-support-for-IGEP-v2-series-rev-B.patch | 1098 ++++++++++++++++++
 .../igep0020/update-mach-types.patch               | 1206 ++++++++++++++++++++
 recipes/u-boot/u-boot_2009.08.bb                   |    8 +-
 4 files changed, 2313 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-2009.08/igep0020/add-board-support-for-IGEP-v2-series-rev-B.patch
 create mode 100644 recipes/u-boot/u-boot-2009.08/igep0020/update-mach-types.patch

diff --git a/conf/machine/igep0020.conf b/conf/machine/igep0020.conf
index 512a977..deb1723 100644
--- a/conf/machine/igep0020.conf
+++ b/conf/machine/igep0020.conf
@@ -19,6 +19,8 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-igep2"
 
 KERNEL_IMAGETYPE = "uImage"
 
+UBOOT_MACHINE = "omap3_igep0020b_config"
+
 IMAGE_FSTYPES += "tar.bz2 ubi"
 
 # Guesswork
diff --git a/recipes/u-boot/u-boot-2009.08/igep0020/add-board-support-for-IGEP-v2-series-rev-B.patch b/recipes/u-boot/u-boot-2009.08/igep0020/add-board-support-for-IGEP-v2-series-rev-B.patch
new file mode 100644
index 0000000..db523bf
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.08/igep0020/add-board-support-for-IGEP-v2-series-rev-B.patch
@@ -0,0 +1,1098 @@
+From 8a70b51444b755139bcc41c2a322fc9dc77fb46e Mon Sep 17 00:00:00 2001
+From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
+Date: Fri, 4 Sep 2009 13:48:06 +0200
+Subject: [PATCH 3/6] Add board support for IGEP v2.x series rev. B
+
+
+Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
+---
+ Makefile                          |    3 +
+ board/omap3/igep0020b/Makefile    |   49 +++++
+ board/omap3/igep0020b/config.mk   |   36 ++++
+ board/omap3/igep0020b/igep0020b.c |  245 +++++++++++++++++++++++
+ board/omap3/igep0020b/igep0020b.h |  399 +++++++++++++++++++++++++++++++++++++
+ cpu/arm_cortexa8/omap3/board.c    |    3 +-
+ include/configs/omap3_igep0020b.h |  282 ++++++++++++++++++++++++++
+ 7 files changed, 1016 insertions(+), 1 deletions(-)
+ create mode 100644 board/omap3/igep0020b/Makefile
+ create mode 100644 board/omap3/igep0020b/config.mk
+ create mode 100644 board/omap3/igep0020b/igep0020b.c
+ create mode 100644 board/omap3/igep0020b/igep0020b.h
+ create mode 100644 include/configs/omap3_igep0020b.h
+
+diff --git a/Makefile b/Makefile
+index 1cd9797..db31063 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3043,6 +3043,9 @@ VCMA9_config	:	unconfig
+ omap3_igep0020a_config :	unconfig
+ 	@$(MKCONFIG) $(@:_config=) arm arm_cortexa8 igep0020a omap3 omap3
+ 
++omap3_igep0020b_config :	unconfig
++	@$(MKCONFIG) $(@:_config=) arm arm_cortexa8 igep0020b omap3 omap3
++
+ #########################################################################
+ # ARM supplied Versatile development boards
+ #########################################################################
+diff --git a/board/omap3/igep0020b/Makefile b/board/omap3/igep0020b/Makefile
+new file mode 100644
+index 0000000..fe2f197
+--- /dev/null
++++ b/board/omap3/igep0020b/Makefile
+@@ -0,0 +1,49 @@
++#
++# (C) Copyright 2000, 2001, 2002
++# Wolfgang Denk, DENX Software Engineering, wd@denx.de.
++#
++# See file CREDITS for list of people who contributed to this
++# project.
++#
++# This program is free software; you can redistribute it and/or
++# modify it under the terms of the GNU General Public License as
++# published by the Free Software Foundation; either version 2 of
++# the License, or (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++# MA 02111-1307 USA
++#
++
++include $(TOPDIR)/config.mk
++
++LIB	= $(obj)lib$(BOARD).a
++
++COBJS	:= igep0020b.o
++
++SRCS	:= $(COBJS:.o=.c)
++OBJS	:= $(addprefix $(obj),$(COBJS))
++
++$(LIB):	$(obj).depend $(OBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS)
++
++clean:
++	rm -f $(OBJS)
++
++distclean:	clean
++	rm -f $(LIB) core *.bak $(obj).depend
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
++#########################################################################
+diff --git a/board/omap3/igep0020b/config.mk b/board/omap3/igep0020b/config.mk
+new file mode 100644
+index 0000000..6795797
+--- /dev/null
++++ b/board/omap3/igep0020b/config.mk
+@@ -0,0 +1,36 @@
++#
++# (C) Copyright 2009
++# Integration Software and Electronics Engineering, <www.iseebcn.com>
++#
++# IGEP0020 uses OMAP3 (ARM-CortexA8) cpu
++# see http://www.ti.com/ for more information on Texas Instruments
++#
++# See file CREDITS for list of people who contributed to this
++# project.
++#
++# This program is free software; you can redistribute it and/or
++# modify it under the terms of the GNU General Public License as
++# published by the Free Software Foundation; either version 2 of
++# the License, or (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++# MA 02111-1307 USA
++#
++# Physical Address:
++# 8000'0000 (bank0)
++# A000/0000 (bank1)
++# Linux-Kernel is expected to be at 8000'8000, entry 8000'8000
++# (mem base + reserved)
++
++# For use with external or internal boots.
++# TEXT_BASE = 0x80e80000
++# TEXT_BASE = 0x9fe80000
++TEXT_BASE = 0x8ff00000
++
+diff --git a/board/omap3/igep0020b/igep0020b.c b/board/omap3/igep0020b/igep0020b.c
+new file mode 100644
+index 0000000..8328217
+--- /dev/null
++++ b/board/omap3/igep0020b/igep0020b.c
+@@ -0,0 +1,245 @@
++/*
++ * Maintainer: Integration Software and Electronics Engineering, <www.iseebcn.com>
++ *
++ * Derived from Beagle Board, 3430 SDP, and OMAP3EVM code by
++ *	Richard Woodruff <r-woodruff2@ti.com>
++ *	Syed Mohammed Khasim <khasim@ti.com>
++ *	Sunil Kumar <sunilsaini05@gmail.com>
++ *	Shashi Ranjan <shashiranjanmca05@gmail.com>
++ *
++ * (C) Copyright 2004-2008
++ * Texas Instruments, <www.ti.com>
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++#include <common.h>
++#include <twl4030.h>
++#include <asm/io.h>
++#include <asm/arch/mem.h>
++#include <asm/arch/mux.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/mach-types.h>
++#include "igep0020b.h"
++
++/*
++ * Routine: board_init
++ * Description: Early hardware init.
++ */
++int board_init(void)
++{
++	DECLARE_GLOBAL_DATA_PTR;
++
++	gpmc_init(); /* in SRAM or SDRAM, finish GPMC */
++	/* board id for Linux */
++	gd->bd->bi_arch_number = MACH_TYPE_IGEP0020;
++	/* boot param addr */
++	gd->bd->bi_boot_params = (OMAP34XX_SDRC_CS0 + 0x100);
++
++	return 0;
++}
++
++/*
++ * Routine: dss_init
++ * Description: Draw into dss buffer.
++ */
++void dss_init(void)
++{
++	unsigned int i;
++	int offset = 0;
++
++	/* assuming a resolution of 1280x720 - draw into dss buffer */
++	/* fill in the blank */
++
++	for(i = 0; i<(720 - (offset/2/1280))*1280*2; i+=2) {
++		*((unsigned short *)(0x80500000 + i + offset)) = 0xffff;
++	}
++
++	*((uint *) 0x48310034) = 0xfefffedf;
++	*((uint *) 0x48310094) = 0x01000120;
++	*((uint *) 0x48004D44) = 0x0001b00c;
++	*((uint *) 0x48004E40) = 0x00001006;
++	*((uint *) 0x48004D00) = 0x00370037;
++	*((uint *) 0x48050C00) = 0x00000002;
++	*((uint *) 0x48050C04) = 0x0000001B;
++	*((uint *) 0x48050C08) = 0x00000040;
++	*((uint *) 0x48050C0C) = 0x00000000;
++	*((uint *) 0x48050C10) = 0x00000000;
++	*((uint *) 0x48050C14) = 0x00008000;
++	*((uint *) 0x48050C18) = 0x00000000;
++	*((uint *) 0x48050C1C) = 0x00008359;
++	*((uint *) 0x48050C20) = 0x0000020C;
++	*((uint *) 0x48050C24) = 0x00000000;
++	*((uint *) 0x48050C28) = 0x043F2631;
++	*((uint *) 0x48050C2C) = 0x00000024;
++	*((uint *) 0x48050C30) = 0x00000130;
++	*((uint *) 0x48050C34) = 0x00000198;
++	*((uint *) 0x48050C38) = 0x000001C0;
++	*((uint *) 0x48050C3C) = 0x0000006A;
++	*((uint *) 0x48050C40) = 0x0000005C;
++	*((uint *) 0x48050C44) = 0x00000000;
++	*((uint *) 0x48050C48) = 0x00000001;
++	*((uint *) 0x48050C4C) = 0x0000003F;
++	*((uint *) 0x48050C50) = 0x21F07C1F;
++	*((uint *) 0x48050C54) = 0x00000000;
++	*((uint *) 0x48050C58) = 0x00000015;
++	*((uint *) 0x48050C5C) = 0x00001400;
++	*((uint *) 0x48050C60) = 0x00000000;
++	*((uint *) 0x48050C64) = 0x069300F4;
++	*((uint *) 0x48050C68) = 0x0016020C;
++	*((uint *) 0x48050C6C) = 0x00060107;
++	*((uint *) 0x48050C70) = 0x008D034E;
++	*((uint *) 0x48050C74) = 0x000F0359;
++	*((uint *) 0x48050C78) = 0x01A00000;
++	*((uint *) 0x48050C7C) = 0x020501A0;
++	*((uint *) 0x48050C80) = 0x01AC0024;
++	*((uint *) 0x48050C84) = 0x020D01AC;
++	*((uint *) 0x48050C88) = 0x00000006;
++	*((uint *) 0x48050C8C) = 0x00000000;
++	*((uint *) 0x48050C90) = 0x03480079;
++	*((uint *) 0x48050C94) = 0x02040024;
++	*((uint *) 0x48050C98) = 0x00000000;
++	*((uint *) 0x48050C9C) = 0x00000000;
++	*((uint *) 0x48050CA0) = 0x0001008A;
++	*((uint *) 0x48050CA4) = 0x01AC0106;
++	*((uint *) 0x48050CA8) = 0x01060006;
++	*((uint *) 0x48050CAC) = 0x00000000;
++	*((uint *) 0x48050CB0) = 0x00140001;
++	*((uint *) 0x48050CB4) = 0x00010001;
++	*((uint *) 0x48050CB8) = 0x00FF0000;
++	*((uint *) 0x48050CBC) = 0x00000000;
++	*((uint *) 0x48050CC0) = 0x00000000;
++	*((uint *) 0x48050CC4) = 0x0000000D;
++	*((uint *) 0x48050CC8) = 0x00000000;
++	*((uint *) 0x48050010) = 0x00000001;
++	*((uint *) 0x48050040) = 0x00000078;
++	*((uint *) 0x48050044) = 0x00000000;
++	*((uint *) 0x48050048) = 0x00000000;
++	*((uint *) 0x48050050) = 0x00000000;
++	*((uint *) 0x48050058) = 0x00000000;
++	*((uint *) 0x48050410) = 0x00002015;
++	*((uint *) 0x48050414) = 0x00000001;
++	*((uint *) 0x48050444) = 0x00000004;
++	*((uint *) 0x4805044c) = 0xFFFFFFFF;
++	*((uint *) 0x48050450) = 0x00000000;
++	*((uint *) 0x48050454) = 0x00000000;
++	*((uint *) 0x48050458) = 0x00000000;
++	*((uint *) 0x48050464) = 0x0ff03f31;
++	*((uint *) 0x48050468) = 0x01400504;
++	*((uint *) 0x4805046c) = 0x00007028;
++	*((uint *) 0x48050470) = 0x00010002;
++	*((uint *) 0x48050478) = 0x00ef027f;
++	*((uint *) 0x4805047c) = 0x02cf04ff;
++	*((uint *) 0x48050480) = 0x80500000;
++	*((uint *) 0x48050484) = 0x80500000;
++	*((uint *) 0x48050488) = 0x00000000;
++	*((uint *) 0x4805048c) = 0x02cf04ff;
++	*((uint *) 0x480504a0) = 0x0000008d;
++	*((uint *) 0x480504a4) = 0x03fc03bc;
++	*((uint *) 0x480504a8) = 0x00000400;
++	*((uint *) 0x480504ac) = 0x00000001;
++	*((uint *) 0x480504b0) = 0x00000001;
++	*((uint *) 0x480504b4) = 0x00000000;
++	*((uint *) 0x480504b8) = 0x807ff000;
++	udelay(1000);
++	*((uint *) 0x48050440) = 0x0001836b;
++	udelay(1000);
++	*((uint *) 0x48050440) = 0x0001836b;
++	udelay(1000);
++	*((uint *) 0x48050440) = 0x0001836b;
++	udelay(1000);
++}
++
++/*
++ * Routine: misc_init_r
++ * Description: Configure board specific parts
++ */
++int misc_init_r(void)
++{
++	twl4030_power_init();
++	twl4030_led_init();
++
++	dss_init();
++
++#if defined(CONFIG_CMD_NET)
++	setup_net_chip();
++#endif
++
++	dieid_num_r();
++
++	return 0;
++}
++
++/*
++ * Routine: set_muxconf_regs
++ * Description: Setting up the configuration Mux registers specific to the
++ *		hardware. Many pins need to be moved from protect to primary
++ *		mode.
++ */
++void set_muxconf_regs(void)
++{
++	MUX_IGEP0020();
++}
++
++/*
++ * Routine: setup_net_chip
++ * Description: Setting up the configuration GPMC registers specific to the
++ *		Ethernet hardware.
++ */
++static void setup_net_chip(void)
++{
++	struct gpio *gpio3_base = (struct gpio *)OMAP34XX_GPIO3_BASE;
++	struct ctrl *ctrl_base = (struct ctrl *)OMAP34XX_CTRL_BASE;
++
++	/* Configure GPMC registers */
++	writel(NET_GPMC_CONFIG1, &gpmc_cfg->cs[5].config1);
++	writel(NET_GPMC_CONFIG2, &gpmc_cfg->cs[5].config2);
++	writel(NET_GPMC_CONFIG3, &gpmc_cfg->cs[5].config3);
++	writel(NET_GPMC_CONFIG4, &gpmc_cfg->cs[5].config4);
++	writel(NET_GPMC_CONFIG5, &gpmc_cfg->cs[5].config5);
++	writel(NET_GPMC_CONFIG6, &gpmc_cfg->cs[5].config6);
++	writel(NET_GPMC_CONFIG7, &gpmc_cfg->cs[5].config7);
++
++	/* Enable off mode for NWE in PADCONF_GPMC_NWE register */
++	writew(readw(&ctrl_base ->gpmc_nwe) | 0x0E00, &ctrl_base->gpmc_nwe);
++	/* Enable off mode for NOE in PADCONF_GPMC_NADV_ALE register */
++	writew(readw(&ctrl_base->gpmc_noe) | 0x0E00, &ctrl_base->gpmc_noe);
++	/* Enable off mode for ALE in PADCONF_GPMC_NADV_ALE register */
++	writew(readw(&ctrl_base->gpmc_nadv_ale) | 0x0E00,
++		&ctrl_base->gpmc_nadv_ale);
++
++	/* Make GPIO 64 as output pin */
++	writel(readl(&gpio3_base->oe) & ~(GPIO0), &gpio3_base->oe);
++
++	/* Now send a pulse on the GPIO pin */
++	writel(GPIO0, &gpio3_base->setdataout);
++	udelay(1);
++	writel(GPIO0, &gpio3_base->cleardataout);
++	udelay(1);
++	writel(GPIO0, &gpio3_base->setdataout);
++}
++
++int board_eth_init(bd_t *bis)
++{
++	int rc = 0;
++#ifdef CONFIG_SMC911X
++	rc = smc911x_initialize(0, CONFIG_SMC911X_BASE);
++#endif
++	return rc;
++}
++
+diff --git a/board/omap3/igep0020b/igep0020b.h b/board/omap3/igep0020b/igep0020b.h
+new file mode 100644
+index 0000000..b76dac9
+--- /dev/null
++++ b/board/omap3/igep0020b/igep0020b.h
+@@ -0,0 +1,399 @@
++/*
++ * (C) Copyright 2009
++ * Integration Software and Electronics Engineering, <www.iseebcn.com>
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++#ifndef _IGEP0020_H_
++#define _IGEP0020_H_
++
++const omap3_sysinfo sysinfo = {
++	DDR_STACKED,
++	"IGEP v2.x rev. B",
++	"ONENAND",
++};
++
++static void setup_net_chip(void);
++
++/*
++ * IEN  - Input Enable
++ * IDIS - Input Disable
++ * PTD  - Pull type Down
++ * PTU  - Pull type Up
++ * DIS  - Pull type selection is inactive
++ * EN   - Pull type selection is active
++ * M0   - Mode 0
++ * The commented string gives the final mux configuration for that pin
++ */
++#define MUX_IGEP0020() \
++ /* SDRC */\
++ MUX_VAL(CP(SDRC_D0),		(IEN  | PTD | DIS | M0)) /* SDRC_D0  */\
++ MUX_VAL(CP(SDRC_D1),		(IEN  | PTD | DIS | M0)) /* SDRC_D1  */\
++ MUX_VAL(CP(SDRC_D2),		(IEN  | PTD | DIS | M0)) /* SDRC_D2  */\
++ MUX_VAL(CP(SDRC_D3),		(IEN  | PTD | DIS | M0)) /* SDRC_D3  */\
++ MUX_VAL(CP(SDRC_D4),		(IEN  | PTD | DIS | M0)) /* SDRC_D4  */\
++ MUX_VAL(CP(SDRC_D5),		(IEN  | PTD | DIS | M0)) /* SDRC_D5  */\
++ MUX_VAL(CP(SDRC_D6),		(IEN  | PTD | DIS | M0)) /* SDRC_D6  */\
++ MUX_VAL(CP(SDRC_D7),		(IEN  | PTD | DIS | M0)) /* SDRC_D7  */\
++ MUX_VAL(CP(SDRC_D8),		(IEN  | PTD | DIS | M0)) /* SDRC_D8  */\
++ MUX_VAL(CP(SDRC_D9),		(IEN  | PTD | DIS | M0)) /* SDRC_D9  */\
++ MUX_VAL(CP(SDRC_D10),		(IEN  | PTD | DIS | M0)) /* SDRC_D10 */\
++ MUX_VAL(CP(SDRC_D11),		(IEN  | PTD | DIS | M0)) /* SDRC_D11 */\
++ MUX_VAL(CP(SDRC_D12),		(IEN  | PTD | DIS | M0)) /* SDRC_D12 */\
++ MUX_VAL(CP(SDRC_D13),		(IEN  | PTD | DIS | M0)) /* SDRC_D13 */\
++ MUX_VAL(CP(SDRC_D14),		(IEN  | PTD | DIS | M0)) /* SDRC_D14 */\
++ MUX_VAL(CP(SDRC_D15),		(IEN  | PTD | DIS | M0)) /* SDRC_D15 */\
++ MUX_VAL(CP(SDRC_D16),		(IEN  | PTD | DIS | M0)) /* SDRC_D16 */\
++ MUX_VAL(CP(SDRC_D17),		(IEN  | PTD | DIS | M0)) /* SDRC_D17 */\
++ MUX_VAL(CP(SDRC_D18),		(IEN  | PTD | DIS | M0)) /* SDRC_D18 */\
++ MUX_VAL(CP(SDRC_D19),		(IEN  | PTD | DIS | M0)) /* SDRC_D19 */\
++ MUX_VAL(CP(SDRC_D20),		(IEN  | PTD | DIS | M0)) /* SDRC_D20 */\
++ MUX_VAL(CP(SDRC_D21),		(IEN  | PTD | DIS | M0)) /* SDRC_D21 */\
++ MUX_VAL(CP(SDRC_D22),		(IEN  | PTD | DIS | M0)) /* SDRC_D22 */\
++ MUX_VAL(CP(SDRC_D23),		(IEN  | PTD | DIS | M0)) /* SDRC_D23 */\
++ MUX_VAL(CP(SDRC_D24),		(IEN  | PTD | DIS | M0)) /* SDRC_D24 */\
++ MUX_VAL(CP(SDRC_D25),		(IEN  | PTD | DIS | M0)) /* SDRC_D25 */\
++ MUX_VAL(CP(SDRC_D26),		(IEN  | PTD | DIS | M0)) /* SDRC_D26 */\
++ MUX_VAL(CP(SDRC_D27),		(IEN  | PTD | DIS | M0)) /* SDRC_D27 */\
++ MUX_VAL(CP(SDRC_D28),		(IEN  | PTD | DIS | M0)) /* SDRC_D28 */\
++ MUX_VAL(CP(SDRC_D29),		(IEN  | PTD | DIS | M0)) /* SDRC_D29 */\
++ MUX_VAL(CP(SDRC_D30),		(IEN  | PTD | DIS | M0)) /* SDRC_D30 */\
++ MUX_VAL(CP(SDRC_D31),		(IEN  | PTD | DIS | M0)) /* SDRC_D31 */\
++ MUX_VAL(CP(SDRC_CLK),		(IEN  | PTD | DIS | M0)) /* SDRC_CLK */\
++ MUX_VAL(CP(SDRC_DQS0),		(IEN  | PTD | DIS | M0)) /* SDRC_DQS0*/\
++ MUX_VAL(CP(SDRC_DQS1),		(IEN  | PTD | DIS | M0)) /* SDRC_DQS1*/\
++ MUX_VAL(CP(SDRC_DQS2),		(IEN  | PTD | DIS | M0)) /* SDRC_DQS2*/\
++ MUX_VAL(CP(SDRC_DQS3),		(IEN  | PTD | DIS | M0)) /* SDRC_DQS3*/\
++ /* GPMC - General-Purpose Memory Controller */\
++ MUX_VAL(CP(GPMC_A1),		(IDIS | PTU | EN  | M0)) /* GPMC_A1       */\
++ MUX_VAL(CP(GPMC_A2),		(IDIS | PTU | EN  | M0)) /* GPMC_A2       */\
++ MUX_VAL(CP(GPMC_A3),		(IDIS | PTU | EN  | M0)) /* GPMC_A3       */\
++ MUX_VAL(CP(GPMC_A4),		(IDIS | PTU | EN  | M0)) /* GPMC_A4       */\
++ MUX_VAL(CP(GPMC_A5),		(IDIS | PTU | EN  | M0)) /* GPMC_A5       */\
++ MUX_VAL(CP(GPMC_A6),		(IDIS | PTU | EN  | M0)) /* GPMC_A6       */\
++ MUX_VAL(CP(GPMC_A7),		(IDIS | PTU | EN  | M0)) /* GPMC_A7       */\
++ MUX_VAL(CP(GPMC_A8),		(IDIS | PTU | EN  | M0)) /* GPMC_A8       */\
++ MUX_VAL(CP(GPMC_A9),		(IDIS | PTU | EN  | M0)) /* GPMC_A9       */\
++ MUX_VAL(CP(GPMC_A10),		(IDIS | PTU | EN  | M0)) /* GPMC_A10      */\
++ MUX_VAL(CP(GPMC_D0),		(IEN  | PTU | EN  | M0)) /* GPMC_D0       */\
++ MUX_VAL(CP(GPMC_D1),		(IEN  | PTU | EN  | M0)) /* GPMC_D1       */\
++ MUX_VAL(CP(GPMC_D2),		(IEN  | PTU | EN  | M0)) /* GPMC_D2       */\
++ MUX_VAL(CP(GPMC_D3),		(IEN  | PTU | EN  | M0)) /* GPMC_D3       */\
++ MUX_VAL(CP(GPMC_D4),		(IEN  | PTU | EN  | M0)) /* GPMC_D4       */\
++ MUX_VAL(CP(GPMC_D5),		(IEN  | PTU | EN  | M0)) /* GPMC_D5       */\
++ MUX_VAL(CP(GPMC_D6),		(IEN  | PTU | EN  | M0)) /* GPMC_D6       */\
++ MUX_VAL(CP(GPMC_D7),		(IEN  | PTU | EN  | M0)) /* GPMC_D7       */\
++ MUX_VAL(CP(GPMC_D8),		(IEN  | PTU | EN  | M0)) /* GPMC_D8       */\
++ MUX_VAL(CP(GPMC_D9),		(IEN  | PTU | EN  | M0)) /* GPMC_D9       */\
++ MUX_VAL(CP(GPMC_D10),		(IEN  | PTU | EN  | M0)) /* GPMC_D10      */\
++ MUX_VAL(CP(GPMC_D11),		(IEN  | PTU | EN  | M0)) /* GPMC_D11      */\
++ MUX_VAL(CP(GPMC_D12),		(IEN  | PTU | EN  | M0)) /* GPMC_D12      */\
++ MUX_VAL(CP(GPMC_D13),		(IEN  | PTU | EN  | M0)) /* GPMC_D13      */\
++ MUX_VAL(CP(GPMC_D14),		(IEN  | PTU | EN  | M0)) /* GPMC_D14      */\
++ MUX_VAL(CP(GPMC_D15),		(IEN  | PTU | EN  | M0)) /* GPMC_D15      */\
++ MUX_VAL(CP(GPMC_NCS0),		(IDIS | PTU | EN  | M0)) /* GPMC_nCS0     */\
++ MUX_VAL(CP(GPMC_NCS1),		(IDIS | PTU | EN  | M0)) /* GPMC_nCS1     */\
++ MUX_VAL(CP(GPMC_NCS2),		(IDIS | PTU | EN  | M0)) /* GPMC_nCS2     */\
++ MUX_VAL(CP(GPMC_NCS3),		(IDIS | PTU | EN  | M0)) /* GPMC_nCS3     */\
++ MUX_VAL(CP(GPMC_NCS4),		(IDIS | PTU | EN  | M0)) /* GPMC_nCS4     */\
++ MUX_VAL(CP(GPMC_NCS5),		(IDIS | PTU | EN  | M0)) /* GPMC_nCS5     */\
++ MUX_VAL(CP(GPMC_NCS6),		(IDIS | PTU | EN  | M0)) /* GPMC_nCS6     */\
++ MUX_VAL(CP(GPMC_NOE),		(IDIS | PTD | DIS | M0)) /* GPMC_nOE      */\
++ MUX_VAL(CP(GPMC_NWE),		(IDIS | PTD | DIS | M0)) /* GPMC_nWE      */\
++ \
++ MUX_VAL(CP(GPMC_WAIT2),	(IEN  | PTU | EN  | M4)) /* GPIO_64 -ETH_NRESET */\
++ \
++ MUX_VAL(CP(GPMC_NCS7),		(IEN  | PTU | EN  | M1)) /* SYS_nDMA_REQ3 */\
++ MUX_VAL(CP(GPMC_CLK),		(IDIS | PTD | DIS | M0)) /* GPMC_CLK      */\
++ MUX_VAL(CP(GPMC_NBE1),		(IEN  | PTD | DIS | M0)) /* GPMC_nBE1     */\
++ MUX_VAL(CP(GPMC_NADV_ALE),	(IDIS | PTD | DIS | M0)) /* GPMC_nADV_ALE */\
++ MUX_VAL(CP(GPMC_NBE0_CLE),	(IDIS | PTD | DIS | M0)) /* GPMC_nBE0_CLE */\
++ MUX_VAL(CP(GPMC_NWP),		(IEN  | PTD | DIS | M0)) /* GPMC_nWP      */\
++ MUX_VAL(CP(GPMC_WAIT0),	(IEN  | PTU | EN  | M0)) /* GPMC_WAIT0    */\
++ MUX_VAL(CP(GPMC_WAIT1),	(IEN  | PTU | EN  | M0)) /* GPMC_WAIT1    */\
++ MUX_VAL(CP(GPMC_WAIT3),	(IEN  | PTU | EN  | M0)) /* GPMC_WAIT3    */\
++ /* DSS */\
++ MUX_VAL(CP(DSS_PCLK),		(IDIS | PTD | DIS | M0)) /* DSS_PCLK   */\
++ MUX_VAL(CP(DSS_HSYNC),		(IDIS | PTD | DIS | M0)) /* DSS_HSYNC  */\
++ MUX_VAL(CP(DSS_VSYNC),		(IDIS | PTD | DIS | M0)) /* DSS_VSYNC  */\
++ MUX_VAL(CP(DSS_ACBIAS),	(IDIS | PTD | DIS | M0)) /* DSS_ACBIAS */\
++ MUX_VAL(CP(DSS_DATA0),		(IDIS | PTD | DIS | M0)) /* DSS_DATA0  */\
++ MUX_VAL(CP(DSS_DATA1),		(IDIS | PTD | DIS | M0)) /* DSS_DATA1  */\
++ MUX_VAL(CP(DSS_DATA2),		(IDIS | PTD | DIS | M0)) /* DSS_DATA2  */\
++ MUX_VAL(CP(DSS_DATA3),		(IDIS | PTD | DIS | M0)) /* DSS_DATA3  */\
++ MUX_VAL(CP(DSS_DATA4),		(IDIS | PTD | DIS | M0)) /* DSS_DATA4  */\
++ MUX_VAL(CP(DSS_DATA5),		(IDIS | PTD | DIS | M0)) /* DSS_DATA5  */\
++ MUX_VAL(CP(DSS_DATA6),		(IDIS | PTD | DIS | M0)) /* DSS_DATA6  */\
++ MUX_VAL(CP(DSS_DATA7),		(IDIS | PTD | DIS | M0)) /* DSS_DATA7  */\
++ MUX_VAL(CP(DSS_DATA8),		(IDIS | PTD | DIS | M0)) /* DSS_DATA8  */\
++ MUX_VAL(CP(DSS_DATA9),		(IDIS | PTD | DIS | M0)) /* DSS_DATA9  */\
++ MUX_VAL(CP(DSS_DATA10),	(IDIS | PTD | DIS | M0)) /* DSS_DATA10 */\
++ MUX_VAL(CP(DSS_DATA11),	(IDIS | PTD | DIS | M0)) /* DSS_DATA11 */\
++ MUX_VAL(CP(DSS_DATA12),	(IDIS | PTD | DIS | M0)) /* DSS_DATA12 */\
++ MUX_VAL(CP(DSS_DATA13),	(IDIS | PTD | DIS | M0)) /* DSS_DATA13 */\
++ MUX_VAL(CP(DSS_DATA14),	(IDIS | PTD | DIS | M0)) /* DSS_DATA14 */\
++ MUX_VAL(CP(DSS_DATA15),	(IDIS | PTD | DIS | M0)) /* DSS_DATA15 */\
++ MUX_VAL(CP(DSS_DATA16),	(IDIS | PTD | DIS | M0)) /* DSS_DATA16 */\
++ MUX_VAL(CP(DSS_DATA17),	(IDIS | PTD | DIS | M0)) /* DSS_DATA17 */\
++ MUX_VAL(CP(DSS_DATA18),	(IDIS | PTD | DIS | M0)) /* DSS_DATA18 */\
++ MUX_VAL(CP(DSS_DATA19),	(IDIS | PTD | DIS | M0)) /* DSS_DATA19 */\
++ MUX_VAL(CP(DSS_DATA20),	(IDIS | PTD | DIS | M0)) /* DSS_DATA20 */\
++ MUX_VAL(CP(DSS_DATA21),	(IDIS | PTD | DIS | M0)) /* DSS_DATA21 */\
++ MUX_VAL(CP(DSS_DATA22),	(IDIS | PTD | DIS | M0)) /* DSS_DATA22 */\
++ MUX_VAL(CP(DSS_DATA23),	(IDIS | PTD | DIS | M0)) /* DSS_DATA23 */\
++ /* Audio Interface */\
++ MUX_VAL(CP(MCBSP2_FSX),	(IEN  | PTD | DIS | M0)) /* McBSP2_FSX  */\
++ MUX_VAL(CP(MCBSP2_CLKX),	(IEN  | PTD | DIS | M0)) /* McBSP2_CLKX */\
++ MUX_VAL(CP(MCBSP2_DR),		(IEN  | PTD | DIS | M0)) /* McBSP2_DR   */\
++ MUX_VAL(CP(MCBSP2_DX),		(IDIS | PTD | DIS | M0)) /* McBSP2_DX   */\
++ /* Expansion card 1 */\
++ MUX_VAL(CP(MMC1_CLK),		(IDIS | PTU | EN  | M0)) /* MMC1_CLK  */\
++ MUX_VAL(CP(MMC1_CMD),		(IEN  | PTU | EN  | M0)) /* MMC1_CMD  */\
++ MUX_VAL(CP(MMC1_DAT0),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT0 */\
++ MUX_VAL(CP(MMC1_DAT1),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT1 */\
++ MUX_VAL(CP(MMC1_DAT2),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT2 */\
++ MUX_VAL(CP(MMC1_DAT3),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT3 */\
++ \
++ MUX_VAL(CP(MMC1_DAT4),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT4 */\
++ MUX_VAL(CP(MMC1_DAT5),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT5 */\
++ MUX_VAL(CP(MMC1_DAT6),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT6 */\
++ MUX_VAL(CP(MMC1_DAT7),		(IEN  | PTU | EN  | M0)) /* MMC1_DAT7 */\
++ /* SDIO Interface to WIFI Module (EXPANSION CONNECTOR) */\
++ MUX_VAL(CP(MMC2_CLK),		(IEN  | PTU | EN  | M0)) /* MMC2_CLK  */\
++ MUX_VAL(CP(MMC2_CMD),		(IEN  | PTU | EN  | M0)) /* MMC2_CMD  */\
++ MUX_VAL(CP(MMC2_DAT0),		(IEN  | PTU | EN  | M0)) /* MMC2_DAT0 */\
++ MUX_VAL(CP(MMC2_DAT1),		(IEN  | PTU | EN  | M0)) /* MMC2_DAT1 */\
++ MUX_VAL(CP(MMC2_DAT2),		(IEN  | PTU | EN  | M0)) /* MMC2_DAT2 */\
++ MUX_VAL(CP(MMC2_DAT3),		(IEN  | PTU | EN  | M0)) /* MMC2_DAT3 */\
++ \
++ /* GSPI Interface to WIFI Module */ \
++/* MUX_VAL(CP(MMC2_CLK),		(IEN  | PTD | DIS | M1)) McSPI3_CLK  */\
++/* MUX_VAL(CP(MMC2_CMD),		(IEN  | PTD | DIS | M1)) McSPI3_SIMO */\
++/* MUX_VAL(CP(MMC2_DAT0),		(IEN  | PTD | DIS | M1)) McSPI3_SOMI */\
++/* MUX_VAL(CP(MMC2_DAT1),		(IEN  | PTD | DIS | M4)) GPIO_133    */\
++/* MUX_VAL(CP(MMC2_DAT2),		(IEN  | PTD | DIS | M4)) GPIO_134    */\
++/* MUX_VAL(CP(MMC2_DAT3),		(IEN  | PTD | DIS | M4)) GPIO_135 (GPIO-Based CS) */\
++ \
++ MUX_VAL(CP(CAM_HS),		(IDIS | PTD | DIS | M4)) /* GPIO_94 - PDN */\
++ MUX_VAL(CP(CAM_VS),		(IDIS | PTD | DIS | M4)) /* GPIO_95 - RESET_N_W */\
++ \
++ MUX_VAL(CP(MMC2_DAT4),		(IEN  | PTU | EN  | M0)) /* MMC2_DIR_DAT0 */\
++ MUX_VAL(CP(MMC2_DAT5),		(IEN  | PTU | EN  | M0)) /* MMC2_DIR_DAT1 */\
++ MUX_VAL(CP(MMC2_DAT6),		(IEN  | PTU | EN  | M0)) /* MMC2_DIR_CMD  */\
++ MUX_VAL(CP(MMC2_DAT7),		(IEN  | PTU | EN  | M0)) /* MMC2_CLKIN    */\
++ /* Bluetooth (EXPANSION CONNECTOR) */\
++ MUX_VAL(CP(MCBSP3_DX),		(IDIS | PTD | DIS | M0)) /* McBSP3_DX */\
++ MUX_VAL(CP(MCBSP3_DR),		(IEN  | PTD | DIS | M0)) /* McBSP3_DR */\
++ MUX_VAL(CP(MCBSP3_CLKX),	(IEN  | PTD | DIS | M0)) /* McBSP3_CLKX  */\
++ MUX_VAL(CP(MCBSP3_FSX),	(IEN  | PTD | DIS | M0)) /* McBSP3_FSX   */\
++ MUX_VAL(CP(UART2_CTS),		(IEN  | PTU | EN  | M0)) /* UART2_CTS */\
++ MUX_VAL(CP(UART2_RTS),		(IDIS | PTD | DIS | M0)) /* UART2_RTS */\
++ MUX_VAL(CP(UART2_TX),		(IDIS | PTD | DIS | M0)) /* UART2_TX  */\
++ MUX_VAL(CP(UART2_RX),		(IEN  | PTD | DIS | M0)) /* UART2_RX  */\
++ /* 485 Interface */\
++ MUX_VAL(CP(UART1_TX),		(IDIS | PTD | DIS | M0)) /* UART1_TX  */\
++ MUX_VAL(CP(UART1_RTS),		(IDIS | PTD | DIS | M0)) /* UART1_RTS */\
++ MUX_VAL(CP(UART1_CTS),		(IEN  | PTU | DIS | M0)) /* UART1_CTS */\
++ MUX_VAL(CP(UART1_RX),		(IEN  | PTD | DIS | M0)) /* UART1_RX  */\
++ MUX_VAL(CP(MCBSP4_CLKX),	(IDIS | PTD | DIS | M4)) /* GPIO_152  */\
++ /* Serial Interface */\
++ MUX_VAL(CP(UART3_CTS_RCTX),	(IEN  | PTD | EN  | M0)) /* UART3_CTS_RCTX*/\
++ MUX_VAL(CP(UART3_RTS_SD),	(IDIS | PTD | DIS | M0)) /* UART3_RTS_SD */\
++ MUX_VAL(CP(UART3_RX_IRRX),	(IEN  | PTD | DIS | M0)) /* UART3_RX_IRRX*/\
++ MUX_VAL(CP(UART3_TX_IRTX),	(IDIS | PTD | DIS | M0)) /* UART3_TX_IRTX*/\
++ MUX_VAL(CP(HSUSB0_CLK),	(IEN  | PTD | DIS | M0)) /* HSUSB0_CLK*/\
++ MUX_VAL(CP(HSUSB0_STP),	(IDIS | PTU | EN  | M0)) /* HSUSB0_STP*/\
++ MUX_VAL(CP(HSUSB0_DIR),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DIR*/\
++ MUX_VAL(CP(HSUSB0_NXT),	(IEN  | PTD | DIS | M0)) /* HSUSB0_NXT*/\
++ MUX_VAL(CP(HSUSB0_DATA0),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA0*/\
++ MUX_VAL(CP(HSUSB0_DATA1),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA1*/\
++ MUX_VAL(CP(HSUSB0_DATA2),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA2*/\
++ MUX_VAL(CP(HSUSB0_DATA3),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA3*/\
++ MUX_VAL(CP(HSUSB0_DATA4),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA4*/\
++ MUX_VAL(CP(HSUSB0_DATA5),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA5*/\
++ MUX_VAL(CP(HSUSB0_DATA6),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA6*/\
++ MUX_VAL(CP(HSUSB0_DATA7),	(IEN  | PTD | DIS | M0)) /* HSUSB0_DATA7*/\
++ MUX_VAL(CP(I2C1_SCL),		(IEN  | PTU | EN  | M0)) /* I2C1_SCL*/\
++ MUX_VAL(CP(I2C1_SDA),		(IEN  | PTU | EN  | M0)) /* I2C1_SDA*/\
++ MUX_VAL(CP(I2C2_SCL),		(IEN  | PTU | EN  | M4)) /* GPIO_168*/\
++ MUX_VAL(CP(I2C2_SDA),		(IEN  | PTU | EN  | M4)) /* GPIO_183*/\
++ MUX_VAL(CP(I2C3_SCL),		(IEN  | PTU | EN  | M0)) /* I2C3_SCL*/\
++ MUX_VAL(CP(I2C3_SDA),		(IEN  | PTU | EN  | M0)) /* I2C3_SDA*/\
++ MUX_VAL(CP(I2C4_SCL),		(IEN  | PTU | EN  | M0)) /* I2C4_SCL*/\
++ MUX_VAL(CP(I2C4_SDA),		(IEN  | PTU | EN  | M0)) /* I2C4_SDA*/\
++ MUX_VAL(CP(HDQ_SIO),		(IDIS | PTU | EN  | M4)) /* GPIO_170*/\
++ /* SPI1 ADC121S101 */ \
++ MUX_VAL(CP(MCSPI1_CLK),	(IEN  | PTD | DIS | M0)) /* McSPI1_CLK  */\
++ MUX_VAL(CP(MCSPI1_SIMO),	(IEN  | PTD | DIS | M0)) /* McSPI1_SIMO */\
++ MUX_VAL(CP(MCSPI1_SOMI),	(IEN  | PTD | DIS | M0)) /* McSPI1_SOMI */\
++ MUX_VAL(CP(MCSPI1_CS3),	(IDIS | PTD | DIS | M0)) /* McSPI1_CS3  */\
++ \
++ MUX_VAL(CP(MCSPI1_CS0),	(IEN  | PTD | DIS | M4)) /* GPIO_174   */\
++ MUX_VAL(CP(MCSPI1_CS1),	(IEN  | PTD | DIS | M4)) /* GPIO_175   */\
++ MUX_VAL(CP(MCSPI1_CS2),	(IEN  | PTD | DIS | M4)) /* GPIO_176   */\
++ /* SPI2 (25GHz RF PORT) */ \
++ MUX_VAL(CP(MCSPI2_CLK),	(IEN  | PTD | DIS | M0)) /* McSPI2_CLK  */\
++ MUX_VAL(CP(MCSPI2_SIMO),	(IEN  | PTD | DIS | M0)) /* McSPI2_SIMO */\
++ MUX_VAL(CP(MCSPI2_SOMI),	(IEN  | PTD | DIS | M0)) /* McSPI2_SOMI */\
++ MUX_VAL(CP(MCSPI2_CS0),	(IDIS | PTD | DIS | M0)) /* McSPI2_CS0  */\
++ \
++ MUX_VAL(CP(MCSPI2_CS1),	(IEN  | PTD | DIS | M4)) /* GPIO_182    */\
++ /* Control and debug */\
++ MUX_VAL(CP(SYS_32K),		(IEN  | PTD | DIS | M0)) /* SYS_32K*/\
++ MUX_VAL(CP(SYS_CLKREQ),	(IEN  | PTD | DIS | M0)) /* SYS_CLKREQ*/\
++ MUX_VAL(CP(SYS_NIRQ),		(IEN  | PTU | EN  | M0)) /* SYS_nIRQ*/\
++ MUX_VAL(CP(SYS_BOOT0),		(IEN  | PTD | DIS | M4)) /* GPIO_2*/\
++ MUX_VAL(CP(SYS_BOOT1),		(IEN  | PTD | DIS | M4)) /* GPIO_3*/\
++ MUX_VAL(CP(SYS_BOOT2),		(IEN  | PTD | DIS | M4)) /* GPIO_4 - MMC1_WP*/\
++ MUX_VAL(CP(SYS_BOOT3),		(IEN  | PTD | DIS | M4)) /* GPIO_5*/\
++ MUX_VAL(CP(SYS_BOOT4),		(IEN  | PTD | DIS | M4)) /* GPIO_6*/\
++ MUX_VAL(CP(SYS_BOOT5),		(IEN  | PTD | DIS | M4)) /* GPIO_7*/\
++ MUX_VAL(CP(SYS_BOOT6),		(IDIS | PTD | DIS | M4)) /* GPIO_8*/ \
++ /* VIO_1V8 */\
++ MUX_VAL(CP(SYS_OFF_MODE),	(IEN  | PTD | DIS | M0)) /* SYS_OFF_MODE*/\
++ MUX_VAL(CP(SYS_CLKOUT1),	(IEN  | PTD | DIS | M0)) /* SYS_CLKOUT1*/\
++ MUX_VAL(CP(SYS_CLKOUT2),	(IEN  | PTU | EN  | M4)) /* GPIO_186*/\
++ /* USB EHCI (port 1)  */ \
++ MUX_VAL(CP(ETK_CLK_ES2),	(IDIS | PTU | DIS | M3)) /* HSUSB1_STP   */\
++ MUX_VAL(CP(ETK_CTL_ES2),	(IDIS | PTU | DIS | M3)) /* HSUSB1_CLK   */\
++ MUX_VAL(CP(ETK_D0_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA0 */\
++ MUX_VAL(CP(ETK_D1_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA1 */\
++ MUX_VAL(CP(ETK_D2_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA2 */\
++ MUX_VAL(CP(ETK_D3_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA3 */\
++ MUX_VAL(CP(ETK_D4_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA4 */\
++ MUX_VAL(CP(ETK_D5_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA5 */\
++ MUX_VAL(CP(ETK_D6_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA6 */\
++ MUX_VAL(CP(ETK_D7_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DATA7 */\
++ MUX_VAL(CP(ETK_D8_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_DIR   */\
++ MUX_VAL(CP(ETK_D9_ES2),	(IEN  | PTU | DIS | M3)) /* HSUSB1_NXT   */\
++ /* Generic IO (outputs) */\
++ MUX_VAL(CP(ETK_D10_ES2),	(IDIS | PTU | DIS | M4)) /* GPIO_24  - USB1HS_nRST */\
++ MUX_VAL(CP(ETK_D12_ES2),	(IDIS | PTU | DIS | M4)) /* GPIO_26  - LED1        */\
++ MUX_VAL(CP(ETK_D13_ES2),	(IDIS | PTU | DIS | M4)) /* GPIO_27  - LED0        */\
++ MUX_VAL(CP(CAM_D6),		(IDIS | PTU | DIS | M4)) /* GPIO_105 - RF_CTRL     */\
++ MUX_VAL(CP(CAM_D7),		(IDIS | PTU | DIS | M4)) /* GPIO_106 - RF_STANDBY  */\
++ MUX_VAL(CP(CAM_D8),		(IDIS | PTU | DIS | M4)) /* GPIO_107 - RF_INT      */\
++ MUX_VAL(CP(CAM_D9),		(IDIS | PTU | DIS | M4)) /* GPIO_108 - RF_SYNCB    */\
++ /* Generic IO (inputs) */\
++ MUX_VAL(CP(ETK_D11_ES2),	(IEN  | PTD | DIS | M4)) /* GPIO_25   */\
++ MUX_VAL(CP(ETK_D14_ES2),	(IEN  | PTD | DIS | M4)) /* GPIO_28   */\
++ MUX_VAL(CP(ETK_D15_ES2),	(IEN  | PTD | DIS | M4)) /* GPIO_29   */\
++ MUX_VAL(CP(CAM_D0),		(IEN  | PTD | DIS | M4)) /* GPIO_99   */\
++ MUX_VAL(CP(CAM_D1),		(IEN  | PTD | DIS | M4)) /* GPIO_100  */\
++ MUX_VAL(CP(CSI2_DX0),		(IEN  | PTD | DIS | M4)) /* GPIO_112  */\
++ MUX_VAL(CP(CSI2_DY0),		(IEN  | PTD | DIS | M4)) /* GPIO_113  */\
++ MUX_VAL(CP(CSI2_DX1),		(IEN  | PTD | DIS | M4)) /* GPIO_114  */\
++ MUX_VAL(CP(CSI2_DY1),		(IEN  | PTD | DIS | M4)) /* GPIO_115  */\
++ \
++ \
++ /* LCD_INI */\
++ MUX_VAL(CP(MCBSP4_DR),		(IDIS | PTD | DIS | M4)) /* GPIO_153  */\
++ /* LCD_ENVDD */\
++ MUX_VAL(CP(MCBSP4_DX),		(IDIS | PTD | DIS | M4)) /* GPIO_154 */\
++ /* LCD_QVGA/nVGA */\
++ MUX_VAL(CP(MCBSP4_FSX),	(IDIS | PTD | DIS | M4)) /* GPIO_155 */\
++ /* LCD_RESB */\
++ MUX_VAL(CP(MCBSP1_CLKR),	(IDIS | PTD | DIS | M4)) /* GPIO_156 */\
++ MUX_VAL(CP(MCBSP1_FSR),	(IDIS | PTU | EN  | M4)) /* GPIO_157 */\
++ MUX_VAL(CP(MCBSP1_DX),		(IDIS | PTD | DIS | M4)) /* GPIO_158 */\
++ MUX_VAL(CP(MCBSP1_DR),		(IDIS | PTD | DIS | M4)) /* GPIO_159 */\
++ MUX_VAL(CP(MCBSP_CLKS),	(IEN  | PTU | DIS | M0)) /* McBSP_CLKS */\
++ MUX_VAL(CP(MCBSP1_FSX),	(IDIS | PTD | DIS | M4)) /* GPIO_161 */\
++ MUX_VAL(CP(MCBSP1_CLKX),	(IDIS | PTD | DIS | M4)) /* GPIO_162 */\
++ \
++ /* CAMERA */\
++ MUX_VAL(CP(CAM_XCLKA),		(IDIS | PTD | DIS | M0)) /* CAM_XCLKA */\
++ MUX_VAL(CP(CAM_PCLK),		(IEN  | PTU | EN  | M0)) /* CAM_PCLK  */\
++ MUX_VAL(CP(CAM_FLD),		(IDIS | PTD | DIS | M4)) /* GPIO_98   */\
++ MUX_VAL(CP(CAM_D2),		(IEN  | PTD | DIS | M0)) /* CAM_D2    */\
++ MUX_VAL(CP(CAM_D3),		(IEN  | PTD | DIS | M0)) /* CAM_D3    */\
++ MUX_VAL(CP(CAM_D4),		(IEN  | PTD | DIS | M0)) /* CAM_D4    */\
++ MUX_VAL(CP(CAM_D5),		(IEN  | PTD | DIS | M0)) /* CAM_D5    */\
++ MUX_VAL(CP(CAM_D10),		(IEN  | PTD | DIS | M0)) /* CAM_D10   */\
++ MUX_VAL(CP(CAM_D11),		(IEN  | PTD | DIS | M0)) /* CAM_D11   */\
++ MUX_VAL(CP(CAM_XCLKB),		(IDIS | PTD | DIS | M0)) /* CAM_XCLKB */\
++ MUX_VAL(CP(CAM_WEN),		(IEN  | PTD | DIS | M4)) /* GPIO_167  */\
++ MUX_VAL(CP(CAM_STROBE),	(IDIS | PTD | DIS | M0)) /* CAM_STROBE*/\
++ \
++ MUX_VAL(CP(D2D_MCAD1),		(IEN  | PTD | EN  | M0)) /*d2d_mcad1*/\
++ MUX_VAL(CP(D2D_MCAD2),		(IEN  | PTD | EN  | M0)) /*d2d_mcad2*/\
++ MUX_VAL(CP(D2D_MCAD3),		(IEN  | PTD | EN  | M0)) /*d2d_mcad3*/\
++ MUX_VAL(CP(D2D_MCAD4),		(IEN  | PTD | EN  | M0)) /*d2d_mcad4*/\
++ MUX_VAL(CP(D2D_MCAD5),		(IEN  | PTD | EN  | M0)) /*d2d_mcad5*/\
++ MUX_VAL(CP(D2D_MCAD6),		(IEN  | PTD | EN  | M0)) /*d2d_mcad6*/\
++ MUX_VAL(CP(D2D_MCAD7),		(IEN  | PTD | EN  | M0)) /*d2d_mcad7*/\
++ MUX_VAL(CP(D2D_MCAD8),		(IEN  | PTD | EN  | M0)) /*d2d_mcad8*/\
++ MUX_VAL(CP(D2D_MCAD9),		(IEN  | PTD | EN  | M0)) /*d2d_mcad9*/\
++ MUX_VAL(CP(D2D_MCAD10),	(IEN  | PTD | EN  | M0)) /*d2d_mcad10*/\
++ MUX_VAL(CP(D2D_MCAD11),	(IEN  | PTD | EN  | M0)) /*d2d_mcad11*/\
++ MUX_VAL(CP(D2D_MCAD12),	(IEN  | PTD | EN  | M0)) /*d2d_mcad12*/\
++ MUX_VAL(CP(D2D_MCAD13),	(IEN  | PTD | EN  | M0)) /*d2d_mcad13*/\
++ MUX_VAL(CP(D2D_MCAD14),	(IEN  | PTD | EN  | M0)) /*d2d_mcad14*/\
++ MUX_VAL(CP(D2D_MCAD15),	(IEN  | PTD | EN  | M0)) /*d2d_mcad15*/\
++ MUX_VAL(CP(D2D_MCAD16),	(IEN  | PTD | EN  | M0)) /*d2d_mcad16*/\
++ MUX_VAL(CP(D2D_MCAD17),	(IEN  | PTD | EN  | M0)) /*d2d_mcad17*/\
++ MUX_VAL(CP(D2D_MCAD18),	(IEN  | PTD | EN  | M0)) /*d2d_mcad18*/\
++ MUX_VAL(CP(D2D_MCAD19),	(IEN  | PTD | EN  | M0)) /*d2d_mcad19*/\
++ MUX_VAL(CP(D2D_MCAD20),	(IEN  | PTD | EN  | M0)) /*d2d_mcad20*/\
++ MUX_VAL(CP(D2D_MCAD21),	(IEN  | PTD | EN  | M0)) /*d2d_mcad21*/\
++ MUX_VAL(CP(D2D_MCAD22),	(IEN  | PTD | EN  | M0)) /*d2d_mcad22*/\
++ MUX_VAL(CP(D2D_MCAD23),	(IEN  | PTD | EN  | M0)) /*d2d_mcad23*/\
++ MUX_VAL(CP(D2D_MCAD24),	(IEN  | PTD | EN  | M0)) /*d2d_mcad24*/\
++ MUX_VAL(CP(D2D_MCAD25),	(IEN  | PTD | EN  | M0)) /*d2d_mcad25*/\
++ MUX_VAL(CP(D2D_MCAD26),	(IEN  | PTD | EN  | M0)) /*d2d_mcad26*/\
++ MUX_VAL(CP(D2D_MCAD27),	(IEN  | PTD | EN  | M0)) /*d2d_mcad27*/\
++ MUX_VAL(CP(D2D_MCAD28),	(IEN  | PTD | EN  | M0)) /*d2d_mcad28*/\
++ MUX_VAL(CP(D2D_MCAD29),	(IEN  | PTD | EN  | M0)) /*d2d_mcad29*/\
++ MUX_VAL(CP(D2D_MCAD30),	(IEN  | PTD | EN  | M0)) /*d2d_mcad30*/\
++ MUX_VAL(CP(D2D_MCAD31),	(IEN  | PTD | EN  | M0)) /*d2d_mcad31*/\
++ MUX_VAL(CP(D2D_MCAD32),	(IEN  | PTD | EN  | M0)) /*d2d_mcad32*/\
++ MUX_VAL(CP(D2D_MCAD33),	(IEN  | PTD | EN  | M0)) /*d2d_mcad33*/\
++ MUX_VAL(CP(D2D_MCAD34),	(IEN  | PTD | EN  | M0)) /*d2d_mcad34*/\
++ MUX_VAL(CP(D2D_MCAD35),	(IEN  | PTD | EN  | M0)) /*d2d_mcad35*/\
++ MUX_VAL(CP(D2D_MCAD36),	(IEN  | PTD | EN  | M0)) /*d2d_mcad36*/\
++ MUX_VAL(CP(D2D_CLK26MI),	(IEN  | PTD | DIS | M0)) /*d2d_clk26mi*/\
++ MUX_VAL(CP(D2D_NRESPWRON),	(IEN  | PTD | EN  | M0)) /*d2d_nrespwron*/\
++ MUX_VAL(CP(D2D_NRESWARM),	(IEN  | PTU | EN  | M0)) /*d2d_nreswarm */\
++ MUX_VAL(CP(D2D_ARM9NIRQ),	(IEN  | PTD | DIS | M0)) /*d2d_arm9nirq */\
++ MUX_VAL(CP(D2D_UMA2P6FIQ),	(IEN  | PTD | DIS | M0)) /*d2d_uma2p6fiq*/\
++ MUX_VAL(CP(D2D_SPINT),		(IEN  | PTD | EN  | M0)) /*d2d_spint*/\
++ MUX_VAL(CP(D2D_FRINT),		(IEN  | PTD | EN  | M0)) /*d2d_frint*/\
++ MUX_VAL(CP(D2D_DMAREQ0),	(IEN  | PTD | DIS | M0)) /*d2d_dmareq0*/\
++ MUX_VAL(CP(D2D_DMAREQ1),	(IEN  | PTD | DIS | M0)) /*d2d_dmareq1*/\
++ MUX_VAL(CP(D2D_DMAREQ2),	(IEN  | PTD | DIS | M0)) /*d2d_dmareq2*/\
++ MUX_VAL(CP(D2D_DMAREQ3),	(IEN  | PTD | DIS | M0)) /*d2d_dmareq3*/\
++ MUX_VAL(CP(D2D_N3GTRST),	(IEN  | PTD | DIS | M0)) /*d2d_n3gtrst*/\
++ MUX_VAL(CP(D2D_N3GTDI),	(IEN  | PTD | DIS | M0)) /*d2d_n3gtdi*/\
++ MUX_VAL(CP(D2D_N3GTDO),	(IEN  | PTD | DIS | M0)) /*d2d_n3gtdo*/\
++ MUX_VAL(CP(D2D_N3GTMS),	(IEN  | PTD | DIS | M0)) /*d2d_n3gtms*/\
++ MUX_VAL(CP(D2D_N3GTCK),	(IEN  | PTD | DIS | M0)) /*d2d_n3gtck*/\
++ MUX_VAL(CP(D2D_N3GRTCK),	(IEN  | PTD | DIS | M0)) /*d2d_n3grtck*/\
++ MUX_VAL(CP(D2D_MSTDBY),	(IEN  | PTU | EN  | M0)) /*d2d_mstdby*/\
++ MUX_VAL(CP(D2D_SWAKEUP),	(IEN  | PTD | EN  | M0)) /*d2d_swakeup*/\
++ MUX_VAL(CP(D2D_IDLEREQ),	(IEN  | PTD | DIS | M0)) /*d2d_idlereq*/\
++ MUX_VAL(CP(D2D_IDLEACK),	(IEN  | PTU | EN  | M0)) /*d2d_idleack*/\
++ MUX_VAL(CP(D2D_MWRITE),	(IEN  | PTD | DIS | M0)) /*d2d_mwrite*/\
++ MUX_VAL(CP(D2D_SWRITE),	(IEN  | PTD | DIS | M0)) /*d2d_swrite*/\
++ MUX_VAL(CP(D2D_MREAD),		(IEN  | PTD | DIS | M0)) /*d2d_mread*/\
++ MUX_VAL(CP(D2D_SREAD),		(IEN  | PTD | DIS | M0)) /*d2d_sread*/\
++ MUX_VAL(CP(D2D_MBUSFLAG),	(IEN  | PTD | DIS | M0)) /*d2d_mbusflag*/\
++ MUX_VAL(CP(D2D_SBUSFLAG),	(IEN  | PTD | DIS | M0)) /*d2d_sbusflag*/\
++ MUX_VAL(CP(SDRC_CKE0),		(IDIS | PTU | EN  | M0)) /*sdrc_cke0*/\
++ MUX_VAL(CP(SDRC_CKE1),		(IDIS | PTD | DIS | M7)) /*sdrc_cke1*/
++#endif
+diff --git a/cpu/arm_cortexa8/omap3/board.c b/cpu/arm_cortexa8/omap3/board.c
+index b8bd052..7259d16 100644
+--- a/cpu/arm_cortexa8/omap3/board.c
++++ b/cpu/arm_cortexa8/omap3/board.c
+@@ -281,11 +281,12 @@ int dram_init(void)
+ 	 * where it can be started.  Early init code will init
+ 	 * memory on CS0.
+ 	 */
++#if 0
+ 	if ((sysinfo.mtype == DDR_COMBO) || (sysinfo.mtype == DDR_STACKED)) {
+ 		do_sdrc_init(CS1, NOT_EARLY);
+ 		make_cs1_contiguous();
+ 	}
+-
++#endif
+ 	size0 = get_sdr_cs_size(CS0);
+ 	size1 = get_sdr_cs_size(CS1);
+ 
+diff --git a/include/configs/omap3_igep0020b.h b/include/configs/omap3_igep0020b.h
+new file mode 100644
+index 0000000..d89fc82
+--- /dev/null
++++ b/include/configs/omap3_igep0020b.h
+@@ -0,0 +1,282 @@
++/*
++ * Configuration settings for the IGEP v2.x series rev. B board.
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++#include <asm/sizes.h>
++
++/*
++ * High Level Configuration Options
++ */
++#define CONFIG_ARMCORTEXA8	1	/* This is an ARM V7 CPU core */
++#define CONFIG_OMAP		1	/* in a TI OMAP core */
++#define CONFIG_OMAP34XX		1	/* which is a 34XX */
++#define CONFIG_OMAP3430		1	/* which is in a 3430 */
++#define CONFIG_OMAP3_IGEP0020	1	/* working with IGEP0020 */
++
++#include <asm/arch/cpu.h>		/* get chip and board defs */
++#include <asm/arch/omap3.h>
++
++/*
++ * Display CPU and Board information
++ */
++#define CONFIG_DISPLAY_CPUINFO		1
++#define CONFIG_DISPLAY_BOARDINFO	1
++
++/* Clock Defines */
++#define V_OSCK			26000000	/* Clock output from T2 */
++#define V_SCLK			(V_OSCK >> 1)
++
++#undef CONFIG_USE_IRQ				/* no support for IRQs */
++#define CONFIG_MISC_INIT_R
++
++#define CONFIG_CMDLINE_TAG		1	/* enable passing of ATAGs */
++#define CONFIG_SETUP_MEMORY_TAGS	1
++#define CONFIG_INITRD_TAG		1
++#define CONFIG_REVISION_TAG		1
++
++/*
++ * Size of malloc() pool
++ */
++#define CONFIG_ENV_SIZE			SZ_128K	/* Total Size Environment */
++						/* Sector */
++#define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + SZ_128K)
++#define CONFIG_SYS_GBL_DATA_SIZE	128	/* bytes reserved for */
++						/* initial data */
++
++/*
++ * Hardware drivers
++ */
++
++/*
++ * NS16550 Configuration
++ */
++#define V_NS16550_CLK			48000000	/* 48MHz (APLL96/2) */
++
++#define CONFIG_SYS_NS16550
++#define CONFIG_SYS_NS16550_SERIAL
++#define CONFIG_SYS_NS16550_REG_SIZE	(-4)
++#define CONFIG_SYS_NS16550_CLK		V_NS16550_CLK
++
++/*
++ * select serial console configuration
++ */
++#define CONFIG_CONS_INDEX		3
++#define CONFIG_SYS_NS16550_COM3		OMAP34XX_UART3
++#define CONFIG_SERIAL3			3
++
++/* allow to overwrite serial and ethaddr */
++#define CONFIG_ENV_OVERWRITE
++#define CONFIG_BAUDRATE			115200
++#define CONFIG_SYS_BAUDRATE_TABLE	{4800, 9600, 19200, 38400, 57600,115200}
++#define CONFIG_MMC			1
++#define CONFIG_OMAP3_MMC		1
++#define CONFIG_DOS_PARTITION		1
++
++/* commands to include */
++#include <config_cmd_default.h>
++
++#define CONFIG_CMD_EXT2		/* EXT2 Support			*/
++#define CONFIG_CMD_FAT		/* FAT support			*/
++#define CONFIG_CMD_JFFS2	/* JFFS2 Support		*/
++
++#define CONFIG_CMD_I2C		/* I2C serial bus support	*/
++#define CONFIG_CMD_MMC		/* MMC support			*/
++/* (disabled) #define CONFIG_CMD_NAND	   NAND support			*/
++#define CONFIG_CMD_ONENAND	/* ONENAND support		*/
++#define CONFIG_CMD_NET		/* bootp, tftpboot, rarpboot	*/
++#define CONFIG_CMD_DHCP
++#define CONFIG_CMD_PING
++
++#undef CONFIG_CMD_FLASH		/* flinfo, erase, protect	*/
++#undef CONFIG_CMD_FPGA		/* FPGA configuration Support	*/
++#undef CONFIG_CMD_IMI		/* iminfo			*/
++#undef CONFIG_CMD_IMLS		/* List all found images	*/
++#undef CONFIG_CMD_NFS		/* NFS support			*/
++
++#define CONFIG_SYS_NO_FLASH
++#define CONFIG_SYS_I2C_SPEED		100000
++#define CONFIG_SYS_I2C_SLAVE		1
++#define CONFIG_SYS_I2C_BUS		0
++#define CONFIG_SYS_I2C_BUS_SELECT	1
++#define CONFIG_DRIVER_OMAP34XX_I2C	1
++
++/*
++ * TWL4030
++ */
++#define CONFIG_TWL4030_POWER		1
++#define CONFIG_TWL4030_LED		1
++
++/*
++ * Board NAND Info.
++ */
++#if defined(CONFIG_CMD_NAND)
++#define CONFIG_NAND_OMAP_GPMC
++#endif
++#define CONFIG_SYS_NAND_ADDR		NAND_BASE	/* physical address */
++							/* to access nand */
++#define CONFIG_SYS_NAND_BASE		NAND_BASE	/* physical address */
++							/* to access nand at */
++							/* CS0 */
++#define GPMC_NAND_ECC_LP_x16_LAYOUT	1
++
++#define CONFIG_SYS_MAX_NAND_DEVICE	1		/* Max number of NAND */
++							/* devices */
++#define CONFIG_SYS_64BIT_VSPRINTF		/* needed for nand_util.c */
++
++#define CONFIG_JFFS2_NAND
++/* nand device jffs2 lives on */
++#define CONFIG_JFFS2_DEV		"nand0"
++/* start of jffs2 partition */
++#define CONFIG_JFFS2_PART_OFFSET	0x680000
++#define CONFIG_JFFS2_PART_SIZE		0xf980000	/* size of jffs2 */
++							/* partition */
++
++/* Environment information */
++#define CONFIG_BOOTDELAY		3
++
++#define CONFIG_EXTRA_ENV_SETTINGS "\0"
++
++#define CONFIG_BOOTCOMMAND	"mmc init 0 ; fatload mmc 0 0x80000000 setup.ini ; source \0"
++
++#define CONFIG_AUTO_COMPLETE		1
++
++/*
++ * Miscellaneous configurable options
++ */
++#define V_PROMPT			"U-Boot # "
++
++#define CONFIG_SYS_LONGHELP		/* undef to save memory */
++#define CONFIG_SYS_HUSH_PARSER		/* use "hush" command parser */
++#define CONFIG_SYS_PROMPT_HUSH_PS2	"> "
++#define CONFIG_SYS_PROMPT		V_PROMPT
++#define CONFIG_SYS_CBSIZE		256	/* Console I/O Buffer Size */
++/* Print Buffer Size */
++#define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + \
++					sizeof(CONFIG_SYS_PROMPT) + 16)
++#define CONFIG_SYS_MAXARGS		16	/* max number of command args */
++/* Boot Argument Buffer Size */
++#define CONFIG_SYS_BARGSIZE		(CONFIG_SYS_CBSIZE)
++
++#define CONFIG_SYS_MEMTEST_START	(OMAP34XX_SDRC_CS0)	/* memtest */
++								/* works on */
++#define CONFIG_SYS_MEMTEST_END		(OMAP34XX_SDRC_CS0 + \
++					0x01F00000) /* 31MB */
++
++#define CONFIG_SYS_LOAD_ADDR		(OMAP34XX_SDRC_CS0)	/* default */
++							/* load address */
++
++/*
++ * OMAP3 has 12 GP timers, they can be driven by the system clock
++ * (12/13/16.8/19.2/38.4MHz) or by 32KHz clock. We use 13MHz (V_SCLK).
++ * This rate is divided by a local divisor.
++ */
++#define CONFIG_SYS_TIMERBASE		(OMAP34XX_GPT2)
++#define CONFIG_SYS_PTV			2       /* Divisor: 2^(PTV+1) => 8 */
++#define CONFIG_SYS_HZ			1000
++
++/*-----------------------------------------------------------------------
++ * Stack sizes
++ *
++ * The stack sizes are set up in start.S using the settings below
++ */
++#define CONFIG_STACKSIZE	SZ_128K	/* regular stack */
++#ifdef CONFIG_USE_IRQ
++#define CONFIG_STACKSIZE_IRQ	SZ_4K	/* IRQ stack */
++#define CONFIG_STACKSIZE_FIQ	SZ_4K	/* FIQ stack */
++#endif
++
++/*-----------------------------------------------------------------------
++ * Physical Memory Map
++ */
++#define CONFIG_NR_DRAM_BANKS	2	/* CS1 may or may not be populated */
++#define PHYS_SDRAM_1		OMAP34XX_SDRC_CS0
++#define PHYS_SDRAM_1_SIZE	SZ_32M	/* at least 32 meg */
++#define PHYS_SDRAM_2		OMAP34XX_SDRC_CS1
++
++/* SDRAM Bank Allocation method */
++#define SDRC_R_B_C		1
++
++/*-----------------------------------------------------------------------
++ * FLASH and environment organization
++ */
++
++/* **** PISMO SUPPORT *** */
++
++/* Configure the PISMO */
++#define PISMO1_NAND_SIZE		GPMC_SIZE_128M
++#define PISMO1_ONEN_SIZE		GPMC_SIZE_128M
++
++#define CONFIG_SYS_MAX_FLASH_SECT	520	/* max number of sectors on */
++						/* one chip */
++#define CONFIG_SYS_MAX_FLASH_BANKS	2	/* max number of flash banks */
++#define CONFIG_SYS_MONITOR_LEN		SZ_256K	/* Reserve 2 sectors */
++
++#define CONFIG_SYS_FLASH_BASE		boot_flash_base
++
++/* Monitor at start of flash */
++#define CONFIG_SYS_MONITOR_BASE		CONFIG_SYS_FLASH_BASE
++#define CONFIG_SYS_ONENAND_BASE		ONENAND_MAP
++
++#define CONFIG_ENV_IS_IN_ONENAND	1
++#define ONENAND_ENV_OFFSET		0x240000 /* environment starts here */
++#define SMNAND_ENV_OFFSET		0x240000 /* environment starts here */
++
++#define CONFIG_SYS_ENV_SECT_SIZE	boot_flash_sec
++#define CONFIG_ENV_OFFSET		boot_flash_off
++#define CONFIG_ENV_ADDR			SMNAND_ENV_OFFSET
++
++/*-----------------------------------------------------------------------
++ * CFI FLASH driver setup
++ */
++/* timeout values are in ticks */
++#define CONFIG_SYS_FLASH_ERASE_TOUT	(100 * CONFIG_SYS_HZ)
++#define CONFIG_SYS_FLASH_WRITE_TOUT	(100 * CONFIG_SYS_HZ)
++
++/* Flash banks JFFS2 should use */
++#define CONFIG_SYS_MAX_MTD_BANKS	(CONFIG_SYS_MAX_FLASH_BANKS + \
++					CONFIG_SYS_MAX_NAND_DEVICE)
++#define CONFIG_SYS_JFFS2_MEM_NAND
++/* use flash_info[2] */
++#define CONFIG_SYS_JFFS2_FIRST_BANK	CONFIG_SYS_MAX_FLASH_BANKS
++#define CONFIG_SYS_JFFS2_NUM_BANKS	1
++
++/*----------------------------------------------------------------------------
++ * SMSC911x Ethernet
++ */
++#if defined(CONFIG_CMD_NET)
++
++#define CONFIG_NET_MULTI
++#define CONFIG_SMC911X
++#define CONFIG_SMC911X_32_BIT
++#define CONFIG_SMC911X_BASE	0x2C000000
++
++
++#endif /* (CONFIG_CMD_NET) */
++
++#ifndef __ASSEMBLY__
++extern struct gpmc *gpmc_cfg;
++extern unsigned int boot_flash_base;
++extern volatile unsigned int boot_flash_env_addr;
++extern unsigned int boot_flash_off;
++extern unsigned int boot_flash_sec;
++extern unsigned int boot_flash_type;
++#endif
++
++#endif /* __CONFIG_H */
+-- 
+1.5.4.3
+
diff --git a/recipes/u-boot/u-boot-2009.08/igep0020/update-mach-types.patch b/recipes/u-boot/u-boot-2009.08/igep0020/update-mach-types.patch
new file mode 100644
index 0000000..ff3ef8a
--- /dev/null
+++ b/recipes/u-boot/u-boot-2009.08/igep0020/update-mach-types.patch
@@ -0,0 +1,1206 @@
+From e1d07fcb1eaafadf79b75804057529ef5f246f5b Mon Sep 17 00:00:00 2001
+From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
+Date: Wed, 2 Sep 2009 13:32:11 +0200
+Subject: [PATCH 1/6] mach-types.h: Backport from kernel, add mach type for IGEP0010 and IGEP0020 boards
+
+
+Signed-off-by: Enric Balletbo i Serra <eballetbo@iseebcn.com>
+---
+ include/asm-arm/mach-types.h | 1127 +++++++++++++++++++++++++++++++++++++++++-
+ 1 files changed, 1116 insertions(+), 11 deletions(-)
+
+diff --git a/include/asm-arm/mach-types.h b/include/asm-arm/mach-types.h
+index 5293d67..89ffd49 100644
+--- a/include/asm-arm/mach-types.h
++++ b/include/asm-arm/mach-types.h
+@@ -1451,7 +1451,7 @@ extern unsigned int __machine_arch_type;
+ #define MACH_TYPE_H6044                1458
+ #define MACH_TYPE_APP                  1459
+ #define MACH_TYPE_TCT_HAMMER           1460
+-#define MACH_TYPE_HERMES               1461
++#define MACH_TYPE_HERALD               1461
+ #define MACH_TYPE_ARTEMIS              1462
+ #define MACH_TYPE_HTCTITAN             1463
+ #define MACH_TYPE_QRANIUM              1464
+@@ -1765,7 +1765,7 @@ extern unsigned int __machine_arch_type;
+ #define MACH_TYPE_MI424WR              1778
+ #define MACH_TYPE_AXS_ULTRAX           1779
+ #define MACH_TYPE_AT572D940DEB         1780
+-#define MACH_TYPE_DAVINCI_DA8XX_EVM    1781
++#define MACH_TYPE_DAVINCI_DA830_EVM    1781
+ #define MACH_TYPE_EP9302               1782
+ #define MACH_TYPE_AT572D940HFEB        1783
+ #define MACH_TYPE_CYBOOK3              1784
+@@ -2241,6 +2241,91 @@ extern unsigned int __machine_arch_type;
+ #define MACH_TYPE_OMAP3_WL_FF          2258
+ #define MACH_TYPE_SIMCOM               2259
+ #define MACH_TYPE_MCWEBIO              2260
++#define MACH_TYPE_OMAP3_PHRAZER        2261
++#define MACH_TYPE_DARWIN               2262
++#define MACH_TYPE_ORATISCOMU           2263
++#define MACH_TYPE_RTSBC20              2264
++#define MACH_TYPE_I780                 2265
++#define MACH_TYPE_GEMINI324            2266
++#define MACH_TYPE_ORATISLAN            2267
++#define MACH_TYPE_ORATISALOG           2268
++#define MACH_TYPE_ORATISMADI           2269
++#define MACH_TYPE_ORATISOT16           2270
++#define MACH_TYPE_ORATISDESK           2271
++#define MACH_TYPE_V2P_CA9              2272
++#define MACH_TYPE_SINTEXO              2273
++#define MACH_TYPE_CM3389               2274
++#define MACH_TYPE_OMAP3_CIO            2275
++#define MACH_TYPE_SGH_I900             2276
++#define MACH_TYPE_BST100               2277
++#define MACH_TYPE_PASSION              2278
++#define MACH_TYPE_INDESIGN_AT91SAM     2279
++#define MACH_TYPE_C4_BADGER            2280
++#define MACH_TYPE_C4_VIPER             2281
++#define MACH_TYPE_D2NET                2282
++#define MACH_TYPE_BIGDISK              2283
++#define MACH_TYPE_NOTALVISION          2284
++#define MACH_TYPE_OMAP3_KBOC           2285
++#define MACH_TYPE_CYCLONE              2286
++#define MACH_TYPE_NINJA                2287
++#define MACH_TYPE_AT91SAM9G20EK_2MMC   2288
++#define MACH_TYPE_BCMRING              2289
++#define MACH_TYPE_RESOL_DL2            2290
++#define MACH_TYPE_IFOSW                2291
++#define MACH_TYPE_HTCRHODIUM           2292
++#define MACH_TYPE_HTCTOPAZ             2293
++#define MACH_TYPE_MATRIX504            2294
++#define MACH_TYPE_MRFSA                2295
++#define MACH_TYPE_SC_P270              2296
++#define MACH_TYPE_ATLAS5_EVB           2297
++#define MACH_TYPE_PELCO_LOBOX          2298
++#define MACH_TYPE_DILAX_PCU200         2299
++#define MACH_TYPE_LEONARDO             2300
++#define MACH_TYPE_ZORAN_APPROACH7      2301
++#define MACH_TYPE_DP6XX                2302
++#define MACH_TYPE_BCM2153_VESPER       2303
++#define MACH_TYPE_MAHIMAHI             2304
++#define MACH_TYPE_CLICKC               2305
++#define MACH_TYPE_ZB_GATEWAY           2306
++#define MACH_TYPE_TAZCARD              2307
++#define MACH_TYPE_TAZDEV               2308
++#define MACH_TYPE_ANNAX_CB_ARM         2309
++#define MACH_TYPE_ANNAX_DM3            2310
++#define MACH_TYPE_CEREBRIC             2311
++#define MACH_TYPE_ORCA                 2312
++#define MACH_TYPE_PC9260               2313
++#define MACH_TYPE_EMS285A              2314
++#define MACH_TYPE_GEC2410              2315
++#define MACH_TYPE_GEC2440              2316
++#define MACH_TYPE_ARCH_MW903           2317
++#define MACH_TYPE_MW2440               2318
++#define MACH_TYPE_ECAC2378             2319
++#define MACH_TYPE_TAZKIOSK             2320
++#define MACH_TYPE_WHITERABBIT_MCH      2321
++#define MACH_TYPE_SBOX9263             2322
++#define MACH_TYPE_OREO                 2323
++#define MACH_TYPE_SMDK6442             2324
++#define MACH_TYPE_OPENRD_BASE          2325
++#define MACH_TYPE_INCREDIBLE           2326
++#define MACH_TYPE_INCREDIBLEC          2327
++#define MACH_TYPE_HEROCT               2328
++#define MACH_TYPE_MMNET1000            2329
++#define MACH_TYPE_DEVKIT8000           2330
++#define MACH_TYPE_DEVKIT9000           2331
++#define MACH_TYPE_MX31TXTR             2332
++#define MACH_TYPE_U380                 2333
++#define MACH_TYPE_HUALU_BOARD          2334
++#define MACH_TYPE_NPCMX50              2335
++#define MACH_TYPE_MX51_LANGE51         2336
++#define MACH_TYPE_MX51_LANGE52         2337
++#define MACH_TYPE_RIOM                 2338
++#define MACH_TYPE_COMCAS               2339
++#define MACH_TYPE_WSI_MX27             2340
++#define MACH_TYPE_CM_T35               2341
++#define MACH_TYPE_NET2BIG              2342
++#define MACH_TYPE_MOTOROLA_A1600       2343
++#define MACH_TYPE_IGEP0020             2344
++#define MACH_TYPE_IGEP0010             2345
+ 
+ #ifdef CONFIG_ARCH_EBSA110
+ # ifdef machine_arch_type
+@@ -19510,14 +19595,14 @@ extern unsigned int __machine_arch_type;
+ # define machine_is_tct_hammer()	(0)
+ #endif
+ 
+-#ifdef CONFIG_MACH_HERMES
++#ifdef CONFIG_MACH_HERALD
+ # ifdef machine_arch_type
+ #  undef machine_arch_type
+ #  define machine_arch_type	__machine_arch_type
+ # else
+-#  define machine_arch_type	MACH_TYPE_HERMES
++#  define machine_arch_type	MACH_TYPE_HERALD
+ # endif
+-# define machine_is_herald()	(machine_arch_type == MACH_TYPE_HERMES)
++# define machine_is_herald()	(machine_arch_type == MACH_TYPE_HERALD)
+ #else
+ # define machine_is_herald()	(0)
+ #endif
+@@ -23278,16 +23363,16 @@ extern unsigned int __machine_arch_type;
+ # define machine_is_at572d940deb()	(0)
+ #endif
+ 
+-#ifdef CONFIG_MACH_DAVINCI_DA8XX_EVM
++#ifdef CONFIG_MACH_DAVINCI_DA830_EVM
+ # ifdef machine_arch_type
+ #  undef machine_arch_type
+ #  define machine_arch_type	__machine_arch_type
+ # else
+-#  define machine_arch_type	MACH_TYPE_DAVINCI_DA8XX_EVM
++#  define machine_arch_type	MACH_TYPE_DAVINCI_DA830_EVM
+ # endif
+-# define machine_is_davinci_da8xx_evm()	(machine_arch_type == MACH_TYPE_DAVINCI_DA8XX_EVM)
++# define machine_is_davinci_da830_evm()	(machine_arch_type == MACH_TYPE_DAVINCI_DA830_EVM)
+ #else
+-# define machine_is_davinci_da8xx_evm()	(0)
++# define machine_is_davinci_da830_evm()	(0)
+ #endif
+ 
+ #ifdef CONFIG_MACH_EP9302
+@@ -25601,9 +25686,9 @@ extern unsigned int __machine_arch_type;
+ # else
+ #  define machine_arch_type	MACH_TYPE_CPUIMX27
+ # endif
+-# define machine_is_cpuimx27()	(machine_arch_type == MACH_TYPE_CPUIMX27)
++# define machine_is_eukrea_cpuimx27()	(machine_arch_type == MACH_TYPE_CPUIMX27)
+ #else
+-# define machine_is_cpuimx27()	(0)
++# define machine_is_eukrea_cpuimx27()	(0)
+ #endif
+ 
+ #ifdef CONFIG_MACH_CHEFLUX
+@@ -28990,6 +29075,1026 @@ extern unsigned int __machine_arch_type;
+ # define machine_is_mcwebio()	(0)
+ #endif
+ 
++#ifdef CONFIG_MACH_OMAP3_PHRAZER
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP3_PHRAZER
++# endif
++# define machine_is_omap3_phrazer()	(machine_arch_type == MACH_TYPE_OMAP3_PHRAZER)
++#else
++# define machine_is_omap3_phrazer()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DARWIN
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DARWIN
++# endif
++# define machine_is_darwin()	(machine_arch_type == MACH_TYPE_DARWIN)
++#else
++# define machine_is_darwin()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ORATISCOMU
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ORATISCOMU
++# endif
++# define machine_is_oratiscomu()	(machine_arch_type == MACH_TYPE_ORATISCOMU)
++#else
++# define machine_is_oratiscomu()	(0)
++#endif
++
++#ifdef CONFIG_MACH_RTSBC20
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_RTSBC20
++# endif
++# define machine_is_rtsbc20()	(machine_arch_type == MACH_TYPE_RTSBC20)
++#else
++# define machine_is_rtsbc20()	(0)
++#endif
++
++#ifdef CONFIG_MACH_I780
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_I780
++# endif
++# define machine_is_sgh_i780()	(machine_arch_type == MACH_TYPE_I780)
++#else
++# define machine_is_sgh_i780()	(0)
++#endif
++
++#ifdef CONFIG_MACH_GEMINI324
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_GEMINI324
++# endif
++# define machine_is_gemini324()	(machine_arch_type == MACH_TYPE_GEMINI324)
++#else
++# define machine_is_gemini324()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ORATISLAN
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ORATISLAN
++# endif
++# define machine_is_oratislan()	(machine_arch_type == MACH_TYPE_ORATISLAN)
++#else
++# define machine_is_oratislan()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ORATISALOG
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ORATISALOG
++# endif
++# define machine_is_oratisalog()	(machine_arch_type == MACH_TYPE_ORATISALOG)
++#else
++# define machine_is_oratisalog()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ORATISMADI
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ORATISMADI
++# endif
++# define machine_is_oratismadi()	(machine_arch_type == MACH_TYPE_ORATISMADI)
++#else
++# define machine_is_oratismadi()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ORATISOT16
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ORATISOT16
++# endif
++# define machine_is_oratisot16()	(machine_arch_type == MACH_TYPE_ORATISOT16)
++#else
++# define machine_is_oratisot16()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ORATISDESK
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ORATISDESK
++# endif
++# define machine_is_oratisdesk()	(machine_arch_type == MACH_TYPE_ORATISDESK)
++#else
++# define machine_is_oratisdesk()	(0)
++#endif
++
++#ifdef CONFIG_MACH_V2P_CA9
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_V2P_CA9
++# endif
++# define machine_is_v2_ca9()	(machine_arch_type == MACH_TYPE_V2P_CA9)
++#else
++# define machine_is_v2_ca9()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SINTEXO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SINTEXO
++# endif
++# define machine_is_sintexo()	(machine_arch_type == MACH_TYPE_SINTEXO)
++#else
++# define machine_is_sintexo()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CM3389
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CM3389
++# endif
++# define machine_is_cm3389()	(machine_arch_type == MACH_TYPE_CM3389)
++#else
++# define machine_is_cm3389()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAP3_CIO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP3_CIO
++# endif
++# define machine_is_omap3_cio()	(machine_arch_type == MACH_TYPE_OMAP3_CIO)
++#else
++# define machine_is_omap3_cio()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SGH_I900
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SGH_I900
++# endif
++# define machine_is_sgh_i900()	(machine_arch_type == MACH_TYPE_SGH_I900)
++#else
++# define machine_is_sgh_i900()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BST100
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BST100
++# endif
++# define machine_is_bst100()	(machine_arch_type == MACH_TYPE_BST100)
++#else
++# define machine_is_bst100()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PASSION
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PASSION
++# endif
++# define machine_is_passion()	(machine_arch_type == MACH_TYPE_PASSION)
++#else
++# define machine_is_passion()	(0)
++#endif
++
++#ifdef CONFIG_MACH_INDESIGN_AT91SAM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_INDESIGN_AT91SAM
++# endif
++# define machine_is_indesign_at91sam()	(machine_arch_type == MACH_TYPE_INDESIGN_AT91SAM)
++#else
++# define machine_is_indesign_at91sam()	(0)
++#endif
++
++#ifdef CONFIG_MACH_C4_BADGER
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_C4_BADGER
++# endif
++# define machine_is_c4_badger()	(machine_arch_type == MACH_TYPE_C4_BADGER)
++#else
++# define machine_is_c4_badger()	(0)
++#endif
++
++#ifdef CONFIG_MACH_C4_VIPER
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_C4_VIPER
++# endif
++# define machine_is_c4_viper()	(machine_arch_type == MACH_TYPE_C4_VIPER)
++#else
++# define machine_is_c4_viper()	(0)
++#endif
++
++#ifdef CONFIG_MACH_D2NET
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_D2NET
++# endif
++# define machine_is_d2net()	(machine_arch_type == MACH_TYPE_D2NET)
++#else
++# define machine_is_d2net()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BIGDISK
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BIGDISK
++# endif
++# define machine_is_bigdisk()	(machine_arch_type == MACH_TYPE_BIGDISK)
++#else
++# define machine_is_bigdisk()	(0)
++#endif
++
++#ifdef CONFIG_MACH_NOTALVISION
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_NOTALVISION
++# endif
++# define machine_is_notalvision()	(machine_arch_type == MACH_TYPE_NOTALVISION)
++#else
++# define machine_is_notalvision()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OMAP3_KBOC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OMAP3_KBOC
++# endif
++# define machine_is_omap3_kboc()	(machine_arch_type == MACH_TYPE_OMAP3_KBOC)
++#else
++# define machine_is_omap3_kboc()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CYCLONE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CYCLONE
++# endif
++# define machine_is_cyclone()	(machine_arch_type == MACH_TYPE_CYCLONE)
++#else
++# define machine_is_cyclone()	(0)
++#endif
++
++#ifdef CONFIG_MACH_NINJA
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_NINJA
++# endif
++# define machine_is_ninja()	(machine_arch_type == MACH_TYPE_NINJA)
++#else
++# define machine_is_ninja()	(0)
++#endif
++
++#ifdef CONFIG_MACH_AT91SAM9G20EK_2MMC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_AT91SAM9G20EK_2MMC
++# endif
++# define machine_is_at91sam9g20ek_2mmc()	(machine_arch_type == MACH_TYPE_AT91SAM9G20EK_2MMC)
++#else
++# define machine_is_at91sam9g20ek_2mmc()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BCMRING
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BCMRING
++# endif
++# define machine_is_bcmring()	(machine_arch_type == MACH_TYPE_BCMRING)
++#else
++# define machine_is_bcmring()	(0)
++#endif
++
++#ifdef CONFIG_MACH_RESOL_DL2
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_RESOL_DL2
++# endif
++# define machine_is_resol_dl2()	(machine_arch_type == MACH_TYPE_RESOL_DL2)
++#else
++# define machine_is_resol_dl2()	(0)
++#endif
++
++#ifdef CONFIG_MACH_IFOSW
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_IFOSW
++# endif
++# define machine_is_ifosw()	(machine_arch_type == MACH_TYPE_IFOSW)
++#else
++# define machine_is_ifosw()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HTCRHODIUM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HTCRHODIUM
++# endif
++# define machine_is_htcrhodium()	(machine_arch_type == MACH_TYPE_HTCRHODIUM)
++#else
++# define machine_is_htcrhodium()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HTCTOPAZ
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HTCTOPAZ
++# endif
++# define machine_is_htctopaz()	(machine_arch_type == MACH_TYPE_HTCTOPAZ)
++#else
++# define machine_is_htctopaz()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MATRIX504
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MATRIX504
++# endif
++# define machine_is_matrix504()	(machine_arch_type == MACH_TYPE_MATRIX504)
++#else
++# define machine_is_matrix504()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MRFSA
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MRFSA
++# endif
++# define machine_is_mrfsa()	(machine_arch_type == MACH_TYPE_MRFSA)
++#else
++# define machine_is_mrfsa()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SC_P270
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SC_P270
++# endif
++# define machine_is_sc_p270()	(machine_arch_type == MACH_TYPE_SC_P270)
++#else
++# define machine_is_sc_p270()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ATLAS5_EVB
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ATLAS5_EVB
++# endif
++# define machine_is_atlas5_evb()	(machine_arch_type == MACH_TYPE_ATLAS5_EVB)
++#else
++# define machine_is_atlas5_evb()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PELCO_LOBOX
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PELCO_LOBOX
++# endif
++# define machine_is_pelco_lobox()	(machine_arch_type == MACH_TYPE_PELCO_LOBOX)
++#else
++# define machine_is_pelco_lobox()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DILAX_PCU200
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DILAX_PCU200
++# endif
++# define machine_is_dilax_pcu200()	(machine_arch_type == MACH_TYPE_DILAX_PCU200)
++#else
++# define machine_is_dilax_pcu200()	(0)
++#endif
++
++#ifdef CONFIG_MACH_LEONARDO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_LEONARDO
++# endif
++# define machine_is_leonardo()	(machine_arch_type == MACH_TYPE_LEONARDO)
++#else
++# define machine_is_leonardo()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ZORAN_APPROACH7
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ZORAN_APPROACH7
++# endif
++# define machine_is_zoran_approach7()	(machine_arch_type == MACH_TYPE_ZORAN_APPROACH7)
++#else
++# define machine_is_zoran_approach7()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DP6XX
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DP6XX
++# endif
++# define machine_is_dp6xx()	(machine_arch_type == MACH_TYPE_DP6XX)
++#else
++# define machine_is_dp6xx()	(0)
++#endif
++
++#ifdef CONFIG_MACH_BCM2153_VESPER
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_BCM2153_VESPER
++# endif
++# define machine_is_bcm2153_vesper()	(machine_arch_type == MACH_TYPE_BCM2153_VESPER)
++#else
++# define machine_is_bcm2153_vesper()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MAHIMAHI
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MAHIMAHI
++# endif
++# define machine_is_mahimahi()	(machine_arch_type == MACH_TYPE_MAHIMAHI)
++#else
++# define machine_is_mahimahi()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CLICKC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CLICKC
++# endif
++# define machine_is_clickc()	(machine_arch_type == MACH_TYPE_CLICKC)
++#else
++# define machine_is_clickc()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ZB_GATEWAY
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ZB_GATEWAY
++# endif
++# define machine_is_zb_gateway()	(machine_arch_type == MACH_TYPE_ZB_GATEWAY)
++#else
++# define machine_is_zb_gateway()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TAZCARD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TAZCARD
++# endif
++# define machine_is_tazcard()	(machine_arch_type == MACH_TYPE_TAZCARD)
++#else
++# define machine_is_tazcard()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TAZDEV
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TAZDEV
++# endif
++# define machine_is_tazdev()	(machine_arch_type == MACH_TYPE_TAZDEV)
++#else
++# define machine_is_tazdev()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ANNAX_CB_ARM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ANNAX_CB_ARM
++# endif
++# define machine_is_annax_cb_arm()	(machine_arch_type == MACH_TYPE_ANNAX_CB_ARM)
++#else
++# define machine_is_annax_cb_arm()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ANNAX_DM3
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ANNAX_DM3
++# endif
++# define machine_is_annax_dm3()	(machine_arch_type == MACH_TYPE_ANNAX_DM3)
++#else
++# define machine_is_annax_dm3()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CEREBRIC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CEREBRIC
++# endif
++# define machine_is_cerebric()	(machine_arch_type == MACH_TYPE_CEREBRIC)
++#else
++# define machine_is_cerebric()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ORCA
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ORCA
++# endif
++# define machine_is_orca()	(machine_arch_type == MACH_TYPE_ORCA)
++#else
++# define machine_is_orca()	(0)
++#endif
++
++#ifdef CONFIG_MACH_PC9260
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_PC9260
++# endif
++# define machine_is_pc9260()	(machine_arch_type == MACH_TYPE_PC9260)
++#else
++# define machine_is_pc9260()	(0)
++#endif
++
++#ifdef CONFIG_MACH_EMS285A
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_EMS285A
++# endif
++# define machine_is_ems285a()	(machine_arch_type == MACH_TYPE_EMS285A)
++#else
++# define machine_is_ems285a()	(0)
++#endif
++
++#ifdef CONFIG_MACH_GEC2410
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_GEC2410
++# endif
++# define machine_is_gec2410()	(machine_arch_type == MACH_TYPE_GEC2410)
++#else
++# define machine_is_gec2410()	(0)
++#endif
++
++#ifdef CONFIG_MACH_GEC2440
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_GEC2440
++# endif
++# define machine_is_gec2440()	(machine_arch_type == MACH_TYPE_GEC2440)
++#else
++# define machine_is_gec2440()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ARCH_MW903
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ARCH_MW903
++# endif
++# define machine_is_mw903()	(machine_arch_type == MACH_TYPE_ARCH_MW903)
++#else
++# define machine_is_mw903()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MW2440
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MW2440
++# endif
++# define machine_is_mw2440()	(machine_arch_type == MACH_TYPE_MW2440)
++#else
++# define machine_is_mw2440()	(0)
++#endif
++
++#ifdef CONFIG_MACH_ECAC2378
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_ECAC2378
++# endif
++# define machine_is_ecac2378()	(machine_arch_type == MACH_TYPE_ECAC2378)
++#else
++# define machine_is_ecac2378()	(0)
++#endif
++
++#ifdef CONFIG_MACH_TAZKIOSK
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_TAZKIOSK
++# endif
++# define machine_is_tazkiosk()	(machine_arch_type == MACH_TYPE_TAZKIOSK)
++#else
++# define machine_is_tazkiosk()	(0)
++#endif
++
++#ifdef CONFIG_MACH_WHITERABBIT_MCH
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_WHITERABBIT_MCH
++# endif
++# define machine_is_whiterabbit_mch()	(machine_arch_type == MACH_TYPE_WHITERABBIT_MCH)
++#else
++# define machine_is_whiterabbit_mch()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SBOX9263
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SBOX9263
++# endif
++# define machine_is_sbox9263()	(machine_arch_type == MACH_TYPE_SBOX9263)
++#else
++# define machine_is_sbox9263()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OREO
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OREO
++# endif
++# define machine_is_oreo()	(machine_arch_type == MACH_TYPE_OREO)
++#else
++# define machine_is_oreo()	(0)
++#endif
++
++#ifdef CONFIG_MACH_SMDK6442
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_SMDK6442
++# endif
++# define machine_is_smdk6442()	(machine_arch_type == MACH_TYPE_SMDK6442)
++#else
++# define machine_is_smdk6442()	(0)
++#endif
++
++#ifdef CONFIG_MACH_OPENRD_BASE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_OPENRD_BASE
++# endif
++# define machine_is_openrd_base()	(machine_arch_type == MACH_TYPE_OPENRD_BASE)
++#else
++# define machine_is_openrd_base()	(0)
++#endif
++
++#ifdef CONFIG_MACH_INCREDIBLE
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_INCREDIBLE
++# endif
++# define machine_is_incredible()	(machine_arch_type == MACH_TYPE_INCREDIBLE)
++#else
++# define machine_is_incredible()	(0)
++#endif
++
++#ifdef CONFIG_MACH_INCREDIBLEC
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_INCREDIBLEC
++# endif
++# define machine_is_incrediblec()	(machine_arch_type == MACH_TYPE_INCREDIBLEC)
++#else
++# define machine_is_incrediblec()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HEROCT
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HEROCT
++# endif
++# define machine_is_heroct()	(machine_arch_type == MACH_TYPE_HEROCT)
++#else
++# define machine_is_heroct()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MMNET1000
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MMNET1000
++# endif
++# define machine_is_mmnet1000()	(machine_arch_type == MACH_TYPE_MMNET1000)
++#else
++# define machine_is_mmnet1000()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DEVKIT8000
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DEVKIT8000
++# endif
++# define machine_is_devkit8000()	(machine_arch_type == MACH_TYPE_DEVKIT8000)
++#else
++# define machine_is_devkit8000()	(0)
++#endif
++
++#ifdef CONFIG_MACH_DEVKIT9000
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_DEVKIT9000
++# endif
++# define machine_is_devkit9000()	(machine_arch_type == MACH_TYPE_DEVKIT9000)
++#else
++# define machine_is_devkit9000()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX31TXTR
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX31TXTR
++# endif
++# define machine_is_mx31txtr()	(machine_arch_type == MACH_TYPE_MX31TXTR)
++#else
++# define machine_is_mx31txtr()	(0)
++#endif
++
++#ifdef CONFIG_MACH_U380
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_U380
++# endif
++# define machine_is_u380()	(machine_arch_type == MACH_TYPE_U380)
++#else
++# define machine_is_u380()	(0)
++#endif
++
++#ifdef CONFIG_MACH_HUALU_BOARD
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_HUALU_BOARD
++# endif
++# define machine_is_oamp3_hualu()	(machine_arch_type == MACH_TYPE_HUALU_BOARD)
++#else
++# define machine_is_oamp3_hualu()	(0)
++#endif
++
++#ifdef CONFIG_MACH_NPCMX50
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_NPCMX50
++# endif
++# define machine_is_npcmx50()	(machine_arch_type == MACH_TYPE_NPCMX50)
++#else
++# define machine_is_npcmx50()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX51_LANGE51
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX51_LANGE51
++# endif
++# define machine_is_mx51_lange51()	(machine_arch_type == MACH_TYPE_MX51_LANGE51)
++#else
++# define machine_is_mx51_lange51()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MX51_LANGE52
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MX51_LANGE52
++# endif
++# define machine_is_mx51_lange52()	(machine_arch_type == MACH_TYPE_MX51_LANGE52)
++#else
++# define machine_is_mx51_lange52()	(0)
++#endif
++
++#ifdef CONFIG_MACH_RIOM
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_RIOM
++# endif
++# define machine_is_riom()	(machine_arch_type == MACH_TYPE_RIOM)
++#else
++# define machine_is_riom()	(0)
++#endif
++
++#ifdef CONFIG_MACH_COMCAS
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_COMCAS
++# endif
++# define machine_is_comcas()	(machine_arch_type == MACH_TYPE_COMCAS)
++#else
++# define machine_is_comcas()	(0)
++#endif
++
++#ifdef CONFIG_MACH_WSI_MX27
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_WSI_MX27
++# endif
++# define machine_is_wsi_mx27()	(machine_arch_type == MACH_TYPE_WSI_MX27)
++#else
++# define machine_is_wsi_mx27()	(0)
++#endif
++
++#ifdef CONFIG_MACH_CM_T35
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_CM_T35
++# endif
++# define machine_is_cm_t35()	(machine_arch_type == MACH_TYPE_CM_T35)
++#else
++# define machine_is_cm_t35()	(0)
++#endif
++
++#ifdef CONFIG_MACH_NET2BIG
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_NET2BIG
++# endif
++# define machine_is_net2big()	(machine_arch_type == MACH_TYPE_NET2BIG)
++#else
++# define machine_is_net2big()	(0)
++#endif
++
++#ifdef CONFIG_MACH_MOTOROLA_A1600
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_MOTOROLA_A1600
++# endif
++# define machine_is_motorola_a1600()	(machine_arch_type == MACH_TYPE_MOTOROLA_A1600)
++#else
++# define machine_is_motorola_a1600()	(0)
++#endif
++
++#ifdef CONFIG_MACH_IGEP0020
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_IGEP0020
++# endif
++# define machine_is_igep0020()	(machine_arch_type == MACH_TYPE_IGEP0020)
++#else
++# define machine_is_igep0020()	(0)
++#endif
++
++#ifdef CONFIG_MACH_IGEP0010
++# ifdef machine_arch_type
++#  undef machine_arch_type
++#  define machine_arch_type	__machine_arch_type
++# else
++#  define machine_arch_type	MACH_TYPE_IGEP0010
++# endif
++# define machine_is_igep0010()	(machine_arch_type == MACH_TYPE_IGEP0010)
++#else
++# define machine_is_igep0010()	(0)
++#endif
++
+ /*
+  * These have not yet been registered
+  */
+-- 
+1.5.4.3
+
diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_2009.08.bb
index d0e387c..b7f7851 100644
--- a/recipes/u-boot/u-boot_2009.08.bb
+++ b/recipes/u-boot/u-boot_2009.08.bb
@@ -1,11 +1,17 @@
-PR = "r0"
+PR = "r1"
 require u-boot.inc
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_at91sam9g20ek = "1"
+DEFAULT_PREFERENCE_igep0020 = "1"
 
 SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
 
+SRC_URI_append_igep0020 = " \
+	file://update-mach-types.patch;patch=1 \
+	file://add-board-support-for-IGEP-v2-series-rev-B.patch;patch=1 \
+"
+
 TARGET_LDFLAGS = ""
 
 inherit base
-- 
1.5.4.3



