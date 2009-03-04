Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letaf-0005al-NT
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:05 +0100
Received: (qmail 27883 invoked by uid 813007); 4 Mar 2009 15:54:09 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:09 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQ1-0001Es-L4; Wed, 04 Mar 2009 16:54:01 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:00 +0100
Message-Id: <1236182004-4523-46-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 45/70] rootfs_rpm.bbclass: Add basic postinstall handling during image creation (from Poky)
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

git-svn-id: https://svn.o-hand.com/repos/poky@5134 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |   32 +++++++++++++++++---------------
 1 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index 8da7f3a..b2d6762 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -12,6 +12,8 @@ do_rootfs[recrdeptask] += "do_package_write_rpm"
 YUMCONF = "${IMAGE_ROOTFS}/etc/yum.conf"
 YUMARGS = "-c ${YUMCONF} --installroot ${IMAGE_ROOTFS}"
 
+AWKPOSTINSTSCRIPT = "${STAGING_BINDIR_NATIVE}/extract-postinst.awk"
+
 fakeroot rootfs_rpm_do_rootfs () {
 	set -x
 
@@ -67,26 +69,26 @@ EOF
 		fakechroot yum ${YUMARGS} -y install ${PACKAGE_INSTALL}
 	fi
 
-	#export D=${IMAGE_ROOTFS}
-	#export OFFLINE_ROOT=${IMAGE_ROOTFS}
-	#export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
-	#export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
+	export D=${IMAGE_ROOTFS}
+	export OFFLINE_ROOT=${IMAGE_ROOTFS}
+	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
+	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 
 	#mkdir -p ${IMAGE_ROOTFS}/etc/opkg/
 	#grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}/etc/opkg/arch.conf
 
 	${ROOTFS_POSTINSTALL_COMMAND}
-	
-	#for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.preinst; do
-	#	if [ -f $i ] && ! sh $i; then
-	#		opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .preinst`
-	#	fi
-	#done
-	#for i in ${IMAGE_ROOTFS}${libdir}/opkg/info/*.postinst; do
-	#	if [ -f $i ] && ! sh $i configure; then
-	#		opkg-cl ${IPKG_ARGS} flag unpacked `basename $i .postinst`
-	#	fi
-	#done
+
+	mkdir -p ${IMAGE_ROOTFS}/etc/rpm-postinsts/
+	rpm --root ${IMAGE_ROOTFS} -aq --queryformat 'Name: %{NAME}\n' --scripts > ${IMAGE_ROOTFS}/etc/rpm-postinsts/combined
+	awk -f ${AWKPOSTINSTSCRIPT} < ${IMAGE_ROOTFS}/etc/rpm-postinsts/combined
+	rm ${IMAGE_ROOTFS}/etc/rpm-postinsts/combined	
+
+	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*.sh; do
+		if [ -f $i ] && sh $i; then
+			rm $i
+		fi
+	done
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
-- 
1.6.1.3





