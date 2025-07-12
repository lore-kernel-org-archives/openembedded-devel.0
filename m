Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF23C83F22
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 17:26:57 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.41006.1752341210222413828
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 10:26:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PL0QT9bY;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23602481460so29451785ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752341209; x=1752946009; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=48Dt+sjrtm+4MbEPpkZmwHnKVDMfomCkGYuLfNnErhU=;
        b=PL0QT9bYFD7rhvblzdcO2oLTNhnFAps5JzT1f4A70sm81ZdI0kAE88Zg5/Mcj3R58N
         OLFbkFxdAtQmZiyDyvWEjBgBLGjm+l7s05gopXxPU+8QGRxvAs+Hyce8X7wpgBqcGK6D
         JsnYjYsgkpCVe7v6GUig62eb8JiJmoaJhdKq6ZI92ChJZLo3wvu+RjbtNY2OagsCwOns
         U4YBrGtt6bXzmAbDgLeNaUWdRjkk236msVwwvl2P5uVMggewGyEHhEievYVFm43HyCtz
         gsLQQvvOI6kyvzyhJZ12b2QTGCtEpNnSRNubHxML55xxLreBT5GsCs9IyxExyZD2xtMg
         jI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752341209; x=1752946009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48Dt+sjrtm+4MbEPpkZmwHnKVDMfomCkGYuLfNnErhU=;
        b=gqkLhaay+9yLRnCOjDl57/goyh+LsuqE4axIBfwbWFaE747vmqlaplZz6pCOpU7VSe
         q8WvSL/5LuvTX3d4HW7tUXWazF7RwELIV/3yeFyoeQZrIJG0hf57kad0WBEEJdwAhofd
         Subp+3Tr9FABPEwPHLlzB7M79I7xFHwrmlf38IgbL24HiEP4kCuEOzx736iw1JvXXnr4
         h6rsWoAgG1lDlW7fj2aKGNNGZX3+4KNASpeuR31nljX3dsRMITbWcBzZfKT3YOkahKvn
         KRhzTdpjTlPmBsDkIPT9FJvhFZQCJLqT149Lk2Jl5bBZlcj7J+p6UOji9hYfaG3mrozr
         5n2Q==
X-Gm-Message-State: AOJu0Yw1K2pbZuijU4wo0gKsjRy+/a1oJiwxMld6nuKAUzkc88OsWGiW
	TU8/+GXZEL11d+BLZpryIdCwleZ0PqVtLftqW+gxZCSXBpUddECu1Uonh999EXKi
X-Gm-Gg: ASbGnctay/kvqnkwiuLeSdE+CY4FMO8Mx86DX1Xfd1IjctdjyWKkPTj4RLxsL+kxvr2
	+p5Pnqx9w/J2tAjE2fz6km4HJt6Vsz30fB6Eda70v1jC9cbLOz9119cLi81MgY5LwQEdmb7KXEo
	yQJXW2sbZMxTyumX9MZKTqm8ReBtCy20etKyGgKuAxTQSBnZGsw8k79dIxTXufHLLdbYBUs/Ng8
	JY+SmCvBkQcmNsHcVa0KjXDtATSlNDbSrjN7W9lQV9BIAf6HA1IuLasO95/L+EQNNFrkFz00Ot5
	7RXn+NDyYQRIVqQcECsEWIGkITeyZy9PII9kl4vfRzjuMl6AFwNkBfxDcvDfqpNMpv62LOnwgMD
	5mW/6+q9ZJ9L0Hg==
X-Google-Smtp-Source: AGHT+IG0sTsO9yQY7mBy7N7ll+8iIn2ehbfwHXxjoyeQDHL9otsL5qZv8Qif8MIFY5t8H9ziaZlT5A==
X-Received: by 2002:a17:903:230c:b0:224:26fd:82e5 with SMTP id d9443c01a7336-23df0969b83mr92266185ad.48.1752341209255;
        Sat, 12 Jul 2025 10:26:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm67021875ad.226.2025.07.12.10.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 10:26:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH v2 1/6] classed/xfce: Make download tarball extention type configurable
Date: Sat, 12 Jul 2025 10:26:41 -0700
Message-ID: <20250712172646.3899204-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 17:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118479

Default is still tar.bz2, but there is now option to use tar.xz which is
some of new xfce component releases are only xz compressed tarballs.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/classes/xfce-app.bbclass          | 2 +-
 meta-xfce/classes/xfce-panel-plugin.bbclass | 2 +-
 meta-xfce/classes/xfce.bbclass              | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-xfce/classes/xfce-app.bbclass b/meta-xfce/classes/xfce-app.bbclass
index d1b07d7457..957cfb3362 100644
--- a/meta-xfce/classes/xfce-app.bbclass
+++ b/meta-xfce/classes/xfce-app.bbclass
@@ -2,5 +2,5 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
index b43f9e3125..b2d71a4141 100644
--- a/meta-xfce/classes/xfce-panel-plugin.bbclass
+++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
@@ -4,7 +4,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libxfce4ui libxfce4util xfce4-panel"
 
-SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
 FILES:${PN} += "${datadir}/xfce4/panel-plugins/"
 FILES:${PN} += "${datadir}/xfce4/panel/plugins/"
diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 913202be59..6b3d0b0d0f 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -4,7 +4,8 @@ def xfce_verdir(v):
     return "%s.%s" % (m.group(1), m.group(2))
 
 HOMEPAGE = "http://www.xfce.org"
-SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+XFCE_COMPRESS_TYPE ?= "bz2"
+SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.${XFCE_COMPRESS_TYPE}"
 
 inherit autotools gettext gtk-icon-cache pkgconfig
 

