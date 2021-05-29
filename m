Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.24500.1622317369928513195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 May 2021 12:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FnKDvhGs;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id v13so3217822ple.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 May 2021 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SOdjk/8x3iycBoT7nDKc6W/7RLZ6CO5PSrHvuqMZcfM=;
        b=FnKDvhGsJY53OR2Pkt7nx8VzYIvV8nBihQUIXNsZKyeYLy5H3yhzLygsReqXrUFe2W
         ZPCaXJEDz/CXaq5KS7Q7ZAzX4PhZDxhdMqgP8u5q/0bhGk2SHMvzoCCpFvWEO0a5IaMV
         qchIeXMTu/zfDQmDl4HMuxnvl1nix/lPtNvq8MfJSqFwd6eO5Pb4j9jYsG4L104IaCnH
         89FMmyIZTMWyDW1inXKZtrGSugXfelLDYOSDTaEIHBI5kCDwh5pBqxdgbYDnzmTtiJao
         A8Rpn0vbK4o/vIusT7VSLlmQIoYzsbGwmAFCLqnr4WXM9oWpHM6VUiD0ZcIHm3JE7swI
         Pb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SOdjk/8x3iycBoT7nDKc6W/7RLZ6CO5PSrHvuqMZcfM=;
        b=adjzl41oOqrK5QH9Arj+mFQ90//asz9WbJNrSvlwhwTO5KZKnVbYSK9m/45fvRxpip
         iYq9v+m3SFnUfTsKce+F+Vpbo6RH9CJ9qRdpFxTtkCoR0i6jMp81Lv3TdWywhZB7psix
         mIaqWdce/SEn3GJu8D+F0493i92h2p7zSqvUyYksO7IVCRDetHKZ0FGpT7ghykuXapk0
         wGHDo8VT2JR43w6g/VjYGGFo+40H2yF1XBCDnXJY+s7sf/4to6/kUTTiSocnIe6IcA52
         q5F0kgJB20/PDpZ2suRbJdGm5pFnNiYLs2vfIO4qbZSIGhh1djg7XsBgpfXeDKilCvVW
         GJiw==
X-Gm-Message-State: AOAM5318gaeI/0odHPxL6y9QwJCb0h5ru0vFyxq1icQ1/yR5n6MFIBYD
	LNN9U2lT3TNqVw5UqiRQyEsrVqEHWSFrKQ==
X-Google-Smtp-Source: ABdhPJzT5/aDbhi5VM6XUvYq1RstcAGvfp1j/7EwflnbCeLr0AZxvAT6ubzraXycKWwSdQwE13O0YA==
X-Received: by 2002:a17:90a:fc8f:: with SMTP id ci15mr11020968pjb.147.1622317369010;
        Sat, 29 May 2021 12:42:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.localdomain ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id s3sm8114965pgs.62.2021.05.29.12.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 12:42:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] grpc: Upgrade to 1.38.0
Date: Sat, 29 May 2021 12:42:44 -0700
Message-Id: <20210529194245.3168135-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with musl by checking for iovec redefinition

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../grpc/0001-gsec-Fix-build-on-musl.patch    | 37 +++++++++++++++++++
 .../grpc/{grpc_1.37.1.bb => grpc_1.38.0.bb}   |  4 +-
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-gsec-Fix-build-on-musl.patch
 rename meta-oe/recipes-devtools/grpc/{grpc_1.37.1.bb => grpc_1.38.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc/0001-gsec-Fix-build-on-musl.patch b/meta-oe/recipes-devtools/grpc/grpc/0001-gsec-Fix-build-on-musl.patch
new file mode 100644
index 0000000000..faa18bb7f7
--- /dev/null
+++ b/meta-oe/recipes-devtools/grpc/grpc/0001-gsec-Fix-build-on-musl.patch
@@ -0,0 +1,37 @@
+From 9af185be6068d279736c0d2b2162a4e768444d3d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 29 May 2021 00:41:32 -0700
+Subject: [PATCH] gsec: Fix build on musl
+
+musl defines iovec struct in alltypes.h file which is included by many
+system include files, therefore check for appropriate define from musl
+before defining it again
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/core/tsi/alts/crypt/gsec.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/core/tsi/alts/crypt/gsec.h b/src/core/tsi/alts/crypt/gsec.h
+index 4d65caa944..3c367b2895 100644
+--- a/src/core/tsi/alts/crypt/gsec.h
++++ b/src/core/tsi/alts/crypt/gsec.h
+@@ -26,11 +26,14 @@
+ #include <stdlib.h>
+ 
+ #include <grpc/grpc.h>
++#include <sys/uio.h>
+ 
++#if !defined(__DEFINED_struct_iovec)
+ struct iovec {
+   void* iov_base;
+   size_t iov_len;
+ };
++#endif
+ 
+ /**
+  * A gsec interface for AEAD encryption schemes. The API is thread-compatible.
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.37.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.38.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/grpc/grpc_1.37.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.38.0.bb
index a7aabd13f0..2095d81d4a 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.37.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.38.0.bb
@@ -16,8 +16,8 @@ RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "8664c8334c05d322fbbdfb9e3b24601a23e9363c"
-BRANCH = "v1.37.x"
+SRCREV_grpc = "54dc182082db941aa67c7c3f93ad858c99a16d7d"
+BRANCH = "v1.38.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            "
 # Fixes build with older compilers 4.8 especially on ubuntu 14.04
-- 
2.31.1

