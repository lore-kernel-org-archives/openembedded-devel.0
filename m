Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.151.1630516336175114319
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Sep 2021 10:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ehaZWihN;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 17so107946pgp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Sep 2021 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T6IMce/j3t0f13yWmkzae/mntcDmzGov5rduC0X2LTE=;
        b=ehaZWihNfw/yx0X8FYAtB6WJj7fjs+Y5/NknnfPSeE7VfbLx2/jn9a054xVdAs8aa8
         AMil9Sg6+vBrmiYRVnTJAcumAZx56gyT0LLVxgjoxS7oEP8FhfpPKmV+cWVlRj2yBj36
         tKm3MldipxNg3e4Yq4m7svAW8c5mRNXmBKWX89poa2IfWNnkFl1WBCeNfMj+VH1/kOSW
         3me8b06GXh4aBvXaPBoBT2Svn1gjk75Cgp/V0HkNYZ/uB07knUBbYKf31OE7IJ9VbeVa
         FIHbboXUuFYjkCGHNIxJughbb4sXqMyIg/KZCSOWDinTS/KYJDLQrYKM9aO950C+dGVF
         uEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T6IMce/j3t0f13yWmkzae/mntcDmzGov5rduC0X2LTE=;
        b=pGliBpSQMVw9flnMN2vHwm6Fg9lorCNXtF46/UUbDLAiRqbmeN46EKQ4NjRoGCrlMn
         W2zCj+zrqDfEmFbZ0Zh0sksugS9xlo1S+3u8sDzvYIEtwDaTEq4QTAJM7tzyXe+RKZuM
         hsFyqdrPkYwjDo//kBOCS6uqA8H2auNJn92LKQVLuzfgfuOj9kOQXHaN8B2f0C+KAkrI
         my0YfheaamcI9utVRblErfNkE/5FIOxToLMQ7MZfkDi3EJBoh4yTKGl+bLq5eoh2Bc8M
         MRpeEG4A+WP5TAx8doxO2lMdHgAgXXKYnA63PbaN8xWB001fVm/iBndaktx0mfvBHE6f
         EPqA==
X-Gm-Message-State: AOAM531hiW29UY7vBVsUP/HXfPNPwl6ghZjLAqu6msdbxuXJif2ImP6e
	+YeONfEGw9yA6cJL+3N0tCmvo8h69qMIbQ==
X-Google-Smtp-Source: ABdhPJzPcAR8vRqFh77jKxuQ7+bz3DHsksyKidz/kQYOiQ3Vf3pvjP9KuDUFmVc8L+ercg5uH3Do0Q==
X-Received: by 2002:a63:2fc3:: with SMTP id v186mr133492pgv.358.1630516335223;
        Wed, 01 Sep 2021 10:12:15 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id b5sm103341pjq.2.2021.09.01.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 10:12:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] apitrace: Enable on glibc >= 2.34
Date: Wed,  1 Sep 2021 10:12:11 -0700
Message-Id: <20210901171211.46098-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unused patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 ...-2.34-build-failure-by-disabling-dls.patch | 28 ++++++++++++++++
 .../0001-libbacktrace-include-config.h.patch  | 33 -------------------
 .../apitrace/apitrace_10.0.bb                 |  4 +--
 4 files changed, 30 insertions(+), 36 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0001-Workaround-glibc-2.34-build-failure-by-disabling-dls.patch
 delete mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index f58905f0bc..c36feb334c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -226,6 +226,7 @@ RDEPENDS:packagegroup-meta-oe-dbs-python2 ="\

 RDEPENDS:packagegroup-meta-oe-devtools ="\
     abseil-cpp \
+    apitrace \
     breakpad \
     android-tools-conf \
     android-tools \
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0001-Workaround-glibc-2.34-build-failure-by-disabling-dls.patch b/meta-oe/recipes-devtools/apitrace/apitrace/0001-Workaround-glibc-2.34-build-failure-by-disabling-dls.patch
new file mode 100644
index 0000000000..92edc4404c
--- /dev/null
+++ b/meta-oe/recipes-devtools/apitrace/apitrace/0001-Workaround-glibc-2.34-build-failure-by-disabling-dls.patch
@@ -0,0 +1,28 @@
+From 1926700b367745e976dae9d9dc2236da21f4435b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 1 Sep 2021 10:07:48 -0700
+Subject: [PATCH] Workaround glibc 2.34 build failure by disabling dlsym
+ wrapper
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wrappers/dlsym.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wrappers/dlsym.cpp b/wrappers/dlsym.cpp
+index 5ab8465b..d353bbf7 100644
+--- a/wrappers/dlsym.cpp
++++ b/wrappers/dlsym.cpp
+@@ -34,7 +34,7 @@
+ #include "os.hpp"
+
+
+-#if defined(__GLIBC__) && !defined(__UCLIBC__)
++#if defined(__GLIBC__) && !defined(__UCLIBC__) && !(__GLIBC__ == 2 && __GLIBC_MINOR__ >= 34)
+
+
+ #include <dlfcn.h>
+--
+2.33.0
+
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch b/meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch
deleted file mode 100644
index 87fb4992d4..0000000000
--- a/meta-oe/recipes-devtools/apitrace/apitrace/0001-libbacktrace-include-config.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From bdd5f0834d95a9598b0d87a18e7e96afade9d418 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 10 May 2021 15:28:05 -0700
-Subject: [PATCH] libbacktrace: include config.h
-
-Fixes
-thirdparty/libbacktrace/backtrace.h:53:10: fatal error: gstdint.h: No such file or directory
-   53 | #include "gstdint.h"
-      |          ^~~~~~~~~~~
-compilation terminated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- thirdparty/libbacktrace/backtrace.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/thirdparty/libbacktrace/backtrace.h b/thirdparty/libbacktrace/backtrace.h
-index 2814763f..802cf989 100644
---- a/thirdparty/libbacktrace/backtrace.h
-+++ b/thirdparty/libbacktrace/backtrace.h
-@@ -33,6 +33,7 @@ POSSIBILITY OF SUCH DAMAGE.  */
- #ifndef BACKTRACE_H
- #define BACKTRACE_H
-
-+#include <config.h>
- #include <stddef.h>
- #include <stdio.h>
-
---
-2.31.1
-
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
index 872aeb824a..ca828b0b44 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_10.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
 SRCREV = "9d42f667e2a36a6624d92b9bd697de097cc4e619"
 PV .= "+10.0.1+git${SRCPV}"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git \
+           file://0001-Workaround-glibc-2.34-build-failure-by-disabling-dls.patch \
           "

 S = "${WORKDIR}/git"
@@ -30,6 +31,3 @@ EXTRA_OECMAKE += "\
 "

 SECURITY_CFLAGS:toolchain-clang = ""
-
-# see https://github.com/apitrace/apitrace/issues/756
-PNBLACKLIST[apitrace] ?= "Needs porting to glibc 2.34+"
--
2.33.0
