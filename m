Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.48773.1591047951209902801
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VVDke5Od;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id x6so1269087wrm.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yCJ6RRIpEAflGKinTc69Je8642c3SEcmTXxwtmDdjio=;
        b=VVDke5OdI++oJ8kayqLHhElo7xU96k37esPmWaXs1pJzoAV2EWEELAXp4A2la5gEPX
         6yIyAWLy6ADRqpckCNDL0x4cJ6a2ClBpdrTWyQXxIo8sKY2QzSM5E445z0He6Z6Gv02g
         fDwR6mT3m8WMauuvwqXxMuRTaHrnbzyrdzzXa5YPV7kD7nH1Km0W1WKOilKCznSHTe1p
         88vazWX6u6rNuzvIYOHlui5fVvW6XKp7deA9Blw7c31dpuN+IZdc6o2mbYhMHPNtc/Rc
         qPs+QzK9YU+rSBC1DGPqtaoWIJg+e3SGQJD29t96CQ6J8sWrlA8LYcyRN9tYDwJ38TB4
         RvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCJ6RRIpEAflGKinTc69Je8642c3SEcmTXxwtmDdjio=;
        b=QFYHi0yNY/WT746rzBkKjBH4wAKxp3QJ8Emy1p6ZIgf2mSZYESBoYLL5xeXsi1ZOCT
         RHvDd/aQSNCw4PbUoL+CFBQvfW/2IU+nVoMJqetu42+5biI3oW00d4h79rzn3Pvit/pY
         6CnVkSHi2JD2sM04SP1AaiMETlOGOpf/6/HzVO8Ztcqq65MmmOak0mOGuAkRvSoGtqQY
         KbiWmdKiHtP2niMX4vBcAxC4Znwn79hPrZU/tSn+s2hQRgkW8kBj1ik8NFuMsgNVVRzK
         7bNpaoyM1Ld7imPbuXf8DjpNflqq07dxl9Gu7nQM7y81SXOVfb4GhBgQ8o1XpizE7J00
         KSYg==
X-Gm-Message-State: AOAM530MoYQh49KTymS/df7QhQQoaXlX3sgFouBTz+zQerFFaa6EeMsZ
	wC5FEJdrrc5fIyEvMibo6I6PaYaDSzc=
X-Google-Smtp-Source: ABdhPJxmiR2wrwJ1vFG/2E2REeIJ5jtIxsyB0VlSWFk5hS+9AmwpQgMRcaCoAJwrzxbT8/dsrrh3lg==
X-Received: by 2002:adf:f907:: with SMTP id b7mr24114827wrr.203.1591047949432;
        Mon, 01 Jun 2020 14:45:49 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:48 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 22/38] gnome-flashback: upgrade 3.34.2 -> 3.36.3
Date: Mon,  1 Jun 2020 23:45:00 +0200
Message-Id: <20200601214516.26624-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 3.36.3
==============
- Fix enum type generation. (#52)

Version 3.36.2
==============
- Fix screensaver unlock problems. (#46)
- Fix few small memory leaks.
- Fix screenshot saving to clipboard. (#50)
- Active desktop icon rename with F2 key. (LP:#1875703)
- Fix creating new desktop icons. (LP:#1875317)
- Updated translations.

Version 3.36.1
==============
- Disable unimplemented icon placement modes. (#41)
- Fix lock screen button in end session dialog. (#43)
- Exclude Extensions application from menu. (#42)
- Fix visibility of input source button in lock screen. (#45)
- Do no close/destroy desktop window. (gnome-applets#15)
- Fix use after free in System Indicators. (gnome-panel#21)

Version 3.36.0
==============
- Save screenshot to clipboard when filename is empty.
- Show password box on key presses. (#36)
- Fix system indicators localisation. (#39)
- Fix build with gettext 0.20+. (!25)
- Add UsbProtection plugin to required components.
- Disable screen locking without PAM configuration file. (#38)
- Updated translations.

Version 3.35.2
==============
- Add Yaru as supported theme. (#31)
- Screensaver based on gnome-screensaver. (#18)
- Fix crash and memory leaks in notifications module.
- New system indicators applet for gnome-panel.
- Install gnome panel layout for GNOME Flashback session.
- Updated translations.

Version 3.35.1
==============
- Remove desktop-background module.
- Add root-background module, disabled by default.
- Add new desktop module for icons and background. (#7)
- Install compiz configuration. (!16)
- Add support for shift_caps_switch XKB option. (#24)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...flashback_3.34.2.bb => gnome-flashback_3.36.3.bb} | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-flashback/{gnome-flashback_3.34.2.bb => gnome-flashback_3.36.3.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.36.3.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.36.3.bb
index 3da8629c6..6dd989415 100644
--- a/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-flashback/gnome-flashback_3.36.3.bb
@@ -12,12 +12,14 @@ DEPENDS += " \
     libxkbfile \
     polkit \
     metacity \
+    gdm \
     gnome-desktop3 \
     gnome-bluetooth \
+    gnome-panel \
 "
 
-SRC_URI[archive.md5sum] = "251b51bad322c41d34d06fdb8f1799d4"
-SRC_URI[archive.sha256sum] = "3be65388cd2c8f39741bcc05da87ef40035183a9a39502d67696242c2aeb469c"
+SRC_URI[archive.md5sum] = "690b0d78c7d9265183ef18387b12fa50"
+SRC_URI[archive.sha256sum] = "2dba9ea40f2da81c22954a8ccc29f8f1fa4ca8395a6bb552506635832751c1a7"
 
 do_install_append() {
     # no oe-layer has compiz -> remove dead session
@@ -25,10 +27,12 @@ do_install_append() {
 }
 
 FILES_${PN} += " \
-    ${datadir}/xsessions \
     ${datadir}/desktop-directories \
+    ${datadir}/gnome-panel \
     ${datadir}/gnome-session \
+    ${datadir}/xsessions \
+    ${libdir}/gnome-panel \
     ${systemd_user_unitdir} \
 "
 
-RDEPENDS_${PN} += "metacity gnome-panel"
+RDEPENDS_${PN} += "metacity"
-- 
2.21.3

