Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sd0P7-0001GL-1e
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 16:43:09 +0200
Received: by wgbdr1 with SMTP id dr1so888139wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ty8o03Pg0FDy1TXitF77G42yTSSu5JGGsBUN5wisKmI=;
	b=CHaifhWpg30GK38gxaN4iuDtQt4KbUzXN6o+8mYC+JyV9bDPY/WPsMUllxaTtIFAbh
	mxGJ5pW3tMVA03psIrxfksU5v7L+IcFvEJdW2Bw69UttUB6HN/jLUQbehsKRBJCNv242
	WxEEKjM2Pm1FnF6aXRN6kJZ0D/48CVowxcuH4P/e21MU6ONuOWxYMyTidOe1fOJuJV5l
	It40RJzLhE5H5rk195dva9SQAx6wpWWmkrebZUaHfSqSkru5mPsCMdiw5pINyek/VVFP
	SzCpWtz1wV9k+U/ELg6u/6g/qYcaGB8xLroOuDxmbAQzu3e2Jp6Ey8lQ/k3fG+wn/P9F
	Jppg==
Received: by 10.180.78.233 with SMTP id e9mr891403wix.5.1339165959455;
	Fri, 08 Jun 2012 07:32:39 -0700 (PDT)
Received: from localhost.localdomain (89.Red-83-42-2.dynamicIP.rima-tde.net.
	[83.42.2.89])
	by mx.google.com with ESMTPS id e20sm1540560wiv.7.2012.06.08.07.32.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 07:32:38 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 16:32:21 +0200
Message-Id: <1339165942-53107-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-xilinx] xilinx-kernel: Change string comparision checks to use strict POSIX compliance.
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
X-List-Received-Date: Fri, 08 Jun 2012 14:43:09 -0000

This commit fixes an issue with string comparision checks failing because
of not using strict POSIX compliance, therby failing to copy the device
tree from the hardware model to the linux kernel device tree.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 classes/xilinx-kernel.bbclass |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/classes/xilinx-kernel.bbclass b/classes/xilinx-kernel.bbclass
index c0e11fe..14f4c7d 100644
--- a/classes/xilinx-kernel.bbclass
+++ b/classes/xilinx-kernel.bbclass
@@ -42,10 +42,12 @@ if [ -n "${XILINX_BSP_PATH}" ]; then
 	if [ "${XILINX_BOARD}" != "unknown" ]; then
 		dts=`find "${XILINX_BSP_PATH}" -name *.dts -print`
 		if [ -e "$dts" ]; then
-			bbnote "Replacing device tree to match hardware model"
-			if [ "${TARGET_ARCH}" == "powerpc" ]; then
+			bbnote "Xilinx BSP device tree located in: ${dts}"
+			if [ "${TARGET_ARCH}" = "powerpc" ]; then
+				bbnote "Replacing linux kernel powerpc device tree to match located hardware model"
 				cp -pP ${dts} ${S}/arch/powerpc/boot/dts/virtex${KERNEL_TARGET}.dts
 			else
+				bbnote "Replacing linux kernel microblaze device tree to match located hardware model"
 				cp -pP ${dts} ${S}/arch/microblaze/platform/generic/${KERNEL_TARGET}.dts
 			fi
 		else
-- 
1.7.9.5



