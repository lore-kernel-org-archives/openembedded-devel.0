Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1LnsGQ-0000M9-9e
	for openembedded-devel@openembedded.org; Sun, 29 Mar 2009 12:29:14 +0200
Received: from localhost.localdomain ([62.205.175.245]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n2TAREuU009518
	for <openembedded-devel@openembedded.org>;
	Sun, 29 Mar 2009 14:27:15 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Date: Sun, 29 Mar 2009 14:27:14 +0400
Message-Id: <1238322434-21219-1-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.6.0.6
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Sun, 29 Mar 2009 14:27:15 +0400 (MSD)
Subject: [PATCH] linux-handhelds-2.6_2.6.21-hh20: fix external serial ports
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
X-List-Received-Date: Sun, 29 Mar 2009 10:29:14 -0000

* add patch (hack) that makes external 8250-based serial ports
  to happily coexist with internal PXA ones, so CF(PCMCIA)Modems,
  GPSes and other serial devices can be used on PDAs supported by
  linux-handhelds kernel.
  It's similar to the patch used in Zauruses' kernel recipes.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 .../pxa-serial-hack.patch                          |   32 ++++++++++++++++++++
 recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb   |    3 +-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 recipes/linux/linux-handhelds-2.6-2.6.21/pxa-serial-hack.patch

There was already some discussions about this problem[1][2], but sadly without
any resolution to it. I prefer this patch to land in OE until we find
a better solution. Various people ask me from time to time via PM for
precompiled kernels with this patch applied, so certainly there's a need
for it.

[1] http://projects.linuxtogo.org/pipermail/angstrom-distro-users/2008-January/001349.html
[2] http://projects.linuxtogo.org/pipermail/angstrom-distro-devel/2008-August/002442.html

diff --git a/recipes/linux/linux-handhelds-2.6-2.6.21/pxa-serial-hack.patch b/recipes/linux/linux-handhelds-2.6-2.6.21/pxa-serial-hack.patch
new file mode 100644
index 0000000..6d52770
--- /dev/null
+++ b/recipes/linux/linux-handhelds-2.6-2.6.21/pxa-serial-hack.patch
@@ -0,0 +1,32 @@
+Index: drivers/serial/8250.c
+===================================================================
+RCS file: /cvs/linux/kernel26/drivers/serial/8250.c,v
+retrieving revision 1.28
+retrieving revision 1.27
+diff -u -r1.28 -r1.27
+--- a/drivers/serial/8250.c	25 Oct 2007 19:35:43 -0000	1.28
++++ b/drivers/serial/8250.c	7 May 2007 01:37:28 -0000	1.27
+@@ -86,6 +86,12 @@
+ #define CONFIG_SERIAL_MANY_PORTS 1
+ #endif
+ 
++#ifdef CONFIG_SERIAL_PXA
++#define SERIAL_HW_SKIP_COUNT	CONFIG_SERIAL_PXA_COUNT
++#else
++#define SERIAL_HW_SKIP_COUNT	0
++#endif
++
+ /*
+  * HUB6 is always on.  This will be removed once the header
+  * files have been cleaned.
+@@ -2479,8 +2485,8 @@
+ 	.driver_name		= "serial",
+ 	.dev_name		= "ttyS",
+ 	.major			= TTY_MAJOR,
+-	.minor			= 64,
+-	.name_base		= 0,
++	.minor			= 64 + SERIAL_HW_SKIP_COUNT,	/* skip host internal uarts */
++	.name_base		= SERIAL_HW_SKIP_COUNT,
+ 	.nr			= UART_NR,
+ 	.cons			= SERIAL8250_CONSOLE,
+ };
diff --git a/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb b/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb
index f6bb173..a27ddc2 100644
--- a/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb
+++ b/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb
@@ -1,7 +1,7 @@
 SECTION = "kernel"
 DESCRIPTION = "handhelds.org Linux kernel 2.6 for PocketPCs and other consumer handheld devices."
 LICENSE = "GPL"
-PR = "r25"
+PR = "r26"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -11,6 +11,7 @@ FILESPATH = "${FILE_DIRNAME}/linux-handhelds-2.6-2.6.21/${MACHINE}:${FILE_DIRNAM
 
 SRC_URI = "${HANDHELDS_CVS};module=linux/kernel26;tag=${@'K' + bb.data.getVar('PV',d,1).replace('.', '-')} \
            file://linux-2.6.git-9d20fdd58e74d4d26dc5216efaaa0f800c23dd3a.patch;patch=1 \
+	   file://pxa-serial-hack.patch;patch=1 \
            http://www.rpsys.net/openzaurus/patches/archive/export_atags-r0a.patch;patch=1 \
            file://gcc4x-limits.patch;patch=1 \
 	   file://defconfig"
-- 
1.6.0.6



