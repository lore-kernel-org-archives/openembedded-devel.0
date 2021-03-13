Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.246.1615616022746467184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 22:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NdWb+TE9;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id u18so12893639plc.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 22:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iY697IFtSlOcnNFvj0DZJZF8o3VtBUFxIbsztUoo4MI=;
        b=NdWb+TE9IhJ1Lsk1Nw7sf0saW+twNBetqrb93yDE1eef6OsaSSn37fOi+g8/ylvre1
         t5m6C21L+O64Ksc4LKSnLN5J5pTRVLbO6DVTFnMdtcWPJTamgKtYjfXFMqluhUWBh/wC
         kZyIP3W/VHkY9RcPDCgXz6vL9+sW0Q8ScZZ7T8US0gya8K9SeaRXfnIOH9BXyMjLAOM2
         0ql6Ro4mlHYZNYQHtGQRFAtNLKVwcARgC1SCyLBbEHW7WS6UPOI9afMRgCz3kqSMp3uf
         0if/bFcqchEOUrO1z8kW/yPeij5ApIzurcUc/+3SHuCEemxc4VTix3V1FDYBnaI2OHdZ
         JmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iY697IFtSlOcnNFvj0DZJZF8o3VtBUFxIbsztUoo4MI=;
        b=mtt3Gsy+8UBEE8zWlEqGSxZJaeS1WyXeHJYR715cnIxyO4gJNIRp9r+zAMsFxz5L1x
         ZAJQUWfQ/dZ9vMIVWqZHybogNhkQyDvJ02KntESDwIepySPOoFUO/au1GOFKC7vxPzmi
         MJV5c05jxhiyQmMtBVpGj6Mh2gOWs3viC7ucgwlON2+IJU4pjTeQL0TU8JBq9KayewMv
         /iCzT9Z+hyMxnNXCFcwDWBm3oCY5HQ08r4jmufTG4qY3LkOBAOwjxCDSIxbTikaane98
         jIH9zc972cJrIy0aLThcy6MkLP+oGFNsY7KOC5K3SWd+bcEMhN0ebHAKUXBnx1+SqIDz
         Y9tA==
X-Gm-Message-State: AOAM532Z0NnBnzeCe85k769lBCohJypApN08EsOEy0Omr2l9n14IA7+f
	PdJRapYHtUT+LzTq25URahWgD9BHCPUSfg==
X-Google-Smtp-Source: ABdhPJzmjHMTZqV5+szL2nfAf+QinfQs+tSO3kyxn4wt+Xrv6kT7HlKp1MXGpJZyEIQPBlh+5RT3ww==
X-Received: by 2002:a17:902:c48c:b029:e4:c093:593a with SMTP id n12-20020a170902c48cb02900e4c093593amr2020370plx.1.1615616021792;
        Fri, 12 Mar 2021 22:13:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id 9sm6944908pgy.79.2021.03.12.22.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 22:13:41 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] xrdp: Upgrade to 0.9.15
Date: Fri, 12 Mar 2021 22:13:37 -0800
Message-Id: <20210313061338.2624068-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313061338.2624068-1-raj.khem@gmail.com>
References: <20210313061338.2624068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove upstreamed patches
Add patch to support ppc64le

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use __powerpc64__ compiler built-in define

 ...-warnings-about-snprintf-truncations.patch | 28 -----------------
 ...1-arch-Define-NO_NEED_ALIGN-on-ppc64.patch | 22 ++++++++++++++
 ...0001-correct-the-location-of-errno.h.patch | 30 -------------------
 ...esn-t-require-pointers-to-be-aligned.patch | 28 -----------------
 .../xrdp/{xrdp_0.9.14.bb => xrdp_0.9.15.bb}   |  6 ++--
 5 files changed, 24 insertions(+), 90 deletions(-)
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
index 0000000000..c06aa7b6ce
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch
@@ -0,0 +1,22 @@
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
+--- a/common/arch.h
++++ b/common/arch.h
+@@ -84,7 +84,7 @@ typedef int bool_t;
+ #define NEED_ALIGN
+ #elif defined(__x86__) || defined(__x86_64__) || \
+       defined(__AMD64__) || defined(_M_IX86) || defined (_M_AMD64) || \
+-      defined(__i386__) || defined(__aarch64__) || \
++      defined(__i386__) || defined(__aarch64__) || defined(__powerpc64__) || \
+       defined(__riscv)
+ #define NO_NEED_ALIGN
+ #else
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
