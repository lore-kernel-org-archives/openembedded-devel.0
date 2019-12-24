Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 901557F9B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Dec 2019 01:29:04 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p17so1260778wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2019 17:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4B/2qiWKAJiIvjVUF6aBxo3cfz2kP/CUwV23U81z1bc=;
	b=SGU/hik5PAUlJuAqEeMIxks/ryn3vozpraeLRtg6dHbPKKig+voo5tXZ1fwb9dQ6mr
	Rbhfyi71NhRCbCXnYF1ncrZfxpnvRak3gG9hK42L+18ERr3IWG/c8Pc98ft0jpu3e4YK
	egxnN1GnDxwupTMlL7esAqgctf3u1zkgcbTmvx5NN9F1ySnv/wtCk85DNkG744txw/Yd
	s7iZh/GSI/HR+XEEmvWZyRrUkAHJOq40lJAoS0L6vL7QxPprAZn2lBeNf18PAcvHFabZ
	fKp3KARuFEPH0OBlqpjREZgeh4Z1mWl3krXjX4tU/4HD0sb+3u6RIgMXtwpHJQGQsAM0
	sjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4B/2qiWKAJiIvjVUF6aBxo3cfz2kP/CUwV23U81z1bc=;
	b=KbqWUu9wYPHB14ivzPnRxf9XaTX5DpT+yBWpHASSCfjRNKjAxy9HDp0TMUPK3PGJuI
	qiNhpl1qMKnJVxUZEos4qy4/4KCPo3OESuVdsBpmjw0vXjQKBZf3yeBYrVuqc/2RNwwm
	2EfAnhLhS6W9sB1rODI11j+lONGqjdKz7+wxJ/gFjQFFQcX8/9GwxBk1Aa6eJ8wV7TV1
	uJEGZ4sVNcEaZO12cxCMoNfP3MGxMudxLxdLyCSYCCbVeVmFCKKwbNZbmor44GKxAggx
	MEjD9yqLpii3IWuPtVJam8YvEGHP3SArQbdMcPuN/ISnohavR1dqyJokzOrs0+9w/uJt
	3KLg==
X-Gm-Message-State: APjAAAUR+Hkp14AfWklwv+nPXdLQIx5ulgBcpQYRbdUP2NgIktB16BXR
	oVjRneMAJW0fWzJVEV3JGULKx8fm
X-Google-Smtp-Source: APXvYqwhL1hPwNnFjX2BAYR1cjwC//vdRipzXOsn6xdrp3McQfq55wbmJU5XnxXZ4tUuiBOQoxS4ZA==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr1470067wmm.1.1577150945248;
	Mon, 23 Dec 2019 17:29:05 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2F7C330A6AB734136EA216.dip0.t-ipconnect.de.
	[2003:f0:7f2f:7c33:a6a:b734:136e:a216])
	by smtp.gmail.com with ESMTPSA id
	i10sm22386924wru.16.2019.12.23.17.29.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Dec 2019 17:29:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Dec 2019 02:28:57 +0100
Message-Id: <20191224012857.10323-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] fluidsynth: upgrade 2.0.9 -> 2.1.0
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
X-List-Received-Date: Tue, 24 Dec 2019 01:29:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As the version number suggests this is largely a feature upgrade:

From annoucement:

New features
    new, less "ringing" reverb engine (#380, thanks to @jjceresa)
    new, stereophonic chorus engine (#548, thanks to @jjceresa)
    support for Downloadable Sounds (DLS) files was added (#320, requires libinstpatch)
    improved integrity checking of SoundFont modulators (#467, thanks to @jjceresa)
    rendering to stdout is now possible (#553, thanks to @mawe42)
    the following Audio Drivers have been added:
        Oboe (#464, tested on Android, thanks to @atsushieno)
        OpenSLES (#464, tested on Android, thanks to @atsushieno)
        SDL2 (#478, thanks to @carlo-bramini)
        WaveOut (#466, tested on Win98, WinNT4.0, WinXP, thanks to @carlo-bramini)
    various performance improvements (#543, #545, #547, #569, #573)

Bug fixes
    generator modEnvAttack now has a convex shape according to SoundFont spec (#153)
    the default MIDI Pitch Wheel to Initial Pitch modulator now uses Fine Tune as destination generator, allowing it to be overridden by the soundfont designer (#154, thanks to @jjceresa)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-multimedia/fluidsynth/fluidsynth.inc            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 764ed375e..9ce65064d 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,9 +4,9 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.0.x"
-SRCREV = "c2f4683bf57f61451d14d219fdb25cf9f29cb7fe"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
+SRCREV = "37c9ae2bf431a764032f023b3b2c0c0b86b7c272"
 S = "${WORKDIR}/git"
-PV = "2.0.9"
+PV = "2.1.0"
 
 inherit cmake pkgconfig lib_package
-- 
2.21.0


