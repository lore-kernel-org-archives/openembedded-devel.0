Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web08.10660.1607812245885357492
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Dec 2020 14:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O/bYiInc;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id n10so1792805pgl.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Dec 2020 14:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WbgMEp5DbCjAJbl/tmhuIVczhah3c6iPdc8IJnqIxoQ=;
        b=O/bYiIncNXSpS+04M3dF0+ftI4cZR0oK9763D3TrxPuGKUoUwS1FQbfONDC8APBna3
         +WmMKla/0X/zGs0X5QZelqt3tLIYIgSFm76D6Y9KLRUfBTr1q1pDIHYKkMkhojcBw+Rq
         fwnRbpnJYrzHNwmzR0NgAO6yr9Vtod9VME1Ai0itAewYRBSWaXWr2lGtwxVVn6q5NRr2
         dIw7lCgwTBsUZEBqP0/k+QdAXAY4kqN0wX2ilhm/d02If1jDfSi7RDDyYlb8GoZbdqin
         zpTdUfgKQxnbFrCTt1vXhNgaKXGPJl3i7DtoOTu0xFFk0kTFHfGizeARSuusl5tWjHA/
         KL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WbgMEp5DbCjAJbl/tmhuIVczhah3c6iPdc8IJnqIxoQ=;
        b=MgEtme3Dmv7e9KA6wfA5yDcq0jyXBz8Z/FxkvMbp8vQrBJCBb9wpG7gFpm0JUDTWGn
         KbI2sZzbOPoJq2Ot1AQ4z1TlEGx9pjOxAmbZA5HrC2tiAIQsb4yBC4VzzASvbaQj4g1e
         II/9TjuarwX23yV2KNC2ZW6lAoeTLOEnk4nes5iQWHG8o8907+BdzxR09+iTsah6oa8i
         e2xctvl9PqtryLK59+Oh2cEc006XXlunFxNIa4aeYEdWtMmG82gTh3P+xFD6BGgzlRHg
         g/5kuTYtbProFaRECWoWAAcqepVEeNLAs60YYxbLLl+9jkUAgG53sbj0saz8JIOb4zhJ
         6ouw==
X-Gm-Message-State: AOAM530CCq/qDm/yHH/z6ljoh/5mWqpA0tolIu1t+PznaZzyiIPX7AwD
	sBB7saHXPASPBG+iT7oTdChFolPcFNpglA==
X-Google-Smtp-Source: ABdhPJz3sUsl4B4vlXe8LXKN7eL0vkAe4c1L2pQJy/icKOTf7XUsRUwL0Vp3gF31XoH0rbOo6BHGWA==
X-Received: by 2002:a63:491b:: with SMTP id w27mr17807131pga.284.1607812245067;
        Sat, 12 Dec 2020 14:30:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id 77sm14471345pfx.156.2020.12.12.14.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 14:30:44 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pidgin-sipe: Do not add native libdir to pkgconfig search path
Date: Sat, 12 Dec 2020 14:30:42 -0800
Message-Id: <20201212223042.2148369-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This works fine until valgrind is installed on build host but its not
selected as option to build in recipe, configure wrongly pokes at
/usr/lib and sees valgrind there and enables it but only to fail in
compile time where it does not find valgrind.h in recipe sysroot, since
OE's build environment add right guardrails to pkgconfig, there is no
need to add build staging area to pkgconfig search path which turns out
to be wrong for cross builds anyway

Fixes
../../../pidgin-sipe-1.25.0/src/core/sipe-cert-crypto-nss.c:34:10: fatal error: 'valgrind.h' file not found
         ^~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-add-native-paths-to-pkgconfig-searc.patch | 36 +++++++++++++++++++
 .../pidgin/pidgin-sipe_1.25.0.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch

diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch
new file mode 100644
index 0000000000..1dc7ca3f17
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe/0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch
@@ -0,0 +1,36 @@
+From fedef3c0b1772cee97d7288bee7d5d50805a5964 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Dec 2020 08:56:04 -0800
+Subject: [PATCH] configure: Do not add native paths to pkgconfig search
+
+This does not work in cross environments, secondly in OE we already
+point pkkconfig into recipe sysroot where it will find all the
+dependencies therefore this setting is not needed
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0df85b0..2481153 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,12 +70,6 @@ AC_CHECK_HEADERS([])
+ dnl checks for library functions
+ AC_CHECK_FUNCS([])
+ 
+-dnl tell pkgconfig to look in the same prefix where we're installing this to,
+-dnl as that is likely where libpurple will be found if it is not in the default
+-dnl pkgconfig path
+-PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:${libdir}/pkgconfig"
+-export PKG_CONFIG_PATH
+-
+ dnl debug mode
+ AC_ARG_ENABLE(debug,
+ 	[AS_HELP_STRING([--enable-debug],
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
index 99fcf3c6d0..f6b4c7cee1 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-sipe_1.25.0.bb
@@ -10,6 +10,7 @@ inherit autotools gettext pkgconfig
 SRC_URI = "${SOURCEFORGE_MIRROR}/sipe/pidgin-sipe-${PV}.tar.xz \
            file://0001-sipe-consider-64bit-time_t-when-printing.patch \
            file://0001-Align-structs-casts-with-time_t-elements-to-8byte-bo.patch \
+           file://0001-configure-Do-not-add-native-paths-to-pkgconfig-searc.patch \
 "
 
 SRC_URI[md5sum] = "0e742f021dc8c3f17435aea05c3e0314"
-- 
2.29.2

