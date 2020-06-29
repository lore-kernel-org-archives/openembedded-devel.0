Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.3438.1593471343019146377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 15:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=as1v4zzB;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id by13so4556178edb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jun 2020 15:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcikrymTpWJ9uy3xeVkAlhknZK/CjQXaip+7MN/pCgI=;
        b=as1v4zzBaKr8Fc7TYs1V/p5EEBXSvEaCu/l3G/LhFvi32EyPSKHp/M8X17jUMIgEcU
         M3lcNuOPVjo1uW6nhuNcESNJwp6jAYPGOML+WaZJAtdFnuT9Am4ONqGaB/A3N6WhDgXB
         MbHC+wPMi+DxvnrTqAWqRLC3+SJpi1oGW/h/SnIaWAdDJSUd7b4zo8mau9M+R+ByMj0z
         GPAcm7QLp1ftIN/SfO7UZC1Vc4Gou1opx9FvK29GaRQZQKakjq0IriRmMcStn3S8bF0F
         nXxScX82CMeNoXB90KO7FCYfMA7nZcUbsEN94+8vGY7wLwBUY8ixPjQ/lsbr3MsUWhxQ
         buow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AcikrymTpWJ9uy3xeVkAlhknZK/CjQXaip+7MN/pCgI=;
        b=AfO9MaiUoGnh6pjyxzvc14ZEQDGgAGRcdydSOQiAx65tMkQjuOQ5TCafezrIkH1Xud
         xDniTSE/Umr1cguYapHC9JaP9VUloGtXWmHLsKxcqhE3w3lBozt/YI8PGW39DMyJh4dm
         trIug8vQRHDPvhQX1PYdFBd/e0iXe6iLeZSiWwmewx1yOiPXQNdvqyjhcDj4ys9f/nVc
         lrodIYCMa214oityACRPaU6EnnYZphzJ8mhozoVE2+Mcl4VEquidLXh3eS5qePGiFDkp
         SHYdiPcGYpYUqyeeNE015F+8og3NsLwDtnVf+DWfoMAYz4c/+mJboGtKKnFwR5Xa+geO
         HB9g==
X-Gm-Message-State: AOAM532J49JTBqeYGlF1SJIfwRk5kVIOmeNmB0tOBPxJZd/RrQ3zw/DN
	1VEKO71v5e8aJAt521lXvXtGsH/A
X-Google-Smtp-Source: ABdhPJy4/I6N/fT9jyirs/NdLoxU5q/gwAErcgWI8Bo6H86F1O02yff/t7oHd52+MI5QG4Y/6kaATw==
X-Received: by 2002:a05:6402:742:: with SMTP id p2mr1559216edy.135.1593471341063;
        Mon, 29 Jun 2020 15:55:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e598ea5755874a95638.dip0.t-ipconnect.de. [2003:f0:7f4b:8e59:8ea5:7558:74a9:5638])
        by smtp.gmail.com with ESMTPSA id i13sm1008892edk.30.2020.06.29.15.55.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 15:55:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] sysprof: remove linux-gnueabi-patch
Date: Tue, 30 Jun 2020 00:55:32 +0200
Message-Id: <20200629225532.1129679-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

meson.bbclass takes care since oe-core

commit 010202076760329829fbde8dab4f535d6f755873
Author: Andreas M?ller <schnitzeltony@gmail.com>
Date:   Thu Apr 16 00:30:36 2020 +0200

    meson.bbclass: avoid unexpected operating-system names

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ot-hardcode-linux-as-host_machine-.s.patch | 42 -------------------
 ..._FORMAT-instead-of-G_GUINT64_FORMAT.patch} |  0
 .../recipes-gnome/sysprof/sysprof_3.36.0.bb   |  3 +-
 3 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
 rename meta-gnome/recipes-gnome/sysprof/sysprof/{0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch => 0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch} (100%)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
deleted file mode 100644
index 9db111e8e..000000000
--- a/meta-gnome/recipes-gnome/sysprof/sysprof/0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 43c39b5685445242d071b3706af2903efa508b4a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 14 Jan 2020 12:58:27 +0100
-Subject: [PATCH] meson.build: do not hardcode 'linux' as
- host_machine().system() value
-
-In some build environmets such as OpenEmbedded this can be 'linux-gnueabi'
-or otherwise not exactly 'linux'.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/libsysprof/meson.build | 2 +-
- src/tools/meson.build      | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libsysprof/meson.build b/src/libsysprof/meson.build
-index 3449961..3c2d186 100644
---- a/src/libsysprof/meson.build
-+++ b/src/libsysprof/meson.build
-@@ -84,7 +84,7 @@ libsysprof_deps = [
-   librax_dep,
- ]
- 
--if host_machine.system() == 'linux'
-+if host_machine.system().contains('linux')
-   libsysprof_public_sources += [
-     'sysprof-memory-source.c',
-     'sysprof-perf-counter.c',
-diff --git a/src/tools/meson.build b/src/tools/meson.build
-index 670052a..3fb7f0c 100644
---- a/src/tools/meson.build
-+++ b/src/tools/meson.build
-@@ -2,7 +2,7 @@ tools_deps = [
-   libsysprof_capture_dep,
- ]
- 
--if get_option('libsysprof') and host_machine.system() == 'linux'
-+if get_option('libsysprof') and host_machine.system().contains('linux')
-   polkit_agent_dep = dependency('polkit-agent-1')
-   sysprof_cli = executable('sysprof-cli', 'sysprof-cli.c',
-     dependencies: tools_deps + [libsysprof_dep, polkit_dep, polkit_agent_dep],
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof/0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch b/meta-gnome/recipes-gnome/sysprof/sysprof/0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/sysprof/sysprof/0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
rename to meta-gnome/recipes-gnome/sysprof/sysprof/0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
index a769dbf7d..275fbaa69 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.36.0.bb
@@ -18,8 +18,7 @@ SRC_URI[archive.md5sum] = "3956e82b8744715006dde59e0ce8910b"
 SRC_URI[archive.sha256sum] = "8670db4dacf7b219d30c575c465b17c8ed6724dbade347f2cde9548bff039108"
 SRC_URI += " \
     file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
-    file://0002-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch \
-    file://0003-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch \
+    file://0002-tests-use-G_GSIZE_FORMAT-instead-of-G_GUINT64_FORMAT.patch \
 "
 
 PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
-- 
2.26.2

