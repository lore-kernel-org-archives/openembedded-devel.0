Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.10646.1612638640109797055
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 11:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Pt68Hec/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id fa16so4971421pjb.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 11:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FPKDE7+9MxJdjLdetHmjt6apYcwe7DWC92BPo9ylViA=;
        b=Pt68Hec/3ToSshMnlqKHmnE6KNggn7TUjMb7UflhnPrIueSASB3eqSbVQy5CuxpARo
         4nUrmqDGdRIkDG+xmOSzveCCHDwYPqVFFlfDIqoMeYzcbEwBrZiW3KvO1psOKPWe1Nxr
         /Uza3/NHedrIofO1Eu8Pv3zCWymqxE+QdIuxl4ZKuwkAnIZDfnsqE/Yiph1SmdEH1RND
         bbk7nHYCUFIOk/tWEIGxLRpSqSXiIA7Fht5wGFZ8wJKnyU/K3RslWZ6KQobxAg76pJvE
         /iriKvuRBmA8y3ZtMPsdcTuwvvVXDGv2t1o+refCApqzZNffoGUjjKjKbiZMUSsCXP/k
         L73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FPKDE7+9MxJdjLdetHmjt6apYcwe7DWC92BPo9ylViA=;
        b=InrRLWULgogBEkOauilkE4McloEqA9T36Omh0442eE23Xcs6kHd9d1S0MDsXny9oaB
         ooRVdynrQRLaOga7mkKBqs7j2DNscjEDKEo/FsZyZs9CfSKr6WbtUhr4CuiCBv3mK3dT
         NKo+2DbdRTRZsqPkxg51x8yOaVvYB38wiyu5B3zzw+Vqla5Bbf9dir8miUm3nw776Ix7
         EVgnZOhxfnN+PC1OriViBiEf/gCGYnSsZOrFAfcMdEiI+Ha/rZa5TxhnV6OpLtZJ/QOf
         uWOiuoS8pmMOihRILwgRkVY24sVX6UfdOh+arRbIYzfxYBRM7wyUo6J0JoJ04hyIbKEQ
         0dNA==
X-Gm-Message-State: AOAM531JMLYsF8SbXRdZe4KX8hy+1jcgGn7p7+tn/QiQFwkZfcJ2Bcea
	/KQEgxioWsgwE3xPBP07wh2EMOlcr1BMjg==
X-Google-Smtp-Source: ABdhPJwqDPrfB/h53CoNaPVipA/qEQpSwPWtZTIDPeOP/itB8xUhEUsB0B6l5hDMHu3uz4kOU8rsmg==
X-Received: by 2002:a17:902:e750:b029:de:8c17:fd64 with SMTP id p16-20020a170902e750b02900de8c17fd64mr9585810plf.54.1612638639155;
        Sat, 06 Feb 2021 11:10:39 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id 9sm13692906pfo.1.2021.02.06.11.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 11:10:38 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/2] ubi-utils-klibc: Fix build with clang
Date: Sat,  6 Feb 2021 11:10:35 -0800
Message-Id: <20210206191036.402517-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 ...make-Add-compiler-includes-in-cflags.patch | 32 +++++++++++++++++++
 .../mtd/ubi-utils-klibc_2.0.2.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-make-Add-compiler-includes-in-cflags.patch

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-make-Add-compiler-includes-in-cflags.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-make-Add-compiler-includes-in-cflags.patch
new file mode 100644
index 0000000000..778d830128
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.0.2/0001-make-Add-compiler-includes-in-cflags.patch
@@ -0,0 +1,32 @@
+From 884ec4c654f1d07a387fdc1dae5640606369f254 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 6 Feb 2021 10:56:36 -0800
+Subject: [PATCH] make: Add compiler includes in cflags
+
+Fixes
+ In file included from ../git/ubi-utils/ubiformat.c:47:
+| ../git/include/common.h:22:10: fatal error: 'stdbool.h' file not found
+| #include <stdbool.h>
+|          ^~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5a6e77c..f0003d5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -9,6 +9,7 @@ endif
+ if WITHOUT_LZO
+ AM_CPPFLAGS += -DWITHOUT_LZO
+ endif
++AM_CPPFLAGS += -I$(shell $(CC) -print-file-name=include)
+ 
+ sbin_PROGRAMS =
+ sbin_SCRIPTS =
+-- 
+2.30.0
+
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
index d322381621..5f43b0229a 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
              file://0003-Makefile.am-only-build-ubi-utils.patch \
              file://0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch \
              file://0005-common.h-replace-getline-with-fgets.patch \
+             file://0001-make-Add-compiler-includes-in-cflags.patch \
              "
 
 S = "${WORKDIR}/git"
-- 
2.30.0

