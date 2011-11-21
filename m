Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prathap@bangubntigfx>) id 1RSSdr-00005g-J1
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Nov 2011 13:06:31 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pALBvuNV018752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 05:57:58 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pALBvunT003594
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2011 17:27:56 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 Nov 2011 17:27:56 +0530
Received: from bangubntigfx (bangubntigfx.india.ti.com [172.24.132.46])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id pALBvtvd027528;
	Mon, 21 Nov 2011 17:27:55 +0530 (IST)
Received: from prathap by bangubntigfx with local (Exim 4.72)	(envelope-from
	<prathap@bangubntigfx>)	id 1RSSVX-0003yn-K2;
	Mon, 21 Nov 2011 17:27:55 +0530
From: Prathap M S <msprathap@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Nov 2011 17:27:52 +0530
Message-ID: <1321876672-15262-1-git-send-email-msprathap@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH v2 1/2] libgles-omap3_4.04.00.02: added support for graphics sdk 04.04.00.02
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
X-List-Received-Date: Mon, 21 Nov 2011 12:06:31 -0000
Content-Type: text/plain

* Added support for sgx ddk 1.6.16.4117
* Added powervr.inc to include variables common to graphics SDK recipes
* Bumped up the PR in libgles-omap3.inc

Signed-off-by: Prathap M S <msprathap@ti.com>
---
 .../omap3-sgx-modules_1.6.16.4117.bb               |   40 ++++++++++++++++++++
 recipes-bsp/powervr-drivers/powervr.inc            |    6 +++
 recipes-graphics/libgles/libgles-omap3.inc         |    4 +-
 .../libgles/libgles-omap3_4.04.00.02.bb            |   21 ++++++++++
 4 files changed, 70 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
 create mode 100644 recipes-bsp/powervr-drivers/powervr.inc
 create mode 100644 recipes-graphics/libgles/libgles-omap3_4.04.00.02.bb

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
new file mode 100644
index 0000000..6557ac9
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=21228a42e27d1d104b31a83f7c9da935"
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../../recipes-ti/includes/ti-eula-unpack.inc
+require powervr.inc
+
+SGXPV = "4_04_00_02"
+IMGPV = "1.6.16.4117"
+BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+PR = "${MACHINE_KERNEL_PR}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+           file://Compile-fixes-for-38-kernel.patch \
+           file://kernel-30.patch \
+          "
+SRC_URI[md5sum] = "901327765c0991900afda91473f84725"
+SRC_URI[sha256sum] = "2ced2329ec819e42d57eca1a11120b02ec9c332fb63baa0a41285eed07d4b48e"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
+
+PVRBUILD = "release"
+export KERNELDIR = "${STAGING_KERNEL_DIR}"
+
+PACKAGE_STRIP = "no"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
+
+do_install() {
+	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+	cp ${S}/pvrsrvkm.ko \
+	   ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
+	   ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
+	   ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+}
diff --git a/recipes-bsp/powervr-drivers/powervr.inc b/recipes-bsp/powervr-drivers/powervr.inc
new file mode 100644
index 0000000..5c6379a
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/powervr.inc
@@ -0,0 +1,6 @@
+TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti816x = "ti81xx"
+
+MODULESLOCATION_omap3 = "dc_omapfb3_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+
diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 4459bef..0b46818 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r17"
+PR = "r18"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x)"
 
@@ -25,6 +25,8 @@ TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
 BINLOCATION ?= "${S}/gfx_rel"
+BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 ES2LOCATION ?= "${S}/gfx_rel_es2.x"
 ES3LOCATION ?= "${S}/gfx_rel_es3.x"
 ES5LOCATION ?= "${S}/gfx_rel_es5.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.04.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.04.00.02.bb
new file mode 100644
index 0000000..e95a5d8
--- /dev/null
+++ b/recipes-graphics/libgles/libgles-omap3_4.04.00.02.bb
@@ -0,0 +1,21 @@
+require libgles-omap3.inc
+
+# download required binary distribution from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# see libgles-omap3.inc for detailed installation instructions
+
+SGXPV = "4_04_00_02"
+IMGPV = "1.6.16.4117"
+BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+                   file://cputype \
+                   file://rc.pvr \
+                   file://sample.desktop \
+                   file://99-bufferclass.rules  \
+"
+SRC_URI[md5sum] = "901327765c0991900afda91473f84725"
+SRC_URI[sha256sum] = "2ced2329ec819e42d57eca1a11120b02ec9c332fb63baa0a41285eed07d4b48e"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}"
+
-- 
1.7.1



