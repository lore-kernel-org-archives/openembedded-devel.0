Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q78xh-00045O-Ix for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:18:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q78vb-0005IA-CY for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:16:27 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 18:16:27 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 18:16:27 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 05 Apr 2011 18:16:09 +0200
Message-ID: <inff89$hdg$1@dough.gmane.org>
References: <1302016253-10390-1-git-send-email-heroor@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1302016253-10390-1-git-send-email-heroor@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] ti-syslink: Add TI Syslink for TI816x and TI814x devices
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
X-List-Received-Date: Tue, 05 Apr 2011 16:18:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-04-11 17:10, Siddharth Heroor wrote:
> From: Siddharth Heroor <heroor@ti.com>
> 
> * Syslink is an Inter Processor communication layer for ARM/DSP devices.

NAK!

1) This has way too much copy/paste crud from dsplink that needs to get
cleaned up, some highlights:

> +PROVIDES = "ti-syslink-module"
> +PROVIDES += "ti-syslink-examples"
> +PR_append = "j"

2) inconsistent whitespace every where, do_compile is the worst

3) This really needs to get split into 2 recipes: one for the kernel
modules using module.bbclass and one for the userspace bits.

4) The platform defines seem to be better suited for e.g. ti-paths.inc

> 
> Signed-off-by: Siddharth Heroor <heroor@ti.com>
> ---
>  recipes/ti/ti-syslink.inc |  183 +++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 183 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/ti/ti-syslink.inc
> 
> diff --git a/recipes/ti/ti-syslink.inc b/recipes/ti/ti-syslink.inc
> new file mode 100644
> index 0000000..651d840
> --- /dev/null
> +++ b/recipes/ti/ti-syslink.inc
> @@ -0,0 +1,183 @@
> +DESCRIPTION = "SYSLINK Inter-Processor Communications (IPC) for TI ARM/DSP processors"
> +HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/index.html"
> +SECTION = "devel"
> +LICENSE = "BSD"
> +
> +require ti-paths.inc
> +require ti-staging.inc
> +
> +COMPATIBLE_MACHINE = "(ti816x|ti814x)"
> +

> +
> +# This package builds a kernel module, use kernel PR as base and append a local version
> +PR = "${MACHINE_KERNEL_PR}"

> +
> +S = "${WORKDIR}/syslink_${PV}"
> +
> +SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}/exports/syslink_${PV}.tar.gz;name=syslinktarball"
> +
> +DEPENDS = "ti-sysbios ti-xdctools ti-cgt6x ti-ipc" 
> +DEPENDS += "virtual/kernel" 
> +
> +# Define Syslink variables. 
> +SYSLINKHLOSSAMPLES  = "procMgr frameq gateMP heapBufMP heapMemMP listMP messageQ notify ringIO ringIO_gpp sharedRegion"
> +SYSLINKPLATFORM    ?= "TI81XX"
> +SYSLINKSUFFIX      ?= "xe674"
> +SYSLINKLOADER      ?= "ELF"
> +
> +SYSLINKVARIANT_ti816x  = "TI816X"
> +SYSLINKVARIANT_ti814x  = "TI814X"
> +SYSLINKVARIANT     ?= "<UNDEFINED_SYSLINKVARIANT>"
> +
> +# Export additional variables needed by build
> +XDCTARGETS         ?= "ti.targets.elf.C674"
> +export XDCTARGETS
> +
> +SYSLINK_ROOT = "${S}"
> +export SYSLINK_ROOT
> +
> +XDCPATH = "${IPC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages" 
> +export XDCPATH
> +
> +XDCBUILDCFG="${SYSLINK_ROOT}/config.bld"
> +export XDCBUILDCFG
> +
> +do_configure() {
> +    # Update config.bld with rootDir paths for CodeGen Tools
> +    # Build only C674 Elf.
> +    sed -i \
> +        -e s:^C674_ELF.rootDir.*:C674_ELF.rootDir\ =\ \"${CODEGEN_INSTALL_DIR}\":g \
> +        -e s:C64P_COFF,://C64P_COFF:g \
> +        -e s:C64P_ELF,://C64P_ELF:g \
> +	-e s:C674_COFF,://C674_COFF:g \
> +        -e s:C674_ELF,:C674_ELF:g \
> +        -e s:M3_ELF,://M3_ELF:g \
> +        -e s:A8_ELF$://A8_ELF:g \
> +        -e 's/"ti.platforms.evmDA830:dsp",//g' \
> +        ${S}/config.bld
> +}
> +
> +do_prepsources () {
> +    # Prepare the tree for rebuilding - clean and generate interfaces
> +    cd ${SYSLINK_ROOT}/ti/syslink    
> +    ${XDC_INSTALL_DIR}/xdc .make -PR .
> +    ${XDC_INSTALL_DIR}/xdc clean -PR .
> +    ${XDC_INSTALL_DIR}/xdc .interfaces -PR .
> +}
> +
> +addtask prepsources after do_configure before do_compile
> +
> +do_compile() {
> +    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +
> +    # Build the gpp (hlos) kernel space
> +    cd ${S}/ti/syslink/utils/hlos/knl/Linux && make \
> +        ARCH="${TARGET_ARCH}" \
> +        CROSS_COMPILE="${TARGET_PREFIX}" \
> +        SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
> +        SYSLINK_VARIANT="${SYSLINKVARIANT}" \
> +        SYSLINK_LOADER="${SYSLINKLOADER}" \
> +        SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages" \
> +        KDIR="${STAGING_KERNEL_DIR}"
> +
> +    # Build the gpp (hlos) kernel space samples. 
> +    for sample in ${SYSLINKHLOSSAMPLES}; do
> +        cd ${S}/ti/syslink/samples/hlos/$sample/knl/Linux && make \
> +            ARCH="${TARGET_ARCH}" \
> +            CROSS_COMPILE="${TARGET_PREFIX}" \
> +            SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
> +            SYSLINK_VARIANT="${SYSLINKVARIANT}" \
> +            SYSLINK_LOADER="${SYSLINKLOADER}" \
> +            SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages" \
> +            SYSLINK_SDK=EZSDK \
> +            KDIR="${STAGING_KERNEL_DIR}"
> +    done
> +
> +    # Build the gpp (hlos) user space
> +    cd ${S}/ti/syslink/utils/hlos/usr/Linux && make \
> +        ARCH="${TARGET_ARCH}" \
> +        CROSS_COMPILE="${TARGET_PREFIX}" \
> +        TOOLCHAIN_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}" \
> +        SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
> +        SYSLINK_VARIANT="${SYSLINKVARIANT}" \
> +        SYSLINK_LOADER="${SYSLINKLOADER}" \
> +        SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages"
> +
> +    # Build the gpp (hlos) user space samples 
> +    # First build the common lib for samples.
> +    cd ${S}/ti/syslink/samples/hlos/common/usr/Linux && make \
> +        ARCH="${TARGET_ARCH}" \
> +        CROSS_COMPILE="${TARGET_PREFIX}" \
> +        TOOLCHAIN_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}" \
> +        SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
> +        SYSLINK_VARIANT="${SYSLINKVARIANT}" \
> +        SYSLINK_LOADER="${SYSLINKLOADER}" \
> +        SYSLINK_SDK=EZSDK \
> +        SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages"
> +
> +    for sample in ${SYSLINKHLOSSAMPLES}; do
> +        cd ${S}/ti/syslink/samples/hlos/$sample/usr/Linux && make \
> +            ARCH="${TARGET_ARCH}" \
> +            CROSS_COMPILE="${TARGET_PREFIX}" \
> +            TOOLCHAIN_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}" \
> +            SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
> +            SYSLINK_VARIANT="${SYSLINKVARIANT}" \
> +            SYSLINK_LOADER="${SYSLINKLOADER}" \
> +            SYSLINK_SDK=EZSDK \
> +            SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages"
> +    done
> +
> +    # Build the dsp/arm (rtos) code (system)
> +    cd ${S}/ti/syslink && \
> +        ${XDC_INSTALL_DIR}/xdc -P \
> +	 `${XDC_INSTALL_DIR}/bin/xdcpkg ${SYSLINK_ROOT}/ti/syslink | grep -v samples`
> +
> +    # Build the dsp/arm (rtos) code (samples)
> +    export XDCARGS="profile=debug"
> +    cd ${S}/ti/syslink && \
> +        ${XDC_INSTALL_DIR}/xdc --jobs=${BB_NUMBER_THREADS} -P \
> +	 `${XDC_INSTALL_DIR}/bin/xdcpkg ${SYSLINK_ROOT}/ti/syslink | grep samples`
> +}
> +
> +do_install () {
> +    # Install the hlos kernel module
> +    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
> +    install -m 0755 ${S}/ti/syslink/bin/${SYSLINKVARIANT}/syslink.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/
> +
> +    # Install the hlos examples
> +    install -d ${D}/${installdir}/ti-syslink-examples
> +    install -m 0755 ${S}/ti/syslink/bin/${SYSLINKVARIANT}/samples/* ${D}/${installdir}/ti-syslink-examples/
> +
> +    # Install the rtos examples
> +    cd ${S}/ti/syslink/samples/rtos
> +    for i in $(find . -name "*.${SYSLINKSUFFIX}"); do
> +        install -d ${D}/${installdir}/ti-syslink-examples/`dirname ${i} | cut -f4 -d /`
> +        install ${i} ${D}/${installdir}/ti-syslink-examples/`dirname ${i} | cut -f4 -d /`
> +    done
> +
> +    # Install/Stage the Source Tree
> +    install -d ${D}${SYSLINK_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${SYSLINK_INSTALL_DIR_RECIPE}
> +}
> +
> +PACKAGES += "ti-syslink-module"
> +FILES_ti-syslink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/syslink.ko" 
> +RDEPENDS_ti-syslink-module += "update-modules"
> +
> +pkg_postinst_ti-syslink-module () {
> +#!/bin/sh
> +if [ -n "$D" ]; then
> +	exit 1
> +fi
> +
> +depmod -a
> +update-modules || true
> +}
> +
> +pkg_postrm_ti-syslink-module () {
> +#!/bin/sh
> +update-modules || true
> +}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNm0BJMkyGM64RGpERAqy5AJ9T3vsdHIinTlVPOLVPVzqheFzqIgCcCVnW
qCNQqh3vixfM9CqJH0quZL0=
=Vgxn
-----END PGP SIGNATURE-----



