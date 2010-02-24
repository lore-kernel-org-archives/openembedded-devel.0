Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NkOHE-0001Ma-Gn
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Feb 2010 21:56:13 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KYD0055O60AGFL4@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	24 Feb 2010 14:53:01 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 279ED14AF55; Wed,
	24 Feb 2010 15:52:58 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Feb 2010 15:52:52 -0500
Message-id: <1267044772-10182-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rootfs_ipk.bbclass: fix BAD_RECOMMENDATIONS
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
X-List-Received-Date: Wed, 24 Feb 2010 20:56:13 -0000

New opkg requires full and correct package name, version, revision and
architecture to be specified when requiring de-installation of a package.
Collect that info from opkg-info.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 classes/rootfs_ipk.bbclass |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 38d6121..c32e4e3 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -36,16 +36,19 @@ fakeroot rootfs_ipk_do_rootfs () {
 	mkdir -p ${IMAGE_ROOTFS}${libdir}/opkg/
 
 	STATUS=${IMAGE_ROOTFS}${libdir}/opkg/status
+
+	opkg-cl ${IPKG_ARGS} update
+
 	# prime the status file with bits that we don't want
 	for i in ${BAD_RECOMMENDATIONS}; do
-		echo "Package: $i" >> $STATUS
-		echo "Architecture: ${TARGET_ARCH}" >> $STATUS
-		echo "Status: deinstall ok not-installed" >> $STATUS
-		echo >> $STATUS
+		infln="`opkg-cl ${IPKG_ARGS} info $i | grep -e '^Package:' -e '^Architecture:' -e '^Version:'`"
+		if [ ! -z "$infln" ]; then
+			echo "$infln" >> $STATUS
+			echo "Status: deinstall ok not-installed" >> $STATUS
+			echo >> $STATUS
+		fi
 	done
 
-	opkg-cl ${IPKG_ARGS} update
-
 	# Uclibc builds don't provide this stuff...
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then 
 		if [ ! -z "${LINGUAS_INSTALL}" ]; then
-- 
1.6.3.3



