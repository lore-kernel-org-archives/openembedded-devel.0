Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C03CD343B
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:17:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16085.1778066227635568691
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 04:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PG8FHJVo;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48374014a77so74577565e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778066226; x=1778671026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvYvR5E/KdtdhGj/nVOjM9sjQrCN4fx99IAfMPwvJGg=;
        b=PG8FHJVoIziaUz0Kvrih1QZ1iwcSeb/B3TbitJwioRbLmjUf76Ox8ierit4TZ8RihT
         FnIiHxnu1/I0ueO/meWjKTm0mmVCFx54rzQFInljX5J7TzNP7cu2BlSr95nnQ2P2LN+3
         6dUC+++tWHs2KX55T/C/L+6whzXWgMizScbVWSEsg1GchSGpTwshREA7QMuTt9F/THo/
         HBXH40iLlvY2QUgIASo8qyz/43j4g3+qTBtviymzr1e8dd0fa1kNXlV29Pd3ypa6b3Wu
         jaZsJwap1KK6+k1qr4Q0ORDcXp3NIVChnvG3sDbcWw+vb1Q1NqCAnkVVbXzxxA9sTggg
         0i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066226; x=1778671026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vvYvR5E/KdtdhGj/nVOjM9sjQrCN4fx99IAfMPwvJGg=;
        b=ZuOZq6zp4ygon+7BN+8J4sPAjn6wlm7boajpVydKb8VIuGVWn5XbNiO2HHKDkFtUJs
         3q19GG7Af1t2y1f9WwjbaDP7/544Km5Wnarqg1c3RJMv7YgkLNORvA8JGw6TKzG6evRm
         EIIKGLVw5eHYL7aiBrT7RHGLJm1L8YzlL+oQ5mBiD74tmcBHK3CL+kErrF/L5uUyCwqa
         fVY/hnREpSzVWFuhiz4YmmH+LDBOTd72DYgsS0Vr3YbBM77eFbwcaUPhJ/x5uNTkJjco
         Cq9f4eoB3311OzssrAhCnzZK80wIgrLMgyN78m0de2K3k5GC6bXWpC88RYOywHn315Uo
         TndQ==
X-Gm-Message-State: AOJu0YwKp+UVM0YxJB/DaW/i96owFC3s/0ccfl0sKGn767VI2+n1Vgk8
	UvRIbnLI5veaoxs5jRdGqJft2qzpQEruCIKvoyI5R4g+5wrWdz1Cpc9dS2GDTg==
X-Gm-Gg: AeBDietNcico1ef2Vo/xWhRPur1j/baJTbVSCh67U8NJtpE0SEYA7jafO+YT6BXZC1z
	m/t+YvOcGCwx8ez30mWRN48Sk+wNTB6/z9evzSo2MPH1Jk7GMAi6FknoIMx65eJT7TdWZiH6a3K
	wQ9wzyZKTRA+vM7Ux4uPd+4Fb3x0pBDT285UUYwRVvL7fKmmas6k7bQe0DzZjiXma4JwMqCgKmP
	67qRwHuZez6VfHwAHS8hdfCO/hYzO1L00e2BTeWxEL39CJX+BFv7fK3LIy9w4JDkKgWUFBzJShG
	y08aAEoYdeiTafhynMu44alLdmf2pe50S+l12e6Pj2NnRunSiA7LXhSVY3ynRoKwnTAo66LXOy4
	ko/j6ccEfTMYBhnpDuRfDIE3nHFXuTyyZMJ3/kwF9UZ1B2YcGv0ldBv3aqCn8K3/51YwxOZ2Sdt
	fFboKFYM+gfqIth8vObDYPKz/EyajdoEpKcQ/Y8Ob1eIWD/UQ1/mJ/gtByLRT6Yeg9PNvhOlAlA
	5nfFXNNKCHzZtati7ZPvC4mnZ2zf3s=
X-Received: by 2002:a05:600c:3e8d:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-48e51f40b12mr55683345e9.22.1778066225409;
        Wed, 06 May 2026 04:17:05 -0700 (PDT)
Received: from toster.lan ([185.228.162.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm75272475e9.0.2026.05.06.04.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:17:04 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH 5/6] libcamera: 0.6.0 -> 0.7.0
Date: Wed,  6 May 2026 12:15:51 +0100
Message-ID: <20260506111552.2782-5-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506111552.2782-1-jose.quaresma@foundries.io>
References: <20260506111552.2782-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 11:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126802

- Drop merged pacth 0001-libcamera-Do-not-assume-libc-with-clang.patch.
- The v4l2 option "true" is deprecated and we should use "enabled".
- There is a new option "rpi-awb-nn", disabled for now, which requires
TensorFlow Lite.
- The GPU acceleration in the software ISP "SoftISP" for delivering
better performance and it becomes enabled when we have OpenGL.

This release brings 158 commits with substantial development on the SoftISP
components. This brings in GPU acceleration, allowing us to get higher
throughput for cameras using this pipeline. Further development to improve the
image quality is ongoing now that we can perform more processing in realtime.

The simple pipeline handler now supports exposing the Raw streams directly
allowing us to enable the SoftISP by default without removing access to the
camera formats.

Kernel headers have been updated to v6.18, supporting the new V4L2 ISP kernel
interface which allows us to continue improvements to hardware ISP pipelines as
we add new features.

Logging has been improved to better detect when to enable or disable color
output and can be controlled through the environment variable
LIBCAMERA_LOG_COLOR.

A new control is added for LensShadingCorrectionEnable to allow runtime control
over the LSC components where supported.

The gstreamer pipeline now has raw support added to the libcamerasrc
stream-role property allowing raw streams to be configured and accessed.

An exciting new AWB algorithm using Neural Networks, has been added to the
Raspberry Pi IPA following extensive development and training performed by the
Raspberry Pi Camera Team.

And finally, the Documentation now includes a support matrix which will help
identify the current support and enablement for platforms and sensors.

More on https://github.com/libcamera-org/libcamera/releases/tag/v0.7.0

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...camera-Do-not-assume-libc-with-clang.patch | 68 -------------------
 ...{libcamera_0.6.0.bb => libcamera_0.7.0.bb} | 11 +--
 2 files changed, 7 insertions(+), 72 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.6.0.bb => libcamera_0.7.0.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
deleted file mode 100644
index 25d88cfff4..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 0c68347365ec4c0bd3f84e1d2f9f51eb3c2405c8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 24 Oct 2025 11:10:59 -0700
-Subject: [PATCH] libcamera: Do not assume libc++ with clang
-
-Clang on linux can be defaulting to use libstdc++, it
-should be using default platform C++ runtime library which the
-toolchain should be configured to do the right thing
-
-Add logic in meson file to detect C++ runtime used by toolchain
-and defile -stdlib= parameter accordingly
-
-Upstream-Status: Submitted [https://lists.libcamera.org/pipermail/libcamera-devel/2025-October/054151.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 32 +++++++++++++++++++++-----------
- 1 file changed, 21 insertions(+), 11 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index fa6487f6..89294936 100644
---- a/meson.build
-+++ b/meson.build
-@@ -118,7 +118,24 @@ cpp_arguments = [
-     '-Wnon-virtual-dtor',
- ]
- 
--cxx_stdlib = 'libstdc++'
-+# Try to detect libc++
-+libcxx_ver = cxx.get_define('_LIBCPP_VERSION',
-+  prefix: '#include <vector>\n')
-+
-+# Try to detect libstdc++
-+glibcxx_ver = cxx.get_define('__GLIBCXX__',
-+  prefix: '#include <vector>\n')
-+
-+stdlib_msg = 'unknown'
-+
-+if libcxx_ver != ''
-+  cxx_stdlib = 'libc++'
-+elif glibcxx_ver != ''
-+  # __GLIBCXX__ is usually a yyyymmdd date code
-+  cxx_stdlib = 'libstdc++'
-+endif
-+
-+message('Detected C++ standard library: ' + cxx_stdlib)
- 
- if cc.get_id() == 'clang'
-     if cc.version().version_compare('<9')
-@@ -138,16 +155,9 @@ if cc.get_id() == 'clang'
-             ]
-         endif
-     endif
--
--    # Use libc++ by default if available instead of libstdc++ when compiling
--    # with clang.
--    if cc.find_library('c++', required : false).found()
--        cpp_arguments += [
--            '-stdlib=libc++',
--        ]
--        cxx_stdlib = 'libc++'
--    endif
--
-+    cpp_arguments += [
-+        '-stdlib=' + cxx_stdlib,
-+    ]
-     cpp_arguments += [
-         '-Wextra-semi',
-         '-Wthread-safety',
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.0.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.0.bb
index 64e8973d53..f83372df43 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.0.bb
@@ -11,10 +11,9 @@ LIC_FILES_CHKSUM = "\
 
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
-        file://0001-libcamera-Do-not-assume-libc-with-clang.patch \
 "
 
-SRCREV = "3c17d1fbb2bd93f221afee788ebf0d7394032e4d"
+SRCREV = "b7854fd07d42168f099b5ce30d1702e0e0875bf5"
 
 PE = "1"
 
@@ -23,10 +22,13 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native'
 
 PACKAGES =+ "${PN}-compliance ${PN}-gst ${PN}-pycamera"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
+"
 PACKAGECONFIG[dng] = ",,tiff"
 PACKAGECONFIG[compliance] = "-Dlc-compliance=enabled,-Dlc-compliance=disabled,gtest"
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[opengl] = ",,virtual/libgl virtual/egl"
 PACKAGECONFIG[python] = "-Dpycamera=enabled,-Dpycamera=disabled,python3-pybind11"
 PACKAGECONFIG[raspberrypi] = ",,libpisp"
 PACKAGECONFIG[vimc] = ",,"
@@ -46,10 +48,11 @@ LIBCAMERA_PIPELINES:aarch64 ??= "${ARM_PIPELINES}"
 
 EXTRA_OEMESON = " \
     -Dpipelines=${LIBCAMERA_PIPELINES} \
-    -Dv4l2=true \
+    -Dv4l2=enabled \
     -Dcam=enabled \
     -Dtest=false \
     -Ddocumentation=disabled \
+    -Drpi-awb-nn=disabled \
 "
 
 RDEPENDS:${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
-- 
2.54.0


