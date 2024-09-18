Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFDACDD551
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 18:46:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.1487.1726685162690998146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 11:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id CEEF6337B8
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 20:46:00 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.189]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sqzgb-1KdCC10; Wed, 18 Sep 2024 20:45:57 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] webkitgtk3: update 2.44.3 -> 2.46.0
Date: Wed, 18 Sep 2024 20:47:31 +0200
Message-ID: <20240918184731.54155-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726685157-9FFFD4ED-C20B7716/0/0 CLEAN NORMAL
X-TOI-MSGID: b4094dc6-58d4-4d1e-a5be-9fae35e52051
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Sep 2024 18:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112360

- drop backport patches
- import 0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch =
from oe-core
- set USE_SYSTEM_SYSPROF_CAPTURE=3DOFF to avoid sysprof dependency

Highlights of the WebKitGTK 2.46.0 release

    Use Skia instead of cairo for 2D rendering and enable GPU rendering b=
y default.
    Enable offscreen canvas by default.
    Add support for system tracing with Sysprof.
    Implement printing using the Print portal.
    Add new API to load settings from a config file.
    Add a new setting to enable or disable the 2D canvas acceleration (en=
abled by default).
    Undeprecate console messages API and make it available in 6.0 API.

For more details about all the changes included in WebKitGTK 2.46 see the=
 NEWS file that is included in the tarball.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch |  73 ++++++
 ...1-Fix-build-issues-with-latest-Clang.patch | 237 ------------------
 ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |  65 -----
 ...kitgtk3_2.44.3.bb =3D> webkitgtk3_2.46.0.bb} |  14 +-
 4 files changed, 80 insertions(+), 309 deletions(-)
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMa=
ke-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix=
-build-issues-with-latest-Clang.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e2=
2213fdaca2a29ec3400c927d710a37a8.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.44.3.bb =3D> webk=
itgtk3_2.46.0.bb} (94%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-=
a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta-oe/recipes-suppor=
t/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_A=
LWAYS_I.patch
new file mode 100644
index 000000000..a19008a41
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-varia=
ble-to-control-macro-__PAS_ALWAYS_I.patch
@@ -0,0 +1,73 @@
+From 99a21305ae683a216e9299e5dbdd763190a8cfe3 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 11 Aug 2023 14:20:48 +0800
+Subject: [PATCH] Add a variable to control macro
+ __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+ https://bugs.webkit.org/show_bug.cgi?id=3D260065
+
+Reviewed by NOBODY (OOPS!).
+
+It fails to compile webkitgtk with option `-Og` of gcc/g++:
+
+| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_p=
rovider.h:30,
+|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_h=
eap_page_provider.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_=
physical_page_sharing_cache.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_=
page_caches.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config=
_utils.h:32,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_co=
nfig.h:34,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_in=
lines.h:34,
+|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
+|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
+| In function 'pas_allocation_result pas_local_allocator_try_allocate(pa=
s_local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts=
*, pas_allocation_result_filter)',
+|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_f=
ast(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter,=
 pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmallo=
c/libpas/src/libpas/pas_try_allocate_common.h:85:46,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alig=
nment_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-=
2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
+|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_imp=
l_casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, p=
as_heap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slo=
w, pas_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmall=
oc/libpas/src/libpas/pas_try_allocate_intrinsic.h:167:44,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alig=
nment_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmallo=
c/libpas/src/libpas/bmalloc_heap_inlines.h:59:1:
+| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_resul=
t.h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocati=
on_result pas_allocation_result_identity(pas_allocation_result)': functio=
n not considered for inlining
+|    76 | pas_allocation_result_identity(pas_allocation_result result)
+|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro
+__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute
+`always_inline`. It could set the variable to make compilation pass when
+gcc option `-Og` is used.
+
+* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
+* Source/cmake/WebKitCompilerFlags.cmake:
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/16601]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
+ Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Sourc=
e/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+index 5d5fb38c..a554f700 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
+ #define __SUSPICIOUS__
+ #define __BROKEN__
+=20
+-#ifdef __OPTIMIZE__
++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE __attribute__((__always_inli=
ne__))
+ #else
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKi=
tCompilerFlags.cmake
+index 0732785e..4879ec40 100644
+--- a/Source/cmake/WebKitCompilerFlags.cmake
++++ b/Source/cmake/WebKitCompilerFlags.cmake
+@@ -452,3 +452,10 @@ endif ()
+=20
+ # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/=
b/139438>
+ set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
++
++# It fails to compile with `gcc -Og`
++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute al=
ways_inline for WebKit")
++
++if (WEBKIT_NO_INLINE_HINTS)
++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
++endif ()
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-=
issues-with-latest-Clang.patch b/meta-oe/recipes-support/webkitgtk/webkit=
gtk3/0001-Fix-build-issues-with-latest-Clang.patch
deleted file mode 100644
index 6ef9835c2..000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Fix-build-issues-=
with-latest-Clang.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From 257ed304fb3e71d412568dcbed7129c145812fdf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 2 Sep 2024 21:38:12 -0700
-Subject: [PATCH] Fix build issues with latest Clang
- https://bugs.webkit.org/show_bug.cgi?id=3D276198 rdar://130933637
-
-Reviewed by Yusuke Suzuki.
-
-The use of the template keyword to reference template members without a =
template argument list was deprecated in the C++ standard.
-e.g. `foo.template bar()` nows needs to be `foo.template bar<>()`. I ran=
 into a different issue with `std::reference_wrapper` that
-blocked me from going any further, which AFAICT is a bug on the Clang si=
de.
-
-This also fixes a few other warnings that popped up while building with =
the new Clang denoted inline
-
-* Source/JavaScriptCore/ftl/FTLLowerDFGToB3.cpp:
-(JSC::FTL::DFG::LowerDFGToB3::compileCompareStrictEq): Clang didn't like=
 the implicit static_cast<int32_t>(UINT32_MAX) so make it explicit with a=
 static_assert no data was lost.
-* Source/JavaScriptCore/jit/AssemblyHelpers.cpp:
-(JSC::AssemblyHelpers::emitNonNullDecodeZeroExtendedStructureID): Clang =
didn't like the implicit static_cast<int32_t>(UINT32_MAX) so make it expl=
icit with a static_assert no data was lost.
-* Source/JavaScriptCore/llint/InPlaceInterpreter.cpp:
-* Source/JavaScriptCore/llint/LLIntData.h:
-(JSC::LLInt::getCodeFunctionPtr):
-(JSC::LLInt::getWide16CodeFunctionPtr):
-(JSC::LLInt::getWide32CodeFunctionPtr):
-* Source/JavaScriptCore/parser/Nodes.h: Missing definition of ModuleScop=
eData added include.
-* Source/JavaScriptCore/runtime/JSCast.h:
-(JSC::JSCastingHelpers::inherits):
-(JSC::jsDynamicCast):
-* Source/ThirdParty/libwebrtc/Source/third_party/boringssl/src/crypto/bi=
o/connect.c:
-(conn_callback_ctrl): Had a warning about an incompatible function type.=
 Seems like this is intentional suppressed the warning.
-* Source/WTF/wtf/cf/TypeCastsCF.h: Had a warning about extra namespace q=
ualification. I just moved it out of the namespace. That said, it feels l=
ike this warning shouldn't apply to macro expansions...
-* Source/WebCore/PAL/ThirdParty/libavif/ThirdParty/dav1d/src/decode.c:
-(decode_b): Had a warning about different types on the middle/right of a=
 ternary expression. I just pushed the comparison inside the ternary.
-
-Canonical link: https://commits.webkit.org/280700@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/62b6e=
2db547e#diff-136d848d7c1b400da9b486916b67592b54e5abf7c66ac247697a93ae2fb7=
43a9]
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
-         return m_out.shl(m_out.zeroExtPtr(structureID), m_out.constIntP=
tr(StructureID::encodeShiftAmount));
- #else
-         LValue maskedStructureID =3D structureID;
--        if constexpr (structureHeapAddressSize < 4 * GB)
--            maskedStructureID =3D m_out.bitAnd(structureID, m_out.const=
Int32(StructureID::structureIDMask));
-+        if constexpr (structureHeapAddressSize < 4 * GB) {
-+            static_assert(static_cast<uint32_t>(StructureID::structureI=
DMask) =3D=3D StructureID::structureIDMask);
-+            maskedStructureID =3D m_out.bitAnd(structureID, m_out.const=
Int32(static_cast<uint32_t>(StructureID::structureIDMask)));
-+        }
-         return m_out.bitOr(m_out.constIntPtr(startOfStructureHeap()), m=
_out.zeroExtPtr(maskedStructureID));
- #endif
-     }
---- a/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
-+++ b/Source/JavaScriptCore/jit/AssemblyHelpers.cpp
-@@ -677,8 +677,10 @@ void AssemblyHelpers::emitNonNullDecodeZ
-     if constexpr (structureHeapAddressSize >=3D 4 * GB) {
-         ASSERT(structureHeapAddressSize =3D=3D 4 * GB);
-         move(source, dest);
--    } else
--        and32(TrustedImm32(StructureID::structureIDMask), source, dest)=
;
-+    } else {
-+        static_assert(static_cast<uint32_t>(StructureID::structureIDMas=
k) =3D=3D StructureID::structureIDMask);
-+        and32(TrustedImm32(static_cast<uint32_t>(StructureID::structure=
IDMask)), source, dest);
-+    }
-     or64(TrustedImm64(startOfStructureHeap()), dest);
- #else // not CPU(ADDRESS64)
-     move(source, dest);
---- a/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
-+++ b/Source/JavaScriptCore/llint/InPlaceInterpreter.cpp
-@@ -43,8 +43,8 @@ namespace JSC { namespace IPInt {
- do { \
-     void* base =3D reinterpret_cast<void*>(ipint_unreachable_validate);=
 \
-     void* ptr =3D reinterpret_cast<void*>(ipint_ ## name ## _validate);=
 \
--    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr(); \
--    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr(); \
-+    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr<>(); \
-+    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untagged=
Base) =3D=3D opcode * 256, #name); \
- } while (false);
-=20
-@@ -52,8 +52,8 @@ do { \
- do { \
-     void* base =3D reinterpret_cast<void*>(ipint_i32_trunc_sat_f32_s_va=
lidate); \
-     void* ptr =3D reinterpret_cast<void*>(ipint_ ## name ## _validate);=
 \
--    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr(); \
--    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr(); \
-+    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr<>(); \
-+    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untagged=
Base) =3D=3D opcode * 256, #name); \
- } while (false);
-=20
-@@ -61,8 +61,8 @@ do { \
- do { \
-     void* base =3D reinterpret_cast<void*>(ipint_simd_v128_load_mem_val=
idate); \
-     void* ptr =3D reinterpret_cast<void*>(ipint_ ## name ## _validate);=
 \
--    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr(); \
--    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr(); \
-+    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr<>(); \
-+    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untagged=
Base) =3D=3D opcode * 256, #name); \
- } while (false);
-=20
-@@ -70,8 +70,8 @@ do { \
- do { \
-     void* base =3D reinterpret_cast<void*>(ipint_memory_atomic_notify_v=
alidate); \
-     void* ptr =3D reinterpret_cast<void*>(ipint_ ## name ## _validate);=
 \
--    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr(); \
--    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr(); \
-+    void* untaggedBase =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(base=
).template untaggedPtr<>(); \
-+    void* untaggedPtr =3D CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).=
template untaggedPtr<>(); \
-     RELEASE_ASSERT_WITH_MESSAGE((char*)(untaggedPtr) - (char*)(untagged=
Base) =3D=3D opcode * 256, #name); \
- } while (false);
-=20
---- a/Source/JavaScriptCore/llint/LLIntData.h
-+++ b/Source/JavaScriptCore/llint/LLIntData.h
-@@ -217,7 +217,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionP
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).tagged=
Ptr());
- #else
--    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).templa=
te taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).templa=
te taggedPtr<>());
- #endif
- }
-=20
-@@ -227,7 +227,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).=
taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).=
template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).=
template taggedPtr<>());
- #endif
- }
-=20
-@@ -237,7 +237,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).=
taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).=
template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).=
template taggedPtr<>());
- #endif
- }
- #else // not ENABLE(JIT)
-@@ -361,7 +361,7 @@ ALWAYS_INLINE LLIntCode getCodeFunctionP
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).tagged=
Ptr());
- #else
--    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).templa=
te taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getCodePtr<tag>(opcodeID).templa=
te taggedPtr<>());
- #endif
- }
-=20
-@@ -371,7 +371,7 @@ ALWAYS_INLINE LLIntCode getWide16CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).=
taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).=
template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide16CodePtr<tag>(opcodeID).=
template taggedPtr<>());
- #endif
- }
-=20
-@@ -381,7 +381,7 @@ ALWAYS_INLINE LLIntCode getWide32CodeFun
- #if COMPILER(MSVC)
-     return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).=
taggedPtr());
- #else
--    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).=
template taggedPtr());
-+    return reinterpret_cast<LLIntCode>(getWide32CodePtr<tag>(opcodeID).=
template taggedPtr<>());
- #endif
- }
- #else // not ENABLE(JIT)
---- a/Source/JavaScriptCore/llint/LLIntThunks.cpp
-+++ b/Source/JavaScriptCore/llint/LLIntThunks.cpp
-@@ -227,7 +227,7 @@ ALWAYS_INLINE void* untaggedPtr(void* pt
- #if COMPILER(MSVC)
-         return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).untaggedPtr=
();
- #else
--        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template un=
taggedPtr();
-+        return CodePtr<CFunctionPtrTag>::fromTaggedPtr(ptr).template un=
taggedPtr<>();
- #endif
- }
-=20
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
-     using Dispatcher =3D InheritsTraits<Target>;
--    return Dispatcher::template inherits(from);
-+    return Dispatcher::template inherits<>(from);
- }
-=20
- } // namespace JSCastingHelpers
-@@ -245,7 +245,7 @@ template<typename To, typename From>
- To jsDynamicCast(From* from)
- {
-     using Dispatcher =3D JSCastingHelpers::InheritsTraits<typename std:=
:remove_cv<typename std::remove_pointer<To>::type>::type>;
--    if (LIKELY(Dispatcher::template inherits(from)))
-+    if (LIKELY(Dispatcher::template inherits<>(from)))
-         return static_cast<To>(from);
-     return nullptr;
- }
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fda=
ca2a29ec3400c927d710a37a8.patch b/meta-oe/recipes-support/webkitgtk/webki=
tgtk3/30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch
deleted file mode 100644
index b2e40a88c..000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/30e1d5e22213fdaca2a29e=
c3400c927d710a37a8.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 1523e00a2a76e285262c8aa3721b5d99f3f2d612 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Mon, 16 Jan 2023 17:03:30 +0100
-Subject: [PATCH] REGRESSION(257865@main): B3Validate.cpp: fix
-
- !ENABLE(WEBASSEMBLY_B3JIT)
-
-https://bugs.webkit.org/show_bug.cgi?id=3D250681
-
-Reviewed by NOBODY (OOPS!).
-
-WasmTypeDefinition.h isn't included if not ENABLE(WEBASSEMBLY_B3JIT).
-Also, toB3Type and simdScalarType are not defined if it is included.
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
-
-Upstream-Status: Inappropriate [https://bugs.launchpad.net/ubuntu/+sourc=
e/webkit2gtk/+bug/2008798]
----
- Source/JavaScriptCore/b3/B3Validate.cpp | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/Source/JavaScriptCore/b3/B3Validate.cpp b/Source/JavaScript=
Core/b3/B3Validate.cpp
-index eaaa3749..1d089783 100644
---- a/Source/JavaScriptCore/b3/B3Validate.cpp
-+++ b/Source/JavaScriptCore/b3/B3Validate.cpp
-@@ -47,6 +47,12 @@
- #include <wtf/StringPrintStream.h>
- #include <wtf/text/CString.h>
-=20
-+#if ENABLE(WEBASSEMBLY) && ENABLE(WEBASSEMBLY_B3JIT)
-+#define simdScalarTypeToB3Type(type) toB3Type(Wasm::simdScalarType(type=
))
-+#else
-+#define simdScalarTypeToB3Type(type) B3::Type()
-+#endif
-+
- namespace JSC { namespace B3 {
-=20
- namespace {
-@@ -454,7 +460,7 @@ public:
-             case VectorExtractLane:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value)=
);
-                 VALIDATE(value->numChildren() =3D=3D 1, ("At ", *value)=
);
--                VALIDATE(value->type() =3D=3D toB3Type(Wasm::simdScalar=
Type(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->type() =3D=3D simdScalarTypeToB3Type(va=
lue->asSIMDValue()->simdLane()), ("At ", *value));
-                 VALIDATE(value->child(0)->type() =3D=3D V128, ("At ", *=
value));
-                 break;
-             case VectorReplaceLane:
-@@ -462,7 +468,7 @@ public:
-                 VALIDATE(value->numChildren() =3D=3D 2, ("At ", *value)=
);
-                 VALIDATE(value->type() =3D=3D V128, ("At ", *value));
-                 VALIDATE(value->child(0)->type() =3D=3D V128, ("At ", *=
value));
--                VALIDATE(value->child(1)->type() =3D=3D toB3Type(Wasm::=
simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->child(1)->type() =3D=3D simdScalarTypeT=
oB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 break;
-             case VectorDupElement:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value)=
);
-@@ -484,7 +490,7 @@ public:
-                 VALIDATE(!value->kind().hasExtraBits(), ("At ", *value)=
);
-                 VALIDATE(value->numChildren() =3D=3D 1, ("At ", *value)=
);
-                 VALIDATE(value->type() =3D=3D V128, ("At ", *value));
--                VALIDATE(value->child(0)->type() =3D=3D toB3Type(Wasm::=
simdScalarType(value->asSIMDValue()->simdLane())), ("At ", *value));
-+                VALIDATE(value->child(0)->type() =3D=3D simdScalarTypeT=
oB3Type(value->asSIMDValue()->simdLane()), ("At ", *value));
-                 break;
-=20
-             case VectorPopcnt:
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.46.0.bb
similarity index 94%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.46.0.bb
index 9493d8642..0e3702615 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.46.0.bb
@@ -10,14 +10,13 @@ LIC_FILES_CHKSUM =3D "file://Source/JavaScriptCore/CO=
PYING.LIB;md5=3Dd0c6d6397a5d842
                     "
=20
 SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
-           file://0001-FindGObjectIntrospection.cmake-prefix-variables-o=
bta.patch \
-           file://reproducibility.patch \
-           file://no-musttail-arm.patch \
-           file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-d=
ecl.patch \
-           file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
-           file://0001-Fix-build-issues-with-latest-Clang.patch \
+	file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch =
\
+	file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch =
\
+	file://reproducibility.patch \
+	file://no-musttail-arm.patch \
+	file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-decl.patch =
\
            "
-SRC_URI[sha256sum] =3D "dc82d042ecaca981a4852357c06e5235743319cf10a94cd3=
6ad41b97883a0b54"
+SRC_URI[sha256sum] =3D "d4d433040f190151560c50bde840850089f87bad4fefa9eb=
db4aae856a3df43a"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check =
upstream-version-is-even gi-docgen
=20
@@ -92,6 +91,7 @@ EXTRA_OECMAKE =3D " \
 	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATIO=
N=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
 	-DENABLE_MINIBROWSER=3DON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \
+	-DUSE_SYSTEM_SYSPROF_CAPTURE=3DOFF \
 		"
 # Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size o=
f the
 # debug symbols (4.3GB to 700M at time of writing)
--=20
2.46.0


