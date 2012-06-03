Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sb7Ir-0008T1-Q8
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jun 2012 11:40:53 +0200
Received: by werg55 with SMTP id g55so2260177wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2012 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=equ+O00EPlQkQm4USI2CpKucwWAJyQI2U3t6dw8TRtE=;
	b=wPajmf4H1XLxtDulXW8PZZAzMIqFHMtUxl7C/cVtupk57njS1+eZ5G5FiKKKBGMgnq
	bAubuq7n5GQuke5zm6F6de6yg/7rvDatqAneDybEKy7d+lUt1dxz+fzJ9KWlaTCwsPNo
	tjYi8rhrc2b/nyzcIvpRpU2H6EASpjAKPyhkWFvesWU6aVwxlkweLqMJMEcNfWwiDEQk
	P0F44HIiF0nipD7R5/DTdxYilKMZ7Z6OJuGZQqmSsICkYq2N8e4pM7kxA5hOt0g1mQhm
	gvSMCCV/l3QqeUTFekkVi95c9bHkpLcx6+4YnxHWsiD/ciPYSqw3U0DNgsJvvJJ2g7e2
	fKYA==
Received: by 10.216.194.137 with SMTP id m9mr7739820wen.66.1338715830665;
	Sun, 03 Jun 2012 02:30:30 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id f19sm18245400wiw.11.2012.06.03.02.30.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 03 Jun 2012 02:30:29 -0700 (PDT)
From: elvis.dowson@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2012 11:30:20 +0200
Message-Id: <4fcb2eb5.f34bb40a.3bbd.45cd@mx.google.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] u-boot-xilinx_git: Update recipe to support fetching from separate git repositories for virtex5 and microblaze.
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
X-List-Received-Date: Sun, 03 Jun 2012 09:40:53 -0000

From: Elvis Dowson <elvis.dowson@gmail.com>

* virtex5: Modify SRC_URI_virtex5 to fetch u-boot from
  git://git.denx.de/u-boot.git
* virtex5: Update to u-boot v2012.04.01
* microblaze: Retain SRC_URL_microblaze to fetch u-boot from
  git://git.xilinx.com/u-boot-xlnx.git
* microblaze: Retain u-boot v2009.11

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes-bsp/u-boot/u-boot-xilinx_git.bb |   27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-xilinx_git.bb b/recipes-bsp/u-boot/u-boot-xilinx_git.bb
index 759539f..af9ef45 100644
--- a/recipes-bsp/u-boot/u-boot-xilinx_git.bb
+++ b/recipes-bsp/u-boot/u-boot-xilinx_git.bb
@@ -1,22 +1,29 @@
 inherit xilinx-boot xilinx-utils
 require recipes-bsp/u-boot/u-boot.inc
 
-PR = "r15"
-PV = "v2009.11"
+PR = "r16"
+PV_virtex5    = "v2012.04.01"
+PV_microblaze = "v2009.11"
+
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
+LIC_FILES_CHKSUM_virtex5 = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+LIC_FILES_CHKSUM_microblaze = "file://COPYING;md5=4c6cde5df68eff615d36789dc18edd3b"
+
+# Virtex-5 src location
+KBRANCH_virtex5 = "master"
+SRC_URI_virtex5 = "git://git.denx.de/u-boot.git;branch=${KBRANCH};protocol=git"
+SRCREV_${PN}_virtex5 = "415d386877df49eb051b85ef74fa59a16dc17c7d"
 
-KBRANCH = "master"
-KBRANCH_microblaze = "microblaze"
 # Microblaze src location
-SRC_URI = "git://git.xilinx.com/u-boot-xlnx.git;branch=${KBRANCH};protocol=git \
+KBRANCH_microblaze = "microblaze"
+SRC_URI_microblaze = "git://git.xilinx.com/u-boot-xlnx.git;branch=${KBRANCH};protocol=git \
            file://ml405-add-uartlite-config-options.patch \
            file://ml405-replace-hardcode-macros-for-uartns550.patch \
            file://ml507-add-uartlite-config-options.patch \
-           file://ml507-replace-hardcode-macros-for-uartns550.patch"
-SRU_URI_microblaze += " file://microblaze-genric-add-spi-flash-config.patch \
-                        file://board-microblaze-monitor-flash-len.patch \
-                        file://cfi_flash-define-monitor_flash_len.patch"
+           file://ml507-replace-hardcode-macros-for-uartns550.patch \
+           file://microblaze-genric-add-spi-flash-config.patch \
+           file://board-microblaze-monitor-flash-len.patch \
+           file://cfi_flash-define-monitor_flash_len.patch"
 
 XILINX_BOARD ?= "${@find_board(bb.data.getVar('XILINX_BSP_PATH', d, 1), d)}"
 
-- 
1.7.9.5



