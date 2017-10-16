Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 965F16E671
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:42:36 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id m72so1776124wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7VKMEoO8F7tV0KOVc+nJ3OSvjxUtsh8QK7U1WkDmEhY=;
	b=QtuiaqBQppCVXtXXBA29HA1nroqNFVLmeGraOWc7N7bwe7UqpLsRf9KUvTmgXog8x3
	Nf3FTKEGWbN0o0qYFK+w8eyQntKWbTGT25X1II21nXVp5g2fbvfZCelLBojxbTMjHRFw
	hgE7cNq/NqGz7HV/k0+AsAfMpOUj0cufxtB9BpSchmyD4z4oRx4GezLNt97EnKwyt8Kb
	FH8znV8bjBVDgFQyqhEuTUmeHJGrcSlPLvb5EqGQnXlSp8y9pbEcPRGH4Yi8GO9z+fD7
	lR0XW2+AIQF2XmfLZW1PfVW2Rc710HUhrP/zLpyy1UbV7I4KOtf0a7i+B23ZOMiHB8pI
	dzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7VKMEoO8F7tV0KOVc+nJ3OSvjxUtsh8QK7U1WkDmEhY=;
	b=Sel6pEOpi3ABJ9T+GlzevdDVysUp97/Y/7ABlgqOBe2d5IfrkbLJPhLBNZOvqJrZHT
	39J5QaeqMCFhdyVjgeU50mleh9xEN9fwLV0DfeCKoHPT2TZUXLYnLG1laBwRlrQcVN7P
	U0erfHoqBVLNdlVPd2/lrGT+AD7yVl1zh2lp6+VpHTMYGN1B9J/ldzMa7o+1ErZUC+dQ
	9nRhO0vYnD/0wmCISX0/1/+qitq/FGnktBv0G3mSbmwseWqR0evCdyBtRb4xggHc96pr
	7qSC0ETfFp/SfFRlIFtOEC6/mmhXw/SMBAgoo0cPzqK73JbCD26ljJu6QNx66aUwDmss
	20Pw==
X-Gm-Message-State: AMCzsaULvJTXl7/27xM2fOlX4CHrrybAXebIZiqxDsOXHy/TUwaA9w05
	7uwclwi5fXxhmUcOHevJS3L1Lg==
X-Google-Smtp-Source: ABhQp+RcPLowHEik8HfwK8svLQxo/lECTu0tYYaYO5A85FAJCdpMjER2by8jwom59XpU9Lz+2mOP/g==
X-Received: by 10.223.136.44 with SMTP id d41mr196609wrd.68.1508150557738;
	Mon, 16 Oct 2017 03:42:37 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	29sm5594531wrz.77.2017.10.16.03.42.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 03:42:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Oct 2017 12:42:28 +0200
Message-Id: <20171016104228.18892-1-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
MIME-Version: 1.0
Subject: [PATCH] fluidsynth: update 1.1.6 -> 1.1.8
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
X-List-Received-Date: Mon, 16 Oct 2017 10:42:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* project has moved from sourceforge to github
* autotools was replaced by cmake [1]

[1] https://github.com/FluidSynth/fluidsynth/commit/3939941c5f3fdaef6bf9258fabd5725e7666554a

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../fluidsynth/fluidsynth_1.1.6.bb                 | 23 ----------------------
 .../fluidsynth/fluidsynth_1.1.8.bb                 | 19 ++++++++++++++++++
 2 files changed, 19 insertions(+), 23 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
deleted file mode 100644
index 88981e4..0000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.6.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Fluidsynth is a software synthesizer"
-HOMEPAGE = "http://www.fluidsynth.org/"
-SECTION = "libs/multimedia"
-LICENSE = "LGPL-2.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e198e9aac94943d0ec29a7dae8c29416"
-
-DEPENDS = "alsa-lib ncurses glib-2.0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[md5sum] = "ae5aca6de824b4173667cbd3a310b263"
-SRC_URI[sha256sum] = "50853391d9ebeda9b4db787efb23f98b1e26b7296dd2bb5d0d96b5bccee2171c"
-
-inherit autotools-brokensep pkgconfig lib_package
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
-PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
-PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
-PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio-v19"
-
-do_configure_prepend () {
-    rm -f ${S}/m4/*
-}
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
new file mode 100644
index 0000000..754fadc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.8.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Fluidsynth is a software synthesizer"
+HOMEPAGE = "http://www.fluidsynth.org/"
+SECTION = "libs/multimedia"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
+
+DEPENDS = "alsa-lib ncurses glib-2.0"
+
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=1.1.x"
+SRCREV = "12e7afe3a806a6b397f28e0ca4bc6bab9ebe7047"
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig lib_package
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
+PACKAGECONFIG[sndfile] = "-Denable-libsndfile-support=ON,-Denable-libsndfile-support=OFF,libsndfile1"
+PACKAGECONFIG[jack] = "-Denable-jack-support=ON,-Denable-jack-support=OFF,jack"
+PACKAGECONFIG[pulseaudio] = "-Denable-pulseaudio=ON,--Denable-pulseaudio=OFF,pulseaudio"
+PACKAGECONFIG[portaudio] = "-Denable-portaudio=ON,-Denable-portaudio=OFF,portaudio-v19"
-- 
2.9.4


