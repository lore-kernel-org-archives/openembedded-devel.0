Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSDP3-0006sx-VI
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 22:22:30 +0200
Received: by wgbdr1 with SMTP id dr1so665464wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 13:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Kz4B9hu8PZG2QfZdlodksiHkanlQ9fJBtZ8+ahkcsLw=;
	b=R36D4TlAZ/z0Q/Llsd10l97N2+bLwzOmxCQczIHnLcKivwiAQ/O0mJqTYbt5ZYznSN
	X5+AztbRXRH46q/1dbJ3tjTsh8Yj+yUy3U75bCEu/u29u/E1PL1GpjA8rYJarVnK3tvy
	ue96G3z5i/W4CpUWbqN9TZy6PZCmyH28XDlt3s97ITsgkPuOXoWPGj1z3HdoXgJWkksZ
	6+cXZgcCgGBkR76mwgGvj2FnzK+56sYq3YNEIwTENSX/m9iHYn12N5Un+x58QrMdfe5I
	SUFV8l6DGEe/hNetpo6tM5jE/gkRR2A3tgkBlJ2rtXsQCuFGkXKrgUZPG7IXkkIAj5KU
	v7gQ==
Received: by 10.216.55.148 with SMTP id k20mr786265wec.70.1336594357025;
	Wed, 09 May 2012 13:12:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm38652716wia.11.2012.05.09.13.12.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 13:12:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2012 22:12:31 +0200
Message-Id: <1336594351-19566-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1336594013-19408-2-git-send-email-Martin.Jansa@gmail.com>
References: <1336594013-19408-2-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCHv2 2/2] ttf-fonts: call update-fonts only on target, not during do_rootfs
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
X-List-Received-Date: Wed, 09 May 2012 20:22:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    1 +
 .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    2 +-
 .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    2 +-
 .../ttf-fonts/ttf-liberation_0.2.bb                |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    2 +-
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    2 +-
 .../ttf-fonts/ttf-ubuntu-font-family_0.69.bb       |    2 +-
 .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |   12 ++++++++----
 11 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 10fb922..97b67b2 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -4,7 +4,7 @@ LICENSE = "Arphic Public License"
 LIC_FILES_CHKSUM = "file://README;md5=62be011094b7865ddc4d1a648444d31a"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-chinese-font"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = \
 "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arphic-uming_0.2.${PV}.1.orig.tar.gz"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
index d4ddf16..d7b3977 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN}-sans-condensed = "${PN}-common"
 RDEPENDS_${PN}-serif = "${PN}-common"
 RDEPENDS_${PN}-serif-condensed = "${PN}-common"
 RDEPENDS_${PN}-common = ""
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
            file://30-dejavu-aliases.conf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index e0a6c65..2c3bf2e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -6,6 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://README.txt;md5=83544262a86f1f1ec761e75897df92bc"
 SRCREV = "21e6e2de1f0062f949fcc52d0b4559dfa3246e0e"
 PV = "0.1+gitr${SRCPV}"
+PR = "r1"
 
 SRC_URI = "git://github.com/android/platform_frameworks_base.git;protocol=git;branch=master"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index b00bd75..ee27c12 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Gentium fonts - TTF Version"
 HOMEPAGE = "http://scripts.sil.org/gentium"
 LICENSE = "SIL Open Font License"
 LICENSE_URL = "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz \
            file://OFL.gz"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
index f841f1a..a2ef0cf 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index 104915e..c0d77fd 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://License.txt;md5=5b171c5100029d884fcea21d9a2b7543 \
 "
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://fedorahosted.org/liberation-fonts/export/807b6dfd069b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
 S = "${WORKDIR}/liberation-fonts-${PV}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 62acf82..ab9be35 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "MPlus font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
 LICENSE = "${PN}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 1e84fea..3c4cb26 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -9,7 +9,7 @@ LICENSE = "Public domain"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-japanese-font"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
 S = "${WORKDIR}/sazanami-20040629"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
index 1c71b1b..22a7aec 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "Ubuntu Font Family - TTF Version"
 HOMEPAGE = "http://font.ubuntu.com"
 LICENSE = "UFL"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://font.ubuntu.com/download/ubuntu-font-family-${PV}+ufl.zip"
 SRC_URI[md5sum] = "2c3287ea72f81ce025095f7a6d68af28"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
index 06de002..f1eb6ff 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"
 AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
 HOMEPAGE = "http://wqy.sourceforge.net/en/"
 LICENSE = "GPLv2"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
 S = "${WORKDIR}/wqy-zenhei"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
index bba94bd..40ca6f0 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
@@ -11,12 +11,16 @@ do_install() {
     find ./ -name '*.tt[cf]' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
 }
 
-pkg_postinst_append() {
-    update-fonts
+pkg_postinst_${PN} () {
+    if [ -z "$D" ]; then
+        update-fonts
+    fi
 }
 
-pkg_postrm_append() {
-    update-fonts
+pkg_postrm_${PN} () {
+    if [ -z "$D" ]; then
+        update-fonts
+    fi
 }
 
 inherit allarch
-- 
1.7.8.6



