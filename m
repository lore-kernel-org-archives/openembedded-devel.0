Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.21183.1610905595540375252
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PKdLXXfx;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id e9so3190632plh.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fhndMOZ5PuTgb7PmZ+Du8HsUJwd8yQgzLnsH4DOzxBE=;
        b=PKdLXXfxZE8fK806cdYPsGBmygcF3KNZcZmy5TUNnFMjon/3rrOPB+vVjarHHoP1vH
         4aznfDvHXohz1Vu4HGdMpUCnqzyrmNpSOluRJaW7neUUh6NA54IUNWXGOn4wOVaurs6/
         4jCRYdDlXRgFW9NTzhU/sZNoBEwAdkAgLEQYcmo73Es3yVwO2jenNSmJd5ZNUGLO6OIO
         215ClvBoghp1dg1H8r3RPRgWBX0/NQaQJ8dJv9QWjybsrw+yW1SvAMrUaywIM5mqu/Z1
         DfA0/WvP2+V5FUDduZEjx7GtYu+QdtXpapfBV87NnTTlv5VIZYLdJo/tIa9kWSYfcBbQ
         h30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fhndMOZ5PuTgb7PmZ+Du8HsUJwd8yQgzLnsH4DOzxBE=;
        b=byWxDemUqvBvDoIXuqmI7KA81aoXyUFEFTmguUz3/kLXRNxDQJWXY8MnM9NqOHSQBF
         Q4Opk4+/AgA4Nbztg0wDK01X968IFQHTvpg7/KOMfieEdn6EXYnFnAC8ZcULn8cvwJTI
         bQ1jRFQITKKAZbwGF6cv5ovWZqgF9euLkoaE8sX/2EsuiO55cMEkgEGzb2SV3aoNg4FJ
         /NMuW6T8cxpHbZp3oIC1qxSp0WeZv8PlHl5wy03U3LavORsozx3UXtClnpBxX1xHdU3o
         X8DALj3TJan4J+JBT0Y9H/3w5Eg1JmvuVqu8L/bxHVIyZsxMB+HFaHNUIh/L2SiKOnzJ
         Xx6Q==
X-Gm-Message-State: AOAM531ReU2npDVSzOM+rx1ymB8d9OJqDfYrgfpikTkQq03xZ/j0r3MY
	tvwa0/HY4qbm2zDF/20ts4VyIvQMJwEHZg==
X-Google-Smtp-Source: ABdhPJwthT5CQChgZLmFsTQm5pT4q3Lk1vOpNIvL5cUd0ZIEfhB+hDCQyyWXatC7ugJ+bSo2dvP1pQ==
X-Received: by 2002:a17:90a:9318:: with SMTP id p24mr8271776pjo.123.1610905594967;
        Sun, 17 Jan 2021 09:46:34 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:34 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/28] wireguard-module: fix build issue with 5.4 kernel
Date: Sun, 17 Jan 2021 09:46:02 -0800
Message-Id: <c70dcb9bd1fb47b0b09afdc812cbd3aa3ad14bc9.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

 /tmp/work/qemux86_64-poky-linux/wireguard-module/1.0.20200401-r0/git/src/compat/compat-asm.h:44: warning: "SYM_FUNC_START" redefined
|    44 | #define SYM_FUNC_START ENTRY
|       |
| In file included from /tmp/work/qemux86_64-poky-linux/wireguard-module/1.0.20200401-r0/git/src/compat/compat-asm.h:9,
|                  from <command-line>:
| /tmp/work-shared/qemux86-64/kernel-source/include/linux/linkage.h:218: note: this is the location of the previous definition
|   218 | #define SYM_FUNC_START(name)    \
|       |
| In file included from <command-line>:
| /tmp/work/qemux86_64-poky-linux/wireguard-module/1.0.20200401-r0/git/src/compat/compat-asm.h:45: warning: "SYM_FUNC_END" redefined
|    45 | #define SYM_FUNC_END ENDPROC
|       |

Backporit fix from upstream

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...NC_-START-END-were-backported-to-5.4.patch | 29 +++++++++++++++++++
 .../wireguard-module_1.0.20200401.bb          |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch

diff --git a/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch b/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
new file mode 100644
index 0000000000..a9dc9dc2b7
--- /dev/null
+++ b/meta-networking/recipes-kernel/wireguard/files/0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch
@@ -0,0 +1,29 @@
+From ce8faa3ee266ea69431805e6ed4bd7102d982508 Mon Sep 17 00:00:00 2001
+From: "Jason A. Donenfeld" <Jason@zx2c4.com>
+Date: Thu, 12 Nov 2020 09:43:38 +0100
+Subject: [PATCH] compat: SYM_FUNC_{START,END} were backported to 5.4
+
+Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
+
+Upstream-Status: Backport
+Fixes build failure in Dunfell.
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ compat/compat-asm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: src/compat/compat-asm.h
+===================================================================
+--- src.orig/compat/compat-asm.h
++++ src/compat/compat-asm.h
+@@ -40,7 +40,7 @@
+ #undef pull
+ #endif
+ 
+-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 0)
++#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76)
+ #define SYM_FUNC_START ENTRY
+ #define SYM_FUNC_END ENDPROC
+ #endif
diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
index 73199592c8..45324c02a1 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-module_1.0.20200401.bb
@@ -2,7 +2,8 @@ require wireguard.inc
 
 SRCREV = "43f57dac7b8305024f83addc533c9eede6509129"
 
-SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat"
+SRC_URI = "git://git.zx2c4.com/wireguard-linux-compat \
+           file://0001-compat-SYM_FUNC_-START-END-were-backported-to-5.4.patch"
 
 inherit module kernel-module-split
 
-- 
2.17.1

