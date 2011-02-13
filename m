Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Poe9L-0001cW-48
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Feb 2011 16:46:11 +0100
Received: by fxm17 with SMTP id 17so4147010fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Feb 2011 07:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=nmriNZOAgsSc9cUel/dKcu9S/DM+TtveAv6+2UeDBCo=;
	b=GtF9Re7DFbivyrSZwDGuO6zRboDEnluZf/SI0KLpz8WamxM8BxEq4a2C6HBAvnLXLO
	O4fPXgbn0RJHw0YYpTgVZ6jdDjNv2cs1C+aZn1OS8eYiFSwr6JmFvbI+N/HYiFU4ZXME
	YZ0xpH0Q7IF0CiGfe7KENTrUmmUxjZFhhDcMc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=aplQcvQ6MCi5lEg4knRDZ27fiBbDBjeAp220rvvJ35HDJnmKPD88H74/Pl6XR1Okym
	3t9pFaq9MsV8cfpB9MS1oCyky1plCRf6hHlnqM52rk93G4q/UtWYip5RUvsN/xre33gh
	TrSXvc1RkCHyl647xsgaskSKY5F12cxQCvzJ8=
Received: by 10.223.101.129 with SMTP id c1mr570412fao.25.1297611903084;
	Sun, 13 Feb 2011 07:45:03 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id a2sm625362faw.46.2011.02.13.07.45.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Feb 2011 07:45:02 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Feb 2011 16:44:55 +0100
Message-Id: <1297611895-21729-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] image.bbclass: move insert_feed_uris() to rootfs_ipk.bbclass
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
X-List-Received-Date: Sun, 13 Feb 2011 15:46:11 -0000

This function generates feed configuration for opkg and as such
should be used only for images using ipk, not rpm or deb.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/image.bbclass      |   31 -------------------------------
 classes/rootfs_ipk.bbclass |   31 +++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index db13dd0..9621614 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -172,8 +172,6 @@ fakeroot do_rootfs () {
 
 	rootfs_${IMAGE_PKGTYPE}_do_rootfs
 
-	insert_feed_uris
-
 	${IMAGE_PREPROCESS_COMMAND}
 
 	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = ${IMAGE_EXTRA_SPACE} + $1; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
@@ -193,35 +191,6 @@ do_deploy_to () {
 	cp "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.${IMAGE_FSTYPES}" ${DEPLOY_TO}
 }
 
-insert_feed_uris () {
-
-	echo "Building feeds for [${DISTRO}].."
-
-	for line in ${FEED_URIS}
-	do
-		# strip leading and trailing spaces/tabs, then split into name and uri
-		line_clean="`echo "$line"|sed 's/^[ \t]*//;s/[ \t]*$//'`"
-		feed_name="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\1/p'`"
-		feed_uri="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\2/p'`"
-
-		echo "Added $feed_name feed with URL $feed_uri"
-
-		# insert new feed-sources
-		echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/etc/opkg/${feed_name}-feed.conf
-	done
-
-	# Allow to use package deploy directory contents as quick devel-testing
-	# feed. This creates individual feed configs for each arch subdir of those
-	# specified as compatible for the current machine.
-	# NOTE: Development-helper feature, NOT a full-fledged feed.
-	if [ -n "${FEED_DEPLOYDIR_BASE_URI}" ]; then
-	    for arch in ${PACKAGE_ARCHS}
-	    do
-		echo "src/gz local-$arch ${FEED_DEPLOYDIR_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/opkg/local-$arch-feed.conf
-	    done
-	fi
-}
-
 log_check() {
 	set +x
 	for target in $*
diff --git a/classes/rootfs_ipk.bbclass b/classes/rootfs_ipk.bbclass
index 92f521d..8fab7af 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -104,6 +104,37 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	log_check rootfs 	
 	rm -rf ${IPKG_TMP_DIR}
+
+	rootfs_ipk_insert_feed_uris
+}
+
+rootfs_ipk_insert_feed_uris () {
+
+	echo "Building feeds for [${DISTRO}].."
+
+	for line in ${FEED_URIS}
+	do
+		# strip leading and trailing spaces/tabs, then split into name and uri
+		line_clean="`echo "$line"|sed 's/^[ \t]*//;s/[ \t]*$//'`"
+		feed_name="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\1/p'`"
+		feed_uri="`echo "$line_clean" | sed -n 's/\(.*\)##\(.*\)/\2/p'`"
+
+		echo "Added $feed_name feed with URL $feed_uri"
+
+		# insert new feed-sources
+		echo "src/gz $feed_name $feed_uri" >> ${IMAGE_ROOTFS}/etc/opkg/${feed_name}-feed.conf
+	done
+
+	# Allow to use package deploy directory contents as quick devel-testing
+	# feed. This creates individual feed configs for each arch subdir of those
+	# specified as compatible for the current machine.
+	# NOTE: Development-helper feature, NOT a full-fledged feed.
+	if [ -n "${FEED_DEPLOYDIR_BASE_URI}" ]; then
+	    for arch in ${PACKAGE_ARCHS}
+	    do
+		echo "src/gz local-$arch ${FEED_DEPLOYDIR_BASE_URI}/$arch" >> ${IMAGE_ROOTFS}/etc/opkg/local-$arch-feed.conf
+	    done
+	fi
 }
 
 rootfs_ipk_log_check() {
-- 
1.7.1



