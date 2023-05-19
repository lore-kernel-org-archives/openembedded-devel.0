Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D529BC77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 06:34:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.19958.1684478085343346664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 23:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=efZ5pf3v;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso1150869b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 23:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684478084; x=1687070084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQ9gS+a1ef1Rj6d4/p/L5uqNQapCgDqRQf0X2ZS/GlA=;
        b=efZ5pf3vpeHAetdK5zseQhEyFbReVUnc54qg3ulqknnJLTz8t7hun3+pmF7VHUxSG4
         9TwBwTv2rENo4PS3sPozLAcoXtIsKKZA3SgizLQcFbl+PoV7h+wP/ZKoRTRE5uanS34u
         Y1BBFKzYoMMK5AOo/GQT33YUVABOcev+MO3Ahaa6ukWvYUdcSnehk1YF5/PgxIf0Dq3e
         5cDU4uT+Wzh9WXMjA1STV6Uvi1JY1NRtArR6eP+bq2kwQpr0buFDU3z5LkaUM+AXfO8+
         TSzt3GYAp8NV2RIPhLE3415OFUBNk2aVADnfyL/8xxDdPuWB/woE9GlVM4nAEYmhDlT6
         4t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684478084; x=1687070084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQ9gS+a1ef1Rj6d4/p/L5uqNQapCgDqRQf0X2ZS/GlA=;
        b=QjG9zLh1NPbdJsDdV7KgD/7Wspx2XqVvOoYhYYdweH1mIWIM7m3RArgoxYUa3iOrQn
         L/s3b+wrGPol0RLXBwYBmVMTeKaQ22Lp5PKM82+/3NatRrbDpbLJrLINGRYl3xhPlVau
         refNSY/9REgFVu32cUkmRxJzsPxjCoKHTJ29zDPzbdUna6fsm2OOOHpqyD2ErtWMmM8P
         tIHT0yq6Hd+7stTPGnWsEmWiMRQTX/AI7r+MFOZZyR4jr7TPhMUwP8jUAKWV6gNrKbid
         rNRXHl587T4xtpHcVex7rp3IqPA9LR4S+/k40qMURhKj/hzRELr/p5qrty17Q+gB0A+l
         0rTQ==
X-Gm-Message-State: AC+VfDytukhbH2T/K4AH7vHNCnuw8/Ovq1K/aj9bbrZYKZB64fg7yTHa
	k+PXa2kpx0zp7XRD19Loy6DK6vjASGc=
X-Google-Smtp-Source: ACHHUZ5BkVXKUY743fNL3q6ogF94OlXY1LId/KsH6ICbrKtt2A7rHyYOLujOT3On0bX62lXR0WHLkw==
X-Received: by 2002:a05:6a00:2d90:b0:646:1f13:7fce with SMTP id fb16-20020a056a002d9000b006461f137fcemr1956768pfb.2.1684478084326;
        Thu, 18 May 2023 23:34:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id y20-20020aa78054000000b0063f1430dd57sm2281060pfm.49.2023.05.18.23.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 23:34:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libpeas: Fix reference to TMPDIR in tests
Date: Thu, 18 May 2023 23:34:41 -0700
Message-Id: <20230519063441.987384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 06:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102670

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-and-srcdir-paths-from-test-binaries.patch | 82 +++++++++++++++++++
 .../recipes-gnome/libpeas/libpeas_1.36.0.bb   |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch b/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
new file mode 100644
index 0000000000..6bb48777ec
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas/0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch
@@ -0,0 +1,82 @@
+From d798af685e9e1166400acbdab082c17b02dad85b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 18 May 2023 23:28:10 -0700
+Subject: [PATCH] Remove builddir and srcdir paths from test binaries
+
+Encoding buildtime paths is not needed since if these tests are to be
+run they will be run on target where builddir structure most certainly
+wont be available.
+
+Fixes
+WARNING: libpeas-1.36.0-r0 do_package_qa: QA Issue: File /usr/bin/peas-demo in package libpeas-demo contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ peas-demo/meson.build                 | 2 +-
+ tests/libpeas-gtk/testing/meson.build | 4 ++--
+ tests/libpeas/testing/meson.build     | 4 ++--
+ tests/testing-util/meson.build        | 4 ++--
+ 4 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/peas-demo/meson.build b/peas-demo/meson.build
+index a3ec53b..855ebf2 100644
+--- a/peas-demo/meson.build
++++ b/peas-demo/meson.build
+@@ -9,7 +9,7 @@ peas_demo_c = [
+ 
+ peas_demo_c_args = [
+   '-DHAVE_CONFIG_H',
+-  '-DPEAS_BUILDDIR="@0@"'.format(builddir),
++  '-DPEAS_BUILDDIR="/usr/src/debug/libpeas"',
+   '-DPEAS_PREFIX="@0@"'.format(prefix),
+   '-DPEAS_LIBDIR="@0@"'.format(libdir),
+ ]
+diff --git a/tests/libpeas-gtk/testing/meson.build b/tests/libpeas-gtk/testing/meson.build
+index 646f42d..fd9a692 100644
+--- a/tests/libpeas-gtk/testing/meson.build
++++ b/tests/libpeas-gtk/testing/meson.build
+@@ -19,8 +19,8 @@ libpeas_gtk_testing_deps = [
+ 
+ libpeas_gtk_testing_c_args = [
+   '-DHAVE_CONFIG_H',
+-  '-DBUILDDIR="@0@"'.format(builddir),
+-  '-DSRCDIR="@0@"'.format(srcdir),
++  '-DBUILDDIR="/usr/src/debug/libpeas"',
++  '-DSRCDIR="/usr/src/debug/libpeas"',
+ ]
+ 
+ libpeas_gtk_testing_lib = library(
+diff --git a/tests/libpeas/testing/meson.build b/tests/libpeas/testing/meson.build
+index 74ba7b1..084daa9 100644
+--- a/tests/libpeas/testing/meson.build
++++ b/tests/libpeas/testing/meson.build
+@@ -21,8 +21,8 @@ libpeas_testing_deps = [
+ 
+ libpeas_testing_c_args = [
+   '-DHAVE_CONFIG_H',
+-  '-DBUILDDIR="@0@"'.format(builddir),
+-  '-DSRCDIR="@0@"'.format(srcdir),
++  '-DBUILDDIR="/usr/src/debug/libpeas"',
++  '-DSRCDIR="/usr/src/debug/libpeas"',
+ ]
+ 
+ libpeas_testing_lib = library(
+diff --git a/tests/testing-util/meson.build b/tests/testing-util/meson.build
+index 1c40740..83ad059 100644
+--- a/tests/testing-util/meson.build
++++ b/tests/testing-util/meson.build
+@@ -17,8 +17,8 @@ libtesting_util_deps = [
+ 
+ libtesting_util_c_args = [
+   '-DHAVE_CONFIG_H',
+-  '-DBUILDDIR="@0@"'.format(builddir),
+-  '-DSRCDIR="@0@"'.format(srcdir),
++  '-DBUILDDIR="/usr/src/debug/libpeas"',
++  '-DSRCDIR="/usr/src/debug/libpeas"',
+   '-UG_DISABLE_ASSERT',
+   '-UG_DISABLE_CAST_CHECKS',
+ ]
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
index 1282e93634..8262cc2212 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -12,6 +12,7 @@ inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
+SRC_URI += "file://0001-Remove-builddir-and-srcdir-paths-from-test-binaries.patch"
 SRC_URI[archive.sha256sum] = "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c"
 
 PACKAGECONFIG[python3] = "-Dpython3=true,-Dpython3=false,python3-pygobject"
-- 
2.40.1


