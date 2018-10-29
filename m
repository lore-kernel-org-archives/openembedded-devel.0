Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CEA10791FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:47 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d14-v6so9998413qto.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kobGm5/04nDLpIdkQTYK7w5SOAF6J2KIwwN2vPVTILw=;
	b=EjYxy1EArt/7kOE5hFqobI1nh6J3B6DuZnJKc9V/9rDd3t3hB9jWvNYY1G6vv0JGRx
	v3Qq8OiW/AY7NxpugUU15HqoY3yD2cczU1lIE+mIiLBAff5tAoUizhBR141qnzmCp6un
	6o1o7UKY0fqFvw5N0RzniKFWwDjKZbVdl7gE50TX76whQKl3NMXkw5m9yEOHlZHfX0oj
	g6QZTAk86yEuBXISokgHm2N4f3BSP9omUy4hYsw/AVUFmXlhEtcxBguZkK3tVYIHgOJo
	1odyXQbz5TeIpx+0WCsxOHUZLcIKqI9ba9VUxHr/jsgBX+KQeC0Wf5Bb8jOS7xjRfO/I
	Wjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kobGm5/04nDLpIdkQTYK7w5SOAF6J2KIwwN2vPVTILw=;
	b=aY7NVOUi8bICVQw55aCOM/lPh89I5BZQ+fgE9V2059SQJKdoRzEYxbZxv2q5bPWTJk
	a8BugaEofDJ/4YmTs8xl3s642uvJf244CllR3Cuh4JF2x+JlH2USjXGqJCVT/+sVIXru
	Jx3DKZ9Z309wEgER5Mimx2399z6ZocfD54yJEGaseUV1MXp5TBc5PNiHP3QtTlvwoOV5
	QO5vaTmgaSezUe+DHHK7iN6lMGO5cezc5fPHAAz2GW0PluuFgIVH/LBrl6NaYtZ+u033
	6dQM7+PbQmlq6eQkYVdumEG1czfHeipOnRhqh3UPUOdU3aAQZe8C9pPR6rR31A6IP2TP
	CEFw==
X-Gm-Message-State: AGRZ1gJ/7W4j32k4amQOGfkPg00K+FHv2okVtT/NXIYxqAzXyhNnfWZJ
	yRt96I0TJPRdnbA6s70jySQXXDSh
X-Google-Smtp-Source: AJdET5eGFBYH8y3WjrxA5mLV/abGGM40/iYnuMzgvp0DrjvIslU4D/S/Du6lg5CbjmkpX2LHOM7ivQ==
X-Received: by 2002:ad4:4106:: with SMTP id i6mr13459938qvp.219.1540831308424; 
	Mon, 29 Oct 2018 09:41:48 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:47 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:03 -0400
Message-Id: <16012ad2ea09d37fb7a9b8ad4b0c0f01e641d821.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 06/16] gnome-settings-daemon: add recipe for gnome-settings-daemon
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:48 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../0001-remove-extraneous-plugins.patch      | 52 +++++++++++++++++++
 .../gnome3/gnome-settings-daemon_git.bb       | 43 +++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
new file mode 100644
index 000000000..6f5599058
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon/0001-remove-extraneous-plugins.patch
@@ -0,0 +1,52 @@
+gnome-settings-daemon: Disable plugins, dependencies, and compiler errors
+
+  * Disable 'no-deprecated-declaration' to allow build to complete
+  * Remove colord as a dependency
+  * Remove unused plugins
+
+  Upstream-status: Inappropriate [configuration]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/meson.build b/meson.build
+index d2121623..15fcc88d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -54,7 +54,7 @@ endforeach
+ 
+ # compiler flags
+ common_flags = ['-DHAVE_CONFIG_H']
+-compiler_flags = []
++compiler_flags = ['-Wno-deprecated-declarations']
+ 
+ if gsd_buildtype.contains('debug')
+   common_flags += ['-DG_ENABLE_DEBUG']
+@@ -82,7 +82,6 @@ endif
+ 
+ add_project_arguments(common_flags + compiler_flags, language: 'c')
+ 
+-colord_dep = dependency('colord', version: '>= 1.0.2')
+ geocode_glib_dep = dependency('geocode-glib-1.0', version: '>= 3.10.0')
+ gio_dep = dependency('gio-2.0', version: '>= 2.53.0')
+ gio_unix_dep = dependency('gio-unix-2.0')
+diff --git a/plugins/meson.build b/plugins/meson.build
+index 3db69da7..accb7b90 100644
+--- a/plugins/meson.build
++++ b/plugins/meson.build
+@@ -1,16 +1,11 @@
+ enabled_plugins = [
+   ['a11y-settings', 'A11ySettings'],
+   ['clipboard', 'Clipboard'],
+-  ['color', 'Color'],
+   ['datetime', 'Datetime'],
+   ['dummy', ''],
+-  ['power', 'Power'],
+   ['housekeeping', 'Housekeeping'],
+   ['keyboard', 'Keyboard'],
+-  ['media-keys', 'MediaKeys'],
+   ['mouse', 'Mouse'],
+-  ['screensaver-proxy', 'ScreensaverProxy'],
+-  ['sharing', 'Sharing'],
+   ['sound', 'Sound'],
+   ['xsettings', 'XSettings']
+ ]
diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb
new file mode 100644
index 000000000..167db3bd2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gnome-settings-daemon_git.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "GNOME Settings Daemon"
+LICENSE = "GPLv2"
+DEPENDS = " \
+           libcanberra \
+           prelink \
+           glib-2.0 \
+           gsettings-desktop-schemas \
+           gnome-desktop3 \
+           wayland \
+           wayland-protocols \
+           gettext-native \
+           polkit \
+           upower \
+           libnotify \
+           geocode-glib \
+           libgweather \
+           lcms2 \
+           libwacom \
+           networkmanager \
+           geoclue \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-settings-daemon.git;protocol=http;branch=gnome-3-30 \
+           file://0001-remove-extraneous-plugins.patch \
+           "
+
+SRCREV="${AUTOREV}"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig meson gobject-introspection
+
+EXTRA_OEMESON += " -Denable-gtk-doc=false -Dcups=false "
+
+FILES_${PN} += "${datadir}"
+FILES_${PN} += "${libdir}"
+
+do_configure_prepend() {
+	# Fixup the gsettings version
+	sed -i 's^3.27.90^3.24.1^g' ${S}/meson.build
+}
+
-- 
2.17.1


