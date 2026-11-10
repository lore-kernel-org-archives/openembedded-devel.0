Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1079.1794332162479716475
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:36:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AuE+KqkX;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so21659635e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332161; x=1794936961; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vuhg8gcWyHZ/J3+GUIlfM0bdYOXTiVMVbpbblTsMXtw=;
        b=AuE+KqkXn2joEnT1BbNsx7otJnJNiL8v6e4KivHqLcRmlE9b8GMbzlBcoNPJhuWWus
         tUXLtEA+njabWAapTE46bqkSwUS6t9zANZ6XkvYTjFj0VEB+NttGNtrhwKIW4+Lnhmb7
         dRMHrqdCJjzJtswEB7oKQ+yXQTen4WVae7fxdnjx1W4eFZ6xrnkv3sRkdwZ+oZ1cCtn6
         sO0j5bQ2FOuaIJgSAkXN+Ba0uEYVURm1OEPIVbEB4MPxbQxXBQtLdUA0NPQN+EI7tCgV
         dp0608FgSu2QZVwVH1/ZSnlvfsn6WqeeGKtZGloSHsIpjpYE4mHuqfnQ0MrGoIx5CkQS
         7AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332161; x=1794936961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vuhg8gcWyHZ/J3+GUIlfM0bdYOXTiVMVbpbblTsMXtw=;
        b=blrMzUHj+a1Km2WvqbcFGTPyeK1F7o8uG5KkEORh7s7u1kU4joMPue1qStvgkqL52y
         GZWrsIQ1+F9SypAsU7fuEOvWG3z5BJKuyE/F5g8ZlDdROQvBKvZ5gHikQqlwXf+jBxCF
         Oa6YKwa7VNYr7XR1exvD/ZpLYcZ5bUi40H1EIfTRnxuLCytUJOoJzMaWRzV1eHc1tEcM
         BAAD/ImbEimmicSpYwlsxJLkybIkbifT3lryEd7PERfnowxiVAYRFR0b03/SL7h8X+4c
         /xtzjE8X0HsxWnIrcQQxHhEnnLYl2hmKZnxqMCBlrL5yM6vFs0r3OTHMR1lVF1YhrAkH
         S9iw==
X-Gm-Message-State: APuU4Z8+2bz6wOlz/RXXAxsMqKVI0rGV6N8WGI8kqhUyzSWYuRKNQvIp
	sz0hHxz2h+MsRLUPdsZi6cWGG5IPeo8vohrbZOXrmZDc+lUgh4ZcPbb8LQFEAA==
X-Gm-Gg: AYBFou3MGqfJ74z8sTUPvpHuoml1iZ/fahCLJ1e+L8kxSlr/f40R2MrwbmGUCfLCF7g
	2Ch5un3W7s6fSNme0xMtZ7Wy2/kAYei6X8LYhBVkmiiGBtY/Xl44etBs9KWKJb9KxlWMz2q4wNN
	VZOGqhz724Hu/QE2PsCkfVK0e6Qybta1qYAzj6COeKCOfevccS8BtbHY9Js+Cqlp/D+sudwsLrY
	2K7CIwaxk3iJ3VDsypZob82zHGNaSjOyRyK+/Lz9EJu7Pn2Z4MgcwpqUFPJxpnW1UnZlLIuNjwr
	UIywuMPt3AZVnfSdZXq/2pMCTddYGWVJqIFccS+2VrpxJAZ0WRyJVLuWrJMQ0axIZepBBhqKMZl
	WgQL06S6b029TULPO4TO/byBM+N5wPkqDCSzK5rssp0HWcTLapD8YtdxtnLrOnG3zsm7AqOIwpQ
	gXSEVYMT7TvZo+u0OHkzB2b6YQMp4a+63LsDPEbB3qS20MMMCvw15HzUJgVD5/PNlwFtlSq6vng
	MXLo/2HDQh3QPUO+x3Ee29hPPKAvJVAkabhXKrkkboWubQyZGjggGmjLLxxWAmlqbOKdMdcfC3z
	vvgLZANJvgMGgySHpNoLjscPvhsNWBqbEQ6fxN7DSRLfK29KNLgZO0WZ/wA9yfN2S8cank8bcT2
	EUuf4
X-Received: by 2002:a05:600c:3486:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ba023418ddmr60401035e9.17.1794332160611;
        Tue, 10 Nov 2026 09:36:00 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:35:59 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:35 +0000
Subject: [PATCH meta-oe 06/10] android-tools: add PACKAGECONFIG
 debuggable-prop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-6-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132103

The non-Android liblog says every build is debuggable, so adbd allows
`adb root` and the root: service everywhere. With debuggable-prop, liblog
reads ro.debuggable from the build.prop-style files in
ADB_DEBUGGABLE_PROP_FILES (default ${sysconfdir}/build.prop), and the build
is debuggable only if one of them sets it to 1.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...onally-read-ro.debuggable-from-build.prop.patch | 117 +++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |   9 +-
 2 files changed, 125 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0021-liblog-optionally-read-ro.debuggable-from-build.prop.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0021-liblog-optionally-read-ro.debuggable-from-build.prop.patch
new file mode 100644
index 000000000000..6cf4f9c8583e
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0021-liblog-optionally-read-ro.debuggable-from-build.prop.patch
@@ -0,0 +1,117 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Fri, 6 Nov 2026 09:38:18 +0000
+Subject: [PATCH] liblog: optionally read ro.debuggable from build.prop-style
+ files
+
+The non-Android stub of __android_log_is_debuggable() returns 1, so on a
+Linux adbd every build is debuggable: `adb root` and the root: service are
+always allowed, and nothing can tell a development image from a production
+one.
+
+When LIBLOG_DEBUGGABLE_PROP_FILES is passed to make - a colon-separated
+list of build.prop-style files - read ro.debuggable from them instead. The build is
+debuggable if any of them has "ro.debuggable=1", and not otherwise,
+including when none of them exists. The files are read on each call rather
+than latched, so one written after the process started (a runtime unlock on
+tmpfs, say) takes effect without a restart.
+
+Without the define nothing changes.
+
+Upstream-Status: Pending
+
+AI-Generated: Claude Opus 5.5 (Claude Code)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ debian/system/liblog.mk              |  4 +++
+ system/logging/liblog/properties.cpp | 52 ++++++++++++++++++++++++++++
+ 2 files changed, 56 insertions(+)
+
+diff --git a/debian/system/liblog.mk b/debian/system/liblog.mk
+index 091ccad19c3a..89027bcebacf 100644
+--- a/debian/system/liblog.mk
++++ b/debian/system/liblog.mk
+@@ -26,6 +26,10 @@ CPPFLAGS += \
+   -Isystem/libbase/include \
+   -Isystem/logging/liblog/include \
+ 
++ifneq ($(LIBLOG_DEBUGGABLE_PROP_FILES),)
++CPPFLAGS += -DLIBLOG_DEBUGGABLE_PROP_FILES='"$(LIBLOG_DEBUGGABLE_PROP_FILES)"'
++endif
++
+ LDFLAGS += \
+   -Wl,-rpath='$$ORIGIN' \
+   -Wl,-soname,$(NAME).so.0 \
+diff --git a/system/logging/liblog/properties.cpp b/system/logging/liblog/properties.cpp
+index 657901a34e44..f069ebc4eb22 100644
+--- a/system/logging/liblog/properties.cpp
++++ b/system/logging/liblog/properties.cpp
+@@ -17,7 +17,9 @@
+ #include <log/log_properties.h>
+ 
+ #include <ctype.h>
++#include <limits.h>
+ #include <pthread.h>
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
+@@ -311,8 +313,58 @@ int __android_log_is_loggable_len(int prio, const char*, size_t, int def) {
+   return __android_log_is_loggable(prio, nullptr, def);
+ }
+ 
++#if defined(LIBLOG_DEBUGGABLE_PROP_FILES)
++// True only if the build.prop-style file at path has the line "<key>=1".
++// Anything else, including the file being absent or unreadable, is false.
++static bool prop_file_is_true(const char* path, size_t pathlen, const char* key) {
++  char buf[PATH_MAX];
++  if (pathlen == 0 || pathlen >= sizeof(buf)) {
++    return false;
++  }
++  memcpy(buf, path, pathlen);
++  buf[pathlen] = '\0';
++  FILE* f = fopen(buf, "re");
++  if (f == nullptr) {
++    return false;
++  }
++  const size_t keylen = strlen(key);
++  char line[256];
++  bool value = false;
++  while (fgets(line, sizeof(line), f) != nullptr) {
++    if (strncmp(line, key, keylen) == 0 && line[keylen] == '=') {
++      const char* v = line + keylen + 1;
++      value = v[0] == '1' && (v[1] == '\0' || v[1] == '\n' || v[1] == '\r');
++      break;
++    }
++  }
++  fclose(f);
++  return value;
++}
++#endif
++
+ int __android_log_is_debuggable() {
++#if defined(LIBLOG_DEBUGGABLE_PROP_FILES)
++  // There is no property service off Android. Read ro.debuggable from a
++  // colon-separated list of build.prop-style files instead, and treat the
++  // build as debuggable if any of them sets it to 1; absent all of them, it is
++  // not. Read on every call, not latched: a file may be written after the
++  // process starts, and the callers are occasional.
++  const char* paths = LIBLOG_DEBUGGABLE_PROP_FILES;
++  while (*paths != '\0') {
++    const char* end = strchr(paths, ':');
++    const size_t len = end != nullptr ? static_cast<size_t>(end - paths) : strlen(paths);
++    if (prop_file_is_true(paths, len, "ro.debuggable")) {
++      return 1;
++    }
++    if (end == nullptr) {
++      break;
++    }
++    paths = end + 1;
++  }
++  return 0;
++#else
+   return 1;
++#endif
+ }
+ 
+ int __android_log_security() {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index f5ab21262ce5..d3d60b514721 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -65,6 +65,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0018-adbd-do-not-use-pthread_kill-as-a-thread-liveness-pr.patch \
            file://0019-adb-daemon-exit-after-adb-root-unroot-so-an-init-sup.patch \
            file://0020-adbd-signal-readiness-once-functionfs-is-serviced.patch \
+           file://0021-liblog-optionally-read-ro.debuggable-from-build.prop.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"
@@ -208,7 +209,8 @@ do_compile() {
     # Debian replaces Android's Soong build system with hand-written GNU make
     # fragments under debian/system/ and debian/external/.
     for tool in ${PREREQUISITE_core}; do
-        oe_runmake -f ${S}/debian/system/${tool}.mk -C ${S}
+        oe_runmake -f ${S}/debian/system/${tool}.mk -C ${S} \
+            ${@'LIBLOG_DEBUGGABLE_PROP_FILES=' + d.getVar('ADB_DEBUGGABLE_PROP_FILES') if bb.utils.contains('PACKAGECONFIG', 'debuggable-prop', True, False, d) else ''}
     done
 
     if echo " ${TOOLS_TO_BUILD} " | grep -q " fastboot "; then
@@ -266,8 +268,13 @@ FILES:${PN}-adbd = " \
 BBCLASSEXTEND = "native"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+ADB_DEBUGGABLE_PROP_FILES ?= "${sysconfdir}/build.prop"
 # Apply Android's fs_config ownership/mode tables to files pushed by adbd to
 # /system, /vendor and /oem. Off by default: the tables describe Android
 # partition images and are meaningless on a generic Linux rootfs.
 PACKAGECONFIG[fs-config] = ""
+# Read ro.debuggable from ADB_DEBUGGABLE_PROP_FILES (colon-separated,
+# build.prop format), so `adb root` is refused unless one of them sets
+# ro.debuggable=1. Off by default: every build is debuggable.
+PACKAGECONFIG[debuggable-prop] = ""
 PACKAGECONFIG[systemd] = ",,systemd"

-- 
2.43.0

