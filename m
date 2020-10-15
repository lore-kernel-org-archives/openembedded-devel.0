Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.19415.1602786628870967112
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2020 11:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sUpED6Z9;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id e7so2520165pfn.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2020 11:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J39+4yxw2pXxNHS1FkMLiL79x9/Vwi86OIOLMGn83V0=;
        b=sUpED6Z98a4j9dL+JASdvL9AnwACvgNAcADQ2aodY0QI0xZyA4v4TZ9j1l7zmuEK4m
         bdtH8lFOPENzQ3TNiqJjC5BBhKHGX66IcIF+h5Keivf7q1DZ16tHVr2pInqawvLu8EfO
         wGorwesiVk7aVqts4wif1BJ1StZMnWrShtYzTsPasjyFFNUZSK3fwdZSbePqxn9iNZLX
         /rodEqxt72x1q0+eFaSu7V/oBxrASoiYzGxQzF2QqiybphmCv/WxT9d4jbkvdeZS17c9
         bHzmgaWeXLNft3j1JoyfkAayZUY+nkddCPj/SrCTbZwwSYAzL31WrW+0snPoC7IWTEP/
         22yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J39+4yxw2pXxNHS1FkMLiL79x9/Vwi86OIOLMGn83V0=;
        b=M5Sq5gIE0r7mlGNu78jf8Nz+CMbtmYQ7XD9wxBtgpCADDZ0dtMdgxl5iIn83Nm7CSO
         vHSKHxp+kqvLVxJQa+lpBYN7hg/22/zLfrCwVQRoUmVmFNzBeJGkyCIxzspl2tz6ZLlV
         Jj3C/2+HLg0+jl8p2iIVLhlqADHQczbPImjs1JxI8iKAKA17/WOoXVEdKLLjnPx45Yy2
         KywXSB3ciPpLkL4mTzfYqQRpJrosvXTs2x1V8eccQ/W2+YBd7YsCwJwG0NGkCKAWobd9
         VUi04JwoNNX/VhOlZ+JTNlW6/tM7lgGOBN6H4q8Xnpr8vBkoH66MJZ6eqpHGNCMzt8lu
         DzSA==
X-Gm-Message-State: AOAM533shyGUJKV9y2M7L9tHYW//qINUTCB8fTrAvVoKTFfTcJJYIhUZ
	qFXK3jjte1z37nJndZAvkqEN9+gkEDj9Ew==
X-Google-Smtp-Source: ABdhPJwkYElFehZ+FnqLLJAkdUx4sQU/HGpF3VlvHdgq6e3yIHPUNpVMF0Uyej8HABl9o/fxGS78WA==
X-Received: by 2002:a62:ab0e:0:b029:156:1dfe:ae74 with SMTP id p14-20020a62ab0e0000b02901561dfeae74mr5006996pff.7.1602786627991;
        Thu, 15 Oct 2020 11:30:27 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id m6sm44690pjn.47.2020.10.15.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 11:30:26 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] meta-openembedded: Add gatesgarth to LAYERSERIES_COMPAT
Date: Thu, 15 Oct 2020 11:30:22 -0700
Message-Id: <20201015183022.991822-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove older releases from COMPAT

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
index be1635deea..47c99063fa 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_filesystems-layer = "gatesgarth"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 7706b7ca6b..ac581e6939 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_gnome-layer = "gatesgarth"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 634e0883c6..9752a5a2c5 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-initramfs = "gatesgarth"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 2d52fb938a..be0e2b362e 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_multimedia-layer = "gatesgarth"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 7bc0702ba7..bd0a44cae6 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_networking-layer = "gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5b79b59b71..a964a99fba 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -37,7 +37,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_openembedded-layer = "gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 1361fe0842..f97527c554 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_perl-layer = "gatesgarth"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 0dbc4296eb..47ab154b54 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_meta-python = "gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 24469115e4..94489983e3 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_webserver = "gatesgarth"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 7e4bb178e0..a71eb8fe58 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell"
+LAYERSERIES_COMPAT_xfce-layer = "gatesgarth"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.28.0

