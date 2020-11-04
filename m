Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web08.18942.1604522540976596095
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 12:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JktZQFrl;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id 10so18298201pfp.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2020 12:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zo/dGjeDIhbVOzNCvDlI7zI++Ezsh7GKQK0/Ifzp5I8=;
        b=JktZQFrlQZwDgMBDPuXEFVJ6PLnxPYr+YyHvMmVOlusKQ3bQWmvTl6JPPwj+/Xy4PA
         5EWOWI2IYQM077Ah4cGNGA/6P8rYt7dbfRn25YinTK1Xh/BvNCcyCCcoZQZM+4T5uKbL
         SZ1yEmiVoNxrcNsMPwsHLhhEMrmevOCKKhgN9GH7I2vSdQuLNAiMq0PqyXhLRn/NBdV6
         30j6pfw69Gi4Ag4H6rRm4YnEzP0iZ5+r8Ha3heQNwbyQFDIuPWm5ud75+1dzGXtUgmhF
         0xcpwRWNMNBxX98WIgWYqN4bYMu9JQxO+KMKXQb5bBNyJz/cvhGncZH8FhD9QsutOJOp
         NEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zo/dGjeDIhbVOzNCvDlI7zI++Ezsh7GKQK0/Ifzp5I8=;
        b=YYHYpWXVvnf5N79AtYx4I1OD0mZoTJEahddhxLkr8wKBJP6hV7clj9sT0Ec4WjWf54
         FvbusX6MzGCXfIR1IjaZZfbrdf2ajpbRU18UrO6EY4t6uLPRfeNI8rOFrHwwl+CZizZr
         TWajPHzAVusbZQiM7p/Cb2hhtYur2oqefQQkZj701WtklbGCV4ZZEgs4jYJoJ8nDeUgO
         lbanO5eOLLgMAui94P4IEuapelgr+BJsKl1jAo2fBiW+MxW6z0D+IAhVAy1qw3+6+ULQ
         qaSTvRUzlJYDjtoOWPrgEIrD4CJTpY5EXpITq2Yk/NJlaIh04n63LzHsXIBOrX/qhRoe
         FtxA==
X-Gm-Message-State: AOAM530ObYfuGW5SLlVkN8IbFb3Zaa1dl8+s6Ashz61Gvm8BCiPbSOxc
	MFJevtPWKHafLE3SEo6LtzZekW28Txrdrg==
X-Google-Smtp-Source: ABdhPJzBFubqdkQnlu/kRWeipEibPa2ICnd8j//LsNvwq/cgMsd9C4tjO3o4AG9aPQpg4tdUAHSkNw==
X-Received: by 2002:a17:90a:1596:: with SMTP id m22mr6091839pja.189.1604522540022;
        Wed, 04 Nov 2020 12:42:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id j12sm3121713pga.78.2020.11.04.12.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 12:42:19 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: Add hardknott to LAYERSERIES_COMPAT
Date: Wed,  4 Nov 2020 12:42:16 -0800
Message-Id: <20201104204216.290314-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thats codename for 3.3

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
index 47c99063fa..343f5209c1 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "gatesgarth"
+LAYERSERIES_COMPAT_filesystems-layer = "gatesgarth hardknott"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index ac581e6939..5e92cdbd7a 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "gatesgarth"
+LAYERSERIES_COMPAT_gnome-layer = "gatesgarth hardknott"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 9752a5a2c5..92df5794d0 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "gatesgarth"
+LAYERSERIES_COMPAT_meta-initramfs = "gatesgarth hardknott"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index be0e2b362e..a27b97de0a 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "gatesgarth"
+LAYERSERIES_COMPAT_multimedia-layer = "gatesgarth hardknott"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index bd0a44cae6..c28c7bdb6a 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "gatesgarth"
+LAYERSERIES_COMPAT_networking-layer = "gatesgarth hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index a964a99fba..9b3f287006 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -37,7 +37,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "gatesgarth"
+LAYERSERIES_COMPAT_openembedded-layer = "gatesgarth hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index f97527c554..2209d3d43f 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "gatesgarth"
+LAYERSERIES_COMPAT_perl-layer = "gatesgarth hardknott"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 47ab154b54..321d0da5ed 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "gatesgarth"
+LAYERSERIES_COMPAT_meta-python = "gatesgarth hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 94489983e3..d95d32877a 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "gatesgarth"
+LAYERSERIES_COMPAT_webserver = "gatesgarth hardknott"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index a71eb8fe58..5674ab512b 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "gatesgarth"
+LAYERSERIES_COMPAT_xfce-layer = "gatesgarth hardknott"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.29.2

