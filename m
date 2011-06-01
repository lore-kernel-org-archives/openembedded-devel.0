Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRsnU-0000n1-Hi
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 23:17:48 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so400155fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 14:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=9j86l/UiUSzXdTxIyefNaz3NhRA3sUU06MX7wxsKNmM=;
	b=cxY/XapM/uUcPvWhsAX16aEs8CVVJOG/x8bACJtCawRBrJTGgYUxZQWCBLs1m04Owh
	E34UGcH6Qvv3+x2fRjkr46yknbWBqjKp/ysF5Xn6tni0tA7UfhYttmsyI8loTnkQMyFl
	l/UFn5UiwE1msDUmXUINvjNYW3ZBZxfwLH3ro=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jislpUv2lj1OZ1I2OntU3GKbJHkB+UmLvOPiz445fefUun0ZMQxfVGuKN1cfOjJSiu
	CZQvjIDfOuLXihKuf91JfldX+DHWQqadaEbm+47pD/wWIts94DuxpBnHSJXsnq5BDI6z
	9rb7iXo9PuHkfbleKrgZcJId6czSxJI167Zq4=
Received: by 10.223.55.200 with SMTP id v8mr3214790fag.82.1306962879942;
	Wed, 01 Jun 2011 14:14:39 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id x15sm537383fah.22.2011.06.01.14.14.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 14:14:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 23:14:34 +0200
Message-Id: <a6c8d41a087423006e4253d11cd1619af3bbcaa4.1306962838.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <3774457b630e8b651506aa1d0fa15b0f5c3446ab.1306962838.git.Martin.Jansa@gmail.com>
References: <3774457b630e8b651506aa1d0fa15b0f5c3446ab.1306962838.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1306962838.git.Martin.Jansa@gmail.com>
References: <cover.1306962838.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] recipes: use allarch.bbclass instead just PACKAGE_ARCH = all
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
X-List-Received-Date: Wed, 01 Jun 2011 21:17:48 -0000

* otherwise such recipes are rebuilt or reused from sstate after every
  MACHINE change, because of different checksums see [YOCTO #1075]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-efl/e17/illume-keyboards-shr_git.bb    |    4 ++--
 meta-oe/recipes-extended/tzdata/tzdata.inc         |    4 ++--
 .../font-update-common/font-update-common_0.1.bb   |    4 +++-
 .../recipes-graphics/tasks/task-fonts-truetype.bb  |    4 ++--
 .../ttf-fonts/ttf-arphic-uming_20080216.bb         |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb  |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-droid_git.bb    |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb |    2 +-
 .../ttf-fonts/ttf-hunkyfonts_0.3.0.bb              |    2 +-
 .../ttf-fonts/ttf-liberation_0.2.bb                |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    2 +-
 .../ttf-fonts/ttf-sazanami_20040629.bb             |    2 +-
 .../ttf-fonts/ttf-ubuntu-font-family_0.69.bb       |    2 +-
 .../ttf-fonts/ttf-wqy-zenhei_0.6.26.bb             |    1 +
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc         |    2 +-
 .../xserver-common/xserver-common_1.34.bb          |    4 ++--
 .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |    4 ++--
 .../ca-certificates_20090814+nmu2.bb               |    2 +-
 meta-oe/recipes-support/fbset/fbset-modes.bb       |    4 ++--
 .../mime-support/mime-support_3.44.bb              |    4 ++--
 .../recipes-support/poppler/poppler-data_0.4.0.bb  |    5 ++---
 21 files changed, 31 insertions(+), 29 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
index e3b182d..36e8505 100644
--- a/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
+++ b/meta-efl/recipes-efl/e17/illume-keyboards-shr_git.bb
@@ -8,7 +8,7 @@ S = "${WORKDIR}/git"
 SRCREV = "4064489f359a1addf572089b582f317dff5f50e1"
 PV = "0.0+gitr${SRCPV}"
 PE = "1"
-PR = "r4"
+PR = "r5"
 LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 
@@ -30,7 +30,7 @@ illume-keyboard-russian-terminal \
 illume-keyboard-persian \
 "
 
-PACKAGE_ARCH = "all"
+inherit allarch
 KEYBOARDS_DIR="${libdir}/enlightenment/modules/illume-keyboard/keyboards"
 
 AUTHOR_illume-keyboard-alpha = "Jesus McCloud"
diff --git a/meta-oe/recipes-extended/tzdata/tzdata.inc b/meta-oe/recipes-extended/tzdata/tzdata.inc
index 732ebb3..6739b59 100644
--- a/meta-oe/recipes-extended/tzdata/tzdata.inc
+++ b/meta-oe/recipes-extended/tzdata/tzdata.inc
@@ -3,7 +3,7 @@ SECTION = "base"
 PRIORITY = "optional"
 DEPENDS = "tzcode-native"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 DEFAULT_TIMEZONE ?= "Europe/London"
 
@@ -48,7 +48,7 @@ do_install () {
         cp -pPR ${S}/build${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
 }
 
-PACKAGE_ARCH = "all"
+inherit allarch
 # Packages primarily organized by directory with a major city
 # in most time zones in the base package
 
diff --git a/meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb b/meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb
index d82aec5..1e18cad 100644
--- a/meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb
+++ b/meta-oe/recipes-graphics/font-update-common/font-update-common_0.1.bb
@@ -2,6 +2,8 @@ DESCRIPTION = "Scripts to be called when fonts are installed or removed \
 to make them known to the WM, whether X11 or Opie"
 AUTHOR = "Rolf Leggewie <oe-devel@rolf.leggewie.biz"
 
+PR = "r1"
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
@@ -13,4 +15,4 @@ do_install() {
         install -m 0755 ${WORKDIR}/update-fonts ${D}${bindir}
 }
 
-PACKAGE_ARCH = "all"
+inherit allarch
diff --git a/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb b/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
index 9c2a0f9..112e8cb 100644
--- a/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
+++ b/meta-oe/recipes-graphics/tasks/task-fonts-truetype.bb
@@ -3,9 +3,9 @@ SECTION = "fonts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PV = "1.0"
-PR = "r0"
+PR = "r1"
 
-inherit task
+inherit task allarch
 
 PACKAGES += "\
   ${PN}-core \
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
index 877953f..10fb922 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-arphic-uming_20080216.bb
@@ -4,7 +4,7 @@ LICENSE = "Arphic Public License"
 LIC_FILES_CHKSUM = "file://README;md5=62be011094b7865ddc4d1a648444d31a"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-chinese-font"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = \
 "http://archive.ubuntu.com/ubuntu/pool/main/t/ttf-arphic-uming/ttf-arphic-uming_0.2.${PV}.1.orig.tar.gz"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
index f852cbf..d4ddf16 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
@@ -12,7 +12,7 @@ RDEPENDS_${PN}-sans-condensed = "${PN}-common"
 RDEPENDS_${PN}-serif = "${PN}-common"
 RDEPENDS_${PN}-serif-condensed = "${PN}-common"
 RDEPENDS_${PN}-common = ""
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
            file://30-dejavu-aliases.conf"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
index 3fa04ab..a23170a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-droid_git.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "Droid fonts - TTF Edition"
 HOMEPAGE = "http://www.droidfonts.com/"
 LICENSE = "Apache-2.0"
-PR = "r0"
+PR = "r1"
 # git magic below - SRCREV is an ID of /data/fonts subtree
 # (so we don't need to fetch full platform/frameworks/base.git)
 SRCREV = "31f255e44e618ff3b923f332e8fcb83403fd39f5"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
index 698b2ed..b00bd75 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-gentium_1.02.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Gentium fonts - TTF Version"
 HOMEPAGE = "http://scripts.sil.org/gentium"
 LICENSE = "SIL Open Font License"
 LICENSE_URL = "http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&item_id=OFL"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/t/ttf-gentium/ttf-gentium_${PV}.orig.tar.gz \
            file://OFL.gz"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
index 3984f86..f841f1a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-hunkyfonts_0.3.0.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "Hunky fonts - TTF Version"
 HOMEPAGE = "http://sourceforge.net/projects/hunkyfonts"
 LICENSE = "LGPL"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hunkyfonts/hunkyfonts-${PV}.tar.bz2"
 
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
index 5ebb257..104915e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation_0.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://License.txt;md5=5b171c5100029d884fcea21d9a2b7543 \
 "
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://fedorahosted.org/liberation-fonts/export/807b6dfd069b998cd9b4d3158da98817ef23c79d/F-9/liberation-fonts-ttf-3.tar.gz"
 S = "${WORKDIR}/liberation-fonts-${PV}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index a6f885b..62acf82 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "MPlus font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
 LICENSE = "${PN}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}.tar.gz"
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
index 1ee1c9c..1e84fea 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-sazanami_20040629.bb
@@ -9,7 +9,7 @@ LICENSE = "Public domain"
 LIC_FILES_CHKSUM = "file://README;md5=97d739900be6e852830f55aa3c07d4a0"
 SRC_DISTRIBUTE_LICENSES += "${PN}"
 RPROVIDES_${PN} = "virtual-japanese-font"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-20040629.tar.bz2"
 S = "${WORKDIR}/sazanami-20040629"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
index cc8d2e4..1c71b1b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.69.bb
@@ -3,7 +3,7 @@ require ttf.inc
 DESCRIPTION = "Ubuntu Font Family - TTF Version"
 HOMEPAGE = "http://font.ubuntu.com"
 LICENSE = "UFL"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://font.ubuntu.com/download/ubuntu-font-family-${PV}+ufl.zip"
 SRC_URI[md5sum] = "2c3287ea72f81ce025095f7a6d68af28"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
index 2d1d23e..06de002 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-wqy-zenhei_0.6.26.bb
@@ -4,6 +4,7 @@ DESCRIPTION = "WenQuanYi Zen Hei - A Hei-Ti Style Chinese font"
 AUTHOR = "Qianqian Fang and The WenQuanYi Project Contributors"
 HOMEPAGE = "http://wqy.sourceforge.net/en/"
 LICENSE = "GPLv2"
+PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wqy/wqy-zenhei-${PV}-0.tar.gz"
 S = "${WORKDIR}/wqy-zenhei"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
index af3f278..978d2f4 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
@@ -20,4 +20,4 @@ pkg_postrm_append() {
     update-fonts
 }
 
-PACKAGE_ARCH = "all"
+inherit allarch
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 0d59ab7..63ab354 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r2"
+PR = "r3"
 
 # we are using a gpe-style Makefile
 inherit gpe
@@ -29,7 +29,7 @@ do_install_append() {
         sed -i 's:^BINDIR=.*$:BINDIR=${bindir}:' ${D}/etc/X11/xserver-common
 }
 
-PACKAGE_ARCH = "all"
+inherit allarch
 
 RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo fbset xinput-calibrator"
 
diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 8310bcd..eb53a4d 100644
--- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -5,14 +5,14 @@ SECTION = "x11"
 PRIORITY = "optional"
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
 DEFAULT_PREFERENCE = "-1"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "file://xserver-nodm \
            file://gplv2-license.patch \
 "
 S = ${WORKDIR}
 
-PACKAGE_ARCH = "all"
+inherit allarch
 
 do_install() {
     install -d ${D}/etc
diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
index 7552c6f..3be567f 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20090814+nmu2.bb
@@ -30,7 +30,7 @@ do_install_append() {
         done
 }
 
-PACKAGE_ARCH = "all"
+inherit allarch
 PACKAGES = "${PN}"
 
 pkg_postinst_${PN} () {
diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
index cf4089f..03d4039 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 PV = "0.1.0"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "file://fb.modes"
 
@@ -12,6 +12,6 @@ do_install() {
     install -m 0644 ${WORKDIR}/fb.modes ${D}${sysconfdir}
 }
 
-PACKAGE_ARCH = "all"
+inherit allarch
 CONFFILES_${PN} = "${sysconfdir}/fb.modes"
 
diff --git a/meta-oe/recipes-support/mime-support/mime-support_3.44.bb b/meta-oe/recipes-support/mime-support/mime-support_3.44.bb
index 99c2af7..fe84a63 100644
--- a/meta-oe/recipes-support/mime-support/mime-support_3.44.bb
+++ b/meta-oe/recipes-support/mime-support/mime-support_3.44.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://debian/README;md5=36bbe2ace0a05c3fb684b73208fbf30b"
 
 DEPENDS = "file"
 RRECOMMENDS_${PN} = "file"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/m/mime-support/mime-support_${PV}-1.tar.gz"
 S = "${WORKDIR}/${PN}"
 
 FILES_${PN} += " ${libdir}/mime"
-PACKAGE_ARCH = "all"
+inherit allarch
 
 docdir_append = "/${PN}"
 
diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
index e3fd54b..c59cc73 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
                     file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
 "
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
 
@@ -17,8 +17,7 @@ do_install() {
 }
 
 FILES_${PN} += "${datadir}"
-PACKAGE_ARCH = "all"
-
+inherit allarch
 
 SRC_URI[md5sum] = "6975bf8e9ea2cfb42b9ecdbcc257cf57"
 SRC_URI[sha256sum] = "5caf7e10b7b0c6a4e1e753af09be52224e88bb8fbcb47794ad72b99b9e24b109"
-- 
1.7.5.3



