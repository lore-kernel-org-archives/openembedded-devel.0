Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFA2CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:24 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.953.1761363622838770185
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kID+WYmY;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso2691789b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363622; x=1761968422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUlkcl5vKL77zSpOaol1ZuUjETxQBz4VrvjcFLEjtqA=;
        b=kID+WYmYJNRBSCEUTcqOX86bXnbWZxH4klWNsU8ZULJLTQWlIgfF72s2xG5zqUDcYk
         vP2IzfYFFKRQyEzzQ5L53Wu3sxWqEu6csJzYXnQYfryJH+2RP101lYLPNv4s9/ozngD5
         S+1SsWA++AVY5yGrCNexG7kS9HjnF3jiKU6fDEc7yJ9yi5cpAf8Ui+hVouybNxdPQI+g
         EaGCIjxXnAETbZNvoZaoNcviVqHICPLe7+QMaSDid04kqjsa5IMp5MbM94W8namXvjCE
         DaveoqlkYfDEW6LNOCV6s2e69xU1TQLXBDiFcydm5fa++D+II7ZcgDCGx7ROYXTmrwtl
         IEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363622; x=1761968422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUlkcl5vKL77zSpOaol1ZuUjETxQBz4VrvjcFLEjtqA=;
        b=JIfA5kGywRbUZoCfI70lGT3YKAfnpvs2/0TflgaU6yItch/5pHaLZrEEOGqOEDi84N
         ChXPTRwtTLhutsfIwnGy2eimTizxTdevWQvvivNqVI6MkEOBs8iQYOseJ+t9IFB0oNF+
         UxVjHfNPOes06jLRYvsQkHYkww/BU7j3acEVhd4CAkdHCLDv+CJ/oi/XruoljX3j37nW
         0zkA92BqnJS2LPIQm6pmahzxUmEKr4gGHfnK+1EclmIfjzrh9ee3P0QTK1vkYBP6wvih
         R+oJjFYLrgz5fo9ub3yTwW9G48r6auXsIQEEhVEWRIDUecVCOKuhklLDHABTGKSJD3Eb
         IbUQ==
X-Gm-Message-State: AOJu0Yw5gVPdXgi5KdozHegHL1htNLZvStVao1oxfpeOzZMzOZwrVuW3
	QTPM0EUV8d9ijCQh2kPhNkISG+mMhN9cnFJw0ZtUgtTv2kzfZ2bI8Moz1KKPdy/H
X-Gm-Gg: ASbGncsanU9esdg7sWwcL2aWb9GXXC+bFDFaSr116KIhpfWHh5AKFN6EJlVJCdOM6mI
	75ItMQIJPppgI48zGyQXBEx1d6RpWSqt22CVwvVl3i5gerPHSpLnZNI6Dc1VnR3Bke/Dx9kp0zJ
	ggbHB+4gCXyXCtkkHCKXyrupkeq3TdQjV+ejQRq274coKJV6UwYDEyB0ZXRQwl9m2tsRDhCZcQR
	zltt1GlZjyYVwc55+pVwSK607Io3/qCbMjlsW39hcELtxBZ2k/Qwo/t/mA9OUP5zQhyq7OUW1Zh
	btMCKMkfLSiSgR8wyLbnbNok6Jm4oMGkpm0ZvW7QFl+5daLmi3N6I0gER4KYRb34vNDb+JUMa7h
	XEuIgiPHOVUByee7+uqTbjJAnU5T1t4tzriCg7SWEldOtrA3mrt5CsEBm9yEnAOEeweX/+4/da8
	ouRrwCRyeKYJvnTn3gCNfN8VgbxTUflG3Woem4oHCCxlbBF8a9htdOEChAUxrkPzMmTHOaDwi1
X-Google-Smtp-Source: AGHT+IGjUSoEJ1LCpqUbg9tV8o+7C343mbDhY+UDOueIJkKJvNieEcarGotZse4nXzpivEIUuOj7/g==
X-Received: by 2002:a05:6a00:1702:b0:7a2:50c5:64e8 with SMTP id d2e1a72fcca58-7a28685edcamr4408512b3a.23.1761363621653;
        Fri, 24 Oct 2025 20:40:21 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 02/11] libcamera: Detect platform/toolchain defaults for C++ library
Date: Fri, 24 Oct 2025 20:40:07 -0700
Message-ID: <20251025034017.2071643-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120986

This ensures that meson does not detect it and automatically link to it
when using clang with gnu runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...camera-Do-not-assume-libc-with-clang.patch | 68 +++++++++++++++++++
 .../libcamera/libcamera_0.5.2.bb              |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
new file mode 100644
index 0000000000..7495205041
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
@@ -0,0 +1,68 @@
+From 82e9d391d312d65e7a62252e9e153b93c06ad37b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Oct 2025 11:10:59 -0700
+Subject: [PATCH] libcamera: Do not assume libc++ with clang
+
+Clang on linux can be defaulting to use libstdc++, it
+should be using default platform C++ runtime library which the
+toolchain should be configured to do the right thing
+
+Add logic in meson file to detect C++ runtime used by toolchain
+and defile -stdlib= parameter accordingly
+
+Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2025-October/054151.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 32 +++++++++++++++++++++-----------
+ 1 file changed, 21 insertions(+), 11 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index fd508fd7..5707f850 100644
+--- a/meson.build
++++ b/meson.build
+@@ -118,7 +118,24 @@ cpp_arguments = [
+     '-Wnon-virtual-dtor',
+ ]
+
+-cxx_stdlib = 'libstdc++'
++# Try to detect libc++
++libcxx_ver = cxx.get_define('_LIBCPP_VERSION',
++  prefix: '#include <vector>\n')
++
++# Try to detect libstdc++
++glibcxx_ver = cxx.get_define('__GLIBCXX__',
++  prefix: '#include <vector>\n')
++
++stdlib_msg = 'unknown'
++
++if libcxx_ver != ''
++  cxx_stdlib = 'libc++'
++elif glibcxx_ver != ''
++  # __GLIBCXX__ is usually a yyyymmdd date code
++  cxx_stdlib = 'libstdc++'
++endif
++
++message('Detected C++ standard library: ' + cxx_stdlib)
+
+ if cc.get_id() == 'clang'
+     if cc.version().version_compare('<9')
+@@ -138,16 +155,9 @@ if cc.get_id() == 'clang'
+             ]
+         endif
+     endif
+-
+-    # Use libc++ by default if available instead of libstdc++ when compiling
+-    # with clang.
+-    if cc.find_library('c++', required : false).found()
+-        cpp_arguments += [
+-            '-stdlib=libc++',
+-        ]
+-        cxx_stdlib = 'libc++'
+-    endif
+-
++    cpp_arguments += [
++        '-stdlib=' + cxx_stdlib,
++    ]
+     cpp_arguments += [
+         '-Wextra-semi',
+         '-Wthread-safety',
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
index 88fe9cf39c..8b8d6815c5 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "\

 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
+        file://0001-libcamera-Do-not-assume-libc-with-clang.patch \
 "

 SRCREV = "096c50ca881f72d858aca19757a5e73b4775a7cc"

