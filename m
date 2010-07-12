Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OYP0b-0004Nt-Sf
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 21:49:48 +0200
Received: by mail-px0-f175.google.com with SMTP id 12so1308700pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MXiqVBfkqxiPbabt5hjw6pSf4nA+810I3zvPb1mt1TQ=;
	b=Efwn4LmSUsLrbfD1mptuW7WEpqHJfDkfCVksKiQ7fC1z0Ml9j3plwiuNiyeF+qjHIm
	EEQ94CgMAmEeBwlkVFjCH07kU+B2R53R8qxwHg8S1FEeX3lV6IhIk3ys7KOj09kvYOtj
	eavCI2f5ABpv1xLqfIsVE8lrpedftp8daVWck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=RHq30lv2NQgl29BT7TW3Cm+ojy7BiMJJK8j6yjOQEVxIx6joRYXeCmlBwBF/B3L1Ja
	RGFIvDuPeZrbTSytTev1E/Q/mZ6ARAVaIPIzJJ9x8Hwhla2fpWamyiliprGLStFM6uDY
	EEOEIkHekKRh6JD64Fmz/NKoXXeDdMdHQKs9Q=
Received: by 10.142.153.8 with SMTP id a8mr12868910wfe.272.1278963891102;
	Mon, 12 Jul 2010 12:44:51 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.224.36])
	by mx.google.com with ESMTPS id 23sm5192380wfa.22.2010.07.12.12.44.48
	(version=SSLv3 cipher=RC4-MD5); Mon, 12 Jul 2010 12:44:49 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jul 2010 14:45:47 -0500
Message-Id: <1278963950-2587-6-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.1.1
In-Reply-To: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
References: <1278963950-2587-1-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 6/9] xilinx-bsp: handle more xilinx targets
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
X-List-Received-Date: Mon, 12 Jul 2010 19:49:49 -0000

* Rewrite for handling most xilinx platforms
* Add helper functions for configuring the target board
* User must add in local.conf:
  TARGET_ARCH = "powerpc" | "microblaze"
  XILINX_BOARD = "ml401" | "ml403" | "ml410" | "ml507" | "ml510"
  whit this varibales u-boot and the linux kernel gets configured
  for a selected board.

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 classes/xilinx-bsp.bbclass |  109 +++++++++++++++++++++++++++++++++++---------
 1 files changed, 87 insertions(+), 22 deletions(-)

diff --git a/classes/xilinx-bsp.bbclass b/classes/xilinx-bsp.bbclass
index d32c60e..77e7faa 100644
--- a/classes/xilinx-bsp.bbclass
+++ b/classes/xilinx-bsp.bbclass
@@ -14,6 +14,47 @@
 #Xilinx ML403
 #Xilinx ML507
 #More to come soon ;)
+#oenote "ML403 board setup"
+# Treat this as legacy substitution find when xparatemer was deprecated in favor of dts
+#cp -pPR ${XILINX_BSP_PATH}/ppc405_0/libsrc/linux_2_6_v1_00_a/linux/arch/ppc/platforms/4xx/xparameters/xparameters_ml40x.h \
+#${S}/arch/ppc/platforms/4xx/xparameters/xparameters_ml403.h
+
+def map_target(a, d):
+	import re
+	board = bb.data.getVar('XILINX_BOARD', d, 1)
+
+	if re.match('powerpc', a):
+		cpu = bb.data.getVar('TARGET_CPU', d, 1)
+		return 'ppc' + cpu + '-' + board
+	else:
+		return 'system'
+
+
+def uboot_machine(a, d):
+	import re
+
+	board = bb.data.getVar('XILINX_BOARD', d, 1)
+
+	if board in ['ml300', 'ml401', 'ml405', 'ml507']:
+		return board + '_config'
+	elif re.match('powerpc', a):
+		return 'xilinx-ppc' + bb.data.getVar('TARGET_CPU', d, 1) + '-generic_config'
+	else:
+		return 'microblaze-generic_config'
+
+def uboot_target(a, d):
+	import re
+
+	board = bb.data.getVar('XILINX_BOARD', d, 1)
+	target = bb.data.getVar('TARGET_CPU', d, 1) + '-generic'
+
+	if board in ['ml300', 'ml401', 'ml405', 'ml507']:
+		return board
+	elif re.match('powerpc', a):
+		return 'ppc' + target
+	else:
+		return target
+
 
 do_configure_prepend() {
 
@@ -21,27 +62,47 @@ do_configure_prepend() {
 #now depending on the board type and arch do what is nessesary
 
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
+			#xparam=`find "${XILINX_BSP_PATH}" -name xparameters.h -print`
+			if [ "${TARGET_ARCH}" == "powerpc" ]; then
+				xparam="${XILINX_BSP_PATH}/ppc${TARGET_CPU}_0/include/xparameters.h"
+				cpu="PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
+			else
+				xparam="${XILINX_BSP_PATH}/${TARGET_CPU}_0/include/xparameters.h"
+				cpu=`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
+			fi
+			if [ -e "$xparam" ]; then
+				cp ${xparam} ${S}/board/xilinx/${UBOOT_TARGET}
+				echo "/*** Cannonical definitions ***/
+#define XPAR_PLB_CLOCK_FREQ_HZ XPAR_PROC_BUS_0_FREQ_HZ
+#define XPAR_CORE_CLOCK_FREQ_HZ XPAR_CPU_${cpu}_CORE_CLOCK_FREQ_HZ
+#ifndef XPAR_DDR2_SDRAM_MEM_BASEADDR
+# define XPAR_DDR2_SDRAM_MEM_BASEADDR XPAR_DDR_SDRAM_MPMC_BASEADDR
+#endif
+#define XPAR_PCI_0_CLOCK_FREQ_HZ    0" >> ${S}/board/xilinx/${UBOOT_TARGET}/xparameters.h
 			else
-				oenote "Device tree not found in project dir"
+				oefatal "No xparameters header file found, missing hardware ref design?"
 			fi
-		;;
-		*)
-			oefatal "! Unknow Xilinx board ! Exit ..."
-			exit 1
-		;;
-	esac
+		fi
+	else
+		oefatal "XILINX_BOARD not defined ! Exit"
+		exit 1
+	fi
 else
 	oefatal "XILINX_BSP_PATH not defined ! Exit"
 	exit 1
@@ -49,7 +110,11 @@ fi
 
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
1.7.1.1



