Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.4379.1623220734225267945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZcAR3rom;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ci15so36650247ejc.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jFSayw5ZaxlXxnu2M2bJi/Ie2vBbNBYa1knSAhH04Ys=;
        b=ZcAR3romq551VvXOrpyCvUNrd9L5hnGvJf0IcOW2ANtMEIITSCnhz3JRT9dTKemtuQ
         L+Y9Nl79xzDv9lber5B5H82lzd3xraWHqdvvPeW7lFmDZTs1F7DjQhXMX9Fbd4ITs62W
         0iOSQTqhUyBuO4n8lps8T5MWsr3jwMDJxu23UlMIEVvR4QijeCXmlQsOzl8UUDGiTaDT
         mpY7mfKbdSh4zkYoVd+sq0J2jj2tHAB7JY/1g1GUbkcu9//dD9OvK7m6RfEOrTs2ObNx
         /L9BLhKSu0VDgVjQNM4T3/HFLvQHbdIEWgX/IFyr0EJJNOomGvvsZh5qxPVVZsoQzC0i
         cpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jFSayw5ZaxlXxnu2M2bJi/Ie2vBbNBYa1knSAhH04Ys=;
        b=mSxWT4mxFqszgV5eFFNSX0twb7WwmfnzfloLP+bkayo4BYAmqKoF/zjcQWkLhiRyY2
         B3TRodlRV4Bqw5GRDwkf3vjPblfFtVHB8YVQn7g+FiadHi+5f8GNrDbBV8zxwIvmmZsj
         WYu4MkPkVgiD5Rj04KP/4msMf/iI4gKLH8YeVgaoorwCyxzUgxV2OsI9Kt0grIkgUGAB
         YetZmFcJEcxSsthaX+ORhMbpBuTzExvEF7SDHvxZYX4evld+DSQKiFffJCO1cyXiAdjg
         RAXCqOOp98tWul8Z0Py6tCkfF+Kbvgv0aGpZpGEOGokFLObBZ7rZfrLIgR7xDtj2T182
         ty3A==
X-Gm-Message-State: AOAM532CoxwpO5x41bJEaSrAkKYAP3p+nyMoi5W6c/+/a/VpApI68fBK
	bXG6qE+w2wCgX2roH18Z4lPI5dTtdmuPlw==
X-Google-Smtp-Source: ABdhPJxlTT6lO3mT1k4MN9JkO4M2fNeF1JJBhLRXzFaU4eJmLr4eRa7QMfEGcaxrmqzH4ioYXiJCXQ==
X-Received: by 2002:a17:907:35d1:: with SMTP id ap17mr20226866ejc.79.1623220732743;
        Tue, 08 Jun 2021 23:38:52 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:52 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 14/28] gtksourceview4: upgrade 4.6.1 -> 4.8.1
Date: Wed,  9 Jun 2021 08:38:17 +0200
Message-Id: <20210609063831.3400611-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

News in 4.8.1, 2021-03-02
-------------------------
* Fix highlighting in presence of byte-order-marks (BOM)
* meson.lang: Update keywords to 0.55.3 syntax
* cmake.lang: Update keywords to 3.18.2 syntax
* go.lang: make "0i" syntax highlight as integer
* Translation updates

News in 4.7.90, 2020-08-07
--------------------------
* Bump GTK requirement to 3.24 for gdk_window_move_to_rect()
* Use gdk_window_move_to_rect() to more reliably position completion windows
* erb.lang: initial support for ERB
* javascript.lang, typescript.lang: various correctness and performance
  improvements.
* Translation updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gtksourceview4_4.6.1.bb => gtksourceview4_4.8.1.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview4_4.6.1.bb => gtksourceview4_4.8.1.bb} (72%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.1.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.1.bb
similarity index 72%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.1.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.1.bb
index 5a420e615..f7d040d73 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.6.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.1.bb
@@ -16,9 +16,8 @@ inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspecti
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtksourceview/4.6/${PNAME}-${PV}.tar.xz"
-SRC_URI[md5sum] = "4d4cff3a57a371bff4793e97d50404ef"
-SRC_URI[sha256sum] = "63f487a7ab59612ffa9e7be1883dbd274ab1016afcede3239b93b0fc384df874"
+SRC_URI = "https://download.gnome.org/sources/gtksourceview/4.8/${PNAME}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "d163d71b5fcafbc5b1eec6dd841edbdbcddd3a7511cd5fdcffd86b8bbfe69ac1"
 
 GIR_MESON_OPTION = 'gir'
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.31.1

