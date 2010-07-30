Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OerhY-0000lV-Rb
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 17:40:51 +0200
Received: by wyb38 with SMTP id 38so1347518wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 08:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4jjzu6WfKD7bQIgfkm2YF6PYYFb2R07ojIj6X2HEFuc=;
	b=MTLPHgF1SnbP05io7KwU+pklN77sw9BjBUwSd5RY7GRRfRdu+q3zbyxJ65Yp4EJL+E
	z039lyP9vKAp8gCTxYrAuF6MLKEap5MfYy6UAs825BZclO8ym9OmMKn09eIe8z0/NJmJ
	fXUVRgEbFdFfl5SehPqKvzHtceZLLiGaOhRIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=YAuF4RudVP8Sy2lVVHLhUNR0VAt4wWyn9oi5iig+qYJIRkc+Dt3yZVbdJfH2iiJW82
	6WSnl3SHY2YUzOBZE8anRpjompx82Nnbt2YbrOoOGrnNM+NXWI/EXCsMMkuoFJIQbuoi
	/TWV9pYd4/Ty1jtm6e7ZBKOF+ESqWt1+h9ey8=
Received: by 10.227.146.142 with SMTP id h14mr1912676wbv.25.1280504428202;
	Fri, 30 Jul 2010 08:40:28 -0700 (PDT)
Received: from aalonso-pc.lan ([201.153.218.190])
	by mx.google.com with ESMTPS id h3sm2015014wbb.15.2010.07.30.08.40.25
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Jul 2010 08:40:27 -0700 (PDT)
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 10:42:26 -0500
Message-Id: <1280504555-3633-1-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <openembedded-devel@lists.openembedded.org>
References: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 01/10] xilinx-bsp: handle more xilinx targets
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
X-List-Received-Date: Fri, 30 Jul 2010 15:40:51 -0000

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
index d32c60e..35f7108 100644
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
 			else
-				oenote "Device tree not found in project dir"
+				oefatal "No device tree found, missing hardware ref design?"
+				exit 1
 			fi
-		;;
-		*)
-			oefatal "! Unknow Xilinx board ! Exit ..."
-			exit 1
-		;;
-	esac
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
+			else
+				oefatal "No xparameters header file found, missing hardware ref design?"
+			fi
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
1.7.2



