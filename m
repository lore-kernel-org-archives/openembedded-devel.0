Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1ObdfF-0002n5-OL
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 20:05:09 +0200
Received: by pwi10 with SMTP id 10so3024992pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jul 2010 11:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=WJ0liwAu8nRYNvaM2k8eJ4yVQ92ssi/8ktqVKFULnSk=;
	b=CH+r/JROvksEFMWBYZI9pOTq1bthdnwGaLne74oIDsfGKqGFARijuMaX0E82E0vB7K
	Dr5wYc7iFNfryqHdc5H+dQfX1UMGwqh4rvrJeVg2/8LjG/Q+I9k0rZaGjD7XGte9qYEn
	wcrJ0sQgl6gfVVHg+6dVjN0Ll25ZOKduRMW6A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=p4jj44TaPEPPZb4PLBkZgpG2Ue5UnmPJ5rF+//ICMQXKzFoTpO2Ijc/wSZ/S3XHezQ
	Vjam8UalDjFHtF2C09JPCfMjmjNRY/QevcFS5tUQnubeFDYZnGjatK+GL/9uldDfgyZL
	nuGUF2Y6IhLNJOPS4tf3blszRHLsS6mmS7Br8=
Received: by 10.142.223.14 with SMTP id v14mr624078wfg.238.1279735493297;
	Wed, 21 Jul 2010 11:04:53 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm9343482wfl.1.2010.07.21.11.04.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 21 Jul 2010 11:04:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 11:04:43 -0700
Message-Id: <1279735486-7050-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] classes, bitbake.conf: Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Wed, 21 Jul 2010 18:05:09 -0000

* Update references to CROSS_DIR in classes and bitbake.conf.
* This patch is based on Joshua Lock's work in poky.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cmake.bbclass            |    2 +-
 classes/cross.bbclass            |    8 ++++----
 classes/glibc-package.bbclass    |    8 ++++----
 classes/icecc.bbclass            |    6 +++---
 classes/nativesdk.bbclass        |    2 --
 classes/packaged-staging.bbclass |    5 -----
 conf/bitbake.conf                |    7 ++-----
 7 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
index 2047b58..2376012 100644
--- a/classes/cmake.bbclass
+++ b/classes/cmake.bbclass
@@ -37,7 +37,7 @@ cmake_do_generate_toolchain_file() {
 
 # only search in the paths provided (from openembedded) so cmake doesnt pick
 # up libraries and tools from the native build machine
-  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${CROSS_DIR} )" >> ${WORKDIR}/toolchain.cmake
+  echo "set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${STAGING_DIR_NATIVE}${prefix_native} )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )" >> ${WORKDIR}/toolchain.cmake
   echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 4cf2b4c..75b2abe 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -1,5 +1,5 @@
 # Disabled for now since the relocation paths are too long
-#inherit relocatable
+inherit relocatable
 
 # Cross packages are built indirectly via dependency,
 # no need for them to be a direct target of 'world'
@@ -44,9 +44,9 @@ target_base_libdir := "${base_libdir}"
 target_prefix := "${prefix}"
 
 # Overrides for paths
-prefix = "${CROSS_DIR}"
-base_prefix = "${prefix}"
-exec_prefix = "${prefix}"
+prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
+base_prefix = "${STAGING_DIR_NATIVE}"
+exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
 base_sbindir = "${base_prefix}/bin"
 sbindir = "${exec_prefix}/bin"
 
diff --git a/classes/glibc-package.bbclass b/classes/glibc-package.bbclass
index d47c914..36424d5 100644
--- a/classes/glibc-package.bbclass
+++ b/classes/glibc-package.bbclass
@@ -104,11 +104,11 @@ do_prep_locale_tree() {
 		gunzip $i
 	done
 	ls -d ${PKGD}${base_libdir}/* | xargs -iBLAH cp -pPR BLAH $treedir/lib
-	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so ]; then
-		cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so $treedir/lib
+	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so ]; then
+		cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so $treedir/lib
 	fi
-	if [ -f ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* ]; then
-		cp -pPR ${CROSS_DIR}/${TARGET_SYS}/lib/libgcc_s.so.* $treedir/lib
+	if [ -f ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so.* ]; then
+		cp -pPR ${STAGING_DIR_NATIVE}${prefix_native}/lib/libgcc_s.so.* $treedir/lib
 	fi
 	install -m 0755 ${PKGD}${bindir}/localedef $treedir/bin
 }
diff --git a/classes/icecc.bbclass b/classes/icecc.bbclass
index 36cc231..938f199 100644
--- a/classes/icecc.bbclass
+++ b/classes/icecc.bbclass
@@ -46,7 +46,7 @@ def create_cross_env(bb,d):
         return ""
 
     import tarfile, socket, time
-    ice_dir = bb.data.expand('${CROSS_DIR}', d)
+    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
     staging_dir = bb.data.expand('${STAGING_DIR_TARGET}', d)
     prefix  = bb.data.expand('${HOST_PREFIX}' , d)
     distro  = bb.data.expand('${DISTRO}', d)
@@ -96,7 +96,7 @@ def create_cross_env(bb,d):
 
 def create_native_env(bb,d):
     import tarfile, socket, time
-    ice_dir = bb.data.expand('${CROSS_DIR}', d)
+    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
     prefix  = bb.data.expand('${HOST_PREFIX}' , d)
     distro  = bb.data.expand('${DISTRO}', d)
     target_sys = bb.data.expand('${TARGET_SYS}',  d)
@@ -143,7 +143,7 @@ def get_cross_kernel_cc(bb,d):
 
 def create_cross_kernel_env(bb,d):
     import tarfile, socket, time
-    ice_dir = bb.data.expand('${CROSS_DIR}', d)
+    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
     prefix  = bb.data.expand('${HOST_PREFIX}' , d)
     distro  = bb.data.expand('${DISTRO}', d)
     target_sys = bb.data.expand('${TARGET_SYS}',  d)
diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
index 75f5790..ddaab85 100644
--- a/classes/nativesdk.bbclass
+++ b/classes/nativesdk.bbclass
@@ -18,8 +18,6 @@ python () {
 #STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}-nativesdk"
 #STAGING_DIR_TARGET = "${STAGING_DIR}/${BASEPKG_TARGET_SYS}-nativesdk"
 
-CROSS_DIR = "${TMPDIR}/cross/${HOST_ARCH}"
-
 HOST_ARCH = "${SDK_ARCH}"
 HOST_VENDOR = "${SDK_VENDOR}"
 HOST_OS = "${SDK_OS}"
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 670fd1c..fda1431 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -130,7 +130,6 @@ def pstage_cleanpackage(pkgname, d):
 	else:
 		bb.debug(1, "Manually removing any installed files from staging...")
 		pstage_manualclean("sysroots", "STAGING_DIR", d)
-		pstage_manualclean("cross", "CROSS_DIR", d)
 		pstage_manualclean("deploy", "DEPLOY_DIR", d)
 
 	bb.utils.unlockfile(lf)
@@ -307,7 +306,6 @@ python packagedstage_stampfixing_eventhandler() {
 populate_sysroot_preamble () {
 	if [ "$PSTAGING_ACTIVE" = "1" ]; then
 		stage-manager -p ${STAGING_DIR} -c ${PSTAGE_WORKDIR}/stamp-cache-staging -u || true
-		stage-manager -p ${CROSS_DIR} -c ${PSTAGE_WORKDIR}/stamp-cache-cross -u || true
 	fi
 }
 
@@ -323,7 +321,6 @@ populate_sysroot_postamble () {
 		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
 			exit $exitcode
 		fi
-		stage-manager -p ${CROSS_DIR} -c ${PSTAGE_WORKDIR}/stamp-cache-cross -u -d ${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}
 		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
 			exit $exitcode
 		fi
@@ -334,9 +331,7 @@ populate_sysroot_postamble () {
 packagedstaging_fastpath () {
 	if [ "$PSTAGING_ACTIVE" = "1" ]; then
 		mkdir -p ${PSTAGE_TMPDIR_STAGE}/sysroots/
-		mkdir -p ${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}/
 		cp -fpPR ${SYSROOT_DESTDIR}/${STAGING_DIR}/* ${PSTAGE_TMPDIR_STAGE}/sysroots/ || /bin/true
-		cp -fpPR ${SYSROOT_DESTDIR}/${CROSS_DIR}/* ${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}/ || /bin/true
 	fi
 }
 
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 69d00e2..748abba 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -410,10 +410,7 @@ EXTRA_IMAGEDEPENDS = ""
 ##################################################################
 # Toolchain info.
 ##################################################################
-
-CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"
-CROSS_DATADIR = "${CROSS_DIR}/share"
-PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_SBINDIR_NATIVE}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindir_cross}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
+PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
 export PATH
 
 ##################################################################
@@ -422,7 +419,7 @@ export PATH
 
 CCACHE ?= ""
 TOOLCHAIN_OPTIONS = ""
-TOOLCHAIN_PATH ?= "${CROSS_DIR}"
+TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}"
 TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
 
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-- 
1.7.1



