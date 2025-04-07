Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420FAC369A4
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.42483.1744017450798059012
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d4Vbwk89;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017453; x=1775553453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JQgz4SEtRV8VGDN83ngINhb2bJfA/RmYn4a52+d4wVg=;
  b=d4Vbwk89cyvABc+wEG4Hed4lsp+0jclwYzIJDeyYJZE38noNHrds9hAD
   CfMvirXJQb5CqsqYvqdsxRFKcoXAyd9DGRgzwoA3hgSg9CZ0HekHDWWmj
   a1T7Qkint+7puqUk+eS9/xuWmtpXi+pKxF1DXZNlI8GYFv0ssp9/629MC
   HYXdmzZS37nuwF2cVN2ExfnHUWGj5PSZ748yJkd23ggJelT1LSSb3YzHx
   vzhTkJ+l/cLEyxyZI7k9Gxi091m8KBZKiXkp2x89oB0XUAjPPsVsztBWf
   D/EP9fWuaVRT4e8r9IL+Pu8Xm5dXcVUxQ4fn1Sbo1439ratjnvoakNAw8
   g==;
X-CSE-ConnectionGUID: gf0xqN+VRfyNd+DK1WC8Tw==
X-CSE-MsgGUID: 1647KdE1TCOuCbyo4dMP2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195694345"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195694345"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AD431C2269
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 72AE3BF4A2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3007A1A0071;
	Mon,  7 Apr 2025 17:17:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 30/30] webkitgtk3: upgrade 2.48.0 -> 2.48.1
Date: Mon,  7 Apr 2025 17:17:11 +0800
Message-Id: <1744017431-22217-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116651

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 ------------------
 ...or-no-matching-function-for-call-to-.patch | 77 -------------------
 ...kitgtk3_2.48.0.bb => webkitgtk3_2.48.1.bb} |  4 +-
 3 files changed, 1 insertion(+), 155 deletions(-)
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
 delete mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
 rename meta-oe/recipes-support/webkitgtk/{webkitgtk3_2.48.0.bb => webkitgtk3_2.48.1.bb} (97%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
deleted file mode 100644
index 5cbb1035b2..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 2001
-From: Adrian Perez de Castro <aperez@igalia.com>
-Date: Tue, 18 Mar 2025 07:39:01 -0700
-Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
- https://bugs.webkit.org/show_bug.cgi?id=289953
-
-    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
-    https://bugs.webkit.org/show_bug.cgi?id=289953
-
-    Reviewed by Alicia Boya Garcia.
-
-    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc++
-      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MODE
-      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTIONS.
-
-    Canonical link: https://commits.webkit.org/292304@main
-
-Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07ebd134459]
-
-Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
- 1 file changed, 19 insertions(+), 5 deletions(-)
-
-diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
-index f6cf5ee..3178674 100644
---- a/Source/cmake/OptionsCommon.cmake
-+++ b/Source/cmake/OptionsCommon.cmake
-@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
- ")
- check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP)
- if (CXX_STDLIB_IS_LIBCPP)
--    set(CXX_STDLIB_VARIANT "LIBCPP")
--    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
-+    set(CXX_STDLIB_TEST_SOURCE "
-+        #include <utility>
-+        #if _LIBCPP_VERSION >= 190000
-+        int main() { }
-+        #else
-+        #error libc++ is older than 19.x
-+        #endif
-+    ")
-+    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
-+    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
-+        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_EXTENSIVE)
-+    else ()
-+        set(CXX_STDLIB_VARIANT "LIBCPP <19")
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=1)
-+    endif ()
- else ()
-     set(CXX_STDLIB_TEST_SOURCE "
-     #include <utility>
-@@ -239,7 +253,7 @@ else ()
-     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_GLIBCXX)
-     if (CXX_STDLIB_IS_GLIBCXX)
-         set(CXX_STDLIB_VARIANT "GLIBCXX")
--        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
-+        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=1)
-     endif ()
- endif ()
- message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
-@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
- 
- if (USE_CXX_STDLIB_ASSERTIONS)
-     if (CXX_STDLIB_ASSERTIONS_MACRO)
--        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}=1")
--        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=1")
-+        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}")
-+        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
-     else ()
-         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS_MACRO undefined")
-     endif ()
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
deleted file mode 100644
index 5b83d9e7eb..0000000000
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 2001
-From: Fujii Hironori <Hironori.Fujii@sony.com>
-Date: Tue, 18 Mar 2025 10:25:47 +0900
-Subject: [PATCH] EnumTraits.h: error: no matching function for call to
- 'enumName' with Clang 20 https://bugs.webkit.org/show_bug.cgi?id=289669
-
-Reviewed by NOBODY (OOPS!).
-
-Clang 20 couldn't compile EnumTraits.h.
-
-> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid explicitly-specified argument for template parameter 'V'
-
-An invalid enum value can't be specifed to the template parameter `V`.
-
-> template<auto V> constexpr std::span<const char> enumName()
-
-The upstream Magic Enum C++ has a template variable `is_enum_constexpr_static_cast_valid<E, V>` to check a enum value is valid.
-<https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136a384c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634>
-
-Imported the template variable.
-
-* Source/WTF/wtf/EnumTraits.h:
-(WTF::enumName):
-(WTF::makeEnumNames):
-
-Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42597]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
- 1 file changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.h
-index 0d33e39a..95e6318b 100644
---- a/Source/WTF/wtf/EnumTraits.h
-+++ b/Source/WTF/wtf/EnumTraits.h
-@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
- #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
- #endif
- 
-+#if COMPILER(CLANG) && __clang_major__ >= 16
-+template <typename E, auto V, typename = void>
-+inline constexpr bool isEnumConstexprStaticCastValid = false;
-+template <typename E, auto V>
-+inline constexpr bool isEnumConstexprStaticCastValid<E, V, std::void_t<std::integral_constant<E, static_cast<E>(V)>>> = true;
-+#else
-+template <typename, auto>
-+inline constexpr bool isEnumConstexprStaticCastValid = true;
-+#endif
-+
- template<typename E>
- constexpr std::span<const char> enumTypeNameImpl()
- {
-@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
-     return result;
- }
- 
-+template<typename E, auto V>
-+constexpr std::span<const char> enumName()
-+{
-+    if constexpr (isEnumConstexprStaticCastValid<E, V>)
-+        return enumName<static_cast<E>(V)>();
-+    else
-+        return { };
-+}
-+
- template<typename E>
- constexpr std::underlying_type_t<E> enumNamesMin()
- {
-@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_sequence<Is...>)
- {
-     constexpr auto min = enumNamesMin<E>();
-     return std::array<std::span<const char>, sizeof...(Is)> {
--        enumName<static_cast<E>(static_cast<std::underlying_type_t<E>>(Is) + min)>()...
-+        enumName<E, static_cast<std::underlying_type_t<E>>(Is) + min>()...
-     };
- }
- 
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
similarity index 97%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
index 291e922df0..14dc3a841d 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.0.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
@@ -18,11 +18,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/webkitgtk-${PV}.tar.xz \
            file://reproducibility.patch \
            file://no-musttail-arm.patch \
            file://sys_futex.patch \
-           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
-           file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            "
-SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
+SRC_URI[sha256sum] = "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gi-docgen
 
-- 
2.43.0


