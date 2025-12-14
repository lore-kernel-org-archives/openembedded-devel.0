Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBE6D5B16C
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 19:20:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31642.1765740008730177121
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 11:20:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R3oRm3MP;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e77f519so1397897f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 11:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765740007; x=1766344807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C4JhGJk7mdvYABkI1BBEbpaL/q5WEGbowe9E4tp7i60=;
        b=R3oRm3MPOMq9jYDnW92YPForLKaPLJY5cPrjdQlnM7EkkveI6e1Tz5Exyu8OLu3YhS
         WZmqvoIOKO6zKuEw0TdoMegDIQVCSsxqUJqsfCOsv8Je6Nq5qOtezMzprH2mEYy+8mya
         /1agRjlramuyMJVszHrgIsdr5meZIzMAq+oc/1nJFBcNSmCcZcDTmbUUExBF2ErNAv+A
         dSTXkbiYH8n7sx8Jo1Eo+Cud4Z3XzDiHWKkrCAvUlC4TILdUft57GBI4q9EU/CTJeEyk
         BM66FeWCesHHL7gP7KGki2BsePRYLyn0R6tGu8UMRPJpbBTvCmhziWh/HdDs/RhbSNTi
         i7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765740007; x=1766344807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4JhGJk7mdvYABkI1BBEbpaL/q5WEGbowe9E4tp7i60=;
        b=AeFk1bzJfVLjYxc1N1SOf9bNDTW5FdX/QEEJxytYMfSa7MQGTAOV//EV/mPDKFWGmO
         +TN8bNSsvSD+Lm34tNQBwK9LrRdfR7bE2Tb7HUbb9FPSIbiqfOar1s6d0BUtcd4bLOHD
         iI/QQhDCIwWv8u7PvrDvmkXoIsmzjSgz8s4UAdFWWJnGvEOz3FL6HZfUBLRUuuMgrDHw
         2zrjnImoNWPc4C2mN9ZbKjJEGONir6kIu2MGI9/IifNar450elJEZ4TYVEIE3hJsm7iu
         rTPpSB0IGIQMH+A9GbXpRoX/VzcwZtXulKxI1EoSF12VwtCvOt827lnG7g3b4PVabjrg
         D34Q==
X-Gm-Message-State: AOJu0YzvCmktR/IOSK4U5G14OJiEmRmrJLaPL92okq8gg0j0eBk+0yeL
	fAUjA0jRABaDwGBTNugiGTtwGbr4tQT+AxIMsAtB7UrGsHquAIGp1W786kKkrw==
X-Gm-Gg: AY/fxX7XgbcMRYjqvd0pxzoEjep0hoQWvrQ/0y1nOt/7Ww9E9rVlRUNGlo9sQ4mg8UD
	QxbVGfE2IyyGUcV73+lKosRtxtRsIlrZkgHu9NBWXVICCyvyx+RGE0xbAlQ8xVAKAAW+yaIt72G
	fW4iEw/2Hr/gfZ6alr8itkg8+fsEnL90qhs+sihbXNRXt5ICRF1/oN0P24eJf8F4ierK7w/Manm
	4m0SETBfArOgM4gL1uG1gg4drErW00TrlaIakECmp19dmsczBd6AAxJl9iw0LaLBJy6NU4A7/AK
	MymfrAq6LdwVC32OTHEalchAUQSZASwSDZu1ti6aDP+rCEaHYzx1SK1AWM6FzH8pDwv5YGSUS2q
	/S9dJjJyOZlrmGgyDXPHeC3+YtWaFVPrGi+nK9slPIV9hwcS1zdwO8n1JWakCVKDL03BhGODpL8
	Ugs4IEvMt44NnhlvMihEI=
X-Google-Smtp-Source: AGHT+IGHRR6pbZ4IViVL+eguay0TWz3RPUz0iIDU92/xvb4JScpaKxGwZ3LX543B2rb3KfwPbZIMWg==
X-Received: by 2002:a05:6000:2083:b0:430:fc0f:8f9f with SMTP id ffacd0b85a97d-430fc0f90camr1840516f8f.37.1765740006832;
        Sun, 14 Dec 2025 11:20:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f42a3290sm9041814f8f.17.2025.12.14.11.20.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 11:20:06 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] libconfig: drop recipe
Date: Sun, 14 Dec 2025 20:20:05 +0100
Message-ID: <20251214192005.2317836-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 19:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122654

The recipe has been moved to oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=1a0196a794f8858c4715871558e97c3d69deb19e

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: drop recipe from packagegroup also

 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 ...larations-to-allow-build-with-gcc-15.patch | 38 -------------------
 .../libconfig/libconfig_1.7.3.bb              | 24 ------------
 3 files changed, 63 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
 delete mode 100644 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 50b897181f..9b92e7e3d5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -350,7 +350,6 @@ RDEPENDS:packagegroup-meta-oe-extended = "\
     jpnevulator \
     libblockdev \
     libcec \
-    libconfig \
     libdivecomputer \
     libfastjson \
     libfile-fnmatch-perl \
diff --git a/meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch b/meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
deleted file mode 100644
index 00ceadb10d..0000000000
--- a/meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 0511e285f3c886a388b8e9c6a4829752d60ab44c Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Thu, 5 Dec 2024 06:47:40 +0000
-Subject: [PATCH] Fix declarations to allow build with gcc 15
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-
-Upstream-Status: Backport [690342b Fix declarations to allow build with gcc 15]
----
- lib/grammar.y | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/lib/grammar.y b/lib/grammar.y
-index 87dac00..0e9d0bb 100644
---- a/lib/grammar.y
-+++ b/lib/grammar.y
-@@ -40,8 +40,7 @@
- #include "wincompat.h"
- 
- /* These declarations are provided to suppress compiler warnings. */
--extern int libconfig_yylex();
--extern int libconfig_yyget_lineno();
-+extern int libconfig_yyget_lineno(void *);
- 
- static const char *err_array_elem_type = "mismatched element type in array";
- static const char *err_duplicate_setting = "duplicate setting name";
-@@ -80,6 +79,11 @@ void libconfig_yyerror(void *scanner, struct parse_context *ctx,
-   char *sval;
- }
- 
-+%{
-+/* These declarations are provided to suppress compiler warnings. */
-+extern int libconfig_yylex(YYSTYPE *, void *);
-+%}
-+
- %token <ival> TOK_BOOLEAN TOK_INTEGER TOK_HEX
- %token <llval> TOK_INTEGER64 TOK_HEX64
- %token <fval> TOK_FLOAT
diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
deleted file mode 100644
index bd7d7e64b8..0000000000
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "C/C++ Configuration File Library"
-DESCRIPTION = "Library for manipulating structured configuration files"
-HOMEPAGE = "https://hyperrealm.github.io/libconfig/"
-BUGTRACKER = "https://github.com/hyperrealm/libconfig/issues"
-SECTION = "libs"
-
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
-
-SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=https;branch=master;tag=v${PV} \
-    file://0001-Fix-declarations-to-allow-build-with-gcc-15.patch \
-"
-SRCREV = "525922a6b49ca19235cdf307376e7c9c539d1b93"
-
-# needed when we modify grammar.y with above patch
-DEPENDS += "bison-native"
-
-UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
-UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"
-
-inherit autotools-brokensep pkgconfig
-
-PACKAGE_BEFORE_PN = "${PN}++"
-FILES:${PN}++ = "${libdir}/${BPN}++*${SOLIBS}"

