Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7E5C83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 23:29:39 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.2116.1752535778529408755
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 16:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fvVobSSX;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b3220c39cffso4993609a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 16:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752535777; x=1753140577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2RcVsvrBwzi8oXchm7ytAssb+LYVJXGogU5V7dZLY8=;
        b=fvVobSSXcHqNFuEOPqLHk3FZECQPn1j7merXtT4ZDFMnyiX3KPKlyNKq0/lK4IMob+
         yy6ezhetJK0Qa5MNPmn1mB7JzSUp6qkAJN+fMGcuo/EHujRzIVsHMBCsgboOWV2mMBfE
         vzbT8CLWjvEd/lN1hyRg5c72k9Iy5xg5KOQNGWYF8vg9PURwWgh8dTpkuohasniIgAeE
         ns7pploF5sKRHvWvsPlO7bfEdU8DdWLfo8olSrml+kEW4c5LMWh4+FNwjwRexZJVs7uV
         at/PJhL4R/GMYCWxLFaFVOFDeZ7iZlFgqNTYjYCbNWrHOEy+mIyTNl51WEukEluPjfBs
         nzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752535777; x=1753140577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2RcVsvrBwzi8oXchm7ytAssb+LYVJXGogU5V7dZLY8=;
        b=YFeW2rkNcSrVIyIsm/8tZh3367HfQ857iMSoA/dXWefdU3wyn5UnfWanU3bDS3ciuu
         NqKMHeSNBmyQ3sADXuI/Wv5UXcM+K3B9hRVkQ9I9FkA+CSHtV2B+yZfuk3zMVGVW7lgZ
         ncO5x4+xk9MI16KJqE07JtEnYn9Vlk7zgm+Iq9XBCCTVU//vUtLTT5lP3qQelGpkbthU
         BUzIob5tu4VYZCwtBn9odn3zEMnImk1KIAL+pI8F+gHFjNXf7wIRi8fkD+Th5u5nWSep
         0xVwYDY7fAEnMr5N/GLXAFAz1XaUqNeve2IL38Tfll1IgggTtoDaEOVEfWRgtLyPSHME
         ZySA==
X-Gm-Message-State: AOJu0Yys9XuYfgPThKto7Yluz8RT0Sd7t8DucLrNJIFi5cjTVPyXiL5b
	+HyWmi+cbABSW/0TibdY2VeHOB49JoDEA66scbYCy7WSvVC8aKtLTkADFLfBmavT
X-Gm-Gg: ASbGncudXh+kyxtUBWnuSVqy1jC+Cz1NE0Xvn+wNozZbwuSUADG3ddkpfrld3jEG+Nu
	3h/bMKnWOJZNXw41C86JZOw7pm2Egm0vvorq85zuvfIdIB2OZfOurtC28DbwQiPgzl7KtfDU2q+
	eaM4MGZM1wuNZFWyzNhVtkBByUqDFUFfpiPEO/sxoeLXX8O751HHxBBKyoVBG+W5958DOLtSlIc
	xfWkptivs3ARlS8bvf4Gacq81DlO9iyCycbnQW0PAgykz9qnDnAy53JNObIvpudo3heVVxJt7Xm
	CrnHZXeT94NeEOjr+9CZgO69Zqcbxhxmb4NrAJ49e7sBeScswUbxL2Z2aXg2s1xZcIOmi0UWo3I
	OKcpFlZ84hT+kAGVIeIj8E7r5
X-Google-Smtp-Source: AGHT+IE8kYT+r/L0WicO0rrPWgnp6htHgLnwl90qB27BVTQxq+AWvENdJChuY30QZdCJ+4TAlLmEuQ==
X-Received: by 2002:a05:6a21:7a44:b0:220:63bd:2bdb with SMTP id adf61e73a8af0-2314986f9ecmr24635784637.40.1752535777334;
        Mon, 14 Jul 2025 16:29:37 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6bd903sm10929482a12.49.2025.07.14.16.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:29:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] openwsman: Upgrade to 2.8.1 release
Date: Mon, 14 Jul 2025 16:29:33 -0700
Message-ID: <20250714232933.230092-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250714232933.230092-1-raj.khem@gmail.com>
References: <20250714232933.230092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 23:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118546

Fixes build with cmake4+
Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Link-with-libm-for-floor-function.patch | 71 -------------------
 ...HREAD_MUTEX_RECURSIVE_NP-if-undefine.patch |  5 --
 ...sl-is-required-if-eventint-supported.patch | 19 -----
 ...{openwsman_2.7.2.bb => openwsman_2.8.1.bb} |  7 +-
 4 files changed, 2 insertions(+), 100 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch
 delete mode 100644 meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
 rename meta-oe/recipes-extended/openwsman/{openwsman_2.7.2.bb => openwsman_2.8.1.bb} (92%)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch
deleted file mode 100644
index 2f47261588..0000000000
--- a/meta-oe/recipes-extended/openwsman/openwsman/0001-Link-with-libm-for-floor-function.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 09101da4efaa5584b7f3f3f3bfa5dbb4d1e26948 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 24 Jul 2023 22:09:21 -0700
-Subject: [PATCH] Link with libm for floor() function
-
-LLD linker finds this missing symbol
-
-arm-yoe-linux-gnueabi-ld.lld: error: undefined reference due to --no-allow-shlib-undefined: floor
->>> referenced by src/lib/libwsman.so.1.0.0
-
-Upstream-Status: Submitted [https://github.com/Openwsman/openwsman/pull/195]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt         | 10 ++++++++++
- configure.ac           |  3 ++-
- src/lib/CMakeLists.txt |  4 ++++
- 3 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6e54c66b..507ee633 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -297,6 +297,16 @@ ELSE(HAVE_LIBDL)
-  SET(HAVE_LIBDL 0)
- ENDIF(HAVE_LIBDL)
- 
-+# m
-+
-+FIND_LIBRARY( HAVE_LIBM "m" )
-+IF(HAVE_LIBM)
-+ SET(M_LIBRARIES ${HAVE_LIBM})
-+ SET(HAVE_LIBM 1)
-+ELSE(HAVE_LIBM)
-+ SET(HAVE_LIBM 0)
-+ENDIF(HAVE_LIBM)
-+
- # crypt
- 
- FIND_LIBRARY( HAVE_LIBCRYPT "crypt" )
-diff --git a/configure.ac b/configure.ac
-index 125564da..010fa0b6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -128,7 +128,8 @@ daemon  \
- va_copy \
- memmove \
- bcopy \
--gmtime_r
-+gmtime_r \
-+floor
- )
- AC_CHECK_FUNC(socket, , AC_CHECK_LIB(socket, socket))
- AC_CHECK_FUNC(gethostbyname, , AC_CHECK_LIB(nsl, gethostbyname))
-diff --git a/src/lib/CMakeLists.txt b/src/lib/CMakeLists.txt
-index 5c51781f..496fd672 100644
---- a/src/lib/CMakeLists.txt
-+++ b/src/lib/CMakeLists.txt
-@@ -36,6 +36,10 @@ if( HAVE_LIBDL )
- TARGET_LINK_LIBRARIES(wsman ${DL_LIBRARIES})
- endif( HAVE_LIBDL )
- 
-+if( HAVE_LIBM )
-+TARGET_LINK_LIBRARIES(wsman ${M_LIBRARIES})
-+endif( HAVE_LIBM )
-+
- IF( ENABLE_EVENTING_SUPPORT )
- TARGET_LINK_LIBRARIES( wsman ${WSMAN_CLIENT_PKG} )
- ENDIF( ENABLE_EVENTING_SUPPORT )
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
index 0e2349e303..8440793b89 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
@@ -13,8 +13,6 @@ Upstream-Status: Pending
  src/lib/u/lock.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/lib/u/lock.c b/src/lib/u/lock.c
-index 025eea4c..b31c77b5 100644
 --- a/src/lib/u/lock.c
 +++ b/src/lib/u/lock.c
 @@ -50,7 +50,7 @@
@@ -26,6 +24,3 @@ index 025eea4c..b31c77b5 100644
  #define PTHREAD_MUTEX_RECURSIVE_NP PTHREAD_MUTEX_RECURSIVE
  #endif
  
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch b/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
deleted file mode 100644
index 71f3d90a81..0000000000
--- a/meta-oe/recipes-extended/openwsman/openwsman/libssl-is-required-if-eventint-supported.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Pending
-
-libssl is required by wsman_client_transport if ENABLE_EVENTING_SUPPORT enabled.
-
-Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
-
-diff -Nurp openwsman-2.4.12.orig/src/lib/CMakeLists.txt openwsman-2.4.12/src/lib/CMakeLists.txt
---- openwsman-2.4.12.orig/src/lib/CMakeLists.txt	2014-10-28 23:04:47.000000000 +0800
-+++ openwsman-2.4.12/src/lib/CMakeLists.txt	2014-12-31 11:09:20.340428523 +0800
-@@ -56,6 +56,9 @@ TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TR
- SET_TARGET_PROPERTIES( ${WSMAN_CLIENT_TRANSPORT_PKG} PROPERTIES VERSION 1.0.0 SOVERSION 1)
- INSTALL(TARGETS ${WSMAN_CLIENT_TRANSPORT_PKG} DESTINATION ${LIB_INSTALL_DIR})
- 
-+IF( ENABLE_EVENTING_SUPPORT )
-+TARGET_LINK_LIBRARIES( ${WSMAN_CLIENT_TRANSPORT_PKG} ${OPENSSL_LIBRARIES} )
-+ENDIF( ENABLE_EVENTING_SUPPORT )
- 
- ############### wsman_client ###############
- 
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.8.1.bb
similarity index 92%
rename from meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
rename to meta-oe/recipes-extended/openwsman/openwsman_2.8.1.bb
index 970d7fb5fc..5abe06d07b 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.8.1.bb
@@ -15,16 +15,13 @@ DEPENDS = "curl libxml2 openssl libpam"
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRCREV = "0120e256faa255d997d9a49d5207662c0b73d430"
+SRCREV = "20efbccaf804a5a27a914eb8802b806416c03ece"
 
-SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
-           file://libssl-is-required-if-eventint-supported.patch \
+SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https;tag=v${PV} \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
-           file://0001-Link-with-libm-for-floor-function.patch \
            "
 
-
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d4f53d4c6cf73b9d43186ce3be6dd0ba"
 

