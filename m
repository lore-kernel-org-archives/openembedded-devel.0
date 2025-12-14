Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7A2D59D99
	for <webhook@archiver.kernel.org>; Sun, 14 Dec 2025 19:15:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31423.1765739712106759859
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Dec 2025 11:15:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TpBo1/nW;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbab737f5so1090898f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 11:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765739710; x=1766344510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7cDOPEzc4IqTE/yZcvjQIxV7vr3cw3RWMppzsIt6vY=;
        b=TpBo1/nWaqrL47sEAWX/rke2JP2bw1YQovj/3FyjtaviFJ2lB7F+u7ehGJQUufm3BP
         7OXLSSZXPhwtZGeCe3Vhxm6HCSpND44qID19NVyOwenwv4U5j30FyMQeQOuaB37Zz6wv
         Z+yw70mfN6nTB1hy+Bh1TkqhTaBWX33nhD4N9ZlBoc6nIvxUnAfXiRZB7LAhvvwqy4tg
         gIr0b5vPmPaSD0wez1hRp5yANqcgzDldn1s5P8rndSlRI+Y657yZLz0UimyozCtTx1nh
         WZRvdbZBXtaYOM7urWUKmzz41oCB1DelJ/0892WM5NPaID0PDxpgYO1ES+5GFwth1C1j
         GG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765739710; x=1766344510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7cDOPEzc4IqTE/yZcvjQIxV7vr3cw3RWMppzsIt6vY=;
        b=ZTjdjUruf2zYjvmPUISrfttknIirbxwhXePx6fd3gaWzw/OfvQtTEoSDZKtlGPsQSR
         4CPFf5GXHqtqAOL4sGMUW2CoFld1gvvDaHboJGfMjBet4ZL+qUVEqpe9OieDjypq/e5x
         qWdXsYc9G1QYRNDKhoUbPrl4/m71izK1YbqzhbbPkQMWHoXB5A9XR3iNUSWPeCWpxmUe
         lKbgnRZ6EpdAn8m0gBNXJJcIrC71dgQ4s/RyBICmjaTliTRf0NuLAAqzcBRIHicgTs1j
         DUzTXWXsQUtVSSWpP4x7HguvroWXu6dSqxB7nKgUjJzBKAj/BLYYWTj9ffBfvcF07AZQ
         RM0g==
X-Gm-Message-State: AOJu0YwQ959afIcEmkkWDT0zy1e0ohq/EEP4CphyWCzeZ7YstORVXAkv
	hf5cJIw0beOzrbPU8bHYj8lmy8QIW7ijroC5PIG4ifXz9xIsO03goddO1OykmA==
X-Gm-Gg: AY/fxX4gj2Jt71FOmP06Dg9hI7ZVjaPUpbGQ5LMTFV32Kn0k6Kc/u3oZJKjT3nzyUiL
	7XqSy4WndvF7Edaj3Xa+Q2bEXhdws/OVgPWMcNOt9kqdKGZ1TeIB+hamofAL3ozQo4YonmN4Lht
	PkXXDijCW5IYrQNrFZsE/E7BLEz2m0k7Q/AgXHqZxmJTA23TxOLGpjG+xcfSsxxkc+3zzDsZQBU
	zWWAy5mxdXlneku71tVwDw981RxLuwNTKUDipZ6l6gpMfs+kO80QSoS/dyhNmClO+g2PkFZ9oV6
	1gS3Tn9HuDzvXrOKI+SD5JzOTspzXYxsgHEWyK849Kw+SK17T3Xr26t8mmTttAuWUyUhSvU8xiq
	Mcvl5CnCo7JwDnwE9UnthDc5dhf1YOnhmYLMHH0aGGOa2XHUyHyf0yUisjIgpKQy7t9WXlX7t/i
	0gb2nlFwZi
X-Google-Smtp-Source: AGHT+IEXkCIIN9rvONgFwPHsOaTk/Wt94HR+Zn17HThCaTxdhybth8fKAka6nCh+xOaLkZm4SIGvlA==
X-Received: by 2002:a05:6000:144d:b0:429:b963:cdd5 with SMTP id ffacd0b85a97d-42fb3e4492amr8679683f8f.5.1765739710191;
        Sun, 14 Dec 2025 11:15:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f42a3290sm9020722f8f.17.2025.12.14.11.15.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 11:15:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libconfig: drop recipe
Date: Sun, 14 Dec 2025 20:15:08 +0100
Message-ID: <20251214191508.2317265-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Dec 2025 19:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122653

The recipe has been moved to oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=1a0196a794f8858c4715871558e97c3d69deb19e

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...larations-to-allow-build-with-gcc-15.patch | 38 -------------------
 .../libconfig/libconfig_1.7.3.bb              | 24 ------------
 2 files changed, 62 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libconfig/libconfig/0001-Fix-declarations-to-allow-build-with-gcc-15.patch
 delete mode 100644 meta-oe/recipes-extended/libconfig/libconfig_1.7.3.bb

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

