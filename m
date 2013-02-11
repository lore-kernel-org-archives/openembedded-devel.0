Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U52Rj-0000JP-9t
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 00:06:05 +0100
Received: by mail-ea0-f170.google.com with SMTP id a11so2885576eaa.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 14:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=JqrwHDFAApTTny6qG3GlStp9KjW7+KH09GkG6r1Nw+U=;
	b=UpD/v2vdoNCFK7AjDAFRhkNymvfZzJA/Wv8AdeuAnImbmC1veHvh0RI+jgti949HlD
	RMgRKcCxrdYKpTKD99XToIPxtvDNrEw9scPaU3hGWZ+ntJ7X+nPQ9weGxMaqR9AVIjyY
	pzLGkgnlEwysYiRrwo4JHsjBYf2GrCKaEvbt87TXBEzMHodmUlA7Y7sKRDs2e6wiR5OO
	uk2vZCQ0US40vc7UQ1BKIhEnw79rKjrelwnTspH+u+8pDs2ffybyuablDCZfWVyYQSFH
	Kg+E0+eE8V65H39iM1ru/dtbVi9aPNtDWr8IDOgnoSxifxiG7utA7sK7mH9zjj5cWB8/
	E0KQ==
X-Received: by 10.14.215.131 with SMTP id e3mr55750628eep.32.1360623000612;
	Mon, 11 Feb 2013 14:50:00 -0800 (PST)
Received: from localhost.localdomain (p4FDF102E.dip.t-dialin.net.
	[79.223.16.46])
	by mx.google.com with ESMTPS id l8sm30910395een.10.2013.02.11.14.49.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 14:49:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 23:49:37 +0100
Message-Id: <1360622979-16426-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1360622979-16426-1-git-send-email-schnitzeltony@googlemail.com>
References: <1360622979-16426-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 1/3] ttf-fonts: inherit oe-core's fontcache.bbclass instead of update-fonts
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
X-List-Received-Date: Mon, 11 Feb 2013 23:06:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    4 ++--
 .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    4 ++--
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    4 ++--
 .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    4 ++--
 .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    4 ++--
 .../ttf-fonts/ttf-liberation_0.2.bb                |    4 ++--
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    7 ++-----
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    4 ++--
 .../ttf-fonts/ttf-ubuntu-font-family_0.80.bb       |    4 ++--
 .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    4 ++--
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    2 +-
 11 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 06e06ca..8aeee0c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -4,9 +4,9 @@ LICENSE = "Arphic Public License"
 LIC_FILES_CHKSUM = "file://README;md5=62be011094b7865ddc4d1a648444d31a"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-chinese-font"
-PR = "r5"
+PR = "r6"
 
-UPDATE_FONTS_PACKAGES = "${PN}"
+FONT_PACKAGES = "${PN}"
 
 SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arphic-uming_0.2.${PV}.1.orig.tar.gz"
 S = "${WORKDIR}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
index eead861..bcc797c 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN}-sans-condensed = "${PN}-common"
 RDEPENDS_${PN}-serif = "${PN}-common"
 RDEPENDS_${PN}-serif-condensed = "${PN}-common"
 RDEPENDS_${PN}-common = ""
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
            file://30-dejavu-aliases.conf"
@@ -31,7 +31,7 @@ PACKAGES = "\
             ${PN}-serif \
             ${PN}-serif-condensed \
             ${PN}-common"
-UPDATE_FONTS_PACKAGES = "${PN}-sans ${PN}-sans-mono ${PN}-sans-condensed ${PN}-serif ${PN}-serif-condensed"
+FONT_PACKAGES = "${PN}-sans ${PN}-sans-mono ${PN}-sans-condensed ${PN}-serif ${PN}-serif-condensed"
 
 FILES_${PN}-sans            = "${datadir}/fonts/truetype/DejaVuSans.ttf ${datadir}/fonts/truetype/DejaVuSans-*.ttf"
 FILES_${PN}-sans-mono       = "${datadir}/fonts/truetype/DejaVuSansMono*.ttf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index 1a04a5f..a96bc51 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
 SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
 PV = "0.1+gitr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "git://github.com/android/platform_frameworks_base.git;protocol=git;branch=master"
 
@@ -18,7 +18,7 @@ do_install_prepend() {
 
 PACKAGES = "ttf-droid-sans ttf-droid-sans-mono \
             ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif"
-UPDATE_FONTS_PACKAGES = "ttf-droid-sans ttf-droid-sans-mono ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif"
+FONT_PACKAGES = "ttf-droid-sans ttf-droid-sans-mono ttf-droid-sans-fallback ttf-droid-sans-japanese ttf-droid-serif"
 
 FILES_ttf-droid-sans = "${datadir}/fonts/truetype/DroidSans.ttf ${datadir}/fonts/truetype/DroidSans-Bold.ttf"
 FILES_ttf-droid-sans-mono = "${datadir}/fonts/truetype/DroidSansMono.ttf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 1e21e14..d289e80 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -6,7 +6,7 @@ LICENSE = "OFL"
 LICENSE_URL = "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
 LIC_FILES_CHKSUM = "file://OFL;md5=33a5bf7b98a9c0ae87430760ba762295 \
 "
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz "
 
@@ -23,7 +23,7 @@ do_install_append() {
 }
 
 PACKAGES = "${PN} ${PN}-alt"
-UPDATE_FONTS_PACKAGES = "${PN} ${PN}-alt"
+FONT_PACKAGES = "${PN} ${PN}-alt"
 
 FILES_${PN}-alt = "${datadir}/fonts/truetype/GenAI*.ttf \
                    ${datadir}/fonts/truetype/GenAR*.ttf \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
index 1f77211..97a82ef 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
@@ -4,14 +4,14 @@ DESCRIPTION = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=7fbc338309ac38fefcd64b04bb903e34"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
 
 S = "${WORKDIR}/hunkyfonts-${PV}/TTF/"
 
 PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
-UPDATE_FONTS_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
+FONT_PACKAGES = "ttf-hunky-sans ttf-hunky-serif"
 
 FILES_ttf-hunky-sans = "${datadir}/fonts/truetype/HunkySans*.ttf"
 FILES_ttf-hunky-serif = "${datadir}/fonts/truetype/HunkySerif*.ttf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index 901b8b2..7ed4a64 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://License.txt;md5=5b171c5100029d884fcea21d9a2b7543 \
 "
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://fedorahosted.org/liberation-fonts/export/807b6dfd069b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
 S = "${WORKDIR}/liberation-fonts-${PV}"
 
 PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
-UPDATE_FONTS_PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
+FONT_PACKAGES = "ttf-liberation-mono ttf-liberation-sans ttf-liberation-serif"
 
 FILES_ttf-liberation-mono  = "${datadir}/fonts/truetype/*Mono*"
 FILES_ttf-liberation-sans  = "${datadir}/fonts/truetype/*Sans*"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 6f12d29..5237944 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -6,7 +6,7 @@ LICENSE = "${PN}"
 LIC_FILES_CHKSUM = "file://LICENSE_E;md5=ac161e96eda00db9a3aec7870b5d9658 \
                     file://LICENSE_J;md5=a120ca8d7c8e4a475d5277c9aeb95221 \
 "
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
@@ -14,12 +14,9 @@ S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
 python populate_packages_prepend() {
     plugindir = d.expand('${datadir}/fonts/ttf-mplus/')
     packages = do_split_packages(d, plugindir, '^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s', extra_depends = "ttf-common")
-    d.setVar('UPDATE_FONTS_PACKAGES', ' '.join(packages))
+    d.setVar('FONT_PACKAGES', ' '.join(packages))
 }
 
-# for update-fonts.bbclass sake only, replaced later in populate_packages_prepend
-UPDATE_FONTS_PACKAGES = "${PN}"
-
 do_install() {
 	install -d ${D}${datadir}/fonts/ttf-mplus
 	install -m 0644 *.ttf ${D}${datadir}/fonts/ttf-mplus/
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index d982c11..d883734 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -9,13 +9,13 @@ LICENSE = "Public domain"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-japanese-font"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
 S = "${WORKDIR}/sazanami-20040629"
 
 PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"
-UPDATE_FONTS_PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"
+FONT_PACKAGES = "ttf-sazanami-gothic ttf-sazanami-mincho"
 
 FILES_ttf-sazanami-gothic = "${datadir}/fonts/truetype/sazanami-gothic.ttf \
                              ${datadir}/doc/ttf-sazanami-gothic/README"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
index 8d99259..bd83980 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Ubuntu Font Family - TTF Version"
 HOMEPAGE = "http://font.ubuntu.com"
 LICENSE = "UFL"
 LIC_FILES_CHKSUM = "file://LICENCE.txt;md5=325a1a9029112a2405e743c7f816427b"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://font.ubuntu.com/download/ubuntu-font-family-${PV}.zip"
 
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "107170099bbc3beae8602b97a5c423525d363106c3c24f787d43e09811
 S = "${WORKDIR}/ubuntu-font-family-${PV}"
 
 PACKAGES = "ttf-ubuntu-mono ttf-ubuntu-sans"
-UPDATE_FONTS_PACKAGES = "ttf-ubuntu-mono ttf-ubuntu-sans"
+FONT_PACKAGES = "ttf-ubuntu-mono ttf-ubuntu-sans"
 
 FILES_ttf-ubuntu-mono  = "${datadir}/fonts/truetype/*Mono*"
 FILES_ttf-ubuntu-sans  = "${datadir}/fonts/truetype/Ubuntu-*"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
index 0263301..6095386 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
@@ -5,7 +5,7 @@ AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
 HOMEPAGE = "http://wqy.sourceforge.net/en/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf540fc7d35b5777e36051280b3a911c"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
 S = "${WORKDIR}/wqy-zenhei"
@@ -17,7 +17,7 @@ do_install_append () {
 }
 
 PACKAGES = "${PN}"
-UPDATE_FONTS_PACKAGES = "${PN}"
+FONT_PACKAGES = "${PN}"
 
 FILES_${PN} = "${datadir}/fonts ${sysconfdir}"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
index 70283be..c77af39 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
@@ -9,4 +9,4 @@ do_install() {
     find ./ -name '*.tt[cf]' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
 }
 
-inherit allarch update-fonts
+inherit allarch fontcache
-- 
1.7.4.4



