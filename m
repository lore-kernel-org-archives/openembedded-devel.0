Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536D1CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 16:21:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1659.1781626856526476388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 09:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=BQ+WPAA+;
 spf=pass (domain: snapchat.com, ip: 209.85.128.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso501235e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 09:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1781626854; x=1782231654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJlcdW5BK4y2qvQKdLiPziMSp2tX3C3QkFu20vQobek=;
        b=BQ+WPAA+M22nnBsIZro4yeDRmL1H3zaK+/xY283mD5NSZyOGAsIE/b9gDMUrMg717o
         kC19Vb01wJ99d2gizjmnOC88TFWdOw/NIWLp/Yl+QVzZnnBcOqzYk1+r1wHrJcFp4Bei
         MV4QsJtdjEF4Qh0WTIqK3j47DM8VGi2Gqqp1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626854; x=1782231654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJlcdW5BK4y2qvQKdLiPziMSp2tX3C3QkFu20vQobek=;
        b=ZFogBQIAMCjAlqwkXGSg9bYaTgREIcnenhxW2eKuRu2/9sSf+q7kocpHqtWF7kbsVg
         HXjpJ7cOFpT46rDQrQqjkmNagI6v1vWBR/hBpZBkeO3djeEpVzCkXcDX44kPGNZbHGic
         BB5fqq8gBYg6AG2hpJWAA3FxMfuRCQ8Ss3Ofzy9a+o8dyai64NXjxz8Osk1W0E1Tv+2k
         wFAKpjcMNlt6JA32my95EOn6fQ14+B9cKkmJjzfej6fpnbveOpgwTlPnx6+fuPmVmxIK
         2avdaj8tbstmQkwyir7t4VCGNCGY0T3znTh6+bBpLngFl6s62m7w5wE8tX0wjpDmm/6w
         ShzA==
X-Gm-Message-State: AOJu0YwjbkDfk4wj9PQpvM4O4+zQMq+dveZE+YXTeFalZMFCWACJb6ZZ
	8+tGfHcdpYq7ug7DPZjwQxVVqF6VofCXTj6zBIVKzUQfO12wOtCYsxDQoVD0zMzEpRcv6Quv//Z
	iX++wHaI=
X-Gm-Gg: Acq92OFmEw+MJvkPSDu1d1ty0IKUxCg2dmWowv2d78sQvDJK6U6anMCZh2IUmI5Fi6n
	LnXg5cuGTocmpWluAF26UytBkTv+GSKYzmTD65Wlp/3ZGSWaJcrZ3FwmmyBGrt+FYhkFg2mdIwc
	iuZZlIuRIy+d0L0Kh1aSxfFflVB7CTsijAeuFGBtOZLVwaxuyfTwyh1kFtodbdL3ZCItOfL/57+
	YdY5TATfhVwKb67dhCmsCYZrEb12rZvnpLx9y6ftF6+NlHzU2bzehqlT7b4Pnp+Yn06c+48R64e
	xO1CinKCSiS4EXTuPv0CHJXjMIBkc0TlRJ1pTYNUc1snnQYXc9Ymyr8MunD21q8+mTlbx03Hyos
	QDoOk0SQyJiKHIg6J6syBr0H8OwFRCOzhl5an1wDc9NIbKhVQ33PvSWvEQOsgA9QCsVJ3akZKq9
	sRNIaudzrFlQV+ptHTCxAWwVqSWi8wDRp2aX1FMCPs9sVXoiZNBo2VDTLjW9a659Vysog=
X-Received: by 2002:a05:600d:84ca:10b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-492332c153fmr4059525e9.3.1781626854246;
        Tue, 16 Jun 2026 09:20:54 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4601esm81088775e9.1.2026.06.16.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:20:53 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-devel@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [meta-oe][PATCH] android-tools: make patch more secure
Date: Tue, 16 Jun 2026 18:20:46 +0200
Message-ID: <20260616162047.4189896-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 16:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127624

From: Etienne Cordonnier <ecordonnier@snap.com>

The patch was creating the file /run/.adb.root with read-write permission for "other",
so any user was able to write to it.

Make the file owned by user adb, and remove permissions for group and other.

Before:
```
root@raspberrypi4-64:~# ls -l /run/.adb.root
-rw-rw-rw- 1 root root 8 Mar 13 15:42 /run/.adb.root
```

After:
```
root@raspberrypi4-64:~# ls -l /run/adb.root
-rw------- 1 adb adb 8 Mar 13 15:35 /run/adb.root
```

Also rename the file from .adbd.root to adbd.root, since hidden files are
not the convention in /run

AI-Generated: Uses GitHub Copilot (Claude Sonnet 4.6)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 ...adbd-enable-root-and-remount-support.patch | 43 ++++++++++---------
 ...d_notify-conditional-on-HAVE_SYSTEMD.patch |  6 +--
 2 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch
index 700e64f06d..2137297d33 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0006-adbd-enable-root-and-remount-support.patch
@@ -1,4 +1,4 @@
-From d247444cf5ef0c8ee2fcf207febe09f5101c2215 Mon Sep 17 00:00:00 2001
+From 93dd48b34815a8c2f67058da73b5ca23ea9763e8 Mon Sep 17 00:00:00 2001
 From: Mihajlo Marinkovic <mmarinkovic@snap.com>
 Date: Fri, 29 May 2026 12:10:00 +0200
 Subject: [PATCH] adbd: enable root and remount support
@@ -11,13 +11,13 @@ Signed-off-by: Mihajlo Marinkovic <mmarinkovic@snap.com>
 ---
  debian/system/adbd.mk                         |  3 +
  .../modules/adb/daemon/framebuffer_service.h  |  2 +-
- packages/modules/adb/daemon/main.cpp          | 93 +++++++++++++++----
+ packages/modules/adb/daemon/main.cpp          | 96 +++++++++++++++----
  .../modules/adb/daemon/restart_service.cpp    | 40 +++++++-
  packages/modules/adb/daemon/restart_service.h |  2 +-
  packages/modules/adb/daemon/services.cpp      | 81 ++++++++++++++--
  packages/modules/adb/sockets.cpp              | 20 +++-
  packages/modules/adb/transport.cpp            |  1 -
- 8 files changed, 204 insertions(+), 38 deletions(-)
+ 8 files changed, 207 insertions(+), 38 deletions(-)
 
 diff --git a/debian/system/adbd.mk b/debian/system/adbd.mk
 index 73e49a4..beb412e 100644
@@ -53,7 +53,7 @@ index bab44be..0a8c822 100644
  void framebuffer_service(unique_fd fd);
  #endif
 diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
-index 83905d3..f177abf 100644
+index 83905d3..0b4a909 100644
 --- a/packages/modules/adb/daemon/main.cpp
 +++ b/packages/modules/adb/daemon/main.cpp
 @@ -19,11 +19,15 @@
@@ -77,7 +77,7 @@ index 83905d3..f177abf 100644
  #include "daemon/watchdog.h"
  
 +namespace {
-+constexpr char kAdbRootStatePath[] = "/run/.adb.root";
++constexpr char kAdbRootStatePath[] = "/run/adbd.root";
 +constexpr char kRootMagic[] = "#ROOT#";
 +constexpr char kNoRootMagic[] = "#NOROOT#";
 +constexpr size_t kRootMagicSize = sizeof(kRootMagic) - 1;
@@ -102,7 +102,7 @@ index 83905d3..f177abf 100644
 -    bool adb_unroot = (prop == "0");
 -    if (ro_debuggable && adb_root) {
 -        drop = false;
-+    int f = unix_open(kAdbRootStatePath, O_RDONLY | O_CLOEXEC);
++    int f = unix_open(kAdbRootStatePath, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
 +    if (f < 0) {
 +        return true;
      }
@@ -123,9 +123,9 @@ index 83905d3..f177abf 100644
      // Don't listen on a port (default 5037) if running in secure mode.
      // Don't run as root if running in secure mode.
      if (should_drop_privileges()) {
-+        int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_CLOEXEC, 0666);
++        int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_CLOEXEC | O_NOFOLLOW, 0600);
 +        if (f >= 0) {
-+            if (fchmod(f, 0666) == -1) {
++            if (fchmod(f, 0600) == -1) {
 +                PLOG(ERROR) << "failed to set root state permissions";
 +            }
 +            if (unix_write(f, kNoRootMagic, sizeof(kNoRootMagic) - 1) == -1) {
@@ -137,13 +137,13 @@ index 83905d3..f177abf 100644
          const bool should_drop_caps = !__android_log_is_debuggable();
  
          if (should_drop_caps) {
-@@ -182,6 +196,51 @@ static void drop_privileges(int server_port) {
+@@ -182,6 +196,54 @@ static void drop_privileges(int server_port) {
  }
  #endif
  
 +#if !defined(__ANDROID__)
 +static bool should_drop_privileges() {
-+    int f = unix_open(kAdbRootStatePath, O_RDONLY | O_CLOEXEC);
++    int f = unix_open(kAdbRootStatePath, O_RDONLY | O_CLOEXEC | O_NOFOLLOW);
 +    if (f < 0) {
 +        return true;
 +    }
@@ -160,20 +160,23 @@ index 83905d3..f177abf 100644
 +    if (!should_drop_privileges()) {
 +        return;
 +    }
-+    int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_CLOEXEC, 0666);
++    passwd* adb_user = getpwnam("adb");
++    if (adb_user == nullptr) {
++        PLOG(FATAL) << "getpwnam(adb) failed";
++    }
++    int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_CLOEXEC | O_NOFOLLOW, 0600);
 +    if (f >= 0) {
-+        if (fchmod(f, 0666) == -1) {
++        if (fchmod(f, 0600) == -1) {
 +            PLOG(ERROR) << "failed to set root state permissions";
 +        }
++        if (fchown(f, adb_user->pw_uid, adb_user->pw_gid) == -1) {
++            PLOG(ERROR) << "failed to set root state ownership";
++        }
 +        if (unix_write(f, kNoRootMagic, sizeof(kNoRootMagic) - 1) == -1) {
 +            PLOG(ERROR) << "failed to initialize root state";
 +        }
 +        unix_close(f);
 +    }
-+    passwd* adb_user = getpwnam("adb");
-+    if (adb_user == nullptr) {
-+        PLOG(FATAL) << "getpwnam(adb) failed";
-+    }
 +    if (initgroups(adb_user->pw_name, adb_user->pw_gid) != 0) {
 +        PLOG(FATAL) << "initgroups(adb) failed";
 +    }
@@ -189,7 +192,7 @@ index 83905d3..f177abf 100644
  static void setup_adb(const std::vector<std::string>& addrs) {
  #if defined(__ANDROID__)
      // Get the first valid port from addrs and setup mDNS.
-@@ -242,9 +301,7 @@ int adbd_main(int server_port) {
+@@ -242,9 +304,7 @@ int adbd_main(int server_port) {
            " unchanged.\n");
      }
  
@@ -200,7 +203,7 @@ index 83905d3..f177abf 100644
  #if defined(__ANDROID__)
      // A thread gets spawned as a side-effect of initializing the watchdog, so it needs to happen
 diff --git a/packages/modules/adb/daemon/restart_service.cpp b/packages/modules/adb/daemon/restart_service.cpp
-index 16d2627..fcba9c8 100644
+index 16d2627..8aee1af 100644
 --- a/packages/modules/adb/daemon/restart_service.cpp
 +++ b/packages/modules/adb/daemon/restart_service.cpp
 @@ -18,6 +18,9 @@
@@ -218,13 +221,13 @@ index 16d2627..fcba9c8 100644
  #include "adb_unique_fd.h"
  
 +namespace {
-+constexpr char kAdbRootStatePath[] = "/run/.adb.root";
++constexpr char kAdbRootStatePath[] = "/run/adbd.root";
 +constexpr char kRootMagic[] = "#ROOT#";
 +constexpr char kNoRootMagic[] = "#NOROOT#";
 +constexpr size_t kRootMagicSize = sizeof(kRootMagic) - 1;
 +
 +bool write_root_state(const char* value, size_t size) {
-+    int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC, 0666);
++    int f = unix_open(kAdbRootStatePath, O_WRONLY | O_CREAT | O_TRUNC | O_CLOEXEC | O_NOFOLLOW, 0600);
 +    if (f < 0) {
 +        return false;
 +    }
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch
index a8c16a41d4..971961476f 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/0010-adbd-make-systemd-sd_notify-conditional-on-HAVE_SYSTEMD.patch
@@ -1,4 +1,4 @@
-From 8874be8b9a3906c5720d75320b176b51523b6c15 Mon Sep 17 00:00:00 2001
+From c5f5f6c1a5de768e3559fb0b261065f1766ac3c3 Mon Sep 17 00:00:00 2001
 From: Etienne Cordonnier <ecordonnier@snap.com>
 Date: Fri, 12 Jun 2026 15:54:47 +0200
 Subject: [PATCH] adbd: make systemd sd_notify conditional on HAVE_SYSTEMD
@@ -31,7 +31,7 @@ index e755f20..a3f88f1 100644
    debian/out/system/libadb.a \
    debian/out/system/libcrypto_utils.a \
 diff --git a/packages/modules/adb/daemon/main.cpp b/packages/modules/adb/daemon/main.cpp
-index f177abf..789c25b 100644
+index 0b4a909..ac37461 100644
 --- a/packages/modules/adb/daemon/main.cpp
 +++ b/packages/modules/adb/daemon/main.cpp
 @@ -49,7 +49,7 @@
@@ -43,7 +43,7 @@ index f177abf..789c25b 100644
  #include <systemd/sd-daemon.h>
  #endif
  
-@@ -365,7 +365,7 @@ int adbd_main(int server_port) {
+@@ -368,7 +368,7 @@ int adbd_main(int server_port) {
      init_jdwp();
      D("adbd_main(): post init_jdwp()");
  
-- 
2.43.0


