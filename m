Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 20AA77F461
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2019 22:55:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id b128so304429pfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2019 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kr0i83WwK6oEKlsz8VbpNmKqoXBJZlKrYV8QmT/Mchw=;
	b=jw8zGJFyVXwUnmZ5zk6I021m3j8MU9nRTjKJbYN3h87Kpqocqe0hoi3WKVR+1ChmtG
	itVhaFQnplmmM1B1VbZHhuTuLPirTyx/T2EIo6xkZ4YKjEaaq8YL+eX1aQFzM0edY3jf
	5BOl/GjRQIOKbILxtTkKv8Oog3KcwKGeu/VHDWb0x/uDRL/1KXddFVjGtmDdcnfKaA3R
	8nYUfiGyuwwNZVEuN8uI+L6cLNCEma+2Qi68z9sfH6CLuEB9Z+9KlM9u5OQpRIr0nDSx
	hL71CvQw71idQxjm452wpgGyy4v1w2hBUECfbTWN/6ik/GTmRcG6OicJjZJl8luw/q8s
	liMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kr0i83WwK6oEKlsz8VbpNmKqoXBJZlKrYV8QmT/Mchw=;
	b=r7xEfdcLWk7FvCXqJa1mxA5a7UtD4kt48X4ZaISIthwlpr10t//f0pUe5nnO3/NnRc
	AB/DRBwwIPeoW+mAS0lGh0JI8lCQC20CW+Bcu8OKGFlcnpq2xTvozkAh/hxCggT88coQ
	Gsu8p3co/Wy2jvbyEZnfVpdVnCMSTO+sujISWOPakCCUW46NHU4TAqTgLqOi5qVxF4LE
	LO+CKaPlqfQ+dpG/ey0odknn4rCyVerqC1SLgQ0Bj1SRoIGuXRS9fP0lQM6ZkO9+VduQ
	FTf606UiWsyxffyNW0vJ6OE6GChxI/JmK6mHHGzENbfVS4+fZ2AdHBVSE0u7Ww15CESA
	X/bA==
X-Gm-Message-State: APjAAAWKxkxqCls1R3HFAggX5N7M8YrFpOCY7q1ec6DGRXfEBi8Bvn09
	tKL+bmbgusyUzHjw9OXn61etMNmvIvA=
X-Google-Smtp-Source: APXvYqzTv2Bf1TaR5JfrmcxSkJOB30wGNVzbSolqmEQOny96IG1WU0OKcFd3ZGMOBWkj9UOp1M2q3w==
X-Received: by 2002:a17:90a:9dc5:: with SMTP id x5mr237123pjv.85.1570575343616;
	Tue, 08 Oct 2019 15:55:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::7275])
	by smtp.gmail.com with ESMTPSA id
	w11sm174616pfd.116.2019.10.08.15.55.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 15:55:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Oct 2019 15:55:31 -0700
Message-Id: <20191008225531.570414-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-openembedded][PATCH] layer.conf: Mark compatible with zeus release
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
X-List-Received-Date: Tue, 08 Oct 2019 22:55:43 -0000
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
index 5aa2b0c2d3..e8bd3628f8 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "thud warrior"
+LAYERSERIES_COMPAT_filesystems-layer = "thud warrior zeus"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 9ed1421981..862d622ee0 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -14,4 +14,4 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "thud warrior"
+LAYERSERIES_COMPAT_gnome-layer = "thud warrior zeus"
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 6e0b00db0b..93220b1208 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "thud warrior"
+LAYERSERIES_COMPAT_meta-initramfs = "thud warrior zeus"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 38aab8d350..74dd4a1b03 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "thud warrior"
+LAYERSERIES_COMPAT_multimedia-layer = "thud warrior zeus"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 6f0046cf3b..866bda7558 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "thud warrior"
+LAYERSERIES_COMPAT_networking-layer = "thud warrior zeus"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index e48fabdf09..2a17eef304 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -29,7 +29,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "thud warrior"
+LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 6e600aa677..2c730e4c75 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "thud warrior"
+LAYERSERIES_COMPAT_perl-layer = "thud warrior zeus"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index fb5cda55da..db65943f56 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "thud warrior"
+LAYERSERIES_COMPAT_meta-python = "thud warrior zeus"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 0d694789ff..6157d4d304 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "thud warrior"
+LAYERSERIES_COMPAT_webserver = "thud warrior zeus"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index da07f8e163..070ea6ac7d 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,4 +19,4 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "thud warrior"
+LAYERSERIES_COMPAT_xfce-layer = "thud warrior zeus"
-- 
2.23.0


