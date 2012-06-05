Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SbzSB-0002yT-90
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jun 2012 21:30:07 +0200
Received: by eekd49 with SMTP id d49so2035068eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2012 12:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=zJdmmmTNSnN+FL0uoSK9QY8ubek9K2D/KBmjPIOUd5c=;
	b=DPy9Qq7LJ9JSDRgOfOX18Fsw5gPDt8TRbZilYtvMe20bwm8oHsHjuusSmfI2yTKi8A
	9wFuBDI0W+KZsSGCS+XcfIdxkAnorKwW4Z9yHjW/o5jFdEBF5mxoF5jSsaC1jo3xzmQA
	AjEPJ55tYgSOwy+R3zCjobv6+z/wZbDUk5Za58gNaJ4sud0KYij7yCmeEsr9DgEp3Kds
	dy3++f5GkERnugvItK5QbJo07UlYDm9n9sqMRy/ZfX9XXd6K7AClsk9P+Lzd21GbcXvN
	/iTcDVmiL3zZBojPfMlIR8H5JnM0thS5IN/DFFHJG/F7z1djZ+F3JYXTXtHIkHP7xCMM
	xbcQ==
Received: by 10.14.100.194 with SMTP id z42mr9279857eef.146.1338923980646;
	Tue, 05 Jun 2012 12:19:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 5 Jun 2012 12:19:10 -0700 (PDT)
In-Reply-To: <1338923388-34328-1-git-send-email-elvis.dowson@gmail.com>
References: <1338923388-34328-1-git-send-email-elvis.dowson@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Jun 2012 12:19:10 -0700
Message-ID: <CAMKF1soi=zwus43YUH68EbTLvebvO0GAcbOQy=gtSn+9fdFtrg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [poky] qemu: virtex5-ml507: Add kernel uImage loading support.
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
X-List-Received-Date: Tue, 05 Jun 2012 19:30:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 5, 2012 at 12:09 PM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> This commit adds kernel uImage loading support for the Xilinx ML507
> development board emulator.

looks ok
>
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> ---
> =C2=A0...5-ml507-add-kernel-uImage-loading-support.patch | =C2=A0 74 ++++=
++++++++++++++++
> =C2=A0meta/recipes-devtools/qemu/qemu_0.15.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A02 files changed, 76 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/qemu-virt=
ex5-ml507-add-kernel-uImage-loading-support.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-virtex5-ml507-ad=
d-kernel-uImage-loading-support.patch b/meta/recipes-devtools/qemu/qemu-0.1=
5.1/qemu-virtex5-ml507-add-kernel-uImage-loading-support.patch
> new file mode 100644
> index 0000000..6ddec7f
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu-0.15.1/qemu-virtex5-ml507-add-kerne=
l-uImage-loading-support.patch
> @@ -0,0 +1,74 @@
> +From 8ba6fc6d75b4da1b84062efdab2543df5ab93792 Mon Sep 17 00:00:00 2001
> +From: Elvis Dowson <elvis.dowson@gmail.com>
> +Date: Tue, 5 Jun 2012 20:03:14 +0200
> +Subject: [PATCH] virtex_ml507: Add support for loading kernel uImage bin=
ary.
> +
> +This commit adds support for loading a kernel uImage binary.
> +
> +Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
> +---
> + hw/virtex_ml507.c | =C2=A0 23 +++++++++++++++--------
> + 1 file changed, 15 insertions(+), 8 deletions(-)
> +
> +diff --git a/hw/virtex_ml507.c b/hw/virtex_ml507.c
> +index 7bde8c7..0a80536 100644
> +--- a/hw/virtex_ml507.c
> ++++ b/hw/virtex_ml507.c
> +@@ -43,8 +43,9 @@
> + #include "blockdev.h"
> + #include "xilinx.h"
> +
> +-#define EPAPR_MAGIC =C2=A0 =C2=A0(0x45504150)
> +-#define FLASH_SIZE =C2=A0 =C2=A0 (16 * 1024 * 1024)
> ++#define UIMAGE_LOAD_BASE 0
> ++#define EPAPR_MAGIC =C2=A0 =C2=A0 =C2=A0(0x45504150)
> ++#define FLASH_SIZE =C2=A0 =C2=A0 =C2=A0 (16 * 1024 * 1024)
> +
> + static struct boot_info
> + {
> +@@ -193,7 +194,7 @@ static void virtex_init(ram_addr_t ram_size,
> + {
> + =C2=A0 =C2=A0 DeviceState *dev;
> + =C2=A0 =C2=A0 CPUState *env;
> +- =C2=A0 =C2=A0target_phys_addr_t ram_base =3D 0;
> ++ =C2=A0 =C2=A0target_phys_addr_t loadaddr =3D UIMAGE_LOAD_BASE;
> + =C2=A0 =C2=A0 DriveInfo *dinfo;
> + =C2=A0 =C2=A0 ram_addr_t phys_ram;
> + =C2=A0 =C2=A0 ram_addr_t phys_flash;
> +@@ -213,7 +214,7 @@ static void virtex_init(ram_addr_t ram_size,
> + =C2=A0 =C2=A0 qemu_register_reset(main_cpu_reset, env);
> +
> + =C2=A0 =C2=A0 phys_ram =3D qemu_ram_alloc(NULL, "ram", ram_size);
> +- =C2=A0 =C2=A0cpu_register_physical_memory(ram_base, ram_size, phys_ram=
 | IO_MEM_RAM);
> ++ =C2=A0 =C2=A0cpu_register_physical_memory(loadaddr, ram_size, phys_ram=
 | IO_MEM_RAM);
> +
> + =C2=A0 =C2=A0 phys_flash =3D qemu_ram_alloc(NULL, "virtex.flash", FLASH=
_SIZE);
> + =C2=A0 =C2=A0 dinfo =3D drive_get(IF_PFLASH, 0, 0);
> +@@ -233,14 +234,20 @@ static void virtex_init(ram_addr_t ram_size,
> + =C2=A0 =C2=A0 /* 2 timers at irq 2 @ 62 Mhz. =C2=A0*/
> + =C2=A0 =C2=A0 xilinx_timer_create(0x83c00000, irq[3], 2, 62 * 1000000);
> +
> ++ =C2=A0 =C2=A0/* Load kernel. */
> + =C2=A0 =C2=A0 if (kernel_filename) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t entry, low, high;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_phys_addr_t boot_offset;
> +
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Boots a kernel elf binary. =C2=A0*/
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_size =3D load_elf(kernel_filename, N=
ULL, NULL,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &entry, &low, &high, 1, ELF_MACHINE, 0);
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0boot_info.bootstrap_pc =3D entry & 0x00ffff=
ff;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Boot a kernel uImage binary. */
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_size =3D load_uimage(kernel_filename=
, &entry, &loadaddr, NULL);
> ++
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we failed loading uImage, try again a=
s a kernel elf binary. =C2=A0*/
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (kernel_size < 0) {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_size =3D load_elf(kern=
el_filename, NULL, NULL,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &entry, &low, &high, 1, EL=
F_MACHINE, 0);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boot_info.bootstrap_pc =3D en=
try & 0x00ffffff;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (kernel_size < 0) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_offset =3D 0x1200000;
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_0.15.1.bb b/meta/recipes-dev=
tools/qemu/qemu_0.15.1.bb
> index bcff9f8..f659106 100644
> --- a/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_0.15.1.bb
> @@ -3,7 +3,7 @@ require qemu.inc
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D441c28d2cf86e15a37fa47e1=
5a72fbac \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://COPYING.LIB;endline=3D24;md5=3Dc04def7ae38850e7d3ef548588159913"
>
> -PR =3D "r8"
> +PR =3D "r9"
>
> =C2=A0FILESPATH =3D "${FILE_DIRNAME}/qemu-${PV}"
> =C2=A0FILESDIR =3D "${WORKDIR}"
> @@ -20,6 +20,7 @@ SRC_URI =3D "\
> =C2=A0 =C2=A0 file://arm-bgr.patch \
> =C2=A0 =C2=A0 file://a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch \
> =C2=A0 =C2=A0 file://dummy-gl-config.patch \
> + =C2=A0 =C2=A0file://qemu-virtex5-ml507-add-kernel-uImage-loading-suppor=
t.patch \
> =C2=A0 =C2=A0 "
>
> =C2=A0# Only use the GL passthrough patches for native/nativesdk versions
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


