Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.513.1588106065318635756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 13:34:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TzrhrARs;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: andrea.adami@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id z6so230332wml.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=e+NQb6Q+unH5o0iBOjdIeWJcrFz3bGdAr2Ogec8Sx+4=;
        b=TzrhrARsK32XCSOQT6VvpLlbSSRLUcBNXSS+sPIaeeh+3iK1JvC0o2JSX0ASPm1jqU
         kTH1ZgkgUKLjA8SDRNCvemyBkIVEttV9G2VDLa97a1UR9sO54vEFrciQ7dTtNEeuaYuz
         fhp+sXXhgivKSQw4bP3RLVXHzHH5Z5Eqymdss08XI0aa5zFKKKtZ5/SKJIPGEK10s0RB
         f7G7kc8bWl2uumMdSpITbcIRCG/qPX5Rf80L7xtA59g4YDuukEL8Q7VLQPnWu3m2ooWt
         SmcXnNfrJPo03MVqVW2SKna6+Wnv4gd3Z5hCoNC9qcYewyX8+BPsb63q4dZkENimOM35
         qKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=e+NQb6Q+unH5o0iBOjdIeWJcrFz3bGdAr2Ogec8Sx+4=;
        b=HLOFTWXYjCB3CMESYD0TE3iJQgG4mRcdwPIzN+6dgEDlqYV4beADhEJONb5EAdZm6x
         v9+EfsQAOg0SPTvd5G+OaPdnhF6fyue4kgRwQvWew+7PY1UXSwFAFk8kqaGaigFPcFNb
         N6LLTqI4K+ZJ+KhlpLcFNAeyL579jZkcwG+DUOSebjfOcuWIYl5OCq0YQcbhJGwSo85N
         uYluTtNxCb8VBIQfe5i4COn/b+laRmxUfakPuIf3LoAgAUvwJKfRCLDkq9rlyk1JqmKo
         F7tVYZVHdQzmFyiKrWi6d3Yb+LEs5ZTAFC0NJFftLN2LADmb6rXaocSMF6To2kMHCHJX
         5Ihw==
X-Gm-Message-State: AGi0PuaqkWwq7MgSysqLvNkafaNeRyWlF3e683yH+Jw7UTSbgmLdMl1p
	SxRB31QjVR5j1vhgI8u1XBU3RWW3
X-Google-Smtp-Source: APiQypIdK3x5VfN5N8bct/fzupCBAHdFWcGcJze9ysaEeulX+BDflb1k5iwYdZ93CoFriQyGQUppkw==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr7105985wmk.68.1588106062659;
        Tue, 28 Apr 2020 13:34:22 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host84-186-dynamic.249-95-r.retail.telecomitalia.it. [95.249.186.84])
        by smtp.googlemail.com with ESMTPSA id h137sm6513490wme.0.2020.04.28.13.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 13:34:22 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH v2 1/4] zaurusd: fix build with kernels < 4.16 and newer libc headers
Date: Tue, 28 Apr 2020 22:34:19 +0200
Message-Id: <20200428203419.1322-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

The Y2038 changes broke the build for older 32bit devices using
older kernels.

As seen on: https://sourceware.org/glibc/wiki/Y2038ProofnessDesign

Re-use the same fix applied for tslib as of commit
id 9201611 tslib: Fix build with 4.x kernel headers

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../zaurusd/zaurusd/64bit_time_t.patch        | 46 +++++++++++++++++++
 recipes-bsp/zaurusd/zaurusd_git.bb            |  5 +-
 2 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/zaurusd/zaurusd/64bit_time_t.patch

diff --git a/recipes-bsp/zaurusd/zaurusd/64bit_time_t.patch b/recipes-bsp/zaurusd/zaurusd/64bit_time_t.patch
new file mode 100644
index 0000000..a12c7bb
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/64bit_time_t.patch
@@ -0,0 +1,46 @@
+From e5bb568619c22d701e8fcd705563acbf7885f735 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Tue, 28 Apr 2020 21:21:29 +0200
+Subject: [PATCH] tskeys.c: fix build with kernels < 4.16 and newer libc
+ headers
+
+The Y2038 changes broke the build for legacy 32bit devices using
+older kernels.
+
+Upgrade the recipe to cope with the 64-bit time changes introduced in 4.16
+
+Fix:
+
+ tskeys.c: In function 'press_key':
+ tskeys.c:141:4: error: 'struct input_event' has no member named 'time'
+   141 |  ev.time.tv_sec = time(0);
+       |    ^
+ tskeys.c:142:4: error: 'struct input_event' has no member named 'time'
+   142 |  ev.time.tv_usec = 0;
+       |    ^
+
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ apps/tskeys/tskeys.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/apps/tskeys/tskeys.c b/apps/tskeys/tskeys.c
+index 264dfb7..0020012 100644
+--- a/apps/tskeys/tskeys.c
++++ b/apps/tskeys/tskeys.c
+@@ -21,6 +21,11 @@
+ 
+ #define MAX_OFFSCREEN_KEYS  20
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ struct rectangle {
+ 	int16_t x1;
+ 	int16_t y1;
+-- 
+2.17.1
+
diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
index d69805b..663ef1b 100644
--- a/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -24,8 +24,9 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://01-check-toggle-portait \
            file://use-ts-symlink-instead-of-hardcoding.diff \
            file://0001-zaurusd-add-support-for-collie.patch \
-           file://allow-newer-tslib.patch"
-
+           file://allow-newer-tslib.patch \
+           file://64bit_time_t.patch \
+"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

