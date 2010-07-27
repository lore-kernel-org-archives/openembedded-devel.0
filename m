Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OddyT-0001Oa-EB
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:49:15 +0200
Received: by iwn34 with SMTP id 34so3565418iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 23:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=mkXg/fK19EWE/FeQsIoa/LktDwrai0DM7QbKTLxHBP0=;
	b=ezp8C8WwdYJ0hCKj5utCDx3zyeiP44s4VpQVb1MJrI0WLyiO7OyniJINhBMsJCmn4n
	V9Dm1S0OVtE5TnLCLr79XlXMhH6f9JGf7eokfLXFuMg9fBH0cwkGnZSsACrpvQIm3GZP
	U8qROT7QbGpgIHvj4gK5nUY7Kvty8mYUAihtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=SwRaTRkzsicD+t78AjWRa/6yt4cx+3A1tCGb42dymfkA5OhgEiRYYYklKjxKer5o0s
	8wXicv9aKHLFvwrGGU3t6hqOCpZAE6nb9cNgKus7AoygDz+ctQtvwJFtMGp5u4viQRi3
	TvVpsgn8JItQLagMVE98gJbw5NLFgeXuoxImU=
Received: by 10.231.148.195 with SMTP id q3mr9858985ibv.199.1280213331697;
	Mon, 26 Jul 2010 23:48:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n20sm4506941ibe.5.2010.07.26.23.48.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 23:48:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 23:48:33 -0700
Message-Id: <1280213315-5513-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 6/8] classes, bitbake.conf: Add MACHINE_SYS and CURRENT_TARGET_SYS
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
X-List-Received-Date: Tue, 27 Jul 2010 06:49:15 -0000

* construct *VENDOR variable from TARGET_SUB_ARCH and DISTRO_VENDOR.

* MULTIMACH_* are no longer needed TARGET_SYS is distinct enough to get
  multi-machine builds going in same tmpdir.

* MACHINE_SYS expands to ${MACHINE}${TARGET_VENDOR}-${TARGET_OS}

* CURRENT_TARGET_SYS is defined based upon if a recipe is machine
  specific then it will be MACHINE_SYS else it will be TARGET_SYS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cross.bbclass            |    2 +-
 classes/packaged-staging.bbclass |    2 +-
 conf/bitbake.conf                |   51 +++++++++++++++++--------------------
 3 files changed, 25 insertions(+), 30 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 5776a37..75b2abe 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -15,6 +15,7 @@ OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
 PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
 # Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
 OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
+BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_VENDOR = "${BUILD_VENDOR}"
@@ -22,7 +23,6 @@ HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_EXEEXT = "${BUILD_EXEEXT}"
-BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
 BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index fda1431..6ff8106 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -15,7 +15,7 @@ PSTAGE_PKGVERSION = "${PV}-${PR}"
 PSTAGE_PKGARCH    = "${PACKAGE_ARCH}-${HOST_OS}"
 PSTAGE_EXTRAPATH  ?= "/${OELAYOUT_ABI}/${DISTRO_PR}/"
 PSTAGE_PKGPATH    = "${DISTRO}${PSTAGE_EXTRAPATH}"
-PSTAGE_PKGPN      = "${@bb.data.expand('staging-${PN}-${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}', d).replace('_', '-')}"
+PSTAGE_PKGPN      = "${@bb.data.expand('staging-${PN}-${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}', d).replace('_', '-')}"
 PSTAGE_PKGNAME    = "${PSTAGE_PKGPN}_${PSTAGE_PKGVERSION}_${PSTAGE_PKGARCH}.ipk"
 PSTAGE_PKG        = "${PSTAGE_DIR}/${PSTAGE_PKGPATH}/${PSTAGE_PKGNAME}"
 PSTAGE_WORKDIR   = "${TMPDIR}/pstage"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 66eebf3..1a4d257 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -98,7 +98,7 @@ BUILD_PREFIX = ""
 BUILD_CC_ARCH = ""
 BUILD_EXEEXT = ""
 
-HOST_ARCH = "${TARGET_SUB_ARCH}"
+HOST_ARCH = "${TARGET_ARCH}"
 HOST_OS = "${TARGET_OS}"
 HOST_VENDOR = "${TARGET_VENDOR}"
 HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
@@ -108,8 +108,11 @@ HOST_EXEEXT = ""
 
 TARGET_ARCH ?= "INVALID"
 TARGET_OS = "INVALID"
-TARGET_VENDOR = "${BUILD_VENDOR}"
-TARGET_SYS = "${TARGET_SUB_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
+TARGET_SUB_ARCH = "INVALID"
+DISTRO_VENDOR ?= 'oe'
+TARGET_VENDOR = ${@['-' + bb.data.getVar('TARGET_SUB_ARCH', d, 1), ''][bb.data.getVar('TARGET_SUB_ARCH', d, 1) == '']}\
+		${@['_' + bb.data.getVar('DISTRO_VENDOR', d, 1), ''][bb.data.getVar('DISTRO_VENDOR', d, 1) == '']}
+TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
@@ -126,20 +129,16 @@ SDK_EXEEXT = ""
 EXEEXT = "${HOST_EXEEXT}"
 
 BASE_PACKAGE_ARCH = "${HOST_ARCH}"
-PACKAGE_ARCH = "${BASE_PACKAGE_ARCH}"
+PACKAGE_ARCH ?= "${BASE_PACKAGE_ARCH}"
 PACKAGE_EXTRA_ARCHS ?= ""
 MACHINE_ARCH = "${@oe.utils.ifelse(bool(d.getVar('MACHINE', True)), '${MACHINE}', \
-                                   'BASE_PACKAGE_ARCH')}"
-PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
-
-MULTIMACH_ARCH = "${PACKAGE_ARCH}"
-MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-MULTIMACH_HOST_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
+                                   '${BASE_PACKAGE_ARCH}')}"
+MACHINE_SYS = ${MACHINE_ARCH}${TARGET_VENDOR}-${TARGET_OS}
 
-BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
-BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
-
-#TARGET_SUB_ARCH = "${BASE_PACKAGE_ARCH}"
+CURRENT_TARGET_SYS = "${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH', True) != '${BASE_PACKAGE_ARCH}', \
+					'${PACKAGE_ARCH}-${DISTRO_VENDOR}-${TARGET_OS}', \
+					'${TARGET_SYS}')}"
+PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}"
 
 # select proper CPU to get binary locales generated
 QEMU_OPTIONS = ""
@@ -289,8 +288,8 @@ GITDIR = "${CO_DIR}/git"
 BZRDIR = "${CO_DIR}/bzr"
 HGDIR = "${CO_DIR}/hg"
 
-STAMP = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PF}"
-WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}"
+STAMP = "${TMPDIR}/stamps/${CURRENT_TARGET_SYS}/${PF}"
+WORKDIR = "${TMPDIR}/work/${CURRENT_TARGET_SYS}/${PF}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
@@ -302,16 +301,14 @@ STAGING_DIR_JAVA = "${STAGING_DIR}/java"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
-STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
-STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
+STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${HOST_SYS}"
+STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_SYS}"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
 STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
 STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
 
-# This should really be MULTIMACH_HOST_SYS but that breaks "all" and machine 
-# specific packages - hack around it for now.
-STAGING_DIR_HOST = "${STAGING_DIR}/${BASEPKG_HOST_SYS}"
+STAGING_DIR_HOST = "${STAGING_DIR}/${HOST_SYS}"
 STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
 STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
 STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"
@@ -322,9 +319,7 @@ STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
 STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
 STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"
 
-# This should really be MULTIMACH_TARGET_SYS but that breaks "all" and machine 
-# specific packages - hack around it for now.
-STAGING_DIR_TARGET = "${STAGING_DIR}/${BASEPKG_TARGET_SYS}"
+STAGING_DIR_TARGET = "${STAGING_DIR}/${TARGET_SYS}"
 
 STAGING_DIR_SDK = "${STAGING_DIR}/${SDK_SYS}"
 
@@ -338,7 +333,7 @@ DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
+PKGDATA_DIR = "${TMPDIR}/pkgdata/${CURRENT_TARGET_SYS}"
 
 SDK_NAME = "${DISTRO}/${TARGET_ARCH}"
 SDK_PATH = "/usr/local/${SDK_NAME}"
@@ -348,7 +343,7 @@ SDKPATH = "${SDK_PATH}"
 # Kernel info.
 ##################################################################
 
-STAGING_KERNEL_DIR = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/kernel"
+STAGING_KERNEL_DIR = "${STAGING_DIR}/${MACHINE_SYS}/kernel"
 
 ##################################################################
 # Specific image creation and rootfs population info.
@@ -635,9 +630,9 @@ SLOT = "0"
 
 # Other
 
-export PKG_CONFIG_DIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig"
+export PKG_CONFIG_DIR = "${STAGING_DIR}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}${libdir}/pkgconfig"
 export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
-export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
-- 
1.7.1



