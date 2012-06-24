Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sipgs-0007FU-RU
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jun 2012 18:29:35 +0200
Received: by dalh21 with SMTP id h21so4117401dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2012 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lLi6yeeHfGGJMrLWnPa7iJYd8rL5tcJyZefHhR9y/FM=;
	b=CflaY+bqH6qQ6SBwGiFco5vN231VHLkUJb1lyQ2GFx6ZuWDnOeeskFQQveaPyIn3/V
	UzvIaUoh0s+C41d8isw3iZkWZiGyzKI3ryy9I2xHKwvRIycBKwoRMwTvD86pXKhO8Rl1
	z6ULY5EVBjUMNmt4qH66Cvz6BabF76EHvCg0WGs4UKTqv9x3DdXN30vzblGR8pboOfqb
	cXjmG4Roe5hNA+MuXEv0XoFxCNx10cFTkEXyUIaW//Kxc19sF72DAs1oa0fnV+iUHCkZ
	Fa1UIBdX2XMg9R+sl4l00CUF9rX14ujvk5sTNvSPhNxk98u9pBceNOqlt5ZZpha1Nbj3
	l9pQ==
Received: by 10.68.190.40 with SMTP id gn8mr31506497pbc.118.1340554723925;
	Sun, 24 Jun 2012 09:18:43 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id gj8sm5696462pbc.39.2012.06.24.09.18.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jun 2012 09:18:42 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2012 18:18:23 +0200
Message-Id: <1340554704-46207-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx 1/2] xilinx-boot: Refactor recipe to add support for Xilinx ISE 14.1.
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
X-List-Received-Date: Sun, 24 Jun 2012 16:29:35 -0000

* Refactor recipe to add support for Xilinx ISE 14.1.
* Fix minor spelling mistakes.
* Add additional log messages.

Ensure that you reconfigure your shell to use bash instead of dash while
building with Ubuntu 12.04 LTS.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 classes/xilinx-boot.bbclass |   41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/classes/xilinx-boot.bbclass b/classes/xilinx-boot.bbclass
index a7f1f1d..85fb6d9 100644
--- a/classes/xilinx-boot.bbclass
+++ b/classes/xilinx-boot.bbclass
@@ -65,20 +65,31 @@ bbnote "Generate system ace image"
 # Set Xilinx EDK tools
 if [ -z ${XILINX_EDK} ]; then
 	# Get Xilinx version
-	if [ "${BUILD_ARCH}" = "x86_64" ]; then
-		EDK_SRCIPT="settings64.sh"
-	else
-		EDK_SRCIPT="settings.sh"
-	fi
-	# Strip EDK version
 	XILINX_VER=`echo ${XILINX_LOC} | tr -d '[:alpha:]/_'`
+	bbnote "XILINX ISE version ${XILINX_VER}, EDK script location ${XILINX_LOC}/${EDK_SCRIPT}"
 	if [ "${XILINX_VER}" \> "13" ]; then
-		source ${XILINX_LOC}/${EDK_SRCIPT} ${XILINX_LOC}
+		# EDK version 13.1 and higher
+		# Check host computer build architecture
+		if [ "${BUILD_ARCH}" = "x86_64" ]; then
+			EDK_SCRIPT="settings64.sh"
+		else
+			EDK_SCRIPT="settings32.sh"
+		fi
+		# Setup Xilinx environment variables
+		source ${XILINX_LOC}/${EDK_SCRIPT} ${XILINX_LOC}
 	else
-		# EDK version prior to 13.1 require to additionaly source this scripts
-		source ${XILINX_LOC}/${EDK_SRCIPT} ${XILINX_LOC}
-		source ${XILINX_LOC}/ISE/${EDK_SRCIPT} ${XILINX_LOC}/ISE
-		source ${XILINX_LOC}/EDK/${EDK_SRCIPT} ${XILINX_LOC}/EDK
+		# EDK versions prior to 13.1
+		# Check host computer build architecture
+		if [ "${BUILD_ARCH}" = "x86_64" ]; then
+			EDK_SCRIPT="settings64.sh"
+		else
+			EDK_SCRIPT="settings.sh"
+		fi
+		# Setup Xilinx environment variables
+		# EDK versions prior to 13.1 require additional ISE and EDK scripts to be sourced
+		source ${XILINX_LOC}/${EDK_SCRIPT} ${XILINX_LOC}
+		source ${XILINX_LOC}/ISE/${EDK_SCRIPT} ${XILINX_LOC}/ISE
+		source ${XILINX_LOC}/EDK/${EDK_SCRIPT} ${XILINX_LOC}/EDK
 	fi
 fi
 
@@ -90,11 +101,12 @@ fi
 # This could be ovirrided by setting in ${XILINX_BSP_PATH}/system_incl.make
 # BRAMINIT_ELF_FILES = $(PPC440_0_BOOTLOOP)
 # BRAMINIT_ELF_FILES_ARGS = -pe ppc440_0 $(PPC440_0_BOOTLOOP)
-# For Xilinx EDK 13.1 Bootlop is set by default
+# For Xilinx EDK 13.1 Bootloop is set by default
 #
 cd ${XILINX_BSP_PATH}
 if [ ! -f implementation/download.bit ]; then
 	# Bitstream not found generate it
+	bbnote "bitstream not found, generating it"
 	make -f ${XILINX_BSP_PATH}/system.make init_bram
 fi
 
@@ -141,16 +153,17 @@ do_deploy_prepend() {
 # Install u-boot elf image
 if [ -d "${XILINX_BSP_PATH}" ]; then
 	if [ -e "${S}/u-boot" ]; then
-        bbnote "Deploy uboot elf image"
+        bbnote "Deploying uboot elf image to ${XILINX_BSP_PATH}"
 		install ${S}/u-boot ${XILINX_BSP_PATH}
     fi
     if [ -n "${XILINX_LOC}" ]; then
+                bbnote "Xilinx design tools installed in ${XILINX_LOC}"
 		do_mk_sysace
         if [ -e  "${XILINX_BSP_PATH}/u-boot-${XILINX_BOARD}.ace" ]; then
 		    install ${XILINX_BSP_PATH}/u-boot-${XILINX_BOARD}.ace ${DEPLOYDIR}
         fi
     else
-        bbnote "XILINX_LOC undifined can't generate system ace image"
+        bbnote "XILINX_LOC undefined can't generate system ace image"
     fi
 fi
 }
-- 
1.7.9.5



