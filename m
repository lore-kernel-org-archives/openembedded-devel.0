Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.11390.1622894997622499979
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 05:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oE/3Sbc+;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id dj8so14240451edb.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 05:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vqt6F/w+Bfanjoh9zlDSi/o4ckcLLOOfspOfbAlu9/U=;
        b=oE/3Sbc+K6hzmTGdmJCo+spmPiC6X+us9xehSVxW5vCZPqi8+oawiMi8iM9qhnFujh
         RvcqPlPVq/wdiOlEzlCHVMxaXeOu0jTtPtfJY2WRyYSfmOaFmrZ9n6yxxlYxjt3pPOcI
         IfYgQMnrdyv0g90VcrQTF8a3W3NrF5yJHppsDIyDmndZvWWYrOHv/qHYbeOfUCAjQTSn
         zrlV9xtUdT2RlLhkB0KK4VEYvtEQcEaPqarA+DGA/XMAaEybtWU4ajIIUszZdYA40nLC
         fDLiP4dyU/MiK8eIFRgdbW7Sj8jf6w4gA6tOBcR1TzaqU8sXVCkI3P6yIyJtVhKxuDvY
         Y39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqt6F/w+Bfanjoh9zlDSi/o4ckcLLOOfspOfbAlu9/U=;
        b=iTfrHccwdtAqbmQhkXOhR/hbu/fhLKkrez625A5XHcp9CgSS0q0DhXFocj/2zCcm3f
         oFdab/WkiGBnyQ0EpKL3XtAfh9ZlUQNAZ9y300DwSTJz2MG20CsXPgFyyf67+Z0UuEfP
         UDTflEXmzpyBvXrzshLokDJR81kFRi4cCkxqHf2rZU2kJsvOfu0K0aoZQ7LjNxOPgxvF
         ZmmSQxYn7lMykSS4N2F//nSV6EDyUOygXL2YW0eoqH0EAZgzFLx6CEG66MJI9uPVuzIJ
         PstSd9bBZDHyVNh5mKLxDfenOf6oiZdBFAxQVPBO9dB070XjOOGH67E/jyk27QGkHiee
         KhXg==
X-Gm-Message-State: AOAM5311qECfl6DeoYOBwmIG4SXjPnHUi1MvZTLBftNmG8bi8nuUR0A/
	YP/IXMAmXFv/+JuQoeLX7jJ4jvckfnlaCw==
X-Google-Smtp-Source: ABdhPJwN94P/M1RBwHvEulNQqPzivLYkMHCSKZAxAlSpAvVv/uZoVMv3bojXai2CcH10sLRs1whHhw==
X-Received: by 2002:a05:6402:510e:: with SMTP id m14mr1724971edd.225.1622894996210;
        Sat, 05 Jun 2021 05:09:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d25sm3994489ejd.59.2021.06.05.05.09.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 05:09:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] pipewire: upgrade 0.3.24 -> 0.3.29
Date: Sat,  5 Jun 2021 14:09:40 +0200
Message-Id: <20210605120942.1080733-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605120942.1080733-1-schnitzeltony@gmail.com>
References: <20210605120942.1080733-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Due to 'stealing' from jack & pulseaudio the license was changed

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{pipewire_0.3.24.bb => pipewire_0.3.29.bb} | 33 ++++++++++---------
 1 file changed, 17 insertions(+), 16 deletions(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.24.bb => pipewire_0.3.29.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.24.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.24.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.bb
index 25c87d26d..6c52674ca 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.24.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.29.bb
@@ -2,16 +2,16 @@ SUMMARY = "Multimedia processing server for Linux"
 DESCRIPTION = "Linux server for handling and routing audio and video streams between applications and multimedia I/O devices"
 HOMEPAGE = "https://pipewire.org/"
 BUGTRACKER  = "https://gitlab.freedesktop.org/pipewire/pipewire/issues"
-LICENSE = "MIT"
+LICENSE = "MIT & LGPL-2.1-or-later & GPL-2.0-only"
 LIC_FILES_CHKSUM = " \
-    file://LICENSE;md5=e2c0b7d86d04e716a3c4c9ab34260e69 \
+    file://LICENSE;md5=2158739e172e58dc9ab1bdd2d6ec9c72 \
     file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
 "
 SECTION = "multimedia"
 
 DEPENDS = "dbus"
 
-SRCREV = "c81d44e8a9497899d01bcc3054b6aa845e7a066e"
+SRCREV = "1b484867eb20dbcf9ffea812834fc9142f89f652"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
@@ -91,7 +91,7 @@ remove_unused_installed_files() {
     # Remove it if pipewire-jack is not built to avoid creating the
     # pipewire-jack package.
     if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', 'true', d)}; then
-        rm -f "${D}${sysconfdir}/pipewire/jack.conf"
+        rm -f "${D}${datadir}/pipewire/jack.conf"
     fi
 }
 
@@ -189,9 +189,10 @@ PACKAGES =+ "\
 PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
 
 SYSTEMD_SERVICE_${PN} = "pipewire.service"
-CONFFILES_${PN} += "${sysconfdir}/pipewire/pipewire.conf"
+CONFFILES_${PN} += "${datadir}/pipewire/pipewire.conf"
 FILES_${PN} = " \
-    ${sysconfdir}/pipewire/pipewire.conf \
+    ${datadir}/pipewire/pipewire.conf \
+    ${datadir}/pipewire/filter-chain \
     ${systemd_user_unitdir}/pipewire.* \
     ${bindir}/pipewire \
 "
@@ -200,9 +201,9 @@ FILES_${PN}-dev += " \
     ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
 "
 
-CONFFILES_libpipewire += "${sysconfdir}/pipewire/client.conf"
+CONFFILES_libpipewire += "${datadir}/pipewire/client.conf"
 FILES_libpipewire = " \
-    ${sysconfdir}/pipewire/client.conf \
+    ${datadir}/pipewire/client.conf \
     ${libdir}/libpipewire-*.so.* \
 "
 # Add the bare minimum modules and plugins required to be able
@@ -220,9 +221,9 @@ FILES_${PN}-tools = " \
 # This is a shim daemon that is intended to be used as a
 # drop-in PulseAudio replacement, providing a pulseaudio-compatible
 # socket that can be used by applications that use libpulse.
-CONFFILES_${PN}-pulse += "${sysconfdir}/pipewire/pipewire-pulse.conf"
+CONFFILES_${PN}-pulse += "${datadir}/pipewire/pipewire-pulse.conf"
 FILES_${PN}-pulse = " \
-    ${sysconfdir}/pipewire/pipewire-pulse.conf \
+    ${datadir}/pipewire/pipewire-pulse.conf \
     ${systemd_user_unitdir}/pipewire-pulse.* \
     ${bindir}/pipewire-pulse \
 "
@@ -237,18 +238,18 @@ FILES_${PN}-alsa = "\
 "
 
 # jack drop-in libraries to redirect audio to pipewire
-CONFFILES_${PN}-jack = "${sysconfdir}/pipewire/jack.conf"
+CONFFILES_${PN}-jack = "${datadir}/pipewire/jack.conf"
 FILES_${PN}-jack = "\
-    ${sysconfdir}/pipewire/jack.conf \
+    ${datadir}/pipewire/jack.conf \
     ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
 "
 
 # Example session manager. Not intended for use in production.
-CONFFILES_${PN}-media-session = "${sysconfdir}/pipewire/media-session.d/*"
+CONFFILES_${PN}-media-session = "${datadir}/pipewire/media-session.d/*"
 SYSTEMD_SERVICE_${PN}-media-session = "pipewire-media-session.service"
 FILES_${PN}-media-session = " \
     ${bindir}/pipewire-media-session \
-    ${sysconfdir}/pipewire/media-session.d/* \
+    ${datadir}/pipewire/media-session.d/* \
     ${systemd_system_unitdir}/pipewire-media-session.service \
 "
 RPROVIDES_${PN}-media-session = "virtual/pipewire-sessionmanager"
@@ -265,9 +266,9 @@ FILES_${PN}-spa-tools = " \
 FILES_${PN}-modules = ""
 RRECOMMENDS_${PN}-modules += "${PN}-modules-meta"
 
-CONFFILES_${PN}-modules-rtkit = "${sysconfdir}/pipewire/client-rt.conf"
+CONFFILES_${PN}-modules-rtkit = "${datadir}/pipewire/client-rt.conf"
 FILES_${PN}-modules-rtkit += " \
-    ${sysconfdir}/pipewire/client-rt.conf \
+    ${datadir}/pipewire/client-rt.conf \
     "
 
 FILES_${PN}-alsa-card-profile = " \
-- 
2.31.1

