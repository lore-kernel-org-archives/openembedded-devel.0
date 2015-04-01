Return-Path: <Matthieu.CRAPET@ingenico.com>
X-Greylist: delayed 763 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Apr 2015 09:38:03 UTC
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDAE65C9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 09:38:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.11,503,1422918000"; d="scan'208";a="72259151"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 01 Apr 2015 11:25:00 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.3.210.2; Wed, 1 Apr 2015 11:24:59 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.3.210.2; Wed, 1 Apr 2015 11:24:59 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 1 Apr 2015 11:24:50 +0200
Message-ID: <1427880290-14408-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fbida: update to 2.10
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
X-List-Received-Date: Wed, 01 Apr 2015 09:38:04 -0000
Content-Type: text/plain

This release fixes QA Issue [file-rdeps]

Changes:
- fix HAVE_LIBUNGIF => HAVE_LIBGIF
- add "curl" and "webp" to PACKAGECONFIG

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../fbida/{fbida_git.bb => fbida_2.10.bb}           | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/fbida/{fbida_git.bb => fbida_2.10.bb} (66%)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_git.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
similarity index 66%
rename from meta-oe/recipes-graphics/fbida/fbida_git.bb
rename to meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index 41c14b8..c7195fc 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_git.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -8,20 +8,21 @@ SECTION = "utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif curl"
+DEPENDS = "virtual/libiconv jpeg fontconfig freetype libexif"
 
-SRC_URI = "git://git.kraxel.org/fbida"
-SRCREV = "6aa5563cb3c8864ad15cf83eb6fca3b773da1099"
-PV = "2.09+git${SRCPV}"
-S = "${WORKDIR}/git"
+SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz"
+SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
+SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
 
 EXTRA_OEMAKE = "STRIP="
 
-PACKAGECONFIG ??= "gif png"
+PACKAGECONFIG ??= "gif png curl"
+PACKAGECONFIG[curl] = ",,curl"
 PACKAGECONFIG[gif] = ",,giflib"
 PACKAGECONFIG[png] = ",,libpng"
 PACKAGECONFIG[tiff] = ",,tiff"
 PACKAGECONFIG[motif] = ",,libx11 libxext libxpm libxt openmotif"
+PACKAGECONFIG[webp] = ",,libwebp"
 
 do_compile() {
     sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
@@ -29,8 +30,11 @@ do_compile() {
 
     # Be sure to respect preferences (force to "no")
     # Also avoid issues when ${BUILD_ARCH} == ${HOST_ARCH}
+    if [ -z "${@base_contains('PACKAGECONFIG', 'curl', 'curl', '', d)}" ]; then
+        sed -i -e '/^HAVE_LIBCURL/s/:=.*$/:= no/' ${S}/GNUmakefile
+    fi
     if [ -z "${@base_contains('PACKAGECONFIG', 'gif', 'gif', '', d)}" ]; then
-        sed -i -e '/^HAVE_LIBUNGIF/s/:=.*$/:= no/' ${S}/GNUmakefile
+        sed -i -e '/^HAVE_LIBGIF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
     if [ -z "${@base_contains('PACKAGECONFIG', 'png', 'png', '', d)}" ]; then
         sed -i -e '/^HAVE_LIBPNG/s/:=.*$/:= no/' ${S}/GNUmakefile
@@ -41,6 +45,9 @@ do_compile() {
     if [ -z "${@base_contains('PACKAGECONFIG', 'motif', 'motif', '', d)}" ]; then
         sed -i -e '/^HAVE_MOTIF/s/:=.*$/:= no/' ${S}/GNUmakefile
     fi
+    if [ -z "${@base_contains('PACKAGECONFIG', 'webp', 'webp', '', d)}" ]; then
+        sed -i -e '/^HAVE_LIBWEBP/s/:=.*$/:= no/' ${S}/GNUmakefile
+    fi
 
     oe_runmake
 }
-- 
1.9.1


