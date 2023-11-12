Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0628BC072AB
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 20:18:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.22516.1699820275387050511
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 12:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sw86+MzN;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6c3363a2b93so3787987b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 12:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699820275; x=1700425075; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo80vlky9BCPRc0BNvuHfYaHDe9bCJvHsdExdjsT+4Y=;
        b=Sw86+MzNdeHZnSnoYR0pJhR19iMHVW/VdrM/8ajAEZmxIEKGn8Ki0spYW87aoPBmK7
         oVBEF8+ELrIdnwcQpzCGLk8lsx/XWvWv2h0W2fGESkWU/uZCmt/S68DMsma5pkS836OZ
         jR2WS3C9KSYz+pl4JFfRjART0+iUm+SvdnhGqJeDAltAJySn+rM7+m4L+20oWDdwU9/W
         e6hsjZMVH60MFFQJ4rrQ3bgbM+gcWGKgrFdvbRuAiFb4QGGFfqgtSrxYfCeRCeX3kxXc
         OWRlb4Q9wPj/2BiZ1N6TDJlJlYiwR/cwzw9TV/o40xgdJ6IAvn4jS42xrQYNgzHr0+lM
         yAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699820275; x=1700425075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vo80vlky9BCPRc0BNvuHfYaHDe9bCJvHsdExdjsT+4Y=;
        b=sHFrTTKSwNOYEKzoGD0MZFuffFVFWf1VXYMUjbz6nd0Zq9vuzlXpj4iWQ9JfYuNu27
         h+20qNXCdugZUrntQrXuHEoITj2KpkSayW0rdROUC4KF1pW9D670ZXrXrTZk59cbdh/Z
         eK6n8/bPXdbV++NDyaG2CwNZ9HnEMKu5SVIAzSQ/OH/JFjzxRPCFltbhsxjzN5ki5P1p
         agv3ZM+hF4weJMJuVOYk8ndkgsdtVml2QWUyj6p+RWiKzrXIu6758Zwrzg0UfFg2qrDB
         IibBhmtV1POvEEqnMNH5RSD0N0k1DIzIZcJf6jkkIDjEEdeiOkbhckxK3CFURViY0aBj
         CRvg==
X-Gm-Message-State: AOJu0YxS6s3DLlDc//C04Fy/xogLpSRhKcFC2ecAmilRATdPherZ8XC0
	9KOlhQKNaZgWrf4KouJl9Vsi7+zqurGV7w==
X-Google-Smtp-Source: AGHT+IF2UVWgtyyNPOBFgrIlpxgVgFRQSXbPsPA97H4D7yz3dxf+CevLNJaJEFcVAlvgYIBtB5l/PA==
X-Received: by 2002:a05:6a21:1197:b0:181:3129:363 with SMTP id oj23-20020a056a21119700b0018131290363mr6073794pzb.58.1699820274662;
        Sun, 12 Nov 2023 12:17:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id u8-20020a63df08000000b005ac384b71cbsm2954892pgg.60.2023.11.12.12.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 12:17:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 12:17:51 -0800
Subject: [PATCH v2 4/5] loudmouth: Upgrade to 1.5.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v2-4-f38d4f960d44@gmail.com>
References: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
In-Reply-To: <20231112-kraj-pu-v2-0-f38d4f960d44@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 20:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106608

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


