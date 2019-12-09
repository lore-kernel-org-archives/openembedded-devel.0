Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8C09A7F691
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id p17so13897230wmi.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZqcJvf+L6HbaWzjg614Ofib+hZ33Wu018rM6jdSHNzs=;
	b=kx9SfpJTkXX7dPBrYrEfvTiRtMJZ4apavXrKP5jkrOu+L+QpWsPFA4dlFHqaQvQ556
	F2rbx/Co/Fxpk0xiSRx61QtV84die5BD54vpI1IGzOMiVUBhLwjZgewqy/JJbAc+V60n
	bHae4sHdrWCo2b1ealLQ1Mm2snpMEX9o3QSYERaSnnoasFBBASV0MvyiunlXXwHD/7Fx
	TXJl2NS2Xjuci1yy5nzkvFZaWCcw1u746wsNkwCuT8lVn/MJoD/YXzRbVUcOF6B+TL/Q
	6JHHJpgZAqPhO6oh84HKLOpnp0LqKxa+gbs8GBo+WKTdJpvk6K7uvWxGBsDOKIcSxlBb
	zL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZqcJvf+L6HbaWzjg614Ofib+hZ33Wu018rM6jdSHNzs=;
	b=ZrEt6SE8HlZpJQ8yPtnh2padw5ySo+tmCXoD0YX8826vB4h7XFDcZxbyjiYYNcj0Gu
	bdm4+B1Qu9vcrVHKj6QRnn5I55NLVCY1FjMWNCoI4BLcZl91ULVD99Rm8IfvZebF8Jom
	cgSmk4+BXLEPD13rysxqxOQdUreV7eecQlZR+pdS8TYUn0TkR6jb7f4ZAISSxG1R1K3f
	HazjYXE6gwijRYTrQowYoT+hQS/fU9fAkFHrAYEez73aMZAzHPFqr1lNloTNz192Vowg
	tEIDbMkgL6hVwy3ZSwkA+LbBPaFYPPN6Ll4DmHlpkxW2+g6J+rmk4SJpCA0nkoV6I79S
	1O8g==
X-Gm-Message-State: APjAAAX2XUtUJzbCY9VhpvLGy9gJrpUKAb/IjpbGG2GNzbS01qsGAMoI
	Xwy+x3d6bWLdWQj5Iw/jq/5Mi6zW
X-Google-Smtp-Source: APXvYqxn2/Y3TUJ1/lqerFU+Ijsqlbkb54pQZXagE/d923+gDSYCeunrrv6+Eap2K0gmFcP5KLirBw==
X-Received: by 2002:a1c:7f94:: with SMTP id a142mr22965792wmd.33.1575880590003;
	Mon, 09 Dec 2019 00:36:30 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:29 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:00 +0100
Message-Id: <20191209083612.23922-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 08/20] gnome-control-center: re-add 3.34.1
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:30 -0000
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
index 000000000..5d58879c5
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
+REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
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


