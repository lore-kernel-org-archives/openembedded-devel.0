Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50202E67813
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 18:54:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.86336.1766429682390966612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 10:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GpNsca5P;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso42580095e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 10:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766429680; x=1767034480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nR2RslVNkcmrHq1h2Bm/ZS/D1gGW5BJDK9HGRQHdkT4=;
        b=GpNsca5PpCM6Y/JNNemRbjo33FcOIe5Wky2WccglWLbQrzljZnfJ4rC4NGeUOnq6vV
         0NLOfFPAMJbClgvYym8aEOofxGuWT1JmxqO24hzxXTmrdAS6DIuHoNYjypX6Y5nbMM5P
         KtWH6XsR0f5SfmvzoHmxVCvtrY4ueysIaXnz+PH505i7NvS2RYqIZBtY3YVY92CkQDhs
         0zOtPwXEjW78gT/7vlb0LtKtNVlrdus0mTa1cBxVNotsnLeBRDQ/9SKQtETIY1L9meGb
         4TmPUF7HWX89CVNJkSDC/n36irnWTmRkR6EU/YoLDa0uZk9ACOYtEis+gJOqgJGRiRH3
         35PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766429680; x=1767034480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR2RslVNkcmrHq1h2Bm/ZS/D1gGW5BJDK9HGRQHdkT4=;
        b=RVbiLKDhKT2jn3nyW/BgRAQ2woqJ7j6KnWAlrhqvKYXXus6U4tcG4orjRI8nvk/8WZ
         Mkx/Ew+rm41cF6fqAj3stE6BFf0zlstl4sZUXWIWlL7qly0rB4/8NGkRX+vb9NpLUnjC
         cHf61TRxkXBMk2fRTSQi1Mo+9lzuQTCEmRQ5xbCTapcUL6Vo9gjgInHyvQ3odzHavhS0
         aOk2J1+HQUhEIY6rwxSrS9UTbBcW+HNXIPkaJXyxvAgCUTHMVaGS3Fq6rCqDpz/yE62d
         kpQtD98jhLs9IAQ18JXDJdvjs+xLv9EGL7Andrwvn9To2uyuq1Vbw1IQQPg0IST6ICQY
         RKtQ==
X-Gm-Message-State: AOJu0YwDbOcv3/sX65l4HSop8sbkOsgfOQMUH1nF8VyRC8iLJ7mtpfb7
	drV4Cr2nhKUc6p6gsCZuXJLcQx33m2spyVWn7O4MAilxr0p1Z9UMIlr0ys1UBg==
X-Gm-Gg: AY/fxX5AQOZL8/cyleFH4TiZSTwrl6Z614qhexiLAPUCeMhrmBlGQJQWCe6eXpb6Sia
	kmCD8QxsOLbrMuguibErQ0q2kRz4mxdAc8iTakFREQOYQSzVyD97LUvi24aGzL4D2qMi542hJII
	4TXGijkxAFvTM/AyVdx21hsu9l/PKQtNtp/OqtLmAtpkjK3GEW4UU4YoVZzaPqJWIqx6QRQnKbW
	V9XS/NTrO5dwLluYu1mUCwYKvIXIu0i5cttRdy3CXB12u/2LtrCKkh/FKAc8+JICIEo03rBQcLy
	UtID9OSEixqvw14em8Z2kiHZ6vB4EBt1p41stuj3YQgXWIKeCZ4S3odA2/i4gIeh1rcLMadyjQl
	AO9ta3ZbbsV1NJ0CNd8SQNGmrnkWPJqKxhRHmd4n7uLYiAQM5XsCJNh5yIV1XFh3uN4pYii8khf
	DU4SckKfHE06WqX8TGOshWn883jAcuyZxIBGurO6tXdQAWsSHImEf5iWJZTZtJWeycOOePcSEUg
	IfMwi2JQPbtR9cWD+Hdw7+Yub4=
X-Google-Smtp-Source: AGHT+IGeLu7ouD8C/CiXKLT8KaYruIC6sK91ge5DvM8yMN20kYUvLoCKSTBrTQG4lf0fQb8czm2EFw==
X-Received: by 2002:a05:600c:8718:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-47d1956eba9mr104337255e9.7.1766429680360;
        Mon, 22 Dec 2025 10:54:40 -0800 (PST)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27c2260sm250661765e9.15.2025.12.22.10.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:54:39 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-oe][PATCH] freeglut: version 3.4.0 -> 3.8.0
Date: Mon, 22 Dec 2025 19:52:20 +0100
Message-ID: <20251222185220.1722980-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 18:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122797

    2025-11-16  John Tsiombikas <nuclear@mutantstargoat.com>

	freeglut 3.8 changes:

	* New experimental Cocoa (native MacOS X) backend.
	* Add glutSwapInterval, to control vsync (currently X11 and win32 only).
	* glutExtensionSupported now also reports platform extensions (GLX/WGL).
	* Fix build issues with new cmake versions while maintaining
	  compatibility with old cmake.
	* Fix handling of UTF8 window/icon titles.
	* Fix issue with some X11 window managers not properly restoring
	  iconified windows (send _NET_ACTIVE_WINDOW EWMH client message).
	* Fix build issues with C23 compilers (empty argument list semantics).
	* Fix compatibility with older versions of windows which don't have
	  RAWHID support (before XP), by loading the entry points dynamically.
	* Fix glutInitDisplayString parsing of "aux", and add =N parsing support
	  to specify samples and auxbufs.
	* Various fixes and improvements in the GameCube/Wii backend.
	* Altbuild support for Solaris 2.6/SUN Workshop C.
	* Started conversion of documentation from the website to markdown in
	  the source tree: doc/api.md
	* Added the original GLUT manpages, with permission from Mark Kilgard.
	* New demos: accum, vsync, and windows.
	* Cleanup of some old and no longer relevant, or redundant comments in
	  the source code.
	* Removed some out of date README files, and updated others.

    2024-06-08  John Tsiombikas <nuclear@member.fsf.org>

	freeglut 3.6 changes:

	* New platforms: Nintendo Gamecube and Nintendo Wii.
	* Minimum cmake version raised to 3.1.
	* Make XInput an optional dependency.
	* Fix incorrect modifier bit mapped to GLUT_ACTIVE_SUPER on X11.
	* Add support for ARM64 MSVC targets.
	* Fix for unicode builds on windows.
	* Fix build on some versions of MinGW carrying an incorrect winuser.h.
	* Fix menu-related memory leak when an error occurs.
	* Various build improvements & fixes.

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../freeglut/{freeglut_3.4.0.bb => freeglut_3.8.0.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb => freeglut_3.8.0.bb} (90%)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
similarity index 90%
rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
rename to meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
index 13f3d111fe..25ba1e05bb 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
@@ -5,12 +5,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89c0b58a3e01ce3d8254c9f59e78adfb"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
+SRC_URI[sha256sum] = "674dcaff25010e09e450aec458b8870d9e98c46f99538db457ab659b321d9989"
 
 inherit cmake features_check pkgconfig
 
-EXTRA_OECMAKE = "-DCMAKE_POLICY_VERSION_MINIMUM=3.5"
-
 # depends on virtual/libgl and libxi
 REQUIRED_DISTRO_FEATURES = "opengl x11"
 
@@ -19,6 +17,7 @@ PACKAGECONFIG[gles] = "-DFREEGLUT_GLES=ON,-DFREEGLUT_GLES=OFF,"
 PACKAGECONFIG[wayland] = "-DFREEGLUT_WAYLAND=ON,-DFREEGLUT_WAYLAND=OFF,libxkbcommon"
 PACKAGECONFIG[demos] = "-DFREEGLUT_BUILD_DEMOS=ON,-DFREEGLUT_BUILD_DEMOS=OFF,"
 PACKAGECONFIG[x11] = ",,virtual/libx11 libice libxmu libglu libxrandr libxext"
+
 # Add -Wno-implicit-function-declaration since it might be otherwise treated at
 # error by clang16+ and this is not really a problem
 CFLAGS += "-Wno-implicit-function-declaration"
-- 
2.47.3


