Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letam-0005cZ-8J
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:08 +0100
Received: (qmail 28163 invoked by uid 813007); 4 Mar 2009 15:54:15 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:15 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQ8-0001FG-73; Wed, 04 Mar 2009 16:54:08 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:08 +0100
Message-Id: <1236182004-4523-54-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Richard Purdie <richard@openedhand.com>
Subject: [PATCH 53/70] packaged-staging.bbclass: Add rpm package coverage (from Poky)
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

From: Richard Purdie <richard@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5382 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 classes/packaged-staging.bbclass |   14 ++++++++++++++
 classes/rootfs_rpm.bbclass       |   36 ++++++++++++++++++++++--------------
 2 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index d6272b8..849f60c 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -361,6 +361,8 @@ python do_package_stage () {
             ipkpath = bb.data.getVar('DEPLOY_DIR_IPK', d, True).replace(tmpdir, stagepath)
         if bb.data.inherits_class('package_deb', d):
             debpath = bb.data.getVar('DEPLOY_DIR_DEB', d, True).replace(tmpdir, stagepath)
+        if bb.data.inherits_class('package_rpm', d):
+            rpmpath = bb.data.getVar('DEPLOY_DIR_RPM', d, True).replace(tmpdir, stagepath)
 
         for pkg in packages:
             pkgname = bb.data.getVar('PKG_%s' % pkg, d, 1)
@@ -393,6 +395,18 @@ python do_package_stage () {
                     bb.mkdirhier(destpath)
                     bb.copyfile(srcfile, destpath + srcname)
 
+            if bb.data.inherits_class('package_rpm', d):
+		version = bb.data.getVar('PV', d, 1)
+		version = version.replace('-', '+')
+		bb.data.setVar('RPMPV', version, d)
+                srcname = bb.data.expand(pkgname + "-${RPMPV}-" + pr + ".${TARGET_ARCH}.rpm", d)
+                srcfile = bb.data.expand("${DEPLOY_DIR_RPM}/" + arch + "/" + srcname, d)
+                if os.path.exists(srcfile):
+                    destpath = rpmpath + "/" + arch + "/" 
+                    bb.mkdirhier(destpath)
+                    bb.copyfile(srcfile, destpath + srcname)
+
+
     #
     # Handle stamps/ files
     #
diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index b3d2b78..509aceb 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -43,18 +43,9 @@ rpm_insert_feeds_uris () {
 fakeroot rootfs_rpm_do_rootfs () {
 	set -x
 
-	# Update the repository index
-	createrepo ${DEPLOY_DIR_RPM}
-
 	mkdir -p ${IMAGE_ROOTFS}/etc/rpm/
 	#echo "arm" > ${IMAGE_ROOTFS}/etc/rpm/platform
 
-	# Copy the packages into the target image
-	# Ugly ugly ugly but rpm is braindead and can't see outside the chroot 
-	# when installing :(
-	mkdir -p ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}
-	cp -r ${DEPLOY_DIR_RPM}/* ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}/
-
 	# Generate an apprpriate yum.conf
 	rm -rf ${YUMCONF}
 	cat > ${YUMCONF} << EOF
@@ -69,12 +60,29 @@ tolerant=1
 arch=arm
 basearch=arm
 
-[poky-feed]
-name = Poky RPM Feed
-baseurl=file://${DEPLOY_DIR_RPM}
-gpgcheck=0
-
 EOF
+
+	#priority=1
+	for arch in ${PACKAGE_ARCHS}; do
+		if [ ! -d ${DEPLOY_DIR_RPM}/$arch ]; then
+			continue;
+		fi
+		createrepo ${DEPLOY_DIR_RPM}/$arch
+
+		echo "[poky-feed-$arch]" >> ${YUMCONF}
+		echo "name = Poky RPM $arch Feed" >> ${YUMCONF}
+		echo "baseurl=file://${DEPLOY_DIR_RPM}/$arch" >> ${YUMCONF}
+		echo "gpgcheck=0" >> ${YUMCONF}
+		echo "" >> ${YUMCONF}
+		#priority=$(expr $priority + 5)
+	done
+
+	# Copy the packages into the target image
+	# Ugly ugly ugly but rpm is braindead and can't see outside the chroot 
+	# when installing :(
+	mkdir -p ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}
+	cp -r ${DEPLOY_DIR_RPM}/* ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}/
+
 	#mkdir -p ${IMAGE_ROOTFS}/var/lib/rpm
 	#rpm --root ${IMAGE_ROOTFS} --initdb
 	#rpm --root ${IMAGE_ROOTFS} --dbpath ${IMAGE_ROOTFS}/var/lib/rpm -ihv --nodeps --ignoreos  
-- 
1.6.1.3





