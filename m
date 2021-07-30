Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.21314.1627633319836752738
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 01:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JvQHAJB1;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id p21so11972062edi.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 01:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iqOLUbeV7fQrdAuB1kOlrO/56L0ShoplPAkMbDlzW+0=;
        b=JvQHAJB1nwJ6UifbcCA5cLyAJshc/NxldiLa3OQXP9JoBygwzOlH9msOpwG7y2CP6T
         rKqVQycaTT0ebc4VLtGxPF0iXOeltPrRsMcPsmXUZMwKXWp+F43RLdMEn5cap3qz+5lj
         7f5v6cjpK43JnoOe8jMmn+HHCxSjR9dSmqNnM2QpZ6nz8HIWKzqZzIFCReRUHdZ4RLGu
         Ga0uDs4Bp8oJPWVXl4trFLj5LnhndH6nnytPnpC8rH/Lsc/plKUwWgExJ+DjdEwoucK6
         ieXs6QiWsxtHDOKN7yri8NfQDl1c7yQYzpNhEk/h3LVs1ggyrbBwGJ8lLDAoI3nRIm+l
         JAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iqOLUbeV7fQrdAuB1kOlrO/56L0ShoplPAkMbDlzW+0=;
        b=S5PIn6+JPtn48fjZLm73OmHnDqT18a0VUoA3nqeRqMsvmJzrtfDQ9LXYE9pBp5wFIH
         21VSRRf9r36YdYVdc7/DbbWJtCZeSP1GV77TxNA4PaonmXbFepVzEnzwatOmUR7z7AMX
         Vk3TKqZ9wWcRD3witFpW2zCSiZbGo0ghXMdUpZS20CS5/8YggBfjdyfw4JmOShZEoFSG
         fYHi9xLZHlX6PZsrouDPiX726v5wQMTKP0wGa2bAxYK2lJg436jT9TifMOtp6boeveDo
         rLev6UQTTLDSUHJ7xeITdicwWRqnGZqFwZiUs6m4cwc41grzlZAJ4/uwdt6mqsBv6lhR
         h0yA==
X-Gm-Message-State: AOAM532uwQwrwtHmyHgK//pGgaQJ9yrHuyI3xg5HyXTLm6JqDcsP+ebk
	dl3dcgpA0RiCIqIG+noAmxGe1Q+ycKR1Cw==
X-Google-Smtp-Source: ABdhPJyulLWGiQpda84SKULwJJXnRzizub/RMtHsxz8AZWNRx0M+hXSnhSxJIAoZliGwLfMcB30vYA==
X-Received: by 2002:a05:6402:424e:: with SMTP id g14mr1649099edb.364.1627633318357;
        Fri, 30 Jul 2021 01:21:58 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n16sm369637edt.31.2021.07.30.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 01:21:58 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 2/2] layer.conf: Update to honister
Date: Fri, 30 Jul 2021 10:21:49 +0200
Message-Id: <20210730082149.8478-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210730082149.8478-1-Martin.Jansa@gmail.com>
References: <20210730082149.8478-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This marks the layers as compatible with honister now they use the new override
syntax.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
index ae93a36b45..6a9357d2a9 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = " hardknott"
+LAYERSERIES_COMPAT_filesystems-layer = "honister"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 06030e7bc4..d2ee3e0692 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = " hardknott"
+LAYERSERIES_COMPAT_gnome-layer = "honister"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index d1d6693736..11dd43178e 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = " hardknott"
+LAYERSERIES_COMPAT_meta-initramfs = "honister"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 6d3de7c118..5a17a50487 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = " hardknott"
+LAYERSERIES_COMPAT_multimedia-layer = "honister"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 968b216010..67fcda3d99 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = " hardknott"
+LAYERSERIES_COMPAT_networking-layer = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 36be38544b..bfb3e59057 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = " hardknott"
+LAYERSERIES_COMPAT_openembedded-layer = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 87bb91f618..6a2dd7ff95 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = " hardknott"
+LAYERSERIES_COMPAT_perl-layer = "honister"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index ab66ffd8e1..ffad953f93 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = " hardknott"
+LAYERSERIES_COMPAT_meta-python = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 7bb4978921..46d5a872a1 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = " hardknott"
+LAYERSERIES_COMPAT_webserver = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index b1240b06e9..81e7dc5ad3 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = " hardknott"
+LAYERSERIES_COMPAT_xfce-layer = "honister"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.30.2

