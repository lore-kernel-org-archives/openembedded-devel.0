Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D01C072DD
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:34:57 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.32318.1699860891324889419
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ji6u7EV7;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so2263900a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860890; x=1700465690; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkJ2kORoGpmKePHNxQNduCuOxOGBtgDMaJr83/mBUOI=;
        b=ji6u7EV742s3qD01CdKkxPiw0l9JGoMX8ANYR0ElVuwJGQfmtP0qNhUuSEJXwPuzkn
         5zc0gi92iCbGOmFtNpUH2M2MBdywptvfRfzLEMbZH7mocNQtogzjUiDPYhwXGHTGaTfB
         M8Tu7QOTZGjnwYyhcVABseTMwCNOTH9TKYcsUbi96yV8I457+OoEN6iAaX10O0KlZr36
         m/HRWwA5EyCQ+/Q1ZmyiUbwcbHpBF/ru5agvnNz15A3Zu8voehq7ogrwuEvpX1wFHfL9
         sxqzDUDcKFWU8AQxl7Y4CmNSTNoQoaynHujlbBBFHzUnMuYdXtQ/LQLHZC6c/MBzFf6d
         W++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860890; x=1700465690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkJ2kORoGpmKePHNxQNduCuOxOGBtgDMaJr83/mBUOI=;
        b=OPvMX6ZXbqEOGOH624lpywPv4P9TPjYRNZDkZbfOFzMWeqNV8QhG8PR8oopx7gB5Ch
         ak0OHxEEbEqe+dYvmG6zypdpXaJueGUzCshTNZtztvl/j6Wgz5Fa6ZYXOceydXJu1oew
         ypHPeR3kQew4vawjY1HEo3MKodSmbdDPDK2k8MM4SkNvkW3ModnNF4rVIakiX6i4wR39
         +9ddJF75rsjR6z3QSQu9lT6X/qBKD7oA4hj40Ks6JW9GATf3XMwuR6necCWZIUi4RXyp
         CRuQzgTYC5Vy39/pbcQQzprI1kOqNZ4F8eZXCRwuxHshsZYhI9cOCFffn1TVMyq0JE3O
         uz+g==
X-Gm-Message-State: AOJu0Ywo8gtv7a4ump/Ugwmx6TLlRJCQE5dT+09YM+Wr/liey8+HR2ZG
	HBBcjIJKntpvN7poSIrS7sBcShAqoDfTLw==
X-Google-Smtp-Source: AGHT+IGFHr+Y3XST82m7nUmGWvt5iVIR6PPdmLchOPyJGGFJQRISdcsxEXIqFd2QoTmVZ/ZfF5g1wA==
X-Received: by 2002:a05:6a20:4293:b0:186:9314:6254 with SMTP id o19-20020a056a20429300b0018693146254mr1756465pzj.29.1699860890372;
        Sun, 12 Nov 2023 23:34:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm3509691plx.281.2023.11.12.23.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:34:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 23:34:46 -0800
Subject: [PATCH v3 2/6] meta-oe: Use autotools make system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v3-2-51f4c8091bc8@gmail.com>
References: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
In-Reply-To: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106628

OE-core is switching to default to meson for gnome recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb | 1 +
 meta-oe/recipes-devtools/glade/glade_3.22.2.bb            | 2 +-
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb                | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
index 7b5eecf54d..0593469a45 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c4f38aef94828f6b280e00d1173be689"
 
 DEPENDS = "glib-2.0 libcheck openssl libidn"
 
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gtk-doc
 
 PR = "r2"
diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
index 28b1279390..3936e04c6d 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native \
            gnome-common-native \
            autoconf-archive-native \
 "
-
+GNOMEBASEBUILDCLASS = "autotools"
 inherit features_check autotools pkgconfig gnomebase gobject-introspection mime-xdg
 
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
index 54e75a20d3..87b0f5e65d 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "atkmm pangomm glibmm gtk+ cairomm"
 
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"

-- 
2.42.1


