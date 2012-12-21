Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tm3OC-00050N-TR
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Dec 2012 15:16:16 +0100
Received: by mail-ea0-f174.google.com with SMTP id e13so1870948eaa.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Dec 2012 06:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=CgqdT8se1M913Js85F64cwOECfSCz8qQ2higX8WlZ6A=;
	b=D6VJImKW3aMHVxYgxnynTe4xIBPGtrVjV9AC8GmLqQ63RLKSHKEy/HkMLEpalj5iBW
	hg7q9Cn0VipiocNQC5ZwoCVVAJvVyRhzyZUlD1UdUgOitezXfw5CflHTUI6VGtky3moa
	M1jZ0IpcmKplbk0rxRSEDBiZ9yJhGZrezfLe7NK7r7F1EG8uV10zxtRWUcC0T5pe232s
	fixAUDHo5C5ik/in5TgLe1C4fl8tyfF/IFFrw82tRl/NXwhBNShYXcggAanQDk290YkW
	qMdP9wVci7isgdF03wocIO8KqDzfVVcBrTXxyhI90zH8Mi8i1SzE7hlsiBx+hW9lJk/o
	B7oA==
X-Received: by 10.14.178.196 with SMTP id f44mr32299888eem.14.1356098466851;
	Fri, 21 Dec 2012 06:01:06 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id w44sm21810573eep.6.2012.12.21.06.01.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Dec 2012 06:01:05 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Dec 2012 15:00:45 +0100
Message-Id: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQkzN49id6nEQr0aT9rFaAtPst5X67OzZg28X5QSH5hacp5kpJIJAdS3fGRe66F1N1S0oboy
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][meta-multimedia][PATCH 1/6] xbmc: first try at making it build for non-GLES platforms
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
X-List-Received-Date: Fri, 21 Dec 2012 14:16:28 -0000

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



