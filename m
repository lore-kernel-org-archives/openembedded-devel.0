Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OgKF1-0007sx-7r
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 18:21:23 +0200
Received: by fxm12 with SMTP id 12so2157248fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=A52R7biVm40IT2Y4rweY8+pvVUYPJxwnm7ui8NzhjIw=;
	b=mBF1XN6RVzp6izicC+1NfAtRIocRPIsJZKG+lKZlV99Y3pXOOG/pCrqxX41vgrsZUC
	ePEFlEbIL127hx961dlMZD1i1ahTP5AlhaEuWRT1MB5kHPPFhyuheUH/inpL3sJebAK8
	vugYgWEyZ+JUYTgkdy4RuPLZ6Lbb+1FqjNH9Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rr4CmNrjMs9bKKSudB9Ew3I6utQxetb0widGOBB9iHSC6i1nZRYPo4mMU5QQlctTuG
	g2ohsJJG5a0UVGqmyRYylEhdI8m+XOzVPbYN3IQYTEijC56ga6UVSqsiM0Dg4VFgjyUR
	4G9C7Nbn+nNp2aqFPeNUsqgtxwcG9VydL5ZwQ=
Received: by 10.223.110.212 with SMTP id o20mr7638834fap.27.1280852477322;
	Tue, 03 Aug 2010 09:21:17 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.72.151])
	by mx.google.com with ESMTPS id s20sm2570960faa.28.2010.08.03.09.21.14
	(version=SSLv3 cipher=RC4-MD5); Tue, 03 Aug 2010 09:21:16 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Aug 2010 11:23:15 -0500
Message-Id: <1280852605-3524-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/11][v2] xilinx-bsp: Rewrite to handle xilinx virtex4 virtex5 targets
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
X-List-Received-Date: Tue, 03 Aug 2010 16:21:24 -0000

* Rewrite for handling most xilinx target virtex4 and virtex5 based
* Add helper functions for configuring the target board
* User must add in local.conf:
  XILINX_BOARD = "ml401" | "ml403" | "ml405" | "ml410" | "ml507" | "ml510"
  XILINX_BSP_PATH = "Xilinx XPS  hardware project dir"
  with this variables u-boot and the linux kernel gets configured
  for a selected board.
* xilinx-bsp exits when there is no hardware project or when parameters
  header or the linux kernel device tree haven't been generated in
  Xilinx XPS [1] in order to match hardware/software model
* Only tested for powerpc based hardware projects
* [1] Xilinx XPS -> Xilinx Platform Studio
* v2 add additional comments

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 classes/xilinx-bsp.bbclass |  119 +++++++++++++++++++++++++++++++++----------
 1 files changed, 91 insertions(+), 28 deletions(-)

diff --git a/classes/xilinx-bsp.bbclass b/classes/xilinx-bsp.bbclass
index d32c60e..eb47634 100644
--- a/classes/xilinx-bsp.bbclass
+++ b/classes/xilinx-bsp.bbclass
@@ -1,7 +1,8 @@
 # Copyright (C) 2007, Stelios Koroneos - Digital OPSiS, All Rights Reserved
+# Copyright (C) 2010, Adrian Alonso <aalonso00@gmail.com>
 # Released under the MIT license (see packages/COPYING)
 #
-#This class handles all the intricasies of getting the required files from the 
+#This class handles all the intricasies of getting the required files from the
 #ISE/EDK/project to the kernel and prepare the kernel for compilation.
 #The Xilinx EDK supports 2 different architectures : PowerPC (ppc 405,440) and Microblaze
 #Only the PowerPC BSP has been tested so far
@@ -10,46 +11,108 @@
 #XILINX_BSP_PATH should have the complete path to your project dir
 #XILINX_BOARD should have the board type i.e ML403
 #
-#Currently supported boards
-#Xilinx ML403
+#Currently tested on
+#Xilinx ML405
 #Xilinx ML507
 #More to come soon ;)
 
-do_configure_prepend() {
+def map_target(a, d):
+	import re
+	board = bb.data.getVar('XILINX_BOARD', d, 1)
+	cpu = bb.data.getVar('TARGET_CPU', d, 1)
+
+	if re.match('powerpc', a):
+		return 'ppc' + cpu + '-' + board
+	else:
+		return 'system'
+
+def uboot_machine(a, d):
+    import re
+
+    board = bb.data.getVar('XILINX_BOARD', d, 1)
+    if board in ['ml300', 'ml401', 'ml403', 'ml405', 'ml507', 'ml510']:
+        if re.match('powerpc', a):
+            if board == 'ml403':
+                return 'ml401_config'
+            elif board == 'ml510':
+                return 'ml507_config'
+            else:
+                return board + '_config'
+        else:
+            return 'microblaze-generic_config'
+
+def uboot_target(a, d):
+    import re
 
+    board = bb.data.getVar('XILINX_BOARD', d, 1)
+    target = bb.data.getVar('TARGET_CPU', d, 1) + '-generic'
+    if board in ['ml300', 'ml401', 'ml403', 'ml405', 'ml507', 'ml510']:
+        if re.match('powerpc', a):
+            if board == 'ml403':
+                return 'ml401'
+            elif board == 'ml510':
+                return 'ml507'
+            else:
+                return board
+        else:
+            return target
+
+do_configure_prepend() {
 #first check that the XILINX_BSP_PATH and XILINX_BOARD have been defined in local.conf
 #now depending on the board type and arch do what is nessesary
-
 if [ -n "${XILINX_BSP_PATH}" ]; then
-	case "${XILINX_BOARD}" in
-		ml403 | ML403)
-			oenote "ML403 board setup"
-			cp -pPR ${XILINX_BSP_PATH}/ppc405_0/libsrc/linux_2_6_v1_00_a/linux/arch/ppc/platforms/4xx/xparameters/xparameters_ml40x.h \
-                ${S}/arch/ppc/platforms/4xx/xparameters/xparameters_ml403.h
-		;;
-		ml507 | ML507)
-			oenote "Xilinx ML507 board setup"
+	if [ -n "${XILINX_BOARD}" ]; then
+		if [ -d "${S}/arch/${TARGET_ARCH}/boot" ]; then
 			dts=`find "${XILINX_BSP_PATH}" -name *.dts -print`
-			if [ -n "$dts" ]; then
-				oenote "Replacing device tree with ${dts}"
-				cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex440-ml507.dts
+			if [ -e "$dts" ]; then
+				oenote "Replacing device tree to match hardware model"
+				if [ "${TARGET_ARCH}" == "powerpc" ]; then
+					cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex${TARGET_BOARD}.dts
+				else
+					cp -pP ${dts} ${S}/arch/microblaze/platform/generic/${TARGET_BOARD}.dts
+				fi
+			else
+				oefatal "No device tree found, missing hardware ref design?"
+				exit 1
+			fi
+		elif [ -d "${S}/board/xilinx" ]; then
+			oenote "Replacing xparameters header to match hardware model"
+			if [ "${TARGET_ARCH}" == "powerpc" ]; then
+				xparam="${XILINX_BSP_PATH}/ppc${TARGET_CPU}_0/include/xparameters.h"
+				cpu="PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
 			else
-				oenote "Device tree not found in project dir"
+				xparam="${XILINX_BSP_PATH}/${TARGET_CPU}_0/include/xparameters.h"
+				cpu=`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
 			fi
-		;;
-		*)
-			oefatal "! Unknow Xilinx board ! Exit ..."
-			exit 1
-		;;
-	esac
+			if [ -e "$xparam" ]; then
+				cp ${xparam} ${S}/board/xilinx/${UBOOT_TARGET}
+				echo "/*** Cannonical definitions ***/
+#define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ
+#define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ
+#ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR
+# define XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR
+#endif
+#define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> ${S}/board/xilinx/${UBOOT_TARGET}/xparameters.h
+			else
+				oefatal "No xparameters header file found, missing hardware ref design?"
+                exit 1
+			fi
+		fi
+	else
+		oefatal "XILINX_BOARD not defined ! Exit"
+		exit 1
+	fi
 else
 	oefatal "XILINX_BSP_PATH not defined ! Exit"
 	exit 1
 fi
-
 }
 
-
-
-
-
+do_deploy_prepend() {
+# Install u-boot elf image
+if [ -d "${XILINX_BSP_PATH}" ]; then
+	if [ -e "${S}/u-boot" ]; then
+		install ${S}/u-boot ${XILINX_BSP_PATH}
+	fi
+fi
+}
-- 
1.7.2



