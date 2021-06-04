Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.2927.1622771083014402514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 18:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1541ifkm005415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Jun 2021 18:44:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 3 Jun 2021 18:44:41 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 3 Jun 2021 18:44:40 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] layers: set LAYERSERIES_COMPAT with honister
Date: Fri, 4 Jun 2021 09:44:38 +0800
Message-ID: <20210604014438.33958-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Set LAYERSERIES_COMPAT with 'honister' which align with oe-core.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
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
index ae93a36b4..6a9357d2a 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = " hardknott"
+LAYERSERIES_COMPAT_filesystems-layer = "honister"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index ba2d59948..09b2ecf70 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = " hardknott"
+LAYERSERIES_COMPAT_gnome-layer = "honister"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index d1d669373..11dd43178 100644
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
index 6d3de7c11..5a17a5048 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = " hardknott"
+LAYERSERIES_COMPAT_multimedia-layer = "honister"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 968b21601..67fcda3d9 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = " hardknott"
+LAYERSERIES_COMPAT_networking-layer = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d3aeaba3d..2f0a49e22 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = " hardknott"
+LAYERSERIES_COMPAT_openembedded-layer = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 87bb91f61..6a2dd7ff9 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = " hardknott"
+LAYERSERIES_COMPAT_perl-layer = "honister"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index ab66ffd8e..ffad953f9 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = " hardknott"
+LAYERSERIES_COMPAT_meta-python = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 7bb497892..46d5a872a 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = " hardknott"
+LAYERSERIES_COMPAT_webserver = "honister"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index b1240b06e..81e7dc5ad 100644
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
2.17.1

