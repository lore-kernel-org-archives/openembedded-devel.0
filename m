Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letam-0005ca-IA
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:09 +0100
Received: (qmail 28332 invoked by uid 813007); 4 Mar 2009 15:54:16 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:16 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQ9-0001FJ-1a; Wed, 04 Mar 2009 16:54:09 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:09 +0100
Message-Id: <1236182004-4523-55-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 54/70] rootfs_rpm.bbclass: use more efficient way to copy packages (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:10 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5386 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index 509aceb..97f0a9e 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -63,6 +63,8 @@ basearch=arm
 EOF
 
 	#priority=1
+	mkdir -p ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}
+
 	for arch in ${PACKAGE_ARCHS}; do
 		if [ ! -d ${DEPLOY_DIR_RPM}/$arch ]; then
 			continue;
@@ -75,13 +77,13 @@ EOF
 		echo "gpgcheck=0" >> ${YUMCONF}
 		echo "" >> ${YUMCONF}
 		#priority=$(expr $priority + 5)
+		
+		# Copy the packages into the target image
+		# Ugly ugly ugly but rpm is braindead and can't see outside the chroot 
+		# when installing :(
+		cp -r ${DEPLOY_DIR_RPM}/$arch ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}/
 	done
 
-	# Copy the packages into the target image
-	# Ugly ugly ugly but rpm is braindead and can't see outside the chroot 
-	# when installing :(
-	mkdir -p ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}
-	cp -r ${DEPLOY_DIR_RPM}/* ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}/
 
 	#mkdir -p ${IMAGE_ROOTFS}/var/lib/rpm
 	#rpm --root ${IMAGE_ROOTFS} --initdb
-- 
1.6.1.3





