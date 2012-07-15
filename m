Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SqTYM-0000eR-F6
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jul 2012 20:28:22 +0200
Received: by pbbrq2 with SMTP id rq2so7989918pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2012 11:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Va8Zqd/pi0L66jTD6+PjNYnDkkeg6e2EI8ue6w0rd6g=;
	b=A2KuRuY1KeoataBHeKd2uA2VOuT0hVT+Bv8jKO6+16oq7xGWgs4E07kaNEhPFWc7eY
	O8Lu6lc0zmAP5Dj0lmAXr8cohESoO9m40Pv83w/duRzi31tz9cMqo6jIr2p58wZZmeIf
	PlcewZmO/2prwatw3ldDJVEVWvmT+iOgy0uPptA0wu8FdbTYazNtdcP6qtDW0ygp9t7Y
	saPLY4Kt+B5UMJ7Aj2RbXzIdHs+eiNvDx8KrRku/zTgcwjmEDOTH96TGVK90wMJAsU8H
	VPjEQeFHqNlfYUQhZf4NbUwTAxcbxNpkyjgI7GXVYAla2cjwwVy3vvsRFej+MrGqrmk2
	/RfQ==
Received: by 10.66.73.70 with SMTP id j6mr17627681pav.5.1342376224350;
	Sun, 15 Jul 2012 11:17:04 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id se9sm10259892pbc.25.2012.07.15.11.17.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 Jul 2012 11:17:03 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jul 2012 22:16:52 +0400
Message-Id: <1342376212-20391-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] xilinx-kernel.bbclass: Fix support for binary device tree generation.
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
X-List-Received-Date: Sun, 15 Jul 2012 18:28:22 -0000

This commit fixes support for binary device tree generation, which was
broken as a result of commit 8c904eb643ad8ca1bc29cb2d870a80b355dcb341
in oe-core:

linux-dtb: add multi-dtb build support
    including following enhancement:
    * support multi-dtb build
    * skip dtb build and install when KERNEL_DEVICETREE is empty
    * print a warning message when specified dts file is not available

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 classes/xilinx-kernel.bbclass |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/classes/xilinx-kernel.bbclass b/classes/xilinx-kernel.bbclass
index 14f4c7d..7c51b3d 100644
--- a/classes/xilinx-kernel.bbclass
+++ b/classes/xilinx-kernel.bbclass
@@ -22,16 +22,14 @@ def device_tree(a, d):
 
     board = bb.data.getVar('XILINX_BOARD', d, 1)
     cpu = bb.data.getVar('TARGET_CPU', d, 1)
-
     if re.match('powerpc', a):
         target = cpu + '-' + board
-        dts = 'arch/' + a + '/boot/dts/virtex' + target + '.dts'
+        dts = '${S}/arch/' + a + '/boot/dts/virtex' + target + '.dts'
     else:
         target = 'system'
-        dts = 'arch/' + a + '/boot/dts/' + target + '.dts'
+        dts = '${S}/arch/' + a + '/boot/dts/' + target + '.dts'
 
     bb.data.setVar('KERNEL_TARGET', target, d)
-
     return dts
 
 
@@ -44,10 +42,10 @@ if [ -n "${XILINX_BSP_PATH}" ]; then
 		if [ -e "$dts" ]; then
 			bbnote "Xilinx BSP device tree located in: ${dts}"
 			if [ "${TARGET_ARCH}" = "powerpc" ]; then
-				bbnote "Replacing linux kernel powerpc device tree to match located hardware model"
+				bbnote "Replacing linux kernel powerpc device tree to match located hardware model: virtex${KERNEL_TARGET}.dts"
 				cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex${KERNEL_TARGET}.dts
 			else
-				bbnote "Replacing linux kernel microblaze device tree to match located hardware model"
+				bbnote "Replacing linux kernel microblaze device tree to match located hardware model: ${KERNEL_TARGET}.dts"
 				cp -pP ${dts} ${S}/arch/microblaze/platform/generic/${KERNEL_TARGET}.dts
 			fi
 		else
-- 
1.7.9.5



