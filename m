Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sawxw-00049x-5A
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jun 2012 00:38:36 +0200
Received: by wgbds1 with SMTP id ds1so1395453wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 15:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=R6hicAfclfoz6nY+lGmW+5BTS4KfBKLnTrWbUQcpEq8=;
	b=UrgAwo7pYwoeV+k7W6k/Rba7F11VVARrSikUb7qj0DHqFxqWIp/rhZrk/bo+jgeYHK
	Rle6l3IvxRJ7TsAN1U9GaVstY4Nn3OrSW6RhMGNoiA68b2hABi4TXmJi8IKb9h0gqi+O
	66VgoJeqgkVg25lnRJbhB9j7JJxdKFM2XWEMbL3c9hwC91jiF5mFzpZ+mTZkw/zM8V0u
	mkPziPV5pe0B/pnwKAMlITyxllPwUuNqSItLU1yqrAJtviw64G8F/8eMRoTVnqniMyIr
	ow+nGWWXKlqOX6tmn3fVCnuOABPIkp+uAGzzEYRyxlVAyWslgZ/P0BoTk2euy5GrXfic
	bVtA==
Received: by 10.216.195.12 with SMTP id o12mr6392297wen.194.1338676093559;
	Sat, 02 Jun 2012 15:28:13 -0700 (PDT)
Received: from localhost.localdomain
	(197.Red-79-150-15.dynamicIP.rima-tde.net. [79.150.15.197])
	by mx.google.com with ESMTPS id d10sm12697181wiy.3.2012.06.02.15.28.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 15:28:12 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2012 00:28:07 +0200
Message-Id: <1338676087-29276-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] xilinx-boot: Change string comparision checks to use strict POSIX compliance.
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
X-List-Received-Date: Sat, 02 Jun 2012 22:38:36 -0000

This commit fixes an issue with string comparision checks failing because
of not using strict POSIX compliance, therby resulting in wrong definitions
being generated into the ${xparam} file.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 classes/xilinx-boot.bbclass |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/classes/xilinx-boot.bbclass b/classes/xilinx-boot.bbclass
index d85ab80..a7f1f1d 100644
--- a/classes/xilinx-boot.bbclass
+++ b/classes/xilinx-boot.bbclass
@@ -21,10 +21,10 @@
 do_export_xparam() {
 bbnote "Replacing xparameters header to match hardware model"
 xparam=$1
-if [ "${TARGET_ARCH}" == "powerpc" ]; then
+if [ "${TARGET_ARCH}" = "powerpc" ]; then
 	cpu="PPC`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
 else
-	cpu=`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`
+	cpu="`echo ${TARGET_CPU} | tr '[:lower:]' '[:upper:]'`"
 fi
 cp ${xparam} ${S}/board/xilinx/${XILINX_BOARD}
 echo "/*** Cannonical definitions ***/
@@ -39,7 +39,7 @@ echo "/*** Cannonical definitions ***/
 do_mk_xparam() {
 bbnote "Replacing xparameters.mk configuration file"
 xparam=$1
-if [ "${TARGET_ARCH}" == "powerpc" ]; then
+if [ "${TARGET_ARCH}" = "powerpc" ]; then
     if grep -qoe XPAR_IIC_0_DEVICE_ID ${xparam}; then
         echo -e "XPAR_IIC        := y" > ${S}/board/xilinx/${XILINX_BOARD}/xparameters.mk
     else
@@ -65,7 +65,7 @@ bbnote "Generate system ace image"
 # Set Xilinx EDK tools
 if [ -z ${XILINX_EDK} ]; then
 	# Get Xilinx version
-	if [ ${BUILD_ARCH} == "x86_64" ]; then
+	if [ "${BUILD_ARCH}" = "x86_64" ]; then
 		EDK_SRCIPT="settings64.sh"
 	else
 		EDK_SRCIPT="settings.sh"
@@ -98,7 +98,7 @@ if [ ! -f implementation/download.bit ]; then
 	make -f ${XILINX_BSP_PATH}/system.make init_bram
 fi
 
-if [ "${TARGET_ARCH}" == "powerpc" ]; then
+if [ "${TARGET_ARCH}" = "powerpc" ]; then
 	# Find u-boot start address
 	start_address=`${TARGET_PREFIX}objdump -x u-boot | grep -w "start address" | cut -d ' ' -f3`
 	# Generate ACE image
-- 
1.7.9.5



