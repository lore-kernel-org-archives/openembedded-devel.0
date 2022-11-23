Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CAFC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 15:18:55 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.22913.1669216726298276562
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 07:18:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1+cYXVW;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id kt23so43474751ejc.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 07:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NIkF5J8gMPwpE1KC9JWnfIxGUTMsi+m/FBy9Q36wgtU=;
        b=X1+cYXVWSV6O6n0CvCQmclfQ9Udwsz/ltIWIaNppjdceuZmMVMJ9Wr1GAtjzW/AJT4
         GQ4RY/QGLuNLMIFHiQeOMmX05mlqBhM5ifF4o+qVsRvmuXxN/31J3COaRzck+HN6Alnp
         NrA2lcUYp/kBp1MlQRuk0fAuZtk3PCT/D8/PeUxVWaZ3KNoCTwIa4l+nj5/K8v3Fjm02
         5czJ//vagk61ChFo9AxBb0kapRcR2xmovVJ93iNjESfI9R2WzuSUgN4OvC4lcYe2650O
         06YWf06twE11fS+MOSQwu/fGmT3qtGUnxx4kUTja0eI4yn95aZzg2KX0udUXRWRdqBK8
         NmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NIkF5J8gMPwpE1KC9JWnfIxGUTMsi+m/FBy9Q36wgtU=;
        b=bDaRgGak2GWo8V0ihr60kgOixJF1OB78uQBKAxuxBJlNjnrViBrhIMsKOA5nxmC/sB
         mOfehV5cmMNk3HQyyoQG4/KNqYlo1qkLI8GZ67WAf1io/zvEudCI0J+a5ZUZ+F2DMD/v
         TLJSQCP3UiQnBGjg8UCFVOniB+I/KjjI4EvCj949KX2JdVn21zPXWG2lCQh6sQ/JcGqz
         WIDN8AyytCRfZZusB2y0S5DNT2ImyfkXfNPaP7GMpYxH2cAkr5as7KBMKPlLlIoK80iJ
         VY+3a5mcQD70LndIAz480EwWM4/UeQU2PqjLnr99+YB5gcIFxVZbjBh13nNuMtE3ajkl
         gRhw==
X-Gm-Message-State: ANoB5pmqp6Yf/VYoPASCafWZA3xYGVgIgZn+fVOZBSI34fVoxXIVqZG/
	5eso/mRxZBfNJXPJyg3fQXQVPdyPxrA=
X-Google-Smtp-Source: AA0mqf6wQRnx+fXHSu37xr1d3gmpNNaMKuTfyf2XED/fiF4dAsuHyB50oWlUdaKRhsAlOT/p1oay3A==
X-Received: by 2002:a17:906:6bda:b0:7ae:4a7f:3281 with SMTP id t26-20020a1709066bda00b007ae4a7f3281mr7744601ejs.50.1669216723995;
        Wed, 23 Nov 2022 07:18:43 -0800 (PST)
Received: from Unimatrix08-Jammy.. (mob-31-157-117-185.net.vodafone.it. [31.157.117.185])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906859800b00781e7d364ebsm7410054ejx.144.2022.11.23.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 07:18:43 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] boinc-client: Update boinc from 7.18.1 to 7.20.4
Date: Wed, 23 Nov 2022 14:06:05 +0100
Message-Id: <20221123130605.50332-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 15:18:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99701

Drop patches now upstream, or deprecated due to gtk3 switch

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../boinc/boinc-client/4563.patch             | 36 -------------------
 .../boinc/boinc-client/gtk-configure.patch    | 28 ---------------
 ...lient_7.18.1.bb => boinc-client_7.20.4.bb} | 16 ++-------
 3 files changed, 3 insertions(+), 77 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/boinc/boinc-client/4563.patch
 delete mode 100644 meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.18.1.bb => boinc-client_7.20.4.bb} (87%)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/4563.patch b/meta-oe/recipes-extended/boinc/boinc-client/4563.patch
deleted file mode 100644
index a18da4539..000000000
--- a/meta-oe/recipes-extended/boinc/boinc-client/4563.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 689dc20ede9768377d4032ff8c70b58269c8dc9c Mon Sep 17 00:00:00 2001
-From: Charlie Fenton <charlief@example.com>
-Date: Mon, 18 Oct 2021 01:43:08 -0700
-Subject: [PATCH 01/10] Mac: update dependent libraries to latest:
- c-ares-1.17.2, curl-7.79.1, freetype-2.11.0, openssl-3.0.0 Previously updated
- to wxWidgets-3.1.5. FTGL version ftgl-2.1.3~rc5  is still the current
- version.
-
----
- lib/crypt.cpp                             |   7 +-
- 8 files changed, 199 insertions(+), 150 deletions(-)
-
-diff --git a/lib/crypt.cpp b/lib/crypt.cpp
-index 01249cfc340..9b1f69160b8 100644
---- a/lib/crypt.cpp
-+++ b/lib/crypt.cpp
-@@ -1,6 +1,6 @@
- // This file is part of BOINC.
- // http://boinc.berkeley.edu
--// Copyright (C) 2008 University of California
-+// Copyright (C) 2021 University of California
- //
- // BOINC is free software; you can redistribute it and/or modify it
- // under the terms of the GNU Lesser General Public License
-@@ -672,7 +672,10 @@ int check_validity_of_cert(
-         }
- #ifdef HAVE_OPAQUE_RSA_DSA_DH
-         RSA *rsa;
--        rsa = EVP_PKEY_get0_RSA(pubKey);
-+        // CAUTION: In OpenSSL 3.0.0, EVP_PKEY_get0_RSA() now returns a
-+        // pointer of type "const struct rsa_st*" to an immutable value.
-+        // Do not try to modify the contents of the returned struct.
-+        rsa = (rsa_st*)EVP_PKEY_get0_RSA(pubKey);
-         if (!RSA_blinding_on(rsa, c)) {
- #else
-         if (!RSA_blinding_on(pubKey->pkey.rsa, c)) {
diff --git a/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch b/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
deleted file mode 100644
index 3b814e903..000000000
--- a/meta-oe/recipes-extended/boinc/boinc-client/gtk-configure.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From d53e9617fb6446780478bb13907efd111f241cd1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 3 Nov 2016 01:20:33 -0700
-Subject: [PATCH] Check for gtk2+ only when manager is enabled
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- configure.ac | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7beeb34ae2..35234c2762 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1044,6 +1044,11 @@ else
-   AM_CONDITIONAL([GUI_GTK], false)
- fi
- 
-+dnl ---------- GTK+2.0-----------------------------------------------------
-+if test "X${no_x}" != "Xyes"; then
-+  PKG_CHECK_MODULES([GTK2], [gtk+-2.0])
-+fi
-+
- dnl ---------- libNotify --------------------------------------------------
- if test "${enable_manager}" = yes ; then
-   PKG_CHECK_MODULES(LIBNOTIFY, [libnotify])
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
similarity index 87%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
index 8f85a508e..4cbbca23f 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.18.1.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.20.4.bb
@@ -26,15 +26,13 @@ DEPENDS = "curl \
            sqlite3 \
            virtual/egl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'libnotify', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+3 wxwidgets libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "b49adfb118211e11c719766c0d71e7bdfe7f3363"
-BRANCH = "client_release/7/7.18"
+SRCREV = "1eca0c7931d0409d65a1254dc5d5c46abe058daa"
+BRANCH = "client_release/7/7.20"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
-           file://gtk-configure.patch \
-           file://4563.patch \
            file://0001-scripts-Do-not-check-for-files-on-build-host.patch \
 "
 
@@ -61,14 +59,6 @@ EXTRA_OECONF += "\
 "
 export PKG_CONFIG = "${STAGING_BINDIR_NATIVE}/pkg-config"
 
-do_configure:prepend () {
-	if [ "${@bb.utils.contains('DEPENDS', 'gtk+', '1', '0', d)}" = "0" ]
-	then
-		export GTK2_CFLAGS=""
-		export GTK2_LIBS=""
-	fi
-}
-
 do_compile:prepend () {
 	# Disable rpaths
 	sed -i -e 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' ${B}/libtool
-- 
2.34.1


