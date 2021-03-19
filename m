Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.1331.1616178825485242590
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SN22v2A+;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so7130260pjq.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Mar 2021 11:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Llq0xoADTq2yRRHZnNAhPLj6sA7yyr/pTwlfdb9movk=;
        b=SN22v2A+GdaNlr7N4RYyob30mBerwIB6x7pepzJZXDjEoyrzB0XKL45w4a8/INjfKU
         Gl9YsYSJa87LyHEREUp2TS8wBuBOhMy9qeJpTySJ6A1Q7/GFBy98eAr2UTM6cMplY4Ii
         uOV6N37hoCfpJlxtMJC+a/b4EZofppsLzgUsBNqqQWD15zKyRub0KNiSn6cFNcNUM2sq
         D5xy8HdJlL1FNHFZjkt4dkl5xBbqj5iH5yXslWN+H38ZxcRs8+aYNHuWr76mP5O9wOaq
         j5fB5VyKD1A0J8Vu9B2ufoS186pv+Dxtq3mXuMpc9hMOz1VrA7Mz8c6jRPcOkNUKq+Ys
         aC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Llq0xoADTq2yRRHZnNAhPLj6sA7yyr/pTwlfdb9movk=;
        b=tTB8GFa2NDRwsbHAaV2/49eSEscQ6f3JJYGVXOIz/AnJONJc6gc/MF6oED7tF4Cj+3
         jdUHZcxnKGKUh5/ibWBpjc4xkZ5umbj2nYTfVR5aIm2BGuvENnT2oeTvK1oZJmY9x03y
         iBrA+xAJflGHnf17FrbZPNhQ03QgMSSN+xmSykt9N0KGBoE6POvcJQx25z07UOmxTFv1
         aWqzgPQlNODfk9HU+R1XnLMAEA6cXb4RliNREAJ815PTDqOu35feAbKrXj9YuiMJjtOR
         RvL+0byssn1aRvO1m+rKiDosQhLDYVDRLYQiQc3+D32Rw3cR/YK+dcvb8htGus89lNBX
         v4cA==
X-Gm-Message-State: AOAM531sP+UMH8KliS9JhNMA0zRE0BQT/9blxWIeUJu04C1ZXIg6FPuS
	ABbUL9VNZxeWmxsigihYt8BuIGg1YD8fTQ==
X-Google-Smtp-Source: ABdhPJwDxvRM/eSLKJhdNPS98Zx81p53QTxfBbnTqj2aHLmjhthHC0TP6daPUlmSOyqlINztqUQs3g==
X-Received: by 2002:a17:902:70c5:b029:e6:cba1:5d94 with SMTP id l5-20020a17090270c5b02900e6cba15d94mr12767616plt.84.1616178824655;
        Fri, 19 Mar 2021 11:33:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id f20sm6378216pfa.10.2021.03.19.11.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:33:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [oe][PATCH 2/2] layers: Drop gatesgarth from LAYERSERIES_COMPAT
Date: Fri, 19 Mar 2021 11:33:41 -0700
Message-Id: <20210319183341.1308949-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210319183341.1308949-1-raj.khem@gmail.com>
References: <20210319183341.1308949-1-raj.khem@gmail.com>
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
index 343f5209c1..ae93a36b45 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_filesystems-layer = " hardknott"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 5e92cdbd7a..ba2d599482 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_gnome-layer = " hardknott"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 92df5794d0..d1d6693736 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-initramfs = " hardknott"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index a27b97de0a..6d3de7c118 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_multimedia-layer = " hardknott"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index c28c7bdb6a..968b216010 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_networking-layer = " hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 3de3015509..bfba7e7b11 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -38,7 +38,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_openembedded-layer = " hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 2209d3d43f..87bb91f618 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_perl-layer = " hardknott"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 321d0da5ed..ab66ffd8e1 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-python = " hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index d95d32877a..7bb4978921 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_webserver = " hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 5674ab512b..b1240b06e9 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_xfce-layer = " hardknott"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.31.0

