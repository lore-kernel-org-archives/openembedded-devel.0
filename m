Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.1893.1621647332159126544
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cFCiJKjj;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gb17so14978656ejc.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qAN5Iq6pmGIv/trc/+x1Xg3JdKPnNg759NSnVFi1tf8=;
        b=cFCiJKjj28Aw+KPwKFg4tbOcYjF7dqew/PAXkNZQNWRK8pqo6udAqts+ETUi2IBUVi
         tCq3tjF8KA+vv+uO41U8g5OwtxB8eseMxFC2G47gEnuVJkXkmCH7eXCQ1OO4b5BXCXRH
         zUL84Z9K/Pabgdchp3muBIngjBC/vzoaSfoWsSpfwZTc7I+okC5rifDnI4tgwLFT8QMd
         /D2owi2pcUiJOWbPfsK2HxFKaYPhSAZaddbCNuhxWQXm3NAgh6y5oZeyB65NEggwdPUj
         sb9NtMVz+PNFoxaxztBXVss04MFyBiZiwJroWcwCbsBOeWoFdUlWfXfEau6VxdubFl4R
         jKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qAN5Iq6pmGIv/trc/+x1Xg3JdKPnNg759NSnVFi1tf8=;
        b=gR2YrPTTUli7PMd3jdgw7HaBJxoBqajOt0WnzQs1JvRCK2jTLAeOFQllrCOaZTQgxD
         DbN15h3SaF20378jL19q2lJeSEvnLDLb3OXX4h5OL/W+H6AAcZZUMYPPFF0MlhcvfHgJ
         p/CjOvC4ZiX5uf2KfBXZbo26XLSeHQH1fViwnxEYznPyU6Q0WNkFoswUSH/5QFYpdXIm
         CjjQw8Nh6Q86WyiYNYllGjLCdfJui+QyfTXBaAJgaTJt+BmvUb2nyfi3IIi+3BDflHtD
         mfvc8dAjCVfgcNxOJpTiXLHhB0otY4purJFztiB85kgXvJG8Nr4Yq0a20gNvQLivNBiE
         rh2w==
X-Gm-Message-State: AOAM530zC28CrC0GfI5er82cuu03LOFQIpUdP7eI+PQvRIybCho+Bw35
	YvmuV/lHWS+BTcJdg5Tqi0+h7k415Ho=
X-Google-Smtp-Source: ABdhPJyZjea+welbCJN1J0zRmEVKn+i0Whjf7bkd3bypJZDUdF25ZMIww6vol1F+7Omb0t39dtJSfg==
X-Received: by 2002:a17:906:d1ce:: with SMTP id bs14mr12953377ejb.183.1621647330565;
        Fri, 21 May 2021 18:35:30 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:29 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/17] giflib: upgrade 5.1.4 -> 5.2.1
Date: Sat, 22 May 2021 03:35:05 +0200
Message-Id: <20210522013521.588774-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Checked sources: Back ported CVE-patch can go

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../giflib/files/CVE-2019-15133.patch         | 23 -------------------
 .../{giflib_5.1.4.bb => giflib_5.2.1.bb}      | 19 ++++++++-------
 2 files changed, 11 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/giflib/files/CVE-2019-15133.patch
 rename meta-oe/recipes-devtools/giflib/{giflib_5.1.4.bb => giflib_5.2.1.bb} (54%)

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
similarity index 54%
rename from meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
rename to meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
index 1871bab46..cbb57782b 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.1.4.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.1.bb
@@ -3,14 +3,18 @@ SECTION = "libs"
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
+    oe_runmake DESTDIR=${D} PREFIX=${prefix} LIBDIR=${libdir} install
+}
 
 PACKAGES += "${PN}-utils"
 FILES_${PN} = "${libdir}/libgif.so.*"
@@ -20,5 +24,4 @@ BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}-utils = "perl"
 
-SRC_URI[md5sum] = "2c171ced93c0e83bb09e6ccad8e3ba2b"
-SRC_URI[sha256sum] = "df27ec3ff24671f80b29e6ab1c4971059c14ac3db95406884fc26574631ba8d5"
+
-- 
2.31.1

