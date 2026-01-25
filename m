Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D523EE63C94
	for <webhook@archiver.kernel.org>; Sun, 25 Jan 2026 07:40:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35215.1769326810524681177
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jan 2026 23:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fjZ0DeWh;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so51013185e9.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 23:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769326809; x=1769931609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lEiicRLMkGPhoIOZUs8AzHUyaWLe/JZ0PKXCJuS2S90=;
        b=fjZ0DeWh9Z7e6Mle78pu9hsXl/4uymoceRv4c6cqwVLq8BEYRB5V7IiwEviGZ4gdEk
         UID3KurA+k74oSNq/GXezfpA96pljgyC8TqYGjRzZRx0bLb/rFvLaYTLBNk4mIjRs0sJ
         dIxM5CTUY9e5yKDfJs89c6zmXer9WuZhPbkdQOS2/HaiYrchcn64PiOCVDkTQeUGJS9G
         izrEoVpmcuNuDPeYBKEbhCt9fD3BKy7WYWu+x/b2UwIuv06XbDbxg5D6jg75TWQ/wcvd
         plEXdEFipVNvHoHCLD9uDoQbykzb6ydK0/5Eu81o3OTcT4/TgYxs9pwHtZGEpEJdpYM+
         N+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769326809; x=1769931609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lEiicRLMkGPhoIOZUs8AzHUyaWLe/JZ0PKXCJuS2S90=;
        b=QXNGd/5mq/djWAVP91FSD7mU30JtEFUzpvWnMyLjgrkNbQ79IF9+p2erPGu400YhC3
         CoTwxH0AHhK6pJWgypl764eUf084dWsfNUoLzRRe9gQCoASTbPbKEjxcCwf2Buzt/2I5
         00f26RW+iqqRyGuXWPknx2imBGg6gL/pkJD/gIoMVX3rlGjP0PJ89HLaTk1hUtpPpIGr
         XSzJpFENKXqtZMMpsd5ogGGR6Q0OoHYVzeZrVwgAkLLi0+1njMZXN9Zx9O8fCGRIb+Ko
         6R7d1h5ATc8M9995vcaVMRn42Ira7sv0u3vvHkCpwF3WRgGqP/+z598Cidtr21KbCkzl
         rKeg==
X-Gm-Message-State: AOJu0YwUNSZlJnJ8zVkTzWeQpiGS4me5SJm9MfUjWEyO52hYjHR1XTjs
	yplga9fJkENvRLEDJY/Z1giLl/1ys860oz9wU5ycIAVCOXGKlNmPSFOn6Jopow==
X-Gm-Gg: AZuq6aICvezqzevmV+rwcGvvZx1B2yysrOcG0TivfTxLoeM1T9sr6inD+nrQEvhUxBA
	U14DYpzKZ90drZFf7HQo3ZvjAI8xPKO0qcsXiISj0JeB7JZXk6P0nQsNra67Ce0iyMDpYnauCbA
	yx2v/OA5GgNW86jVcPCV//OLRNa23OuLcHP6vmX4+jraYLAS8e+fOXqGANZsSK+XvKSAw/M3T4u
	Yc7Wq/Yn0kUVnyxn++iVetqL0Yx71ybvqXGoU+DFYE3eedvaqtDUk/L6dM8h9c5NkaD48gjqhMN
	VRXAwdCaNLDuPe0DEVIlG8tFcEy1xUwtOfIWK9097zPX7/nl2SViBgUta6r1SrzIMB/B93CesE2
	HDr+ag+H2QDd3liDMfzVDLIo99digiZNS/eku6KgMF8XJMQ1YquDOGmNOSSpW6kMe/i0cIFgM1N
	olxWWiuUxy5gsFdFsHt74=
X-Received: by 2002:a05:6000:3109:b0:432:c0e6:cfda with SMTP id ffacd0b85a97d-435ca051defmr1360917f8f.7.1769326808516;
        Sat, 24 Jan 2026 23:40:08 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e7156dsm20265542f8f.20.2026.01.24.23.40.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 23:40:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 4/5] gnome-control-center: upgrade 42.0 -> 42.10
Date: Sun, 25 Jan 2026 08:40:05 +0100
Message-ID: <20260125074006.244692-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125074006.244692-1-skandigraun@gmail.com>
References: <20260125074006.244692-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 07:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123835

These are bugfix releases.

(Note that there were no 42.6, 42.7 and 42.8 tags)

================
Version 42.10
================

- Fix monitor order in display settings
- Add 32:9 aspect ration in display settings
- Fix warning in user  panel in initialization of avatar widget
- Updated translations

================
Version 42.9
================

- Updated translations

Network:
- Fix possible race in tests

================
Version 42.5
================

- Updated translations
- Added various accessibility labels
- Initialize locale early

About
- Don't load version.xml info we don't use

Applications
- Don't recurse into symlinks when clearing app cache

Color
- Fix crash when there's no device rows to show

Cellular
- Improve dbus error messaging
- Handle cases when SIM ID is not present
- Prevent duplicate entries in the SIM providers list

Keyboard
- Fix activation of input source toggle button
- Fix permission_acquired always returning FALSE

Mouse
- Set rows as actiavatable widgets

Network
- Fix crashes when EAP password is missing
- Fix wrong signal of SEA password visibility toggle
- Prevent crash when disconnecting wifi device
- Use mime-types for file chooser filtering TLS files

Online Accounts
- Fix crash when failing to find GOA helper executable

Power
- Prevent terminal from getting spammed with ALS logs

Printers
- Fix loading of UI resources
- Show empty-state when removing the last printer

Region
- Fix creating rows for locales without a country
- Fix critical when changing language
- Fix permission_acquired always returning FALSE

Search
- Fix reordering of list rows

Users
- Show a fallback avatar when failing to load one

Wifi
- Allow accessing settings of known wifi networks

================
Version 42.4
================

- Updated translations

Background
- Restore support for multiple file selection
- Allow more image formats

Display
- Fix primary monitor selection

Network
- Fix network profiles shown on wrong device
- Various crash fixes

Power
- Fix blank-screen settings not applying
- Fix "Power Button Behavior" setting not applying

User Accounts
- Disconnect fingerprint reading devices when closing dialog

Sharing
- Don't set remote-desktop password entry if pw_generate fails
- Don't assert if we can't find the widget for a profile

================
Version 42.3
================

- Updated translations

Display
- Use virtual clone modes when mirroring

Network
- Prevent crash by disconnecting device.
- Fix Wi-Fi network with "&" in name not appearing.
- Fix warning when panel closed.

================
Version 42.2
================

- Updated translations

Applications
- Fix Snap permissions support failing to compile
- Fix CcInfoRow having the wrong parent
- Fix crash crash when switching between two apps

Background
- Make sure the size of the light/dark previews are the same

Keyboard
- Fix crash resetting all keyboard shortcuts

Network:
- Stop freeze when closing wired connection properties with Escape

Sharing
- Fix close button on Verify Encryption dialog
- Turn off RDP gsettings key when turning off RDP

Shell
- Initialise locale early

Sound
- Update theme correctly so other apps respond to change

================
Version 42.1
================

- Updated translations

Display
- Various small behavior improvements
- Fix monitor labels

Network
- Improve handling of VPN connections

Online Accounts
- Fix behavior of helper application on X11
- Fix changes to online accounts services not applying correctly

User Accounts
- Various small polishments

Wacom
- Properly translate various strings

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ome-control-center_42.0.bb => gnome-control-center_42.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_42.0.bb => gnome-control-center_42.10.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.10.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.10.bb
index 6fe999a191..76a982f77c 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.10.bb
@@ -31,7 +31,7 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
-SRC_URI[archive.sha256sum] = "0732efa7c4171ce0a0ed4106580b4ce35a57b10152c0ea36d239134913777eda"
+SRC_URI[archive.sha256sum] = "ad824e10bb5231b70cd65903a12752d362b9099b0c90aba346a6983e0a4f6d5a"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"

