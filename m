Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 64E5965D3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 16:40:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Oct 2014 09:39:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,776,1406617200"; d="scan'208";a="624095821"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 23 Oct 2014 09:40:56 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Oct 2014 19:40:30 +0300
Message-Id: <1414082432-14111-3-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
References: <1414082432-14111-1-git-send-email-cristian.iorga@intel.com>
Cc: Cristian Iorga <ubik3000@gmail.com>
Subject: [PATCH] mpd: upgrade to 0.19.1
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
X-List-Received-Date: Thu, 23 Oct 2014 16:40:58 -0000

From: Cristian Iorga <ubik3000@gmail.com>

- Added icu and boost as dependencies;

Signed-off-by: Cristian Iorga <ubik3000@gmail.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../mpg123/{mpg123_1.19.0.bb => mpg123_1.21.0.bb}                | 4 ++--
 .../recipes-multimedia/musicpd/{mpd_0.18.9.bb => mpd_0.19.1.bb}  | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.19.0.bb => mpg123_1.21.0.bb} (94%)
 rename meta-multimedia/recipes-multimedia/musicpd/{mpd_0.18.9.bb => mpd_0.19.1.bb} (89%)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
rename to meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
index e669446..4efdeab 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.21.0.bb
@@ -36,8 +36,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
-SRC_URI[md5sum] = "87731f1437cfd8c50537a606d81130e4"
-SRC_URI[sha256sum] = "869024e01d7cb4dae1aea2f2a10420d4be7e1ac02a9c434d06d727599169b01b"
+SRC_URI[md5sum] = "13a9df5d4e7aa110e4ae27cf30128ce9"
+SRC_URI[sha256sum] = "3ad197f77c9ffdf3601e1c3183ae0709ccb3c3de68309527ce9375fcfb15dcba"
 
 inherit autotools pkgconfig
 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
similarity index 89%
rename from meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
rename to meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
index 997a421..d05deaa 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.1.bb
@@ -3,15 +3,14 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://www.musicpd.org"
 
-DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug"
+DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio tcp-wrappers openal-soft yajl jack faad2 flac libao fluidsynth libcdio wavpack libopus mpg123 libmms libmodplug boost icu"
 
 SRC_URI = " \
-    http://www.musicpd.org/download/${BPN}/0.18/${BP}.tar.xz \
+    http://www.musicpd.org/download/${BPN}/0.19/${BP}.tar.xz \
     file://mpd.conf.in \
 "
-
-SRC_URI[md5sum] = "0e5156a831d4302d2032998bcfd5c36f"
-SRC_URI[sha256sum] = "0d4d3e6977cb607419abbb14c63d1e2b982acb84cd2be5346f19de5f699a68de"
+SRC_URI[md5sum] = "d235f6e53e5442b6926c49946a303f8d"
+SRC_URI[sha256sum] = "8b3afcd440181c9bd18b229b5974e529d59648344dd371370d6f7d62ec2847c5"
 
 inherit autotools useradd systemd
 
-- 
1.9.1


