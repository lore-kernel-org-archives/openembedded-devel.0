Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBA778306
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 17:47:22 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id l1so2547842wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mx2aBNu74gZb5Af+HUXz+g9NUmygf8Lz+2trSYvyuNs=;
	b=X/0Rwzyp3R32Udxfzeziycp+BZ+49DZVnZuXgq5x5Bmrh3u+gwfggKyy7d0v+w4Dwe
	nevY1NqW0RNoDSQrfLcZmzDvF6BPgJtu9PTJ2a6y2mBmU4wArjMoPQM2uaqFsuNRqzEk
	zLW+a0zsM2Mos5SZbNrJaUT6yq9kb/jzoKTAHZBFeZ8aH0HplPRFURBmBJemnycQ1V0Z
	dTlxlv1+GPFYi1DfNbqlgupmmaS1S4qZEKM7dOxPv3T/nadeO/k+IuT7V/xDSnaaP/Dm
	upTHoAZLfL4Cidn4LrhzZFh+ZF1nxh5APg43qrvv/l95RcboqkKxImyo718iQwnZuxTp
	2qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mx2aBNu74gZb5Af+HUXz+g9NUmygf8Lz+2trSYvyuNs=;
	b=ZUPROy9BK+bMlOMO59VUWwhewmaDkt3jf6YFFKKo4zIDuB5DyD5Tgn05qFUck+E75F
	tA4adBgfgfGdoqReWLfU5l5P5Isz5x+YziznrDGCzr8sqTvuADr/yfhtbl2uNag8gmIe
	mdldu+YDF2htww4RHMo8AfXVhbRIrBTy8AI6hvyJ68J6jZkFR+uE1MiAhJ/LnCeUfuwh
	CxkRC7qJt58YgxI00yTd1AiRwP5cbarnuYSEoTDKsNo8hh82cVUq1OwUZXLqMQ8rezr5
	h6Sx8VAjON80gWu8FhwtFmYyH/J0MSg2fXZDrX1tJSUvIGajQj7eVv7chLLKNXxuufAZ
	ejdA==
X-Gm-Message-State: AMCzsaVK+whEUuoJiE5OaDNZ2Auk0FpUfB499fpHbwp/j9kG3OFGbSdu
	qYsZFSG+LCjUFcN+Re4M+uXQzQ==
X-Google-Smtp-Source: ABhQp+TOCp+kL/8kCrTuuOeXxLbuJqT59rkDEzruwwIaH+x3g3xeBEw0PreP3xlw1g9HLOChGX0BOQ==
X-Received: by 10.223.188.133 with SMTP id g5mr3970170wrh.204.1508262443781;
	Tue, 17 Oct 2017 10:47:23 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030070ED23C4881E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:70:ed23:c488:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	c3sm7723804wrd.44.2017.10.17.10.47.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 10:47:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 19:47:13 +0200
Message-Id: <20171017174713.3737-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
MIME-Version: 1.0
Subject: [PATCH][V2] fluidsynth: update 1.1.6 -> 1.1.8
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
X-List-Received-Date: Tue, 17 Oct 2017 17:47:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* project has moved from sourceforge to github
* autotools was replaced by cmake [1]
* license was changed from LGPL-2.0+ to LGPL-2.1 [2]

[1] https://github.com/FluidSynth/fluidsynth/commit/3939941c5f3fdaef6bf9258fabd5725e7666554a
[2] https://github.com/FluidSynth/fluidsynth/commit/1f5a3ca26e5c75e3ae54eb4c88f1f2bd21f87644

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{fluidsynth_1.1.6.bb => fluidsynth_1.1.8.bb}   | 26 ++++++++++------------
 1 file changed, 12 insertions(+), 14 deletions(-)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_1.1.6.bb => fluidsynth_1.1.8.bb} (23%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
similarity index 23%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
index 88981e4..ef4c606 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
@@ -1,23 +1,21 @@
 SUMMARY = "Fluidsynth is a software synthesizer"
 HOMEPAGE = "http://www.fluidsynth.org/"
 SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e198e9aac94943d0ec29a7dae8c29416"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 DEPENDS = "alsa-lib ncurses glib-2.0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "ae5aca6de824b4173667cbd3a310b263"
-SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x"
+SRCREV = "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
+S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig lib_package
+inherit cmake pkgconfig lib_package
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
-PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
-PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
-PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio-v19"
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
-do_configure_prepend () {
-    rm -f ${S}/m4/*
-}
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
+PACKAGECONFIG[sndfile] = "-Denable-libsndfile-support=ON,-Denable-libsndfile-support=OFF,libsndfile1"
+PACKAGECONFIG[jack] = "-Denable-jack-support=ON,-Denable-jack-support=OFF,jack"
+PACKAGECONFIG[pulseaudio] = "-Denable-pulseaudio=ON,--Denable-pulseaudio=OFF,pulseaudio"
+PACKAGECONFIG[portaudio] = "-Denable-portaudio=ON,-Denable-portaudio=OFF,portaudio-v19"
-- 
2.9.5


