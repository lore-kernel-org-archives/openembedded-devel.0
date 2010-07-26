Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdTsd-0007HR-Ts
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:02:33 +0200
Received: by pxi12 with SMTP id 12so230093pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 13:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=kGd/YwEYF3r78Z6+JjCf+baS0Op2ylJDL8fVIjTlUYg=;
	b=Tk9RF6hXHjOh8ITqDlHcgmpWL0bGrmiH1tvI+EPoNJv1rRwOo90/1GhsH/m59NkDtH
	BHSoewwuMDdAqm43ZOEMA9Ya+AW8Tkxb7X7KemiIkKrzED/hx12NDUfSZSlyEH1QEi2a
	EKLaEFGMFSlWf6fkqdT8alrIU4EE8TGw2WB/U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=lzWqpgeCHbQzXR77qdW7nK6X9koiO7AhuVY3heB/mqOrWxzq5GcBQ+msZdrrV+h5gb
	wpYjonf6VF9p8nkOhZWUCWYvjravhbrBu5P0ZuLG2Kh88dASHO4yURCUtne8H9mXt4GK
	T9xYOIUQWovjytpuU4JsgQhm0aEye2T0AyQl8=
Received: by 10.142.141.8 with SMTP id o8mr8441660wfd.243.1280174534649;
	Mon, 26 Jul 2010 13:02:14 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q27sm4573766wfc.18.2010.07.26.13.02.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 13:02:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 13:02:02 -0700
Message-Id: <1280174528-27682-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/7] bitbake.conf: Define HOST_SYS and TARGET_SYS based on target sub-arch
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
X-List-Received-Date: Mon, 26 Jul 2010 20:02:33 -0000

* define DISTRO_VENDOR instead of TARGET_VENDOR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/cross.bbclass                  |    2 +-
 conf/bitbake.conf                      |    5 +++--
 conf/distro/include/angstrom.inc       |    2 +-
 conf/distro/include/kaeilos-2010.inc   |    2 +-
 conf/distro/include/kaeilos.inc        |    2 +-
 conf/distro/include/oplinux.inc        |    2 +-
 conf/distro/include/sane-toolchain.inc |    2 +-
 conf/distro/iphone-compat.conf         |    2 +-
 conf/distro/mamona.conf                |    2 +-
 conf/distro/nylon.conf                 |    2 +-
 10 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 75b2abe..5776a37 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -15,7 +15,6 @@ OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
 PACKAGE_ARCH = "${OLD_PACKAGE_ARCH}"
 # Also save BASE_PACKAGE_ARCH since HOST_ARCH can influence it
 OLD_BASE_PACKAGE_ARCH := "${BASE_PACKAGE_ARCH}"
-BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
 
 HOST_ARCH = "${BUILD_ARCH}"
 HOST_VENDOR = "${BUILD_VENDOR}"
@@ -23,6 +22,7 @@ HOST_OS = "${BUILD_OS}"
 HOST_PREFIX = "${BUILD_PREFIX}"
 HOST_CC_ARCH = "${BUILD_CC_ARCH}"
 HOST_EXEEXT = "${BUILD_EXEEXT}"
+BASE_PACKAGE_ARCH = "${OLD_BASE_PACKAGE_ARCH}"
 BASEPKG_HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 
 CPPFLAGS = "${BUILD_CPPFLAGS}"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 8cb8187..2a1f241 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -101,7 +101,7 @@ BUILD_EXEEXT = ""
 HOST_ARCH = "${TARGET_ARCH}"
 HOST_OS = "${TARGET_OS}"
 HOST_VENDOR = "${TARGET_VENDOR}"
-HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
+HOST_SYS = "${BASEPKG_HOST_SYS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
 HOST_EXEEXT = ""
@@ -109,7 +109,7 @@ HOST_EXEEXT = ""
 TARGET_ARCH ?= "INVALID"
 TARGET_OS = "INVALID"
 TARGET_VENDOR = "${BUILD_VENDOR}"
-TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
+TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
@@ -135,6 +135,7 @@ PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}
 MULTIMACH_ARCH = "${PACKAGE_ARCH}"
 MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 MULTIMACH_HOST_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
+
 BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 3ba94fa..9f01bde 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -9,7 +9,7 @@ DISTRO_NAME = "Angstrom"
 
 BUILDNAME = "Angstrom ${DISTRO_VERSION}"
 
-TARGET_VENDOR = "-angstrom"
+DISTRO_VENDOR = "_angstrom"
 
 SOC_FAMILY ?= "Unknown"
 
diff --git a/conf/distro/include/kaeilos-2010.inc b/conf/distro/include/kaeilos-2010.inc
index 2fb30ce..d42958f 100644
--- a/conf/distro/include/kaeilos-2010.inc
+++ b/conf/distro/include/kaeilos-2010.inc
@@ -12,7 +12,7 @@ USERDISTRO := "${DISTRO}"
 DISTRO = "kaeilos"
 DISTRO_NAME = "KaeilOS"
 BUILDNAME = "KaeilOS ${DISTRO_VERSION}"
-TARGET_VENDOR = "-kaeilos"
+DISTRO_VENDOR = "_kaeilos"
 
 # Add FEED_ARCH to overrides
 OVERRIDES .= ":${FEED_ARCH}"
diff --git a/conf/distro/include/kaeilos.inc b/conf/distro/include/kaeilos.inc
index edbad69..2fa7b8c 100644
--- a/conf/distro/include/kaeilos.inc
+++ b/conf/distro/include/kaeilos.inc
@@ -12,7 +12,7 @@ DISTRO_NAME = "KaeilOS"
 
 BUILDNAME = "KaeilOS ${DISTRO_VERSION}"
 
-TARGET_VENDOR = "-kaeilos"
+DISTRO_VENDOR = "_kaeilos"
 
 # Add FEED_ARCH to overrides
 OVERRIDES .= ":${FEED_ARCH}"
diff --git a/conf/distro/include/oplinux.inc b/conf/distro/include/oplinux.inc
index 36eca58..7930f5d 100644
--- a/conf/distro/include/oplinux.inc
+++ b/conf/distro/include/oplinux.inc
@@ -43,7 +43,7 @@ DISTRO_FEATURES = "nfs smbfs ext2 usbhost pci"
 
 
 #We need to set this to avoid problems when building for if host=target
-TARGET_VENDOR = "-oplinux"
+DISTRO_VENDOR = "_oplinux"
 
 #URI for base feeds
 OPLINUX_URI = "http://www.digital-opsis.com/oplinux"
diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index de73922..054fe23 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -60,7 +60,7 @@ PREFERRED_PROVIDER_linux-libc-headers = "linux-libc-headers"
 #############################################################################
 
 # Branding
-TARGET_VENDOR = "-oe"
+DISTRO_VENDOR ?= "_oe"
 
 # Add FEED_ARCH to the overrides list so that we can override the
 # ARM_INSTRUCTION_SET like below
diff --git a/conf/distro/iphone-compat.conf b/conf/distro/iphone-compat.conf
index be2017b..01fbdfd 100644
--- a/conf/distro/iphone-compat.conf
+++ b/conf/distro/iphone-compat.conf
@@ -3,7 +3,7 @@ require conf/distro/angstrom-2008.1.conf
 DISTRO_NAME = "iphone-compat"
 
 TARGET_OS = "darwin9"
-TARGET_VENDOR = "-apple"
+DISTRO_VENDOR = "_apple"
 
 export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} -Wl,-L${STAGING_DIR_TARGET}${libdir}"
 
diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
index 31d6c36..37b38db 100644
--- a/conf/distro/mamona.conf
+++ b/conf/distro/mamona.conf
@@ -9,7 +9,7 @@ DISTRO_TYPE = "debug"
 
 MAINTAINER = "Mamona Team <mamona-devel@garage.maemo.org>"
 
-TARGET_VENDOR = "-mamona"
+DISTRO_VENDOR = "_mamona"
 
 require conf/distro/include/sane-srcdates.inc
 require conf/distro/include/sane-srcrevs.inc
diff --git a/conf/distro/nylon.conf b/conf/distro/nylon.conf
index ae8d064..8d16f3a 100644
--- a/conf/distro/nylon.conf
+++ b/conf/distro/nylon.conf
@@ -17,7 +17,7 @@ BUILDNAME := "${NYLON_VERSION}"
 DISTRO_TYPE = "debug"
 TARGET_FPU = "soft"
 SRCDATE := "20050527"
-TARGET_VENDOR = "-nylon"
+DISTRO_VENDOR = "_nylon"
 
 # Ensure some form of release config, so error out if someone thinks he knows better
 DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove this line or set a dummy DISTRO_VERSION")
-- 
1.7.1



