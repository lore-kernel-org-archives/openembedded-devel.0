Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.4817.1612018674961978135
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 06:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uLtcL+rF;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id d22so13923558edy.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 06:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=98nuI3/mhMoHUvU8MaVZ/tkngV4vedogsRXnkD2dVL8=;
        b=uLtcL+rF+eHuFi4C2o1AprzPbs0s3drX6Xqu6TlDmGuijrFo3MDKHACFzH5ufzSj5E
         3XAUfIsXhNxNcVZKNuRgiPp0RPkOauNQXJvn81CIPrW0ZoPJN0HGU0nGcaR71wvHVA2g
         yTB19u9+n4hKx2Q1mW8P9CxmEanlba5tLNzfkksGel2BvvTJ6NU0prHLygZ2C4UpYu3a
         kxzbyjhsJ1l6X7TojPvfdkzqaAQRVAbFhd7XWsF8Q2apH6UnmbQZdTqAfgZyyS3g56sV
         6UJRL1zU529yTrgY9Wg4vRnRHWXJFPKmqpWE+nVUAvmBTdcqgkE6Zwy7B1WlRe8owFVa
         ++EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=98nuI3/mhMoHUvU8MaVZ/tkngV4vedogsRXnkD2dVL8=;
        b=VntesF7R3ybckHBQmvyT0J80PhrUpWi76k3TaRBFOTUqfO7+XBRdoh108jea+NdJIe
         99UTr8vy0lWdag8pmp1ovbxBDzy9jS/1GiM6KLWgKAFlUuf8SnXF9NI8XyOqNfBovsnO
         ldjYsE4psJA4+DTv8MS+9hCfBdlpK5G8dE5dW8zGnP8tQkSPqyzbJkgA8dzeOs/5sBag
         vGxPFvowdF4goaL+8RrzHiAca+ELswLtrXnMQIUckaIHoK2YaCoMY+fJuHsfXGwH5M4I
         0hjpLVd9Od0HxVVN8pQnV8gli85Dym2DH0KUt+IV0QPNnZ2JrcaYlxAAg7TL0Dx+OMAG
         rm5A==
X-Gm-Message-State: AOAM531/qCBArSwoj46NYyXOVazbu3dcejOfNjwqDMB/rcvguKk/zF4/
	n2F4RYnDxoekwghQUa2O68QVzpL8J/E=
X-Google-Smtp-Source: ABdhPJzn+/Y8vUNu5kYSxabbPNvgxcLXmaDPL4usn+OtjPtXdvDihXnn0InjBDp5XXc4w9YV43muvA==
X-Received: by 2002:a05:6402:31ac:: with SMTP id dj12mr10229617edb.44.1612018673327;
        Sat, 30 Jan 2021 06:57:53 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id x20sm5231809ejv.66.2021.01.30.06.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 06:57:52 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] zbar: use 4 spaces for indentation
Date: Sat, 30 Jan 2021 15:57:46 +0100
Message-Id: <20210130145746.9502-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210130145746.9502-1-Martin.Jansa@gmail.com>
References: <20210130145746.9502-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/zbar/zbar_git.bb | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
index 5cb7baae33..a33aa2c960 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -10,8 +10,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5e9ee833a2118adc7d8b5ea38e5b1cef"
 
 SRC_URI = "git://github.com/mchehab/zbar.git;branch=master \
-           file://0001-qt-Create-subdir-in-Makefile.patch \
-           file://0002-zbarcam-Create-subdir-in-Makefile.patch \
+    file://0001-qt-Create-subdir-in-Makefile.patch \
+    file://0002-zbarcam-Create-subdir-in-Makefile.patch \
 "
 SRCREV = "89e7900d85dd54ef351a7ed582aec6a5a5d7fa37"
 
@@ -21,15 +21,15 @@ PV = "0.23.1+git${SRCPV}"
 DEPENDS += "xmlto-native"
 
 PACKAGECONFIG ??= "\
-        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
 
 PACKAGECONFIG ??= "video python3"
 
 inherit autotools pkgconfig gettext \
-        ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'gtk3', 'gobject-introspection',	'', d)} \
-        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
+    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gtk3', 'gobject-introspection',	'', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'qmake5_paths', '', d)}
 
 PACKAGECONFIG[x11] = "--with-x, --without-x, libxv"
 PACKAGECONFIG[video] = "--enable-video, --disable-video, v4l-utils libv4l"
@@ -40,15 +40,15 @@ PACKAGECONFIG[qt5] = "--with-qt5, --without-qt5, qtbase qtbase-native qtx11extra
 PACKAGECONFIG[imagemagick] = "--with-imagemagick, --without-imagemagick, imagemagick"
 
 FILES_${PN} += "${bindir} \
-        ${@bb.utils.contains('DEPENDS', 'python3-native', '${libdir}', '', d)} \
+    ${@bb.utils.contains('DEPENDS', 'python3-native', '${libdir}', '', d)} \
 "
 
 CPPFLAGS_append = "\
-        ${@bb.utils.contains('PACKAGECONFIG', 'qt5', '\
-        -I${STAGING_INCDIR}/QtX11Extras \
-        -I${STAGING_INCDIR}/dbus-1.0 \
-        -I${STAGING_LIBDIR}/dbus-1.0/include \
-        ', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'qt5', '\
+    -I${STAGING_INCDIR}/QtX11Extras \
+    -I${STAGING_INCDIR}/dbus-1.0 \
+    -I${STAGING_LIBDIR}/dbus-1.0/include \
+    ', '', d)} \
 "
 
 TARGET_CXXFLAGS_append = " -fPIC"
-- 
2.27.0

