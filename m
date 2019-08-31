Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id F0AAC7F4A2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:50 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id y8so4898603plr.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4/47YDv1aptUiK563GXkqbSi+2B09vFT01tp20pFODo=;
	b=c2z8+bUobztci3KW9Nw1C4m+vMKaCosD9SNSugjD+lA2Knsatirx9HprnlMQHwsRB2
	nHzaF4NggQbKXpHhKypfLPccK/cFxbFRRWWondpLljzgIDQ+OhnjJbWVCYT7bQqsyoaF
	nC3KEQ0y2UMhnDVOL3sPCfund9vACbCx0ai3nvHLJ2NoGzs/7yswPWzequtqz3TBkMFn
	CHHPpUYFf7G5NcbWx3M3muGHDpbuAVw7YYZf8P0xPDo535zMf788vOuBtIYk2kVGupfR
	32GeExGLZM9GVhO3s6YT6tsYTo/oOp6HWU63Z39/RCYrKsIpeHfZgu20ZAzkUZYBXkcM
	Cfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4/47YDv1aptUiK563GXkqbSi+2B09vFT01tp20pFODo=;
	b=WQtG0+luV+Ht5xUobkp8BX/5SaZSabC3+GFHdDofIrZgGZBdKMkkOj4rxLHArkdP5z
	7sH818kkRUgXaC47SV3JlfO9FegmG2TL+WC6JBIPD7X6KdtupIjWzk7rzJzuI3aXPp+D
	yO1yjT03y4YtACqSobGRSCqv7wEe9KusJNhcLmh4iVSpZUMJIaMlaSCRZUPetgLfY7zK
	dGNkMHhj39kMtTA959eQTisFioHxXp1OnKOLaFcChDLbo7EYjbgZJxvXcVIrhHBtX4qK
	dXD+2hkdaxi9RgsEIDVJis8EK89wdcEQyU90IqGDL6ctbX9TmXvPUHNuRgp5setez1oE
	S5uQ==
X-Gm-Message-State: APjAAAWE1JHwv1uYH96RBWntXvneEXg5GWK0xobnVu3Blj9xHJbV/+jj
	0txclspyjg33HndlptZjdVeHr4dd
X-Google-Smtp-Source: APXvYqwONvwJm4vcXEZiaxYGbPPw/mKB0j37BzA0VPLuenpsJqhKqAeezbbyqpp2uYoGaG9Le6gLfg==
X-Received: by 2002:a17:902:1101:: with SMTP id
	d1mr22148090pla.208.1567287111838; 
	Sat, 31 Aug 2019 14:31:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:25 -0700
Message-Id: <c9e4dfbcc163fdc33f62419b5c65c057c924247d.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 04/23] network-manager-applet: Remove obsolete dbus-glib and libnm-glib dependencies
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:51 -0000

From: Adrian Bunk <bunk@stusta.de>

network-manager-applet stopped using dbus-glib 3 years ago.

Building of the obsolete libnm-gtk is disabled by default in 1.8.20.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../network-manager-applet/network-manager-applet_1.8.20.bb          | 5 ++---
 .../recipes-connectivity/networkmanager/networkmanager_%.bbappend    | 3 ---
 2 files changed, 2 insertions(+), 6 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
index 7181f5e..80aafc8 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
@@ -2,7 +2,7 @@ SUMMARY = "GTK+ applet for NetworkManager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
+DEPENDS = "gtk+3 libnotify libsecret networkmanager \
            gconf libgnome-keyring iso-codes nss \
            intltool-native \
 "
@@ -34,14 +34,13 @@ do_configure_append() {
 GI_DATA_ENABLED_libc-musl = "False"
 
 do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/src/libnma/.libs:${B}/src/libnm-gtk/.libs"
+    export GIR_EXTRA_LIBS_PATH="${B}/src/libnma/.libs"
 }
 
 RDEPENDS_${PN} =+ "networkmanager"
 
 FILES_${PN} += " \
     ${datadir}/nm-applet/ \
-    ${datadir}/libnm-gtk/wifi.ui \
     ${datadir}/libnma/wifi.ui \
     ${datadir}/metainfo \
 "
diff --git a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend b/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
deleted file mode 100644
index 1abb5bb..0000000
--- a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-# networkmanager-applet requires glib support
-PACKAGECONFIG_append = " glib"
-
-- 
2.7.4


