Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PFxTU-0007Pt-Pm
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 00:20:13 +0100
Received: by gyf3 with SMTP id 3so12494gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 15:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=GIcKwT9dtalPX7ilJYk/pLBUeiAnOAlOf6Gu+EVqhDc=;
	b=FhEXVq+E+d6lZASjRoQwN1G7AafhNytzHMd/59o82yxTJGWivTac9apJDhSzDEOH1B
	sDMifcdhvLYrsV/69WSls/JLyI9berA0NSxuszVDJ6NhhADdTgeMZ+WxweIJQOfmveKh
	AdyBA2WHha1jSj6U46e4txgcFSeZYiFeWCAcU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=H2y46oo8dDfDMfLrQlhBXMKntKqOUwsCdGU6ElRxkbJC61qWEs44aGY3Tpf18tWZpc
	vdLMB8VQz06Tej7SY/+fZ5JalWRVR0HFhaTW9KFqRZe+X/fP/15RunXtSPSVWKHwwKEu
	KNJf63JVkX0xb25sVBLBVoezJl9UjM36hnmIM=
Received: by 10.151.102.12 with SMTP id e12mr4453988ybm.311.1289344717912;
	Tue, 09 Nov 2010 15:18:37 -0800 (PST)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id v12sm1317816ybk.23.2010.11.09.15.18.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Nov 2010 15:18:36 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Nov 2010 16:18:28 -0700
Message-Id: <1289344708-26165-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1289344708-26165-1-git-send-email-kergoth@gmail.com>
References: <1289344708-26165-1-git-send-email-kergoth@gmail.com>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [RFC] [PATCH 2/2] Add first pass type flags for bitbake.conf
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
X-List-Received-Date: Tue, 09 Nov 2010 23:21:57 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 classes/patch.bbclass |    5 +++++
 conf/bitbake.conf     |   33 +++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/classes/patch.bbclass b/classes/patch.bbclass
index 7629e9a..bc52ae7 100644
--- a/classes/patch.bbclass
+++ b/classes/patch.bbclass
@@ -5,6 +5,11 @@ QUILTRCFILE ?= "${STAGING_BINDIR_NATIVE}/quiltrc"
 
 PATCHDEPENDENCY = "${PATCHTOOL}-native:do_populate_sysroot"
 
+PATCHTOOL[type] = "choice"
+PATCHTOOL[choices] = "patch quilt git"
+PATCHRESOLVE[type] = "choice"
+PATCHRESOLVE[choices] = "noop user"
+
 python patch_do_patch() {
 	import oe.patch
 	import oe.unpack
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index f1dc0ff..86a5cc8 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -2,6 +2,7 @@
 # Recipe Parsing
 ##################################################################
 BBMASK = "/(nonworking|obsolete)/"
+BBMASK[type] = "regex"
 
 ##################################################################
 # Standard target filesystem layout.
@@ -172,6 +173,7 @@ ASSUME_PROVIDED = "\
     texinfo-native \
     util-linux-native \
     "
+ASSUME_PROVIDED[type] = "list"
 
 ##################################################################
 # Package default variables.
@@ -211,7 +213,9 @@ HOMEPAGE = "unknown"
 # Ensure that -dev packages recommend the corresponding -dev packages of their
 # deps, and the same for -dbg.
 DEPCHAIN_PRE  = ""
+DEPCHAIN_PRE[type] = "list"
 DEPCHAIN_POST = "-dev -dbg"
+DEPCHAIN_POST[type] = "list"
 
 DEPENDS = ""
 RDEPENDS = ""
@@ -232,8 +236,10 @@ SOLIBSDEV_darwin8 = ".dylib"
 SOLIBSDEV_darwin9 = ".dylib"
 
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-static ${PN}-locale"
+PACKAGES[type] = "list"
 #enable this when bitbake is upgraded to cope with ++ values in the field
 PACKAGES_DYNAMIC = "${PN}-locale-*"
+PACKAGES_DYNAMIC[type] = "list"
 FILES = ""
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
@@ -270,8 +276,14 @@ FILES_${PN}-locale = "${datadir}/locale"
 # file:// search paths
 FILE_DIRNAME = "${@os.path.dirname(bb.data.getVar('FILE', d))}"
 FILESPATHBASE = "${FILE_DIRNAME}"
+FILESPATHBASE[type] = "list"
+FILESPATHBASE[separator] = ":"
 FILESPATHPKG = "${PF}:${P}:${PN}:${BP}:${BPN}:files:."
+FILESPATHPKG[type] = "list"
+FILESPATHPKG[separator] = ":"
 FILESPATH = "${@':'.join(uniq(os.path.normpath(os.path.join(fp, p, o)) for fp in '${FILESPATHBASE}'.split(':') for p in '${FILESPATHPKG}'.split(':') for o in reversed([''] + filter(None, '${OVERRIDES}'.split(':')))))}"
+FILESPATH[type] = "list"
+FILESPATH[separator] = ":"
 FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 
 ##################################################################
@@ -420,8 +432,11 @@ EXTRA_IMAGEDEPENDS = ""
 # by default this is unset and should be so for libtools < 2.4
 
 LIBTOOL_HAS_SYSROOT ?= "no"
+LIBTOOL_HAS_SYSROOT[type] = "boolean"
 
 PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}/${base_bindir_native}:"
+PATH[type] = "list"
+PATH[separator] = ":"
 export PATH
 
 ##################################################################
@@ -594,6 +609,7 @@ BB_LOCALCOUNT_OVERRIDE = "1"
 
 # Value for revision counter in GIT recipes (NNNN in PV="1.0+gitrNNNN+a7401084a72285c8d3485bacf4eed593f303b1b7-r4.4")
 LOCALCOUNT = "0"
+LOCALCOUNT[type] = "integer"
 
 SRC_URI = "file://${FILE}"
 
@@ -647,6 +663,8 @@ export HOSTNAME := "${@os.uname()[1]}"
 PKG_CONFIG_DIR = "${STAGING_LIBDIR}/pkgconfig"
 export PKG_CONFIG_PATH = "${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADIR}/pkgconfig"
 PKG_CONFIG_PATH .= ":${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_DATADIR_NATIVE}/pkgconfig"
+PKG_CONFIG_PATH[type] = "list"
+PKG_CONFIG_PATH[separator] = ":"
 
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
@@ -681,6 +699,8 @@ MACHINE_OVERRIDES ?= ""
 OVERRIDES = "pn-${PN}:fail-fast:build-${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:${DISTRO}:\
 ${@[':'.join(d.getVar('MACHINE_OVERRIDES', True).split())+':',''][d.getVar('MACHINE_OVERRIDES', True).strip() == '']}\
 ${MACHINE}:local"
+OVERRIDES[type] = "list"
+OVERRIDES[separator] = ":"
 
 ##################################################################
 # Include the rest of the config files.
@@ -714,6 +734,7 @@ PCMCIA_MANAGER ?= "pcmcia-cs"
 DEFAULT_TASK_PROVIDER ?= "task-base"
 MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 IMAGE_ROOTFS_SIZE ?= "65536"
+IMAGE_ROOTFS_SIZE[type] = "integer"
 IMAGE_ROOTFS_SIZE_ext2 ?= "65536"
 IMAGE_ROOTFS_SIZE_ext2.gz ?= "65536"
 IMAGE_ROOTFS_SIZE_ext3 ?= "65536"
@@ -726,6 +747,7 @@ CACHE := "${CACHE}"
 
 # Default to disabling packaged staging code
 export PSTAGING_ACTIVE = "0"
+PSTAGING_ACTIVE[type] = "boolean"
 
 ##################################################################
 # Magic Cookie for SANITY CHECK
@@ -743,14 +765,21 @@ DISTRO_FEATURES += ' ${@["", "thumb-interwork"][bb.data.getVar('THUMB_INTERWORK'
 
 # This is used to limit what packages goes into images built, so set big by default
 ROOT_FLASH_SIZE ?= "256"
+ROOT_FLASH_SIZE[type] = "integer"
 
 MACHINE_GUI_CLASS ?= "smallscreen"
+MACHINE_GUI_CLASS[type] = "choice"
+MACHINE_GUI_CLASS[choices] = "bigscreen smallscreen"
 # GUI_MACHINE_CLASS is deprecated, please use MACHINE_GUI_CLASS instead
 GUI_MACHINE_CLASS ?= "${MACHINE_GUI_CLASS}"
 MACHINE_DISPLAY_WIDTH_PIXELS ?= "240"
+MACHINE_DISPLAY_WIDTH_PIXELS[type] = "integer"
 MACHINE_DISPLAY_HEIGHT_PIXELS ?= "320"
+MACHINE_DISPLAY_HEIGHT_PIXELS[type] = "integer"
 MACHINE_DISPLAY_ORIENTATION ?= "0"
+MACHINE_DISPLAY_ORIENTATION[type] = "boolean"
 MACHINE_DISPLAY_BPP ?= "16"
+MACHINE_DISPLAY_BPP[type] = "integer"
 
 DISTRO_EXTRA_RDEPENDS ?= ""
 DISTRO_EXTRA_RRECOMMENDS ?= ""
@@ -759,6 +788,9 @@ MACHINE_EXTRA_RRECOMMENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
+DISTRO_FEATURES[type] = "list"
+MACHINE_FEATURES[type] = "list"
+
 COMBINED_FEATURES = "\
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
     ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth", d)} \
@@ -789,6 +821,7 @@ COMBINED_FEATURES += "${@base_ifelse( \
      (base_contains('MACHINE_FEATURES', 'pcmcia', True, False, d) and \
       base_contains('DISTRO_FEATURES', 'pcmcia', True, False, d))), \
     'hostap', '')}"
+COMBINED_FEATURES[type] = "list"
 
 # Make sure MACHINE isn't exported
 # (breaks binutils at least)
-- 
1.7.2.3



