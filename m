Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE5A479709
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 05:25:43 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d8-v6so5856516pfo.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 22:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ztD7e8uwvPn1XiQEvgkrxXtU6ZQHpCZ/h/Le6GqK/k=;
	b=ur9xCBPbGkBYUw+yP+N7q2d2W8HFE3n++5HCUVTHvoQm7xBf3oA1vq00Os+BZsTDKi
	88ECl3b8K6qJ1btqbucOU1GZXp0zQfDcMzJmyP2Q6IkfDhI+GtkE585XtIqv1X0ivIKy
	qJTYiV5bcLdHTpt12iBijs27Me9XSG5IWuKN6vJ1fjNcnlTEXHa3TUGUTbnPzRsB5VWF
	9tws/kMvt5P64tmj3Jn0QrY857Bw7Rs5ShWv8x77EbSk2FRdbI8+/MmPbYCG4ND+8SRX
	yQG9nKhL4JcgPNgSctIjKi0iREzwB1gtknYlfzIW8GawK0GXlI5p94Vfxl+VB3AhisV4
	Vm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9ztD7e8uwvPn1XiQEvgkrxXtU6ZQHpCZ/h/Le6GqK/k=;
	b=TfaD/On3uHeH84WJYjPlcr9VH26+xTGagUSWUYczp6KLSEzdoxmDvTKF4hpHSynTYX
	dn+LzeBwkMMq8KnpJG3TBuSd73APRYNFA1eG1JlAnW7CqmLyEqy1hEaZYKVbDHmQ6bom
	t9bLzXX+Wwv/UlRGbqZAjvE35i190dmONVsVDIYfcuMMBBKwhbc0H54gluucQbdNRrwy
	+pi8XfqV/ShIH8b7ADJWjXaEXzD4tsXpHZ2f3T5gnIthsszBxwETVfqwNiN9kNNxhbP9
	cqvZCB6xw/F0lfhPWVSH2FKLDCdgav0HDrhWO11g2Ew/BXt1jdJRDjXbXoVSP/ezWGhV
	G1HA==
X-Gm-Message-State: ABuFfojyTZdL14mc8TvhtKTwcrdtHvDOt1I+njbRAnO+K5RdkH5u3o4R
	znL8X/lnFEHDRyfVJ2o29CI3n9v/
X-Google-Smtp-Source: ACcGV60g/efqRXZTIBN1gAuqw79vANMHrDJtZnhRkbIOwRjk9BZTPc3azeAqbvvl+ms8P5NSwmj+og==
X-Received: by 2002:a63:89c1:: with SMTP id
	v184-v6mr3809420pgd.79.1537939544341; 
	Tue, 25 Sep 2018 22:25:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	y69-v6sm8945033pfd.36.2018.09.25.22.25.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 22:25:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Sep 2018 22:25:32 -0700
Message-Id: <20180926052532.31041-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [PATCH V2] layers: Update layer compatibility to thud
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
X-List-Received-Date: Wed, 26 Sep 2018 05:25:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@googlemail.com>
Cc: Derek Straka <derek@asterius.io>
Cc: Tim Orling <TicoTimo@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Armin Kuster <akuster808@gmail.com>
Cc: Joe MacDonald <joe_macdonald@mentor.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
v2: Drop unnecessary recipe changes

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
index dbcff42d44..002f099760 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "sumo"
+LAYERSERIES_COMPAT_filesystems-layer = "thud"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index e6e9532b41..e9d0785b1d 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -14,7 +14,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "sumo"
+LAYERSERIES_COMPAT_gnome-layer = "thud"
 
 # Sanity check for meta-gnome layer.
 # Setting SKIP_META_GNOME_SANITY_CHECK to "1" would skip the bbappend files check.
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 97afc9374e..bd92ddfbc2 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "sumo"
+LAYERSERIES_COMPAT_meta-initramfs = "thud"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index cfedf2f6b6..e2a7701c33 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -29,4 +29,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core"
 
-LAYERSERIES_COMPAT_multimedia-layer = "sumo"
+LAYERSERIES_COMPAT_multimedia-layer = "thud"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index e594b7b957..d36ff5bf95 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "sumo"
+LAYERSERIES_COMPAT_networking-layer = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 1a43575304..64c888d51d 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -29,7 +29,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "sumo"
+LAYERSERIES_COMPAT_openembedded-layer = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index ece6dd05eb..b2bb379105 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "sumo"
+LAYERSERIES_COMPAT_perl-layer = "thud"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 7089071faf..321d51bee7 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "sumo"
+LAYERSERIES_COMPAT_meta-python = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index f205ef23b1..aaa3a95c4f 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "sumo"
+LAYERSERIES_COMPAT_webserver = "thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index bee8e70441..f5f44d64bc 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -18,7 +18,7 @@ LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 
-LAYERSERIES_COMPAT_xfce-layer = "sumo"
+LAYERSERIES_COMPAT_xfce-layer = "thud"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   xfce4-session->machine-host \
-- 
2.19.0


