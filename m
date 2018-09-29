Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 73FB9799C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 19:31:05 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id y18-v6so6769231pge.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 12:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=sIbc5zjEf5sTozTAAn/ScLgQQOixRFQaqvLlLapIwXc=;
	b=CY+5beL2TLwfxqJ7EaE8AkRoMcw4QsnuPlitqKde7B/alTsXX1LHFR4CplNFxzInso
	Bludcd1zVqSddtGd2N4DEew32j8UNL2+4GM0+cqS7febE0anuCvDGwGnDAYcjBOs9J5K
	P3dxZIZGdW4lWPCQtGZIiBvpQ+6rlZ7tVvMPZBngPPZwKHWMBYMRNrPy5kk4Ks6uNiM8
	GnsYwHyS+j6YtnWRmB0bXV8qoiKUdSEEseDhw4KCMYkL27JsErAzLgKR7fYe2chCD+EG
	Iih+qBAilWcj7TalwY3CabSSooDPzFPt0VEpe9Xdqjy8VviX5gZt9neoZHOHatwKVgne
	26HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sIbc5zjEf5sTozTAAn/ScLgQQOixRFQaqvLlLapIwXc=;
	b=OZ9s2DN0PEXGV3fLLx2jLTC39tEQO4qkWuto3EMzXOBz2vh6IKZTRpjRk9TUuG3PaO
	r9DdOChiwHdEClY5aenpHDIx2j2qWZ1mn1hIdgq9GAMjR1hRteY5BEv/MT1jSnR1kvu9
	XavJVsBUzk3mfBj0vRltqQ4Cn7LlJ+xgaBAAGTNPmF+JdSjYzKg/NugkUc/WHXeZNvjC
	CLGcYhQcv5g5akva8lN9NYv5xl8qNsQGcLkOnTw2QIgHlU+0s7Fali40cPDVfXXYx8uZ
	VNA1WbCbVuPqa5wmCbe3EID+ScIjUaKtuXftzy3UdjubHtpvm/2xvwYGXPzDWCS6W8iC
	HHyg==
X-Gm-Message-State: ABuFfogix4scgC5M5iorj9slal/gjC9SWTZhrMoPTLjZdKg39e3Mf3gD
	zJWDJQGUP7qzSLYILzFYewJZ/w/N
X-Google-Smtp-Source: ACcGV61ilUouopg/SDiO8BgsYxF+CZMLx/wt4MLirJ1VTUgm3u4uY8EohaS9FVK5pZwwIyejFXx/HA==
X-Received: by 2002:a63:b95c:: with SMTP id
	v28-v6mr3891270pgo.221.1538249466412; 
	Sat, 29 Sep 2018 12:31:06 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	v23-v6sm11124134pfm.80.2018.09.29.12.31.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 12:31:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Sep 2018 12:31:05 -0700
Message-Id: <20180929193105.25864-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] mpd: fix yocto-check-layer issue with mulitmedia
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
X-List-Received-Date: Sat, 29 Sep 2018 19:31:05 -0000

ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on or otherwise requires it)

enable aac only if LICENSE_FLAGS is commercial

[v2]
fix typo in commit message
rebase on latest master

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index 9123673fb..f91ce4d62 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -26,7 +26,8 @@ S = "${WORKDIR}/git"
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
+PACKAGECONFIG ??= "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
+PACKAGECONFIG += "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
 
 PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-- 
2.17.1


