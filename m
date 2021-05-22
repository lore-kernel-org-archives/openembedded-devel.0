Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.4503.1621671977107774082
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 01:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OEQhC0gy;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id i7so15993621ejc.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zc8zD3b30y+10tnQsw2RNWNG2+uonB19H67boPZsmQw=;
        b=OEQhC0gyTFFmKQShBLZIfmZXk3mW1JzvmJ6KEBNT8lyb6W0LuXY+r672EvjkW4AtsY
         OxNuW1hIrJCSb1k9iWF+a+EU7E6YAl3TP9g+qr+1PX78QlRpBHd6U0ZEf5sf6snLeMQn
         /Z8oq1AaecQkCE9dSRi4yPqMZPg/+V+hhJKk9MPP2bXou8dBxA0ghcAiL0ji4VVMDJDm
         pvwkJpYecLGAL6RGmVjbzRgGuDm/covjBgrGE17I1ONMu5N93rNp2Zj2fTO/U4Mjtkuz
         Qj+oA4R/0vc3pNVjZrmErA5hyHAZQzObc+BZ87CicN/+LeidgeXRwNtyyQdfXFq1R9vA
         5DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zc8zD3b30y+10tnQsw2RNWNG2+uonB19H67boPZsmQw=;
        b=VQkiP+QIE5UcR3SaOMyMmctVS4dDUZYuS5FICdsZSZjzdkwEj8QVdWo2BgIV//i0+/
         CBZbECvckQVqyTXkvz6JhubBBKJb09X1Fjg2c13TEYAGYPX1RG20d1lkzIxPD7Y5xPJM
         xj4uPbWSJL9J+H7DUx3XCvCgAyIcx/hEzdRuDuv0qjur/6MUUpp/RWYvINg9c+wodwPK
         X1osvhMxLEfE1xvV94/B+JcPyrjQPRNXI3PEonREuiIqehkItB1wxQUSGJqE+JKBYpf1
         YwOkTltgOfTp+l43Dg8mzpZd3UKAPncPLJyJB/8yMetLyOviwo6gndQr2ZV0WxmquV+b
         rdmQ==
X-Gm-Message-State: AOAM5317Cr6vxNPnLDIE4Aj3qv3Qrz2APNWiqyAugMGwrXqCmEJOjvvi
	zPK0LEXUic5Tlo5iKA6DZlcpzRqyqqc=
X-Google-Smtp-Source: ABdhPJxx+mP9Ypp09kgfdIoOgV1+imSVTb2ZVZ/OLRE5AXBu9F4k+g4WY9Td97BlvM/HNd6cAzxPPQ==
X-Received: by 2002:a17:907:78cd:: with SMTP id kv13mr13777360ejc.360.1621671975709;
        Sat, 22 May 2021 01:26:15 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b6614c38748203e05ff.dip0.t-ipconnect.de. [2003:f0:7f1a:3b66:14c3:8748:203e:5ff])
        by smtp.gmail.com with ESMTPSA id k14sm5971810eds.0.2021.05.22.01.26.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 May 2021 01:26:15 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][v2] giflib: upgrade 5.1.4 -> 5.2.1
Date: Sat, 22 May 2021 10:26:05 +0200
Message-Id: <20210522082605.16975-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Project removed autotools configuration files. So it is now a pure Makefile
  build which requires autotools-brokensep
* Checked sources: Back ported CVE-patch can go

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V2:
* explain autotool -> -brokensep in commit message
* add comment in do_install explaining why we tailored it
 .../giflib/files/CVE-2019-15133.patch         | 23 -------------------
 .../{giflib_5.1.4.bb => giflib_5.2.1.bb}      | 20 ++++++++--------
 2 files changed, 11 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb} (50%)

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
similarity index 50%
rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
index 1871bab46..d8757ef58 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
@@ -3,14 +3,19 @@ SECTION = "libs"
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
+inherit autotools-brokensep
+
+do_install() {
+    # using autotools's default will end up in /usr/local
+    oe_runmake DESTDIR=${D} PREFIX=${prefix} LIBDIR=${libdir} install
+}
 
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${libdir}/libgif.so.*"
@@ -19,6 +24,3 @@ FILES_${PN}-utils = "${bindir}"
 BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}-utils = "perl"
-
-SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
-SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
-- 
2.31.1

