Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D30C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:49:05 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.27029.1643280544060216177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:49:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lQQoOj0x;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id f17so4012325wrx.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GVLiX6Wg7WijII7OxlH62rDnKssaJX20QtAzvw4Qxd4=;
        b=lQQoOj0xoIwgQO89FW5zbx8bzyGoSODBim0OhyGqsaPV/pbarZmBPfSjT1KOZ5LUTL
         3YFxubkBYtbp6ah5JyylZPCqnw4nTVvgdHQ9d0LtciYiLBhfxBq0gRKuNw3SQ7w1BUI1
         Jef+Ea6JLdt3rKoXho6QmN8WVLL8+RJUC+cMiY5P2Hd8hqaYs3kZVUJ4N3AG0xsyCLmH
         /74wGGULKFJw+TgOVl566L9gyLAD0liOMYOyQaabqoSAHG4TK8XIWkYp0PZBXLeODcw1
         4dpkbyP4cZBVudVxZWSj8YGH1GLQeOoSkkOsS+Gv7jSq5UhyyaFAqfv8akf5dpHBKLCt
         +K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GVLiX6Wg7WijII7OxlH62rDnKssaJX20QtAzvw4Qxd4=;
        b=3ggARQCdqCFVfVJzDgBEiHRvc+glndqeNqhUgAw/xQCCNjXlD6UGxJgV9QG0do0ipq
         3mfml8v5Lp1Xn+wGNkRx4nco3PcM32eO9zoep5rWGdNVjvtYs7J2rDBitvlMxfmhvtR2
         pkj8AU8Pc+Ib1cgcOos88I4JbVS5lgXAJpZyQ6BdhsgUkB2MYBgWWEf5Lf3nEHvK/v7N
         +XOw+nT8FCvYvfsi8cSt6tmWt438C5RFdrOtKpiXM9RPETB18FIYerq/SkW0nPChCRX8
         KDckhCKlBGOYjmsSQiCpo1pYEj2u2hQ6bYKBb0+eZTudCZ8Zzl8ENcwsm60cm5KQ47i6
         KMkA==
X-Gm-Message-State: AOAM533uOx5qWXmouuBqwiK9RjNvif8IrRXX5MCH38ueY2OCbLnioQaV
	q1MLJhiiZn7DxA75/dyvRc29Zi6RMbY4UA==
X-Google-Smtp-Source: 
 ABdhPJyeUV2QahNEuWP7ilhG/U4mxGeq9qkBKu+uu4zlVXbeaw2GRGUYBcP7vSHLABhFx8qC2pr+2A==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr2591416wrn.64.1643280541909;
        Thu, 27 Jan 2022 02:49:01 -0800 (PST)
Received: from Unimatrix08-Focal.lan ([109.52.19.53])
        by smtp.gmail.com with ESMTPSA id
 k25sm3764248wms.23.2022.01.27.02.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:49:01 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] boinc-client:
Date: Thu, 27 Jan 2022 11:48:59 +0100
Message-Id: <20220127104859.2338468-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 10:49:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95121

* update to 7.18.1 and unblacklist
* Add openssl 3.0 build fix provided by upstream
* fix the sed command to work with the correct new libtool named file
* refresh patches
* drop patch part that is added in one patch and removed in the following one

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../boinc/boinc-client/4563.patch             | 36 +++++++++++++++++++
 .../boinc-client/boinc-AM_CONDITIONAL.patch   | 11 +-----
 .../boinc/boinc-client/gtk-configure.patch    | 10 +-----
 ...ient_7.16.16.bb => boinc-client_7.18.1.bb} | 12 +++----
 5 files changed, 45 insertions(+), 25 deletions(-)
 create mode 100644 meta-oe/recipes-extended/boinc/boinc-client/4563.patch
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.16.16.bb => boinc-client_7.18.1.bb} (92%)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 3cf33c694..a600b24cc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -333,6 +333,7 @@ RDEPENDS:packagegroup-meta-oe-devtools:remove:x86 = "ply"
 
 RDEPENDS:packagegroup-meta-oe-extended ="\
     bitwise \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-client", "", d)} \
     brotli \
     byacc \
     cmatrix \
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/4563.patch b/meta-oe/recipes-extended/boinc/boinc-client/4563.patch
new file mode 100644
index 000000000..a18da4539
--- /dev/null
+++ b/meta-oe/recipes-extended/boinc/boinc-client/4563.patch
@@ -0,0 +1,36 @@
+From 689dc20ede9768377d4032ff8c70b58269c8dc9c Mon Sep 17 00:00:00 2001
+From: Charlie Fenton <charlief@example.com>
+Date: Mon, 18 Oct 2021 01:43:08 -0700
+Subject: [PATCH 01/10] Mac: update dependent libraries to latest:
+ c-ares-1.17.2, curl-7.79.1, freetype-2.11.0, openssl-3.0.0 Previously updated
+ to wxWidgets-3.1.5. FTGL version ftgl-2.1.3~rc5  is still the current
+ version.
+
+---
+ lib/crypt.cpp                             |   7 +-
+ 8 files changed, 199 insertions(+), 150 deletions(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 01249cfc340..9b1f69160b8 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -1,6 +1,6 @@
+ // This file is part of BOINC.
+ // http://boinc.berkeley.edu
+-// Copyright (C) 2008 University of California
++// Copyright (C) 2021 University of California
+ //
+ // BOINC is free software; you can redistribute it and/or modify it
+ // under the terms of the GNU Lesser General Public License
+@@ -672,7 +672,10 @@ int check_validity_of_cert(
+         }
+ #ifdef HAVE_OPAQUE_RSA_DSA_DH
+         RSA *rsa;
+-        rsa = EVP_PKEY_get0_RSA(pubKey);
++        // CAUTION: In OpenSSL 3.0.0, EVP_PKEY_get0_RSA() now returns a
++        // pointer of type "const struct rsa_st*" to an immutable value.
++        // Do not try to modify the contents of the returned struct.
++        rsa = (rsa_st*)EVP_PKEY_get0_RSA(pubKey);
+         if (!RSA_blinding_on(rsa, c)) {
+ #else
+         if (!RSA_blinding_on(pubKey->pkey.rsa, c)) {
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
index 7c3b0325d..0431f523e 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
+++ b/meta-oe/recipes-extended/boinc/boinc-client/boinc-AM_CONDITIONAL.patch
@@ -14,7 +14,7 @@ diff --git a/configure.ac b/configure.ac
 index d81d795de4..7beeb34ae2 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -63,6 +63,7 @@ m4_pattern_allow([AC_PROG_OBJCXX])
+@@ -59,6 +59,7 @@ m4_pattern_allow([AC_PROG_OBJCXX])
  m4_ifdef([AC_PROG_OBJCXX],[AC_PROG_OBJCXX],)
  dnl ------
  AC_PROG_CPP
@@ -22,12 +22,3 @@ index d81d795de4..7beeb34ae2 100644
  AC_PROG_MAKE_SET
  SAH_LINKS
  AC_LANG_PUSH(C)
-@@ -1068,6 +1069,8 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test "x${enable_server}" = xyes  || test "x${
- AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
- AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
- 
-+PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
-+
- dnl ======================================================================
- dnl some more vodoo required for building portable client-binary (client, clientgui)
- dnl ======================================================================
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch b/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
index e060b1a40..3b814e903 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
+++ b/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
@@ -14,7 +14,7 @@ diff --git a/configure.ac b/configure.ac
 index 7beeb34ae2..35234c2762 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1018,6 +1018,11 @@ else
+@@ -1044,6 +1044,11 @@ else
    AM_CONDITIONAL([GUI_GTK], false)
  fi
  
@@ -26,11 +26,3 @@ index 7beeb34ae2..35234c2762 100644
  dnl ---------- libNotify --------------------------------------------------
  if test "${enable_manager}" = yes ; then
    PKG_CHECK_MODULES(LIBNOTIFY, [libnotify])
-@@ -1069,7 +1074,6 @@ AM_CONDITIONAL(ENABLE_BOINCCRYPT, [test "x${enable_server}" = xyes  || test "x${
- AM_CONDITIONAL(INSTALL_HEADERS, [test "${enable_install_headers}" = yes])
- AM_CONDITIONAL(HAVE_CUDA_LIB, [test "${enable_client}" = yes -a -f ./coprocs/CUDA/posix/${boinc_platform}/libcudart.so])
- 
--PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
- 
- dnl ======================================================================
- dnl some more vodoo required for building portable client-binary (client, clientgui)
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
similarity index 92%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
index 79aaad9d8..114e39463 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
@@ -16,7 +16,6 @@ global warming, discover sources of gravitational waves, and many other types \
 of scientific and mathematical research."
 
 HOMEPAGE = "http://boinc.berkeley.edu/"
-PNBLACKLIST[boinc-client] ?= "Needs porting to openssl 3.x"
 LICENSE = "LGPLv2+ & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
@@ -30,11 +29,12 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "df0239e6f074207798a8ecf1358a74545dda9132"
-BRANCH = "client_release/7/7.16"
+SRCREV = "b49adfb118211e11c719766c0d71e7bdfe7f3363"
+BRANCH = "client_release/7/7.18"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
            file://gtk-configure.patch \
+           file://4563.patch \
 "
 
 inherit gettext autotools pkgconfig features_check systemd
@@ -70,9 +70,9 @@ do_configure:prepend () {
 
 do_compile:prepend () {
 	# Disable rpaths
-	sed -i -e 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${B}/${TARGET_SYS}-libtool
-	sed -i -e 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec=""|g' ${B}/${TARGET_SYS}-libtool
-	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/${TARGET_SYS}-libtool
+	sed -i -e 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${B}/libtool
+	sed -i -e 's|^sys_lib_dlsearch_path_spec=.*|sys_lib_dlsearch_path_spec=""|g' ${B}/libtool
+	sed -i -e 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' ${B}/libtool
 }
 
 do_install:append() {
-- 
2.25.1


