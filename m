Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sd0kt-0004tW-VP
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 17:05:40 +0200
Received: by wibhm14 with SMTP id hm14so616987wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uYaOQrNpCdRl2yCFPaBDmWdRy+2GMspuRnZc4J1AxmM=;
	b=kRjmfu53McS27bE4Z8DlNQUOqo0tUNvyk7l+q3HmXOAs8f/KY9SBXD/5AyxYLA2za1
	Q+WwRqz4tWS9VzwSCQbArko+zUP7S/F3HJi4pktMsOB/3G+PftrPIVqR/vDT3kuB/BR2
	bHMsps867yaMNZD+6awHvb6M2SeONqiXGZyt8xuAWb7Lp3y1gjcu1U5nvnABuOqhEJNW
	RtpPtdHq7ZaZs91LVsc5on7hYUMrmIzGnSx+HRBpil4SCTc5wjWe3kyvHtfVmUmuLhaJ
	tkOkmMhmEtvdyDcPFHHjZFfwxFPn4OK2MEwIl56TJhFAd3NQkr8qX+fiPHomaufDzCyd
	q63A==
Received: by 10.216.228.224 with SMTP id f74mr1465356weq.217.1339167310207;
	Fri, 08 Jun 2012 07:55:10 -0700 (PDT)
Received: from localhost.localdomain (89.Red-83-42-2.dynamicIP.rima-tde.net.
	[83.42.2.89])
	by mx.google.com with ESMTPS id d3sm2712304wiz.9.2012.06.08.07.55.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 07:55:09 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2012 16:54:48 +0200
Message-Id: <1339167288-21116-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <y>
References: <y>
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
X-List-Received-Date: Fri, 08 Jun 2012 15:05:40 -0000

This commit fixes an issue with string comparision checks failing because
of not using strict POSIX compliance, thereby failing to copy the device
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



