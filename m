Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1LetbT-0005hb-So
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:52 +0100
Received: (qmail 28466 invoked by uid 813007); 4 Mar 2009 15:54:18 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:18 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQB-0001FS-Gj; Wed, 04 Mar 2009 16:54:11 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:12 +0100
Message-Id: <1236182004-4523-58-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 57/70] rootfs_rpm.bbclass: added code to generate images from feeds (from Poky)
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

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5436 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index 292e3bb..733736a 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -15,6 +15,7 @@ export YUM_ARCH_FORCE = "${TARGET_ARCH}"
 
 AWKPOSTINSTSCRIPT = "${STAGING_BINDIR_NATIVE}/extract-postinst.awk"
 
+RPM_PREPROCESS_COMMANDS = ""
 RPM_POSTPROCESS_COMMANDS = "rpm_insert_feeds_uris"
 
 rpm_insert_feeds_uris () {
@@ -42,6 +43,8 @@ rpm_insert_feeds_uris () {
 
 fakeroot rootfs_rpm_do_rootfs () {
 	set -x
+	
+	${RPM_PREPROCESS_COMMANDS}
 
 	mkdir -p ${IMAGE_ROOTFS}/etc/rpm/
 	echo "${TARGET_ARCH}-linux" >${IMAGE_ROOTFS}/etc/rpm/platform
@@ -222,3 +225,14 @@ install_all_locales() {
     fi
 }
 
+python () {
+    import bb
+    if bb.data.getVar('BUILD_IMAGES_FROM_FEEDS', d, True):
+        flags = bb.data.getVarFlag('do_rootfs', 'recrdeptask', d)
+        flags = flags.replace("do_package_write_rpm", "")
+        flags = flags.replace("do_deploy", "")
+        flags = flags.replace("do_populate_staging", "")
+        bb.data.setVarFlag('do_rootfs', 'recrdeptask', flags, d)
+        bb.data.setVar('RPM_PREPROCESS_COMMANDS', "rpm_insert_feed_uris", d)
+        bb.data.setVar('RPM_POSTPROCESS_COMMANDS', '', d)
+}
-- 
1.6.1.3





