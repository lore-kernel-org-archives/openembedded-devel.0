Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.8541.1612035477627623994
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NiCcQtmB;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id n10so9148454pgl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O+Ymr/8+GYxEI2d0iKgTesN2TU0Hz6zw+1aRn7T8seg=;
        b=NiCcQtmBBEXEHw0urElr5U/jMKluzKER6t1PUiBOPZFY/+929En74QlV+FDWtfTMLN
         Tu/cXDMZuKcTzt28wtI2i3SHcb1nTA569hefKvUkIR4tNtmpMJjPCkgwviFhSVs/knOv
         Htim9A9KQMSmWNjmV0Q1LLwBo7F0WBcS+R8ySGzJZ+l9CfKOioQe58SeyJGmZoZ4Xaal
         xmqoQmOVODDoNlunaJ2Wos6gJVUzjq93XBNhlueQLT1lvT0FSFNVSgt4upLziHOr9OU4
         qN2f1cQw+CQfdHai+G1mcdznkPhiGZmb43osxsHE5Boz8FLYgS6QvdmKoVvTRdOcvIbJ
         E91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O+Ymr/8+GYxEI2d0iKgTesN2TU0Hz6zw+1aRn7T8seg=;
        b=Kbqw/rkDotyd3YdQIPA4ZliJAMIrqOL1uTMx00mqZmr5itsxBcxK6ylW1WcYEeEi78
         UMGbVVbg71jTdgsEWqr1l/LnheiD9P+7CyD3bX3ZvFI0dxe6dohb6WSb+lJmQlAr2KiF
         fEPctgoQDvNpN72EPzqYy1m0n2cRG6sj6I+OJKkfFpLavt42/9G/mHd8hCFU/5EzUQUQ
         JYfSZph6f6ktIOIgX6GDzJAWSSdu1BeE47NIL2D2BP4yC//E7GCzE4HyRTYOqiPYobMv
         MRSFigmrAjDZjNuD+MskivdwfViHp2ODU2n2qW7nKfr2DruO2jn1RYw/QGxJNVLOZsPY
         XINA==
X-Gm-Message-State: AOAM531Jsc08J/5R04LEsqjELih+D8DNFAZkqzB7bG3PqcBnuulDXNUT
	COeopH+DFfp6GY2vb9h8FQVuBLmY1zBVMg==
X-Google-Smtp-Source: ABdhPJxOOE6S0d8NMzHgqi+8i0poJBMrx0CDZ6WEqnZuSZWlMaswAmgo+wJQH5Nmh9/0gTAjO3a1Sw==
X-Received: by 2002:a65:6458:: with SMTP id s24mr2748490pgv.386.1612035477070;
        Sat, 30 Jan 2021 11:37:57 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:56 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 11/13] giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
Date: Sat, 30 Jan 2021 11:37:36 -0800
Message-Id: <80c0a5fff685f5c5b8f484fbba3d6837912a31b7.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: Mikko Rapeli <mikko.rapeli@bmw.de>

Backport upstream patch for CVE-2019-15133.
Set CVE_PRODUCT to "giflib_project:giflib" which is used
in NVD. https://nvd.nist.gov/vuln/detail/CVE-2019-15133

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../giflib/files/CVE-2019-15133.patch         | 23 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.1.4.bb   |  7 +++++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch

diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
new file mode 100644
index 0000000000..9957be82f3
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
@@ -0,0 +1,23 @@
+From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
+From: "Eric S. Raymond" <esr@thyrsus.com>
+Date: Sun, 17 Mar 2019 12:37:21 -0400
+Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown address
+
+---
+ dgif_lib.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-status: Backport [https://sourceforge.net/p/giflib/code/ci/799eb6a3af8a3dd81e2429bf11a72a57e541f908/]
+CVE: CVE-2019-15133
+
+--- a/lib/dgif_lib.c	2021-01-13 19:28:18.923493586 +0100
++++ b/lib/dgif_lib.c	2021-01-13 19:28:55.245863085 +0100
+@@ -1099,7 +1099,7 @@ DGifSlurp(GifFileType *GifFile)
+ 
+               sp = &GifFile->SavedImages[GifFile->ImageCount - 1];
+               /* Allocate memory for the image */
+-              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 &&
++              if (sp->ImageDesc.Width <= 0 && sp->ImageDesc.Height <= 0 &&
+                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.Height)) {
+                   return GIF_ERROR;
+               }
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
index 21fa352cdc..1871bab46e 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
@@ -3,7 +3,12 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2 \
+    file://CVE-2019-15133.patch \
+"
+
+CVE_PRODUCT = "giflib_project:giflib"
 
 inherit autotools
 
-- 
2.17.1

