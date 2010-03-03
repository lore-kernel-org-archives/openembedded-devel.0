Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NmoYF-0004hr-OE
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 14:23:48 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 8E20C491264
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Mar 2010 14:20:58 +0100 (CET)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Mar 2010 14:21:27 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id B717E2E28C; Wed,  3 Mar 2010 14:20:57 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Mar 2010 14:20:49 +0100
Message-Id: <1267622449-17263-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <4B8E618C.2080604@dresearch.de>
References: <4B8E618C.2080604@dresearch.de>
X-OriginalArrivalTime: 03 Mar 2010 13:21:27.0470 (UTC)
	FILETIME=[6DFE5CE0:01CABAD4]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] hipox: introducing IMAGE_FSTYPES cpio.gz.u-boot for hipox machine
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
X-List-Received-Date: Wed, 03 Mar 2010 13:23:48 -0000

* initrd images need to be prepared with mkimage to be usable from u-boot

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 conf/machine/hipox.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/machine/hipox.conf b/conf/machine/hipox.conf
index 7a2ac6f..3da7213 100644
--- a/conf/machine/hipox.conf
+++ b/conf/machine/hipox.conf
@@ -17,4 +17,7 @@ UBOOT_LOADADDRESS = "0x48008000"
 UBOOT_ENTRYPOINT = "0x48008000"
 UBOOT_ARCH = "arm"
 
+IMAGE_CMD_cpio.gz.u-boot = "cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc | gzip -c -9 >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz) ${EXTRA_IMAGECMD}; mkimage -A arm -O linux -T ramdisk -C gzip -n ${IMAGE_NAME} -d ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio.gz.u-boot"
+IMAGE_DEPENDS_cpio.gz.u-boot = "u-boot-mkimage-native"
+
 require conf/machine/include/tune-arm926ejs.inc
-- 
1.6.4.2



