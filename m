Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.8542.1586438236438715884
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2020 06:17:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Qoaezekv;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id f13so5290072wrm.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2020 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IdWk865pUzjAESCOQmAVBecO0N4WNh0i3K0dU4ZIjMc=;
        b=QoaezekvU9Yu06/ExqYpDBHrCn37BIAVL60SnLPGJrxqom2Xt7I2yRFV10kfEhlZNG
         LTLAyfMH2tTSfMa12mM7xz2VwErJmSkwiUMb09K24VeLhnX/zcOIBaMQiuZxARE2mW9G
         QgnA3NZpFTdLH6ENcD6UJveiWQShxitMPThjL9Y6NPVJfMwB7+CrXfsW1G7JhRrDgRWE
         cVwssTaYiCDkfln7zhtLSwp/S+V9l6j+ADHwdqCrCeB0TEC4vvcly9TVFRrWKqB0mYHx
         Bi2zWyQ7Kq8Lr103zICH/Quzp/AA/XSf39Cyxrm7+HWgMaJU8jJcl2rG4Ou3F7dpbCNG
         cFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IdWk865pUzjAESCOQmAVBecO0N4WNh0i3K0dU4ZIjMc=;
        b=G7TmJdjVzu32fHrHOO1/z2nrqs7geqhQxkPeABjo+lfJCYWqNgWoLQw4CVk+087b7L
         wMT7XeQ/iwx2dz4lMeiKN5Ni47Rr+Nuk1UKF7j3sDBedwuCVaQd5+4wYazax8ls2Jm4G
         vtSLqiex1l1+Pk3jBV1uSL2LFSfpPT1OZXTuwfKQTXRZlrNBdUwyu8KPfDl5OS6q6zLQ
         suDON9+nBkh95NsLj5tzuDVSC0PlE57NGNVEaFWp8x6erQISJ7DfjqZVaPu3QCjO2zV1
         G6fJVVjYgYZzpjfXpaoHImpuLVQ0n0vblgbEKTkVewY9y8eW6QlK0d4L92uQqJ0ng3l9
         O5EA==
X-Gm-Message-State: AGi0Puac1ZA//s3eIdudqr/yBQU2vc1479wE5GSPtdxgFc8jA7ukXkCH
	g9aaJ3cMt24bO6x2uMRv3zh31uBY
X-Google-Smtp-Source: APiQypL0T4waVXBU7z9MkAcuQdsAsOeNwRNbQqVPPh/MxAJfP/tDEbnzCIAnJHu/KAKoGfM1rth75A==
X-Received: by 2002:adf:9564:: with SMTP id 91mr5806388wrs.246.1586438234585;
        Thu, 09 Apr 2020 06:17:14 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain ([5.171.137.150])
        by smtp.gmail.com with ESMTPSA id u17sm45396123wra.63.2020.04.09.06.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 06:17:13 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Costamagna Gianfranco <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] mongodb: Enable again building on 32bit arches from COMPATIBLE_HOST
Date: Thu,  9 Apr 2020 15:17:11 +0200
Message-Id: <20200409131711.21534-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

The upstream pending pull request seems to fix 32bit builds, tested with MACHINE=raspberrypi3
Signed-off-by: Costamagna Gianfranco <costamagnagianfranco@yahoo.it>
Signed-off-by: Costamagna Gianfranco <locutusofborg@debian.org>
---
 .../recipes-dbs/mongodb/mongodb/1296.patch    | 52 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  3 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
new file mode 100644
index 000000000..ae84bcb56
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
@@ -0,0 +1,52 @@
+Upstream-Status: submitted https://github.com/mongodb/mongo/pull/1296
+From 362be06fc16a5ad0f9e9aa90cc763c5242e8e35c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Feb 2019 12:41:45 +0100
+Subject: [PATCH] ssl_manager.cpp: fix build with gcc 7 and -fpermissive
+
+Change prototype of DERToken::parse function from
+parse(ConstDataRange cdr, size_t* outLength);
+to parse(ConstDataRange cdr, uint64_t* outLength);
+
+Otherwise, we got the following error:
+
+src/mongo/util/net/ssl_manager.cpp: In static member function 'static mongo::StatusWith<mongo::{anonymous}::DERToken> mongo::{anonymous}::DERToken::parse(mongo::ConstDataRange, size_t*)':
+src/mongo/util/net/ssl_manager.cpp:575:79: error: invalid conversion from 'size_t* {aka unsigned int*}' to 'long unsigned int*' [-fpermissive]
+  if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, outLength) ||
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/mongo/util/net/ssl_manager.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/ssl_manager.cpp
+index b93ebe84a4a3..3511eb5d998f 100644
+--- a/src/mongo/util/net/ssl_manager.cpp
++++ b/src/mongo/util/net/ssl_manager.cpp
+@@ -782,7 +782,7 @@ class DERToken {
+      *
+      * Returns a DERToken which consists of the (tag, length, value) tuple.
+      */
+-    static StatusWith<DERToken> parse(ConstDataRange cdr, size_t* outLength);
++    static StatusWith<DERToken> parse(ConstDataRange cdr, uint64_t* outLength);
+ 
+ private:
+     DERType _type{DERType::EndOfContent};
+@@ -799,7 +799,7 @@ struct DataType::Handler<DERToken> {
+                        size_t length,
+                        size_t* advanced,
+                        std::ptrdiff_t debug_offset) {
+-        size_t outLength;
++        uint64_t outLength;
+ 
+         auto swPair = DERToken::parse(ConstDataRange(ptr, length), &outLength);
+ 
+@@ -844,7 +844,7 @@ StatusWith<std::string> readDERString(ConstDataRangeCursor& cdc) {
+ }
+ 
+ 
+-StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, size_t* outLength) {
++StatusWith<DERToken> DERToken::parse(ConstDataRange cdr, uint64_t* outLength) {
+     const size_t kTagLength = 1;
+     const size_t kTagLengthAndInitialLengthByteLength = kTagLength + 1;
+ 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 6f460bf76..5c3b806f2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.2 \
            file://0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch \
            file://0001-Support-deprecated-resolver-functions.patch \
            file://0003-Fix-unknown-prefix-env.patch \
+           file://1296.patch \
            "
 SRC_URI_append_libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
@@ -36,7 +37,7 @@ SRC_URI_append_toolchain-clang = "\
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST ?= '(x86_64|powerpc64|aarch64).*-linux'
+COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
 
 PACKAGECONFIG ??= "tcmalloc system-pcre"
 # gperftools compilation fails for arm below v7 because of missing support of
-- 
2.17.1

