Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.67371.1629370977998991977
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 04:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UBA5lmw8;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id f5so8400643wrm.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZNR3GfiIJKiO8twws0uevvjUtJ0xm7xcLP4n6rQE8MU=;
        b=UBA5lmw8smaRntC9iYaKhoRHYTl5MdOVWdi2flEsDcR5PdIbirAs3/urhOdRyei2bI
         GAwAuXfBfwgoc9D3aiNR2uXJmzeUiDnA+acmYuGcIumUG3SU5vnHb9U3xLxEmAUfa03K
         dYWQZ3ukS2VM6vT6np1YA+NtxhAIrN0w5oaDQpLtBcGtfHHDU8sd/E7pZKhyN7li4MIV
         WiJWBUJTps9ghnnX8MSC2Bm9XeoFMGs0DHh2tHj5OGsSeDWytPkwncM1wmjta/XFhpdJ
         Fkd/A9iuIjZSsAC4ncP0ZN9SzXzJltRvQf2jizgjHop4N/IoKANnXBZZvjir5TX4Lvat
         DOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZNR3GfiIJKiO8twws0uevvjUtJ0xm7xcLP4n6rQE8MU=;
        b=VVy+FxAWKa34bVpyx+RnHFe6S6zvJ3alGAJWjEtlC/oyaHfdy/uXCszIZ3wfwy1f+x
         AVJKoLCIoJbYoZpmtp7YleR5q6St2AHBf02C+d3fIHqAkE8lr3vgL95B7/Lp/Ok2hFyl
         OnaKeBIhy0iQ1qNLTy3Qy81zyHGGB0wM/CL6a/gXZqoJEhNzHHm6Z3bSBJwiTQOctRiF
         PUl4s78RC4Vurqn3b1vP2A3oE2OnGo4sqbbpsA77On0w59CvZ4KR0OhN6LFqkI68QVns
         ekPDTjpmDe4i704lK+stvy7Xerdb67306K0913dJ+IuLbAb0xrKZNG9EYb6tiYzQwjb4
         NFcg==
X-Gm-Message-State: AOAM532hFePxq8FyQvvV1AAAly80BlhxMRORU8+s7/ukm7T2Nsujkm5N
	BWS3LtHdtS/ERL37S+ovbAXpWr2OEBtVbA==
X-Google-Smtp-Source: ABdhPJx2Tl0o/Sc4lVarNjmgf9N4GywJ5p9BxyKwgZwF/FqJYZmrBIk4d2WeekSOoRKGx70xfYocVA==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr3003772wrt.128.1629370976381;
        Thu, 19 Aug 2021 04:02:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f030860fe64da8baf3ac76f.dip0.t-ipconnect.de. [2003:f0:7f03:860:fe64:da8b:af3a:c76f])
        by smtp.gmail.com with ESMTPSA id y13sm2119642wmj.27.2021.08.19.04.02.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 04:02:55 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] fltk/CMake: Do not export executable 'fluid'
Date: Thu, 19 Aug 2021 13:02:44 +0200
Message-Id: <20210819110248.3505349-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It does not work for us: The executable 'fluid' is not installed in
receipe-sysroot. So fltk cmake config contains an invalid reference.
Consumers of fltk using cmake will fail during configure for this invalid
reference with something like:

| CMake Error at <...>/recipe-sysroot/usr/share/fltk/FLTK-Targets.cmake:129 (message):
|   The imported target "fluid" references the file
|
|      "<...>/recipe-sysroot/usr/bin/fluid"
|
|   but this file does not exist.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk.bb          |  2 +
 ...Lists.txt-Do-not-export-fluid-target.patch | 42 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index ca2b517d7..3c9ee5ee3 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -5,6 +5,8 @@ DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
 inherit features_check binconfig lib_package gtk-icon-cache mime mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch"
+
 EXTRA_OECMAKE = " \
     -DOPTION_BUILD_SHARED_LIBS=ON \
     -DOPTION_USE_THREADS=ON \
diff --git a/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch b/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch
new file mode 100644
index 000000000..72bb48a32
--- /dev/null
+++ b/meta-oe/recipes-support/fltk/fltk/0003-fluid-CMakeLists.txt-Do-not-export-fluid-target.patch
@@ -0,0 +1,42 @@
+From b6985abcb03fb09685da4044963e8f085035b208 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 19 Aug 2021 08:06:45 +0200
+Subject: [PATCH] fluid/CMakeLists.txt: Do not export fluid target
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It does not work for us: The executable 'fluid' is not installed in
+receipe-sysroot. So fltk cmake config contains an invalid reference.
+Consumers of fltk using cmake will fail during configure for this invalid
+reference with something like:
+
+| CMake Error at <...>/recipe-sysroot/usr/share/fltk/FLTK-Targets.cmake:129 (message):
+|   The imported target "fluid" references the file
+| 
+|      "<...>/recipe-sysroot/usr/bin/fluid"
+| 
+|   but this file does not exist.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ fluid/CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/fluid/CMakeLists.txt b/fluid/CMakeLists.txt
+index 472c84c..f971121 100644
+--- a/fluid/CMakeLists.txt
++++ b/fluid/CMakeLists.txt
+@@ -86,7 +86,6 @@ if (APPLE AND (NOT OPTION_APPLE_X11))
+   install (TARGETS fluid DESTINATION ${FLTK_BINDIR})
+ else()
+   install (TARGETS fluid
+-    EXPORT FLTK-Targets
+     RUNTIME DESTINATION ${FLTK_BINDIR}
+     LIBRARY DESTINATION ${FLTK_LIBDIR}
+     ARCHIVE DESTINATION ${FLTK_LIBDIR}
+-- 
+2.31.1
+
-- 
2.31.1

