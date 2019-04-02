Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9EB477D00C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 02:10:05 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id y6so5435416plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Apr 2019 19:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8YSzvDf2mtiVAzjDHK5zqk7tIZweBtM9XCzw+9jqtvQ=;
	b=STaIh7Yg5+klnCqlHzJVr2SXUPS5RK1DFnnZJk/doXOz0hPulr2gv1TIwphu/foRbd
	+d/N9frkXs+lKvTA+PQVNRu/R+lx9/OOPohUgh2Phopy/1jUNdsdLh2BV8uOQeyE7i/8
	1bkzo98c6LO0aM7MDsoDHG3kN040cSDqWn80LYcDxNzxPTNNNbJtbYPyRNB89lXV/jI9
	2dAyP72mnOHiwKZvLCVnDKTgf51R4B1MHB8vDMZ1hIMxyNBeIQN7xitkHU4KJj5GJvPt
	r0FnjTH8kjMOcM0zp/XlDRQpCP/lkIKJ6stJXG+dy8S8fr7HW+7F5COvbxhlAam4FTnj
	0BqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8YSzvDf2mtiVAzjDHK5zqk7tIZweBtM9XCzw+9jqtvQ=;
	b=ugCT9EwGWXYGLs7pNQyqBHXVZCkM9RIyo0M6wN9orjSsPIoGuCsaJdK5jKB10kPuOQ
	Ip3L7Sdqk/gSZVhsKF91pxwwWuxI6qXJYp5l5BO+yJ3S++sfzw7l9zeRYdCXkMGVJuy5
	MmJPO2FCir6lMo9kqZBAgoIkDlVTB3EMCwQwbkaTp33axg58RmeUh5eD3TzdDhpENuuu
	rPu9OCA51I/OrqKLJgPCGoskhKf1m8KMlploR7d8qTo56qhBNy5LYg0y7nmOl+81qc2w
	SKLp+UYXAhjf3nMyOQVxHoCVIEWVewJ3u3RHOT7wbZhd5ox+lD0L76rFShpMuilEaLpV
	eGgg==
X-Gm-Message-State: APjAAAXkrdB6YoapYvW8iZBu5VWAnGOA/qpvxzq+B9rNdb2ZyNbJF4cy
	FcSevH0IFsPqoDJ8Gf1CXSAC3luwJdM=
X-Google-Smtp-Source: APXvYqxyQcNnXQMyFu3dY9kM1+vqOBu34fPbDus2/xXRWYvMkl8tykHh4ytSEhJOaNqi684hxCf7pg==
X-Received: by 2002:a17:902:7785:: with SMTP id
	o5mr48217716pll.33.1554171005739; 
	Mon, 01 Apr 2019 19:10:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::7644])
	by smtp.gmail.com with ESMTPSA id
	j24sm16527254pgl.58.2019.04.01.19.10.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 19:10:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Apr 2019 19:09:53 -0700
Message-Id: <20190402020953.39637-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [all-layers][PATCH] layer.conf: Add warrior to compatible release series
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
X-List-Received-Date: Tue, 02 Apr 2019 02:10:05 -0000
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
index 002f099760..5aa2b0c2d3 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "thud"
+LAYERSERIES_COMPAT_filesystems-layer = "thud warrior"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index e9d0785b1d..0b68232de7 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "thud"
+LAYERSERIES_COMPAT_gnome-layer = "thud warrior"
 
 # Sanity check for meta-gnome layer.
 # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index bd92ddfbc2..6e0b00db0b 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "thud"
+LAYERSERIES_COMPAT_meta-initramfs = "thud warrior"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 3500d49ca0..e05a65253c 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core"
 
-LAYERSERIES_COMPAT_multimedia-layer = "thud"
+LAYERSERIES_COMPAT_multimedia-layer = "thud warrior"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index d36ff5bf95..67f58bcc28 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "thud"
+LAYERSERIES_COMPAT_networking-layer = "thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 23c10ce339..31f2f17fc8 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -29,7 +29,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "thud"
+LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index b2bb379105..6e600aa677 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "thud"
+LAYERSERIES_COMPAT_perl-layer = "thud warrior"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 321d51bee7..fb5cda55da 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "thud"
+LAYERSERIES_COMPAT_meta-python = "thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index aaa3a95c4f..0d694789ff 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "thud"
+LAYERSERIES_COMPAT_webserver = "thud warrior"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index f5f44d64bc..6e9d892943 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -18,7 +18,7 @@ LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 
-LAYERSERIES_COMPAT_xfce-layer = "thud"
+LAYERSERIES_COMPAT_xfce-layer = "thud warrior"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   xfce4-session->machine-host \
-- 
2.21.0


