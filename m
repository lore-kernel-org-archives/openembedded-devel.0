Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8384E74F73
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 12:49:17 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id s18so1662727wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2018 05:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DovGF0/MrfRQ/ubYoKkoY6Ht3OGIlQ7QiTy8x5MEa5I=;
	b=B23ed+PUAyqzTHac++shNBTnZHmbMdVWvBw5EPRPuIyUI+0ghgM+rpnrd9MkUscMZ/
	ocJLSVsqtvoAOxxWPad/czkjpadiYok0X+LAoKGpll7Wue11PUSqnWmTMECIG/E6RG9y
	FZJ0CRjoi//Vmj+IeF8qYHt2L8BlVoAk5gkKyKNRnvnnDcnR7I99Rf5RjdEKZhwpXbku
	mfekzLtZJWMUZZQlK4v2cf2IwT5rFhrehahPWAxirTrE0dmxIzjQus8S1NGR0ExMxtS+
	MQMcc+0qZp0qYaw5m5ceaYkH3sZ12VRHfU6mLVCHOQ6ft13Ig2yBrzOqZqSayuGlVvfj
	+H3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DovGF0/MrfRQ/ubYoKkoY6Ht3OGIlQ7QiTy8x5MEa5I=;
	b=dN11GBJauwMjwVmUEY+ivuq3yimWfZ4voCZzY+77qFHcnIOk8FWnLUkH5GwhxP3wnW
	F8CoHGFuSa90ClrRY+3YQMvoNMCJufrJ176sx1NEcwVNJORHwG7MA866jg3zMJlmsKBF
	R8SdwUWYAvMvEpPKCS6B8FEUVRsu+H9F/WzDQoHpbAGy5mSoTrwPNCc4mb8+7vpQz/7b
	nm0AlvtwZ4gFTBDri6u9qUElFQMFNNDqQBZX6nB1+5oDdHejmgWdTEMogwCwcucwZCkp
	tBmv0KzG4++bPSqmtEWGgQ0m3CSFQJg/h21F8r4bXwB513TrANF+e+3nT/AoVfhasO6U
	h9WQ==
X-Gm-Message-State: AElRT7GCwt8nFOo3aYheY5Qz/emXNMoTNrwDupdS+/Pm/4j/YKvBaM4/
	rok9FCMOniJiHD5EanLeSPZ9Tg==
X-Google-Smtp-Source: AIpwx48M6++tT87CQLYw0DEIkAAlUg0tUEkc5R3iQo+n2pflXGlp/4lFiUewi3P9uhz2+QZzaVFPiw==
X-Received: by 10.223.225.210 with SMTP id l18mr20807151wri.251.1523018956860; 
	Fri, 06 Apr 2018 05:49:16 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c14sm13327255wmi.28.2018.04.06.05.49.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Apr 2018 05:49:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Apr 2018 12:49:18 +0000
Message-Id: <20180406124918.13551-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [meta-oe][PATCH] meta-*: add LAYERSERIES_COMPAT to layer.conf files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2018 12:49:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/conf/layer.conf | 2 ++
 meta-gnome/conf/layer.conf       | 2 ++
 meta-initramfs/conf/layer.conf   | 2 ++
 meta-multimedia/conf/layer.conf  | 1 +
 meta-networking/conf/layer.conf  | 2 ++
 meta-oe/conf/layer.conf          | 2 ++
 meta-perl/conf/layer.conf        | 2 ++
 meta-python/conf/layer.conf      | 2 ++
 meta-webserver/conf/layer.conf   | 2 ++
 meta-xfce/conf/layer.conf        | 2 ++
 10 files changed, 19 insertions(+)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 9ed6d1b739..dbcff42d44 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -14,3 +14,5 @@ BBFILE_PRIORITY_filesystems-layer = "6"
 LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
+
+LAYERSERIES_COMPAT_filesystems-layer = "sumo"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 37215a7708..e6e9532b41 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -14,6 +14,8 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
+LAYERSERIES_COMPAT_gnome-layer = "sumo"
+
 # Sanity check for meta-gnome layer.
 # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
 INHERIT += "sanity-meta-gnome"
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index d9b7c4cfb3..97afc9374e 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,6 +16,8 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
+LAYERSERIES_COMPAT_meta-initramfs = "sumo"
+
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
 "
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index d68b13f7fe..cfedf2f6b6 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -29,3 +29,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core"
 
+LAYERSERIES_COMPAT_multimedia-layer = "sumo"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 2dfde4bdf4..e594b7b957 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,6 +17,8 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
+LAYERSERIES_COMPAT_networking-layer = "sumo"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d84bd09d31..1a43575304 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -29,6 +29,8 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
+LAYERSERIES_COMPAT_openembedded-layer = "sumo"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index a861c3edb7..ece6dd05eb 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -14,3 +14,5 @@ BBFILE_PRIORITY_perl-layer = "6"
 LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
+
+LAYERSERIES_COMPAT_perl-layer = "sumo"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index d53677fef8..7089071faf 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,4 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
+LAYERSERIES_COMPAT_meta-python = "sumo"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 84fdd81d1f..f205ef23b1 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,6 +17,8 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
+LAYERSERIES_COMPAT_webserver = "sumo"
+
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index ad25dcb134..bee8e70441 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -18,6 +18,8 @@ LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 
+LAYERSERIES_COMPAT_xfce-layer = "sumo"
+
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   xfce4-session->machine-host \
 "
-- 
2.15.1


