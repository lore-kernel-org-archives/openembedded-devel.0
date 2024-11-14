Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05606D68B12
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:23:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37037.1731590619866950409
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:23:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10487a133e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEBSk0H016838
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 05:23:39 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwppbtrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 05:23:39 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 14 Nov 2024 05:23:38 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 14 Nov 2024 05:23:37 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 5/7] nodejs: Fix build with libc++ 19
Date: Thu, 14 Nov 2024 13:23:26 +0000
Message-ID: <20241114132328.1340824-5-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20241114132328.1340824-1-archana.polampalli@windriver.com>
References: <20241114132328.1340824-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 6-hCqtBnY2gGgVFv7gserYF1-nItnLmF
X-Proofpoint-GUID: 6-hCqtBnY2gGgVFv7gserYF1-nItnLmF
X-Authority-Analysis: v=2.4 cv=J4f47xnS c=1 sm=1 tr=0 ts=6735f9db cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VlfZXiiP6vEA:10 a=pGLkceISAAAA:8 a=Twlkf-z8AAAA:8 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=cm27Pg_UAAAA:8 a=-LCu6K_DAAAA:8
 a=z4qFTBnbxKX3v4yr1lEA:9 a=W-gb19_dOTsA:10 a=-74SuR6ZdpOK_LpdRCUo:22 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_05,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411140105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 13:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113820

From: Khem Raj <raj.khem@gmail.com>

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
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/182d9c05e78.patch           | 182 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_20.17.0.bb |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch b/meta-oe/recipes-devtools/nodejs/nodejs/182d9c05e78.patch
new file mode 100644
index 000000000..9b3fc566c
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
index 0c0791516..be1802f29 100644
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
-- 
2.40.0


