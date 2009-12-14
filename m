Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NJypH-0007Pm-R6
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 01:30:14 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Dec 2009 01:27:24 +0100
Received: from FBCMCL01B05.fbc.local ([192.168.69.86]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Dec 2009 01:26:32 +0100
Received: from localhost.localdomain ([79.1.252.110]) by FBCMCL01B05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Dec 2009 01:26:32 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2009 01:26:21 +0100
Message-Id: <1260750381-15943-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.4.4
X-OriginalArrivalTime: 14 Dec 2009 00:26:32.0192 (UTC)
	FILETIME=[1603B800:01CA7C54]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] kernel.bbclass: deploy all kind of compressed initramfs cpio images.
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
X-List-Received-Date: Mon, 14 Dec 2009 00:30:14 -0000


Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 classes/kernel.bbclass |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index edeaa66..a05a56e 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -201,8 +201,12 @@ kernel_do_install() {
 kernel_do_configure() {
 	yes '' | oe_runmake oldconfig
 	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
-		cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" initramfs.cpio.gz
-	fi 
+		for img in cpio.gz cpio.lzo cpio.lzma; do
+		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
+			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
+		fi
+		done
+	fi
 }
 
 do_menuconfig() {
-- 
1.6.4.4



