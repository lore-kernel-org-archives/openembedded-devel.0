Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0875592@swubn01>) id 1Q2kIT-0000HC-Ro
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 14:09:56 +0100
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2OD1Wue003020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 08:01:34 -0500
Received: from swubn01 (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2OD1UUv010938;
	Thu, 24 Mar 2011 18:31:31 +0530 (IST)
Received: from a0875592 by swubn01 with local (Exim 4.71)
	(envelope-from <a0875592@swubn01>)
	id 1Q2kAM-000735-TO; Thu, 24 Mar 2011 18:31:30 +0530
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 18:31:15 +0530
Message-Id: <1300971676-31774-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300971676-31774-1-git-send-email-heroor@gmail.com>
References: <1300971676-31774-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/3] TI IPC: Add missing dependencies
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
X-List-Received-Date: Thu, 24 Mar 2011 13:09:56 -0000

From: Siddharth Heroor <heroor@ti.com>

* The IPC software is for Sys/Bios and is dependent on Sys/Bios.
* To Build IPC and stage it we need XDCTools and C6000 Codegen.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-ipc.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/ti/ti-ipc.inc b/recipes/ti/ti-ipc.inc
index fc9b908..2a23a9b 100644
--- a/recipes/ti/ti-ipc.inc
+++ b/recipes/ti/ti-ipc.inc
@@ -13,6 +13,7 @@ S = "${WORKDIR}/ipc_${PV}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ipc/${PV}/exports/ipc_setuplinux_${PV}.bin;name=ipcbin"
 
+DEPENDS = "ti-sysbios ti-cgt6x ti-xdctools"
 BINFILE="ipc_setuplinux_${PV}.bin"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 
-- 
1.7.0.4



