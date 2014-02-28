Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 5A8366EFC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 13:11:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,561,1389740400"; d="scan'208";a="41935987"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 28 Feb 2014 14:11:39 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Fri, 28 Feb 2014 14:11:39 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Fri, 28 Feb 2014 14:11:38 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Feb 2014 14:04:30 +0100
Message-ID: <1393592670-3088-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fbida 2.09: cleanups and use PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2014 13:11:43 -0000
Content-Type: text/plain

There are now 3 packageconfig variables: gif, png, tiff.

Changes:
- fix missing $ for STAGING_INCDIR (jpeg version detection)
- use TABS for (shell) indentation
- add DESCRIPTION
- no more QA warnings
Use this to reveal:
sed -i -e '/^verbose/s/no/yes/' ${S}/mk/Autoconf.mk

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.09.bb | 39 +++++++++++++++++++++++-----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
index 32f376f..a3abf8f 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.09.bb
@@ -1,27 +1,54 @@
+SUMMARY = "Framebuffer image and doc viewer tools"
+DESCRIPTION = "The fbida project contains a few applications for viewing and editing images, \
+               with the main focus being photos."
 HOMEPAGE = "http://linux.bytesex.org/fbida/"
-SUMMARY = "frame buffer image and doc viewer tools"
 AUTHOR = "Gerd Hoffmann"
 SECTION = "utils"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-DEPENDS = "virtual/libiconv libpng jpeg fontconfig freetype libexif curl libungif tiff"
+DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif curl"
 
+PR = "r1"
+
+# Note: SRCREV is 3 revisions ahead of 2.09
 SRC_URI = "git://git.kraxel.org/fbida"
 SRCREV = "cb0ce5fa5f42bfaea4f8f326bcd8914dd14e782d"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "STRIP="
 
+PACKAGECONFIG ??= "gif png"
+PACKAGECONFIG[gif] = ",,libungif"
+PACKAGECONFIG[png] = ",,libpng"
+PACKAGECONFIG[tiff] = ",,tiff"
+
 do_compile() {
-    sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I{STAGING_INCDIR}:g' GNUmakefile
-    oe_runmake
+	sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
+	sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I${STAGING_INCDIR}:' ${S}/GNUmakefile
+
+	if [ -z "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}" ]; then
+		sed -i -e '/^HAVE_MOTIF/s/:=.*$/:= no/' ${S}/GNUmakefile
+	fi
+
+	# Be sure to respect preferences (force to "no")
+	# Also avoid issues when ${BUILD_ARCH} == ${HOST_ARCH}
+	if [ -z "${@base_contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ]; then
+		sed -i -e '/^HAVE_LIBUNGIF/s/:=.*$/:= no/' ${S}/GNUmakefile
+	fi
+	if [ -z "${@base_contains('PACKAGECONFIG', 'png', 'png', '', d)}" ]; then
+		sed -i -e '/^HAVE_LIBPNG/s/:=.*$/:= no/' ${S}/GNUmakefile
+	fi
+	if [ -z "${@base_contains('PACKAGECONFIG', 'tiff', 'tiff', '', d)}" ]; then
+		sed -i -e '/^HAVE_LIBTIFF/s/:=.*$/:= no/' ${S}/GNUmakefile
+	fi
+
+	oe_runmake
 }
 
 do_install() {
-    oe_runmake 'DESTDIR=${D}' install
+	oe_runmake 'DESTDIR=${D}' install
 }
 
 RDEPENDS_${PN} = "ttf-dejavu-sans-mono"
-
-- 
1.8.5.4


