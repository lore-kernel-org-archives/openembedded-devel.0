Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.2199.1622162379299245935
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 17:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MZwl7zBz;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id p39so1932110pfw.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 17:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xn66ObPumDm1C1E2ykxJZsnhy9lDOe3ZehDnNeeQYsU=;
        b=MZwl7zBzidN2TSDqq5HNg1pLpcWIKrUT5k7ee3pxyEUb7hOzYAXLZvEbUfTLkhe4ZE
         qL5v8f8BpjHNjKutM25Xg+dbFmBSx9CoaLPi8qLE8xmW7v6K8AovHDWWQBFqfX8OhY1q
         G1zmZ4/X6nwYsvxK51GxGi1ZY8R5ebMVJJNCo023qtcHn3rMrujUUASoJulgKGOXkR2n
         /uljc/jibb1NDn4+n5+8LGzF79t4xAmy7DKWwbwXtkEwR+0sztNJihjXKb21AW47x8kU
         ds2hbr+VIP+GISEYEoXoroyHJHFxYZPfyLgd6ayWTiQDKSBu9bP8kQTMjsPIMN5Nb1C6
         OYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xn66ObPumDm1C1E2ykxJZsnhy9lDOe3ZehDnNeeQYsU=;
        b=YTMWj5cm3C3JnXNaPnLA0kdaiihdrIMr1VxRrDUqQuk7INLyPrWjEP0NcIsWYu6jHV
         yNCjDCpIHhzBfWDN1wGbCxdefLgsmiL3xmbi767AibVuu2xs3Q/eckBdG4aizvDckVee
         Zj13XKEAoGjyuTxuKenq9a6rOHRuIuspy7dnrUHt4Pgl3N+ngeWQLwsO08eMTSiUq9H0
         YOmWIdxjDorWm0YXw8An/X/tbD0UyqzfawB3zX6jZY8OjGnIRMz4gKf3eES4R+AMQG5h
         UpRQI0MhPd1bAPFAQG3dAK9ELGyAaoeUsfDniG6jHhcYBKGPYqEfuyfo7KjUzEOcTojp
         CIog==
X-Gm-Message-State: AOAM533ZB1ijvx0jnTx37x9Ifv4WMPBA2vsoy/Te1w9ZypXAhGfbeeyN
	TKO3NswcqpLeUuUuILCEHLh+s8OWc8DKEQ==
X-Google-Smtp-Source: ABdhPJzsJNZAFK5b4+eXhGc99Y5p3GbbCpAWF7oKO0XUjN5pFzF3YQmMyGRLoEj+y9diPXRoEnGnUg==
X-Received: by 2002:a63:752:: with SMTP id 79mr6342708pgh.10.1622162378453;
        Thu, 27 May 2021 17:39:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e64f])
        by smtp.gmail.com with ESMTPSA id gb14sm2877460pjb.57.2021.05.27.17.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 17:39:38 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 1/2] minifi-cpp: Fix build with llvm C++ runtime
Date: Thu, 27 May 2021 17:39:35 -0700
Message-Id: <20210528003936.568907-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Earlier patch did not work on 32bit systems

 .../files/0001-Fix-build-with-libc.patch      | 36 +++++++++++++++++++
 .../minifi-cpp/minifi-cpp_0.7.0.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch

diff --git a/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch
new file mode 100644
index 0000000000..c1c118196a
--- /dev/null
+++ b/meta-oe/recipes-extended/minifi-cpp/files/0001-Fix-build-with-libc.patch
@@ -0,0 +1,36 @@
+From 72e0fe484444169007e481c9b33d8f78ebe03674 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 27 May 2021 15:44:10 -0700
+Subject: [PATCH] Fix build with libc++
+
+In libc++ on 32-bit platforms, int64_t is defined as alias of long long. On 64-bit platforms: long.
+
+On the other hand in definition of std::chrono::duration aliases, that you can find here long long is used
+
+Therefore create custom unit to avoid incompatibility between libstdc++
+and libc++
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ extensions/expression-language/Expression.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/extensions/expression-language/Expression.cpp b/extensions/expression-language/Expression.cpp
+index a25e1d3f..68d6320c 100644
+--- a/extensions/expression-language/Expression.cpp
++++ b/extensions/expression-language/Expression.cpp
+@@ -629,7 +629,8 @@ Value expr_toDate(const std::vector<Value> &args) {
+ #endif  // EXPRESSION_LANGUAGE_USE_DATE
+ 
+ Value expr_now(const std::vector<Value> &args) {
+-  return Value(std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
++  using Milliseconds = std::chrono::duration<std::int64_t, std::chrono::milliseconds::period>;
++  return Value(std::chrono::duration_cast<Milliseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
+ }
+ 
+ Value expr_unescapeCsv(const std::vector<Value> &args) {
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 322b58477d..86c149ba5b 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
             file://0003-cmake-BundledOSSPUUID.cmake-use-ossp-uuid-local-sour.patch \
             file://0001-civetweb-CMakeLists.txt-do-not-search-gcc-ar-and-gcc.patch \
             file://0001-cxxopts-Add-limits-header.patch \
+            file://0001-Fix-build-with-libc.patch \
             file://minifi.service \
             file://systemd-volatile.conf \
             file://sysvinit-volatile.conf \
-- 
2.31.1

