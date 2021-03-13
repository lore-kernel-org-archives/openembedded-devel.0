Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web09.71.1615614335933035033
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 21:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QgbJRJfV;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id q2-20020a17090a2e02b02900bee668844dso11738911pjd.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 21:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFiJigOMaXYSVE18EABxizMH4c/wNnawF3iPUuQjzDA=;
        b=QgbJRJfVTnRccREEbm/x+KmCBE+gLNJbaE3Xg+7UUv74PQtEo87QQ1BYAn+E78Gdux
         rhl1iQl0VS+Dr2o5uZr7mDE3bOjjZN+qqp1YTP1vlBCN1y1D44BzlKLltdf22m98NDWZ
         SNb/m/mYb/485ayMRKrEbOIXbJJE5B8vMyThuiO8ql3lhtd48HXw+BV1tjAqbLuWLY/3
         IhIrsJOl4iOCtUUxKa94pYo+IgWeoKQ+jb/30KIEBC2dkjIx2PisZsZ7lzdV2HUr0xwZ
         l4ZXxPnz9dAvu/yrvfgwVtBLt5JrA0FP1zg++J31Zdoobk+OkXNIvgGDCWS+ytuizjI5
         H41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFiJigOMaXYSVE18EABxizMH4c/wNnawF3iPUuQjzDA=;
        b=oSsP/yWZ9oYf5lCO4bHb94+8rBPdwt1MePv1gyDXJjP+1FwEer7SnyxwyMagqi/5jA
         dVp7dAwJ0gTcQ5leqeoUysWKsXWCXOdCUjwC/MFFWJEv7azoY2HenDQqXCyYEiDMzebk
         EWe3U5EYhT9ZD8PwFQsqJd5w1I021qR5inep5EQJELtwX6cWxJWWaTg8NDjP7628Fc7C
         Yr9N9KiOCnL6CA/4a/bfWy2PnTarclfXKYDmpJdjGpB0Bw2Qw5dzsOHCPQEhIX1Ikzur
         9opY6CR+LMo3HNWgMB58RpXhDtyO6zXF1YUDdaFOViroS9TxsD2l17PGfrfptDQZEN7v
         HBxg==
X-Gm-Message-State: AOAM533AZyo7mBq/YeZDeM32lTHvubsTGjwfyg+N5mzKdXAlKFZmuwhR
	cYFXwAiME5k4Ss7g8Mlt9+kv/VfjZzrhTw==
X-Google-Smtp-Source: ABdhPJzWXEj3srtgKFQmRobpfAA5qJAOKJqvWM7SllVm+Hle3XsMtHJVzV1p9rQs7INMM9zm3/OLAg==
X-Received: by 2002:a17:90a:c389:: with SMTP id h9mr1960888pjt.226.1615614334982;
        Fri, 12 Mar 2021 21:45:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id y19sm7685213pfo.0.2021.03.12.21.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 21:45:34 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] xrdp: Upgrade to 0.9.15
Date: Fri, 12 Mar 2021 21:45:31 -0800
Message-Id: <20210313054531.2578143-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove upstreamed patches
Add patch to support ppc64le

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-warnings-about-snprintf-truncations.patch | 28 -----------------
 ...1-arch-Define-NO_NEED_ALIGN-on-ppc64.patch | 27 +++++++++++++++++
 ...0001-correct-the-location-of-errno.h.patch | 30 -------------------
 ...esn-t-require-pointers-to-be-aligned.patch | 28 -----------------
 .../xrdp/{xrdp_0.9.14.bb => xrdp_0.9.15.bb}   |  6 ++--
 5 files changed, 29 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
 delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch
 delete mode 100644 meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch
 rename meta-oe/recipes-support/xrdp/{xrdp_0.9.14.bb => xrdp_0.9.15.bb} (92%)

diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch
deleted file mode 100644
index 5b9315cfb4..0000000000
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-Fixed-compiler-warnings-about-snprintf-truncations.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9de23a9199d26e64ab6b5be2bb74f260200b2dc5 Mon Sep 17 00:00:00 2001
-From: matt335672 <30179339+matt335672@users.noreply.github.com>
-Date: Fri, 21 Aug 2020 12:20:31 +0100
-Subject: [PATCH] Fixed compiler warnings about snprintf truncations
-
-Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/pull/1659]
----
- common/log.c | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/common/log.c b/common/log.c
-index 4a0bd2f3..8686789d 100644
---- a/common/log.c
-+++ b/common/log.c
-@@ -555,9 +555,7 @@ log_message(const enum logLevels lvl, const char *msg, ...)
-     now_t = time(&now_t);
-     now = localtime(&now_t);
- 
--    snprintf(buff, 21, "[%.4d%.2d%.2d-%.2d:%.2d:%.2d] ", now->tm_year + 1900,
--             now->tm_mon + 1, now->tm_mday, now->tm_hour, now->tm_min,
--             now->tm_sec);
-+    strftime(buff, 21, "[%Y%m%d-%H:%M:%S] ", now);
- 
-     internal_log_lvl2str(lvl, buff + 20);
- 
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
new file mode 100644
index 0000000000..0099f5d64d
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
@@ -0,0 +1,27 @@
+From 5958db649855bfb2ada7c0ed22a00f839b9a1161 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Mar 2021 21:40:35 -0800
+Subject: [PATCH] arch: Define NO_NEED_ALIGN on ppc64
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/arch.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common/arch.h b/common/arch.h
+index 8c2ac1a4..cf4addea 100644
+--- a/common/arch.h
++++ b/common/arch.h
+@@ -84,7 +84,7 @@ typedef int bool_t;
+ #define NEED_ALIGN
+ #elif defined(__x86__) || defined(__x86_64__) || \
+       defined(__AMD64__) || defined(_M_IX86) || defined (_M_AMD64) || \
+-      defined(__i386__) || defined(__aarch64__) || \
++      defined(__i386__) || defined(__aarch64__) defined(__ppc64__) || \
+       defined(__riscv)
+ #define NO_NEED_ALIGN
+ #else
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch
deleted file mode 100644
index b06077bf02..0000000000
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-correct-the-location-of-errno.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c8d3df40ece7d659ccc8212b18de916d28f4398a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Dec 2020 23:10:52 -0800
-Subject: [PATCH] correct the location of errno.h
-
-Fixes build on musl
-
-Upstream-Status: Submitted [https://github.com/neutrinolabs/xrdp/pull/1761]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sesman/chansrv/sound.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sesman/chansrv/sound.c b/sesman/chansrv/sound.c
-index b0480d33..45e17307 100644
---- a/sesman/chansrv/sound.c
-+++ b/sesman/chansrv/sound.c
-@@ -23,7 +23,7 @@
- #include <stdio.h>
- #include <sys/types.h>
- #include <sys/socket.h>
--#include <sys/errno.h>
-+#include <errno.h>
- #include <signal.h>
- #include <sys/un.h>
- 
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch b/meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch
deleted file mode 100644
index 4cd26df04c..0000000000
--- a/meta-oe/recipes-support/xrdp/xrdp/0001-riscv-doesn-t-require-pointers-to-be-aligned.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 229206aa5e55a6e26a074a54a1b50139ab794b36 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 Dec 2020 23:01:13 -0800
-Subject: [PATCH] riscv doesn't require pointers to be aligned
-
-Upstream-Status: Submitted [https://github.com/neutrinolabs/xrdp/pull/1761]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- common/arch.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/common/arch.h b/common/arch.h
-index ccccfa5a..8c2ac1a4 100644
---- a/common/arch.h
-+++ b/common/arch.h
-@@ -84,7 +84,8 @@ typedef int bool_t;
- #define NEED_ALIGN
- #elif defined(__x86__) || defined(__x86_64__) || \
-       defined(__AMD64__) || defined(_M_IX86) || defined (_M_AMD64) || \
--      defined(__i386__) || defined(__aarch64__)
-+      defined(__i386__) || defined(__aarch64__) || \
-+      defined(__riscv)
- #define NO_NEED_ALIGN
- #else
- #warning unknown arch
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.15.bb
similarity index 92%
rename from meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
rename to meta-oe/recipes-support/xrdp/xrdp_0.9.15.bb
index 078e23c6ed..039ba1a763 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.14.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.15.bb
@@ -14,11 +14,9 @@ SRC_URI = "git://github.com/neutrinolabs/xrdp.git;branch=devel \
            file://xrdp.sysconfig \
            file://0001-Added-req_distinguished_name-in-etc-xrdp-openssl.con.patch \
            file://0001-Fix-the-compile-error.patch \
-           file://0001-riscv-doesn-t-require-pointers-to-be-aligned.patch \
-           file://0001-correct-the-location-of-errno.h.patch \
-           file://0001-Fixed-compiler-warnings-about-snprintf-truncations.patch \
+           file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            "
-SRCREV = "1469d659dbccd6d042ac44f0afc4e1309788dc9d"
+SRCREV = "f24b7b7988140b18202908654db3289659303772"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2

