Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.9614.1630509671868725652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 08:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jyHwY2zN;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id x19so57838pfu.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 08:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=01RwkKUoxulXP1H4J08LyyK2tDVVL6gHbdmbo7Qaekg=;
        b=jyHwY2zNaP+Ry7umPu7/P06RjOrt+JiFNsLCrqNK5jD6ntD2a6gtv39XGK+6NaOW/N
         bZ5+SFrDHFegkkXZI63nKLL11XjcuznPYiz5uIgTZYfWH1PsWishG7mASdmZQ71MF94J
         35G+gfFoWuDc+OPBm1C2YpL3VO+45Gqj7pzaFLpC3p8ZWSKO2zd1tOlxcN1RCS4KzSnG
         Z28WZTjyhZgEz/K/hl+CNA7MoVdYWpzac1/dkygFQFkafsTHxPCih2Z0fvrjDmE2ZV5Y
         y2jrylX3lwQ1gagRA/g4qKqn5+tiepGDsyJB+ttZFbVQFz2EzcalRevt3+N0ZijKe1i9
         FULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=01RwkKUoxulXP1H4J08LyyK2tDVVL6gHbdmbo7Qaekg=;
        b=jqz2FGg9lMBD3UEjKgRiMevf4Z/epIlFOV3Ws/lco6OXbNf6mQ99Q7TTtF7QuZH0kU
         1yOtnOld0ehAdwiHVSJWGIZ7e3g1hi2mWS8BouvYKMKynhPXXwCt737XWSGqUzFW8Gt3
         0TQmAln5aP/ncNTqbPoQP7MuqLb6rIW91GzdEEwKpPT2e1gt2U9ail+bceShv2WTLIj/
         F1k2u5qwBat7lE5Qs54gXiLtDrtbviGMiwe83AlNbmJJZ6d7y8Xody+x3rDZdXkJr2I7
         3AZR/Paf7+IxAU5WKg66whvZ1hXvDYQaDPUYk759uoKZOB7Elu1EXNVEtia2a0zr0Q5M
         hmEA==
X-Gm-Message-State: AOAM531prNxXs6gsaG5ahtmIg/bVTxBSoKraoOvgA7tsCTmJlAxSLrjj
	CGkoW0KTHAQh/sVIbV5J2t51rS2om8pJmA==
X-Google-Smtp-Source: ABdhPJxyVYxZ54mjUcDzQ7SwQPUyzhsSvymBIlpuDpJeYSVCmjwlFIVEdYGbw62FKPOv4Ko2ZdP69g==
X-Received: by 2002:a65:5342:: with SMTP id w2mr32527673pgr.333.1630509671084;
        Wed, 01 Sep 2021 08:21:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id r15sm326489pfh.45.2021.09.01.08.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 08:21:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/2] pipewire: Upgrade to 0.3.34
Date: Wed,  1 Sep 2021 08:21:07 -0700
Message-Id: <20210901152108.24811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable systemd user services as well as they are required for user
pipewire sessions

enable pw-cat which also needs sndfile enabled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb}   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.31.bb => pipewire_0.3.34.bb} (97%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
similarity index 97%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
index 1c18ba0328..33b5d88a2e 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.31.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.34.bb
@@ -11,7 +11,7 @@ SECTION = "multimedia"

 DEPENDS = "dbus"

-SRCREV = "c43dabcc96e2e072cdf08e5f094bb677d9017c6b"
+SRCREV = "1924c2c29824955b5e763f1def6967f68e403c7c"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"

 S = "${WORKDIR}/git"
@@ -46,7 +46,7 @@ USERADD_PARAM:${PN} = "--system --home / --no-create-home \
 EXTRA_OEMESON += " \
     -Daudiotestsrc=enabled \
     -Devl=disabled \
-    -Dsystemd-user-service=disabled \
+    -Dsystemd-user-service=enabled \
     -Dtests=disabled \
     -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
     -Dvideotestsrc=enabled \
@@ -54,12 +54,13 @@ EXTRA_OEMESON += " \
     -Dvulkan=disabled \
     -Dlibcamera=disabled \
     -Dman=disabled \
+    -Dpw-cat=enabled \
 "

 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa systemd', d)} \
-    gstreamer jack v4l2 \
+    gstreamer jack sndfile v4l2 \
 "

 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -250,6 +251,7 @@ FILES:${PN}-media-session = " \
     ${bindir}/pipewire-media-session \
     ${datadir}/pipewire/media-session.d/* \
     ${systemd_system_unitdir}/pipewire-media-session.service \
+    ${systemd_user_unitdir}/pipewire-media-session.service \
 "
 RPROVIDES:${PN}-media-session = "virtual-pipewire-sessionmanager"

--
2.33.0
