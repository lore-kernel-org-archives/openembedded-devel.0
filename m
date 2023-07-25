Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB185EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 05:16:21 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.14008.1690262175309465119
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 22:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=H8K9WDxC;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6686708c986so4810511b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 22:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690262174; x=1690866974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DkmDynmb2tVibinjOyDQFzPoiDlwN5luVlPD5SfkiYo=;
        b=H8K9WDxCsB/Xt0jal65ogCMC6wIP+nIV7i1M9XKio1I29UySQNmndByDay6T6KbX0e
         cUB4dfpzmt7BvxjcQp61M7oe93q8fChxPiUwWZwNXeIF3c1xSl/KwLA0TUEvrO0Ha2A2
         cv5cQLaQL7h9s3XFsv+OGJkjAx5suKi/5pj4csqooZjGOFMdCqQAQnuTdSsaP/cqFtgi
         ap56nh6cjFFmljhOdETP7+4TuX5XhbsJPTpplueQfOTmPlalPrMvrQpG49YUzTTMH4rG
         9qXYPV9GVKcrP9Xfr9xoRgMQcVcWm3bsL9Nj152Dz4fh0rQeG/qKXy315a5N56Eyjiri
         2YYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690262174; x=1690866974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkmDynmb2tVibinjOyDQFzPoiDlwN5luVlPD5SfkiYo=;
        b=UtujA8ikJhn2qOYGY/g4U0TTrlyJAu9FqQbQRaoUE4zhz96dvlYSj29oaBVkhXGEnK
         FZbr+G2s6OxktpTPr311iOto/kD+eTtKIIZdeu+K36QWhrJ1KnYlRQx5TEz0jVezfKTW
         4+DpJo6jFf4M1t4Fb7yHdPBm4nPXgQ+ZCwv5Bl0+rKwpjnaMStlZ7DuTd/OsSIDRTzAN
         IAjONLGHGCYtwcFIgbw+TmCOAz3kNpDRWjDvVYB2zLpsNM55b8Ddgcf9OFhg0B5cVsEG
         kF+bJ8EdRT/mHtW53kgMzxpyFFXsbnqQ++cASys05ByeLnV2TdZZIv+17FUSLREyic7j
         78cQ==
X-Gm-Message-State: ABy/qLalN9jiH+6pyLJORKfqad/lM10LJkhQ4WRXjbETWqtCioP/5/4e
	uL8mTgY3OdVPKctqBERUGhCiTYvrKzf1Hw==
X-Google-Smtp-Source: APBJJlGBem/PutH8JUOjLoLHr/ygan6VMxUvWd46zIpabmKAaYxVvO5oTuYGMinOy6jmK8ipr4tkzA==
X-Received: by 2002:a17:902:70cc:b0:1b8:475d:ebf6 with SMTP id l12-20020a17090270cc00b001b8475debf6mr12849992plt.0.1690262174269;
        Mon, 24 Jul 2023 22:16:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::6adc])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b04b1bd774sm9942379plx.208.2023.07.24.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:16:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] openwsman: Link with -lm to get floor() definition
Date: Mon, 24 Jul 2023 22:16:11 -0700
Message-ID: <20230725051611.1401853-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 05:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104009

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Link-with-libm-for-floor-function.patch | 71 +++++++++++++++++++
 .../openwsman/openwsman_2.7.2.bb              |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch

diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch
new file mode 100644
index 0000000000..2f47261588
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch
@@ -0,0 +1,71 @@
+From 09101da4efaa5584b7f3f3f3bfa5dbb4d1e26948 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 24 Jul 2023 22:09:21 -0700
+Subject: [PATCH] Link with libm for floor() function
+
+LLD linker finds this missing symbol
+
+arm-yoe-linux-gnueabi-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: floor
+>>> referenced by src/lib/libwsman.so.1.0.0
+
+Upstream-Status: Submitted [https://github.com/Openwsman/openwsman/pull/195]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt         | 10 ++++++++++
+ configure.ac           |  3 ++-
+ src/lib/CMakeLists.txt |  4 ++++
+ 3 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6e54c66b..507ee633 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -297,6 +297,16 @@ ELSE(HAVE_LIBDL)
+  SET(HAVE_LIBDL 0)
+ ENDIF(HAVE_LIBDL)
+ 
++# m
++
++FIND_LIBRARY( HAVE_LIBM "m" )
++IF(HAVE_LIBM)
++ SET(M_LIBRARIES ${HAVE_LIBM})
++ SET(HAVE_LIBM 1)
++ELSE(HAVE_LIBM)
++ SET(HAVE_LIBM 0)
++ENDIF(HAVE_LIBM)
++
+ # crypt
+ 
+ FIND_LIBRARY( HAVE_LIBCRYPT "crypt" )
+diff --git a/configure.ac b/configure.ac
+index 125564da..010fa0b6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -128,7 +128,8 @@ daemon  \
+ va_copy \
+ memmove \
+ bcopy \
+-gmtime_r
++gmtime_r \
++floor
+ )
+ AC_CHECK_FUNC(socket, , AC_CHECK_LIB(socket, socket))
+ AC_CHECK_FUNC(gethostbyname, , AC_CHECK_LIB(nsl, gethostbyname))
+diff --git a/src/lib/CMakeLists.txt b/src/lib/CMakeLists.txt
+index 5c51781f..496fd672 100644
+--- a/src/lib/CMakeLists.txt
++++ b/src/lib/CMakeLists.txt
+@@ -36,6 +36,10 @@ if( HAVE_LIBDL )
+ TARGET_LINK_LIBRARIES(wsman ${DL_LIBRARIES})
+ endif( HAVE_LIBDL )
+ 
++if( HAVE_LIBM )
++TARGET_LINK_LIBRARIES(wsman ${M_LIBRARIES})
++endif( HAVE_LIBM )
++
+ IF( ENABLE_EVENTING_SUPPORT )
+ TARGET_LINK_LIBRARIES( wsman ${WSMAN_CLIENT_PKG} )
+ ENDIF( ENABLE_EVENTING_SUPPORT )
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 39a9c52a47..1c68b5f432 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
+           file://0001-Link-with-libm-for-floor-function.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.41.0


