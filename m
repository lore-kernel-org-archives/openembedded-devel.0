Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5AEFB7F81E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:21:03 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c14so5273350wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1lbZUAnkeL6gl8J7LlgkP6wpmP3FiN5hhks4R0IJPDU=;
	b=MGIf0WovRy3/nXmgp0t7wch8do2D5aMu4KTYbpLW8EgO24AGp6mgoHHb1zubInBr3u
	IqAK7yfzEOYb9/SeQ9/l7wBINfSCrMQ2VurGwQoi6sM/EDoqq6may+pBBYdKce3ZU/pY
	qTxInanwh+rJJmM+rai0eomYWGIVdXzruV5w1+ZHTZPcHAS4H2ukjYsZ5viMJxwHyq/j
	mYJrpiKuZbRnb8cynL5tyCBWpBEghtIwXxwzcXF0Mq6i/NqrDpf0rQplAEYOfqMi1HkC
	P6jsGLgGOVsvOalDviUbOA9g2PkHgY2FSzVbdhjltJDsQK5wEryXfr04l35b226ifDyq
	qUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1lbZUAnkeL6gl8J7LlgkP6wpmP3FiN5hhks4R0IJPDU=;
	b=PqfWd0Z81m8DYxS4stMXlnh1UjfVxDKiYM5Z1b/cO7Fla+fDX5ini5F+yxDzB9Lgdm
	0kvLqQBuashuFiny/tFicaoIQ7SHrYuFb7CU819Hyq/xpV22mKDS0xX8bxF+Fl1TdWsE
	68jFFcn6fe9UBtXnH1ynybA1kzHSFTmbLeXFnVIYY6Nl5435c6yqr8gcYJ6ugdNK812b
	ekaCXRFhpnczWGsGmFgRQYS9TTgcn1toE33x8c5Cc616UUaIucWoDNhspoozo4D0Gh8L
	NoguLZpR9W8IfETTu6QaypCyWgPdBL/g/gqUCZyzOd/9Nuy/D6DUfhFlEjW+3X0rCR8m
	tvCA==
X-Gm-Message-State: APjAAAUANNegRTbMgdhwYv6VzEckBM3nDEBqUSZGnH75zfhz8eX/1E4O
	qjU0KZ7QmECOc1xm9Lx+IGxvkDmM
X-Google-Smtp-Source: APXvYqxlZvoK6GcKEF2xBcA7Pdvx6eeZUGEFCVMLvExLOZgf6H3vn+g3cQG6Agh2p8BBhfMzm/1agA==
X-Received: by 2002:adf:f7c4:: with SMTP id a4mr24135901wrq.332.1576459263734; 
	Sun, 15 Dec 2019 17:21:03 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F06A307CB3B21B8240595DD.dip0.t-ipconnect.de.
	[2003:f0:7f06:a307:cb3b:21b8:2405:95dd])
	by smtp.gmail.com with ESMTPSA id
	t190sm10877063wmt.44.2019.12.15.17.21.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 17:21:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 02:20:47 +0100
Message-Id: <20191216012047.17312-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216012047.17312-1-schnitzeltony@gmail.com>
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] gnome-tweaks: initial add 3.34.0
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
X-List-Received-Date: Mon, 16 Dec 2019 01:21:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It runs but the area I did it for 'Startup Applications'is empty and I would
like to disable some and see how gnome stores this.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Make-python-path-configurable.patch  | 41 +++++++++++++++++++
 .../gnome-tweaks/gnome-tweaks_3.34.0.bb       | 32 +++++++++++++++
 .../packagegroup-gnome-desktop.bb             |  1 +
 3 files changed, 74 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make-python-path-configurable.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.34.0.bb

diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make-python-path-configurable.patch b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make-python-path-configurable.patch
new file mode 100644
index 000000000..8129f85a4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make-python-path-configurable.patch
@@ -0,0 +1,41 @@
+From db94983c93f38bd8494b47d9fa1b3e5368dc9abe Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 11 Dec 2019 01:34:01 +0100
+Subject: [PATCH] Make python path configurable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+ create mode 100644 meson_options.txt
+
+diff --git a/meson.build b/meson.build
+index b7da518..d58fb5b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -13,7 +13,7 @@ bindir = join_paths(prefix, get_option('bindir'))
+ datadir = join_paths(prefix, get_option('datadir'))
+ libexecdir = join_paths(prefix, get_option('libexecdir'))
+ localedir = join_paths(prefix, get_option('localedir'))
+-pythondir = join_paths(prefix, python3.sysconfig_path('purelib'))
++pythondir = get_option('python_site_dir')
+ 
+ pkgdatadir = join_paths(datadir, meson.project_name())
+ 
+diff --git a/meson_options.txt b/meson_options.txt
+new file mode 100644
+index 0000000..03455ca
+--- /dev/null
++++ b/meson_options.txt
+@@ -0,0 +1,2 @@
++option('python_site_dir', type: 'string', value: '')
++
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.34.0.bb b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.34.0.bb
new file mode 100644
index 000000000..af4c8c641
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_3.34.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "GNOME tweaks: Advanced options for GNOME 3 session"
+LICENSE = "GPLv3 & CC0-1.0"
+LIC_FILES_CHKSUM = " \
+    file://LICENSES/CC0-1.0;md5=65d3616852dbf7b1a6d4b53b00626032 \
+    file://LICENSES/GPL-3.0;md5=9eef91148a9b14ec7f9df333daebc746 \
+"
+
+DEPENDS = "libhandy"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gtk-icon-cache gobject-introspection features_check upstream-version-is-even
+
+# same as gnome-shell
+REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+SRC_URI[archive.md5sum] = "a625d8b167c5549c68e1c6ac7a87d369"
+SRC_URI[archive.sha256sum] = "003326fab46e6faad9485924bca503f0c583e3b4553d6f673406eda396205250"
+SRC_URI += "file://0001-Make-python-path-configurable.patch"
+
+EXTRA_OEMESON = "-Dpython_site_dir=${PYTHON_SITEPACKAGES_DIR}"
+
+FILES_${PN} += " \
+    ${datadir}/metainfo \
+    ${PYTHON_SITEPACKAGES_DIR} \
+"
+
+RDEPENDS_${PN} += "gnome-shell python3-core python3-logging libhandy"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
index e27678c89..3c333fe00 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop.bb
@@ -21,6 +21,7 @@ RDEPENDS_${PN} = " \
     gnome-settings-daemon \
     gnome-shell \
     gnome-shell-extensions \
+    gnome-tweaks \
     gmime \
     gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash \
 "
-- 
2.21.0


