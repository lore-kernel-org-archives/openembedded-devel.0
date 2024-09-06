Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6CBCE7AB2
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 04:56:32 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.28071.1725598586986990897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 21:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apvvTB4A;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5dca9cc71b2so997647eaf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 21:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725598585; x=1726203385; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qn/2zVH56Q1K0d9P6KcCqVLbpjPiEvbrylMfSvC6m0=;
        b=apvvTB4AVwf+CHZ7qdwYeIo7budTQAVxELh1xoPMenoBsHWJOjCRWNyV/y2IPwVNC7
         55lo2ZWl6KZ9j1K1Z39LGGFeSELay7PX5l9so0Dv4Y8NzuZxgTA1WKIBycBpxEbF3GzK
         IzAWUFXX9sfTLFJVeZRFaKL2fa87KnPqpbl37VDT1sT4dMeoRJv0iGbxBfuGL3d+vFvM
         v4qtFV+aSVSc869k1o3fFzYgbqoEtAdcitmPmazxFt689jyVSrZD39JhSMr5wHZZwjsb
         8fbQf0TnAgWkuBxWVkIO3Kz0ocOrohSWHsoMDclGvY80p75NNGZQErcJsajEwTzTmGP1
         /lDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725598585; x=1726203385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qn/2zVH56Q1K0d9P6KcCqVLbpjPiEvbrylMfSvC6m0=;
        b=U1aUFEdl2MrVQElQmXMHo7vqIbRErN+bcbxPZ0xl6BYqMmMF0XeXxbQsoL1WW7jzEc
         oQjlJs8TyF3N4OE59dG9opDTXGT+S7H93dr24yfy5XCGZXqEhuia2OJNJv8asBMh7Q4c
         ZDxu7q3Wqvdqb/VJw/s5gffyZSOqUFsseu8rq7SkAyLJVTdTzGkHEkLj6OyiSox3GWQp
         7uBSLy8bxwIYfjNzFh8oI5RJYTd0jQBobxqo1uXIrk7FfjOyDwIn//aYCMs8eu++wpKE
         WgkXsfdXB8LTcaCAP8WD7Bwp5L1+KC8B5Bz4hxYoThx/uzP5Huge14m1FHkFZ6WT0n05
         sfgw==
X-Gm-Message-State: AOJu0YywggU5COsflOpqFiwQZEAatRpW7XJb8NzHAtOGqL2TK35FGB0F
	iEc91lRRni5PgeH7I53gjGY/+1KWN9/wnNZMSmtyHoVsD9pjWjAY4PulWgGc
X-Google-Smtp-Source: AGHT+IG1Fc3zAQe5xIPeOAdLTgi8azlGV3407gFeaJvNI8De3gG2c9InTBFzrw0K3FHBNUAk6zDXGQ==
X-Received: by 2002:a05:6870:d696:b0:24f:c31a:5c29 with SMTP id 586e51a60fabf-2779035c2c7mr28715700fac.43.1725598585167;
        Thu, 05 Sep 2024 21:56:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177858be84sm4024723b3a.110.2024.09.05.21.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 21:56:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] nodejs: Fix build with libc++ 19
Date: Thu,  5 Sep 2024 21:56:18 -0700
Message-ID: <20240906045620.1511585-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906045620.1511585-1-raj.khem@gmail.com>
References: <20240906045620.1511585-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Sep 2024 04:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112108

As noted in the libc++ 19 release notes [1], std::char_traits<> is now
only provided for char, char8_t, char16_t, char32_t and wchar_t, and any
instantiation for other types will fail.

This causes nodejs-20 to fail to compile with clang 19 and libc++ 19,
resulting in errors similar to:

    /usr/include/c++/v1/string:820:42: error: implicit instantiation of undefined template 'std::char_traits<unsigned short>'
      820 |   static_assert(is_same<_CharT, typename traits_type::char_type>::value,
          |                                          ^
    ../deps/v8/src/inspector/string-16.h:114:28: note: in instantiation of template class 'std::basic_string<unsigned short>' requested here
      114 |   std::basic_string<UChar> m_impl;
          |                            ^
    /usr/include/c++/v1/__fwd/string.h:23:29: note: template is declared here
       23 | struct _LIBCPP_TEMPLATE_VIS char_traits;
          |                             ^

Upstream v8 has fixed this in commit 182d9c05e78 [2], so add it as a
backported patch, until the next version of node is released.

[1] https://libcxx.llvm.org/ReleaseNotes/19.html#deprecations-and-removals
[2] https://chromium.googlesource.com/v8/v8.git/+/182d9c05e78

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nodejs/nodejs/182d9c05e78.patch           | 182 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.17.0.bb |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch b/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
new file mode 100644
index 0000000000..689512cb64
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
@@ -0,0 +1,182 @@
+From 182d9c05e78b1ddb1cb8242cd3628a7855a0336f Mon Sep 17 00:00:00 2001
+From: Andrey Kosyakov <caseq@chromium.org>
+Date: Thu, 17 Aug 2023 13:50:11 -0700
+Subject: [PATCH] Define UChar as char16_t
+
+We used to have UChar defined as uint16_t which does not go along
+with STL these days if you try to have an std::basic_string<> of it,
+as there are no standard std::char_traits<> specialization for uint16_t.
+
+This switches UChar to char16_t where practical, introducing a few
+compatibility shims to keep CL size small, as (1) this would likely
+have to be back-ported and (2) crdtp extensively uses uint16_t for
+wide chars.
+
+Bug: b:296390693
+Change-Id: I66a32d8f0050915225b187de56896c26dd76163d
+Reviewed-on: https://chromium-review.googlesource.com/c/v8/v8/+/4789966
+Reviewed-by: Jaroslav Sevcik <jarin@chromium.org>
+Commit-Queue: Jaroslav Sevcik <jarin@chromium.org>
+Auto-Submit: Andrey Kosyakov <caseq@chromium.org>
+Cr-Commit-Position: refs/heads/main@{#89559}
+
+Upstream-Status: Backport [https://chromium-review.googlesource.com/c/v8/v8/+/4789966]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/inspector/string-16.cc                             |  8 +++++++-
+ src/inspector/string-16.h                              | 10 ++++++++--
+ src/inspector/v8-string-conversions.cc                 |  6 +++---
+ src/inspector/v8-string-conversions.h                  |  6 ++++--
+ .../inspector_protocol/crdtp/test_platform_v8.cc       |  9 ++++++---
+ 5 files changed, 28 insertions(+), 11 deletions(-)
+
+--- a/deps/v8/src/inspector/string-16.cc
++++ b/deps/v8/src/inspector/string-16.cc
+@@ -27,7 +27,7 @@ bool isSpaceOrNewLine(UChar c) {
+   return isASCII(c) && c <= ' ' && (c == ' ' || (c <= 0xD && c >= 0x9));
+ }
+ 
+-int64_t charactersToInteger(const UChar* characters, size_t length,
++int64_t charactersToInteger(const uint16_t* characters, size_t length,
+                             bool* ok = nullptr) {
+   std::vector<char> buffer;
+   buffer.reserve(length + 1);
+@@ -50,6 +50,8 @@ int64_t charactersToInteger(const UChar*
+ 
+ String16::String16(const UChar* characters, size_t size)
+     : m_impl(characters, size) {}
++String16::String16(const uint16_t* characters, size_t size)
++    : m_impl(reinterpret_cast<const UChar*>(characters), size) {}
+ 
+ String16::String16(const UChar* characters) : m_impl(characters) {}
+ 
+@@ -241,6 +243,10 @@ String16 String16::fromUTF16LE(const UCh
+ #endif  // V8_TARGET_BIG_ENDIAN
+ }
+ 
++String16 String16::fromUTF16LE(const uint16_t* stringStart, size_t length) {
++  return fromUTF16LE(reinterpret_cast<const UChar*>(stringStart), length);
++}
++
+ std::string String16::utf8() const {
+   return UTF16ToUTF8(m_impl.data(), m_impl.size());
+ }
+--- a/deps/v8/src/inspector/string-16.h
++++ b/deps/v8/src/inspector/string-16.h
+@@ -6,6 +6,7 @@
+ #define V8_INSPECTOR_STRING_16_H_
+ 
+ #include <stdint.h>
++#include <uchar.h>
+ 
+ #include <cctype>
+ #include <climits>
+@@ -17,7 +18,7 @@
+ 
+ namespace v8_inspector {
+ 
+-using UChar = uint16_t;
++using UChar = char16_t;
+ 
+ class String16 {
+  public:
+@@ -27,6 +28,7 @@ class String16 {
+   String16(const String16&) V8_NOEXCEPT = default;
+   String16(String16&&) V8_NOEXCEPT = default;
+   String16(const UChar* characters, size_t size);
++  String16(const uint16_t* characters, size_t size);
+   V8_EXPORT String16(const UChar* characters);
+   V8_EXPORT String16(const char* characters);
+   String16(const char* characters, size_t size);
+@@ -48,7 +50,9 @@ class String16 {
+   int toInteger(bool* ok = nullptr) const;
+   std::pair<size_t, size_t> getTrimmedOffsetAndLength() const;
+   String16 stripWhiteSpace() const;
+-  const UChar* characters16() const { return m_impl.c_str(); }
++  const uint16_t* characters16() const {
++    return reinterpret_cast<const uint16_t*>(m_impl.c_str());
++  }
+   size_t length() const { return m_impl.length(); }
+   bool isEmpty() const { return !m_impl.length(); }
+   UChar operator[](size_t index) const { return m_impl[index]; }
+@@ -78,6 +82,8 @@ class String16 {
+   // On Big endian architectures, byte order needs to be flipped.
+   V8_EXPORT static String16 fromUTF16LE(const UChar* stringStart,
+                                         size_t length);
++  V8_EXPORT static String16 fromUTF16LE(const uint16_t* stringStart,
++                                        size_t length);
+ 
+   std::size_t hash() const {
+     if (!hash_code) {
+--- a/deps/v8/src/inspector/v8-string-conversions.cc
++++ b/deps/v8/src/inspector/v8-string-conversions.cc
+@@ -12,7 +12,7 @@
+ 
+ namespace v8_inspector {
+ namespace {
+-using UChar = uint16_t;
++using UChar = char16_t;
+ using UChar32 = uint32_t;
+ 
+ bool isASCII(UChar c) { return !(c & ~0x7F); }
+@@ -386,7 +386,7 @@ std::string UTF16ToUTF8(const UChar* str
+ 
+ std::basic_string<UChar> UTF8ToUTF16(const char* stringStart, size_t length) {
+   if (!stringStart || !length) return std::basic_string<UChar>();
+-  std::vector<uint16_t> buffer(length);
++  std::vector<UChar> buffer(length);
+   UChar* bufferStart = buffer.data();
+ 
+   UChar* bufferCurrent = bufferStart;
+@@ -395,7 +395,7 @@ std::basic_string<UChar> UTF8ToUTF16(con
+                          reinterpret_cast<const char*>(stringStart + length),
+                          &bufferCurrent, bufferCurrent + buffer.size(), nullptr,
+                          true) != conversionOK)
+-    return std::basic_string<uint16_t>();
++    return std::basic_string<UChar>();
+   size_t utf16Length = bufferCurrent - bufferStart;
+   return std::basic_string<UChar>(bufferStart, bufferStart + utf16Length);
+ }
+--- a/deps/v8/src/inspector/v8-string-conversions.h
++++ b/deps/v8/src/inspector/v8-string-conversions.h
+@@ -5,14 +5,16 @@
+ #ifndef V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
+ #define V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
+ 
++#include <uchar.h>
++
+ #include <cstdint>
+ #include <string>
+ 
+ // Conversion routines between UT8 and UTF16, used by string-16.{h,cc}. You may
+ // want to use string-16.h directly rather than these.
+ namespace v8_inspector {
+-std::basic_string<uint16_t> UTF8ToUTF16(const char* stringStart, size_t length);
+-std::string UTF16ToUTF8(const uint16_t* stringStart, size_t length);
++std::basic_string<char16_t> UTF8ToUTF16(const char* stringStart, size_t length);
++std::string UTF16ToUTF8(const char16_t* stringStart, size_t length);
+ }  // namespace v8_inspector
+ 
+ #endif  // V8_INSPECTOR_V8_STRING_CONVERSIONS_H_
+--- a/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
++++ b/deps/v8/third_party/inspector_protocol/crdtp/test_platform_v8.cc
+@@ -11,13 +11,16 @@
+ namespace v8_crdtp {
+ 
+ std::string UTF16ToUTF8(span<uint16_t> in) {
+-  return v8_inspector::UTF16ToUTF8(in.data(), in.size());
++  return v8_inspector::UTF16ToUTF8(reinterpret_cast<const char16_t*>(in.data()),
++                                   in.size());
+ }
+ 
+ std::vector<uint16_t> UTF8ToUTF16(span<uint8_t> in) {
+-  std::basic_string<uint16_t> utf16 = v8_inspector::UTF8ToUTF16(
++  std::basic_string<char16_t> utf16 = v8_inspector::UTF8ToUTF16(
+       reinterpret_cast<const char*>(in.data()), in.size());
+-  return std::vector<uint16_t>(utf16.begin(), utf16.end());
++  return std::vector<uint16_t>(
++      reinterpret_cast<const uint16_t*>(utf16.data()),
++      reinterpret_cast<const uint16_t*>(utf16.data()) + utf16.size());
+ }
+ 
+ }  // namespace v8_crdtp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
index fee2eeaf9e..38e5ca9ff1 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.17.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://libatomic.patch \
+           file://182d9c05e78.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \

