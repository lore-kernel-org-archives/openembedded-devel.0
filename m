Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letag-0005b9-Ik
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:05 +0100
Received: (qmail 27929 invoked by uid 813007); 4 Mar 2009 15:54:10 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:10 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQ3-0001Ey-9M; Wed, 04 Mar 2009 16:54:03 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:02 +0100
Message-Id: <1236182004-4523-48-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 47/70] rootfs_rpm.bbclass: Add recommends handling (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:07 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5158 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index acd7a06..533efb0 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -69,6 +69,10 @@ EOF
 		fakechroot yum ${YUMARGS} -y install ${PACKAGE_INSTALL}
 	fi
 
+	# Add any recommended packages to the image
+	# (added as an extra script since yum itself doesn't support this)
+	yum-install-recommends.py ${IMAGE_ROOTFS} "fakechroot yum ${YUMARGS} -y install"
+
 	# Symlinks created under fakeroot are wrong, now we have to fix them...
 	cd ${IMAGE_ROOTFS}
 	for f in `find . -type l -print`
-- 
1.6.1.3





