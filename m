Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id E923C79A5D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:56 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id u34-v6so9996904qth.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yjFpahhyr93RREU9mxWwlikvtc3Bl3g79UI/+Pa4+mo=;
	b=HEI3gaEUqPC4+ioj7ZGb9aQMV0ZHx9+Amd83NZVOUvoKiXmNnHQdWa2G3hcKwzye36
	CouIVftXQEhrSeG4clh1gtRScOA7akRmGwHe+FGMnX4g3aa61P/oj5qQCMOghjgpoIn7
	wOy/EyGE0ymuFQAlr2x7RLJjEh7XPHTE5djUaavrNT2hjmrIC23PtZfCo9n4Y6XC16Qv
	rTnlE6bsK9iAXyC/mhgJhGa1S0XKlk45r4L12PUmFQy+gUnumszAGflsXN2GD78TUTqa
	opN3GgJ3ZDTaYYNjknoue7H5PP817V9XHmFAOezsq1briCNQqOLULmbJ52hNf34rAaV0
	MTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yjFpahhyr93RREU9mxWwlikvtc3Bl3g79UI/+Pa4+mo=;
	b=HBKWwCUNHYB47VTHHx2rTZXH3HYmwfNPu9+yNLKkOi2VYUoURDRaPO1TlZWEayQ8rK
	yzFSb/U+b6F2rUOa6isIIBrO25QwMQlRf8xzXPzGF2Zb676D9yooaYJEFsBuECC11rNL
	DQaJh1l6sqfgevupZhVzmyhTWlrI0+MXcnHcRle1Ee3G+foGZwZooXX/lDbWCnUZJnh1
	Gm103QRYdYT7jnZPKm+RY/ZQULKSZSpRsmmYBQzSlBfs/+HtXm7gcIESIT4Wu5g1VPE9
	3E4Vwxgfs8u3CZzI6xzL39HH8O+42+5zaaJRiaaN4oUwNvPW/ei8SBXg4crknJijUOED
	WS8g==
X-Gm-Message-State: AGRZ1gLDwX+Au8fcy6o7PqyEwp1r6qQDYbXw0yhhOkUD248FP8BTZGpJ
	e3TlLtrD0DzwKSKZcx3iWruWxwcp
X-Google-Smtp-Source: AJdET5fZDMC5zeEjoBLaLA3sxevwtHE9Wl3FJ+INnDpSSfpbO2GyZu/Cf+SHiE+a4d/SczPj2yaC5g==
X-Received: by 2002:ac8:76d9:: with SMTP id
	q25-v6mr13739004qtr.35.1540831317637; 
	Mon, 29 Oct 2018 09:41:57 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:56 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:10 -0400
Message-Id: <ef386b75ac95432d2fa8c4bcfcda95f16db6d555.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 13/16] gnome-shell: add recipe for gnome-shell.
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:57 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../gnome-shell/0001-dont-detect-python.patch | 24 ++++++++++
 .../recipes-gnome/gnome3/gnome-shell_git.bb   | 46 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch b/meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
new file mode 100644
index 000000000..50d874061
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gnome-shell/0001-dont-detect-python.patch
@@ -0,0 +1,24 @@
+gnome-shell: Add decoration to tweak python3 path
+
+  The python detection used in the meson script doesn't
+  resolve correctly. Add a decoration to allow the
+  do_configure_prepend to sed in the correct path for
+  python3-native.
+
+  Upstream-status: Innappropriate [embedded-specific]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/src/meson.build b/src/meson.build
+index 178e05899..d3d8df97b 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -13,7 +13,7 @@ script_data.set('libdir', libdir)
+ script_data.set('libexecdir', libexecdir)
+ script_data.set('pkgdatadir', pkgdatadir)
+ script_data.set('pkglibdir', pkglibdir)
+-script_data.set('PYTHON', python.path())
++script_data.set('PYTHON', '@PYTHON3_PATH@')
+ script_data.set('VERSION', meson.project_version())
+ 
+ foreach tool : ['gnome-shell-extension-tool', 'gnome-shell-perf-tool']
diff --git a/meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb b/meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb
new file mode 100644
index 000000000..d8f8a4c77
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/gnome-shell_git.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "GNOME Shell"
+LICENSE = "GPLv2"
+DEPENDS = " \
+            glib-2.0 \
+            gsettings-desktop-schemas \
+            gjs \
+            gdm \
+            gnome-desktop3 \
+            mutter \
+            wayland \
+            wayland-protocols \
+            evolution-data-server \
+            libcroco \
+            polkit \
+            gnome-bluetooth \
+            gstreamer \
+            keybinder \
+            gnome-settings-daemon \
+            ibus \
+            librsvg \
+            sassc-native \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-shell.git;protocol=http;branch=master;tag=3.30.1 \
+           file://0001-dont-detect-python.patch \
+           "
+
+RDEPENDS_gnome-shell += " python3-core python3-pygobject gnome-settings-daemon gnome-bluetooth gdm "
+S = "${WORKDIR}/git"
+
+inherit pkgconfig meson gobject-introspection gettext
+
+EXTRA_OEMESON += " -Dman=false -Dnetworkmanager=false "
+
+FILES_${PN} += "${datadir}"
+FILES_${PN} += "${libdir}"
+FILES_${PN} += "${bindir}"
+
+do_configure_prepend() {
+	# Fixup the gsettings version
+	sed -i 's^3.27.90^3.24.1^g' ${S}/meson.build
+	sed -i "s^@PYTHON3_PATH@^${RECIPE_SYSROOT_NATIVE}/${bindir}/python3^g" ${S}/meson.build
+}
+
-- 
2.17.1


