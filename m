Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.10040.1599005370792625471
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 17:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Be2GceZ2;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id gf14so1405435pjb.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 17:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ORT90AiotbKdc9SrOpxWxpXPM8IKqwczu4kp0tqX0Lc=;
        b=Be2GceZ213eqROSTbteie6CKyvj1xURm27WaO39H3qr+dAXqQuj24cDlJcmLw+a51a
         gtG+y3nrqGo7MDzfEpYhRBQ1NSaIKAG9r0Gv5hRVhgbGI7+mcEl80VuM1u37lguM4pw9
         IBvDle9KHRgVO7+SwNIb6KdfgEllBkbS9mdKbQwH28OfwlOHozPK6r6jNBaiFzv0OTg2
         OsUwGecwnVQkYeanyirlptt29WJJyEV8QoZpSUdcYtS6kwUvssGhlbjNAImTtlIVlDFe
         AvQghMgg+5JoI6DsIXA5Q+id9kK8bIapGT9dmfPTGNtMqdBKCqC4SsfQtTKvv2KpXoCT
         djuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ORT90AiotbKdc9SrOpxWxpXPM8IKqwczu4kp0tqX0Lc=;
        b=Ams/Mba+q0qdCkqoSTVQlsQJRKxjZXEHjgCsWzsAESIzoQy3cQBYzY29bQOK5Nas8E
         vomL3oEbp3ckYHTPiRWMQ1e0/EXKHTMd9SSerLIFFMMOnGQ1VeUEMVnN9s1FDxBQ7HLO
         fhDXP9k+GpCqqOG1eaTtotltADX2Z/C4CBwekWe5Lf7BF+Uy5Yy6HTLQ7xhb4R0dYM9f
         ewXBiRAzuIYXOSZMAu3uxxFSIYEzVtymOZ+KRl36UiUn9ifzRqVbITOinvIaoR/aExnZ
         2qw0cXdmUOH8erp0RGqcyWTSUPaKEOp8vFeFXYLzYoPxoOUqQpItpRJ5E3QsWykt9rSb
         TXQw==
X-Gm-Message-State: AOAM533UR3k5j4gPyyrgifl+smL2l8a7nBurAYmdKzsw3slpmcDGe5bU
	jFYgZu//KFlv+gOgo8kkvvqxUJ/6pVqR9A==
X-Google-Smtp-Source: ABdhPJzNHclFP9oukhXBkzY1Eg8KNy0dAaMfHwEuzy30dvUR0rOMlAcei/J6JWbp3yXTCFkVBF6dNw==
X-Received: by 2002:a17:902:aa41:: with SMTP id c1mr3719427plr.224.1599005370016;
        Tue, 01 Sep 2020 17:09:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e89d])
        by smtp.gmail.com with ESMTPSA id gt13sm2511218pjb.43.2020.09.01.17.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 17:09:29 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] packagegroup-meta-multimedia: Add new recipes
Date: Tue,  1 Sep 2020 17:09:25 -0700
Message-Id: <20200902000926.2271220-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902000926.2271220-1-raj.khem@gmail.com>
References: <20200902000926.2271220-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Re-arrange to make one line per package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-meta-multimedia.bb           | 97 ++++++++++++++-----
 1 file changed, 75 insertions(+), 22 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index e0cb415e3b..7de9fce86a 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -20,33 +20,86 @@ RDEPENDS_packagegroup-meta-multimedia = "\
 "
 
 RDEPENDS_packagegroup-meta-multimedia = "\
-    libdvbpsi libdc1394 gstd gst-shark \
-    bigbuckbunny-720p tearsofsteel-1080p bigbuckbunny-1080p bigbuckbunny-480p \
-    openal-soft dleyna-core dleyna-renderer dleyna-server dleyna-connector-dbus \
-    alsa-equal libdvdnav libmusicbrainz tinyalsa \
-    fluidsynth cdparanoia vorbis-tools tremor caps libao libavc1394 \
-    opusfile gerbera libdvdcss webrtc-audio-processing \
-    rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
-    ncmpc libmpd dcadec libiec61883 \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna vlc", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "streamripper", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "openh264 opencore-amr faac vo-amrwbenc", "", d)} \
-    "
+    alsa-equal \
+    caps \
+    cdparanoia \
+    dcadec \
+    dleyna-connector-dbus \
+    dleyna-core \
+    dleyna-renderer \
+    dleyna-server \
+    dvb-apps \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "faac", "", d)} \
+    fdk-aac \
+    gerbera \
+    libao \
+    libavc1394 \
+    libdc1394 \
+    libdvbpsi \
+    libdvdnav \
+    libiec61883 \
+    fluidsynth \
+    libmusicbrainz \
+    libmpdclient \
+    mpc \
+    mpd \
+    ncmpc \
+    libmpd \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "opencore-amr vo-aacenc vo-amrwbenc", "", d)} \
+    gst-shark \
+    gstd \
+    rtmpdump \
+    bigbuckbunny-1080p \
+    bigbuckbunny-480p \
+    bigbuckbunny-720p \
+    tearsofsteel-1080p \
+    schroedinger \
+    projucer \
+    libcamera \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libde265 openh264", "", d)} \
+    vorbis-tools \
+    libdvbcsa \
+    libopenmpt \
+    mimic \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna", "", d)} \
+    mycroft \
+    openal-soft \
+    opusfile \
+    libdvdcss \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vlc", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "sox streamripper", "", d)} \
+    tinyalsa \
+    tremor \
+    webrtc-audio-processing \
+    ${@bb.utils.contains_any("TRANSLATED_TARGET_ARCH", "i586 x86-64", "x265", "", d)} \
+"
 
 RDEPENDS_packagegroup-meta-multimedia-connectivity = "\
-    rygel gupnp gupnp-igd gssdp gupnp-dlna gupnp-av libupnp \
+    gssdp \
+    gupnp-av \
+    gupnp-dlna \
+    gupnp-igd \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gupnp-tools", "", d)} \
-    "
-
+    gupnp \
+    libupnp \
+    rygel \
+"
 RDEPENDS_packagegroup-meta-multimedia-dvb = "\
-    oscam "
+    oscam \
+    tvheadend \
+"
 
 RDEPENDS_packagegroup-meta-multimedia-mkv = "\
-    libmatroska libebml \
-    "
+    libebml \
+    libmatroska \
+"
 
 RDEPENDS_packagegroup-meta-multimedia-support = "\
-    libmediaart libmediaart-2.0 gst-instruments libsrtp crossguid \
-    "
+    crossguid \
+    libmediaart-2.0 \
+    libmediaart \
+    gst-instruments \
+    libsrtp \
+"
+# devel headers/libraries only packages
+# libsquish
-- 
2.28.0

