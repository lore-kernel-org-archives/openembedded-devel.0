Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A130BCD37B6
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 05:33:15 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.43308.1725427985693074764
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Sep 2024 22:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ArkS0e5Z;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5dca9cc71b2so284724eaf.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Sep 2024 22:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725427985; x=1726032785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XG/2bmi2zZ4qDlXVZLNggYhnkEjJUCzQOlm1FHKv1lE=;
        b=ArkS0e5Zf5OGc1Z6n7mXpk6IxMRSr4QRBVkIdUyT7VTeZAUzgqzOnDmRWo6J+7Sbef
         xPNbmCBb2ukWbYtahhkOjR3HKO+l6ZOpOZKR+hrJt/lJbaK1mGCAcGHBKeIE0olTNsxg
         UnBG3HhMD4vqGew1CPeU3AqSuicyqdOAGBmRe7Kxf6NDk9ZTSxsFaviix5Zl+M/dxLuG
         1ie4nt6u3yVfrIQtGMAQT4UlA/JU2BiRd9/1MDHZ5EG8mL3HTCDejNkIzIMJfaEs8kgF
         WPYkt0VkW1QwkhE9Ixcfel3TBCjI5trVXufkdVd4F2k+oisYxHdKAxW0JHeG+DGccS8V
         Qi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725427985; x=1726032785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XG/2bmi2zZ4qDlXVZLNggYhnkEjJUCzQOlm1FHKv1lE=;
        b=wzWebNYC/wKJntmMcjmiU/q0TF/a7b/Cmika8o2/3cpFkUPI41TJRRqylOzLbEJAYa
         ZynfXCWZ/horg8SOX7FdlYEE7Rizjrz/dJWsdhwZkitJYsashkl+w4Oxo7tmNW4h+97z
         0vfDWhcUFFFFphzJ0OJH1q4ES/crDq8VgU6cWzeACbckTAZOCKmlqlRSKaZWj5PKsdv4
         e6N4E7Tms9zGqyG1kPE9RZiI5T+6ml5Vsfd+PtP+rRZ+ZYh3vIhvvarzeqX8MjZuIexf
         /YBMSOWQJ6Z5sOgqWcpRVwm6Quj1ijUK1pMdB4C9zqoMPwV+azGthY4TcdjkpvMc1ikr
         E1Hg==
X-Gm-Message-State: AOJu0YxHHqUdWLwAX3BesFNoakueyKtdX/KkosFrnr3Zbuz/pkLS3CXS
	pTe12sYRw2jX2rXBsqAIAsFTj+4MPUemp4C/OMThRknZktv0kJvNWKaRHVVv
X-Google-Smtp-Source: AGHT+IEpr+Y6F8IaXxyLzw+YdF4DpNS41FOW086gyHKb2khpGL5RyiYTcej8Jsye0Kx+IS6vHcrPgA==
X-Received: by 2002:a05:6358:5245:b0:1b8:203b:db89 with SMTP id e5c5f4694b2df-1b8203bdca2mr86190455d.5.1725427984636;
        Tue, 03 Sep 2024 22:33:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778589896sm776515b3a.128.2024.09.03.22.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 22:33:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] webkitgtk3: Fix build with latest clang
Date: Tue,  3 Sep 2024 22:32:58 -0700
Message-ID: <20240904053300.2085710-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904053300.2085710-1-raj.khem@gmail.com>
References: <20240904053300.2085710-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 05:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112086

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Fix-build-issues-with-latest-Clang.patch | 237 ++++++++++++++++++
 .../webkitgtk/webkitgtk3_2.44.3.bb            |   1 +
 2 files changed, 238 insertions(+)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch
new file mode 100644
index 0000000000..6ef9835c2c
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-with-latest-Clang.patch
@@ -0,0 +1,237 @@
+From 257ed304fb3e71d412568dcbed7129c145812fdf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 2 Sep 2024 21:38:12 -0700
+Subject: [PATCH] Fix build issues with latest Clang
+ https://bugs.webkit.org/show_bug.cgi?id=276198 rdar://130933637
+
+Reviewed by Yusuke Suzuki.
+
+The use of the template keyword to reference template members without a template argument list was deprecated in the C++ standard.
+e.g. `foo.template bar()` nows needs to be `foo.template bar<>()`. I ran into a different issue with `std::reference_wrapper` that
+blocked me from going any further, which AFAICT is a bug on the Clang side.
+
+This also fixes a few other warnings that popped up while building with the new Clang denoted inline
+
+* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
+(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
+* Source/JavaScriptCore/jit/AssemblyHelpers.cpp:
+(JSC::AssemblyHelpers::emitNonNullDecodeZeroExtendedStructureID): Clang didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a static_assert no data was lost.
+* Source/JavaScriptCore/llint/InPlaceInterpreter.cpp:
+* Source/JavaScriptCore/llint/LLIntData.h:
+(JSC::LLInt::getCodeFunctionPtr):
+(JSC::LLInt::getWide16CodeFunctionPtr):
+(JSC::LLInt::getWide32CodeFunctionPtr):
+* Source/JavaScriptCore/parser/Nodes.h: Missing definition of ModuleScopeData added include.
+* Source/JavaScriptCore/runtime/JSCast.h:
+(JSC::JSCastingHelpers::inherits):
+(JSC::jsDynamicCast):
+* Source/ThirdParty/libwebrtc/Source/third_party/boringssl/src/crypto/bio/connect.c:
+(conn_callback_ctrl): Had a warning about an incompatible function type. Seems like this is intentional suppressed the warning.
+* Source/WTF/wtf/cf/TypeCastsCF.h: Had a warning about extra namespace qualification. I just moved it out of the namespace. That said, it feels like this warning shouldn't apply to macro expansions...
+* Source/WebCore/PAL/ThirdParty/libavif/ThirdParty/dav1d/src/decode.c:
+(decode_b): Had a warning about different types on the middle/right of a ternary expression. I just pushed the comparison inside the ternary.
+
+Canonical link: https://commits.webkit.org/280700@main
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/62b6e2db547e#diff-136d848d7c1b400da9b486916b67592b54e5abf7c66ac247697a93ae2fb743a9]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp    |  6 ++++--
+ Source/JavaScriptCore/jit/AssemblyHelpers.cpp    |  6 ++++--
+ .../JavaScriptCore/llint/InPlaceInterpreter.cpp  | 16 ++++++++--------
+ Source/JavaScriptCore/llint/LLIntData.h          | 12 ++++++------
+ Source/JavaScriptCore/llint/LLIntThunks.cpp      |  2 +-
+ Source/JavaScriptCore/parser/Nodes.h             |  4 ++--
+ Source/JavaScriptCore/runtime/JSCast.h           |  4 ++--
+ 7 files changed, 27 insertions(+), 23 deletions(-)
+
+--- a/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
++++ b/Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp
+@@ -22930,8 +22930,10 @@ IGNORE_CLANG_WARNINGS_END
+         return m_out.shl(m_out.zeroExtPtr(structureID), m_out.constIntPtr(StructureID::encodeShiftAmount));
+ #else
+         LValue maskedStructureID = structureID;
+-        if constexpr (structureHeapAddressSize < 4 * GB)
+-            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(StructureID::structureIDMask));
++        if constexpr (structureHeapAddressSize < 4 * GB) {
++            static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
++            maskedStructureID = m_out.bitAnd(structureID, m_out.constInt32(static_cast<uint32_t>(StructureID::structureIDMask)));
++        }
+         return m_out.bitOr(m_out.constIntPtr(startOfStructureHeap()), m_out.zeroExtPtr(maskedStructureID));
+ #endif
+     }
+--- a/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
++++ b/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
+@@ -677,8 +677,10 @@ void AssemblyHelpers::emitNonNullDecodeZ
+     if constexpr (structureHeapAddressSize >= 4 * GB) {
+         ASSERT(structureHeapAddressSize == 4 * GB);
+         move(source, dest);
+-    } else
+-        and32(TrustedImm32(StructureID::structureIDMask), source, dest);
++    } else {
++        static_assert(static_cast<uint32_t>(StructureID::structureIDMask) == StructureID::structureIDMask);
++        and32(TrustedImm32(static_cast<uint32_t>(StructureID::structureIDMask)), source, dest);
++    }
+     or64(TrustedImm64(startOfStructureHeap()), dest);
+ #else // not CPU(ADDRESS64)
+     move(source, dest);
+--- a/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
++++ b/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
+@@ -43,8 +43,8 @@ namespace JSC { namespace IPInt {
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_unreachable_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+@@ -52,8 +52,8 @@ do { \
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_i32_trunc_sat_f32_s_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+@@ -61,8 +61,8 @@ do { \
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_simd_v128_load_mem_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+@@ -70,8 +70,8 @@ do { \
+ do { \
+     void* base = reinterpret_cast<void*>(ipint_memory_atomic_notify_validate); \
+     void* ptr = reinterpret_cast<void*>(ipint_ ## name ## _validate); \
+-    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr(); \
+-    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr(); \
++    void* untaggedBase = CodePtr<CFunctionPtrTag>::fromTaggedPtr(base).template untaggedPtr<>(); \
++    void* untaggedPtr = CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>(); \
+     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untaggedBase) == opcode * 256, #name); \
+ } while (false);
+ 
+--- a/Source/JavaScriptCore/llint/LLIntData.h
++++ b/Source/JavaScriptCore/llint/LLIntData.h
+@@ -217,7 +217,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionP
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -227,7 +227,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFun
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -237,7 +237,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFun
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ #else // not ENABLE(JIT)
+@@ -361,7 +361,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionP
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -371,7 +371,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFun
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ 
+@@ -381,7 +381,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFun
+ #if COMPILER(MSVC)
+     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).taggedPtr());
+ #else
+-    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr());
++    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).template taggedPtr<>());
+ #endif
+ }
+ #else // not ENABLE(JIT)
+--- a/Source/JavaScriptCore/llint/LLIntThunks.cpp
++++ b/Source/JavaScriptCore/llint/LLIntThunks.cpp
+@@ -227,7 +227,7 @@ ALWAYS_INLINE void* untaggedPtr(void* pt
+ #if COMPILER(MSVC)
+         return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).untaggedPtr();
+ #else
+-        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr();
++        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template untaggedPtr<>();
+ #endif
+ }
+ 
+--- a/Source/JavaScriptCore/parser/Nodes.h
++++ b/Source/JavaScriptCore/parser/Nodes.h
+@@ -1,7 +1,7 @@
+ /*
+  *  Copyright (C) 1999-2000 Harri Porten (porten@kde.org)
+  *  Copyright (C) 2001 Peter Kelly (pmk@post.com)
+- *  Copyright (C) 2003-2019 Apple Inc. All rights reserved.
++ *  Copyright (C) 2003-2024 Apple Inc. All rights reserved.
+  *  Copyright (C) 2007 Cameron Zwarich (cwzwarich@uwaterloo.ca)
+  *  Copyright (C) 2007 Maks Orlovich
+  *  Copyright (C) 2007 Eric Seidel <eric@webkit.org>
+@@ -29,6 +29,7 @@
+ #include "ImplementationVisibility.h"
+ #include "JITCode.h"
+ #include "Label.h"
++#include "ModuleScopeData.h"
+ #include "ParserArena.h"
+ #include "ParserModes.h"
+ #include "ParserTokens.h"
+@@ -49,7 +50,6 @@ namespace JSC {
+     class FunctionMetadataNode;
+     class FunctionParameters;
+     class ModuleAnalyzer;
+-    class ModuleScopeData;
+     class PropertyListNode;
+     class ReadModifyResolveNode;
+     class RegisterID;
+--- a/Source/JavaScriptCore/runtime/JSCast.h
++++ b/Source/JavaScriptCore/runtime/JSCast.h
+@@ -236,7 +236,7 @@ template<typename Target, typename From>
+ bool inherits(From* from)
+ {
+     using Dispatcher = InheritsTraits<Target>;
+-    return Dispatcher::template inherits(from);
++    return Dispatcher::template inherits<>(from);
+ }
+ 
+ } // namespace JSCastingHelpers
+@@ -245,7 +245,7 @@ template<typename To, typename From>
+ To jsDynamicCast(From* from)
+ {
+     using Dispatcher = JSCastingHelpers::InheritsTraits<typename std::remove_cv<typename std::remove_pointer<To>::type>::type>;
+-    if (LIKELY(Dispatcher::template inherits(from)))
++    if (LIKELY(Dispatcher::template inherits<>(from)))
+         return static_cast<To>(from);
+     return nullptr;
+ }
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 7d70cbda78..9493d86422 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://no-musttail-arm.patch \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
+           file://0001-Fix-build-issues-with-latest-Clang.patch \
            "
 SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 

