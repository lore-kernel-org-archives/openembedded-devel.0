Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.48692.1591047950265949647
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M++PBxeq;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id v19so955423wmj.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Xoajb3koxsCrCz59Q047pJcu68YtxnXCjfyUDAjmDhU=;
        b=M++PBxeqDYFlcpkphQWTOrmcA4NgAk39y9vaAcSnbL2mjaXzIEZkE+0WcSych0KLja
         LfzgU3KmHyvNkDJzKaNjnd8fl0hZwSLX18dzQnZoEzHtkEJROryZ0OUjuV6O4kja1fUO
         jSk5iVhRwg9w74rvzOVEQ0t6Nam7QLdXvleu06F2CB2GHuEkZEn0/J1iXy0YMFVHdj5t
         0MmOGH1xdYtlLd3B+Ws7DxCMc6lXGQgXRij31izrPxzP0oxtOVGt7pw1XrkpdE8POYgH
         4edwHfEiZB0xNB81qCDE/D1gHCRwKsuDMxOyAkWFnj5OCWnRJ0yWQCtjWcv1Zxzib5LY
         PCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xoajb3koxsCrCz59Q047pJcu68YtxnXCjfyUDAjmDhU=;
        b=UW9ZV/datFuUIt9X2kyoN0OZiohjtIvAMp972Qv3n0sSdYYoPmZU4CfJ1ePqEN5lwq
         o7uMa321sfzFq2yJ5pI1fTH3PBU2leTpI301y3Q/EE7+2yZFRBxyeJ6dudlf8tSDgLPi
         JQVY75kEdO2HcSRIsq6BLLDF/uIKk4iiCyRjyyP4El7YpKGQAQcUpKebvUWAN2QDEPmP
         u3CrZqh+dG+KCEbqGc/HXaqO7a6GRZv9F998ZcHjsKZE1pBftzOQ12W0pPOV5zyAciwM
         YlIW8m5C3ksf0dXwpBBYAPrzcOKdFtTksiEPDJkLAT8QR71dEFxqyXGfYYF70RpXt97m
         6fjw==
X-Gm-Message-State: AOAM530K+ig+J7T+bvQcH4o0mqg5zS2Hokpkr8YvSCHLjVntYK5rGWND
	m/jwfGW3gndFKampnwYC8R7vvl5+SvQ=
X-Google-Smtp-Source: ABdhPJxeh2trGCYFEH8K++6T1Mcl22XFVVylvOIYRuf3sQzH7AqInf5dORT+XUuqRVOB4KCb5n1/kA==
X-Received: by 2002:a7b:cb91:: with SMTP id m17mr1213261wmi.126.1591047948502;
        Mon, 01 Jun 2020 14:45:48 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:48 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/38] gnome-panel: upgrade 3.34.1 -> 3.36.1
Date: Mon,  1 Jun 2020 23:44:59 +0200
Message-Id: <20200601214516.26624-22-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AX_ZONEINFO is gone -> 0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
can go

Version 3.36.1
==============
- Fix build with gettext 0.20+. (!15)
- Fix critical warning in fish applet.
- Fix XML namespace URI in svg icons.
- Load modules only with so suffix.
- Fix critical warnings when changing monitor configuration.
- Improve Adwaita theme. (!16)

Version 3.36.0
==============
- Add support for _GNOME_WM_STRUT_AREA.
- Fix build warnings.
- Updated translations.

Version 3.35.2
==============
- Add libgnome-panel documentation.
- Add prefer-symbolic-icons setting.
- Add HighContrastInverse, Yaru, Yaru-light and Yaru-dark as supported themes.
- Make GpImageMenuItem derivable.
- Updated translations.

Version 3.35.1
==============
- Fix crashes with libgweather 3.32 in some locations.
- Make new libgnome-panel library public (it will replace libpanel-applet).
- Default layout now can be configured from org.gnome.gnome-panel.general schema.
- Change default layout location, layout now must be in layouts subdirectory.
- Updated translations.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nd-ZONEINFO-it-tries-to-run-compiled.patch | 37 -------------------
 ...-panel_3.34.1.bb => gnome-panel_3.36.1.bb} |  7 +---
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
 rename meta-gnome/recipes-gnome/gnome-panel/{gnome-panel_3.34.1.bb => gnome-panel_3.36.1.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
deleted file mode 100644
index 6ab4daf02..000000000
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d4b2f0922dfdd6040e5e9f62a2565452cf855c42 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 21 Oct 2019 22:10:56 +0200
-Subject: [PATCH] Do not try to find ZONEINFO - it tries to run compiled code
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Missing configutation does not cause issues: The fallback in modules/clock/system-timezone.c
-matches our default.
-
-Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- configure.ac | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c75a9fa..0c9d945 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -249,11 +249,6 @@ dnl yelp-tools stuff
- 
- YELP_HELP_INIT
- 
--dnl **************************************************************************
--dnl Find zoneinfo directory
--dnl **************************************************************************
--
--AX_ZONEINFO
- 
- dnl **************************************************************************
- dnl Process .in files
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.36.1.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
rename to meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.36.1.bb
index 4d5fdb65a..8fe4e1311 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.34.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_3.36.1.bb
@@ -17,11 +17,8 @@ DEPENDS += " \
     gdm \
 "
 
-SRC_URI[archive.md5sum] = "cfd5d3fd548a2afdd8bd3bbdf9646bbd"
-SRC_URI[archive.sha256sum] = "a6bc0255252eeb4b964bcbe55fd7908b69f914c062c5ec8dff5ac0262d29b90d"
-SRC_URI += " \
-    file://0001-Do-not-try-to-find-ZONEINFO-it-tries-to-run-compiled.patch \
-"
+SRC_URI[archive.md5sum] = "b6bb185ce1724f4b19699042d90282a6"
+SRC_URI[archive.sha256sum] = "1e21b726dd397523ae79d29eb538bcae09e3427e23ccd63f28eb25ef3552abd3"
 
 PACKAGECONFIG[eds] = "--enable-eds,--disable-eds,evolution-data-server"
 
-- 
2.21.3

