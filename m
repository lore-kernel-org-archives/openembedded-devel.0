Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q77wJ-0003hK-7G
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:13:07 +0200
Received: by yxn22 with SMTP id 22so170015yxn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=swrLNqkYPvmbeDQLXKeSGu3OWYqmc08zzWf1NqNV2Og=;
	b=dtd6JsaRyq80sOHmKwjKuveGdTJi7m15Cy5fN6+TIwHq+4o6Dt5GV/0GjpHV0C+ihZ
	/oiRBtKMuupHH6QyXiwEWDfzE/vIl6Uyx6kqjO2m5rbO3zsB+GCf3wQsYQtowdJUHffb
	Hqhs9AMZGenp0KdFrzBHtMjJmS3IthMgvySRQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mGvXOe7NUsqKQN0JiP1SFwUaBfJQilZLz7U5RQyqTrb3N902EsrW9ap5X8BG0qFskh
	CVImWhoG2cG/DBrGvr2SQexaVdidi4Ticql9W7muadu2bmkAvO37gZdwr7wqGEl9emap
	vm5aM2NZYTemArEkZI2atHDd3ug5jpsXQBhzQ=
Received: by 10.150.67.10 with SMTP id p10mr652602yba.236.1302016260898;
	Tue, 05 Apr 2011 08:11:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p28sm148062ybk.0.2011.04.05.08.10.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 08:11:00 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 20:40:52 +0530
Message-Id: <1302016253-10390-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 1/2] ti-syslink: Add TI Syslink for TI816x and TI814x devices
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
X-List-Received-Date: Tue, 05 Apr 2011 15:13:08 -0000

From: Siddharth Heroor <heroor@ti.com>

* Syslink is an Inter Processor communication layer for ARM/DSP devices.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-syslink.inc |  183 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 183 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink.inc

diff --git a/recipes/ti/ti-syslink.inc b/recipes/ti/ti-syslink.inc
new file mode 100644
index 0000000..651d840
--- /dev/null
+++ b/recipes/ti/ti-syslink.inc
@@ -0,0 +1,183 @@
+DESCRIPTION = "SYSLINK Inter-Processor Communications (IPC) for TI ARM/DSP processors"
+HOMEPAGE = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/index.html"
+SECTION = "devel"
+LICENSE = "BSD"
+
+require ti-paths.inc
+require ti-staging.inc
+
+COMPATIBLE_MACHINE = "(ti816x|ti814x)"
+
+PROVIDES = "ti-syslink-module"
+PROVIDES += "ti-syslink-examples"
+
+# This package builds a kernel module, use kernel PR as base and append a local version
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "j"
+
+S = "${WORKDIR}/syslink_${PV}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}/exports/syslink_${PV}.tar.gz;name=syslinktarball"
+
+DEPENDS = "ti-sysbios ti-xdctools ti-cgt6x ti-ipc" 
+DEPENDS += "virtual/kernel" 
+
+# Define Syslink variables. 
+SYSLINKHLOSSAMPLES  = "procMgr frameq gateMP heapBufMP heapMemMP listMP messageQ notify ringIO ringIO_gpp sharedRegion"
+SYSLINKPLATFORM    ?= "TI81XX"
+SYSLINKSUFFIX      ?= "xe674"
+SYSLINKLOADER      ?= "ELF"
+
+SYSLINKVARIANT_ti816x  = "TI816X"
+SYSLINKVARIANT_ti814x  = "TI814X"
+SYSLINKVARIANT     ?= "<UNDEFINED_SYSLINKVARIANT>"
+
+# Export additional variables needed by build
+XDCTARGETS         ?= "ti.targets.elf.C674"
+export XDCTARGETS
+
+SYSLINK_ROOT = "${S}"
+export SYSLINK_ROOT
+
+XDCPATH = "${IPC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages" 
+export XDCPATH
+
+XDCBUILDCFG="${SYSLINK_ROOT}/config.bld"
+export XDCBUILDCFG
+
+do_configure() {
+    # Update config.bld with rootDir paths for CodeGen Tools
+    # Build only C674 Elf.
+    sed -i \
+        -e s:^C674_ELF.rootDir.*:C674_ELF.rootDir\ =\ \"${CODEGEN_INSTALL_DIR}\":g \
+        -e s:C64P_COFF,://C64P_COFF:g \
+        -e s:C64P_ELF,://C64P_ELF:g \
+	-e s:C674_COFF,://C674_COFF:g \
+        -e s:C674_ELF,:C674_ELF:g \
+        -e s:M3_ELF,://M3_ELF:g \
+        -e s:A8_ELF$://A8_ELF:g \
+        -e 's/"ti.platforms.evmDA830:dsp",//g' \
+        ${S}/config.bld
+}
+
+do_prepsources () {
+    # Prepare the tree for rebuilding - clean and generate interfaces
+    cd ${SYSLINK_ROOT}/ti/syslink    
+    ${XDC_INSTALL_DIR}/xdc .make -PR .
+    ${XDC_INSTALL_DIR}/xdc clean -PR .
+    ${XDC_INSTALL_DIR}/xdc .interfaces -PR .
+}
+
+addtask prepsources after do_configure before do_compile
+
+do_compile() {
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
+
+    # Build the gpp (hlos) kernel space
+    cd ${S}/ti/syslink/utils/hlos/knl/Linux && make \
+        ARCH="${TARGET_ARCH}" \
+        CROSS_COMPILE="${TARGET_PREFIX}" \
+        SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
+        SYSLINK_VARIANT="${SYSLINKVARIANT}" \
+        SYSLINK_LOADER="${SYSLINKLOADER}" \
+        SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages" \
+        KDIR="${STAGING_KERNEL_DIR}"
+
+    # Build the gpp (hlos) kernel space samples. 
+    for sample in ${SYSLINKHLOSSAMPLES}; do
+        cd ${S}/ti/syslink/samples/hlos/$sample/knl/Linux && make \
+            ARCH="${TARGET_ARCH}" \
+            CROSS_COMPILE="${TARGET_PREFIX}" \
+            SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
+            SYSLINK_VARIANT="${SYSLINKVARIANT}" \
+            SYSLINK_LOADER="${SYSLINKLOADER}" \
+            SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages" \
+            SYSLINK_SDK=EZSDK \
+            KDIR="${STAGING_KERNEL_DIR}"
+    done
+
+    # Build the gpp (hlos) user space
+    cd ${S}/ti/syslink/utils/hlos/usr/Linux && make \
+        ARCH="${TARGET_ARCH}" \
+        CROSS_COMPILE="${TARGET_PREFIX}" \
+        TOOLCHAIN_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}" \
+        SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
+        SYSLINK_VARIANT="${SYSLINKVARIANT}" \
+        SYSLINK_LOADER="${SYSLINKLOADER}" \
+        SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages"
+
+    # Build the gpp (hlos) user space samples 
+    # First build the common lib for samples.
+    cd ${S}/ti/syslink/samples/hlos/common/usr/Linux && make \
+        ARCH="${TARGET_ARCH}" \
+        CROSS_COMPILE="${TARGET_PREFIX}" \
+        TOOLCHAIN_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}" \
+        SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
+        SYSLINK_VARIANT="${SYSLINKVARIANT}" \
+        SYSLINK_LOADER="${SYSLINKLOADER}" \
+        SYSLINK_SDK=EZSDK \
+        SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages"
+
+    for sample in ${SYSLINKHLOSSAMPLES}; do
+        cd ${S}/ti/syslink/samples/hlos/$sample/usr/Linux && make \
+            ARCH="${TARGET_ARCH}" \
+            CROSS_COMPILE="${TARGET_PREFIX}" \
+            TOOLCHAIN_PREFIX="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}" \
+            SYSLINK_PLATFORM="${SYSLINKPLATFORM}" \
+            SYSLINK_VARIANT="${SYSLINKVARIANT}" \
+            SYSLINK_LOADER="${SYSLINKLOADER}" \
+            SYSLINK_SDK=EZSDK \
+            SYSLINK_PKGPATH="${IPC_INSTALL_DIR}/packages"
+    done
+
+    # Build the dsp/arm (rtos) code (system)
+    cd ${S}/ti/syslink && \
+        ${XDC_INSTALL_DIR}/xdc -P \
+	 `${XDC_INSTALL_DIR}/bin/xdcpkg ${SYSLINK_ROOT}/ti/syslink | grep -v samples`
+
+    # Build the dsp/arm (rtos) code (samples)
+    export XDCARGS="profile=debug"
+    cd ${S}/ti/syslink && \
+        ${XDC_INSTALL_DIR}/xdc --jobs=${BB_NUMBER_THREADS} -P \
+	 `${XDC_INSTALL_DIR}/bin/xdcpkg ${SYSLINK_ROOT}/ti/syslink | grep samples`
+}
+
+do_install () {
+    # Install the hlos kernel module
+    install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp
+    install -m 0755 ${S}/ti/syslink/bin/${SYSLINKVARIANT}/syslink.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/
+
+    # Install the hlos examples
+    install -d ${D}/${installdir}/ti-syslink-examples
+    install -m 0755 ${S}/ti/syslink/bin/${SYSLINKVARIANT}/samples/* ${D}/${installdir}/ti-syslink-examples/
+
+    # Install the rtos examples
+    cd ${S}/ti/syslink/samples/rtos
+    for i in $(find . -name "*.${SYSLINKSUFFIX}"); do
+        install -d ${D}/${installdir}/ti-syslink-examples/`dirname ${i} | cut -f4 -d /`
+        install ${i} ${D}/${installdir}/ti-syslink-examples/`dirname ${i} | cut -f4 -d /`
+    done
+
+    # Install/Stage the Source Tree
+    install -d ${D}${SYSLINK_INSTALL_DIR_RECIPE}
+    cp -pPrf ${S}/* ${D}${SYSLINK_INSTALL_DIR_RECIPE}
+}
+
+PACKAGES += "ti-syslink-module"
+FILES_ti-syslink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/syslink.ko" 
+RDEPENDS_ti-syslink-module += "update-modules"
+
+pkg_postinst_ti-syslink-module () {
+#!/bin/sh
+if [ -n "$D" ]; then
+	exit 1
+fi
+
+depmod -a
+update-modules || true
+}
+
+pkg_postrm_ti-syslink-module () {
+#!/bin/sh
+update-modules || true
+}
-- 
1.7.0.4



