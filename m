Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QH0If-0007KG-VX
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 23:05:02 +0200
Received: (qmail invoked by alias); 02 May 2011 21:02:23 -0000
Received: from p5B0A1227.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.18.39]
	by mail.gmx.net (mp010) with SMTP; 02 May 2011 23:02:23 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX199g3wliqB9E0ICaTbe/7gLnNNzYXRAPsocTT01qs
	UHzaXjLqMJKdud
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 May 2011 23:02:47 +0200
Message-Id: <1304370168-4354-4-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1304370168-4354-1-git-send-email-schnitzeltony@gmx.de>
References: <1304370168-4354-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [PATCH 3/4] u-boot: Add support for freescale iMX28 SoCs
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
X-List-Received-Date: Mon, 02 May 2011 21:05:02 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 recipes/u-boot/u-boot_git.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 2cf5b12..3908e06 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -296,6 +296,30 @@ SRC_URI_append_c7x0 = "file://pdaXrom-u-boot.patch \
 SRC_URI_sheevaplug = "git://git.denx.de/u-boot-marvell.git;protocol=git;branch=master"
 SRCREV_sheevaplug = "749c971873dbba301bd138c95d31223a25b32150"
 
+SRC_URI_mx28 = "git://opensource.freescale.com/pub/scm/imx/uboot-imx.git;protocol=http;branch=imx_v2009.08_10.12.01 \
+                http://foss.doredevelopment.dk/mirrors/imx/imx-bootlets-src-${PV_imx_bootlets}.tar.gz;name=imx-bootlets"
+SRCREV_mx28 = "e4437f1c192a1a68028e6fcff3f50ff50352041d"
+SRC_URI[imx-bootlets.md5sum] = "cf0ab3822dca694b930a051501c1d0e4"
+SRC_URI[imx-bootlets.sha256sum] = "63f6068ae36884adef4259bbb1fe2591755718f22c46d0a59d854883dfab1ffc"
+PV_mx28 = "2009.08-imx+${PR}+gitr${SRCREV}"
+PV_imx_bootlets = "10.12.01"
+DEPENDS_append_mx28 = " elftosb-native"
+
+do_compile_prepend_mx28() {
+	# We just build the bootlets here
+	oe_runmake -C ${WORKDIR}/imx-bootlets-src-${PV_imx_bootlets} -e MAKEFLAGS= linux_prep boot_prep power_prep CC="${CC}" CFLAGS="${CFLAGS}" AR="${AR}" BOARD=iMX28_EVK
+}
+
+do_deploy_append_mx28 () {
+	cd ${WORKDIR}/imx-bootlets-src-${PV_imx_bootlets}
+	sed -i 's,[^ *]u_boot.*;,\tu_boot="'${S}/u-boot'";,' uboot_ivt.bd
+	sed -i 's,[^ *]u_boot.*;,\tu_boot="'${S}/u-boot'";,' uboot.bd
+	elftosb -z -c uboot.bd -o imx28_uboot.sb
+	elftosb -z -f imx28 -c uboot_ivt.bd -o imx28_ivt_uboot.sb
+        install -d ${DEPLOY_DIR_IMAGE}
+        install -m 0644 ${WORKDIR}/imx-bootlets-src-${PV_imx_bootlets}/imx28*uboot.sb ${DEPLOY_DIR_IMAGE}/
+}
+
 SRC_URI_xilinx-ml507 = "git://git.xilinx.com/u-boot-xlnx.git;protocol=git"
 SRCREV_xilinx-ml507 = "26e999650cf77c16f33c580abaadab2532f5e8b2"
 
-- 
1.7.4.4



