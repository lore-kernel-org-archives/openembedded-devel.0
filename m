Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 618D8767FC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 22:05:22 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so39388520pdr.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=yL7f9QdOHKJ8TtUVKtYEDJNbE+B1/xHw+VJci1ZYpFA=;
	b=VTIveLcNqkOiHbJ0Scr7futqrESXW40Nq+oc0DsjR/ax24YwThjtOjxQDl+xowyQrT
	b4AJtTYMCMJIWdm/g9FLhkQDh0fyNS/TeI0u0hckFxXrOwD3mh6mz04DGfKTQoME073F
	/KYdC7MehteVla8PUzqxfWTCrJh8hEUpOC79d4ofXkYMZ659ZnLyYQ8pZ8G5m53/njej
	cZTvwkxrMX36f2GkaDeLqRglHLdr+9+O0Ndh6JtEJ5/mraSXXNwKDkq0x4rsj5WGTW15
	3k2TJm9vn2/OHrvAui6vJZ/aVFX2QjoUysx7Fiy02IgSr2h14pn8ASfvgAST/WfcNxnZ
	Ja8Q==
X-Received: by 10.70.126.100 with SMTP id mx4mr29426511pdb.153.1439071522913; 
	Sat, 08 Aug 2015 15:05:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	bh3sm14558527pbb.59.2015.08.08.15.05.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 15:05:22 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55B8F8C2.5090008@epfl.ch>
Date: Sat, 8 Aug 2015 15:05:17 -0700
Message-Id: <AFA43883-1E0D-4402-B445-87CD6C32F345@gmail.com>
References: <55B8F4CA.1080603@epfl.ch> <55B8F8C2.5090008@epfl.ch>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [OpenEmbedded] [Arago] - "kernel-devicetree" Cannot build Runtime dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Aug 2015 22:05:24 -0000
X-Groupsio-MsgNum: 56607
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CC1FAC63-9FF0-47D2-BEC2-080866348506";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CC1FAC63-9FF0-47D2-BEC2-080866348506
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 29, 2015, at 9:01 AM, Roosemberth Palacios =
<roosembert.palacios@epfl.ch> wrote:
>=20
> Signed PGP part
> Hello, I'm working on a custom image for ti's am335x chip. Still, I
> try to build my image, but at the end I get
>=20
> [...]
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following
> dependencies for domosafety-userspace-1.0:
> |  *    kernel-devicetree *     kernel-devicetree *
> |  * opkg_install_cmd: Cannot install package =
domosafety-userspace-1.0.
> [=E2=80=A6]


most probably your kernel-devicetree package is turning out to be empty =
and eventually deleted since its empty
Can you check in deploy/ directory for something like =
*kernel-devicetree*
>=20

> I'm using a custom kernel which was provided by the hardware
> manufacturer. I was able to build {MACHINE=3D"CBoxNAND.conf" bitbake
> custom-base-image} (from TI's Sitiara Linux Training:
> =
http://processors.wiki.ti.com/index.php/Sitara_Linux_Training:_Getting_Sta=
rted_with_Openembedded)
>=20
> Then, we just replaced the kernel source by the hw manufacturer's one
> (note the .tar as the kernel source). Device tree is in the good place
> in the kernel sources (arch/arm/boot/dts/cbox-NAND.dt{s,b}). But still
> I can't manage to build. I had to copy paste the "linux-dtb.inc" at
> the end of the recipe as it wasn't getting loaded (why?). And I
> changed from do_install_append to do_compile_kernelmodules_append in
> order that code to run.
>=20
> build command:
> MACHINE=3D"CBoxNAND" bitbake core-image-domosafety -DDD | tee
> /tmp/logCBoxNAND.core-image-domosafety
>=20
> The complete log file is at: http://www.pasteall.org/59962
>=20
> I'll leave down here part of important files.
>=20
>=20
> Best Regards!
> Roosembert Palacios
>=20
> ---------- "conf/machine/CBoxNAND.conf"
>=20
> #@TYPE: Machine
> #@NAME: AM335x EVM
> #@DESCRIPTION: Machine configuration for Domosafety's CBox NAND =
Storage
>=20
> require conf/machine/include/ti33x.inc
>=20
> XSERVER =3D ""
> GUI_MACHINE_CLASS =3D ""
> MACHINE_FEATURES =3D "kernel26 apm usbhost vfat ext2 ethernet"
> IMAGE_FEATURES +=3D "package-management"
>=20
> IMAGE_FSTYPES +=3D "ubi tar.gz"
>=20
> SERIAL_CONSOLE =3D "115200 ttyO0"
> MKUBIFS_ARGS =3D "-F -m 2048 -e 131072 -c 3836"
> UBINIZE_ARGS =3D "-m 2048 -p 128KiB -s 512 -O 2048"
>=20
> PREFERRED_VERSION_linux-libc-headers_CBoxNAND =3D "3.2"
> PREFERRED_PROVIDER_virtual/kernel_CBoxNAND =3D "linux-domosafety"
> PREFERRED_PROVIDER_virtual/bootloader_CBoxNAND =3D "u-boot-domosafety"
> PREFERRED_PROVIDER_virtual/uenv_CBoxNAND =3D "uenv-domosafety-nand"
> PREFERRED_PROVIDER_kernel_CBoxNAND =3D "linux-domosafety"
> PREFERRED_PROVIDER_u-boot_CBoxNAND =3D "u-boot-domosafety"
>=20
> PREFERRED_PROVIDER_ltp-ddt_CBoxNAND =3D "ltp-ddt-legacy"
> PREFERRED_PROVIDER_virtual/gettext =3D "gettext"
>=20
> RDEPENDS_kernel-base +=3D "kernel-devicetree"
> KERNEL_IMAGETYPE =3D "uImage"
> UBOOT_MACHINE=3D"zigBeeBox_secured_config"
>=20
>=20
> ---------- "recipes-core/images/core-image-domosafety_1.0.bb"
> DESCRIPTION =3D "DomoSafety Image"
> export IMAGE_BASENAME =3D "core-image-domosafety"
>=20
> # IMAGE_INSTALL +=3D "domosafety-BareImage"
> IMAGE_INSTALL =3D "domosafety-userspace-1.0 packagegroup-core-boot
> ${ROOTFS_PKGMANAGE_BOOTSTRAP} ${CORE_IMAGE_EXTRA_INSTALL}"
> IMAGE_LINGUAS =3D " "
> LICENSE =3D "MIT"
>=20
> IMAGE_ROOTFS_SIZE =3D "524288"
> IMAGE_FEATURES +=3D " ssh-server-openssh package-management "
>=20
> inherit core-image
>=20
>=20
> ---------- "linux-domosafety_3.13.43.bb" ----------------
>=20
> LICENSE =3D "GPLv2"
> KERNEL_IMAGETYPE =3D "uImage"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
> COMPATIBLE_MACHINE =3D "CBoxNAND"
> KERNEL_DEVICETREE =3D "cbox-NAND.dts"
>=20
> DEFAULT_PREFERENCE =3D "1"
>=20
> inherit kernel
> # TI's
> require recipes-kernel/linux/setup-defconfig.inc
>=20
> # Pull in the devicetree files into the rootfs
> RDEPENDS_kernel-base +=3D "kernel-devicetree"
> IMAGE_INSTALL_append =3D " kernel-image "
> INITRAMFS_IMAGE =3D "initramfs-cbox-normal"
>=20
> # Add a run-time dependency for the PM firmware to be installed on the
> target file system.
> RDEPENDS_kernel-base_append_CBoxNAND =3D " am33x-cm3"
>=20
> # Default is to package all dtb files for ti33x devices unless
> building for the specific beaglebone machine.
> KERNEL_DEVICETREE_CBoxNAND =3D "cbox-NAND.dts "
>=20
> S =3D "${WORKDIR}/linux-${PV}-am335x"
> B =3D "${S}"
>=20
> PR =3D "devel6"
> MACHINE_KERNEL_PR_append =3D "r+${PR}"
>=20
> EXTRA_OEMAKE_append +=3D " LOADADDR=3D${UBOOT_ENTRYPOINT} "
>=20
> SRC_URI =3D " \
>         file://${PN}_${PV}/am335x-pm-firmware.bin;name=3Dpm-firmware \
>         file://${PN}_${PV}/cbox-domosafety.defconfig;name=3Dkconfig \
>         file://${PN}_${PV}/linux-${PV}-am335x.tar;name=3Dkernel \
> "
>=20
> SRC_URI[kernel.md5sum] =3D "3d5b4539183a0f4c7634ff728ec61707"
> SRC_URI[pm-firmware.md5sum] =3D "c571cf09f994d5fd8750338618cafa0b"
> SRC_URI[kconfig.md5sum] =3D "22be214b4fd6ffa8d2da6a4b895d722a"
>=20
> do_fetch_append() {
> os.system("cp ${WORKDIR}/${PN}_${PV}/am335x-pm-firmware.bin ${S}/
> 2>>${WORKDIR}/Failure ")
> os.system("cp ${WORKDIR}/${PN}_${PV}/cbox-domosafety.defconfig
> ${WORKDIR}/defconfig 2>>${WORKDIR}/Failure ")
> os.system("tree $(WORKDIR) -L 3 &>>${WORKDIR}/Failure")
> }
>=20
> do_configure_append() {
>     cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.lzma"
> ${S}/initramfs.cpio.lzma
> }
>=20
> pkg_postinst_kernel-image() {
> if [ "x$D" =3D "x" ]; then
>     /usr/sbin/flash_erase /dev/mtd2 0 0
>     /bin/dd if=3D/boot/uImage of=3D/dev/mtd2 bs=3D131072 conv=3Dsync
> fi
> update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
> ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> ${KERNEL_PRIORITY} || true
> if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>         mkdir -p $D/lib/modules/${KERNEL_VERSION}
> fi
> if [ -n "$D" ]; then
>         depmodwrapper -a -b $D ${KERNEL_VERSION}
> else
>         depmod -a ${KERNEL_VERSION}
> fi
> }
>=20
> pkg_postrm_kernel-image () {
>         update-alternatives --remove ${KERNEL_IMAGETYPE}
> ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
> }
>=20
> pkg_postinst_kernel-devicetree() {
> cd /${KERNEL_IMAGEDEST}; update-alternatives --install
> /${KERNEL_IMAGEDEST}/${MACHINE}.dtb devicetree
> devicetree-uImage-cbox-NAND.dtb ${KERNEL_PRIORITY} || true
> if [ "x$D" =3D "x" ]; then
>     /usr/sbin/flash_erase /dev/mtd1 0 0
>     /bin/dd if=3D/boot/devicetree-uImage-cbox-NAND.dtb of=3D/dev/mtd1
> bs=3D131072 conv=3Dsync
> fi
> }
>=20
> pkg_postrm_kernel-devicetree() {
> cd /${KERNEL_IMAGEDEST}; update-alternatives --remove devicetree
> devicetree-${KERNEL_VERSION} || true
> }
>=20
> # Support for device tree generation
> FILES_kernel-devicetree =3D "/boot/devicetree*"
> KERNEL_DEVICETREE_FLAGS =3D "-R 8 -p 0x3000"
>=20
> PACKAGES +=3D " kernel-devicetree "
> DEPENDS_append =3D " dtc-native "
>=20
> #python __anonymous () {
> #    devicetree =3D d.getVar("KERNEL_DEVICETREE", True) or ''
> #    if devicetree:
> #        depends =3D d.getVar("DEPENDS", True)
> #        d.setVar("DEPENDS", "%s dtc-native" % depends)
> #        packages =3D d.getVar("PACKAGES", True)
> #}
>=20
> #pkg_preinst_kernel-image_append() {
> do_compile_kernelmodules_append(){
> #        echo "linux-dtb[ds-pkg_prinst_kernel-image_append]:
> Processing Device Trees..." > /tmp/log
>         echo "linux-dtb[ds.do_compile_kernelmodules_append]:
> Processing Device Trees..." > /tmp/log
>         if test -n "${KERNEL_DEVICETREE}"; then
>                 for DTS_FILE in ${KERNEL_DEVICETREE}; do
>                         echo "Processing ${DTS_FILE}" >> /tmp/log
>                         if [ ! -f ${DTS_FILE} ]; then
>                                 echo "Warning: ${DTS_FILE} is not
> available!"
>                                 continue
>                         fi
>                         DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F
> "." '{print $1}'`
>                         DTB_NAME=3D`echo ${KERNEL_IMAGE_BASE_NAME} | =
sed
> "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>                         DTB_SYMLINK_NAME=3D`echo
> ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>                         dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS}
> -o ${DTS_BASE_NAME} ${DTS_FILE}
>                         install -m 0644 ${DTS_BASE_NAME}
> ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
>                 done
>         fi
>         echo "linux-dtb[]: end processing Device Trees..."
> }
>=20
> -------------------------------------------------------------
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_CC1FAC63-9FF0-47D2-BEC2-080866348506
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGfSAACgkQuwUzVZGdMxS+xACeLEGPQnWQWgAm2G4XSPWAJNMm
bVMAn2UZku6qe2fvnSzoO1QrCFhOJ/iS
=Hvob
-----END PGP SIGNATURE-----

--Apple-Mail=_CC1FAC63-9FF0-47D2-BEC2-080866348506--
