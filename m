Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rtk4k-0007Z4-G7
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 19:11:02 +0100
Received: by daln34 with SMTP id n34so993456dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 10:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Mk4FSc+G9V6EaJXhy5DY8oYeu7PwqTElGt1ASh/A+Q0=;
	b=iCLHbn2rHewBejj04Q1pppL46SdxBABYIrcFygx2nVbFH0Yvs4zRGjzZJ+yXs4ernS
	ItSb0dSOCmXVYauYsZ/We4SaEYT+1KV6tg1+BVc9Fa9bJYXOD/pdT3lIe/Fi3tDf3yQi
	0EdAQXuaobI61xhecWnj+cNaefFV03TWQPNDA=
Received: by 10.68.200.65 with SMTP id jq1mr30226433pbc.54.1328378582376;
	Sat, 04 Feb 2012 10:03:02 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id a5sm23252117pbh.15.2012.02.04.10.03.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 10:03:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Feb 2012 10:02:53 -0800
Message-Id: <1328378573-11998-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
Subject: [meta-oe][PATCH] recipe: Delete the duplicate recipes which are already in oe-core
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
X-List-Received-Date: Sat, 04 Feb 2012 18:11:02 -0000

These recipes are either same or have small differences but
are superset of changes in oe-core. We can use them from oe-core
as it is without losing or adding any functionality by default

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/eglibc/ldconfig-native_2.12.1.bb  |   28 --------------------
 meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb     |   10 -------
 meta-oe/recipes-support/cups/cups_1.4.6.bb         |   17 ------------
 3 files changed, 0 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb
 delete mode 100644 meta-oe/recipes-support/cups/cups_1.4.6.bb

diff --git a/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb b/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
deleted file mode 100644
index 2a93913..0000000
--- a/meta-oe/recipes-core/eglibc/ldconfig-native_2.12.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "A standalone native ldconfig build"
-
-LICENSE = "GPLv2+"
-
-LIC_FILES_CHKSUM = "file://${S}/ldconfig.c;endline=17;md5=1d15f20937c055cb5de2329a4c054399"
-
-SRC_URI = "file://ldconfig-native-2.12.1.tar.bz2 \
-           file://ldconfig.patch \
-           file://ldconfig_aux-cache_path_fix.patch \
-           file://32and64bit.patch \
-           file://endian-ness_handling.patch \
-           file://flag_fix.patch \
-           file://endianess-header.patch"
-
-PR = "r2"
-
-inherit native
-
-S = "${WORKDIR}/${PN}-${PV}"
-
-do_compile () {
-	$CC ldconfig.c -std=gnu99 chroot_canon.c xmalloc.c xstrdup.c cache.c readlib.c  -I. dl-cache.c -o ldconfig
-}
-
-do_install () {
-	install -d ${D}/${bindir}/
-	install ldconfig ${D}/${bindir}/
-}
diff --git a/meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb
deleted file mode 100644
index d51e1e8..0000000
--- a/meta-oe/recipes-graphics/xorg-app/rgb_1.0.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require recipes-graphics/xorg-app/xorg-app-common.inc
-DEPENDS += " xproto util-macros"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ef598adbe241bd0b0b9113831f6e249a"
-PE = "1"
-PR = "r6"
-
-SRC_URI[md5sum] = "35c6cccbf25a872bdd62bfcb1a73d951"
-SRC_URI[sha256sum] = "80887da011ad086fff88bfd16c6d9d5ac7da45ef1bc9d0c192a6f370423370f1"
-
-FILES_${PN} += "${datadir}/X11"
diff --git a/meta-oe/recipes-support/cups/cups_1.4.6.bb b/meta-oe/recipes-support/cups/cups_1.4.6.bb
deleted file mode 100644
index 783ecf6..0000000
--- a/meta-oe/recipes-support/cups/cups_1.4.6.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require cups14.inc
-
-DEPENDS += "virtual/libusb0"
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=956e7600195e6139f12de8c2a5bbefa9"
-
-SRC_URI += " \
-	file://use_echo_only_in_init.patch \
-    file://0001-don-t-try-to-run-generated-binaries.patch \
-	"
-
-SRC_URI[md5sum] = "de8fb5a29c36554925c0c6a6e2c0dae1"
-SRC_URI[sha256sum] = "f08711702a77b52c7150f96fe1f45482f6151cb95ef601268c528607fe6ad514"
-
-EXTRA_OECONF += " --disable-gssapi --enable-debug --disable-relro --enable-libusb"
-
-CONFFILES_${PN} += "${sysconfdir}/cups/cupsd.conf"
-- 
1.7.8.3



