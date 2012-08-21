Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1T3yIK-0008Sy-GH
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2012 01:55:37 +0200
Received: by daks35 with SMTP id s35so241038dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2012 16:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=RtCsu/+85NFEyTLxmGBVr/SyylEs6ODVj5J8YjinJWg=;
	b=qI3QjlZ+R9KSdBMdtDzVSjLeKHv0rXdldRAk6Cyishvurt5yycaixQUqAsIuWOSfGt
	TK4tdLRhiDiAwg5a/7xVMERc0czR/pz+CYRhjK7RdgcUTdvoaGxvEOR1nLEIKKmoCEnh
	D2yc0MdhDHEb/WwkTn80pjrEDBfSUOmemQG5szu2E0EtfFR7GmWUdqfe5DRhcPuma0rx
	LpSryB6vULBqdasbqBIn3sO+jpn5hMMw7WWteb+xKoHuUreCep2EmHhq908M5MJ198gf
	vFDG7OtExs8rbff+ZsJ+TY3kMeqXJ2irVo5My/tvP+v594U+Bjm/adCnvNv3xMaAFAG+
	+ADg==
Received: by 10.66.84.6 with SMTP id u6mr41460673pay.75.1345592611236;
	Tue, 21 Aug 2012 16:43:31 -0700 (PDT)
Received: from eos.du.ae ([94.205.108.162])
	by mx.google.com with ESMTPS id ko8sm2387620pbc.40.2012.08.21.16.43.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 16:43:30 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2012 03:43:11 +0400
Message-Id: <1345592591-20385-3-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345592591-20385-1-git-send-email-elvis.dowson@gmail.com>
References: <1345592591-20385-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 3/3] linux-xilinx-3.3: Add new recipe for linux-xilinx v3.3.0 kernel.
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
X-List-Received-Date: Tue, 21 Aug 2012 23:55:37 -0000

This commit adds a new recipe for the linux-xilinx v3.3.0 kernel, and
includes the following features:
* support for Xilinx ML507 development board
* support for Xilinx Virtex 5 PowerPC440 processor
* support for console output on a LCD display using the DVI port
* support for using a ramdisk and booting to a bash prompt
* support for xps-uart16550-2.00.a, ttyS0
* support for xps-ethernetlite-4.00.a, 10/100 Mbps ethernet interface

The ramdisk size has been set to 32768 kilobytes. This value can be
changed by modifying the supplied kernel deconfig_3.3.0

The linux-xilinx v3.3.0 kernel has been tested using a hardware project
created using Xilinx EDK 14.2.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 ...pdate-IP-Core-support-for-Xilinx-ISE-14.1.patch |  149 ++
 ...l507.dts-Update-device-tree-file-using-Xi.patch |  875 ++++++++++
 ...x-regression-in-call-to-XPS-TFT-controlle.patch |   32 +
 .../linux/linux-xilinx-3.3/virtex5/defconfig_3.3.0 | 1704 ++++++++++++++++++++
 recipes-kernel/linux/linux-xilinx_3.3.bb           |   26 +
 5 files changed, 2786 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-xilinx-3.3/virtex5/0001-Xilinx-Update-IP-Core-support-for-Xilinx-ISE-14.1.patch
 create mode 100644 recipes-kernel/linux/linux-xilinx-3.3/virtex5/0002-virtex440-ml507.dts-Update-device-tree-file-using-Xi.patch
 create mode 100644 recipes-kernel/linux/linux-xilinx-3.3/virtex5/0003-xilinxfb-Fix-regression-in-call-to-XPS-TFT-controlle.patch
 create mode 100644 recipes-kernel/linux/linux-xilinx-3.3/virtex5/defconfig_3.3.0
 create mode 100644 recipes-kernel/linux/linux-xilinx_3.3.bb

diff --git a/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0001-Xilinx-Update-IP-Core-support-for-Xilinx-ISE-14.1.patch b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0001-Xilinx-Update-IP-Core-support-for-Xilinx-ISE-14.1.patch
new file mode 100644
index 0000000..321f64d
--- /dev/null
+++ b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0001-Xilinx-Update-IP-Core-support-for-Xilinx-ISE-14.1.patch
@@ -0,0 +1,149 @@
+From 8a353689559cd864647d39a05ef449e423a07fdd Mon Sep 17 00:00:00 2001
+From: Elvis Dowson <elvis.dowson@gmail.com>
+Date: Wed, 22 Aug 2012 01:38:03 +0400
+Subject: [PATCH 1/3] Xilinx: Update IP Core support for Xilinx ISE 14.1.
+
+This commit updates linux kernel support for the following IP Cores
+shipped with Xilinx ISE 14.1:
+xlnx,xps-sysace-1.01.a
+xlnx,xps-iic-2.02.a
+xlnx,xps-ethernetlite-4.00.a
+xlnx,xps-ll-temac-2.03.a
+xlnx,xps-uartlite-1.02.a
+
+This commit also updates PowerPC support for the following IP Cores
+shipped with Xilinx ISE 14.1:
+xps-uartlite-1.02.a
+xlnx,plb-v46-1.05.a
+xlnx,xps-intc-2.01.a
+
+Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
+---
+ arch/powerpc/boot/serial.c                         |    4 +++-
+ arch/powerpc/platforms/44x/virtex.c                |    3 +++
+ arch/powerpc/sysdev/xilinx_intc.c                  |    2 ++
+ drivers/block/xsysace.c                            |    1 +
+ drivers/i2c/algos/xilinx_iic/i2c-algo-xilinx.c     |    2 ++
+ drivers/net/ethernet/xilinx/xilinx_emaclite.c      |    2 ++
+ .../ethernet/xilinx/xilinx_lltemac/xlltemac_main.c |    4 ++++
+ drivers/tty/serial/uartlite.c                      |    2 ++
+ 8 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
+index f2156f0..6f901dc 100644
+--- a/arch/powerpc/boot/serial.c
++++ b/arch/powerpc/boot/serial.c
+@@ -130,7 +130,9 @@ int serial_console_init(void)
+ 	else if (dt_is_compatible(devp, "fsl,mpc5200-psc-uart"))
+ 		rc = mpc5200_psc_console_init(devp, &serial_cd);
+ 	else if (dt_is_compatible(devp, "xlnx,opb-uartlite-1.00.b") ||
+-		 dt_is_compatible(devp, "xlnx,xps-uartlite-1.00.a"))
++		dt_is_compatible(devp, "xlnx,xps-uartlite-1.00.a") ||
++		dt_is_compatible(devp, "xlnx,xps-uartlite-1.01.a") ||
++		dt_is_compatible(devp, "xlnx,xps-uartlite-1.02.a"))
+ 		rc = uartlite_console_init(devp, &serial_cd);
+ 
+ 	/* Add other serial console driver calls here */
+diff --git a/arch/powerpc/platforms/44x/virtex.c b/arch/powerpc/platforms/44x/virtex.c
+index cf96cca..eb208d3 100644
+--- a/arch/powerpc/platforms/44x/virtex.c
++++ b/arch/powerpc/platforms/44x/virtex.c
+@@ -25,6 +25,9 @@ static struct of_device_id xilinx_of_bus_ids[] __initdata = {
+ 	{ .compatible = "simple-bus", },
+ 	{ .compatible = "xlnx,plb-v46-1.00.a", },
+ 	{ .compatible = "xlnx,plb-v46-1.02.a", },
++	{ .compatible = "xlnx,plb-v46-1.03.a", },
++	{ .compatible = "xlnx,plb-v46-1.04.a", },
++	{ .compatible = "xlnx,plb-v46-1.05.a", },
+ 	{ .compatible = "xlnx,plb-v34-1.01.a", },
+ 	{ .compatible = "xlnx,plb-v34-1.02.a", },
+ 	{ .compatible = "xlnx,opb-v20-1.10.c", },
+diff --git a/arch/powerpc/sysdev/xilinx_intc.c b/arch/powerpc/sysdev/xilinx_intc.c
+index 6183799..a115a20 100644
+--- a/arch/powerpc/sysdev/xilinx_intc.c
++++ b/arch/powerpc/sysdev/xilinx_intc.c
+@@ -267,6 +267,8 @@ static inline void xilinx_i8259_setup_cascade(void) { return; }
+ static struct of_device_id xilinx_intc_match[] __initconst = {
+ 	{ .compatible = "xlnx,opb-intc-1.00.c", },
+ 	{ .compatible = "xlnx,xps-intc-1.00.a", },
++	{ .compatible = "xlnx,xps-intc-2.00.a", },
++	{ .compatible = "xlnx,xps-intc-2.01.a", },
+ 	{}
+ };
+ 
+diff --git a/drivers/block/xsysace.c b/drivers/block/xsysace.c
+index 6e9a86b..8b2ee12 100644
+--- a/drivers/block/xsysace.c
++++ b/drivers/block/xsysace.c
+@@ -1194,6 +1194,7 @@ static const struct of_device_id ace_of_match[] __devinitconst = {
+ 	{ .compatible = "xlnx,opb-sysace-1.00.b", },
+ 	{ .compatible = "xlnx,opb-sysace-1.00.c", },
+ 	{ .compatible = "xlnx,xps-sysace-1.00.a", },
++	{ .compatible = "xlnx,xps-sysace-1.01.a", },
+ 	{ .compatible = "xlnx,sysace", },
+ 	{},
+ };
+diff --git a/drivers/i2c/algos/xilinx_iic/i2c-algo-xilinx.c b/drivers/i2c/algos/xilinx_iic/i2c-algo-xilinx.c
+index 4f3c599..c59b6d0 100644
+--- a/drivers/i2c/algos/xilinx_iic/i2c-algo-xilinx.c
++++ b/drivers/i2c/algos/xilinx_iic/i2c-algo-xilinx.c
+@@ -554,6 +554,8 @@ static int __devinit xilinx_iic_setup(
+ /* Match table for of_platform binding */
+ static struct of_device_id __devinitdata xilinx_iic_of_match[] = {
+ 	{ .compatible = "xlnx,xps-iic-2.00.a", },
++	{ .compatible = "xlnx,xps-iic-2.01.a", },
++	{ .compatible = "xlnx,xps-iic-2.02.a", },
+ 	{},
+ };
+ MODULE_DEVICE_TABLE(of, xilinx_iic_of_match);
+diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+index 79013e5..91fb8e0 100644
+--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
++++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+@@ -1289,6 +1289,8 @@ static struct of_device_id xemaclite_of_match[] __devinitdata = {
+ 	{ .compatible = "xlnx,xps-ethernetlite-2.00.a", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-2.01.a", },
+ 	{ .compatible = "xlnx,xps-ethernetlite-3.00.a", },
++	{ .compatible = "xlnx,xps-ethernetlite-3.01.a", },
++	{ .compatible = "xlnx,xps-ethernetlite-4.00.a", },
+ 	{ /* end of list */ },
+ };
+ MODULE_DEVICE_TABLE(of, xemaclite_of_match);
+diff --git a/drivers/net/ethernet/xilinx/xilinx_lltemac/xlltemac_main.c b/drivers/net/ethernet/xilinx/xilinx_lltemac/xlltemac_main.c
+index e008795..b05e996 100644
+--- a/drivers/net/ethernet/xilinx/xilinx_lltemac/xlltemac_main.c
++++ b/drivers/net/ethernet/xilinx/xilinx_lltemac/xlltemac_main.c
+@@ -3595,6 +3595,7 @@ static struct of_device_id xtenet_fifo_of_match[] = {
+ 	{ .compatible = "xlnx,xps-ll-fifo-1.00.a", },
+ 	{ .compatible = "xlnx,xps-ll-fifo-1.00.b", },
+ 	{ .compatible = "xlnx,xps-ll-fifo-1.01.a", },
++	{ .compatible = "xlnx,xps-ll-fifo-1.02.a", },
+ 	{ /* end of list */ },
+ };
+ 
+@@ -3746,6 +3747,9 @@ static struct of_device_id xtenet_of_match[] = {
+ 	{ .compatible = "xlnx,xps-ll-temac-1.00.b", },
+ 	{ .compatible = "xlnx,xps-ll-temac-1.01.a", },
+ 	{ .compatible = "xlnx,xps-ll-temac-1.01.b", },
++	{ .compatible = "xlnx,xps-ll-temac-2.00.a", },
++	{ .compatible = "xlnx,xps-ll-temac-2.02.a", },
++	{ .compatible = "xlnx,xps-ll-temac-2.03.a", },
+ 	{ /* end of list */ },
+ };
+ 
+diff --git a/drivers/tty/serial/uartlite.c b/drivers/tty/serial/uartlite.c
+index 6cd4143..dd0664d 100644
+--- a/drivers/tty/serial/uartlite.c
++++ b/drivers/tty/serial/uartlite.c
+@@ -566,6 +566,8 @@ static int __devexit ulite_release(struct device *dev)
+ static struct of_device_id ulite_of_match[] __devinitdata = {
+ 	{ .compatible = "xlnx,opb-uartlite-1.00.b", },
+ 	{ .compatible = "xlnx,xps-uartlite-1.00.a", },
++	{ .compatible = "xlnx,xps-uartlite-1.01.a", },
++	{ .compatible = "xlnx,xps-uartlite-1.02.a", },
+ 	{}
+ };
+ MODULE_DEVICE_TABLE(of, ulite_of_match);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0002-virtex440-ml507.dts-Update-device-tree-file-using-Xi.patch b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0002-virtex440-ml507.dts-Update-device-tree-file-using-Xi.patch
new file mode 100644
index 0000000..8f8439a
--- /dev/null
+++ b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0002-virtex440-ml507.dts-Update-device-tree-file-using-Xi.patch
@@ -0,0 +1,875 @@
+From 5c1fb2211db810f46aeb42c5741e6427a1443305 Mon Sep 17 00:00:00 2001
+From: Elvis Dowson <elvis.dowson@gmail.com>
+Date: Wed, 22 Aug 2012 03:13:47 +0400
+Subject: [PATCH 2/3] virtex440-ml507.dts: Update device tree file using
+ Xilinx ISE 14.2.
+
+This commit updates the device tree to one generated automatically by
+Xilinx ISE 14.2.
+
+The bootargs are set as follows:
+console=tty0 ip=on root=/dev/ram rw rootwait init=/bin/sh
+
+The bootargs are set to boot using tty0, which corresponds to an LCD
+display monitor connected to the DVI port, as the serial console output.
+
+This configuration is intended to be used with an initrd.image.gz
+ramdisk file for the initial boot process. The size of the ramdisk file
+is set to 32768 kilobytes, and is specified in the kernel defconfig file.
+
+The device tree is intended to be used with a hardware bitstream that
+specifies ttyS0 (xps-uart16550), instead of ttyUL0 (xps-uartlite),
+as the serial console output device.
+
+To display console output using ttyS0, modify the bootargs as follows:
+console=ttyS0,115200n8 ip=on root=/dev/ram rw rootwait init=/bin/sh
+
+The entries for xps-ethernetlite have had to be manually modified to add
+missing phy-handle and mdio entries, based on a device tree generated
+using Xilinx XPS 13.1.
+
+Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
+---
+ arch/powerpc/boot/dts/virtex440-ml507.dts |  820 +++++++++++++++--------------
+ 1 file changed, 433 insertions(+), 387 deletions(-)
+
+diff --git a/arch/powerpc/boot/dts/virtex440-ml507.dts b/arch/powerpc/boot/dts/virtex440-ml507.dts
+index 9cf6081..b42a442 100644
+--- a/arch/powerpc/boot/dts/virtex440-ml507.dts
++++ b/arch/powerpc/boot/dts/virtex440-ml507.dts
+@@ -1,399 +1,445 @@
+ /*
+- * This file supports the Xilinx ML507 board with the 507 processor.
+- * A reference design for the FPGA is provided at http://www.xilinx.com.
++ * Device Tree Generator version: 1.3
+  *
+- * (C) Copyright 2008 Xilinx, Inc.
++ * (C) Copyright 2007-2008 Xilinx, Inc.
++ * (C) Copyright 2007-2009 Michal Simek
+  *
+- * This file is licensed under the terms of the GNU General Public License
+- * version 2. This program is licensed "as is" without any warranty of any
+- * kind, whether express or implied.
++ * Michal SIMEK <monstr@monstr.eu>
+  *
+- * ---
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation; either version 2 of
++ * the License, or (at your option) any later version.
+  *
+- * Device Tree Generator version: 1.1
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
++ * MA 02111-1307 USA
+  *
+  * CAUTION: This file is automatically generated by libgen.
+- * Version: Xilinx EDK 10.1.03 EDK_K_SP3.6
++ * Version: Xilinx EDK 14.2 EDK_P.28xd
+  *
+- * XPS project directory: ml507_ppc440_emb_ref
++ * XPS project directory: linux_2_6_bsp_0
+  */
+-
+-/dts-v1/;
+-/ {
+-	#address-cells = <1>;
+-	#size-cells = <1>;
+-	compatible = "xlnx,virtex440";
+-	dcr-parent = <&ppc440_0>;
+-	model = "testing";
+-	DDR2_SDRAM: memory@0 {
+-		device_type = "memory";
+-		reg = < 0x0 0x10000000 >;
+-	} ;
+-	chosen {
+-		bootargs = "console=ttyS0 ip=on root=/dev/ram";
++
++/dts-v1/;
++/ {
++	#address-cells = <1>;
++	#size-cells = <1>;
++	compatible = "xlnx,virtex440", "xlnx,virtex";
++	dcr-parent = <&ppc440_0>;
++	model = "testing";
++	aliases {
++		ethernet0 = &ethernet_mac;
++		serial0 = &rs232_uart_1;
++	} ;
++	chosen {
++		bootargs = "console=tty0 ip=on root=/dev/ram rw rootwait init=/bin/sh";
+ 		linux,stdout-path = "/plb@0/serial@83e00000";
+-	} ;
+-	cpus {
+-		#address-cells = <1>;
+-		#cpus = <0x1>;
+-		#size-cells = <0>;
+-		ppc440_0: cpu@0 {
+-			#address-cells = <1>;
+-			#size-cells = <1>;
+-			clock-frequency = "";
+-			compatible = "PowerPC,440", "ibm,ppc440";
+-			d-cache-line-size = <0x20>;
+-			d-cache-size = <0x8000>;
+-			dcr-access-method = "native";
+-			dcr-controller ;
+-			device_type = "cpu";
+-			i-cache-line-size = <0x20>;
+-			i-cache-size = <0x8000>;
+-			model = "PowerPC,440";
+-			reg = <0>;
++	} ;
++	cpus {
++		#address-cells = <1>;
++		#cpus = <0x1>;
++		#size-cells = <0>;
++		ppc440_0: cpu@0 {
++			#address-cells = <1>;
++			#size-cells = <1>;
++			clock-frequency = <400000000>;
++			compatible = "PowerPC,440", "ibm,ppc440";
++			d-cache-line-size = <0x20>;
++			d-cache-size = <0x8000>;
++			dcr-access-method = "native";
++			dcr-controller ;
++			device_type = "cpu";
++			i-cache-line-size = <0x20>;
++			i-cache-size = <0x8000>;
++			model = "PowerPC,440";
++			reg = <0>;
+ 			timebase-frequency = <400000000>;
+-			xlnx,apu-control = <0x1>;
+-			xlnx,apu-udi-0 = <0x0>;
+-			xlnx,apu-udi-1 = <0x0>;
+-			xlnx,apu-udi-10 = <0x0>;
+-			xlnx,apu-udi-11 = <0x0>;
+-			xlnx,apu-udi-12 = <0x0>;
+-			xlnx,apu-udi-13 = <0x0>;
+-			xlnx,apu-udi-14 = <0x0>;
+-			xlnx,apu-udi-15 = <0x0>;
+-			xlnx,apu-udi-2 = <0x0>;
+-			xlnx,apu-udi-3 = <0x0>;
+-			xlnx,apu-udi-4 = <0x0>;
+-			xlnx,apu-udi-5 = <0x0>;
+-			xlnx,apu-udi-6 = <0x0>;
+-			xlnx,apu-udi-7 = <0x0>;
+-			xlnx,apu-udi-8 = <0x0>;
+-			xlnx,apu-udi-9 = <0x0>;
+-			xlnx,dcr-autolock-enable = <0x1>;
+-			xlnx,dcu-rd-ld-cache-plb-prio = <0x0>;
+-			xlnx,dcu-rd-noncache-plb-prio = <0x0>;
+-			xlnx,dcu-rd-touch-plb-prio = <0x0>;
+-			xlnx,dcu-rd-urgent-plb-prio = <0x0>;
+-			xlnx,dcu-wr-flush-plb-prio = <0x0>;
+-			xlnx,dcu-wr-store-plb-prio = <0x0>;
+-			xlnx,dcu-wr-urgent-plb-prio = <0x0>;
+-			xlnx,dma0-control = <0x0>;
+-			xlnx,dma0-plb-prio = <0x0>;
+-			xlnx,dma0-rxchannelctrl = <0x1010000>;
+-			xlnx,dma0-rxirqtimer = <0x3ff>;
+-			xlnx,dma0-txchannelctrl = <0x1010000>;
+-			xlnx,dma0-txirqtimer = <0x3ff>;
+-			xlnx,dma1-control = <0x0>;
+-			xlnx,dma1-plb-prio = <0x0>;
+-			xlnx,dma1-rxchannelctrl = <0x1010000>;
+-			xlnx,dma1-rxirqtimer = <0x3ff>;
+-			xlnx,dma1-txchannelctrl = <0x1010000>;
+-			xlnx,dma1-txirqtimer = <0x3ff>;
+-			xlnx,dma2-control = <0x0>;
+-			xlnx,dma2-plb-prio = <0x0>;
+-			xlnx,dma2-rxchannelctrl = <0x1010000>;
+-			xlnx,dma2-rxirqtimer = <0x3ff>;
+-			xlnx,dma2-txchannelctrl = <0x1010000>;
+-			xlnx,dma2-txirqtimer = <0x3ff>;
+-			xlnx,dma3-control = <0x0>;
+-			xlnx,dma3-plb-prio = <0x0>;
+-			xlnx,dma3-rxchannelctrl = <0x1010000>;
+-			xlnx,dma3-rxirqtimer = <0x3ff>;
+-			xlnx,dma3-txchannelctrl = <0x1010000>;
+-			xlnx,dma3-txirqtimer = <0x3ff>;
+-			xlnx,endian-reset = <0x0>;
+-			xlnx,generate-plb-timespecs = <0x1>;
+-			xlnx,icu-rd-fetch-plb-prio = <0x0>;
+-			xlnx,icu-rd-spec-plb-prio = <0x0>;
+-			xlnx,icu-rd-touch-plb-prio = <0x0>;
+-			xlnx,interconnect-imask = <0xffffffff>;
+-			xlnx,mplb-allow-lock-xfer = <0x1>;
+-			xlnx,mplb-arb-mode = <0x0>;
+-			xlnx,mplb-awidth = <0x20>;
+-			xlnx,mplb-counter = <0x500>;
+-			xlnx,mplb-dwidth = <0x80>;
+-			xlnx,mplb-max-burst = <0x8>;
+-			xlnx,mplb-native-dwidth = <0x80>;
+-			xlnx,mplb-p2p = <0x0>;
+-			xlnx,mplb-prio-dcur = <0x2>;
+-			xlnx,mplb-prio-dcuw = <0x3>;
+-			xlnx,mplb-prio-icu = <0x4>;
+-			xlnx,mplb-prio-splb0 = <0x1>;
+-			xlnx,mplb-prio-splb1 = <0x0>;
+-			xlnx,mplb-read-pipe-enable = <0x1>;
+-			xlnx,mplb-sync-tattribute = <0x0>;
+-			xlnx,mplb-wdog-enable = <0x1>;
+-			xlnx,mplb-write-pipe-enable = <0x1>;
+-			xlnx,mplb-write-post-enable = <0x1>;
+-			xlnx,num-dma = <0x1>;
+-			xlnx,pir = <0xf>;
+-			xlnx,ppc440mc-addr-base = <0x0>;
+-			xlnx,ppc440mc-addr-high = <0xfffffff>;
+-			xlnx,ppc440mc-arb-mode = <0x0>;
+-			xlnx,ppc440mc-bank-conflict-mask = <0xc00000>;
+-			xlnx,ppc440mc-control = <0xf810008f>;
+-			xlnx,ppc440mc-max-burst = <0x8>;
+-			xlnx,ppc440mc-prio-dcur = <0x2>;
+-			xlnx,ppc440mc-prio-dcuw = <0x3>;
+-			xlnx,ppc440mc-prio-icu = <0x4>;
+-			xlnx,ppc440mc-prio-splb0 = <0x1>;
+-			xlnx,ppc440mc-prio-splb1 = <0x0>;
+-			xlnx,ppc440mc-row-conflict-mask = <0x3ffe00>;
+-			xlnx,ppcdm-asyncmode = <0x0>;
+-			xlnx,ppcds-asyncmode = <0x0>;
+-			xlnx,user-reset = <0x0>;
+-			DMA0: sdma@80 {
+-				compatible = "xlnx,ll-dma-1.00.a";
+-				dcr-reg = < 0x80 0x11 >;
+-				interrupt-parent = <&xps_intc_0>;
+-				interrupts = < 10 2 11 2 >;
+-			} ;
+-		} ;
+-	} ;
+-	plb_v46_0: plb@0 {
+-		#address-cells = <1>;
+-		#size-cells = <1>;
+-		compatible = "xlnx,plb-v46-1.03.a", "simple-bus";
+-		ranges ;
+-		DIP_Switches_8Bit: gpio@81460000 {
+-			compatible = "xlnx,xps-gpio-1.00.a";
+-			interrupt-parent = <&xps_intc_0>;
+-			interrupts = < 7 2 >;
+-			reg = < 0x81460000 0x10000 >;
+-			xlnx,all-inputs = <0x1>;
+-			xlnx,all-inputs-2 = <0x0>;
+-			xlnx,dout-default = <0x0>;
+-			xlnx,dout-default-2 = <0x0>;
+-			xlnx,family = "virtex5";
+-			xlnx,gpio-width = <0x8>;
+-			xlnx,interrupt-present = <0x1>;
+-			xlnx,is-bidir = <0x1>;
+-			xlnx,is-bidir-2 = <0x1>;
+-			xlnx,is-dual = <0x0>;
+-			xlnx,tri-default = <0xffffffff>;
+-			xlnx,tri-default-2 = <0xffffffff>;
+-		} ;
+-		FLASH: flash@fc000000 {
+-			bank-width = <2>;
+-			compatible = "xlnx,xps-mch-emc-2.00.a", "cfi-flash";
+-			reg = < 0xfc000000 0x2000000 >;
+-			xlnx,family = "virtex5";
+-			xlnx,include-datawidth-matching-0 = <0x1>;
+-			xlnx,include-datawidth-matching-1 = <0x0>;
+-			xlnx,include-datawidth-matching-2 = <0x0>;
+-			xlnx,include-datawidth-matching-3 = <0x0>;
+-			xlnx,include-negedge-ioregs = <0x0>;
+-			xlnx,include-plb-ipif = <0x1>;
+-			xlnx,include-wrbuf = <0x1>;
+-			xlnx,max-mem-width = <0x10>;
+-			xlnx,mch-native-dwidth = <0x20>;
+-			xlnx,mch-plb-clk-period-ps = <0x2710>;
+-			xlnx,mch-splb-awidth = <0x20>;
+-			xlnx,mch0-accessbuf-depth = <0x10>;
+-			xlnx,mch0-protocol = <0x0>;
+-			xlnx,mch0-rddatabuf-depth = <0x10>;
+-			xlnx,mch1-accessbuf-depth = <0x10>;
+-			xlnx,mch1-protocol = <0x0>;
+-			xlnx,mch1-rddatabuf-depth = <0x10>;
+-			xlnx,mch2-accessbuf-depth = <0x10>;
+-			xlnx,mch2-protocol = <0x0>;
+-			xlnx,mch2-rddatabuf-depth = <0x10>;
+-			xlnx,mch3-accessbuf-depth = <0x10>;
+-			xlnx,mch3-protocol = <0x0>;
+-			xlnx,mch3-rddatabuf-depth = <0x10>;
+-			xlnx,mem0-width = <0x10>;
+-			xlnx,mem1-width = <0x20>;
+-			xlnx,mem2-width = <0x20>;
+-			xlnx,mem3-width = <0x20>;
+-			xlnx,num-banks-mem = <0x1>;
+-			xlnx,num-channels = <0x2>;
+-			xlnx,priority-mode = <0x0>;
+-			xlnx,synch-mem-0 = <0x0>;
+-			xlnx,synch-mem-1 = <0x0>;
+-			xlnx,synch-mem-2 = <0x0>;
+-			xlnx,synch-mem-3 = <0x0>;
+-			xlnx,synch-pipedelay-0 = <0x2>;
+-			xlnx,synch-pipedelay-1 = <0x2>;
+-			xlnx,synch-pipedelay-2 = <0x2>;
+-			xlnx,synch-pipedelay-3 = <0x2>;
+-			xlnx,tavdv-ps-mem-0 = <0x1adb0>;
+-			xlnx,tavdv-ps-mem-1 = <0x3a98>;
+-			xlnx,tavdv-ps-mem-2 = <0x3a98>;
+-			xlnx,tavdv-ps-mem-3 = <0x3a98>;
+-			xlnx,tcedv-ps-mem-0 = <0x1adb0>;
+-			xlnx,tcedv-ps-mem-1 = <0x3a98>;
+-			xlnx,tcedv-ps-mem-2 = <0x3a98>;
+-			xlnx,tcedv-ps-mem-3 = <0x3a98>;
+-			xlnx,thzce-ps-mem-0 = <0x88b8>;
+-			xlnx,thzce-ps-mem-1 = <0x1b58>;
+-			xlnx,thzce-ps-mem-2 = <0x1b58>;
+-			xlnx,thzce-ps-mem-3 = <0x1b58>;
+-			xlnx,thzoe-ps-mem-0 = <0x1b58>;
+-			xlnx,thzoe-ps-mem-1 = <0x1b58>;
+-			xlnx,thzoe-ps-mem-2 = <0x1b58>;
+-			xlnx,thzoe-ps-mem-3 = <0x1b58>;
+-			xlnx,tlzwe-ps-mem-0 = <0x88b8>;
+-			xlnx,tlzwe-ps-mem-1 = <0x0>;
+-			xlnx,tlzwe-ps-mem-2 = <0x0>;
+-			xlnx,tlzwe-ps-mem-3 = <0x0>;
+-			xlnx,twc-ps-mem-0 = <0x2af8>;
+-			xlnx,twc-ps-mem-1 = <0x3a98>;
+-			xlnx,twc-ps-mem-2 = <0x3a98>;
+-			xlnx,twc-ps-mem-3 = <0x3a98>;
+-			xlnx,twp-ps-mem-0 = <0x11170>;
+-			xlnx,twp-ps-mem-1 = <0x2ee0>;
+-			xlnx,twp-ps-mem-2 = <0x2ee0>;
+-			xlnx,twp-ps-mem-3 = <0x2ee0>;
+-			xlnx,xcl0-linesize = <0x4>;
+-			xlnx,xcl0-writexfer = <0x1>;
+-			xlnx,xcl1-linesize = <0x4>;
+-			xlnx,xcl1-writexfer = <0x1>;
+-			xlnx,xcl2-linesize = <0x4>;
+-			xlnx,xcl2-writexfer = <0x1>;
+-			xlnx,xcl3-linesize = <0x4>;
+-			xlnx,xcl3-writexfer = <0x1>;
+-		} ;
+-		Hard_Ethernet_MAC: xps-ll-temac@81c00000 {
+-			#address-cells = <1>;
+-			#size-cells = <1>;
+-			compatible = "xlnx,compound";
+-			ethernet@81c00000 {
+-				compatible = "xlnx,xps-ll-temac-1.01.b";
+-				device_type = "network";
+-				interrupt-parent = <&xps_intc_0>;
+-				interrupts = < 5 2 >;
+-				llink-connected = <&DMA0>;
+-				local-mac-address = [ 02 00 00 00 00 00 ];
+-				reg = < 0x81c00000 0x40 >;
+-				xlnx,bus2core-clk-ratio = <0x1>;
+-				xlnx,phy-type = <0x1>;
+-				xlnx,phyaddr = <0x1>;
+-				xlnx,rxcsum = <0x1>;
+-				xlnx,rxfifo = <0x1000>;
+-				xlnx,temac-type = <0x0>;
+-				xlnx,txcsum = <0x1>;
+-				xlnx,txfifo = <0x1000>;
+-			} ;
+-		} ;
+-		IIC_EEPROM: i2c@81600000 {
+-			compatible = "xlnx,xps-iic-2.00.a";
+-			interrupt-parent = <&xps_intc_0>;
+-			interrupts = < 6 2 >;
+-			reg = < 0x81600000 0x10000 >;
+-			xlnx,clk-freq = <0x5f5e100>;
+-			xlnx,family = "virtex5";
+-			xlnx,gpo-width = <0x1>;
+-			xlnx,iic-freq = <0x186a0>;
+-			xlnx,scl-inertial-delay = <0x0>;
+-			xlnx,sda-inertial-delay = <0x0>;
+-			xlnx,ten-bit-adr = <0x0>;
+-		} ;
+-		LEDs_8Bit: gpio@81400000 {
+-			compatible = "xlnx,xps-gpio-1.00.a";
+-			reg = < 0x81400000 0x10000 >;
+-			xlnx,all-inputs = <0x0>;
+-			xlnx,all-inputs-2 = <0x0>;
+-			xlnx,dout-default = <0x0>;
+-			xlnx,dout-default-2 = <0x0>;
+-			xlnx,family = "virtex5";
+-			xlnx,gpio-width = <0x8>;
+-			xlnx,interrupt-present = <0x0>;
+-			xlnx,is-bidir = <0x1>;
+-			xlnx,is-bidir-2 = <0x1>;
+-			xlnx,is-dual = <0x0>;
+-			xlnx,tri-default = <0xffffffff>;
+-			xlnx,tri-default-2 = <0xffffffff>;
+-		} ;
+-		LEDs_Positions: gpio@81420000 {
+-			compatible = "xlnx,xps-gpio-1.00.a";
+-			reg = < 0x81420000 0x10000 >;
+-			xlnx,all-inputs = <0x0>;
+-			xlnx,all-inputs-2 = <0x0>;
+-			xlnx,dout-default = <0x0>;
+-			xlnx,dout-default-2 = <0x0>;
+-			xlnx,family = "virtex5";
+-			xlnx,gpio-width = <0x5>;
+-			xlnx,interrupt-present = <0x0>;
+-			xlnx,is-bidir = <0x1>;
+-			xlnx,is-bidir-2 = <0x1>;
+-			xlnx,is-dual = <0x0>;
+-			xlnx,tri-default = <0xffffffff>;
+-			xlnx,tri-default-2 = <0xffffffff>;
+-		} ;
+-		Push_Buttons_5Bit: gpio@81440000 {
+-			compatible = "xlnx,xps-gpio-1.00.a";
+-			interrupt-parent = <&xps_intc_0>;
+-			interrupts = < 8 2 >;
+-			reg = < 0x81440000 0x10000 >;
+-			xlnx,all-inputs = <0x1>;
+-			xlnx,all-inputs-2 = <0x0>;
+-			xlnx,dout-default = <0x0>;
+-			xlnx,dout-default-2 = <0x0>;
+-			xlnx,family = "virtex5";
+-			xlnx,gpio-width = <0x5>;
+-			xlnx,interrupt-present = <0x1>;
+-			xlnx,is-bidir = <0x1>;
+-			xlnx,is-bidir-2 = <0x1>;
+-			xlnx,is-dual = <0x0>;
+-			xlnx,tri-default = <0xffffffff>;
+-			xlnx,tri-default-2 = <0xffffffff>;
+-		} ;
+-		RS232_Uart_1: serial@83e00000 {
+-			clock-frequency = <100000000>;
+-			compatible = "xlnx,xps-uart16550-2.00.a", "ns16550";
+-			current-speed = <9600>;
+-			device_type = "serial";
+-			interrupt-parent = <&xps_intc_0>;
+-			interrupts = < 9 2 >;
+-			reg = < 0x83e00000 0x10000 >;
+-			reg-offset = <0x1003>;
+-			reg-shift = <2>;
+-			xlnx,family = "virtex5";
+-			xlnx,has-external-rclk = <0x0>;
+-			xlnx,has-external-xin = <0x0>;
+-			xlnx,is-a-16550 = <0x1>;
+-		} ;
+-		SysACE_CompactFlash: sysace@83600000 {
+-			compatible = "xlnx,xps-sysace-1.00.a";
+-			interrupt-parent = <&xps_intc_0>;
+-			interrupts = < 4 2 >;
+-			reg = < 0x83600000 0x10000 >;
+-			xlnx,family = "virtex5";
+-			xlnx,mem-width = <0x10>;
+-		} ;
+-		xps_bram_if_cntlr_1: xps-bram-if-cntlr@ffff0000 {
+-			compatible = "xlnx,xps-bram-if-cntlr-1.00.a";
+-			reg = < 0xffff0000 0x10000 >;
+-			xlnx,family = "virtex5";
+-		} ;
+-		xps_intc_0: interrupt-controller@81800000 {
+-			#interrupt-cells = <0x2>;
+-			compatible = "xlnx,xps-intc-1.00.a";
+-			interrupt-controller ;
+-			reg = < 0x81800000 0x10000 >;
+-			xlnx,num-intr-inputs = <0xc>;
+-		} ;
+-		xps_timebase_wdt_1: xps-timebase-wdt@83a00000 {
+-			compatible = "xlnx,xps-timebase-wdt-1.00.b";
+-			interrupt-parent = <&xps_intc_0>;
+-			interrupts = < 2 0 1 2 >;
+-			reg = < 0x83a00000 0x10000 >;
+-			xlnx,family = "virtex5";
+-			xlnx,wdt-enable-once = <0x0>;
+-			xlnx,wdt-interval = <0x1e>;
+-		} ;
+-		xps_timer_1: timer@83c00000 {
+-			compatible = "xlnx,xps-timer-1.00.a";
+-			interrupt-parent = <&xps_intc_0>;
+-			interrupts = < 3 2 >;
+-			reg = < 0x83c00000 0x10000 >;
+-			xlnx,count-width = <0x20>;
+-			xlnx,family = "virtex5";
+-			xlnx,gen0-assert = <0x1>;
+-			xlnx,gen1-assert = <0x1>;
+-			xlnx,one-timer-only = <0x1>;
+-			xlnx,trig0-assert = <0x1>;
+-			xlnx,trig1-assert = <0x1>;
+-		} ;
+-	} ;
++			xlnx,apu-control = <0x2000>;
++			xlnx,apu-udi-0 = <0x0>;
++			xlnx,apu-udi-1 = <0x0>;
++			xlnx,apu-udi-10 = <0x0>;
++			xlnx,apu-udi-11 = <0x0>;
++			xlnx,apu-udi-12 = <0x0>;
++			xlnx,apu-udi-13 = <0x0>;
++			xlnx,apu-udi-14 = <0x0>;
++			xlnx,apu-udi-15 = <0x0>;
++			xlnx,apu-udi-2 = <0x0>;
++			xlnx,apu-udi-3 = <0x0>;
++			xlnx,apu-udi-4 = <0x0>;
++			xlnx,apu-udi-5 = <0x0>;
++			xlnx,apu-udi-6 = <0x0>;
++			xlnx,apu-udi-7 = <0x0>;
++			xlnx,apu-udi-8 = <0x0>;
++			xlnx,apu-udi-9 = <0x0>;
++			xlnx,dcr-autolock-enable = <0x1>;
++			xlnx,dcu-rd-ld-cache-plb-prio = <0x0>;
++			xlnx,dcu-rd-noncache-plb-prio = <0x0>;
++			xlnx,dcu-rd-touch-plb-prio = <0x0>;
++			xlnx,dcu-rd-urgent-plb-prio = <0x0>;
++			xlnx,dcu-wr-flush-plb-prio = <0x0>;
++			xlnx,dcu-wr-store-plb-prio = <0x0>;
++			xlnx,dcu-wr-urgent-plb-prio = <0x0>;
++			xlnx,dma0-control = <0x0>;
++			xlnx,dma0-plb-prio = <0x0>;
++			xlnx,dma0-rxchannelctrl = <0x1010000>;
++			xlnx,dma0-rxirqtimer = <0x3ff>;
++			xlnx,dma0-txchannelctrl = <0x1010000>;
++			xlnx,dma0-txirqtimer = <0x3ff>;
++			xlnx,dma1-control = <0x0>;
++			xlnx,dma1-plb-prio = <0x0>;
++			xlnx,dma1-rxchannelctrl = <0x1010000>;
++			xlnx,dma1-rxirqtimer = <0x3ff>;
++			xlnx,dma1-txchannelctrl = <0x1010000>;
++			xlnx,dma1-txirqtimer = <0x3ff>;
++			xlnx,dma2-control = <0x0>;
++			xlnx,dma2-plb-prio = <0x0>;
++			xlnx,dma2-rxchannelctrl = <0x1010000>;
++			xlnx,dma2-rxirqtimer = <0x3ff>;
++			xlnx,dma2-txchannelctrl = <0x1010000>;
++			xlnx,dma2-txirqtimer = <0x3ff>;
++			xlnx,dma3-control = <0x0>;
++			xlnx,dma3-plb-prio = <0x0>;
++			xlnx,dma3-rxchannelctrl = <0x1010000>;
++			xlnx,dma3-rxirqtimer = <0x3ff>;
++			xlnx,dma3-txchannelctrl = <0x1010000>;
++			xlnx,dma3-txirqtimer = <0x3ff>;
++			xlnx,endian-reset = <0x0>;
++			xlnx,generate-plb-timespecs = <0x1>;
++			xlnx,icu-rd-fetch-plb-prio = <0x0>;
++			xlnx,icu-rd-spec-plb-prio = <0x0>;
++			xlnx,icu-rd-touch-plb-prio = <0x0>;
++			xlnx,interconnect-imask = <0xffffffff>;
++			xlnx,mplb-allow-lock-xfer = <0x1>;
++			xlnx,mplb-arb-mode = <0x0>;
++			xlnx,mplb-awidth = <0x20>;
++			xlnx,mplb-counter = <0x500>;
++			xlnx,mplb-dwidth = <0x80>;
++			xlnx,mplb-max-burst = <0x8>;
++			xlnx,mplb-native-dwidth = <0x80>;
++			xlnx,mplb-p2p = <0x0>;
++			xlnx,mplb-prio-dcur = <0x2>;
++			xlnx,mplb-prio-dcuw = <0x3>;
++			xlnx,mplb-prio-icu = <0x4>;
++			xlnx,mplb-prio-splb0 = <0x1>;
++			xlnx,mplb-prio-splb1 = <0x0>;
++			xlnx,mplb-read-pipe-enable = <0x1>;
++			xlnx,mplb-sync-tattribute = <0x0>;
++			xlnx,mplb-wdog-enable = <0x1>;
++			xlnx,mplb-write-pipe-enable = <0x1>;
++			xlnx,mplb-write-post-enable = <0x1>;
++			xlnx,num-dma = <0x0>;
++			xlnx,pir = <0xf>;
++			xlnx,ppc440mc-addr-base = <0x0>;
++			xlnx,ppc440mc-addr-high = <0xfffffff>;
++			xlnx,ppc440mc-arb-mode = <0x0>;
++			xlnx,ppc440mc-bank-conflict-mask = <0xc00000>;
++			xlnx,ppc440mc-control = <0xf810008f>;
++			xlnx,ppc440mc-max-burst = <0x8>;
++			xlnx,ppc440mc-prio-dcur = <0x2>;
++			xlnx,ppc440mc-prio-dcuw = <0x3>;
++			xlnx,ppc440mc-prio-icu = <0x4>;
++			xlnx,ppc440mc-prio-splb0 = <0x1>;
++			xlnx,ppc440mc-prio-splb1 = <0x0>;
++			xlnx,ppc440mc-row-conflict-mask = <0x3ffe00>;
++			xlnx,ppcdm-asyncmode = <0x0>;
++			xlnx,ppcds-asyncmode = <0x0>;
++			xlnx,user-reset = <0x0>;
++		} ;
++	} ;
++	ddr2_sdram: memory@0 {
++		device_type = "memory";
++		reg = < 0x0 0x10000000 >;
++	} ;
++	plb_v46_0: plb@0 {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		compatible = "xlnx,plb-v46-1.05.a", "xlnx,plb-v46-1.00.a", "simple-bus";
++		ranges ;
++		dip_switches_8bit: gpio@81460000 {
++			compatible = "xlnx,xps-gpio-2.00.a", "xlnx,xps-gpio-1.00.a";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 10 2 >;
++			reg = < 0x81460000 0x10000 >;
++			xlnx,all-inputs = <0x1>;
++			xlnx,all-inputs-2 = <0x0>;
++			xlnx,dout-default = <0x0>;
++			xlnx,dout-default-2 = <0x0>;
++			xlnx,family = "virtex5";
++			xlnx,gpio-width = <0x8>;
++			xlnx,gpio2-width = <0x20>;
++			xlnx,interrupt-present = <0x1>;
++			xlnx,is-dual = <0x0>;
++			xlnx,tri-default = <0xffffffff>;
++			xlnx,tri-default-2 = <0xffffffff>;
++		} ;
++		ethernet_mac: ethernet@81000000 {
++			compatible = "xlnx,xps-ethernetlite-4.00.a", "xlnx,xps-ethernetlite-1.00.a";
++			device_type = "network";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 5 0 >;
++			local-mac-address = [ 00 0a 35 b7 78 00 ];
++			phy-handle = <&phy0>;
++			reg = < 0x81000000 0x10000 >;
++			xlnx,duplex = <0x1>;
++			xlnx,family = "virtex5";
++			xlnx,include-global-buffers = <0x0>;
++			xlnx,include-internal-loopback = <0x0>;
++			xlnx,include-mdio = <0x1>;
++			xlnx,rx-ping-pong = <0x0>;
++			xlnx,tx-ping-pong = <0x0>;
++			mdio {
++				#address-cells = <1>;
++				#size-cells = <0>;
++				phy0: phy@7 {
++					compatible = "marvell,88e1111";
++					device_type = "ethernet-phy";
++					reg = <7>;
++				} ;
++			} ;
++		} ;
++		flash: flash@8c000000 {
++			bank-width = <2>;
++			compatible = "xlnx,xps-mch-emc-3.01.a", "cfi-flash";
++			reg = < 0x8c000000 0x2000000 >;
++			xlnx,family = "virtex5";
++			xlnx,include-datawidth-matching-0 = <0x1>;
++			xlnx,include-datawidth-matching-1 = <0x0>;
++			xlnx,include-datawidth-matching-2 = <0x0>;
++			xlnx,include-datawidth-matching-3 = <0x0>;
++			xlnx,include-negedge-ioregs = <0x0>;
++			xlnx,include-plb-ipif = <0x1>;
++			xlnx,include-wrbuf = <0x1>;
++			xlnx,max-mem-width = <0x10>;
++			xlnx,mch-native-dwidth = <0x20>;
++			xlnx,mch-splb-awidth = <0x20>;
++			xlnx,mch-splb-clk-period-ps = <0x2710>;
++			xlnx,mch0-accessbuf-depth = <0x10>;
++			xlnx,mch0-protocol = <0x0>;
++			xlnx,mch0-rddatabuf-depth = <0x10>;
++			xlnx,mch1-accessbuf-depth = <0x10>;
++			xlnx,mch1-protocol = <0x0>;
++			xlnx,mch1-rddatabuf-depth = <0x10>;
++			xlnx,mch2-accessbuf-depth = <0x10>;
++			xlnx,mch2-protocol = <0x0>;
++			xlnx,mch2-rddatabuf-depth = <0x10>;
++			xlnx,mch3-accessbuf-depth = <0x10>;
++			xlnx,mch3-protocol = <0x0>;
++			xlnx,mch3-rddatabuf-depth = <0x10>;
++			xlnx,mem0-width = <0x10>;
++			xlnx,mem1-width = <0x20>;
++			xlnx,mem2-width = <0x20>;
++			xlnx,mem3-width = <0x20>;
++			xlnx,num-banks-mem = <0x1>;
++			xlnx,num-channels = <0x0>;
++			xlnx,pagemode-flash-0 = <0x0>;
++			xlnx,pagemode-flash-1 = <0x0>;
++			xlnx,pagemode-flash-2 = <0x0>;
++			xlnx,pagemode-flash-3 = <0x0>;
++			xlnx,priority-mode = <0x0>;
++			xlnx,synch-mem-0 = <0x0>;
++			xlnx,synch-mem-1 = <0x0>;
++			xlnx,synch-mem-2 = <0x0>;
++			xlnx,synch-mem-3 = <0x0>;
++			xlnx,synch-pipedelay-0 = <0x2>;
++			xlnx,synch-pipedelay-1 = <0x2>;
++			xlnx,synch-pipedelay-2 = <0x2>;
++			xlnx,synch-pipedelay-3 = <0x2>;
++			xlnx,tavdv-ps-mem-0 = <0x1adb0>;
++			xlnx,tavdv-ps-mem-1 = <0x3a98>;
++			xlnx,tavdv-ps-mem-2 = <0x3a98>;
++			xlnx,tavdv-ps-mem-3 = <0x3a98>;
++			xlnx,tcedv-ps-mem-0 = <0x1adb0>;
++			xlnx,tcedv-ps-mem-1 = <0x3a98>;
++			xlnx,tcedv-ps-mem-2 = <0x3a98>;
++			xlnx,tcedv-ps-mem-3 = <0x3a98>;
++			xlnx,thzce-ps-mem-0 = <0x88b8>;
++			xlnx,thzce-ps-mem-1 = <0x1b58>;
++			xlnx,thzce-ps-mem-2 = <0x1b58>;
++			xlnx,thzce-ps-mem-3 = <0x1b58>;
++			xlnx,thzoe-ps-mem-0 = <0x1b58>;
++			xlnx,thzoe-ps-mem-1 = <0x1b58>;
++			xlnx,thzoe-ps-mem-2 = <0x1b58>;
++			xlnx,thzoe-ps-mem-3 = <0x1b58>;
++			xlnx,tlzwe-ps-mem-0 = <0x88b8>;
++			xlnx,tlzwe-ps-mem-1 = <0x0>;
++			xlnx,tlzwe-ps-mem-2 = <0x0>;
++			xlnx,tlzwe-ps-mem-3 = <0x0>;
++			xlnx,tpacc-ps-flash-0 = <0x61a8>;
++			xlnx,tpacc-ps-flash-1 = <0x61a8>;
++			xlnx,tpacc-ps-flash-2 = <0x61a8>;
++			xlnx,tpacc-ps-flash-3 = <0x61a8>;
++			xlnx,twc-ps-mem-0 = <0x2af8>;
++			xlnx,twc-ps-mem-1 = <0x3a98>;
++			xlnx,twc-ps-mem-2 = <0x3a98>;
++			xlnx,twc-ps-mem-3 = <0x3a98>;
++			xlnx,twp-ps-mem-0 = <0x11170>;
++			xlnx,twp-ps-mem-1 = <0x2ee0>;
++			xlnx,twp-ps-mem-2 = <0x2ee0>;
++			xlnx,twp-ps-mem-3 = <0x2ee0>;
++			xlnx,xcl0-linesize = <0x4>;
++			xlnx,xcl0-writexfer = <0x1>;
++			xlnx,xcl1-linesize = <0x4>;
++			xlnx,xcl1-writexfer = <0x1>;
++			xlnx,xcl2-linesize = <0x4>;
++			xlnx,xcl2-writexfer = <0x1>;
++			xlnx,xcl3-linesize = <0x4>;
++			xlnx,xcl3-writexfer = <0x1>;
++		} ;
++		iic_eeprom: i2c@81600000 {
++			compatible = "xlnx,xps-iic-2.03.a", "xlnx,xps-iic-2.00.a";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 7 2 >;
++			reg = < 0x81600000 0x10000 >;
++			xlnx,clk-freq = <0x5f5e100>;
++			xlnx,family = "virtex5";
++			xlnx,gpo-width = <0x1>;
++			xlnx,iic-freq = <0x186a0>;
++			xlnx,scl-inertial-delay = <0x5>;
++			xlnx,sda-inertial-delay = <0x5>;
++			xlnx,ten-bit-adr = <0x0>;
++		} ;
++		leds_8bit: gpio@81440000 {
++			compatible = "xlnx,xps-gpio-2.00.a", "xlnx,xps-gpio-1.00.a";
++			reg = < 0x81440000 0x10000 >;
++			xlnx,all-inputs = <0x0>;
++			xlnx,all-inputs-2 = <0x0>;
++			xlnx,dout-default = <0x0>;
++			xlnx,dout-default-2 = <0x0>;
++			xlnx,family = "virtex5";
++			xlnx,gpio-width = <0x8>;
++			xlnx,gpio2-width = <0x20>;
++			xlnx,interrupt-present = <0x0>;
++			xlnx,is-dual = <0x0>;
++			xlnx,tri-default = <0xffffffff>;
++			xlnx,tri-default-2 = <0xffffffff>;
++		} ;
++		leds_positions: gpio@81420000 {
++			compatible = "xlnx,xps-gpio-2.00.a", "xlnx,xps-gpio-1.00.a";
++			reg = < 0x81420000 0x10000 >;
++			xlnx,all-inputs = <0x0>;
++			xlnx,all-inputs-2 = <0x0>;
++			xlnx,dout-default = <0x0>;
++			xlnx,dout-default-2 = <0x0>;
++			xlnx,family = "virtex5";
++			xlnx,gpio-width = <0x5>;
++			xlnx,gpio2-width = <0x20>;
++			xlnx,interrupt-present = <0x0>;
++			xlnx,is-dual = <0x0>;
++			xlnx,tri-default = <0xffffffff>;
++			xlnx,tri-default-2 = <0xffffffff>;
++		} ;
++		push_buttons_5bit: gpio@81400000 {
++			compatible = "xlnx,xps-gpio-2.00.a", "xlnx,xps-gpio-1.00.a";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 11 2 >;
++			reg = < 0x81400000 0x10000 >;
++			xlnx,all-inputs = <0x1>;
++			xlnx,all-inputs-2 = <0x0>;
++			xlnx,dout-default = <0x0>;
++			xlnx,dout-default-2 = <0x0>;
++			xlnx,family = "virtex5";
++			xlnx,gpio-width = <0x5>;
++			xlnx,gpio2-width = <0x20>;
++			xlnx,interrupt-present = <0x1>;
++			xlnx,is-dual = <0x0>;
++			xlnx,tri-default = <0xffffffff>;
++			xlnx,tri-default-2 = <0xffffffff>;
++		} ;
++		rs232_uart_1: serial@83e00000 {
++			clock-frequency = <100000000>;
++			compatible = "xlnx,xps-uart16550-3.00.a", "ns16550";
++			current-speed = <9600>;
++			device_type = "serial";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 12 2 >;
++			reg = < 0x83e00000 0x10000 >;
++			reg-offset = <0x1003>;
++			reg-shift = <2>;
++			xlnx,family = "virtex5";
++			xlnx,has-external-rclk = <0x0>;
++			xlnx,has-external-xin = <0x0>;
++			xlnx,is-a-16550 = <0x1>;
++		} ;
++		sysace_compactflash: sysace@83600000 {
++			compatible = "xlnx,xps-sysace-1.01.a", "xlnx,xps-sysace-1.00.a";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 4 2 >;
++			reg = < 0x83600000 0x10000 >;
++			xlnx,family = "virtex5";
++			xlnx,mem-width = <0x10>;
++		} ;
++		xps_bram_if_cntlr_1: xps-bram-if-cntlr@ffff0000 {
++			compatible = "xlnx,xps-bram-if-cntlr-1.00.b", "xlnx,xps-bram-if-cntlr-1.00.a";
++			reg = < 0xffff0000 0x10000 >;
++			xlnx,family = "virtex5";
++		} ;
++		xps_intc_0: interrupt-controller@81800000 {
++			#interrupt-cells = <0x2>;
++			compatible = "xlnx,xps-intc-2.01.a", "xlnx,xps-intc-1.00.a";
++			interrupt-controller ;
++			reg = < 0x81800000 0x10000 >;
++			xlnx,kind-of-intr = <0x6a>;
++			xlnx,num-intr-inputs = <0xd>;
++		} ;
++		xps_ps2_0: xps-ps2@81480000 {
++			#address-cells = <1>;
++			#size-cells = <1>;
++			compatible = "xlnx,compound";
++			ranges = < 0x0 0x81480000 0x10000 >;
++			ps2@0 {
++				compatible = "xlnx,xps-ps2-1.01.b", "xlnx,xps-ps2-1.00.a";
++				interrupt-parent = <&xps_intc_0>;
++				interrupts = < 8 2 >;
++				reg = < 0x0 0x40 >;
++			} ;
++			ps2@1000 {
++				compatible = "xlnx,xps-ps2-1.01.b", "xlnx,xps-ps2-1.00.a";
++				interrupt-parent = <&xps_intc_0>;
++				interrupts = < 9 2 >;
++				reg = < 0x1000 0x40 >;
++			} ;
++		} ;
++		xps_tft_0: tft@86e00000 {
++			compatible = "xlnx,xps-tft-2.01.a", "xlnx,xps-tft-1.00.a";
++			reg = < 0x86e00000 0x10000 >;
++			xlnx,dcr-splb-slave-if = <0x1>;
++			xlnx,default-tft-base-addr = <0x0>;
++			xlnx,family = "virtex5";
++			xlnx,i2c-slave-addr = <0x76>;
++			xlnx,mplb-awidth = <0x20>;
++			xlnx,mplb-dwidth = <0x80>;
++			xlnx,mplb-native-dwidth = <0x40>;
++			xlnx,mplb-smallest-slave = <0x20>;
++			xlnx,tft-interface = <0x1>;
++		} ;
++		xps_timebase_wdt_0: xps-timebase-wdt@83a00000 {
++			compatible = "xlnx,xps-timebase-wdt-1.02.a";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 3 0 2 2 >;
++			reg = < 0x83a00000 0x10000 >;
++			xlnx,family = "virtex5";
++			xlnx,wdt-enable-once = <0x0>;
++			xlnx,wdt-interval = <0x1e>;
++		} ;
++		xps_timer_0: timer@83c00000 {
++			compatible = "xlnx,xps-timer-1.02.a", "xlnx,xps-timer-1.00.a";
++			interrupt-parent = <&xps_intc_0>;
++			interrupts = < 1 0 >;
++			reg = < 0x83c00000 0x10000 >;
++			xlnx,count-width = <0x20>;
++			xlnx,family = "virtex5";
++			xlnx,gen0-assert = <0x1>;
++			xlnx,gen1-assert = <0x1>;
++			xlnx,one-timer-only = <0x0>;
++			xlnx,trig0-assert = <0x1>;
++			xlnx,trig1-assert = <0x1>;
++		} ;
++	} ;
+ }  ;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0003-xilinxfb-Fix-regression-in-call-to-XPS-TFT-controlle.patch b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0003-xilinxfb-Fix-regression-in-call-to-XPS-TFT-controlle.patch
new file mode 100644
index 0000000..2ebc0eb
--- /dev/null
+++ b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/0003-xilinxfb-Fix-regression-in-call-to-XPS-TFT-controlle.patch
@@ -0,0 +1,32 @@
+From a77debe1e3b3823e18d8ef021b694c42b1515dda Mon Sep 17 00:00:00 2001
+From: Elvis Dowson <elvis.dowson@gmail.com>
+Date: Wed, 22 Aug 2012 03:22:42 +0400
+Subject: [PATCH 3/3] xilinxfb: Fix regression in call to XPS TFT controller
+ write API.
+
+This commit fixes a regression in xilinx_fb_out_be32(), where an incorrect
+call to the XPS TFT controller's write API, caused the display not to work.
+
+This fix has been adapted from linux-xilinx-3.0.0.
+
+Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
+---
+ drivers/video/xilinxfb.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/video/xilinxfb.c b/drivers/video/xilinxfb.c
+index b800c9c..1808452 100644
+--- a/drivers/video/xilinxfb.c
++++ b/drivers/video/xilinxfb.c
+@@ -154,7 +154,7 @@ static void xilinx_fb_out_be32(struct xilinxfb_drvdata *drvdata, u32 offset,
+ 				u32 val)
+ {
+ 	if (drvdata->flags & PLB_ACCESS_FLAG)
+-		iowrite32(val, drvdata->regs + (offset << 2));
++		out_be32(drvdata->regs + (offset << 2), val);
+ #ifdef CONFIG_PPC_DCR
+ 	else
+ 		dcr_write(drvdata->dcr_host, offset, val);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-xilinx-3.3/virtex5/defconfig_3.3.0 b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/defconfig_3.3.0
new file mode 100644
index 0000000..536e7c6
--- /dev/null
+++ b/recipes-kernel/linux/linux-xilinx-3.3/virtex5/defconfig_3.3.0
@@ -0,0 +1,1704 @@
+#
+# Automatically generated file; DO NOT EDIT.
+# Linux/powerpc 3.3.0-14.2-build1 Kernel Configuration
+#
+# CONFIG_PPC64 is not set
+
+#
+# Processor support
+#
+# CONFIG_PPC_BOOK3S_32 is not set
+# CONFIG_PPC_85xx is not set
+# CONFIG_PPC_8xx is not set
+# CONFIG_40x is not set
+CONFIG_44x=y
+# CONFIG_E200 is not set
+# CONFIG_PPC_FPU is not set
+CONFIG_4xx=y
+CONFIG_BOOKE=y
+CONFIG_PTE_64BIT=y
+CONFIG_PHYS_64BIT=y
+CONFIG_PPC_MMU_NOHASH=y
+# CONFIG_PPC_MM_SLICES is not set
+CONFIG_NOT_COHERENT_CACHE=y
+CONFIG_PPC32=y
+CONFIG_32BIT=y
+CONFIG_WORD_SIZE=32
+CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
+CONFIG_ARCH_DMA_ADDR_T_64BIT=y
+CONFIG_MMU=y
+CONFIG_GENERIC_CMOS_UPDATE=y
+CONFIG_GENERIC_TIME_VSYSCALL=y
+CONFIG_GENERIC_CLOCKEVENTS=y
+# CONFIG_HAVE_SETUP_PER_CPU_AREA is not set
+# CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK is not set
+CONFIG_NR_IRQS=512
+CONFIG_STACKTRACE_SUPPORT=y
+CONFIG_HAVE_LATENCYTOP_SUPPORT=y
+CONFIG_TRACE_IRQFLAGS_SUPPORT=y
+CONFIG_LOCKDEP_SUPPORT=y
+CONFIG_RWSEM_XCHGADD_ALGORITHM=y
+CONFIG_ARCH_HAS_ILOG2_U32=y
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=y
+CONFIG_GENERIC_HWEIGHT=y
+CONFIG_GENERIC_GPIO=y
+# CONFIG_ARCH_NO_VIRT_TO_BUS is not set
+CONFIG_PPC=y
+CONFIG_EARLY_PRINTK=y
+CONFIG_GENERIC_NVRAM=y
+CONFIG_SCHED_OMIT_FRAME_POINTER=y
+CONFIG_ARCH_MAY_HAVE_PC_FDC=y
+CONFIG_PPC_OF=y
+CONFIG_PPC_UDBG_16550=y
+# CONFIG_GENERIC_TBSYNC is not set
+CONFIG_AUDIT_ARCH=y
+CONFIG_GENERIC_BUG=y
+# CONFIG_EPAPR_BOOT is not set
+CONFIG_DEFAULT_UIMAGE=y
+CONFIG_ARCH_HIBERNATION_POSSIBLE=y
+CONFIG_ARCH_SUSPEND_POSSIBLE=y
+CONFIG_PPC_DCR_NATIVE=y
+CONFIG_PPC_DCR_MMIO=y
+CONFIG_PPC_DCR=y
+CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
+CONFIG_PPC_ADV_DEBUG_REGS=y
+CONFIG_PPC_ADV_DEBUG_IACS=4
+CONFIG_PPC_ADV_DEBUG_DACS=2
+CONFIG_PPC_ADV_DEBUG_DVCS=2
+CONFIG_PPC_ADV_DEBUG_DAC_RANGE=y
+CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_HAVE_IRQ_WORK=y
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=y
+CONFIG_BROKEN_ON_SMP=y
+CONFIG_INIT_ENV_ARG_LIMIT=32
+CONFIG_CROSS_COMPILE=""
+CONFIG_LOCALVERSION=""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_DEFAULT_HOSTNAME="(none)"
+CONFIG_SWAP=y
+CONFIG_SYSVIPC=y
+CONFIG_SYSVIPC_SYSCTL=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_POSIX_MQUEUE_SYSCTL=y
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_FHANDLE is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_HAVE_GENERIC_HARDIRQS=y
+
+#
+# IRQ subsystem
+#
+CONFIG_GENERIC_HARDIRQS=y
+CONFIG_HAVE_SPARSE_IRQ=y
+CONFIG_GENERIC_IRQ_SHOW=y
+CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
+CONFIG_IRQ_FORCED_THREADING=y
+CONFIG_SPARSE_IRQ=y
+
+#
+# RCU Subsystem
+#
+CONFIG_TINY_PREEMPT_RCU=y
+CONFIG_PREEMPT_RCU=y
+# CONFIG_RCU_TRACE is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_RCU_BOOST is not set
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+# CONFIG_CGROUPS is not set
+# CONFIG_CHECKPOINT_RESTORE is not set
+CONFIG_NAMESPACES=y
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+# CONFIG_SCHED_AUTOGROUP is not set
+# CONFIG_SYSFS_DEPRECATED is not set
+# CONFIG_RELAY is not set
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_INITRAMFS_SOURCE=""
+CONFIG_RD_GZIP=y
+CONFIG_RD_BZIP2=y
+CONFIG_RD_LZMA=y
+CONFIG_RD_XZ=y
+CONFIG_RD_LZO=y
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=y
+CONFIG_ANON_INODES=y
+# CONFIG_EXPERT is not set
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=y
+# CONFIG_KALLSYMS_ALL is not set
+CONFIG_HOTPLUG=y
+CONFIG_PRINTK=y
+CONFIG_BUG=y
+CONFIG_ELF_CORE=y
+CONFIG_BASE_FULL=y
+CONFIG_FUTEX=y
+CONFIG_EPOLL=y
+CONFIG_SIGNALFD=y
+CONFIG_TIMERFD=y
+CONFIG_EVENTFD=y
+CONFIG_SHMEM=y
+CONFIG_AIO=y
+# CONFIG_EMBEDDED is not set
+CONFIG_HAVE_PERF_EVENTS=y
+
+#
+# Kernel Performance Events And Counters
+#
+# CONFIG_PERF_EVENTS is not set
+# CONFIG_PERF_COUNTERS is not set
+CONFIG_VM_EVENT_COUNTERS=y
+CONFIG_PCI_QUIRKS=y
+CONFIG_COMPAT_BRK=y
+CONFIG_SLAB=y
+# CONFIG_SLUB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=y
+# CONFIG_KPROBES is not set
+# CONFIG_JUMP_LABEL is not set
+CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
+CONFIG_HAVE_IOREMAP_PROT=y
+CONFIG_HAVE_KPROBES=y
+CONFIG_HAVE_KRETPROBES=y
+CONFIG_HAVE_ARCH_TRACEHOOK=y
+CONFIG_HAVE_DMA_ATTRS=y
+CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
+CONFIG_HAVE_DMA_API_DEBUG=y
+CONFIG_HAVE_ARCH_JUMP_LABEL=y
+CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
+CONFIG_SLABINFO=y
+CONFIG_RT_MUTEXES=y
+CONFIG_BASE_SMALL=0
+CONFIG_MODULES=y
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=y
+CONFIG_LBDAF=y
+CONFIG_BLK_DEV_BSG=y
+# CONFIG_BLK_DEV_BSGLIB is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=y
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=y
+CONFIG_IOSCHED_DEADLINE=y
+CONFIG_IOSCHED_CFQ=y
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=y
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED="cfq"
+# CONFIG_INLINE_SPIN_TRYLOCK is not set
+# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK is not set
+# CONFIG_INLINE_SPIN_LOCK_BH is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_SPIN_UNLOCK is not set
+# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQ is not set
+# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_READ_TRYLOCK is not set
+# CONFIG_INLINE_READ_LOCK is not set
+# CONFIG_INLINE_READ_LOCK_BH is not set
+# CONFIG_INLINE_READ_LOCK_IRQ is not set
+# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_READ_UNLOCK is not set
+# CONFIG_INLINE_READ_UNLOCK_BH is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQ is not set
+# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
+# CONFIG_INLINE_WRITE_TRYLOCK is not set
+# CONFIG_INLINE_WRITE_LOCK is not set
+# CONFIG_INLINE_WRITE_LOCK_BH is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
+# CONFIG_INLINE_WRITE_UNLOCK is not set
+# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQ is not set
+# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
+# CONFIG_MUTEX_SPIN_ON_OWNER is not set
+CONFIG_FREEZER=y
+# CONFIG_PPC4xx_PCI_EXPRESS is not set
+# CONFIG_PPC_XICS is not set
+# CONFIG_PPC_ICP_NATIVE is not set
+# CONFIG_PPC_ICP_HV is not set
+# CONFIG_PPC_ICS_RTAS is not set
+
+#
+# Platform support
+#
+# CONFIG_PPC_CELL is not set
+# CONFIG_PPC_CELL_NATIVE is not set
+# CONFIG_PQ2ADS is not set
+# CONFIG_PPC_47x is not set
+# CONFIG_BAMBOO is not set
+# CONFIG_BLUESTONE is not set
+# CONFIG_EBONY is not set
+# CONFIG_SAM440EP is not set
+# CONFIG_SEQUOIA is not set
+# CONFIG_TAISHAN is not set
+# CONFIG_KATMAI is not set
+# CONFIG_RAINIER is not set
+# CONFIG_WARP is not set
+# CONFIG_ARCHES is not set
+# CONFIG_CANYONLANDS is not set
+# CONFIG_GLACIER is not set
+# CONFIG_REDWOOD is not set
+# CONFIG_EIGER is not set
+# CONFIG_YOSEMITE is not set
+# CONFIG_ISS4xx is not set
+# CONFIG_ICON is not set
+CONFIG_XILINX_VIRTEX440_GENERIC_BOARD=y
+# CONFIG_XILINX_ML510 is not set
+# CONFIG_PPC44x_SIMPLE is not set
+# CONFIG_PPC4xx_GPIO is not set
+CONFIG_XILINX_VIRTEX=y
+CONFIG_XILINX_VIRTEX_5_FXT=y
+# CONFIG_PPC_WSP is not set
+CONFIG_KVM_GUEST=y
+# CONFIG_IPIC is not set
+# CONFIG_MPIC is not set
+# CONFIG_PPC_EPAPR_HV_PIC is not set
+# CONFIG_MPIC_WEIRD is not set
+# CONFIG_PPC_I8259 is not set
+# CONFIG_PPC_RTAS is not set
+# CONFIG_MMIO_NVRAM is not set
+# CONFIG_MPIC_U3_HT_IRQS is not set
+# CONFIG_PPC_MPC106 is not set
+# CONFIG_PPC_970_NAP is not set
+# CONFIG_PPC_P7_NAP is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# CPUIdle driver
+#
+# CONFIG_CPU_IDLE is not set
+# CONFIG_FSL_ULI1575 is not set
+# CONFIG_SIMPLE_GPIO is not set
+# CONFIG_XILINX_PCI is not set
+
+#
+# Kernel options
+#
+# CONFIG_HIGHMEM is not set
+# CONFIG_NO_HZ is not set
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=y
+# CONFIG_HZ_100 is not set
+CONFIG_HZ_250=y
+# CONFIG_HZ_300 is not set
+# CONFIG_HZ_1000 is not set
+CONFIG_HZ=250
+# CONFIG_SCHED_HRTICK is not set
+# CONFIG_PREEMPT_NONE is not set
+# CONFIG_PREEMPT_VOLUNTARY is not set
+CONFIG_PREEMPT=y
+CONFIG_PREEMPT_COUNT=y
+CONFIG_BINFMT_ELF=y
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+# CONFIG_HAVE_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+CONFIG_MATH_EMULATION=y
+# CONFIG_IOMMU_HELPER is not set
+# CONFIG_SWIOTLB is not set
+CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
+CONFIG_ARCH_HAS_WALK_MEMORY=y
+CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
+# CONFIG_KEXEC is not set
+# CONFIG_CRASH_DUMP is not set
+CONFIG_MAX_ACTIVE_REGIONS=32
+CONFIG_ARCH_FLATMEM_ENABLE=y
+CONFIG_SELECT_MEMORY_MODEL=y
+CONFIG_FLATMEM_MANUAL=y
+CONFIG_FLATMEM=y
+CONFIG_FLAT_NODE_MEM_MAP=y
+CONFIG_HAVE_MEMBLOCK=y
+CONFIG_HAVE_MEMBLOCK_NODE_MAP=y
+CONFIG_PAGEFLAGS_EXTENDED=y
+CONFIG_SPLIT_PTLOCK_CPUS=4
+# CONFIG_COMPACTION is not set
+CONFIG_MIGRATION=y
+CONFIG_PHYS_ADDR_T_64BIT=y
+CONFIG_ZONE_DMA_FLAG=1
+CONFIG_BOUNCE=y
+CONFIG_VIRT_TO_BUS=y
+# CONFIG_KSM is not set
+CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
+CONFIG_NEED_PER_CPU_KM=y
+# CONFIG_CLEANCACHE is not set
+CONFIG_STDBINUTILS=y
+CONFIG_PPC_4K_PAGES=y
+# CONFIG_PPC_16K_PAGES is not set
+# CONFIG_PPC_64K_PAGES is not set
+CONFIG_FORCE_MAX_ZONEORDER=11
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE=""
+CONFIG_EXTRA_TARGETS="simpleImage.virtex440-ml507 simpleImage.initrd.virtex440-ml507"
+CONFIG_SUSPEND=y
+CONFIG_SUSPEND_FREEZER=y
+# CONFIG_HIBERNATION is not set
+CONFIG_PM_SLEEP=y
+# CONFIG_PM_RUNTIME is not set
+CONFIG_PM=y
+# CONFIG_PM_DEBUG is not set
+CONFIG_SECCOMP=y
+# CONFIG_COMPRESSED_DEVICE_TREE is not set
+CONFIG_ISA_DMA_API=y
+
+#
+# Bus options
+#
+CONFIG_ZONE_DMA=y
+CONFIG_NEED_DMA_MAP_STATE=y
+CONFIG_NEED_SG_DMA_LENGTH=y
+CONFIG_GENERIC_ISA_DMA=y
+CONFIG_PPC_INDIRECT_PCI=y
+CONFIG_PPC4xx_CPM=y
+CONFIG_4xx_SOC=y
+CONFIG_PPC_PCI_CHOICE=y
+CONFIG_PCI=y
+CONFIG_PCI_DOMAINS=y
+CONFIG_PCI_SYSCALL=y
+# CONFIG_PCIEPORTBUS is not set
+CONFIG_ARCH_SUPPORTS_MSI=y
+# CONFIG_PCI_MSI is not set
+# CONFIG_PCI_DEBUG is not set
+# CONFIG_PCI_STUB is not set
+# CONFIG_PCI_IOV is not set
+# CONFIG_PCI_PRI is not set
+# CONFIG_PCI_PASID is not set
+# CONFIG_PCCARD is not set
+# CONFIG_HOTPLUG_PCI is not set
+# CONFIG_HAS_RAPIDIO is not set
+# CONFIG_RAPIDIO is not set
+# CONFIG_NONSTATIC_KERNEL is not set
+
+#
+# Advanced setup
+#
+# CONFIG_ADVANCED_OPTIONS is not set
+
+#
+# Default settings for advanced configuration options are used
+#
+CONFIG_LOWMEM_SIZE=0x30000000
+CONFIG_PAGE_OFFSET=0xc0000000
+CONFIG_KERNEL_START=0xc0000000
+CONFIG_PHYSICAL_START=0x00000000
+CONFIG_TASK_SIZE=0xc0000000
+CONFIG_CONSISTENT_SIZE=0x00200000
+CONFIG_NET=y
+
+#
+# Networking options
+#
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+# CONFIG_UNIX_DIAG is not set
+CONFIG_XFRM=y
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+# CONFIG_NET_KEY is not set
+CONFIG_INET=y
+CONFIG_IP_MULTICAST=y
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE_DEMUX is not set
+# CONFIG_IP_MROUTE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_MODE_TRANSPORT=y
+CONFIG_INET_XFRM_MODE_TUNNEL=y
+CONFIG_INET_XFRM_MODE_BEET=y
+# CONFIG_INET_LRO is not set
+CONFIG_INET_DIAG=y
+CONFIG_INET_TCP_DIAG=y
+# CONFIG_INET_UDP_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=y
+CONFIG_DEFAULT_TCP_CONG="cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=m
+# CONFIG_IPV6_PRIVACY is not set
+# CONFIG_IPV6_ROUTER_PREF is not set
+# CONFIG_IPV6_OPTIMISTIC_DAD is not set
+# CONFIG_INET6_AH is not set
+# CONFIG_INET6_ESP is not set
+# CONFIG_INET6_IPCOMP is not set
+# CONFIG_IPV6_MIP6 is not set
+# CONFIG_INET6_XFRM_TUNNEL is not set
+# CONFIG_INET6_TUNNEL is not set
+CONFIG_INET6_XFRM_MODE_TRANSPORT=m
+CONFIG_INET6_XFRM_MODE_TUNNEL=m
+CONFIG_INET6_XFRM_MODE_BEET=m
+# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
+CONFIG_IPV6_SIT=m
+# CONFIG_IPV6_SIT_6RD is not set
+CONFIG_IPV6_NDISC_NODETYPE=y
+# CONFIG_IPV6_TUNNEL is not set
+# CONFIG_IPV6_MULTIPLE_TABLES is not set
+# CONFIG_IPV6_MROUTE is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
+CONFIG_NETFILTER=y
+# CONFIG_NETFILTER_DEBUG is not set
+CONFIG_NETFILTER_ADVANCED=y
+
+#
+# Core Netfilter Configuration
+#
+# CONFIG_NETFILTER_NETLINK_ACCT is not set
+# CONFIG_NETFILTER_NETLINK_QUEUE is not set
+# CONFIG_NETFILTER_NETLINK_LOG is not set
+# CONFIG_NF_CONNTRACK is not set
+# CONFIG_NETFILTER_TPROXY is not set
+CONFIG_NETFILTER_XTABLES=m
+
+#
+# Xtables combined modules
+#
+# CONFIG_NETFILTER_XT_MARK is not set
+
+#
+# Xtables targets
+#
+# CONFIG_NETFILTER_XT_TARGET_CHECKSUM is not set
+# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
+# CONFIG_NETFILTER_XT_TARGET_DSCP is not set
+# CONFIG_NETFILTER_XT_TARGET_HL is not set
+# CONFIG_NETFILTER_XT_TARGET_IDLETIMER is not set
+# CONFIG_NETFILTER_XT_TARGET_MARK is not set
+# CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
+# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
+# CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
+# CONFIG_NETFILTER_XT_TARGET_TEE is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
+# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set
+
+#
+# Xtables matches
+#
+# CONFIG_NETFILTER_XT_MATCH_ADDRTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
+# CONFIG_NETFILTER_XT_MATCH_CPU is not set
+# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
+# CONFIG_NETFILTER_XT_MATCH_DEVGROUP is not set
+# CONFIG_NETFILTER_XT_MATCH_DSCP is not set
+# CONFIG_NETFILTER_XT_MATCH_ECN is not set
+# CONFIG_NETFILTER_XT_MATCH_ESP is not set
+# CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_HL is not set
+# CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
+# CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
+# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
+# CONFIG_NETFILTER_XT_MATCH_MAC is not set
+# CONFIG_NETFILTER_XT_MATCH_MARK is not set
+# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
+# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
+# CONFIG_NETFILTER_XT_MATCH_OWNER is not set
+# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
+# CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
+# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
+# CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
+# CONFIG_NETFILTER_XT_MATCH_REALM is not set
+# CONFIG_NETFILTER_XT_MATCH_RECENT is not set
+# CONFIG_NETFILTER_XT_MATCH_SCTP is not set
+# CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
+# CONFIG_NETFILTER_XT_MATCH_STRING is not set
+# CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
+# CONFIG_NETFILTER_XT_MATCH_TIME is not set
+# CONFIG_NETFILTER_XT_MATCH_U32 is not set
+# CONFIG_IP_VS is not set
+
+#
+# IP: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV4 is not set
+# CONFIG_IP_NF_QUEUE is not set
+CONFIG_IP_NF_IPTABLES=m
+# CONFIG_IP_NF_MATCH_AH is not set
+# CONFIG_IP_NF_MATCH_ECN is not set
+# CONFIG_IP_NF_MATCH_RPFILTER is not set
+# CONFIG_IP_NF_MATCH_TTL is not set
+CONFIG_IP_NF_FILTER=m
+# CONFIG_IP_NF_TARGET_REJECT is not set
+# CONFIG_IP_NF_TARGET_LOG is not set
+# CONFIG_IP_NF_TARGET_ULOG is not set
+CONFIG_IP_NF_MANGLE=m
+# CONFIG_IP_NF_TARGET_ECN is not set
+# CONFIG_IP_NF_TARGET_TTL is not set
+# CONFIG_IP_NF_RAW is not set
+# CONFIG_IP_NF_ARPTABLES is not set
+
+#
+# IPv6: Netfilter Configuration
+#
+# CONFIG_NF_DEFRAG_IPV6 is not set
+# CONFIG_IP6_NF_QUEUE is not set
+# CONFIG_IP6_NF_IPTABLES is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_RDS is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_L2TP is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+# CONFIG_BATMAN_ADV is not set
+# CONFIG_OPENVSWITCH is not set
+CONFIG_BQL=y
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+CONFIG_WIRELESS=y
+# CONFIG_CFG80211 is not set
+# CONFIG_LIB80211 is not set
+
+#
+# CFG80211 needs to be enabled for MAC80211
+#
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+# CONFIG_CAIF is not set
+# CONFIG_CEPH_LIB is not set
+# CONFIG_NFC is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=""
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_STANDALONE=y
+CONFIG_PREVENT_FIRMWARE_BUILD=y
+CONFIG_FW_LOADER=y
+CONFIG_FIRMWARE_IN_KERNEL=y
+CONFIG_EXTRA_FIRMWARE=""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_GENERIC_CPU_DEVICES is not set
+# CONFIG_DMA_SHARED_BUFFER is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=y
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
+CONFIG_MTD_OF_PARTS=y
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_SM_FTL is not set
+# CONFIG_MTD_OOPS is not set
+# CONFIG_MTD_SWAP is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+CONFIG_MTD_CFI=y
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_GEN_PROBE=y
+# CONFIG_MTD_CFI_ADV_OPTIONS is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+CONFIG_MTD_CFI_INTELEXT=y
+# CONFIG_MTD_CFI_AMDSTD is not set
+# CONFIG_MTD_CFI_STAA is not set
+CONFIG_MTD_CFI_UTIL=y
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PHYSMAP is not set
+CONFIG_MTD_PHYSMAP_OF=y
+# CONFIG_MTD_INTEL_VR_NOR is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+# CONFIG_MTD_PMC551 is not set
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SST25L is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOCG3 is not set
+# CONFIG_MTD_NAND is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+# CONFIG_MTD_UBI is not set
+CONFIG_DTC=y
+CONFIG_OF=y
+
+#
+# Device Tree and Open Firmware support
+#
+CONFIG_PROC_DEVICETREE=y
+# CONFIG_OF_SELFTEST is not set
+CONFIG_OF_FLATTREE=y
+CONFIG_OF_EARLY_FLATTREE=y
+CONFIG_OF_DYNAMIC=y
+CONFIG_OF_ADDRESS=y
+CONFIG_OF_IRQ=y
+CONFIG_OF_DEVICE=y
+CONFIG_OF_GPIO=y
+CONFIG_OF_NET=y
+CONFIG_OF_SPI=y
+CONFIG_OF_MDIO=y
+CONFIG_OF_PCI=y
+CONFIG_OF_PCI_IRQ=y
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=y
+# CONFIG_BLK_DEV_FD is not set
+# CONFIG_BLK_CPQ_DA is not set
+# CONFIG_BLK_CPQ_CISS_DA is not set
+# CONFIG_BLK_DEV_DAC960 is not set
+# CONFIG_BLK_DEV_UMEM is not set
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+
+#
+# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
+#
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_NVME is not set
+# CONFIG_BLK_DEV_SX8 is not set
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=1
+CONFIG_BLK_DEV_RAM_SIZE=32768
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_XILINX_SYSACE=y
+# CONFIG_BLK_DEV_HD is not set
+# CONFIG_BLK_DEV_RBD is not set
+
+#
+# Misc devices
+#
+# CONFIG_SENSORS_LIS3LV02D is not set
+# CONFIG_AD525X_DPOT is not set
+# CONFIG_PHANTOM is not set
+# CONFIG_INTEL_MID_PTI is not set
+# CONFIG_SGI_IOC4 is not set
+# CONFIG_TIFM_CORE is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_HP_ILO is not set
+# CONFIG_TI_DAC7512 is not set
+# CONFIG_PCH_PHUB is not set
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_EEPROM_93XX46 is not set
+# CONFIG_CB710_CORE is not set
+
+#
+# Texas Instruments shared transport line discipline
+#
+# CONFIG_TI_ST is not set
+# CONFIG_SENSORS_LIS3_SPI is not set
+
+#
+# Altera FPGA firmware download module
+#
+CONFIG_XILINX_DRIVERS=y
+CONFIG_HAVE_IDE=y
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+CONFIG_SCSI_MOD=y
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+# CONFIG_FUSION is not set
+
+#
+# IEEE 1394 (FireWire) support
+#
+# CONFIG_FIREWIRE is not set
+# CONFIG_FIREWIRE_NOSY is not set
+# CONFIG_I2O is not set
+# CONFIG_MACINTOSH_DRIVERS is not set
+CONFIG_NETDEVICES=y
+CONFIG_NET_CORE=y
+# CONFIG_BONDING is not set
+# CONFIG_DUMMY is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_MII=y
+# CONFIG_NET_TEAM is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+
+#
+# CAIF transport drivers
+#
+CONFIG_ETHERNET=y
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_NET_VENDOR_ADAPTEC is not set
+# CONFIG_NET_VENDOR_ALTEON is not set
+# CONFIG_NET_VENDOR_AMD is not set
+# CONFIG_NET_VENDOR_ATHEROS is not set
+# CONFIG_NET_VENDOR_BROADCOM is not set
+# CONFIG_NET_VENDOR_BROCADE is not set
+# CONFIG_NET_CALXEDA_XGMAC is not set
+# CONFIG_NET_VENDOR_CHELSIO is not set
+# CONFIG_NET_VENDOR_CISCO is not set
+# CONFIG_DNET is not set
+# CONFIG_NET_VENDOR_DEC is not set
+# CONFIG_NET_VENDOR_DLINK is not set
+# CONFIG_NET_VENDOR_EMULEX is not set
+# CONFIG_NET_VENDOR_EXAR is not set
+# CONFIG_NET_VENDOR_HP is not set
+# CONFIG_NET_VENDOR_IBM is not set
+# CONFIG_NET_VENDOR_INTEL is not set
+# CONFIG_IP1000 is not set
+# CONFIG_JME is not set
+# CONFIG_NET_VENDOR_MARVELL is not set
+# CONFIG_NET_VENDOR_MELLANOX is not set
+# CONFIG_NET_VENDOR_MICREL is not set
+# CONFIG_NET_VENDOR_MICROCHIP is not set
+# CONFIG_NET_VENDOR_MYRI is not set
+# CONFIG_FEALNX is not set
+# CONFIG_NET_VENDOR_NATSEMI is not set
+# CONFIG_NET_VENDOR_NVIDIA is not set
+# CONFIG_NET_VENDOR_OKI is not set
+# CONFIG_ETHOC is not set
+# CONFIG_NET_PACKET_ENGINE is not set
+# CONFIG_NET_VENDOR_QLOGIC is not set
+# CONFIG_NET_VENDOR_REALTEK is not set
+# CONFIG_NET_VENDOR_RDC is not set
+# CONFIG_NET_VENDOR_SEEQ is not set
+# CONFIG_NET_VENDOR_SILAN is not set
+# CONFIG_NET_VENDOR_SIS is not set
+# CONFIG_SFC is not set
+# CONFIG_NET_VENDOR_SMSC is not set
+# CONFIG_NET_VENDOR_STMICRO is not set
+# CONFIG_NET_VENDOR_SUN is not set
+# CONFIG_NET_VENDOR_TEHUTI is not set
+# CONFIG_NET_VENDOR_TI is not set
+# CONFIG_NET_VENDOR_VIA is not set
+CONFIG_NET_VENDOR_XILINX=y
+CONFIG_XILINX_EMACLITE=y
+# CONFIG_XILINX_LL_TEMAC is not set
+# CONFIG_FDDI is not set
+# CONFIG_HIPPI is not set
+CONFIG_PHYLIB=y
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+# CONFIG_REALTEK_PHY is not set
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_MICREL_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+# CONFIG_MICREL_KS8995MA is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_TR is not set
+CONFIG_WLAN=y
+# CONFIG_AIRO is not set
+# CONFIG_ATMEL is not set
+# CONFIG_PRISM54 is not set
+# CONFIG_HOSTAP is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+# CONFIG_VMXNET3 is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=y
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
+# CONFIG_INPUT_SPARSEKMAP is not set
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=y
+CONFIG_INPUT_MOUSEDEV_PSAUX=y
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=y
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=y
+CONFIG_KEYBOARD_ATKBD=y
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_OPENCORES is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_INPUT_MOUSE=y
+CONFIG_MOUSE_PS2=y
+CONFIG_MOUSE_PS2_ALPS=y
+CONFIG_MOUSE_PS2_LOGIPS2PP=y
+CONFIG_MOUSE_PS2_SYNAPTICS=y
+CONFIG_MOUSE_PS2_TRACKPOINT=y
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_SENTELIC is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+# CONFIG_INPUT_MISC is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=y
+# CONFIG_SERIO_I8042 is not set
+# CONFIG_SERIO_SERPORT is not set
+# CONFIG_SERIO_PCIPS2 is not set
+CONFIG_SERIO_LIBPS2=y
+# CONFIG_SERIO_XILINXPS2 is not set
+CONFIG_SERIO_XILINX_XPS_PS2=y
+# CONFIG_SERIO_RAW is not set
+# CONFIG_SERIO_ALTERA_PS2 is not set
+# CONFIG_SERIO_PS2MULT is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=y
+CONFIG_CONSOLE_TRANSLATIONS=y
+CONFIG_VT_CONSOLE=y
+CONFIG_VT_CONSOLE_SLEEP=y
+CONFIG_HW_CONSOLE=y
+# CONFIG_VT_HW_CONSOLE_BINDING is not set
+CONFIG_UNIX98_PTYS=y
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+CONFIG_LEGACY_PTYS=y
+CONFIG_LEGACY_PTY_COUNT=256
+# CONFIG_SERIAL_NONSTANDARD is not set
+# CONFIG_NOZOMI is not set
+# CONFIG_N_GSM is not set
+# CONFIG_TRACE_SINK is not set
+# CONFIG_PPC_EPAPR_HV_BYTECHAN is not set
+CONFIG_DEVKMEM=y
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_PCI=y
+CONFIG_SERIAL_8250_NR_UARTS=4
+CONFIG_SERIAL_8250_RUNTIME_UARTS=4
+# CONFIG_SERIAL_8250_EXTENDED is not set
+CONFIG_SERIAL_8250_FSL=y
+# CONFIG_SERIAL_8250_DW is not set
+
+#
+# Non-8250 serial port support
+#
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX3107 is not set
+# CONFIG_SERIAL_MFD_HSU is not set
+CONFIG_SERIAL_UARTLITE=y
+CONFIG_SERIAL_UARTLITE_CONSOLE=y
+CONFIG_SERIAL_CORE=y
+CONFIG_SERIAL_CORE_CONSOLE=y
+# CONFIG_SERIAL_JSM is not set
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_SERIAL_OF_PLATFORM_NWPSERIAL is not set
+# CONFIG_SERIAL_TIMBERDALE is not set
+# CONFIG_SERIAL_ALTERA_JTAGUART is not set
+# CONFIG_SERIAL_ALTERA_UART is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_PCH_UART is not set
+# CONFIG_SERIAL_XILINX_PS_UART is not set
+# CONFIG_HVC_UDBG is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=m
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_HW_RANDOM_PPC4XX is not set
+# CONFIG_NVRAM is not set
+# CONFIG_GEN_RTC is not set
+CONFIG_XILINX_HWICAP=y
+# CONFIG_XILINX_DEVCFG is not set
+# CONFIG_R3964 is not set
+# CONFIG_APPLICOM is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVPORT=y
+# CONFIG_RAMOOPS is not set
+# CONFIG_I2C is not set
+CONFIG_SPI=y
+# CONFIG_SPI_DEBUG is not set
+CONFIG_SPI_MASTER=y
+
+#
+# SPI Master Controller Drivers
+#
+# CONFIG_SPI_ALTERA is not set
+CONFIG_SPI_BITBANG=y
+# CONFIG_SPI_GPIO is not set
+# CONFIG_SPI_OC_TINY is not set
+# CONFIG_SPI_PPC4xx is not set
+# CONFIG_SPI_PXA2XX_PCI is not set
+# CONFIG_SPI_TOPCLIFF_PCH is not set
+CONFIG_SPI_XILINX=y
+# CONFIG_SPI_XILINX_PS_QSPI is not set
+# CONFIG_SPI_XILINX_PS_SPI is not set
+# CONFIG_SPI_DESIGNWARE is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+
+#
+# PPS generators support
+#
+
+#
+# PTP clock support
+#
+
+#
+# Enable Device Drivers -> PPS to see the PTP clock options.
+#
+CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=y
+CONFIG_GPIOLIB=y
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_GPIO_SYSFS=y
+
+#
+# Memory mapped GPIO drivers:
+#
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+CONFIG_GPIO_XILINX=y
+# CONFIG_GPIO_VX855 is not set
+
+#
+# I2C GPIO expanders:
+#
+
+#
+# PCI GPIO expanders:
+#
+# CONFIG_GPIO_BT8XX is not set
+# CONFIG_GPIO_ML_IOH is not set
+# CONFIG_GPIO_RDC321X is not set
+
+#
+# SPI GPIO expanders:
+#
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MCP23S08 is not set
+# CONFIG_GPIO_MC33880 is not set
+# CONFIG_GPIO_74X164 is not set
+
+#
+# AC97 GPIO expanders:
+#
+
+#
+# MODULbus GPIO expanders:
+#
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_WATCHDOG is not set
+CONFIG_SSB_POSSIBLE=y
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+CONFIG_BCMA_POSSIBLE=y
+
+#
+# Broadcom specific AMBA
+#
+# CONFIG_BCMA is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_STMPE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MFD_MC13XXX is not set
+# CONFIG_ABX500_CORE is not set
+# CONFIG_EZX_PCAP is not set
+# CONFIG_MFD_TIMBERDALE is not set
+# CONFIG_LPC_SCH is not set
+# CONFIG_MFD_RDC321X is not set
+# CONFIG_MFD_JANZ_CMODIO is not set
+# CONFIG_MFD_VX855 is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_AGP is not set
+CONFIG_VGA_ARB=y
+CONFIG_VGA_ARB_MAX_GPUS=16
+# CONFIG_DRM is not set
+# CONFIG_STUB_POULSBO is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=y
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=y
+CONFIG_FB_CFB_COPYAREA=y
+CONFIG_FB_CFB_IMAGEBLIT=y
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_WMT_GE_ROPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+# CONFIG_FB_MODE_HELPERS is not set
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_CIRRUS is not set
+# CONFIG_FB_PM2 is not set
+# CONFIG_FB_CYBER2000 is not set
+# CONFIG_FB_OF is not set
+# CONFIG_FB_CT65550 is not set
+# CONFIG_FB_ASILIANT is not set
+# CONFIG_FB_IMSTT is not set
+# CONFIG_FB_VGA16 is not set
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_NVIDIA is not set
+# CONFIG_FB_RIVA is not set
+# CONFIG_FB_MATROX is not set
+# CONFIG_FB_RADEON is not set
+# CONFIG_FB_ATY128 is not set
+# CONFIG_FB_ATY is not set
+# CONFIG_FB_S3 is not set
+# CONFIG_FB_SAVAGE is not set
+# CONFIG_FB_SIS is not set
+# CONFIG_FB_NEOMAGIC is not set
+# CONFIG_FB_KYRO is not set
+# CONFIG_FB_3DFX is not set
+# CONFIG_FB_VOODOO1 is not set
+# CONFIG_FB_VT8623 is not set
+# CONFIG_FB_TRIDENT is not set
+# CONFIG_FB_ARK is not set
+# CONFIG_FB_PM3 is not set
+# CONFIG_FB_CARMINE is not set
+# CONFIG_FB_IBM_GXT4500 is not set
+CONFIG_FB_XILINX=y
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_FB_XYLON is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Console display driver support
+#
+CONFIG_DUMMY_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=y
+CONFIG_FONT_8x8=y
+CONFIG_FONT_8x16=y
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+CONFIG_LOGO_LINUX_CLUT224=y
+# CONFIG_SOUND is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+# CONFIG_UWB is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_INFINIBAND is not set
+# CONFIG_EDAC is not set
+# CONFIG_RTC_CLASS is not set
+# CONFIG_DMADEVICES is not set
+# CONFIG_AUXDISPLAY is not set
+CONFIG_XILINX_EDK=y
+# CONFIG_UIO is not set
+
+#
+# Virtio drivers
+#
+# CONFIG_VIRTIO_PCI is not set
+# CONFIG_VIRTIO_BALLOON is not set
+# CONFIG_VIRTIO_MMIO is not set
+
+#
+# Microsoft Hyper-V guest support
+#
+# CONFIG_STAGING is not set
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_IOMMU_SUPPORT=y
+# CONFIG_VIRT_DRIVERS is not set
+# CONFIG_PM_DEVFREQ is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=y
+CONFIG_EXT2_FS_XATTR=y
+CONFIG_EXT2_FS_POSIX_ACL=y
+CONFIG_EXT2_FS_SECURITY=y
+CONFIG_EXT2_FS_XIP=y
+CONFIG_EXT3_FS=y
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=y
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4_FS is not set
+CONFIG_FS_XIP=y
+CONFIG_JBD=y
+CONFIG_FS_MBCACHE=y
+# CONFIG_REISERFS_FS is not set
+CONFIG_JFS_FS=y
+# CONFIG_JFS_POSIX_ACL is not set
+# CONFIG_JFS_SECURITY is not set
+# CONFIG_JFS_DEBUG is not set
+# CONFIG_JFS_STATISTICS is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+CONFIG_FS_POSIX_ACL=y
+CONFIG_FILE_LOCKING=y
+CONFIG_FSNOTIFY=y
+CONFIG_DNOTIFY=y
+CONFIG_INOTIFY_USER=y
+# CONFIG_FANOTIFY is not set
+# CONFIG_QUOTA is not set
+# CONFIG_QUOTACTL is not set
+CONFIG_AUTOFS4_FS=y
+# CONFIG_FUSE_FS is not set
+CONFIG_GENERIC_ACL=y
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=y
+CONFIG_MSDOS_FS=y
+CONFIG_VFAT_FS=y
+CONFIG_FAT_DEFAULT_CODEPAGE=437
+CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=y
+# CONFIG_PROC_KCORE is not set
+CONFIG_PROC_SYSCTL=y
+CONFIG_PROC_PAGE_MONITOR=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=y
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_JFFS2_FS is not set
+# CONFIG_LOGFS is not set
+CONFIG_CRAMFS=y
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+CONFIG_ROMFS_FS=y
+CONFIG_ROMFS_BACKED_BY_BLOCK=y
+# CONFIG_ROMFS_BACKED_BY_MTD is not set
+# CONFIG_ROMFS_BACKED_BY_BOTH is not set
+CONFIG_ROMFS_ON_BLOCK=y
+# CONFIG_PSTORE is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3=y
+# CONFIG_NFS_V3_ACL is not set
+# CONFIG_NFS_V4 is not set
+CONFIG_ROOT_NFS=y
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=y
+CONFIG_LOCKD_V4=y
+CONFIG_NFS_COMMON=y
+CONFIG_SUNRPC=y
+# CONFIG_CEPH_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+CONFIG_NLS=y
+CONFIG_NLS_DEFAULT="iso8859-1"
+CONFIG_NLS_CODEPAGE_437=y
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+CONFIG_NLS_ASCII=m
+CONFIG_NLS_ISO8859_1=m
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_UTF8=m
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=y
+CONFIG_GENERIC_PCI_IOMAP=y
+CONFIG_CRC_CCITT=y
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=y
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+# CONFIG_CRC8 is not set
+CONFIG_ZLIB_INFLATE=y
+CONFIG_LZO_DECOMPRESS=y
+CONFIG_XZ_DEC=y
+CONFIG_XZ_DEC_X86=y
+CONFIG_XZ_DEC_POWERPC=y
+CONFIG_XZ_DEC_IA64=y
+CONFIG_XZ_DEC_ARM=y
+CONFIG_XZ_DEC_ARMTHUMB=y
+CONFIG_XZ_DEC_SPARC=y
+CONFIG_XZ_DEC_BCJ=y
+# CONFIG_XZ_DEC_TEST is not set
+CONFIG_DECOMPRESS_GZIP=y
+CONFIG_DECOMPRESS_BZIP2=y
+CONFIG_DECOMPRESS_LZMA=y
+CONFIG_DECOMPRESS_XZ=y
+CONFIG_DECOMPRESS_LZO=y
+CONFIG_HAS_IOMEM=y
+CONFIG_HAS_IOPORT=y
+CONFIG_HAS_DMA=y
+CONFIG_DQL=y
+CONFIG_NLATTR=y
+CONFIG_GENERIC_ATOMIC64=y
+# CONFIG_AVERAGE is not set
+# CONFIG_CORDIC is not set
+
+#
+# Kernel hacking
+#
+# CONFIG_PRINTK_TIME is not set
+CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
+CONFIG_ENABLE_WARN_DEPRECATED=y
+CONFIG_ENABLE_MUST_CHECK=y
+CONFIG_FRAME_WARN=1024
+# CONFIG_MAGIC_SYSRQ is not set
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_SECTION_MISMATCH is not set
+CONFIG_DEBUG_KERNEL=y
+# CONFIG_DEBUG_SHIRQ is not set
+# CONFIG_LOCKUP_DETECTOR is not set
+# CONFIG_HARDLOCKUP_DETECTOR is not set
+CONFIG_DETECT_HUNG_TASK=y
+CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
+# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
+CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=0
+CONFIG_SCHED_DEBUG=y
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+# CONFIG_DEBUG_KMEMLEAK is not set
+CONFIG_DEBUG_PREEMPT=y
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_SPARSE_RCU_POINTER is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_ATOMIC_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=y
+CONFIG_DEBUG_INFO=y
+# CONFIG_DEBUG_INFO_REDUCED is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+CONFIG_DEBUG_MEMORY_INIT=y
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_TEST_LIST_SORT is not set
+# CONFIG_DEBUG_SG is not set
+# CONFIG_DEBUG_NOTIFIERS is not set
+# CONFIG_DEBUG_CREDENTIALS is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
+# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_SYSCTL_SYSCALL_CHECK=y
+# CONFIG_DEBUG_PAGEALLOC is not set
+CONFIG_HAVE_FUNCTION_TRACER=y
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
+CONFIG_HAVE_DYNAMIC_FTRACE=y
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
+CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
+CONFIG_TRACING_SUPPORT=y
+CONFIG_FTRACE=y
+# CONFIG_FUNCTION_TRACER is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_PREEMPT_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_ENABLE_DEFAULT_TRACERS is not set
+# CONFIG_FTRACE_SYSCALLS is not set
+CONFIG_BRANCH_PROFILE_NONE=y
+# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
+# CONFIG_PROFILE_ALL_BRANCHES is not set
+# CONFIG_STACK_TRACER is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_ATOMIC64_SELFTEST is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=y
+# CONFIG_KGDB is not set
+# CONFIG_TEST_KSTRTOX is not set
+# CONFIG_PPC_DISABLE_WERROR is not set
+CONFIG_PPC_WERROR=y
+CONFIG_PRINT_STACK_DEPTH=64
+# CONFIG_DEBUG_STACKOVERFLOW is not set
+# CONFIG_CODE_PATCHING_SELFTEST is not set
+# CONFIG_FTR_FIXUP_SELFTEST is not set
+# CONFIG_MSI_BITMAP_SELFTEST is not set
+# CONFIG_XMON is not set
+# CONFIG_BDI_SWITCH is not set
+# CONFIG_PPC_EARLY_DEBUG is not set
+CONFIG_STRICT_DEVMEM=y
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY_DMESG_RESTRICT is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_DEFAULT_SECURITY_DAC=y
+CONFIG_DEFAULT_SECURITY=""
+CONFIG_CRYPTO=y
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_MANAGER is not set
+# CONFIG_CRYPTO_MANAGER2 is not set
+# CONFIG_CRYPTO_USER is not set
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+# CONFIG_CRYPTO_AUTHENC is not set
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+# CONFIG_CRYPTO_CBC is not set
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+# CONFIG_CRYPTO_ECB is not set
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+# CONFIG_CRYPTO_HMAC is not set
+# CONFIG_CRYPTO_XCBC is not set
+# CONFIG_CRYPTO_VMAC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_GHASH is not set
+# CONFIG_CRYPTO_MD4 is not set
+# CONFIG_CRYPTO_MD5 is not set
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+# CONFIG_CRYPTO_SHA1 is not set
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+# CONFIG_CRYPTO_AES is not set
+# CONFIG_CRYPTO_ANUBIS is not set
+# CONFIG_CRYPTO_ARC4 is not set
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+# CONFIG_CRYPTO_DES is not set
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+# CONFIG_CRYPTO_TWOFISH is not set
+
+#
+# Compression
+#
+# CONFIG_CRYPTO_DEFLATE is not set
+# CONFIG_CRYPTO_ZLIB is not set
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+# CONFIG_CRYPTO_USER_API_HASH is not set
+# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
+CONFIG_CRYPTO_HW=y
+# CONFIG_CRYPTO_DEV_PPC4XX is not set
+# CONFIG_PPC_CLOCK is not set
+# CONFIG_VIRTUALIZATION is not set
diff --git a/recipes-kernel/linux/linux-xilinx_3.3.bb b/recipes-kernel/linux/linux-xilinx_3.3.bb
new file mode 100644
index 0000000..e236387
--- /dev/null
+++ b/recipes-kernel/linux/linux-xilinx_3.3.bb
@@ -0,0 +1,26 @@
+inherit kernel xilinx-kernel xilinx-utils
+require recipes-kernel/linux/linux-xilinx.inc
+
+DEFAULT_PREFERENCE = "1"
+
+KBRANCH = "master"
+
+LINUX_VERSION ?= "3.3.0"
+SRCREV_pn-${PN} = "1e92da8e3a66b051766b1be57be67e2bff11e19d"
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/linux-xilinx-3.3' ], d)}"
+
+PR = "r00"
+PV = "${LINUX_VERSION}"
+
+SRC_URI = "git://git.xilinx.com/linux-xlnx.git;protocol=git;branch=${KBRANCH} \
+           file://0001-Xilinx-Update-IP-Core-support-for-Xilinx-ISE-14.1.patch \
+           file://0002-virtex440-ml507.dts-Update-device-tree-file-using-Xi.patch \
+           file://0003-xilinxfb-Fix-regression-in-call-to-XPS-TFT-controlle.patch \
+           file://defconfig_3.3.0"
+
+# Support for binary device tree generation
+XILINX_BOARD ?= "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"
+KERNEL_DEVICETREE = "${@device_tree(bb.data.getVar('TARGET_ARCH', d, 1), d)}"
+KERNEL_DEVICETREE_microblazeel = "${@device_tree(bb.data.getVar('TARGET_CPU', d, 1), d)}"
+
+COMPATIBLE_MACHINE = "(virtex4|virtex5|virtex5mb|spartan6-sp605|spartan6-lx9mb)"
-- 
1.7.9.5



