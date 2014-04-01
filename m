Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9636084B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:00 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so6673348wes.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T57rOwHaD0ahiG2562nVwttjZuO0l10RCWgLLk8zpTk=;
	b=ExXETia8OcDtVPrCNAK1xhQEWfTZLp+1PhQksBr7VVl2OjTs+W0gwWNyA9UjGd/REM
	b0Bjqwp0AuoHhgXxGGjiw/EQ3Mb9qVA2DzTe5KgpYWfOrXlV6dZC3t46vDFZPbwtjAbf
	foKB0wGvy/zNYnwo5jTH+B+qz2XUBXVjxteudL8wCGw1yf0UPYwfrevEjYDCP1UaCNTx
	EmNL8XhgYgST61MA3lIJGMsZd06Bs8WfSFyoDh4pazZuNgBdSavcy+3oa4/6aLmY43Wx
	lNdPuqo4GetIHVut9HHXmK0+Ayw9GLBx9v5Zck1DDggLDXj+8iCG0ozpymSatfH3Y+fu
	gmVQ==
X-Received: by 10.180.100.72 with SMTP id ew8mr21739743wib.16.1396372441150;
	Tue, 01 Apr 2014 10:14:01 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t4sm41840486eeb.29.2014.04.01.10.13.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:10 +0200
Message-Id: <1396372434-10710-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/46] webkit-efl: upgrade to new snapshot r164189
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 17:14:01 -0000

* update webkit-efl_svn to point to the same source and old isn't
  compatible with new efl
  http://sourceforge.net/p/enlightenment/mailman/message/32002633/
* restrict for armv7a, because upstream dropped support

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...bkit-efl_2.3.2+svnr159807.bb => webkit-efl.inc} |  31 +-
 ...lines.h-remove-indexingHeader-preCapacity.patch |  27 -
 ...KitHelpers.cmake-Add-Wno-error-cast-align.patch |  25 +-
 ...include-Element.h-for-hasTagName-function.patch |  58 ---
 ...r.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch |  80 +++
 .../webkit/webkit-efl/0003-Fix-linking-issue.patch |  63 +++
 .../recipes-efl/webkit/webkit-efl/bison-2.6.patch  | 558 ---------------------
 .../webkit/webkit-efl/gcc-4.8.2.fix.patch          |  15 -
 .../webkit/webkit-efl_2.3.4+svnr164189.bb          |  12 +
 meta-efl/recipes-efl/webkit/webkit-efl_svn.bb      |  35 +-
 10 files changed, 199 insertions(+), 705 deletions(-)
 rename meta-efl/recipes-efl/webkit/{webkit-efl_2.3.2+svnr159807.bb => webkit-efl.inc} (52%)
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issue.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/bison-2.6.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
 create mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb b/meta-efl/recipes-efl/webkit/webkit-efl.inc
similarity index 52%
rename from meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
rename to meta-efl/recipes-efl/webkit/webkit-efl.inc
index 879ff1f..44ef9d4 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl.inc
@@ -13,15 +13,15 @@ DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
            ruby-native"
 
 SRC_URI = "\
-    ${E_RELEASES}/libs/webkit-efl/webkit-efl-159807.tar.xz \
-    file://gcc-4.8.2.fix.patch \
+    ${E_RELEASES}/libs/webkit-efl/webkit-efl-164189.tar.xz \
     file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
-    file://0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch \
+    file://0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch \
+    file://0003-Fix-linking-issue.patch \
 "
-SRC_URI[md5sum] = "3e1377d976460dd14db0dd3cd39b8e48"
-SRC_URI[sha256sum] = "a99531299e41ba4671b32bbf46c3efc4d65960c9c87949a87f76e622c284f178"
+SRC_URI[md5sum] = "731513fc042ec8e03840bc1ab6a66771"
+SRC_URI[sha256sum] = "660aefd65c0e5c6494eaec30539cda5f40fbdff17f28e7e83d341b245227cccd"
 
-S = "${WORKDIR}/${BPN}"
+S = "${WORKDIR}/efl-webkit"
 
 inherit cmake lib_package pkgconfig perlnative pythonnative
 
@@ -37,6 +37,25 @@ EXTRA_OECMAKE = " \
     -DENABLE_ACCESSIBILITY=Off \
     -DENABLE_BATTERY_STATUS=Off \
 "
+# generated ASM code isn't compatible with armv[45]
+# it was removed from macro assembler in upstream commit 121885
+# https://bugs.webkit.org/show_bug.cgi?id=90198
+EXTRA_OECMAKE_append_armv4 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
+EXTRA_OECMAKE_append_armv5 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
+
+# hack it in OptionsEfl.cmake because that overrules -DENABLE_LLINT=Off
+do_configure_prepend_armv4() {
+    sed -i 's/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT ON)/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT OFF)/g' ${S}/Source/cmake/OptionsEfl.cmake
+}
+do_configure_prepend_armv5() {
+    sed -i 's/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT ON)/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT OFF)/g' ${S}/Source/cmake/OptionsEfl.cmake
+}
+
+# and disabled LLINT currently isn't supported, so restrict to armv7a and x86*
+COMPATIBLE_MACHINE = "(-)"
+COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86-64 = "(.*)"
+COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 LEAD_SONAME = "libewebkit.so"
 PACKAGES =+ "${PN}launcher-dbg ${PN}launcher ${PN}-inspector"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
deleted file mode 100644
index 003a1d1..0000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ButterflyInlines.h-remove-indexingHeader-preCapacity.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5b9bbf9c056e3690e2872cc74a8962ec6a21a020 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 13 Jan 2014 19:00:46 +0100
-Subject: [PATCH] ButterflyInlines.h: remove
- !indexingHeader()->preCapacity(oldStructure)
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/JavaScriptCore/runtime/ButterflyInlines.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/JavaScriptCore/runtime/ButterflyInlines.h b/Source/JavaScriptCore/runtime/ButterflyInlines.h
-index f5439bb..d5c828f 100644
---- a/Source/JavaScriptCore/runtime/ButterflyInlines.h
-+++ b/Source/JavaScriptCore/runtime/ButterflyInlines.h
-@@ -128,7 +128,7 @@ inline Butterfly* Butterfly::growArrayRight(
-     bool hadIndexingHeader, size_t oldIndexingPayloadSizeInBytes,
-     size_t newIndexingPayloadSizeInBytes)
- {
--    ASSERT_UNUSED(oldStructure, !indexingHeader()->preCapacity(oldStructure));
-+//    ASSERT_UNUSED(oldStructure, !indexingHeader()->preCapacity(oldStructure));
-     ASSERT_UNUSED(oldStructure, hadIndexingHeader == oldStructure->hasIndexingHeader(intendedOwner));
-     void* theBase = base(0, propertyCapacity);
-     size_t oldSize = totalSize(0, propertyCapacity, hadIndexingHeader, oldIndexingPayloadSizeInBytes);
--- 
-1.8.5.2
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
index 5df0f8a..864b9c9 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch
@@ -1,29 +1,30 @@
-From bfabbcab5dc4fe29bc91bbfbd9c9a404a3e2538b Mon Sep 17 00:00:00 2001
+From b37711ca03ea9410e795f29398069fed9e9c2d30 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 13 Jan 2014 17:21:25 +0100
-Subject: [PATCH] WebKitHelpers.cmake: Add -Wno-error=cast-align
+Subject: [PATCH 1/3] WebKitHelpers.cmake: Add -Wno-error=cast-align
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- Source/cmake/WebKitHelpers.cmake | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ Source/cmake/WebKitHelpers.cmake | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/Source/cmake/WebKitHelpers.cmake b/Source/cmake/WebKitHelpers.cmake
-index 1e51ebc..d813117 100644
+index 409931c..345b346 100644
 --- a/Source/cmake/WebKitHelpers.cmake
 +++ b/Source/cmake/WebKitHelpers.cmake
-@@ -42,7 +42,10 @@ macro(WEBKIT_SET_EXTRA_COMPILER_FLAGS _target)
+@@ -44,7 +44,11 @@ macro(WEBKIT_SET_EXTRA_COMPILER_FLAGS _target)
  
          # Enable errors on warning
          if (OPTION_ENABLE_WERROR)
 -            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=unused-parameter ${OLD_COMPILE_FLAGS}")
-+            # /OE/build/shr-core/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/WebCore/platform/graphics/GlyphPage.h: In member function 'void WebCore::OpenTypeVerticalData::substituteWithVerticalGlyphs(const WebCore::SimpleFontData*, WebCore::GlyphPage*, unsigned int, unsigned int) const': /OE/build/shr-core/tmp-eglibc/work/x86_64-oe-linux/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/WebCore/platform/graphics/GlyphPage.h:120:30: error: array subscript is above array bounds [-Werror=array-bounds]
-+            # | /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/libsoup-2.4/libsoup/soup-proxy-uri-resolver.h:13:50: error: 'GType soup_proxy_uri_resolver_get_type()' is deprecated (declared at /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/include/libsoup-2.4/libsoup/soup-proxy-uri-resolver.h:48) [-Werror=deprecated-declarations]
-+            # | /OE/build/shr-core/tmp-eglibc/work/cortexa8-vfp-neon-oe-linux-gnueabi/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/JavaScriptCore/runtime/JSDataViewPrototype.cpp:120:133: error: cast from 'uint8_t* {aka unsigned char*}' to 'JSC::IntegralTypedArrayAdaptor<short int, JSC::GenericTypedArrayView<JSC::Int16Adaptor>, JSC::JSGenericTypedArrayView<JSC::Int16Adaptor>, (JSC::TypedArrayType)4u>::Type* {aka short int*}' increases required alignment of target type [-Werror=cast-align]
-+            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=unused-parameter -Wno-error=array-bounds -Wno-error=deprecated-declarations -Wno-error=cast-align ${OLD_COMPILE_FLAGS}")
++            # FIXME: When we use -fno-tree-dce to support the jsCStack branch merge, build error occurs due to the uninitialization. Temporarily we set
++            # uninitialized as build warning in order to support the jsCStack merge. https://bugs.webkit.org/show_bug.cgi?id=127777.
++            set(OLD_COMPILE_FLAGS "-Werror -Wno-error=unused-parameter -Wno-error=uninitialized ${OLD_COMPILE_FLAGS}")
++	    # | /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/webkit-efl/2.3.2+svnr159807-r0/webkit-efl/Source/JavaScriptCore/runtime/JSDataViewPrototype.cpp:161:104: error: cast from 'uint8_t* {aka unsigned char*}' to 'JSC::FloatTypedArrayAdaptor<double, JSC::GenericTypedArrayView<JSC::Float64Adaptor>, JSC::JSGenericTypedArrayView<JSC::Float64Adaptor>, (JSC::TypedArrayType)9u>::Type* {aka double*}' increases required alignment of target type [-Werror=cast-align]
++            set(OLD_COMPILE_FLAGS "-Wno-error=cast-align -Wno-error=array-bounds -Wno-error=deprecated-declarations ${OLD_COMPILE_FLAGS}")
          endif ()
  
-         # Disable C++0x compat warnings for GCC >= 4.6.0 until we build
+         set_target_properties(${_target} PROPERTIES
 -- 
-1.8.5.2
+1.9.0
 
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
deleted file mode 100644
index 153097b..0000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-ewk-include-Element.h-for-hasTagName-function.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a5a5eeb10b56ad1f98899a02281ea825e3cd1202 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 1 Jun 2013 19:23:54 +0200
-Subject: [PATCH] ewk: include Element.h for hasTagName function
-
-* ewebkit build fails like gtk in http://trac.webkit.org/changeset/72745
-  | ../../../lib/libwebcore_efl.so.0.1.0: undefined reference to `WebCore::Node::hasTagName(WebCore::QualifiedName const&) const'
-  | collect2: error: ld returned 1 exit status
-  | make[2]: *** [bin/DumpRenderTree] Error 1
-* SDL port has similar issue:
-  https://bugs.webkit.org/show_bug.cgi?id=88536
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/WebCore/css/CSSStyleSheet.cpp | 1 +
- Source/WebKit/efl/ewk/ewk_frame.cpp  | 1 +
- Source/WebKit/efl/ewk/ewk_view.cpp   | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/Source/WebCore/css/CSSStyleSheet.cpp b/Source/WebCore/css/CSSStyleSheet.cpp
-index 00b2d91..1d03c2e 100644
---- a/Source/WebCore/css/CSSStyleSheet.cpp
-+++ b/Source/WebCore/css/CSSStyleSheet.cpp
-@@ -29,6 +29,7 @@
- #include "CSSStyleRule.h"
- #include "CachedCSSStyleSheet.h"
- #include "Document.h"
-+#include "Element.h"
- #include "ExceptionCode.h"
- #include "HTMLNames.h"
- #include "MediaList.h"
-diff --git a/Source/WebKit/efl/ewk/ewk_frame.cpp b/Source/WebKit/efl/ewk/ewk_frame.cpp
-index fd1ffd2..c86601a 100644
---- a/Source/WebKit/efl/ewk/ewk_frame.cpp
-+++ b/Source/WebKit/efl/ewk/ewk_frame.cpp
-@@ -32,6 +32,7 @@
- #include "FocusController.h"
- #include "FrameLoaderClientEfl.h"
- #include "FrameView.h"
-+#include "Element.h"
- #include "HTMLCollection.h"
- #include "HTMLHeadElement.h"
- #include "HTMLImageElement.h"
-diff --git a/Source/WebKit/efl/ewk/ewk_view.cpp b/Source/WebKit/efl/ewk/ewk_view.cpp
-index 9798e94..7a5da60 100644
---- a/Source/WebKit/efl/ewk/ewk_view.cpp
-+++ b/Source/WebKit/efl/ewk/ewk_view.cpp
-@@ -36,6 +36,7 @@
- #include "FocusController.h"
- #include "FrameLoaderClientEfl.h"
- #include "FrameView.h"
-+#include "Element.h"
- #include "GraphicsContext.h"
- #include "HTMLElement.h"
- #include "HTMLInputElement.h"
--- 
-1.8.2.1
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch
new file mode 100644
index 0000000..9f005bc
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch
@@ -0,0 +1,80 @@
+From e284e92da00011e55d8f79383034e0c9c1a8a106 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 27 Feb 2014 13:40:43 +0100
+Subject: [PATCH 2/3] ARMAssembler.h: Don't generate BKPT and BLX for armv4*
+
+* I haven't tested it in runtime yet, but it's better than to wait for asm failure later:
+  {standard input}: Assembler messages:
+  {standard input}:35: Error: selected processor does not support ARM mode `bkpt #0'
+  {standard input}:62: Error: selected processor does not support ARM mode `blx llint_throw_stack_overflow_error'
+  ...
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/JavaScriptCore/assembler/ARMAssembler.h | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/Source/JavaScriptCore/assembler/ARMAssembler.h b/Source/JavaScriptCore/assembler/ARMAssembler.h
+index 087d31c..1b40ded 100644
+--- a/Source/JavaScriptCore/assembler/ARMAssembler.h
++++ b/Source/JavaScriptCore/assembler/ARMAssembler.h
+@@ -211,7 +211,9 @@ namespace JSC {
+             LDMIA = 0x08b00000,
+             B = 0x0a000000,
+             BL = 0x0b000000,
++#if WTF_ARM_ARCH_AT_LEAST(5)
+             BX = 0x012fff10,
++#endif
+             VMOV_VFP64 = 0x0c400a10,
+             VMOV_ARM64 = 0x0c500a10,
+             VMOV_VFP32 = 0x0e000a10,
+@@ -223,8 +225,10 @@ namespace JSC {
+             VCVT_F64_F32 = 0x0eb70ac0,
+             VMRS_APSR = 0x0ef1fa10,
+             CLZ = 0x016f0f10,
++#if WTF_ARM_ARCH_AT_LEAST(5)
+             BKPT = 0xe1200070,
+             BLX = 0x012fff30,
++#endif
+ #if WTF_ARM_ARCH_AT_LEAST(7)
+             MOVW = 0x03000000,
+             MOVT = 0x03400000,
+@@ -689,7 +693,11 @@ namespace JSC {
+ 
+         void bkpt(ARMWord value)
+         {
++#if WTF_ARM_ARCH_AT_LEAST(5)
+             m_buffer.putInt(BKPT | ((value & 0xff0) << 4) | (value & 0xf));
++#else
++            // BKPT is available in ARMv5T and above, skip it here
++#endif
+         }
+ 
+         void nop()
+@@ -704,12 +712,23 @@ namespace JSC {
+ 
+         void bx(int rm, Condition cc = AL)
+         {
++#if WTF_ARM_ARCH_AT_LEAST(5)
+             emitInstruction(toARMWord(cc) | BX, 0, 0, RM(rm));
++#else
++            // BX is available in ARMv5T and above.
++            emitInstruction(toARMWord(cc) | MOV, ARMRegisters::pc, ARMRegisters::lr, 0);
++#endif
+         }
+ 
+         AssemblerLabel blx(int rm, Condition cc = AL)
+         {
++#if WTF_ARM_ARCH_AT_LEAST(5)
+             emitInstruction(toARMWord(cc) | BLX, 0, 0, RM(rm));
++#else
++            // BLX is available in ARMv5T and above.
++            emitInstruction(toARMWord(cc) | MOV, ARMRegisters::lr, ARMRegisters::pc, 0);
++            emitInstruction(toARMWord(cc) | MOV, ARMRegisters::pc, RM(rm), 0);
++#endif
+             return m_buffer.label();
+         }
+ 
+-- 
+1.9.0
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issue.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issue.patch
new file mode 100644
index 0000000..ce1c687
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl/0003-Fix-linking-issue.patch
@@ -0,0 +1,63 @@
+From 09088da56f3de17ab1cc537627cda6bf808eaf4c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 27 Feb 2014 14:17:29 +0100
+Subject: [PATCH 3/3] Fix linking issue
+
+* inline function is sometimes not included soon enough
+
+  Partialy taken from:
+  https://bugs.webkit.org/show_bug.cgi?id=124152
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/JavaScriptCore/llint/LLIntEntrypoint.cpp          | 3 +++
+ Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp | 3 +++
+ Source/JavaScriptCore/runtime/SymbolTable.cpp            | 4 ++++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/Source/JavaScriptCore/llint/LLIntEntrypoint.cpp b/Source/JavaScriptCore/llint/LLIntEntrypoint.cpp
+index 5d91be6..73cba31 100644
+--- a/Source/JavaScriptCore/llint/LLIntEntrypoint.cpp
++++ b/Source/JavaScriptCore/llint/LLIntEntrypoint.cpp
+@@ -31,6 +31,9 @@
+ #include "CodeBlock.h"
+ #include "JITCode.h"
+ #include "JSObject.h"
++#include "JSCellInlines.h"
++#include "JSDestructibleObject.h"
++#include "SlotVisitorInlines.h"
+ #include "LLIntThunks.h"
+ #include "LowLevelInterpreter.h"
+ #include "MaxFrameExtentForSlowPathCall.h"
+diff --git a/Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp b/Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp
+index d0583fc..4be5ec3 100644
+--- a/Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp
++++ b/Source/JavaScriptCore/runtime/FunctionExecutableDump.cpp
+@@ -25,6 +25,9 @@
+ 
+ #include "config.h"
+ #include "FunctionExecutableDump.h"
++#include "JSCellInlines.h"
++#include "JSDestructibleObject.h"
++#include "SlotVisitorInlines.h"
+ 
+ #include "CodeBlock.h"
+ 
+diff --git a/Source/JavaScriptCore/runtime/SymbolTable.cpp b/Source/JavaScriptCore/runtime/SymbolTable.cpp
+index 6eb0239..21450df 100644
+--- a/Source/JavaScriptCore/runtime/SymbolTable.cpp
++++ b/Source/JavaScriptCore/runtime/SymbolTable.cpp
+@@ -33,6 +33,10 @@
+ #include "JSCInlines.h"
+ #include "SlotVisitorInlines.h"
+ 
++#include "JSCellInlines.h"
++#include "JSDestructibleObject.h"
++#include "SlotVisitorInlines.h"
++
+ namespace JSC {
+ 
+ const ClassInfo SymbolTable::s_info = { "SymbolTable", 0, 0, 0, CREATE_METHOD_TABLE(SymbolTable) };
+-- 
+1.9.0
+
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/bison-2.6.patch b/meta-efl/recipes-efl/webkit/webkit-efl/bison-2.6.patch
deleted file mode 100644
index d4aa674..0000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/bison-2.6.patch
+++ /dev/null
@@ -1,558 +0,0 @@
-Upstream-Status: Backport
-http://trac.webkit.org/changeset/124099
-
-Subversion Revision: 123651
-diff --git a/Source/WebCore/css/CSSGrammar.y b/Source/WebCore/css/CSSGrammar.y
-index c7c10b541cd46ad4febc6efe289e81b2cfb0861e..1c604e76b4da4cc65f395bc4a73b112561bd5c84 100644
---- a/Source/WebCore/css/CSSGrammar.y
-+++ b/Source/WebCore/css/CSSGrammar.y
-@@ -53,14 +53,13 @@ using namespace HTMLNames;
- #define YYMAXDEPTH 10000
- #define YYDEBUG 0
- 
--// FIXME: Replace with %parse-param { CSSParser* parser } once we can depend on bison 2.x
--#define YYPARSE_PARAM parser
--#define YYLEX_PARAM parser
--
- %}
- 
- %pure_parser
- 
-+%parse-param { CSSParser* parser }
-+%lex-param { CSSParser* parser }
-+
- %union {
-     bool boolean;
-     char character;
-@@ -89,7 +88,7 @@ using namespace HTMLNames;
- 
- %{
- 
--static inline int cssyyerror(const char*)
-+static inline int cssyyerror(void*, const char*)
- {
-     return 1;
- }
-diff --git a/Source/WebCore/css/CSSParser.cpp b/Source/WebCore/css/CSSParser.cpp
-index 650844060477cfc6ea6fdeaf11ec63b34ac646e7..8369549dbff25537cf93a11237a9bbbac4fe50f2 100644
---- a/Source/WebCore/css/CSSParser.cpp
-+++ b/Source/WebCore/css/CSSParser.cpp
-@@ -114,7 +114,7 @@
- extern int cssyydebug;
- #endif
- 
--extern int cssyyparse(void* parser);
-+extern int cssyyparse(WebCore::CSSParser*);
- 
- using namespace std;
- using namespace WTF;
-diff --git a/Source/WebCore/xml/XPathGrammar.y b/Source/WebCore/xml/XPathGrammar.y
-index 2eba5b35bd2338272a0f4ec756d137e47d2d59c8..d558211db2d89ea13716762a51397755560f66f3 100644
---- a/Source/WebCore/xml/XPathGrammar.y
-+++ b/Source/WebCore/xml/XPathGrammar.y
-@@ -34,6 +34,7 @@
- #include "XPathParser.h"
- #include "XPathPath.h"
- #include "XPathPredicate.h"
-+#include "XPathStep.h"
- #include "XPathVariableReference.h"
- #include <wtf/FastMalloc.h>
- 
-@@ -44,8 +45,6 @@
- #define YYLTYPE_IS_TRIVIAL 1
- #define YYDEBUG 0
- #define YYMAXDEPTH 10000
--#define YYPARSE_PARAM parserParameter
--#define PARSER static_cast<Parser*>(parserParameter)
- 
- using namespace WebCore;
- using namespace XPath;
-@@ -53,6 +52,7 @@ using namespace XPath;
- %}
- 
- %pure_parser
-+%parse-param { WebCore::XPath::Parser* parser }
- 
- %union
- {
-@@ -71,7 +71,7 @@ using namespace XPath;
- %{
- 
- static int xpathyylex(YYSTYPE* yylval) { return Parser::current()->lex(yylval); }
--static void xpathyyerror(const char*) { }
-+static void xpathyyerror(void*, const char*) { }
-     
- %}
- 
-@@ -118,7 +118,7 @@ static void xpathyyerror(const char*) { }
- Expr:
-     OrExpr
-     {
--        PARSER->m_topExpr = $1;
-+        parser->m_topExpr = $1;
-     }
-     ;
- 
-@@ -138,7 +138,7 @@ AbsoluteLocationPath:
-     '/'
-     {
-         $$ = new LocationPath;
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     '/' RelativeLocationPath
-@@ -150,7 +150,7 @@ AbsoluteLocationPath:
-     {
-         $$ = $2;
-         $$->insertFirstStep($1);
--        PARSER->unregisterParseNode($1);
-+        parser->unregisterParseNode($1);
-     }
-     ;
- 
-@@ -159,22 +159,22 @@ RelativeLocationPath:
-     {
-         $$ = new LocationPath;
-         $$->appendStep($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     RelativeLocationPath '/' Step
-     {
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     |
-     RelativeLocationPath DescendantOrSelf Step
-     {
-         $$->appendStep($2);
-         $$->appendStep($3);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -183,58 +183,58 @@ Step:
-     {
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, *$1, *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, *$1);
--        PARSER->deleteNodeTest($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$1, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$1, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
-         
-         if ($2) {
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$2);
--            PARSER->deletePredicateVector($2);
-+            parser->deletePredicateVector($2);
-         } else
-             $$ = new Step(Step::ChildAxis, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NodeTest OptionalPredicateList
-     {
-         if ($3) {
-             $$ = new Step($1, *$2, *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, *$2);
--        PARSER->deleteNodeTest($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteNodeTest($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AxisSpecifier NAMETEST OptionalPredicateList
-     {
-         String localName;
-         String namespaceURI;
--        if (!PARSER->expandQName(*$2, localName, namespaceURI)) {
--            PARSER->m_gotNamespaceError = true;
-+        if (!parser->expandQName(*$2, localName, namespaceURI)) {
-+            parser->m_gotNamespaceError = true;
-             YYABORT;
-         }
- 
-         if ($3) {
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI), *$3);
--            PARSER->deletePredicateVector($3);
-+            parser->deletePredicateVector($3);
-         } else
-             $$ = new Step($1, Step::NodeTest(Step::NodeTest::NameTest, localName, namespaceURI));
--        PARSER->deleteString($2);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($2);
-+        parser->registerParseNode($$);
-     }
-     |
-     AbbreviatedStep
-@@ -259,23 +259,23 @@ NodeTest:
-         else if (*$1 == "comment")
-             $$ = new Step::NodeTest(Step::NodeTest::CommentNodeTest);
- 
--        PARSER->deleteString($1);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest);
--        PARSER->deleteString($1);        
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->registerNodeTest($$);
-     }
-     |
-     PI '(' LITERAL ')'
-     {
-         $$ = new Step::NodeTest(Step::NodeTest::ProcessingInstructionNodeTest, $3->stripWhiteSpace());
--        PARSER->deleteString($1);        
--        PARSER->deleteString($3);
--        PARSER->registerNodeTest($$);
-+        parser->deleteString($1);
-+        parser->deleteString($3);
-+        parser->registerNodeTest($$);
-     }
-     ;
- 
-@@ -293,14 +293,14 @@ PredicateList:
-     {
-         $$ = new Vector<Predicate*>;
-         $$->append(new Predicate($1));
--        PARSER->unregisterParseNode($1);
--        PARSER->registerPredicateVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerPredicateVector($$);
-     }
-     |
-     PredicateList Predicate
-     {
-         $$->append(new Predicate($2));
--        PARSER->unregisterParseNode($2);
-+        parser->unregisterParseNode($2);
-     }
-     ;
- 
-@@ -315,7 +315,7 @@ DescendantOrSelf:
-     SLASHSLASH
-     {
-         $$ = new Step(Step::DescendantOrSelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -323,13 +323,13 @@ AbbreviatedStep:
-     '.'
-     {
-         $$ = new Step(Step::SelfAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     |
-     DOTDOT
-     {
-         $$ = new Step(Step::ParentAxis, Step::NodeTest(Step::NodeTest::AnyNodeTest));
--        PARSER->registerParseNode($$);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -337,8 +337,8 @@ PrimaryExpr:
-     VARIABLEREFERENCE
-     {
-         $$ = new VariableReference(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     '(' Expr ')'
-@@ -349,15 +349,15 @@ PrimaryExpr:
-     LITERAL
-     {
-         $$ = new StringExpression(*$1);
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     NUMBER
-     {
-         $$ = new Number($1->toDouble());
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FunctionCall
-@@ -369,8 +369,8 @@ FunctionCall:
-         $$ = createFunction(*$1);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->registerParseNode($$);
-     }
-     |
-     FUNCTIONNAME '(' ArgumentList ')'
-@@ -378,9 +378,9 @@ FunctionCall:
-         $$ = createFunction(*$1, *$3);
-         if (!$$)
-             YYABORT;
--        PARSER->deleteString($1);
--        PARSER->deleteExpressionVector($3);
--        PARSER->registerParseNode($$);
-+        parser->deleteString($1);
-+        parser->deleteExpressionVector($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -389,14 +389,14 @@ ArgumentList:
-     {
-         $$ = new Vector<Expression*>;
-         $$->append($1);
--        PARSER->unregisterParseNode($1);
--        PARSER->registerExpressionVector($$);
-+        parser->unregisterParseNode($1);
-+        parser->registerExpressionVector($$);
-     }
-     |
-     ArgumentList ',' Argument
-     {
-         $$->append($3);
--        PARSER->unregisterParseNode($3);
-+        parser->unregisterParseNode($3);
-     }
-     ;
- 
-@@ -412,9 +412,9 @@ UnionExpr:
-         $$ = new Union;
-         $$->addSubExpression($1);
-         $$->addSubExpression($3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -430,9 +430,9 @@ PathExpr:
-     {
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     FilterExpr DescendantOrSelf RelativeLocationPath
-@@ -440,10 +440,10 @@ PathExpr:
-         $3->insertFirstStep($2);
-         $3->setAbsolute(true);
-         $$ = new Path(static_cast<Filter*>($1), $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($2);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($2);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -453,9 +453,9 @@ FilterExpr:
-     PrimaryExpr PredicateList
-     {
-         $$ = new Filter($1, *$2);
--        PARSER->unregisterParseNode($1);
--        PARSER->deletePredicateVector($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->deletePredicateVector($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -465,9 +465,9 @@ OrExpr:
-     OrExpr OR AndExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_Or, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -477,9 +477,9 @@ AndExpr:
-     AndExpr AND EqualityExpr
-     {
-         $$ = new LogicalOp(LogicalOp::OP_And, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -489,9 +489,9 @@ EqualityExpr:
-     EqualityExpr EQOP RelationalExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -501,9 +501,9 @@ RelationalExpr:
-     RelationalExpr RELOP AdditiveExpr
-     {
-         $$ = new EqTestOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -513,17 +513,17 @@ AdditiveExpr:
-     AdditiveExpr PLUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Add, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     |
-     AdditiveExpr MINUS MultiplicativeExpr
-     {
-         $$ = new NumericOp(NumericOp::OP_Sub, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -533,9 +533,9 @@ MultiplicativeExpr:
-     MultiplicativeExpr MULOP UnaryExpr
-     {
-         $$ = new NumericOp($2, $1, $3);
--        PARSER->unregisterParseNode($1);
--        PARSER->unregisterParseNode($3);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($1);
-+        parser->unregisterParseNode($3);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-@@ -546,8 +546,8 @@ UnaryExpr:
-     {
-         $$ = new Negative;
-         $$->addSubExpression($2);
--        PARSER->unregisterParseNode($2);
--        PARSER->registerParseNode($$);
-+        parser->unregisterParseNode($2);
-+        parser->registerParseNode($$);
-     }
-     ;
- 
-diff --git a/Source/WebCore/xml/XPathParser.cpp b/Source/WebCore/xml/XPathParser.cpp
-index 62d8ee37fd6ebb74a580a00c59beb6cd40c5a8b7..b5e6a9237593b4aaa2a243f2ff9d86e57f930a97 100644
---- a/Source/WebCore/xml/XPathParser.cpp
-+++ b/Source/WebCore/xml/XPathParser.cpp
-@@ -32,24 +32,21 @@
- #include "XPathEvaluator.h"
- #include "XPathException.h"
- #include "XPathNSResolver.h"
-+#include "XPathPath.h"
- #include "XPathStep.h"
- #include <wtf/StdLibExtras.h>
- #include <wtf/text/StringHash.h>
- 
--int xpathyyparse(void*);
--
-+using namespace WebCore;
- using namespace WTF;
- using namespace Unicode;
-+using namespace XPath;
- 
--namespace WebCore {
--namespace XPath {
--
--class LocationPath;
--
--#include "XPathGrammar.h"    
-+extern int xpathyyparse(WebCore::XPath::Parser*);
-+#include "XPathGrammar.h"
- 
- Parser* Parser::currentParser = 0;
--    
-+
- enum XMLCat { NameStart, NameCont, NotPartOfName };
- 
- typedef HashMap<String, Step::Axis> AxisNamesMap;
-@@ -630,5 +627,3 @@ void Parser::deleteNodeTest(Step::NodeTest* t)
-     delete t;
- }
- 
--}
--}
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch b/meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
deleted file mode 100644
index 635c1cb..0000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/gcc-4.8.2.fix.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport http://trac.webkit.org/changeset/160834
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Index: a/Source/WTF/wtf/dtoa/double-conversion.cc
-===================================================================
---- a/Source/WTF/wtf/dtoa/double-conversion.cc	(revision 160833)
-+++ b/Source/WTF/wtf/dtoa/double-conversion.cc	(revision 160834)
-@@ -447,5 +447,5 @@
-         const int kBufferSize = kMaxSignificantDigits + 10;
-         char buffer[kBufferSize];  // NOLINT: size is known at compile time.
--        int buffer_pos = 0;
-+        unsigned buffer_pos = 0;
-         
-         // Exponent will be adjusted if insignificant digits of the integer part
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb
new file mode 100644
index 0000000..65418ca
--- /dev/null
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_2.3.4+svnr164189.bb
@@ -0,0 +1,12 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/webkit-efl/webkit-efl-164189.tar.xz \
+    file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
+    file://0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch \
+    file://0003-Fix-linking-issue.patch \
+"
+SRC_URI[md5sum] = "731513fc042ec8e03840bc1ab6a66771"
+SRC_URI[sha256sum] = "660aefd65c0e5c6494eaec30539cda5f40fbdff17f28e7e83d341b245227cccd"
+
+S = "${WORKDIR}/efl-webkit"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
index 617c056..e50139c 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
+++ b/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
@@ -1,18 +1,7 @@
-SUMMARY = "Webkit browser engine, EFL edition"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
-                    file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
-                    file://Source/WebKit/efl/ewk/EWebKit.h;endline=20;md5=55ea170b1582797d2c69712de850f2fa \
-"
-
-DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
-           libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
-           libxml2 pango eina ecore evas edje edbus gstreamer gst-plugins-base"
+require ${BPN}.inc
 
-# 120145 and 122103 introduces dependency on libsoup-2.39.3 and glib-networking-2.33.2
-SRCREV = "120144"
-PV = "1.9.3+svnr${SRCPV}"
-PR = "r3"
+SRCREV = "164189"
+PV = "2.3.4+svnr${SRCPV}"
 
 SRCREV_FORMAT = "source"
 
@@ -20,9 +9,10 @@ SRC_URI = "\
     svn://svn.webkit.org/repository/webkit/trunk;module=Source;name=source;protocol=http;subdir=src \
     svn://svn.webkit.org/repository/webkit/trunk/;module=WebKitLibraries;protocol=http;subdir=src \
     svn://svn.webkit.org/repository/webkit/trunk/;module=Tools;protocol=http;subdir=src \
-    file://0001-ewk-include-Element.h-for-hasTagName-function.patch \
     file://CMakeLists.txt \
-    file://bison-2.6.patch \
+    file://0001-WebKitHelpers.cmake-Add-Wno-error-cast-align.patch \
+    file://0002-ARMAssembler.h-Don-t-generate-BKPT-and-BLX-for-armv4.patch \
+    file://0003-Fix-linking-issue.patch \
 "
 
 S = "${WORKDIR}/src"
@@ -30,16 +20,3 @@ S = "${WORKDIR}/src"
 do_configure_prepend() {
     cp ${WORKDIR}/CMakeLists.txt ${S};
 }
-
-inherit cmake lib_package pkgconfig perlnative pythonnative
-
-ARM_INSTRUCTION_SET = "arm"
-
-EXTRA_OECMAKE = "-DPORT=Efl -DSHARED_CORE=On -DENABLE_DRAG_SUPPORT=On"
-
-LEAD_SONAME = "libewebkit.so"
-PACKAGES =+ "${PN}launcher-dbg ${PN}launcher"
-
-FILES_${PN} += "${datadir}/webkit-1.0/theme/default.edj ${datadir}/ewebkit-0/themes/default.edj"
-FILES_${PN}launcher = "${bindir}/EWebLauncher"
-FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
-- 
1.9.1


