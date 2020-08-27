Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.10307.1598494921238755298
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 19:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BJPX4DTd;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y206so2278174pfb.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 19:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hvezPOqf/hdFDaijI/xPbNqk5dl9YhBom/etketGMW8=;
        b=BJPX4DTdG8JzFqxbzgxnj8CSu4ydHhskmBSfhMiKKB02RyrepjUlJBJtMJmho7ptYl
         zPwsF8eM0sg/x5okDvVwHaz2FTTNOxmSx1WtA0N99CbcsBve0Y6JGNinUJLczh331668
         pTjHNMwUy08PJEOMVZiVedDiUe9AC1t+aXj822NP7AcGlBZmzOkTdhIthaMNjg7KpmWg
         4Tzp18Eo75TQErx7V7OSiyGVhfgNuhWOn1Zlhyd4J7jzSjxBd7e2/mpT9Ak/diTMGZqI
         pJTgfjOAlSwuWPOE8U2F8iF80bQws1QYltPKqK8N6PhbyRXwnun2aNTvHMCLVXnlfySl
         A4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hvezPOqf/hdFDaijI/xPbNqk5dl9YhBom/etketGMW8=;
        b=IYUzUXKcxyymdQ0jbGiZIKEpzVtQxF7Czj7MyYST4EWXsztb/cMe5knQ3wH2FLcRyT
         1V6XNbmQdS3E3FToCO8LMQlnHlwxzMD+ooX8/J1QVvBWlz8NJcxe4L5V+i0rh8vHrTGX
         bG0BV1cJImQQB95bFg0vxtWqJEDouUBWZWRyjIOatIlbjS5mkj4hfVE8C5v8zeYPhrfB
         qUcHLsmIaMUxyZkfQpmSLyL0xPVzh8gIEMz1A/8vyN8etn5mYiou8oHmJ8zLwyZPLb8Z
         QxXjXIMCRWTAJpJAlsyob/BPHCRx98QRGGTA+WvLOaILsyt8kxnWLGZGpcM7wrFfIdJH
         +lMA==
X-Gm-Message-State: AOAM533KUZ5VdBnPLcElW9intzliB16nlCHcrYDUmzvKRrEeyfkNVnEg
	1jXy3lFLjPEtevgmZBPCG1ZhVLghrtruxQ==
X-Google-Smtp-Source: ABdhPJzqUHdfXsIFqLioqEp7bqUQ4Kb5Z+5ur6n6rOJgaJeidzdhKTX6oUcWIzmOEOlQfu39ECZIWA==
X-Received: by 2002:a65:6545:: with SMTP id a5mr13146163pgw.43.1598494920448;
        Wed, 26 Aug 2020 19:22:00 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4fbd])
        by smtp.gmail.com with ESMTPSA id s198sm339363pgc.4.2020.08.26.19.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 19:21:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Avoid converting enum to void*
Date: Wed, 26 Aug 2020 19:21:58 -0700
Message-Id: <20200827022158.1505111-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found with clang-11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ix-Do-not-use-NULL-where-0-is-needed.patch | 46 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.54.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch b/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
new file mode 100644
index 0000000000..432312da25
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
@@ -0,0 +1,46 @@
+From 1136cad77c2dc7d8e1daa317877676733e805f29 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 26 Aug 2020 17:30:40 -0700
+Subject: [PATCH] pkix: Do not use NULL where 0 is needed
+
+Clang finds this error
+
+pkix_logger.c:316:32: error: cast to smaller integer type 'PKIX_ERRORCLASS' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
+        logger->logComponent = (PKIX_ERRORCLASS)NULL;
+                               ^~~~~~~~~~~~~~~~~~~~~
+pkix_logger.c:617:32: error: cast to smaller integer type 'PKIX_ERRORCLASS' from 'void *' [-Werror,-Wvoid-pointer-to-enum-cast]
+        logger->logComponent = (PKIX_ERRORCLASS)NULL;
+                               ^~~~~~~~~~~~~~~~~~~~~
+2 errors generated.
+
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1661378]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nss/lib/libpkix/pkix/util/pkix_logger.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/nss/lib/libpkix/pkix/util/pkix_logger.c b/nss/lib/libpkix/pkix/util/pkix_logger.c
+index a916e6e..10f537a 100644
+--- a/nss/lib/libpkix/pkix/util/pkix_logger.c
++++ b/nss/lib/libpkix/pkix/util/pkix_logger.c
+@@ -313,7 +313,7 @@ pkix_Logger_Destroy(
+ 
+         logger->callback = NULL;
+         PKIX_DECREF(logger->context);
+-        logger->logComponent = (PKIX_ERRORCLASS)NULL;
++        logger->logComponent = (PKIX_ERRORCLASS)0;
+ 
+ cleanup:
+ 
+@@ -614,7 +614,7 @@ PKIX_Logger_Create(
+ 
+         logger->callback = callback;
+         logger->maxLevel = 0;
+-        logger->logComponent = (PKIX_ERRORCLASS)NULL;
++        logger->logComponent = (PKIX_ERRORCLASS)0;
+ 
+         PKIX_INCREF(loggerContext);
+         logger->context = loggerContext;
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-support/nss/nss_3.54.bb
index dc5cafbf1c..882145c1ef 100644
--- a/meta-oe/recipes-support/nss/nss_3.54.bb
+++ b/meta-oe/recipes-support/nss/nss_3.54.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://0001-pkix-Do-not-use-NULL-where-0-is-needed.patch \
            "
 
 SRC_URI[sha256sum] = "dab18bbfcf5e347934cda664df75ce9fd912a5772686c40d3c805e53c08d6e43"
-- 
2.28.0

