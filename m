Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3BF86AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2014 02:26:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s632Q2Zx029730
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Jul 2014 19:26:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 2 Jul 2014 19:26:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Jul 2014 19:25:56 -0700
Message-ID: <1404354360-978-5-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
References: <1404354360-978-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-multimedia] [PATCH 4/8] meta-multimedia: use BPN in SRC_URI
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
X-List-Received-Date: Thu, 03 Jul 2014 02:26:00 -0000
Content-Type: text/plain

Fixed SRC_URI:
* ${PN} -> ${BPN}, use ${BP} if it was ${PN}-${PV}
* ${P} -> ${BP}

Otherwise we would meet do_fetch errors when we do the multilib, native
or nativesdk build.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../coriander/coriander_2.0.2.bb                   |    2 +-
 .../fluidsynth/fluidsynth_1.1.6.bb                 |    2 +-
 .../recipes-multimedia/musicpd/libmpd_11.8.17.bb   |    2 +-
 .../recipes-multimedia/musicpd/mpd_0.18.9.bb       |    2 +-
 .../openal/openal-soft_1.15.1.bb                   |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
index 1c113c2..81e218f 100755
--- a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
@@ -7,7 +7,7 @@ DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv tiff"
 
 PNBLACKLIST[coriander] = "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/coriander-2/${PV}/${P}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/coriander-2/${PV}/${BP}.tar.gz \
            file://cross-compile.patch \
           "
 
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
index 4052e42..965b927 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e198e9aac94943d0ec29a7dae8c29416"
 
 DEPENDS = "alsa-lib ncurses glib-2.0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}-${PV}/${PN}-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
 SRC_URI[md5sum] = "ae5aca6de824b4173667cbd3a310b263"
 SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c"
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
index ef4d7b5..8327b75 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/libmpd_11.8.17.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "glib-2.0"
 
-SRC_URI = "http://www.musicpd.org/download/${PN}/${PV}/${PN}-${PV}.tar.gz"
+SRC_URI = "http://www.musicpd.org/download/${BPN}/${PV}/${BP}.tar.gz"
 SRC_URI[md5sum] = "5ae3d87467d52aef3345407adb0a2488"
 SRC_URI[sha256sum] = "fe20326b0d10641f71c4673fae637bf9222a96e1712f71f170fca2fc34bf7a83"
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
index c3bb581..fee5740 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
@@ -6,7 +6,7 @@ HOMEPAGE ="http://www.musicpd.org"
 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio"
 
 SRC_URI = " \
-    http://www.musicpd.org/download/${PN}/stable/${P}.tar.xz \
+    http://www.musicpd.org/download/${BPN}/stable/${BP}.tar.xz \
     file://mpd.conf.in \
 "
 
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
index b956b84..d11b4d8 100644
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.15.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 
-SRC_URI = "http://kcat.strangesoft.net/openal-releases/${PN}-${PV}.tar.bz2"
+SRC_URI = "http://kcat.strangesoft.net/openal-releases/${BP}.tar.bz2"
 SRC_URI[md5sum] = "ea83dec3b9655a27d28e7bc7cae9cd71"
 SRC_URI[sha256sum] = "0e29a162f0841ccb4135ce76e92e8a704589b680a85eddf76f898de5236eb056"
 
-- 
1.7.9.5


