Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.51387.1597692389227528992
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 12:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fnYA1F/g;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id u10so8028496plr.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hdukUx+s42hCAmerd5udRRIVqM5pNpErsf3U1TCZxQo=;
        b=fnYA1F/gzqOpfUMvS/LMqnIZp5KJzfQvU0UsJCSbLq/KK7Qtz8GEzKzcCjsHILkkYP
         W9AmftTaVgx/vPfs88ecSIOk7tXaKtx6luKD7MCO07IDBR8TSbWr1D66G2J2u3zW6OA0
         2VjryINhdw7RQz9YWQycHhukj8vXtZhjs5xpSNCWA5CyIBbicLzZOVpn56uGCi8QPWhw
         WvozkDitBWe6mIf7iEzzDy6uEyA7AgXIUg6sJJscVFQ960nlkn7hXTjJo1jJ7jtjNjeQ
         0+Zlmu5ew7lOL85OcCSgH9uHutAhP7vyz0mxb/7Rck/4ZSUSFdxQlI3hP8hO5YsfflYm
         xozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hdukUx+s42hCAmerd5udRRIVqM5pNpErsf3U1TCZxQo=;
        b=DLD/jI8zmRrxStWtiN4LrKhfjW9d2GY9kydo56CWAyAiKTcT75/8FUQhbo9rOGsigm
         PfRCkfl3A3QwL8CaAGZdBAGKAfyBXXJvuzfKqiHzRu1mjyjJy9uFcrGgbIK9TO86JFbB
         7nSQNmy3i+uMNqDGPJYk/bxMExVJBIv+crRzj+C22akCWuL14i41LlU6Wju1OITEk90m
         3H2FbIPT8UReOOzvq5ZQ7F2660ZOW7o1HWmY2SOzP3QTW5GkS01FN5zBhZWyGQ6SdoUS
         0XeZ0IgWC2MNjs1XZRqjMX6nw21jBTcxjFBH9oPAx0eHUC9SLLQsYTt5xX042LY1b+dW
         gsow==
X-Gm-Message-State: AOAM533YIV9dfxA9aENcz/gNoR75jY5q8DItXI3PfTVmzuqBEvcm9E19
	2UUcMln+bnTLdOmdKqhFFJqHGMgr3EBXJA==
X-Google-Smtp-Source: ABdhPJzPSL6pcW9MeEIDB85NCijVZ3xYCwVqaigKrjSpYo5AmZKgpVyy4XovfqRVpNkVpCKs8gpZXA==
X-Received: by 2002:a17:902:aa4c:: with SMTP id c12mr12623468plr.237.1597692388345;
        Mon, 17 Aug 2020 12:26:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::37ae])
        by smtp.gmail.com with ESMTPSA id lb1sm17703985pjb.26.2020.08.17.12.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 12:26:27 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fwts: Upgrade to 20.07.00
Date: Mon, 17 Aug 2020 12:26:25 -0700
Message-Id: <20200817192625.3397310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use B = S since new version uses relative paths in makefiles
this version compiles fine with clang too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fwts/0001-Remove-Werror-from-build.patch     | 16 +++++-----------
 .../fwts/{fwts_19.06.00.bb => fwts_20.07.00.bb}  | 10 +++-------
 2 files changed, 8 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-test/fwts/{fwts_19.06.00.bb => fwts_20.07.00.bb} (80%)

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch b/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
index 6795ba8495..93a42213bb 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Remove-Werror-from-build.patch
@@ -11,8 +11,6 @@ Upstream-Status: Pending
  src/utilities/Makefile.am | 2 +-
  3 files changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 62c9ba8..435ec23 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -14,7 +14,7 @@ AM_CPPFLAGS = \
@@ -20,15 +18,13 @@ index 62c9ba8..435ec23 100644
  	`pkg-config --silence-errors --cflags json-c`	\
  	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
 -	-Wall -Werror -Wextra				\
-+	-Wall -Wextra				\
- 	-Wno-address-of-packed-member
- 
- bin_PROGRAMS = fwts
-diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 6bcf9f8..de89bf1 100644
++	-Wall -Wextra					\
+ 	-Wno-address-of-packed-member			\
+ 	-Wfloat-equal -Wmissing-declarations		\
+ 	-Wno-long-long -Wredundant-decls -Wshadow	\
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
-@@ -24,7 +24,7 @@ AM_CPPFLAGS = \
+@@ -25,7 +25,7 @@ AM_CPPFLAGS = \
  	`pkg-config --silence-errors --cflags json-c`	\
  	`pkg-config --cflags glib-2.0 gio-2.0` 		\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
@@ -37,8 +33,6 @@ index 6bcf9f8..de89bf1 100644
  	-Wno-address-of-packed-member
  
  pkglib_LTLIBRARIES = libfwts.la
-diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index 21f969e..82009a0 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
diff --git a/meta-oe/recipes-test/fwts/fwts_19.06.00.bb b/meta-oe/recipes-test/fwts/fwts_20.07.00.bb
similarity index 80%
rename from meta-oe/recipes-test/fwts/fwts_19.06.00.bb
rename to meta-oe/recipes-test/fwts/fwts_20.07.00.bb
index 88a89fb0b6..28565eb8ca 100644
--- a/meta-oe/recipes-test/fwts/fwts_19.06.00.bb
+++ b/meta-oe/recipes-test/fwts/fwts_20.07.00.bb
@@ -5,8 +5,7 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-SRCREV = "b0ec7aa2ef743d113fd8c5e57c0ca3d5edd86f0e"
-SRC_URI = "http://fwts.ubuntu.com/release/fwts-V19.06.00.tar.gz;subdir=${BPN}-${PV} \
+SRC_URI = "http://fwts.ubuntu.com/release/fwts-V${PV}.tar.gz;subdir=${BP} \
            file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
            file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
            file://0003-Undefine-PAGE_SIZE.patch \
@@ -14,15 +13,14 @@ SRC_URI = "http://fwts.ubuntu.com/release/fwts-V19.06.00.tar.gz;subdir=${BPN}-${
            file://0003-use-intptr_t-to-fix-pointer-to-int-cast-issues.patch \
            file://0001-Remove-Werror-from-build.patch \
            "
-SRC_URI[md5sum] = "012f933329510cc5a71817ede681eee2"
-SRC_URI[sha256sum] = "13aa991f12c69f48df368aae5e5d0fbc9136413b4bfe115421bc3216d919f8a2"
+SRC_URI[sha256sum] = "4a8e0211b388efbcfcb6530297e9a924d0afa2d6db58e9db2f031129eda6d66f"
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
 DEPENDS = "libpcre json-c glib-2.0 dtc bison-native libbsd"
 DEPENDS_append_libc-musl = " libexecinfo"
 
-inherit autotools bash-completion pkgconfig
+inherit autotools-brokensep bash-completion pkgconfig
 
 CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
 LDFLAGS_append_libc-musl = " -lexecinfo"
@@ -32,5 +30,3 @@ FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/fwts/lib*a"
 FILES_${PN}-dbg += "${libdir}/fwts/.debug"
 
-TOOLCHAIN = "gcc"
-
-- 
2.28.0

