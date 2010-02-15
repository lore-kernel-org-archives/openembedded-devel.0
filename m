Received: from [148.204.65.238] (helo=localhost.localdomain)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso@localhost.localdomain>) id 1Nh7I6-0004Yi-Rj
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 21:11:38 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.3/8.14.3) with ESMTP id o1FKGQAm007132; 
	Mon, 15 Feb 2010 14:16:26 -0600
Received: (from aalonso@localhost)
	by localhost.localdomain (8.14.3/8.14.3/Submit) id o1FKGQ8R007131;
	Mon, 15 Feb 2010 14:16:26 -0600
From: aalonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2010 14:15:13 -0600
Message-Id: <1266264914-7069-3-git-send-email-aalonso00@gmail.com>
X-Mailer: git-send-email 1.6.6
In-Reply-To: <1266264914-7069-2-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1266264914-7069-1-git-send-email-aalonso00@gmail.com>
	<1266264914-7069-2-git-send-email-aalonso00@gmail.com>
X-SA-Exim-Connect-IP: 148.204.65.238
X-SA-Exim-Mail-From: aalonso@localhost.localdomain
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] xilinx-bsp.bbclass: add support for xilinx ml507 Signed-off-by: aalonso <aalonso00@gmail.com>
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
X-List-Received-Date: Mon, 15 Feb 2010 20:11:38 -0000

---
 classes/xilinx-bsp.bbclass |   56 +++++++++++++++++++++----------------------
 1 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/classes/xilinx-bsp.bbclass b/classes/xilinx-bsp.bbclass
index f657e5b..c719b3b 100644
--- a/classes/xilinx-bsp.bbclass
+++ b/classes/xilinx-bsp.bbclass
@@ -3,7 +3,7 @@
 #
 #This class handles all the intricasies of getting the required files from the 
 #ISE/EDK/project to the kernel and prepare the kernel for compilation.
-#The Xilinx EDK supports 2 different architectures : PowerPC (ppc 405) and Microblaze
+#The Xilinx EDK supports 2 different architectures : PowerPC (ppc 405,440) and Microblaze
 #Only the PowerPC BSP has been tested so far
 #For this to work correctly you need to add XILINX_BSP_PATH and XILINX_BOARD to your 
 #local.conf
@@ -12,42 +12,40 @@
 #
 #Currently supported boards
 #Xilinx ML403
+#Xilinx ML507
 #More to come soon ;)
 
 do_configure_prepend() {
 
-
 #first check that the XILINX_BSP_PATH and XILINX_BOARD have been defined in local.conf
-if [ -z "${XILINX_BSP_PATH}" ]; then
-   oefatal "XILINX_BSP_PATH not defined ! Exiting..."
-   exit 1
-
-else
-   if [ -z "${XILINX_BOARD}" ]; then
-      oefatal "XILINX_BOARD not defined ! Exiting"
-      exit 1
-   fi
-
-fi
 #now depending on the board type and arch do what is nessesary
 
-case "${XILINX_BOARD}" in
-     ML403)
-        oenote "ML403 board setup"
-        cp -pPR ${XILINX_BSP_PATH}/ppc405_0/libsrc/linux_2_6_v1_00_a/linux/arch/ppc/platforms/4xx/xparameters/xparameters_ml40x.h \
+if [ -n "${XILINX_BSP_PATH}" ]; then
+	case "${XILINX_BOARD}" in
+		ml403 | ML403)
+			oenote "ML403 board setup"
+			cp -pPR ${XILINX_BSP_PATH}/ppc405_0/libsrc/linux_2_6_v1_00_a/linux/arch/ppc/platforms/4xx/xparameters/xparameters_ml40x.h \
                 ${S}/arch/ppc/platforms/4xx/xparameters/xparameters_ml403.h
-     ;;
-
-     *    ) 
-      oefatal "! Unknow Xilinx board ! Exiting..."
-      exit 1
-     ;;
-esac               
-
+		;;
+		ml507 | ML507)
+			oenote "Xilinx ML507 board setup"
+			dts=`find "${XILINX_BSP_PATH}" -name *.dts -print`
+			if [ -n "$dts" ]; then
+				oenote "Replacing device tree with ${dts}"
+				cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex440-ml507.dts
+			else
+				oenote "Device tree not found in project dir"
+			fi
+		;;
+		*) 
+			oefatal "! Unknow Xilinx board ! Exit ..."
+			exit 1
+		;;
+	esac               
+else
+	oefatal "XILINX_BSP_PATH not defined ! Exit"
+	exit 1
+fi
 
 }
 
-
-
-
-
-- 
1.6.6



