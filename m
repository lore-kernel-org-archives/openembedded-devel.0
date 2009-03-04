Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetbM-0005h2-Fv
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:45 +0100
Received: (qmail 27902 invoked by uid 813007); 4 Mar 2009 15:54:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:09 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQ2-0001Ev-Ez; Wed, 04 Mar 2009 16:54:02 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:01 +0100
Message-Id: <1236182004-4523-47-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 46/70] rootfs_rpm.bbclass: Fixup broken symlinks due to fakechroot and run any leftover postinstalls on real hardware at first boot (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:52 -0000

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5143 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |   30 +++++++++++++++++++++++++++++-
 1 files changed, 29 insertions(+), 1 deletions(-)

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index b2d6762..acd7a06 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -69,6 +69,15 @@ EOF
 		fakechroot yum ${YUMARGS} -y install ${PACKAGE_INSTALL}
 	fi
 
+	# Symlinks created under fakeroot are wrong, now we have to fix them...
+	cd ${IMAGE_ROOTFS}
+	for f in `find . -type l -print`
+	do
+		link=`readlink $f | sed -e 's#${IMAGE_ROOTFS}##'`
+		rm $f
+		ln -s $link $f
+	done
+
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
@@ -86,10 +95,29 @@ EOF
 
 	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*.sh; do
 		if [ -f $i ] && sh $i; then
-			rm $i
+			# rm $i
+			mv $i $i.done
 		fi
 	done
 
+	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
+	# Stop $i getting expanded below...
+	i=\$i
+	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S98configure << EOF
+#!/bin/sh
+for i in /etc/rpm-postinsts/*.sh; do
+	echo "Running postinst $i..."
+	if [ -f $i ] && sh $i; then
+		# rm $i
+		mv $i $i.done
+	else
+		echo "ERROR: postinst $i failed."
+	fi
+done
+rm -f ${sysconfdir}/rcS.d/S98configure
+EOF
+	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S98configure
+
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
-- 
1.6.1.3





