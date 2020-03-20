Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBDC61B0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 14:45:43 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id a32so3189742pga.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gbkmBNyVbYWjn30ktd6Pum68VWju/k/9j0bxwsLpzo0=;
	b=GAYICi2eE9Z4dzYbVY03urXPH22VY6WC1WsU9Yr0OIEp2tBH7dd5v/TiOL2eDs/qE4
	MoTk4okNWKPC5OFG1pxpFpouGMTgjtwJdN5H6yr1RMNntt9PfFz7UVfhw48AQvifdMiI
	UlAstBZcsJx80Qe37gmsKwZMHh/nejTWt5do8E3nwhNCLOO9ixs+2tRZTfZ+vk3QifXj
	NWMminGub3x6EDOuAlWymQeUPeMb2md/rtSZjmWI0TbaeNE2O3pAOC5q2V7GRVqHkn12
	ZS/11IbKZYPQd4+MINp7pcjazgy/LBAFhK2k1XRvVpkamCdNoifG9PGg67bHon6Bkng1
	NuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gbkmBNyVbYWjn30ktd6Pum68VWju/k/9j0bxwsLpzo0=;
	b=T1bL5CiTzZGkinAlD5oLdhDateGPu4CdcfiaIz9AXYZ2VhlT38aeNABamqK4y1eMnM
	Gh2QEl5gEVQovx5eG8G0Q0FqhqIcOY1FwYUgMAyAomjMSsv7/aYlCiSZme/5agCPT3ZO
	zF366EIyFd9MwP1nkOR+tmELcYNcug+iDhzGnVPrlVz7ypIZaf/+w4qdKYviC7NpzDm5
	Z86rDI3QFPdw6tX4P2tYEtOpyQ4cRvvXhcpLFtGll+Wq6XYFdpiUlt0bw0XbawH8Mstg
	N0wAm5u3Qw6WbQ0KFvFOR16H38PktXMTFUuhurSRWy7VxNVTQDmuo7EeTCoSEKixEQYY
	jx6A==
X-Gm-Message-State: ANhLgQ2SIl+y834yGK1a6LzG623bzLjROgAUtOeSNJJ1l1mO15Q/DYLa
	8d2GzDzpSKn1M+9/371eBoTnPCkZeFA=
X-Google-Smtp-Source: ADFU+vtrw76e5hZmmexkjy3dl248lTw8ZGK2lFDGq2LhFAlIDM93XYNJouUI4aGLdPH9qANpkrY21g==
X-Received: by 2002:a63:b508:: with SMTP id y8mr9148215pge.225.1584715544045; 
	Fri, 20 Mar 2020 07:45:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::81bf])
	by smtp.gmail.com with ESMTPSA id
	k24sm5872176pgm.61.2020.03.20.07.45.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Mar 2020 07:45:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Mar 2020 07:45:53 -0700
Message-Id: <20200320144553.2587659-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200320144553.2587659-1-raj.khem@gmail.com>
References: <20200320144553.2587659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] layers: update LAYERSERIES_COMPAT to dunfell
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
X-List-Received-Date: Fri, 20 Mar 2020 14:45:43 -0000
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
index e8bd3628f8..be1635deea 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus dunfell"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index d381fdf070..7aa9507eb5 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,4 +17,4 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus dunfell"
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 93220b1208..634e0883c6 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus"
+LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus dunfell"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 74dd4a1b03..2d52fb938a 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus dunfell"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 866bda7558..7bc0702ba7 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus dunfell"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 652a378f28..434537fd3a 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -34,7 +34,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus dunfell"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 2c730e4c75..1361fe0842 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus dunfell"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index db65943f56..7cfeafe599 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "thud warrior zeus"
+LAYERSERIES_COMPAT_meta-python = "thud warrior zeus dunfell"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 2c6fad4ac6..24469115e4 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "thud warrior zeus"
+LAYERSERIES_COMPAT_webserver = "thud warrior zeus dunfell"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 070ea6ac7d..199c69e7b2 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,4 +19,4 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus"
+LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus dunfell"
-- 
2.25.2


