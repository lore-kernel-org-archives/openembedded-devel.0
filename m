Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhcMY-00058H-Js
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 07:26:47 +0100
Received: by mail-pv0-f175.google.com with SMTP id 12so938543pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 22:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=hlPyS+q2s7tveFQBroplV/xvYlsLizSoQcXQJogSbeM=;
	b=oSeNlN3dheq9ARs5v1mqa3ZCczC+1DjEbnAqchVmK/jTCgj297Q5D6b9AQ/Ll/feV2
	LEz+3EKwtK6NQskwAEn23P5xYXtkBQWMGMa9fkOq4tA4L44NqUuk6Nfb8McR8GRah2de
	e/IHuklLrMioRzq4S7k6iOlvkOsyQtRMtDZzI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SFgpIyP8ImTqFVyzPkH4PA6W2RpAd8kZN83mPjRq696aDLJ7npzivsCT0E9f8qjHfI
	7bHQdchoPuLAlfMImU5goTirvXnIdLcqe+uloSQ8b0b76ccpsFodunRgUQD8kM/Ukk7p
	GAXk6BcFCm64gb6C2xAs8g0qhQEbk7345vPfQ=
Received: by 10.142.223.6 with SMTP id v6mr2284440wfg.184.1295936762463;
	Mon, 24 Jan 2011 22:26:02 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm18429417wfa.23.2011.01.24.22.25.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 22:25:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 22:25:41 -0800
Message-Id: <1295936745-718-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
References: <1295936745-718-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 5/9] classes: Replace ipkg-make-index with opkg-make-index
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
X-List-Received-Date: Tue, 25 Jan 2011 06:26:47 -0000

* STAGE_PKGMANAGER use opkg
* rename IPKGBUILDCMD to OPKGBUILDCMD
* Use opkg-build instead of ipkg-build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/package_ipk.bbclass      |   14 +++++++-------
 classes/packaged-staging.bbclass |    4 ++--
 classes/sourceipk.bbclass        |    4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index fea678d..a68d208 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -54,7 +54,7 @@ python package_ipk_install () {
 
 	if (not os.access(os.path.join(ipkdir,"Packages"), os.R_OK) or
 		not os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),os.R_OK)):
-		ret = os.system('ipkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Packages"), ipkdir))
+		ret = os.system('opkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Packages"), ipkdir))
 		if (ret != 0 ):
 			raise bb.build.FuncFailed
 		f = open(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),"w")
@@ -86,20 +86,20 @@ do_package_update_index_ipk () {
 
 	mkdir -p ${DEPLOY_DIR_IPK}
 	touch ${DEPLOY_DIR_IPK}/Packages
-	ipkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m ${DEPLOY_DIR_IPK}
+	opkg-make-index -r ${DEPLOY_DIR_IPK}/Packages -p ${DEPLOY_DIR_IPK}/Packages -l ${DEPLOY_DIR_IPK}/Packages.filelist -m ${DEPLOY_DIR_IPK}
 
 	for arch in $ipkgarchs; do
 		if [ -e ${DEPLOY_DIR_IPK}/$arch/ ] ; then 
 			touch ${DEPLOY_DIR_IPK}/$arch/Packages
-			ipkg-make-index -r ${DEPLOY_DIR_IPK}/$arch/Packages -p ${DEPLOY_DIR_IPK}/$arch/Packages -l ${DEPLOY_DIR_IPK}/$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/$arch/
+			opkg-make-index -r ${DEPLOY_DIR_IPK}/$arch/Packages -p ${DEPLOY_DIR_IPK}/$arch/Packages -l ${DEPLOY_DIR_IPK}/$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/$arch/
 		fi
 		if [ -e ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/ ] ; then 
 			touch ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages
-			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -p ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -l ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages.filelist -m ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/
+			opkg-make-index -r ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -p ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages -l ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/Packages.filelist -m ${DEPLOY_DIR_IPK}/${BUILD_ARCH}-$arch-sdk/
 		fi
 		if [ -e ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/ ] ; then
 			touch ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages
-			ipkg-make-index -r ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -p ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -l ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/
+			opkg-make-index -r ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -p ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages -l ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/Packages.filelist -m ${DEPLOY_DIR_IPK}/${SDK_SYS}-sdk-$arch/
 		fi
 	done
 }
@@ -303,10 +303,10 @@ python do_package_ipk () {
 
 		os.chdir(basedir)
 		ret = os.system("PATH=\"%s\" %s %s %s" % (bb.data.getVar("PATH", localdata, 1), 
-                                                          bb.data.getVar("IPKGBUILDCMD",d,1), pkg, pkgoutdir))
+                                                          bb.data.getVar("OPKGBUILDCMD",d,1), pkg, pkgoutdir))
 		if ret != 0:
 			bb.utils.unlockfile(lf)
-			raise bb.build.FuncFailed("ipkg-build execution failed")
+			raise bb.build.FuncFailed("opkg-build execution failed")
 
 		bb.utils.prunedir(controldir)
 		bb.utils.unlockfile(lf)
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 83e77c9..f217aee 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -92,9 +92,9 @@ python __anonymous() {
 
 PSTAGE_MACHCONFIG   = "${PSTAGE_WORKDIR}/opkg.conf"
 
-PSTAGE_PKGMANAGER = "stage-manager-ipkg"
+PSTAGE_PKGMANAGER = "stage-manager-opkg"
 
-PSTAGE_BUILD_CMD        = "stage-manager-ipkg-build -o 0 -g 0"
+PSTAGE_BUILD_CMD        = "stage-manager-opkg-build -o 0 -g 0"
 PSTAGE_INSTALL_CMD      = "${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-depends -o ${TMPDIR} install"
 PSTAGE_UPDATE_CMD       = "${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -o ${TMPDIR} update"
 PSTAGE_REMOVE_CMD       = "${PSTAGE_PKGMANAGER} -f ${PSTAGE_MACHCONFIG} -force-depends -o ${TMPDIR} remove"
diff --git a/classes/sourceipk.bbclass b/classes/sourceipk.bbclass
index b443ef6..75e7a14 100644
--- a/classes/sourceipk.bbclass
+++ b/classes/sourceipk.bbclass
@@ -31,13 +31,13 @@
 # CREATE_SRCIPK_pn-<package name> = "1" in your local.conf
 #
 #TODO: 
-# Need to figure out how to use ipkg-build in this class.
+# Need to figure out how to use opkg-build in this class.
 # I tried adding it as a dependency for the do_create_srcipk
 # task using:
 #   do_create_srcipk[depends] += "opkg-utils-native:do_populate_sysroot"
 # But then there is a circular dependency between sourcipk.bbclass and
 # opkg-utils-native.  Until I can figure out how to resolve this
-# circular dependency I am extracting the needed pieces from ipkg-build
+# circular dependency I am extracting the needed pieces from opkg-build
 # into this class and building the source ipk myself.
 
 
-- 
1.7.0.4



