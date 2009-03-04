Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letam-0005cY-8I
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:08 +0100
Received: (qmail 28081 invoked by uid 813007); 4 Mar 2009 15:54:14 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:14 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQ6-0001FA-Hn; Wed, 04 Mar 2009 16:54:06 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:06 +0100
Message-Id: <1236182004-4523-52-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 51/70] rootfs_rpm.bbclass: added generation of feed entries (from Poky)
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

git-svn-id: https://svn.o-hand.com/repos/poky@5434 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/rootfs_rpm.bbclass |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index 450880d..b3d2b78 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -15,6 +15,31 @@ export YUM_ARCH_FORCE = "${TARGET_ARCH}"
 
 AWKPOSTINSTSCRIPT = "${STAGING_BINDIR_NATIVE}/extract-postinst.awk"
 
+RPM_POSTPROCESS_COMMANDS = "rpm_insert_feeds_uris"
+
+rpm_insert_feeds_uris () {
+
+        echo "Building from feeds activated!"
+
+	mkdir -p ${IMAGE_ROOTFS}/etc/yum/repos.d/
+        for line in ${RPM_FEED_URIS}
+        do
+                # strip leading and trailing spaces/tabs, then split into name and uri
+                line_clean="`echo "$line"|sed 's/^[ \t]*//;s/[ \t]*$//'`"
+                feed_name="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\1/p'`"
+                feed_uri="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\2/p'`"
+
+                echo "Added $feed_name feed with URL $feed_uri"
+
+		FEED_FILE=${IMAGE_ROOTFS}/etc/yum/repos.d/$feed_name
+
+		echo "[poky-feed-$feed_name]" >> $FEED_FILE
+		echo "name = $feed_name" >> $FEED_FILE
+		echo "baseurl = $feed_uri" >> $FEED_FILE
+		echo "gpgcheck = 0" >> $FEED_FILE
+        done
+}
+
 fakeroot rootfs_rpm_do_rootfs () {
 	set -x
 
@@ -126,6 +151,7 @@ EOF
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
+	${RPM_POSTPROCESS_COMMANDS}
 	${ROOTFS_POSTPROCESS_COMMAND}
 	
 	rm -rf ${IMAGE_ROOTFS}/var/cache2/
-- 
1.6.1.3





