Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letao-0005d4-Im
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:10 +0100
Received: (qmail 28440 invoked by uid 813007); 4 Mar 2009 15:54:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:18 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQA-0001FP-MI; Wed, 04 Mar 2009 16:54:10 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:11 +0100
Message-Id: <1236182004-4523-57-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 56/70] rootfs_rpm.bbclass: fix platform so rpm will be usable on device (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:11 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5432 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index bedd71c..292e3bb 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -44,7 +44,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	set -x
 
 	mkdir -p ${IMAGE_ROOTFS}/etc/rpm/
-	echo ${TARGET_ARCH} >${IMAGE_ROOTFS}/etc/rpm/platform
+	echo "${TARGET_ARCH}-linux" >${IMAGE_ROOTFS}/etc/rpm/platform
 
 	# Generate an apprpriate yum.conf
 	rm -rf ${YUMCONF}
-- 
1.6.1.3





