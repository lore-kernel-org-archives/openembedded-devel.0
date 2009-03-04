Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letb0-0005ec-E7
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:23 +0100
Received: (qmail 28815 invoked by uid 813007); 4 Mar 2009 15:54:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:54:28 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetQL-0001G7-Bj; Wed, 04 Mar 2009 16:54:21 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:53:24 +0100
Message-Id: <1236182004-4523-70-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openembedded.org>
Subject: [PATCH 70/70] rootfs_rpm.bbclass: remove two functions (need rewrite for RPM)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:24 -0000

From: Marcin Juszkiewicz <hrw@openembedded.org>

install_all_locales and remove_packaging_data_files functions were from
rootfs_ipk.bbclass and need to be rewritten for RPM rootfs.
---
 classes/package_rpm.bbclass |    2 +-
 classes/rootfs_rpm.bbclass  |   40 +++++++++++-----------------------------
 2 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/classes/package_rpm.bbclass b/classes/package_rpm.bbclass
index 7f55e38..e9e52d2 100644
--- a/classes/package_rpm.bbclass
+++ b/classes/package_rpm.bbclass
@@ -200,7 +200,7 @@ python do_package_rpm () {
 		pkgoutdir = os.path.join(outdir, bb.data.getVar('PACKAGE_ARCH', localdata, 1))
 		bb.mkdirhier(pkgoutdir)
 		bb.data.setVar('OUTSPECFILE', os.path.join(workdir, "%s.spec" % pkg), localdata)
-		# Save the value of RPMBUILD expanded into the new dictonary so any 
+		# Save the value of RPMBUILD expanded into the new dictonary so any
 		# changes in the compoents that make up workdir don't break packaging
 		bb.data.setVar('RPMBUILD', bb.data.getVar("RPMBUILD", d, True), localdata)
 		bb.data.setVar('RPMBUILDPATH', bb.data.getVar("RPMBUILDPATH", d, True), localdata)
diff --git a/classes/rootfs_rpm.bbclass b/classes/rootfs_rpm.bbclass
index 733736a..12cd349 100644
--- a/classes/rootfs_rpm.bbclass
+++ b/classes/rootfs_rpm.bbclass
@@ -2,7 +2,7 @@
 # Creates a root filesystem out of rpm packages
 #
 
-ROOTFS_PKGMANAGE = "rpm yum" 
+ROOTFS_PKGMANAGE = "rpm yum"
 
 ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 
@@ -43,7 +43,7 @@ rpm_insert_feeds_uris () {
 
 fakeroot rootfs_rpm_do_rootfs () {
 	set -x
-	
+
 	${RPM_PREPROCESS_COMMANDS}
 
 	mkdir -p ${IMAGE_ROOTFS}/etc/rpm/
@@ -78,9 +78,9 @@ EOF
 		echo "gpgcheck=0" >> ${YUMCONF}
 		echo "" >> ${YUMCONF}
 		#priority=$(expr $priority + 5)
-		
+
 		# Copy the packages into the target image
-		# Ugly ugly ugly but rpm is braindead and can't see outside the chroot 
+		# Ugly ugly ugly but rpm is braindead and can't see outside the chroot
 		# when installing :(
 		cp -r ${DEPLOY_DIR_RPM}/$arch ${IMAGE_ROOTFS}${DEPLOY_DIR_RPM}/
 	done
@@ -88,7 +88,7 @@ EOF
 
 	#mkdir -p ${IMAGE_ROOTFS}/var/lib/rpm
 	#rpm --root ${IMAGE_ROOTFS} --initdb
-	#rpm --root ${IMAGE_ROOTFS} --dbpath ${IMAGE_ROOTFS}/var/lib/rpm -ihv --nodeps --ignoreos  
+	#rpm --root ${IMAGE_ROOTFS} --dbpath ${IMAGE_ROOTFS}/var/lib/rpm -ihv --nodeps --ignoreos
 	#rpm -ihv --root ${IMAGE_ROOTFS} ${PACKAGE_INSTALL}
 
 	#package_update_index_rpm
@@ -176,7 +176,7 @@ EOF
 	# remove no longer used yum.conf
 	rm -f ${IMAGE_ROOTFS}/etc/yum.conf
 
-	log_check rootfs 	
+	log_check rootfs
 }
 
 rootfs_rpm_log_check() {
@@ -185,44 +185,26 @@ rootfs_rpm_log_check() {
 
 	lf_txt="`cat $lf_path`"
 	for keyword_die in "Cannot find package" "exit 1" ERR Fail
-	do				
+	do
 		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
 			echo -e "log_check: Matched keyword: [$keyword_die]\n"
 			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
 			echo ""
-			do_exit=1				
+			do_exit=1
 		fi
 	done
-	test "$do_exit" = 1 && exit 1
+	test "$do_exit" = 1 && exit
 	true
 }
 
 remove_packaging_data_files() {
-	rm -rf ${IMAGE_ROOTFS}/usr/lib/opkg/
+# empty for now
 }
 
 install_all_locales() {
-
-    PACKAGES_TO_INSTALL=""
-
-	INSTALLED_PACKAGES=`grep ^Package: ${IMAGE_ROOTFS}${libdir}/opkg/status |sed "s/^Package: //"|egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
-
-    for pkg in $INSTALLED_PACKAGES
-    do
-        for lang in ${IMAGE_LOCALES}
-        do
-            if [ `opkg-cl ${IPKG_ARGS} info $pkg-locale-$lang | wc -l` -gt 2 ]
-            then
-                    PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $pkg-locale-$lang"
-            fi
-        done
-    done
-    if [ "$PACKAGES_TO_INSTALL" != "" ]
-    then
-        opkg-cl ${IPKG_ARGS} install $PACKAGES_TO_INSTALL
-    fi
+# empty for now
 }
 
 python () {
-- 
1.6.1.3





