Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0875592@swubn01>) id 1Q4q59-0003he-OG
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 09:44:48 +0200
Received: from dbdp31.itg.ti.com ([172.24.170.98])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p2U7giqE009320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 02:42:47 -0500
Received: from swubn01 (localhost [127.0.0.1])
	by dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id p2U7ghZl016603;
	Wed, 30 Mar 2011 13:12:43 +0530 (IST)
Received: from a0875592 by swubn01 with local (Exim 4.71)
	(envelope-from <a0875592@swubn01>)
	id 1Q4q39-00048h-EY; Wed, 30 Mar 2011 13:12:43 +0530
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:12:40 +0530
Message-Id: <1301470961-15808-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1301470961-15808-1-git-send-email-heroor@gmail.com>
References: <1301470961-15808-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/3] TI EDMA3LLD Sysbios: Update recipe for SRC_URI
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
X-List-Received-Date: Wed, 30 Mar 2011 07:44:48 -0000

From: Siddharth Heroor <heroor@ti.com>

* Add SRC_URI for tar.gz releases.
* Bump PR.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-edma3lld-sysbios.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/ti-edma3lld-sysbios.inc b/recipes/ti/ti-edma3lld-sysbios.inc
index c91f4c2..3e51c5c 100644
--- a/recipes/ti/ti-edma3lld-sysbios.inc
+++ b/recipes/ti/ti-edma3lld-sysbios.inc
@@ -6,10 +6,12 @@ LICENSE = "TI"
 require ti-paths.inc
 require ti-staging.inc
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/edma3_lld_${PV}"
 
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_tii/psp/edma3_lld/edma3-lld-bios6/${PV}/exports/edma3_lld_${PV}.tar.gz"
+
 do_install() {
     install -d ${D}${EDMA3_LLD_SYSBIOS_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${EDMA3_LLD_SYSBIOS_INSTALL_DIR_RECIPE}
-- 
1.7.0.4



