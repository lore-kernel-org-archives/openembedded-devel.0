Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prathap@bangubntigfx>) id 1RRJ4X-00066N-3I
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 08:41:17 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAI7Ym5u015978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 01:34:50 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAI7Yko4004480
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 13:04:47 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 18 Nov 2011 13:04:46 +0530
Received: from bangubntigfx (bangubntigfx.india.ti.com [172.24.132.46])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAI7Yjho015045;
	Fri, 18 Nov 2011 13:04:46 +0530 (IST)
Received: from prathap by bangubntigfx with local (Exim 4.72)	(envelope-from
	<prathap@bangubntigfx>)	id 1RRIyD-0002Pb-FG;
	Fri, 18 Nov 2011 13:04:45 +0530
From: Prathap M S <msprathap@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Nov 2011 13:04:17 +0530
Message-ID: <1321601657-9212-1-git-send-email-msprathap@ti.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH v2 2/3] libgles-omap3_4.04.00.02: added support for graphics sdk 04.04.00.02
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
X-List-Received-Date: Fri, 18 Nov 2011 07:41:17 -0000
Content-Type: text/plain

* Added support for sgx ddk 1.6.16.4117
* Added powervr.inc to include variables common to graphics SDK recipes
* Bumped up the PR in libgles-omap3.inc

Signed-off-by: Prathap M S <msprathap@ti.com>
---
 recipes/powervr-drivers/libgles-omap3.inc          |    4 ++-
 .../powervr-drivers/libgles-omap3_4.04.00.02.bb    |   21 +++++++++++
 .../omap3-sgx-modules_1.6.16.4117.bb               |   39 ++++++++++++++++++++
 recipes/powervr-drivers/powervr.inc                |    6 +++
 4 files changed, 69 insertions(+), 1 deletions(-)
 create mode 100644 recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb
 create mode 100644 recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
 create mode 100644 recipes/powervr-drivers/powervr.inc

diff --git a/recipes/powervr-drivers/libgles-omap3.inc b/recipes/powervr-drivers/libgles-omap3.inc
index 36c311d..f6b94b0 100644
--- a/recipes/powervr-drivers/libgles-omap3.inc
+++ b/recipes/powervr-drivers/libgles-omap3.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "libGLES for the omap3"
 LICENSE = "proprietary-binary"
 
-PR = "r15"
+PR = "r16"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x)"
 
@@ -22,6 +22,8 @@ S = "${WORKDIR}/OMAP35x_Graphics_SDK_${SGXPV}"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../ti/ti-eula-unpack.inc
 
+BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
+BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION ?= "${S}/gfx_rel"
 ES2LOCATION ?= "${S}/gfx_rel_es2.x"
 ES3LOCATION ?= "${S}/gfx_rel_es3.x"
diff --git a/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb
new file mode 100644
index 0000000..e95a5d8
--- /dev/null
+++ b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb
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
diff --git a/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
new file mode 100644
index 0000000..4c19368
--- /dev/null
+++ b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "Kernel drivers for the PowerVR SGX chipset found in the omap3 SoCs"
+LICENSE = "GPLv2"
+
+# download required binary distribution from:
+# http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
+# see libgles-omap3.inc for detailed installation instructions
+
+TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+require ../ti/ti-eula-unpack.inc
+require powervr.inc
+
+SGXPV = "4_04_00_02"
+IMGPV = "1.6.16.4117"
+BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
+
+inherit module
+
+MACHINE_KERNEL_PR_append = "a"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
+           file://Compile-fixes-for-38-kernel.patch \
+          "
+SRC_URI[md5sum] = "901327765c0991900afda91473f84725"
+SRC_URI[sha256sum] = "2ced2329ec819e42d57eca1a11120b02ec9c332fb63baa0a41285eed07d4b48e"
+
+S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
+
+PVRBUILD = "release"
+
+PACKAGE_STRIP = "no"
+
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
+
+do_install() {
+	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+	cp ${S}/pvrsrvkm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+	cp ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+	cp ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
+}
diff --git a/recipes/powervr-drivers/powervr.inc b/recipes/powervr-drivers/powervr.inc
new file mode 100644
index 0000000..5c6379a
--- /dev/null
+++ b/recipes/powervr-drivers/powervr.inc
@@ -0,0 +1,6 @@
+TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti816x = "ti81xx"
+
+MODULESLOCATION_omap3 = "dc_omapfb3_linux"
+MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+
-- 
1.7.1



