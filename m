Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7415FC71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:25:23 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.23739.1750177520575286251
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NysGmH8r;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e73e9e18556so5658144276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750177519; x=1750782319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MW6l1/Rtclt0eTLkzE80si7K5O638jiYsD8eJcxtRk0=;
        b=NysGmH8r9sV0SFVOABi5AM8K8O3CVFk03KFbZisKcDCh9PJKKmOBr6HZowJIT6XnQk
         o7+4pBTGhSF9J9M8C2xnyVvs0oqXJ+N/T+h8O3WfPjKJDhXZnttE0i3wv3E9QD3Ew8xi
         oLzkM3ApJRTdcndOpluZVd0BOrRCEw9iTnrEV8+RkNx+NfZFPRohIfzkQfQkTxZ1j9b/
         D+SVMUeVVKjiixhARtFiMotTX7h1MsoBFN/h9LZfTasULzsyea5zS13XcmdRwn5PCPVF
         3vW5r4Zm1Hzvs56SG1584vnpMAk0Ks0gepZOrSvuopQEvssQl8f7HpskMg8c0ImnieeW
         9cIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177519; x=1750782319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MW6l1/Rtclt0eTLkzE80si7K5O638jiYsD8eJcxtRk0=;
        b=CsKlHO2cxJUAZp3dxf8afWBT5/mtsMThKecbiMW9lHTf4QSUWap4p5mMjo8ZBtaOGo
         ++I1AfIFAV6IZM5192rjzGVL2x82XCFHEw0/YAZRHpP1jDSA4yM/MSBtSvsEGXFmsc3z
         WJ8ahM4u2uG+q8iA3PoZ4SEtWpMnhqFmwbcjG5HPr5qr/Bd5ehhoUCeqVKngnxNs1BnZ
         AdB/Yo7f6rXLPqLuYykXi3M8kAUEJZtlX2UiQwIcY7qC/uuU05tsBtkuQj3UzIO+Fr4A
         JRLp7G0ZVVJ2aNtLlCDbN1LXUANf55PPVhA6FtPlCLwsVsFuqFuLF7mrCT3ps5JIV2O/
         77hA==
X-Gm-Message-State: AOJu0Yzqngb+VaK16jnD3x1xpulCHQntAi3h9yOHEI/mn3/rzfohINcW
	sYbYusVk1wCpSKioV6tfw54FPSO3+xYlb7447iFb/QQ4YY497BUX7LnNWIYeQUbc
X-Gm-Gg: ASbGncvQUcD6oyyJlA45OaWjbGzodAiSReoCqUJ2zjsxl88xkcc3HdTYtstCjmhkYJM
	7AR1kmEQtN8qcQxZvJfdVZnGnTV3ONIuK8MVshixxMQZrVZ5nuYGbsSHWolAX8HEAqYDG6My+ft
	imNX8MXyKtt9Ss+p+eI2shbeLU+Xpc0nFkY27w79sX0hraMVtVi5lsEBnr5tLVGpCUMJfkGgsRs
	5Ss3GEaC47rH4x1vUvAFombeQNPFUX48frpGm/OyGDg9h/Kz3ThzRxIbnXwnEjvQHRAWo/gAqs5
	eMIMxj/ALrZdBjJmeaWlPU0iYiP2dxpomUpy8SMNifaGUobxmwIDFvBOeUysqMscwXyZzw0Vw2F
	WjmraztF7GdKyx5o1+it2
X-Google-Smtp-Source: AGHT+IGldD23432+t702UEZv/oOmgg493mFyl6ODTinjcZOKjZBosvRIUAeivFZFSuqG8yfIyO1wQA==
X-Received: by 2002:a05:6902:240a:b0:e81:7e20:d737 with SMTP id 3f1490d57ef6-e8275c3ea1amr3811867276.18.1750177519125;
        Tue, 17 Jun 2025 09:25:19 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e317062sm3664032276.44.2025.06.17.09.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:25:18 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] Remove the use of http://ftp.gnome.org/pub/gnome
Date: Tue, 17 Jun 2025 12:25:08 -0400
Message-ID: <20250617162508.843704-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 16:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117929

Use https://download.gnome.org instead.

In SRC_URI where the reference is https://download.gnome.org/sources
${GNOME_MIRROR} can be substituted.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
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
index 85f85a4612..9dccd9b941 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
@@ -15,7 +15,7 @@ inherit features_check autotools gettext pkgconfig gnomebase gobject-introspecti
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.36/glade-${PV}.tar.xz \
+SRC_URI = "${GNOME_MIRROR}/glade/3.36/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
           "
 SRC_URI[sha256sum] = "19b546b527cc46213ccfc8022d49ec57e618fe2caa9aa51db2d2862233ea6f08"
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
-- 
2.43.0


