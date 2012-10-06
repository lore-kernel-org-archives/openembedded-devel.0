Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TKZ2U-0000J7-GD
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Oct 2012 20:23:50 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so1653544wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Oct 2012 11:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=UkDLhp01vtGaQzxzlu8t93pZBH5LHS3Q7yXQ92rot5M=;
	b=e9cf1h2b3ou+pPLqUCRn0uV2djVYVHzUJeIpzeSUbKbQehsQb8MC8NLnNDCIulcFTM
	mfJUbsebyX13QKzOb2MzcnCLx9ZlHI/TOYkb1jj2dL79AkLF9/lBNwA4lkfpJYy1KbaT
	/aSGVRBetjMUIsLENT+DER6nRtKzEkSQuEYSx/TBS2f2Rbl+6iN9iOuNjkLxT3Xcr/JP
	2YK03TIPVl+8Wrg0EMGUQm35X9ICdq4wz2L5nafyKPR/YpIiqmdOZyq++qihGsU3WMcZ
	ta3kIXdKW5AUFpVYShKcncEBj7NeriEX0Hrf1J1PJqOSdJ3UTQFksCko5/3dlcKILd3B
	LZyQ==
Received: by 10.180.94.226 with SMTP id df2mr10497064wib.11.1349547046700;
	Sat, 06 Oct 2012 11:10:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.56.68 with HTTP; Sat, 6 Oct 2012 11:10:16 -0700 (PDT)
In-Reply-To: <20120926200832.GC19337@jama.jama.net>
References: <1347429815-19634-1-git-send-email-raj.khem@gmail.com>
	<20120926200832.GC19337@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Oct 2012 11:10:16 -0700
Message-ID: <CAMKF1sq-nWr7p04yh3A0P1VCLC4W_2ZVL3Rcs0cYBMThUScdsg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH V5 1/2] kernel.bbclass: Delete
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
X-List-Received-Date: Sat, 06 Oct 2012 18:23:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping^


On Wed, Sep 26, 2012 at 1:08 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Sep 11, 2012 at 11:03:34PM -0700, Khem Raj wrote:
>> Not needed anymore
>
> meta-smartphone BSPs were updated 2 months ago
> https://github.com/shr-distribution/meta-smartphone/commit/c35ec94cf7ed05=
d0d030c75325a65aa5f5c55ca7
>
> Acked-By: Martin Jansa <Martin.Jansa@gmail.com>
>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta-oe/classes/kernel.bbclass |  556 ---------------------------------=
-------
>>  1 file changed, 556 deletions(-)
>>  delete mode 100644 meta-oe/classes/kernel.bbclass
>>
>> diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbc=
lass
>> deleted file mode 100644
>> index 2bb1b5b..0000000
>> --- a/meta-oe/classes/kernel.bbclass
>> +++ /dev/null
>> @@ -1,556 +0,0 @@
>> -inherit linux-kernel-base module_strip
>> -
>> -PROVIDES +=3D "virtual/kernel"
>> -DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_=
PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
>> -
>> -# we include gcc above, we dont need virtual/libc
>> -INHIBIT_DEFAULT_DEPS =3D "1"
>> -
>> -KERNEL_IMAGETYPE ?=3D "zImage"
>> -INITRAMFS_IMAGE ?=3D ""
>> -INITRAMFS_TASK ?=3D ""
>> -
>> -python __anonymous () {
>> -    kerneltype =3D d.getVar('KERNEL_IMAGETYPE', True) or ''
>> -    if kerneltype =3D=3D 'uImage':
>> -        depends =3D d.getVar("DEPENDS", True)
>> -        depends =3D "%s u-boot-mkimage-native" % depends
>> -        d.setVar("DEPENDS", depends)
>> -
>> -    image =3D d.getVar('INITRAMFS_IMAGE', True)
>> -    if image:
>> -        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
>> -
>> -    machine_kernel_pr =3D d.getVar('MACHINE_KERNEL_PR', True)
>> -
>> -    if machine_kernel_pr:
>> -        d.setVar('PR', machine_kernel_pr)
>> -}
>> -
>> -inherit kernel-arch deploy
>> -
>> -PACKAGES_DYNAMIC +=3D "kernel-module-*"
>> -PACKAGES_DYNAMIC +=3D "kernel-image-*"
>> -PACKAGES_DYNAMIC +=3D "kernel-firmware-*"
>> -
>> -export OS =3D "${TARGET_OS}"
>> -export CROSS_COMPILE =3D "${TARGET_PREFIX}"
>> -
>> -KERNEL_PRIORITY ?=3D "${@int(d.getVar('PV',1).split('-')[0].split('+')[=
0].split('.')[0]) * 10000 + \
>> -                       int(d.getVar('PV',1).split('-')[0].split('+')[0]=
.split('.')[1]) * 100 + \
>> -                       int(d.getVar('PV',1).split('-')[0].split('+')[0]=
.split('.')[-1])}"
>> -
>> -KERNEL_RELEASE ?=3D "${KERNEL_VERSION}"
>> -
>> -KERNEL_CCSUFFIX ?=3D ""
>> -KERNEL_LDSUFFIX ?=3D ""
>> -
>> -# Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>> -# specific options necessary for building the kernel and modules.
>> -#FIXME: should be this: TARGET_CC_KERNEL_ARCH ?=3D "${TARGET_CC_ARCH}"
>> -TARGET_CC_KERNEL_ARCH ?=3D ""
>> -HOST_CC_KERNEL_ARCH ?=3D "${TARGET_CC_KERNEL_ARCH}"
>> -TARGET_LD_KERNEL_ARCH ?=3D ""
>> -HOST_LD_KERNEL_ARCH ?=3D "${TARGET_LD_KERNEL_ARCH}"
>> -
>> -KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_K=
ERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
>> -KERNEL_LD =3D "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH=
}${TOOLCHAIN_OPTIONS}"
>> -
>> -# Where built kernel lies in the kernel tree
>> -KERNEL_OUTPUT ?=3D "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
>> -KERNEL_IMAGEDEST =3D "boot"
>> -
>> -#
>> -# configuration
>> -#
>> -export CMDLINE_CONSOLE =3D "console=3D${@d.getVar("KERNEL_CONSOLE",1) o=
r "ttyS0"}"
>> -
>> -KERNEL_VERSION =3D "${@get_kernelversion('${B}')}"
>> -
>> -KERNEL_LOCALVERSION ?=3D ""
>> -
>> -# kernels are generally machine specific
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> -
>> -# U-Boot support
>> -UBOOT_ENTRYPOINT ?=3D "20008000"
>> -UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
>> -
>> -# For the kernel, we don't want the '-e MAKEFLAGS=3D' in EXTRA_OEMAKE.
>> -# We don't want to override kernel Makefile variables from the environm=
ent
>> -EXTRA_OEMAKE =3D ""
>> -
>> -KERNEL_ALT_IMAGETYPE ??=3D ""
>> -
>> -# Define where the kernel headers are installed on the target as well a=
s where
>> -# they are staged.
>> -KERNEL_SRC_PATH =3D "/usr/src/kernel"
>> -
>> -KERNEL_IMAGETYPE_FOR_MAKE =3D "${@(lambda s: s[:-3] if s[-3:] =3D=3D ".=
gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>> -
>> -kernel_do_compile() {
>> -     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> -     oe_runmake include/linux/version.h CC=3D"${KERNEL_CC}" LD=3D"${KER=
NEL_LD}"
>> -     oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC=
=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
>> -     if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" =3D "${KERNEL_IMAGETYPE}=
"; then
>> -             gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTP=
UT}"
>> -     fi
>> -}
>> -
>> -do_compile_kernelmodules() {
>> -     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> -     if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> -             oe_runmake ${PARALLEL_MAKE} modules CC=3D"${KERNEL_CC}" LD=
=3D"${KERNEL_LD}"
>> -     else
>> -             bbnote "no modules to compile"
>> -     fi
>> -}
>> -addtask compile_kernelmodules after do_compile before do_install
>> -
>> -kernel_do_install() {
>> -     #
>> -     # First install the modules
>> -     #
>> -     unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> -     if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> -             oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}" modules=
_install
>> -             rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
>> -             rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>> -             rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>> -             rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>> -     else
>> -             bbnote "no modules to install"
>> -     fi
>> -
>> -     #
>> -     # Install various kernel output (zImage, map file, config, module =
support files)
>> -     #
>> -     install -d ${D}/${KERNEL_IMAGEDEST}
>> -     install -d ${D}/boot
>> -     install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL=
_IMAGETYPE}-${KERNEL_VERSION}
>> -     install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>> -     install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>> -     install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>> -     [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/=
Module.symvers-${KERNEL_VERSION}
>> -     install -d ${D}/etc/modules-load.d
>> -     install -d ${D}/etc/modprobe.d
>> -
>> -     #
>> -     # Support for external module building - create a minimal copy of =
the
>> -     # kernel source tree.
>> -     #
>> -     kerneldir=3D${D}${KERNEL_SRC_PATH}
>> -     install -d $kerneldir
>> -
>> -     #
>> -     # Store the kernel version in sysroots for module-base.bbclass
>> -     #
>> -
>> -     echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> -
>> -     #
>> -     # Store kernel image name to allow use during image generation
>> -     #
>> -
>> -     echo "${KERNEL_IMAGE_BASE_NAME}" >$kerneldir/kernel-image-name
>> -
>> -     #
>> -     # Copy the entire source tree. In case an external build directory=
 is
>> -     # used, copy the build directory over first, then copy over the so=
urce
>> -     # dir. This ensures the original Makefiles are used and not the
>> -     # redirecting Makefiles in the build directory.
>> -     #
>> -     # work and sysroots can be on different partitions, so we can't re=
ly on
>> -     # hardlinking, unfortunately.
>> -     #
>> -     cp -fR * $kerneldir
>> -     cp .config $kerneldir
>> -     if [ "${S}" !=3D "${B}" ]; then
>> -             cp -fR ${S}/* $kerneldir
>> -     fi
>> -     install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
>> -     install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
>> -
>> -     #
>> -     # Clean and remove files not needed for building modules.
>> -     # Some distributions go through a lot more trouble to strip out
>> -     # unecessary headers, for now, we just prune the obvious bits.
>> -     #
>> -     # We don't want to leave host-arch binaries in /sysroots, so
>> -     # we clean the scripts dir while leaving the generated config
>> -     # and include files.
>> -     #
>> -     oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" c=
lean
>> -     make -C $kerneldir _mrproper_scripts
>> -     find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/to=
ols -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '=
{}' \;
>> -     find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
>> -
>> -     # As of Linux kernel version 3.0.1, the clean target removes
>> -     # arch/powerpc/lib/crtsavres.o which is present in
>> -     # KBUILD_LDFLAGS_MODULE, making it required to build external modu=
les.
>> -     if [ ${ARCH} =3D "powerpc" ]; then
>> -             cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/li=
b/crtsavres.o
>> -     fi
>> -
>> -     # Necessary for building modules like compat-wireless.
>> -     cp include/generated/bounds.h $kerneldir/include/generated/bounds.=
h
>> -
>> -     # Remove the following binaries which cause strip or arch QA error=
s
>> -     # during do_package for cross-compiled platforms
>> -     bin_files=3D"arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff=
 \
>> -                arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
>> -                scripts/kconfig/conf.o scripts/kconfig/kxgettext.o"
>> -     for entry in $bin_files; do
>> -             rm -f $kerneldir/$entry
>> -     done
>> -}
>> -
>> -sysroot_stage_all_append() {
>> -     sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNE=
L_SRC_PATH}
>> -}
>> -
>> -kernel_do_configure() {
>> -     # fixes extra + in /lib/modules/2.6.37+
>> -     # $ scripts/setlocalversion . =3D> +
>> -     # $ make kernelversion =3D> 2.6.37
>> -     # $ make kernelrelease =3D> 2.6.37+
>> -     touch ${B}/.scmversion ${S}/.scmversion
>> -
>> -     # Copy defconfig to .config if .config does not exist. This allows
>> -     # recipes to manage the .config themselves in do_configure_prepend=
().
>> -     if [ -f "${WORKDIR}/defconfig" ] && [ ! -f "${B}/.config" ]; then
>> -             cp "${WORKDIR}/defconfig" "${B}/.config"
>> -     fi
>> -     yes '' | oe_runmake oldconfig
>> -
>> -     if [ ! -z "${INITRAMFS_IMAGE}" ]; then
>> -             for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
>> -             if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}=
.$img" ]; then
>> -                     cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHI=
NE}.$img" initramfs.$img
>> -             fi
>> -             done
>> -     fi
>> -}
>> -
>> -do_configure[depends] +=3D "${INITRAMFS_TASK}"
>> -
>> -do_savedefconfig() {
>> -     oe_runmake savedefconfig
>> -}
>> -do_savedefconfig[nostamp] =3D "1"
>> -addtask savedefconfig after do_configure
>> -
>> -pkg_postinst_kernel-base () {
>> -     cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_I=
MAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KER=
NEL_VERSION} ${KERNEL_PRIORITY} || true
>> -}
>> -
>> -pkg_postrm_kernel-base () {
>> -     cd /${KERNEL_IMAGEDEST}; update-alternatives --remove ${KERNEL_IMA=
GETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
>> -}
>> -
>> -inherit cml1
>> -
>> -EXPORT_FUNCTIONS do_compile do_install do_configure
>> -
>> -# kernel-base becomes kernel-${KERNEL_VERSION}
>> -# kernel-image becomes kernel-image-${KERNEL_VERISON}
>> -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev=
"
>> -FILES =3D ""
>> -FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>> -FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/con=
fig* ${KERNEL_SRC_PATH}"
>> -FILES_kernel-vmlinux =3D "/boot/vmlinux*"
>> -RDEPENDS_kernel =3D "kernel-base"
>> -# Allow machines to override this dependency if kernel image files are
>> -# not wanted in images as standard
>> -RDEPENDS_kernel-base ?=3D "kernel-image"
>> -PKG_kernel-image =3D "kernel-image-${@legitimize_package_name('${KERNEL=
_VERSION}')}"
>> -PKG_kernel-base =3D "kernel-${@legitimize_package_name('${KERNEL_VERSIO=
N}')}"
>> -RPROVIDES_kernel-base +=3D "kernel-${KERNEL_VERSION}"
>> -ALLOW_EMPTY_kernel =3D "1"
>> -ALLOW_EMPTY_kernel-base =3D "1"
>> -ALLOW_EMPTY_kernel-image =3D "1"
>> -
>> -pkg_postinst_kernel-image () {
>> -if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>> -     mkdir -p $D/lib/modules/${KERNEL_VERSION}
>> -fi
>> -if [ -n "$D" ]; then
>> -     depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNEL_VERSI=
ON} ${KERNEL_VERSION}
>> -else
>> -     depmod -a ${KERNEL_VERSION}
>> -fi
>> -}
>> -
>> -pkg_postinst_modules () {
>> -if [ -z "$D" ]; then
>> -     depmod -a ${KERNEL_VERSION}
>> -     update-modules || true
>> -fi
>> -}
>> -
>> -pkg_postrm_modules () {
>> -update-modules || true
>> -}
>> -
>> -autoload_postinst_fragment() {
>> -if [ x"$D" =3D "x" ]; then
>> -     modprobe %s || true
>> -fi
>> -}
>> -
>> -# autoload defaults (alphabetically sorted)
>> -module_autoload_hidp =3D "hidp"
>> -module_autoload_ipv6 =3D "ipv6"
>> -module_autoload_ipsec =3D "ipsec"
>> -module_autoload_ircomm-tty =3D "ircomm-tty"
>> -module_autoload_rfcomm =3D "rfcomm"
>> -module_autoload_sa1100-rtc =3D "sa1100-rtc"
>> -# sa1100-rtc was renamed in 2.6.23 onwards
>> -module_autoload_rtc-sa1100 =3D "rtc-sa1100"
>> -
>> -# alias defaults (alphabetically sorted)
>> -module_conf_af_packet =3D "alias net-pf-17 af_packet"
>> -module_conf_bluez =3D "alias net-pf-31 bluez"
>> -module_conf_bnep =3D "alias bt-proto-4 bnep"
>> -module_conf_hci_uart =3D "alias tty-ldisc-15 hci_uart"
>> -module_conf_l2cap =3D "alias bt-proto-0 l2cap"
>> -module_conf_sco =3D "alias bt-proto-2 sco"
>> -module_conf_rfcomm =3D "alias bt-proto-3 rfcomm"
>> -
>> -python populate_packages_prepend () {
>> -    def extract_modinfo(file):
>> -        import tempfile, re, subprocess
>> -        tempfile.tempdir =3D d.getVar("WORKDIR", True)
>> -        tf =3D tempfile.mkstemp()
>> -        tmpfile =3D tf[1]
>> -        cmd =3D "PATH=3D\"%s\" %sobjcopy -j .modinfo -O binary %s %s" %=
 (d.getVar("PATH", True), d.getVar("HOST_PREFIX", True) or "", file, tmpfil=
e)
>> -        subprocess.call(cmd, shell=3DTrue)
>> -        f =3D open(tmpfile)
>> -        l =3D f.read().split("\000")
>> -        f.close()
>> -        os.close(tf[0])
>> -        os.unlink(tmpfile)
>> -        exp =3D re.compile("([^=3D]+)=3D(.*)")
>> -        vals =3D {}
>> -        for i in l:
>> -            m =3D exp.match(i)
>> -            if not m:
>> -                continue
>> -            vals[m.group(1)] =3D m.group(2)
>> -        return vals
>> -
>> -    def parse_depmod():
>> -        import re
>> -
>> -        dvar =3D d.getVar('PKGD', True)
>> -        if not dvar:
>> -            bb.error("PKGD not defined")
>> -            return
>> -
>> -        kernelver =3D d.getVar('KERNEL_VERSION', True)
>> -        kernelver_stripped =3D kernelver
>> -        m =3D re.match('^(.*-hh.*)[\.\+].*$', kernelver)
>> -        if m:
>> -            kernelver_stripped =3D m.group(1)
>> -        path =3D d.getVar("PATH", True)
>> -
>> -        cmd =3D "PATH=3D\"%s\" depmod -n -a -b %s -F %s/boot/System.map=
-%s %s" % (path, dvar, dvar, kernelver, kernelver_stripped)
>> -        f =3D os.popen(cmd, 'r')
>> -
>> -        deps =3D {}
>> -        pattern0 =3D "^(.*\.k?o):..*$"
>> -        pattern1 =3D "^(.*\.k?o):\s*(.*\.k?o)\s*$"
>> -        pattern2 =3D "^(.*\.k?o):\s*(.*\.k?o)\s*\\\$"
>> -        pattern3 =3D "^\t(.*\.k?o)\s*\\\$"
>> -        pattern4 =3D "^\t(.*\.k?o)\s*$"
>> -
>> -        line =3D f.readline()
>> -        while line:
>> -            if not re.match(pattern0, line):
>> -                line =3D f.readline()
>> -                continue
>> -            m1 =3D re.match(pattern1, line)
>> -            if m1:
>> -                deps[m1.group(1)] =3D m1.group(2).split()
>> -            else:
>> -                m2 =3D re.match(pattern2, line)
>> -                if m2:
>> -                    deps[m2.group(1)] =3D m2.group(2).split()
>> -                    line =3D f.readline()
>> -                    m3 =3D re.match(pattern3, line)
>> -                    while m3:
>> -                        deps[m2.group(1)].extend(m3.group(1).split())
>> -                        line =3D f.readline()
>> -                        m3 =3D re.match(pattern3, line)
>> -                    m4 =3D re.match(pattern4, line)
>> -                    deps[m2.group(1)].extend(m4.group(1).split())
>> -            line =3D f.readline()
>> -        f.close()
>> -        return deps
>> -
>> -    def get_dependencies(file, pattern, format):
>> -        # file no longer includes PKGD
>> -        file =3D file.replace(d.getVar('PKGD', True) or '', '', 1)
>> -        # instead is prefixed with /lib/modules/${KERNEL_VERSION}
>> -        file =3D file.replace("/lib/modules/%s/" % d.getVar('KERNEL_VER=
SION', True) or '', '', 1)
>> -
>> -        if module_deps.has_key(file):
>> -            import re
>> -            dependencies =3D []
>> -            for i in module_deps[file]:
>> -                m =3D re.match(pattern, os.path.basename(i))
>> -                if not m:
>> -                    continue
>> -                on =3D legitimize_package_name(m.group(1))
>> -                dependency_pkg =3D format % on
>> -                dependencies.append(dependency_pkg)
>> -            return dependencies
>> -        return []
>> -
>> -    def frob_metadata(file, pkg, pattern, format, basename):
>> -        import re
>> -        vals =3D extract_modinfo(file)
>> -
>> -        dvar =3D d.getVar('PKGD', True)
>> -
>> -        # If autoloading is requested, output /etc/modules-load.d/<name=
>.conf and append
>> -        # appropriate modprobe commands to the postinst
>> -        autoload =3D d.getVar('module_autoload_%s' % basename, True)
>> -        if autoload:
>> -            name =3D '%s/etc/modules-load.d/%s.conf' % (dvar, basename)
>> -            f =3D open(name, 'w')
>> -            for m in autoload.split():
>> -                f.write('%s\n' % m)
>> -            f.close()
>> -            postinst =3D d.getVar('pkg_postinst_%s' % pkg, True)
>> -            if not postinst:
>> -                bb.fatal("pkg_postinst_%s not defined" % pkg)
>> -            postinst +=3D d.getVar('autoload_postinst_fragment', True) =
% autoload
>> -            d.setVar('pkg_postinst_%s' % pkg, postinst)
>> -
>> -        # Write out any modconf fragment
>> -        modconf =3D d.getVar('module_conf_%s' % basename, True)
>> -        if modconf:
>> -            name =3D '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
>> -            f =3D open(name, 'w')
>> -            f.write("%s\n" % modconf)
>> -            f.close()
>> -
>> -        files =3D d.getVar('FILES_%s' % pkg, True)
>> -        files =3D "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.co=
nf" % (files, basename, basename)
>> -        d.setVar('FILES_%s' % pkg, files)
>> -
>> -        if vals.has_key("description"):
>> -            old_desc =3D d.getVar('DESCRIPTION_' + pkg, True) or ""
>> -            d.setVar('DESCRIPTION_' + pkg, old_desc + "; " + vals["desc=
ription"])
>> -
>> -        rdepends_str =3D d.getVar('RDEPENDS_' + pkg, True)
>> -        if rdepends_str:
>> -            rdepends =3D rdepends_str.split()
>> -        else:
>> -            rdepends =3D []
>> -        rdepends.extend(get_dependencies(file, pattern, format))
>> -        d.setVar('RDEPENDS_' + pkg, ' '.join(rdepends))
>> -
>> -    module_deps =3D parse_depmod()
>> -    module_regex =3D '^(.*)\.k?o$'
>> -    module_pattern =3D 'kernel-module-%s'
>> -
>> -    postinst =3D d.getVar('pkg_postinst_modules', True)
>> -    postrm =3D d.getVar('pkg_postrm_modules', True)
>> -    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.b=
in$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s=
', recursive=3DTrue, extra_depends=3D'')
>> -    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.f=
w$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s'=
, recursive=3DTrue, extra_depends=3D'')
>> -    do_split_packages(d, root=3D'/lib/firmware', file_regex=3D'^(.*)\.c=
is$', output_pattern=3D'kernel-firmware-%s', description=3D'Firmware for %s=
', recursive=3DTrue, extra_depends=3D'')
>> -    do_split_packages(d, root=3D'/lib/modules', file_regex=3Dmodule_reg=
ex, output_pattern=3Dmodule_pattern, description=3D'%s kernel module', post=
inst=3Dpostinst, postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, e=
xtra_depends=3D'update-modules kernel-%s' % d.getVar("KERNEL_VERSION", True=
))
>> -
>> -    # If modules-load.d and modprobe.d are empty at this point, remove =
them to
>> -    # avoid warnings. removedirs only raises an OSError if an empty
>> -    # directory cannot be removed.
>> -    dvar =3D d.getVar('PKGD', True)
>> -    for dir in ["%s/etc/modprobe.d" % (dvar), "%s/etc/modules-load.d" %=
 (dvar), "%s/etc" % (dvar)]:
>> -        if len(os.listdir(dir)) =3D=3D 0:
>> -            os.rmdir(dir)
>> -
>> -    import re
>> -    metapkg =3D "kernel-modules"
>> -    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>> -    d.setVar('FILES_' + metapkg, "")
>> -    blacklist =3D [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kerne=
l-vmlinux' ]
>> -    for l in module_deps.values():
>> -        for i in l:
>> -            pkg =3D module_pattern % legitimize_package_name(re.match(m=
odule_regex, os.path.basename(i)).group(1))
>> -            blacklist.append(pkg)
>> -    metapkg_rdepends =3D []
>> -    packages =3D d.getVar('PACKAGES', True).split()
>> -    for pkg in packages[1:]:
>> -        if not pkg in blacklist and not pkg in metapkg_rdepends:
>> -            metapkg_rdepends.append(pkg)
>> -    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
>> -    d.setVar('DESCRIPTION_' + metapkg, 'Kernel modules meta package')
>> -    packages.append(metapkg)
>> -    d.setVar('PACKAGES', ' '.join(packages))
>> -}
>> -
>> -# Support checking the kernel size since some kernels need to reside in=
 partitions
>> -# with a fixed length or there is a limit in transferring the kernel to=
 memory
>> -do_sizecheck() {
>> -     if [ ! -z "${KERNEL_IMAGE_MAXSIZE}" ]; then
>> -             size=3D`ls -l ${KERNEL_OUTPUT} | awk '{ print $5}'`
>> -             if [ $size -ge ${KERNEL_IMAGE_MAXSIZE} ]; then
>> -                     rm ${KERNEL_OUTPUT}
>> -                     die "This kernel (size=3D$size > ${KERNEL_IMAGE_MA=
XSIZE}) is too big for your device. Please reduce the size of the kernel by=
 making more of it modular."
>> -             fi
>> -     fi
>> -}
>> -
>> -addtask sizecheck before do_install after do_compile
>> -
>> -KERNEL_IMAGE_BASE_NAME ?=3D "${KERNEL_IMAGETYPE}-${PV}-${PR}-${MACHINE}=
-${DATETIME}"
>> -# Don't include the DATETIME variable in the sstate package signatures
>> -KERNEL_IMAGE_BASE_NAME[vardepsexclude] =3D "DATETIME"
>> -KERNEL_IMAGE_SYMLINK_NAME ?=3D "${KERNEL_IMAGETYPE}-${MACHINE}"
>> -
>> -do_uboot_mkimage() {
>> -     if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
>> -             if test "x${KEEPUIMAGE}" =3D "x" ; then
>> -                     ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
>> -                     if test -n "${UBOOT_ENTRYSYMBOL}"; then
>> -                             ENTRYPOINT=3D`${HOST_PREFIX}nm ${S}/vmlinu=
x | \
>> -                                     awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}=
" {print $1}'`
>> -                     fi
>> -                     if test -e arch/${ARCH}/boot/compressed/vmlinux ; =
then
>> -                             ${OBJCOPY} -O binary -R .note -R .comment =
-S arch/${ARCH}/boot/compressed/vmlinux linux.bin
>> -                             uboot-mkimage -A ${UBOOT_ARCH} -O linux -T=
 kernel -C none -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/$=
{PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
>> -                             rm -f linux.bin
>> -                     else
>> -                             ${OBJCOPY} -O binary -R .note -R .comment =
-S vmlinux linux.bin
>> -                             rm -f linux.bin.gz
>> -                             gzip -9 linux.bin
>> -                             uboot-mkimage -A ${UBOOT_ARCH} -O linux -T=
 kernel -C gzip -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/$=
{PV}/${MACHINE}" -d linux.bin.gz arch/${ARCH}/boot/uImage
>> -                             rm -f linux.bin.gz
>> -                     fi
>> -             fi
>> -     fi
>> -}
>> -
>> -addtask uboot_mkimage before do_install after do_compile
>> -
>> -kernel_do_deploy() {
>> -     install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_=
NAME}.bin
>> -     if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> -             tar -cvzf ${DEPLOYDIR}/modules-${KERNEL_VERSION}-${PR}-${M=
ACHINE}.tgz -C ${D} lib
>> -     fi
>> -
>> -     cd ${DEPLOYDIR}
>> -     rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
>> -     ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.=
bin
>> -     ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
>> -
>> -     cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README=
_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
>> -}
>> -do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
>> -
>> -addtask deploy before do_build after do_install
>> -
>> -EXPORT_FUNCTIONS do_deploy
>> -
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


