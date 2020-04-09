Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.18279.1586464123450754250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 13:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dFOizu+D;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id v23so49469pfm.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2020 13:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/kGp8fad/Rud1Wqr+LlNZI9kqAPPi0do/cavm2sWG6o=;
        b=dFOizu+Dba8dA5JzYlhS3jq2hJIyePLdWwapqliHmwN1cUpe1lw/UWa9luY6eIvhwI
         5IaHH+thJmZj9X8GiF3hpns+fp3C2yNOu26P6o67qakTFQYI8JlfSbAyP53J5thkcquN
         mLjeeuVn57yyPIeFtpwIWnY8p0yEmM48yhpEYEPnlOfHnzSTxVH72Yc49B0If7EcLqZt
         lfWEaRs/dHW4XRzDVCujOb31KnJ6te0lbnsoTt/giPHoA9LJe+9+zGlzbU8Rk3l0V/7S
         ZC5gdhuHKhfauhKZViLH9M2eEZuFVlBWA4/cdrJdgR2QJS4Z1MVTf8G5z4FRjoxjqm7Q
         JOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/kGp8fad/Rud1Wqr+LlNZI9kqAPPi0do/cavm2sWG6o=;
        b=SgNxYuE4zhF624HzuR+rb+a9KS9JXeDCVwER6W8Skleo2JOhihXXw9Gq0AU+IzO2+t
         bwrFOIL3e+7mp6c/BBmXrTqLCPn08aGicRYX7bBXN6kPU+YjV1ouAdsBlu/8u99raEIm
         Rw53Nkjye0J1CNAzfkFnVZootCyDgkBZjOsdHCC/VB7CgFNDva608Lv/WJaNMqu2i6Mj
         K9lZc+iIILkY87yXQ60GYqFNinVtC3YnJSBwriThCz6D/w0Z6iNUqlSGa5iG6U3oMAm4
         fZ1i7mEZUYRs5pTXEj3RXZhUd2SO60Cn7U8UWU6q07PkNR10fapgNaGL2ycgz+M5hrxo
         ewNQ==
X-Gm-Message-State: AGi0PuaTLZ/Lmh0ncwfCWoeAffFiwS95++7bCiuyJKpVsFCBwjfBCczI
	fQkATwr90dvEbnsa4nuDBIxFgVHFEPA=
X-Google-Smtp-Source: APiQypIkBgrd2QIGdOXfZfNAH+CbV6Y509qouEOII5HYkTCmqnqwvDBYI38uVsEmMQwo3jlLdpL6wA==
X-Received: by 2002:a62:ed19:: with SMTP id u25mr1427276pfh.31.1586464122219;
        Thu, 09 Apr 2020 13:28:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id x4sm76114pfa.191.2020.04.09.13.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:28:41 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] abseil-cpp: Fix build on musl/mips
Date: Thu,  9 Apr 2020 13:28:56 -0700
Message-Id: <20200409202856.798178-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-absl-always-use-asm-sgidefs.h.patch  | 38 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..6bb59d9336
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
@@ -0,0 +1,38 @@
+From 14229e8c6f42a96e4d725124193ceefa54e5e1a4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 9 Apr 2020 13:06:27 -0700
+Subject: [PATCH] absl: always use <asm/sgidefs.h>
+
+Fixes mips/musl build, since sgidefs.h is not present on all C libraries
+but on linux asm/sgidefs.h is there and contains same definitions, using
+that makes it portable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ absl/base/internal/direct_mmap.h | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
+index 2e5e422..c515325 100644
+--- a/absl/base/internal/direct_mmap.h
++++ b/absl/base/internal/direct_mmap.h
+@@ -41,13 +41,9 @@
+ 
+ #ifdef __mips__
+ // Include definitions of the ABI currently in use.
+-#ifdef __BIONIC__
+-// Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
++// bionic/musl C libs don't have sgidefs.h, but do have asm/sgidefs.h, which has the
+ // definitions we need.
+ #include <asm/sgidefs.h>
+-#else
+-#include <sgidefs.h>
+-#endif  // __BIONIC__
+ #endif  // __mips__
+ 
+ // SYS_mmap and SYS_munmap are not defined in Android.
+-- 
+2.26.0
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index b6ea5fdecc..9a44133c56 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}                \
            file://0002-Add-forgotten-ABSL_HAVE_VDSO_SUPPORT-conditional.patch \
            file://0003-Add-fPIC-option.patch                                  \
            file://0001-Add-RISCV-support-to-GetProgramCounter.patch \
+           file://0001-absl-always-use-asm-sgidefs.h.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.26.0

