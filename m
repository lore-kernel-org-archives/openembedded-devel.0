Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1F2797FA2D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 00:09:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p9so6006216wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=b1BYY+CbwY9p9S/V+HPT/f/Nj5WOLiN7L24dvV31TSo=;
	b=UGqV60JHw3Hj3DRKmwjW9TTGCaeF8CFZF0oHJoJuvXd5Z+l5xVV60gDJwABnE1zSe6
	yymhLcAWcbb8jWQY1EC6DizlMVOQw2cQxDeSf53++LEJdp5CMNmzW9GfSkN4Lb4BzEQa
	NZM7Vc9GilWnFghY9iGbOn26KyCaZ6W9W0Dma/EyY4ZzFU9d7U4+2lG6gKYU9uvFkFer
	QFGyChQa1zP35H7cQGe+5KNcxrDaPS2v1R/8vZ2zXCHgRNGN3Y20i+FvV60XCv8pYoBy
	/YsCsEA1Nx61usJSqq96B2RwGgFTiG8BiPGs/9FgL0bYRr1ReAB59jSmkcFPokiIxZ3t
	i1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b1BYY+CbwY9p9S/V+HPT/f/Nj5WOLiN7L24dvV31TSo=;
	b=hozW4rdx/1a3Oq4pqso0y4RBHB28gaM1R8aLKDrZXzdUzVcgOkyXqOwwYeTbbbReAm
	++F77P7l+QFNRlz267uFPgUp72KwjUzuh65wl3j/83IsFuwKpokJ7Gddb1NILG2UxYvc
	mPpEWh0Q8B8iKGq5ooQORvyq3LQjKDg1fXXa1aiyh68n+MFlICaEj0V+/oyur+6ZKECx
	2jGqu0TNsi8RghacfXmORwBLj83+QG2qWtSCCmSdz3xz7BuvY85FE7//xBTc2Pj21TTy
	Xf0LBbKAAUpmMp9hTaq+JvgW8lRh+m3QNut5/tQoHza8MNppYbe7eUiciGxvkP6ZKrfT
	33bQ==
X-Gm-Message-State: APjAAAV828MxcKRR+ECZs+4GZQbwctUgVl2w2L6jbXaW5c9FoMsMkskH
	Is3F5W15PXN4C/D6YtuqyfDXBL2B
X-Google-Smtp-Source: APXvYqy00AUwGS45CkCvGZxGhJjd/KXeJVskQvCO0P8ddf60PJ0Qcundvf+hy5woawrP2RKepkFSWQ==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr7195711wmi.166.1575590979521; 
	Thu, 05 Dec 2019 16:09:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9017AA4DD0060EAA1509.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9017:aa4d:d006:eaa:1509])
	by smtp.gmail.com with ESMTPSA id
	b10sm14252762wrt.90.2019.12.05.16.09.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 16:09:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2019 01:09:06 +0100
Message-Id: <20191206000912.19841-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206000912.19841-1-schnitzeltony@gmail.com>
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/21] gnome-control-center: re-add 3.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 00:09:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-Add-meson-option-to-pass-sysroot.patch | 45 +++++++++++++++
 .../gnome-control-center_3.34.1.bb            | 55 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
new file mode 100644
index 000000000..7f82a152c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sysroot.patch
@@ -0,0 +1,45 @@
+From ba8aebe1259ae3f7f5a4827e5a47bb95c568b218 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 21 May 2019 16:07:46 +0200
+Subject: [PATCH] Add meson option to pass sysroot
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We need to pass this to meson to help it finding gdesktop-enums.h:
+
+| panels/background/meson.build:38:0: ERROR: File /usr/include/gsettings-desktop-schemas/gdesktop-enums.h does not exist.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson_options.txt             | 1 +
+ panels/background/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index a347168..2cd8121 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,3 +1,4 @@
++option('oe_sysroot', type: 'string', value: '', description: 'Directory for OE-sysroot')
+ option('cheese', type: 'boolean', value: true, description: 'build with cheese webcam support')
+ option('documentation', type: 'boolean', value: false, description: 'build documentation')
+ option('gnome_session_libexecdir', type: 'string', value: '', description: 'Directory for gnome-session\'s libexecdir')
+diff --git a/panels/background/meson.build b/panels/background/meson.build
+index bb34b69..f22722e 100644
+--- a/panels/background/meson.build
++++ b/panels/background/meson.build
+@@ -36,7 +36,7 @@ common_sources = []
+ 
+ enums = 'gdesktop-enums-types'
+ enums_header = files(
+-  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
+   'cc-background-item.h'
+ )
+ 
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
new file mode 100644
index 000000000..4c91979ac
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.1.bb
@@ -0,0 +1,55 @@
+SUMMARY = "GNOME Settings"
+DESCRIPTION = "GNOME Settings is GNOME's main interface for configuration of various aspects of your desktop"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gsettings gettext vala upstream-version-is-even bash-completion features_check
+
+DEPENDS = " \
+    gdk-pixbuf-native \
+    colord-gtk \
+    udisks2 \
+    upower \
+    polkit \
+    pulseaudio \
+    accountsservice \
+    samba \
+    gsettings-desktop-schemas \
+    gnome-settings-daemon \
+    gnome-desktop3 \
+    gnome-online-accounts \
+    network-manager-applet \
+    gnome-bluetooth \
+    grilo \
+    libgtop \
+    gsound \
+    libpwquality \
+"
+
+REQUIRED_DISTRO_FEATURES += "polkit pulseaudio x11"
+
+SRC_URI[archive.md5sum] = "8b0f0baea34fbe937efd0ad1be4b451b"
+SRC_URI[archive.sha256sum] = "5f82ecd5554136c462248ec5363b82d95358b39dfd6787006d8307b4504e515e"
+SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
+
+PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
+PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
+PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
+
+# Once we have (lib)cheese we can make cheese a PACKAGECONFIG
+EXTRA_OEMESON = " \
+    -Doe_sysroot=${STAGING_DIR_HOST} \
+    -Dcheese=false \
+"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gnome-shell \
+    ${datadir}/metainfo \
+"
+
+FILES_${PN}-dev += "${datadir}/gettext"
+
+RDEPENDS_${PN} += "gsettings-desktop-schemas"
-- 
2.21.0


