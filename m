Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6517B77C29
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTsne022161
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:55 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:24 -0500
Message-ID: <1504725809-12825-27-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 26/31] recipes-multimedia: Add LICENSE_FLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Sep 2017 19:29:53 -0000
Content-Type: text/plain

Multiple recipes require libmap, mpg123 or ffmpeg which all are defined
to have a LICENSE_FLAGS = "commercial".  Set these referring packages
to the same license flag so they are only enabled when their dependency
is also enabled.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb        | 4 +++-
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb             | 3 +++
 meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb                  | 3 +++
 .../recipes-multimedia/streamripper/streamripper_1.64.6.bb            | 3 +++
 meta-multimedia/recipes-multimedia/vlc/vlc.inc                        | 3 +++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
index bb69bfe..f3eaf30 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-gl_0.10.3.bb
@@ -14,7 +14,9 @@ DEPENDS += "gst-plugins-base virtual/libgles2 virtual/egl jpeg libpng glew"
 
 PR = "r4"
 
-inherit gettext
+inherit gettext distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 # This package doesn't have a configure switch for EGL or GL, so forcibly tell
 # configure that it can't find gl.h so it always uses EGL.  If/when we have some
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
index c16f3be..77ab5eb 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb
@@ -39,6 +39,9 @@ DEPENDS += " \
     libupnp \
 "
 
+# While this item does not require it, it depends on mpg123 which does
+LICENSE_FLAGS = "commercial"
+
 SRC_URI = " \
     http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
     file://mpd.conf.in \
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
index e115f1c..3eb1856 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb
@@ -6,6 +6,9 @@ SECTION = "audio"
 
 DEPENDS = "libpng ffmpeg libsndfile1 libvorbis"
 
+# While this item does not require it, it depends on ffmpeg which does
+LICENSE_FLAGS = "commercial"
+
 PR = "r2"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
diff --git a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
index 94355b6..722815a 100644
--- a/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
+++ b/meta-multimedia/recipes-multimedia/streamripper/streamripper_1.64.6.bb
@@ -6,6 +6,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "glib-2.0 libmad libogg libvorbis"
 
+# While this item does not require it, it depends on libmad which does
+LICENSE_FLAGS = "commercial"
+
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
     file://0001-build-these-are-foreign-automake-projects.patch \
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 087baab..acb3ccd 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -13,6 +13,9 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff"
 
+# While this item does not require it, it depends on ffmpeg which does
+LICENSE_FLAGS = "commercial"
+
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
 inherit autotools gettext pkgconfig distro_features_check
-- 
1.8.3.1


