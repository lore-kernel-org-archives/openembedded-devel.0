Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.24346.1620596741747940113
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 May 2021 14:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B5Cdvmbb;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id c17so12260463pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 May 2021 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=siYGGJdI60Y9vUuyi2GbDZMURY+l8/Ly+3ielPgjOcs=;
        b=B5CdvmbbyQgBWaFn++SQ9OJHI/oGdGdMTP6c8pDMMI5IGbqxb7jIzd3IWKSolYi9GY
         BB5vRFbSoUaz/4kUiDG14RgyE8pq9OaRepW3SYyPS/0dg94y1qGNhGo0diU+2xsT+8iP
         zs5gZIwAo/t3gmdhhRQ6Jo+Adyxd96939KUDyxRb2UkWoqK3HIY7gbjZUiasdA53avFL
         eFC6zxNFqoOugVaEVWMroyFMN6NUfFXkhk7c4VBbKMYOV0BlZ2rd9MFW7+vf9FZbXK3U
         rMr9On+D29A9yKPeUbLqFJdm5r/PORaoYUGdUQrCh6jnBOK/Mh9AvaIil4ignOiUtamu
         PCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=siYGGJdI60Y9vUuyi2GbDZMURY+l8/Ly+3ielPgjOcs=;
        b=M/KXmmaU8ekKkGUhaX4n5fMvf/kmQ0sAzFcnjqhioAi3ms1RHg4neJ3f105sqpl13A
         JrRcqVG7qo6mSvjFZYKbyFq3CdngrTCDEIAYOFOD25qkD4Jjo0G4wfkd7EVqsn10Hhz2
         7vBid2g9YhTqs0lIpBDwlOYpxpC+co1R2x2FOQBt1prBHByc+CFBlFLNeK4n8Oaisz9U
         WkxZqD9dv5KuHDppKVnP5/25jAKI7BId2w84sZ2KEKaErS+CAXPgtOFkNdEL/XMMFZHM
         lImWVSvRBbPQUL13rjmFV5Se0iEEVdyr8f5paasXPZyluTzkaSBAgpHsllyGfQV4kz+R
         Qm4w==
X-Gm-Message-State: AOAM530rn757VdAQOfnyvR3Rv7jRqe9r6mWK7drrn87HbYcnHIpYj6EC
	i/QmDf9/EDHMHI/ShQfSHaU0fu0rTodxMA==
X-Google-Smtp-Source: ABdhPJytNIEG5+Hv/2sGc0eYMKSAsH0fbhleE8IQ/Fx3tiopUvqf6Ezgdm20XAWe1Nk53BUV7eUFAA==
X-Received: by 2002:a63:6486:: with SMTP id y128mr21675594pgb.414.1620596740862;
        Sun, 09 May 2021 14:45:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id f24sm10002770pfk.45.2021.05.09.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 14:45:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minicoredumper: Replace pthread_mutexattr_setrobust_np with pthread_mutexattr_setrobust
Date: Sun,  9 May 2021 14:45:37 -0700
Message-Id: <20210509214537.1536077-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused patch 0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nitialize-pointer-to-config-struct-t.patch | 29 ----------------
 ...mutexattr_setrobust_np-with-pthread_.patch | 33 +++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.1.bb    |  1 +
 3 files changed, 34 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch
deleted file mode 100644
index ad255fae06..0000000000
--- a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6181d9c3c407ee030b4c3a94045318b9e3a3cc89 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 25 Jul 2017 14:08:54 -0700
-Subject: [PATCH] minicoredumper: Initialize pointer to config struct to null
-
-Fixes
-corestripper.c:3632:13: error: variable 'cfg' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/minicoredumper/corestripper.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
-index a764073..ddb0d25 100644
---- a/src/minicoredumper/corestripper.c
-+++ b/src/minicoredumper/corestripper.c
-@@ -3605,7 +3605,7 @@ out:
- 
- static int do_all_dumps(struct dump_info *di, int argc, char *argv[])
- {
--	struct config *cfg;
-+	struct config *cfg = 0;
- 	const char *recept;
- 	bool live_dumper;
- 	char *comm_base;
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch
new file mode 100644
index 0000000000..455e6f3181
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch
@@ -0,0 +1,33 @@
+From 5895caba6573e84f73f159d9e84cd1aa7e969f18 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 May 2021 14:37:00 -0700
+Subject: [PATCH] replace pthread_mutexattr_setrobust_np with
+ pthread_mutexattr_setrobust
+
+This is now part of standard POSIX function [1]
+
+Upstream-Status: Submitted [https://github.com/diamon/minicoredumper/pull/3]
+
+[1] https://man7.org/linux/man-pages/man3/pthread_mutexattr_setrobust_np.3.html
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/minicoredumper_regd/daemon.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/minicoredumper_regd/daemon.c b/src/minicoredumper_regd/daemon.c
+index 115ec92..b9ad1ea 100644
+--- a/src/minicoredumper_regd/daemon.c
++++ b/src/minicoredumper_regd/daemon.c
+@@ -224,7 +224,7 @@ static int setup_shm(void)
+ 
+ 	pthread_mutexattr_init(&attr);
+ 	pthread_mutexattr_setprotocol(&attr, PTHREAD_PRIO_INHERIT);
+-	pthread_mutexattr_setrobust_np(&attr, PTHREAD_MUTEX_ROBUST_NP);
++	pthread_mutexattr_setrobust(&attr, PTHREAD_MUTEX_ROBUST);
+ 	pthread_mutexattr_setpshared(&attr, PTHREAD_PROCESS_SHARED);
+ 	pthread_mutex_init(&sh->m, &attr);
+ 
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index d381c83ae8..6a04e78919 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -14,6 +14,7 @@ SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
 PR .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https \
+           file://0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch \
            file://minicoredumper.service \
            file://minicoredumper.init \
            "
-- 
2.31.1

