Received: from [63.139.215.209] (helo=maxie.russound.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jims@russound.com>) id 1OUkS5-0006KG-G3
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 19:55:04 +0200
Received: from localhost.localdomain (unknown [10.0.3.77])
	by maxie.russound.com (Postfix) with ESMTP id BEAC0674035;
	Fri,  2 Jul 2010 13:32:41 -0400 (EDT)
From: Jim Sheldon <jims@russound.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jul 2010 13:32:41 -0400
Message-Id: <1278091961-24967-1-git-send-email-jims@russound.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 63.139.215.209
X-SA-Exim-Mail-From: jims@russound.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_FAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] allow u-boot package binaries to be relocated to UBOOT_DEST
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
X-List-Received-Date: Fri, 02 Jul 2010 17:55:06 -0000


Signed-off-by: Jim Sheldon <jims@russound.com>
---
 recipes/u-boot/u-boot.inc |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes/u-boot/u-boot.inc b/recipes/u-boot/u-boot.inc
index 323eaef..e4bbdde 100644
--- a/recipes/u-boot/u-boot.inc
+++ b/recipes/u-boot/u-boot.inc
@@ -13,6 +13,7 @@ PARALLEL_MAKE=""
 EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
 
 UBOOT_MACHINE ?= "${MACHINE}_config"
+UBOOT_DEST ?= "/boot"
 UBOOT_BINARY ?= "u-boot.bin"
 UBOOT_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.bin"
 UBOOT_SYMLINK ?= "u-boot-${MACHINE}.bin"
@@ -27,9 +28,9 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}/boot
-	install ${S}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+	install -d ${D}/${UBOOT_DEST}
+	install ${S}/${UBOOT_BINARY} ${D}/${UBOOT_DEST}/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/${UBOOT_DEST}/${UBOOT_BINARY}
 
 	if [ -e ${WORKDIR}/fw_env.config ] ; then
 	    install -d ${D}${base_sbindir}
@@ -41,7 +42,7 @@ do_install () {
 
 }
 
-FILES_${PN} = "/boot"
+FILES_${PN} = "${UBOOT_DEST}"
 # no gnu_hash in uboot.bin, by design, so skip QA
 INSANE_SKIP_${PN} = True
 
-- 
1.5.4.3



