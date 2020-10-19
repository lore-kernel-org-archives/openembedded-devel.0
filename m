Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web09.11530.1603108244690624966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 04:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k30DFyCp;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id z5so7648163ejw.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 04:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yxn8m9P7GJL4gVyJs563uxTmzfInAh7VZ+fe9l24Yx0=;
        b=k30DFyCpODcdWRmJ11f1MP0ye3VyP28+4OQiDCzf0dWYFrxhU4A286TJ4Zqm4ySku8
         43ks4XXLhy9PX6S3caRXdG3xoFXgZeXljoudy3tfHwWjyuoSCIt8yqxHEqiigIlbEmgA
         j2vbC10Uus67lTw1tL0awqHKvStRPbeXT6q9pIX3jXCI8dSGrgzZEcZ7TR9T7+J4uK9Y
         ByXjetQ5mzqguF8i4xts7/7EVSEhZXtGuAMxQGawOkfVC4i2SV4q5zwdT+t9Pb/VjlrE
         J+PEj5rkvVDsrhWJvupTSSLj0CPfSglJWd57FB4yQ67uSGRQ8gFLDQjB2IiVtlfek6Fg
         j9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yxn8m9P7GJL4gVyJs563uxTmzfInAh7VZ+fe9l24Yx0=;
        b=F5bYxKNSDSkftn59z1ew1z1GfN3Jcn0ogYAZWHEzcrMyytJtG14aiJQzr3hwx71UNW
         cNysY1CHkpqVJGbKWSanfUtWmFmrMOWhpmqUfUVzvUG4P0rNLTMde+1Vs/ciwdT1IKqM
         Yf9Li5AqfL0yXpEZgTs5KNurQcmktxunQGWlVlK076HekexuZYBHFZAe9TYWgg8AFizq
         f5zL8mufwGifPC8bkJr8OFivw83EDFXZ+7c0sX73l4ur7TaVN+pc9iLzFKR9zBfJA/LT
         xPFtb9fykPNjF4KdF+60P+aRvUM1evRyXR69y9iOjjt2SOB8affCDD5TV5R4b9SR1w5V
         Gn7A==
X-Gm-Message-State: AOAM533S1hDaEOa+DkD+3SgBuX37X0dlUUD1zcNPcjYFTKCpMtzUfe9F
	skMpJwwPidcVWRQnOsVEYBLj+aqXqTc=
X-Google-Smtp-Source: ABdhPJxG2wLeHZ1RtEitNfuWFT6xEnadfE146Kp0Fvi/oCaNRd23VHwSOdvHhV6+OcSAhEOv0rdPNg==
X-Received: by 2002:a17:906:ae48:: with SMTP id lf8mr16558694ejb.345.1603108242890;
        Mon, 19 Oct 2020 04:50:42 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p16sm10475408edu.74.2020.10.19.04.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 04:50:42 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-multimedia][PATCH] mpd: add commercial LICENSE_FLAGS when ffmpeg or aac PACKAGECONFIG is enabled
Date: Mon, 19 Oct 2020 13:50:40 +0200
Message-Id: <20201019115040.17030-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* resolves bitbake world error:
  ERROR: Nothing PROVIDES 'ffmpeg' (but meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb DEPENDS on or otherwise requires it)
  ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'mpd', 'ffmpeg']

* aac is conditionally included in PACKAGECONFIG based on LICENSE_FLAGS
  since:

  commit f5d271fd545c5b78d4a8fbc81e54df454fa0d5e4
  Author: Armin Kuster <akuster808@gmail.com>
  Date:   Mon Oct 1 08:05:28 2018 -0700

    mpd: enable aac PACKAGECONFIG only with commercial LICENSE_FLAGS

  maybe we could use the same for ffmpeg, but the conditional should
  be a bit more complicated, because the aac support is whitelisted by
  either commercial, commercial_faad2 or faad2 in LICENSE_FLAGS_WHITELIST
  not just currently checked 'commercial'.

  and we cannot use LICENSE_FLAGS conditional in both, because that leads to
  bb.data_smart.ExpansionError: Failure expanding variable LICENSE_FLAGS, expression was
  ${@bb.utils.contains('PACKAGECONFIG', 'ffmpeg', 'commercial', '', d)}
  which triggered exception RecursionError: maximum recursion depth exceeded

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
index 818b9271f9..b214672c62 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
@@ -1,6 +1,9 @@
 SUMMARY = "Music Player Daemon"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+LICENSE_FLAGS = "${@bb.utils.contains_any('PACKAGECONFIG', ['ffmpeg', 'aac'], 'commercial', '', d)}"
+
 HOMEPAGE ="http://www.musicpd.org"
 
 inherit autotools useradd systemd pkgconfig
@@ -27,8 +30,7 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
-PACKAGECONFIG_append = " ${@bb.utils.contains('LICENSE_FLAGS', 'commercial', 'aac', '', d)}"
+PACKAGECONFIG ??= "aac alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
 
 PACKAGECONFIG[aac] = "--enable-aac,--disable-aac,faad2"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
-- 
2.25.1

