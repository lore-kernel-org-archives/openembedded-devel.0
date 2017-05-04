Return-Path: <eu@felipetonello.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4412877C6F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 16:03:06 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g12so1898327wrg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 May 2017 09:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gChE9wnw8I8k4Wlc4pEXTRnRoctg6p+HOfPuMlx92/8=;
	b=TIFOC3UcQpZbdjCqknuNJPHR90bKKRoj8pwbp7yKTDmkBFjpWJU8/MWuDCFANQHkph
	trs70XcwIp0T4kUjVHA3ZS9KReESJVSRlkI3zltXO1e7/dqBVcKr1RlwoMOmR9JJ557R
	+mblrL4pc3v6PrpPOTZMzz285fE6a3sIJQbKd/Hp+Of+0vFE1c1dAHyCVOqFotLv71rM
	icHOH3MMXuWvprN5IJzdU4/5AWleAuhwc3w5Qr0h0UaadBsye+dgowuy3T2dl9rAduMp
	gEXa0heLTikUeVYD3I0uiK2EtjIWBN5J14AvoNdXtmwLz5btVGFv60qSKkHSzHfRcLet
	xKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gChE9wnw8I8k4Wlc4pEXTRnRoctg6p+HOfPuMlx92/8=;
	b=DUwEkSi8HDOyqmtU+vwex4DHXWNVe3MTLbESNTjzGP7z3rC0QnrcNWIXDOv87ksSd5
	kaQD46nfF621bbC6UcK7idP6xWVLIHAiUoZLF4Q92JwPs4GNjLSRRZBvZRwy8YSj6qOl
	y9/+RxKUVsnRixL2+NwAv2gHORAwdFvm2Fj6yT+wZz/KCsXfsbU9k1GsP6lWWD7wS5s8
	SLCOmh6ydT1K/WSzVyCGccs3FV6arzn9hYRB1NI8sR6f2o9dRZTw2TPiZe5/MZ2GAutO
	64DpglLQvlhurFUkAWsaMX9P6FJrakZFbQL4fJKQm5RTZg1d5p/FCaYSP+0wxdpwwQFS
	hV2g==
X-Gm-Message-State: AN3rC/6Q0e9wgTvwDQsP3ivF6KDB1kU6LcBTl53gzMOsCOTjd9XOTRqS
	S/F/lmE2FwaOO0Uh/lA=
X-Received: by 10.223.139.150 with SMTP id o22mr27608846wra.118.1493913787235; 
	Thu, 04 May 2017 09:03:07 -0700 (PDT)
Received: from localhost.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	n49sm4406450wrn.30.2017.05.04.09.03.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 May 2017 09:03:06 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 May 2017 17:02:44 +0100
Message-Id: <20170504160244.30690-1-eu@felipetonello.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH] juce: Updated JUCE to 5.0.1
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
X-List-Received-Date: Thu, 04 May 2017 16:03:07 -0000

JUCE 5 doesn't require juce_events to have x11 dependency anymore. Also
there were many improvements on Projucer.

Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
---
 meta-multimedia/classes/juce.bbclass                 |  3 +--
 meta-multimedia/recipes-multimedia/juce/projucer.inc | 12 ++++++------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta-multimedia/classes/juce.bbclass b/meta-multimedia/classes/juce.bbclass
index 715282fd15c1..3927235ef13f 100644
--- a/meta-multimedia/classes/juce.bbclass
+++ b/meta-multimedia/classes/juce.bbclass
@@ -1,8 +1,8 @@
 inherit pkgconfig
 
+# List of JUCE modules that requires external dependencies
 JUCE_MODULES ??= " \
   juce_core \
-  juce_events \
   ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'juce_audio_devices', '', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'juce_graphics juce_gui_basics', '', d)} \
   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'juce_opengl', '', d)} \
@@ -11,7 +11,6 @@ JUCE_X11_DEPS = "libx11 libxext libxinerama libxrandr libxcursor"
 
 PACKAGECONFIG_prepend= "${JUCE_MODULES} "
 PACKAGECONFIG[juce_core] = ",,curl,"
-PACKAGECONFIG[juce_events] = ",,libx11,"
 PACKAGECONFIG[juce_audio_devices] = ",,alsa-lib,"
 PACKAGECONFIG[juce_graphics] = ",,${JUCE_X11_DEPS} freetype,"
 PACKAGECONFIG[juce_gui_basics] = ",,${JUCE_X11_DEPS},"
diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
index 6f696e26f928..41297f868865 100644
--- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
+++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
@@ -3,19 +3,19 @@ DESCRIPTION = "Projucer is used to build and generate support files and build in
 JUCE supported platforms, including Linux and Embedded Linux."
 SECTION = "utils"
 HOMEPAGE = "http://juce.com/"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://README.txt;md5=9ab765ccda8890efc753f287911a1958"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://README.txt;md5=65c50b4ff3522b99436da100536ccd1c"
 
 inherit pkgconfig
 
 DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl"
 
-SRCREV = "a8a7fa28e2e9cb19db6a27fcccb567a8ccfe6109"
-BRANCH = "develop"
-SRC_URI = "git://github.com/julianstorer/JUCE.git;protocol=https;branch=${BRANCH}"
+SRCREV = "4f41f28b47d01b939559123d145b4e5860528bb7"
+BRANCH = "master"
+SRC_URI = "git://github.com/WeAreROLI/JUCE.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-PV = "4.2.3+git${SRCPV}"
+PV = "5.0.1"
 
 JUCE_PROJUCER_BUILD_PATH = "${B}/extras/Projucer/Builds"
 JUCE_PROJUCER_MAKEFILE_PATH = "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
-- 
2.12.2


