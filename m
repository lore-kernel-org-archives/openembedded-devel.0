Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BA6FD377E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 18:34:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52504.1772044442129917038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 10:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K2bujqo+;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso593135e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 10:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772044440; x=1772649240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=isBLvOtDwvshhCbo4TU/eaCSk+LOSey1/3dxwrgL31w=;
        b=K2bujqo+9GU2kGuP1I5gea1V72vD7yYgvnvNU6X2ZgIq/QpkBMNy/QFRYmr1orjzDs
         ZxMJXO9RY+zoDKrl0q1LSdZnPE+CNn7JuRfdXciX3vkUlc14d98LxY47r24eGl0AZIZo
         xf4k5sEBYgbic7qB5L1dhLhcVOcG7+YeNA1ZY9b2Ipny0byY0H5EmbyQ/GtxA4AjZgwN
         XIZF8Wiwj0MYpRfQ0fSXlMaiLurPP/+pY6gGVWrkiJ7WUnG1mJjqiZLa7r/CfH6fEsS2
         Lnjz74txPza/aPyPXk3X4jpFh6uIDkd87kZjiA5k+i/ZD8i5eKQlgs5yAqB12fnJ9ndb
         Mj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044440; x=1772649240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isBLvOtDwvshhCbo4TU/eaCSk+LOSey1/3dxwrgL31w=;
        b=qbnMROAu6N9hPfPzzVfvxalAE/d+b+zvLLEqtCZLJFtS+dw+MNQPZD1BqU+chFTw6r
         +c5aVPVT96YWRPQJmiZQ3kCxkSK/IwaZ2quauke+5nnTTHXfW2Ej2snIJ0sRH5QFjzzF
         TofKCrV3OjiLEsjVXL1hgU+p76B/EvrrtESLYxLL+m8vciWKkBi8l0OLbuEwpEbbC/zP
         pFZQ1Zh7bnwwy1RR+mG122ODSgJhOxE9dhwqqyAJb0lUhFMY8OxJ5Fcu67EQ1kHdebJl
         lBHxkfbq+n2Lea0JyA2b15Psu8hmo0aKmhZw6Xy5QL3JA7Hc7lmxgCTDU2ZYhWrqqY9t
         NhVA==
X-Gm-Message-State: AOJu0YxVdtxxnjPaT9xf+aGtxsLIvkC1QqP+O2gRMK9NU/0jlDj8O1yn
	SAvRP4pX8hRIy4W6jBfDVWBMJYPSkFJaEjI3qy6hxzQXmAD39NK6N3eMS53OAA==
X-Gm-Gg: ATEYQzylNdIjS+5SaS+Mfn6jBRX3Pq4kIyyX6neWGVbZYqHQebL/6X9f4tftjS/F+yc
	LA8cSquPriBe1qmu6Ltv1shs4ryXNnKxrcg9mcrnvi3d88EtosBAdjpqmBRQPYLyZwFywyGj2u+
	VOH9R63qIz+H+AgtrSeh7ni6n+tgTx1VUcYHx1fhHe9vtQpy0yIK/1p2uMVJ3PdD6+yW6zXGdNx
	WvnyudjWRl5WxHcoi/gdKsWCKg9fUBlgMMOU9L1hRNxR7WPUFfaH1rXEXA7Jb5ebQUJgRkEBduw
	4N/G6gBg6rmmXxi8WxjjzCC6WIe/ZF4bEs+E9sk34VfVZL8ONAh89oNSlsJb5OubzvSH2J5TLAW
	KEReQzhC33I62Orvxyk4Z025GxcfL2uG0YZjgZ/XQuMFAzM1PiJeibYVqGqINuTebpzuvjG5CUh
	L5Sg3LJrP6TWZWgBm7oXfK
X-Received: by 2002:a05:600c:8719:b0:47e:e807:a05a with SMTP id 5b1f17b1804b1-483c21b6a1emr22654075e9.33.1772044440174;
        Wed, 25 Feb 2026 10:34:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd72bd66sm81369835e9.11.2026.02.25.10.33.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:33:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] remmina: upgrade 1.4.36 -> 1.4.43
Date: Wed, 25 Feb 2026 19:33:58 +0100
Message-ID: <20260225183358.576071-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 18:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124657

While touching this recipe, also switch to FreeRDP3 dependency,
which is still maintained, opposed to v2.

Changelogs:
https://gitlab.com/Remmina/Remmina/-/releases

1.4.43:
Add minimal macOS build support
Revert "Added kerberos-config plug"
Fix issue preventing SPICE plugin from being loaded
Do not calculate monitor shift if using freerdp_settings_set_monitor_def_array_sorted

1.4.42:
add option to enforce IPvX preference
Fix ssh x11 forwarding crashing in nixos
Add support for smartcard authentication
Add option to delay floating toolbar popup
Update FreeRDP checks to newer version
Fix typo
Update AppStream metadata !2684
update ffmpeg
Create named SPICE connection
Fix session stuck problem with KeePassXC
default dynamic resolution when supported issue
toolbar disappearance in some multi-monitor situations
Enable AAD support in Flatpak build
Create viewonly mode button on rcw toolbar
Permit css customization in scrolled window mode
src/remmina_ssh.c: zero-initialize RemminaSFTP structs
[plugins/rdp] fix memory leaks
Strip whitespace from quickconnect
[cmake] mark include_directories SYSTEM
[rdp] fix FreeRDP_MonitorLocalShift[XY]
fix various compiler warnings
UI: move view_toggle_button on the left
bug: double free on remmina_string_array_free
run update-translations.sh
Avoid Gettext incorrectly considering c-format
Disable save password prompt on quick connect authentication prompts
fix UB when connecting by link-local address
Added kerberos-tickets plug
Added kerberos-config plug
Fix floating toolbar popup regression in multimonitor

1.4.41:
Update keyboard mapping
Fix segfault that could happen when attempting to save a connection profile
Add ifdef to allow compilation without libssh
Add environment variable to prevent openssl config issue
Update snap to latest FreeRDP version
Toggle sending null or empty password when field is left blank
Add checks to allow FreeRDP2 compatibility
Fix KeyStroke function for SPICE plugin
Raise max length of username field to 300 from 100
Allow use of ssh command line arguments to create ssh connections
Fix use of default_value in remmina_file_get_int
Implement VNC connection timeout
Fix warnings
Prevent crash when pasting an image using RDP if gdk_pixbuf_save_to_buffer fails
Properly save and load color themes !2662
Fix Flatpak crash when moving floating tool bar
Save unlock password when set outside of the preferences menu
Update CMAKE_PREFIX_PATH in snapcraft.yaml
Properly implement keyboard interactive ssh authentication
Made hiding connection profile name on floating toolbar optional
Add a local terminal plugin
Allow Flatpak build to run commands
Allow users to connect to multiple connections or groups of connects at once
Create autostart directory if it does not exist.
Fix autostart directory create for flatpak.
Python Wrapper plugin: Fix typo + add comment for edge-case hinting that the plugin needs to be installed
Several small fixes and improving group connections

1.4.40:
Fix invalid free causing crash with sending keystrokes and clipboard contents
Fix SEGV when removing a non-exitend connection
Adjust floating toolbar to take up less space
Fix issue with multimonitor configuration needed for FreeRDP versions after 3.10.x
Add option to allow ssh-rsa keys to be used for ssh connections
Only set the max width and height to full monitor if using multimonitor
Fix typo
Revert calls back to uint
Fix issue with RDP scaling on connect
Add option to force multimonitor mode
Added the options to start connections in fullscreen mode and/or with dynamic resolution enabled for protocols that support the options
Allow empty passwords to be passed to FreeRDP
Allow import/export of ssh tunnel settings
hide local cursor when showing remote cursor

1.4.39:
Fix bug passing wrong value in SPICE plugin (Breaking compilation on some distributions)

1.4.38:
Add option to automatically copy ssh text when selected
Allow -c to work with www plugin
Don't prompt about closing connections with no connections
Mainly fixing memory leaks and some small bugs

1.4.37:
Implement horizontal smooth scrolling in RDP
Allow -c to work with www plugin
Add ability to lock message panels to one side of the window
fix dangling pointer in ssh_options_get_port invocation
Revert "[REM-2854] Add timeout option to handle VNC disconnects"
Fix OpenSSL include dir
Revert "[REM-3121] Handle GotFrameBufferUpdate on its own thread to prevent freeze"
fix compile warning that is failure with newer gcc versions
Add null check to prevent crash when pasting empty clipbaord
[REM-3086] Remove support for FreeRDP_SupportMonitorLayoutPdu to prevent loss of keyboard with xrdp
Don't rely on padding characters to be present to try decrypting passwords
Add option to immediately close VNC windows when they fail to...
Allow Remmina to use plugins immediately on download without needing a restart
Add plugin api to allow Remmina to display if a profile is...
Fix error message for failed RDP connection
Add more detail to bug report to make certain issues easier to solve
Resize icons to fit flatpak specifications

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{remmina_1.4.36.bb => remmina_1.4.43.bb}       | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.36.bb => remmina_1.4.43.bb} (81%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb b/meta-oe/recipes-support/remmina/remmina_1.4.43.bb
similarity index 81%
rename from meta-oe/recipes-support/remmina/remmina_1.4.36.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.43.bb
index b8a31fc012..518c75a1a8 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.36.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.43.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://L
 DEPENDS = " \
     glib-2.0-native \
     openssl \
-    freerdp \
+    freerdp3 \
     gtk+3 \
     gdk-pixbuf \
     atk \
@@ -26,13 +26,19 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "17cf7956b9f925fa788083a2db8d5e669f86bfaf"
-SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
+SRCREV = "7be0cf2348d149c6bf5bd882fe91d3bec7d6aebb"
+SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master;tag=v${PV}"
 
 inherit cmake features_check mime mime-xdg gtk-icon-cache pkgconfig
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF -DHAVE_LIBAPPINDICATOR=OFF -DWITH_WEBKIT2GTK=OFF"
+EXTRA_OECMAKE += "\
+    -DWITH_APPINDICATOR=OFF \
+    -DWITH_GETTEXT=OFF \
+    -DWITH_TRANSLATIONS=OFF \
+    -DHAVE_LIBAPPINDICATOR=OFF \
+    -DWITH_WEBKIT2GTK=OFF \
+    -DWITH_FREERDP3=ON"
 
 PACKAGECONFIG[spice] = "-DWITH_SPICE=ON, -DWITH_SPICE=OFF, spice spice-protocol"
 # Switch on gtk support in avahi recipe if you want to enable avahi support

