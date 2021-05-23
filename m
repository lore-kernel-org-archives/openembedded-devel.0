Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.8291.1621762733273354968
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 02:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pm6UnJyG;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id gb17so19039244ejc.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 02:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7PCRAhiE5wLCgDat6JM9ZXRm6jnTXJQd5TkYmtyATBY=;
        b=Pm6UnJyGqKY29ickcsT7hcbA5SGQ+derZ+rL2d+NyIGy/Ci9bp36IerEZcDD6OmIgU
         j8FL9jod3PK4bgxtUYlKwgfid1pxwtkAHcnUikfIldbu2Q/5/veIrY3OQ/ewiRA1QYsm
         K51eXgpMBwApFZTK5ajDXZAxhH5eWVfPi2X9dqdBthHYidEuuSIrNFoF1XdnjgK9xPca
         ZjImVpxNOFKhHnDqxshff7r7tXvl/D6SBtygfHe8T0kN0FWgouYVJOWUFf4u0z+kpsWV
         Din5r3lhba6I6wZh8IgVjGTSva8VKWsrYWjEhD5/jrA8siyScc7xbIUtyLGqzlzqxEBh
         4E8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7PCRAhiE5wLCgDat6JM9ZXRm6jnTXJQd5TkYmtyATBY=;
        b=PS21IkU0evR+n1FE9YPxoGgLgZUIYB3Bhxx8Eaiz4UhoAXTDLFOSXO6DZoEoQfb2k0
         Louw4U83TfkwETRs5Smsq1hB8qrhJKXB2wXRXQB/y7D/QlOT/kgBjOsp9tQidwYlXMu4
         9jaWl2gOUiulB5o3BN9lasaYGLct7Q6QGzEeYdNgt1T3bVfhL+1JMYZC2kdWaaQ2xDyS
         2QfGeuQ5iHxPL4rJMm+TCEffDatyD4vWGcYdnC4WEDraTVPJg1p4yf85VmVpyAAphPis
         Hy08N2WP2kMhYqOdLo9HCWLB2MFu1ITy5HGJtjnS3piBcT8u6llb5sXCH8JzDi+tEBXJ
         aVXQ==
X-Gm-Message-State: AOAM530e+Y5YoTBNHcgLXPFd4NfHLIzzdhU91rD2rljcMIN0YHV45jX3
	a1g8B0FhdrFq/ZPcuV0z8Q219iJXE4g=
X-Google-Smtp-Source: ABdhPJxSV+PhfJ74yh4J5CFdlVP7bsU1rQJRmf+o+PLJiLksMAZp9Q7x+zkTKzRqENor4S8hdA80Kg==
X-Received: by 2002:a17:907:264d:: with SMTP id ar13mr18197740ejc.279.1621762731212;
        Sun, 23 May 2021 02:38:51 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id cf15sm7454654edb.62.2021.05.23.02.38.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 02:38:50 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] giflib: upgrade 5.1.4 -> 5.2.1
Date: Sun, 23 May 2021 11:38:44 +0200
Message-Id: <20210523093844.3418-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Project removed autotools configuration files. It is now a pure Makefile
  build so autotools are not required any more
* Checked sources: Back ported CVE-patch can go

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../giflib/files/CVE-2019-15133.patch         | 23 -------------------
 .../{giflib_5.1.4.bb => giflib_5.2.1.bb}      | 18 +++++++--------
 2 files changed, 9 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb} (52%)

diff --git a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch b/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
deleted file mode 100644
index 9957be82f..000000000
--- a/meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 799eb6a3af8a3dd81e2429bf11a72a57e541f908 Mon Sep 17 00:00:00 2001
-From: "Eric S. Raymond" <esr@thyrsus.com>
-Date: Sun, 17 Mar 2019 12:37:21 -0400
-Subject: [PATCH] Address SF bug #119: MemorySanitizer: FPE on unknown address
-
----
- dgif_lib.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Upstream-status: Backport [https://sourceforge.net/p/giflib/code/ci/799eb6a3af8a3dd81e2429bf11a72a57e541f908/]
-CVE: CVE-2019-15133
-
---- a/lib/dgif_lib.c	2021-01-13 19:28:18.923493586 +0100
-+++ b/lib/dgif_lib.c	2021-01-13 19:28:55.245863085 +0100
-@@ -1099,7 +1099,7 @@ DGifSlurp(GifFileType *GifFile)
- 
-               sp = &GifFile->SavedImages[GifFile->ImageCount - 1];
-               /* Allocate memory for the image */
--              if (sp->ImageDesc.Width < 0 && sp->ImageDesc.Height < 0 &&
-+              if (sp->ImageDesc.Width <= 0 && sp->ImageDesc.Height <= 0 &&
-                       sp->ImageDesc.Width > (INT_MAX / sp->ImageDesc.Height)) {
-                   return GIF_ERROR;
-               }
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
similarity index 52%
rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
index 1871bab46..105c53eab 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
@@ -3,14 +3,17 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2 \
-    file://CVE-2019-15133.patch \
-"
-
 CVE_PRODUCT = "giflib_project:giflib"
 
-inherit autotools
+DEPENDS = "xmlto-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz"
+SRC_URI[sha256sum] = "31da5562f44c5f15d63340a09a4fd62b48c45620cd302f77a6d9acf0077879bd"
+
+do_install() {
+    # using autotools's default will end up in /usr/local
+    oe_runmake DESTDIR=${D} PREFIX=${prefix} LIBDIR=${libdir} install
+}
 
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${libdir}/libgif.so.*"
@@ -19,6 +22,3 @@ FILES_${PN}-utils = "${bindir}"
 BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}-utils = "perl"
-
-SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
-SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
-- 
2.31.1

