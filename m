Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAC8CC6B2C
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 20:16:10 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20943.1792001552900729727
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 11:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Spy7ehB7;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: joel.winarske@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so3692061a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792001552; x=1792606352; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jYv8xbHUO7XnbprRXfYDQ0WNw0Hlkk4KKdsvi1hKXTA=;
        b=Spy7ehB7P9mCJ8v2fVnkRBcTa+OsM9QW+DD9xYzBRY0yJbxn/8uoYEQH84AFnVgQD6
         MEWeDkRoKNIaGk/CLqSJuHDHvQpNXIvSUW0GygR/zHDMRylFenVeKIhHeXcm8SIZIF3o
         C4ql6BiGcPJo7DPaZEXg/qUKiHHknEcdVQVe30vrseQ2wIKdZWj2Tf+yuTLH/z9rRQ8P
         YxzrQOn7M+VSZzeVUAM3+TIfOm/KTqSxFtgRXLCdKHnD8QJjX42L5A0H1803v7xgbsz/
         Rt38DjRzn9uq5ahVBt2OSLlzP8jZ4ygXMt7zEUrkv4yNhAtPOjPfMsw8bVOxAHS5alCE
         sD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001552; x=1792606352;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jYv8xbHUO7XnbprRXfYDQ0WNw0Hlkk4KKdsvi1hKXTA=;
        b=gjNpYs+ZeZqqa2yGaoTfnmJ+mkvFMA5fDctqJzxiFf9fjZPcfC4ax6q5Q5uK8el1yZ
         QwDlVYp4jwnUEq9JMfnhttcGUcJIro7Tu0rsh7X7znyaYxlVYUH76bzg1SyBOPM5RQhh
         NF5pAxOtSl9yiE+M3ZZQx5W75ptyCByHKH2cTQPq/lDwtWbjnlSW36zIGdef+c/QOqVY
         5rg7Hs6vRw8t8LRfNBu2zQx9gCIYMOy5IRW8TQltBdfPoVsfCnpUNgPzhWumRbC3nQNo
         GjDqVCpJhCwlM/IjFQeZNotgjyMLNKUqrFNxN6S3LjToG6ImBh4YZWhuCknldBxiHzDb
         sbYg==
X-Gm-Message-State: AFq9FYLcNCt8KK3b+eYahnG6fCmy6pgYUhzHJHzTJdO+ydPaSCtso/gy
	cNHvLd+mo4ef98oaeL+X/IM9xUrA7Kj4SGmxMAsemTfcfY+VpVHFoZiOh/sBsg==
X-Gm-Gg: AYBFou25jaaAqtEohw1LXDYfeECPSbb90m/hBaX+1tMr60bHphDQW5CWN3iugdhO7Wj
	qnUq1bfQSQvqWDAM4pHFBAQeR5L8RsXx4gFi/btxZ/ADBXhbsLNpbeu8N7WTOBIvdnMK23RsVu8
	OSTMPG/J2kT3N8LLv9D6ni5wRc0pobkE+2CYSIXaU7OhOTP/DVVEpiFVc8PMjnQv1NlqcY+r+0k
	ULPWGR9c+siPFEyIwIEVVInkkAnskLMXIUuiYZuBx9JrsHifpKY//pFQOa2p2SSHihQTMZFz3eA
	ADOCO9Zh1EuimOFXHi0qX8zw+hMtvn5wjQ8tMnssuYRUEVDmeyWkYMXIbXSBnnDj26N/QSxGv/T
	5mNDvZa/i+4lW8CN8pZj9LerxSsRSAkKRCn5AxeiZJhawTXl3ZYxktctv8nynSfhEA3Yv0XE56r
	5oGxSrMxWUc/mA/vPU61FED7KLwFYzJjsrEVmSxVfLom2kYYJuhgxTb8AJjpN9NYCz9xEYLIJ6A
	LuBi6Hh1reeNmbAbb8gBECqb4ooGJ3pp/b128r2MpIQz3Kq5g==
X-Received: by 2002:a17:90b:3a48:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3ab3a33db41mr14988588a91.5.1792001551969;
        Wed, 14 Oct 2026 11:12:31 -0700 (PDT)
Received: from air ([2601:602:580:a250:62eb:81a:51d8:6bf6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm458366a91.3.2026.10.14.11.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:12:30 -0700 (PDT)
From: "Joel Winarske" <joel.winarske@gmail.com>
X-Google-Original-From: Joel Winarske <joel.winarske@linux.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joel Winarske <joel.winarske@linux.com>
Subject: [meta-multimedia][PATCH] libcamera: fix softisp-gpu build on GLES-only EGL stacks
Date: Wed, 14 Oct 2026 11:12:12 -0700
Message-ID: <20261014181217.1428614-1-joel.winarske@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 20:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130900

The GPU software ISP renders with GLES 2 through EGL and never uses
desktop GL, so depend on virtual/libgles2 instead of virtual/libgl.
Requiring virtual/libgl breaks machines whose GPU stack only provides
EGL and GLES, e.g. StarFive JH7110 with the PowerVR mesa-pvr.

Also carry a patch so libcamera doesn't redefine EGL_NO_X11 when an
older Mesa's egl.pc already passes -DEGL_NO_X11, which fails the build
with -Werror.

Signed-off-by: Joel Winarske <joel.winarske@linux.com>
---
 ...camera-egl-Don-t-redefine-EGL_NO_X11.patch | 46 +++++++++++++++++++
 .../libcamera/libcamera_0.7.2.bb              |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
new file mode 100644
index 0000000000..eace529b06
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
@@ -0,0 +1,46 @@
+From 998b5c7ee5cabd51292ac216ccb390c35f989a78 Mon Sep 17 00:00:00 2001
+From: Joel Winarske <joel.winarske@linux.com>
+Date: Mon, 12 Oct 2026 18:20:01 -0700
+Subject: [PATCH] libcamera: egl: Don't redefine EGL_NO_X11
+
+Mesa built without the X11 platform exports -DEGL_NO_X11 via egl.pc
+Cflags, from mesa!2226 (19.3) until mesa!18848 (22.3) moved Xlib
+inclusion behind USE_X11. This affects non-glvnd builds, where egl.pc
+comes from Mesa rather than libglvnd, e.g. the PowerVR mesa-pvr (22.1)
+used on StarFive JH7110.
+
+The -D defines the macro as 1, so the unconditional empty define in
+egl.h is a redefinition, which is an error with -Werror:
+
+  include/libcamera/internal/egl.h:23:9: error: 'EGL_NO_X11' redefined [-Werror]
+
+The define is still needed for EGL headers predating
+KhronosGroup/EGL-Registry#130, which otherwise pull in Xlib.h, so only
+define it when it isn't already set.
+
+Upstream-Status: Submitted [https://patchwork.libcamera.org/patch/28452/]
+
+Signed-off-by: Joel Winarske <joel.winarske@linux.com>
+Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
+Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
+---
+ include/libcamera/internal/egl.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/libcamera/internal/egl.h b/include/libcamera/internal/egl.h
+index 1e31d490b..aeb4da80d 100644
+--- a/include/libcamera/internal/egl.h
++++ b/include/libcamera/internal/egl.h
+@@ -20,7 +20,9 @@
+  * Workaround for build issues on Mesa <= 22.2, see
+  * https://github.com/KhronosGroup/EGL-Registry/pull/130
+  */
++#ifndef EGL_NO_X11
+ #define EGL_NO_X11
++#endif
+ 
+ #define EGL_EGLEXT_PROTOTYPES
+ #include <EGL/egl.h>
+-- 
+2.56.0
+
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
index 955cf041ba..22e1058459 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "\
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
         file://0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch \
+        file://0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch \
 "
 
 SRCREV = "191e202178f02430b5942397c70d215cdd2056fa"
@@ -33,7 +34,7 @@ PACKAGECONFIG[compliance] = "-Dlc-compliance=enabled,-Dlc-compliance=disabled,gt
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[jpeg] = "-Dcam-jpeg=enabled,-Dcam-jpeg=disabled,libjpeg-turbo"
 PACKAGECONFIG[kms] = "-Dcam-output-kms=enabled,-Dcam-output-kms=disabled,libdrm"
-PACKAGECONFIG[opengl] = "-Dsoftisp-gpu=enabled,-Dsoftisp-gpu=disabled,virtual/libgl virtual/egl"
+PACKAGECONFIG[opengl] = "-Dsoftisp-gpu=enabled,-Dsoftisp-gpu=disabled,virtual/egl virtual/libgles2"
 PACKAGECONFIG[python] = "-Dpycamera=enabled,-Dpycamera=disabled,python3-pybind11"
 PACKAGECONFIG[raspberrypi] = ",,libpisp"
 PACKAGECONFIG[sdl] = "-Dcam-output-sdl2=enabled,-Dcam-output-sdl2=disabled,virtual/libsdl2"
-- 
2.56.0


