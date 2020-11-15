Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.24595.1605470070818031197
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2020 11:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JXSJN6qN;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id p68so341606pga.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2020 11:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ij7w0vTO5topISQSbSNJVJu7impzd4bl385laRuZxVg=;
        b=JXSJN6qNQe20k5SuORhjHgDVg1URC6htxJTchRIHDyiThua4pgOjzypdjyQKMGZdX4
         hAr62ATaw1gjhgtHdvYq4Yh//9z7PJcFpnCKtilIaDuVW9hGVIfDJmyV3hSjucC5z5wq
         bIRioIv3XpqBh3pqMcOZb+2TcHWatxv0DuuuaHdXaZuTOWxsUGsNUlCLjz6rLDX9sxn/
         7XKSGRmcoIurKot3HpRTxfuPNg8G9PnSCjfv+ixsTG+tIyxmw+BCES/TmdxF47+0VzC6
         eOpTWf29Us396G+8vnqEAjYBF0qpYZj3uVIhs9KwlTpwjO4ifSgqNH9CQ1IbM/oj3PkS
         Ylow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ij7w0vTO5topISQSbSNJVJu7impzd4bl385laRuZxVg=;
        b=Sbwz3rQYRJPG3hmOEt0KdNM5gaS6DeSx37DOB0Msg5si6SF8CYzjSGqxeHwf7ZQZLE
         E9U95l7+qWZwhvMyRmGgcTD6yrBbUGfAJW1EaLgCF1ZptUHo3TIdFCLdCAKmPw15pvWx
         Q7oAT19++fCJ3Potp7Lt3JS/YzvxEJKBdOHNB8MjBtQhHE73T5ZrfuwJWFfjZna8dfZt
         rcV3Okg9lWbLEi1g14puaoeiMYaIr0+LrC1CTjpRMa18PWFElR2OExZnAU5KrMrE21J1
         v9S9E2P2kgjpK4a4i7sYnv46KkqtyR2VRqefGHjVPDo7damBCsZx10ITpMpos9dUG8kh
         uaPg==
X-Gm-Message-State: AOAM533Pb4TCDRwsYocUWUSL5FZ/9d4IuwKSUwsdzhqcoPJ28TVonckJ
	EuYJ6Dit6Im0V3HWT/ouzAymjNcztGzUQQ==
X-Google-Smtp-Source: ABdhPJysNp1Rwcad68bFNchp/exyBT1Wj7vh+SpDe+P44KTw/a0upd22UdeIGgQMQzWSGo6QdGKi6Q==
X-Received: by 2002:a17:90b:3781:: with SMTP id mz1mr12172580pjb.229.1605470069840;
        Sun, 15 Nov 2020 11:54:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c12sm14929287pgi.14.2020.11.15.11.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 11:54:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] poco: Add riscv32 support
Date: Sun, 15 Nov 2020 11:54:26 -0800
Message-Id: <20201115195426.2743750-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-support-of-arch-riscv32.patch    | 47 +++++++++++++++++++
 meta-oe/recipes-support/poco/poco_1.10.1.bb   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/poco/poco/0001-Add-support-of-arch-riscv32.patch

diff --git a/meta-oe/recipes-support/poco/poco/0001-Add-support-of-arch-riscv32.patch b/meta-oe/recipes-support/poco/poco/0001-Add-support-of-arch-riscv32.patch
new file mode 100644
index 0000000000..e6b673b11d
--- /dev/null
+++ b/meta-oe/recipes-support/poco/poco/0001-Add-support-of-arch-riscv32.patch
@@ -0,0 +1,47 @@
+From 98d277655e411f56fba705c0bf2efc6562c23807 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 11:37:33 -0800
+Subject: [PATCH] Add support of arch riscv32
+
+Upstream-Status: Submitted [https://github.com/pocoproject/poco/pull/3138]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Foundation/include/Poco/Platform.h | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/Foundation/include/Poco/Platform.h b/Foundation/include/Poco/Platform.h
+index 799db417e..b8506a248 100644
+--- a/Foundation/include/Poco/Platform.h
++++ b/Foundation/include/Poco/Platform.h
+@@ -135,6 +135,7 @@
+ #define POCO_ARCH_AARCH64 0x0f
+ #define POCO_ARCH_ARM64   0x0f // same as POCO_ARCH_AARCH64
+ #define POCO_ARCH_RISCV64 0x10
++#define POCO_ARCH_RISCV32 0x11
+ 
+ 
+ #if defined(__ALPHA) || defined(__alpha) || defined(__alpha__) || defined(_M_ALPHA)
+@@ -225,12 +226,16 @@
+ #elif defined(__AARCH64EB__)
+ 	#define POCO_ARCH POCO_ARCH_AARCH64
+ 	#define POCO_ARCH_BIG_ENDIAN 1
+-#elif defined(__riscv) && (__riscv_xlen == 64)
+-	#define POCO_ARCH POCO_ARCH_RISCV64
+-	#define POCO_ARCH_LITTLE_ENDIAN 1
++#elif defined(__riscv)
++	#if (__riscv_xlen == 64)
++		#define POCO_ARCH POCO_ARCH_RISCV64
++		#define POCO_ARCH_LITTLE_ENDIAN 1
++	#elif(__riscv_xlen == 32)
++		#define POCO_ARCH POCO_ARCH_RISCV32
++		#define POCO_ARCH_LITTLE_ENDIAN 1
++	#endif
+ #endif
+ 
+-
+ #if defined(__clang__)
+ 	#define POCO_COMPILER_CLANG
+ #elif defined(_MSC_VER)
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/poco/poco_1.10.1.bb b/meta-oe/recipes-support/poco/poco_1.10.1.bb
index 3f51e61187..48b31dd3f3 100644
--- a/meta-oe/recipes-support/poco/poco_1.10.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.10.1.bb
@@ -10,6 +10,7 @@ DEPENDS = "libpcre zlib"
 
 SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=poco-${PV} \
+    file://0001-Add-support-of-arch-riscv32.patch \
     file://run-ptest \
    "
 SRCREV = "a3d827d80eb7f3329c58e73eb2906cb7ba829019"
-- 
2.29.2

