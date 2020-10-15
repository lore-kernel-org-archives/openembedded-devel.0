Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.16228.1602778810825956249
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 09:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MjG15VX0;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id o9so1867349plx.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5t76m6CAcwzOovE29q3lsXMXugZaXEliqnoUA5S3xo=;
        b=MjG15VX0NMSAyMDH8plLeGqMVFcGAwVsGZpp6mIyRYsP2UChu1x3PzDvLmpHjptd84
         51V1Sib7GwlUa32f7/+pT+kDaiwGMtdDVOqduQjmOSCjrXTxosNRN69nkhgm/ynFcwn9
         euwhTsPDzzlzWYAm8gdg6gjHPpZ55fVRQ4Kx6wI5dWZDq4aoWXd0Cl7lmVBMsqNekzhH
         4WlxheAuGHS04yPU/SrAZOFD5bEoC26SOwPfCpAucRoKHJ8UI06C5/Cmpd87LUUc2Tz9
         8A0vH9VPV3WI9gAlde377sJJQNabCWlqYma/rdBuoYrYKBG15/BcYKmQX47ncRa/BuaZ
         fAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5t76m6CAcwzOovE29q3lsXMXugZaXEliqnoUA5S3xo=;
        b=nphbCCV31XcNgKvp7iRQCrUXblIJ8aRS/6+PVYNeoCOFWw0BcqhVaWdn+TAXsvgNW0
         oh1sHaDhGfYzjQ4p9w+zT2DNRHN8k2avMLwPPZp2OMg8xWjTQRdpoZzj2l33VZrZJNT9
         nB7VXxPTJyqkIGM42oIbUWtOa4YRyWbEZ6SalJ9hhIhK7OXXNdrDwm+RYzCQ9uwzN8Jg
         2rOq/sYiw8nrPwPiRp2K1atZCJA1rCJb57x9bWZxIWoPfJbBEUlvZns3PiTF7O6xVLtf
         vfYI4FxPnkxXHv1THxVyg5RtGQ3FJrjPHqmOc1k/9ecsag0fHS79rIoveL0toEvyUV2W
         TOlw==
X-Gm-Message-State: AOAM531Up5Ka4tiI4CjX/wJoE1C4EfsdnVJ1m3CGSeDF3++TS4U2XvjH
	0tVCcI8xt/KYSTBI3fMRSgVJcQF4Ly7PNQ==
X-Google-Smtp-Source: ABdhPJwp4/Rzy3kqY6e3xW5p8QRnsCdVwcAQwp5YYPUOGG7HeB1zDC+CeQK1/GMsaWAmBxvxcFB/Xg==
X-Received: by 2002:a17:902:bd48:b029:d2:8ce7:2d4c with SMTP id b8-20020a170902bd48b02900d28ce72d4cmr4649246plx.42.1602778809854;
        Thu, 15 Oct 2020 09:20:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id s3sm3694676pfe.116.2020.10.15.09.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 09:20:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] meta-openembedded: Add gatesgarth to LAYERSERIES_COMPAT
Date: Thu, 15 Oct 2020 09:20:06 -0700
Message-Id: <20201015162006.884875-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/conf/layer.conf | 2 +-
 meta-gnome/conf/layer.conf       | 2 +-
 meta-initramfs/conf/layer.conf   | 2 +-
 meta-multimedia/conf/layer.conf  | 2 +-
 meta-networking/conf/layer.conf  | 2 +-
 meta-oe/conf/layer.conf          | 2 +-
 meta-perl/conf/layer.conf        | 2 +-
 meta-python/conf/layer.conf      | 2 +-
 meta-webserver/conf/layer.conf   | 2 +-
 meta-xfce/conf/layer.conf        | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index be1635deea..745961e6ce 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell gatesgarth"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 7706b7ca6b..6629aa36d6 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell gatesgarth"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 634e0883c6..a459269d9c 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell gatesgarth"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 2d52fb938a..62b6946c70 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell gatesgarth"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 7bc0702ba7..cf46c69486 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfelli gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5b79b59b71..2620c5df0b 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -37,7 +37,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 1361fe0842..e3feacce68 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell gatesgarth"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 0dbc4296eb..f99aeea09a 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 24469115e4..2faec4c7a6 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 7e4bb178e0..0ae45a3959 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell gatesgarth"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.28.0

