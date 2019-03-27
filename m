Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id C47EF6C104
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:30 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id f3so468275wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=eczm9qM2oQDTRFhKaUIl8knfkX9+RecG71eOtRhNkAo=;
	b=fghioIkMRS2cxbqIDiVasxP7SJBm0QVB/8x/ZAxJjTo7uxZl7+nbtPzifHJ74leUzN
	TgA51M697J3pNc027XzcWqk7AzRj1xfgFVt5knnRpZEDXbigW2yecu4o50YOAhZ1PMF/
	RfDt30n4KrxNDh8NpBSvXyOyByBW/hVjaqkcQr72w/2EPgSV7xUrhDaZsR9iFAyQk5gl
	4Nd79l3AUraMe8bGs7LgtVW+yhYF1UPnZBQfCK9/26GgbnN6P0tYGIk4wetPf3y9yewW
	1aLl1XMYKaKxakhvPtjF1Yx5vy373VNyiMBR98vwH44YVy0RP8uVW4UJZQwZayxFex1V
	x7dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eczm9qM2oQDTRFhKaUIl8knfkX9+RecG71eOtRhNkAo=;
	b=Qd3dkbpijf3PJUOhbVSC+DIDPNy0BJrqakmhyqNriHVO56TTA4I4sIbwJ6I/7Qc0Ol
	jzyPbKC39/Dv2RlQ0jeNY4Vvqq6XmSdFoKDS9o1boWIcDnoWTiXGDyH4cune7hKE0pvS
	DfP1nG/5/T9whn0IvnQBRekUwfKKfhZ2+Vq5Cw5k0LvoncKVOoxeQ2OARbkADmUhfqLf
	kij3JR0aWENlBF9bnqrFiEG+zE87Dxc4Mu+josiXmHEDDMIWze5RHCjjUqFk8XwnPG/o
	8L+SVW3eFUyM4XN/FpbTsj9YTb1uH3ythADY3XRXPszwYIeD8J6kKMp4+4pWmwH7Mn6e
	+r8Q==
X-Gm-Message-State: APjAAAWqIFjawNbKWsvAcMvIeXJiucQLEKDDdQghphV45+a28Qif6G4a
	M2BTwIYfvyhxn26FTsqhaL7r6Ejt
X-Google-Smtp-Source: APXvYqydlxf70eC526lbm6YvU0N4O3MoWv624Zv1o/EpxcTGXrfqSMMdf3EZvgWDTsvGosc800pOZw==
X-Received: by 2002:a1c:a70f:: with SMTP id q15mr2252453wme.28.1553700931219; 
	Wed, 27 Mar 2019 08:35:31 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:34:57 +0100
Message-Id: <20190327153509.23928-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/15] dconf: upgrade 0.30.1 -> 0.32.0
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of patching out docs just tell meson not to build man pages

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...0001-meson.build-do-not-compile-docs.patch | 27 -------------------
 .../{dconf_0.30.1.bb => dconf_0.32.0.bb}      |  8 +++---
 2 files changed, 4 insertions(+), 31 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.30.1.bb => dconf_0.32.0.bb} (53%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch b/meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch
deleted file mode 100644
index 2f4283584..000000000
--- a/meta-gnome/recipes-gnome/dconf/dconf/0001-meson.build-do-not-compile-docs.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 50a9133e0b13798640da0b7cd11b5a85e35b2038 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 23 Nov 2018 16:27:32 +0800
-Subject: [PATCH] meson.build: do not compile docs
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 04b6d47..46fdbc8 100644
---- a/meson.build
-+++ b/meson.build
-@@ -81,7 +81,6 @@ subdir('gdbus')
- subdir('gsettings')
- subdir('client')
- subdir('bin')
--subdir('docs')
- subdir('tests')
- 
- meson.add_install_script('meson_post_install.py', gio_module_dir)
--- 
-2.7.4
-
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
similarity index 53%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
index 9f67673b1..8d1bbdfd1 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.30.1.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/gnome"
 
-SRC_URI[archive.md5sum] = "a959eef51c917b3c57cfbef1448a375e"
-SRC_URI[archive.sha256sum] = "549a3a7cc3881318107dc48a7b02ee8f88c9127acaf2d47f7724f78a8f6d02b7"
+SRC_URI[archive.md5sum] = "e1ac0b6285abefeed69ca9e380e44f5a"
+SRC_URI[archive.sha256sum] = "68bce78b19bc94cb2c3bb8587e37f9e5e338568c3a674f86edde9c9f1624ffab"
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
@@ -12,8 +12,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase bash-completion vala
 
-SRC_URI += "file://0001-meson.build-do-not-compile-docs.patch \
-           "
+# I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
+EXTRA_OEMESON = "-Dman=false"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.20.1


