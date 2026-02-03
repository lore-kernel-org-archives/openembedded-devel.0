Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96839E87856
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 18:53:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1145.1770144808026628669
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 10:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iNPW9kVu;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-480706554beso64932475e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 10:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770144806; x=1770749606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftqAA5R3cUbPgJQ9Y4iQEylfdowUKy5roHmSWLmHY/s=;
        b=iNPW9kVueKe55I88rxy5oIY/CNmUN6UrdcpczJSkNeacskrlzmy2y+8DJ1zOTvmk2Y
         A8JO0vJt5Ui5k4XXRAuZTYNi/s2RRvK/kqFHhnBYwonDuNenbUoavpAosM26jNu6QzT9
         Pr5TfqvPCHacLoCf7tFXfT8aov1bYfyueEvEpIvHH60qjsSRHPzecT2IBjkTu4gmxy9L
         T9dOcRkBYXCFa0g0UQ7tJLWVAj1SEYfkH319+p0PhW5vUSi8Z3J7aDB3DI8YdZa2rm16
         FasVPD+9YOgmjlO0ffpNGI9sBLG5GBKgIXvW5bK3wutDGjFL4Hdg80AqqvC2kNMqZRvO
         MIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770144806; x=1770749606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ftqAA5R3cUbPgJQ9Y4iQEylfdowUKy5roHmSWLmHY/s=;
        b=OdtyEZ0Qy7k4SSCRcLga1YlnUg3+xkzO33b8s3JOYVOo2nEKqrOD9lHMHTeIMppg9l
         e+et+UKbQoaenIoT10tTWUmVvvkZ/XyzHbkqweKW8j2zr5/cgoZiN9M/A7r6N8a26OxM
         Xgmizt0RmtIXMFvhPPPHG5/kMtg7JfieAlRq+dOySLWO/bSygXIGoSlObz26TTX4WgXJ
         cI1982I7ohaJ2UazzvDH599a/S5g4Vxv5S3iDse+vS1bvlYOpx+Xgk7zh4n+pIjze7ma
         hM0nkrZvkIJ6HzvFqbmu1FoUVRo1181Pdp6e4vAlv+qIOgzJl+lAKDu2a32VNEAoDgj3
         7aYQ==
X-Gm-Message-State: AOJu0Yw2mk4r8EliLDvvm8LU2yXM3kyo3f2lePJ0y6GpvU0Jz0/HPwtO
	lmdh9bLEAje1PpsSD6Sa/fdf/o32Bc1Z0qOo5UecTjHSWTXKBGhb1YxHTL4ltw==
X-Gm-Gg: AZuq6aLN0Z3bOrZ0JjSUleYbtMVbIMrCt7Yh+GHw/mw9Fdrsu21V8/q+1A1d/lF++cE
	hbgAasPebYELTdDDoManwxUDbElIk8Msnb6HZzQGxhmTKyIAB5UIs+dUZr8NRraVjZUhYmvLL8M
	Mf8rchJIHLqo5TLCO9fUWvZR9IrKWqKYOsTQFvQO4AXoVzyHb/Ua/MlQzsX9/OCWZEI1Oy17c4V
	9q5BScdOGWdDnh7gcvqiSEgrvXNQ+JDUfcTkHyWkUVobxl1W9ByymNqo9cmv7dV3sy+BnFPytRA
	9oe1jp03sprsF3+fXROyMn3f6PsFmOqfYEIBZUAib3BGMBAwksAvfKW0rLiczf0LUrutD2QNmjY
	Ic7wtJy/lzCN4oVVaF1qwrAtlNmcUA61KqEbI+yKALjILKen0ezZntmg5qXU/HWHZtQFdA6pXaI
	ijzICT4Mm8
X-Received: by 2002:a05:600c:8718:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-4830e9335c4mr8129835e9.10.1770144806099;
        Tue, 03 Feb 2026 10:53:26 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830ec181aesm2727235e9.1.2026.02.03.10.53.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 10:53:25 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gimp: patch libunwind detection
Date: Tue,  3 Feb 2026 19:53:24 +0100
Message-ID: <20260203185324.1001789-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 18:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124104

Gimp 3.0.8's meson file detects the presence of libunwind incorrectly,
making it fail on some platforms (e.g. x86 + musl + clang), even when
libunwind is explicitly disabled:

| <snip>i686-oe-linux-musl-ld: app/core/libappcore.a.p/gimpbacktrace-linux.c.o: in function `gimp_backtrace_get_address_info':
| /usr/src/debug/gimp/3.0.8/../sources/gimp-3.0.8/app/core/gimpbacktrace-linux.c:708:(.text+0xbd7): undefined reference to `_ULx86_init_local'

This backported patch fixes this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ind-header-detection-on-non-macOS-pl.patch | 51 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch
new file mode 100644
index 0000000000..879529b80e
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch
@@ -0,0 +1,51 @@
+From 8862f36fcec74152afeee2a99c0e04b84b6cf5b3 Mon Sep 17 00:00:00 2001
+From: Bruno Lopes <brunvonlope@outlook.com>
+Date: Sun, 25 Jan 2026 11:11:48 -0300
+Subject: [PATCH] meson: Fix libunwind header detection on non-macOS platforms
+
+Closes: #15750
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/1aa51ca0637db88a4ea958d03fa6692e6ac0289b]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ meson.build | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 2192968..cfa1f71 100644
+--- a/meson.build
++++ b/meson.build
+@@ -731,11 +731,14 @@ conf.set('HAVE_LIBBACKTRACE', libbacktrace.found())
+ ## Check for libunwind
+ # In most platforms, unw_*() functions are in the libunwind library.
+ # In macOS, it is on libSystem (there we only need the SDK header).
+-libunwind = ( get_option('libunwind')
+-  ? dependency('libunwind', version: '>=1.1.0', required: false)
+-  : no_dep
+-)
+-have_unwind = libunwind.found() or cc.has_header('libunwind.h', required: false)
++libunwind = no_dep
++if get_option('libunwind')
++  libunwind = dependency('libunwind', version: '>=1.1.0', required: false)
++  libunwind_h = platform_osx ? cc.has_header('libunwind.h', required: false) : false
++  have_unwind = libunwind.found() or libunwind_h
++else
++  have_unwind = false
++endif
+ conf.set('HAVE_LIBUNWIND', have_unwind ? 1 : false)
+ 
+ ## Check for backtrace() API
+@@ -758,11 +761,11 @@ if platform_windows
+ elif platform_linux
+   if not have_execinfo_h
+     dashboard_backtrace='no (missing: execinfo.h)'
+-  elif not libbacktrace.found() and not libunwind.found()
++  elif not libbacktrace.found() and not have_unwind
+     dashboard_backtrace='rough (missing: libbacktrace and libunwind)'
+   elif not libbacktrace.found()
+     dashboard_backtrace='partially detailed (missing: libbacktrace)'
+-  elif not libunwind.found()
++  elif not have_unwind
+     dashboard_backtrace='partially detailed (missing: libunwind)'
+   else
+     dashboard_backtrace='detailed'
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
index a5e892c508..403d0e3eeb 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
            file://0002-meson.build-reproducibility-fix.patch \
            file://0001-meson.build-dont-check-for-lgi.patch \
            file://0001-meson.build-require-iso-codes-native.patch \
+           file://0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch \
            "
 SRC_URI[sha256sum] = "feb498acc01b26827cff1ff95aa8fb82cdd6a60d7abf773cfcd19abeafca3386"
 

