Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3D2CAC5AA
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 14:25:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.17919.1758291931065188051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 07:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=By4VtnMJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b07e3a77b72so467592866b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 07:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758291929; x=1758896729; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJNk3QiOumQ+FuoOigUI1VfJusgnZXzyngnd4hVBiRQ=;
        b=By4VtnMJ8gbWXeMDdB4z9DQBkAnF0mU8/YZ8whbjbe3y7jxM4r8/J4sTElSAx/TZk0
         U295mzqDoLZcbU2x4VNwlSMZEMtyprwt9DDwJ1sZHqi7PtTO5e4qtTUReOyugh10PJ1r
         Tk3/E9qukl5jywZoHcFfclzkMoLNfrAB1e+XJwCsTVMbFXKTNc1l8sVWQxzXs8IhQ+KQ
         TzoSiPQA/0HWAKoq4aOCSMc3UXdzqqL+D0haV/9i8fgw0Dp3Pimls3Ba3CN7/7qoCbFl
         i2A7G7AZdEJTM5XUlBdj/0KAcSbRZ5mSfAD02NJmOXtzN50SHKucYWolE0u8GVO6mDI5
         Ipkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291929; x=1758896729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJNk3QiOumQ+FuoOigUI1VfJusgnZXzyngnd4hVBiRQ=;
        b=X2ZFhJ4myWCtbJP2aHpKb4wbBTjurqw0SLoUIPyLPYdoMoIVS9DznZdVdTf1IF9EFH
         rzM6E30N560R4lUurtL3qsyiDJnh153cULTlUu7do84FvyZMZboHWSkrVmj9OztcnyAZ
         CLuY8OtAyC9tctXeMj7z/oGh7SbtkvSo9kJkMARRM17AxMHcNqUZGGYIwsCNoFvMg2Ef
         bapuksEMOjrt16GXApbutLNlCPIz6Q3B+k9MZNho9DR3shi19KiRVUydfbzCbS/q3g9M
         KgJSVkbhvaY3qWiMdz+IT/wlQFweNzVGs5ZvKCWvvuIfiVWoNqOKKERhh9TYG63i1IhR
         i6Tw==
X-Gm-Message-State: AOJu0YyPHkOBc11s0H4eyWQ9VWW1RDPEoy79yPINM8LalHP9tgS4s8fd
	qDIGcJ4xDijEnJ+FDBBVTCI7sVYNkBWnD3j2atixVoVAEc5ehQsBC3ewCTFpZg==
X-Gm-Gg: ASbGncteNVt0Zi7IsFjCYR6xisZZwmC16+g96yg8c8YbnzqN0Xe0nznT9zDnmmom+W5
	6GP552dMjpMx/hZ0zKJdZU7zma7zB8Glqji0S/O4gsGDOUVlZUGjeFk/cK5qTMPFl2kUEmeDGca
	JYfFnSg4pmVDubZRhSGxYe69L64tiJPKKFQ9h5H8375AblF1ujMNzMu9/b1exj+xreNHlcbhTez
	ijGyJ265igzXbTlAuDpUtfrFCzVtWZBvnFhtNEShisxIzR/4LjGSmOXN2/7vBqPU6thVHa7sEQH
	UwUolJ+pOwfWT0DKdc8lbIkHYPEFgfN83SiNx0x/21in+as14/v9astkpYzKxO3tsKKOdqbPN8u
	T1qO1ZvAhnZwVt68x1rg7
X-Google-Smtp-Source: AGHT+IHtfIgKAmcr7rYybzhvD2f9M48tNz8W9/XCuUVhaZ0cN1Oc3m6RW/8LJh5lCT0rdlTYaOCEEQ==
X-Received: by 2002:a17:907:1c89:b0:afe:8ae2:a8fe with SMTP id a640c23a62f3a-b2489deef77mr459314966b.14.1758291929056;
        Fri, 19 Sep 2025 07:25:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b264fc79404sm121651566b.10.2025.09.19.07.25.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:25:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] epeg: update to latest revision
Date: Fri, 19 Sep 2025 16:25:27 +0200
Message-ID: <20250919142527.975042-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 14:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119608

Dropped patch that has been incorporated into this version.

Shortlog:
configure: Fix checks for libjpeg and libexif
parenthesis fix
minor fix on CMakeLists
fix to build command line tool with cmake
fix CMakeLists.txt & Epeg.h so that they work on a WIN32 target
bug fix: memleak in epeg_close
add epeg_orientation_set
add epeg_orientation_get
add CMakeLists.txt
Use archive.org link for Sune's blog post
Fix XMP rotation bug

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...e-Fix-checks-for-libjpeg-and-libexif.patch | 32 -------------------
 meta-oe/recipes-support/epeg/epeg_git.bb      |  7 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch

diff --git a/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch b/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch
deleted file mode 100644
index 1568fe96e1..0000000000
--- a/meta-oe/recipes-support/epeg/epeg/0001-configure-Fix-checks-for-libjpeg-and-libexif.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4e0c62634b0db6dbad0d41377bb71a8012abd75b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Sep 2022 12:56:54 -0700
-Subject: [PATCH] configure: Fix checks for libjpeg and libexif
-
-Use the functions from the respective library instead of using main
-function which is not part of library
-
-Upstream-Status: Submitted [https://github.com/mattes/epeg/pull/27]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index a4f6ebd..e474b1d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,8 +31,8 @@ AC_SUBST(version_info)
- dnl AC_CHECK_FUNCS(fmemopen)
- dnl AC_CHECK_FUNCS(open_memstream)
- 
--AC_CHECK_LIB([jpeg], [main], [], [echo "libjpeg library not found. Please install it before proceeding"; exit -1])
--AC_CHECK_LIB([exif], [main], [], [echo "libexif library not found. Please install it before proceeding"; exit -1])
-+AC_CHECK_LIB([jpeg], [jpeg_simple_progression], [], [echo "libjpeg library not found. Please install it before proceeding"; exit -1])
-+AC_CHECK_LIB([exif], [exif_data_new_from_file], [], [echo "libexif library not found. Please install it before proceeding"; exit -1])
- 
- my_includes=""
- my_libs="-ljpeg -lexif"
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-support/epeg/epeg_git.bb b/meta-oe/recipes-support/epeg/epeg_git.bb
index 63c1455f25..647d82ec53 100644
--- a/meta-oe/recipes-support/epeg/epeg_git.bb
+++ b/meta-oe/recipes-support/epeg/epeg_git.bb
@@ -5,10 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e7732a9290ea1e4b034fdc15cf49968d \
                     file://COPYING-PLAIN;md5=f59cacc08235a546b0c34a5422133035"
 DEPENDS = "jpeg libexif"
 
-SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https \
-           file://0001-configure-Fix-checks-for-libjpeg-and-libexif.patch \
-           "
-SRCREV = "9a175cd67eaa61fe45413d8da82da72936567047"
+SRC_URI = "git://github.com/mattes/epeg.git;branch=master;protocol=https"
+SRCREV = "17bbae0f0a0b777e5fb01e0d16891e07153a41eb"
 
 inherit autotools pkgconfig
-

