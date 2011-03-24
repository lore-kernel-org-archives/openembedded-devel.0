Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0875592@swubn01>) id 1Q2kiZ-00037G-NO
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 14:36:52 +0100
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2OD1Wbu016676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 08:01:34 -0500
Received: from swubn01 (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2OD1Vm6010943;
	Thu, 24 Mar 2011 18:31:31 +0530 (IST)
Received: from a0875592 by swubn01 with local (Exim 4.71)
	(envelope-from <a0875592@swubn01>)
	id 1Q2kAN-00074O-Fo; Thu, 24 Mar 2011 18:31:31 +0530
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 18:31:16 +0530
Message-Id: <1300971676-31774-3-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300971676-31774-1-git-send-email-heroor@gmail.com>
References: <1300971676-31774-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 3/3] TI IPC: Add version 1.22.04.25
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
X-List-Received-Date: Thu, 24 Mar 2011 13:36:52 -0000

From: Siddharth Heroor <heroor@ti.com>

* This version is one the first versions of TI IPC available.
* Fix the installer installer command in the include file.
  Since this is the first version available on OE, changing
  this does not affect any other versions.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-ipc.inc           |    2 +-
 recipes/ti/ti-ipc_1.22.04.25.bb |    6 ++++++
 2 files changed, 7 insertions(+), 1 deletions(-)
 create mode 100644 recipes/ti/ti-ipc_1.22.04.25.bb

diff --git a/recipes/ti/ti-ipc.inc b/recipes/ti/ti-ipc.inc
index 2a23a9b..0bc6218 100644
--- a/recipes/ti/ti-ipc.inc
+++ b/recipes/ti/ti-ipc.inc
@@ -15,7 +15,7 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ip
 
 DEPENDS = "ti-sysbios ti-cgt6x ti-xdctools"
 BINFILE="ipc_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+TI_BIN_UNPK_CMDS="Y: q:workdir:Y"
 
 do_install() {
     install -d ${D}${IPC_INSTALL_DIR_RECIPE}
diff --git a/recipes/ti/ti-ipc_1.22.04.25.bb b/recipes/ti/ti-ipc_1.22.04.25.bb
new file mode 100644
index 0000000..1573dce
--- /dev/null
+++ b/recipes/ti/ti-ipc_1.22.04.25.bb
@@ -0,0 +1,6 @@
+require ti-ipc.inc
+
+PV = "1_22_04_25"
+
+SRC_URI[ipcbin.md5sum] = "aaa7f3776794a92b4226cd923c7cd956"
+SRC_URI[ipcbin.sha256sum] = "b33e25e0330719c2857a5ca3abccd03fe1b55a9300b2f825707f2bc64b84c883"
-- 
1.7.0.4



