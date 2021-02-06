Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web09.13739.1612653437245345861
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pQF+/k2A;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id lw17so7943778pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=O+Ymr/8+GYxEI2d0iKgTesN2TU0Hz6zw+1aRn7T8seg=;
        b=pQF+/k2ANCFoB3qUL5gZOVZER5+NbAD5tfXizOpyCLu0proi5j1KECP1DqdHElB1TX
         SrvzIIgVdBgbMiKcAwvs0+olClQmERVFDlSfWQu8lnDOoE1V5DJsgQ8aAEeqYsMbbgKu
         6P6zOnEmemx5HXH5Vyrnp5vaEVObicqzB15Rukjybpy9n+IUTyqC9wnNP3ejCSX2vAUm
         6DvXbv4SG4R7rx9bBwBBeMsKM99RwfT0e1oTLtUki5IwqHKWIg2Myi8MC1uRYRG9VZXs
         ikY3H6PQUjsao2Jx9bRun/qE8kzAvILl2z+mqJdfOJMx/OugaAYIynTz+N75Xd3OSYId
         /9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=O+Ymr/8+GYxEI2d0iKgTesN2TU0Hz6zw+1aRn7T8seg=;
        b=Hx7sRwL02S1caMNf9PAng4AdTbydYeCA5igDHoyLMAMpzcvda2Orhu6o9r07rJIO7V
         eH3LQZ4UjAboEKINXORhFL2cIP62zo6VBxP9dt9vImh2geWo/LCr7u2ssIIqmLSKrFNb
         IOaAj2z66Po7owquPvCid4vi67qWwIGyfxOyUIjXF/bAzWazfqrQEuhO6fkj9unvcIq8
         yvcyI4/YlHmBt5hm72wsBuDJ9XfAM8mM8tNJRBtWn7Jw+/UWFgaXSFdSOuGMo/fwRDDR
         SHEW5lKhGKkGOt8R+CplJxxXNWhk9Umv3h6xBiR93ZCaV6womnACSVTX3EdSxlL3B2GL
         WkTw==
X-Gm-Message-State: AOAM531MZpD1JpkEJvnZor5plCXV1MR9ASyc6+MihWP5mamPeuSZXDxT
	A2luCnOemIuZqLrtJn8Hc6NrRE6iuqwHVA==
X-Google-Smtp-Source: ABdhPJzZstgnh1RogzNJkD+Ps8J0kC3pvkz3FhBsJXaR2r4AQ7xWnDv9Wv25XNqdY0f1f6/clsgngA==
X-Received: by 2002:a17:90b:795:: with SMTP id l21mr9625014pjz.5.1612653436675;
        Sat, 06 Feb 2021 15:17:16 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c5c4:f80e:4f44:b02e])
        by smtp.gmail.com with ESMTPSA id b65sm14331882pfg.3.2021.02.06.15.17.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:17:16 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgargh 07/10] giflib: apply patch for CVE-2019-15133 and set CVE_PRODUCT
Date: Sat,  6 Feb 2021 15:17:03 -0800
Message-Id: <4e6de3045c96fce9516311ba42911e209a1b84ba.1612652802.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612652802.git.akuster808@gmail.com>
References: <cover.1612652802.git.akuster808@gmail.com>

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

