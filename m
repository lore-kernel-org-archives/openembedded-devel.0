Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F65AC021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 08:05:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.46555.1739779523078071330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Feb 2025 00:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kFwIOL5A;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4396424d173so38055535e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 00:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739779521; x=1740384321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGPn/6BtHRfauI9IGbpsYzYoZrytKNV6fwbZx7yNeGE=;
        b=kFwIOL5A53KySgnJkjI78btP/JaWw0zDQ/V/qNZd08EWakhfvxJzrgEeH/xzU03oSP
         v3lwLG34fVhDIuolSeD3D3JP7UlxXcWaUXWzyqYqhBXomRT7Wwfwf6ax3fRDupAsuFvE
         RiYPvtbXs1AyeEI/0XIfs8Mh9fQO2CpvaeL9a0L8Ya+d5pqCIVanINgGXmhgA897TF4L
         7fZ2j++2+9Rrwss7Q1ym1LiL3+grPehq43BeLpmR51hLpmTHWd+nUZMIVZS/Lz3uSlbB
         gybh01KisgjFrCRSPsWgS4vMWyz9HSUpkgLGLtM33iGKfhcYjRMGMk8UbFAh+1YjXuHD
         XKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739779521; x=1740384321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGPn/6BtHRfauI9IGbpsYzYoZrytKNV6fwbZx7yNeGE=;
        b=kjmB3s3NSM67PgD259QtOnUTqci7RDRK9xJxJa4bU3VU8yIkYAw0NHBR1Mp19OXJ9Q
         paYghJBhZKlX+uqUnASU7rRV9QCv2fY08aNSM5qG9RaLZ8bqpP4LL04tNjZm2H1tlCij
         eqkQxz88XmH5ycwDIWyuh5xXA57ALPl+j6tX+7P1u/6Tt/K9qrWhRP04aQKlfcEGH6d9
         kSIs4cCtRK489OXjAclHFQcRLRHderB75I/5M2hHvmSuY6Xy2UzKWfc7Buq04RTVRirS
         oq6PQ51PfFluJCrNcD4rIWGdMUkOgtJ2Sx9sFU0m20tWMxwGVLK6oPMKAbPzKx8Edbzz
         xFvQ==
X-Gm-Message-State: AOJu0YxjeC+34EPaJb162YZkV7UTD5sbqePG5zRUeWC147Xw95YXBgMQ
	2XFjegdD2srrf6jBIr8ZcdoC6EzGYHDNQY6XNZBli/O2F/O0kY3X/+u+gQ==
X-Gm-Gg: ASbGncvqVjlUtV85IJ5Gb6lz7eDcUVzw1eo0ampulPzDyRqF1++cQUr8rFEk80p93tj
	9XwSL98vSNpJZXTSwAjcv1pNiFJ/4Tsx7e7OtX7i6nbUdjR3ru7Rm4AS1thfevarxEkBHK+zhzj
	L8K7HLjA3SEAaqd0MsjziG2tzw8TcwswRozvyxlZL2vKBsfMUUC1iXAEoVA7f1v3PsUmDJsKnft
	ypE+ayN+evpj405BgZ7QKqQV5/8VA37nO2BGASB7057/532PFx2ItQ30GfY7QR5Z1B1V2ZTnU3z
	G6xVDRdVkHm3gFhM1ovW775yFiRsJe0=
X-Google-Smtp-Source: AGHT+IEChPFKK09a/TT/tXnhqoMvqQKfop/LJS/E9Kide3ZF9ZuxT8NQe7xbsf+zO+jZxo6g7v6fww==
X-Received: by 2002:a05:600c:1c04:b0:439:5f7a:e25d with SMTP id 5b1f17b1804b1-4396e6de21dmr94585205e9.16.1739779521193;
        Mon, 17 Feb 2025 00:05:21 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439858741e9sm13937085e9.1.2025.02.17.00.05.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:05:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] liboop: fix tcl PACKAGECONFIG
Date: Mon, 17 Feb 2025 09:05:18 +0100
Message-ID: <20250217080518.1759732-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217080518.1759732-1-skandigraun@gmail.com>
References: <20250217080518.1759732-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Feb 2025 08:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115508

In case tcl PACKAGECONFIG is enabled, autoconf is trying to use tcl libs
and headers from the build system instead of using RECIPE_SYSROOT, and the
do_configure task fails:

ERROR: liboop-1.0.1-r0 do_configure: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. [configure-unsafe]

The system path is hardcoded in the configure script. To fix this, patch
the configure script to use pkg-config to find tcl in the correct
sysroot.

Since the previous patch was changing the same part of the script, incorporate
that also into the new patch.

Also, set the correct build-time dependency.

The patch's Upstream-Status is "Pending", because
1. The project has been without activity for almost 15 years
2. Couldn't find info on the website on how to contribute
3. The GitLab instance mentioned on the website is password protected
even for read-only access, and registration is enabled only for
specific email addresses.
4. Couldn't find any contact info on the website to reach out
to the maintainers.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-Use-pkg-config-to-find-tcl.patch     | 48 +++++++++++++++++++
 .../liboop/liboop/tcl_dev.patch               | 13 -----
 .../recipes-support/liboop/liboop_1.0.1.bb    |  4 +-
 3 files changed, 50 insertions(+), 15 deletions(-)
 create mode 100644 meta-oe/recipes-support/liboop/liboop/0001-Use-pkg-config-to-find-tcl.patch
 delete mode 100644 meta-oe/recipes-support/liboop/liboop/tcl_dev.patch

diff --git a/meta-oe/recipes-support/liboop/liboop/0001-Use-pkg-config-to-find-tcl.patch b/meta-oe/recipes-support/liboop/liboop/0001-Use-pkg-config-to-find-tcl.patch
new file mode 100644
index 0000000000..24249b9360
--- /dev/null
+++ b/meta-oe/recipes-support/liboop/liboop/0001-Use-pkg-config-to-find-tcl.patch
@@ -0,0 +1,48 @@
+From 5dad843ca0860d6d7be443ddc850566584b8004a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 16 Feb 2025 21:09:02 +0100
+Subject: [PATCH] Use pkg-config to find tcl
+
+Instead of using hardcoded path for the tcl include folder
+use pkg-config to find the proper values.
+
+That way it won't use the system folders for cross-compilation.
+
+Also, extend the number of tcl versions to check (at the time of
+this commit oe-core provides version 8.6)
+
+Upstream-Status: Pending
+---
+ configure.ac | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e95956e..3d0dc82 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,18 +71,17 @@ if test xno != x$with_glib; then
+ fi
+ 
+ if test xno != x$with_tcl; then
+-  for version in 8.4 8.3 8.2 8.1 8.0 ; do
+-    CPPFLAGS="$save_cppflags -I/usr/include/tcl$version"
+-    AC_CHECK_LIB(tcl$version,Tcl_Main,[
+-    AC_CHECK_HEADER(tcl.h,[
++  save_cppflags="$CPPFLAGS"
++  for version in "" 8.4 8.3 8.2 8.1 8.0 ; do
++    PKG_CHECK_EXISTS(tcl$version,,continue)
++    PKG_CHECK_MODULES(TCL, tcl$version, [
+       LIBOOP_LIBS="liboop-tcl.la $LIBOOP_LIBS"
+       AC_DEFINE(HAVE_TCL)
+-      TCL_INCLUDES="-I/usr/include/tcl$version"
+-      TCL_LIBS="-ltcl$version"
++      TCL_INCLUDES="$TCL_CFLAGS"
++      CPPFLAGS="$save_cppflags $TCL_CFLAGS"
+       break
+-    ])])
++  ])
+   done
+-  CPPFLAGS="$save_cppflags"
+ fi
+ 
+ if test xyes = x$with_libwww; then
diff --git a/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch b/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
deleted file mode 100644
index 0521aaeaff..0000000000
--- a/meta-oe/recipes-support/liboop/liboop/tcl_dev.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Pending
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,7 +71,7 @@
- fi
- 
- if test xno != x$with_tcl; then
--  for version in 8.4 8.3 8.2 8.1 8.0 ; do
-+  for version in "" 8.4 8.3 8.2 8.1 8.0 ; do
-     CPPFLAGS="$save_cppflags -I/usr/include/tcl$version"
-     AC_CHECK_LIB(tcl$version,Tcl_Main,[
-     AC_CHECK_HEADER(tcl.h,[
diff --git a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
index 8df96bcaa5..19da1d1aa9 100644
--- a/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
+++ b/meta-oe/recipes-support/liboop/liboop_1.0.1.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8b54f38ccbd44feb80ab90e01af8b700"
 
 SRC_URI = "http://ftp.lysator.liu.se/pub/liboop/liboop-${PV}.tar.gz \
-           file://tcl_dev.patch \
+           file://0001-Use-pkg-config-to-find-tcl.patch \
 "
 
 SRC_URI[sha256sum] = "56af16ad65e7397dadc8268e37ff6f67431db390c60c75e21a33e12b0e0d17e0"
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "56af16ad65e7397dadc8268e37ff6f67431db390c60c75e21a33e12b0e
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[glib] = "--with-glib,--without-glib,glib-2.0 libpcre"
-PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl"
+PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl8"
 
 EXTRA_OECONF += "--without-adns -without-libwww"
 

