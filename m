Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9512E60809
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:57:38 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id w10so194073pde.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EI8/9d1gqvcnYyDbGQy/pNtpuU3ITz7w3VOG+m1zfmI=;
	b=PgNPLs2GJ4ixi9nTPPkuuEN478gsznuvVAy5yl1pc8QSvrhFXK/gLjyUl/K6lJlbDg
	cuS1d3BBFDTbNfgjT4zyNHVN1ehvV/AAaxChg5z95RnsaFR1obwtlgLnmQKyZEXmyx/N
	L4xGeBKmP9ZYf3z8RHFMpiU4HqMTCfUoroao8bDjFQ2d+Ey4xtyrLKVITz0eghPvnE5o
	YvEhsRtwAtiya/fXZuVhQv9PDGWipAAvdla/8h2iW/B2uYwEEyCWgNNZBJ6ojHVuBx5w
	m1D4y2CPmmF2++gf+7oO1jZdzOcOQfAemD0Qn7UhhbSC8tsRzjF4WjLn7guGG4g6dHD6
	fI7w==
X-Received: by 10.70.130.195 with SMTP id og3mr73793240pdb.59.1412013460225;
	Mon, 29 Sep 2014 10:57:40 -0700 (PDT)
Received: from haswell.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225]) by mx.google.com with ESMTPSA id
	uu17sm7664902pab.43.2014.09.29.10.57.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Sep 2014 10:57:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Sep 2014 11:01:30 -0700
Message-Id: <1412013690-17234-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-multimedia][PATCH] mpg123: Add audio output modules via PACKAGECONFIG
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
X-List-Received-Date: Mon, 29 Sep 2014 17:57:48 -0000

We added heavy dependency list, but lets make
it configurable

Change-Id: I8d9641fdbbf49c4601d8fbc1fe8ccfae2f6acf2c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/mpg123/mpg123_1.19.0.bb         | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
index 9d9dc84..e669446 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://mpg123.de/"
 BUGTRACKER = "http://sourceforge.net/p/mpg123/bugs/"
 SECTION = "multimedia"
 
-DEPENDS = "tslib libsdl jack openal-soft portaudio-v19 audiofile esound"
+DEPENDS = "tslib audiofile"
 
 # The options should be mutually exclusive for configuration script.
 # If both alsa and pulseaudio are specified (as in the default distro features)
@@ -15,6 +15,21 @@ PACKAGECONFIG_ALSA = "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '${PACKAGECONFIG_ALSA}', d)}"
 PACKAGECONFIG[pulseaudio] = "--with-default-audio=pulse,,pulseaudio"
 PACKAGECONFIG[alsa] = "--with-default-audio=alsa,,alsa-lib"
+PACKAGECONFIG[sdl] = ",,libsdl"
+PACKAGECONFIG[openal] = ",,openal-soft"
+PACKAGECONFIG[jack] = ",,jack"
+PACKAGECONFIG[portaudio] = ",,portaudio-v19"
+PACKAGECONFIG[esd] = ",,esound"
+
+# Following are possible sound output modules
+#alsa tinyalsa oss coreaudio sndio sun win32 win32_wasapi os2 esd jack portaudio pulse sdl nas arts openal dummy
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'alsa', 'alsa', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'pulseaudio', 'pulse', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'sdl', 'sdl', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'openal', 'openal', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'jack', 'jack', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'portaudio', 'portaudio', '', d)}"
+AUDIOMODS += "${@base_contains('PACKAGECONFIG', 'esd', 'esd', '', d)}"
 
 LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
@@ -28,6 +43,7 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = " \
     --enable-shared \
+    --with-audio='${AUDIOMODS}' \
     --with-module-suffix=.so \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
-- 
2.1.1


