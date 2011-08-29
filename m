Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Qy1DU-0007vx-D8
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Aug 2011 14:45:28 +0200
Received: by fxg11 with SMTP id 11so4525333fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2011 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YidkMOouQ4+xIRhMzL4wiDQvpAZROZitb0WcFCPg2nE=;
	b=hjSemJz7wfB62QEe3MwPaF8y3WEzcNE8iJRu8ODOPjO5i3/oI/p8bPwMG7B8vij5XI
	xZ0ZA2FpFPSwsd9Mp8lO721bvylKGyWd5c1zAeeLkgEtgRPHC7cN43tbowcEvVqJ+hBt
	ZaQ9BEcTeMXturHvjwv0E4LhcZ6RvmM1OQBFY=
Received: by 10.223.29.76 with SMTP id p12mr7106954fac.51.1314621636573;
	Mon, 29 Aug 2011 05:40:36 -0700 (PDT)
Received: from localhost.localdomain (mx2.promwad.com [195.222.87.218])
	by mx.google.com with ESMTPS id c7sm3734070fac.12.2011.08.29.05.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 05:40:35 -0700 (PDT)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.76)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Qy18j-0006yd-1n; Mon, 29 Aug 2011 15:40:33 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Aug 2011 15:40:20 +0300
Message-Id: <1314621621-26512-3-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
References: <1314621621-26512-1-git-send-email-yauhen.kharuzhy@promwad.com>
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
Subject: [PATCH 2/3] Add U-Boot patches and recipe for mycable's Jade Evaluation Board
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
X-List-Received-Date: Mon, 29 Aug 2011 12:45:29 -0000

Add U-Boot patches from XXSvideo project[1] and create recipe for
Jade Evaluation Board[2] support.

1. http://sourceforge.net/projects/xxsvideo/
2. http://www.fujitsu.com/emea/services/microelectronics/gdc/evalbds/jade-evalboard.html

Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
---
 .../u-boot-jade-1.3.0/01_diff-mycable-all.patch    | 2447 ++++++++++++++++++++
 .../02_diff-mycable-board-xxsterminal.patch        |  811 +++++++
 .../03_diff-mycable-board-jadeevalkit.patch        |  812 +++++++
 .../04_diff-mycable-board-xxsnet.patch             | 1216 ++++++++++
 .../05_diff-mycable-board-jadedevalkit.patch       |  985 ++++++++
 .../06_diff-jadedevalkit-makefile.patch            |   24 +
 .../07_0001-ARM-Don-t-inline-weak-symbols.patch    |   58 +
 ..._0001-CPU-arm926ejs-Set-GCC-arch-properly.patch |   26 +
 recipes/u-boot/u-boot-jade_1.3.0.bb                |   26 +
 9 files changed, 6405 insertions(+), 0 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/01_diff-mycable-all.patch
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/02_diff-mycable-board-xxsterminal.patch
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/03_diff-mycable-board-jadeevalkit.patch
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/04_diff-mycable-board-xxsnet.patch
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/05_diff-mycable-board-jadedevalkit.patch
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/06_diff-jadedevalkit-makefile.patch
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/07_0001-ARM-Don-t-inline-weak-symbols.patch
 create mode 100644 recipes/u-boot/u-boot-jade-1.3.0/08_0001-CPU-arm926ejs-Set-GCC-arch-properly.patch
 create mode 100644 recipes/u-boot/u-boot-jade_1.3.0.bb

diff --git a/recipes/u-boot/u-boot-jade-1.3.0/01_diff-mycable-all.patch b/recipes/u-boot/u-boot-jade-1.3.0/01_diff-mycable-all.patch
new file mode 100644
index 0000000..eb76786
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/01_diff-mycable-all.patch
@@ -0,0 +1,2447 @@
+--- u-boot-1.3.0/cpu/arm926ejs/jade/Makefile	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/cpu/arm926ejs/jade/Makefile	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,47 @@
++#
++# (C) Copyright 2000-2006
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
++LIB	= $(obj)lib$(SOC).a
++
++COBJS	= timer.o
++SOBJS	=
++
++SRCS	:= $(START:.o=.S) $(SOBJS:.o=.S) $(COBJS:.o=.c)
++OBJS	:= $(addprefix $(obj),$(COBJS) $(SOBJS))
++START	:= $(addprefix $(obj),$(START))
++
++all:	$(obj).depend $(LIB)
++
++$(LIB):	$(OBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS)
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
++#########################################################################
+--- u-boot-1.3.0/cpu/arm926ejs/jade/timer.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/cpu/arm926ejs/jade/timer.c	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,180 @@
++/*
++ * (C) Copyright 2003
++ * Texas Instruments <www.ti.com>
++ *
++ * (C) Copyright 2002
++ * Sysgo Real-Time Solutions, GmbH <www.elinos.com>
++ * Marius Groeger <mgroeger@sysgo.de>
++ *
++ * (C) Copyright 2002
++ * Sysgo Real-Time Solutions, GmbH <www.elinos.com>
++ * Alex Zuepke <azu@sysgo.de>
++ *
++ * (C) Copyright 2002-2004
++ * Gary Jennejohn, DENX Software Engineering, <gj@denx.de>
++ *
++ * (C) Copyright 2004
++ * Philippe Robin, ARM Ltd. <philippe.robin@arm.com>
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
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#include <common.h>
++#include <arm926ejs.h>
++
++#define TIMER_LOAD_VAL 0xffffffff
++
++/* macro to read the 32 bit timer */
++#define READ_TIMER (*(volatile ulong *)(CFG_TIMERBASE+4))
++
++static ulong timestamp;
++static ulong lastdec;
++
++/* nothing really to do with interrupts, just starts up a counter. */
++int timer_init (void)
++{
++	*(volatile ulong *)(CFG_TIMERBASE + 0) = TIMER_LOAD_VAL;	/* TimerLoad */
++	*(volatile ulong *)(CFG_TIMERBASE + 4) = TIMER_LOAD_VAL;	/* TimerValue */
++	*(volatile ulong *)(CFG_TIMERBASE + 8) = 0x86; /*org: 0x8C SD:  enable timer, divide by 16 32bit*/
++
++	/* init the timestamp and lastdec value */
++	reset_timer_masked();
++
++	return 0;
++}
++
++/*
++ * timer without interrupts
++ */
++
++void reset_timer (void)
++{
++	reset_timer_masked ();
++}
++
++ulong get_timer (ulong base)
++{
++	return get_timer_masked () - base;
++}
++
++void set_timer (ulong t)
++{
++	timestamp = t;
++}
++
++/* delay x useconds AND perserve advance timstamp value */
++void udelay (unsigned long usec)
++{
++	ulong tmo, tmp, timer_masked;
++
++	if(usec >= 1000){		/* if "big" number, spread normalization to seconds */
++		tmo = usec / 1000;	/* start to normalize for usec to ticks per sec */
++		tmo *= CFG_HZ;		/* find number of "ticks" to wait to achieve target */
++		tmo /= 1000;		/* finish normalize. */
++	}else{				/* else small number, don't kill it prior to HZ multiply */
++		tmo = usec * CFG_HZ;
++		tmo /= (1000*1000);
++	}
++
++	tmp = get_timer (0);		/* get current timestamp */
++	if( (tmo + tmp + 1) < tmp )	/* if setting this fordward will roll time stamp */
++		reset_timer_masked ();	/* reset "advancing" timestamp to 0, set lastdec value */
++	else
++		tmo += tmp;		/* else, set advancing stamp wake up time */
++
++
++	do{
++		timer_masked = get_timer_masked();
++	}while (timer_masked < tmo);
++
++	while (get_timer_masked () < tmo)/* loop till event */
++		/*NOP*/;
++}
++
++void reset_timer_masked (void)
++{
++	/* reset time */
++	lastdec = READ_TIMER;  /* capure current decrementer value time */
++	timestamp = 0;	       /* start "advancing" time stamp from 0 */
++}
++
++ulong get_timer_masked (void)
++{
++	ulong now = READ_TIMER;		/* current tick value */
++
++	if (lastdec >= now) {		/* normal mode (non roll) */
++		/* normal mode */
++		timestamp += lastdec - now; /* move stamp fordward with absoulte diff ticks */
++	} else {			/* we have overflow of the count down timer */
++		/* nts = ts + ld + (TLV - now)
++		 * ts=old stamp, ld=time that passed before passing through -1
++		 * (TLV-now) amount of time after passing though -1
++		 * nts = new "advancing time stamp"...it could also roll and cause problems.
++		 */
++		timestamp += lastdec + TIMER_LOAD_VAL - now;
++	}
++	lastdec = now;
++
++	return timestamp;
++}
++
++/* waits specified delay value and resets timestamp */
++void udelay_masked (unsigned long usec)
++{
++	ulong tmo;
++	ulong endtime;
++	signed long diff;
++
++	if (usec >= 1000) {		/* if "big" number, spread normalization to seconds */
++		tmo = usec / 1000;	/* start to normalize for usec to ticks per sec */
++		tmo *= CFG_HZ;		/* find number of "ticks" to wait to achieve target */
++		tmo /= 1000;		/* finish normalize. */
++	} else {			/* else small number, don't kill it prior to HZ multiply */
++		tmo = usec * CFG_HZ;
++		tmo /= (1000*1000);
++	}
++
++	endtime = get_timer_masked () + tmo;
++
++	do {
++		ulong now = get_timer_masked ();
++		diff = endtime - now;
++	} while (diff >= 0);
++}
++
++/*
++ * This function is derived from PowerPC code (read timebase as long long).
++ * On ARM it just returns the timer value.
++ */
++unsigned long long get_ticks(void)
++{
++	return get_timer(0);
++}
++
++/*
++ * This function is derived from PowerPC code (timebase clock frequency).
++ * On ARM it returns the number of timer ticks per second.
++ */
++ulong get_tbclk (void)
++{
++	ulong tbclk;
++
++	tbclk = CFG_HZ;
++	return tbclk;
++}
+--- u-boot-1.3.0/cpu/mips/config.mk	2009-02-26 15:34:27.000000000 +0100
++++ u-boot-1.3.0-dev/cpu/mips/config.mk	2009-02-26 15:34:28.000000000 +0100
+@@ -28,7 +28,7 @@
+ 	echo "-march=4kc -mtune=4kc"; \
+ fi)
+ 
+-ifneq (,$(findstring 4KCle,$(CROSS_COMPILE)))
++ifneq (,$(findstring mipsel,$(CROSS_COMPILE)))
+ ENDIANNESS = -EL
+ else
+ ENDIANNESS = -EB
+--- u-boot-1.3.0/drivers/Makefile	2009-02-26 15:34:27.000000000 +0100
++++ u-boot-1.3.0-dev/drivers/Makefile	2009-02-26 15:34:29.000000000 +0100
+@@ -53,7 +53,7 @@
+ 	  usb_ohci.o \
+ 	  usbdcore.o usbdcore_ep0.o usbdcore_mpc8xx.o usbdcore_omap1510.o \
+ 	  usbtty.o \
+-	  videomodes.o w83c553f.o
++	  videomodes.o w83c553f.o smsc9118.o xxsccan.o
+ 
+ SRCS	:= $(COBJS:.o=.c)
+ OBJS	:= $(addprefix $(obj),$(COBJS))
+--- u-boot-1.3.0/drivers/smsc9118.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/drivers/smsc9118.c	2009-02-26 15:34:29.000000000 +0100
+@@ -0,0 +1,885 @@
++//--------------------------------------------------------------------------
++//
++// File name:      smsc9118.c
++//
++// Abstract:      Driver for SMSC LAN9118 ethernet controller.
++//
++// Start Automated RH
++// *** Do not edit between "Start Automated RH" and "End Automated RH" ***
++//
++// Copyright 2005, Seagate Technology LLC
++//
++// This program is free software; you can redistribute it and/or modify
++// it under the terms of the GNU General Public License as published by
++// the Free Software Foundation; either version 2 of the License, or
++// (at your option) any later version.
++//
++// This program is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++//
++// You should have received a copy of the GNU General Public License
++// along with this program; if not, write to the Free Software
++// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
++//
++// Revision History
++//
++// *** Do not edit between "Start Automated RH" and "End Automated RH" ***
++// End Automated RH
++//
++//--------------------------------------------------------------------------
++/*---------------------------------------------------------------------------
++ * Copyright(c) 2005-2006 SMSC
++ *
++ *  Use of this source code is subject to the terms of the SMSC Software
++ *  License Agreement (SLA) under which you licensed this software product.
++ *  If you did not accept the terms of the SLA, you are not authorized to use
++ *  this source code.
++ *
++ *  This code and information is provided as is without warranty of any kind,
++ *  either expressed or implied, including but not limited to the implied
++ *  warranties of merchantability and/or fitness for a particular purpose.
++ *
++ *  File name   : smsc9118.c
++ *  Description : smsc9118 polled driver (non-interrupt driven)
++ *
++ *  History	    :
++ *  	09-27-06 MDG		v1.0 (First Release)
++ *			modified for ARM platform
++ *----------------------------------------------------------------------------*/
++
++#include <common.h>
++#include <command.h>
++#include <config.h>
++#include <malloc.h>
++#include "smsc9118.h"
++#include <net.h>
++
++#ifdef CONFIG_DRIVER_SMSC9118
++
++//*************************************************************************
++ //  FUNCTION PROTOTYPES
++
++//*************************************************************************
++int	eth_init(bd_t *bd);
++void	smsc9118_set_mac(const unsigned char *addr);
++void	eth_halt(void);
++int	eth_rx(void);
++int	eth_send(volatile void *packet, int length);
++
++//*************************************************************************
++//  LOCAL DEFINITIONS AND MACROS
++
++//*************************************************************************
++//#define	DEBUG
++
++#define 	GPIO_OUT(val)	  	(*GPIO_CFG = ((*GPIO_CFG & ~GPIO_CFG_GPIOD_MSK) | (val & GPIO_CFG_GPIOD_MSK)))
++#define 	ENET_MAX_MTU		PKTSIZE
++#define 	ENET_MAX_MTU_ALIGNED	PKTSIZE_ALIGN
++#define 	NUM_RX_BUFF 	  	PKTBUFSRX
++#define		ENET_ADDR_LENGTH	6
++#define		TX_TIMEOUT_COUNT	30	// waiting for TX_FIFO to drain
++
++
++//*************************************************************************
++ // GLOBAL DATA
++
++//*************************************************************************
++static const char date_code[] = BUILD_NUMBER;
++
++static char * txbp; 				// TX buffer pointer (only 1 buffer)
++static volatile char * rxbp[PKTBUFSRX];   // Receiver buffer queue (IP layers)
++static struct rxQue rxAvlQue[PKTBUFSRX]; // Receive buffer available queue
++static int rxNdx = 0;				// Current receive buffer index
++static int rxNdxIn = 0; 			// Used for input
++static int rxNdxOut = 0;			// Used for output to protocol layer
++static ushort lastTxTag = 0x0;
++static unsigned char macAddr[ENET_ADDR_LENGTH];
++
++// Temp variables
++#ifdef	DEBUG
++ulong MaxRxFifoSz;
++ulong TotalInts = 0;
++ulong TotalRXE = 0;
++ulong TotalRxPackets = 0;
++ulong TotalBytes = 0;
++ulong EmptyReads = 0;
++
++ulong RxPacketBuf[400];
++ulong SWIntTriggered = FALSE;
++ulong TotalRxDrop = 0;
++ulong TotalPackets = 0;
++ulong TotalWords = 0;
++ulong TBLower1, TBLower2;
++#endif
++// Temp variables
++
++
++//*************************************************************************
++ // EXTERNS
++
++//*************************************************************************
++
++static void lan9118_udelay(unsigned long delta)	// Arg is really microseconds
++{
++	const unsigned long	start = *FREE_RUN,	// Start timing
++				usec = delta * (25000000/1000000);
++
++	// usec adjusted for 25MHz on-chip clock, 1 microsecond (1/1000000) scaling
++	do {
++		delta = *FREE_RUN;
++		if (delta >= start)
++			delta = (delta - start);
++		else
++			delta = (delta - start) + 1;	// use 0x100000000, not 0xffffffff
++	} while (delta < usec);
++}
++
++static int MacBusy(int ReqTO)
++{
++	  int timeout = ReqTO;
++	  int RetVal = FALSE;	  // No timeout
++
++	  while (timeout--) {
++			if (!(*MAC_CSR_CMD & MAC_CSR_CMD_CSR_BUSY)) {
++				  goto done;
++			}
++	  }
++	  RetVal = TRUE;		  // Timeout
++done:
++	  return (RetVal);
++}
++
++static ulong
++GetMacReg(int Reg)
++{
++	  ulong RegVal = 0xffffffff;
++
++	  if (*MAC_CSR_CMD & MAC_CSR_CMD_CSR_BUSY) {
++			LAN9118_WARN("GetMacReg: previous command not complete\n");
++			goto done;
++	  }
++
++	  *MAC_CSR_CMD = MAC_RD_CMD(Reg);
++	  DELAY(1);
++
++	  if (MacBusy(MAC_TIMEOUT) == TRUE) {
++			LAN9118_WARN("GetMacReg: timeout waiting for response "
++				  "from MAC\n");
++			goto done;
++	  }
++
++	  RegVal = *MAC_CSR_DATA;
++done:
++	  return (RegVal);
++}
++
++static int
++PhyBusy(int ReqTO)
++{
++	  int timeout = ReqTO;
++	  int RetVal = FALSE;	  // No timeout
++
++	  while (timeout--) {
++			if (!(GetMacReg(MAC_MIIACC) & MAC_MIIACC_MII_BUSY)) {
++				  goto done;
++			}
++	  }
++
++	  RetVal = TRUE;		  // Timeout
++done:
++	  return (RetVal);
++}
++
++static int
++SetMacReg(int Reg, ulong Value)
++{
++	  int RetVal = FALSE;
++
++	  if (*MAC_CSR_CMD & MAC_CSR_CMD_CSR_BUSY) {
++			LAN9118_WARN("SetMacReg: previous command not complete\n");
++			goto done;
++	  }
++
++	  *MAC_CSR_DATA = Value;
++	  DELAY(1);
++	  *MAC_CSR_CMD = MAC_WR_CMD(Reg);
++	  DELAY(1);
++
++	  if (MacBusy(MAC_TIMEOUT) == TRUE) {
++			LAN9118_WARN("SetMacReg: timeout waiting for response "
++				  "from MAC\n");
++				  goto done;
++	  }
++
++	  RetVal = TRUE;
++done:
++	  return (RetVal);
++}
++
++static ushort
++GetPhyReg(unchar Reg)
++{
++	  ushort RegVal = 0xffff;
++
++	  if (GetMacReg(MAC_MIIACC) & MAC_MIIACC_MII_BUSY) {
++			LAN9118_WARN("GetPhyReg: MII busy\n");
++			RegVal = 0;
++			goto done;
++	  }
++
++	  SetMacReg(MAC_MIIACC, MAC_MII_RD_CMD((unchar)PHY_ADDR, Reg));
++	  DELAY(1);
++
++	  if (PhyBusy(PHY_TIMEOUT) == TRUE) {
++			LAN9118_WARN("GetPhyReg: timeout waiting for MII command\n");
++			goto done;
++	  }
++
++	  RegVal = (ushort)GetMacReg(MAC_MIIDATA);
++done:
++	  return (RegVal);
++}
++
++static int
++SetPhyReg(unchar Reg, ushort Value)
++{
++	  int RetVal = FALSE;
++
++	  if (GetMacReg(MAC_MIIACC) & MAC_MIIACC_MII_BUSY) {
++			LAN9118_WARN("SetPhyReg: MII busy\n");
++			goto done;
++	  }
++
++	  SetMacReg(MAC_MIIDATA, Value);
++	  DELAY(1);
++	  SetMacReg(MAC_MIIACC, MAC_MII_WR_CMD((unchar)PHY_ADDR, Reg));
++	  DELAY(1);
++
++	  if (PhyBusy(PHY_TIMEOUT) == TRUE) {
++			LAN9118_WARN("SetPhyReg: timeout waiting for MII command\n");
++			goto done;
++	  }
++
++	  RetVal = TRUE;
++done:
++	  return (RetVal);
++}
++
++// Display directly accessed, Control/Status Registers
++static int
++DumpCsrRegs(void)
++{
++	  printf("ID_REV:\t\t0x%0.8x\n", *ID_REV);
++	  printf("IRQ_CFG:\t0x%0.8x\n", *IRQ_CFG);
++	  printf("INT_STS:\t0x%0.8x\n", *INT_STS);
++	  printf("INT_EN:\t\t0x%0.8x\n", *INT_EN);
++	  printf("BYTE_TEST:\t0x%0.8x\n", *BYTE_TEST);
++	  printf("FIFO_INT:\t0x%0.8x\n", *FIFO_INT);
++	  printf("RX_CFG:\t\t0x%0.8x\n", *RX_CFG);
++	  printf("TX_CFG:\t\t0x%0.8x\n", *TX_CFG);
++	  printf("HW_CFG:\t\t0x%0.8x\n", *HW_CFG);
++	  printf("RX_DP_CTL:\t0x%0.8x\n", *RX_DP_CTL);
++	  printf("RX_FIFO_INF:\t0x%0.8x\n", *RX_FIFO_INF);
++	  printf("TX_FIFO_INF:\t0x%0.8x\n", *TX_FIFO_INF);
++	  printf("PWR_MGMT:\t0x%0.8x\n", *PWR_MGMT);
++	  printf("GPIO_CFG:\t0x%0.8x\n", *GPIO_CFG);
++	  printf("GPT_CFG:\t0x%0.8x\n", *GPT_CFG);
++	  printf("GPT_CNT:\t0x%0.8x\n", *GPT_CNT);
++	  printf("FPGA_REV:\t0x%0.8x\n", *FPGA_REV);
++	  printf("ENDIAN:\t\t0x%0.8x\n", *ENDIAN);
++	  printf("FREE_RUN\t0x%0.8x\n", *FREE_RUN);
++	  printf("RX_DROP\t\t0x%0.8x\n", *RX_DROP);
++	  printf("MAC_CSR_CMD\t0x%0.8x\n", *MAC_CSR_CMD);
++	  printf("MAC_CSR_DATA\t0x%0.8x\n", *MAC_CSR_DATA);
++	  printf("AFC_CFG\t\t0x%0.8x\n", *AFC_CFG);
++	  return (0);
++}
++
++// Display Media Access Controller Registers
++static int
++DumpMacRegs(void)
++{
++	  printf("MAC_CR\t\t0x%0.8x\n", GetMacReg(MAC_CR));
++	  printf("MAC_ADDRH\t0x%0.8x\n", GetMacReg(MAC_ADDRH));
++	  printf("MAC_ADDRL\t0x%0.8x\n", GetMacReg(MAC_ADDRL));
++	  printf("MAC_HASHH\t0x%0.8x\n", GetMacReg(MAC_HASHH));
++	  printf("MAC_HASHL\t0x%0.8x\n", GetMacReg(MAC_HASHL));
++	  printf("MAC_MIIACC\t0x%0.8x\n", GetMacReg(MAC_MIIACC));
++	  printf("MAC_MIIDATA\t0x%0.8x\n", GetMacReg(MAC_MIIDATA));
++	  printf("MAC_FLOW\t0x%0.8x\n", GetMacReg(MAC_FLOW));
++	  printf("MAC_VLAN1\t0x%0.8x\n", GetMacReg(MAC_VLAN1));
++	  printf("MAC_VLAN2\t0x%0.8x\n", GetMacReg(MAC_VLAN2));
++	  printf("MAC_WUFF\t0x%0.8x\n", GetMacReg(MAC_WUFF));
++	  printf("MAC_WUCSR\t0x%0.8x\n", GetMacReg(MAC_WUCSR));
++	  return (0);
++}
++
++// Display PHYsical media interface registers
++static int
++DumpPhyRegs(void)
++{
++	  printf("PHY_BCR\t\t0x%0.4x\n", GetPhyReg(PHY_BCR));
++	  printf("PHY_BSR\t\t0x%0.4x\n", GetPhyReg(PHY_BSR));
++	  printf("PHY_ID1\t\t0x%0.4x\n", GetPhyReg(PHY_ID1));
++	  printf("PHY_ID2\t\t0x%0.4x\n", GetPhyReg(PHY_ID2));
++	  printf("PHY_ANAR\t0x%0.4x\n", GetPhyReg(PHY_ANAR));
++	  printf("PHY_ANLPAR\t0x%0.4x\n", GetPhyReg(PHY_ANLPAR));
++	  printf("PHY_ANEXPR\t0x%0.4x\n", GetPhyReg(PHY_ANEXPR));
++	  printf("PHY_SILREV\t0x%0.4x\n", GetPhyReg(PHY_SILREV));
++	  printf("PHY_MCSR\t0x%0.4x\n", GetPhyReg(PHY_MCSR));
++	  printf("PHY_SPMODES\t0x%0.4x\n", GetPhyReg(PHY_SPMODES));
++	  printf("PHY_CSIR\t0x%0.4x\n", GetPhyReg(PHY_CSIR));
++	  printf("PHY_ISR\t\t0x%0.4x\n", GetPhyReg(PHY_ISR));
++	  printf("PHY_IMR\t\t0x%0.4x\n", GetPhyReg(PHY_IMR));
++	  printf("PHY_PHYSCSR\t0x%0.4x\n", GetPhyReg(PHY_PHYSCSR));
++	  return (0);
++}
++
++static int
++lan9118_open(bd_t *bis)
++{
++	  int RetVal = TRUE;
++	  int timeout;
++	  int i;
++
++#ifdef DEBUG
++	  printf("DRIVER_VERSION : %X, ", DRIVER_VERSION);
++	  printf("DATECODE : %s\r\n", BUILD_NUMBER);
++	  TotalInts = 0;
++	  TotalRXE = 0;
++	  TotalBytes = 0;
++#endif
++
++	  // Because we just came out of h/w reset we can't be sure that
++	  // the chip has completed reset and may have to implement the
++	  // workaround for Errata 5, stepping A0.	Therefore we need to
++	  // check the ID_REV in little endian, the reset default.
++	  if (((*ID_REV & ID_REV_ID_MASK) == ID_REV_CHIP_118) ||
++	  	  ((*ID_REV & ID_REV_ID_MASK) == ID_REV_CHIP_218))
++	  {
++			printf("LAN9x18 (0x%08x) detected.\n", *ID_REV);
++	  }
++	  else
++	  {
++			printf("Failed to detect LAN9118. ID_REV = 0x%08x\n", *ID_REV);
++		    RetVal = FALSE;
++		    goto done;
++	  }
++
++	  // Does SoftReset to 118
++	  *HW_CFG = HW_CFG_SRST;
++	  DELAY(10);
++
++	  // Is the internal PHY running?
++	  if ((*PWR_MGMT & PWR_MGMT_PM_MODE_MSK) != 0) {
++			// Apparently not...
++			*BYTE_TEST = 0x0; // Wake it up
++			DELAY(1);
++			timeout = PHY_TIMEOUT;
++			while (timeout-- && ((*PWR_MGMT & PWR_MGMT_PME_READY) == 0)) {
++				  lan9118_udelay(1);
++			}
++			if ((*PWR_MGMT & PWR_MGMT_PME_READY) == 0) {
++				  LAN9118_WARN("LAN9118: PHY not ready");
++				  LAN9118_WARN(" - aborting\n");
++				  RetVal = FALSE;
++				  goto done;
++			}
++	  }
++
++	  // Setup TX and RX resources.
++
++	  // There is one TX buffer.
++	  if ((txbp = malloc(ENET_MAX_MTU_ALIGNED)) == NULL) {
++		LAN9118_WARN("lan9118_open: can't get TX buffer\n");
++		goto cleanup;
++	  }
++
++	  // The receive buffers are allocated and aligned by upper layer
++	  // software.
++	  for (i = 0; i < PKTBUFSRX; i++) {
++			rxbp[i] = NetRxPackets[i];
++			rxAvlQue[i].index = -1;
++	  }
++
++	  rxNdx = 0;
++	  rxNdxIn = 0;
++	  rxNdxOut = 0;
++	  lastTxTag = 0x0;
++
++	  // Set TX Fifo Size
++	  *HW_CFG = 0x00040000;   // 4K for TX
++
++	  // This value is dependent on TX Fifo Size since there's a limited
++	  // amount of Fifo space.
++	  //MaxRxFifoSz = 13440;			// Decimal
++
++	  // Set automatic flow control.
++	  *AFC_CFG = 0x008c46af;
++
++	  // Flash LEDs.
++	  *GPIO_CFG = 0x70700000;
++
++	  // Disable interrupts until the rest of initialization is complete.
++	  *INT_EN = 0x0;		// Clear interrupt enables
++	  *INT_STS = 0xffffffff;	// Clear pending interrupts
++	  *IRQ_CFG = 0x00000001;	// IRQ disable
++
++	  // Enable flow control and pause frame time
++	  SetMacReg(MAC_FLOW, 0xffff0002);
++
++	  // Set MAC address, if octet 0 is non-null assume it's all good.
++	  {
++		unsigned mac_addrh;
++		unsigned mac_addrl;
++
++		memcpy(macAddr, bis->bi_enetaddr, ENET_ADDR_LENGTH);
++		mac_addrh = macAddr[5] << 8 | macAddr[4];
++		mac_addrl = macAddr[3] << 24 | macAddr[2] << 16 |
++				macAddr[1] << 8 | macAddr[0];
++		if (mac_addrh != 0 || mac_addrl != 0) {
++				SetMacReg(MAC_ADDRH, mac_addrh);
++				SetMacReg(MAC_ADDRL, mac_addrl);
++		}
++	  }
++
++	  // Dump old status and data
++	  *TX_CFG = (TX_CFG_TXS_DUMP | TX_CFG_TXD_DUMP);
++	  *RX_CFG = (RX_CFG_FORCE_DISCARD);
++
++	  // Initialize Tx parameters
++	  *HW_CFG = ((*HW_CFG & HW_CFG_TX_FIF_SZ_MSK) | HW_CFG_SF);
++	  *FIFO_INT = FIFO_INT_TDAL_MSK;	  // Max out value
++	  *INT_EN |= INT_EN_TDFA_INT_EN;
++	  {
++		// Disable MAC heartbeat SQE and enable MAC transmitter
++		ulong macCR = GetMacReg(MAC_CR);
++		macCR |= (MAC_CR_TXEN | MAC_CR_HBDIS);
++		macCR &= ~MAC_CR_PRMS;	// Turn off promiscuous mode
++		macCR |= MAC_CR_BCAST;	// Don't accept broadcast frames
++		SetMacReg(MAC_CR, macCR);
++	  }
++
++	  // Initialize Rx parameters
++	  *RX_CFG = 0x00000000;			// 4byte end-alignment
++	  {
++		// Enable receiver.
++		ulong macCR = GetMacReg(MAC_CR);
++		SetMacReg(MAC_CR, (macCR | MAC_CR_RXEN));
++	  }
++	  *FIFO_INT = ((*FIFO_INT & 0xffff0000) | 0x00000101);
++	  *INT_EN |= (INT_EN_RSFL_INT_EN | INT_EN_RXE_INT_EN);
++	  *INT_EN |= INT_EN_RXDFH_INT_EN;
++
++	  // Initialize PHY parameters
++	  if (((GetPhyReg(PHY_ID1) == PHY_ID1_LAN9118) &&
++		   (GetPhyReg(PHY_ID2) == PHY_ID2_LAN9118)) ||
++	      ((GetPhyReg(PHY_ID1) == PHY_ID1_LAN9218) &&
++		   (GetPhyReg(PHY_ID2) == PHY_ID2_LAN9218)))
++	  {
++		  // Reset the PHY
++		  SetPhyReg(PHY_BCR, PHY_BCR_RST);
++		  timeout = PHY_TIMEOUT;
++		  lan9118_udelay(50*1000);	// > 50ms
++		  while(timeout-- && (GetPhyReg(PHY_BCR) & PHY_BCR_RST))
++		  {
++				lan9118_udelay(10);
++		  }
++		  if (timeout == 0)
++		  {
++				LAN9118_WARN("PHY reset incomplete\n");
++				RetVal = FALSE;
++				goto done;
++		  }
++
++		  // Setup and start auto negotiation
++		  {
++				ushort anar;
++				ushort bcr;
++				char * spddplx;
++
++				anar = GetPhyReg(PHY_ANAR);
++				anar &= ~PHY_ANAR_PAUSE_OP_MSK;
++				anar |= PHY_ANAR_PAUSE_OP_BOTH;
++				anar |= (PHY_ANAR_10_FDPLX | PHY_ANAR_10_ABLE |
++					  PHY_ANAR_100_TX_FDPLX | PHY_ANAR_100_TX_ABLE);
++				SetPhyReg(PHY_ANAR, anar);
++
++				DELAY(2);
++				bcr = GetPhyReg(PHY_BCR);
++				bcr |= (PHY_BCR_SS | PHY_BCR_FDPLX);
++				SetPhyReg(PHY_BCR, bcr);
++				DELAY(2);
++
++				printf("start Auto negotiation... (take ~2sec)\n");
++				bcr = GetPhyReg(PHY_BCR);
++				bcr |= (PHY_BCR_ANE | PHY_BCR_RSTAN);
++				SetPhyReg(PHY_BCR, bcr);
++				DELAY(2);
++
++				timeout = PHY_AN_TIMEOUT;
++				while((timeout--) && ((GetPhyReg(PHY_BSR) & PHY_BSR_ANC) == 0)) {
++#ifdef DEBUG
++					  printf("--%i\n", timeout);
++					  DumpPhyRegs();
++#endif
++					  lan9118_udelay(500000);
++				}
++
++#ifdef DEBUG
++				DumpCsrRegs();
++				DumpMacRegs();
++				DumpPhyRegs();
++#endif
++				if ((GetPhyReg(PHY_BSR) & PHY_BSR_ANC) == 0) {
++					  LAN9118_WARN("Auto negotiation failed\n");
++					  RetVal = FALSE;
++					  goto done;
++				}
++
++				if ((GetPhyReg(PHY_BSR) & PHY_BSR_LINK_STATUS) == 0) {
++					  LAN9118_WARN("Link down\n");
++					  RetVal = FALSE;
++					  goto done;
++				}
++
++				switch ((GetPhyReg(PHY_PHYSCSR) & PHY_PHYSCSR_SPEED_MSK)>>2) {
++					  case 0x01:
++							spddplx = "10BaseT, half duplex";
++							break;
++					  case 0x02:
++							spddplx = "100BaseTX, half duplex";
++							break;
++					  case 0x05:
++							spddplx = "10BaseT, full duplex";
++							break;
++					  case 0x06:
++							spddplx = "100BaseTX, full duplex";
++							break;
++					  default:
++							spddplx = "Unknown";
++							break;
++				}
++				printf("Auto negotiation complete, %s\n", spddplx);
++		  }
++
++		  // If PHYs auto negotiated for full duplex, enable full duplex in MAC.
++		  if ((GetPhyReg(PHY_ANAR) & GetPhyReg(PHY_ANLPAR)) & 0x0140) {
++				SetMacReg(MAC_CR, (GetMacReg(MAC_CR) | 0x00100000));
++		  }
++		  // correct PHY_ID is detected
++		  goto done;
++	  }
++	  else
++	  {
++			printf("Unknown PHY ID : 0x%x, 0x%x\n", GetPhyReg(PHY_ID1), GetPhyReg(PHY_ID2));
++	  }
++
++	  goto done;
++
++cleanup:
++	  if (txbp != NULL) {
++			free(txbp);
++	  }
++
++done:
++	  return (RetVal);
++}
++
++void smsc9118_set_mac(const unsigned char *addr)
++{
++	// Set MAC address, if octet 0 is non-null assume it's all good.
++	unsigned mac_addrh;
++	unsigned mac_addrl;
++
++	mac_addrh = addr[5] << 8 | addr[4];
++	mac_addrl = addr[3] << 24 | addr[2] << 16 |
++			addr[1] << 8 | addr[0];
++	if (mac_addrh != 0 || mac_addrl != 0) {
++			SetMacReg(MAC_ADDRH, mac_addrh);
++			SetMacReg(MAC_ADDRL, mac_addrl);
++	}
++}
++
++static void
++lan9118_close(void)
++{
++	  // Release the TX buffer.
++	  if (txbp != NULL) {
++			free(txbp);
++	  }
++}
++
++static int
++lan9118_read()
++{
++	  int curBufNdx;
++	  int loopCount = 0;
++	  ulong rxStatus;
++	  ulong count;
++	  ulong len;
++	  int ffwdOk = TRUE;
++	  int timeout;
++	  int handled = 0;
++
++	  while((*RX_FIFO_INF & 0x00ff0000) != 0) {
++			if (loopCount >= NUM_RX_BUFF) {
++#ifdef DEBUG
++				printf("read: loopCount exceeded\n");
++#endif
++				break;	  // Packet buffers full
++			}
++
++			curBufNdx = rxNdx;
++			loopCount++;
++			if (++rxNdx >= NUM_RX_BUFF) {
++				  rxNdx = 0;  // Wrap buffer slot #
++			}
++
++			rxStatus = *RX_STATUS_FIFO_PORT;
++			len = count = rxStatus >> 16;
++
++			if (count >= 4*sizeof(ulong)) {
++				  ffwdOk = TRUE;	// Use h/w to toss packet
++			} else {
++				  ffwdOk = FALSE;	// Have to empty manually on error
++			}
++
++			if (count != 0) {
++				  if (count > ENET_MAX_MTU) {
++						count = 0;
++				  } else {
++						if ((rxStatus & TX_STATUS_FIFO_ES) != 0) {
++							  count = 0;
++						}
++				  }
++			}
++
++			if (count == 0) {
++				  if (ffwdOk == TRUE) {
++						// Drain it the fast way
++						*RX_DP_CTL = RX_DP_FFWD;
++						timeout = FFWD_TIMEOUT;
++						while (timeout-- && (*RX_DP_CTL & RX_DP_FFWD)) {
++							  lan9118_udelay(1);
++						}
++						if ((*RX_DP_CTL & RX_DP_FFWD) != 0) {
++							  LAN9118_WARN("lan9118_read: fast "
++									"forward op failed\n");
++							  break;
++						}
++				  } else {
++						// Drain it manually
++						while (len--) {
++							volatile ulong tmp = *RX_FIFO_PORT;
++						}
++				  }
++			} else if (rxAvlQue[rxNdxIn].index != -1) {
++				  LAN9118_WARN("lan9118_read: read buffers full!\n");
++				  break;
++			} else {
++				  register ulong *rxbpl;
++				  int ndx;
++
++#ifdef	DEBUG
++				  TotalRxPackets++;
++				  TotalBytes += count;
++#endif
++				  rxAvlQue[rxNdxIn].index = curBufNdx;
++				  rxAvlQue[rxNdxIn].len = count;
++				  if (++rxNdxIn >= NUM_RX_BUFF) {
++						rxNdxIn = 0;
++				  }
++
++				  // Copy this packet to a NetRxPacket buffer
++				  handled = 1;
++//printf("read: %d empty reads prior to this one\n", EmptyReads);
++#ifdef	DEBUG
++				  EmptyReads = 0;
++#endif
++				  rxbpl = (ulong *)rxbp[curBufNdx];
++				  for (ndx = (count+3)/sizeof(ulong); ndx > 0; ndx--) {
++						*rxbpl++ = *RX_FIFO_PORT;
++				  }
++#ifdef DEBUG
++				{
++					printf("Received: packet contents follows.\n");
++					int i;
++					for (i = 1; i <= count; i++) {
++						printf("0x%02x ", rxbp[curBufNdx][i-1]);
++						if (!(i%16))
++							printf("\n");
++					}
++					printf("\n");
++				}
++#endif
++				  DELAY(3);
++			}
++	  }
++
++	  if (handled) {
++			for (;;) {
++				  curBufNdx = rxAvlQue[rxNdxOut].index;
++				  if (curBufNdx == -1) {
++						len = -1;	// Nothing else received
++//printf("read: nothing else received: rxNdxOut: %d curBufNdx: %d\n", rxNdxOut, curBufNdx);
++						break;
++				  }
++				  len = rxAvlQue[rxNdxOut].len;
++//printf("read: sending a packet up: rxNdxOut: %d curBufNdx: %d\n", rxNdxOut, curBufNdx);
++				  NetReceive(NetRxPackets[curBufNdx], len - 4);
++				  rxAvlQue[rxNdxOut].index = -1;	  // Free buffer
++				  if (++rxNdxOut >= NUM_RX_BUFF) {
++						rxNdxOut = 0;	  // Handle wrap
++				  }
++			}
++	  } else {
++#ifdef	DEBUG
++			EmptyReads++;
++#endif
++			return (-1);	  // Nothing was received
++	  }
++
++	  return (len);
++}
++
++
++static int sendToNet(uchar * txbp, int len)
++{
++	  ulong tx_cmd_a, tx_cmd_b;
++	  int i;
++	  ulong * txbpl = (ulong *)txbp;
++
++	  lastTxTag++;
++
++#ifdef DEBUG
++	  {
++		printf("sendToNet: packet contents follows.\n");
++		int i;
++		int j = 0;
++		for (i = 0; i < len; i++) {
++			if (++j == 20) {
++				j = 0;
++				printf("\n");
++			}
++			printf("%0.1x ", txbp[i]);
++		}
++		printf("\n");
++	  }
++#endif
++
++	  tx_cmd_a = (((ulong)txbp & 0x3) << 16) | 0x00003000 | len;
++	  tx_cmd_b = (lastTxTag << 16) | len;
++
++#ifdef DEBUG
++	  printf("sendToNet: tx_cmd_a: 0x%0.8x tx_cmd_b: 0x%0.8x\n",
++			tx_cmd_a, tx_cmd_b);
++#endif
++
++	  *TX_FIFO_PORT = tx_cmd_a;
++	  *TX_FIFO_PORT = tx_cmd_b;
++
++	  for (i = (len+3)/sizeof(ulong); i > 0; i--) {
++			*TX_FIFO_PORT = *txbpl++;
++	  }
++
++	  *TX_CFG = TX_CFG_TX_ON;		// Enable transmitter
++
++	  return (TRUE);
++}
++
++static int lan9118_write(volatile void *ptr, int len)
++{
++	  ulong startTime;
++	  ulong timeout;
++	  char statusStr[64];
++
++	  if (len > ENET_MAX_MTU) {
++			len = ENET_MAX_MTU;
++	  }
++
++	  // Copy the packet.
++	  memcpy((void *)txbp, (void *)ptr, len);
++
++	  // Drain the TX status fifo just in case there are old (good) statuses.
++	  for (timeout=0; timeout<TX_TIMEOUT_COUNT; timeout++)
++	  {
++		  if ((*TX_FIFO_INF & TX_FIFO_TXSUSED_MSK) == 0) {
++				break;
++		  }
++		  printf("lan9118_write: discarded old TX status\n");
++	  }
++	  if (timeout == TX_TIMEOUT_COUNT)	// timed out?  Yes--
++	  {
++		DumpCsrRegs();
++		DumpMacRegs();
++		DumpPhyRegs();
++	  }
++
++	  if (sendToNet(txbp, len) == FALSE) {
++			return (-1);
++	  }
++
++#ifdef DEBUG
++	printf("write: sent packet out: len: %d\n", len);
++#endif
++
++	  startTime = get_timer(0);
++	  while (1) {
++		if ((*TX_FIFO_INF & TX_FIFO_TXSUSED_MSK) == 0) {
++			  // No status yet
++			  if ((get_timer(0) - startTime) > TX_TIMEOUT) {
++					return (-1);
++			  }
++		} else {
++			ulong txStatus = *TX_STATUS_FIFO_PORT;
++
++			if ((txStatus & TX_STATUS_FIFO_ES) == TX_STATUS_FIFO_ES) {
++				sprintf(statusStr, "lan9118_write: error "
++					  "status: 0x%0.8x\n", txStatus);
++				LAN9118_WARN(statusStr);
++#ifdef DEBUG
++				DumpCsrRegs();
++				DumpMacRegs();
++				DumpPhyRegs();
++#endif
++				return (-1);
++          		}
++			else {
++				*TX_CFG |= TX_CFG_STOP_TX; // Stop transmitter
++#ifdef DEBUG
++				printf("write: successful: len: %d\n", len);
++#endif
++				return (len);		   // successful send
++			}
++		}
++	  }
++}
++
++int	eth_init(bd_t *bd)
++{
++	return lan9118_open(bd);
++}
++
++void eth_halt(void)
++{
++	lan9118_close();
++}
++
++int eth_rx(void)
++{
++	int	r;
++
++	r = lan9118_read();
++
++	return r;
++}
++
++int eth_send(volatile void *packet, int length)
++{
++	return lan9118_write(packet, length);
++}
++
++#endif // #ifdef CONFIG_DRIVER_SMSC9118
+--- u-boot-1.3.0/drivers/smsc9118.h	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/drivers/smsc9118.h	2009-02-26 15:34:29.000000000 +0100
+@@ -0,0 +1,488 @@
++//--------------------------------------------------------------------------
++//
++// File name:      smsc9118.h
++//
++// Abstract:      Address map and register definitions for SMSC LAN9118
++//          ethernet controller.
++//
++// Start Automated RH
++// *** Do not edit between "Start Automated RH" and "End Automated RH" ***
++//
++// Copyright 2005, Seagate Technology LLC
++//
++// This program is free software; you can redistribute it and/or modify
++// it under the terms of the GNU General Public License as published by
++// the Free Software Foundation; either version 2 of the License, or
++// (at your option) any later version.
++//
++// This program is distributed in the hope that it will be useful,
++// but WITHOUT ANY WARRANTY; without even the implied warranty of
++// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++// GNU General Public License for more details.
++//
++// You should have received a copy of the GNU General Public License
++// along with this program; if not, write to the Free Software
++// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
++//
++// Revision History
++//
++// *** Do not edit between "Start Automated RH" and "End Automated RH" ***
++// End Automated RH
++//
++//
++//--------------------------------------------------------------------------
++/*---------------------------------------------------------------------------
++ * Copyright(c) 2005-2006 SMSC
++ *
++ *  Use of this source code is subject to the terms of the SMSC Software
++ *  License Agreement (SLA) under which you licensed this software product.
++ *  If you did not accept the terms of the SLA, you are not authorized to use
++ *  this source code.
++ *
++ *  This code and information is provided as is without warranty of any kind,
++ *  either expressed or implied, including but not limited to the implied
++ *  warranties of merchantability and/or fitness for a particular purpose.
++ *
++ *  File name   : smsc9118.c
++ *  Description : smsc9118 polled driver (non-interrupt driven)
++ *
++ *  History	    :
++ *  	09-27-06 MDG		First Release
++ *			modified for ARM platform
++ *----------------------------------------------------------------------------*/
++
++#ifdef CONFIG_DRIVER_SMSC9118
++
++//*************************************************************************
++ //  GLOBAL DEFINITIONS
++
++//*************************************************************************
++#define 	LAN9118_WARN(s) (printf("%s", s))
++
++#define DRIVER_VERSION          0x100
++#define	BUILD_NUMBER		"092706"
++
++//*************************************************************************
++ //  DATA STRUCTURE DEFINITIONS
++
++//*************************************************************************
++
++
++#ifndef 	_SMSC9118_H
++#define 	_SMSC9118_H
++
++#ifndef	CONFIG_SMSC9118_BASE
++#error	"CONFIG_SMSC9118_BASE is not defined."
++#else
++#define 	SMSC9118_BASE		CONFIG_SMSC9118_BASE
++#endif
++
++#define 	MAC_TIMEOUT 		200
++#define 	PHY_TIMEOUT		200
++//#define	PHY_AN_TIMEOUT	  3000 * 1000 // 3 seconds
++#define 	PHY_AN_TIMEOUT		10	// 3 seconds
++#define 	SRST_TIMEOUT		100
++#define 	TX_TIMEOUT		3000		// 3000 * 1/HZ
++#define 	FFWD_TIMEOUT		100
++#define 	PHY_ADDR		1
++#define 	FALSE			0
++#define 	TRUE			1
++
++#define 	DELAY(n)	( {   \
++						int _i = n; \
++						do { \
++							  ulong _temp; \
++							  _temp = *BYTE_TEST; \
++						} while (--_i); \
++				  } )
++
++struct rxQue {
++	  int	index;		// Index into NetRxPackets[]
++	  int	len;  		// Length of packet at this index
++};
++
++// Lan9118 memory map
++
++// Control/Status Register Map (directly addressable registers)
++#define RX_FIFO_PORT				(volatile ulong *)(SMSC9118_BASE + 0x0)
++#define RX_FIFO_ALIAS_PORTS 		(volatile ulong *)(SMSC9118_BASE + 0x4)
++#define TX_FIFO_PORT				(volatile ulong *)(SMSC9118_BASE + 0x20)
++#define TX_FIFO_ALIAS_PORTS 		(volatile ulong *)(SMSC9118_BASE + 0x24)
++#define RX_STATUS_FIFO_PORT 		(volatile ulong *)(SMSC9118_BASE + 0x40)
++#define RX_STATUS_FIFO_PEEK 		(volatile ulong *)(SMSC9118_BASE + 0x44)
++#define TX_STATUS_FIFO_PORT 		(volatile ulong *)(SMSC9118_BASE + 0x48)
++#define TX_STATUS_FIFO_PEEK 		(volatile ulong *)(SMSC9118_BASE + 0x4C)
++#define TX_STATUS_FIFO_ES 			(0x00008000)
++#define TX_STATUS_FIFO_TAG_MSK		(0xffff0000)
++
++#define ID_REV						(volatile ulong *)(SMSC9118_BASE + 0x50)
++#define		ID_REV_ID_MASK			(0xFFFF0000)
++#define 	ID_REV_CHIP_118   		(0x01180000)
++#define 	ID_REV_CHIP_218   		(0x118A0000)
++#define		ID_REV_REV_MASK			(0x0000FFFF)
++
++#define IRQ_CFG 					(volatile ulong *)(SMSC9118_BASE + 0x54)
++#define 	IRQ_CFG_MASTER_INT		(0x00001000)
++#define 	IRQ_CFG_ENABLE			(0x00000100)
++#define 	IRQ_CFG_IRQ_POL_HIGH	(0x00000010)
++#define 	IRQ_CFG_IRQ_TYPE_PUPU	(0x00000001)
++
++#define INT_STS 					(volatile ulong *)(SMSC9118_BASE + 0x58)
++#define 	INT_STS_SW_INT			(0x80000000)
++#define 	INT_STS_TXSTOP_INT		(0x02000000)
++#define 	INT_STS_RXSTOP_INT		(0x01000000)
++#define 	INT_STS_RXDFH_INT 		(0x00800000)
++#define 	INT_STS_RXDF_INT  		(0x00400000)
++#define 	INT_STS_TIOC_INT  		(0x00200000)
++#define 	INT_STS_GPT_INT 		(0x00080000)
++#define 	INT_STS_PHY_INT 		(0x00040000)
++#define 	INT_STS_PMT_INT 		(0x00020000)
++#define 	INT_STS_TXSO_INT  		(0x00010000)
++#define 	INT_STS_RWT_INT 		(0x00008000)
++#define 	INT_STS_RXE_INT 		(0x00004000)
++#define 	INT_STS_TXE_INT 		(0x00002000)
++#define 	INT_STS_ERX_INT 		(0x00001000)
++#define 	INT_STS_TDFU_INT  		(0x00000800)
++#define 	INT_STS_TDFO_INT  		(0x00000400)
++#define 	INT_STS_TDFA_INT  		(0x00000200)
++#define 	INT_STS_TSFF_INT  		(0x00000100)
++#define 	INT_STS_TSFL_INT  		(0x00000080)
++#define 	INT_STS_RDFO_INT  		(0x00000040)
++#define 	INT_STS_RDFL_INT  		(0x00000020)
++#define 	INT_STS_RSFF_INT  		(0x00000010)
++#define 	INT_STS_RSFL_INT  		(0x00000008)
++#define 	INT_STS_GPIO2_INT 		(0x00000004)
++#define 	INT_STS_GPIO1_INT 		(0x00000002)
++#define 	INT_STS_GPIO0_INT 		(0x00000001)
++
++#define INT_EN						(volatile ulong *)(SMSC9118_BASE + 0x5C)
++#define 	INT_EN_SW_INT_EN  		(0x80000000)
++#define 	INT_EN_TXSTOP_INT_EN	(0x02000000)
++#define 	INT_EN_RXSTOP_INT_EN	(0x01000000)
++#define 	INT_EN_RXDFH_INT_EN 	(0x00800000)
++#define 	INT_EN_RXDF_INT_EN		(0x00400000)
++#define 	INT_EN_TIOC_INT_EN		(0x00200000)
++#define 	INT_EN_GPT_INT_EN 		(0x00080000)
++#define 	INT_EN_PHY_INT_EN 		(0x00040000)
++#define 	INT_EN_PMT_INT_EN 		(0x00020000)
++#define 	INT_EN_TXSO_INT_EN		(0x00010000)
++#define 	INT_EN_RWT_INT_EN 		(0x00008000)
++#define 	INT_EN_RXE_INT_EN 		(0x00004000)
++#define 	INT_EN_TXE_INT_EN 		(0x00002000)
++#define 	INT_EN_ERX_INT_EN 		(0x00001000)
++#define 	INT_EN_TDFU_INT_EN		(0x00000800)
++#define 	INT_EN_TDFO_INT_EN		(0x00000400)
++#define 	INT_EN_TDFA_INT_EN		(0x00000200)
++#define 	INT_EN_TSFF_INT_EN		(0x00000100)
++#define 	INT_EN_TSFL_INT_EN		(0x00000080)
++#define 	INT_EN_RDFO_INT_EN		(0x00000040)
++#define 	INT_EN_RDFL_INT_EN		(0x00000020)
++#define 	INT_EN_RSFF_INT_EN		(0x00000010)
++#define 	INT_EN_RSFL_INT_EN		(0x00000008)
++#define 	INT_EN_GPIO2_EN 		(0x00000004)
++#define 	INT_EN_GPIO1_EN 		(0x00000002)
++#define 	INT_EN_GPIO0_EN 		(0x00000001)
++
++#define BYTE_TEST		  		(volatile ulong *)(SMSC9118_BASE + 0x64)
++#define 	BYTE_TEST_VAL			(0x87654321)
++
++#define FIFO_INT		  		(volatile ulong *)(SMSC9118_BASE + 0x68)
++#define 	FIFO_INT_TDAL_MSK 		(0xFF000000)
++#define 	FIFO_INT_TSL_MSK  		(0x00FF0000)
++#define 	FIFO_INT_RDAL_MSK 		(0x0000FF00)
++#define 	FIFO_INT_RSL_MSK  		(0x000000FF)
++
++#define RX_CFG					(volatile ulong *)(SMSC9118_BASE + 0x6C)
++#define 	RX_CFG_END_ALIGN4 		(0x00000000)
++#define 	RX_CFG_END_ALIGN16		(0x40000000)
++#define 	RX_CFG_END_ALIGN32		(0x80000000)
++#define 	RX_CFG_FORCE_DISCARD	(0x00008000)
++#define 	RX_CFG_RXDOFF_MSK 		(0x00003C00)
++#define 	RX_CFG_RXBAD			(0x00000001)
++
++#define TX_CFG					(volatile ulong *)(SMSC9118_BASE + 0x70)
++#define 	TX_CFG_TXS_DUMP 		(0x00008000)
++#define 	TX_CFG_TXD_DUMP 		(0x00004000)
++#define 	TX_CFG_TXSAO			(0x00000004)
++#define 	TX_CFG_TX_ON			(0x00000002)
++#define 	TX_CFG_STOP_TX			(0x00000001)
++
++#define HW_CFG					(volatile ulong *)(SMSC9118_BASE + 0x74)
++#define 	HW_CFG_TTM		  	(0x00200000)
++#define 	HW_CFG_SF		  	(0x00100000)
++#define 	HW_CFG_TX_FIF_SZ_MSK	(0x000F0000)
++#define 	HW_CFG_TR_MSK			(0x00003000)
++#define 	HW_CFG_BITMD_MSK  		(0x00000004)
++#define 	HW_CFG_BITMD_32 		(0x00000004)
++#define 	HW_CFG_SRST_TO			(0x00000002)
++#define 	HW_CFG_SRST 	  		(0x00000001)
++
++#define RX_DP_CTL		  			(volatile ulong *)(SMSC9118_BASE + 0x78)
++#define 	RX_DP_FFWD		  		(0x80000000)
++#define 	RX_DP_RX_FFWD_MSK 		(0x00000FFF)
++
++#define RX_FIFO_INF 	  			(volatile ulong *)(SMSC9118_BASE + 0x7C)
++#define 	RX_FIFO_RXSUSED_MSK 	(0x00FF0000)
++#define 	RX_FIFO_RXDUSED_MSK 	(0x0000FFFF)
++
++#define TX_FIFO_INF 	  			(volatile ulong *)(SMSC9118_BASE + 0x80)
++#define 	TX_FIFO_TXSUSED_MSK 	(0x00FF0000)
++#define 	TX_FIFO_TDFREE_MSK		(0x0000FFFF)
++
++#define PWR_MGMT		  			(volatile ulong *)(SMSC9118_BASE + 0x84)
++#define 	PWR_MGMT_PM_MODE_MSK	(0x00030000)
++#define 	PWR_MGMT_PM_MODE_MSK_LE (0x00000003)
++#define 	PWR_MGMT_PM__D0 		(0x00000000)
++#define 	PWR_MGMT_PM__D1 		(0x00010000)
++#define 	PWR_MGMT_PM__D2 		(0x00020000)
++#define 	PWR_MGMT_PHY_RST  		(0x00000400)
++#define 	PWR_MGMT_WOL_EN 		(0x00000200)
++#define 	PWR_MGMT_ED_EN			(0x00000100)
++#define 	PWR_MGMT_PME_TYPE_PUPU	(0x00000040)
++#define 	PWR_MGMT_WUPS_MSK 		(0x00000030)
++#define 	PWR_MGMT_WUPS_NOWU		(0x00000000)
++#define 	PWR_MGMT_WUPS_D2D0		(0x00000010)
++#define 	PWR_MGMT_WUPS_D1D0		(0x00000020)
++#define 	PWR_MGMT_WUPS_UNDEF 	(0x00000030)
++#define 	PWR_MGMT_PME_IND_PUL	(0x00000008)
++#define 	PWR_MGMT_PME_POL_HIGH	(0x00000004)
++#define 	PWR_MGMT_PME_EN 		(0x00000002)
++#define 	PWR_MGMT_PME_READY		(0x00000001)
++
++#define GPIO_CFG		  			(volatile ulong *)(SMSC9118_BASE + 0x88)
++#define 	GPIO_CFG_LEDx_MSK 		(0x70000000)
++#define 	GPIO_CFG_LED1_EN  		(0x10000000)
++#define 	GPIO_CFG_LED2_EN  		(0x20000000)
++#define 	GPIO_CFG_LED3_EN  		(0x40000000)
++#define 	GPIO_CFG_GPIOBUFn_MSK	(0x00070000)
++#define 	GPIO_CFG_GPIOBUF0_PUPU	(0x00010000)
++#define 	GPIO_CFG_GPIOBUF1_PUPU	(0x00020000)
++#define 	GPIO_CFG_GPIOBUF2_PUPU	(0x00040000)
++#define 	GPIO_CFG_GPDIRn_MSK 	(0x00000700)
++#define 	GPIO_CFG_GPIOBUF0_OUT	(0x00000100)
++#define 	GPIO_CFG_GPIOBUF1_OUT	(0x00000200)
++#define 	GPIO_CFG_GPIOBUF2_OUT	(0x00000400)
++#define 	GPIO_CFG_GPIOD_MSK		(0x00000007)
++#define 	GPIO_CFG_GPIOD0 		(0x00000001)
++#define 	GPIO_CFG_GPIOD1 		(0x00000002)
++#define 	GPIO_CFG_GPIOD2 		(0x00000004)
++
++#define GPT_CFG 					(volatile ulong *)(SMSC9118_BASE + 0x8C)
++#define 	GPT_CFG_TIMER_EN  		(0x20000000)
++#define 	GPT_CFG_GPT_LOAD_MSK	(0x0000FFFF)
++
++#define	GPT_CNT 					(volatile ulong *)(SMSC9118_BASE + 0x90)
++#define 	GPT_CNT_MSK 	  		(0x0000FFFF)
++
++#define FPGA_REV		  			(volatile ulong *)(SMSC9118_BASE + 0x94)
++
++#define ENDIAN						(volatile ulong *)(SMSC9118_BASE + 0x98)
++#define 	ENDIAN_BIG		  		(0xFFFFFFFF)
++
++#define FREE_RUN		  			(volatile ulong *)(SMSC9118_BASE + 0x9C)
++#define 	FREE_RUN_FR_CNT_MSK 	(0xFFFFFFFF)
++
++#define RX_DROP 					(volatile ulong *)(SMSC9118_BASE + 0xA0)
++#define 	RX_DROP_RX_DFC_MSK		(0xFFFFFFFF)
++
++#define MAC_CSR_CMD 	  			(volatile ulong *)(SMSC9118_BASE + 0xA4)
++#define 	MAC_CSR_CMD_CSR_BUSY	(0x80000000)
++#define 	MAC_CSR_CMD_RNW 		(0x40000000)
++#define 	MAC_RD_CMD(Reg)   		((Reg & 0x000000FF) | \
++									 (MAC_CSR_CMD_CSR_BUSY | MAC_CSR_CMD_RNW))
++#define 	MAC_WR_CMD(Reg)   		((Reg & 0x000000FF) | \
++									 (MAC_CSR_CMD_CSR_BUSY))
++
++#define MAC_CSR_DATA				(volatile ulong *)(SMSC9118_BASE + 0xA8)
++
++#define AFC_CFG 					(volatile ulong *)(SMSC9118_BASE + 0xAC)
++#define 	AFC_CFG_AFC_HI_MSK		(0x00FF0000)
++#define 	AFC_CFG_AFC_LO_MSK		(0x0000FF00)
++
++#define E2P_CMD 					(volatile ulong *)(SMSC9118_BASE + 0xB0)
++#define E2P_DATA		  			(volatile ulong *)(SMSC9118_BASE + 0xB4)
++
++// MAC Control and Status Registers (accessed through MAC_CSR_CMD/_DATA regs)
++#define MAC_CR						(0x1)
++#define 	MAC_CR_RXALL			(0x80000000)
++#define 	MAC_CR_HBDIS			(0x10000000)
++#define 	MAC_CR_RCVOWN			(0x00800000)
++#define 	MAC_CR_LOOPBK			(0x00200000)
++#define 	MAC_CR_FDPX 	  		(0x00100000)
++#define 	MAC_CR_MCPAS			(0x00080000)
++#define 	MAC_CR_PRMS 	  		(0x00040000)
++#define 	MAC_CR_INVFILT			(0x00020000)
++#define 	MAC_CR_PASSBAD			(0x00010000)
++#define 	MAC_CR_HFILT			(0x00008000)
++#define 	MAC_CR_HPFILT			(0x00002000)
++#define 	MAC_CR_LCOLL			(0x00001000)
++#define 	MAC_CR_BCAST			(0x00000800)
++#define 	MAC_CR_DISRTY			(0x00000400)
++#define 	MAC_CR_PADSTR			(0x00000100)
++#define 	MAC_CR_BOLMT_MSK  		(0x000000C0)
++#define 	MAC_CR_BOLMT_10 		(0x00000000)
++#define 	MAC_CR_BOLMT_8			(0x00000040)
++#define 	MAC_CR_BOLMT_4			(0x00000080)
++#define 	MAC_CR_BOLMT_1			(0x000000C0)
++#define 	MAC_CR_DFCHK			(0x00000020)
++#define 	MAC_CR_TXEN 	  		(0x00000008)
++#define 	MAC_CR_RXEN 	  		(0x00000004)
++
++#define MAC_ADDRH		  			(0x2)
++#define 	MAC_ADDRH_MSK			(0x0000FFFF)
++
++#define MAC_ADDRL		  			(0x3)
++#define 	MAC_ADDRL_MSK			(0xFFFFFFFF)
++
++#define MAC_HASHH		  			(0x4)
++#define 	MAC_HASHH_MSK			(0xFFFFFFFF)
++
++#define MAC_HASHL		  			(0x5)
++#define 	MAC_HASHL_MSK			(0xFFFFFFFF)
++
++#define MAC_MIIACC		  			(0x6)
++#define 	MAC_MIIACC_MII_WRITE	(0x00000002)
++#define 	MAC_MIIACC_MII_BUSY 	(0x00000001)
++#define 	MAC_MII_RD_CMD(Addr,Reg)	(((Addr & 0x1f) << 11) | \
++										 ((Reg & 0x1f)) << 6)
++#define 	MAC_MII_WR_CMD(Addr,Reg)	(((Addr & 0x1f) << 11) | \
++							  			 ((Reg & 0x1f) << 6) | \
++							  			 MAC_MIIACC_MII_WRITE)
++
++#define MAC_MIIDATA 	  			(0x7)
++#define 	MAC_MIIDATA_MSK 		(0x0000FFFF)
++#define 	MAC_MII_DATA(Data)		(Data & MAC_MIIDATA_MSK)
++
++#define MAC_FLOW		  			(0x8)
++#define 	MAC_FLOW_FCPT_MSK 		(0xFFFF0000)
++#define 	MAC_FLOW_FCPASS 		(0x00000004)
++#define 	MAC_FLOW_FCEN			(0x00000002)
++#define 	MAC_FLOW_FCBSY			(0x00000001)
++
++#define MAC_VLAN1		  			(0x9)
++#define MAC_VLAN2		  			(0xA)
++#define MAC_WUFF		  			(0xB)
++
++#define MAC_WUCSR		  			(0xC)
++#define 	MAC_WUCSR_GUE			(0x00000200)
++#define 	MAC_WUCSR_WUFR			(0x00000040)
++#define 	MAC_WUCSR_MPR			(0x00000020)
++#define 	MAC_WUCSR_WUEN			(0x00000004)
++#define 	MAC_WUCSR_MPEN			(0x00000002)
++
++// PHY Control and Status Registers (accessed through MAC_MIIACC/_MIIDATA regs)
++#define PHY_BCR 					(0x0)
++#define 	PHY_BCR_RST 	  		(0x8000)
++#define 	PHY_BCR_LOOPBK			(0x4000)
++#define 	PHY_BCR_SS		  		(0x2000)
++#define 	PHY_BCR_ANE 	  		(0x1000)
++#define 	PHY_BCR_PWRDN			(0x0800)
++#define 	PHY_BCR_RSTAN			(0x0200)
++#define 	PHY_BCR_FDPLX			(0x0100)
++#define 	PHY_BCR_COLLTST 		(0x0080)
++
++#define PHY_BSR 					(0x1)
++#define 	PHY_BSR_100_T4_ABLE 	(0x8000)
++#define 	PHY_BSR_100_TX_FDPLX	(0x4000)
++#define 	PHY_BSR_100_TX_HDPLX	(0x2000)
++#define 	PHY_BSR_10_FDPLX  		(0x1000)
++#define 	PHY_BSR_10_HDPLX  		(0x0800)
++#define 	PHY_BSR_ANC 	  		(0x0020)
++#define 	PHY_BSR_REM_FAULT 		(0x0010)
++#define 	PHY_BSR_AN_ABLE 		(0x0008)
++#define 	PHY_BSR_LINK_STATUS 	(0x0004)
++#define 	PHY_BSR_JAB_DET 		(0x0002)
++#define 	PHY_BSR_EXT_CAP 		(0x0001)
++
++#define PHY_ID1 					(0x2)
++#define 	PHY_ID1_MSK 	  		(0xFFFF)
++#define 	PHY_ID1_LAN9118 		(0x0007)
++#define 	PHY_ID1_LAN9218 		(PHY_ID1_LAN9118)
++
++#define PHY_ID2 					(0x3)
++#define 	PHY_ID2_MSK 	  		(0xFFFF)
++#define 	PHY_ID2_MODEL_MSK 		(0x03F0)
++#define 	PHY_ID2_REV_MSK 		(0x000F)
++#define 	PHY_ID2_LAN9118 		(0xC0D1)
++#define 	PHY_ID2_LAN9218 		(0xC0C3)
++
++#define PHY_ANAR		  			(0x4)
++#define 	PHY_ANAR_NXTPG_CAP		(0x8000)
++#define 	PHY_ANAR_REM_FAULT		(0x2000)
++#define 	PHY_ANAR_PAUSE_OP_MSK	(0x0C00)
++#define 	PHY_ANAR_PAUSE_OP_NONE	(0x0000)
++#define 	PHY_ANAR_PAUSE_OP_ASLP	(0x0400)
++#define 	PHY_ANAR_PAUSE_OP_SLP	(0x0800)
++#define 	PHY_ANAR_PAUSE_OP_BOTH	(0x0C00)
++#define 	PHY_ANAR_100_T4_ABLE	(0x0200)
++#define 	PHY_ANAR_100_TX_FDPLX	(0x0100)
++#define 	PHY_ANAR_100_TX_ABLE	(0x0080)
++#define 	PHY_ANAR_10_FDPLX 		(0x0040)
++#define 	PHY_ANAR_10_ABLE  		(0x0020)
++
++#define PHY_ANLPAR		  			(0x5)
++#define 	PHY_ANLPAR_NXTPG_CAP	(0x8000)
++#define 	PHY_ANLPAR_ACK			(0x4000)
++#define 	PHY_ANLPAR_REM_FAULT	(0x2000)
++#define 	PHY_ANLPAR_PAUSE_CAP	(0x0400)
++#define 	PHY_ANLPAR_100_T4_ABLE	(0x0200)
++#define 	PHY_ANLPAR_100_TX_FDPLX (0x0100)
++#define 	PHY_ANLPAR_100_TX_ABLE	(0x0080)
++#define 	PHY_ANLPAR_10_FDPLX 	(0x0040)
++#define 	PHY_ANLPAR_10_ABLE		(0x0020)
++
++#define PHY_ANEXPR		  			(0x6)
++#define 	PHY_ANEXPR_PARDET_FAULT (0x0010)
++#define 	PHY_ANEXPR_LP_NXTPG_CAP (0x0008)
++#define 	PHY_ANEXPR_NXTPG_CAP	(0x0004)
++#define 	PHY_ANEXPR_NEWPG_REC	(0x0002)
++#define 	PHY_ANEXPR_LP_AN_ABLE	(0x0001)
++
++#define PHY_SILREV		  			(0x10)
++
++#define PHY_MCSR		  			(0x11)
++#define 	PHY_MCSR_FASTRIP  		(0x4000)
++#define 	PHY_MCSR_EDPWRDOWN		(0x2000)
++#define 	PHY_MCSR_LOWSQEN  		(0x0800)
++#define 	PHY_MCSR_MDPREBP  		(0x0400)
++#define 	PHY_MCSR_FASTEST  		(0x0100)
++#define 	PHY_MCSR_PHYADBP  		(0x0008)
++#define 	PHY_MCSR_FGLS			(0x0004)
++#define 	PHY_MCSR_ENERGYON 		(0x0002)
++
++#define PHY_SPMODES 	  			(0x12)
++
++#define PHY_CSIR		  			(0x1B)
++#define 	PHY_CSIR_SQEOFF 		(0x0800)
++#define 	PHY_CSIR_FEFIEN 		(0x0020)
++#define 	PHY_CSIR_XPOL			(0x0010)
++
++#define PHY_ISR 					(0x1C)
++#define 	PHY_ISR_INT7			(0x0080)
++#define 	PHY_ISR_INT6			(0x0040)
++#define 	PHY_ISR_INT5			(0x0020)
++#define 	PHY_ISR_INT4			(0x0010)
++#define 	PHY_ISR_INT3			(0x0008)
++#define 	PHY_ISR_INT2			(0x0004)
++#define 	PHY_ISR_INT1			(0x0002)
++
++#define PHY_IMR 					(0x1E)
++#define 	PHY_IMR_INT7			(0x0080)
++#define 	PHY_IMR_INT6			(0x0040)
++#define 	PHY_IMR_INT5			(0x0020)
++#define 	PHY_IMR_INT4			(0x0010)
++#define 	PHY_IMR_INT3			(0x0008)
++#define 	PHY_IMR_INT2			(0x0004)
++#define 	PHY_IMR_INT1			(0x0002)
++
++#define PHY_PHYSCSR 	  			(0x1F)
++#define 	PHY_PHYSCSR_ANDONE		(0x1000)
++#define 	PHY_PHYSCSR_4B5B_EN 	(0x0040)
++#define 	PHY_PHYSCSR_SPEED_MSK	(0x001C)
++#define 	PHY_PHYSCSR_SPEED_10HD	(0x0004)
++#define 	PHY_PHYSCSR_SPEED_10FD	(0x0014)
++#define 	PHY_PHYSCSR_SPEED_100HD (0x0008)
++#define 	PHY_PHYSCSR_SPEED_100FD (0x0018)
++#endif		// #ifndef _SMSC9118_H
++
++#endif		// CONFIG_DRIVER_SMSC9118
+--- u-boot-1.3.0/drivers/xxsccan.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/drivers/xxsccan.c	2009-02-26 15:34:29.000000000 +0100
+@@ -0,0 +1,238 @@
++/*
++ * (C) Copyright 2009
++ * Carsten Schneider, mycable GmbH, cs@mycable.de
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
++//!------------------------------------------------------------------------
++//!--- \defgroup    XXSCCAN Driver                                      ---
++//!---                                                                  ---
++//!--- \brief       XXSCCAN Driver - U-Boot                             ---
++//!---                                                                  ---
++//!--- \file        xxsccan.c                                           ---
++//!---                                                                  ---
++//!--- \date        2009                                                ---
++//!---                                                                  ---
++//!--- \author      Copyright (C) 2009 mycable GmbH                     ---
++//!--- \author      Carsten Schneider   <cs@mycable.de>                 ---
++//!---                                                                  ---
++//!--- \version     $Id: xxsccan.c 01 2009-01-08 10:38:16Z cs $         ---
++//!------------------------------------------------------------------------
++
++#include <common.h>
++#include "xxsccan.h"
++
++#ifdef CONFIG_DRIVER_XXSCCAN
++
++//!--------------------------------------------
++//!--- Initialization of CAN0 Interface     ---
++//!---                                      ---
++//!--- \fn canInit()                        ---
++//!---                                      ---
++//!--- \param None                          ---
++//!---                                      ---
++//!--- \return 0 on success                 ---
++//!--------------------------------------------
++int canInit( void )
++{
++    printf( "CAN0: canInit()-> Initialize CAN0 Interface!\n" );
++
++    //--- Enable Internal Initialization ---
++    SET_CAN0_BIT( CCCR, CR_INIT);
++
++    //--- Enable write access to bit timing register ---
++    SET_CAN0_BIT( CCCR, CR_CCE );
++
++    //--- Setting bit timing ---
++    SET_CAN0_REG( CCBT, 0x0000124C );
++
++    //--- Disable write access to bit timing register ---
++    CLEAR_CAN0_BIT( CCCR, CR_CCE);
++
++    //---  Error Interrupt Enable ---
++    SET_CAN0_BIT( CCCR, CR_EIE );
++
++    //--- Interrupt Enable ---
++    SET_CAN0_BIT( CCCR, CR_MIE );
++
++    //--- Enable Test Mode ---
++    SET_CAN0_BIT( CCCR, CR_TEST );
++
++    //--- Enable Basic Mode ---
++    SET_CAN0_BIT( CCTR, TR_BASIC );
++    
++    //--- Disable Internal Initialization, enable CAN communication ---
++    CLEAR_CAN0_BIT( CCCR, CR_INIT);
++
++    return 0;
++}
++
++//!--------------------------------------------
++//!--- Send message on CAN0 Interface       ---
++//!---                                      ---
++//!--- \fn canSend()                        ---
++//!---                                      ---
++//!--- \param canMessage T_CAN Pointer      ---
++//!---                                      ---
++//!--- \return 0    on success              ---
++//!--- \return -1   on error                ---
++//!--------------------------------------------
++int canSend( T_CAN *canMessage )
++{
++    int ret = 0;
++
++    if( canMessage != NULL )
++    {   
++        // CCIF1CM = 0x00B3
++        // Write
++        // Access arbitration
++        // Access control
++        // Access data bytes 0-3
++        // Access data bytes 4-7
++        SET_CAN0_REG( CCIF1CM, (IFXCM_DB | IFXCM_DA | IFXCM_CNTRL | IFXCM_ARB | IFXCM_WRRD) );
++    
++        // CCIF1A2 = 0xA000
++        // Msg buffer valid
++        // Direction = transmit
++        SET_CAN0_REG( CCIF1A2, (IFXARB2_MVAL | IFXARB2_DIR | ((u16)(canMessage->id << 2) & 0x1FFC)) );
++    
++        // CCIF1DMC = 0x0182
++        // Set transmit request
++        // End of buffer
++        // Data length = x bytes
++        SET_CAN0_REG( CCIF1DMC, (IFXMC_EOB | IFXMC_TXRQST | (canMessage->length & 0xF)) );
++
++        switch( canMessage->length )
++        {
++            case 8:
++                 SET_CAN0_REG( CCIF1DB2, ((canMessage->data[7] << 8) & 0xFF00));
++            case 7:
++                 SET_CAN0_REG( CCIF1DB2, (GET_CAN0_REG( CCIF1DB2 ) | canMessage->data[6]) );
++            case 6:
++                 SET_CAN0_REG( CCIF1DB1, ((canMessage->data[5] << 8) & 0xFF00));
++            case 5:
++                 SET_CAN0_REG( CCIF1DB1, (GET_CAN0_REG( CCIF1DB1 ) | canMessage->data[4]) );
++            case 4:
++                 SET_CAN0_REG( CCIF1DA2, ((canMessage->data[3] << 8) & 0xFF00));
++            case 3:
++                 SET_CAN0_REG( CCIF1DA2, (GET_CAN0_REG( CCIF1DA2 ) | canMessage->data[2]) );
++            case 2:
++                 SET_CAN0_REG( CCIF1DA1, ((canMessage->data[1] << 8) & 0xFF00));
++            case 1:
++                 SET_CAN0_REG( CCIF1DA1, (GET_CAN0_REG( CCIF1DA1 ) | canMessage->data[0]) );
++            default :
++                break;
++        }
++        
++        // CCIF1CR = 0x8000;
++        // Transmit contents of IF Register 1
++        SET_CAN0_REG( CCIF1CR, IFXMC_NEWDAT );
++
++        ret = 0;
++    }
++    else
++    {
++        //--- Error ---
++        printf("ERROR: canSend()-> canMessage is NULL!!\n");
++        ret = -1;
++    }
++
++    return ret;
++}
++
++//!--------------------------------------------
++//!--- Receive message on CAN0 Interface    ---
++//!---                                      ---
++//!--- \fn canReceive()                     ---
++//!---                                      ---
++//!--- \param canMessage T_CAN Pointer      ---
++//!---                                      ---
++//!--- \return 1-8  data length             ---
++//!--- \return 0    no pending message      ---
++//!--- \return -1   on error                ---
++//!--------------------------------------------
++int canReceive( T_CAN *canMessage )
++{
++    int ret = 0;
++
++    if( canMessage != NULL )
++    {
++        if( GET_CAN0_REG( CCIF2DMC ) & IFXMC_NEWDAT )
++        {
++            //--- New data ---
++            canMessage->length = GET_CAN0_REG( CCIF2DMC ) & 0x0000000F;
++
++            // printf( "CAN0: canReceive()-> %i Bytes received!\n", canMessage->length );
++
++            switch( canMessage->length )
++            {
++                case 8:
++                    canMessage->data[7] = ((GET_CAN0_REG( CCIF2DB2 ) & 0xFF00) >> 8);
++                case 7:
++                    canMessage->data[6] = (GET_CAN0_REG( CCIF2DB2 ) & 0x00FF);
++                case 6:
++                    canMessage->data[5] = ((GET_CAN0_REG( CCIF2DB1 ) & 0xFF00) >> 8);
++                case 5:
++                    canMessage->data[4] = (GET_CAN0_REG( CCIF2DB1 ) & 0x00FF);
++                case 4:
++                    canMessage->data[3] = ((GET_CAN0_REG( CCIF2DA2 ) & 0xFF00) >> 8);
++                case 3:
++                    canMessage->data[2] = (GET_CAN0_REG( CCIF2DA2 ) & 0x00FF);
++                case 2:
++                    canMessage->data[1] = ((GET_CAN0_REG( CCIF2DA1 ) & 0xFF00) >> 8);
++                case 1:
++                    canMessage->data[0] = (GET_CAN0_REG( CCIF2DA1 ) & 0x00FF);
++                default :
++                    break;
++            }
++
++            if( GET_CAN0_REG( CCIF2A2 ) & IFXMSK2_MXTD )
++            {
++                canMessage->id  = (GET_CAN0_REG( CCIF2A2 ) & IDHIGH) << 16; // Extended ID
++
++                canMessage->id |= (GET_CAN0_REG( CCIF2A1 ) & IDLOW);       // Extended ID            }
++            }
++            else
++            {
++                canMessage->id = (GET_CAN0_REG( CCIF2A2 ) & IDHIGH) >> 2;   // Standard ID
++            }
++        
++            ret = canMessage->length;
++        }
++        else
++        {
++            //--- No new data ---
++            // printf("CAN0: No new data!\n");
++            ret = 0;
++        }
++    }
++    else
++    {
++        //--- Error ---
++        printf("ERROR: canReceive()-> canMessage is NULL!!\n");
++        ret = -1;
++    }
++
++    //--- Clear new data flag ---
++    CLEAR_CAN0_BIT( CCIF2DMC, IFXMC_NEWDAT );
++
++    return ret;
++}
++
++#endif // CONFIG_DRIVER_XXSCCAN
+--- u-boot-1.3.0/drivers/xxsccan.h	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/drivers/xxsccan.h	2009-02-26 15:34:29.000000000 +0100
+@@ -0,0 +1,236 @@
++/*
++ * (C) Copyright 2009
++ * Carsten Schneider, mycable GmbH, cs@mycable.de
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
++//!------------------------------------------------------------------------
++//!--- \defgroup    XXSCCAN Driver                                      ---
++//!---                                                                  ---
++//!--- \brief       XXSCCAN Driver - U-Boot                             ---
++//!---                                                                  ---
++//!--- \file        xxsccan.h                                           ---
++//!---                                                                  ---
++//!--- \date        2009                                                ---
++//!---                                                                  ---
++//!--- \author      Copyright (C) 2009 mycable GmbH                     ---
++//!--- \author      Carsten Schneider   <cs@mycable.de>                 ---
++//!---                                                                  ---
++//!--- \version     $Id: xxsccan.h 01 2009-01-08 10:38:16Z cs $         ---
++//!------------------------------------------------------------------------
++
++#ifdef CONFIG_DRIVER_XXSCCAN
++
++#ifndef     _XXSCCAN_H
++#define     _XXSCCAN_H
++
++#define CAN0_PHYS_BASE  0xfff54000  /* CAN 0 phys */
++#define CAN1_PHYS_BASE  0xfff55000  /* CAN 1 phys */
++
++/* C_CAN address */
++#define CCCR            0x0000  /* Control Register */
++#define CCSR            0x0004  /* Status Register */
++#define CCEC            0x0008  /* Error Counting Register */
++#define CCBT            0x000C  /* Bit Timing Register */
++#define CCINTR          0x0010  /* Interrupt Register */
++#define CCTR            0x0014  /* Test Register */
++#define CCBRPE          0x0018  /* Baud Rate Prescaler Extension Register */
++#define CCCE            0x001C  /* CAN Enable Register */
++#define CCTREQ1         0x0100  /* Transmission Request 1 Register */
++#define CCTREQ2         0x0104  /* Transmission Request 2 Register */
++#define CCND1           0x0120  /* New Data 1 Register */
++#define CCND2           0x0124  /* New Data 2 Register */
++#define CCINTP1         0x0140  /* Interrupt Pending 1 Register */
++#define CCINTP2         0x0144  /* Interrupt Pending 2 Register */
++
++#define CCIF1CR         0x0020  /* Interface 1 Command Request Register */
++#define CCIF1CM         0x0024  /* IF1 Command Mask Register */
++#define CCIF1M1         0x0028  /* IF1 Mask 1 Register */
++#define CCIF1M2         0x002C  /* IF1 Mask 2 Register */
++#define CCIF1A1         0x0030  /* IF1 Arbitration 1 Register */
++#define CCIF1A2         0x0034  /* IF1 Arbitration 2 Register */
++#define CCIF1DMC        0x0038  /* IF1 Message Control Register */
++#define CCIF1DA1        0x003C  /* IF1 Data A 1 Register */
++#define CCIF1DA2        0x0040  /* IF1 Data A 2 Register */
++#define CCIF1DB1        0x0044  /* IF1 Data B 1 Register */
++#define CCIF1DB2        0x0048  /* IF1 Data B 2 Register */
++
++#define CCIF2CR         0x0080  /* Interface 2 Command Request Register */
++#define CCIF2CM         0x0084  /* IF2 Command Mask Register */
++#define CCIF2M1         0x0088  /* IF2 Mask 1 Register */
++#define CCIF2M2         0x008C  /* IF2 Mask 2 Register */
++#define CCIF2A1         0x0090  /* IF2 Arbitration 1 Register */
++#define CCIF2A2         0x0094  /* IF2 Arbitration 2 Register */
++#define CCIF2DMC        0x0098  /* IF2 Message Control Register */
++#define CCIF2DA1        0x009C  /* IF2 Data A 1 Register */
++#define CCIF2DA2        0x00A0  /* IF2 Data A 2 Register */
++#define CCIF2DB1        0x00A4  /* IF2 Data B 1 Register */
++#define CCIF2DB2        0x00A8  /* IF2 Data B 2 Register */
++
++#define IDLOW           0xFFFF
++#define IDHIGH          0x1FFF
++
++/* Control register */
++enum c_can_BASIC_CR
++{
++    CR_INIT = 1,    /* Internal Initialization Pending */
++    CR_MIE  = 1<<1, /* Module Interrupt Enable */
++    CR_SIE  = 1<<2, /* Status-change Interrupt Enable */
++    CR_EIE  = 1<<3, /* Error Interrupt Enable */
++    CR_DAR  = 1<<5, /* Disable Automatic Retransmission */
++    CR_CCE  = 1<<6, /* Configuration Change Enable */
++    CR_TEST = 1<<7  /* Test Mode Enable */
++};
++
++/* Status Register */
++enum c_can_BASIC_SR
++{
++    SR_TXOK  = 1<<3,/* Transmitted a Message Successfully */
++    SR_RXOK  = 1<<4,/* Received a Message Successfully */
++    SR_EPASS = 1<<5,/* Error Passive */
++    SR_EWARN = 1<<6,/* Error Warning Status */
++    SR_BOFF  = 1<<7,/* Bus Off Status */
++};
++
++/* Status Register Last Error Codes */
++enum c_can_BASIC_SRLEC
++{
++    SRLEC_NE = 0,   /* Last Error Code: No Error */
++    SRLEC_SE = 1,   /* LEC: Stuff Error */
++    SRLEC_FE = 2,   /* LEC: Form Error */
++    SRLEC_AE = 3,   /* LEC: Acknowledgement Error */
++    SRLEC_B1 = 4,   /* LEC: Bit1 Error */
++    SRLEC_B0 = 5,   /* LEC: Bit0 Error */
++    SRLEC_CR = 6    /* LEC: CRC Error */
++};
++
++/* Error Counting Register */
++enum c_can_BASIC_EC
++{
++    EC_REP = 1<<15  /* Receive Error Passive */
++};
++
++/* Interrupt Register */
++enum c_can_BASIC_INT
++{
++    INT_NOINT = 0,      /* No Interrupt is pending */
++    INT_STAT  = 0x8000  /* Status Interrupt */
++};
++
++/* CAN Test Register */
++enum c_can_BASIC_TR
++{
++    TR_BASIC = 1<<2,/* Basic Mode */
++    TR_SLNT  = 1<<3,/* Silent Mode */
++    TR_LOOPB = 1<<4,/* Loop Back Mode */
++    TR_RX    = 1<<7 /* Receive (CAN_RX Pin) */
++};
++
++/* CAN Test Register TX Control*/
++enum c_can_BASIC_TRTX
++{
++    TRTX_RST = 0,   /* Reset value, CAN_TX is controlled by the CAN Core */
++    TRTX_MON = 1,   /* Sample Point can be monitored at CAN_TX pin */
++    TRTX_DOM = 2,   /* CAN_TX pin drives a dominant('0') value */
++    TRTX_REC = 3    /* CAN_TX pin drives a recessive('1') value */
++};
++
++/* CAN Enable Register */
++enum c_can_BASIC_CE
++{
++    CE_EN  = 1      /* CAN Enable Bit */
++};
++
++/* Interface X Command Request Register */
++enum c_can_BASIC_IFXCR
++{
++    IFXCR_BUSY = 1<<15      /* Busy Flag (Write Access only when Busy='0') */
++};
++
++/* Interface X Command Mask Register */
++enum c_can_BASIC_IFXCM
++{
++    IFXCM_DB        = 1,    /* R/W Data Byte 4-7 */
++    IFXCM_DA        = 1<<1, /* R/W Data Byte 0-3 */
++    IFXCM_TRND      = 1<<2, /* Transmit Request (WRRD=1) or Reset New Date Bit (WRRD=0) */
++    IFXCM_CLRINTPND = 1<<3, /* Clear Interrupt Pending Bit when reading the Message Object */
++    IFXCM_CNTRL     = 1<<4, /* Access Interface X Message Control Bits */
++    IFXCM_ARB       = 1<<5, /* Access Interface X Arbitration */
++    IFXCM_MASK      = 1<<6, /* Access Interface X Mask Bits */
++    IFXCM_WRRD      = 1<<7  /* Read/Write (write data from Interface Registers to Message Object if ='1') */
++                            /*            (read data from Message Object to Interface Registers if ='0') */
++};
++
++/* Interface X Mask 2 Register */
++enum c_can_BASIC_IFXMSK2
++{
++    IFXMSK2_MDIR = 1<<14,   /* Mask Message Direction (message direction bit(RTR) used for acceptance filt. or not) */
++    IFXMSK2_MXTD = 1<<15    /* Mask Extended Identifier (extended id bit(IDE) used for acceptance filt. or not) */
++};
++
++/* Interface X Arbitration 2 Register */
++enum c_can_BASIC_IFXARB2
++{
++    IFXARB2_DIR  = 1<<13,   /* Message Direction (transmit='1') */
++    IFXARB2_XTD  = 1<<14,   /* Use Extended Identifier */
++    IFXARB2_MVAL = 1<<15    /* Message Validation */
++};
++
++/* Interface X Message Control Register */
++enum c_can_BASIC_IFXMC
++{
++    IFXMC_EOB    = 1<<7,    /* End of Buffer (marks last Message Object of FIFO Buffer) */
++    IFXMC_TXRQST = 1<<8,    /* Transmit Request */
++    IFXMC_RMTEN  = 1<<9,    /* Remote Enable */
++    IFXMC_RXIE   = 1<<10,   /* Receive Interrupt Enable */
++    IFXMC_TXIE   = 1<<11,   /* Transmit Interrupt Enable */
++    IFXMC_UMASK  = 1<<12,   /* Use Identifier Mask */
++    IFXMC_INTPND = 1<<13,   /* Interrupt Pending */
++    IFXMC_MSGLST = 1<<14,   /* Message Lost (Only valid for direction = receive) */
++    IFXMC_NEWDAT = 1<<15    /* New Data */
++};
++
++#define GET_CAN0_REG(reg)           (*((volatile u32 *)(CAN0_PHYS_BASE + reg)))
++#define SET_CAN0_REG(reg, val)      (*((volatile u32 *)(CAN0_PHYS_BASE + reg)) = ((u32)(val)))
++
++#define GET_CAN1_REG(reg)           (*((volatile u32 *)(CAN1_PHYS_BASE + reg)))
++#define SET_CAN1_REG(reg, val)      (*((volatile u32 *)(CAN1_PHYS_BASE + reg)) = ((u32)(val)))
++
++#define SET_CAN0_BIT(reg, bit)      (*((volatile u32 *)(CAN0_PHYS_BASE + reg)) |= ((u32)bit))
++#define CLEAR_CAN0_BIT(reg, bit)    (*((volatile u32 *)(CAN0_PHYS_BASE + reg)) &= ~((u32)bit))
++
++#define SET_CAN1_BIT(reg, bit)      (*((volatile u32 *)(CAN1_PHYS_BASE + reg)) |= ((u32)bit))
++#define CLEAR_CAN1_BIT(reg, bit)    (*((volatile u32 *)(CAN1_PHYS_BASE + reg)) &= ~((u32)bit))
++
++typedef struct
++{
++    u32 id;                 // Message ID
++
++    u8  length;             // Length of data
++    u8  data[8];
++    
++} T_CAN;
++
++int canInit( void );
++int canSend( T_CAN *canMessage );
++int canReceive( T_CAN *canMessage );
++
++#endif // _XXSCCAN_H
++
++#endif // CONFIG_DRIVER_XXSCCAN
+--- u-boot-1.3.0/examples/mips.lds	2009-02-26 15:34:27.000000000 +0100
++++ u-boot-1.3.0-dev/examples/mips.lds	2009-02-26 15:34:29.000000000 +0100
+@@ -24,7 +24,7 @@
+ /*
+ OUTPUT_FORMAT("elf32-bigmips", "elf32-bigmips", "elf32-bigmips")
+ */
+-OUTPUT_FORMAT("elf32-tradbigmips", "elf32-tradbigmips", "elf32-tradbigmips")
++OUTPUT_FORMAT("elf32-tradlittlemips", "elf32-tradlittlemips", "elf32-tradlittlemips")
+ OUTPUT_ARCH(mips)
+ SECTIONS
+ {
+--- u-boot-1.3.0/include/asm-arm/arch-jade/hardware.h	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/include/asm-arm/arch-jade/hardware.h	2009-02-26 15:34:27.000000000 +0100
+@@ -0,0 +1,31 @@
++/*
++ * (C) Copyright 2007
++ *
++ * Author : Carsten Schneider, mycable GmbH 
++ *          <cs@mycable.de> 
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
++#ifndef __ASM_ARCH_HARDWARE_H
++#define __ASM_ARCH_HARDWARE_H
++
++#include <asm/sizes.h>
++#include <asm/arch/jade.h>
++
++#endif 
+--- u-boot-1.3.0/include/asm-arm/arch-jade/jade.h	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/include/asm-arm/arch-jade/jade.h	2009-02-26 15:34:27.000000000 +0100
+@@ -0,0 +1,182 @@
++/*
++ * (C) Copyright 2007
++ *
++ * jade definitions
++ *
++ * Author : Carsten Schneider, mycable GmbH
++ *          <cs@mycable.de>
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
++
++#ifndef JADE_H
++#define JADE_H
++
++typedef	volatile unsigned int	JREG;	/* Hardware register definition */
++
++/*
++ * Physical Address Defines
++ */
++#define JADE_GDC_PHYS_BASE	0xf1fc0000  /* GDC phys */
++#define JADE_GDC_PHYS_DISP_BASE	0xf1fd0000  /* GDC DisplayBase phys */
++#define JADE_CCNT_PHYS_BASE	0xfff42000  /* Chip Control Module */
++#define JADE_CAN0_PHYS_BASE	0xfff54000  /* CAN 0 phys */
++#define JADE_CAN1_PHYS_BASE	0xfff55000  /* CAN 1 phys */
++#define JADE_I2C0_PHYS_BASE	0xfff56000  /* I2C 0 phys */
++#define JADE_I2C1_PHYS_BASE	0xfff57000  /* I2C 1 phys */
++#define JADE_EHCI_PHYS_BASE	0xfff80000  /* EHCI phys */
++#define JADE_OHCI_PHYS_BASE	0xfff81000  /* OHCI phys */
++#define JADE_IRC1_PHYS_BASE	0xfffb0000  /* Jade cascaded Interrupt Controller phys */
++#define JADE_TIMER_PHYS_BASE	0xfffe0000  /* Counter/Timers JADE phys */
++#define JADE_UART0_PHYS_BASE	0xfffe1000  /* UART 0 phys */
++#define JADE_UART1_PHYS_BASE	0xfffe2000  /* UART 1 phys */
++#define JADE_IRCE_PHYS_BASE	0xfffe4000  /* Extended Interrupt Controller */
++#define JADE_CRG_PHYS_BASE	0xfffe7000  /* Clock Reset Generator */
++#define JADE_IRC0_PHYS_BASE	0xfffe8000  /* Jade Interrupt Controller phys */
++#define JADE_GPIO_PHYS_BASE	0xfffe9000  /* GPIO phys */
++
++
++/* -------- DRAMC_DRIC : (DRAMC Offset: 0x0) DRAM Controller Mode Register --------  */
++
++/********************************************************************************
++ *              REGISTER ADDRESS DEFINITION FOR DRAMC PERIPHERAL                *
++ ********************************************************************************/
++#define JREGC_DRAMC_DRIC	((JREG *) 0xF3000000) /* DRAM Controller Initialization control register */
++#define	JREGC_DRAMC_DRIC1	((JREG *) 0xF3000002) /* DRAM Controller Init control command register 1 */
++#define	JREGC_DRAMC_DRIC2	((JREG *) 0xF3000004) /* DRAM Controller Init control command register 2 */
++#define	JREGC_DRAMC_DRCA	((JREG *) 0xF3000006) /* DRAM Controller Address control register */
++#define	JREGC_DRAMC_DRCM 	((JREG *) 0xF3000008) /* DRAM Controller Modal control register */
++#define	JREGC_DRAMC_DRCST1	((JREG *) 0xF300000A) /* DRAM Controller Timing setting register 1 */
++#define	JREGC_DRAMC_DRCST2	((JREG *) 0xF300000C) /* DRAM Controller Timing setting register 2 */
++#define	JREGC_DRAMC_DRCR	((JREG *) 0xF300000E) /* DRAM Controller Refresh control register */
++#define JREGC_DRAMC_DRCS	((JREG *) 0xF3000020) /* DRAM Controller Status control register */
++#define JREGC_DRAMC_DRASR	((JREG *) 0xF3000030) /* DRAM Controller AXI operation setting register */
++#define JREGC_DRAMC_DRIMS1	((JREG *) 0xF3000042) /* DRAM Controller IF control register 1 */
++#define JREGC_DRAMC_DRIMS2A1	((JREG *) 0xF3000044) /* DRAM Controller IF control register 2 */
++#define JREGC_DRAMC_DRIMS3A2	((JREG *) 0xF3000046) /* DRAM Controller IF control register 3 */
++#define JREGC_DRAMC_DRIMS4	((JREG *) 0xF3000048) /* DRAM Controller IF control register 4 */
++#define JREGC_DRAMC_DRIMS5	((JREG *) 0xF300004A) /* DRAM Controller IF control register 5 */
++#define JREGC_DRAMC_DRIMS6	((JREG *) 0xF300004C) /* DRAM Controller IF control register 6 */
++#define JREGC_DRAMC_DRIMS7D1	((JREG *) 0xF300004E) /* DRAM Controller IF control register 7 */
++#define JREGC_DRAMC_DRIMS8D2	((JREG *) 0xF3000050) /* DRAM Controller IF control register 8 */
++#define JREGC_DRAMC_DRIMS9T1	((JREG *) 0xF3000052) /* DRAM Controller IF control register 9 */
++#define JREGC_DRAMC_DRIMSS10T2	((JREG *) 0xF3000054) /* DRAM Controller IF control register 10 */
++#define JREGC_DRAMC_DROS	((JREG *) 0xF3000060) /* DRAM Controller ODT setting register */
++#define JREGC_DRAMC_DRIBSLI	((JREG *) 0xF3000062) /* DRAM Controller IO LOOPBACK setting register */
++#define JREGC_DRAMC_DRIBSODT1	((JREG *) 0xF3000064) /* DRAM Controller IO ODT1 setting register */
++#define JREGC_DRAMC_DRIBSOCD	((JREG *) 0xF3000066) /* DRAM Controller IO OCD setting register */
++#define JREGC_DRAMC_DRIBSOCD2	((JREG *) 0xF3000068) /* DRAM Controller IO OCD2 setting register */
++#define JREGC_DRAMC_DROABA	((JREG *) 0xF3000070) /* DRAM Controller ODT bias self adjustment register */
++#define JREGC_DRAMC_DROBV	((JREG *) 0xF3000080) /* DRAM Controller ODT bias value register */
++#define JREGC_DRAMC_DROBS	((JREG *) 0xF3000084) /* DRAM Controller ODT bias selection register */
++#define JREGC_DRAMC_DROBSR1	((JREG *) 0xF3000086) /* DRAM Controller ODT bias setting register 1 */
++#define JREGC_DRAMC_DROBSR2	((JREG *) 0xF3000088) /* DRAM Controller ODT bias setting register 2 */
++#define JREGC_DRAMC_DROBSR3	((JREG *) 0xF300008A) /* DRAM Controller ODT bias setting register 3 */
++#define JREGC_DRAMC_DROBSR4	((JREG *) 0xF300008C) /* DRAM Controller ODT bias setting register 4 */
++#define JREGC_DRAMC_DRIMR1	((JREG *) 0xF3000090) /* DRAM Controller IO monitor register 1 */
++#define JREGC_DRAMC_DRIMR2	((JREG *) 0xF3000092) /* DRAM Controller IO monitor register 2 */
++#define JREGC_DRAMC_DRIMR3	((JREG *) 0xF3000094) /* DRAM Controller IO monitor register 3 */
++#define JREGC_DRAMC_DRIMR4	((JREG *) 0xF3000096) /* DRAM Controller IO monitor register 4 */
++#define JREGC_DRAMC_DROISR1	((JREG *) 0xF3000098) /* DRAM Controller OCD impedance setting register 1 */
++#define JREGC_DRAMC_DROISR2	((JREG *) 0xF300009A) /* DRAM Controller OCD impedance setting register 2 */
++
++
++
++/******************************************************************************
++ *              REGISTER ADDRESS DEFINITION FOR GPIO PERIPHERAL               *
++ ******************************************************************************/
++/* GPIO Port data register */
++#define GPIO_PORT_DATA		0x00
++/* GPIO Data Direction */
++#define GPIO_DIRECTION		0x10
++
++/* GPIO Block Defines */
++#define GPIO_BLOCK_0		0x00
++#define GPIO_BLOCK_1		0x04
++#define GPIO_BLOCK_2		0x08
++
++/* ------------------------------------------------------------------------
++ *  JADE Chip Control Module
++ * ------------------------------------------------------------------------
++ */
++
++#define CCNT_CGPIO_IST	0x18	/* GPIO interrupt status register */
++#define CCNT_CGPIO_ISTM	0x1c	/* GPIO interrupt status mask register */
++#define CCNT_CGPIO_IP	0x20	/* GPIO interrupt polarity setting register */
++#define CCNT_CGPIO_IM	0x24	/* GPIO interrupt mode setting register */
++#define CCNT_CMUX_MD	0x30	/* MultiplexMode setting register */
++
++/********************************************************************************
++ *              REGISTER ADDRESS DEFINITION FOR UART0 PERIPHERAL                *
++ ********************************************************************************/
++#define JREGC_UART0_URT0RFR	((JREG *) 0xFFFE1000) /* UART0 Reception FIFO register */
++#define JREGC_UART0_URT0TFR	((JREG *) 0xFFFE1000) /* UART0 Transmission register */
++#define JREGC_UART0_URT0DLL	((JREG *) 0xFFFE1000) /* UART0 Dividing value */
++#define JREGC_UART0_URT0IER	((JREG *) 0xFFFE1004) /* UART0 DLAB=0: Interrupt enable register */
++#define JREGC_UART0_URT0DLM	((JREG *) 0xFFFE1004) /* UART0 DLAB=1: Dividing value (upper byte) */
++#define JREGC_UART0_URT0IIR	((JREG *) 0xFFFE1008) /* UART0 Interrupt ID register (read only) */
++#define JREGC_UART0_URT0FCR	((JREG *) 0xFFFE1008) /* UART0 FIFO control register (write only) */
++#define JREGC_UART0_URT0LCR	((JREG *) 0xFFFE100C) /* UART0 Line control register */
++#define JREGC_UART0_URT0MCR	((JREG *) 0xFFFE1010) /* UART0 Modem control register */
++#define JREGC_UART0_URT0LSR	((JREG *) 0xFFFE1014) /* UART0 Line status register */
++#define JREGC_UART0_URT0MSR	((JREG *) 0xFFFE1018) /* UART0 Modem status register */
++#define JREGC_UART0_URT0SCR	((JREG *) 0xFFFE101C) /* UART0 Scratch register (At DLAB=0) */
++
++/********************************************************************************
++ *              REGISTER ADDRESS DEFINITION FOR UART1 PERIPHERAL                *
++ ********************************************************************************/
++#define JREGC_UART1_URT1RFR	((JREG *) 0xFFFE2000) /* UART1 Reception FIFO register */
++#define JREGC_UART1_URT1TFR	((JREG *) 0xFFFE2000) /* UART1 Transmission register */
++#define JREGC_UART1_URT1DLL	((JREG *) 0xFFFE2000) /* UART1 Dividing value */
++#define JREGC_UART1_URT1IER	((JREG *) 0xFFFE2004) /* UART1 DLAB=0: Interrupt enable register */
++#define JREGC_UART1_URT1DLM	((JREG *) 0xFFFE2004) /* UART1 DLAB=1: Dividing value (upper byte) */
++#define JREGC_UART1_URT1IIR	((JREG *) 0xFFFE2008) /* UART1 Interrupt ID register (read only) */
++#define JREGC_UART1_URT1FCR	((JREG *) 0xFFFE2008) /* UART1 FIFO control register (write only) */
++#define JREGC_UART1_URT1LCR	((JREG *) 0xFFFE200C) /* UART1 Line control register */
++#define JREGC_UART1_URT1MCR	((JREG *) 0xFFFE2010) /* UART1 Modem control register */
++#define JREGC_UART1_URT1LSR	((JREG *) 0xFFFE2014) /* UART1 Line status register */
++#define JREGC_UART1_URT1MSR	((JREG *) 0xFFFE2018) /* UART1 Modem status register */
++#define JREGC_UART1_URT1SCR	((JREG *) 0xFFFE201C) /* UART1 Scratch register (At DLAB=0) */
++
++
++/********************************************************************************
++ *              REGISTER ADDRESS DEFINITION FOR CLOCK/RESET INTERFACE           *
++ ********************************************************************************/
++#define JREGC_CRG_CRPR		((JREG *) 0xFFFE7000) /* CRG PLL control register */
++#define JREGC_CRG_CRWR		((JREG *) 0xFFFE7008) /* CRG Watchdog timer control register */
++#define JREGC_CRG_CRSR		((JREG *) 0xFFFE700C) /* CRG Reset/standby control register */
++#define JREGC_CRG_CRDA		((JREG *) 0xFFFE7010) /* CRG Clock divider control register A */
++#define JREGC_CRG_CRDB		((JREG *) 0xFFFE7014) /* CRG Clock divider control register B */
++#define JREGC_CRG_CRHA		((JREG *) 0xFFFE7018) /* CRG (AHB(A) bus) bus clock gate control register */
++#define JREGC_CRG_CRPA		((JREG *) 0xFFFE701C) /* CRG (APB(A) bus) bus clock gate control register */
++#define JREGC_CRG_CRPB		((JREG *) 0xFFFE7020) /* CRG (APB(B) bus) bus clock gate control register */
++#define JREGC_CRG_CRHB		((JREG *) 0xFFFE7024) /* CRG (AHB(B) bus) bus clock gate control register */
++#define JREGC_CRG_CRAM		((JREG *) 0xFFFE7028) /* CRG ARM core clock gate control register */
++
++
++/********************************************************************************
++ *              REGISTER BASE ADDRESS DEFINITION FOR PERIPHERAL                 *
++ ********************************************************************************/
++#define JREGC_BASE_DRAM		((JREGPS_DRAMC)	0xF3000000) /* (DRAMC) Base Address */
++#define JREGC_BASE_GPIO		((JREGPS_GPIO)  0xFFFE9000) /* (GPIO)  Base Address */
++#define JREGC_BASE_UART0	((JREGPS_UART0) 0xFFFE1000) /* (UART0)  Base Address */
++#define JREGC_BASE_UART1	((JREGPS_UART1) 0xFFFE2000) /* (UART1)  Base Address */
++
++
++#endif /* jade_H */
+--- u-boot-1.3.0/include/asm-arm/mach-types.h	2007-11-19 21:20:24.000000000 +0000
++++ u-boot-1.3.0-dev/include/asm-arm/mach-types.h	2009-11-16 14:17:14.000000000 +0000
+@@ -741,7 +741,9 @@
+ #define MACH_TYPE_AT91SAM9260EK       1099
+ #define MACH_TYPE_AT91RM9200DF        1119
+ #define MACH_TYPE_AT91SAM9263EK       1202
+-
++#define MACH_TYPE_XXSVIDEO            1399
++#define MACH_TYPE_XXSVIDEOD           2526
++ 
+ #ifdef CONFIG_ARCH_EBSA110
+ # ifdef machine_arch_type
+ #  undef machine_arch_type
+--- u-boot-1.3.0/include/flash.h	2009-02-26 15:34:26.000000000 +0100
++++ u-boot-1.3.0-dev/include/flash.h	2009-02-26 15:34:27.000000000 +0100
+@@ -432,6 +432,7 @@
+ #define FLASH_28F256J3A 0x00C6		/* INTEL 28F256J3A (256M = 128K x 256)	*/
+ 
+ #define FLASH_FUJLV650	0x00D0		/* Fujitsu MBM 29LV650UE/651UE		*/
++#define FLASH_FUJDL640E	0x00D1  	/* Fujitsu MBM 29DL640E                 */
+ #define FLASH_MT28S4M16LC 0x00E1	/* Micron MT28S4M16LC			*/
+ #define FLASH_S29GL064M 0x00F0		/* Spansion S29GL064M-R6		*/
+ #define FLASH_S29GL128N 0x00F1		/* Spansion S29GL128N			*/
+--- u-boot-1.3.0/lib_arm/board.c	2009-02-26 15:34:27.000000000 +0100
++++ u-boot-1.3.0-dev/lib_arm/board.c	2009-02-26 15:34:28.000000000 +0100
+@@ -51,6 +51,9 @@
+ #ifdef CONFIG_DRIVER_LAN91C96
+ #include "../drivers/lan91c96.h"
+ #endif
++#ifdef CONFIG_DRIVER_SMSC9118
++#include "../drivers/smsc9118.h"
++#endif
+ 
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+@@ -412,6 +415,12 @@
+ 	}
+ #endif /* CONFIG_DRIVER_SMC91111 || CONFIG_DRIVER_LAN91C96 */
+ 
++#if defined(CONFIG_DRIVER_SMSC9118)
++	if (getenv ("ethaddr")) {
++		smsc9118_set_mac(gd->bd->bi_enetaddr);
++	}
++#endif /* CONFIG_DRIVER_SMSC9118 */
++
+ 	/* Initialize from environment */
+ 	if ((s = getenv ("loadaddr")) != NULL) {
+ 		load_addr = simple_strtoul (s, NULL, 16);
+--- u-boot-1.3.0/Makefile	2009-02-26 15:34:27.000000000 +0100
++++ u-boot-1.3.0-dev/Makefile	2009-02-26 15:34:29.000000000 +0100
+@@ -24,7 +24,7 @@
+ VERSION = 1
+ PATCHLEVEL = 3
+ SUBLEVEL = 0
+-EXTRAVERSION =
++EXTRAVERSION = -XXSVIDEO_EXTENSION-XXSVIDEO_UBOOT_RELEASE
+ U_BOOT_VERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+ VERSION_FILE = $(obj)include/version_autogenerated.h
+ 
+@@ -126,13 +126,14 @@
+ CROSS_COMPILE = ppc_8xx-
+ endif
+ ifeq ($(ARCH),arm)
+-CROSS_COMPILE = arm-linux-
++#CROSS_COMPILE = arm-softfloat-linux-gnu-
++CROSS_COMPILE = arm-unknown-linux-gnueabi-
+ endif
+ ifeq ($(ARCH),i386)
+ CROSS_COMPILE = i386-linux-
+ endif
+ ifeq ($(ARCH),mips)
+-CROSS_COMPILE = mips_4KC-
++CROSS_COMPILE = mipsel-linux-
+ endif
+ ifeq ($(ARCH),nios)
+ CROSS_COMPILE = nios-elf-
+@@ -2374,6 +2375,13 @@
+ 	@$(MKCONFIG) $(@:_config=) arm pxa zylonite
+ 
+ #########################################################################
++## ARM926EJS Systems
++#########################################################################
++
++XXSVIDEO_EXTENSION_config:	unconfig
++	@./mkconfig $(@:_config=) arm arm926ejs XXSVIDEO_EXTENSION mycable jade
++
++#########################################################################
+ ## ARM1136 Systems
+ #########################################################################
+ omap2420h4_config :    unconfig
+@@ -2465,6 +2473,12 @@
+ 	@echo "#define CONFIG_PB1000 1" >>$(obj)include/config.h
+ 	@$(MKCONFIG) -a pb1x00 mips mips pb1x00
+ 
++xxsnet_config      :       unconfig
++	@mkdir -p $(obj)include
++	@ >$(obj)include/config.h
++	@echo "#define CONFIG_XXSNET 1" >>$(obj)include/config.h
++	@$(MKCONFIG) -a xxsnet mips mips xxsnet mycable
++
+ #########################################################################
+ ## MIPS64 5Kc
+ #########################################################################
diff --git a/recipes/u-boot/u-boot-jade-1.3.0/02_diff-mycable-board-xxsterminal.patch b/recipes/u-boot/u-boot-jade-1.3.0/02_diff-mycable-board-xxsterminal.patch
new file mode 100644
index 0000000..27f1567
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/02_diff-mycable-board-xxsterminal.patch
@@ -0,0 +1,811 @@
+--- u-boot-1.3.0/board/mycable/xxsterminal/config.mk	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsterminal/config.mk	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,5 @@
++#
++# image should be loaded at 0x47f00000
++#
++
++TEXT_BASE = 0x47f00000
+--- u-boot-1.3.0/board/mycable/xxsterminal/lowlevel_init.S	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/board/mycable/xxsterminal/lowlevel_init.S	2009-12-03 13:59:21.000000000 +0000
+@@ -0,0 +1,350 @@
++/*
++ * Board specific setup info
++ *
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
++ *
++ * (C) Copyright 2003, ARM Ltd.
++ * Philippe Robin, <philippe.robin@arm.com>
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software/* you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation/* either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY/* without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program/* if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#include <config.h>
++#include <version.h>
++
++/* Set up the platform, once the cpu has been initialized */
++.globl lowlevel_init
++lowlevel_init:
++/*------------------------------------------------------------------------------*/
++/*  Initialize Clock Reset Generator (CRG)                                      */
++/*------------------------------------------------------------------------------*/
++
++        ldr     r0, =0xfffe7000			/* CRG base address */
++
++        /* Force f_CCLK = 310.5 MHz (for CAN). */
++
++        ldr     r1, [r0, #0x00]                 /* set PLLBYPASS=1 */
++        orr     r1, r1, #0x00000080
++        str     r1, [r0, #0x00]
++
++        ldr     r2, =0xffffffe0                 /* set PLLMODE=1 */
++        and     r1, r1, r2
++        orr     r1, r1, #0x00000001
++        str     r1, [r0, #0x00]
++
++1:      ldr     r1, [r0, #0x00]                 /* wait for PLLREADY */
++        tst     r1, #0x00000100
++        beq     1b
++
++        ldr     r2, =0xffffff7f                 /* set PLLBYPASS=0 */
++        and     r1, r1, r2
++        str     r1, [r0, #0x00]
++
++        /* Set clock gate control */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x18]                 /* CRHA: AHB clock */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x1c]                 /* CRPA: APB-A clock */
++        ldr     r1, =0xfffffffe                 /* Close */
++        str     r1, [r0, #0x20]                 /* CRPA: APB-B clock */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x24]                 /* CRHB: ExtAHB clock */
++        ldr     r1, =0xffffffef                 /* Open ARM926EJ-S only */
++        str     r1, [r0, #0x28]                 /* CRAM: ARM core clock */
++
++/*------------------------------------------------------------------------------*/
++/*  Initialize External Bus Interface                                           */
++/*------------------------------------------------------------------------------*/
++#define MEMC_BASE        0xfffc0000
++
++        ldr     r0, =MEMC_BASE                  /* MEMC base address */
++
++        /* SRAM/flash _mode_ registers (XCS4 is set by external pin)
++        	XCS0: Ethernet Controller
++        	XCS2: not used (?)
++        	XCS4: Flash
++        */
++        ldr     r1, =0x00000001		/* XCS0: 16bit */
++        str     r1, [r0, #0x00]
++        ldr     r1, =0x00000001		/* XCS2: CPLD = 16bit */
++        str     r1, [r0, #0x08]
++        ldr     r1, =0x00000001		/* XCS4: 16bit, */
++        str     r1, [r0, #0x10]
++
++        /* SRAM/flash _timing_ registers (HCLK=83.3/80MHz) */
++        ldr     r1, =0x055ff00f		/* XCS0: */
++        str     r1, [r0, #0x20]
++        ldr     r1, =0x03061008		/* XCS2: not used; like flash rom */
++        str     r1, [r0, #0x28]
++        ldr     r1, =0x03061008		/* XCS4: FLASH ROM, reviewed by ab@mycable.de */
++        str     r1, [r0, #0x30]
++
++        /* SRAM/flash _area_ registers (address of XCS4 is set by external pin) */
++        ldr     r1, =0x00000020		/* XCS0: 0x02000000/1MB */
++        str     r1, [r0, #0x40]
++        ldr     r1, =0x00000050		/* XCS2: 0x05000000/1MB */
++        str     r1, [r0, #0x48]
++        ldr     r1, =0x001f0000		/* XCS4: 32 MB */
++        str     r1, [r0, #0x50]
++
++/*------------------------------------------------------------------------------*/
++/*  GPIO Settings                                                               */
++/*------------------------------------------------------------------------------*/
++
++/*----------------------------------------------------------------------------- */
++/*  Initialize DDR2 Controller                                                  */
++/*----------------------------------------------------------------------------- */
++#define CCNT_BASE        0xfff42000
++#define CDEBUG1          0xec
++
++#define DDR2C_BASE       0xf3000000
++#define DRIC             0x00
++#define DRIC1            0x02
++#define DRIC2            0x04
++#define DRCA             0x06
++#define DRCM             0x08
++#define DRCST1           0x0a
++#define DRCST2           0x0c
++#define DRCR             0x0e
++#define DRCF             0x20
++#define DRASR            0x30
++#define DRIMS		 0x50
++#define DROS             0x60
++#define DRIBSLI          0x62
++#define DRIBSODT1        0x64
++#define DRIBSOCD         0x66
++#define DRIBSOCD2        0x68
++#define DROABA           0x70
++#define DROBV            0x80
++#define DROBS            0x84
++#define DROBSR1          0x86
++#define DROBSR2          0x88
++#define DROBSR3          0x8a
++#define DROBSR4          0x8c
++#define DRIMR1           0x90
++#define DRIMR2           0x92
++#define DRIMR3           0x94
++#define DRIMR4           0x96
++#define DROISR1          0x98
++#define DROISR2          0x9a
++
++        .macro wait, count
++        mov     r4, #\count
++3:
++        subs    r4, r4, #0x1
++        bne     3b
++
++        .endm
++
++
++
++        /* Wait for PLL LOCK up time or more */
++        wait    20
++
++	/* ----------------------- */
++        /* (2) Initialize DDRIF */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x5555
++        strh    r1, [r0, #DRIMS]
++
++	/* ----------------------- */
++        /* (3) Wait for 20MCKPs(120nsec) or more */
++	/* ----------------------- */
++        wait    20
++
++	/* ----------------------- */
++        /* (4) IRESET/IUSRRST release */
++	/* ----------------------- */
++        ldr     r0, =CCNT_BASE                  /* CCNT base address */
++        ldr     r1, =0x00000002
++        str     r1, [r0, #CDEBUG1]
++
++	/* ----------------------- */
++        /* (5) Wait for 20MCKPs(120nsec) or more */
++	/* ----------------------- */
++        wait    20
++
++	/* ----------------------- */
++        /* (6) IDLLRST release */
++	/* ----------------------- */
++        ldr     r0, =CCNT_BASE                  /* CCNT base address */
++        ldr     r1, =0x00000003
++        str     r1, [r0, #CDEBUG1]
++
++	/* ----------------------- */
++        /* (7+8) Wait for 200us(=200000ns) or more (DDR2 Spec) */
++	/* ----------------------- */
++	wait 33536
++
++	/* ----------------------- */
++        /* (9) MCKE ON */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x003f
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc124                     /* 512Mbit DDR2SDRAM x 2 */
++        strh    r1, [r0, #DRCA]
++        ldr     r1, =0xc000
++        strh    r1, [r0, #DRIC]
++
++	/* ----------------------- */
++        /* (10) Initialize SDRAM  */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0xc001                     /* NOP Command */
++        strh    r1, [r0, #DRIC]
++
++        wait    67                              /* 400ns wait */
++
++        ldr     r1, =0x0017                     /* PALL Command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0400
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0006                     /* EMR(2) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0007                     /* EMR(3) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++	ldr     r1, =0x0000			/* Extended Mode Register 1 clear*/
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0004                     /* MRS command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0532			/* Mode Register */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++	wait 200
++
++        ldr     r1, =0x0017                     /* PALL command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0400
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x000f                     /* REF command 1 */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000                     /* (changed) */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0x0004                     /* MRS command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0432
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        wait    200                             /* MRS to OCD: 200clock */
++
++        ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0380                     /* Extended Mode Register 1 set OCD */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++	ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++	/* ldr  r1, =0x0044 */
++        ldr     r1, =0x0002                     /* Extended Mode Register 1 set reduced strength */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0032                     /* Set BT, AL, CL, BL */
++        strh    r1, [r0, #DRCM]
++
++	ldr	r1, =0x3418			/* Set tRCD, tRAS, tRP, tRC */
++        strh    r1, [r0, #DRCST1]
++
++	/* ldr  r1, =0x2e22 */			/* Set tRFC, tRRD, tWR */
++	ldr     r1, =0x6e32
++        strh    r1, [r0, #DRCST2]
++
++	/* ldr     r1, =0x0051 */		/* Set CNTL, REF_CNT*/
++        ldr     r1, =0x0141			/* (changed) */
++        strh    r1, [r0, #DRCR]
++
++	ldr     r1, =0x0002			/* Set Address FIFO (8 steps) */
++        strh    r1, [r0, #DRCF]
++
++        ldr     r1, =0x0001                     /* Enable AXI Cache */
++        strh    r1, [r0, #DRASR]
++
++	/* ----------------------- */
++        /* (11) ODT setting        */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x0001
++        strh    r1, [r0, #DROBS]
++        ldr     r1, =0x0103			/* ODT auto adjustment on */
++        strh    r1, [r0, #DROABA]
++	ldr     r1, =0x003F			/* Set ODT to on 50/100 Ohm */
++        strh    r1, [r0, #DRIBSODT1]
++
++	/* ----------------------- */
++        /* (12) Shift to ODTCONT ON (SDRAM side) and DDR2C usual operation mode */
++	/* ----------------------- */
++	ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++	ldr     r1, =0x0001
++	strh    r1, [r0, #DROS]
++	ldr     r1, =0x4000
++	strh    r1, [r0, #DRIC]
++
++	mov pc, lr
++
++/*------------------------------------------------------------------------------*/
++/*  Reset CPU by writing SWRSTREQ to CRSR-register */
++/*------------------------------------------------------------------------------*/
++.globl reset_cpu
++reset_cpu:
++        ldr     r0, =0xfffe7000     /* CRG Base address */
++
++        ldr     r2, =0x00000002		/* SWRSTREQ */
++        str     r2, [r0, #0x0c]
++
++_loop_forever:
++        b       _loop_forever
++
+--- u-boot-1.3.0/board/mycable/xxsterminal/Makefile	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsterminal/Makefile	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,52 @@
++
++#
++# (C) Copyright 2003-2006
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
++COBJS	:= $(BOARD).o
++SOBJS   := lowlevel_init.o
++
++SRCS	:= $(SOBJS:.o=.S) $(COBJS:.o=.c)
++OBJS	:= $(addprefix $(obj),$(COBJS))
++SOBJS	:= $(addprefix $(obj),$(SOBJS))
++
++$(LIB):	$(obj).depend $(OBJS) $(SOBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS) $(SOBJS)
++
++clean:
++	rm -f $(SOBJS) $(OBJS)
++
++distclean:	clean
++	rm -f $(LIB) core *.bak .depend
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
++#########################################################################
+--- u-boot-1.3.0/board/mycable/xxsterminal/u-boot.lds	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsterminal/u-boot.lds	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,51 @@
++/*
++ * (C) Copyright 2002
++ * Gary Jennejohn, DENX Software Engineering, <gj@denx.de>
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
++
++OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
++OUTPUT_ARCH(arm)
++ENTRY(_start)
++SECTIONS
++{
++	. = 0x40000000;
++	. = ALIGN(8);
++	.text	:
++	{
++	  cpu/arm926ejs/start.o	(.text)
++	  *(.text)
++	}
++	.rodata : { *(.rodata) }
++	. = ALIGN(8);
++	.data : { *(.data) }
++	. = ALIGN(8);
++	.got : { *(.got) }
++
++	. = .;
++	__u_boot_cmd_start = .;
++	.u_boot_cmd : { *(.u_boot_cmd) }
++	__u_boot_cmd_end = .;
++
++	. = ALIGN(8);
++	__bss_start = .;
++	.bss : { *(.bss) }
++	_end = .;
++}
+--- u-boot-1.3.0/board/mycable/xxsterminal/xxsterminal.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsterminal/xxsterminal.c	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,139 @@
++/*
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
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
++
++#include <common.h>
++#include <asm/arch/jade.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++void gpio_init(void);
++
++#if defined(CONFIG_SHOW_BOOT_PROGRESS)
++void show_boot_progress(int progress)
++{
++    printf("Boot reached stage %d\n", progress);
++}
++#endif
++
++static inline void delay (unsigned long loops)
++{
++	__asm__ volatile ("1:\n"
++		"subs %0, %1, #1\n"
++		"bne 1b":"=r" (loops):"0" (loops));
++}
++
++/*
++ * Miscellaneous platform dependent initialisations
++ */
++
++int board_init (void)
++{
++	/* arch number of Versatile Board */
++	gd->bd->bi_arch_number = MACH_TYPE_XXSVIDEO;
++	/* adress of boot parameters */
++	gd->bd->bi_boot_params = 0x40000100;
++
++	gd->flags = 0;
++
++	icache_enable ();
++
++	/* set Multiplex Group */
++	multiplex_group_init();
++
++	/* init GPIOs */
++	gpio_init();
++
++	return 0;
++}
++
++
++int misc_init_r (void)
++{
++	setenv("verify", "n");
++	return (0);
++}
++
++/*
++ * DRAM configuration
++ */
++int dram_init (void)
++{
++        gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
++        gd->bd->bi_dram[0].size  = PHYS_SDRAM_1_SIZE;
++
++	return 0;
++}
++
++/*
++ * Initial the Pin Multiplex Groups
++ */
++void multiplex_group_init(void)
++{
++/*
++ * Multiplex Groups
++ *
++ * Group 2 Mode 2: I2S --> 0x02
++ * Group 4 Mode 1: CAN --> 0x10
++ *
++ */
++	PUT_REG(JADE_CCNT_PHYS_BASE | CCNT_CMUX_MD, 0x12);
++
++}
++
++void gpio_init(void)
++{
++/*
++ * GPIOs 0..7
++ *
++ * [GPIO], [DIRECTION], [FUNCTION], [DESCRIPTION]
++ *	0,	input,	GPIO
++ *	1,	input,	GPIO
++ *	2,	input,	GPIO
++ *	3,	input,	GPIO
++ *
++ *	4,	input,	GPIO
++ *	5,	input,	GPIO
++ *	6,	input,	GPIO
++ *	7,	input,	GPIO
++ *
++ * DIR: input == 0, output == 1
++ */
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_0, 0xc0);
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_PORT_DATA | GPIO_BLOCK_0, 0x40);
++/*
++ * GPIOs 8..15
++ */
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_2, 0x00);
++//	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_PORT_DATA | GPIO_BLOCK_1, 0x00);
++
++ /*
++ * GPIOs 16..23
++ */
++#ifdef CONFIG_DRIVER_XXSCCAN
++
++    //--- CAN0/1 pin configuration ---
++    PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_2, 0x1E);
++    PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_PORT_DATA | GPIO_BLOCK_2, 0x14);
++#else
++    PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_2, 0x00);
++#endif
++
++}
++
+--- u-boot-1.3.0/include/configs/xxsterminal.h	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/include/configs/xxsterminal.h	2009-02-26 15:34:27.000000000 +0100
+@@ -0,0 +1,196 @@
++/*
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
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
++
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++#define GET_REG(reg)       (*((volatile u32 *)(reg)))
++#define PUT_REG(reg, val)  (*((volatile u32 *)(reg)) = ((u32)(val)))
++#define PUT_U16(reg, val)  (*((volatile u16 *)(reg)) = ((u16)(val)))
++
++/*
++ * High Level Configuration Options
++ * (easy to change)
++ */
++#define CONFIG_ARM926EJS	1	/* This is an arm926ejs CPU core  */
++
++#define CFG_HZ			41500000 / 16
++#define CFG_TIMERBASE		0xfffe0000 /* Timer A and B base */
++
++#define CFG_TIMER_INTERVAL	10000
++#define CFG_TIMER_RELOAD	(CFG_TIMER_INTERVAL >> 4) /* Divide by 16 */
++#define CFG_TIMER_CTRL		0x86 /* Enable, Clock / 16, 32bit */
++
++#define CONFIG_CMDLINE_TAG	1 	/* enable passing of ATAGs */
++#define CONFIG_SETUP_MEMORY_TAGS 1
++#define CONFIG_MISC_INIT_R	1 	/* call misc_init_r during start up */
++
++#define CONFIG_CMDLINE_EDITING  1       /* add command line history     */
++#define CONFIG_LOOPW            1       /* enable loopw command         */
++#define CONFIG_MX_CYCLIC        1       /* enable mdc/mwc commands      */
++#define CONFIG_ZERO_BOOTDELAY_CHECK     /* check for keypress on bootdelay==0 */
++#define CONFIG_VERSION_VARIABLE 1       /* include version env variable */
++
++/*
++ * Size of malloc() pool
++ */
++#define CFG_MALLOC_LEN		(CFG_ENV_SIZE + 128*1024)
++#define CFG_GBL_DATA_SIZE	128	/* size in bytes reserved for initial data */
++
++/*
++ * Hardware drivers
++ */
++
++/*
++ * Ethernet
++ */
++#define CONFIG_DRIVER_SMSC9118
++#define CONFIG_SMSC9118_BASE	0x02000000
++
++/*
++ * NS16550 Configuration
++ */
++#define CFG_NS16550
++#define CFG_NS16550_SERIAL
++#define CFG_NS16550_REG_SIZE	4
++// #define CFG_NS16550_CLK 360*115200 /* 333 MHz >> APB 41.625 MHz*/
++// #define CFG_NS16550_CLK 359*115200 /* 330.75 MHz >> APB 41.343 MHz*/
++#define CFG_NS16550_CLK 337*115200 /* 310.5 MHz >> APB 38.8125 MHz*/
++
++#define CFG_NS16550_COM1	0xfffe1000
++#define CFG_NS16550_COM2	0xfffe2000
++
++#define CONFIG_CONS_INDEX	1
++#define CONFIG_BAUDRATE		115200
++#define CFG_BAUDRATE_TABLE	{ 9600, 19200, 38400, 57600, 115200 }
++
++/*
++ * BOOTP options
++ */
++#define CONFIG_BOOTP_BOOTFILESIZE
++#define CONFIG_BOOTP_BOOTPATH
++#define CONFIG_BOOTP_GATEWAY
++#define CONFIG_BOOTP_HOSTNAME
++
++/*
++ * Command line configuration.
++ */
++#include <config_cmd_default.h>
++
++#define CONFIG_CMD_ASKENV
++//#define CONFIG_CMD_CACHE
++#define CONFIG_CMD_DHCP
++#define CONFIG_CMD_DIAG
++//#define CONFIG_CMD_EEPROM
++//#define CONFIG_CMD_ELF
++//#define CONFIG_CMD_I2C
++//#define CONFIG_CMD_IRQ
++#define CONFIG_CMD_LOG
++#define CONFIG_CMD_MII
++#define CONFIG_CMD_NET
++#define CONFIG_CMD_NFS
++#define CONFIG_CMD_PING
++#define CONFIG_CMD_REGINFO
++
++#define CONFIG_BOOTDELAY	2
++// #define CONFIG_BOOTARGS "root=/dev/nfs/rw nfsroot=169.254.148.45:/home/user/elpa/arm/arm"
++// #define CONFIG_BOOTCOMMAND "bootp ; bootm"
++
++/*
++ * Static configuration when assigning fixed address
++ */
++// #define CONFIG_ETHADDR	66:22:00:01:16:05	/* sample IP; */
++#define CONFIG_NETMASK	255.255.255.0		/* talk on MY local net */
++//#define CONFIG_IPADDR	192.168.128.102		/* static IP */
++#define CONFIG_SERVERIP	192.168.128.20		/* server IP */
++
++#define CONFIG_BOOTFILE	"uImage"		/* file to load */
++
++
++/*
++ * Miscellaneous configurable options
++ */
++#define CFG_LONGHELP			/* undef to save memory     */
++#define CFG_PROMPT	"xxsvideo> " 	/* Monitor Command Prompt   */
++#define CFG_CBSIZE	256		/* Console I/O Buffer Size  */
++
++#define CFG_PBSIZE	(CFG_CBSIZE+sizeof(CFG_PROMPT)+16)	/* Print Buffer Size */
++#define CFG_MAXARGS	16		/* max number of command args   */
++#define CFG_BARGSIZE	CFG_CBSIZE	/* Boot Argument Buffer Size    */
++
++#undef	CFG_CLKS_IN_HZ			/* everything, incl board info, in Hz */
++#define CFG_LOAD_ADDR	0x42000000 	/* default load address */
++
++/*-----------------------------------------------------------------------
++ * Stack sizes
++ *
++ * The stack sizes are set up in start.S using the settings below
++ */
++#define CONFIG_STACKSIZE	(128*1024) 	/* regular stack */
++#ifdef CONFIG_USE_IRQ
++#define CONFIG_STACKSIZE_IRQ	(4*1024) 	/* IRQ stack */
++#define CONFIG_STACKSIZE_FIQ	(4*1024) 	/* FIQ stack */
++#endif
++
++/*-----------------------------------------------------------------------
++ * Physical Memory Map
++ */
++#define CONFIG_NR_DRAM_BANKS    1 		/* we have 1 bank of DRAM */
++#define PHYS_SDRAM_1            0x40000000 	/* SDRAM Bank #1 */
++#define PHYS_SDRAM_1_SIZE       0x08000000 	/* 128 MB */
++
++#define CFG_MEMTEST_START       PHYS_SDRAM_1
++#define CFG_MEMTEST_END         PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE - 0x00400000
++
++/* Enable an alternate, more extensive memory test */
++//#define CFG_ALT_MEMTEST
++
++/*-----------------------------------------------------------------------
++ * FLASH and environment organization
++ */
++
++#define CFG_FLASH_BASE          0x10000000
++
++#define CFG_MAX_FLASH_BANKS	1 		/* max number of memory banks */
++#define PHYS_FLASH_SIZE         0x02000000 	/* 32 MB */
++/* timeout values are in ticks */
++#define CFG_FLASH_ERASE_TOUT	(20*CFG_HZ)	/* Timeout for Flash Erase */
++#define CFG_FLASH_WRITE_TOUT	(20*CFG_HZ)	/* Timeout for Flash Write */
++#define CFG_MAX_FLASH_SECT	(2048)
++
++#define CFG_FLASH_CFI			1
++#define CFG_FLASH_CFI_DRIVER		1
++#define CFG_FLASH_CFI_AMD_RESET
++#define CFG_FLASH_USE_BUFFER_WRITE	1
++
++#define PHYS_FLASH_1		(CFG_FLASH_BASE)
++#define CFG_MONITOR_BASE       CFG_FLASH_BASE  /* Monitor at beginning of flash */
++
++#define CFG_ENV_IS_IN_FLASH		1 /* env in flash instead of CFG_ENV_IS_NOWHERE */
++#define CFG_ENV_SECT_SIZE		0x00020000 /* 8 KB sectors */
++#define CFG_ENV_SIZE			0x10000 /* Total Size of Environment Sector */
++#define CFG_ENV_OFFSET			0x00020000 /* environment starts here  */
++#define CFG_ENV_ADDR			(CFG_FLASH_BASE + CFG_ENV_OFFSET)
++
++//#define CONFIG_SKIP_LOWLEVEL_INIT
++//#define SKIP_CONFIG_RELOCATE_UBOOT
++
++#endif							/* __CONFIG_H */
diff --git a/recipes/u-boot/u-boot-jade-1.3.0/03_diff-mycable-board-jadeevalkit.patch b/recipes/u-boot/u-boot-jade-1.3.0/03_diff-mycable-board-jadeevalkit.patch
new file mode 100644
index 0000000..7e9feca
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/03_diff-mycable-board-jadeevalkit.patch
@@ -0,0 +1,812 @@
+--- u-boot-1.3.0/board/mycable/jadeevalkit/config.mk	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/jadeevalkit/config.mk	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,5 @@
++#
++# image should be loaded at 0x47f00000
++#
++
++TEXT_BASE = 0x47f00000
+--- u-boot-1.3.0/board/mycable/jadeevalkit/lowlevel_init.S	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/board/mycable/jadeevalkit/lowlevel_init.S	2009-12-03 13:59:21.000000000 +0000
+@@ -0,0 +1,351 @@
++/*
++ * Board specific setup info
++ *
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
++ *
++ * (C) Copyright 2003, ARM Ltd.
++ * Philippe Robin, <philippe.robin@arm.com>
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software/* you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation/* either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY/* without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program/* if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#include <config.h>
++#include <version.h>
++
++/* Set up the platform, once the cpu has been initialized */
++.globl lowlevel_init
++lowlevel_init:
++/*------------------------------------------------------------------------------*/
++/*  Initialize Clock Reset Generator (CRG)                                      */
++/*------------------------------------------------------------------------------*/
++
++        ldr     r0, =0xfffe7000			/* CRG base address */
++
++        /* Force f_CCLK = 310.5 MHz (for CAN). */
++
++        ldr     r1, [r0, #0x00]                 /* set PLLBYPASS=1 */
++        orr     r1, r1, #0x00000080
++        str     r1, [r0, #0x00]
++
++        ldr     r2, =0xffffffe0                 /* set PLLMODE=1 */
++        and     r1, r1, r2
++        orr     r1, r1, #0x00000001
++        str     r1, [r0, #0x00]
++
++1:      ldr     r1, [r0, #0x00]                 /* wait for PLLREADY */
++        tst     r1, #0x00000100
++        beq     1b
++
++        ldr     r2, =0xffffff7f                 /* set PLLBYPASS=0 */
++        and     r1, r1, r2
++        str     r1, [r0, #0x00]
++
++        /* Set clock gate control */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x18]                 /* CRHA: AHB clock */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x1c]                 /* CRPA: APB-A clock */
++        ldr     r1, =0xfffffffe                 /* Close */
++        str     r1, [r0, #0x20]                 /* CRPA: APB-B clock */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x24]                 /* CRHB: ExtAHB clock */
++        ldr     r1, =0xffffffef                 /* Open ARM926EJ-S only */
++        str     r1, [r0, #0x28]                 /* CRAM: ARM core clock */
++
++/*------------------------------------------------------------------------------*/
++/*  Initialize External Bus Interface                                           */
++/*------------------------------------------------------------------------------*/
++#define MEMC_BASE        0xfffc0000
++
++        ldr     r0, =MEMC_BASE                  /* MEMC base address */
++
++        /* SRAM/flash _mode_ registers (XCS4 is set by external pin)
++        	XCS0: Ethernet Controller
++        	XCS2: not used (?)
++        	XCS4: Flash
++        */
++        ldr     r1, =0x00000001		/* XCS0: 16bit */
++        str     r1, [r0, #0x00]
++        ldr     r1, =0x00000001		/* XCS2: 16bit */
++        str     r1, [r0, #0x08]
++        ldr     r1, =0x00000001		/* XCS4: 16bit, */
++        str     r1, [r0, #0x10]
++
++        /* SRAM/flash _timing_ registers (HCLK=83.3/80MHz) */
++        ldr     r1, =0x055ff00f		/* XCS0: */
++        str     r1, [r0, #0x20]
++        ldr     r1, =0x03061008		/* XCS2: not used */
++        str     r1, [r0, #0x28]
++        ldr     r1, =0x03061008		/* XCS4: FLASH ROM, reviewed by ab@mycable.de */
++        str     r1, [r0, #0x30]
++
++        /* SRAM/flash _area_ registers (address of XCS4 is set by external pin) */
++        /*ldr     r1, =0x00000020*/		/* XCS0: 0x02000000/1MB */
++	ldr	r1, =0x00000020
++        str     r1, [r0, #0x40]
++        ldr     r1, =0x00000050		/* XCS2: 0x05000000/2MB */
++        str     r1, [r0, #0x48]
++        ldr     r1, =0x001f0000		/* XCS4: 32 MB */
++        str     r1, [r0, #0x50]
++
++/*------------------------------------------------------------------------------*/
++/*  GPIO Settings                                                               */
++/*------------------------------------------------------------------------------*/
++
++/*----------------------------------------------------------------------------- */
++/*  Initialize DDR2 Controller                                                  */
++/*----------------------------------------------------------------------------- */
++#define CCNT_BASE        0xfff42000
++#define CDEBUG1          0xec
++
++#define DDR2C_BASE       0xf3000000
++#define DRIC             0x00
++#define DRIC1            0x02
++#define DRIC2            0x04
++#define DRCA             0x06
++#define DRCM             0x08
++#define DRCST1           0x0a
++#define DRCST2           0x0c
++#define DRCR             0x0e
++#define DRCF             0x20
++#define DRASR            0x30
++#define DRIMS		 0x50
++#define DROS             0x60
++#define DRIBSLI          0x62
++#define DRIBSODT1        0x64
++#define DRIBSOCD         0x66
++#define DRIBSOCD2        0x68
++#define DROABA           0x70
++#define DROBV            0x80
++#define DROBS            0x84
++#define DROBSR1          0x86
++#define DROBSR2          0x88
++#define DROBSR3          0x8a
++#define DROBSR4          0x8c
++#define DRIMR1           0x90
++#define DRIMR2           0x92
++#define DRIMR3           0x94
++#define DRIMR4           0x96
++#define DROISR1          0x98
++#define DROISR2          0x9a
++
++        .macro wait, count
++        mov     r4, #\count
++3:
++        subs    r4, r4, #0x1
++        bne     3b
++
++        .endm
++
++
++
++        /* Wait for PLL LOCK up time or more */
++        wait    20
++
++	/* ----------------------- */
++        /* (2) Initialize DDRIF */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x5555
++        strh    r1, [r0, #DRIMS]
++
++	/* ----------------------- */
++        /* (3) Wait for 20MCKPs(120nsec) or more */
++	/* ----------------------- */
++        wait    20
++
++	/* ----------------------- */
++        /* (4) IRESET/IUSRRST release */
++	/* ----------------------- */
++        ldr     r0, =CCNT_BASE                  /* CCNT base address */
++        ldr     r1, =0x00000002
++        str     r1, [r0, #CDEBUG1]
++
++	/* ----------------------- */
++        /* (5) Wait for 20MCKPs(120nsec) or more */
++	/* ----------------------- */
++        wait    20
++
++	/* ----------------------- */
++        /* (6) IDLLRST release */
++	/* ----------------------- */
++        ldr     r0, =CCNT_BASE                  /* CCNT base address */
++        ldr     r1, =0x00000003
++        str     r1, [r0, #CDEBUG1]
++
++	/* ----------------------- */
++        /* (7+8) Wait for 200us(=200000ns) or more (DDR2 Spec) */
++	/* ----------------------- */
++	wait 33536
++
++	/* ----------------------- */
++        /* (9) MCKE ON */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x003f
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc124                     /* 512Mbit DDR2SDRAM x 2 */
++        strh    r1, [r0, #DRCA]
++        ldr     r1, =0xc000
++        strh    r1, [r0, #DRIC]
++
++	/* ----------------------- */
++        /* (10) Initialize SDRAM  */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0xc001                     /* NOP Command */
++        strh    r1, [r0, #DRIC]
++
++        wait    67                              /* 400ns wait */
++
++        ldr     r1, =0x0017                     /* PALL Command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0400
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0006                     /* EMR(2) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0007                     /* EMR(3) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++	ldr     r1, =0x0000			/* Extended Mode Register 1 clear*/
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0004                     /* MRS command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0532			/* Mode Register */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++	wait 200
++
++        ldr     r1, =0x0017                     /* PALL command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0400
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x000f                     /* REF command 1 */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000                     /* (changed) */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0x0004                     /* MRS command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0432
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        wait    200                             /* MRS to OCD: 200clock */
++
++        ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0380                     /* Extended Mode Register 1 set OCD */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++	ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++	/* ldr  r1, =0x0044 */
++        ldr     r1, =0x0002                     /* Extended Mode Register 1 set reduced strength */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0032                     /* Set BT, AL, CL, BL */
++        strh    r1, [r0, #DRCM]
++
++	ldr	r1, =0x3418			/* Set tRCD, tRAS, tRP, tRC */
++        strh    r1, [r0, #DRCST1]
++
++	/* ldr  r1, =0x2e22 */			/* Set tRFC, tRRD, tWR */
++	ldr     r1, =0x6e32
++        strh    r1, [r0, #DRCST2]
++
++	/* ldr     r1, =0x0051 */		/* Set CNTL, REF_CNT*/
++        ldr     r1, =0x0141			/* (changed) */
++        strh    r1, [r0, #DRCR]
++
++	ldr     r1, =0x0002			/* Set Address FIFO (8 steps) */
++        strh    r1, [r0, #DRCF]
++
++        ldr     r1, =0x0001                     /* Enable AXI Cache */
++        strh    r1, [r0, #DRASR]
++
++	/* ----------------------- */
++        /* (11) ODT setting        */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x0001
++        strh    r1, [r0, #DROBS]
++        ldr     r1, =0x0103			/* ODT auto adjustment on */
++        strh    r1, [r0, #DROABA]
++	ldr     r1, =0x003F			/* Set ODT to on 50/100 Ohm */
++        strh    r1, [r0, #DRIBSODT1]
++
++	/* ----------------------- */
++        /* (12) Shift to ODTCONT ON (SDRAM side) and DDR2C usual operation mode */
++	/* ----------------------- */
++	ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++	ldr     r1, =0x0001
++	strh    r1, [r0, #DROS]
++	ldr     r1, =0x4000
++	strh    r1, [r0, #DRIC]
++
++	mov pc, lr
++
++/*------------------------------------------------------------------------------*/
++/*  Reset CPU by writing SWRSTREQ to CRSR-register */
++/*------------------------------------------------------------------------------*/
++.globl reset_cpu
++reset_cpu:
++        ldr     r0, =0xfffe7000     /* CRG Base address */
++
++        ldr     r2, =0x00000002		/* SWRSTREQ */
++        str     r2, [r0, #0x0c]
++
++_loop_forever:
++        b       _loop_forever
++
+--- u-boot-1.3.0/board/mycable/jadeevalkit/Makefile	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/jadeevalkit/Makefile	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,52 @@
++
++#
++# (C) Copyright 2003-2006
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
++COBJS	:= $(BOARD).o
++SOBJS   := lowlevel_init.o
++
++SRCS	:= $(SOBJS:.o=.S) $(COBJS:.o=.c)
++OBJS	:= $(addprefix $(obj),$(COBJS))
++SOBJS	:= $(addprefix $(obj),$(SOBJS))
++
++$(LIB):	$(obj).depend $(OBJS) $(SOBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS) $(SOBJS)
++
++clean:
++	rm -f $(SOBJS) $(OBJS)
++
++distclean:	clean
++	rm -f $(LIB) core *.bak .depend
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
++#########################################################################
+--- u-boot-1.3.0/board/mycable/jadeevalkit/u-boot.lds	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/jadeevalkit/u-boot.lds	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,51 @@
++/*
++ * (C) Copyright 2002
++ * Gary Jennejohn, DENX Software Engineering, <gj@denx.de>
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
++
++OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
++OUTPUT_ARCH(arm)
++ENTRY(_start)
++SECTIONS
++{
++	. = 0x40000000;
++	. = ALIGN(8);
++	.text	:
++	{
++	  cpu/arm926ejs/start.o	(.text)
++	  *(.text)
++	}
++	.rodata : { *(.rodata) }
++	. = ALIGN(8);
++	.data : { *(.data) }
++	. = ALIGN(8);
++	.got : { *(.got) }
++
++	. = .;
++	__u_boot_cmd_start = .;
++	.u_boot_cmd : { *(.u_boot_cmd) }
++	__u_boot_cmd_end = .;
++
++	. = ALIGN(8);
++	__bss_start = .;
++	.bss : { *(.bss) }
++	_end = .;
++}
+--- u-boot-1.3.0/board/mycable/jadeevalkit/jadeevalkit.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/jadeevalkit/jadeevalkit.c	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,138 @@
++/*
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
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
++
++#include <common.h>
++#include <asm/arch/jade.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++void gpio_init(void);
++
++#if defined(CONFIG_SHOW_BOOT_PROGRESS)
++void show_boot_progress(int progress)
++{
++    printf("Boot reached stage %d\n", progress);
++}
++#endif
++
++static inline void delay (unsigned long loops)
++{
++	__asm__ volatile ("1:\n"
++		"subs %0, %1, #1\n"
++		"bne 1b":"=r" (loops):"0" (loops));
++}
++
++/*
++ * Miscellaneous platform dependent initialisations
++ */
++
++int board_init (void)
++{
++	/* arch number of Versatile Board */
++	gd->bd->bi_arch_number = MACH_TYPE_XXSVIDEO;
++	/* adress of boot parameters */
++	gd->bd->bi_boot_params = 0x40000100;
++
++	gd->flags = 0;
++
++	icache_enable ();
++
++	/* set Multiplex Group */
++	multiplex_group_init();
++
++	/* init GPIOs */
++	gpio_init();
++
++	return 0;
++}
++
++
++int misc_init_r (void)
++{
++	setenv("verify", "n");
++	return (0);
++}
++
++/*
++ * DRAM configuration
++ */
++int dram_init (void)
++{
++        gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
++        gd->bd->bi_dram[0].size  = PHYS_SDRAM_1_SIZE;
++
++	return 0;
++}
++
++/*
++ * Initial the Pin Multiplex Groups
++ */
++void multiplex_group_init(void)
++{
++/*
++ * Multiplex Groups
++ *
++ * Group 2 Mode 2: I2S --> 0x02
++ * Group 4 Mode 1: CAN --> 0x10
++ *
++ */
++	PUT_REG(JADE_CCNT_PHYS_BASE | CCNT_CMUX_MD, 0x12);
++
++}
++
++void gpio_init(void)
++{
++/*
++ * GPIOs 0..7
++ *
++ * [GPIO], [DIRECTION], [FUNCTION], [DESCRIPTION]
++ *	0,	input,	GPIO
++ *	1,	input,	GPIO
++ *	2,	input,	GPIO
++ *	3,	input,	GPIO
++ *
++ *	4,	input,	GPIO
++ *	5,	input,	GPIO
++ *	6,	input,	GPIO
++ *	7,	input,	GPIO
++ *
++ * DIR: input == 0, output == 1
++ */
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_0, 0x00);
++//	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_PORT_DATA | GPIO_BLOCK_0, 0x00);
++/*
++ * GPIOs 8..15
++ */
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_2, 0x00);
++//	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_PORT_DATA | GPIO_BLOCK_1, 0x00);
++
++ /*
++ * GPIOs 16..23
++ */
++#ifdef CONFIG_DRIVER_XXSCCAN
++
++    //--- CAN0/1 pin configuration ---
++    PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_2, 0xF0);
++    PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_PORT_DATA | GPIO_BLOCK_2, 0xA0);
++#else
++    PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_2, 0x00);
++#endif
++}
++
+--- u-boot-1.3.0/include/configs/jadeevalkit.h	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/include/configs/jadeevalkit.h	2009-02-26 15:34:27.000000000 +0100
+@@ -0,0 +1,197 @@
++/*
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
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
++
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++#define GET_REG(reg)       (*((volatile u32 *)(reg)))
++#define PUT_REG(reg, val)  (*((volatile u32 *)(reg)) = ((u32)(val)))
++#define PUT_U16(reg, val)  (*((volatile u16 *)(reg)) = ((u16)(val)))
++
++/*
++ * High Level Configuration Options
++ * (easy to change)
++ */
++#define CONFIG_ARM926EJS	1	/* This is an arm926ejs CPU core  */
++
++#define CFG_HZ			41500000 / 16
++#define CFG_TIMERBASE		0xfffe0000 /* Timer A and B base */
++
++#define CFG_TIMER_INTERVAL	10000
++#define CFG_TIMER_RELOAD	(CFG_TIMER_INTERVAL >> 4) /* Divide by 16 */
++#define CFG_TIMER_CTRL		0x86 /* Enable, Clock / 16, 32bit */
++
++#define CONFIG_CMDLINE_TAG	1 	/* enable passing of ATAGs */
++#define CONFIG_SETUP_MEMORY_TAGS 1
++#define CONFIG_MISC_INIT_R	1 	/* call misc_init_r during start up */
++
++#define CONFIG_CMDLINE_EDITING  1       /* add command line history     */
++#define CONFIG_LOOPW            1       /* enable loopw command         */
++#define CONFIG_MX_CYCLIC        1       /* enable mdc/mwc commands      */
++#define CONFIG_ZERO_BOOTDELAY_CHECK     /* check for keypress on bootdelay==0 */
++#define CONFIG_VERSION_VARIABLE 1       /* include version env variable */
++
++/*
++ * Size of malloc() pool
++ */
++#define CFG_MALLOC_LEN		(CFG_ENV_SIZE + 128*1024)
++#define CFG_GBL_DATA_SIZE	128	/* size in bytes reserved for initial data */
++
++/*
++ * Hardware drivers
++ */
++
++/*
++ * Ethernet
++ */
++#define CONFIG_DRIVER_SMSC9118
++#define CONFIG_SMSC9118_BASE	0x02000000
++
++/*
++ * NS16550 Configuration
++ */
++#define CFG_NS16550
++#define CFG_NS16550_SERIAL
++#define CFG_NS16550_REG_SIZE	4
++
++// #define CFG_NS16550_CLK     360*115200 /* 333 MHz >> APB 41.625 MHz*/
++// #define CFG_NS16550_CLK     359*115200 /* 330.75 MHz >> APB 41.343 MHz*/
++#define CFG_NS16550_CLK     	337*115200 /* 310.5 MHz >> APB 38.8125 MHz*/
++
++#define CFG_NS16550_COM1	0xfffe1000
++#define CFG_NS16550_COM2	0xfffe2000
++
++#define CONFIG_CONS_INDEX	1
++#define CONFIG_BAUDRATE		115200
++#define CFG_BAUDRATE_TABLE	{ 9600, 19200, 38400, 57600, 115200 }
++
++/*
++ * BOOTP options
++ */
++#define CONFIG_BOOTP_BOOTFILESIZE
++#define CONFIG_BOOTP_BOOTPATH
++#define CONFIG_BOOTP_GATEWAY
++#define CONFIG_BOOTP_HOSTNAME
++
++/*
++ * Command line configuration.
++ */
++#include <config_cmd_default.h>
++
++#define CONFIG_CMD_ASKENV
++//#define CONFIG_CMD_CACHE
++#define CONFIG_CMD_DHCP
++#define CONFIG_CMD_DIAG
++//#define CONFIG_CMD_EEPROM
++//#define CONFIG_CMD_ELF
++//#define CONFIG_CMD_I2C
++//#define CONFIG_CMD_IRQ
++#define CONFIG_CMD_LOG
++#define CONFIG_CMD_MII
++#define CONFIG_CMD_NET
++#define CONFIG_CMD_NFS
++#define CONFIG_CMD_PING
++#define CONFIG_CMD_REGINFO
++
++#define CONFIG_BOOTDELAY	2
++// #define CONFIG_BOOTARGS "root=/dev/nfs/rw nfsroot=169.254.148.45:/home/user/elpa/arm/arm"
++// #define CONFIG_BOOTCOMMAND "bootp ; bootm"
++
++/*
++ * Static configuration when assigning fixed address
++ */
++// #define CONFIG_ETHADDR	66:22:00:01:16:05	/* sample IP; */
++#define CONFIG_NETMASK	255.255.255.0		/* talk on MY local net */
++//#define CONFIG_IPADDR	192.168.128.102		/* static IP */
++#define CONFIG_SERVERIP	192.168.128.20		/* server IP */
++
++#define CONFIG_BOOTFILE	"uImage"		/* file to load */
++
++
++/*
++ * Miscellaneous configurable options
++ */
++#define CFG_LONGHELP			/* undef to save memory     */
++#define CFG_PROMPT	"xxsvideo> " 	/* Monitor Command Prompt   */
++#define CFG_CBSIZE	256		/* Console I/O Buffer Size  */
++
++#define CFG_PBSIZE	(CFG_CBSIZE+sizeof(CFG_PROMPT)+16)	/* Print Buffer Size */
++#define CFG_MAXARGS	16		/* max number of command args   */
++#define CFG_BARGSIZE	CFG_CBSIZE	/* Boot Argument Buffer Size    */
++
++#undef	CFG_CLKS_IN_HZ			/* everything, incl board info, in Hz */
++#define CFG_LOAD_ADDR	0x42000000 	/* default load address */
++
++/*-----------------------------------------------------------------------
++ * Stack sizes
++ *
++ * The stack sizes are set up in start.S using the settings below
++ */
++#define CONFIG_STACKSIZE	(128*1024) 	/* regular stack */
++#ifdef CONFIG_USE_IRQ
++#define CONFIG_STACKSIZE_IRQ	(4*1024) 	/* IRQ stack */
++#define CONFIG_STACKSIZE_FIQ	(4*1024) 	/* FIQ stack */
++#endif
++
++/*-----------------------------------------------------------------------
++ * Physical Memory Map
++ */
++#define CONFIG_NR_DRAM_BANKS    1 		/* we have 1 bank of DRAM */
++#define PHYS_SDRAM_1            0x40000000 	/* SDRAM Bank #1 */
++#define PHYS_SDRAM_1_SIZE       0x08000000 	/* 128 MB */
++
++#define CFG_MEMTEST_START       PHYS_SDRAM_1
++#define CFG_MEMTEST_END         PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE - 0x00400000
++
++/* Enable an alternate, more extensive memory test */
++//#define CFG_ALT_MEMTEST
++
++/*-----------------------------------------------------------------------
++ * FLASH and environment organization
++ */
++
++#define CFG_FLASH_BASE          0x10000000
++
++#define CFG_MAX_FLASH_BANKS	1 		/* max number of memory banks */
++#define PHYS_FLASH_SIZE         0x02000000 	/* 32 MB */
++/* timeout values are in ticks */
++#define CFG_FLASH_ERASE_TOUT	(20*CFG_HZ)	/* Timeout for Flash Erase */
++#define CFG_FLASH_WRITE_TOUT	(20*CFG_HZ)	/* Timeout for Flash Write */
++#define CFG_MAX_FLASH_SECT	(2048)
++
++#define CFG_FLASH_CFI			1
++#define CFG_FLASH_CFI_DRIVER		1
++#define CFG_FLASH_CFI_AMD_RESET
++#define CFG_FLASH_USE_BUFFER_WRITE	1
++
++#define PHYS_FLASH_1		(CFG_FLASH_BASE)
++#define CFG_MONITOR_BASE       CFG_FLASH_BASE  /* Monitor at beginning of flash */
++
++#define CFG_ENV_IS_IN_FLASH		1 /* env in flash instead of CFG_ENV_IS_NOWHERE */
++#define CFG_ENV_SECT_SIZE		0x00020000 /* 8 KB sectors */
++#define CFG_ENV_SIZE			0x10000 /* Total Size of Environment Sector */
++#define CFG_ENV_OFFSET			0x00020000 /* environment starts here  */
++#define CFG_ENV_ADDR			(CFG_FLASH_BASE + CFG_ENV_OFFSET)
++
++//#define CONFIG_SKIP_LOWLEVEL_INIT
++//#define SKIP_CONFIG_RELOCATE_UBOOT
++
++#endif							/* __CONFIG_H */
diff --git a/recipes/u-boot/u-boot-jade-1.3.0/04_diff-mycable-board-xxsnet.patch b/recipes/u-boot/u-boot-jade-1.3.0/04_diff-mycable-board-xxsnet.patch
new file mode 100644
index 0000000..88c9aec
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/04_diff-mycable-board-xxsnet.patch
@@ -0,0 +1,1216 @@
+--- u-boot-1.3.0/board/mycable/xxsnet/config.mk	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsnet/config.mk	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,32 @@
++#
++# (C) Copyright 2003
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
++#
++# AMD development board AMD Alchemy DbAu1x00, MIPS32 core
++#
++
++# ROM version
++TEXT_BASE = 0xbfc00000
++
++# RAM version
++#TEXT_BASE = 0x80100000
+--- u-boot-1.3.0/board/mycable/xxsnet/flash.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsnet/flash.c	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,43 @@
++/*
++ * (C) Copyright 2003
++ * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
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
++
++#include <common.h>
++
++flash_info_t flash_info[CFG_MAX_FLASH_BANKS];	/* info for FLASH chips */
++
++/*-----------------------------------------------------------------------
++ * flash_init()
++ *
++ * sets up flash_info and returns size of FLASH (bytes)
++ */
++unsigned long flash_init (void)
++{
++	printf ("Skipping flash_init\n");
++	return (0);
++}
++
++int write_buff (flash_info_t * info, uchar * src, ulong addr, ulong cnt)
++{
++	printf ("write_buff not implemented\n");
++	return (-1);
++}
+--- u-boot-1.3.0/board/mycable/xxsnet/lowlevel_init.S	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsnet/lowlevel_init.S	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,585 @@
++/* Memory sub-system initialization code */
++
++#include <config.h>
++#include <version.h>
++#include <asm/regdef.h>
++#include <asm/au1x00.h>
++#include <asm/mipsregs.h>
++
++#define AU1500_SYS_ADDR		0xB1900000
++#define sys_endian		0x0038
++#define CP0_Config0		$16
++#define CPU_SCALE		((CFG_MHZ) / 12) /* CPU clock is a multiple of 12 MHz */
++#define MEM_1MS			((CFG_MHZ) * 1000)
++
++	.text
++	.set noreorder
++	.set mips32
++
++	.globl	lowlevel_init
++lowlevel_init:
++	/*
++	 * Step 1) Establish CPU endian mode.
++	 * Db1500-specific:
++	 * Switch S1.1 Off(bit7 reads 1) is Little Endian
++	 * Switch S1.1 On (bit7 reads 0) is Big Endian
++	 */
++#ifdef CONFIG_DBAU1550
++	li	t0, MEM_STCFG2
++	li	t1, 0x00000040
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STTIME2
++	li	t1, 0x22080a20
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR2
++	li	t1, 0x10c03f00
++	sw	t1, 0(t0)
++#else
++	li	t0, MEM_STCFG1
++	li	t1, 0x00000080
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STTIME1
++	li	t1, 0x22080a20
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR1
++	li	t1, 0x10c03f00
++	sw	t1, 0(t0)
++#endif
++
++little_endian:
++
++	/* Change Au1 core to little endian */
++	li	t0, AU1500_SYS_ADDR
++	li	t1, 1
++	sw	t1, sys_endian(t0)
++	mfc0	t2, CP0_CONFIG
++	mtc0	t2, CP0_CONFIG
++	nop
++	nop
++
++	/* Big Endian is default so nothing to do but fall through */
++
++big_endian:
++
++	/*
++	 * Step 2) Establish Status Register
++	 * (set BEV, clear ERL, clear EXL, clear IE)
++	 */
++	li	t1, 0x00400000
++	mtc0	t1, CP0_STATUS
++
++	/*
++	 * Step 3) Establish CP0 Config0
++	 * (set OD, set K0=3)
++	 */
++	li	t1, 0x00080003
++	mtc0	t1, CP0_CONFIG
++
++	/*
++	 * Step 4) Disable Watchpoint facilities
++	 */
++	li t1, 0x00000000
++	mtc0	t1, CP0_WATCHLO
++	mtc0	t1, CP0_IWATCHLO
++	/*
++	 * Step 5) Disable the performance counters
++	 */
++	mtc0	zero, CP0_PERFORMANCE
++	nop
++
++	/*
++	 * Step 6) Establish EJTAG Debug register
++	 */
++	mtc0	zero, CP0_DEBUG
++	nop
++
++	/*
++	 * Step 7) Establish Cause
++	 * (set IV bit)
++	 */
++	li	t1, 0x00800000
++	mtc0	t1, CP0_CAUSE
++
++	/* Establish Wired (and Random) */
++	mtc0	zero, CP0_WIRED
++	nop
++
++#ifdef CONFIG_DBAU1550
++	/* No workaround if running from ram */
++	lui	t0, 0xffc0
++	lui	t3, 0xbfc0
++	and	t1, ra, t0
++	bne	t1, t3, noCacheJump
++	nop
++
++	/*** From AMD YAMON ***/
++	/*
++	 * Step 8) Initialize the caches
++	 */
++	li		t0, (16*1024)
++	li		t1, 32
++	li		t2, 0x80000000
++	addu	t3, t0, t2
++cacheloop:
++	cache	0, 0(t2)
++	cache	1, 0(t2)
++	addu	t2, t1
++	bne		t2, t3, cacheloop
++	nop
++
++	/* Save return address */
++	move		t3, ra
++
++	/* Run from cacheable space now */
++	bal		cachehere
++	nop
++cachehere:
++	li		t1, ~0x20000000 /* convert to KSEG0 */
++	and		t0, ra, t1
++	addi	t0, 5*4			/* 5 insns beyond cachehere */
++	jr		t0
++	nop
++
++	/* Restore return address */
++	move		ra, t3
++
++	/*
++	 * Step 9) Initialize the TLB
++	 */
++	li		t0, 0			# index value
++	li		t1, 0x00000000		# entryhi value
++	li		t2, 32			# 32 entries
++
++tlbloop:
++	/* Probe TLB for matching EntryHi */
++	mtc0	t1, CP0_ENTRYHI
++	tlbp
++	nop
++
++	/* Examine Index[P], 1=no matching entry */
++	mfc0	t3, CP0_INDEX
++	li	t4, 0x80000000
++	and	t3, t4, t3
++	addiu	t1, t1, 1		# increment t1 (asid)
++	beq	zero, t3, tlbloop
++	nop
++
++	/* Initialize the TLB entry */
++	mtc0	t0, CP0_INDEX
++	mtc0	zero, CP0_ENTRYLO0
++	mtc0	zero, CP0_ENTRYLO1
++	mtc0	zero, CP0_PAGEMASK
++	tlbwi
++
++	/* Do it again */
++	addiu	t0, t0, 1
++	bne	t0, t2, tlbloop
++	nop
++
++#endif /* CONFIG_DBAU1550 */
++
++	/* First setup pll:s to make serial work ok */
++	/* We have a 12 MHz crystal */
++	li	t0, SYS_CPUPLL
++	li	t1, CPU_SCALE  /* CPU clock */
++	sw	t1, 0(t0)
++	sync
++	nop
++	nop
++
++	/* wait 1mS for clocks to settle */
++	li	t1, MEM_1MS
++1:	add	t1, -1
++	bne	t1, zero, 1b
++	nop
++	/* Setup AUX PLL */
++	li	t0, SYS_AUXPLL
++	li	t1, 0x20 /* 96 MHz */
++	sw	t1, 0(t0) /* aux pll */
++	sync
++
++#ifdef CONFIG_DBAU1550
++	/*  Static memory controller */
++	/* RCE0 - can not change while fetching, do so from icache */
++	move		t2, ra /* Store return address */
++	bal		getAddr
++	nop
++
++getAddr:
++	move		t1, ra
++	move		ra, t2 /* Move return addess back */
++
++	cache	0x14,0(t1)
++	cache	0x14,32(t1)
++	/*** /From YAMON ***/
++
++noCacheJump:
++#endif /* CONFIG_DBAU1550 */
++
++#ifdef CONFIG_DBAU1550
++	li	t0, MEM_STTIME0
++	li	t1, 0x040181D7
++	sw	t1, 0(t0)
++
++	/* RCE0 AMD MirrorBit Flash (?) */
++	li	t0, MEM_STCFG0
++	li	t1, 0x00000003
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR0
++	li	t1, 0x11803E00
++	sw	t1, 0(t0)
++#else /* CONFIG_DBAU1550 */
++	li	t0, MEM_STTIME0
++	li	t1, 0x040181D7
++	sw	t1, 0(t0)
++
++	/* RCE0 AMD 29LV640M MirrorBit Flash */
++	li	t0, MEM_STCFG0
++	li	t1, 0x00000013
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR0
++	li	t1, 0x11E03F80
++	sw	t1, 0(t0)
++#endif /* CONFIG_DBAU1550 */
++
++	/* RCE1 CPLD Board Logic */
++	li	t0, MEM_STCFG1
++	li	t1, 0x00000080
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STTIME1
++	li	t1, 0x22080a20
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR1
++	li	t1, 0x10c03f00
++	sw	t1, 0(t0)
++
++#ifdef CONFIG_DBAU1550
++	/* RCE2 CPLD Board Logic */
++	li	t0, MEM_STCFG2
++	li	t1, 0x00000040
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STTIME2
++	li	t1, 0x22080a20
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR2
++	li	t1, 0x10c03f00
++	sw	t1, 0(t0)
++#else
++	li	t0, MEM_STCFG2
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STTIME2
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR2
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++#endif
++
++	/* RCE3 PCMCIA 250ns */
++	li	t0, MEM_STCFG3
++	li	t1, 0x00000002
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STTIME3
++	li	t1, 0x280E3E07
++	sw	t1, 0(t0)
++
++	li	t0, MEM_STADDR3
++	li	t1, 0x10000000
++	sw	t1, 0(t0)
++
++	sync
++
++	/* Set peripherals to a known state */
++	li	t0, IC0_CFG0CLR
++	li	t1, 0xFFFFFFFF
++	sw	t1, 0(t0)
++
++	li	t0, IC0_CFG0CLR
++	sw	t1, 0(t0)
++
++	li	t0, IC0_CFG1CLR
++	sw	t1, 0(t0)
++
++	li	t0, IC0_CFG2CLR
++	sw	t1, 0(t0)
++
++	li	t0, IC0_SRCSET
++	sw	t1, 0(t0)
++
++	li	t0, IC0_ASSIGNSET
++	sw	t1, 0(t0)
++
++	li	t0, IC0_WAKECLR
++	sw	t1, 0(t0)
++
++	li	t0, IC0_RISINGCLR
++	sw	t1, 0(t0)
++
++	li	t0, IC0_FALLINGCLR
++	sw	t1, 0(t0)
++
++	li	t0, IC0_TESTBIT
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, IC1_CFG0CLR
++	li	t1, 0xFFFFFFFF
++	sw	t1, 0(t0)
++
++	li	t0, IC1_CFG0CLR
++	sw	t1, 0(t0)
++
++	li	t0, IC1_CFG1CLR
++	sw	t1, 0(t0)
++
++	li	t0, IC1_CFG2CLR
++	sw	t1, 0(t0)
++
++	li	t0, IC1_SRCSET
++	sw	t1, 0(t0)
++
++	li	t0, IC1_ASSIGNSET
++	sw	t1, 0(t0)
++
++	li	t0, IC1_WAKECLR
++	sw	t1, 0(t0)
++
++	li	t0, IC1_RISINGCLR
++	sw	t1, 0(t0)
++
++	li	t0, IC1_FALLINGCLR
++	sw	t1, 0(t0)
++
++	li	t0, IC1_TESTBIT
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, SYS_FREQCTRL0
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, SYS_FREQCTRL1
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, SYS_CLKSRC
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, SYS_PININPUTEN
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, 0xB1100100
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, 0xB1400100
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++
++	li	t0, SYS_WAKEMSK
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, SYS_WAKESRC
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	/* wait 1mS before setup */
++	li	t1, MEM_1MS
++1:	add	t1, -1
++	bne	t1, zero, 1b
++	nop
++
++#ifdef CONFIG_DBAU1550
++/* SDCS 0,1,2 DDR SDRAM */
++	li	t0, MEM_SDMODE0
++	li	t1, 0x04276221
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDMODE1
++	li	t1, 0x04276221
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDMODE2
++	li	t1, 0x04276221
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDADDR0
++	li	t1, 0xe21003f0
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDADDR1
++	li	t1, 0xe21043f0
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDADDR2
++	li	t1, 0xe21083f0
++	sw	t1, 0(t0)
++
++	sync
++
++	li	t0, MEM_SDCONFIGA
++	li	t1, 0x9030060a /* Program refresh - disabled */
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDCONFIGB
++	li	t1, 0x00028000
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDPRECMD /* Precharge all */
++	li	t1, 0
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD0
++	li	t1, 0x40000000
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD1
++	li	t1, 0x40000000
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD2
++	li	t1, 0x40000000
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD0
++	li	t1, 0x00000063
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD1
++	li	t1, 0x00000063
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD2
++	li	t1, 0x00000063
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDPRECMD /* Precharge all */
++	sw	zero, 0(t0)
++	sync
++
++	/* Issue 2 autoref */
++	li	t0, MEM_SDAUTOREF
++	sw	zero, 0(t0)
++	sync
++
++	li	t0, MEM_SDAUTOREF
++	sw	zero, 0(t0)
++	sync
++
++	/* Enable refresh */
++	li	t0, MEM_SDCONFIGA
++	li	t1, 0x9830060a /* Program refresh - enabled */
++	sw	t1, 0(t0)
++	sync
++
++#else /* CONFIG_DBAU1550 */
++/* SDCS 0,1 SDRAM */
++	li	t0, MEM_SDMODE0
++	li	t1, 0x005522AA
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDMODE1
++	li	t1, 0x005522AA
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDMODE2
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDADDR0
++	li	t1, 0x001003F8
++	sw	t1, 0(t0)
++
++
++	li	t0, MEM_SDADDR1
++	li	t1, 0x001023F8
++	sw	t1, 0(t0)
++
++	li	t0, MEM_SDADDR2
++	li	t1, 0x00000000
++	sw	t1, 0(t0)
++
++	sync
++
++	li	t0, MEM_SDREFCFG
++	li	t1, 0x64000C24 /* Disable */
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDPRECMD
++	sw	zero, 0(t0)
++	sync
++
++	li	t0, MEM_SDAUTOREF
++	sw	zero, 0(t0)
++	sync
++	sw	zero, 0(t0)
++	sync
++
++	li	t0, MEM_SDREFCFG
++	li	t1, 0x66000C24 /* Enable */
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD0
++	li	t1, 0x00000033
++	sw	t1, 0(t0)
++	sync
++
++	li	t0, MEM_SDWRMD1
++	li	t1, 0x00000033
++	sw	t1, 0(t0)
++	sync
++
++#endif /* CONFIG_DBAU1550 */
++	/* wait 1mS after setup */
++	li	t1, MEM_1MS
++1:	add	t1, -1
++	bne	t1, zero, 1b
++	nop
++
++	li	t0, SYS_PINFUNC
++	li	t1, 0x00008080
++	sw	t1, 0(t0)
++
++	li	t0, SYS_TRIOUTCLR
++	li	t1, 0x00001FFF
++	sw	t1, 0(t0)
++
++	li	t0, SYS_OUTPUTCLR
++	li	t1, 0x00008000
++	sw	t1, 0(t0)
++	sync
++
++	j	ra
++	nop
+--- u-boot-1.3.0/board/mycable/xxsnet/Makefile	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsnet/Makefile	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,45 @@
++#
++# (C) Copyright 2003-2006
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
++COBJS	= $(BOARD).o flash.o
++SOBJS	= lowlevel_init.o
++
++SRCS	:= $(SOBJS:.o=.S) $(COBJS:.o=.c)
++OBJS	:= $(addprefix $(obj),$(COBJS))
++SOBJS	:= $(addprefix $(obj),$(SOBJS))
++
++$(LIB):	$(obj).depend $(OBJS) $(SOBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS) $(SOBJS)
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
++#########################################################################
+--- u-boot-1.3.0/board/mycable/xxsnet/README	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsnet/README	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,63 @@
++By Thomas.Lange@corelatus.se 2004-Oct-05
++----------------------------------------
++DbAu1xx0 are development boards from AMD containing
++an Alchemy AU1xx0 series cpu with mips32 core.
++Existing cpu:s are Au1000, Au1100, Au1500 and Au1550
++
++Limitations & comments
++----------------------
++Support was originally big endian only.
++I have not tested, but several u-boot users report working
++configurations in little endian mode.
++
++I named the board dbau1x00, to allow
++support for all three development boards
++( dbau1000, dbau1100 and dbau1500 ).
++Now there is a new board called dbau1550 also, which
++should be supported RSN.
++
++I only have a dbau1000, so my testing is limited
++to this board.
++
++The board has two different flash banks, that can
++be selected via dip switch. This makes it possible
++to test new bootloaders without thrashing the YAMON
++boot loader delivered with board.
++
++NOTE! When you switch between the two boot flashes, the
++base addresses will be swapped.
++Have this in mind when you compile u-boot. TEXT_BASE has
++to match the address where u-boot is located when you
++actually launch.
++
++Ethernet only supported for mac0.
++
++PCMCIA only supported for slot 0, only 3.3V.
++
++PCMCIA IDE tested with Sandisk Compact Flash and
++IBM microdrive.
++
++###################################
++########     NOTE!!!!!!   #########
++###################################
++If you partition a disk on another system (e.g. laptop),
++all bytes will be swapped on 16bit level when using
++PCMCIA and running cpu in big endian mode!!!!
++
++This is probably due to an error in Au1000 chip.
++
++Solution:
++
++a) Boot via network and partition disk directly from
++dbau1x00. The endian will then be correct.
++
++b) Partition disk on "laptop" and fill it with all files
++you need. Then write a simple program that endian swaps
++whole disk,
++
++Example:
++Original "laptop" byte order:
++B0 B1 B2 B3 B4 B5 B6 B7 B8 B9...
++
++Dbau1000 byte order will then be:
++B1 B0 B3 B2 B5 B4 B7 B6 B9 B8...
+--- u-boot-1.3.0/board/mycable/xxsnet/u-boot.lds	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsnet/u-boot.lds	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,69 @@
++/*
++ * (C) Copyright 2003
++ * Wolfgang Denk Engineering, <wd@denx.de>
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
++
++/*
++OUTPUT_FORMAT("elf32-bigmips", "elf32-bigmips", "elf32-bigmips")
++*/
++OUTPUT_FORMAT("elf32-tradlittlemips", "elf32-tradlittlemips", "elf32-tradlittlemips")
++OUTPUT_ARCH(mips)
++ENTRY(_start)
++SECTIONS
++{
++	. = 0x00000000;
++
++	. = ALIGN(4);
++	.text       :
++	{
++	  *(.text)
++	}
++
++	. = ALIGN(4);
++	.rodata  : { *(.rodata) }
++
++	. = ALIGN(4);
++	.data  : { *(.data) }
++
++	. = ALIGN(4);
++	.sdata  : { *(.sdata) }
++
++	_gp = ALIGN(16);
++
++	__got_start = .;
++	.got  : { *(.got) }
++	__got_end = .;
++
++	.sdata  : { *(.sdata) }
++
++	. = .;
++	__u_boot_cmd_start = .;
++	.u_boot_cmd : { *(.u_boot_cmd) }
++	__u_boot_cmd_end = .;
++
++	uboot_end_data = .;
++	num_got_entries = (__got_end - __got_start) >> 2;
++
++	. = ALIGN(4);
++	.sbss  : { *(.sbss) }
++	.bss  : { *(.bss) }
++	uboot_end = .;
++}
+--- u-boot-1.3.0/board/mycable/xxsnet/xxsnet.c	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/board/mycable/xxsnet/xxsnet.c	2009-02-26 15:34:28.000000000 +0100
+@@ -0,0 +1,127 @@
++/*
++ * (C) Copyright 2003
++ * Thomas.Lange@corelatus.se
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
++
++#include <common.h>
++#include <command.h>
++#include <asm/au1x00.h>
++#include <asm/mipsregs.h>
++
++long int initdram(int board_type)
++{
++	/* Sdram is setup by assembler code */
++	/* If memory could be changed, we should return the true value here */
++	return MEM_SIZE*1024*1024;
++}
++
++#define BCSR_PCMCIA_PC0DRVEN		0x0010
++#define BCSR_PCMCIA_PC0RST		0x0080
++
++/* In cpu/mips/cpu.c */
++void write_one_tlb( int index, u32 pagemask, u32 hi, u32 low0, u32 low1 );
++
++int checkboard (void)
++{
++#ifdef CONFIG_IDE_PCMCIA
++	u16 status;
++	volatile u32 *pcmcia_bcsr = (u32*)(DB1XX0_BCSR_ADDR+0x10);
++#endif	/* CONFIG_IDE_PCMCIA */
++	volatile u32 *phy = (u32*)(DB1XX0_BCSR_ADDR+0xC);
++	volatile u32 *sys_counter = (volatile u32*)SYS_COUNTER_CNTRL;
++	u32 proc_id;
++
++	*sys_counter = 0x100; /* Enable 32 kHz oscillator for RTC/TOY */
++
++	proc_id = read_32bit_cp0_register(CP0_PRID);
++
++	switch (proc_id >> 24) {
++	case 0:
++		puts ("Board: Merlot (DbAu1000)\n");
++		printf ("CPU: Au1000 396 MHz, id: 0x%02x, rev: 0x%02x\n",
++			(proc_id >> 8) & 0xFF, proc_id & 0xFF);
++		break;
++	case 1:
++		puts ("Board: DbAu1500\n");
++		printf ("CPU: Au1500, id: 0x%02x, rev: 0x%02x\n",
++			(proc_id >> 8) & 0xFF, proc_id & 0xFF);
++		break;
++	case 2:
++		puts ("Board: DbAu1100\n");
++		printf ("CPU: Au1100, id: 0x%02x, rev: 0x%02x\n",
++			(proc_id >> 8) & 0xFF, proc_id & 0xFF);
++		break;
++	case 3:
++		puts ("Board: DbAu1550\n");
++		printf ("CPU: Au1550, id: 0x%02x, rev: 0x%02x\n",
++			(proc_id >> 8) & 0xFF, proc_id & 0xFF);
++		break;
++	default:
++		printf ("Unsupported cpu %d, proc_id=0x%x\n", proc_id >> 24, proc_id);
++	}
++#ifdef CONFIG_IDE_PCMCIA
++	/* Enable 3.3 V on slot 0 ( VCC )
++	   No 5V */
++	status = 4;
++	*pcmcia_bcsr = status;
++
++	status |= BCSR_PCMCIA_PC0DRVEN;
++	*pcmcia_bcsr = status;
++	au_sync();
++
++	udelay(300*1000);
++
++	status |= BCSR_PCMCIA_PC0RST;
++	*pcmcia_bcsr = status;
++	au_sync();
++
++	udelay(100*1000);
++
++	/* PCMCIA is on a 36 bit physical address.
++	   We need to map it into a 32 bit addresses */
++
++#if 0
++	/* We dont need theese unless we run whole pcmcia package */
++	write_one_tlb(20,                 /* index */
++		      0x01ffe000,         /* Pagemask, 16 MB pages */
++		      CFG_PCMCIA_IO_BASE, /* Hi */
++		      0x3C000017,         /* Lo0 */
++		      0x3C200017);        /* Lo1 */
++
++	write_one_tlb(21,                   /* index */
++		      0x01ffe000,           /* Pagemask, 16 MB pages */
++		      CFG_PCMCIA_ATTR_BASE, /* Hi */
++		      0x3D000017,           /* Lo0 */
++		      0x3D200017);          /* Lo1 */
++#endif	/* 0 */
++	write_one_tlb(22,                   /* index */
++		      0x01ffe000,           /* Pagemask, 16 MB pages */
++		      CFG_PCMCIA_MEM_ADDR,  /* Hi */
++		      0x3E000017,           /* Lo0 */
++		      0x3E200017);          /* Lo1 */
++#endif	/* CONFIG_IDE_PCMCIA */
++
++	/* Release reset of ethernet PHY chips */
++	/* Always do this, because linux does not know about it */
++	*phy = 3;
++
++	return 0;
++}
+--- u-boot-1.3.0/include/configs/xxsnet.h	1970-01-01 01:00:00.000000000 +0100
++++ u-boot-1.3.0-dev/include/configs/xxsnet.h	2009-02-26 15:34:27.000000000 +0100
+@@ -0,0 +1,228 @@
++/*
++ * (C) Copyright 2003
++ * Wolfgang Denk, DENX Software Engineering, wd@denx.de.
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
++
++/*
++ * This file contains the configuration parameters for the dbau1x00 board.
++ */
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++#define CONFIG_MIPS32		1  /* MIPS32 CPU core	*/
++#define CONFIG_DBAU1X00		1
++#define CONFIG_AU1X00		1  /* alchemy series cpu */
++
++#ifdef CONFIG_DBAU1000
++/* Also known as Merlot */
++  #define CONFIG_AU1000		1
++#else
++#ifdef CONFIG_DBAU1100
++  #define CONFIG_AU1100		1
++#else
++#ifdef CONFIG_DBAU1500
++  #define CONFIG_AU1500		1
++#else
++#ifdef CONFIG_DBAU1550
++/* Cabernet */
++  #define CONFIG_AU1550           1
++#else
++#ifdef CONFIG_XXSNET
++  #define CONFIG_DBAU1550	1
++  #define CONFIG_AU1550           1
++#else
++#error "No valid board set"
++#endif
++#endif
++#endif
++#endif
++#endif
++
++#define CONFIG_ETHADDR		DE:AD:BE:EF:01:01    /* Ethernet address */
++
++#define CONFIG_BOOTDELAY	2	/* autoboot after 2 seconds	*/
++
++#define CONFIG_BAUDRATE		115200
++
++/* valid baudrates */
++#define CFG_BAUDRATE_TABLE	{ 9600, 19200, 38400, 57600, 115200 }
++
++#define	CONFIG_TIMESTAMP		/* Print image info with timestamp */
++#undef	CONFIG_BOOTARGS
++
++#define	CONFIG_EXTRA_ENV_SETTINGS					\
++	"addmisc=setenv bootargs ${bootargs} "				\
++		"console=ttyS0,${baudrate} "				\
++		"panic=1\0"						\
++	"bootfile=/tftpboot/vmlinux.srec\0"				\
++	"load=tftp 80500000 ${u-boot}\0"				\
++	""
++
++#ifdef CONFIG_DBAU1550
++/* Boot from flash by default, revert to bootp */
++#define CONFIG_BOOTCOMMAND	"bootm 0xbfc20000; bootp; bootm"
++
++#define CONFIG_COMMANDS		((CONFIG_CMD_DFL | CFG_CMD_FLASH | CFG_CMD_LOADB | CFG_CMD_NET) & \
++				 ~(CFG_CMD_ENV | CFG_CMD_FAT | CFG_CMD_FPGA | CFG_CMD_IDE | \
++				   CFG_CMD_MII | CFG_CMD_RUN | CFG_CMD_BDI | CFG_CMD_BEDBUG | \
++				   CFG_CMD_NFS | CFG_CMD_ELF | CFG_CMD_PCMCIA | CFG_CMD_I2C))
++#else /* CONFIG_DBAU1550 */
++#define CONFIG_BOOTCOMMAND	"bootp;bootm"
++
++#define CONFIG_COMMANDS		((CONFIG_CMD_DFL | CFG_CMD_IDE | CFG_CMD_DHCP | CFG_CMD_ELF) & \
++				 ~(CFG_CMD_ENV | CFG_CMD_FAT | CFG_CMD_FLASH | CFG_CMD_FPGA | \
++				   CFG_CMD_MII | CFG_CMD_LOADS | CFG_CMD_RUN | CFG_CMD_LOADB | \
++				   CFG_CMD_ELF | CFG_CMD_BDI | CFG_CMD_BEDBUG))
++#endif /* CONFIG_DBAU1550 */
++
++#include <cmd_confdefs.h>
++
++/*
++ * Miscellaneous configurable options
++ */
++#define	CFG_LONGHELP				/* undef to save memory      */
++
++#define	CFG_PROMPT		"mycable # "	/* Monitor Command Prompt    */
++
++#define	CFG_CBSIZE		256		/* Console I/O Buffer Size   */
++#define	CFG_PBSIZE (CFG_CBSIZE+sizeof(CFG_PROMPT)+16)  /* Print Buffer Size */
++#define	CFG_MAXARGS		16		/* max number of command args*/
++
++#define CFG_MALLOC_LEN		128*1024
++
++#define CFG_BOOTPARAMS_LEN	128*1024
++
++#define CFG_MHZ			396
++
++#if (CFG_MHZ % 12) != 0
++#error "Invalid CPU frequency - must be multiple of 12!"
++#endif
++
++#define CFG_HZ                  (CFG_MHZ * 1000000) /* FIXME causes overflow in net.c */
++
++#define CFG_SDRAM_BASE		0x80000000     /* Cached addr */
++
++#define	CFG_LOAD_ADDR		0x81000000     /* default load address	*/
++
++#define CFG_MEMTEST_START	0x80100000
++#define CFG_MEMTEST_END		0x80800000
++
++/*-----------------------------------------------------------------------
++ * FLASH and environment organization
++ */
++#ifdef CONFIG_AU1550
++
++#define CFG_MAX_FLASH_BANKS	2	/* max number of memory banks */
++#define CFG_MAX_FLASH_SECT	(512)	/* max number of sectors on one chip */
++
++#define PHYS_FLASH_1		0xb8000000 /* Flash Bank #1 */
++#define PHYS_FLASH_2		0xbc000000 /* Flash Bank #2 */
++
++#else /* CONFIG_DBAU1550 */
++
++#define CFG_MAX_FLASH_BANKS	2	/* max number of memory banks */
++#define CFG_MAX_FLASH_SECT	(128)	/* max number of sectors on one chip */
++
++#define PHYS_FLASH_1		0xbec00000 /* Flash Bank #1 */
++#define PHYS_FLASH_2		0xbfc00000 /* Flash Bank #2 */
++
++#endif /* CONFIG_DBAU1550 */
++
++#define CFG_FLASH_BANKS_LIST {PHYS_FLASH_1, PHYS_FLASH_2}
++
++#define CFG_FLASH_CFI           1
++#define CFG_FLASH_CFI_DRIVER    1
++
++/* The following #defines are needed to get flash environment right */
++#define	CFG_MONITOR_BASE	TEXT_BASE
++#define	CFG_MONITOR_LEN		(192 << 10)
++
++#define CFG_INIT_SP_OFFSET	0x400000
++
++/* We boot from this flash, selected with dip switch */
++#define CFG_FLASH_BASE		PHYS_FLASH_2
++
++/* timeout values are in ticks */
++#define CFG_FLASH_ERASE_TOUT	(2 * CFG_HZ) /* Timeout for Flash Erase */
++#define CFG_FLASH_WRITE_TOUT	(2 * CFG_HZ) /* Timeout for Flash Write */
++
++#define	CFG_ENV_IS_NOWHERE	1
++
++/* Address and size of Primary Environment Sector	*/
++#define CFG_ENV_ADDR		0xB0030000
++#define CFG_ENV_SIZE		0x10000
++
++#define CONFIG_FLASH_16BIT
++
++#define CONFIG_NR_DRAM_BANKS	2
++
++#define CONFIG_NET_MULTI
++
++#ifdef CONFIG_DBAU1550
++#define MEM_SIZE 192
++#else
++#define MEM_SIZE 64
++#endif
++
++#define CONFIG_MEMSIZE_IN_BYTES
++
++#ifndef CONFIG_DBAU1550
++/*---ATA PCMCIA ------------------------------------*/
++#define CFG_PCMCIA_MEM_SIZE 0x4000000 /* Offset to slot 1 FIXME!!! */
++#define CFG_PCMCIA_MEM_ADDR 0x20000000
++#define CONFIG_PCMCIA_SLOT_A
++
++#define CONFIG_ATAPI 1
++#define CONFIG_MAC_PARTITION 1
++
++/* We run CF in "true ide" mode or a harddrive via pcmcia */
++#define CONFIG_IDE_PCMCIA 1
++
++/* We only support one slot for now */
++#define CFG_IDE_MAXBUS		1	/* max. 1 IDE bus		*/
++#define CFG_IDE_MAXDEVICE	1	/* max. 1 drive per IDE bus	*/
++
++#undef	CONFIG_IDE_LED			/* LED   for ide not supported	*/
++#undef	CONFIG_IDE_RESET		/* reset for ide not supported	*/
++
++#define CFG_ATA_IDE0_OFFSET	0x0000
++
++#define CFG_ATA_BASE_ADDR       CFG_PCMCIA_MEM_ADDR
++
++/* Offset for data I/O			*/
++#define CFG_ATA_DATA_OFFSET     8
++
++/* Offset for normal register accesses  */
++#define CFG_ATA_REG_OFFSET      0
++
++/* Offset for alternate registers       */
++#define CFG_ATA_ALT_OFFSET      0x0100
++#endif /* CONFIG_DBAU1550 */
++
++/*-----------------------------------------------------------------------
++ * Cache Configuration
++ */
++#define CFG_DCACHE_SIZE		16384
++#define CFG_ICACHE_SIZE		16384
++#define CFG_CACHELINE_SIZE	32
++
++#endif	/* __CONFIG_H */
diff --git a/recipes/u-boot/u-boot-jade-1.3.0/05_diff-mycable-board-jadedevalkit.patch b/recipes/u-boot/u-boot-jade-1.3.0/05_diff-mycable-board-jadedevalkit.patch
new file mode 100644
index 0000000..96851af
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/05_diff-mycable-board-jadedevalkit.patch
@@ -0,0 +1,985 @@
+--- u-boot-1.3.0/board/mycable/jadedevalkit/Makefile	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/board/mycable/jadedevalkit/Makefile	2009-11-16 14:25:10.000000000 +0000
+@@ -0,0 +1,52 @@
++
++#
++# (C) Copyright 2003-2006
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
++COBJS	:= $(BOARD).o
++SOBJS   := lowlevel_init.o
++
++SRCS	:= $(SOBJS:.o=.S) $(COBJS:.o=.c)
++OBJS	:= $(addprefix $(obj),$(COBJS))
++SOBJS	:= $(addprefix $(obj),$(SOBJS))
++
++$(LIB):	$(obj).depend $(OBJS) $(SOBJS)
++	$(AR) $(ARFLAGS) $@ $(OBJS) $(SOBJS)
++
++clean:
++	rm -f $(SOBJS) $(OBJS)
++
++distclean:	clean
++	rm -f $(LIB) core *.bak .depend
++
++#########################################################################
++
++# defines $(obj).depend target
++include $(SRCTREE)/rules.mk
++
++sinclude $(obj).depend
++
++#########################################################################
+--- u-boot-1.3.0/board/mycable/jadedevalkit/config.mk	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/board/mycable/jadedevalkit/config.mk	2009-11-16 14:25:10.000000000 +0000
+@@ -0,0 +1,5 @@
++#
++# image should be loaded at 0x47f00000
++#
++
++TEXT_BASE = 0x47f00000
+--- u-boot-1.3.0/board/mycable/jadedevalkit/jadedevalkit.c	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/board/mycable/jadedevalkit/jadedevalkit.c	2010-03-04 15:14:28.000000000 +0000
+@@ -0,0 +1,170 @@
++/*
++ * (C) Copyright 2009, Fujitsu Microelectronics Europe GmbH
++ * Thomas Betker <thomas.betker@fme.fujitsu.com>
++ *
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
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
++
++#include <common.h>
++#include <asm/arch/jade.h>
++
++#define JADE_TCON_PHYS_BASE     0xf2000000  /* DPERI0 TCON phys */
++#define TCON_DIR_RBM_CTRL       0x52C
++#define TCON_DIR_PIN0_CTRL      0x534
++#define TCON_DIR_PIN1_CTRL      0x538
++#define TCON_DIR_PIN2_CTRL      0x53C
++#define TCON_DIR_PIN3_CTRL      0x540
++#define TCON_DIR_PIN4_CTRL      0x544
++#define TCON_DIR_PIN5_CTRL      0x548
++#define TCON_DIR_PIN6_CTRL      0x54C
++#define TCON_DIR_PIN7_CTRL      0x550
++#define TCON_DIR_PIN8_CTRL      0x554
++#define TCON_DIR_PIN9_CTRL      0x558
++#define TCON_DIR_PIN10_CTRL     0x55C
++#define TCON_DIR_PIN11_CTRL     0x560
++#define TCON_DIR_PIN12_CTRL     0x564
++
++DECLARE_GLOBAL_DATA_PTR;
++
++void multiplex_group_init(void);
++void gpio_init(void);
++void tcon_init(void);
++
++#if defined(CONFIG_SHOW_BOOT_PROGRESS)
++void show_boot_progress(int progress)
++{
++    printf("Boot reached stage %d\n", progress);
++}
++#endif
++
++static inline void delay (unsigned long loops)
++{
++	__asm__ volatile ("1:\n"
++		"subs %0, %1, #1\n"
++		"bne 1b":"=r" (loops):"0" (loops));
++}
++
++/*
++ * Miscellaneous platform dependent initialisations
++ */
++
++int board_init (void)
++{
++	/* arch number of Versatile Board */
++	gd->bd->bi_arch_number = MACH_TYPE_XXSVIDEOD;
++	/* adress of boot parameters */
++	gd->bd->bi_boot_params = 0x40000100;
++
++	gd->flags = 0;
++
++	icache_enable ();
++
++	/* set Multiplex Group */
++	multiplex_group_init();
++
++	/* init GPIOs */
++	gpio_init();
++
++	/* init TCON */
++	tcon_init();
++
++	return 0;
++}
++
++
++int misc_init_r (void)
++{
++	setenv("verify", "n");
++	return (0);
++}
++
++/*
++ * DRAM configuration
++ */
++int dram_init (void)
++{
++        gd->bd->bi_dram[0].start = PHYS_SDRAM_1;
++        gd->bd->bi_dram[0].size  = PHYS_SDRAM_1_SIZE;
++
++	return 0;
++}
++
++/*
++ * Initial the Pin Multiplex Groups
++ */
++void multiplex_group_init(void)
++{
++	/*
++	 * The multiplex groups are configured as follows (groups 
++	 * 1 and 5 are set by external pins, not by CCNT.CMUX_MD):
++	 *
++	 * MODE_1      *00  DISP1 + CAP0,1 ITU
++	 *     or      *10  DISP1 + MEMC 32bit Ext.
++	 * MODE_2       01  DISP0 + APIX_SB0
++	 * MODE_3       10  GPIO[0:1] + APIX_SB1
++	 * MODE_4       0   CAP0,1 2xITU
++	 * MODE_5.0    *0   TRACE
++	 * MODE_5.1    *0   UART0 (not used)
++	 * MODE_6       0   I2S
++	 * MODE_7       0   PWM (not used)
++	 * MODE_8       0   SPI_HOST
++	 * MODE_9       00  UART0
++	 * MODE_10      00  UART1,2 + SPI-1
++	 * MODE_11      0   SPI-0
++	 */
++	PUT_REG(JADE_CCNT_PHYS_BASE | CCNT_CMUX_MD, 0x00090000);
++}
++
++void gpio_init(void)
++{
++	/*
++	 * We configure all GPIOs as input. Note that the Jade-D 
++	 * Evaluation Kit does not use any MB86R02 GPIOs for LEDs or 
++	 * for CAN transceivers. 
++	 */
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_0, 0x00);
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_1, 0x00);
++	PUT_REG(JADE_GPIO_PHYS_BASE | GPIO_DIRECTION | GPIO_BLOCK_2, 0x00);
++}
++
++/*
++ * Initialize TCON.
++ */
++void tcon_init(void)
++{
++	/*
++	 * Set TCON.DIR_RBM_CTRL.Bypass = 1.
++	 * Set TCON.DIR_PINxCTRL.InOutx = 1 (x=0..12).
++	 */
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_RBM_CTRL, 0x00000001);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN0_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN1_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN2_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN3_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN4_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN5_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN6_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN7_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN8_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN9_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN10_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN11_CTRL, 0x00000090);
++	PUT_REG(JADE_TCON_PHYS_BASE | TCON_DIR_PIN12_CTRL, 0x00000090);
++}
++
+--- u-boot-1.3.0/board/mycable/jadedevalkit/lowlevel_init.S	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/board/mycable/jadedevalkit/lowlevel_init.S	2010-03-04 12:56:25.000000000 +0000
+@@ -0,0 +1,492 @@
++/*
++ * Board specific setup info
++ *
++ * (C) Copyright 2009, Fujitsu Microelectronics Europe GmbH
++ * Thomas Betker <thomas.betker@fme.fujitsu.com>
++ *
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
++ *
++ * (C) Copyright 2003, ARM Ltd.
++ * Philippe Robin, <philippe.robin@arm.com>
++ *
++ * See file CREDITS for list of people who contributed to this
++ * project.
++ *
++ * This program is free software/* you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation/* either version 2 of
++ * the License, or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY/* without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program/* if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
++ */
++
++#include <config.h>
++#include <version.h>
++
++/* Set up the platform, once the cpu has been initialized */
++.globl lowlevel_init
++lowlevel_init:
++/*------------------------------------------------------------------------------*/
++/*  Initialize Clock Reset Generator (CRG)                                      */
++/*------------------------------------------------------------------------------*/
++
++        ldr     r0, =0xfffe7000			/* CRG base address */
++
++        /* Not change the initial value that is set by external pin.*/
++1:      ldr     r2, [r0, #0x00]			/* Wait for PLLREADY */
++        tst     r2, #0x00000100
++        beq     1b
++
++        /* Set clock gate control */
++        ldr     r1, =0x00ffffff                 /* Open */
++        str     r1, [r0, #0x18]                 /* CRHA: AHB clock */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x1c]                 /* CRPA: APB-A clock */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x20]                 /* CRPA: APB-B clock */
++        ldr     r1, =0x0000ffff                 /* Open */
++        str     r1, [r0, #0x24]                 /* CRHB: ExtAHB clock */
++        ldr     r1, =0xffffffff                 /* Open */
++        str     r1, [r0, #0x28]                 /* CRAM: ARM core clock */
++        ldr     r1, =0xffffffff                 /* Open */
++        str     r1, [r0, #0x2C]                 /* CRDP0: DPERI0 clock */
++        ldr     r1, =0xffffffff                 /* Open */
++        str     r1, [r0, #0x30]                 /* CRDP1: DPERI1 clock */
++
++/*------------------------------------------------------------------------------*/
++/*  Initialize External Bus Interface                                           */
++/*------------------------------------------------------------------------------*/
++#define MEMC_BASE        0xfffc0000
++
++        ldr     r0, =MEMC_BASE                  /* MEMC base address */
++
++        /* SRAM/flash _mode_ registers (XCS4 is set by external pin)
++        	XCS0: Ethernet Controller
++        	XCS2: USB Controller
++        	XCS4: Flash
++        */
++        ldr     r1, =0x00000001		/* XCS0: 16bit */
++        str     r1, [r0, #0x00]
++        ldr     r1, =0x00000001		/* XCS2: 16bit */
++        str     r1, [r0, #0x08]
++        ldr     r1, [r0, #0x10]		/* XSC4: 16bit/32bit */
++        and     r1, r1, #0x00000003
++        str     r1, [r0, #0x10]
++
++        /* SRAM/flash _timing_ registers (HCLK=83.3/80MHz) */
++        ldr     r1, =0x055ff00f		/* XCS0: */
++        str     r1, [r0, #0x20]
++        ldr     r1, =0x14193038		/* XCS2: S1R72V18 */
++        str     r1, [r0, #0x28]
++        ldr     r1, =0x03061008		/* XCS4: FLASH ROM, reviewed by ab@mycable.de */
++        str     r1, [r0, #0x30]
++
++        /* SRAM/flash _area_ registers (address of XCS4 is set by external pin) */
++        ldr     r1, =0x00000020		/* XCS0: 0x02000000/1MB */
++        str     r1, [r0, #0x40]
++        ldr     r1, =0x00000050		/* XCS2: 0x05000000/1MB */
++        str     r1, [r0, #0x48]
++        ldr     r1, =0x001f0000		/* XCS4: 32 MB */
++        str     r1, [r0, #0x50]
++
++        /*
++         * MB86R02 Errata 2009-04-27, E7: Overlapping chip select 
++         * addresses on the external bus interface (EXTBUS).
++         *
++         * Use 0x0ffxxxxx (1MB dummy) for CS1, CS3, CS5, CS6, CS7.
++         */
++        ldr     r1, =0x000000ff
++        str     r1, [r0, #0x44]
++        str     r1, [r0, #0x4c]
++        str     r1, [r0, #0x54]
++        str     r1, [r0, #0x58]
++        str     r1, [r0, #0x5c]
++
++/*------------------------------------------------------------------------------*/
++/*  GPIO Settings                                                               */
++/*------------------------------------------------------------------------------*/
++
++/*----------------------------------------------------------------------------- */
++/*  Initialize DDR2 Controller                                                  */
++/*----------------------------------------------------------------------------- */
++#define CCNT_BASE        0xfff42000
++#define CDEBUG1          0xec
++
++#define DDR2C_BASE       0xf3000000
++#define DRIC             0x00
++#define DRIC1            0x02
++#define DRIC2            0x04
++#define DRCA             0x06
++#define DRCM             0x08
++#define DRCST1           0x0a
++#define DRCST2           0x0c
++#define DRCR             0x0e
++#define DRCF             0x20
++#define DRASR            0x30
++#define DRIMS		 0x50
++#define DROS             0x60
++#define DRIBSLI          0x62
++#define DRIBSODT1        0x64
++#define DRIBSOCD         0x66
++#define DRIBSOCD2        0x68
++#define DROABA           0x70
++#define DROBV            0x80
++#define DROBS            0x84
++#define DROBSR1          0x86
++#define DROBSR2          0x88
++#define DROBSR3          0x8a
++#define DROBSR4          0x8c
++#define DRIMR1           0x90
++#define DRIMR2           0x92
++#define DRIMR3           0x94
++#define DRIMR4           0x96
++#define DROISR1          0x98
++#define DROISR2          0x9a
++
++        .macro wait, count
++        mov     r4, #\count
++3:
++        subs    r4, r4, #0x1
++        bne     3b
++
++        .endm
++
++
++
++        /* Wait for PLL LOCK up time or more */
++        wait    20
++
++	/* ----------------------- */
++        /* (2) Initialize DDRIF */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x5555
++        strh    r1, [r0, #DRIMS]
++
++	/* ----------------------- */
++        /* (3) Wait for 20MCKPs(120nsec) or more */
++	/* ----------------------- */
++        wait    20
++
++	/* ----------------------- */
++        /* (4) IRESET/IUSRRST release */
++	/* ----------------------- */
++        ldr     r0, =CCNT_BASE                  /* CCNT base address */
++        ldr     r1, =0x00000002
++        str     r1, [r0, #CDEBUG1]
++
++	/* ----------------------- */
++        /* (5) Wait for 20MCKPs(120nsec) or more */
++	/* ----------------------- */
++        wait    20
++
++	/* ----------------------- */
++        /* (6) IDLLRST release */
++	/* ----------------------- */
++        ldr     r0, =CCNT_BASE                  /* CCNT base address */
++        ldr     r1, =0x00000003
++        str     r1, [r0, #CDEBUG1]
++
++	/* ----------------------- */
++        /* (7+8) Wait for 200us(=200000ns) or more (DDR2 Spec) */
++	/* ----------------------- */
++	wait 33536
++
++	/* ----------------------- */
++        /* (9) MCKE ON */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x003f
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc124                     /* 512Mbit DDR2SDRAM x 2 */
++        strh    r1, [r0, #DRCA]
++        ldr     r1, =0xc000
++        strh    r1, [r0, #DRIC]
++
++	/* ----------------------- */
++        /* (10) Initialize SDRAM  */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0xc001                     /* NOP Command */
++        strh    r1, [r0, #DRIC]
++
++        wait    67                              /* 400ns wait */
++
++        ldr     r1, =0x0017                     /* PALL Command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0400
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0006                     /* EMR(2) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0007                     /* EMR(3) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++	ldr     r1, =0x0000			/* Extended Mode Register 1 clear*/
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0004                     /* MRS command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0532			/* Mode Register */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++	wait 200
++
++        ldr     r1, =0x0017                     /* PALL command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0400
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x000f                     /* REF command 1 */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0xc001                     /* REF command 2 */
++        strh    r1, [r0, #DRIC]
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0xc001                     /* REF command 3 */
++        strh    r1, [r0, #DRIC]
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0xc001                     /* REF command 4 */
++        strh    r1, [r0, #DRIC]
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0xc001                     /* REF command 5 */
++        strh    r1, [r0, #DRIC]
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0xc001                     /* REF command 6 */
++        strh    r1, [r0, #DRIC]
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0xc001                     /* REF command 7 */
++        strh    r1, [r0, #DRIC]
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0xc001                     /* REF command 8 */
++        strh    r1, [r0, #DRIC]
++        wait    18                              /* 105ns wait */
++
++        ldr     r1, =0x0004                     /* MRS command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0432
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        wait    200                             /* MRS to OCD: 200clock */
++
++        ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0380                     /* Extended Mode Register 1 set OCD */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++	ldr     r1, =0x0005                     /* EMR(1) command */
++        strh    r1, [r0, #DRIC1]
++        ldr     r1, =0x0044                     /* full strength, 50 Ohm */
++        strh    r1, [r0, #DRIC2]
++        ldr     r1, =0xc001
++        strh    r1, [r0, #DRIC]
++
++        ldr     r1, =0x0032                     /* Set BT, AL, CL, BL */
++        strh    r1, [r0, #DRCM]
++
++	ldr	r1, =0x3418			/* Set tRCD, tRAS, tRP, tRC */
++        strh    r1, [r0, #DRCST1]
++
++	ldr     r1, =0x6e32			/* Set tRFC, tRRD, tWR */
++        strh    r1, [r0, #DRCST2]
++
++        ldr     r1, =0x0041
++        strh    r1, [r0, #DRCR]
++        ldr     r1, =0x0141			/* Set CNTLD, REF_CNT */
++        strh    r1, [r0, #DRCR]
++
++	ldr     r1, =0x0002			/* Set Address FIFO (8 steps) */
++        strh    r1, [r0, #DRCF]
++
++        ldr     r1, =0x0001                     /* Enable AXI Cache */
++        strh    r1, [r0, #DRASR]
++
++        /* ----------------------- */
++        /* (11) OCD Adjustment     */
++        /* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++
++        /*
++         * OCD adjustment mode on
++         * Set to driver PMOS adjustment mode
++         */
++
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIBSODT1]
++        ldr     r1, =0x001b
++        strh    r1, [r0, #DRIBSOCD]
++        ldr     r1, =0x0001
++        strh    r1, [r0, #DRIBSOCD2]
++        ldr     r1, =0x0081
++        strh    r1, [r0, #DROABA]
++
++        /*
++         * Initialize DRVPx = 0xf (x=1..4)
++         * Initialize DRVNx = 0x0 (x=1..4)
++         */
++
++        // r0: DDR2C_BASE
++        // r1: register values
++        // r2: DROISRx value
++        // r3: temporary data
++        // r4: used by wait macro
++        ldr     r2, =0x00000f0f
++
++6:      /*
++         * Write PMOS driver setting
++         */
++
++        strh    r2, [r0, #DROISR1]
++        strh    r2, [r0, #DROISR2]
++        wait    167                             /* wait some time (1us) */
++
++        /*
++         * Read adjustment level of PMOS driver output impedance
++         */
++
++        ldrh    r1, [r0, #DRIMR1]
++        and     r1, r1, #0x1
++        cmp     r1, #0x1
++        beq     7f
++
++        /*
++         * Decrement PMOS driver setting value
++         */
++
++        and     r1, r2, #0xf
++        cmp     r1, #0x0
++        beq     7f
++
++        ldr     r3, =0x0101
++        sub     r2, r2, r3
++        b       6b
++
++7:      /*
++         * Set to driver NMOS adjustment mode
++         */
++
++        ldr     r1, =0x0017
++        strh    r1, [r0, #DRIBSOCD]
++
++8:      /*
++         * Write NMOS driver setting
++         */
++
++        strh    r2, [r0, #DROISR1]
++        strh    r2, [r0, #DROISR2]
++        wait    167                             /* wait some time (1us) */
++
++        /*
++         * Read adjustment level of NMOS driver output impedance
++         */
++
++        ldrh    r1, [r0, #DRIMR1]
++        and     r1, r1, #0x1
++        cmp     r1, #0x0
++        beq     9f
++
++        /*
++         * Increment NMOS driver setting value
++         */
++
++        and     r1, r2, #0xf0
++        cmp     r1, #0xf0
++        beq     9f
++
++        ldr     r3, =0x1010
++        add     r2, r2, r3
++        b       8b
++
++9:      /*
++         * OCD adjustment mode off
++         * Set to normal driver mode
++         */
++
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIBSODT1]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIBSOCD]
++        ldr     r1, =0x0000
++        strh    r1, [r0, #DRIBSOCD2]
++
++	/* ----------------------- */
++        /* (11) ODT setting        */
++	/* ----------------------- */
++        ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++        ldr     r1, =0x0001
++        strh    r1, [r0, #DROBS]
++        ldr     r1, =0x0083
++        strh    r1, [r0, #DROABA]
++	ldr     r1, =0x003F			/* Set ODT to on 50/100 Ohm */
++        strh    r1, [r0, #DRIBSODT1]
++
++	/* ----------------------- */
++        /* (12) Shift to ODTCONT ON (SDRAM side) and DDR2C usual operation mode */
++	/* ----------------------- */
++	ldr     r0, =DDR2C_BASE                 /* DDR2C base address */
++	ldr     r1, =0x0001
++	strh    r1, [r0, #DROS]
++	ldr     r1, =0x4000
++	strh    r1, [r0, #DRIC]
++
++	mov pc, lr
++
++/*------------------------------------------------------------------------------*/
++/*  Reset CPU by writing SWRSTREQ to CRSR-register */
++/*------------------------------------------------------------------------------*/
++.globl reset_cpu
++reset_cpu:
++        ldr     r0, =0xfffe7000     /* CRG Base address */
++
++        ldr     r2, =0x00000002		/* SWRSTREQ */
++        str     r2, [r0, #0x0c]
++
++_loop_forever:
++        b       _loop_forever
++
+--- u-boot-1.3.0/board/mycable/jadedevalkit/u-boot.lds	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/board/mycable/jadedevalkit/u-boot.lds	2009-11-16 14:25:10.000000000 +0000
+@@ -0,0 +1,51 @@
++/*
++ * (C) Copyright 2002
++ * Gary Jennejohn, DENX Software Engineering, <gj@denx.de>
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
++
++OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
++OUTPUT_ARCH(arm)
++ENTRY(_start)
++SECTIONS
++{
++	. = 0x40000000;
++	. = ALIGN(8);
++	.text	:
++	{
++	  cpu/arm926ejs/start.o	(.text)
++	  *(.text)
++	}
++	.rodata : { *(.rodata) }
++	. = ALIGN(8);
++	.data : { *(.data) }
++	. = ALIGN(8);
++	.got : { *(.got) }
++
++	. = .;
++	__u_boot_cmd_start = .;
++	.u_boot_cmd : { *(.u_boot_cmd) }
++	__u_boot_cmd_end = .;
++
++	. = ALIGN(8);
++	__bss_start = .;
++	.bss : { *(.bss) }
++	_end = .;
++}
+--- u-boot-1.3.0/include/configs/jadedevalkit.h	1970-01-01 00:00:00.000000000 +0000
++++ u-boot-1.3.0-dev/include/configs/jadedevalkit.h	2009-11-16 14:25:10.000000000 +0000
+@@ -0,0 +1,197 @@
++/*
++ * (C) Copyright 2009, Fujitsu Microelectronics Europe GmbH
++ * Thomas Betker <thomas.betker@fme.fujitsu.com>
++ *
++ * (C) Copyright 2007, mycable GmbH
++ * Carsten Schneider <cs@mycable.de>, Alexander Bigga <ab@mycable.de>
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
++
++
++#ifndef __CONFIG_H
++#define __CONFIG_H
++
++#define GET_REG(reg)       (*((volatile u32 *)(reg)))
++#define PUT_REG(reg, val)  (*((volatile u32 *)(reg)) = ((u32)(val)))
++#define PUT_U16(reg, val)  (*((volatile u16 *)(reg)) = ((u16)(val)))
++
++/*
++ * High Level Configuration Options
++ * (easy to change)
++ */
++#define CONFIG_ARM926EJS	1	/* This is an arm926ejs CPU core  */
++
++#define CFG_HZ			(41666666/16)
++#define CFG_TIMERBASE		0xfffe0000 /* Timer A and B base */
++
++#define CFG_TIMER_INTERVAL	10000
++#define CFG_TIMER_RELOAD	(CFG_TIMER_INTERVAL >> 4) /* Divide by 16 */
++#define CFG_TIMER_CTRL		0x86 /* Enable, Clock / 16, 32bit */
++
++#define CONFIG_CMDLINE_TAG	1 	/* enable passing of ATAGs */
++#define CONFIG_SETUP_MEMORY_TAGS 1
++#define CONFIG_MISC_INIT_R	1 	/* call misc_init_r during start up */
++
++#define CONFIG_CMDLINE_EDITING  1       /* add command line history     */
++#define CONFIG_LOOPW            1       /* enable loopw command         */
++#define CONFIG_MX_CYCLIC        1       /* enable mdc/mwc commands      */
++#define CONFIG_ZERO_BOOTDELAY_CHECK     /* check for keypress on bootdelay==0 */
++#define CONFIG_VERSION_VARIABLE 1       /* include version env variable */
++
++/*
++ * Size of malloc() pool
++ */
++#define CFG_MALLOC_LEN		(CFG_ENV_SIZE + 128*1024)
++#define CFG_GBL_DATA_SIZE	128	/* size in bytes reserved for initial data */
++
++/*
++ * Hardware drivers
++ */
++
++/*
++ * Ethernet
++ */
++#define CONFIG_DRIVER_SMSC9118
++#define CONFIG_SMSC9118_BASE	0x02000000
++
++/*
++ * NS16550 Configuration
++ */
++#define CFG_NS16550
++#define CFG_NS16550_SERIAL
++#define CFG_NS16550_REG_SIZE	4
++#define CFG_NS16550_CLK		(23*16*115200)
++
++#define CFG_NS16550_COM1	0xfffe1000
++#define CFG_NS16550_COM2	0xfffe2000
++
++#define CONFIG_CONS_INDEX	1
++#define CONFIG_BAUDRATE		115200
++#define CFG_BAUDRATE_TABLE	{ 9600, 19200, 38400, 57600, 115200 }
++
++/*
++ * BOOTP options
++ */
++#define CONFIG_BOOTP_BOOTFILESIZE
++#define CONFIG_BOOTP_BOOTPATH
++#define CONFIG_BOOTP_GATEWAY
++#define CONFIG_BOOTP_HOSTNAME
++
++/*
++ * Command line configuration.
++ */
++#include <config_cmd_default.h>
++
++#define CONFIG_CMD_ASKENV
++//#define CONFIG_CMD_CACHE
++#define CONFIG_CMD_DHCP
++#define CONFIG_CMD_DIAG
++//#define CONFIG_CMD_EEPROM
++//#define CONFIG_CMD_ELF
++//#define CONFIG_CMD_I2C
++//#define CONFIG_CMD_IRQ
++#define CONFIG_CMD_LOG
++#define CONFIG_CMD_MII
++#define CONFIG_CMD_NET
++#define CONFIG_CMD_NFS
++#define CONFIG_CMD_PING
++#define CONFIG_CMD_REGINFO
++
++#define CONFIG_BOOTDELAY	2
++// #define CONFIG_BOOTARGS "root=/dev/nfs/rw nfsroot=169.254.148.45:/home/user/elpa/arm/arm"
++// #define CONFIG_BOOTCOMMAND "bootp ; bootm"
++
++/*
++ * Static configuration when assigning fixed address
++ */
++// #define CONFIG_ETHADDR	66:22:00:01:16:05	/* sample IP; */
++#define CONFIG_NETMASK	255.255.255.0		/* talk on MY local net */
++//#define CONFIG_IPADDR	192.168.128.102		/* static IP */
++#define CONFIG_SERVERIP	192.168.128.20		/* server IP */
++
++#define CONFIG_BOOTFILE	"uImage"		/* file to load */
++
++
++/*
++ * Miscellaneous configurable options
++ */
++#define CFG_LONGHELP			/* undef to save memory     */
++#define CFG_PROMPT	"xxsvideo> " 	/* Monitor Command Prompt   */
++#define CFG_CBSIZE	256		/* Console I/O Buffer Size  */
++
++#define CFG_PBSIZE	(CFG_CBSIZE+sizeof(CFG_PROMPT)+16)	/* Print Buffer Size */
++#define CFG_MAXARGS	16		/* max number of command args   */
++#define CFG_BARGSIZE	CFG_CBSIZE	/* Boot Argument Buffer Size    */
++
++#undef	CFG_CLKS_IN_HZ			/* everything, incl board info, in Hz */
++#define CFG_LOAD_ADDR	0x42000000 	/* default load address */
++
++/*-----------------------------------------------------------------------
++ * Stack sizes
++ *
++ * The stack sizes are set up in start.S using the settings below
++ */
++#define CONFIG_STACKSIZE	(128*1024) 	/* regular stack */
++#ifdef CONFIG_USE_IRQ
++#define CONFIG_STACKSIZE_IRQ	(4*1024) 	/* IRQ stack */
++#define CONFIG_STACKSIZE_FIQ	(4*1024) 	/* FIQ stack */
++#endif
++
++/*-----------------------------------------------------------------------
++ * Physical Memory Map
++ */
++#define CONFIG_NR_DRAM_BANKS    1 		/* we have 1 bank of DRAM */
++#define PHYS_SDRAM_1            0x40000000 	/* SDRAM Bank #1 */
++#define PHYS_SDRAM_1_SIZE       0x08000000 	/* 128 MB */
++
++#define CFG_MEMTEST_START       PHYS_SDRAM_1
++#define CFG_MEMTEST_END         PHYS_SDRAM_1 + PHYS_SDRAM_1_SIZE - 0x00400000
++
++/* Enable an alternate, more extensive memory test */
++//#define CFG_ALT_MEMTEST
++
++/*-----------------------------------------------------------------------
++ * FLASH and environment organization
++ */
++
++#define CFG_FLASH_BASE          0x10000000
++
++#define CFG_MAX_FLASH_BANKS	1 		/* max number of memory banks */
++#define PHYS_FLASH_SIZE         0x02000000 	/* 32 MB */
++/* timeout values are in ticks */
++#define CFG_FLASH_ERASE_TOUT	(20*CFG_HZ)	/* Timeout for Flash Erase */
++#define CFG_FLASH_WRITE_TOUT	(20*CFG_HZ)	/* Timeout for Flash Write */
++#define CFG_MAX_FLASH_SECT	(2048)
++
++#define CFG_FLASH_CFI			1
++#define CFG_FLASH_CFI_DRIVER		1
++#define CFG_FLASH_CFI_AMD_RESET
++#define CFG_FLASH_USE_BUFFER_WRITE	1
++
++#define PHYS_FLASH_1		(CFG_FLASH_BASE)
++#define CFG_MONITOR_BASE       CFG_FLASH_BASE  /* Monitor at beginning of flash */
++
++#define CFG_ENV_IS_IN_FLASH		1 /* env in flash instead of CFG_ENV_IS_NOWHERE */
++#define CFG_ENV_SECT_SIZE		0x00020000 /* 8 KB sectors */
++#define CFG_ENV_SIZE			0x10000 /* Total Size of Environment Sector */
++#define CFG_ENV_OFFSET			0x00020000 /* environment starts here  */
++#define CFG_ENV_ADDR			(CFG_FLASH_BASE + CFG_ENV_OFFSET)
++
++//#define CONFIG_SKIP_LOWLEVEL_INIT
++//#define SKIP_CONFIG_RELOCATE_UBOOT
++
++#endif							/* __CONFIG_H */
diff --git a/recipes/u-boot/u-boot-jade-1.3.0/06_diff-jadedevalkit-makefile.patch b/recipes/u-boot/u-boot-jade-1.3.0/06_diff-jadedevalkit-makefile.patch
new file mode 100644
index 0000000..5e20352
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/06_diff-jadedevalkit-makefile.patch
@@ -0,0 +1,24 @@
+Index: u-boot-1.3.0/Makefile
+===================================================================
+--- u-boot-1.3.0/Makefile	(revision 6)
++++ u-boot-1.3.0/Makefile	(revision 7)
+@@ -24,7 +24,7 @@
+ VERSION = 1
+ PATCHLEVEL = 3
+ SUBLEVEL = 0
+-EXTRAVERSION = -XXSVIDEO_EXTENSION-XXSVIDEO_UBOOT_RELEASE
++EXTRAVERSION = -jadeevalkit
+ U_BOOT_VERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
+ VERSION_FILE = $(obj)include/version_autogenerated.h
+ 
+@@ -2378,8 +2378,8 @@
+ ## ARM926EJS Systems
+ #########################################################################
+ 
+-XXSVIDEO_EXTENSION_config:	unconfig
+-	@./mkconfig $(@:_config=) arm arm926ejs XXSVIDEO_EXTENSION mycable jade
++jadeevalkit_config:	unconfig
++	@./mkconfig $(@:_config=) arm arm926ejs jadeevalkit mycable jade
+ 
+ #########################################################################
+ ## ARM1136 Systems
diff --git a/recipes/u-boot/u-boot-jade-1.3.0/07_0001-ARM-Don-t-inline-weak-symbols.patch b/recipes/u-boot/u-boot-jade-1.3.0/07_0001-ARM-Don-t-inline-weak-symbols.patch
new file mode 100644
index 0000000..42321b2
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/07_0001-ARM-Don-t-inline-weak-symbols.patch
@@ -0,0 +1,58 @@
+From e81fd28244b2f2557f554bdd3fd97b1ec056da43 Mon Sep 17 00:00:00 2001
+From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+Date: Thu, 26 May 2011 16:19:50 +0300
+Subject: [PATCH] ARM Don't inline weak symbols
+
+Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+---
+ common/main.c   |    2 +-
+ lib_arm/board.c |   14 +++++++-------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/common/main.c b/common/main.c
+index 379695c..ddd76d9 100644
+--- a/common/main.c
++++ b/common/main.c
+@@ -48,7 +48,7 @@ DECLARE_GLOBAL_DATA_PTR;
+  * Board-specific Platform code can reimplement show_boot_progress () if needed
+  */
+ void inline __show_boot_progress (int val) {}
+-void inline show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
++void show_boot_progress (int val) __attribute__((weak, alias("__show_boot_progress")));
+ 
+ #if defined(CONFIG_BOOT_RETRY_TIME) && defined(CONFIG_RESET_TO_RETRY)
+ extern int do_reset (cmd_tbl_t *cmdtp, int flag, int argc, char *argv[]);		/* for do_reset() prototype */
+diff --git a/lib_arm/board.c b/lib_arm/board.c
+index 1f907f2..0e8d825 100644
+--- a/lib_arm/board.c
++++ b/lib_arm/board.c
+@@ -124,19 +124,19 @@ void *sbrk (ptrdiff_t increment)
+  * May be supplied by boards if desired
+  */
+ void inline __coloured_LED_init (void) {}
+-void inline coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
++void coloured_LED_init (void) __attribute__((weak, alias("__coloured_LED_init")));
+ void inline __red_LED_on (void) {}
+-void inline red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
++void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
+ void inline __red_LED_off(void) {}
+-void inline red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
++void red_LED_off(void)	     __attribute__((weak, alias("__red_LED_off")));
+ void inline __green_LED_on(void) {}
+-void inline green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
++void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));
+ void inline __green_LED_off(void) {}
+-void inline green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
++void green_LED_off(void)__attribute__((weak, alias("__green_LED_off")));
+ void inline __yellow_LED_on(void) {}
+-void inline yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
++void yellow_LED_on(void)__attribute__((weak, alias("__yellow_LED_on")));
+ void inline __yellow_LED_off(void) {}
+-void inline yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
++void yellow_LED_off(void)__attribute__((weak, alias("__yellow_LED_off")));
+ 
+ /************************************************************************
+  * Init Utilities							*
+-- 
+1.7.5.1
+
diff --git a/recipes/u-boot/u-boot-jade-1.3.0/08_0001-CPU-arm926ejs-Set-GCC-arch-properly.patch b/recipes/u-boot/u-boot-jade-1.3.0/08_0001-CPU-arm926ejs-Set-GCC-arch-properly.patch
new file mode 100644
index 0000000..6d25c81
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade-1.3.0/08_0001-CPU-arm926ejs-Set-GCC-arch-properly.patch
@@ -0,0 +1,26 @@
+From 5e7cb1a2694957546ff429c8ab853df5f955b168 Mon Sep 17 00:00:00 2001
+From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+Date: Thu, 26 May 2011 16:41:15 +0300
+Subject: [PATCH] CPU arm926ejs: Set GCC arch properly
+
+Signed-off-by: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
+---
+ cpu/arm926ejs/config.mk |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/cpu/arm926ejs/config.mk b/cpu/arm926ejs/config.mk
+index 8db4adb..84b68ae 100644
+--- a/cpu/arm926ejs/config.mk
++++ b/cpu/arm926ejs/config.mk
+@@ -24,7 +24,7 @@
+ PLATFORM_RELFLAGS += -fno-strict-aliasing  -fno-common -ffixed-r8 \
+ 	-msoft-float
+ 
+-PLATFORM_CPPFLAGS += -march=armv4
++PLATFORM_CPPFLAGS += -march=armv5te
+ # =========================================================================
+ #
+ # Supply options according to compiler version
+-- 
+1.7.5.1
+
diff --git a/recipes/u-boot/u-boot-jade_1.3.0.bb b/recipes/u-boot/u-boot-jade_1.3.0.bb
new file mode 100644
index 0000000..359286f
--- /dev/null
+++ b/recipes/u-boot/u-boot-jade_1.3.0.bb
@@ -0,0 +1,26 @@
+require u-boot.inc
+
+PR = "r1"
+S = "${WORKDIR}/u-boot-${PV}"
+
+COMPATIBLE_HOST = "arm.*-linux"
+COMPATIBLE_MACHINE = "jade-sk-86r01"
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_jade-sk-86r01 = "1"
+
+
+SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
+	file://01_diff-mycable-all.patch \
+	file://02_diff-mycable-board-xxsterminal.patch \
+	file://03_diff-mycable-board-jadeevalkit.patch \
+	file://04_diff-mycable-board-xxsnet.patch \
+	file://05_diff-mycable-board-jadedevalkit.patch \
+	file://06_diff-jadedevalkit-makefile.patch \
+	file://07_0001-ARM-Don-t-inline-weak-symbols.patch \
+	file://08_0001-CPU-arm926ejs-Set-GCC-arch-properly.patch \
+	"
+
+SRC_URI[md5sum] = "2298f6d6d5c52d42a90c44774ed07751"
+SRC_URI[sha256sum] = "a55d6d46120ea7625a9d2fe594f677690e7dc9e9b3151a6af0ebe25978458608"
-- 
1.7.5.4



