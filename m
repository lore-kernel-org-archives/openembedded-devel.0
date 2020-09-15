Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.13001.1600175694277174964
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 06:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CWYA1tNH;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: vincent.prince.fr@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id x14so3233763wrl.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmGgEUnKmy0lkXoCEaXEDexScSMT51s2QGmnkBK9qK4=;
        b=CWYA1tNHRm5RtWJZVVk1oHgk59Pqvn9n7H+ydVg3FO+ECbKpMdUCR/m+xjSkvY+x2M
         2tUWnY2d0JxFYA4qzETlAtUmMrsn2LsZ6wFci+M5GWKQWyWMsyLpAm7jHxaSDVLrBgQ/
         j0ZKReIuwBnK7A1dzmARN5CaefRQEoyK6j7ezdV05Lriexn3EVULQ6nBlvrP/u6c9YsH
         UqLf91EyahNmaiNK9OkHfz51mJ0P+tkzlsojE6ds5VsjKF8LQJaiEZAK+n5dvEpg8V1Z
         R/7DqV04XpI/xHr2TVdsdoXWtZ+QsbOl3YM40RfL6Ew/3XOJ0meP6HxsvDAvDzSM7uPC
         dfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UmGgEUnKmy0lkXoCEaXEDexScSMT51s2QGmnkBK9qK4=;
        b=PIgE/QYRQgkJm/UsCcY+Nwg4fwnc1iJte9jZjC1YaMGlIf+D06Ho1+jczBvKMWL2jr
         UblMfg0OjQnbZLrHvR8I8h6PXnPwha12/Ckb84ZtcUFbFPruPmFtHkodw4e5qJoLz9mN
         1HRA2PIJudrzHWzDOfu0f6ba+KcyrnlKUMgSFpz8lOAIa8S8qfvbhCytJET+En7u3q+W
         VJFahyFpb242g6OEHwqCJ2ZetRLI3SXEmhYU6ETYBsnz/hadwY4vPAsiLdu3xzvkrxIq
         6bQroCoOrdNqJ4cBHBP7uQJuar4VIL+FfPZG05VTRPwJwXuqf8FqNIj09L9Vh23vZjrP
         JJfQ==
X-Gm-Message-State: AOAM533SvKUrihCcfjdVRI1f5Xw623Win/8V4OXF4vA5bEKPe0zXOP+F
	JM2zg2N+iEoU2o2aH2u3HkgT5K9YO8c=
X-Google-Smtp-Source: ABdhPJymXmZ6zgUhzn54RMDcXYrmuawXiEMo2u4xQWPh4J5pyc4BjuarBaKYxOXqAWfwN1zU/XYaRA==
X-Received: by 2002:adf:fc81:: with SMTP id g1mr20888870wrr.31.1600175692123;
        Tue, 15 Sep 2020 06:14:52 -0700 (PDT)
Return-Path: <vincent.prince.fr@gmail.com>
Received: from vpr-vm.corporate.saft.org (176-130-173-25.abo.bbox.fr. [176.130.173.25])
        by smtp.gmail.com with ESMTPSA id k12sm26470184wrn.39.2020.09.15.06.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 06:14:51 -0700 (PDT)
From: "nefethael" <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince <vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [oe] [meta-oe] [PATCH v3] mongodb: bump to r4.4.1 version
Date: Tue, 15 Sep 2020 15:14:33 +0200
Message-Id: <20200915131433.9994-1-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
Changes in v3:
 - Fix musl compilation by upgrading libmongocrypt to 1.0.4

Changes in v2:
 - remove shell option from packageconfig
 - reformat tabs
 - replace bbwarn by bbnote when binary is not compiled

 ...e-build-settings-from-environment-va.patch |  25 +-
 ...-control-use-of-gnu_get_libc_version.patch |   8 +-
 ...001-Use-long-long-instead-of-int64_t.patch |  15 +-
 ...essage-bump-libmongocrypto-to-v1.0.4.patch | 714 ++++++++++++++++++
 ...ion-for-the-macro-__ELF_NATIVE_CLASS.patch |  13 +-
 .../mongodb/0003-Fix-unknown-prefix-env.patch |   2 +-
 .../recipes-dbs/mongodb/mongodb/1296.patch    |  12 +-
 .../mongodb/mongodb/arm64-support.patch       |  14 +-
 .../recipes-dbs/mongodb/mongodb_git.bb        |  62 +-
 9 files changed, 812 insertions(+), 53 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
index 190884624..b8a325295 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
@@ -1,4 +1,4 @@
-From 1b2e24e14ee72e54e466be2512c78272f62d60b4 Mon Sep 17 00:00:00 2001
+From 8295bb6a60896fed54d6450bca091aea4eea4fb2 Mon Sep 17 00:00:00 2001
 From: Vincent Prince <vincent.prince.fr@gmail.com>
 Date: Mon, 16 Sep 2019 13:21:44 +0200
 Subject: [PATCH 01/10] Tell scons to use build settings from environment
@@ -7,14 +7,14 @@ Subject: [PATCH 01/10] Tell scons to use build settings from environment
 Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
 Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
 ---
- SConstruct                | 8 ++++++--
- 1 files changed, 8 insertions(+), 2 deletions(-)
+ SConstruct | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index 7ebbcbc..e63cf15 100644
+index 89c044ab78..2044c0ddb8 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -608,6 +608,7 @@ def variable_arch_converter(val):
+@@ -593,6 +593,7 @@ def variable_arch_converter(val):
          'amd64':  'x86_64',
          'emt64':   'x86_64',
          'x86':    'i386',
@@ -22,7 +22,7 @@ index 7ebbcbc..e63cf15 100644
      }
      val = val.lower()
  
-@@ -695,7 +696,8 @@ env_vars.Add(
+@@ -723,7 +724,8 @@ env_vars.Add(
  )
  
  env_vars.Add('CC',
@@ -32,7 +32,7 @@ index 7ebbcbc..e63cf15 100644
  
  env_vars.Add('CCFLAGS',
      help='Sets flags for the C and C++ compiler',
-@@ -715,7 +717,8 @@ env_vars.Add('CPPPATH',
+@@ -743,7 +745,8 @@ env_vars.Add('CPPPATH',
      converter=variable_shlex_converter)
  
  env_vars.Add('CXX',
@@ -42,15 +42,14 @@ index 7ebbcbc..e63cf15 100644
  
  env_vars.Add('CXXFLAGS',
      help='Sets flags for the C++ compiler',
-@@ -1018,6 +1021,7 @@ envDict = dict(BUILD_ROOT=buildDir,
-                )
+@@ -1127,6 +1130,7 @@ if get_option('build-tools') == 'next' or get_option('ninja') == 'next':
+     SCons.Tool.DefaultToolpath.insert(0, os.path.abspath('site_scons/site_tools/next'))
  
  env = Environment(variables=env_vars, **envDict)
 +env.PrependENVPath('PATH', os.getenv('PATH'))
- del envDict
- 
- for var in ['CC', 'CXX']:
  
+ # Only print the spinner if stdout is a tty
+ if sys.stdout.isatty():
 -- 
-2.7.4
+2.24.0
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
index d98fa56cb..8d82be1b5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch
@@ -1,4 +1,4 @@
-From d701ceeb15662038435b80ba556a80c17f76d2dc Mon Sep 17 00:00:00 2001
+From 6332823f9fdcb571305b716330e67d0b38810868 Mon Sep 17 00:00:00 2001
 From: Vincent Prince <vincent.prince.fr@gmail.com>
 Date: Mon, 16 Sep 2019 13:30:13 +0200
 Subject: [PATCH 03/10] Use __GLIBC__ to control use of gnu_get_libc_version
@@ -10,7 +10,7 @@ Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/mongo/util/processinfo_linux.cpp b/src/mongo/util/processinfo_linux.cpp
-index cccb91c..45c4b7d 100644
+index a968c54727..0d8b8874e2 100644
 --- a/src/mongo/util/processinfo_linux.cpp
 +++ b/src/mongo/util/processinfo_linux.cpp
 @@ -44,10 +44,10 @@
@@ -27,7 +27,7 @@ index cccb91c..45c4b7d 100644
  #endif
  
  #include <boost/filesystem.hpp>
-@@ -546,7 +546,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() {
+@@ -617,7 +617,7 @@ void ProcessInfo::SystemInfo::collectSystemInfo() {
      std::stringstream ss;
      ss << "uClibc-" << __UCLIBC_MAJOR__ << "." << __UCLIBC_MINOR__ << "." << __UCLIBC_SUBLEVEL__;
      bExtra.append("libcVersion", ss.str());
@@ -37,5 +37,5 @@ index cccb91c..45c4b7d 100644
  #endif
      if (!verSig.empty())
 -- 
-2.7.4
+2.24.0
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
index b9c670407..958e09c3d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
@@ -1,4 +1,4 @@
-From 20fcbf2a05ee6542aba942f6006d149db70fb9ce Mon Sep 17 00:00:00 2001
+From 4e7f15346682482bc2071c7209dec97507d3bc4c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 2 Sep 2017 10:03:37 -0700
 Subject: [PATCH 02/10] Use long long instead of int64_t
@@ -8,12 +8,13 @@ error: call to member function 'appendNumber' is ambiguous
 since this function expects long long as parameter and not int64_t
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
 ---
  src/mongo/util/procparser.cpp | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparser.cpp
-index c574a3f..5ea66b7 100644
+index 24b9d1e2c9..0f274cfff6 100644
 --- a/src/mongo/util/procparser.cpp
 +++ b/src/mongo/util/procparser.cpp
 @@ -261,7 +261,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
@@ -23,7 +24,7 @@ index c574a3f..5ea66b7 100644
 -                    uint64_t value;
 +                    long long  value;
  
-                     if (!parseNumberFromString(stringValue, &value).isOK()) {
+                     if (!NumberParser{}(stringValue, &value).isOK()) {
                          value = 0;
 @@ -273,7 +273,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
              } else {
@@ -32,7 +33,7 @@ index c574a3f..5ea66b7 100644
 -                uint64_t value;
 +                long long value;
  
-                 if (!parseNumberFromString(stringValue, &value).isOK()) {
+                 if (!NumberParser{}(stringValue, &value).isOK()) {
                      value = 0;
 @@ -366,7 +366,7 @@ Status parseProcMemInfo(const std::vector<StringData>& keys,
  
@@ -41,7 +42,7 @@ index c574a3f..5ea66b7 100644
 -            uint64_t value;
 +            long long value;
  
-             if (!parseNumberFromString(stringValue, &value).isOK()) {
+             if (!NumberParser{}(stringValue, &value).isOK()) {
                  value = 0;
 @@ -522,7 +522,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
                            StringData data,
@@ -59,8 +60,8 @@ index c574a3f..5ea66b7 100644
 -                uint64_t value;
 +                long long value;
  
-                 if (!parseNumberFromString(stringValue, &value).isOK()) {
+                 if (!NumberParser{}(stringValue, &value).isOK()) {
                      value = 0;
 -- 
-2.7.4
+2.24.0
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch
new file mode 100644
index 000000000..df4cee2b4
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch
@@ -0,0 +1,714 @@
+From 44272ce47e768e090263df5cb9cb7ce17e544ad3 Mon Sep 17 00:00:00 2001
+From: Vincent Prince <vincent.prince.external@saftbatteries.com>
+Date: Tue, 15 Sep 2020 11:40:15 +0200
+Subject: [PATCH] kms-message: bump libmongocrypto to v1.0.4
+
+This fixes compilation with alpinelinux
+see https://github.com/mongodb/libmongocrypt/pull/89
+
+Upstream-Status: Pending
+
+Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
+---
+ .../kms-message/THIRD_PARTY_NOTICES           |  2 +-
+ src/third_party/kms-message/src/hexlify.c     | 21 +----
+ src/third_party/kms-message/src/hexlify.h     |  2 -
+ .../kms-message/src/kms_crypto_apple.c        |  5 +
+ .../kms-message/src/kms_crypto_libcrypto.c    | 94 +++++++++++++++++++
+ .../kms-message/src/kms_crypto_none.c         |  4 +
+ .../kms-message/src/kms_crypto_windows.c      |  4 +
+ .../kms-message/src/kms_decrypt_request.c     |  2 +-
+ .../kms-message/src/kms_encrypt_request.c     |  2 +-
+ src/third_party/kms-message/src/kms_kv_list.c | 11 ++-
+ .../kms-message/src/kms_message/kms_message.h |  2 +
+ .../src/kms_message/kms_message_defines.h     | 10 ++
+ src/third_party/kms-message/src/kms_port.c    | 33 +++++++
+ src/third_party/kms-message/src/kms_port.h    | 27 +++---
+ src/third_party/kms-message/src/kms_request.c | 41 +++++---
+ .../kms-message/src/kms_request_str.c         | 13 ++-
+ .../kms-message/src/kms_request_str.h         |  5 -
+ .../kms-message/src/kms_response_parser.c     | 26 ++++-
+ .../scripts/kms_message_get_sources.sh        |  2 +-
+ 19 files changed, 244 insertions(+), 62 deletions(-)
+ create mode 100644 src/third_party/kms-message/src/kms_crypto_libcrypto.c
+ create mode 100644 src/third_party/kms-message/src/kms_port.c
+
+diff --git a/src/third_party/kms-message/THIRD_PARTY_NOTICES b/src/third_party/kms-message/THIRD_PARTY_NOTICES
+index 3fc095170c..4110c1b91e 100644
+--- a/src/third_party/kms-message/THIRD_PARTY_NOTICES
++++ b/src/third_party/kms-message/THIRD_PARTY_NOTICES
+@@ -1,4 +1,4 @@
+-License notice for common-b64.c
++License notice for kms_b64.c
+ -------------------------------------------------------------------------------
+ 
+ ISC License
+diff --git a/src/third_party/kms-message/src/hexlify.c b/src/third_party/kms-message/src/hexlify.c
+index be9ee030b9..941fc93d1b 100644
+--- a/src/third_party/kms-message/src/hexlify.c
++++ b/src/third_party/kms-message/src/hexlify.c
+@@ -24,6 +24,8 @@ char *
+ hexlify (const uint8_t *buf, size_t len)
+ {
+    char *hex_chars = malloc (len * 2 + 1);
++   KMS_ASSERT (hex_chars);
++
+    char *p = hex_chars;
+    size_t i;
+ 
+@@ -35,22 +37,3 @@ hexlify (const uint8_t *buf, size_t len)
+ 
+    return hex_chars;
+ }
+-
+-uint8_t *
+-unhexlify (const char *hex_chars, size_t *len)
+-{
+-   uint8_t *buf;
+-   uint8_t *pos;
+-
+-   *len = strlen (hex_chars) / 2;
+-   buf = malloc (*len);
+-   pos = buf;
+-
+-   while (*hex_chars) {
+-      KMS_ASSERT (1 == sscanf (hex_chars, "%2hhx", pos));
+-      pos++;
+-      hex_chars += 2;
+-   }
+-
+-   return buf;
+-}
+diff --git a/src/third_party/kms-message/src/hexlify.h b/src/third_party/kms-message/src/hexlify.h
+index e0096eb6ca..a6a504ebe8 100644
+--- a/src/third_party/kms-message/src/hexlify.h
++++ b/src/third_party/kms-message/src/hexlify.h
+@@ -19,5 +19,3 @@
+ 
+ char *
+ hexlify (const uint8_t *buf, size_t len);
+-uint8_t *
+-unhexlify (const char *hex_chars, size_t *len);
+diff --git a/src/third_party/kms-message/src/kms_crypto_apple.c b/src/third_party/kms-message/src/kms_crypto_apple.c
+index 61da0a6288..a26e0d65e8 100644
+--- a/src/third_party/kms-message/src/kms_crypto_apple.c
++++ b/src/third_party/kms-message/src/kms_crypto_apple.c
+@@ -16,9 +16,12 @@
+ 
+ #include "kms_crypto.h"
+ 
++#ifdef KMS_MESSAGE_ENABLE_CRYPTO_COMMON_CRYPTO
++
+ #include <CommonCrypto/CommonDigest.h>
+ #include <CommonCrypto/CommonHMAC.h>
+ 
++
+ int
+ kms_crypto_init ()
+ {
+@@ -54,3 +57,5 @@ kms_sha256_hmac (void *unused_ctx,
+    CCHmac (kCCHmacAlgSHA256, key_input, key_len, input, len, hash_out);
+    return true;
+ }
++
++#endif /* KMS_MESSAGE_ENABLE_CRYPTO_COMMON_CRYPTO */
+diff --git a/src/third_party/kms-message/src/kms_crypto_libcrypto.c b/src/third_party/kms-message/src/kms_crypto_libcrypto.c
+new file mode 100644
+index 0000000000..6f25657fdd
+--- /dev/null
++++ b/src/third_party/kms-message/src/kms_crypto_libcrypto.c
+@@ -0,0 +1,94 @@
++/*
++ * Copyright 2018-present MongoDB, Inc.
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *   http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#include "kms_crypto.h"
++
++#ifdef KMS_MESSAGE_ENABLE_CRYPTO_LIBCRYPTO
++
++#include <openssl/sha.h>
++#include <openssl/evp.h>
++#include <openssl/hmac.h>
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++   (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x20700000L)
++static EVP_MD_CTX *
++EVP_MD_CTX_new (void)
++{
++   return calloc (sizeof (EVP_MD_CTX), 1);
++}
++
++static void
++EVP_MD_CTX_free (EVP_MD_CTX *ctx)
++{
++   EVP_MD_CTX_cleanup (ctx);
++   free (ctx);
++}
++#endif
++
++int
++kms_crypto_init ()
++{
++   return 0;
++}
++
++void
++kms_crypto_cleanup ()
++{
++}
++
++bool
++kms_sha256 (void *unused_ctx,
++            const char *input,
++            size_t len,
++            unsigned char *hash_out)
++{
++   EVP_MD_CTX *digest_ctxp = EVP_MD_CTX_new ();
++   bool rval = false;
++
++   if (1 != EVP_DigestInit_ex (digest_ctxp, EVP_sha256 (), NULL)) {
++      goto cleanup;
++   }
++
++   if (1 != EVP_DigestUpdate (digest_ctxp, input, len)) {
++      goto cleanup;
++   }
++
++   rval = (1 == EVP_DigestFinal_ex (digest_ctxp, hash_out, NULL));
++
++cleanup:
++   EVP_MD_CTX_free (digest_ctxp);
++
++   return rval;
++}
++
++bool
++kms_sha256_hmac (void *unused_ctx,
++                 const char *key_input,
++                 size_t key_len,
++                 const char *input,
++                 size_t len,
++                 unsigned char *hash_out)
++{
++   return HMAC (EVP_sha256 (),
++                key_input,
++                key_len,
++                (unsigned char *) input,
++                len,
++                hash_out,
++                NULL) != NULL;
++}
++
++#endif /* KMS_MESSAGE_ENABLE_CRYPTO_LIBCRYPTO */
+diff --git a/src/third_party/kms-message/src/kms_crypto_none.c b/src/third_party/kms-message/src/kms_crypto_none.c
+index 9ef2147687..94da5abd88 100644
+--- a/src/third_party/kms-message/src/kms_crypto_none.c
++++ b/src/third_party/kms-message/src/kms_crypto_none.c
+@@ -16,6 +16,8 @@
+ 
+ #include "kms_crypto.h"
+ 
++#ifndef KMS_MESSAGE_ENABLE_CRYPTO
++
+ int
+ kms_crypto_init ()
+ {
+@@ -48,3 +50,5 @@ kms_sha256_hmac (void *unused_ctx,
+    /* only gets called if hooks were mistakenly not set */
+    return false;
+ }
++
++#endif /* KMS_MESSAGE_ENABLE_CRYPTO */
+diff --git a/src/third_party/kms-message/src/kms_crypto_windows.c b/src/third_party/kms-message/src/kms_crypto_windows.c
+index ccdc7e095d..8177b0ddc0 100644
+--- a/src/third_party/kms-message/src/kms_crypto_windows.c
++++ b/src/third_party/kms-message/src/kms_crypto_windows.c
+@@ -16,6 +16,8 @@
+ 
+ #include "kms_crypto.h"
+ 
++#ifdef KMS_MESSAGE_ENABLE_CRYPTO_CNG
++
+ // tell windows.h not to include a bunch of headers we don't need:
+ #define WIN32_LEAN_AND_MEAN
+ 
+@@ -130,3 +132,5 @@ cleanup:
+ 
+    return status == STATUS_SUCCESS ? 1 : 0;
+ }
++
++#endif /* KMS_MESSAGE_ENABLE_CRYPTO_CNG */
+diff --git a/src/third_party/kms-message/src/kms_decrypt_request.c b/src/third_party/kms-message/src/kms_decrypt_request.c
+index 06faa43119..f1ca282768 100644
+--- a/src/third_party/kms-message/src/kms_decrypt_request.c
++++ b/src/third_party/kms-message/src/kms_decrypt_request.c
+@@ -48,7 +48,7 @@ kms_decrypt_request_new (const uint8_t *ciphertext_blob,
+    if (!(b64 = malloc (b64_len))) {
+       KMS_ERROR (request,
+                  "Could not allocate %d bytes for base64-encoding payload",
+-                 b64_len);
++                 (int) b64_len);
+       goto done;
+    }
+ 
+diff --git a/src/third_party/kms-message/src/kms_encrypt_request.c b/src/third_party/kms-message/src/kms_encrypt_request.c
+index b5f4d6436e..24b064d95f 100644
+--- a/src/third_party/kms-message/src/kms_encrypt_request.c
++++ b/src/third_party/kms-message/src/kms_encrypt_request.c
+@@ -47,7 +47,7 @@ kms_encrypt_request_new (const uint8_t *plaintext,
+    if (!(b64 = malloc (b64_len))) {
+       KMS_ERROR (request,
+                  "Could not allocate %d bytes for base64-encoding payload",
+-                 b64_len);
++                 (int) b64_len);
+       goto done;
+    }
+ 
+diff --git a/src/third_party/kms-message/src/kms_kv_list.c b/src/third_party/kms-message/src/kms_kv_list.c
+index 2d6845a1aa..0cff3dc2c6 100644
+--- a/src/third_party/kms-message/src/kms_kv_list.c
++++ b/src/third_party/kms-message/src/kms_kv_list.c
+@@ -17,6 +17,7 @@
+ 
+ #include "kms_kv_list.h"
+ #include "kms_message/kms_message.h"
++#include "kms_message_private.h"
+ #include "kms_request_str.h"
+ #include "kms_port.h"
+ #include "sort.h"
+@@ -39,9 +40,12 @@ kms_kv_list_t *
+ kms_kv_list_new (void)
+ {
+    kms_kv_list_t *lst = malloc (sizeof (kms_kv_list_t));
++   KMS_ASSERT (lst);
+ 
+    lst->size = 16;
+    lst->kvs = malloc (lst->size * sizeof (kms_kv_t));
++   KMS_ASSERT (lst->kvs);
++
+    lst->len = 0;
+ 
+    return lst;
+@@ -72,6 +76,7 @@ kms_kv_list_add (kms_kv_list_t *lst,
+    if (lst->len == lst->size) {
+       lst->size *= 2;
+       lst->kvs = realloc (lst->kvs, lst->size * sizeof (kms_kv_t));
++      KMS_ASSERT (lst->kvs);
+    }
+ 
+    kv_init (&lst->kvs[lst->len], key, value);
+@@ -84,7 +89,7 @@ kms_kv_list_find (const kms_kv_list_t *lst, const char *key)
+    size_t i;
+ 
+    for (i = 0; i < lst->len; i++) {
+-      if (0 == strcasecmp (lst->kvs[i].key->str, key)) {
++      if (0 == kms_strcasecmp (lst->kvs[i].key->str, key)) {
+          return &lst->kvs[i];
+       }
+    }
+@@ -119,8 +124,12 @@ kms_kv_list_dup (const kms_kv_list_t *lst)
+    }
+ 
+    dup = malloc (sizeof (kms_kv_list_t));
++   KMS_ASSERT (dup);
++
+    dup->size = dup->len = lst->len;
+    dup->kvs = malloc (lst->len * sizeof (kms_kv_t));
++   KMS_ASSERT (dup->kvs);
++
+ 
+    for (i = 0; i < lst->len; i++) {
+       kv_init (&dup->kvs[i], lst->kvs[i].key, lst->kvs[i].value);
+diff --git a/src/third_party/kms-message/src/kms_message/kms_message.h b/src/third_party/kms-message/src/kms_message/kms_message.h
+index 6ea95dd04c..8048528f2e 100644
+--- a/src/third_party/kms-message/src/kms_message/kms_message.h
++++ b/src/third_party/kms-message/src/kms_message/kms_message.h
+@@ -17,6 +17,8 @@
+ #ifndef KMS_MESSAGE_H
+ #define KMS_MESSAGE_H
+ 
++#include <sys/types.h>
++
+ #include "kms_message_defines.h"
+ #include "kms_request_opt.h"
+ #include "kms_request.h"
+diff --git a/src/third_party/kms-message/src/kms_message/kms_message_defines.h b/src/third_party/kms-message/src/kms_message/kms_message_defines.h
+index a4d019bd77..a539d531ef 100644
+--- a/src/third_party/kms-message/src/kms_message/kms_message_defines.h
++++ b/src/third_party/kms-message/src/kms_message/kms_message_defines.h
+@@ -53,4 +53,14 @@ kms_message_cleanup (void);
+ } /* extern "C" */
+ #endif
+ 
++#ifdef _MSC_VER
++#include <basetsd.h>
++#pragma warning(disable : 4142)
++#ifndef _SSIZE_T_DEFINED
++#define _SSIZE_T_DEFINED
++typedef SSIZE_T ssize_t;
++#endif
++#pragma warning(default : 4142)
++#endif
++
+ #endif /* KMS_MESSAGE_DEFINES_H */
+diff --git a/src/third_party/kms-message/src/kms_port.c b/src/third_party/kms-message/src/kms_port.c
+new file mode 100644
+index 0000000000..ee9e6ed9c9
+--- /dev/null
++++ b/src/third_party/kms-message/src/kms_port.c
+@@ -0,0 +1,33 @@
++/*
++ * Copyright 2020-present MongoDB, Inc.
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *   http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ */
++
++#include "kms_port.h"
++#if defined(_WIN32)
++#include <stdlib.h>
++#include <string.h>
++char * kms_strndup (const char *src, size_t len)
++{
++   char *dst = (char *) malloc (len + 1);
++   if (!dst) {
++      return 0;
++   }
++
++   memcpy (dst, src, len);
++   dst[len] = '\0';
++
++   return dst;
++}
++#endif
+\ No newline at end of file
+diff --git a/src/third_party/kms-message/src/kms_port.h b/src/third_party/kms-message/src/kms_port.h
+index c3cbbac369..2123a99dc9 100644
+--- a/src/third_party/kms-message/src/kms_port.h
++++ b/src/third_party/kms-message/src/kms_port.h
+@@ -15,21 +15,18 @@
+  * limitations under the License.
+  */
+ 
+-#if defined(_WIN32)
+-#define strcasecmp _stricmp
+-
+-inline char *
+-strndup (const char *src, size_t len)
+-{
+-   char *dst = (char *) malloc (len + 1);
+-   if (!dst) {
+-      return 0;
+-   }
+-
+-   memcpy (dst, src, len);
+-   dst[len] = '\0';
++#ifndef KMS_PORT_H
++#define KMS_PORT_H
+ 
+-   return dst;
+-}
++#include <stddef.h>
+ 
++#if defined(_WIN32)
++#define kms_strcasecmp _stricmp
++char *
++kms_strndup (const char *src, size_t len);
++#else
++#define kms_strndup strndup
++#define kms_strcasecmp strcasecmp
+ #endif
++
++#endif /* KMS_PORT_H */
+\ No newline at end of file
+diff --git a/src/third_party/kms-message/src/kms_request.c b/src/third_party/kms-message/src/kms_request.c
+index fa2d487123..ac2b07ea6b 100644
+--- a/src/third_party/kms-message/src/kms_request.c
++++ b/src/third_party/kms-message/src/kms_request.c
+@@ -61,6 +61,7 @@ kms_request_new (const char *method,
+    kms_request_t *request = calloc (1, sizeof (kms_request_t));
+    const char *question_mark;
+ 
++   KMS_ASSERT (request);
+    /* parsing may set failed to true */
+    request->failed = false;
+ 
+@@ -92,10 +93,14 @@ kms_request_new (const char *method,
+    request->header_fields = kms_kv_list_new ();
+    request->auto_content_length = true;
+ 
+-   kms_request_set_date (request, NULL);
++   if (!kms_request_set_date (request, NULL)) {
++      return request;
++   }
+ 
+    if (opt && opt->connection_close) {
+-      kms_request_add_header_field (request, "Connection", "close");
++      if (!kms_request_add_header_field (request, "Connection", "close")) {
++         return request;
++      }
+    }
+ 
+    if (opt && opt->crypto.sha256) {
+@@ -164,7 +169,9 @@ kms_request_set_date (kms_request_t *request, const struct tm *tm)
+    kms_request_str_set_chars (request->date, buf, sizeof "YYYYmmDD" - 1);
+    kms_request_str_set_chars (request->datetime, buf, sizeof AMZ_DT_FORMAT - 1);
+    kms_kv_list_del (request->header_fields, "X-Amz-Date");
+-   kms_request_add_header_field (request, "X-Amz-Date", buf);
++   if (!kms_request_add_header_field (request, "X-Amz-Date", buf)) {
++      return false;
++   }
+ 
+    return true;
+ }
+@@ -309,7 +316,8 @@ append_canonical_headers (kms_kv_list_t *lst, kms_request_str_t *str)
+     * values in headers that have multiple values." */
+    for (i = 0; i < lst->len; i++) {
+       kv = &lst->kvs[i];
+-      if (previous_key && 0 == strcasecmp (previous_key->str, kv->key->str)) {
++      if (previous_key &&
++          0 == kms_strcasecmp (previous_key->str, kv->key->str)) {
+          /* duplicate header */
+          kms_request_str_append_char (str, ',');
+          kms_request_str_append_stripped (str, kv->value);
+@@ -339,12 +347,13 @@ append_signed_headers (kms_kv_list_t *lst, kms_request_str_t *str)
+ 
+    for (i = 0; i < lst->len; i++) {
+       kv = &lst->kvs[i];
+-      if (previous_key && 0 == strcasecmp (previous_key->str, kv->key->str)) {
++      if (previous_key &&
++          0 == kms_strcasecmp (previous_key->str, kv->key->str)) {
+          /* duplicate header */
+          continue;
+       }
+ 
+-      if (0 == strcasecmp (kv->key->str, "connection")) {
++      if (0 == kms_strcasecmp (kv->key->str, "connection")) {
+          continue;
+       }
+ 
+@@ -412,7 +421,8 @@ finalize (kms_request_t *request)
+ static int
+ cmp_header_field_names (const void *a, const void *b)
+ {
+-   return strcasecmp (((kms_kv_t *) a)->key->str, ((kms_kv_t *) b)->key->str);
++   return kms_strcasecmp (((kms_kv_t *) a)->key->str,
++                          ((kms_kv_t *) b)->key->str);
+ }
+ 
+ static kms_kv_list_t *
+@@ -447,6 +457,7 @@ kms_request_get_canonical (kms_request_t *request)
+    kms_request_str_append_newline (canonical);
+    normalized = kms_request_str_path_normalized (request->path);
+    kms_request_str_append_escaped (canonical, normalized, false);
++   kms_request_str_destroy (normalized);
+    kms_request_str_append_newline (canonical);
+    append_canonical_query (request, canonical);
+    kms_request_str_append_newline (canonical);
+@@ -454,12 +465,14 @@ kms_request_get_canonical (kms_request_t *request)
+    append_canonical_headers (lst, canonical);
+    kms_request_str_append_newline (canonical);
+    append_signed_headers (lst, canonical);
+-   kms_request_str_append_newline (canonical);
+-   kms_request_str_append_hashed (
+-      &request->crypto, canonical, request->payload);
+-
+-   kms_request_str_destroy (normalized);
+    kms_kv_list_destroy (lst);
++   kms_request_str_append_newline (canonical);
++   if (!kms_request_str_append_hashed (
++          &request->crypto, canonical, request->payload)) {
++      KMS_ERROR (request, "could not generate hash");
++      kms_request_str_destroy (canonical);
++      return NULL;
++   }
+ 
+    return kms_request_str_detach (canonical);
+ }
+@@ -514,6 +527,10 @@ kms_request_get_string_to_sign (kms_request_t *request)
+    kms_request_str_append_chars (sts, "/aws4_request\n", -1);
+ 
+    creq = kms_request_str_wrap (kms_request_get_canonical (request), -1);
++   if (!creq) {
++      goto done;
++   }
++
+    if (!kms_request_str_append_hashed (&request->crypto, sts, creq)) {
+       goto done;
+    }
+diff --git a/src/third_party/kms-message/src/kms_request_str.c b/src/third_party/kms-message/src/kms_request_str.c
+index 0f7c19c972..65207d2f4f 100644
+--- a/src/third_party/kms-message/src/kms_request_str.c
++++ b/src/third_party/kms-message/src/kms_request_str.c
+@@ -51,10 +51,13 @@ kms_request_str_t *
+ kms_request_str_new (void)
+ {
+    kms_request_str_t *s = malloc (sizeof (kms_request_str_t));
++   KMS_ASSERT (s);
+ 
+    s->len = 0;
+    s->size = 16;
+    s->str = malloc (s->size);
++   KMS_ASSERT (s->str);
++
+    s->str[0] = '\0';
+ 
+    return s;
+@@ -64,11 +67,15 @@ kms_request_str_t *
+ kms_request_str_new_from_chars (const char *chars, ssize_t len)
+ {
+    kms_request_str_t *s = malloc (sizeof (kms_request_str_t));
++   KMS_ASSERT (s);
++
+    size_t actual_len;
+ 
+    actual_len = len < 0 ? strlen (chars) : (size_t) len;
+    s->size = actual_len + 1;
+    s->str = malloc (s->size);
++   KMS_ASSERT (s->str);
++
+    memcpy (s->str, chars, actual_len);
+    s->str[actual_len] = '\0';
+    s->len = actual_len;
+@@ -86,6 +93,8 @@ kms_request_str_wrap (char *chars, ssize_t len)
+    }
+ 
+    s = malloc (sizeof (kms_request_str_t));
++   KMS_ASSERT (s);
++
+ 
+    s->str = chars;
+    s->len = len < 0 ? strlen (chars) : (size_t) len;
+@@ -148,8 +157,10 @@ kms_request_str_t *
+ kms_request_str_dup (kms_request_str_t *str)
+ {
+    kms_request_str_t *dup = malloc (sizeof (kms_request_str_t));
++   KMS_ASSERT (dup);
++
+ 
+-   dup->str = strndup (str->str, str->len);
++   dup->str = kms_strndup (str->str, str->len);
+    dup->len = str->len;
+    dup->size = str->len + 1;
+ 
+diff --git a/src/third_party/kms-message/src/kms_request_str.h b/src/third_party/kms-message/src/kms_request_str.h
+index f053a595aa..0898f59067 100644
+--- a/src/third_party/kms-message/src/kms_request_str.h
++++ b/src/third_party/kms-message/src/kms_request_str.h
+@@ -25,11 +25,6 @@
+ #include <stdint.h>
+ #include <string.h>
+ 
+-#if defined(_WIN32)
+-#include <basetsd.h>
+-typedef SSIZE_T ssize_t;
+-#endif // _WIN32
+-
+ typedef struct {
+    char *str;
+    size_t len;
+diff --git a/src/third_party/kms-message/src/kms_response_parser.c b/src/third_party/kms-message/src/kms_response_parser.c
+index 31e4868a68..6f86fac854 100644
+--- a/src/third_party/kms-message/src/kms_response_parser.c
++++ b/src/third_party/kms-message/src/kms_response_parser.c
+@@ -1,7 +1,7 @@
+ #include "kms_message/kms_response_parser.h"
+ #include "kms_message_private.h"
+ 
+-#include "kms_message_private.h"
++#include <errno.h>
+ #include <limits.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -24,6 +24,7 @@ _parser_init (kms_response_parser_t *parser)
+    parser->raw_response = kms_request_str_new ();
+    parser->content_length = -1;
+    parser->response = calloc (1, sizeof (kms_response_t));
++   KMS_ASSERT (parser->response);
+    parser->response->headers = kms_kv_list_new ();
+    parser->state = PARSING_STATUS_LINE;
+    parser->start = 0;
+@@ -34,6 +35,8 @@ kms_response_parser_t *
+ kms_response_parser_new (void)
+ {
+    kms_response_parser_t *parser = malloc (sizeof (kms_response_parser_t));
++   KMS_ASSERT (parser);
++
+    _parser_init (parser);
+    return parser;
+ }
+@@ -59,11 +62,26 @@ static bool
+ _parse_int (const char *str, int *result)
+ {
+    char *endptr = NULL;
++   int64_t long_result;
+ 
+-   *result = (int) strtol (str, &endptr, 10);
+-   if (*endptr) {
++   errno = 0;
++   long_result = strtol (str, &endptr, 10);
++   if (endptr == str) {
++      /* No digits were parsed. Consider this an error */
++      return false;
++   }
++   if (endptr != NULL && *endptr != '\0') {
++      /* endptr points to the first invalid character. */
++      return false;
++   }
++   if (errno == EINVAL || errno == ERANGE) {
++      return false;
++   }
++   if (long_result > INT32_MAX || long_result < INT32_MIN) {
+       return false;
+    }
++   *result = (int) long_result;
++
+    return true;
+ }
+ 
+@@ -72,6 +90,8 @@ static bool
+ _parse_int_from_view (const char *str, int start, int end, int *result)
+ {
+    char *num_str = malloc (end - start + 1);
++   KMS_ASSERT (num_str);
++
+    bool ret;
+ 
+    strncpy (num_str, str + start, end - start);
+diff --git a/src/third_party/scripts/kms_message_get_sources.sh b/src/third_party/scripts/kms_message_get_sources.sh
+index 6ad2fbb0e6..52ce21b9dd 100755
+--- a/src/third_party/scripts/kms_message_get_sources.sh
++++ b/src/third_party/scripts/kms_message_get_sources.sh
+@@ -18,7 +18,7 @@ if grep -q Microsoft /proc/version; then
+ fi
+ 
+ NAME=libmongocrypt
+-REVISION=59c8c17bbdfa1cf0fdec60cfdde73a437a868221
++REVISION=052f7fc610f0cea83a2adf3dd263a5ff04833371
+ 
+ if grep -q Microsoft /proc/version; then
+     SRC_ROOT=$(wslpath -u $(powershell.exe -Command "Get-ChildItem Env:TEMP | Get-Content | Write-Host"))
+-- 
+2.24.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
index 869d2849d..57f4168f5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-Add-a-definition-for-the-macro-__ELF_NATIVE_CLASS.patch
@@ -1,4 +1,4 @@
-From 73c6374ceb0c062e91210cc9ef3e0e9fa30ee514 Mon Sep 17 00:00:00 2001
+From 28f34191eef1e70c24d2f81b66e4dd40dbefcd35 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 2 Sep 2017 12:42:30 -0700
 Subject: [PATCH 04/10] Add a definition for the macro __ELF_NATIVE_CLASS
@@ -6,17 +6,18 @@ Subject: [PATCH 04/10] Add a definition for the macro __ELF_NATIVE_CLASS
 It depends on the native arch's word size.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
 ---
  src/mongo/util/stacktrace_posix.cpp | 9 +++++++++
  1 file changed, 9 insertions(+)
 
 diff --git a/src/mongo/util/stacktrace_posix.cpp b/src/mongo/util/stacktrace_posix.cpp
-index 1d7b3d7..f81e329 100644
+index 531e21bdc2..fa611499e4 100644
 --- a/src/mongo/util/stacktrace_posix.cpp
 +++ b/src/mongo/util/stacktrace_posix.cpp
-@@ -39,6 +39,15 @@
+@@ -42,6 +42,15 @@
+ #include <iostream>
  #include <string>
- #include <sys/utsname.h>
  
 +#if !defined(__GLIBC__)
 +#if defined __x86_64__ && !defined __ILP32__
@@ -28,8 +29,8 @@ index 1d7b3d7..f81e329 100644
 +#endif
 +
  #include "mongo/base/init.h"
+ #include "mongo/bson/json.h"
  #include "mongo/config.h"
- #include "mongo/db/jsobj.h"
 -- 
-2.7.4
+2.24.0
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
index 3a27aacfe..910ef0b5f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-Fix-unknown-prefix-env.patch
@@ -2,7 +2,7 @@ Index: git/SConstruct
 ===================================================================
 --- git.orig/SConstruct
 +++ git/SConstruct
-@@ -884,6 +884,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
+@@ -977,6 +977,14 @@ env_vars.Add('WINDOWS_OPENSSL_BIN',
      help='Sets the path to the openssl binaries for packaging',
      default='c:/openssl/bin')
  
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
index ae84bcb56..e4ae30776 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/1296.patch
@@ -15,15 +15,16 @@ src/mongo/util/net/ssl_manager.cpp:575:79: error: invalid conversion from 'size_
   if (mongoUnsignedAddOverflow64(tagAndLengthByteCount, derLength, outLength) ||
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
 ---
  src/mongo/util/net/ssl_manager.cpp | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/mongo/util/net/ssl_manager.cpp b/src/mongo/util/net/ssl_manager.cpp
-index b93ebe84a4a3..3511eb5d998f 100644
+index 455a1662a5..e8497bc0d1 100644
 --- a/src/mongo/util/net/ssl_manager.cpp
 +++ b/src/mongo/util/net/ssl_manager.cpp
-@@ -782,7 +782,7 @@ class DERToken {
+@@ -810,7 +810,7 @@ public:
       *
       * Returns a DERToken which consists of the (tag, length, value) tuple.
       */
@@ -32,7 +33,7 @@ index b93ebe84a4a3..3511eb5d998f 100644
  
  private:
      DERType _type{DERType::EndOfContent};
-@@ -799,7 +799,7 @@ struct DataType::Handler<DERToken> {
+@@ -827,7 +827,7 @@ struct DataType::Handler<DERToken> {
                         size_t length,
                         size_t* advanced,
                         std::ptrdiff_t debug_offset) {
@@ -41,7 +42,7 @@ index b93ebe84a4a3..3511eb5d998f 100644
  
          auto swPair = DERToken::parse(ConstDataRange(ptr, length), &outLength);
  
-@@ -844,7 +844,7 @@ StatusWith<std::string> readDERString(ConstDataRangeCursor& cdc) {
+@@ -889,7 +889,7 @@ StatusWith<DERInteger> readDERInt(ConstDataRangeCursor& cdc) {
  }
  
  
@@ -50,3 +51,6 @@ index b93ebe84a4a3..3511eb5d998f 100644
      const size_t kTagLength = 1;
      const size_t kTagLengthAndInitialLengthByteLength = kTagLength + 1;
  
+-- 
+2.24.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
index 15bd7da70..1a7bf0fc5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/arm64-support.patch
@@ -1,4 +1,4 @@
-From c9fc9e9a44b0fb764ce86a5e57f17d3c5bbfd8cd Mon Sep 17 00:00:00 2001
+From 298d958148f1fb2bb7725fed15c68c09677c14c9 Mon Sep 17 00:00:00 2001
 From: Vincent Prince <vincent.prince.fr@gmail.com>
 Date: Mon, 16 Sep 2019 13:37:10 +0200
 Subject: [PATCH 05/10] Add alises for arm64 which is same as aarch64
@@ -12,10 +12,10 @@ Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
  3 files changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/SConstruct b/SConstruct
-index e63cf15..5593c78 100644
+index 448939bdd0..abfd816f3e 100644
 --- a/SConstruct
 +++ b/SConstruct
-@@ -1129,6 +1129,7 @@ elif endian == "big":
+@@ -1228,6 +1228,7 @@ if endian == "auto":
  processor_macros = {
      'arm'        : { 'endian': 'little', 'defines': ('__arm__',) },
      'aarch64'    : { 'endian': 'little', 'defines': ('__arm64__', '__aarch64__')},
@@ -24,10 +24,10 @@ index e63cf15..5593c78 100644
      'ppc64le'    : { 'endian': 'little', 'defines': ('__powerpc64__',)},
      's390x'      : { 'endian': 'big',    'defines': ('__s390x__',)},
 diff --git a/src/third_party/IntelRDFPMathLib20U1/SConscript b/src/third_party/IntelRDFPMathLib20U1/SConscript
-index f23c071..fb82cd6 100644
+index 58e1b7ba65..bffe83b462 100644
 --- a/src/third_party/IntelRDFPMathLib20U1/SConscript
 +++ b/src/third_party/IntelRDFPMathLib20U1/SConscript
-@@ -308,7 +308,7 @@ if processor == 'i386' or processor == 'emscripten':
+@@ -309,7 +309,7 @@ if processor == 'i386' or processor == 'emscripten':
  elif processor == 'arm':
      cpp_defines['IA32'] = '1'
      cpp_defines['ia32'] = '1'
@@ -37,7 +37,7 @@ index f23c071..fb82cd6 100644
      cpp_defines['EFI2'] = '1'
  # Using 64 bit little endian
 diff --git a/src/third_party/wiredtiger/SConscript b/src/third_party/wiredtiger/SConscript
-index cdd090b..97a1b3b 100644
+index d6bd665e23..2f1e656a19 100644
 --- a/src/third_party/wiredtiger/SConscript
 +++ b/src/third_party/wiredtiger/SConscript
 @@ -152,7 +152,7 @@ condition_map = {
@@ -50,5 +50,5 @@ index cdd090b..97a1b3b 100644
      'X86_HOST'     : env['TARGET_ARCH'] == 'x86_64',
      'ZSERIES_HOST' : env['TARGET_ARCH'] == 's390x',
 -- 
-2.7.4
+2.24.0
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 58841ef31..0606e3440 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -9,12 +9,13 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
            python3-psutil-native python3-regex-native \
            "
 
-inherit scons dos2unix siteinfo python3native
+inherit scons dos2unix siteinfo python3native systemd useradd
 
-PV = "4.2.2"
-#v4.2.2
-SRCREV = "a0bbbff6ada159e19298d37946ac8dc4b497eadf"
-SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.2 \
+PV = "4.4.1"
+#v4.4.1
+SRCREV = "ad91a93a5a31e175f5cbf8c69561e788bbc55ce1"
+SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4 \
+           file://0001-kms-message-bump-libmongocrypto-to-v1.0.4.patch \
            file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
            file://0001-Use-long-long-instead-of-int64_t.patch \
            file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
@@ -35,6 +36,7 @@ SRC_URI_append_toolchain-clang = "\
            file://0001-asio-Dont-use-experimental-with-clang.patch \
            "
 
+
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST ?= '(x86_64|i.86|powerpc64|arm|aarch64).*-linux'
@@ -51,26 +53,64 @@ PACKAGECONFIG[tcmalloc] = "--use-system-tcmalloc,--allocator=system,gperftools,"
 PACKAGECONFIG[shell] = ",--js-engine=none,,"
 PACKAGECONFIG[system-pcre] = "--use-system-pcre,,libpcre,"
 
-EXTRA_OESCONS = "--prefix=${D}${prefix} \
+EXTRA_OESCONS = "PREFIX=${prefix} \
+                 DESTDIR=${D} \
                  LIBPATH=${STAGING_LIBDIR} \
                  LINKFLAGS='${LDFLAGS}' \
                  CXXFLAGS='${CXXFLAGS}' \
                  TARGET_ARCH=${TARGET_ARCH} \
+                 MONGO_VERSION=${PV} \
                  --ssl \
                  --disable-warnings-as-errors \
                  --use-system-zlib \
                  --nostrip \
                  --endian=${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', 'little', 'big', d)} \
                  --wiredtiger=${@['off','on'][d.getVar('SITEINFO_BITS') != '32']} \
-                 ${PACKAGECONFIG_CONFARGS} \
-                 core"
+                 --separate-debug \
+                 ${PACKAGECONFIG_CONFARGS}"
+
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/${BPN} --shell /bin/false --user-group ${BPN}"
+
 
 scons_do_compile() {
-        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} || \
+        ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} ${EXTRA_OESCONS} install-core || \
         die "scons build execution failed."
 }
 
 scons_do_install() {
-        ${STAGING_BINDIR_NATIVE}/scons install ${EXTRA_OESCONS}|| \
-        die "scons install execution failed."
+        # install binaries
+        install -d ${D}${bindir}
+        for i in mongod mongos mongo
+        do
+            if [ -f ${B}/build/opt/mongo/${i} ]
+            then
+                install -m 0755 ${B}/build/opt/mongo/${i} ${D}${bindir}/${i}
+            else
+                bbnote "${i} does not exist"
+            fi
+        done
+
+        # install config
+        install -d ${D}${sysconfdir}
+        install -m 0644 ${S}/debian/mongod.conf ${D}${sysconfdir}/
+
+        # install systemd service
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${S}/debian/mongod.service ${D}${systemd_system_unitdir}
+
+        # install mongo data folder
+        install -m 755 -d ${D}${localstatedir}/lib/${BPN}
+        chown ${PN}:${PN} ${D}${localstatedir}/lib/${BPN}
+
+        # Log files
+        install -m 755 -d ${D}${localstatedir}/log/${BPN}
+        chown ${PN}:${PN} ${D}${localstatedir}/log/${BPN}
 }
+
+CONFFILES_${PN} = "${sysconfdir}/mongod.conf"
+
+SYSTEMD_SERVICE_${PN} = "mongod.service"
+
+
-- 
2.24.0

