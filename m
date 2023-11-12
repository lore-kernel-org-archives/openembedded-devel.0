Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE50EC4167B
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:18:03 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.22514.1699820273774772166
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SmG2csJf;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3576e74ae9dso15947705ab.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820273; x=1700425073; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkJ2kORoGpmKePHNxQNduCuOxOGBtgDMaJr83/mBUOI=;
        b=SmG2csJfn7Otg9KgKnVva39DOcEJCQrF2b7uWwcRry0YTotRPBNrKSyT1xNs1DGX1q
         TRlFbXWdV4vLo7v/hKj5WKInjTfpdXWooc3xphe/prmqSeFDYxsACah5d5fB5/H5XK59
         NadrdpQqJJBIBpSSmBUvb6sHLtai3qZo2TC3O8+PFt07X602YZucln6AQMJ6N5OcmCFJ
         lZ4L0bfyoID1qfMP4kk4TE6mSlpZHJzcEqG/rdYDrNOSYrUOV0wgBHdsjiF3RcxXm7DX
         PxkSIz9BCMaKMVwRHP9CQGbfNkGB9eXekC7OZpik6e0MwqK2M8H2ELSW/fqFAOF7YxK6
         Y0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820273; x=1700425073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EkJ2kORoGpmKePHNxQNduCuOxOGBtgDMaJr83/mBUOI=;
        b=vuOz1go1TVKunOnQ9Yh0EnZfKGTV8VT+qkt4qkLwlBm4Ptp7eYH9t4MUhPyBMkPUhd
         DFvG3/vfOle+NuctnFEJeUDaQNeiRsgGn7ge9MwouE6JnFwxlPVRNIvnz0VOqgRcpiIE
         GoiYp1ngWVfB6D/mLqdlALAESdZhCN9RUNyPhYZOnTci8e71pP7tKFDFz5+oBPLZK5e5
         trFT5ceRgBGg7er33keyHGoDZPc5jM8lte0gCEpm+ghmHU6YP0MDfwN2wO7NsmsFEYUN
         JtsBkQ5wR922pVAFevMFsV6Hz9wBiiGg00eV59x+Pkc1GqOdhAKLtVIvtEHR1Axdkvjq
         4mSQ==
X-Gm-Message-State: AOJu0Yy74hy+d3hyTs55gYkB7tDpGzU1F+q1HKml3NIDDQhUqROE2K5c
	AtsGu1cZP6DVhhRrGxUzr5Q=
X-Google-Smtp-Source: AGHT+IH6cvioDMebWYwUKLfsKXTZ50OktAvzDz7pXcXJ2jqo66gx0DH1jvCPAvLcxSJfVViDlO9Mbg==
X-Received: by 2002:a05:6e02:b27:b0:359:48ed:facf with SMTP id e7-20020a056e020b2700b0035948edfacfmr7525943ilu.13.1699820272841;
        Sun, 12 Nov 2023 12:17:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id u8-20020a63df08000000b005ac384b71cbsm2954892pgg.60.2023.11.12.12.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:17:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 12:17:49 -0800
Subject: [PATCH v2 2/5] meta-oe: Use autotools make system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v2-2-f38d4f960d44@gmail.com>
References: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
In-Reply-To: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106606

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


