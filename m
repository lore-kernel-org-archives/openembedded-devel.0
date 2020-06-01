Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.48707.1591047967021808556
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CHIwcWUV;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id e1so1321258wrt.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a4ebZ1oVG+ToqQFWRo3oLvz40cDzsEKQUkhk06SqLqo=;
        b=CHIwcWUVGRp6wjAf1823TXruthh8L0w8Ts99ZRlmR2uW0ylgndEF7e0AvkTxCLTE0H
         X62z4AUi1aWkM05/0EojTj88Nyx4rzbpznk1OqtdRRRgbCsxj25LbIqNqmx7UyJV/UdX
         KQGTJ827ovL4LlhTztyvYcFIkmhK4VW0kkDHMrhXCTXa1tmnnF0ti2+ho53SNj4gbRrM
         latzddNyxiNh0OXQk7iRa3Hnw00X1T5N8oxJ0B1ABnP39yuSxSlhwMX61I483uinEoi2
         cWY9m4vC7LlJS2xWv9ZrGzIL55DTBy6lW06kFAfamLs9ZkfrCcDv1Q0eD4M1OIyKHSoB
         U04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a4ebZ1oVG+ToqQFWRo3oLvz40cDzsEKQUkhk06SqLqo=;
        b=FJaAqhI+IordYjJ0WuuzbHZeIeJUbfBQmRvScHsHJWMVGT55m7GxzvqSR/aiSmy+kT
         2+BFmnwaZagNmN+JVYEZI536tTDDiAccvbGNjINGnQ9qfAPcaq6YNrWO950X83d+as7t
         mI946DEbDcuKaFMupvmk8Sz8Cn50/fKphwtSG4tv+yUmpddokhtHr7n/QUtEbPs7/dQo
         6Hwqv5wcMgetJ2mqG30IW3iq29lwcI487NYwqNLpl1VFwsBRsXjnltODh3ps6NyJMtXf
         JIOcDnoBoJ56PBllcb8OYnSQAf1dMnkHOAvQLxBRMBRvOjQ+MQvCKpUcJrs4cxlNaSC2
         dVqw==
X-Gm-Message-State: AOAM532CjMC9Ox9zHPf9xRArgsycEyCba/f/q/+DtuLYcLcvr9FCSa3g
	DFTuBMuj33WonDvgSetz/Q/3SEPmaQE=
X-Google-Smtp-Source: ABdhPJyKqlKkWtovSVLAooaYqnJ2UaHQ17tH4Y3Hs+fTz++XZO8cLlwmGxalcX8OtWbqElBAFeBhNg==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr25420067wrt.56.1591047965303;
        Mon, 01 Jun 2020 14:46:05 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.46.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:46:04 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 38/38] gnome-control-center: upgrade 3.34.5 -> 3.36.2
Date: Mon,  1 Jun 2020 23:45:16 +0200
Message-Id: <20200601214516.26624-39-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

================
Version 3.36.2
================

- Updated translations

CI
- Update Flatpak libnma, mobile-broadband-provider-info, libhandy build depends

Applications
- Fix only connected snap interfaces showing

Background
- Allow adding multiple files to backgrounds

Printers
- Add whitespace between top right buttons

Sharing
- Set label for checkbox properly

Sound
- Fix translation of "System Sounds"

Info:
- Verify data coming from switcheroo-control

================
Version 3.36.1
================

- Update man page for info panel change
- Updated translations

Display
- Fix resolution options getting stuck in a low resolution

Sound
- Remove unused files

================
Version 3.35.92
================

- Updated translations

Applications
- Update icon

Background
- Remove split desktop and lock screen wallpapers
- Improve visuals of the background icons

Network
- Make VPN gear buttons consistent with oter buttons

================
Version 3.35.91
================

- Share GCancellable code
- Updated translations

Background
- Remove unused GCancellable

Power
- Fix mobile broadband switch logic

Sharing
- Remember password on remote desktop sharing

Thunderbolt
- Fix GCancellable leak

User Accounts
- Always generate user avatars

================
Version 3.35.90
================

- New sidebar panel order and grouping
- Introduce CcPermissionInfoBar
- More code style updates
- Updated translations

Applications
- Add "Run in Background" switch
- Add "Set Desktop Background" switch
- Show snap packages

Network
- Add SAE support
- Many code refactorings
- Switch to use GtkTemplate

Power
- Hide power button the chassis is handset

Printers
- Use CcPermissionInfoBar

Region & Language
- New design for the Formats dialog

User Accounts
- Use CcPermissionInfoBar
- Improved layout

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Add-meson-option-to-pass-sysroot.patch               | 2 +-
 ...ontrol-center_3.34.5.bb => gnome-control-center_3.36.2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.34.5.bb => gnome-control-center_3.36.2.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
index 7f82a152c..8170f514e 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
@@ -26,7 +26,7 @@ index a347168..2cd8121 100644
 +option('oe_sysroot', type: 'string', value: '', description: 'Directory for OE-sysroot')
  option('cheese', type: 'boolean', value: true, description: 'build with cheese webcam support')
  option('documentation', type: 'boolean', value: false, description: 'build documentation')
- option('gnome_session_libexecdir', type: 'string', value: '', description: 'Directory for gnome-session\'s libexecdir')
+ option('ibus', type: 'boolean', value: true, description: 'build with IBus support')
 diff --git a/panels/background/meson.build b/panels/background/meson.build
 index bb34b69..f22722e 100644
 --- a/panels/background/meson.build
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.2.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.5.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.2.bb
index bf8ec3355..d3673a1fd 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.36.2.bb
@@ -30,8 +30,8 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
-SRC_URI[archive.md5sum] = "ca92151a2a58cc3e0a73e88379e96ce2"
-SRC_URI[archive.sha256sum] = "b30d0afb99252f150e37d5ca4bc83b89bf4aa6d18c5d367230053278634e0c47"
+SRC_URI[archive.md5sum] = "45832b7217c8d5fa5e2dbc214972c12d"
+SRC_URI[archive.sha256sum] = "e0a5eff0c6d6c22db0c54fd070460de874d367ef3f9072e1559b70f28b847817"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-- 
2.21.3

