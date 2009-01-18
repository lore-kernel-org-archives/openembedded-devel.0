Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRl-00054Z-IG
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:33 +0100
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:46 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:44 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:39 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:34 +0100
Message-Id: <f0f891073785a3657998bb76d80dbfac420c2ed9.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <a7903bdc0aa35de92f14ba44da8148401a411549.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
	<ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>
	<48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>
	<c1ce4054664d07c9f2a79ac7bcdf26637470aeec.1232244759.git.andrea.adami@gmail.com>
	<be10caf1d9175ef81833424a9c6b334fd4857272.1232244759.git.andrea.adami@gmail.com>
	<a7903bdc0aa35de92f14ba44da8148401a411549.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:39.0767 (UTC)
	FILETIME=[EA385670:01C97913]
Subject: [PATCH 14/14] zaurus-clamshell.inc: remove 16 bytes Sharp header
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:33 -0000

- updater.sh would refuse the kernel (size too big)
- we can flash using nandwrite /dev/mtd[2|3] img.bin
---
 conf/machine/include/zaurus-clamshell.inc |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/zaurus-clamshell.inc b/conf/machine/include/zaurus-clamshell.inc
index 4fa9f75..0ac44f0 100644
--- a/conf/machine/include/zaurus-clamshell.inc
+++ b/conf/machine/include/zaurus-clamshell.inc
@@ -1,15 +1,17 @@
 include conf/machine/include/tune-xscale.inc
 
-EXTRA_IMAGEDEPENDS += "sharp-flash-header-c700"
+#EXTRA_IMAGEDEPENDS += "sharp-flash-header-c700"
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime -m favourlzo \
                    --output=${T}/${IMAGE_NAME}.rootfs.jffs2 --pad --little-endian --eraseblock=${ERASEBLOCKSIZE} -n \
                    && sumtool -i ${T}/${IMAGE_NAME}.rootfs.jffs2 \
                    -o ${T}/${IMAGE_NAME}.rootfs.jffs2.summary \
                    --eraseblock=${ERASEBLOCKSIZE} -l -p; \
-                   cat ${STAGING_LIBDIR}/sharp-flash-header/header-c700.bin \
+#                   cat ${STAGING_LIBDIR}/sharp-flash-header/header-c700.bin \
+                   cat \
                    ${T}/${IMAGE_NAME}.rootfs.jffs2 > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2; \
                    rm ${T}/${IMAGE_NAME}.rootfs.jffs2; \
-                   cat ${STAGING_LIBDIR}/sharp-flash-header/header-c700.bin \
+#                   cat ${STAGING_LIBDIR}/sharp-flash-header/header-c700.bin \
+                   cat \
                    ${T}/${IMAGE_NAME}.rootfs.jffs2.summary > ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.summary.jffs2; \
                    rm ${T}/${IMAGE_NAME}.rootfs.jffs2.summary;"
-- 
1.6.0.6



