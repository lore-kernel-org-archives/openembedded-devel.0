Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp2l8-0003I0-P5
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 19:02:50 +0100
Received: by fxm17 with SMTP id 17so5158815fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=8UYhlFubSKNE6I0BQfVzrkD7bNtJb96RF5Ompoa1/Sg=;
	b=d92Yq+k7eurR17DJKP/saxrEYU6SylK/Nv1c7blfk/nuM8VPZABO+URS6HJCO1PXKX
	iFBnzuewA/P6WJqDOaKMyf0ZH6K6O9ZENHUIDTZ9i+Co6Rh2DsnOZHq6zvEA1I64vi7j
	dt7E/P9fkj875mMnasEReGVG6YLmTkZNwofcg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sN96lcRWFaJq4CMIZbw+1aOMzZHXa0yJ9dwPpiCbdTxjfAY0igXCoLJLrPA8lNhx0W
	UqhbqsB5ralznwIS5hjNw/xVCDC0t+Pq7+eN3eFrAaJ80KmC6NSDmDoi06iJ8rcVA/dn
	AR/o9+FxtvP89+W+6XrntbkscUNv8JxUQ74IY=
Received: by 10.223.85.203 with SMTP id p11mr1214979fal.108.1297706501582;
	Mon, 14 Feb 2011 10:01:41 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id e6sm1207827fav.8.2011.02.14.10.01.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 10:01:40 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 19:01:30 +0100
Message-Id: <1297706490-6486-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
References: <AANLkTinXm+YcGS_uadbA6ddezRRtZB0r6Tqcgt7GyOh4@mail.gmail.com>
Subject: [PATCHv2] image.bbclass: move insert_feed_uris() to rootfs_ipk.bbclass
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
X-List-Received-Date: Mon, 14 Feb 2011 18:02:50 -0000

This function generates feed configuration for opkg and as such
should be used only for images using ipk, not rpm or deb.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/image.bbclass      |   32 --------------------------------
 classes/rootfs_ipk.bbclass |   33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/classes/image.bbclass b/classes/image.bbclass
index 9765442..9621614 100644
--- a/classes/image.bbclass
+++ b/classes/image.bbclass
@@ -172,9 +172,6 @@ fakeroot do_rootfs () {
 
 	rootfs_${IMAGE_PKGTYPE}_do_rootfs
 
-	[ "${ONLINE_PACKAGE_MANAGEMENT}" != "none" ] && \
-		insert_feed_uris
-
 	${IMAGE_PREPROCESS_COMMAND}
 
 	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = ${IMAGE_EXTRA_SPACE} + $1; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
@@ -194,35 +191,6 @@ do_deploy_to () {
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
index 92f521d..b173184 100644
--- a/classes/rootfs_ipk.bbclass
+++ b/classes/rootfs_ipk.bbclass
@@ -104,8 +104,41 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	log_check rootfs 	
 	rm -rf ${IPKG_TMP_DIR}
+
+	[ "${ONLINE_PACKAGE_MANAGEMENT}" != "none" ] && \
+		rootfs_ipk_insert_feed_uris
 }
 
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
+}
+
+
 rootfs_ipk_log_check() {
 	target="$1"
         lf_path="$2"
-- 
1.7.1



