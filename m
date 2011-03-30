Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0875592@swubn01>) id 1Q4q58-0003hd-Pa
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 09:44:47 +0200
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2U7giA4017479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 02:42:47 -0500
Received: from swubn01 (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2U7ggWG016602;
	Wed, 30 Mar 2011 13:12:43 +0530 (IST)
Received: from a0875592 by swubn01 with local (Exim 4.71)
	(envelope-from <a0875592@swubn01>)
	id 1Q4q38-00048e-DX; Wed, 30 Mar 2011 13:12:42 +0530
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:12:39 +0530
Message-Id: <1301470961-15808-1-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 1/3] TI EDMA3LLD Sysbios: Move installer unpack to recipe version
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
X-List-Received-Date: Wed, 30 Mar 2011 07:44:47 -0000

From: Siddharth Heroor <heroor@ti.com>

* The EDMA3LLD for Sysbios, does not ship as an installer
  but as a tarball. The older release 02.10.03.04 used an installer
  and this patch is in preparation of upcoming patches for new
  releases of EDMA3LLD.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-edma3lld-sysbios.inc            |    6 ------
 recipes/ti/ti-edma3lld-sysbios_02.10.03.04.bb |    5 +++++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/ti-edma3lld-sysbios.inc b/recipes/ti/ti-edma3lld-sysbios.inc
index fb17978..c91f4c2 100644
--- a/recipes/ti/ti-edma3lld-sysbios.inc
+++ b/recipes/ti/ti-edma3lld-sysbios.inc
@@ -5,17 +5,11 @@ LICENSE = "TI"
 
 require ti-paths.inc
 require ti-staging.inc
-require ti-eula-unpack.inc
 
 PR = "r1"
 
 S = "${WORKDIR}/edma3_lld_${PV}"
 
-SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_tii/psp/edma3_lld/edma3-lld-bios6/${PV}/exports/EDMA3_LLD_setuplinux_${PV}.bin;name=edma3lldsysbiosbin"
-
-BINFILE="EDMA3_LLD_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y:workdir"
-
 do_install() {
     install -d ${D}${EDMA3_LLD_SYSBIOS_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${EDMA3_LLD_SYSBIOS_INSTALL_DIR_RECIPE}
diff --git a/recipes/ti/ti-edma3lld-sysbios_02.10.03.04.bb b/recipes/ti/ti-edma3lld-sysbios_02.10.03.04.bb
index 0bfacf6..51cd6fe 100644
--- a/recipes/ti/ti-edma3lld-sysbios_02.10.03.04.bb
+++ b/recipes/ti/ti-edma3lld-sysbios_02.10.03.04.bb
@@ -1,7 +1,12 @@
 require ti-edma3lld-sysbios.inc
+require ti-eula-unpack.inc
 
 PV = "02_10_03_04"
 
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_tii/psp/edma3_lld/edma3-lld-bios6/${PV}/exports/EDMA3_LLD_setuplinux_${PV}.bin;name=edma3lldsysbiosbin"
+
 SRC_URI[edma3lldsysbiosbin.md5sum] = "9c1d9b8ee600f234ad635d3866b9f850"
 SRC_URI[edma3lldsysbiosbin.sha256sum] = "7becc0bf7f2c8126f4bc1fcde8daf50db22a55f7d13abc733db96380f10e910f"
 
+BINFILE="EDMA3_LLD_setuplinux_${PV}.bin"
+TI_BIN_UNPK_CMDS="Y:workdir"
-- 
1.7.0.4



