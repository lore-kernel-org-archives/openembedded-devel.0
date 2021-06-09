Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.4433.1623220738666271176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i/2/k/x6;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id ci15so36650486ejc.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/mWdZmarwkRIMwx2B0L5zaveqtBWJuzveYs9cMNXw6o=;
        b=i/2/k/x6iu8DgQMjItBrlJas296nIuQd2rjEHG60QiAI0YcxvQFbLsctft5e6Ncg1w
         u+7jWx+Uspdc2gL8Is7nbHirK5YhZWgicJov31jD9Ae7DSHx3jr/6GwLLaOnBLjLTtho
         ap7LNsAcKTgpLO/lSLXX7LyA/5loYhBDW5CLtTaZNubVQw7ai6rs0Cx3g4+1tdu/eXfp
         pg8SpuJJWSHDIO/FJTOZzUJ77ueQDZA8VScw9YtGKCrxydyEbv9wj1QsjU3Zda/twlu4
         Iuz+G1JilqAN9DpcPYQADs0T7CeN5Ezlsl/49fEXhMB+TnN+hDn0Pj3H4w0NNt16I26E
         Lbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/mWdZmarwkRIMwx2B0L5zaveqtBWJuzveYs9cMNXw6o=;
        b=UWO7X/QT2YyNHI8vmqq9qscFBMpvDgfMwqHAOBNKq90AdxGHJGoe/3b6BMe8O4DGZW
         PI8QSMhXUGYZ7YrkBuPSIvpUwyoIiFXIFlOMNqmOZDoN8UXUv2vaPV5MpXd1R5K11VqV
         ioI3OBkq/GpRt3OhN2RyHQMTETDlfKfJiLDxDns/mHOQR9zFH4F43992JonpjX8lyv7l
         sOYi7KF2qdZ6zms2DAhJ4agNZV9LI2NpoB2vlN6ncg/z1wX6z6+3/1UR7waEGRUIhssx
         7o+GuAOTjRgmB44P5CRtBmORPQEIK0w+/ZfF6R0BezB7o9IOTafXHp2XYebuQPCFeYU3
         eXLg==
X-Gm-Message-State: AOAM531+JVJV5z0EscUXujihVEzVq8A9nisX3y6txCb7VbDEAsIX6Gxo
	ttGKysxj1KJspllMgCfUzob7vVPGXo5uIQ==
X-Google-Smtp-Source: ABdhPJxKKErr4e6MfBR5wL1itb1XS7WrLiamLIlhLegLvJvVzk/dnUY26UKjKtOGwfkWGL312aPkGw==
X-Received: by 2002:a17:906:a294:: with SMTP id i20mr27335427ejz.330.1623220737254;
        Tue, 08 Jun 2021 23:38:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 20/28] libsigc++-2.0: upgrade 2.10.6 -> 2.10.7
Date: Wed,  9 Jun 2021 08:38:23 +0200
Message-Id: <20210609063831.3400611-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2.10.7 (stable)

Meson build:
* Make it possible to use sigc++ as a subproject
  (Kjell Ahlstedt)
* Fix dependency on files generated from .h.m4 files
  (Kjell Ahlstedt)
* No implicit_include_directories
  (Kjell Ahlstedt)
* Make quiet installations possible
  (Kjell Ahlstedt)
* Fix build as subproject without building documentation
  (Kjell Ahlstedt) Issue #71 (Xavier Claessens)

Documentation:
* Links to *.gnome.org refer to sigc++-2.0 and gtkmm-3.0 versions
  instead of latest versions
  (Kjell Ahlstedt)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libsigc++-2.0_2.10.6.bb => libsigc++-2.0_2.10.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/libsigc++-2.0/{libsigc++-2.0_2.10.6.bb => libsigc++-2.0_2.10.7.bb} (84%)

diff --git a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.6.bb b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb
similarity index 84%
rename from meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.6.bb
rename to meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb
index f4c5aa396..de1aa4ea3 100644
--- a/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.6.bb
+++ b/meta-oe/recipes-core/libsigc++-2.0/libsigc++-2.0_2.10.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 DEPENDS = "mm-common"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.10/libsigc++-${PV}.tar.xz"
-SRC_URI[sha256sum] = "dda176dc4681bda9d5a2ac1bc55273bdd381662b7a6d49e918267d13e8774e1b"
+SRC_URI[sha256sum] = "d082a2ce72c750f66b1a415abe3e852df2eae1e8af53010f4ac2ea261a478832"
 
 S = "${WORKDIR}/libsigc++-${PV}"
 
-- 
2.31.1

