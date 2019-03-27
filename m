Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 878AF7D14C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:42 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id j9so19111994wrn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ClZ7oCcecOu1dhBVLGvIBNPeiU/8SW7A79kAmpRIgY0=;
	b=ZoWS66gPMV1hhbfoEBJakyFTFBDHCU5lbXUbJTlCsLmaGh/MR7d4GcAA/3XLfalj/g
	i9FFgpV/mBm04l8FR+Ee21WffIQcV1Er3gZgkLUIalqz3eWOOcnR/9zBYJ1Ar4yQmroP
	aSkuWjSfCzw0GyFkDEl6gdrVh8by+rYGhZChA0oDOu0N9ywBXop+PcF1VHGsJFPQC84E
	xUJNA6wvJyof58jkc0jRWQiUZvY+y4cCSbG1M5qcKCjoQHZTWLNbSRiKhCKFGGmQ2Rwt
	YWO31P5RUmHSSQ7Vje5cp8BV192Ic1GnDQzP5EppFJnInhKiduWDokol3vXH6sak4Ql+
	yDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ClZ7oCcecOu1dhBVLGvIBNPeiU/8SW7A79kAmpRIgY0=;
	b=JPUsBNcglm1/LowlvpEqlnZyV1htsXmn4kYhJOzDoLnqP1LIREZ7bCzWR3OUJocwVL
	PKJ0sRwsLK60eOEUChyXFZ+5N7CI9EiKtlNMF4g4vAU00bP3hDDrP7t11x1jVIr5mZxj
	2FjAzVxrl983lQwvyeGHOUE94AXeUYfRYh7LCmMz3//6uZYGqZyA+YfwcE5ER4x8A857
	Ew1RGBJZ7dG+PEe3sx+Wauw0xLsUYoPDDg+Wh9MqrfYMXz9G/ontHZSZKL/TCChtkkfF
	XLK78HHGNvrsekZs7qBn1EMqFD9qnPUPfs5QFvV6L7dTgl/6vc1W9Vp2TXS89TUCg2pZ
	U9PQ==
X-Gm-Message-State: APjAAAUhdwladYzBkPgDG1nj4RUQKVSX7s4HDCkEViUxFhOqdQ8PBRnC
	L3pDRI9yNDToZGyWtKJAhhjPl/UE
X-Google-Smtp-Source: APXvYqwYclIPJG0td5W4+k75dBBF1+0FuWTZD7YFs9j1uzLxHMyTXrMdrBNcJKFvanAkEZ/UyTN9rA==
X-Received: by 2002:a5d:6b43:: with SMTP id x3mr25600143wrw.76.1553700942915; 
	Wed, 27 Mar 2019 08:35:42 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:35:06 +0100
Message-Id: <20190327153509.23928-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/15] gnome-desktop3: upgrade 3.28.1 -> 3.32.0
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* gnome-desktop switched to meson
* 0001-Disable-libseccomp-sycall-filtering-mechanism.patch was on conigure.ac
  and does not seem to be necessary anymore

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ibseccomp-sycall-filtering-mechanism.patch | 45 -------------------
 ...op3_3.28.1.bb => gnome-desktop3_3.32.0.bb} | 16 +++----
 2 files changed, 8 insertions(+), 53 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop3_3.28.1.bb => gnome-desktop3_3.32.0.bb} (54%)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
deleted file mode 100644
index aa11e8a62..000000000
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-Disable-libseccomp-sycall-filtering-mechanism.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 96753d85d8b53dd8f87b8f444892efffdbfab388 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 5 Oct 2017 14:54:17 +0300
-Subject: [PATCH] Disable libseccomp (sycall filtering mechanism)
-
-Upstream forgot to make it optional, and it is not currently used in Yocto
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- configure.ac | 20 --------------------
- 1 file changed, 20 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 118d04f..47c8894 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -151,26 +151,6 @@ fi
- 
- SECCOMP_PKG=""
- enable_seccomp="no"
--dnl Check for bubblewrap compatible platform
--case $host_os in
--  linux*)
--    case $host_cpu in
--      alpha|ia64|m68k|sh4|sparc64)
--        enable_seccomp="no (not available on this architecture)"
--        AC_MSG_WARN("seccomp not available on this architecture")
--        ;;
--      *)
--        PKG_CHECK_MODULES(LIBSECCOMP, [libseccomp])
--        SECCOMP_PKG="libseccomp"
--        AC_DEFINE([ENABLE_SECCOMP], [1], [Define if using seccomp])
--        enable_seccomp="yes"
--        ;;
--    esac
--    AC_DEFINE_UNQUOTED(_GNU_SOURCE, 1, [Define to include GNU extensions])
--    AC_DEFINE_UNQUOTED(HAVE_BWRAP, 1, [Define to 1 if Bubblewrap support is available])
--    AC_DEFINE_UNQUOTED(INSTALL_PREFIX, "$prefix", [Path to library install prefix])
--    ;;
--esac
- 
- dnl pkg-config dependency checks
- 
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
similarity index 54%
rename from meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb
rename to meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index 39b3491fd..185a25359 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.28.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -6,21 +6,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 BPN = "gnome-desktop"
 
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnome pkgconfig upstream-version-is-even gobject-introspection
-SRC_URI[archive.md5sum] = "bcbf906d94eb08060c60a7364384d678"
-SRC_URI[archive.sha256sum] = "78a397a2be47586e6dc075d6a7fc5659aae3d10713d76994ce1b46086e7ecb9a"
 
-SRC_URI += " \
-           file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
-           file://0001-Disable-libseccomp-sycall-filtering-mechanism.patch \
-           "
+SRC_URI[archive.md5sum] = "e423ed6d648c6c4f9798fa9cd9ea8d99"
+SRC_URI[archive.sha256sum] = "a6393dc5fc29fc0652ac84c73b3da205d0b0168128c4cf6d27797a08f3d07b54"
+
+SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch"
 
-DEPENDS += "intltool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
+DEPENDS += "itstool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
 
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = "--disable-desktop-docs"
+EXTRA_OEMESON = "-Ddesktop_docs=false"
 
 PACKAGES =+ "libgnome-desktop3"
 FILES_libgnome-desktop3 = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop*/pnp.ids ${datadir}/gnome/*xml"
-- 
2.20.1


