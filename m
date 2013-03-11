Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UF0Ok-00084g-8G
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 11:56:11 +0100
Received: by mail-ee0-f42.google.com with SMTP id b47so2141471eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2013 03:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=CgqdT8se1M913Js85F64cwOECfSCz8qQ2higX8WlZ6A=;
	b=Ji7FV2ziDx3YPWj+kDESNxT08tHf79PhsdWfklzO/QOMZEpx9bKsIXa8wLPRl2LEv+
	qgKDQvMTO+dBLGC6dQ14EJ0Xsd3yr1rllhVb+EJaPz7nPJmTtd5D2u51M0hXJzpaEvj/
	mBcDSjLJcXn0LVwHmEzVvuDieT+UxW11DpVBmChJM1YViDw5bTOB8yjrmNFkMErfxwd5
	r0/L/TX8V8dZA+cQgzqSWMAX6IlwwCs97cZySrnGKv2D7Ftm/980reH1aNFPwyZxFCO1
	OHMtvOIJEqgPuDJwIiX/OjyMbPcJzSzgbAFTim87MhnMrJFdH1OMK46RkSXwang/3R+D
	EDiQ==
X-Received: by 10.14.219.7 with SMTP id l7mr25920545eep.12.1362998368664;
	Mon, 11 Mar 2013 03:39:28 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id 3sm22742787eej.6.2013.03.11.03.39.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 03:39:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:39:13 +0100
Message-Id: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkc3trGJj7I4WNYzg6CyD1vNRrhDIjb+DdO0LXx8TEBWs219RhFCMwPlN+6tOexTaOg3ivy
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH 1/2] xbmc: first try at making it build for non-GLES platforms
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
X-List-Received-Date: Mon, 11 Mar 2013 10:56:12 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 74bf710..6331306 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "XBMC Media Center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
 
-DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml"
+DEPENDS = "libmad libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml"
 #require recipes/egl/egl.inc
 
 SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
 
 PV = "11.0"
-PR = "r14"
+PR = "r15"
 PR_append = "+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=eden;protocol=git \
            file://0001-configure-don-t-run-python-distutils-to-find-STAGING.patch \
@@ -26,13 +26,14 @@ CACHED_CONFIGUREVARS += " \
  ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \
 "
 
+
 EXTRA_OECONF = " \
  --disable-rpath \
- --enable-gles \
  --enable-libusb \
  --enable-airplay \
  --disable-optical-drive \
  --enable-external-libraries \
+ ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enable-gles', d)} \
 "
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-- 
1.7.7.6



