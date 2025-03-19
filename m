Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A5BC282EC
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 02:01:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.3384.1742349700916419558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 19:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S9L97VsH;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22398e09e39so135736385ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 19:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742349700; x=1742954500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tE3TiFORErY5QtllM/sLtt8BLKOIW/ovX9UJJEreN18=;
        b=S9L97VsH3hMZl1NJIbxF0P0ygYU+S3YH2OwYLKcXo03+OskDOGClAqy6ykI9fTAQ+O
         e0JBxX9k1K/NZZtc7ztk15c8n0InpKbkszbdutKVeG9Uu3ZurXbCTOsp9VAgvp8p8oeB
         Z9otLSnwwCV8ljC2p/JpkbOMgeExjNePcVx/pBxlydnoiExC5bAaeVq6Bw+DeFax0owj
         XA2yhqGVhPGaBG34nOqvi6+qEQ2vUipJ5fj3JN+wUUqlgHehnztDK35loRN/x7tNkm1a
         tNNlvIFpRuPEEsvox9bWZUMHNjytRmTIWF9t210B8yyP+Wxpn3WYA561lv06+mcOowJf
         eRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742349700; x=1742954500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE3TiFORErY5QtllM/sLtt8BLKOIW/ovX9UJJEreN18=;
        b=k5xBUyNv9bH3XOKPIaHoTjk02tHDsSoWONqGBPUigcQYhhS+TslG7uqXfpAiSlvfo5
         8+uSBCSzoEhKbMdDBF8gqV0w4mcR8PylmShqK0c4zPvewk70uX8f4fIMsk9bEOvWLSuD
         QOgsZROn97xo5qYVOBdpbyxX8b1bbvw9qTjUyVLKw8EKq/Dli1RJuJilBgd7O7fCQl6K
         lS0LRhjHyRvwjfK8aEQw2ozXS8OcdBEGb7pAT3EQ8CZHxJnbB5JFxKURfCAkgEDyC8pR
         0t5WQkOshRLMhPsjCuYlHA3AYrOpUxIFDh18SLxOaEafwVSQ2QhbZ5Om5Dx0hYgshuAz
         7paQ==
X-Gm-Message-State: AOJu0YwJ53uE2JLItfzDj8pJqTTp263jpFo6IHWKdarvtcb38LaYhs8Z
	1DJd22ZM3c56XxruvDKHB9kFXzfljfGunqgKrcYk9sKDgjF2jTGJ9pIqWPbT
X-Gm-Gg: ASbGnctJuS9LrvW5EOMyvIdBX7JZwThQ4vB0YSnDG8LBsjwq45x+F5kmwQzWuNjtUwN
	g320tJQVps0TgIntt+vosCPvhX8jABnYFx5bO53CWYB2wEBnMnAsM2+ZiAsI4sOoFsVm8ZZFkgU
	jxjF8qB0uPGLXIy20J/lkrdGkhukb4PklYvXBojauel/+Ygo6nBKmVqcF24NvaciwwruYg/Gbk9
	d/1EnMdfnVGXv5feFcKUbflgrUME41dfpIqTG4vsvjmDCWhWNNOy3ywy3Ih673ErvoEdL7Ux/ai
	0ckcAxUskJ9ZObvc3WgudCo8D7i/KOVnnz//
X-Google-Smtp-Source: AGHT+IFfvx02IyVwol0mtXBQAF3A3fnwAW+aG4BWHeMGCLg9leey2WwaCChbwH95BxWj84B/uoWFiA==
X-Received: by 2002:a05:6a21:6d8a:b0:1f5:81bc:c72e with SMTP id adf61e73a8af0-1fbecd35b05mr1261952637.33.1742349699286;
        Tue, 18 Mar 2025 19:01:39 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115293desm10330822b3a.9.2025.03.18.19.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 19:01:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk3: Upgrade to 2.48.0
Date: Tue, 18 Mar 2025 19:01:35 -0700
Message-ID: <20250319020135.4001406-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Mar 2025 02:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116062

* Drop backports already present in this release
* Add couple of patches to fix build with clang-20
* Refresh patches e.g. no-musttail-arm.patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...04-main-7ffc29624258-.-https-bugs.we.patch |  75 ++++++
 ...or-no-matching-function-for-call-to-.patch |  77 ++++++
 ...1-Fix-build-issues-with-latest-Clang.patch | 237 ------------------
 ...ter.cpp-339-21-error-t6-was-not-decl.patch |  35 ---
 .../0001-Support-ICU-76.1-build.patch         |  36 ---
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  65 -----
 ...b1773bff2ef7c3b867ab019d69faa36c010d.patch |  33 ---
 .../webkitgtk3/no-musttail-arm.patch          |  24 +-
 ...kitgtk3_2.44.3.bb => webkitgtk3_2.48.0.bb} |  11 +-
 9 files changed, 171 insertions(+), 422 deletions(-)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.3.bb => webkitgtk3_2.48.0.bb} (95%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
new file mode 100644
index 0000000000..5cbb1035b2
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
@@ -0,0 +1,75 @@
+From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Tue, 18 Mar 2025 07:39:01 -0700
+Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
+ https://bugs.webkit.org/show_bug.cgi?id=289953
+
+    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
+    https://bugs.webkit.org/show_bug.cgi?id=289953
+
+    Reviewed by Alicia Boya Garcia.
+
+    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc++
+      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MODE
+      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTIONS.
+
+    Canonical link: https://commits.webkit.org/292304@main
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07ebd134459]
+
+Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
+index f6cf5ee..3178674 100644
+--- a/Source/cmake/OptionsCommon.cmake
++++ b/Source/cmake/OptionsCommon.cmake
+@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
+ ")
+ check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP)
+ if (CXX_STDLIB_IS_LIBCPP)
+-    set(CXX_STDLIB_VARIANT "LIBCPP")
+-    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
++    set(CXX_STDLIB_TEST_SOURCE "
++        #include <utility>
++        #if _LIBCPP_VERSION >= 190000
++        int main() { }
++        #else
++        #error libc++ is older than 19.x
++        #endif
++    ")
++    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
++    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
++        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
++        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_EXTENSIVE)
++    else ()
++        set(CXX_STDLIB_VARIANT "LIBCPP <19")
++        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=1)
++    endif ()
+ else ()
+     set(CXX_STDLIB_TEST_SOURCE "
+     #include <utility>
+@@ -239,7 +253,7 @@ else ()
+     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_GLIBCXX)
+     if (CXX_STDLIB_IS_GLIBCXX)
+         set(CXX_STDLIB_VARIANT "GLIBCXX")
+-        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
++        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=1)
+     endif ()
+ endif ()
+ message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
+@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
+ 
+ if (USE_CXX_STDLIB_ASSERTIONS)
+     if (CXX_STDLIB_ASSERTIONS_MACRO)
+-        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}=1")
+-        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=1")
++        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}")
++        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
+     else ()
+         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS_MACRO undefined")
+     endif ()
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
new file mode 100644
index 0000000000..5b83d9e7eb
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
@@ -0,0 +1,77 @@
+From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 2001
+From: Fujii Hironori <Hironori.Fujii@sony.com>
+Date: Tue, 18 Mar 2025 10:25:47 +0900
+Subject: [PATCH] EnumTraits.h: error: no matching function for call to
+ 'enumName' with Clang 20 https://bugs.webkit.org/show_bug.cgi?id=289669
+
+Reviewed by NOBODY (OOPS!).
+
+Clang 20 couldn't compile EnumTraits.h.
+
+> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid explicitly-specified argument for template parameter 'V'
+
+An invalid enum value can't be specifed to the template parameter `V`.
+
+> template<auto V> constexpr std::span<const char> enumName()
+
+The upstream Magic Enum C++ has a template variable `is_enum_constexpr_static_cast_valid<E, V>` to check a enum value is valid.
+<https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136a384c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634>
+
+Imported the template variable.
+
+* Source/WTF/wtf/EnumTraits.h:
+(WTF::enumName):
+(WTF::makeEnumNames):
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42597]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.h
+index 0d33e39a..95e6318b 100644
+--- a/Source/WTF/wtf/EnumTraits.h
++++ b/Source/WTF/wtf/EnumTraits.h
+@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
+ #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
+ #endif
+ 
++#if COMPILER(CLANG) && __clang_major__ >= 16
++template <typename E, auto V, typename = void>
++inline constexpr bool isEnumConstexprStaticCastValid = false;
++template <typename E, auto V>
++inline constexpr bool isEnumConstexprStaticCastValid<E, V, std::void_t<std::integral_constant<E, static_cast<E>(V)>>> = true;
++#else
++template <typename, auto>
++inline constexpr bool isEnumConstexprStaticCastValid = true;
++#endif
++
+ template<typename E>
+ constexpr std::span<const char> enumTypeNameImpl()
+ {
+@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
+     return result;
+ }
+ 
++template<typename E, auto V>
++constexpr std::span<const char> enumName()
++{
++    if constexpr (isEnumConstexprStaticCastValid<E, V>)
++        return enumName<static_cast<E>(V)>();
++    else
++        return { };
++}
++
+ template<typename E>
+ constexpr std::underlying_type_t<E> enumNamesMin()
+ {
+@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_sequence<Is...>)
+ {
+     constexpr auto min = enumNamesMin<E>();
+     return std::array<std::span<const char>, sizeof...(Is)> {
+-        enumName<static_cast<E>(static_cast<std::underlying_type_t<E>>(Is) + min)>()...
++        enumName<E, static_cast<std::underlying_type_t<E>>(Is) + min>()...
+     };
+ }
+ 
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch
deleted file mode 100644
index 6ef9835c2c..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From 257ed304fb3e71d412568dcbed7129c145812fdf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Sep 2024 21:38:12 -0700
-Subject: [PATCH] Fix build issues with latest Clang
- https://bugs.webkit.org/show_bug.cgi?id=276198 rdar://130933637
-
-Reviewed by Yusuke Suzuki.
-
-The use of the template keyword to reference template members without a template argument list was deprecated in the C++ standard.
-e.g. `foo.template bar()` nows needs to be `foo.template bar<>()`. I ran into a different issue with `std::reference_wrapper` that
-blocked me from going any further, which AFAICT is a bug on the Clang side.
-
-This also fixes a few other warnings that popped up while building with the new Clang denoted inline
-
-* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
-(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
-* Source/JavaScriptCore/jit/AssemblyHelpers.cpp:
-(JSC::AssemblyHelpers::emitNonNullDecodeZeroExtendedStructureID): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
-* Source/JavaScriptCore/llint/InPlaceInterpreter.cpp:
-* Source/JavaScriptCore/llint/LLIntData.h:
-(JSC::LLInt::getCodeFunctionPtr):
-(JSC::LLInt::getWide16CodeFunctionPtr):
-(JSC::LLInt::getWide32CodeFunctionPtr):
-* Source/JavaScriptCore/parser/Nodes.h: Missing definition of ModuleScopeData added include.
-* Source/JavaScriptCore/runtime/JSCast.h:
-(JSC::JSCastingHelpers::inherits):
-(JSC::jsDynamicCast):
-* Source/ThirdParty/libwebrtc/Source/third_party/boringssl/src/crypto/bio/connect.c:
-(conn_callback_ctrl): Had a warning about an incompatible function type. Seems like this is intentional suppressed the warning.
-* Source/WTF/wtf/cf/TypeCastsCF.h: Had a warning about extra namespace qualification. I just moved it out of the namespace. That said, it feels like this warning shouldn't apply to macro expansions...
-* Source/WebCore/PAL/ThirdParty/libavif/ThirdParty/dav1d/src/decode.c:
-(decode_b): Had a warning about different types on the middle/right of a ternary expression. I just pushed the comparison inside the ternary.
-
-Canonical link: https://commits.webkit.org/280700@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/62b6e2db547e#diff-136d848d7c1b400da9b486916b67592b54e5abf7c66ac247697a93ae2fb743a9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp    |  6 ++++--
- Source/JavaScriptCore/jit/AssemblyHelpers.cpp    |  6 ++++--
- .../JavaScriptCore/llint/InPlaceInterpreter.cpp  | 16 ++++++++--------
- Source/JavaScriptCore/llint/LLIntData.h          | 12 ++++++------
- Source/JavaScriptCore/llint/LLIntThunks.cpp      |  2 +-
- Source/JavaScriptCore/parser/Nodes.h             |  4 ++--
- Source/JavaScriptCore/runtime/JSCast.h           |  4 ++--
- 7 files changed, 27 insertions(+), 23 deletions(-)
-
---- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
-+++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
-@@ -22930,8 +22930,10 @@ IGNORE_CLANG_WARNINGS_END
-         return m_out.shl(m_out.zeroExtPtr(structureID), m_out.constIntPtr(StructureID::encodeShiftAmount));
- #else
-         LValue maskedStructureID = structureID;
--        if constexpr (structureHeapAddressSize < 4 * GB)
--            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(StructureID::structureIDMask));
-+        if constexpr (structureHeapAddressSize < 4 * GB) {
-+            static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
-+            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(static_cast<uint32_t>(StructureID::structureIDMask)));
-+        }
-         return m_out.bitOr(m_out.constIntPtr(startOfStructureHeap()), m_out.zeroExtPtr(maskedStructureID));
- #endif
-     }
---- a/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
-+++ b/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
-@@ -677,8 +677,10 @@ void AssemblyHelpers::emitNonNullDecodeZ
-     if constexpr (structureHeapAddressSize >= 4 * GB) {
-         ASSERT(structureHeapAddressSize == 4 * GB);
-         move(source, dest);
--    } else
--        and32(TrustedImm32(StructureID::structureIDMask), source, dest);
-+    } else {
-+        static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
-+        and32(TrustedImm32(static_cast<uint32_t>(StructureID::structureIDMask)), source, dest);
-+    }
-     or64(TrustedImm64(startOfStructureHeap()), dest);
- #else // not CPU(ADDRESS64)
-     move(source, dest);
---- a/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
-+++ b/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
-@@ -43,8 +43,8 @@ namespace JSC { namespace IPInt {
- do { \
-     void* base = reinterpret_cast<void*>(ipint_unreachable_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
-@@ -52,8 +52,8 @@ do { \
- do { \
-     void* base = reinterpret_cast<void*>(ipint_i32_trunc_sat_f32_s_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
-@@ -61,8 +61,8 @@ do { \
- do { \
-     void* base = reinterpret_cast<void*>(ipint_simd_v128_load_mem_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
-@@ -70,8 +70,8 @@ do { \
- do { \
-     void* base = reinterpret_cast<void*>(ipint_memory_atomic_notify_validate); \
-     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
--    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
--    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
-+    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
-+    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
- } while (false);
- 
---- a/Source/JavaScriptCore/llint/LLIntData.h
-+++ b/Source/JavaScriptCore/llint/LLIntData.h
-@@ -217,7 +217,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionP
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -227,7 +227,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -237,7 +237,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- #else // not ENABLE(JIT)
-@@ -361,7 +361,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionP
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -371,7 +371,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- 
-@@ -381,7 +381,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
- #endif
- }
- #else // not ENABLE(JIT)
---- a/Source/JavaScriptCore/llint/LLIntThunks.cpp
-+++ b/Source/JavaScriptCore/llint/LLIntThunks.cpp
-@@ -227,7 +227,7 @@ ALWAYS_INLINE void* untaggedPtr(void* pt
- #if COMPILER(MSVC)
-         return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).untaggedPtr();
- #else
--        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr();
-+        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>();
- #endif
- }
- 
---- a/Source/JavaScriptCore/parser/Nodes.h
-+++ b/Source/JavaScriptCore/parser/Nodes.h
-@@ -1,7 +1,7 @@
- /*
-  *  Copyright (C) 1999-2000 Harri Porten (porten@kde.org)
-  *  Copyright (C) 2001 Peter Kelly (pmk@post.com)
-- *  Copyright (C) 2003-2019 Apple Inc. All rights reserved.
-+ *  Copyright (C) 2003-2024 Apple Inc. All rights reserved.
-  *  Copyright (C) 2007 Cameron Zwarich (cwzwarich@uwaterloo.ca)
-  *  Copyright (C) 2007 Maks Orlovich
-  *  Copyright (C) 2007 Eric Seidel <eric@webkit.org>
-@@ -29,6 +29,7 @@
- #include "ImplementationVisibility.h"
- #include "JITCode.h"
- #include "Label.h"
-+#include "ModuleScopeData.h"
- #include "ParserArena.h"
- #include "ParserModes.h"
- #include "ParserTokens.h"
-@@ -49,7 +50,6 @@ namespace JSC {
-     class FunctionMetadataNode;
-     class FunctionParameters;
-     class ModuleAnalyzer;
--    class ModuleScopeData;
-     class PropertyListNode;
-     class ReadModifyResolveNode;
-     class RegisterID;
---- a/Source/JavaScriptCore/runtime/JSCast.h
-+++ b/Source/JavaScriptCore/runtime/JSCast.h
-@@ -236,7 +236,7 @@ template<typename Target, typename From>
- bool inherits(From* from)
- {
-     using Dispatcher = InheritsTraits<Target>;
--    return Dispatcher::template inherits(from);
-+    return Dispatcher::template inherits<>(from);
- }
- 
- } // namespace JSCastingHelpers
-@@ -245,7 +245,7 @@ template<typename To, typename From>
- To jsDynamicCast(From* from)
- {
-     using Dispatcher = JSCastingHelpers::InheritsTraits<typename std::remove_cv<typename std::remove_pointer<To>::type>::type>;
--    if (LIKELY(Dispatcher::template inherits(from)))
-+    if (LIKELY(Dispatcher::template inherits<>(from)))
-         return static_cast<To>(from);
-     return nullptr;
- }
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch
deleted file mode 100644
index e6a43c2fff..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From fb81a5de7798eb7f68e0de1c281671553e1aa19d Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Mon, 5 Feb 2024 11:00:49 -0600
-Subject: [PATCH] =?UTF-8?q?LowLevelInterpreter.cpp:339:21:=20error:=20?=
- =?UTF-8?q?=E2=80=98t6=E2=80=99=20was=20not=20declared=20in=20this=20scope?=
- =?UTF-8?q?=20https://bugs.webkit.org/show=5Fbug.cgi=3Fid=3D268739?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Unreviewed build fix. Seems a backport went badly, and we didn't notice
-because the code is architecture-specific.
-
-* Source/JavaScriptCore/llint/LowLevelInterpreter.cpp:
-(JSC::CLoop::execute):
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/3d5373575695b293b8559155431d0079a6153aff]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/JavaScriptCore/llint/LowLevelInterpreter.cpp | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-index 75cecbbd..b1020ea4 100644
---- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-+++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
-@@ -336,8 +336,6 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, void* executableAddress, VM* vm,
-     UNUSED_VARIABLE(t2);
-     UNUSED_VARIABLE(t3);
-     UNUSED_VARIABLE(t5);
--    UNUSED_VARIABLE(t6);
--    UNUSED_VARIABLE(t7);
- 
-     struct StackPointerScope {
-         StackPointerScope(CLoopStack& stack)
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch
deleted file mode 100644
index 31535e7ae2..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Support-ICU-76.1-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 57b80aa00be614218552fda67b2bf8d535b4f4cf Mon Sep 17 00:00:00 2001
-From: Jason Schonberg <schonm@gmail.com>
-Date: Wed, 20 Nov 2024 11:05:52 -0500
-Subject: [PATCH]  Support ICU 76.1 build
-
-https://bugs.webkit.org/show_bug.cgi?id=282120
-
-Reviewed by Yusuke Suzuki.
-
-In ICU 76.1 an additional macro `U_SHOW_CPLUSPLUS_HEADER_API` was added to
-control visibility of the C++ API within ICU. Set this value to `0` since WebKit
-wants to only use the C API.
-
-* Source/WTF/wtf/Platform.h:
-
-Canonical link: https://commits.webkit.org/285727@main
-
-Upstream-Status: Backport [ from webkitgtk-2.47.1 https://github.com/WebKit/WebKit/commit/63f7badbada070ebaadd318b2801818ecf7e7ea0 ]
-
-Signed-off-by: Jason Schonberg <schonm@gmail.com>
----
- Source/WTF/wtf/Platform.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
-index 23070df2..51a8dce9 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
-@@ -115,6 +115,7 @@
- /* ICU configuration. Some of these match ICU defaults on some platforms, but we would like them consistently set everywhere we build WebKit. */
- #define U_HIDE_DEPRECATED_API 1
- #define U_SHOW_CPLUSPLUS_API 0
-+#define U_SHOW_CPLUSPLUS_HEADER_API 0
- #ifdef __cplusplus
- #define UCHAR_TYPE char16_t
- #endif
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
deleted file mode 100644
index b2e40a88c8..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Mon, 16 Jan 2023 17:03:30 +0100
-Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
-
- !ENABLE(WEBASSEMBLY_B3JIT)
-
-https://bugs.webkit.org/show_bug.cgi?id=250681
-
-Reviewed by NOBODY (OOPS!).
-
-WasmTypeDefinition.h isn't included if not ENABLE(WEBASSEMBLY_B3JIT).
-Also, toB3Type and simdScalarType are not defined if it is included.
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
-
-Upstream-Status: Inappropriate [https://bugs.launchpad.net/ubuntu/+source/webkit2gtk/+bug/2008798]
----
- Source/JavaScriptCore/b3/B3Validate.cpp | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Source/JavaScriptCore/b3/B3Validate.cpp b/Source/JavaScriptCore/b3/B3Validate.cpp
-index eaaa3749..1d089783 100644
---- a/Source/JavaScriptCore/b3/B3Validate.cpp
-+++ b/Source/JavaScriptCore/b3/B3Validate.cpp
-@@ -47,6 +47,12 @@
- #include <wtf/StringPrintStream.h>
- #include <wtf/text/CString.h>
- 
-+#if ENABLE(WEBASSEMBLY) && ENABLE(WEBASSEMBLY_B3JIT)
-+#define simdScalarTypeToB3Type(type) toB3Type(Wasm::simdScalarType(type))
-+#else
-+#define simdScalarTypeToB3Type(type) B3::Type()
-+#endif
-+
- namespace JSC { namespace B3 {
- 
- namespace {
-@@ -454,7 +460,7 @@ public:
-             case VectorExtractLane:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value));
-                 VALIDATE(value->numChildren() == 1, ("At ", *value));
--                VALIDATE(value->type() == toB3Type(Wasm::simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->type() == simdScalarTypeToB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 VALIDATE(value->child(0)->type() == V128, ("At ", *value));
-                 break;
-             case VectorReplaceLane:
-@@ -462,7 +468,7 @@ public:
-                 VALIDATE(value->numChildren() == 2, ("At ", *value));
-                 VALIDATE(value->type() == V128, ("At ", *value));
-                 VALIDATE(value->child(0)->type() == V128, ("At ", *value));
--                VALIDATE(value->child(1)->type() == toB3Type(Wasm::simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->child(1)->type() == simdScalarTypeToB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 break;
-             case VectorDupElement:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value));
-@@ -484,7 +490,7 @@ public:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value));
-                 VALIDATE(value->numChildren() == 1, ("At ", *value));
-                 VALIDATE(value->type() == V128, ("At ", *value));
--                VALIDATE(value->child(0)->type() == toB3Type(Wasm::simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->child(0)->type() == simdScalarTypeToB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 break;
- 
-             case VectorPopcnt:
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch
deleted file mode 100644
index 3d76aa4e4d..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From fff1b1773bff2ef7c3b867ab019d69faa36c010d Mon Sep 17 00:00:00 2001
-From: Michael Catanzaro <mcatanzaro@redhat.com>
-Date: Wed, 3 Jul 2024 13:36:54 -0700
-Subject: [PATCH] WebKitDOMEventTarget.h:95: Warning: WebKit2WebExtension:
- invalid "scope" annotation: only valid on callback parameters
- https://bugs.webkit.org/show_bug.cgi?id=276180
-
-Unreviewed build fix.
-
-Emmanuele recommends using (type gpointer) for the GCallback parameter
-of webkit_dom_event_target_remove_event_listener, since it won't be
-called and is therefore not functioning as a callback.
-
-* Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h:
-
-Canonical link: https://commits.webkit.org/280639@main
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/fff1b1773bff2ef7c3b867ab019d69faa36c010d]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h           | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h
-+++ b/Source/WebKit/WebProcess/InjectedBundle/API/gtk/DOM/WebKitDOMEventTarget.h
-@@ -92,7 +92,7 @@ WEBKIT_DEPRECATED gboolean  webkit_dom_e
-  * webkit_dom_event_target_remove_event_listener:
-  * @target: A #WebKitDOMEventTarget
-  * @event_name: A #gchar
-- * @handler: (scope call): A #GCallback
-+ * @handler: (type gpointer): A #GCallback
-  * @use_capture: A #gboolean
-  *
-  * Returns: a #gboolean
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
index 37bc6538c3..367e6b8342 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/no-musttail-arm.patch
@@ -1,6 +1,6 @@
-From c50f2277509f2e6f087cda2eaf323eaf569aad8d Mon Sep 17 00:00:00 2001
+From 4602261fa44d6bbb4c3698c79e08a6a40a6edc5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Sep 2023 12:42:06 -0700
+Date: Fri, 12 Jan 2024 09:21:39 -0800
 Subject: [PATCH] clang/arm: Do not use MUST_TAIL_CALL
 
 This causes clang-17 to crash see [1]
@@ -9,22 +9,26 @@ this code is new in webkit 2.42[2] thats why we do not see the crash in older we
 [1] https://github.com/llvm/llvm-project/issues/67767
 [2] https://github.com/WebKit/WebKit/commit/4d816460b765acd8aef90ab474615850b91ecc35
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [work around to avoid clang compiler crash]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update context for webkitgtk 2.48.0.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Source/WTF/wtf/Compiler.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Source/WTF/wtf/Compiler.h b/Source/WTF/wtf/Compiler.h
-index 449ca502..daac29d7 100644
+index 16e416d..68dd9a0 100644
 --- a/Source/WTF/wtf/Compiler.h
 +++ b/Source/WTF/wtf/Compiler.h
-@@ -321,7 +321,7 @@
- /* MUST_TAIL_CALL */
- 
+@@ -293,7 +293,7 @@
+ #if COMPILER(CLANG)
+ #if __SIZEOF_POINTER__ == 8
  #if !defined(MUST_TAIL_CALL) && defined(__cplusplus) && defined(__has_cpp_attribute)
--#if __has_cpp_attribute(clang::musttail)
-+#if __has_cpp_attribute(clang::musttail) && !defined(__arm__)
+-#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32)
++#if __has_cpp_attribute(clang::musttail) && !defined(__powerpc__) && !defined(_WIN32) && !defined(__arm__)
  #define MUST_TAIL_CALL [[clang::musttail]]
- #endif
+ #define HAVE_MUST_TAIL_CALL 1
  #endif
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
similarity index 95%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
index 07fa0d06f7..9a4101c4b4 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
@@ -17,13 +17,10 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://reproducibility.patch \
            file://no-musttail-arm.patch \
-           file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch \
-           file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://0001-Fix-build-issues-with-latest-Clang.patch \
-           file://fff1b1773bff2ef7c3b867ab019d69faa36c010d.patch \
-           file://0001-Support-ICU-76.1-build.patch \
+           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
+           file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            "
-SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
+SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
@@ -92,6 +89,8 @@ PACKAGECONFIG[gamepad] = "-DENABLE_GAMEPAD=ON,-DENABLE_GAMEPAD=OFF,libmanette"
 PACKAGECONFIG[webrtc] = "-DENABLE_WEB_RTC=ON,-DENABLE_WEB_RTC=OFF"
 PACKAGECONFIG[bubblewrap] = "-DENABLE_BUBBLEWRAP_SANDBOX=ON -DBWRAP_EXECUTABLE=${bindir}/bwrap -DDBUS_PROXY_EXECUTABLE=${bindir}/xdg-dbus-proxy,-DENABLE_BUBBLEWRAP_SANDBOX=OFF,,bubblewrap xdg-dbus-proxy"
 PACKAGECONFIG[backtrace] = "-DUSE_LIBBACKTRACE=ON,-DUSE_LIBBACKTRACE=OFF,libbacktrace"
+PACKAGECONFIG[sysprof-capture] = "-DUSE_SYSTEM_SYSPROF_CAPTURE=YES,-DUSE_SYSTEM_SYSPROF_CAPTURE=NO,sysprof"
+PACKAGECONFIG[speech] = "-DENABLE_SPEECH_SYNTHESIS=ON,-DENABLE_SPEECH_SYNTHESIS=OFF,flite"
 
 EXTRA_OECMAKE = " \
 	-DPORT=GTK \

