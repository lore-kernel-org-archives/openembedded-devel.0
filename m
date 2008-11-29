Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1L6E4e-00061r-Oj
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2008 01:52:40 +0100
Received: by fk-out-0910.google.com with SMTP id 19so1558211fkr.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2008 16:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Phngr7K1qMe6S3D/w77wjL9NAvq8dI6yCdzMMhQCUMw=;
	b=vuqot31XLIfaXKzgV2KKMZyYubKF3QCMHY028VKtghenk4MH3LyqKCSbqIUipo80QE
	dTJCnma+Vn5OMHRJgm7ba/VwCXLY9iwFpPnV1/uYBhnQTJGzU8jX26XyZMSwoDKfngfo
	puTv0qYnWb0RFKn3r6Ex9JYjtBVgx7u3PqG0s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=S2pUzOveep8q10ATzsKwrvjogbRTCmev2HegfQl5jyFeO0aM9vpQiCBxS1iQ10vAnI
	TgQevsgiULRGqhEErxY2Qpo7CbTdJdrZoG2tzWBr8SwduvWzvTrKOIzFAz9uw0Hd6fFP
	k+9gImyK5tp6n+w19D82hsZUsSan/cjMgjEww=
Received: by 10.180.233.15 with SMTP id f15mr2945587bkh.188.1227919770868;
	Fri, 28 Nov 2008 16:49:30 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-22-67.pppoe.avangarddsl.ru
	[89.110.22.67])
	by mx.google.com with ESMTPS id g28sm3558881fkg.21.2008.11.28.16.49.29
	(version=SSLv3 cipher=RC4-MD5); Fri, 28 Nov 2008 16:49:29 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Nov 2008 03:48:48 +0300
Message-Id: <1227919728-4878-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] zaurus-updater: add support for home partition reflashing
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
X-List-Received-Date: Sat, 29 Nov 2008 00:52:40 -0000

Sometimes one needs to clean/reflash the home partition.
Add support for flashing home.bin/HOME.BIN files onto "home" mtd
device.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/zaurus-updater/zaurus-updater.bb         |    2 +-
 packages/zaurus-updater/zaurus-updater/updater.sh |   38 +++++++++++++++++++-
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/packages/zaurus-updater/zaurus-updater.bb b/packages/zaurus-updater/zaurus-updater.bb
index 56f067c..6ed1c5f 100644
--- a/packages/zaurus-updater/zaurus-updater.bb
+++ b/packages/zaurus-updater/zaurus-updater.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Encrypted shellscript for the Zaurus ROM update"
 DEPENDS = "encdec-updater-native"
 LICENSE = "zaurus-updater"
-PR = "r21"
+PR = "r22"
 
 PACKAGES = ""
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/packages/zaurus-updater/zaurus-updater/updater.sh b/packages/zaurus-updater/zaurus-updater/updater.sh
index 22d4b39..f195aff 100644
--- a/packages/zaurus-updater/zaurus-updater/updater.sh
+++ b/packages/zaurus-updater/zaurus-updater/updater.sh
@@ -42,6 +42,9 @@
 #
 # 2007.12.25 Matthias 'CoreDump' Hentges
 # -Add support for installing / updating u-boot
+#
+# 2008.11.23 Dmitry 'lumag' Baryshkov
+# - Add support for reflashing home partitions
 
 # Set to "yes" to enable
 ENABLE_UBOOT_UPDATER="no"
@@ -53,6 +56,7 @@ TMPHEAD=$TMPPATH/tmphead.bin
 
 FLASHED_KERNEL=0
 FLASHED_ROOTFS=0
+FLASHED_HOMEFS=0
 UNPACKED_ROOTFS=0   # spitz only
 
 RO_MTD_LINE=`cat /proc/mtd | grep "root" | tail -n 1`
@@ -63,6 +67,14 @@ RO_MTD_NO=`echo $RO_MTD_LINE | cut -d: -f1 | cut -dd -f2`
 RO_MTD=/dev/mtd$RO_MTD_NO
 ROOTFS_SIZE=`echo $RO_MTD_LINE | cut -d" " -f2`
 
+RW_MTD_LINE=`cat /proc/mtd | grep "home" | tail -n 1`
+if [ "$RW_MTD_LINE" = "" ]; then
+    RW_MTD_LINE=`cat /proc/mtd | grep "\<NAND\>.*\<2\>" | tail -n 1`
+fi
+RW_MTD_NO=`echo $RW_MTD_LINE | cut -d: -f1 | cut -dd -f2`
+RW_MTD=/dev/mtd$RW_MTD_NO
+HOMEFS_SIZE=`echo $RO_MTD_LINE | cut -d" " -f2`
+
 LOGOCAL_MTD=/dev/mtd1
 
 VERBLOCK=0x48000
@@ -381,7 +393,7 @@ mkdir -p $TMPPATH > /dev/null 2>&1
 
 cd $DATAPATH/
 
-for TARGETFILE in u-boot.bin U-BOOT.BIN zimage zImage zImage.bin zimage.bin ZIMAGE ZIMAGE.BIN initrd.bin INITRD.BIN hdimage1.tgz HDIMAGE1.TGZ
+for TARGETFILE in u-boot.bin U-BOOT.BIN zimage zImage zImage.bin zimage.bin ZIMAGE ZIMAGE.BIN initrd.bin INITRD.BIN hdimage1.tgz HDIMAGE1.TGZ home.bin HOME.BIN
 do
     if [ ! -e $TARGETFILE ]
     then
@@ -438,6 +450,28 @@ do
         FLASH_TYPE=""
         ;;
 
+    home.bin)
+        if [ $FLASHED_HOMEFS != 0 ]
+        then
+            continue
+        fi
+        echo 'home file system'
+        FLASHED_HOMEFS=1
+        ISLOGICAL=0
+        ADDR=0
+        ISFORMATTED=0
+        MTD_PART_SIZE="0x$HOMEFS_SIZE"
+        ADDR=0
+        ISFORMATTED=0
+        TARGET_MTD=$RW_MTD
+        DATAPOS=0
+        ONESIZE=1048576
+        FLASH_TYPE="home"
+        /sbin/bcut -s 16 -o $TMPHEAD $TARGETFILE
+        do_flashing
+        FLASH_TYPE=""
+        ;;
+
     hdimage1.tgz)
         if [ $UNPACKED_ROOTFS = 0 ]
         then
@@ -446,7 +480,7 @@ do
         ;;
     
     u-boot.bin)
-    	if [ FLASHED_UBOOT != 1 ]
+        if [ $FLASHED_UBOOT != 1 ]
 	then
 		update_uboot "$TARGETFILE"
 		FLASHED_UBOOT="1"
-- 
1.5.6.5



