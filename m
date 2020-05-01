Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.8202.1588332951085860708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K7x/qagl;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id x17so11219306wrt.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CU9Fl+1bspo6/GsVQS5wVWPs+/wh0mORK04+FZkzOio=;
        b=K7x/qaglcatrIkPc7sm0NPRSbOnPD3BxGRab3NJPGYqbtz+g4KjTyAQSQ7oj77RZXV
         xdRsMesUqXjvwjxT/n4/OhtQJ4vX7q5KVVMV+wIDzc5kGZi7N1woHkdp8SHy7gFJLk6K
         QV1wTE0QZxpc/Sh0gO01x6yqY/C3F5WSudJJCSa9qmtiE84aPmhkb6EPxR4sMKc0eZ88
         /hZLfb9WpKQuNK/sNOKX6brQXXcKeADRh//ztCY6j17N70VOQ6fJ1NFoW0fYy77vCz/A
         f3qwt+UfEw0CTz6VQhH4PzUeLsRMqgG2nwdHNJprzE1AgEu6aYXE4cvSfIi/Um1hyENG
         A+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CU9Fl+1bspo6/GsVQS5wVWPs+/wh0mORK04+FZkzOio=;
        b=HpCWFDFUfan4B3ogqpnxBKgV9m7f3KqgFsyIRr8mSNC//N77kAK/5yCQVmlWa1M+CG
         jfDiJ3WuDGtPjApqtJnbMpz5se0rfZD/NXzQA7iD3BJwRbngMBVVQRnbBUQ8urVRZc9a
         KgIXWtACQaIftyjxbrCl/XeEHsiLpJLvplxVSvH/75SmeGSrmm9xLHmDN6e61mMNn3Yd
         2mrsCg8lFBqaOfELWVIEw1XEriTeh0P2Hd1zIce3W4We38QeDh3eMWmLqaLx9pO+Q5ao
         +UuBXZEC0gGQ5P7byZq21JxDXfKTfkPoIrc5Ur8lvCYBrbDxXLcrj7KKuqjG1HbW3Fo+
         AfYw==
X-Gm-Message-State: AGi0PuZqh3FOVW3Ik//K0QKBl37MBwwwEA5DNq0zhzj38TN0pfB0YeTX
	NlOgEvmx0v/lbPnuy5gpypMihvYs
X-Google-Smtp-Source: APiQypJvfb4y/NJMk38IW/3ppg95bMhnR7xrBD6AjLPz5NKuATQ5qo9PbrAgOugdsYvP7UKADq0l7Q==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr4013527wrq.358.1588332948938;
        Fri, 01 May 2020 04:35:48 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:48 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/10] gparted: upgrade 0.33.0 -> 1.1.0
Date: Fri,  1 May 2020 13:35:24 +0200
Message-Id: <20200501113534.16030-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Due to huge bump recipe had to reworked completely
* They offer a polkit action so our tailored version can go (it stopped working
  long ago btw). It is installed unconditionally but packed into an extra
  package which finds it's way into image only if 'polkit' is in distro
  features.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ction-unconditionally-executable-pke.patch | 47 +++++++++++++++++++
 .../gparted/files/gparted_polkit              | 10 ----
 ...org.yoctoproject.pkexec.run-gparted.policy | 20 --------
 .../gparted/gparted_0.33.0.bb                 | 40 ----------------
 .../recipes-extended/gparted/gparted_1.1.0.bb | 39 +++++++++++++++
 5 files changed, 86 insertions(+), 70 deletions(-)
 create mode 100644 meta-gnome/recipes-extended/gparted/files/0001-Install-polkit-action-unconditionally-executable-pke.patch
 delete mode 100644 meta-gnome/recipes-extended/gparted/files/gparted_polkit
 delete mode 100644 meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy
 delete mode 100644 meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
 create mode 100644 meta-gnome/recipes-extended/gparted/gparted_1.1.0.bb

diff --git a/meta-gnome/recipes-extended/gparted/files/0001-Install-polkit-action-unconditionally-executable-pke.patch b/meta-gnome/recipes-extended/gparted/files/0001-Install-polkit-action-unconditionally-executable-pke.patch
new file mode 100644
index 000000000..a7fc4d597
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/files/0001-Install-polkit-action-unconditionally-executable-pke.patch
@@ -0,0 +1,47 @@
+From 79fd11f1d8e4827ae8aee03420a5c92038fe4ef5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 26 Feb 2020 20:25:06 +0100
+Subject: [PATCH] Install polkit action unconditionally - executable pkexec is
+ not in our sysroot
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 17 +----------------
+ 1 file changed, 1 insertion(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 43503ac..b339ee5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -24,22 +24,7 @@ dnl======================
+ dnl Find graphical privilege escalation program
+ dnl======================
+ dnl Check for pkexec >= 0.102 for it's ability to run X11 apps.
+-AM_CONDITIONAL([INSTALL_POLKIT_ACTIONS], false)
+-PKEXEC_REQUIRED_VERSION='0.102'
+-AC_MSG_CHECKING([for pkexec >= $PKEXEC_REQUIRED_VERSION])
+-PKEXEC_REQUIRED_INT=`echo "$PKEXEC_REQUIRED_VERSION" | $AWK -F. '{print $1 * 10000 + $2}'`
+-PKEXEC_VERSION_OUTPUT=`pkexec --version 2> /dev/null` ||
+-	AC_MSG_RESULT([not found])
+-if test "x$PKEXEC_VERSION_OUTPUT" != 'x'; then
+-	PKEXEC_FOUND_VERSION=`echo "$PKEXEC_VERSION_OUTPUT" | head -1 | cut -d' ' -f3`
+-	PKEXEC_FOUND_INT=`echo "$PKEXEC_FOUND_VERSION" | $AWK -F. '{print $1 * 10000 + $2}'`
+-	AC_MSG_RESULT([$PKEXEC_FOUND_VERSION found])
+-	if test "$PKEXEC_FOUND_INT" -ge "$PKEXEC_REQUIRED_INT"; then
+-		GKSUPROG='pkexec --disable-internal-agent'
+-		AC_SUBST([GKSUPROG])
+-		AM_CONDITIONAL([INSTALL_POLKIT_ACTIONS], true)
+-	fi
+-fi
++AM_CONDITIONAL([INSTALL_POLKIT_ACTIONS], true)
+ 
+ dnl Check for alternative graphical privilege escalation programs.
+ if test "x$GKSUPROG" = 'x'; then
+-- 
+2.21.0
+
diff --git a/meta-gnome/recipes-extended/gparted/files/gparted_polkit b/meta-gnome/recipes-extended/gparted/files/gparted_polkit
deleted file mode 100644
index feabd0eeb..000000000
--- a/meta-gnome/recipes-extended/gparted/files/gparted_polkit
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh
-
-# polkit installed?
-if [ $(which pkexec) ]; then
-	pkexec --disable-internal-agent "%sbindir%/gparted" "$@"
-else
-	%sbindir%/gparted "$@"
-fi
-
-
diff --git a/meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy b/meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy
deleted file mode 100644
index 77a91923e..000000000
--- a/meta-gnome/recipes-extended/gparted/files/org.yoctoproject.pkexec.run-gparted.policy
+++ /dev/null
@@ -1,20 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE policyconfig PUBLIC
- "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
- "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
-<policyconfig>
-
-  <action id="org.yoctoproject.pkexec.run-gparted">
-    <description>Run the GParted program</description>
-    <message>Authentication is required to run the GParted Partition Editor</message>
-    <icon_name>gparted</icon_name>
-    <defaults>
-      <allow_any>auth_admin</allow_any>
-      <allow_inactive>auth_admin</allow_inactive>
-      <allow_active>auth_admin</allow_active>
-    </defaults>
-    <annotate key="org.freedesktop.policykit.exec.path">/usr/sbin/gparted</annotate>
-    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
-  </action>
-
-</policyconfig>
diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
deleted file mode 100644
index aff994af7..000000000
--- a/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "A partition editor to graphically manage disk partitions "
-HOMEPAGE = "http://gparted.org/index.php"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit features_check autotools pkgconfig gtk-icon-cache
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
-    file://org.yoctoproject.pkexec.run-gparted.policy \
-    file://gparted_polkit \
-"
-SRC_URI[md5sum] = "2f481ad34decb7021ca04ca305e79e7d"
-SRC_URI[sha256sum] = "5023b8c983f88a22e65bf6f09a12ea09369defc008981b52ee8b96a3879f81d6"
-
-DEPENDS += "glib-2.0 glib-2.0-native gtkmm parted gnome-doc-utils intltool-native"
-
-do_install_append() {
-    # Add a script which checks if polkit is installed.
-    # If yes: a policy is requested from polkit / otherwise start as usual
-    install ${WORKDIR}/gparted_polkit ${D}${sbindir}
-    sed -i 's:%sbindir%:${sbindir}:g' ${D}${sbindir}/gparted_polkit
-    # relink menu entry to use our script
-    sed -i 's:${sbindir}/gparted:${sbindir}/gparted_polkit:g' ${D}${datadir}/applications/gparted.desktop
-
-    install -d ${D}${datadir}/polkit-1/actions
-    install ${WORKDIR}/org.yoctoproject.pkexec.run-gparted.policy ${D}${datadir}/polkit-1/actions/org.yoctoproject.pkexec.run-gparted.policy
-}
-
-EXTRA_OECONF = "--disable-scrollkeeper --disable-doc"
-
-FILES_${PN} += " \
-    ${datadir}/appdata \
-    ${datadir}/icons \
-    ${datadir}/polkit-1 \
-"
-
-RDEPENDS_${PN} = "dosfstools mtools e2fsprogs"
diff --git a/meta-gnome/recipes-extended/gparted/gparted_1.1.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.1.0.bb
new file mode 100644
index 000000000..3aaec3cdd
--- /dev/null
+++ b/meta-gnome/recipes-extended/gparted/gparted_1.1.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "A partition editor to graphically manage disk partitions "
+HOMEPAGE = "http://gparted.org/index.php"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit features_check autotools pkgconfig python3native gnome-help gtk-icon-cache
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+SRC_URI = " \
+    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
+    file://0001-Install-polkit-action-unconditionally-executable-pke.patch \
+"
+SRC_URI[md5sum] = "0da45cb522d766dfb4886fb3bdbc2634"
+SRC_URI[sha256sum] = "e2fe7b7afbc07e930491c00a05200c2682cc0576ca8f6da87245a000257f5924"
+
+DEPENDS += " \
+    glib-2.0-native \
+    yelp-tools-native \
+    intltool-native \
+    glib-2.0 \
+    gtkmm3 \
+    parted \
+"
+
+FILES_${PN} += " \
+    ${datadir}/appdata \
+    ${datadir}/icons \
+"
+
+PACKAGES += "${PN}-polkit"
+FILES_${PN}-polkit = "${datadir}/polkit-1"
+
+RDEPENDS_${PN} = " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', '${PN}-polkit', '', d)} \
+    dosfstools \
+    mtools \
+    e2fsprogs \
+"
-- 
2.21.1

