Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 57D8B78B9B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:10:30 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id v133-v6so6692461pgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2018 11:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=nVjWt7BdT7YF3e6bQmFbXtRFh6WisvVJj09rWTTlfZA=;
	b=ql9Das36SJBLu2zj0u4HdlUqdeJQWbdtzd1ZknZLKUdO/2M9i6zLFWHyDG0CeobUdl
	12QXAwryL+kZKGmsnX2gwFkbQSgWqZBDAR/w6fHcFo5p7nLQTO6RtRpG4CXQLMMv/6aV
	/FJ096kE00Y8TDfw/HSZE1n0gQ5bYvLkTXN3FR9nDFjshLssZeK9TDRKEo5kWi4EBqWJ
	ZzZk4WZUdZPEGl6x+CpkAyyeWKwLrW5HRFVgbpTKODvK97IAfCxdwdcebAWeELnI/swN
	uhRVbbnMIJcs5ZK/vDoob23sYNpillNWL2141CWH6frIrA+KTyd/RrNz2FE/87pMWwmF
	Mx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nVjWt7BdT7YF3e6bQmFbXtRFh6WisvVJj09rWTTlfZA=;
	b=AM+jbvGgTQ3OkL4l35GSbsTmLaaObLWh4gu9C3fKFfYESqpsYfuxCs41Lw4vIWtX68
	llOi9Lu4CRmX+ra63gu4M/BydS6pWeV9ckSQ73zkU22IYVLggrcpG1ADbsjFfwuweIQQ
	bzDcPivFYwTbMqZNTSTEEzX8jkb2HW/e+3tFwwnq8cz05NxS0Hu77+tjZP/Nlsnezqu9
	kjckyhBajTHISbzM1OR6+NLKSWiI9+nTpHs+boqPbdDNR6lVZ9JbiGiGOd1E0xr/j1lv
	tjsEuwcXJkot/sfC9hjkZRrkhpJSiDFAUh1rZq3cWaNEklYgUtMyTEZcMDyBA/HNVv8e
	hndg==
X-Gm-Message-State: ABuFfohmhoqEeUdP+StbKznDfHaUA9VDw8vz9Nd6E5yJD17lO3+s9m4j
	ZwAr4WZfJK57Zvc26MSAh7Q=
X-Google-Smtp-Source: ACcGV61cffbYF2pgoT9hPeEnxA0EY3f5yBldux6PCoYsu/DM+6tDG4aSmE3fe+VA4AqUCT3Vg6YW1A==
X-Received: by 2002:a63:fe49:: with SMTP id
	x9-v6mr3799732pgj.152.1538244631321; 
	Sat, 29 Sep 2018 11:10:31 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	x77-v6sm14599110pff.37.2018.09.29.11.10.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Sep 2018 11:10:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat, 29 Sep 2018 11:10:29 -0700
Message-Id: <20180929181029.22080-1-akuster808@gmail.com>
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
X-List-Received-Date: Sat, 29 Sep 2018 18:10:30 -0000

ERROR: Nothing PROVIDES 'faad2' (but /home/akuster/oss/maint/meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb DEPENDS on or otherwise requires it)

enable acc only if LICENSE_FLAGS is commercial

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
index c0d4c8c2b..aee9e0769 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
@@ -27,7 +27,8 @@ SRC_URI[sha256sum] = "8322764dc265c20f05c8c8fdfdd578b0722e74626bef56fcd8eebfb01a
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "aac alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
+PACKAGECONFIG ??= "alsa ao bzip2 ffmpeg flac fluidsynth iso9660 jack libsamplerate mms mpg123 modplug sndfile upnp openal opus vorbis wavpack zlib"
+PACKAGECONFIG += "${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
 
 PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-- 
2.17.1


