Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVKat-0007Be-9f
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 08:58:18 +0100
Received: by ywh8 with SMTP id 8so23584132ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2010 23:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=inaLUEx7Ewqbzazl/7NCaEy4pPmSUPQxXBbyKxjGFRw=;
	b=PvSFRdXSPBJ7MmwZ3Ibj/qOi6PKBTPuK9ZCl584V3yqd44gMmrnj6hb0ZtAUSqL82z
	L5WyvlXEsXPf4FqR0JvwhA2Aw2RVPvXB2mp29jDrpyS5SJMNKbJIj1D9o5H5SMFTOuHL
	Pwt7OXEMxQRy3WBwaJRD/JjCHRDKCtWt0N5ac=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xho2qv/iP6waFOKwYixK+OAid/2a9Z7qTuteR8NYvxddyTbCX5dlJsDMy7x5rlxsYW
	JIDqCCS4PXJmWHrCVwNMGZqaneHPDnkMQsGnTcqEZ35b0J6+a3nwr/oalJRfD4On6QXf
	znUphRJQNHd3yMVBoTo7TyxJRMZAKUaIqlLns=
Received: by 10.101.115.16 with SMTP id s16mr1143129anm.21.1263455763999;
	Wed, 13 Jan 2010 23:56:03 -0800 (PST)
Received: from localhost ([123.162.69.75])
	by mx.google.com with ESMTPS id 6sm50344ywd.37.2010.01.13.23.55.59
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Jan 2010 23:56:03 -0800 (PST)
From: Guo Hongruan <camelguo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2010 15:55:39 +0800
Message-Id: <1263455739-13595-1-git-send-email-camelguo@gmail.com>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Support building all project in one directory
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
X-List-Received-Date: Thu, 14 Jan 2010 07:58:18 -0000

* Append ${LIBC} to CACHE, STAMP, WORKDIR, STAGING_DIR and CROSS_DIR defination, so that package building with different libc will not bother each other.
* Change the '${TMPDIR}/pkgdata/' to '${PKGDATA_DIR}/../', which make PKGDATA_DIR relocationable possible.
* Add mismatch ')' in classes/package_ipk.bbclass
* Override LIBC to null, so that projects with different libc will share the same native tools.
---
 classes/native.bbclass      |    2 ++
 classes/package_ipk.bbclass |    2 +-
 classes/packagedata.bbclass |    2 +-
 conf/bitbake.conf           |   16 ++++++++--------
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/classes/native.bbclass b/classes/native.bbclass
index 6698b61..01ee9b2 100644
--- a/classes/native.bbclass
+++ b/classes/native.bbclass
@@ -27,6 +27,8 @@ HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_EXEEXT = "${BUILD_EXEEXT}"
 
+LIBC = ""
+
 CPPFLAGS = "${BUILD_CPPFLAGS}"
 CFLAGS = "${BUILD_CFLAGS}"
 CXXFLAGS = "${BUILD_CFLAGS}"
diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
index 420c892..708b539 100644
--- a/classes/package_ipk.bbclass
+++ b/classes/package_ipk.bbclass
@@ -54,7 +54,7 @@ python package_ipk_install () {
 
 
 	if (not os.access(os.path.join(ipkdir,"Packages"), os.R_OK) or
-		not os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),os.R_OK):
+		not os.access(os.path.join(tmpdir, "stamps", "IPK_PACKAGE_INDEX_CLEAN"),os.R_OK)):
 		ret = os.system('ipkg-make-index -p %s %s ' % (os.path.join(ipkdir, "Packages"), ipkdir))
 		if (ret != 0 ):
 			raise bb.build.FuncFailed
diff --git a/classes/packagedata.bbclass b/classes/packagedata.bbclass
index 86f18a9..a207841 100644
--- a/classes/packagedata.bbclass
+++ b/classes/packagedata.bbclass
@@ -25,7 +25,7 @@ def read_pkgdatafile(fn):
 def get_subpkgedata_fn(pkg, d):
 	archs = bb.data.expand("${PACKAGE_ARCHS}", d).split(" ")
 	archs.reverse()
-	pkgdata = bb.data.expand('${TMPDIR}/pkgdata/', d)
+	pkgdata = bb.data.expand('${PKGDATA_DIR}/../', d)
 	targetdir = bb.data.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/', d)
 	for arch in archs:
 		fn = pkgdata + arch + targetdir + pkg
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 3a68959..cbe5f75 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -280,7 +280,7 @@ FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 ##################################################################
 
 TMPDIR = "${TOPDIR}/tmp"
-CACHE = "${TMPDIR}/cache${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
+CACHE = "${TMPDIR}/cache/${LIBC}/${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}"
 CO_DIR = "${DL_DIR}"
 CVSDIR = "${CO_DIR}/cvs"
 SVNDIR = "${CO_DIR}/svn"
@@ -288,17 +288,17 @@ GITDIR = "${CO_DIR}/git"
 BZRDIR = "${CO_DIR}/bzr"
 HGDIR = "${CO_DIR}/hg"
 
-STAMP = "${TMPDIR}/stamps/${MULTIMACH_TARGET_SYS}/${PF}"
-WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PF}"
+STAMP = "${TMPDIR}/stamps/${LIBC}/${MULTIMACH_TARGET_SYS}/${PF}"
+WORKDIR = "${TMPDIR}/work/${LIBC}/${MULTIMACH_TARGET_SYS}/${PF}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
 B = "${S}"
 
-STAGING_DIR = "${TMPDIR}/staging"
+STAGING_DIR = "${TMPDIR}/staging/${LIBC}"
 
 STAGING_DIR_JAVA = "${STAGING_DIR}/java"
-STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
+STAGING_DIR_NATIVE = "${TMPDIR}/staging/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
 STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"
 STAGING_BINDIR_CROSS_BASEPKG = "${STAGING_DIR_NATIVE}${bindir_native}/${BASEPKG_TARGET_SYS}"
@@ -327,7 +327,7 @@ STAGING_DIR_SDK = "${STAGING_DIR}/${SDK_SYS}"
 
 # Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
 # packaged staging and/or multimachine.
-DEPLOY_DIR ?= "${TMPDIR}/deploy"
+DEPLOY_DIR ?= "${TMPDIR}/deploy/${LIBC}"
 DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
 DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
@@ -335,7 +335,7 @@ DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE = "${DEPLOY_DIR}/images"
 DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
-PKGDATA_DIR = "${TMPDIR}/pkgdata/${MULTIMACH_TARGET_SYS}"
+PKGDATA_DIR = "${TMPDIR}/pkgdata/${LIBC}/${MULTIMACH_TARGET_SYS}"
 
 SDK_NAME = "${DISTRO}/${TARGET_ARCH}"
 SDK_PATH = "/usr/local/${SDK_NAME}"
@@ -409,7 +409,7 @@ EXTRA_IMAGEDEPENDS = ""
 # Toolchain info.
 ##################################################################
 
-CROSS_DIR = "${TMPDIR}/cross/${BASE_PACKAGE_ARCH}"
+CROSS_DIR = "${TMPDIR}/cross/${LIBC}/${BASE_PACKAGE_ARCH}"
 CROSS_DATADIR = "${CROSS_DIR}/share"
 PATH_prepend = "${STAGING_BINDIR_CROSS}:${STAGING_BINDIR_CROSS_BASEPKG}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${CROSS_DIR}/${bindir_cross}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
 export PATH
-- 
1.5.4.3



