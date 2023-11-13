Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF608C072AB
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:34:57 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.32319.1699860893592054037
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:34:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bz0nnwWF;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1cc7077d34aso28856605ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860893; x=1700465693; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo80vlky9BCPRc0BNvuHfYaHDe9bCJvHsdExdjsT+4Y=;
        b=bz0nnwWFgNuVenfQS1J8ovlIAcGaLnBdWzVUrFgdPE3A01UHoAVTOHILzNtNaljNmZ
         gafiBOZ1w9T5kUyR3xM+cS4Rc1aaoyZVk6w8tJ2ESyhNCSV83FljOhgo7Hexeo2cG4Ev
         ATnIwcEP07p929WMP6t5uYAjUmi+DJQ+z3vTNB6sVM24zDtdattgXPQXJKrRqTI9/Eal
         xxFS03B8LKYbz0D6uzrebKf9CJfFftVMPSnjFJ2xrfUjEYSTJz20ZR+S7593rQQ208QA
         hg7vBXl21qlD+JoN+MfGxL2OXIj5lz0bTtAHEk9Fkcc+IFb0UBH+PvfJhQwCBOuMGgEL
         UKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860893; x=1700465693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vo80vlky9BCPRc0BNvuHfYaHDe9bCJvHsdExdjsT+4Y=;
        b=DUdwIRpci4hTvU0SiFLtf0iZi9zV7Xoimw9mdZX5FRPWkv65+y9uDNIvBKc5k4fdKy
         vYnQuG4gVrbJtpUYGeiiyTN0Nlfe/4zYbgQ0wMyeklSOhynZCKyvwf0xQPYDbnia4YCN
         PR0knotIgjn9MIAe6UYbbAQoSFvdstIVISHc6n4v9BVIOzDmlWmR6/q5KA4hnqyIFNET
         YL8rULXhj+mUBgLlqe8H7430FS6WFisKtUhro1gOyIuG13pidffEJQF7l89IpsPnSTty
         mUYD0VnKxfjvjKWSB3dnUQhYv5Tdk+jiVYTpd7VutPiWfpVgEpWuPWocGcKc+DPWL3zW
         QpMQ==
X-Gm-Message-State: AOJu0YwAjBJ3CEWIeWtvQg+4JmFXQE9LuX+mtyw7O2zjKGUzBhMueoLf
	PbXYl238/SzlGHN6cYqcJIEQfKj70aMSZg==
X-Google-Smtp-Source: AGHT+IHeWMGaG/7vETSYH5VSLW346ymqAv5gVyUODl84g34VeI/HefpZyr5+LiuPbFUvbjB7djvEXg==
X-Received: by 2002:a17:902:8c86:b0:1cc:6cc7:e29f with SMTP id t6-20020a1709028c8600b001cc6cc7e29fmr3858990plo.43.1699860892591;
        Sun, 12 Nov 2023 23:34:52 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm3509691plx.281.2023.11.12.23.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:34:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 23:34:48 -0800
Subject: [PATCH v3 4/6] loudmouth: Upgrade to 1.5.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v3-4-51f4c8091bc8@gmail.com>
References: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
In-Reply-To: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106630

License-Update: Update the postal address of the FSF [1]

Drop patches not needed anymore.

[1] https://github.com/mcabber/loudmouth/commit/c1f7ffdeb1f9f78eeb377bd28c7be8c146161327

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../04-use-pkg-config-for-gnutls.patch             | 25 ----------------------
 .../loudmouth/loudmouth-1.4.3/glib-2.32.patch      | 12 -----------
 .../loudmouth/loudmouth_1.4.3.bb                   | 22 -------------------
 .../loudmouth/loudmouth_1.5.4.bb                   | 16 ++++++++++++++
 4 files changed, 16 insertions(+), 59 deletions(-)

diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch
deleted file mode 100644
index 0fc87abd09..0000000000
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/04-use-pkg-config-for-gnutls.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-Description: use pkg-config to detect gnutls
-Debian: http://bugs.debian.org/529835
-Origin: http://groups.google.com/group/loudmouth-dev/browse_thread/thread/3f78255837048daf#
-
---- a/configure.ac.orig	2009-08-16 20:29:36.000000000 +0200
-+++ b/configure.ac	2009-08-16 20:30:43.000000000 +0200
-@@ -146,10 +146,12 @@ AC_ARG_WITH(openssl-libs,
- enable_ssl=no
- if test "x$ac_ssl" = "xgnutls"; then
-   dnl Look for GnuTLS
--  AM_PATH_LM_LIBGNUTLS($GNUTLS_REQUIRED, have_libgnutls=yes, have_libgnutls=no)
--  if test "x$have_libgnutls" = "xyes"; then
--    CFLAGS="$CFLAGS $LIBGNUTLS_CFLAGS"
--    LIBS="$LIBS $LIBGNUTLS_LIBS"
-+  PKG_CHECK_MODULES(GNUTLS, gnutls >= $GNUTLS_REQUIRED, have_gnutls=yes, have_gnutls=no)
-+  if test "x$have_gnutls" = "xyes"; then 
-+    AC_SUBST(ASYNCNS_CFLAGS)
-+    AC_SUBST(ASYNCNS_LIBS)
-+    CFLAGS="$CFLAGS $GNUTLS_CFLAGS"
-+    LIBS="$LIBS $GNUTLS_LIBS"
-     AC_DEFINE(HAVE_GNUTLS, 1, [whether to use GnuTSL support.])
-     enable_ssl=GnuTLS
-   else
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch b/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
deleted file mode 100644
index 921aded943..0000000000
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth-1.4.3/glib-2.32.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Pending
-
---- loudmouth-1.4.3.orig/loudmouth/lm-error.c	2008-10-29 21:48:15.000000000 +0100
-+++ loudmouth-1.4.3/loudmouth/lm-error.c	2012-05-06 08:27:07.455739440 +0200
-@@ -19,7 +19,6 @@
-  */
- 
- #include <config.h>
--#include <glib/gerror.h>
- #include "lm-error.h"
- 
- /**
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
deleted file mode 100644
index 0593469a45..0000000000
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Loudmouth is a lightweight and easy-to-use C library for programming with the Jabber protocol."
-HOMEPAGE = "http://www.loudmouth-project.org/"
-
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c4f38aef94828f6b280e00d1173be689"
-
-DEPENDS = "glib-2.0 libcheck openssl libidn"
-
-GNOMEBASEBUILDCLASS = "autotools"
-inherit gnomebase gtk-doc
-
-PR = "r2"
-
-SRC_URI += "file://04-use-pkg-config-for-gnutls.patch \
-            file://glib-2.32.patch"
-
-SRC_URI[archive.md5sum] = "55339ca42494690c3942ee1465a96937"
-SRC_URI[archive.sha256sum] = "95a93f5d009b71ea8193d994aa11f311bc330a3efe1b7cd74dc48f11c7f929e3"
-GNOME_COMPRESS_TYPE="bz2"
-
-EXTRA_OECONF = "--with-ssl=openssl"
-
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb
new file mode 100644
index 0000000000..f67c46b428
--- /dev/null
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.5.4.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Loudmouth is a lightweight and easy-to-use C library for programming with the Jabber protocol."
+HOMEPAGE = "http://www.loudmouth-project.org/"
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "glib-2.0 libcheck openssl libidn"
+
+GNOMEBASEBUILDCLASS = "autotools"
+
+inherit gnomebase gtk-doc
+
+SRC_URI = "https://github.com/mcabber/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "31cbc91c1fddcc5346b3373b8fb45594e9ea9cc7fe36d0595e8912c47ad94d0d"
+
+EXTRA_OECONF = "--with-ssl=openssl --with-compile-warnings=no"

-- 
2.42.1


