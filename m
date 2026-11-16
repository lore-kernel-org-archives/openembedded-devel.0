Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17943.1794787855795441380
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Lm1+cavP;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3193547c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787855; x=1795392655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+VL29z1cO6ff64sI0ZBTRIwu5+PrI+4RZvWZV5ulBOE=;
        b=Lm1+cavPT1PFWD4XDgtRCl9pjp7VOVia2tqKNQRXuJPZG68+SPMPKeiJIrYm+kK38z
         xFaHa1fQS461tYzJT0+E/oclac7lL+1YgvBEQicEzMzag5YHpFXPjYXXmFocfKm0gAtC
         l/vuqyK8YMiw0aQFa1Bi8nZQWoytg6/3R1HLaX4t/wNE/asFIGUVuAoH/u9eC6Ixs8zS
         iOct1dF7vHhaymTvde8DmOiLP7IXDvHJBCVYCOxh7Ca/Y6Fsn6dBcgFPSizQO8+1URBl
         W8vC/EMSAc0MvdLwlpVi1f4pVrR/iFJQdHWj2jYyRoKvUMnVaIYgqONSan7V7cFMtE8Q
         T+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787855; x=1795392655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+VL29z1cO6ff64sI0ZBTRIwu5+PrI+4RZvWZV5ulBOE=;
        b=DAcERvsGRibgXj4kIQWezW7KFWc94cY8nLVdWqehMfEhSqCXaa3geuYTS/W9L1aVqy
         zPZUAYr7P9HM0kbLxyO1pohIhc7RmQeYIETY1xsRyY5PeovU/mG1URSFL/wn21kCuD/L
         LJIuHz2AAivSRw9jtZH3OylzVF1NVaLRGp+yMERef5Cjv4F/D6nVMHx9W64aa0B/kRcS
         VsUfeU3243cR/Aq8kzHWeVKP5i69FO+oiJOsK5sNCq1nCo4zI9NJyNY3cKAUGBFPqLNw
         BXy+mU+qilRIUsOD6FDlAwhzU2CyImwkUtnaF8+Vikik4K1c408JmFmDzrucGLCaGKda
         cTRQ==
X-Gm-Message-State: APuU4Z+EJbNJAUHdoaDw9h1LEy9HQT5DViHpdynmFuJGktnnex1jU3Xp
	rb6izYfFbE+e+xVEswuyd10SNyTbTPwHLx+BH4T7f1MyKO/I07eGII27tnKAQ8P7
X-Gm-Gg: AYBFou0mGO61ehSAc91jLpBK20AJMHGZ4cTk9uSrie5BYtbdYlkZlnKhnlEGJ8xr8fd
	r11Wle8PTmJMHyVJf5XJSy+F+SbCJgHBRSkB+DUOYFhz+tNaurXGv+qzgGQQqq+iuWWHOc4wfJX
	DbeJuN47Mq/i6IyzkEOy4WXklhHXHLhqQjpXn7+JLFn9fxzD5DjE3WGHREegIZ48+G+tb9eMeQt
	sR1sNahEALojAXBCg9S6P5BkzVnOED9eX7xiYDarzi5meXAw7Nj+nOAD6BUvDTXL6XpUogu3faN
	riXN+64wmS8ZXa8kmqBuudM1krpywNf5jO6dLQrO51nVA+dGgJ3VWxeNeE0jx+CHpusE/O0C/Ew
	YpTW4OlMEFaTR5PbCKE7jgnAnT+EThnipvWlMMp459P+CExTRD5COXJENKBjx8feJl2Az3LJPym
	YcS2uxk0DBGRl7Jx2bGjQsXDg/8ytF24JlpHh1azhii4y0hkCwVOWbh/hkytCE6/TSn9QGHQMJf
	J/gfKi6a60rDX5OOB3SUbX3CQvYd8joSRWD3mbxHpyWOjCoc1uair1266cKc2WyB2fHNFhk1tB7
	iyvW5/6bDVfjNIzDUYJARrwIyUhh4fF7AdEaKKNRIW4s9+odOAgLTMQnRQi1iAdWSdEk/YjarAc
	2UlP3e217tiHB8VNU9G+8d+3Q3O2mehxUr3cfMRFXvnimF71fYbgboYwiSPiH6Sr9V5OQ9xETV+
	NbNyU/9Fcy6xG7FmHp//nrbMo1p2vBfg3WInX9RkovrhJgVWRpDjL3zYICAZRIGjeu9nAmbu06x
	5l/V1ayBopLz2gRECxPODx0vbQkZ6ard6Yxg+5pQW1oYb4hxjws4vY2N9LS1Giq1DT5BVqxNbxw
	FrO8ZvEwPSH/AOCWEpDpiYPJ7Q==
X-Received: by 2002:a05:7022:ea57:b0:188:ea93:6cf9 with SMTP id a92af1059eb24-1b5031691a4mr7966500c88.43.1794787854980;
        Sun, 15 Nov 2026 16:10:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 13/16] android-tools: Fix native build with GCC 16
Date: Sun, 15 Nov 2026 16:10:35 -0800
Message-ID: <20261116001038.440763-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
References: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132394
Content-Type: text/plain; charset="utf-8"

zip_writer.h uses uint16_t and uint32_t without including <cstdint>.
GCC 16's libstdc++ no longer pulls it in through the other headers, so
the native build with a GCC 16 host compiler fails:

  zip_writer.h:81:5: error: 'uint16_t' does not name a type

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...hive-include-cstdint-in-zip_writer.h.patch | 32 +++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb     |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0016-libziparchive-include-cstdint-in-zip_writer.h.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0016-libziparchive-include-cstdint-in-zip_writer.h.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0016-libziparchive-include-cstdint-in-zip_writer.h.patch
new file mode 100644
index 0000000000..9cac1277e5
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0016-libziparchive-include-cstdint-in-zip_writer.h.patch
@@ -0,0 +1,32 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 15 Nov 2026 15:30:00 -0800
+Subject: [PATCH] libziparchive: include cstdint in zip_writer.h
+
+zip_writer.h uses uint16_t and uint32_t but relies on other headers to
+pull in their definitions. With GCC 16 libstdc++ they no longer do, and
+the native build fails:
+
+  zip_writer.h:81:5: error: 'uint16_t' does not name a type
+
+Include <cstdint> explicitly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ system/libziparchive/include/ziparchive/zip_writer.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/system/libziparchive/include/ziparchive/zip_writer.h b/system/libziparchive/include/ziparchive/zip_writer.h
+index 268e8b6..aca7f4e 100644
+--- a/system/libziparchive/include/ziparchive/zip_writer.h
++++ b/system/libziparchive/include/ziparchive/zip_writer.h
+@@ -16,6 +16,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <cstdio>
+ #include <ctime>
+ 
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index e9785ac235..be23faf10c 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -60,6 +60,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0013-adb-sysdeps-provide-pread64-pwrite64-lseek64-fallba.patch \
            file://0014-daemon-auth-vendor-a-portable-b64_pton-for-non-glib.patch \
            file://0015-adbd-make-fs-config-opt-in-on-non-android-builds.patch \
+           file://0016-libziparchive-include-cstdint-in-zip_writer.h.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
