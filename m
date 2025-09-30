Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3726FCCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:19 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.20998.1759223952663121165
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EcfGZfQi;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-4248a13fbe9so30486465ab.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223952; x=1759828752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMsPfAcSy57n7t42OVMRgKWfQeYDrf5H6EQSnnx2dG4=;
        b=EcfGZfQi9NQ2XFYUFtcxWnmXaxvw7JtHAhGAyhZTbOrfP36iYdGgX2qewqkJQDV8Pe
         YKQNoxKgaOWGOi5/HfYXgflMhEDK388Gl/au9u9VtSoEhimHMRpZU9CevzMIdwMy4thb
         ztRWG7tZ5M0jlsh16VOqSlNyzsuA0AZPQYTcDLi9UCgDqqb1E5aLxNIxFpAz6CBeErw5
         AoQCk3OffNht9B6CWgmYQIoH9G6jTsJR1F2t3VRoMYUPPtNaURwvT9ub8OCvy2XxqrUv
         RycnHYpcEArMRk0vtH2/5o87DbKFqjnb4DbGCtdqnKVQxri8cqWbE6ntOGnh6UV4BLor
         /RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223952; x=1759828752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMsPfAcSy57n7t42OVMRgKWfQeYDrf5H6EQSnnx2dG4=;
        b=ln9R9EaPOo1djkONCBGZGALi1bUXWUpI8CrRcQh4N+S6iPcBuKdhd9bm+4Zvf88LKR
         fJgazz5KM9911JB2zsX8r7fJET9tRDJLxWuwxa83aZB6QWu4rnGatopTUciViPkgmVCX
         qsc2pXxtaTpKCGtqnJQpCDUjDEQpNLztpjQozCMCVO0hrnWsWe513kap8B11/yI+ZQ7w
         9zAQpQu1eFp2SsIx++b+7sOWPx7Zdw0JuTN009fxvPJDzvXusFoBmyPV+f0+vMq6W0dI
         8s72AV9l0/h7MWaZKahoM8c0uyYvDNEsf3O0TBJbSif+ympfG4Enpjc28jxhobapdQSY
         R+UQ==
X-Gm-Message-State: AOJu0YzTiyLzY8nnh2DCPvjXkYV4o2iobZZlJ3S9WrfguaazRUnwJG+n
	qfNEpxX7le8+B4pDbp+JNlIGwocpEVhKwsMBHSBgp5XD+rG7nnCjVdZ3D8TaI6oT
X-Gm-Gg: ASbGncsTUzm2cllP+a+L0KFz8df6CBBjOmS7+wQt5CKS3G+39h7LOHvnTYsKUCVfzrF
	Ojj0obOJZFPWelZR9KTl4Y0ElyG+nxAFNIZEQXdcNXa1eYu3ZqNdpvo7LLY9aLfW0HYKt1qof55
	ed6fFjWGAZNPVKgX4hnKSWgQ+CVW0AgjykcaP5153Q7k5QyXya01INtZzrpm6+ZyGs90928oRmq
	wJqSWidFDlO0KGmYFes3ETDLCgyWh8dkFkhNC4LRZNKcwCDXgXbWrimu5zOwD2gAVuPitCflIDu
	rNBYsKNph7GJUVA8+S+T/5didi/YEqBClr7/qDeBx+qaYbzEmI9ib1KD+kBx35DOce/spChn3sY
	5IZpnftIJGJTljxjU8n5Pzo0EKJA/a0FV6OjbQvwgGU/ZnJ03O13xeCtmy3cjW7Tuzbn9AIsY3p
	k=
X-Google-Smtp-Source: AGHT+IGBCG/Of1TiE6qiMBoPQd141sCyRVocoTJ9KGfmYsFNakeO0Bq/3g1LSicgx6nMnOxI7uCPwg==
X-Received: by 2002:a05:6e02:194a:b0:428:306a:175d with SMTP id e9e14a558f8ab-428306a1868mr193185585ab.28.1759223951649;
        Tue, 30 Sep 2025 02:19:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:11 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 09/22] Remove the use of http://ftp.gnome.org/pub/gnome
Date: Tue, 30 Sep 2025 22:18:28 +1300
Message-ID: <20250930091841.1693131-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120061

From: Jason Schonberg <schonm@gmail.com>

Use https://download.gnome.org instead.

In SRC_URI where the reference is https://download.gnome.org/sources
${GNOME_MIRROR} can be substituted.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a9b7b0113da50cafed11a2c36b57629c5bfee33c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb    | 2 +-
 meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb       | 2 +-
 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb  | 4 ++--
 meta-oe/recipes-devtools/glade/glade_3.36.0.bb                | 2 +-
 meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb | 2 +-
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb                    | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
index ede57bc3ec..9a3ddfd15c 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.12.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.12/libsigc++-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsigc++/2.12/libsigc++-${PV}.tar.xz"
 SRC_URI[sha256sum] = "a9dbee323351d109b7aee074a9cb89ca3e7bcf8ad8edef1851f4cf359bd50843"
 
 UPSTREAM_CHECK_URI = "https://download.gnome.org/sources/libsigc++/2.12/"
diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
index b3875e8436..38a80bbf3e 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-3_3.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=959bffe2993816eb32ec4bc1ec1d5875"
 
 DEPENDS = "mm-common"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/3.6/libsigc++-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsigc++/3.6/libsigc++-${PV}.tar.xz"
 SRC_URI[sha256sum] = "c3d23b37dfd6e39f2e09f091b77b1541fbfa17c4f0b6bf5c89baef7229080e17"
 
 UPSTREAM_CHECK_URI = "https://download.gnome.org/sources/libsigc++/3.6/"
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index 58aa3216ea..c56160571a 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Proxy libintl"
-HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/"
+HOMEPAGE = "https://download.gnome.org/binaries/win32/dependencies/"
 SECTION = "libs"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/src/proxy-libintl/COPYING.LIB.txt;md5=bc400bc21422f9a92e76ec2c5167ca2e"
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${UNPACKDIR}/src/proxy-libintl/COPYING.LIB.txt;md5=bc
 PROVIDES = "virtual/libintl"
 
 SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${BPN}-dev_${PV}_win32.zip \
+    https://download.gnome.org/binaries/win32/dependencies/${BPN}-dev_${PV}_win32.zip \
 "
 SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356f9ae91"
 
diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
index 01f0792ca9..3645de3cc3 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
@@ -15,7 +15,7 @@ inherit features_check autotools gettext pkgconfig gnomebase gobject-introspecti
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.36/glade-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/glade/3.36/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
            file://CVE-2020-36774.patch \
           "
diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
index 90756dac36..61deceb7a3 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
@@ -1,5 +1,5 @@
 SUMMARY = "GTK+2 standard themes"
-HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/gnome-themes-standard/"
+HOMEPAGE = "https://download.gnome.org/sources/gnome-themes-standard/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome"
 
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
index d55aa8d285..2ca2bba0aa 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
                     file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
                     file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://xsettings.patch \
            file://toggle-font.diff;striplevel=0 \
            file://doc-fixes.patch \

