Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E1AE6FE38
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:14:37 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.22664.1695392072708153943
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cSPmMf+h;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9aa0495f9cfso818268566b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695392071; x=1695996871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bOvP6WshMzNMPph4AsaFzSC7Bj8ymA+xWomPK6dp0aE=;
        b=cSPmMf+htkRP8GtMS0nl1D6w6arBSOhl6sS1/ECOQuhpTU9eBi9/SUOTop5UwvcqWy
         IijQC+QcEATKTeqmz3StkOBjgltQKdiakjnCMD4NuEJrgFUAsXB4Z5fP2qc7rtzgv27z
         9KYN2VAj8hrSYQpF8VPZpu+Rvvlz6QzaalTfCgps+U4jwf0yTHdnTLOyZmh2wwd7JBI/
         oeV1MQbakzvpfjjPzQLcXECJ8txsDkHqZIiZeh2HMJjZ1aLd75IsUB0gPc6arLhTlFdW
         /YKUem5yQavirKB/RIrCr0YcPr5Wg++MZTkZ88Ww23fL/7s3wEVxuC818qcuQoQOv5Qh
         lGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695392071; x=1695996871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bOvP6WshMzNMPph4AsaFzSC7Bj8ymA+xWomPK6dp0aE=;
        b=GppR8vFrGbaIwgu1ikVHYYutSjsH4ERzjsgkNvidQ8vH2u9qtkgOKc6T4ihogV2InR
         pVRb8IieheJZfp9ccza/mMQH+UiwwcDN0XIwJp9iMtxqvZNhwAetLOHgGa4TdSsMN5W0
         sc4031MJZo40SEk8Zi4ZZq2olFd2oWkQd81oBc8UUKY/a8P1KdAkjb9a5itmTcMMUIf7
         Ff6n1zz+WQUJDhR3uBCZBtQzxE7K1iygSYCnDjV1s71L0kKOrrGjVR1uOGyP77cyT8/X
         DOuNNrEC2GKVrvndlG5GvmtXMXBLcxtZCTTWI6nrWehIDCoeijVjuQ5MjYXlvUDNYDQh
         mO8w==
X-Gm-Message-State: AOJu0Ywp+mNYp/kTjrqj2sikXDsI9OfLO/zqJyWGXToGnkYamGrskgH6
	0Hd3TU0wDmgy76PPW7is6VYFju4pmnA=
X-Google-Smtp-Source: AGHT+IEc9aFGsvDHVLkeZyjyVpreuoKhfJEkQYmVnEuPpNinX5DaYmICs97zzqP6SmoDQXRBbz2gOQ==
X-Received: by 2002:a17:906:ca08:b0:9a5:aa43:1c7c with SMTP id jt8-20020a170906ca0800b009a5aa431c7cmr2839102ejb.26.1695392070449;
        Fri, 22 Sep 2023 07:14:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b009a193a5acffsm2711425ejk.121.2023.09.22.07.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 07:14:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] mongodb: add and fix Upstream-Status
Date: Fri, 22 Sep 2023 16:14:22 +0200
Message-ID: <20230922141423.2672238-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 14:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105069

* add 'Upstream-Status: Pending' where it was missing and fix malformatted one
  in 1296.patch

* fixes:
  ERROR: lib32-mongodb-4.4.24-r0 do_patch: QA Issue: Malformed Upstream-Status in patch
  meta-oe/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
  Please correct according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status :
  Upstream-Status: submitted https://github.com/mongodb/mongo/pull/1296 [patch-status]
  ERROR: lib32-mongodb-4.4.24-r0 do_patch: QA Issue: Missing Upstream-Status in patch
  meta-oe/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
  Please add according to https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status . [patch-status]
  ...

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch | 2 ++
 ...-Tell-scons-to-use-build-settings-from-environment-va.patch | 2 ++
 ...-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch | 2 ++
 .../mongodb/0001-Use-long-long-instead-of-int64_t.patch        | 2 ++
 .../mongodb/0001-asio-Dont-use-experimental-with-clang.patch   | 2 ++
 .../mongodb/0001-free_mon-Include-missing-cstdint.patch        | 2 ++
 ...002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch | 2 ++
 .../mongodb/mongodb/0003-Fix-unknown-prefix-env.patch          | 2 ++
 .../mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch      | 2 ++
 .../meta-python/recipes-dbs/mongodb/mongodb/1296.patch         | 3 ++-
 .../recipes-dbs/mongodb/mongodb/arm64-support.patch            | 2 ++
 11 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
index e636adc556..500e76bc2f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch
@@ -13,6 +13,8 @@ typedef int   wchar_t;
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
index b8a325295d..4d84d3d15b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
@@ -6,6 +6,8 @@ Subject: [PATCH 01/10] Tell scons to use build settings from environment
 
 Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+Upstream-Status: Pending
 ---
  SConstruct | 8 ++++++--
  1 file changed, 6 insertions(+), 2 deletions(-)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
index 8d82be1b57..cfbcbd9aa2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 03/10] Use __GLIBC__ to control use of gnu_get_libc_version
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/mongo/util/processinfo_linux.cpp | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
index 958e09c3dc..310301d57b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
@@ -9,6 +9,8 @@ since this function expects long long as parameter and not int64_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/mongo/util/procparser.cpp | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
index e726933f56..ad944e4666 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-asio-Dont-use-experimental-with-clang.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 10/10] asio: Dont use experimental with clang
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/third_party/asio-master/asio/include/asio/detail/string_view.hpp | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
index 1373d1a794..8cee14889f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
@@ -10,6 +10,8 @@ for uintXX_t.
 [1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/mongo/db/free_mon/free_mon_options.h | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
index 57f4168f5a..d1e662f291 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
@@ -7,6 +7,8 @@ It depends on the native arch's word size.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/mongo/util/stacktrace_posix.cpp | 9 +++++++++
  1 file changed, 9 insertions(+)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
index 910ef0b5f4..d2ba6eb805 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/SConstruct
 ===================================================================
 --- git.orig/SConstruct
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
index 2cea9bc31f..45051e103d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-wiredtiger-Disable-strtouq-on-musl.patch
@@ -4,6 +4,8 @@ Date: Sat, 2 Sep 2017 13:13:15 -0700
 Subject: [PATCH 09/10] wiredtiger: Disable strtouq on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
 ---
  src/third_party/wiredtiger/build_linux/wiredtiger_config.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
index e4ae30776b..9259f96be8 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
@@ -1,4 +1,3 @@
-Upstream-Status: submitted https://github.com/mongodb/mongo/pull/1296
 From 362be06fc16a5ad0f9e9aa90cc763c5242e8e35c Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Sat, 9 Feb 2019 12:41:45 +0100
@@ -14,6 +13,8 @@ src/mongo/util/net/ssl_manager.cpp: In static member function 'static mongo::Sta
 src/mongo/util/net/ssl_manager.cpp:575:79: error: invalid conversion from 'size_t* {aka unsigned int*}' to 'long unsigned int*' [-fpermissive]
   if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, outLength) ||
 
+Upstream-Status: Submitted [https://github.com/mongodb/mongo/pull/1296]
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
 ---
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
index 1a7bf0fc52..24b0ad58b6 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
@@ -5,6 +5,8 @@ Subject: [PATCH 05/10] Add alises for arm64 which is same as aarch64
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+
+Upstream-Status: Pending
 ---
  SConstruct                                      | 1 +
  src/third_party/IntelRDFPMathLib20U1/SConscript | 2 +-
-- 
2.42.0


