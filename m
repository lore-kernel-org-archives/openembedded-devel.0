Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1099.1794332165815815509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 09:36:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wTmqE4r3;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so17648155e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 09:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794332164; x=1794936964; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/NrZgiHSP6/R5JxePo9fAMZ27Ga9vvB65xPyHltzlE=;
        b=wTmqE4r3vY5KvBjMRhjMIAOWxnnm1K1JwoKpZT0upGgqpgkGPDYniAymtwu427eJjg
         l2Q2D0BJSLIpVmqFKrvqeB37a/kIGHE/YCnqk9rVBrbvEss4MjfUtcDnUjjk3G6gdHuB
         xlLHfCRS0GXl31JD9QO8njnnqDiC5XcNOTJas5nPVS4738AXJfys3Y9szWhVMdyOyy+N
         PIhMCccJ2m52FrryrMivx342HjU0NTJg+yOj+FRqDERxbzCXCkik1VmJvZeGA4wO/q97
         6a5odRZDJdoTp45kftyyl4GFfq8PXz/M8cVJn5ljmw54TKuEIlUsEwfFXzGDTnhBlsDm
         AktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794332164; x=1794936964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/NrZgiHSP6/R5JxePo9fAMZ27Ga9vvB65xPyHltzlE=;
        b=LrPD1gla1w39f8Vd2/PoVZwUT0t+tTiYbRIUlr0yixs3lNeePCYEX8pYXlB9FEJ1Jp
         fR5WGTNSDLnQGFiBBwXvyI0ra20PmrzBS4LSqJJRarPcKHqpc3y0RmfMLFq+5/wBjvxo
         BD5DYIUErkf6Pfb9Bji+gAtzdTpU4KynZ6gbabY2Ft0tz/KJ2YbxI+K0qNZ1J8kkDHyh
         r9oiOLXjZLyISFlqyqwQfn1eDZPdFnHn2aPp4IKW+7JoWR1elCCB6vtFWw1WLo+OxA20
         8VqVq7kPUE0YbIa0iSqh8k1M7c6gSdsoK/NKJJn9r6yEWPIgatyGw1hVW7PZIacfv7yd
         FXWA==
X-Gm-Message-State: APuU4Z9KejVa8Dmfm4Ad9OYQKapczYBz3G47Wk4rsI/kX4n+VohU/Kmz
	aZpS/KYRPx2CkuSY4PMfAWFvw8GcH8FDaM6GgxcEBld6EctUHnc37ofQDekYzg==
X-Gm-Gg: AYBFou2C2jVAy4RuvSc8BmFy8f07iqn1kf66s8Xi7eWrk9fHnvXDGNDEjEim0ZJjsrk
	+JrnoiQU3HQd8LjS8BqLZiPR75HnsYnGEuvQEXLjbQ6q6YgwZY6FzwRrz7k3tUfbo6kyw7X9ry2
	SulPdwBD94acv8nG2WcU08gLIy3J378v6s5XkQofHFXajb1rObupIkLdSVYobICD0OcgJObWLJh
	x6rPp8Db8mFoVc8KnrwdGYFjBaT1TZ2rsJlrMuWzV/P9YoE2Xd5mIfvZtEq7QdLNQEcuzCe7r/y
	8AZkd4QEEFE8G0kKlKa8hg+AXVjPjZ8pOWm78h8dpKhCp11TZWrqDg5fLqgxYmzrm6hEQUI/kyu
	XIbBArdnl+8LbMEZEnEHkN0PDMbAmCxVG3OLZaG55SBgDfhLNTkWhJUInl0yHh3dGmAW0L6Ccb4
	6v7oMWPFF//XtgfD5KqvOL8YkQIroE1Pw6B1HfCTwy5omy2xq8VhnUEWPczJPmQkkZZTlPIR81Y
	prrv5+n3/xSog7a+lnba6wKp7rUZEbbDG2b0utd+2Zb51piwdPYDArleFkOZeZhIBULuW/BSCUN
	Zq4eDgW+dj8cA3GStGLUVUYCC9oN9kJnnlKkxQe7G0wMRYlCu5/ZOiwTXfxxkhilOy622pWt01A
	oQAo=
X-Received: by 2002:a05:600c:3e0f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ba0233d852mr56702045e9.5.1794332163958;
        Tue, 10 Nov 2026 09:36:03 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm122994405e9.11.2026.11.10.09.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:36:03 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 10 Nov 2026 17:35:38 +0000
Subject: [PATCH meta-oe 09/10] android-tools: adbd: keep root only while
 the build is debuggable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-android-tools-adbd-v1-9-cc2176f381c3@gmail.com>
References: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
In-Reply-To: <20261110-android-tools-adbd-v1-0-cc2176f381c3@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 17:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132106

adbd on Linux restarts as root whenever /run/adbd.root says so, without
asking whether the build is still debuggable. With debuggable-prop that
can change while the file survives, so honour it only while
__android_log_is_debuggable() is true.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...oot-on-Linux-only-while-the-build-is-debu.patch | 51 ++++++++++++++++++++++
 .../android-tools/android-tools_35.0.2.bb          |  1 +
 2 files changed, 52 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0024-adbd-keep-root-on-Linux-only-while-the-build-is-debu.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0024-adbd-keep-root-on-Linux-only-while-the-build-is-debu.patch
new file mode 100644
index 000000000000..f94bde14f3b1
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0024-adbd-keep-root-on-Linux-only-while-the-build-is-debu.patch
@@ -0,0 +1,51 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sat, 7 Nov 2026 16:00:25 +0000
+Subject: [PATCH] adbd: keep root on Linux only while the build is debuggable
+
+`adb root` is refused unless __android_log_is_debuggable(), but the root
+state it writes to /run/adbd.root is honoured on every restart without
+asking again. A unit that stops being debuggable while that file
+survives keeps a root adbd. Drop privileges whenever the build is not
+debuggable, whatever the file says; drop_privileges() then rewrites it
+as #NOROOT#.
+
+Without LIBLOG_DEBUGGABLE_PROP_FILES the build is always debuggable on
+Linux, so nothing changes.
+
+Upstream-Status: Pending
+
+AI-Generated: Claude Opus 5.5 (Claude Code)
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ packages/modules/adb/daemon/main.cpp | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
+index d309e235b947..9da530d18d27 100644
+--- a/packages/modules/adb/daemon/main.cpp
++++ b/packages/modules/adb/daemon/main.cpp
+@@ -40,9 +40,10 @@
+ #include <android-base/stringprintf.h>
+ #include <android-base/strings.h>
+ 
++#include <log/log_properties.h>
++
+ #if defined(__ANDROID__)
+ #include <libminijail.h>
+-#include <log/log_properties.h>
+ #include <scoped_minijail.h>
+ 
+ #include <private/android_filesystem_config.h>
+@@ -200,6 +201,11 @@ static void drop_privileges(int server_port) {
+ 
+ #if !defined(__ANDROID__)
+ static bool should_drop_privileges() {
++    // The root state file outlives the debuggable state that allowed it to be
++    // written, so only honour it while the build is still debuggable.
++    if (!__android_log_is_debuggable()) {
++        return true;
++    }
+     int f = unix_open(kAdbRootStatePath, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
+     if (f < 0) {
+         return true;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
index b17d92d6e9bb..2ecfbe49d146 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
@@ -68,6 +68,7 @@ SRC_URI = "https://deb.debian.org/debian/pool/main/a/android-platform-tools/andr
            file://0021-liblog-optionally-read-ro.debuggable-from-build.prop.patch \
            file://0022-adbd-optionally-require-authorization-unless-the-bui.patch \
            file://0023-libadbd_auth-optionally-take-the-trusted-key-paths-a.patch \
+           file://0024-adbd-keep-root-on-Linux-only-while-the-build-is-debu.patch \
            "
 
 SRC_URI[orig.md5sum] = "352376965cdef7bd7505d8fefdd43d50"

-- 
2.43.0

