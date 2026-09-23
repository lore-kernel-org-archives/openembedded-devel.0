Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2208C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:46:19 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.305.1790181970980532684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 09:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kUbsOWFX;
 spf=pass (domain: gmail.com, ip: 74.125.228.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50dc3so733604a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181970; x=1790786770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aoxmYv3UdBYfBeqNfmJqnMwsYlsAfaDhfpOIG3jaNik=;
        b=kUbsOWFXItCHR9XXX1gdOTYZyxYDLiVDSwfMklaHXyGYqrRlNQZLSE+BBX28wUULEl
         SGbUEZ0cS8ljryTYQAeegIBGg2SWbS8y/PjKqwHC9iv92OygquDj6VHUN9hklEHkU6P8
         UkLKUs3wVboi9r3iK68GlRvNg8xJxq43khwRl5ubGQh07+GcEFutKJRXl1VljpGEQeaR
         J2uRALu+CbA9AN/94Ir1lICJ1DCGx7Hka1GnX6Ns7oPMG9NXieJSu9H1rF0Msyvulw+u
         rbxg4xNUxFf/Vb1xDDG6fqFqBmY6SupdBkJf1TiG9Lj2UoxuJQ0zSj4AXw5RiZSjSysC
         ZBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181970; x=1790786770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoxmYv3UdBYfBeqNfmJqnMwsYlsAfaDhfpOIG3jaNik=;
        b=n6ZGKuIn7Vvs85reA7PK7DfQRUj5qoSk5xn+WBQMdHvBXxAKjVR/uuM24A+R6RhOdI
         iJBuz2umNU6RJoFBCqH1AKSAIjPjfAfOANPXksR6hkwgLOEbrj5LUi0lXq6/SJFaeeLF
         /PTd09lBRwenw9yW8b6cz1ho14p/VTD0RcwQf6pBpqR0gc6aPCaxwguUGvESAgcTKEpu
         quzFHB0UUMrVneffk6g+Qjg4VCpcCXZLrURsJYTuPlZtTtpdl1ehJG1DwCJ4s/my7NL2
         1pqEUHYdQZh/7f5die4bVEZBm3GFTH/fyS5ESwM/pGLwGmOC6ctKZ8F35bHwMNNmoIe5
         qTSg==
X-Gm-Message-State: AFuF++nZkoeT4Y4r3oYNeqtSLMlJPxo8HCJOpslXWWMWNcJXCCw8BHxG
	8n3qXWzsHMbXiAZc5wGfbX/vgEOeYdd9oUnowOQ3ylg53EOjQHJtS9LYui340w==
X-Gm-Gg: AYBFou0KY8fHRueH6We9ZDk9P6LjMNyMTurA+X1Yx8oRvVT21+3F5tyZ1Lc+pM1qKyS
	kK/9YErKmqu3zv0INPHNjnu/WakYrDXjzfTa9BZ4kV37URjNPQl7bhQ9qzfp/vG6CbjNFY6u+yi
	ZYy6nmlVaG9yIjeVYusH/Y4i62RCRzcRhiFQS7PazQCwJ5ihAmGDEGqLQp4XJmbZjYI2FZfYzoT
	JNoewZ8BkHCVUiVhvBI11amAqktGTGLHX2Vu7tBV/JXKy4zdO4BqDyQZ95Jp0cdorg2rL0OzqYj
	zkRCeoSDDMOjFoXHbuSkmT+a6yvOW3siad41Obcr3L6xG253zFl9Vrs8yZDbSHvFhFiWv1x+L/V
	c8xF0KK9Llaxrel/hSRviiH5CMY81ky3QZgqg583R9l847ua3hjSQnKvY1YpgI58V0rhxN5+qLI
	4mtw4PgisTcg6OaAAJAUHNhhpdSPQb1yU3BCl3oKLxEUeRljGN4Gfu0657S9vD8OZfeB3tE9UM9
	Pn9iy71vkSKzbllJReQR5ycw99B/fVOGmERk8oaYz2WXEJHA7/651t4VYsOznzz3IuLTLrnzqQC
	wtrr6FNmL93f1GutKv8CofvBsMQckzgbsbT3HOBtjU+jZZuUXT8cz1HT2NzjKW4+qUyK7Be+hWI
	pkowt9xGEzxWR80lfDCeTkAYS6ggDbG406oXLz7DIuAQGjDajHdEbuPntrEL///x0HCA++NfdpQ
	1Iyq/f1jElQ3QWHdcmM1XACYlwQ0wQNvOGgE+lwAo7RN8AwNiz
X-Received: by 2002:a05:6300:6bc2:20b0:3d3:ad3c:49aa with SMTP id adf61e73a8af0-3ddf7e52bd2mr2021591637.24.1790181969965;
        Wed, 23 Sep 2026 09:46:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad6d5fsm1640210b3a.43.2026.09.23.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:46:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] layers: Update to use blacksail release series name
Date: Wed, 23 Sep 2026 09:46:05 -0700
Message-ID: <20260923164605.1827690-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 16:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130241

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
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
index dd4cb81272..578357fbd1 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "whinlatter wrynose"
+LAYERSERIES_COMPAT_filesystems-layer = "blacksail"
 
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 27032ac69d..1f5103d30e 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "whinlatter wrynose"
+LAYERSERIES_COMPAT_gnome-layer = "blacksail"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index b52f3fde80..957f636b1d 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-initramfs = "blacksail"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index b48c002d12..73c0172a33 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,7 +31,7 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "whinlatter wrynose"
+LAYERSERIES_COMPAT_multimedia-layer = "blacksail"
 
 # List of known non-reproducible package of the meta-multimedia layer
 # Please keep this list sorted
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 18256167a3..24071b1e6d 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core meta-python openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "whinlatter wrynose"
+LAYERSERIES_COMPAT_networking-layer = "blacksail"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d90d0cf737..8318d3dbf0 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -46,7 +46,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "whinlatter wrynose"
+LAYERSERIES_COMPAT_openembedded-layer = "blacksail"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 41ff0fefc2..e4292adcda 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "whinlatter wrynose"
+LAYERSERIES_COMPAT_perl-layer = "blacksail"
 
 # List of known non-reproducible package of the meta-perl layer
 # Please keep this list sorted
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index ea51fa93ad..8cc8d40696 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "whinlatter wrynose"
+LAYERSERIES_COMPAT_meta-python = "blacksail"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index b1fd9e4bd6..c46f42a468 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_webserver = "whinlatter wrynose"
+LAYERSERIES_COMPAT_webserver = "blacksail"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index a8b96969b1..866d1e6f02 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "whinlatter wrynose"
+LAYERSERIES_COMPAT_xfce-layer = "blacksail"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \

