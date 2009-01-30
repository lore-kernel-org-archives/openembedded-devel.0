Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LSvQ4-00082k-4k
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jan 2009 16:36:36 +0100
Received: by qw-out-1920.google.com with SMTP id 14so120494qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2009 07:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:content-type
	:date:message-id:mime-version:x-mailer:content-transfer-encoding;
	bh=+qAz7ylko2K+VCbih95+t+WeXlVSVclecCyvtqKrntI=;
	b=L5LwtU/TLqTPHi6EW+azaYW75/7xGNYtY2jnHmtRbMzG/znytX5eFTNIxpMkmkVeHm
	TiISHA9XoAgyxhA7WjPZqtH4Tkprk3KZZQMMXQhGtlbsFCaLYHY2gR4xGhnLD/3JMWsg
	G447AsU8oLJ73COBo+MNFvWiYr4NfG6EHlCW0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	b=X/w/bkhyerwXDgCn6el/PKho2HrT6VZniczOzrtL+mIokW1QZ+5MmuYZjwr2kLiKUm
	2eRfi95pUO36C/amYcEZa3Rkq/JXCsmsKcwON82Wiuz3Zw6m+n06EO+o9mUd2OKBVqq2
	y3CwLIDeZwDmRbKCZPX5a68cCfmcVGg0CGapE=
Received: by 10.215.15.6 with SMTP id s6mr65240qai.117.1233329329982;
	Fri, 30 Jan 2009 07:28:49 -0800 (PST)
Received: from ?10.6.9.10? (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 4sm18873qwe.1.2009.01.30.07.28.47
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jan 2009 07:28:49 -0800 (PST)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jan 2009 17:28:45 +0200
Message-Id: <1233329325.13749.0.camel@EPBYMINW0568>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Fixed serial console for stb225 board.
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
X-List-Received-Date: Fri, 30 Jan 2009 15:36:36 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use ttyPNX[0-1] with 204:[208-209] device numbers for serial device.
Changed UART speed to 115200.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 conf/machine/stb225.conf                           |    5 ++-
 files/device_table_add-stb225.txt                  |    2 +
 .../linux/linux-2.6.28/stb225/serial-speed.patch   |   12 ++++
 packages/linux/linux-2.6.28/stb225/ttyPNX.patch    |   58 ++++++++++++++++++++
 packages/linux/linux_2.6.28.bb                     |    2 +
 5 files changed, 78 insertions(+), 1 deletions(-)
 create mode 100644 files/device_table_add-stb225.txt
 create mode 100644 packages/linux/linux-2.6.28/stb225/serial-speed.patch
 create mode 100644 packages/linux/linux-2.6.28/stb225/ttyPNX.patch

diff --git a/conf/machine/stb225.conf b/conf/machine/stb225.conf
index c57adb0..52d2cea 100644
--- a/conf/machine/stb225.conf
+++ b/conf/machine/stb225.conf
@@ -9,6 +9,9 @@ IMAGE_FSTYPES += "tar.gz"
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 KERNEL_IMAGETYPE = "uImage"
 
-SERIAL_CONSOLE ?= "115200 ttySA0"
+SERIAL_CONSOLE ?= "115200 ttyPNX0"
 
 require conf/machine/include/tune-mips32.inc
+
+IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
+                       files/device_table_add-stb225.txt"
diff --git a/files/device_table_add-stb225.txt b/files/device_table_add-stb225.txt
new file mode 100644
index 0000000..b312883
--- /dev/null
+++ b/files/device_table_add-stb225.txt
@@ -0,0 +1,2 @@
+# Include nodes for the SCI/SCIF serial ports on SH* boards
+/dev/ttyPNX	c	640	0	5	204	208	0	1	2
diff --git a/packages/linux/linux-2.6.28/stb225/serial-speed.patch b/packages/linux/linux-2.6.28/stb225/serial-speed.patch
new file mode 100644
index 0000000..763a7b1
--- /dev/null
+++ b/packages/linux/linux-2.6.28/stb225/serial-speed.patch
@@ -0,0 +1,12 @@
+diff -urN linux-2.6.28.orig/drivers/serial/pnx8xxx_uart.c linux-2.6.28/drivers/serial/pnx8xxx_uart.c
+--- linux-2.6.28.orig/drivers/serial/pnx8xxx_uart.c	2009-01-30 15:12:47.000000000 +0200
++++ linux-2.6.28/drivers/serial/pnx8xxx_uart.c	2009-01-30 15:13:21.000000000 +0200
+@@ -706,7 +706,7 @@
+ pnx8xxx_console_setup(struct console *co, char *options)
+ {
+ 	struct pnx8xxx_port *sport;
+-	int baud = 38400;
++	int baud = 115200;
+ 	int bits = 8;
+ 	int parity = 'n';
+ 	int flow = 'n';
diff --git a/packages/linux/linux-2.6.28/stb225/ttyPNX.patch b/packages/linux/linux-2.6.28/stb225/ttyPNX.patch
new file mode 100644
index 0000000..aa9a6fc
--- /dev/null
+++ b/packages/linux/linux-2.6.28/stb225/ttyPNX.patch
@@ -0,0 +1,58 @@
+From af80b7f1be5a58769a00ed8dd600951cabf9517e Mon Sep 17 00:00:00 2001
+From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
+Date: Wed, 14 Jan 2009 16:30:29 +0200
+Subject: [PATCH] Don't use ttyS* serial device name for PNX8XXX UART
+
+Rather create ttyPNX*. Also changed minor number to be
+different with sa1100 serial driver one.
+---
+ drivers/serial/pnx8xxx_uart.c |   11 +++++------
+ 1 files changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/serial/pnx8xxx_uart.c b/drivers/serial/pnx8xxx_uart.c
+index 22e30d2..96870f1 100644
+--- a/drivers/serial/pnx8xxx_uart.c
++++ b/drivers/serial/pnx8xxx_uart.c
+@@ -34,9 +34,8 @@
+ #include <asm/io.h>
+ #include <asm/irq.h>
+ 
+-/* We'll be using StrongARM sa1100 serial port major/minor */
+ #define SERIAL_PNX8XXX_MAJOR	204
+-#define MINOR_START		5
++#define MINOR_START		208
+ 
+ #define NR_PORTS		2
+ 
+@@ -636,7 +635,7 @@ static struct uart_ops pnx8xxx_pops = {
+ /*
+  * Setup the PNX8XXX serial ports.
+  *
+- * Note also that we support "console=ttySx" where "x" is either 0 or 1.
++ * Note also that we support "console=ttyPNXx" where "x" is either 0 or 1.
+  */
+ static void __init pnx8xxx_init_ports(void)
+ {
+@@ -728,7 +727,7 @@ pnx8xxx_console_setup(struct console *co, char *options)
+ 
+ static struct uart_driver pnx8xxx_reg;
+ static struct console pnx8xxx_console = {
+-	.name		= "ttyS",
++	.name		= "ttyPNX",
+ 	.write		= pnx8xxx_console_write,
+ 	.device		= uart_console_device,
+ 	.setup		= pnx8xxx_console_setup,
+@@ -752,8 +751,8 @@ console_initcall(pnx8xxx_rs_console_init);
+ 
+ static struct uart_driver pnx8xxx_reg = {
+ 	.owner			= THIS_MODULE,
+-	.driver_name		= "ttyS",
+-	.dev_name		= "ttyS",
++	.driver_name		= "ttyPNX",
++	.dev_name		= "ttyPNX",
+ 	.major			= SERIAL_PNX8XXX_MAJOR,
+ 	.minor			= MINOR_START,
+ 	.nr			= NR_PORTS,
+-- 
+1.5.6.3
+
diff --git a/packages/linux/linux_2.6.28.bb b/packages/linux/linux_2.6.28.bb
index ea88f71..8b099ce 100644
--- a/packages/linux/linux_2.6.28.bb
+++ b/packages/linux/linux_2.6.28.bb
@@ -19,4 +19,6 @@ SRC_URI_append_stb225 = " \
            file://uImage.patch;patch=1 \
            file://ebase-fix.patch;patch=1 \
            file://enable-uart.patch;patch=1 \
+           file://ttyPNX.patch;patch=1 \
+           file://serial-speed.patch;patch=1 \
            file://ip3902.patch;patch=1"
-- 
1.5.6.3




