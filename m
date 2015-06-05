Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 85700606E8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:26:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t559QkQf021942
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 5 Jun 2015 02:26:46 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Fri, 5 Jun 2015 02:26:46 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jun 2015 17:26:48 +0800
Message-ID: <1433496408-24477-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libcanberra: upgrade and add packageconfig for gstreamer and gtk
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
X-List-Received-Date: Fri, 05 Jun 2015 09:26:51 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- GStreamer 0.10 has been removed meta-openembedded/meta-multimedia
  and 1.0 left in oe-core, so upgrade libcanberra to the version
  that support GStreamer 1.0

- GStreamer and gtk support for libcanberra are optional, add
  PACKAGECONFIG for them and use DISTRO_FEATURES to decide if
  they are needed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../{libcanberra_0.29.bb => libcanberra_0.30.bb}           | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/libcanberra/{libcanberra_0.29.bb => libcanberra_0.30.bb} (80%)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
similarity index 80%
rename from meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
rename to meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index 0f00b20..959b88f 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
 
-DEPENDS = "gstreamer gtk+ gtk+3 libtool libvorbis"
+DEPENDS = "libtool libvorbis"
 
 inherit autotools gtk-doc
 
@@ -12,24 +12,26 @@ SRC_URI = " \
     http://0pointer.de/lennart/projects/${BPN}/${BPN}-${PV}.tar.xz \
     file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
 "
-SRC_URI[md5sum] = "2594093a5d61047bd9cc87e955f86df8"
-SRC_URI[sha256sum] = "127a5ef07805856d63758e5180ebfb241d1f80094fd301c287591a15b8cfcd72"
+SRC_URI[md5sum] = "34cb7e4430afaf6f447c4ebdb9b42072"
+SRC_URI[sha256sum] = "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72"
 
 EXTRA_OECONF = "\
     --enable-null \
-    --enable-gstreamer \
     --disable-oss \
-    --enable-gtk \
-    --enable-gtk3 \
     --disable-tdb \
     --disable-lynx \
 "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','alsa','alsa','',d)} \
                    ${@base_contains('DISTRO_FEATURES','pulseaudio','pulseaudio','',d)} \
+                   ${@base_contains('DISTRO_FEATURES','x11','gtk gtk3','',d)} \
+                   ${@base_contains('DISTRO_FEATURES','gstreamer','gstreamer','',d)} \
 "
 PACKAGECONFIG[alsa] = "--enable-alsa, --disable-alsa, alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse, --disable-pulse, pulseaudio"
+PACKAGECONFIG[gstreamer] = "--enable-gstreamer, --disable-gstreamer, gstreamer1.0"
+PACKAGECONFIG[gtk] = "--enable-gtk, --disable-gtk, gtk+"
+PACKAGECONFIG[gtk3] = "--enable-gtk3, --disable-gtk3, gtk+3"
 
 python populate_packages_prepend() {
     plugindir = d.expand('${libdir}/${BPN}-${PV}/')
-- 
1.9.1


