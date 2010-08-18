Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1Olrfp-00074Q-77
	for Openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 01:04:00 +0200
Received: by pwj1 with SMTP id 1so527500pwj.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 16:03:37 -0700 (PDT)
Received: by 10.142.216.6 with SMTP id o6mr7709172wfg.105.1282172616922;
	Wed, 18 Aug 2010 16:03:36 -0700 (PDT)
Received: from [172.22.3.240] (ip65-44-204-2.z204-44-65.customer.algx.net
	[65.44.204.2])
	by mx.google.com with ESMTPS id t11sm889935wfc.16.2010.08.18.16.03.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 18 Aug 2010 16:03:35 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Wed, 18 Aug 2010 16:03:18 -0700
Message-Id: <85E2A6C5-DF7F-4B57-A5A4-01EFC6E370F6@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] Add bootstream-falconwing recipe
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
X-List-Received-Date: Wed, 18 Aug 2010 23:04:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Sean Cross <sean@chumby.com>
---
 .../bootstream-falconwing_1.bb                     |   65 ++++
 recipes/bootstream-falconwing/fix-oe-build.patch   |  405 =
++++++++++++++++++++
 2 files changed, 470 insertions(+), 0 deletions(-)
 create mode 100644 =
recipes/bootstream-falconwing/bootstream-falconwing_1.bb
 create mode 100644 recipes/bootstream-falconwing/fix-oe-build.patch

diff --git a/recipes/bootstream-falconwing/bootstream-falconwing_1.bb =
b/recipes/bootstream-falconwing/bootstream-falconwing_1.bb
new file mode 100644
index 0000000..da423b0
--- /dev/null
+++ b/recipes/bootstream-falconwing/bootstream-falconwing_1.bb
@@ -0,0 +1,65 @@
+# Builds the boot partition for a chumby Falconwing-based platform.
+# Note that bootstream-chumby.bin is a binary-blob combination of
+# chumby_stub, and the Freescale-provided bootlets that set up power,
+# clocks, and RAM.  It is provided as a blob because Freescale provides
+# elftosb2 as a blob.  If you would like to recreate these from scratch =
and
+# are on an x86 Linux machine, you'll need the following files:
+#   =
http://files.chumby.com/source/falconwing/bootloader/elftosb2;name=3Delfto=
sb2
+#   =
http://files.chumby.com/source/falconwing/bootloader/falconwing_chumby_sb.=
db;name=3Dchumbyconfig
+#   =
http://files.chumby.com/source/falconwing/bootloader/falconwing_factory_sb=
.db;name=3Dfactoryconfig
+SECTION =3D "bootloaders"
+PRIORITY =3D "optional"
+LICENSE =3D "GPLv2"
+DEPENDS =3D "virtual/kernel"
+PROVIDES =3D "virtual/bootloader"
+RPROVIDES =3D "virtual/bootloader"
+PR =3D "r4"
+
+SRC_URI =3D =
"http://files.chumby.com/source/falconwing/build2913/bootstream-1.0.tgz;na=
me=3Darchive              \
+           =
http://files.chumby.com/source/falconwing/build2913/bootstream-chumby.bin;=
name=3Dbootstream        \
+           file://fix-oe-build.patch                                    =
                                    \
+"
+SRC_URI[archive.md5sum] =3D "a0b51d7d934736159d45001b28ac2c33"
+SRC_URI[archive.sha256sum] =3D =
"0cef8057f8d374451b0092c907456033c23de8eb13228feeebd98acab421c13e"
+SRC_URI[bootstream.md5sum] =3D "8aa29fc431f349b22d147b5cec52927b"
+SRC_URI[bootstream.sha256sum] =3D =
"8dcf12cb6f749de2e373a780b8bbcee099ec23aad212d58131750caa7360c0eb"
+
+S =3D "${WORKDIR}/bootstream-1.0"
+
+do_compile () {
+    oe_runmake 'LINUX_DIR=3D${STAGING_KERNEL_DIR}'
+}
+
+FILES_${PN} =3D "/boot"
+
+addtask deploy before do_build after do_compile
+
+do_deploy () {
+    ./config_util --cmd=3Dcreate \
+        --mbr=3D/dev/zero \
+        --configname=3Dfalconwing \
+        --build_ver=3D1000 --force --pad \
+        --blockdef=3D${S}/output/chumby_boot.rom,215040,boot,1,0,0,0 \
+        --blockdef=3D${S}/images/4_1.bin,153600,img1,1,0,0,0 \
+        --blockdef=3D${S}/images/4_2.bin,153600,img2,1,0,0,0 \
+        --blockdef=3D${S}/images/5_1.bin,153600,img3,1,0,0,0 \
+        --blockdef=3D${S}/images/5_2.bin,153600,img4,1,0,0,0 \
+        --blockdef=3D${S}/images/5_3.bin,153600,img5,1,0,0,0 \
+        =
--blockdef=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin,4194304,krnA,1,0,0,=
0 \
+        =
--blockdef=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin,4194304,krnB,1,0,0,=
0 \
+        > ${S}/output/config_block.bin
+    install -d ${DEPLOY_DIR_IMAGE}
+    rm -f ${DEPLOY_DIR_IMAGE}/boot.bin
+    touch ${DEPLOY_DIR_IMAGE}/boot.bin
+    dd if=3D../bootstream-chumby.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin =
seek=3D0 count=3D64
+    dd if=3D${S}/output/config_block.bin =
of=3D${DEPLOY_DIR_IMAGE}/boot.bin seek=3D96 count=3D32
+    dd if=3D${S}/output/chumby_boot.rom of=3D${DEPLOY_DIR_IMAGE}/boot.bin=
 seek=3D128 count=3D420
+    dd if=3D${S}/images/4_1.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin =
seek=3D548 count=3D300
+    dd if=3D${S}/images/4_2.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin =
seek=3D848 count=3D300
+    dd if=3D${S}/images/5_1.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin =
seek=3D1148 count=3D300
+    dd if=3D${S}/images/5_2.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin =
seek=3D1448 count=3D300
+    dd if=3D${S}/images/5_3.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin =
seek=3D1748 count=3D300
+    dd if=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin =
of=3D${DEPLOY_DIR_IMAGE}/boot.bin seek=3D2048 count=3D8192
+    dd if=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin =
of=3D${DEPLOY_DIR_IMAGE}/boot.bin seek=3D10240 count=3D8192
+    package_stagefile_shell ${DEPLOY_DIR_IMAGE}/boot.bin
+}
diff --git a/recipes/bootstream-falconwing/fix-oe-build.patch =
b/recipes/bootstream-falconwing/fix-oe-build.patch
new file mode 100644
index 0000000..c06756d
--- /dev/null
+++ b/recipes/bootstream-falconwing/fix-oe-build.patch
@@ -0,0 +1,405 @@
+diff -ur bootstream-1.0-stock/Makefile bootstream-1.0/Makefile
+--- bootstream-1.0-stock/Makefile	2010-08-18 13:43:44.386637400 =
-0700
++++ bootstream-1.0/Makefile	2010-08-18 13:43:27.870626729 -0700
+@@ -1,64 +1,16 @@
+ # $Id: Makefile 7554 2009-04-30 19:44:17Z scross $
+ # source build makefile for bootstream bootloader
+=20
+-include ../config/config.mk
++CFLAGS +=3D -DCHUMBY_CONFIGNAME=3D\"falconwing\" =
-DCHUMBY_CONFIGNAME_falconwing
+=20
+-ELFTOSB2_DIR=3Delftosb2
+-ELFTOSB2_BINARIES=3Delftosb2
+-ELFTOSB2_SRC_BINARIES=3D$(addprefix =
$(ELFTOSB2_DIR)/,$(ELFTOSB2_BINARIES))
+-ELFTOSB2_SOURCES=3D$(wildcard $(ELFTOSB2_DIR)/*.c $(ELFTOSB2_DIR)/*.h)
+-
+-SRC_BINARIES=3D$(ELFTOSB2_SRC_BINARIES)
+-HOST_BINARIES=3D$(ELFTOSB2_BINARIES)
+-
+-CFLAGS +=3D -DCHUMBY_CONFIGNAME=3D\"$(CONFIGNAME)\" =
-DCHUMBY_CONFIGNAME_$(CONFIGNAME)
+-
+-all: $(SRC_BINARIES) $(HOST_BINARIES) \
+-	chumby_factory/chumby_factory chumby_stub/chumby_stub =
chumby_boot/chumby_boot
+-
+-
+-install: $(SRC_BINARIES) $(HOST_BINARIES) \
+-	.src_binaries .chumby-boot .factory-image .chumby-stub
+-    #.u-boot-image
+-
+-chumby_boot/chumby_boot:
+-	$(MAKE) -C chumby_boot CROSS_COMPILE=3D$(TARGET)- =
LINUX_DIR=3D$(LINUX_DIR)
+-
+-chumby_stub/chumby_stub:
+-	$(MAKE) -C chumby_stub CROSS_COMPILE=3D$(TARGET)- =
LINUX_DIR=3D$(LINUX_DIR)
+-
+-chumby_factory/chumby_factory:
+-	$(MAKE) -C chumby_factory CROSS_COMPILE=3D$(TARGET)- =
LINUX_DIR=3D$(LINUX_DIR)
+-
+-
+-.factory-image: $(SRC_BINARIES)
+-	elftosb2/elftosb2 -z -c ../config/falconwing_factory_sb.db \
+-            -o $(INSTALL_DIR)/bootstream-factory.bin
+-
+-.chumby-boot: $(SRC_BINARIES)
+-	cp images/chumby_boot.rom $(INSTALL_DIR)/chumby_boot.bin
+-
+-.chumby-stub: $(SRC_BINARIES)
+-	elftosb2/elftosb2 -c ../config/falconwing_chumby_sb.db \
+-            -o $(INSTALL_DIR)/bootstream-chumby.bin
+-
+-.u-boot-image: $(SRC_BINARIES)
+-	elftosb2/elftosb2 -c ../config/falconwing_uboot_sb.db \
+-            -o $(INSTALL_DIR)/falconwing_uboot.sb
+-
+-
+-.src_binaries:
+-	@echo "Copying src bianries"
+-	mkdir -p $(INSTALL_DIR)/host
+-	cp --preserve --no-dereference $(SRC_BINARIES) =
$(INSTALL_DIR)/host/
++all:
++	$(MAKE) -C chumby_factory
++	$(MAKE) -C chumby_stub
++	$(MAKE) -C chumby_boot
++	gcc config_util.cpp -o config_util -lstdc++
+=20
+ clean:
+-	-rm -f $(HOST_BINARIES) $(SRC_BINARIES)
+-	$(MAKE) -C $(ELFTOSB2_DIR) clean
+-
+-$(ELFTOSB2_SRC_BINARIES):
+-	$(MAKE) -C $(ELFTOSB2_DIR)
+-
+-../output/$(TARGET)-$(CNPLATFORM):
+-	@echo "Creating directory: $@"
+-	-mkdir -p $@
++	$(MAKE) -C chumby_factory clean
++	$(MAKE) -C chumby_stub clean
++	$(MAKE) -C chumby_boot clean
++	rm -f config_util
+diff -ur bootstream-1.0-stock/chumby_boot/Makefile =
bootstream-1.0/chumby_boot/Makefile
+--- bootstream-1.0-stock/chumby_boot/Makefile	2010-08-18 =
13:43:44.386637400 -0700
++++ bootstream-1.0/chumby_boot/Makefile	2010-08-18 =
13:43:27.874670886 -0700
+@@ -7,24 +7,14 @@
+ # Linker script=20
+ BASE_ADDR	?=3D 0x00002000
+ BOOT_LAYOUT_IN	=3D $(SRCDIR)/chumby_boot.ld.in
+-BOOT_LAYOUT_OUT	=3D $(OUTPUTDIR)/chumby_boot.ld
++BOOT_LAYOUT_OUT    =3D ../output/chumby_boot.ld
+=20
+=20
+ # Output ELF image
+-CHUMBY_BOOT	=3D $(OUTPUTDIR)/../../images/chumby_boot
++CHUMBY_BOOT    =3D ../output/chumby_boot
+=20
+ # Output binary image
+-CHUMBY_BOOT_ROM	=3D $(OUTPUTDIR)/../../images/chumby_boot.rom
+-
+-CROSS_COMPILE ?=3D arm-linux-
+-
+-AS	=3D $(CROSS_COMPILE)as
+-CC	=3D $(CROSS_COMPILE)gcc
+-LD	=3D $(CROSS_COMPILE)ld
+-CPP	=3D $(CROSS_COMPILE)cpp
+-STRIP	=3D $(CROSS_COMPILE)strip
+-OBJCOPY	=3D $(CROSS_COMPILE)objcopy
+-OBJDUMP	=3D $(CROSS_COMPILE)objdump
++CHUMBY_BOOT_ROM    =3D ../output/chumby_boot.rom
+=20
+ LIBGCCDIR =3D $(dir $(shell $(CC) -print-libgcc-file-name))
+ CFLAGS 	=3D -Wall -I$(INCLUDEDIR) -I$(LINUX_DIR)/include =
-fno-builtin -O0 -nostdinc
+@@ -91,5 +81,5 @@
+ 	@nm -n $@ > $@.map
+=20
+ $(BOOT_LAYOUT_OUT): $(BOOT_LAYOUT_IN)
+-	$(CPP) -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
++	cpp -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
+=20
+diff -ur bootstream-1.0-stock/chumby_boot/src/serial.c =
bootstream-1.0/chumby_boot/src/serial.c
+--- bootstream-1.0-stock/chumby_boot/src/serial.c	2010-08-18 =
13:43:44.386637400 -0700
++++ bootstream-1.0/chumby_boot/src/serial.c	2010-08-18 =
13:43:27.874670886 -0700
+@@ -171,10 +171,10 @@
+     return data;
+ }
+=20
+-static char hex[] =3D "0123456789abcdef";
+=20
+ void serial_puthex(u32 c) {
+     int i;
++    char hex[] =3D "0123456789abcdef";
+     serial_puts("0x");
+     for(i=3D7; i>=3D0; i--)
+         serial_putc(hex[(c>>(4*i))&0x0f]);
+diff -ur bootstream-1.0-stock/chumby_boot/src/shell.c =
bootstream-1.0/chumby_boot/src/shell.c
+--- bootstream-1.0-stock/chumby_boot/src/shell.c	2010-08-18 =
13:43:44.386637400 -0700
++++ bootstream-1.0/chumby_boot/src/shell.c	2010-08-18 =
15:12:45.138607841 -0700
+@@ -48,8 +48,8 @@
+     "shell\n"
+=20
+     // Run the watchdogtimer, set to reboot the device in 20 seconds.
+-    "regutil -w HW_RTC_WATCHDOG 0x00004e20\n"
+-    "regutil -w HW_RTC_CTRL_SET 0x00000010\n"
++    //"regutil -w HW_RTC_WATCHDOG 0x00004e20\n"
++    //"regutil -w HW_RTC_CTRL_SET 0x00000010\n"
+=20
+     // Prioritize screen DMA over other DMA.  This fixes video tearing =
issues.
+     // Priority is: AXI0, AHB2, AHB1, AHB3
+@@ -84,7 +84,7 @@
+=20
+     // Set up the Linux tags, pass the command-line arguments, and run =
the
+     // Linux kernel, located at address 0x40008000.
+-    "linux 0x40008000 \"console=3DttyAM0,115200 init=3D/linuxrc =
root=3D/dev/mmcblk0p2 rootfstype=3Dext3 ro rootwait chumbyrev=3D** =
ssp1=3Dmmc sysrq_always_enabled logo.brand=3D" BRAND_PLACEHOLDER "\"\n",
++    "linux 0x40008000 \"console=3DttyAM0,115200 root=3D/dev/mmcblk0p2 =
rw rootwait chumbyrev=3D** ssp1=3Dmmc sysrq_always_enabled logo.brand=3D" =
BRAND_PLACEHOLDER "\"\n",
+=20
+ ////////////////////////////////////////////////
+=20
+@@ -97,7 +97,7 @@
+=20
+     // Set up the Linux tags, pass the command-line arguments, and run =
the
+     // Linux kernel, located at address 0x40008000.
+-    "linux 0x40008000 \"console=3DttyAM0,115200 init=3D/linuxrc =
root=3D/dev/mmcblk0p2 rootfstype=3Dext3 ro rootwait chumbyrev=3D** =
ssp1=3Dmmc sysrq_always_enabled partition=3Drecovery logo.brand=3D" =
BRAND_PLACEHOLDER "\"\n",
++    "linux 0x40008000 \"console=3DttyAM0,115200 root=3D/dev/mmcblk0p2 =
rw rootwait chumbyrev=3D** ssp1=3Dmmc sysrq_always_enabled =
partition=3Drecovery logo.brand=3D" BRAND_PLACEHOLDER "\"\n",
+=20
+ ////////////////////////////////////////////////
+=20
+@@ -350,8 +350,8 @@
+ }
+=20
+ char **shell_line_to_argv(int argc, char *line) {
+-    static char *argv[80];
+     int i;
++	static char *argv[10];
+     for(i=3D0; i<=3Dargc; i++) {
+         argv[i] =3D line;
+         while(*line)
+diff -ur bootstream-1.0-stock/chumby_boot/src/shell_funcs.c =
bootstream-1.0/chumby_boot/src/shell_funcs.c
+--- bootstream-1.0-stock/chumby_boot/src/shell_funcs.c	2010-08-18 =
13:43:44.386637400 -0700
++++ bootstream-1.0/chumby_boot/src/shell_funcs.c	2010-08-18 =
15:11:45.984011892 -0700
+@@ -42,6 +42,7 @@
+=20
+ 	value =3D eeprom_read(addr, reg);
+ 	STR("Value: "), HEX(value), STR("\n");
++	return 0;
+ }
+=20
+=20
+@@ -244,7 +245,7 @@
+=20
+=20
+=20
+-static int sd_initted =3D 0;
++int sd_initted;
+ char *sd_pmem;
+=20
+ static int my_sd_stop() {
+@@ -256,27 +257,28 @@
+=20
+=20
+ static int my_sd_init() {
+-    static rom_BootInit_t init;// =3D (rom_BootInit_t *)0x40A10000;
++    rom_BootInit_t init;
++
+     if(sd_initted) {
+         int result;
+         result =3D my_sd_stop();
+         if(result) {
+-            STR("Error!  Couldn't reset SD.\n");
+-            return 0;
++            STR("Error!  Couldn't reset SD: "), HEX(result), =
STR("\n");
++            return 1;
+         }
++		sd_initted =3D 0;
+     }
++
+     if(!sd_initted) {
+         int result;
+         mdelay(10);
+         init.size =3D PMEM_SIZE;
+-        init.pMem =3D sd_pmem;   // Allocated on stack in main().
++        init.pMem =3D 16384;
+         init.mode =3D 9;         // Set to SSP_PORT_1.
+         memset(sd_pmem, 0, PMEM_SIZE);
+-        result =3D sd_init(&init);
+-        if(!result)
+-            sd_initted =3D 1;
+-        else
++        if((result =3D sd_init(&init)))
+             return result;
++		sd_initted =3D 1;
+     }
+     return 0;
+ }
+@@ -318,17 +320,18 @@
+     while(bytes > 0) {
+         int chunks_to_read, chunk;
+         int read_tries =3D 0;
++		chunks_to_read =3D bytes/sizeof(chunk_t);
+=20
+=20
+         // Perform the read.
+-//            STR("Going to try to read "), INT(chunks_to_read), STR(" =
chunks\n");
++//        STR("Going to try to read "), INT(chunks_to_read), STR(" =
chunks\n");
+         while(read_tries < 1000) {
+             read_tries++;
+             chunks_to_read =3D bytes/sizeof(chunk_t);
+             chunks =3D sd_next(&chunks_to_read);
+             if(!chunks_to_read) {
+-//                    STR("Read 0 chunks.  Trying again...\n");
+-//                    mdelay(1000*read_tries);  // XXX need to tune =
this!
++                STR("Read 0 chunks.  Trying again...\n");
++                mdelay(10*read_tries);  // XXX need to tune this!
+                 continue;
+             }
+             else
+@@ -339,15 +342,15 @@
+             STR("  Aborting read.\n");
+             return 0;
+         }
+-//            else if(read_tries)
+-//                STR("Delayed "), INT(read_tries), STR(" times.\n");
++//        else if(read_tries)
++//            STR("Delayed "), INT(read_tries), STR(" times.\n");
+=20
+         if(chunks_to_read < 0) {
+             STR("Error while reading bytes: "), HEX(chunks_to_read), =
STR("\n");
+             return 0;
+         }
+-//            else
+-//                STR("Successfully read "), INT(chunks_to_read), =
STR(" chunks.\n");
++//        else
++//            STR("Successfully read "), INT(chunks_to_read), STR(" =
chunks.\n");
+=20
+         // Copy over each of the chunks that was read.
+         for(chunk=3D0; chunk<chunks_to_read; chunk++) {
+@@ -367,9 +370,13 @@
+ int sd_cfg_loaded =3D 0;
+ static int config_block_load() {
+     if(!sd_cfg_loaded) {
+-        sd_cfg =3D (char *)0x45A00000;
+-        if(real_load(CFG_OFFSET, (char *)sd_cfg, sizeof(struct =
config_area)))
+-            return 0;
++        sd_cfg =3D (struct config_area *)0x45A00000;
++        if(real_load(CFG_OFFSET, (char *)sd_cfg, sizeof(struct =
config_area))) {
++			STR("real_load() returned an error.\n");
++            return 1;
++		}
++		//STR("Dump of config area:\n");
++		//HEXDUMP((unsigned char *)sd_cfg, sizeof(struct =
config_area));
+         sd_cfg_loaded =3D 1;
+     }
+     return !sd_cfg_loaded;
+@@ -773,14 +780,14 @@
+     return 0;
+ }
+=20
+-static char hex[] =3D "0123456789abcdef";
+=20
+ // str must be at least 11 bytes long
+ void str_puthex(u32 c, char *str) {
+-  int i, j;
++    int i, j;
++    char hex[] =3D "0123456789abcdef";
+     str[0] =3D '0'; str[1] =3D 'x';
+     for(i=3D7, j =3D 0; i>=3D0; i--, j++)
+-      str[2+j] =3D hex[(c>>(4*i))&0x0f];
++        str[2+j] =3D hex[(c>>(4*i))&0x0f];
+    =20
+     str[10] =3D '\n';
+     str[11] =3D '\0';
+@@ -1058,6 +1065,7 @@
+=20
+ struct shell_command *shell_funcs_init() {
+     struct shell_command *cmd_fixup =3D cmds;
++	sd_initted =3D 0;
+=20
+     // Fixup the cmd array by adding the base_address value to each =
pointer.
+     while(cmd_fixup->name) {
+diff -ur bootstream-1.0-stock/chumby_factory/Makefile =
bootstream-1.0/chumby_factory/Makefile
+--- bootstream-1.0-stock/chumby_factory/Makefile	2010-08-18 =
13:43:44.386637400 -0700
++++ bootstream-1.0/chumby_factory/Makefile	2010-08-18 =
13:43:27.874670886 -0700
+@@ -1,30 +1,20 @@
+ CURRENTDIR	=3D .
+ SRCDIR		=3D $(CURRENTDIR)/src
+-OUTPUTDIR	=3D $(CURRENTDIR)/output
++OUTPUTDIR	=3D ../output
+=20
+ INCLUDEDIR	=3D $(CURRENTDIR)/include
+=20
+ # Linker script=20
+ BASE_ADDR	?=3D 0x00002000
+ BOOT_LAYOUT_IN	=3D $(SRCDIR)/chumby_factory.ld.in
+-BOOT_LAYOUT_OUT	=3D $(OUTPUTDIR)/chumby_factory.ld
++BOOT_LAYOUT_OUT	=3D ../output/chumby_factory.ld
+=20
+=20
+ # Output ELF image
+-CHUMBY_FACTORY	=3D $(OUTPUTDIR)/../../images/chumby_factory
++CHUMBY_FACTORY	=3D ../output/chumby_factory
+=20
+ # Output binary image
+-CHUMBY_FACTORY_ROM	=3D $(OUTPUTDIR)/../../images/chumby_factory.rom
+-
+-CROSS_COMPILE ?=3D arm-linux-
+-
+-AS	=3D $(CROSS_COMPILE)as
+-CC	=3D $(CROSS_COMPILE)gcc
+-LD	=3D $(CROSS_COMPILE)ld
+-CPP	=3D $(CROSS_COMPILE)cpp
+-STRIP	=3D $(CROSS_COMPILE)strip
+-OBJCOPY	=3D $(CROSS_COMPILE)objcopy
+-OBJDUMP	=3D $(CROSS_COMPILE)objdump
++CHUMBY_FACTORY_ROM	=3D ../output/chumby_factory.rom
+=20
+ LIBGCCDIR =3D $(dir $(shell $(CC) -print-libgcc-file-name))
+ CFLAGS 	=3D -Wall -I$(INCLUDEDIR) -I$(LINUX_DIR)/include =
-nostdinc -fno-builtin -O
+@@ -90,5 +80,5 @@
+ 	@nm -n $@ > $@.map
+=20
+ $(BOOT_LAYOUT_OUT): $(BOOT_LAYOUT_IN)
+-	$(CPP) -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
++	cpp -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
+=20
+diff -ur bootstream-1.0-stock/chumby_stub/Makefile =
bootstream-1.0/chumby_stub/Makefile
+--- bootstream-1.0-stock/chumby_stub/Makefile	2010-08-18 =
13:43:44.386637400 -0700
++++ bootstream-1.0/chumby_stub/Makefile	2010-08-18 =
13:43:27.874670886 -0700
+@@ -1,30 +1,20 @@
+ CURRENTDIR	=3D .
+ SRCDIR		=3D $(CURRENTDIR)/src
+-OUTPUTDIR	=3D $(CURRENTDIR)/output
++OUTPUTDIR	=3D ../output
+=20
+ INCLUDEDIR	=3D $(CURRENTDIR)/include
+=20
+ # Linker script=20
+ BASE_ADDR	?=3D 0x00002000
+ BOOT_LAYOUT_IN	=3D $(SRCDIR)/chumby_stub.ld.in
+-BOOT_LAYOUT_OUT	=3D $(OUTPUTDIR)/chumby_stub.ld
++BOOT_LAYOUT_OUT	=3D ../output/chumby_stub.ld
+=20
+=20
+ # Output ELF image
+-CHUMBY_STUB	=3D $(OUTPUTDIR)/../../images/chumby_stub
++CHUMBY_STUB	=3D ../images/chumby_stub
+=20
+ # Output binary image
+-CHUMBY_STUB_ROM	=3D $(OUTPUTDIR)/../../images/chumby_stub.rom
+-
+-CROSS_COMPILE ?=3D arm-linux-
+-
+-AS	=3D $(CROSS_COMPILE)as
+-CC	=3D $(CROSS_COMPILE)gcc
+-LD	=3D $(CROSS_COMPILE)ld
+-CPP	=3D $(CROSS_COMPILE)cpp
+-STRIP	=3D $(CROSS_COMPILE)strip
+-OBJCOPY	=3D $(CROSS_COMPILE)objcopy
+-OBJDUMP	=3D $(CROSS_COMPILE)objdump
++CHUMBY_STUB_ROM	=3D ../images/chumby_stub.rom
+=20
+ LIBGCCDIR =3D $(dir $(shell $(CC) -print-libgcc-file-name))
+ CFLAGS 	=3D -Wall -I$(INCLUDEDIR) -I$(LINUX_DIR)/include =
-nostdinc -fno-builtin -Os
+@@ -90,5 +80,5 @@
+ 	@nm -n $@ > $@.map
+=20
+ $(BOOT_LAYOUT_OUT): $(BOOT_LAYOUT_IN)
+-	$(CPP) -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
++	cpp -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
+=20
--=20
1.7.0.4



