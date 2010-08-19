Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oly7E-0005Rt-AE
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:56:43 +0200
Received: by mail-iw0-f175.google.com with SMTP id 38so1444437iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=kllCvZCs89d06vbexEF8n8JJj6Ib7AGVmX0o7mp3ZUc=;
	b=j19sQ+vQMriUeQ+8AXBgi2vakOthHNSPbTf8ISR06YB965M5+bOtC4ycUlt1iqdci4
	Pu7HW/y64teVlIfbPy++uS7DNHxMxvruJK16Yd01QBdBMTqaW/DiQstajpCzIBX9mUzr
	H6k7EJ0Vt8bfyEVaRwMjBvyiJjn3adgGydtAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=QCYBFu10ROxrDZNyqPsvagxsI0p9PM1TdmFZHp/iRmG1taMIIr825k21uPUAQcCx27
	pWWf3qcIFD+SzNxvHckgxsMNCy59M6Eu3fY55LLZVJXj9c2XVFRVSew/2NXogljhJha/
	VE07BS2+zy6Qf0RB0EFaIshI5EG5O8B3K/3ao=
Received: by 10.231.183.81 with SMTP id cf17mr10818683ibb.32.1282197379167;
	Wed, 18 Aug 2010 22:56:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.199 with HTTP; Wed, 18 Aug 2010 22:55:59 -0700 (PDT)
In-Reply-To: <85E2A6C5-DF7F-4B57-A5A4-01EFC6E370F6@chumby.com>
References: <85E2A6C5-DF7F-4B57-A5A4-01EFC6E370F6@chumby.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Aug 2010 22:55:59 -0700
Message-ID: <AANLkTi=RfZ8aRp36XTEtaBuX=puvQn4zO4EU6Qamq10x@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 3/3] Add bootstream-falconwing recipe
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
X-List-Received-Date: Thu, 19 Aug 2010 05:56:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2010 at 4:03 PM, Sean Cross <sean@chumby.com> wrote:
>
> Signed-off-by: Sean Cross <sean@chumby.com>
> ---
> =A0.../bootstream-falconwing_1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 65 ++++
> =A0recipes/bootstream-falconwing/fix-oe-build.patch =A0 | =A0405 ++++++++=
++++++++++++
> =A02 files changed, 470 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/bootstream-falconwing/bootstream-falconwing=
_1.bb
> =A0create mode 100644 recipes/bootstream-falconwing/fix-oe-build.patch
>
> diff --git a/recipes/bootstream-falconwing/bootstream-falconwing_1.bb b/r=
ecipes/bootstream-falconwing/bootstream-falconwing_1.bb
> new file mode 100644
> index 0000000..da423b0
> --- /dev/null
> +++ b/recipes/bootstream-falconwing/bootstream-falconwing_1.bb
> @@ -0,0 +1,65 @@
> +# Builds the boot partition for a chumby Falconwing-based platform.
> +# Note that bootstream-chumby.bin is a binary-blob combination of
> +# chumby_stub, and the Freescale-provided bootlets that set up power,
> +# clocks, and RAM. =A0It is provided as a blob because Freescale provide=
s
> +# elftosb2 as a blob. =A0If you would like to recreate these from scratc=
h and
> +# are on an x86 Linux machine, you'll need the following files:
> +# =A0 http://files.chumby.com/source/falconwing/bootloader/elftosb2;name=
=3Delftosb2
> +# =A0 http://files.chumby.com/source/falconwing/bootloader/falconwing_ch=
umby_sb.db;name=3Dchumbyconfig
> +# =A0 http://files.chumby.com/source/falconwing/bootloader/falconwing_fa=
ctory_sb.db;name=3Dfactoryconfig
> +SECTION =3D "bootloaders"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv2"
> +DEPENDS =3D "virtual/kernel"
> +PROVIDES =3D "virtual/bootloader"
> +RPROVIDES =3D "virtual/bootloader"
> +PR =3D "r4"

should be r0

> +
> +SRC_URI =3D "http://files.chumby.com/source/falconwing/build2913/bootstr=
eam-1.0.tgz;name=3Darchive =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 http://files.chumby.com/source/falconwing/build2913=
/bootstream-chumby.bin;name=3Dbootstream =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 =A0 =A0 file://fix-oe-build.patch =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> +"
> +SRC_URI[archive.md5sum] =3D "a0b51d7d934736159d45001b28ac2c33"
> +SRC_URI[archive.sha256sum] =3D "0cef8057f8d374451b0092c907456033c23de8eb=
13228feeebd98acab421c13e"
> +SRC_URI[bootstream.md5sum] =3D "8aa29fc431f349b22d147b5cec52927b"
> +SRC_URI[bootstream.sha256sum] =3D "8dcf12cb6f749de2e373a780b8bbcee099ec2=
3aad212d58131750caa7360c0eb"
> +
> +S =3D "${WORKDIR}/bootstream-1.0"
> +
> +do_compile () {
> + =A0 =A0oe_runmake 'LINUX_DIR=3D${STAGING_KERNEL_DIR}'
> +}
> +

do_compile depends on STAGING_KERNEL_DIR to be populated I guess. Does
it have right DEPENDS

> +FILES_${PN} =3D "/boot"
> +
> +addtask deploy before do_build after do_compile
> +
> +do_deploy () {
> + =A0 =A0./config_util --cmd=3Dcreate \
> + =A0 =A0 =A0 =A0--mbr=3D/dev/zero \
> + =A0 =A0 =A0 =A0--configname=3Dfalconwing \
> + =A0 =A0 =A0 =A0--build_ver=3D1000 --force --pad \
> + =A0 =A0 =A0 =A0--blockdef=3D${S}/output/chumby_boot.rom,215040,boot,1,0=
,0,0 \
> + =A0 =A0 =A0 =A0--blockdef=3D${S}/images/4_1.bin,153600,img1,1,0,0,0 \
> + =A0 =A0 =A0 =A0--blockdef=3D${S}/images/4_2.bin,153600,img2,1,0,0,0 \
> + =A0 =A0 =A0 =A0--blockdef=3D${S}/images/5_1.bin,153600,img3,1,0,0,0 \
> + =A0 =A0 =A0 =A0--blockdef=3D${S}/images/5_2.bin,153600,img4,1,0,0,0 \
> + =A0 =A0 =A0 =A0--blockdef=3D${S}/images/5_3.bin,153600,img5,1,0,0,0 \
> + =A0 =A0 =A0 =A0--blockdef=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin,4=
194304,krnA,1,0,0,0 \
> + =A0 =A0 =A0 =A0--blockdef=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin,4=
194304,krnB,1,0,0,0 \
> + =A0 =A0 =A0 =A0> ${S}/output/config_block.bin
> + =A0 =A0install -d ${DEPLOY_DIR_IMAGE}
> + =A0 =A0rm -f ${DEPLOY_DIR_IMAGE}/boot.bin
> + =A0 =A0touch ${DEPLOY_DIR_IMAGE}/boot.bin
> + =A0 =A0dd if=3D../bootstream-chumby.bin of=3D${DEPLOY_DIR_IMAGE}/boot.b=
in seek=3D0 count=3D64
> + =A0 =A0dd if=3D${S}/output/config_block.bin of=3D${DEPLOY_DIR_IMAGE}/bo=
ot.bin seek=3D96 count=3D32
> + =A0 =A0dd if=3D${S}/output/chumby_boot.rom of=3D${DEPLOY_DIR_IMAGE}/boo=
t.bin seek=3D128 count=3D420
> + =A0 =A0dd if=3D${S}/images/4_1.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin se=
ek=3D548 count=3D300
> + =A0 =A0dd if=3D${S}/images/4_2.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin se=
ek=3D848 count=3D300
> + =A0 =A0dd if=3D${S}/images/5_1.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin se=
ek=3D1148 count=3D300
> + =A0 =A0dd if=3D${S}/images/5_2.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin se=
ek=3D1448 count=3D300
> + =A0 =A0dd if=3D${S}/images/5_3.bin of=3D${DEPLOY_DIR_IMAGE}/boot.bin se=
ek=3D1748 count=3D300
> + =A0 =A0dd if=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin of=3D${DEPLOY_=
DIR_IMAGE}/boot.bin seek=3D2048 count=3D8192
> + =A0 =A0dd if=3D${DEPLOY_DIR_IMAGE}/zImage-${MACHINE}.bin of=3D${DEPLOY_=
DIR_IMAGE}/boot.bin seek=3D10240 count=3D8192
> + =A0 =A0package_stagefile_shell ${DEPLOY_DIR_IMAGE}/boot.bin
> +}
> diff --git a/recipes/bootstream-falconwing/fix-oe-build.patch b/recipes/b=
ootstream-falconwing/fix-oe-build.patch
> new file mode 100644
> index 0000000..c06756d
> --- /dev/null
> +++ b/recipes/bootstream-falconwing/fix-oe-build.patch
> @@ -0,0 +1,405 @@
> +diff -ur bootstream-1.0-stock/Makefile bootstream-1.0/Makefile
> +--- bootstream-1.0-stock/Makefile =A0 =A0 =A02010-08-18 13:43:44.3866374=
00 -0700
> ++++ bootstream-1.0/Makefile =A0 =A02010-08-18 13:43:27.870626729 -0700
> +@@ -1,64 +1,16 @@
> + # $Id: Makefile 7554 2009-04-30 19:44:17Z scross $
> + # source build makefile for bootstream bootloader
> +
> +-include ../config/config.mk
> ++CFLAGS +=3D -DCHUMBY_CONFIGNAME=3D\"falconwing\" -DCHUMBY_CONFIGNAME_fa=
lconwing
> +
> +-ELFTOSB2_DIR=3Delftosb2
> +-ELFTOSB2_BINARIES=3Delftosb2
> +-ELFTOSB2_SRC_BINARIES=3D$(addprefix $(ELFTOSB2_DIR)/,$(ELFTOSB2_BINARIE=
S))
> +-ELFTOSB2_SOURCES=3D$(wildcard $(ELFTOSB2_DIR)/*.c $(ELFTOSB2_DIR)/*.h)
> +-
> +-SRC_BINARIES=3D$(ELFTOSB2_SRC_BINARIES)
> +-HOST_BINARIES=3D$(ELFTOSB2_BINARIES)
> +-
> +-CFLAGS +=3D -DCHUMBY_CONFIGNAME=3D\"$(CONFIGNAME)\" -DCHUMBY_CONFIGNAME=
_$(CONFIGNAME)
> +-
> +-all: $(SRC_BINARIES) $(HOST_BINARIES) \
> +- =A0 =A0 =A0chumby_factory/chumby_factory chumby_stub/chumby_stub chumb=
y_boot/chumby_boot
> +-
> +-
> +-install: $(SRC_BINARIES) $(HOST_BINARIES) \
> +- =A0 =A0 =A0.src_binaries .chumby-boot .factory-image .chumby-stub
> +- =A0 =A0#.u-boot-image
> +-
> +-chumby_boot/chumby_boot:
> +- =A0 =A0 =A0$(MAKE) -C chumby_boot CROSS_COMPILE=3D$(TARGET)- LINUX_DIR=
=3D$(LINUX_DIR)
> +-
> +-chumby_stub/chumby_stub:
> +- =A0 =A0 =A0$(MAKE) -C chumby_stub CROSS_COMPILE=3D$(TARGET)- LINUX_DIR=
=3D$(LINUX_DIR)
> +-
> +-chumby_factory/chumby_factory:
> +- =A0 =A0 =A0$(MAKE) -C chumby_factory CROSS_COMPILE=3D$(TARGET)- LINUX_=
DIR=3D$(LINUX_DIR)
> +-
> +-
> +-.factory-image: $(SRC_BINARIES)
> +- =A0 =A0 =A0elftosb2/elftosb2 -z -c ../config/falconwing_factory_sb.db =
\
> +- =A0 =A0 =A0 =A0 =A0 =A0-o $(INSTALL_DIR)/bootstream-factory.bin
> +-
> +-.chumby-boot: $(SRC_BINARIES)
> +- =A0 =A0 =A0cp images/chumby_boot.rom $(INSTALL_DIR)/chumby_boot.bin
> +-
> +-.chumby-stub: $(SRC_BINARIES)
> +- =A0 =A0 =A0elftosb2/elftosb2 -c ../config/falconwing_chumby_sb.db \
> +- =A0 =A0 =A0 =A0 =A0 =A0-o $(INSTALL_DIR)/bootstream-chumby.bin
> +-
> +-.u-boot-image: $(SRC_BINARIES)
> +- =A0 =A0 =A0elftosb2/elftosb2 -c ../config/falconwing_uboot_sb.db \
> +- =A0 =A0 =A0 =A0 =A0 =A0-o $(INSTALL_DIR)/falconwing_uboot.sb
> +-
> +-
> +-.src_binaries:
> +- =A0 =A0 =A0@echo "Copying src bianries"
> +- =A0 =A0 =A0mkdir -p $(INSTALL_DIR)/host
> +- =A0 =A0 =A0cp --preserve --no-dereference $(SRC_BINARIES) $(INSTALL_DI=
R)/host/
> ++all:
> ++ =A0 =A0 =A0$(MAKE) -C chumby_factory
> ++ =A0 =A0 =A0$(MAKE) -C chumby_stub
> ++ =A0 =A0 =A0$(MAKE) -C chumby_boot
> ++ =A0 =A0 =A0gcc config_util.cpp -o config_util -lstdc++
> +
> + clean:
> +- =A0 =A0 =A0-rm -f $(HOST_BINARIES) $(SRC_BINARIES)
> +- =A0 =A0 =A0$(MAKE) -C $(ELFTOSB2_DIR) clean
> +-
> +-$(ELFTOSB2_SRC_BINARIES):
> +- =A0 =A0 =A0$(MAKE) -C $(ELFTOSB2_DIR)
> +-
> +-../output/$(TARGET)-$(CNPLATFORM):
> +- =A0 =A0 =A0@echo "Creating directory: $@"
> +- =A0 =A0 =A0-mkdir -p $@
> ++ =A0 =A0 =A0$(MAKE) -C chumby_factory clean
> ++ =A0 =A0 =A0$(MAKE) -C chumby_stub clean
> ++ =A0 =A0 =A0$(MAKE) -C chumby_boot clean
> ++ =A0 =A0 =A0rm -f config_util
> +diff -ur bootstream-1.0-stock/chumby_boot/Makefile bootstream-1.0/chumby=
_boot/Makefile
> +--- bootstream-1.0-stock/chumby_boot/Makefile =A02010-08-18 13:43:44.386=
637400 -0700
> ++++ bootstream-1.0/chumby_boot/Makefile =A0 =A0 =A0 =A02010-08-18 13:43:=
27.874670886 -0700
> +@@ -7,24 +7,14 @@
> + # Linker script
> + BASE_ADDR =A0 =A0 ?=3D 0x00002000
> + BOOT_LAYOUT_IN =A0 =A0 =A0 =A0=3D $(SRCDIR)/chumby_boot.ld.in
> +-BOOT_LAYOUT_OUT =A0 =A0 =A0 =3D $(OUTPUTDIR)/chumby_boot.ld
> ++BOOT_LAYOUT_OUT =A0 =A0=3D ../output/chumby_boot.ld
> +
> +
> + # Output ELF image
> +-CHUMBY_BOOT =A0 =3D $(OUTPUTDIR)/../../images/chumby_boot
> ++CHUMBY_BOOT =A0 =A0=3D ../output/chumby_boot
> +
> + # Output binary image
> +-CHUMBY_BOOT_ROM =A0 =A0 =A0 =3D $(OUTPUTDIR)/../../images/chumby_boot.r=
om
> +-
> +-CROSS_COMPILE ?=3D arm-linux-
> +-
> +-AS =A0 =A0=3D $(CROSS_COMPILE)as
> +-CC =A0 =A0=3D $(CROSS_COMPILE)gcc
> +-LD =A0 =A0=3D $(CROSS_COMPILE)ld
> +-CPP =A0 =3D $(CROSS_COMPILE)cpp
> +-STRIP =3D $(CROSS_COMPILE)strip
> +-OBJCOPY =A0 =A0 =A0 =3D $(CROSS_COMPILE)objcopy
> +-OBJDUMP =A0 =A0 =A0 =3D $(CROSS_COMPILE)objdump
> ++CHUMBY_BOOT_ROM =A0 =A0=3D ../output/chumby_boot.rom
> +
> + LIBGCCDIR =3D $(dir $(shell $(CC) -print-libgcc-file-name))
> + CFLAGS =A0 =A0 =A0 =A0=3D -Wall -I$(INCLUDEDIR) -I$(LINUX_DIR)/include =
-fno-builtin -O0 -nostdinc
> +@@ -91,5 +81,5 @@
> + =A0 =A0 =A0 @nm -n $@ > $@.map
> +
> + $(BOOT_LAYOUT_OUT): $(BOOT_LAYOUT_IN)
> +- =A0 =A0 =A0$(CPP) -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
> ++ =A0 =A0 =A0cpp -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
> +
> +diff -ur bootstream-1.0-stock/chumby_boot/src/serial.c bootstream-1.0/ch=
umby_boot/src/serial.c
> +--- bootstream-1.0-stock/chumby_boot/src/serial.c =A0 =A0 =A02010-08-18 =
13:43:44.386637400 -0700
> ++++ bootstream-1.0/chumby_boot/src/serial.c =A0 =A02010-08-18 13:43:27.8=
74670886 -0700
> +@@ -171,10 +171,10 @@
> + =A0 =A0 return data;
> + }
> +
> +-static char hex[] =3D "0123456789abcdef";
> +
> + void serial_puthex(u32 c) {
> + =A0 =A0 int i;
> ++ =A0 =A0char hex[] =3D "0123456789abcdef";
> + =A0 =A0 serial_puts("0x");
> + =A0 =A0 for(i=3D7; i>=3D0; i--)
> + =A0 =A0 =A0 =A0 serial_putc(hex[(c>>(4*i))&0x0f]);
> +diff -ur bootstream-1.0-stock/chumby_boot/src/shell.c bootstream-1.0/chu=
mby_boot/src/shell.c
> +--- bootstream-1.0-stock/chumby_boot/src/shell.c =A0 =A0 =A0 2010-08-18 =
13:43:44.386637400 -0700
> ++++ bootstream-1.0/chumby_boot/src/shell.c =A0 =A0 2010-08-18 15:12:45.1=
38607841 -0700
> +@@ -48,8 +48,8 @@
> + =A0 =A0 "shell\n"
> +
> + =A0 =A0 // Run the watchdogtimer, set to reboot the device in 20 second=
s.
> +- =A0 =A0"regutil -w HW_RTC_WATCHDOG 0x00004e20\n"
> +- =A0 =A0"regutil -w HW_RTC_CTRL_SET 0x00000010\n"
> ++ =A0 =A0//"regutil -w HW_RTC_WATCHDOG 0x00004e20\n"
> ++ =A0 =A0//"regutil -w HW_RTC_CTRL_SET 0x00000010\n"
> +
> + =A0 =A0 // Prioritize screen DMA over other DMA. =A0This fixes video te=
aring issues.
> + =A0 =A0 // Priority is: AXI0, AHB2, AHB1, AHB3
> +@@ -84,7 +84,7 @@
> +
> + =A0 =A0 // Set up the Linux tags, pass the command-line arguments, and =
run the
> + =A0 =A0 // Linux kernel, located at address 0x40008000.
> +- =A0 =A0"linux 0x40008000 \"console=3DttyAM0,115200 init=3D/linuxrc roo=
t=3D/dev/mmcblk0p2 rootfstype=3Dext3 ro rootwait chumbyrev=3D** ssp1=3Dmmc =
sysrq_always_enabled logo.brand=3D" BRAND_PLACEHOLDER "\"\n",
> ++ =A0 =A0"linux 0x40008000 \"console=3DttyAM0,115200 root=3D/dev/mmcblk0=
p2 rw rootwait chumbyrev=3D** ssp1=3Dmmc sysrq_always_enabled logo.brand=3D=
" BRAND_PLACEHOLDER "\"\n",
> +
> + ////////////////////////////////////////////////
> +
> +@@ -97,7 +97,7 @@
> +
> + =A0 =A0 // Set up the Linux tags, pass the command-line arguments, and =
run the
> + =A0 =A0 // Linux kernel, located at address 0x40008000.
> +- =A0 =A0"linux 0x40008000 \"console=3DttyAM0,115200 init=3D/linuxrc roo=
t=3D/dev/mmcblk0p2 rootfstype=3Dext3 ro rootwait chumbyrev=3D** ssp1=3Dmmc =
sysrq_always_enabled partition=3Drecovery logo.brand=3D" BRAND_PLACEHOLDER =
"\"\n",
> ++ =A0 =A0"linux 0x40008000 \"console=3DttyAM0,115200 root=3D/dev/mmcblk0=
p2 rw rootwait chumbyrev=3D** ssp1=3Dmmc sysrq_always_enabled partition=3Dr=
ecovery logo.brand=3D" BRAND_PLACEHOLDER "\"\n",
> +
> + ////////////////////////////////////////////////
> +
> +@@ -350,8 +350,8 @@
> + }
> +
> + char **shell_line_to_argv(int argc, char *line) {
> +- =A0 =A0static char *argv[80];
> + =A0 =A0 int i;
> ++ =A0 =A0 =A0static char *argv[10];
> + =A0 =A0 for(i=3D0; i<=3Dargc; i++) {
> + =A0 =A0 =A0 =A0 argv[i] =3D line;
> + =A0 =A0 =A0 =A0 while(*line)
> +diff -ur bootstream-1.0-stock/chumby_boot/src/shell_funcs.c bootstream-1=
.0/chumby_boot/src/shell_funcs.c
> +--- bootstream-1.0-stock/chumby_boot/src/shell_funcs.c 2010-08-18 13:43:=
44.386637400 -0700
> ++++ bootstream-1.0/chumby_boot/src/shell_funcs.c =A0 =A0 =A0 2010-08-18 =
15:11:45.984011892 -0700
> +@@ -42,6 +42,7 @@
> +
> + =A0 =A0 =A0 value =3D eeprom_read(addr, reg);
> + =A0 =A0 =A0 STR("Value: "), HEX(value), STR("\n");
> ++ =A0 =A0 =A0return 0;
> + }
> +
> +
> +@@ -244,7 +245,7 @@
> +
> +
> +
> +-static int sd_initted =3D 0;
> ++int sd_initted;
> + char *sd_pmem;
> +
> + static int my_sd_stop() {
> +@@ -256,27 +257,28 @@
> +
> +
> + static int my_sd_init() {
> +- =A0 =A0static rom_BootInit_t init;// =3D (rom_BootInit_t *)0x40A10000;
> ++ =A0 =A0rom_BootInit_t init;
> ++
> + =A0 =A0 if(sd_initted) {
> + =A0 =A0 =A0 =A0 int result;
> + =A0 =A0 =A0 =A0 result =3D my_sd_stop();
> + =A0 =A0 =A0 =A0 if(result) {
> +- =A0 =A0 =A0 =A0 =A0 =A0STR("Error! =A0Couldn't reset SD.\n");
> +- =A0 =A0 =A0 =A0 =A0 =A0return 0;
> ++ =A0 =A0 =A0 =A0 =A0 =A0STR("Error! =A0Couldn't reset SD: "), HEX(resul=
t), STR("\n");
> ++ =A0 =A0 =A0 =A0 =A0 =A0return 1;
> + =A0 =A0 =A0 =A0 }
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sd_initted =3D 0;
> + =A0 =A0 }
> ++
> + =A0 =A0 if(!sd_initted) {
> + =A0 =A0 =A0 =A0 int result;
> + =A0 =A0 =A0 =A0 mdelay(10);
> + =A0 =A0 =A0 =A0 init.size =3D PMEM_SIZE;
> +- =A0 =A0 =A0 =A0init.pMem =3D sd_pmem; =A0 // Allocated on stack in mai=
n().
> ++ =A0 =A0 =A0 =A0init.pMem =3D 16384;
> + =A0 =A0 =A0 =A0 init.mode =3D 9; =A0 =A0 =A0 =A0 // Set to SSP_PORT_1.
> + =A0 =A0 =A0 =A0 memset(sd_pmem, 0, PMEM_SIZE);
> +- =A0 =A0 =A0 =A0result =3D sd_init(&init);
> +- =A0 =A0 =A0 =A0if(!result)
> +- =A0 =A0 =A0 =A0 =A0 =A0sd_initted =3D 1;
> +- =A0 =A0 =A0 =A0else
> ++ =A0 =A0 =A0 =A0if((result =3D sd_init(&init)))
> + =A0 =A0 =A0 =A0 =A0 =A0 return result;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0sd_initted =3D 1;
> + =A0 =A0 }
> + =A0 =A0 return 0;
> + }
> +@@ -318,17 +320,18 @@
> + =A0 =A0 while(bytes > 0) {
> + =A0 =A0 =A0 =A0 int chunks_to_read, chunk;
> + =A0 =A0 =A0 =A0 int read_tries =3D 0;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0chunks_to_read =3D bytes/sizeof(chunk_t);
> +
> +
> + =A0 =A0 =A0 =A0 // Perform the read.
> +-// =A0 =A0 =A0 =A0 =A0 =A0STR("Going to try to read "), INT(chunks_to_r=
ead), STR(" chunks\n");
> ++// =A0 =A0 =A0 =A0STR("Going to try to read "), INT(chunks_to_read), ST=
R(" chunks\n");
> + =A0 =A0 =A0 =A0 while(read_tries < 1000) {
> + =A0 =A0 =A0 =A0 =A0 =A0 read_tries++;
> + =A0 =A0 =A0 =A0 =A0 =A0 chunks_to_read =3D bytes/sizeof(chunk_t);
> + =A0 =A0 =A0 =A0 =A0 =A0 chunks =3D sd_next(&chunks_to_read);
> + =A0 =A0 =A0 =A0 =A0 =A0 if(!chunks_to_read) {
> +-// =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0STR("Read 0 chunks. =A0Trying=
 again...\n");
> +-// =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mdelay(1000*read_tries); =A0/=
/ XXX need to tune this!
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0STR("Read 0 chunks. =A0Trying again...\=
n");
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mdelay(10*read_tries); =A0// XXX need t=
o tune this!
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 else
> +@@ -339,15 +342,15 @@
> + =A0 =A0 =A0 =A0 =A0 =A0 STR(" =A0Aborting read.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 =A0 }
> +-// =A0 =A0 =A0 =A0 =A0 =A0else if(read_tries)
> +-// =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0STR("Delayed "), INT(read_tries), STR=
(" times.\n");
> ++// =A0 =A0 =A0 =A0else if(read_tries)
> ++// =A0 =A0 =A0 =A0 =A0 =A0STR("Delayed "), INT(read_tries), STR(" times=
.\n");
> +
> + =A0 =A0 =A0 =A0 if(chunks_to_read < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 STR("Error while reading bytes: "), HEX(chunks_=
to_read), STR("\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 =A0 }
> +-// =A0 =A0 =A0 =A0 =A0 =A0else
> +-// =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0STR("Successfully read "), INT(chunks=
_to_read), STR(" chunks.\n");
> ++// =A0 =A0 =A0 =A0else
> ++// =A0 =A0 =A0 =A0 =A0 =A0STR("Successfully read "), INT(chunks_to_read=
), STR(" chunks.\n");
> +
> + =A0 =A0 =A0 =A0 // Copy over each of the chunks that was read.
> + =A0 =A0 =A0 =A0 for(chunk=3D0; chunk<chunks_to_read; chunk++) {
> +@@ -367,9 +370,13 @@
> + int sd_cfg_loaded =3D 0;
> + static int config_block_load() {
> + =A0 =A0 if(!sd_cfg_loaded) {
> +- =A0 =A0 =A0 =A0sd_cfg =3D (char *)0x45A00000;
> +- =A0 =A0 =A0 =A0if(real_load(CFG_OFFSET, (char *)sd_cfg, sizeof(struct =
config_area)))
> +- =A0 =A0 =A0 =A0 =A0 =A0return 0;
> ++ =A0 =A0 =A0 =A0sd_cfg =3D (struct config_area *)0x45A00000;
> ++ =A0 =A0 =A0 =A0if(real_load(CFG_OFFSET, (char *)sd_cfg, sizeof(struct =
config_area))) {
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0STR("real_load() returned a=
n error.\n");
> ++ =A0 =A0 =A0 =A0 =A0 =A0return 1;
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0//STR("Dump of config area:\n");
> ++ =A0 =A0 =A0 =A0 =A0 =A0 =A0//HEXDUMP((unsigned char *)sd_cfg, sizeof(s=
truct config_area));
> + =A0 =A0 =A0 =A0 sd_cfg_loaded =3D 1;
> + =A0 =A0 }
> + =A0 =A0 return !sd_cfg_loaded;
> +@@ -773,14 +780,14 @@
> + =A0 =A0 return 0;
> + }
> +
> +-static char hex[] =3D "0123456789abcdef";
> +
> + // str must be at least 11 bytes long
> + void str_puthex(u32 c, char *str) {
> +- =A0int i, j;
> ++ =A0 =A0int i, j;
> ++ =A0 =A0char hex[] =3D "0123456789abcdef";
> + =A0 =A0 str[0] =3D '0'; str[1] =3D 'x';
> + =A0 =A0 for(i=3D7, j =3D 0; i>=3D0; i--, j++)
> +- =A0 =A0 =A0str[2+j] =3D hex[(c>>(4*i))&0x0f];
> ++ =A0 =A0 =A0 =A0str[2+j] =3D hex[(c>>(4*i))&0x0f];
> +
> + =A0 =A0 str[10] =3D '\n';
> + =A0 =A0 str[11] =3D '\0';
> +@@ -1058,6 +1065,7 @@
> +
> + struct shell_command *shell_funcs_init() {
> + =A0 =A0 struct shell_command *cmd_fixup =3D cmds;
> ++ =A0 =A0 =A0sd_initted =3D 0;
> +
> + =A0 =A0 // Fixup the cmd array by adding the base_address value to each=
 pointer.
> + =A0 =A0 while(cmd_fixup->name) {
> +diff -ur bootstream-1.0-stock/chumby_factory/Makefile bootstream-1.0/chu=
mby_factory/Makefile
> +--- bootstream-1.0-stock/chumby_factory/Makefile =A0 =A0 =A0 2010-08-18 =
13:43:44.386637400 -0700
> ++++ bootstream-1.0/chumby_factory/Makefile =A0 =A0 2010-08-18 13:43:27.8=
74670886 -0700
> +@@ -1,30 +1,20 @@
> + CURRENTDIR =A0 =A0=3D .
> + SRCDIR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D $(CURRENTDIR)/src
> +-OUTPUTDIR =A0 =A0 =3D $(CURRENTDIR)/output
> ++OUTPUTDIR =A0 =A0 =3D ../output
> +
> + INCLUDEDIR =A0 =A0=3D $(CURRENTDIR)/include
> +
> + # Linker script
> + BASE_ADDR =A0 =A0 ?=3D 0x00002000
> + BOOT_LAYOUT_IN =A0 =A0 =A0 =A0=3D $(SRCDIR)/chumby_factory.ld.in
> +-BOOT_LAYOUT_OUT =A0 =A0 =A0 =3D $(OUTPUTDIR)/chumby_factory.ld
> ++BOOT_LAYOUT_OUT =A0 =A0 =A0 =3D ../output/chumby_factory.ld
> +
> +
> + # Output ELF image
> +-CHUMBY_FACTORY =A0 =A0 =A0 =A0=3D $(OUTPUTDIR)/../../images/chumby_fact=
ory
> ++CHUMBY_FACTORY =A0 =A0 =A0 =A0=3D ../output/chumby_factory
> +
> + # Output binary image
> +-CHUMBY_FACTORY_ROM =A0 =A0=3D $(OUTPUTDIR)/../../images/chumby_factory.=
rom
> +-
> +-CROSS_COMPILE ?=3D arm-linux-
> +-
> +-AS =A0 =A0=3D $(CROSS_COMPILE)as
> +-CC =A0 =A0=3D $(CROSS_COMPILE)gcc
> +-LD =A0 =A0=3D $(CROSS_COMPILE)ld
> +-CPP =A0 =3D $(CROSS_COMPILE)cpp
> +-STRIP =3D $(CROSS_COMPILE)strip
> +-OBJCOPY =A0 =A0 =A0 =3D $(CROSS_COMPILE)objcopy
> +-OBJDUMP =A0 =A0 =A0 =3D $(CROSS_COMPILE)objdump
> ++CHUMBY_FACTORY_ROM =A0 =A0=3D ../output/chumby_factory.rom
> +
> + LIBGCCDIR =3D $(dir $(shell $(CC) -print-libgcc-file-name))
> + CFLAGS =A0 =A0 =A0 =A0=3D -Wall -I$(INCLUDEDIR) -I$(LINUX_DIR)/include =
-nostdinc -fno-builtin -O
> +@@ -90,5 +80,5 @@
> + =A0 =A0 =A0 @nm -n $@ > $@.map
> +
> + $(BOOT_LAYOUT_OUT): $(BOOT_LAYOUT_IN)
> +- =A0 =A0 =A0$(CPP) -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
> ++ =A0 =A0 =A0cpp -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
> +
> +diff -ur bootstream-1.0-stock/chumby_stub/Makefile bootstream-1.0/chumby=
_stub/Makefile
> +--- bootstream-1.0-stock/chumby_stub/Makefile =A02010-08-18 13:43:44.386=
637400 -0700
> ++++ bootstream-1.0/chumby_stub/Makefile =A0 =A0 =A0 =A02010-08-18 13:43:=
27.874670886 -0700
> +@@ -1,30 +1,20 @@
> + CURRENTDIR =A0 =A0=3D .
> + SRCDIR =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D $(CURRENTDIR)/src
> +-OUTPUTDIR =A0 =A0 =3D $(CURRENTDIR)/output
> ++OUTPUTDIR =A0 =A0 =3D ../output
> +
> + INCLUDEDIR =A0 =A0=3D $(CURRENTDIR)/include
> +
> + # Linker script
> + BASE_ADDR =A0 =A0 ?=3D 0x00002000
> + BOOT_LAYOUT_IN =A0 =A0 =A0 =A0=3D $(SRCDIR)/chumby_stub.ld.in
> +-BOOT_LAYOUT_OUT =A0 =A0 =A0 =3D $(OUTPUTDIR)/chumby_stub.ld
> ++BOOT_LAYOUT_OUT =A0 =A0 =A0 =3D ../output/chumby_stub.ld
> +
> +
> + # Output ELF image
> +-CHUMBY_STUB =A0 =3D $(OUTPUTDIR)/../../images/chumby_stub
> ++CHUMBY_STUB =A0 =3D ../images/chumby_stub
> +
> + # Output binary image
> +-CHUMBY_STUB_ROM =A0 =A0 =A0 =3D $(OUTPUTDIR)/../../images/chumby_stub.r=
om
> +-
> +-CROSS_COMPILE ?=3D arm-linux-
> +-
> +-AS =A0 =A0=3D $(CROSS_COMPILE)as
> +-CC =A0 =A0=3D $(CROSS_COMPILE)gcc
> +-LD =A0 =A0=3D $(CROSS_COMPILE)ld
> +-CPP =A0 =3D $(CROSS_COMPILE)cpp
> +-STRIP =3D $(CROSS_COMPILE)strip
> +-OBJCOPY =A0 =A0 =A0 =3D $(CROSS_COMPILE)objcopy
> +-OBJDUMP =A0 =A0 =A0 =3D $(CROSS_COMPILE)objdump
> ++CHUMBY_STUB_ROM =A0 =A0 =A0 =3D ../images/chumby_stub.rom
> +
> + LIBGCCDIR =3D $(dir $(shell $(CC) -print-libgcc-file-name))
> + CFLAGS =A0 =A0 =A0 =A0=3D -Wall -I$(INCLUDEDIR) -I$(LINUX_DIR)/include =
-nostdinc -fno-builtin -Os
> +@@ -90,5 +80,5 @@
> + =A0 =A0 =A0 @nm -n $@ > $@.map
> +
> + $(BOOT_LAYOUT_OUT): $(BOOT_LAYOUT_IN)
> +- =A0 =A0 =A0$(CPP) -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
> ++ =A0 =A0 =A0cpp -P -DBASE_ADDR=3D$(BASE_ADDR) -o $@ $<
> +
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


