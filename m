Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UXmuW-0002A0-EP
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 May 2013 08:22:35 +0200
Received: by mail-ea0-f182.google.com with SMTP id z16so88879ead.41
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2013 23:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=IHEOCi2r1rYwprCQRddNQfBzSWcUyrj0E23hovWHXrw=;
	b=Arm5/DmmQcAsy1vfwIMmTBJyqMgfp4+JbfgdcUN3tY4HQZ5tKbftzhgEALr/PLdQg4
	009QNFCBN4ehZVULu0iOu4x76MaSJmkUa2A7GPbu43FA2Zh5+Zh3NgMGDcDBOcjdzVPt
	YaKDBc6BWfxPrDlGMZgYV3GFnQDvO6ZDrj84EcjPkJoEPUk3qcWNNlc2J7Jc1yFUqqbj
	q1NvdqKrpG6wttZ2EiVlEKI9sRdbWZ1hwMux0kraMGz+H9s1hgjB2FTzUe1OMtCNLmIb
	PFUAx2Day3f0eA6rF7UQUreU9/pWtwINBrkcppGY5wK+BIWQ0ze4adVV7ZNhduRZ6BEb
	nU0g==
X-Received: by 10.15.22.76 with SMTP id e52mr15957147eeu.7.1367474679514;
	Wed, 01 May 2013 23:04:39 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id l6sm7435772eem.9.2013.05.01.23.04.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 01 May 2013 23:04:38 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 May 2013 08:04:21 +0200
Message-Id: <1367474661-2698-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1367474661-2698-1-git-send-email-koen@dominion.thruhere.net>
References: <1367474661-2698-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl54mGwF0oQD6aMYWaE3gHF3mIjCYsrYV0vR/ImoOZzfWl2Pi0bZ4uu1kasz5xg55dTg9+e
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-multimedia][PATCH 2/2] xbmc: convert to PACKAGECONFIG and fix runtime dependencies
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
X-List-Received-Date: Thu, 02 May 2013 06:22:46 -0000
X-List-Received-Date: Thu, 02 May 2013 06:22:46 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 7d0a1d9..cb55f38 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
 DEPENDS = "libmad libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml"
 #require recipes/egl/egl.inc
 
+
 SRCREV = "82388d55dae79cbb2e486e307e23202e76a43efa"
 
 PV = "11.0"
@@ -30,13 +31,16 @@ CACHED_CONFIGUREVARS += " \
     ac_cv_path_PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python" \
 "
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', 'openglesv2', d)}"
+PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,glew"
+PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,"
+
 EXTRA_OECONF = " \
     --disable-rpath \
     --enable-libusb \
     --enable-airplay \
     --disable-optical-drive \
     --enable-external-libraries \
-    ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl', '--enable-gles', d)} \
 "
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
@@ -79,11 +83,14 @@ FILES_${PN} += "${datadir}/xsessions ${datadir}/icons"
 FILES_${PN}-dbg += "${libdir}/xbmc/.debug ${libdir}/xbmc/*/.debug ${libdir}/xbmc/*/*/.debug ${libdir}/xbmc/*/*/*/.debug"
 
 # xbmc uses some kind of dlopen() method for libcec so we need to add it manually
+# OpenGL builds need glxinfo, that's in mesa-demos
 RRECOMMENDS_${PN}_append = " libcec \
                              python \
                              python-lang \
                              python-re \
                              python-netclient \
                              libcurl \
+                             xdpyinfo \
+                             ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-demos', '', d)} \
 "
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 glibc-gconv-ibm850"
-- 
1.8.1.4



