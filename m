Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4705DC7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.11450.1685531603025412941
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vao+VkWn;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-568ba7abc11so31984467b3.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531604; x=1688123604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PyBRmH+vSt5RJGtonHmuZ7V8cxPaBS8Ybp6fBtZ+QY=;
        b=Vao+VkWn5xNcOp/7PNgt9hTt0ibo13/QQnISPrMHreSnS4vKUhEUA3ee8EF9BYjH09
         YT/QlE2G15sGgZgAZt7S8BeI8irTI24OuTcMrdu7sYWVs7MIktZ6Dod6rapbewM/KqQE
         5Ch7lCleBi5yGjsFwBSt77naER7ka3+GBTpjdF7Yur55Br8mhbETo5mhQcnwF/y+DDan
         H1nfOV+sqfqzYuMVF/Upq9WQA+slW9UxZrOCdXzPI9sTfp0syOebxD7C73IeyeBcWj51
         j9VnGsAwo+l5BKF7PL/Kv4oJ0cuyAGHmBuhYfL0YdXgAwIXGM7T0dqCPZDLAdBWZkgfQ
         xpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531604; x=1688123604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PyBRmH+vSt5RJGtonHmuZ7V8cxPaBS8Ybp6fBtZ+QY=;
        b=KCNTw9Kg/b0NcJSo9YNpIqXa5hw214maAjCPMWJ5uBVb/fL+MmkcgVIviHh5pNRZzZ
         rCS5eZhdP2to21VMhQ+xZUWrynuLz2spMhxqC8ZJsRa78s/ypqd1qw+p/DR3+JBDR2xD
         zjvQNcSoDIlxbZtQdcwmGo2qPtrVzFarhVJSDhFevtbW9UaYDk44Y1SIuH26B78BWJNO
         qhPpqLssk8/bUNtZaa6zhym+/gNtTAXSf01fsPXPtYA6pPjYrl6eHsE2QddZcaze9aKF
         M8eS8+arMgraRj96J5GCdnZlEBBQUDe20h+kiAW0dqVoElcCiIf0dOGcXgv3Rz2JC/es
         kZew==
X-Gm-Message-State: AC+VfDyp6KCtmfkHtLKa91LCojTbrs43U2bY21VvMM/tVDWW8v/uIWZn
	rqLk816NzornCsjm7QCfVcMybFa1tAY=
X-Google-Smtp-Source: ACHHUZ7Y5liUmyboitt5KhJ6N3ncSPlD0IPDFb2kfv9XZ71dG5Vm6UonoJ0o1bqUcLEiI4Tcq+Sa0Q==
X-Received: by 2002:a81:6d8d:0:b0:565:a8e7:239e with SMTP id i135-20020a816d8d000000b00565a8e7239emr5612582ywc.23.1685531604181;
        Wed, 31 May 2023 04:13:24 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 16/36] libpeas: Fix reference to TMPDIR in tests
Date: Wed, 31 May 2023 07:12:49 -0400
Message-Id: <20230531111309.2454603-16-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103045

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4921a6df059ad474e4451dde587640a3291d74b1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


