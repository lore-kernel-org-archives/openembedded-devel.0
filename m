Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1O8DeU-0005ar-TN
	for Openembedded-devel@lists.openembedded.org;
	Sat, 01 May 2010 16:26:52 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 9871BF1EA1;
	Sat,  1 May 2010 10:22:53 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute1.internal (MEProxy); Sat, 01 May 2010 10:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=XGX8DKohrxY86vh9Is70llQhJqA=;
	b=aZVgQLopjOp6pbHW5W53to+k7S+EUblaBnyBpoOvQu6Zq1e3G5A4w5Oi3NaUkSH+I6cQtNogaG8QW3DZR+/WA7av1wwYho09eTpHRLmbFtdPZMeakRfjIBRCjoXuT8XxfXGqtvw1zUxRzrjlWoGnMw2SM+lPzbADSTmJRgOaa7Q=
X-Sasl-enc: 4jlbqt9SlqnX4aCR47QyimCNqkCBjY+58rRsqOxX5kA0 1272723773
Received: from localhost.localdomain (p5B0FD323.dip.t-dialin.net
	[91.15.211.35])
	by mail.messagingengine.com (Postfix) with ESMTPA id BDA8719961;
	Sat,  1 May 2010 10:22:52 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Sat,  1 May 2010 16:22:46 +0200
Message-Id: <1272723767-16871-1-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>
References: <alpine.DEB.1.10.1005011614380.15503@vitus.devnet.local>
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH v2] libsocketcan: new recipe
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
X-List-Received-Date: Sat, 01 May 2010 14:26:53 -0000

Builds pengutronix' libsocketcan (using the new netlink interface to access
CAN drivers)

Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 ...ve-headers-supplied-by-linux-libc-headers.patch |  155 ++++++++++++++++++++
 recipes/socketcan/libsocketcan_0.0.7.bb            |   17 ++
 2 files changed, 172 insertions(+), 0 deletions(-)
 create mode 100644 recipes/socketcan/files/0001-remove-headers-supplied-by-linux-libc-headers.patch
 create mode 100644 recipes/socketcan/libsocketcan_0.0.7.bb

diff --git a/recipes/socketcan/files/0001-remove-headers-supplied-by-linux-libc-headers.patch b/recipes/socketcan/files/0001-remove-headers-supplied-by-linux-libc-headers.patch
new file mode 100644
index 0000000..0a779dc
--- /dev/null
+++ b/recipes/socketcan/files/0001-remove-headers-supplied-by-linux-libc-headers.patch
@@ -0,0 +1,155 @@
+[PATCH] remove headers supplied by linux-libc-headers
+
+---
+ include/GNUmakefile.am |    3 +-
+ include/can_netlink.h  |  113 ------------------------------------------------
+ include/libsocketcan.h |    2 +-
+ 3 files changed, 2 insertions(+), 116 deletions(-)
+ delete mode 100644 include/can_netlink.h
+
+diff --git a/include/GNUmakefile.am b/include/GNUmakefile.am
+index 4ba2798..7d7be99 100644
+--- a/include/GNUmakefile.am
++++ b/include/GNUmakefile.am
+@@ -1,5 +1,4 @@
+-noinst_HEADERS = \
+-	can_netlink.h
++noinst_HEADERS = 
+ 
+ nobase_include_HEADERS = \
+ 	libsocketcan.h	
+diff --git a/include/can_netlink.h b/include/can_netlink.h
+deleted file mode 100644
+index 9ecbb78..0000000
+--- a/include/can_netlink.h
++++ /dev/null
+@@ -1,113 +0,0 @@
+-/*
+- * linux/can/netlink.h
+- *
+- * Definitions for the CAN netlink interface
+- *
+- * Copyright (c) 2009 Wolfgang Grandegger <wg@grandegger.com>
+- *
+- * Send feedback to <socketcan-users@lists.berlios.de>
+- *
+- */
+-
+-#ifndef CAN_NETLINK_H
+-#define CAN_NETLINK_H
+-
+-#include <linux/types.h>
+-
+-/*
+- * CAN bit-timing parameters
+- *
+- * For futher information, please read chapter "8 BIT TIMING
+- * REQUIREMENTS" of the "Bosch CAN Specification version 2.0"
+- * at http://www.semiconductors.bosch.de/pdf/can2spec.pdf.
+- */
+-struct can_bittiming {
+-	__u32 bitrate;		/* Bit-rate in bits/second */
+-	__u32 sample_point;	/* Sample point in one-tenth of a percent */
+-	__u32 tq;		/* Time quanta (TQ) in nanoseconds */
+-	__u32 prop_seg;		/* Propagation segment in TQs */
+-	__u32 phase_seg1;	/* Phase buffer segment 1 in TQs */
+-	__u32 phase_seg2;	/* Phase buffer segment 2 in TQs */
+-	__u32 sjw;		/* Synchronisation jump width in TQs */
+-	__u32 brp;		/* Bit-rate prescaler */
+-};
+-
+-/*
+- * CAN harware-dependent bit-timing constant
+- *
+- * Used for calculating and checking bit-timing parameters
+- */
+-struct can_bittiming_const {
+-	char name[16];		/* Name of the CAN controller hardware */
+-	__u32 tseg1_min;	/* Time segement 1 = prop_seg + phase_seg1 */
+-	__u32 tseg1_max;
+-	__u32 tseg2_min;	/* Time segement 2 = phase_seg2 */
+-	__u32 tseg2_max;
+-	__u32 sjw_max;		/* Synchronisation jump width */
+-	__u32 brp_min;		/* Bit-rate prescaler */
+-	__u32 brp_max;
+-	__u32 brp_inc;
+-};
+-
+-/*
+- * CAN clock parameters
+- */
+-struct can_clock {
+-	__u32 freq;		/* CAN system clock frequency in Hz */
+-};
+-
+-/*
+- * CAN operational and error states
+- */
+-enum can_state {
+-	CAN_STATE_ERROR_ACTIVE = 0,	/* RX/TX error count < 96 */
+-	CAN_STATE_ERROR_WARNING,	/* RX/TX error count < 128 */
+-	CAN_STATE_ERROR_PASSIVE,	/* RX/TX error count < 256 */
+-	CAN_STATE_BUS_OFF,		/* RX/TX error count >= 256 */
+-	CAN_STATE_STOPPED,		/* Device is stopped */
+-	CAN_STATE_SLEEPING,		/* Device is sleeping */
+-	CAN_STATE_MAX
+-};
+-
+-/*
+- * CAN controller mode
+- */
+-struct can_ctrlmode {
+-	__u32 mask;
+-	__u32 flags;
+-};
+-
+-#define CAN_CTRLMODE_LOOPBACK	0x1	/* Loopback mode */
+-#define CAN_CTRLMODE_LISTENONLY	0x2 	/* Listen-only mode */
+-#define CAN_CTRLMODE_3_SAMPLES	0x4	/* Triple sampling mode */
+-
+-/*
+- * CAN device statistics
+- */
+-struct can_device_stats {
+-	__u32 bus_error;	/* Bus errors */
+-	__u32 error_warning;	/* Changes to error warning state */
+-	__u32 error_passive;	/* Changes to error passive state */
+-	__u32 bus_off;		/* Changes to bus off state */
+-	__u32 arbitration_lost; /* Arbitration lost errors */
+-	__u32 restarts;		/* CAN controller re-starts */
+-};
+-
+-/*
+- * CAN netlink interface
+- */
+-enum {
+-	IFLA_CAN_UNSPEC,
+-	IFLA_CAN_BITTIMING,
+-	IFLA_CAN_BITTIMING_CONST,
+-	IFLA_CAN_CLOCK,
+-	IFLA_CAN_STATE,
+-	IFLA_CAN_CTRLMODE,
+-	IFLA_CAN_RESTART_MS,
+-	IFLA_CAN_RESTART,
+-	__IFLA_CAN_MAX
+-};
+-
+-#define IFLA_CAN_MAX	(__IFLA_CAN_MAX - 1)
+-
+-#endif /* CAN_NETLINK_H */
+diff --git a/include/libsocketcan.h b/include/libsocketcan.h
+index bd2b040..8a92eee 100644
+--- a/include/libsocketcan.h
++++ b/include/libsocketcan.h
+@@ -26,7 +26,7 @@
+  * @brief API overview
+  */
+ 
+-#include <can_netlink.h>
++#include <linux/can/netlink.h>
+ 
+ int can_do_restart(const char *name);
+ int can_do_stop(const char *name);
+-- 
+1.5.6.5
+
diff --git a/recipes/socketcan/libsocketcan_0.0.7.bb b/recipes/socketcan/libsocketcan_0.0.7.bb
new file mode 100644
index 0000000..0ee86f6
--- /dev/null
+++ b/recipes/socketcan/libsocketcan_0.0.7.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "control basic functions in socketcan from userspace"
+AUTHOR = "Luotao Fu"
+HOMEPAGE = "http://www.pengutronix.de"
+SECTION = "libs/network"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+
+TAG = "v${PV}"
+PR = "r0"
+
+SRC_URI = "git://git.pengutronix.de/git/tools/libsocketcan.git;protocol=git;tag=${TAG} \
+	file://0001-remove-headers-supplied-by-linux-libc-headers.patch;patch=1 \
+	"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
1.5.6.5



