Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.20155.1588499327491466339
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 02:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGVCwgCd;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id u127so5324770wmg.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2020 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=2nxwEZT/Ncisx9Cbad0E/SEBHco+Q9Mkgq9QONQPI0k=;
        b=pGVCwgCdTnR1tYWBBYbcbb0mhUrTCZMLgery7zXe5ZYSHstFcJxsn5A+RyU3neMHk3
         YGJBbUVsD/ZYXqRBFwWHEY6fz+7OOjnIwbizKMX4pCWrM/D8fN2COF1FsJYcNayxV32d
         cJVEtbz/fSlFgghXoHiI8t4IzJx4nvzmBa9NlIZ8qfaCAmArBGEjm29XekHxUj7FWIDT
         jF/L2Gywhiapp+Ze7fmm3lvRAglukU8pM4wNW3Se6wXyTCk0Kx0/0q1FA5GrHe4uXOLj
         qLWFg0ShhdY/lQIo6KzVcVv3yE04Ydc4NqXq8uOpNyznhS4CoEsdxwEwIZkoutIT5tZw
         1KoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=2nxwEZT/Ncisx9Cbad0E/SEBHco+Q9Mkgq9QONQPI0k=;
        b=EOw+ErMMIWVxGtFBCRa8EXTS1Up6wUci/H2xAfDvrvEdONnJMKbVmBTWWjxwUUNuf9
         vTRqVJpA2IQwWqZexz7GUvOEEikOi5c55FqXy8VI3ERtMuyAyS63psxrpq1zWzuOTJNC
         G3vOixRVEeITH9aUqD47ZIomtJ8nMHwcFIKjXTD5mnOS1AU2jnlwiKpn3gQBEoOzugd0
         3dkdOD8F7m0vhv7hW794S6CPpUgRchKhQPjabXrPsLFCKtDtpoZXLNZtovMB471i1Jqg
         8eQAEdYGZnt4X+AJk0FTMoMyV0O/54zBUPkwtf+rqYHxvKs6WSXLm0bZnLe7ySR90tAr
         lfdQ==
X-Gm-Message-State: AGi0PuYjJ4AT02BFczxRJGfaOCFcHFMyWoq16VLZRgdNKnOJ1Y140yvm
	Q5XzlT4OAIwK8AqW5ziMaRFgRwsc
X-Google-Smtp-Source: APiQypLHgqKRlmK7Wh2SP/rAc22eW1peongYK9X0q2T2VTbeuY2tGe6jZywb9dROuZZ8JEOpk+gTqA==
X-Received: by 2002:a1c:dc0a:: with SMTP id t10mr8509268wmg.113.1588499325633;
        Sun, 03 May 2020 02:48:45 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.170.12.212])
        by smtp.gmail.com with ESMTPSA id q14sm1469731wrc.66.2020.05.03.02.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 02:48:44 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] cpprest: update to 2.10.16 and refresh patches
Date: Sun,  3 May 2020 11:48:42 +0200
Message-Id: <20200503094842.16403-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../cpprest/cpprest_2.10.15.bb                | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
deleted file mode 100644
index dee5ae256..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Microsoft project for cloud-based client-server communication in native code using a modern asynchronous C++ API design."
-SECTION = "libs/network"
-HOMEPAGE = "https://github.com/Microsoft/cpprestsdk/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/license.txt;md5=a2e15b954769218ff912468eecd6a02f"
-DEPENDS = "openssl websocketpp zlib boost brotli"
-
-EXTRA_OECMAKE = "-DCPPREST_EXPORT_DIR=cmake/cpprestsdk -DCPPREST_EXCLUDE_BROTLI=OFF -DWERROR=OFF"
-
-SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
-           file://disable-float-tests.patch \
-           file://disable-outside-tests.patch "
-
-# tag 2.10.15
-SRCREV= "b94bc32ff84e815ba44c567f6fe4af5f5f6b3048"
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-- 
2.17.1

