Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O1eL3-00060G-JO
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 13:31:36 +0200
Received: by ewy3 with SMTP id 3so223197ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 04:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=hjlWDyMyd7LozYvg02r3NyEzBhB7XNQTa0uNLQhM6Gk=;
	b=U2Dk9S8MkfqdKZFwBYVQ60PhBLSQ+PH1deb0plahzeQpf7R4FGuJ45G86D1RivTddQ
	elHuO8KwY/1/hjl9S68n8k/r7jLCSbyT+BPOaowvls3lUpFn1cecOHAR1o2/0gtpAtxi
	F+NcVTBlAwsvfLWM2IC/JtrETA1ZDyyebRsg0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uD2t/+Vk9HKz6mPJn93q4E8clygqP2U1I6Y/uFWZVC6zBvXEXWDBy5SoI6uXMVJZUB
	jWBY7yN24Qt7nz2mCiPyOoO6D8A/o8lRR37uuXraRab2EAuSDkIvbSTaxovGJMYVJTBJ
	gE/fuQho/2SoL8MOVxzUCehUjJeAwlEFZw+9g=
Received: by 10.102.243.22 with SMTP id q22mr3053401muh.9.1271158081878;
	Tue, 13 Apr 2010 04:28:01 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y2sm22636627mug.21.2010.04.13.04.28.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Apr 2010 04:28:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 13:23:55 +0200
Message-Id: <1271157835-27308-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
References: <1271157835-27308-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 6/6] recipes: use SRCPV in few more git recipes
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
X-List-Received-Date: Tue, 13 Apr 2010 11:31:37 -0000

* sometimes without PE bump, because nobody complained that we were
  bumping SRCREV without PV changes and we were using SRCPV in our
  branch before
* please bump PE if you're using one of those and you need to increment
  PV, otherwise it will be "corrected" with next PV bump

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/blipomoko/blipomoko_git.bb                 |    2 +-
 recipes/bt-configure/bt-configure_git.bb           |    2 +-
 recipes/dri/glamo-dri-tests_git.bb                 |    2 +-
 recipes/dri/libdrm_git.bb                          |    2 +-
 recipes/e17/illume-keyboards-shr_git.bb            |    2 +-
 recipes/efl1/e-wm-illume-dict-pl_git.bb            |    3 ++-
 recipes/efl1/libeflvala_svn.bb                     |    1 +
 recipes/evopedia/evopedia_git.bb                   |    2 +-
 recipes/ffalarms/ffalarms_git.bb                   |    2 +-
 recipes/litephone/litephone_git.bb                 |    2 +-
 recipes/mplayer/mplayer_git.bb                     |    2 +-
 recipes/openmoko-3rdparty/advancedcaching_git.bb   |    2 +-
 recipes/openmoko-3rdparty/calc_git.bb              |    2 +-
 recipes/openmoko-3rdparty/jefliks_git.bb           |    2 +-
 recipes/openmoko-projects/om-locations_git.bb      |    3 ++-
 recipes/openmoko-projects/paroli_git.bb            |    2 +-
 recipes/openmoko-projects/tichy_git.bb             |    3 ++-
 recipes/openmoocow/openmoocow_git.bb               |    2 +-
 recipes/stopwatch/stopwatch_git.bb                 |    2 +-
 recipes/webkit/webkit-efl_git.bb                   |    2 +-
 recipes/xinput-calibrator/xinput-calibrator_git.bb |    2 +-
 recipes/xorg-driver/xf86-video-glamo_git.bb        |    4 ++--
 recipes/xorg-lib/libxcalibrate_git.bb              |    4 ++--
 recipes/xorg-lib/pixman_git.bb                     |    2 +-
 recipes/xorg-proto/calibrateproto_git.bb           |    4 ++--
 .../xserver-kdrive-glamo_1.3.0.0+git.bb            |    4 ++--
 recipes/xorg-xserver/xserver-xorg_git.bb           |    2 +-
 27 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/recipes/blipomoko/blipomoko_git.bb b/recipes/blipomoko/blipomoko_git.bb
index 2c7d582..ec57666 100644
--- a/recipes/blipomoko/blipomoko_git.bb
+++ b/recipes/blipomoko/blipomoko_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/dos1/blipomoko.git;protocol=http"
 S = "${WORKDIR}/git"
 
 SRCREV = "93295f36f7b45c691df247cb2a65227facf13654"
-PV = "0.0+gitr${SRCREV}"
+PV = "0.0+gitr${SRCPV}"
 PR = "r0"
 
 inherit distutils
diff --git a/recipes/bt-configure/bt-configure_git.bb b/recipes/bt-configure/bt-configure_git.bb
index 74ef693..d2f056b 100644
--- a/recipes/bt-configure/bt-configure_git.bb
+++ b/recipes/bt-configure/bt-configure_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 RDEPENDS = "python python-pygtk bluez4"
 
 SRCREV = "9654c88ff74bca89cf747937cbec67421d2f1cbc"
-PV = "1.0.0+gitr${SRCREV}"
+PV = "1.0.0+gitr${SRCPV}"
 PR = "r1"
 
 ARCH_bt-configure = "all"
diff --git a/recipes/dri/glamo-dri-tests_git.bb b/recipes/dri/glamo-dri-tests_git.bb
index 5f46f44..1f9540b 100644
--- a/recipes/dri/glamo-dri-tests_git.bb
+++ b/recipes/dri/glamo-dri-tests_git.bb
@@ -1,7 +1,7 @@
 DEPENDS = "libdrm virtual/libx11 libxext"
 
 SRCREV = "080b8db3d9dbfae38ebb00439887b5535ab1d380"
-PV = "1.0.0+gitr${SRCREV}"
+PV = "1.0.0+gitr${SRCPV}"
 
 SRC_URI = "git://git.bitwiz.org.uk/glamo-dri-tests.git;protocol=git;branch=master"
 
diff --git a/recipes/dri/libdrm_git.bb b/recipes/dri/libdrm_git.bb
index b06ebe7..3f81cdd 100644
--- a/recipes/dri/libdrm_git.bb
+++ b/recipes/dri/libdrm_git.bb
@@ -7,7 +7,7 @@ PROVIDES = "drm"
 DEPENDS = "libpthread-stubs virtual/kernel"
 
 PE = "1"
-PV = "2.4.18+gitr${SRCREV}"
+PV = "2.4.18+gitr${SRCPV}"
 PR = "r0"
 
 SRCREV = "a5c8f55397377994ceeb76ed0ff148ff89eb3a1b"
diff --git a/recipes/e17/illume-keyboards-shr_git.bb b/recipes/e17/illume-keyboards-shr_git.bb
index 29273d5..90aab16 100644
--- a/recipes/e17/illume-keyboards-shr_git.bb
+++ b/recipes/e17/illume-keyboards-shr_git.bb
@@ -4,7 +4,7 @@ SRC_URI = "git://git.shr-project.org/repo/illume-keyboards.git;protocol=http;bra
 S = "${WORKDIR}/git"
 
 SRCREV = "9bd2c8f060c48eee3ab247838d8ecf2cf7082472"
-PV = "0.0+gitr${SRCREV}"
+PV = "0.0+gitr${SRCPV}"
 PE = "1"
 PR = "r3"
 
diff --git a/recipes/efl1/e-wm-illume-dict-pl_git.bb b/recipes/efl1/e-wm-illume-dict-pl_git.bb
index 8a98b1c..736e721 100644
--- a/recipes/efl1/e-wm-illume-dict-pl_git.bb
+++ b/recipes/efl1/e-wm-illume-dict-pl_git.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "Polish dictionary for Illume keyboard"
 SECTION = "x11/data"
 SRCREV = "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
-PV = "1.0-gitr${SRCREV}"
+PV = "1.0+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "git://git.shr-project.org/repo/shr-themes.git;protocol=http;branch=master"
diff --git a/recipes/efl1/libeflvala_svn.bb b/recipes/efl1/libeflvala_svn.bb
index 56f8773..9a88054 100644
--- a/recipes/efl1/libeflvala_svn.bb
+++ b/recipes/efl1/libeflvala_svn.bb
@@ -5,6 +5,7 @@ SECTION = "devel"
 DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary"
 PV = "0.5.0+svnr${SRCPV}"
 PR = "r0"
+PE = "1"
 SRCREV = "${EFL_SRCREV}"
 
 SRC_URI = "svn://svn.enlightenment.org/svn/e/trunk/BINDINGS;module=vala;proto=http"
diff --git a/recipes/evopedia/evopedia_git.bb b/recipes/evopedia/evopedia_git.bb
index eaad256..4e26194 100644
--- a/recipes/evopedia/evopedia_git.bb
+++ b/recipes/evopedia/evopedia_git.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL"
 RDEPENDS = "python python-xml python-shell python-netclient python-mime \
             python-netserver python-io python-compression"
 RRECOMMENDS = "midori"
-PV = "0.3.0-rc3+gitr${SRCREV}"
+PV = "0.3.0-rc3+gitr${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://github.com/crei/evopedia.git;protocol=http;branch=master"
diff --git a/recipes/ffalarms/ffalarms_git.bb b/recipes/ffalarms/ffalarms_git.bb
index aef3211..f9d05b1 100644
--- a/recipes/ffalarms/ffalarms_git.bb
+++ b/recipes/ffalarms/ffalarms_git.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv3"
 DEPENDS = "elementary libeflvala libical"
 RDEPENDS = "atd alsa-utils-amixer ttf-dejavu-sans libical"
 RSUGGESTS = "mplayer alsa-utils-aplay frameworkd"
-PV = "0.4+gitr${SRCREV}"
+PV = "0.4+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.shr-project.org/repo/ffalarms.git;protocol=http;branch=master"
diff --git a/recipes/litephone/litephone_git.bb b/recipes/litephone/litephone_git.bb
index e209a1c..4fc5441 100644
--- a/recipes/litephone/litephone_git.bb
+++ b/recipes/litephone/litephone_git.bb
@@ -1,7 +1,7 @@
 require litephone.inc
 
 SRCREV = "4c9f16d9acc6cd18fc3f647b7e4f44a2d3bdd7b6"
-PV = "0.1+gitr${SRCREV}"
+PV = "0.1+gitr${SRCPV}"
 PR = "${INC_PR}.0"
 
 SRC_URI = "git://git.senfdax.de/git/litephone;protocol=http \
diff --git a/recipes/mplayer/mplayer_git.bb b/recipes/mplayer/mplayer_git.bb
index c769610..f766e04 100644
--- a/recipes/mplayer/mplayer_git.bb
+++ b/recipes/mplayer/mplayer_git.bb
@@ -34,7 +34,7 @@ ARM_INSTRUCTION_SET = "ARM"
 RCONFLICTS_${PN} = "mplayer-atty"
 RREPLACES_${PN} = "mplayer-atty"
 
-PV = "0.0+1.0rc4+gitr${SRCREV}"
+PV = "0.0+1.0rc4+gitr${SRCPV}"
 PR = "r0"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_shr = "2"
diff --git a/recipes/openmoko-3rdparty/advancedcaching_git.bb b/recipes/openmoko-3rdparty/advancedcaching_git.bb
index 73da336..f8f2fc2 100644
--- a/recipes/openmoko-3rdparty/advancedcaching_git.bb
+++ b/recipes/openmoko-3rdparty/advancedcaching_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 HOMEPAGE = "http://www.opkg.org/package_268.html"
 RDEPENDS = "python-pygtk python-html python-image python-netclient python-misc python-sqlite3 python-mime python-json"
 SRCREV = "9c3661f5573d2dd712437f1590070153d12e4c02"
-PV = "0.1.2+gitr${SRCREV}"
+PV = "0.1.2+gitr${SRCPV}"
 
 SRC_URI = "git://github.com/webhamster/advancedcaching.git;protocol=git;branch=master"
 
diff --git a/recipes/openmoko-3rdparty/calc_git.bb b/recipes/openmoko-3rdparty/calc_git.bb
index 8e5e2af..9a21a2c 100644
--- a/recipes/openmoko-3rdparty/calc_git.bb
+++ b/recipes/openmoko-3rdparty/calc_git.bb
@@ -6,7 +6,7 @@ LICENSE  = "MIT"
 RDEPENDS = "python-elementary python python-edbus"
 SECTION = "x11/application"
 SRCREV = "cff7c833d4fce0d39de0812bfc9ed9e0eb8fac09"
-PV = "0.0.1+gitr${SRCREV}"
+PV = "0.0.1+gitr${SRCPV}"
 PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/openmoko-3rdparty/jefliks_git.bb b/recipes/openmoko-3rdparty/jefliks_git.bb
index 87f0b34..363f20d 100644
--- a/recipes/openmoko-3rdparty/jefliks_git.bb
+++ b/recipes/openmoko-3rdparty/jefliks_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL"
 DEPENDS = "edje-native elementary iksemel gnutls eet evas ecore eina"
 HOMEPAGE = "http://jefliks.sourceforge.net/"
 AUTHOR = "Phoenix Kayo <kayo.k11.4@gmail.com>"
-PV = "0.0.2b+gitr${SRCREV}"
+PV = "0.0.2b+gitr${SRCPV}"
 PR = "r0"
 
 inherit autotools pkgconfig
diff --git a/recipes/openmoko-projects/om-locations_git.bb b/recipes/openmoko-projects/om-locations_git.bb
index 9d06423..fd009d6 100644
--- a/recipes/openmoko-projects/om-locations_git.bb
+++ b/recipes/openmoko-projects/om-locations_git.bb
@@ -5,7 +5,8 @@ LICENSE = "GPL"
 DEPENDS = "eet evas edje ecore edbus etk"
 RDEPENDS_${PN} = "diversity-daemon"
 SRCREV = "942e88a1b689ffe3f11a2d982cce389cc965b2ec"
-PV = "0.2+gitr${SRCREV}"
+PV = "0.2+gitr${SRCPV}"
+PE = "1"
 PR = "r1.04"
 
 SRC_URI = "git://git.openmoko.org/git/om-locations.git;protocol=git"
diff --git a/recipes/openmoko-projects/paroli_git.bb b/recipes/openmoko-projects/paroli_git.bb
index 8b071f7..251c258 100644
--- a/recipes/openmoko-projects/paroli_git.bb
+++ b/recipes/openmoko-projects/paroli_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Paroli"
 SECTION = "x11"
 LICENSE = "GPL"
 SRCREV = "bb9fb1969acdfbaa48b55902675a6d8949014c6d"
-PV = "0.2.1+gitr${SRCREV}"
+PV = "0.2.1+gitr${SRCPV}"
 PE = "1"
 PR = "r0"
 
diff --git a/recipes/openmoko-projects/tichy_git.bb b/recipes/openmoko-projects/tichy_git.bb
index 656b645..09d83e8 100644
--- a/recipes/openmoko-projects/tichy_git.bb
+++ b/recipes/openmoko-projects/tichy_git.bb
@@ -3,7 +3,8 @@ SECTION = "x11"
 LICENSE = "GPL"
 DEPENDS += "python-pygame virtual/libsdl libsdl-image python-dbus python-pygobject"                                   
 SRCREV = "ab68d849502009cf3214df48ffa8075a10cc2177"
-PV = "0.2+gitr${SRCREV}"
+PV = "0.2+gitr${SRCPV}"
+PE = "1"
 PR = "r0"
 
 SRC_URI = "git://git.openmoko.org/git/tichy.git;protocol=git"
diff --git a/recipes/openmoocow/openmoocow_git.bb b/recipes/openmoocow/openmoocow_git.bb
index 65497fe..79ec2c8 100644
--- a/recipes/openmoocow/openmoocow_git.bb
+++ b/recipes/openmoocow/openmoocow_git.bb
@@ -4,7 +4,7 @@ AUTHOR = "Thomas White"
 LICENSE = "GPLv3"
 SECTION = "applications/games"
 SRCREV = "39648419825cddfea1cb1321e552a12b71fede14"
-PV = "0.0.3+gitr${SRCREV}"
+PV = "0.0.3+gitr${SRCPV}"
 PR = "r1"
 
 SRC_URI = "git://git.bitwiz.org.uk/openmoocow.git;protocol=git;branch=master"
diff --git a/recipes/stopwatch/stopwatch_git.bb b/recipes/stopwatch/stopwatch_git.bb
index 22b69f9..a74e631 100644
--- a/recipes/stopwatch/stopwatch_git.bb
+++ b/recipes/stopwatch/stopwatch_git.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://git.senfdax.de"
 LICENSE = "GPL QPL"
 DEFAULT_PREFERRENCE = "-1"
 SRCREV = "89644b91e02151fc72989755f20c1ffb144ef5e2"
-PV = "1.3.1+gitr${SRCREV}"
+PV = "1.3.1+gitr${SRCPV}"
 PR = "r0"
 
 inherit qt4x11
diff --git a/recipes/webkit/webkit-efl_git.bb b/recipes/webkit/webkit-efl_git.bb
index 8f43396..3f437ca 100644
--- a/recipes/webkit/webkit-efl_git.bb
+++ b/recipes/webkit/webkit-efl_git.bb
@@ -5,7 +5,7 @@ DEPENDS = "icu flex gst-plugins-base gstreamer jpeg libpng libxml2 pango \
            sqlite3 libxslt gperf-native libxt"
 
 SRCREV = "3a5ee77664c898ed51a2b2d5759822f8c0a06472"
-PV = "1.1.11+gitr${SRCREV}"
+PV = "1.1.11+gitr${SRCPV}"
 PR = "r5"
 
 SRC_URI = "git://gitorious.org/webkit-efl/webkit-efl.git;protocol=git;branch=master \
diff --git a/recipes/xinput-calibrator/xinput-calibrator_git.bb b/recipes/xinput-calibrator/xinput-calibrator_git.bb
index 8d3d4c4..13c6a46 100644
--- a/recipes/xinput-calibrator/xinput-calibrator_git.bb
+++ b/recipes/xinput-calibrator/xinput-calibrator_git.bb
@@ -1,6 +1,6 @@
 require xinput-calibrator.inc
 
-PV = "0.6.0+gitr${SRCREV}"
+PV = "0.6.0+gitr${SRCPV}"
 
 SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git;branch=misclick"
 
diff --git a/recipes/xorg-driver/xf86-video-glamo_git.bb b/recipes/xorg-driver/xf86-video-glamo_git.bb
index 19c7591..c889485 100644
--- a/recipes/xorg-driver/xf86-video-glamo_git.bb
+++ b/recipes/xorg-driver/xf86-video-glamo_git.bb
@@ -4,8 +4,8 @@ SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;protocol=git;branch=m
 S = "${WORKDIR}/git"
 
 SRCREV = "77b6d1b7363d3ff28f063ed92c9ed47194f70b20"
-PV = "1.0.0+gitr${SRCREV}"
-PE = "1"
+PV = "1.0.0+gitr${SRCPV}"
+PE = "2"
 PR = "r4"
 
 do_configure_prepend() {
diff --git a/recipes/xorg-lib/libxcalibrate_git.bb b/recipes/xorg-lib/libxcalibrate_git.bb
index 8412c09..01201ba 100644
--- a/recipes/xorg-lib/libxcalibrate_git.bb
+++ b/recipes/xorg-lib/libxcalibrate_git.bb
@@ -6,8 +6,8 @@ DEPENDS = "virtual/libx11 calibrateproto libxext"
 
 SRCREV = "209d83af61ed38a002c8096377deac292b3e396c"
 PR = "r1"
-PV = "0.0+${PR}+gitr${SRCREV}"
-PE = "2"
+PV = "0.0+${PR}+gitr${SRCPV}"
+PE = "3"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate;protocol=git"
 
diff --git a/recipes/xorg-lib/pixman_git.bb b/recipes/xorg-lib/pixman_git.bb
index 70886ed..04b6892 100644
--- a/recipes/xorg-lib/pixman_git.bb
+++ b/recipes/xorg-lib/pixman_git.bb
@@ -1,7 +1,7 @@
 require pixman.inc
 PV = "0.17.13"
 PR = "${INC_PR}.0"
-PR_append = "+gitr${SRCREV}"
+PR_append = "+gitr${SRCPV}"
 
 SRCREV = "69f1ec9a7827aeb522fcae99846237ef0f896e7b"
  
diff --git a/recipes/xorg-proto/calibrateproto_git.bb b/recipes/xorg-proto/calibrateproto_git.bb
index d98198c..740c9e6 100644
--- a/recipes/xorg-proto/calibrateproto_git.bb
+++ b/recipes/xorg-proto/calibrateproto_git.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "Touchscreen calibration protocol"
 
 SRCREV = "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
 PR = "r0"
-PV = "0.0+${PR}+gitr${SRCREV}"
-PE = "2"
+PV = "0.0+${PR}+gitr${SRCPV}"
+PE = "3"
 
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto;protocol=git"
 S = "${WORKDIR}/git"
diff --git a/recipes/xorg-xserver/xserver-kdrive-glamo_1.3.0.0+git.bb b/recipes/xorg-xserver/xserver-kdrive-glamo_1.3.0.0+git.bb
index d717456..7631075 100644
--- a/recipes/xorg-xserver/xserver-kdrive-glamo_1.3.0.0+git.bb
+++ b/recipes/xorg-xserver/xserver-kdrive-glamo_1.3.0.0+git.bb
@@ -10,8 +10,8 @@ RDEPENDS_${PN} = "xserver-security-policy"
 PROVIDES = "virtual/xserver"
 
 SRCREV = "3f113f5f4dbaf14dee439eac8d510313fff3aafc"
-PE = "1"
-PV = "1.3.0.0+gitr${SRCREV}"
+PE = "2"
+PV = "1.3.0.0+gitr${SRCPV}"
 PR = "r3"
 
 COMPATIBLE_HOST = "arm.*-linux"
diff --git a/recipes/xorg-xserver/xserver-xorg_git.bb b/recipes/xorg-xserver/xserver-xorg_git.bb
index 47e797c..1cacc2f 100644
--- a/recipes/xorg-xserver/xserver-xorg_git.bb
+++ b/recipes/xorg-xserver/xserver-xorg_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "the X.Org X server"
 DEPENDS += "pixman libpciaccess openssl dri2proto glproto xorg-minimal-fonts font-util-native"
 PV = "1.7.999"
 PR = "${INC_PR}.0"
-PR_append = "+gitr${SRCREV}"
+PR_append = "+gitr${SRCPV}"
 PE = "2"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.0.4



