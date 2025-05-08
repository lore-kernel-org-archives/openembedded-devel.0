Return-Path: <f_l_k@t-online.de>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14572C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 19:18:37 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.4486.1746731908374856858
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 May 2025 12:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id 7F884A62
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 May 2025 21:18:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.236.121]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uD6lC-0PyqUz0; Thu, 8 May 2025 21:18:22 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] btop: update 1.4.0 -> 1.4.2
Date: Thu,  8 May 2025 21:18:11 +0200
Message-ID: <20250508191815.536397-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1746731903-19FF955F-70258969/10/3071143950 SUSPECT URL
X-TOI-MSGID: 6ca14e2f-0b5c-4857-9086-01395fc6328e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 May 2025 19:18:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117367

- remove submitted patch

Fix process arguments appearing outside proc box by replacing ASCII contr=
ol codes with blankspace, issue #1080 | @aristocratos
Fix problems shown by clang-tidy's performance checks | @imwints
Fix wrong error message and documentation of renamed option --utf-force |=
 @t-webber @imwints
CMake: Remove option to use mold  | @imwints
Update Terminus font link, fix typo, spelling, and grammar | @QinCai-rui
Please clang with sanitizers | @bad-co-de
Fix MacOS tree-mode + aggregate memory/thread scaling issue | @xaskii
Fix typo: Mhz -> MHz | @NyCodeGHG

v1.4.1

Various code fixes | @imwints
Various code fixes | @bad-co-de
Fixed typo | @polluks
Move the config parser in it's own module  | @imwints
Adding a menu option to show bitrates in base 10 separate from the settin=
g to show bytes/bits in base 10 | @georgev93
Allow MidnightBSD to build btop using the existing freebsd support. | @la=
ffer1
Use XDG_STATE_HOME to save logs | @imwints
Bump CMake version to 3.25 required for LINUX variable | @imwints
Replace brackets with arrows in net and proc box | @taha-yassine
Bump bundled fmt to 11.1.4 | @imwints
cmake:  link to CMAKE_DL_LIBS | @alalazo
Fix phoenix-night.theme marked as executable | @sertonix
Add Kanagawa-lotus and Kanagawa-wave themes | @philikarus
Bump NetBSD version to 10.1 and FreeBSD version to 14.2. | @fraggerfox
Add dark version of adwaita theme: adwaita-dark | @k0tran
Resetting last selection on page navigation in optionsMenu to avoid unord=
ered_map error | @seth-wood
Share the CPU name trimming code between platforms | @yarrick
Update Ryzen name trimming | @yarrick
Drop macos 12 build, add v14 and v15 | @yarrick
Fix cmake-macos workflow | @yarrick
Bump version of deprecated upload-artifact step | @yarrick
Update obsolete egrep call | @tywkeene
Fix menu crash when GPU_SUPPORT=3Dfalse, issue #989 | @aristocratos
Add 'Everforest Ligth Medium' theme | @mstuttgart
Support intel GPUs before Gen-6 (patch from upstream) | @w8jcik
intel_name_lookup_shim.c (get_intel_device_name): Fix SEGFAULT | @artyom-=
poptsov
Fix rsmi_measure_pcie_speeds not saving, issue #934 | @aristocratos
Show GPU Watt fractions when below 100W | @aristocratos

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-fmt-Update-headers-from-11.1.4.patch | 19338 ----------------
 .../btop/{btop_1.4.0.bb =3D> btop_1.4.2.bb}     |     3 +-
 2 files changed, 1 insertion(+), 19340 deletions(-)
 delete mode 100644 meta-oe/recipes-support/btop/btop/0001-fmt-Update-hea=
ders-from-11.1.4.patch
 rename meta-oe/recipes-support/btop/{btop_1.4.0.bb =3D> btop_1.4.2.bb} (=
86%)

diff --git a/meta-oe/recipes-support/btop/btop/0001-fmt-Update-headers-fr=
om-11.1.4.patch b/meta-oe/recipes-support/btop/btop/0001-fmt-Update-heade=
rs-from-11.1.4.patch
deleted file mode 100644
index 50834e57e8..0000000000
--- a/meta-oe/recipes-support/btop/btop/0001-fmt-Update-headers-from-11.1=
.4.patch
+++ /dev/null
@@ -1,19338 +0,0 @@
-From 236f243428b898e3ababb611c648ec120abd2857 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 Mar 2025 20:02:10 -0700
-Subject: [PATCH] fmt: Update headers from 11.1.4+
-
-Newer compilers e.g. clang-20+ are not able to compile the fmt headers
-from old snapshop, therefore bring the latest from libfmt upstream
-
-Upstream-Status: Submitted [https://github.com/aristocratos/btop/pull/10=
63]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/fmt/args.h       |  174 +-
- include/fmt/base.h       | 2974 +++++++++++++++++++++++++++++++
- include/fmt/chrono.h     | 1534 ++++++++--------
- include/fmt/color.h      |  444 ++---
- include/fmt/compile.h    |  280 ++-
- include/fmt/core.h       | 2908 +-----------------------------
- include/fmt/format-inl.h |  529 ++++--
- include/fmt/format.h     | 3617 +++++++++++++++++---------------------
- include/fmt/os.h         |  300 ++--
- include/fmt/ostream.h    |  189 +-
- include/fmt/printf.h     |  426 +++--
- include/fmt/ranges.h     |  624 ++++---
- include/fmt/std.h        |  677 +++++--
- include/fmt/xchar.h      |  275 ++-
- 14 files changed, 7656 insertions(+), 7295 deletions(-)
- create mode 100644 include/fmt/base.h
-
-diff --git a/include/fmt/args.h b/include/fmt/args.h
-index a3966d1..3ff4788 100644
---- a/include/fmt/args.h
-+++ b/include/fmt/args.h
-@@ -1,4 +1,4 @@
--// Formatting library for C++ - dynamic format arguments
-+// Formatting library for C++ - dynamic argument lists
- //
- // Copyright (c) 2012 - present, Victor Zverovich
- // All rights reserved.
-@@ -8,34 +8,39 @@
- #ifndef FMT_ARGS_H_
- #define FMT_ARGS_H_
-=20
--#include <functional>  // std::reference_wrapper
--#include <memory>      // std::unique_ptr
--#include <vector>
-+#ifndef FMT_MODULE
-+#  include <functional>  // std::reference_wrapper
-+#  include <memory>      // std::unique_ptr
-+#  include <vector>
-+#endif
-=20
--#include "core.h"
-+#include "format.h"  // std_string_view
-=20
- FMT_BEGIN_NAMESPACE
--
- namespace detail {
-=20
- template <typename T> struct is_reference_wrapper : std::false_type {};
- template <typename T>
- struct is_reference_wrapper<std::reference_wrapper<T>> : std::true_type=
 {};
-=20
--template <typename T> const T& unwrap(const T& v) { return v; }
--template <typename T> const T& unwrap(const std::reference_wrapper<T>& =
v) {
-+template <typename T> auto unwrap(const T& v) -> const T& { return v; }
-+template <typename T>
-+auto unwrap(const std::reference_wrapper<T>& v) -> const T& {
-   return static_cast<const T&>(v);
- }
-=20
--class dynamic_arg_list {
--  // Workaround for clang's -Wweak-vtables. Unlike for regular classes,=
 for
--  // templates it doesn't complain about inability to deduce single tra=
nslation
--  // unit for placing vtable. So storage_node_base is made a fake templ=
ate.
--  template <typename =3D void> struct node {
--    virtual ~node() =3D default;
--    std::unique_ptr<node<>> next;
--  };
-+// node is defined outside dynamic_arg_list to workaround a C2504 bug i=
n MSVC
-+// 2022 (v17.10.0).
-+//
-+// Workaround for clang's -Wweak-vtables. Unlike for regular classes, f=
or
-+// templates it doesn't complain about inability to deduce single trans=
lation
-+// unit for placing vtable. So node is made a fake template.
-+template <typename =3D void> struct node {
-+  virtual ~node() =3D default;
-+  std::unique_ptr<node<>> next;
-+};
-=20
-+class dynamic_arg_list {
-   template <typename T> struct typed_node : node<> {
-     T value;
-=20
-@@ -50,7 +55,7 @@ class dynamic_arg_list {
-   std::unique_ptr<node<>> head_;
-=20
-  public:
--  template <typename T, typename Arg> const T& push(const Arg& arg) {
-+  template <typename T, typename Arg> auto push(const Arg& arg) -> cons=
t T& {
-     auto new_node =3D std::unique_ptr<typed_node<T>>(new typed_node<T>(=
arg));
-     auto& value =3D new_node->value;
-     new_node->next =3D std::move(head_);
-@@ -61,28 +66,18 @@ class dynamic_arg_list {
- }  // namespace detail
-=20
- /**
--  \rst
--  A dynamic version of `fmt::format_arg_store`.
--  It's equipped with a storage to potentially temporary objects which l=
ifetimes
--  could be shorter than the format arguments object.
--
--  It can be implicitly converted into `~fmt::basic_format_args` for pas=
sing
--  into type-erased formatting functions such as `~fmt::vformat`.
--  \endrst
-+ * A dynamic list of formatting arguments with storage.
-+ *
-+ * It can be implicitly converted into `fmt::basic_format_args` for pas=
sing
-+ * into type-erased formatting functions such as `fmt::vformat`.
-  */
--template <typename Context>
--class dynamic_format_arg_store
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 409
--    // Workaround a GCC template argument substitution bug.
--    : public basic_format_args<Context>
--#endif
--{
-+template <typename Context> class dynamic_format_arg_store {
-  private:
-   using char_type =3D typename Context::char_type;
-=20
-   template <typename T> struct need_copy {
-     static constexpr detail::type mapped_type =3D
--        detail::mapped_type_constant<T, Context>::value;
-+        detail::mapped_type_constant<T, char_type>::value;
-=20
-     enum {
-       value =3D !(detail::is_reference_wrapper<T>::value ||
-@@ -95,7 +90,7 @@ class dynamic_format_arg_store
-   };
-=20
-   template <typename T>
--  using stored_type =3D conditional_t<
-+  using stored_t =3D conditional_t<
-       std::is_convertible<T, std::basic_string<char_type>>::value &&
-           !detail::is_reference_wrapper<T>::value,
-       std::basic_string<char_type>, T>;
-@@ -110,80 +105,72 @@ class dynamic_format_arg_store
-=20
-   friend class basic_format_args<Context>;
-=20
--  unsigned long long get_types() const {
--    return detail::is_unpacked_bit | data_.size() |
--           (named_info_.empty()
--                ? 0ULL
--                : static_cast<unsigned long long>(detail::has_named_arg=
s_bit));
--  }
--
--  const basic_format_arg<Context>* data() const {
-+  auto data() const -> const basic_format_arg<Context>* {
-     return named_info_.empty() ? data_.data() : data_.data() + 1;
-   }
-=20
-   template <typename T> void emplace_arg(const T& arg) {
--    data_.emplace_back(detail::make_arg<Context>(arg));
-+    data_.emplace_back(arg);
-   }
-=20
-   template <typename T>
-   void emplace_arg(const detail::named_arg<char_type, T>& arg) {
--    if (named_info_.empty()) {
--      constexpr const detail::named_arg_info<char_type>* zero_ptr{nullp=
tr};
--      data_.insert(data_.begin(), {zero_ptr, 0});
--    }
--    data_.emplace_back(detail::make_arg<Context>(detail::unwrap(arg.val=
ue)));
-+    if (named_info_.empty())
-+      data_.insert(data_.begin(), basic_format_arg<Context>(nullptr, 0)=
);
-+    data_.emplace_back(detail::unwrap(arg.value));
-     auto pop_one =3D [](std::vector<basic_format_arg<Context>>* data) {
-       data->pop_back();
-     };
-     std::unique_ptr<std::vector<basic_format_arg<Context>>, decltype(po=
p_one)>
-         guard{&data_, pop_one};
-     named_info_.push_back({arg.name, static_cast<int>(data_.size() - 2u=
)});
--    data_[0].value_.named_args =3D {named_info_.data(), named_info_.siz=
e()};
-+    data_[0] =3D {named_info_.data(), named_info_.size()};
-     guard.release();
-   }
-=20
-  public:
-   constexpr dynamic_format_arg_store() =3D default;
-=20
-+  operator basic_format_args<Context>() const {
-+    return basic_format_args<Context>(data(), static_cast<int>(data_.si=
ze()),
-+                                      !named_info_.empty());
-+  }
-+
-   /**
--    \rst
--    Adds an argument into the dynamic store for later passing to a form=
atting
--    function.
--
--    Note that custom types and string types (but not string views) are =
copied
--    into the store dynamically allocating memory if necessary.
--
--    **Example**::
--
--      fmt::dynamic_format_arg_store<fmt::format_context> store;
--      store.push_back(42);
--      store.push_back("abc");
--      store.push_back(1.5f);
--      std::string result =3D fmt::vformat("{} and {} and {}", store);
--    \endrst
--  */
-+   * Adds an argument into the dynamic store for later passing to a for=
matting
-+   * function.
-+   *
-+   * Note that custom types and string types (but not string views) are=
 copied
-+   * into the store dynamically allocating memory if necessary.
-+   *
-+   * **Example**:
-+   *
-+   *     fmt::dynamic_format_arg_store<fmt::format_context> store;
-+   *     store.push_back(42);
-+   *     store.push_back("abc");
-+   *     store.push_back(1.5f);
-+   *     std::string result =3D fmt::vformat("{} and {} and {}", store)=
;
-+   */
-   template <typename T> void push_back(const T& arg) {
-     if (detail::const_check(need_copy<T>::value))
--      emplace_arg(dynamic_args_.push<stored_type<T>>(arg));
-+      emplace_arg(dynamic_args_.push<stored_t<T>>(arg));
-     else
-       emplace_arg(detail::unwrap(arg));
-   }
-=20
-   /**
--    \rst
--    Adds a reference to the argument into the dynamic store for later p=
assing to
--    a formatting function.
--
--    **Example**::
--
--      fmt::dynamic_format_arg_store<fmt::format_context> store;
--      char band[] =3D "Rolling Stones";
--      store.push_back(std::cref(band));
--      band[9] =3D 'c'; // Changing str affects the output.
--      std::string result =3D fmt::vformat("{}", store);
--      // result =3D=3D "Rolling Scones"
--    \endrst
--  */
-+   * Adds a reference to the argument into the dynamic store for later =
passing
-+   * to a formatting function.
-+   *
-+   * **Example**:
-+   *
-+   *     fmt::dynamic_format_arg_store<fmt::format_context> store;
-+   *     char band[] =3D "Rolling Stones";
-+   *     store.push_back(std::cref(band));
-+   *     band[9] =3D 'c'; // Changing str affects the output.
-+   *     std::string result =3D fmt::vformat("{}", store);
-+   *     // result =3D=3D "Rolling Scones"
-+   */
-   template <typename T> void push_back(std::reference_wrapper<T> arg) {
-     static_assert(
-         need_copy<T>::value,
-@@ -192,41 +179,40 @@ class dynamic_format_arg_store
-   }
-=20
-   /**
--    Adds named argument into the dynamic store for later passing to a f=
ormatting
--    function. ``std::reference_wrapper`` is supported to avoid copying =
of the
--    argument. The name is always copied into the store.
--  */
-+   * Adds named argument into the dynamic store for later passing to a
-+   * formatting function. `std::reference_wrapper` is supported to avoi=
d
-+   * copying of the argument. The name is always copied into the store.
-+   */
-   template <typename T>
-   void push_back(const detail::named_arg<char_type, T>& arg) {
-     const char_type* arg_name =3D
-         dynamic_args_.push<std::basic_string<char_type>>(arg.name).c_st=
r();
-     if (detail::const_check(need_copy<T>::value)) {
-       emplace_arg(
--          fmt::arg(arg_name, dynamic_args_.push<stored_type<T>>(arg.val=
ue)));
-+          fmt::arg(arg_name, dynamic_args_.push<stored_t<T>>(arg.value)=
));
-     } else {
-       emplace_arg(fmt::arg(arg_name, arg.value));
-     }
-   }
-=20
--  /** Erase all elements from the store */
-+  /// Erase all elements from the store.
-   void clear() {
-     data_.clear();
-     named_info_.clear();
--    dynamic_args_ =3D detail::dynamic_arg_list();
-+    dynamic_args_ =3D {};
-   }
-=20
--  /**
--    \rst
--    Reserves space to store at least *new_cap* arguments including
--    *new_cap_named* named arguments.
--    \endrst
--  */
-+  /// Reserves space to store at least `new_cap` arguments including
-+  /// `new_cap_named` named arguments.
-   void reserve(size_t new_cap, size_t new_cap_named) {
-     FMT_ASSERT(new_cap >=3D new_cap_named,
--               "Set of arguments includes set of named arguments");
-+               "set of arguments includes set of named arguments");
-     data_.reserve(new_cap);
-     named_info_.reserve(new_cap_named);
-   }
-+
-+  /// Returns the number of elements in the store.
-+  size_t size() const noexcept { return data_.size(); }
- };
-=20
- FMT_END_NAMESPACE
-diff --git a/include/fmt/base.h b/include/fmt/base.h
-new file mode 100644
-index 0000000..fe73e37
---- /dev/null
-+++ b/include/fmt/base.h
-@@ -0,0 +1,2974 @@
-+// Formatting library for C++ - the base API for char/UTF-8
-+//
-+// Copyright (c) 2012 - present, Victor Zverovich
-+// All rights reserved.
-+//
-+// For the license information refer to format.h.
-+
-+#ifndef FMT_BASE_H_
-+#define FMT_BASE_H_
-+
-+#if defined(FMT_IMPORT_STD) && !defined(FMT_MODULE)
-+#  define FMT_MODULE
-+#endif
-+
-+#ifndef FMT_MODULE
-+#  include <limits.h>  // CHAR_BIT
-+#  include <stdio.h>   // FILE
-+#  include <string.h>  // memcmp
-+
-+#  include <type_traits>  // std::enable_if
-+#endif
-+
-+// The fmt library version in the form major * 10000 + minor * 100 + pa=
tch.
-+#define FMT_VERSION 110104
-+
-+// Detect compiler versions.
-+#if defined(__clang__) && !defined(__ibmxl__)
-+#  define FMT_CLANG_VERSION (__clang_major__ * 100 + __clang_minor__)
-+#else
-+#  define FMT_CLANG_VERSION 0
-+#endif
-+#if defined(__GNUC__) && !defined(__clang__) && !defined(__INTEL_COMPIL=
ER)
-+#  define FMT_GCC_VERSION (__GNUC__ * 100 + __GNUC_MINOR__)
-+#else
-+#  define FMT_GCC_VERSION 0
-+#endif
-+#if defined(__ICL)
-+#  define FMT_ICC_VERSION __ICL
-+#elif defined(__INTEL_COMPILER)
-+#  define FMT_ICC_VERSION __INTEL_COMPILER
-+#else
-+#  define FMT_ICC_VERSION 0
-+#endif
-+#if defined(_MSC_VER)
-+#  define FMT_MSC_VERSION _MSC_VER
-+#else
-+#  define FMT_MSC_VERSION 0
-+#endif
-+
-+// Detect standard library versions.
-+#ifdef _GLIBCXX_RELEASE
-+#  define FMT_GLIBCXX_RELEASE _GLIBCXX_RELEASE
-+#else
-+#  define FMT_GLIBCXX_RELEASE 0
-+#endif
-+#ifdef _LIBCPP_VERSION
-+#  define FMT_LIBCPP_VERSION _LIBCPP_VERSION
-+#else
-+#  define FMT_LIBCPP_VERSION 0
-+#endif
-+
-+#ifdef _MSVC_LANG
-+#  define FMT_CPLUSPLUS _MSVC_LANG
-+#else
-+#  define FMT_CPLUSPLUS __cplusplus
-+#endif
-+
-+// Detect __has_*.
-+#ifdef __has_feature
-+#  define FMT_HAS_FEATURE(x) __has_feature(x)
-+#else
-+#  define FMT_HAS_FEATURE(x) 0
-+#endif
-+#ifdef __has_include
-+#  define FMT_HAS_INCLUDE(x) __has_include(x)
-+#else
-+#  define FMT_HAS_INCLUDE(x) 0
-+#endif
-+#ifdef __has_builtin
-+#  define FMT_HAS_BUILTIN(x) __has_builtin(x)
-+#else
-+#  define FMT_HAS_BUILTIN(x) 0
-+#endif
-+#ifdef __has_cpp_attribute
-+#  define FMT_HAS_CPP_ATTRIBUTE(x) __has_cpp_attribute(x)
-+#else
-+#  define FMT_HAS_CPP_ATTRIBUTE(x) 0
-+#endif
-+
-+#define FMT_HAS_CPP14_ATTRIBUTE(attribute) \
-+  (FMT_CPLUSPLUS >=3D 201402L && FMT_HAS_CPP_ATTRIBUTE(attribute))
-+
-+#define FMT_HAS_CPP17_ATTRIBUTE(attribute) \
-+  (FMT_CPLUSPLUS >=3D 201703L && FMT_HAS_CPP_ATTRIBUTE(attribute))
-+
-+// Detect C++14 relaxed constexpr.
-+#ifdef FMT_USE_CONSTEXPR
-+// Use the provided definition.
-+#elif FMT_GCC_VERSION >=3D 702 && FMT_CPLUSPLUS >=3D 201402L
-+// GCC only allows constexpr member functions in non-literal types sinc=
e 7.2:
-+// https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D66297.
-+#  define FMT_USE_CONSTEXPR 1
-+#elif FMT_ICC_VERSION
-+#  define FMT_USE_CONSTEXPR 0  // https://github.com/fmtlib/fmt/issues/=
1628
-+#elif FMT_HAS_FEATURE(cxx_relaxed_constexpr) || FMT_MSC_VERSION >=3D 19=
12
-+#  define FMT_USE_CONSTEXPR 1
-+#else
-+#  define FMT_USE_CONSTEXPR 0
-+#endif
-+#if FMT_USE_CONSTEXPR
-+#  define FMT_CONSTEXPR constexpr
-+#else
-+#  define FMT_CONSTEXPR
-+#endif
-+
-+// Detect consteval, C++20 constexpr extensions and std::is_constant_ev=
aluated.
-+#if !defined(__cpp_lib_is_constant_evaluated)
-+#  define FMT_USE_CONSTEVAL 0
-+#elif FMT_CPLUSPLUS < 201709L
-+#  define FMT_USE_CONSTEVAL 0
-+#elif FMT_GLIBCXX_RELEASE && FMT_GLIBCXX_RELEASE < 10
-+#  define FMT_USE_CONSTEVAL 0
-+#elif FMT_LIBCPP_VERSION && FMT_LIBCPP_VERSION < 10000
-+#  define FMT_USE_CONSTEVAL 0
-+#elif defined(__apple_build_version__) && __apple_build_version__ < 140=
00029L
-+#  define FMT_USE_CONSTEVAL 0  // consteval is broken in Apple clang < =
14.
-+#elif FMT_MSC_VERSION && FMT_MSC_VERSION < 1929
-+#  define FMT_USE_CONSTEVAL 0  // consteval is broken in MSVC VS2019 < =
16.10.
-+#elif defined(__cpp_consteval)
-+#  define FMT_USE_CONSTEVAL 1
-+#elif FMT_GCC_VERSION >=3D 1002 || FMT_CLANG_VERSION >=3D 1101
-+#  define FMT_USE_CONSTEVAL 1
-+#else
-+#  define FMT_USE_CONSTEVAL 0
-+#endif
-+#if FMT_USE_CONSTEVAL
-+#  define FMT_CONSTEVAL consteval
-+#  define FMT_CONSTEXPR20 constexpr
-+#else
-+#  define FMT_CONSTEVAL
-+#  define FMT_CONSTEXPR20
-+#endif
-+
-+// Check if exceptions are disabled.
-+#ifdef FMT_USE_EXCEPTIONS
-+// Use the provided definition.
-+#elif defined(__GNUC__) && !defined(__EXCEPTIONS)
-+#  define FMT_USE_EXCEPTIONS 0
-+#elif defined(__clang__) && !defined(__cpp_exceptions)
-+#  define FMT_USE_EXCEPTIONS 0
-+#elif FMT_MSC_VERSION && !_HAS_EXCEPTIONS
-+#  define FMT_USE_EXCEPTIONS 0
-+#else
-+#  define FMT_USE_EXCEPTIONS 1
-+#endif
-+#if FMT_USE_EXCEPTIONS
-+#  define FMT_TRY try
-+#  define FMT_CATCH(x) catch (x)
-+#else
-+#  define FMT_TRY if (true)
-+#  define FMT_CATCH(x) if (false)
-+#endif
-+
-+#ifdef FMT_NO_UNIQUE_ADDRESS
-+// Use the provided definition.
-+#elif FMT_CPLUSPLUS < 202002L
-+// Not supported.
-+#elif FMT_HAS_CPP_ATTRIBUTE(no_unique_address)
-+#  define FMT_NO_UNIQUE_ADDRESS [[no_unique_address]]
-+// VS2019 v16.10 and later except clang-cl (https://reviews.llvm.org/D1=
10485).
-+#elif FMT_MSC_VERSION >=3D 1929 && !FMT_CLANG_VERSION
-+#  define FMT_NO_UNIQUE_ADDRESS [[msvc::no_unique_address]]
-+#endif
-+#ifndef FMT_NO_UNIQUE_ADDRESS
-+#  define FMT_NO_UNIQUE_ADDRESS
-+#endif
-+
-+#if FMT_HAS_CPP17_ATTRIBUTE(fallthrough)
-+#  define FMT_FALLTHROUGH [[fallthrough]]
-+#elif defined(__clang__)
-+#  define FMT_FALLTHROUGH [[clang::fallthrough]]
-+#elif FMT_GCC_VERSION >=3D 700 && \
-+    (!defined(__EDG_VERSION__) || __EDG_VERSION__ >=3D 520)
-+#  define FMT_FALLTHROUGH [[gnu::fallthrough]]
-+#else
-+#  define FMT_FALLTHROUGH
-+#endif
-+
-+// Disable [[noreturn]] on MSVC/NVCC because of bogus unreachable code =
warnings.
-+#if FMT_HAS_CPP_ATTRIBUTE(noreturn) && !FMT_MSC_VERSION && !defined(__N=
VCC__)
-+#  define FMT_NORETURN [[noreturn]]
-+#else
-+#  define FMT_NORETURN
-+#endif
-+
-+#ifdef FMT_NODISCARD
-+// Use the provided definition.
-+#elif FMT_HAS_CPP17_ATTRIBUTE(nodiscard)
-+#  define FMT_NODISCARD [[nodiscard]]
-+#else
-+#  define FMT_NODISCARD
-+#endif
-+
-+#ifdef FMT_DEPRECATED
-+// Use the provided definition.
-+#elif FMT_HAS_CPP14_ATTRIBUTE(deprecated)
-+#  define FMT_DEPRECATED [[deprecated]]
-+#else
-+#  define FMT_DEPRECATED /* deprecated */
-+#endif
-+
-+#ifdef FMT_ALWAYS_INLINE
-+// Use the provided definition.
-+#elif FMT_GCC_VERSION || FMT_CLANG_VERSION
-+#  define FMT_ALWAYS_INLINE inline __attribute__((always_inline))
-+#else
-+#  define FMT_ALWAYS_INLINE inline
-+#endif
-+// A version of FMT_ALWAYS_INLINE to prevent code bloat in debug mode.
-+#ifdef NDEBUG
-+#  define FMT_INLINE FMT_ALWAYS_INLINE
-+#else
-+#  define FMT_INLINE inline
-+#endif
-+
-+#if FMT_GCC_VERSION || FMT_CLANG_VERSION
-+#  define FMT_VISIBILITY(value) __attribute__((visibility(value)))
-+#else
-+#  define FMT_VISIBILITY(value)
-+#endif
-+
-+// Detect pragmas.
-+#define FMT_PRAGMA_IMPL(x) _Pragma(#x)
-+#if FMT_GCC_VERSION >=3D 504 && !defined(__NVCOMPILER)
-+// Workaround a _Pragma bug https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D59884
-+// and an nvhpc warning: https://github.com/fmtlib/fmt/pull/2582.
-+#  define FMT_PRAGMA_GCC(x) FMT_PRAGMA_IMPL(GCC x)
-+#else
-+#  define FMT_PRAGMA_GCC(x)
-+#endif
-+#if FMT_CLANG_VERSION
-+#  define FMT_PRAGMA_CLANG(x) FMT_PRAGMA_IMPL(clang x)
-+#else
-+#  define FMT_PRAGMA_CLANG(x)
-+#endif
-+#if FMT_MSC_VERSION
-+#  define FMT_MSC_WARNING(...) __pragma(warning(__VA_ARGS__))
-+#else
-+#  define FMT_MSC_WARNING(...)
-+#endif
-+
-+#ifndef FMT_BEGIN_NAMESPACE
-+#  define FMT_BEGIN_NAMESPACE \
-+    namespace fmt {           \
-+    inline namespace v11 {
-+#  define FMT_END_NAMESPACE \
-+    }                       \
-+    }
-+#endif
-+
-+#ifndef FMT_EXPORT
-+#  define FMT_EXPORT
-+#  define FMT_BEGIN_EXPORT
-+#  define FMT_END_EXPORT
-+#endif
-+
-+#ifdef _WIN32
-+#  define FMT_WIN32 1
-+#else
-+#  define FMT_WIN32 0
-+#endif
-+
-+#if !defined(FMT_HEADER_ONLY) && FMT_WIN32
-+#  if defined(FMT_LIB_EXPORT)
-+#    define FMT_API __declspec(dllexport)
-+#  elif defined(FMT_SHARED)
-+#    define FMT_API __declspec(dllimport)
-+#  endif
-+#elif defined(FMT_LIB_EXPORT) || defined(FMT_SHARED)
-+#  define FMT_API FMT_VISIBILITY("default")
-+#endif
-+#ifndef FMT_API
-+#  define FMT_API
-+#endif
-+
-+#ifndef FMT_OPTIMIZE_SIZE
-+#  define FMT_OPTIMIZE_SIZE 0
-+#endif
-+
-+// FMT_BUILTIN_TYPE=3D0 may result in smaller library size at the cost =
of higher
-+// per-call binary size by passing built-in types through the extension=
 API.
-+#ifndef FMT_BUILTIN_TYPES
-+#  define FMT_BUILTIN_TYPES 1
-+#endif
-+
-+#define FMT_APPLY_VARIADIC(expr) \
-+  using unused =3D int[];          \
-+  (void)unused { 0, (expr, 0)... }
-+
-+// Enable minimal optimizations for more compact code in debug mode.
-+FMT_PRAGMA_GCC(push_options)
-+#if !defined(__OPTIMIZE__) && !defined(__CUDACC__) && !defined(FMT_MODU=
LE)
-+FMT_PRAGMA_GCC(optimize("Og"))
-+#endif
-+FMT_PRAGMA_CLANG(diagnostic push)
-+
-+FMT_BEGIN_NAMESPACE
-+
-+// Implementations of enable_if_t and other metafunctions for older sys=
tems.
-+template <bool B, typename T =3D void>
-+using enable_if_t =3D typename std::enable_if<B, T>::type;
-+template <bool B, typename T, typename F>
-+using conditional_t =3D typename std::conditional<B, T, F>::type;
-+template <bool B> using bool_constant =3D std::integral_constant<bool, =
B>;
-+template <typename T>
-+using remove_reference_t =3D typename std::remove_reference<T>::type;
-+template <typename T>
-+using remove_const_t =3D typename std::remove_const<T>::type;
-+template <typename T>
-+using remove_cvref_t =3D typename std::remove_cv<remove_reference_t<T>>=
::type;
-+template <typename T>
-+using make_unsigned_t =3D typename std::make_unsigned<T>::type;
-+template <typename T>
-+using underlying_t =3D typename std::underlying_type<T>::type;
-+template <typename T> using decay_t =3D typename std::decay<T>::type;
-+using nullptr_t =3D decltype(nullptr);
-+
-+#if FMT_GCC_VERSION && FMT_GCC_VERSION < 500
-+// A workaround for gcc 4.9 to make void_t work in a SFINAE context.
-+template <typename...> struct void_t_impl {
-+  using type =3D void;
-+};
-+template <typename... T> using void_t =3D typename void_t_impl<T...>::t=
ype;
-+#else
-+template <typename...> using void_t =3D void;
-+#endif
-+
-+struct monostate {
-+  constexpr monostate() {}
-+};
-+
-+// An enable_if helper to be used in template parameters which results =
in much
-+// shorter symbols: https://godbolt.org/z/sWw4vP. Extra parentheses are=
 needed
-+// to workaround a bug in MSVC 2019 (see #1140 and #1186).
-+#ifdef FMT_DOC
-+#  define FMT_ENABLE_IF(...)
-+#else
-+#  define FMT_ENABLE_IF(...) fmt::enable_if_t<(__VA_ARGS__), int> =3D 0
-+#endif
-+
-+template <typename T> constexpr auto min_of(T a, T b) -> T {
-+  return a < b ? a : b;
-+}
-+template <typename T> constexpr auto max_of(T a, T b) -> T {
-+  return a > b ? a : b;
-+}
-+
-+namespace detail {
-+// Suppresses "unused variable" warnings with the method described in
-+// https://herbsutter.com/2009/10/18/mailbag-shutting-up-compiler-warni=
ngs/.
-+// (void)var does not work on many Intel compilers.
-+template <typename... T> FMT_CONSTEXPR void ignore_unused(const T&...) =
{}
-+
-+constexpr auto is_constant_evaluated(bool default_value =3D false) noex=
cept
-+    -> bool {
-+// Workaround for incompatibility between clang 14 and libstdc++ conste=
val-based
-+// std::is_constant_evaluated: https://github.com/fmtlib/fmt/issues/324=
7.
-+#if FMT_CPLUSPLUS >=3D 202002L && FMT_GLIBCXX_RELEASE >=3D 12 && \
-+    (FMT_CLANG_VERSION >=3D 1400 && FMT_CLANG_VERSION < 1500)
-+  ignore_unused(default_value);
-+  return __builtin_is_constant_evaluated();
-+#elif defined(__cpp_lib_is_constant_evaluated)
-+  ignore_unused(default_value);
-+  return std::is_constant_evaluated();
-+#else
-+  return default_value;
-+#endif
-+}
-+
-+// Suppresses "conditional expression is constant" warnings.
-+template <typename T> FMT_ALWAYS_INLINE constexpr auto const_check(T va=
l) -> T {
-+  return val;
-+}
-+
-+FMT_NORETURN FMT_API void assert_fail(const char* file, int line,
-+                                      const char* message);
-+
-+#if defined(FMT_ASSERT)
-+// Use the provided definition.
-+#elif defined(NDEBUG)
-+// FMT_ASSERT is not empty to avoid -Wempty-body.
-+#  define FMT_ASSERT(condition, message) \
-+    fmt::detail::ignore_unused((condition), (message))
-+#else
-+#  define FMT_ASSERT(condition, message)                               =
     \
-+    ((condition) /* void() fails with -Winvalid-constexpr on clang 4.0.=
1 */ \
-+         ? (void)0                                                     =
     \
-+         : fmt::detail::assert_fail(__FILE__, __LINE__, (message)))
-+#endif
-+
-+#ifdef FMT_USE_INT128
-+// Use the provided definition.
-+#elif defined(__SIZEOF_INT128__) && !defined(__NVCC__) && \
-+    !(FMT_CLANG_VERSION && FMT_MSC_VERSION)
-+#  define FMT_USE_INT128 1
-+using int128_opt =3D __int128_t;  // An optional native 128-bit integer=
.
-+using uint128_opt =3D __uint128_t;
-+inline auto map(int128_opt x) -> int128_opt { return x; }
-+inline auto map(uint128_opt x) -> uint128_opt { return x; }
-+#else
-+#  define FMT_USE_INT128 0
-+#endif
-+#if !FMT_USE_INT128
-+enum class int128_opt {};
-+enum class uint128_opt {};
-+// Reduce template instantiations.
-+inline auto map(int128_opt) -> monostate { return {}; }
-+inline auto map(uint128_opt) -> monostate { return {}; }
-+#endif
-+
-+#ifndef FMT_USE_BITINT
-+#  define FMT_USE_BITINT (FMT_CLANG_VERSION >=3D 1500)
-+#endif
-+
-+#if FMT_USE_BITINT
-+FMT_PRAGMA_CLANG(diagnostic ignored "-Wbit-int-extension")
-+template <int N> using bitint =3D _BitInt(N);
-+template <int N> using ubitint =3D unsigned _BitInt(N);
-+#else
-+template <int N> struct bitint {};
-+template <int N> struct ubitint {};
-+#endif  // FMT_USE_BITINT
-+
-+// Casts a nonnegative integer to unsigned.
-+template <typename Int>
-+FMT_CONSTEXPR auto to_unsigned(Int value) -> make_unsigned_t<Int> {
-+  FMT_ASSERT(std::is_unsigned<Int>::value || value >=3D 0, "negative va=
lue");
-+  return static_cast<make_unsigned_t<Int>>(value);
-+}
-+
-+template <typename Char>
-+using unsigned_char =3D conditional_t<sizeof(Char) =3D=3D 1, unsigned c=
har, unsigned>;
-+
-+// A heuristic to detect std::string and std::[experimental::]string_vi=
ew.
-+// It is mainly used to avoid dependency on <[experimental/]string_view=
>.
-+template <typename T, typename Enable =3D void>
-+struct is_std_string_like : std::false_type {};
-+template <typename T>
-+struct is_std_string_like<T, void_t<decltype(std::declval<T>().find_fir=
st_of(
-+                                 typename T::value_type(), 0))>>
-+    : std::is_convertible<decltype(std::declval<T>().data()),
-+                          const typename T::value_type*> {};
-+
-+// Check if the literal encoding is UTF-8.
-+enum { is_utf8_enabled =3D "\u00A7"[1] =3D=3D '\xA7' };
-+enum { use_utf8 =3D !FMT_WIN32 || is_utf8_enabled };
-+
-+#ifndef FMT_UNICODE
-+#  define FMT_UNICODE 1
-+#endif
-+
-+static_assert(!FMT_UNICODE || use_utf8,
-+              "Unicode support requires compiling with /utf-8");
-+
-+template <typename T> constexpr const char* narrow(const T*) { return n=
ullptr; }
-+constexpr FMT_ALWAYS_INLINE const char* narrow(const char* s) { return =
s; }
-+
-+template <typename Char>
-+FMT_CONSTEXPR auto compare(const Char* s1, const Char* s2, std::size_t =
n)
-+    -> int {
-+  if (!is_constant_evaluated() && sizeof(Char) =3D=3D 1) return memcmp(=
s1, s2, n);
-+  for (; n !=3D 0; ++s1, ++s2, --n) {
-+    if (*s1 < *s2) return -1;
-+    if (*s1 > *s2) return 1;
-+  }
-+  return 0;
-+}
-+
-+namespace adl {
-+using namespace std;
-+
-+template <typename Container>
-+auto invoke_back_inserter()
-+    -> decltype(back_inserter(std::declval<Container&>()));
-+}  // namespace adl
-+
-+template <typename It, typename Enable =3D std::true_type>
-+struct is_back_insert_iterator : std::false_type {};
-+
-+template <typename It>
-+struct is_back_insert_iterator<
-+    It, bool_constant<std::is_same<
-+            decltype(adl::invoke_back_inserter<typename It::container_t=
ype>()),
-+            It>::value>> : std::true_type {};
-+
-+// Extracts a reference to the container from *insert_iterator.
-+template <typename OutputIt>
-+inline FMT_CONSTEXPR20 auto get_container(OutputIt it) ->
-+    typename OutputIt::container_type& {
-+  struct accessor : OutputIt {
-+    FMT_CONSTEXPR20 accessor(OutputIt base) : OutputIt(base) {}
-+    using OutputIt::container;
-+  };
-+  return *accessor(it).container;
-+}
-+}  // namespace detail
-+
-+// Parsing-related public API and forward declarations.
-+FMT_BEGIN_EXPORT
-+
-+/**
-+ * An implementation of `std::basic_string_view` for pre-C++17. It prov=
ides a
-+ * subset of the API. `fmt::basic_string_view` is used for format strin=
gs even
-+ * if `std::basic_string_view` is available to prevent issues when a li=
brary is
-+ * compiled with a different `-std` option than the client code (which =
is not
-+ * recommended).
-+ */
-+template <typename Char> class basic_string_view {
-+ private:
-+  const Char* data_;
-+  size_t size_;
-+
-+ public:
-+  using value_type =3D Char;
-+  using iterator =3D const Char*;
-+
-+  constexpr basic_string_view() noexcept : data_(nullptr), size_(0) {}
-+
-+  /// Constructs a string reference object from a C string and a size.
-+  constexpr basic_string_view(const Char* s, size_t count) noexcept
-+      : data_(s), size_(count) {}
-+
-+  constexpr basic_string_view(nullptr_t) =3D delete;
-+
-+  /// Constructs a string reference object from a C string.
-+#if FMT_GCC_VERSION
-+  FMT_ALWAYS_INLINE
-+#endif
-+  FMT_CONSTEXPR20 basic_string_view(const Char* s) : data_(s) {
-+#if FMT_HAS_BUILTIN(__builtin_strlen) || FMT_GCC_VERSION || FMT_CLANG_V=
ERSION
-+    if (std::is_same<Char, char>::value) {
-+      size_ =3D __builtin_strlen(detail::narrow(s));
-+      return;
-+    }
-+#endif
-+    size_t len =3D 0;
-+    while (*s++) ++len;
-+    size_ =3D len;
-+  }
-+
-+  /// Constructs a string reference from a `std::basic_string` or a
-+  /// `std::basic_string_view` object.
-+  template <typename S,
-+            FMT_ENABLE_IF(detail::is_std_string_like<S>::value&& std::i=
s_same<
-+                          typename S::value_type, Char>::value)>
-+  FMT_CONSTEXPR basic_string_view(const S& s) noexcept
-+      : data_(s.data()), size_(s.size()) {}
-+
-+  /// Returns a pointer to the string data.
-+  constexpr auto data() const noexcept -> const Char* { return data_; }
-+
-+  /// Returns the string size.
-+  constexpr auto size() const noexcept -> size_t { return size_; }
-+
-+  constexpr auto begin() const noexcept -> iterator { return data_; }
-+  constexpr auto end() const noexcept -> iterator { return data_ + size=
_; }
-+
-+  constexpr auto operator[](size_t pos) const noexcept -> const Char& {
-+    return data_[pos];
-+  }
-+
-+  FMT_CONSTEXPR void remove_prefix(size_t n) noexcept {
-+    data_ +=3D n;
-+    size_ -=3D n;
-+  }
-+
-+  FMT_CONSTEXPR auto starts_with(basic_string_view<Char> sv) const noex=
cept
-+      -> bool {
-+    return size_ >=3D sv.size_ && detail::compare(data_, sv.data_, sv.s=
ize_) =3D=3D 0;
-+  }
-+  FMT_CONSTEXPR auto starts_with(Char c) const noexcept -> bool {
-+    return size_ >=3D 1 && *data_ =3D=3D c;
-+  }
-+  FMT_CONSTEXPR auto starts_with(const Char* s) const -> bool {
-+    return starts_with(basic_string_view<Char>(s));
-+  }
-+
-+  // Lexicographically compare this string reference to other.
-+  FMT_CONSTEXPR auto compare(basic_string_view other) const -> int {
-+    int result =3D
-+        detail::compare(data_, other.data_, min_of(size_, other.size_))=
;
-+    if (result !=3D 0) return result;
-+    return size_ =3D=3D other.size_ ? 0 : (size_ < other.size_ ? -1 : 1=
);
-+  }
-+
-+  FMT_CONSTEXPR friend auto operator=3D=3D(basic_string_view lhs,
-+                                       basic_string_view rhs) -> bool {
-+    return lhs.compare(rhs) =3D=3D 0;
-+  }
-+  friend auto operator!=3D(basic_string_view lhs, basic_string_view rhs=
) -> bool {
-+    return lhs.compare(rhs) !=3D 0;
-+  }
-+  friend auto operator<(basic_string_view lhs, basic_string_view rhs) -=
> bool {
-+    return lhs.compare(rhs) < 0;
-+  }
-+  friend auto operator<=3D(basic_string_view lhs, basic_string_view rhs=
) -> bool {
-+    return lhs.compare(rhs) <=3D 0;
-+  }
-+  friend auto operator>(basic_string_view lhs, basic_string_view rhs) -=
> bool {
-+    return lhs.compare(rhs) > 0;
-+  }
-+  friend auto operator>=3D(basic_string_view lhs, basic_string_view rhs=
) -> bool {
-+    return lhs.compare(rhs) >=3D 0;
-+  }
-+};
-+
-+using string_view =3D basic_string_view<char>;
-+
-+/// Specifies if `T` is an extended character type. Can be specialized =
by users.
-+template <typename T> struct is_xchar : std::false_type {};
-+template <> struct is_xchar<wchar_t> : std::true_type {};
-+template <> struct is_xchar<char16_t> : std::true_type {};
-+template <> struct is_xchar<char32_t> : std::true_type {};
-+#ifdef __cpp_char8_t
-+template <> struct is_xchar<char8_t> : std::true_type {};
-+#endif
-+
-+// DEPRECATED! Will be replaced with an alias to prevent specialization=
s.
-+template <typename T> struct is_char : is_xchar<T> {};
-+template <> struct is_char<char> : std::true_type {};
-+
-+template <typename T> class basic_appender;
-+using appender =3D basic_appender<char>;
-+
-+// Checks whether T is a container with contiguous storage.
-+template <typename T> struct is_contiguous : std::false_type {};
-+
-+class context;
-+template <typename OutputIt, typename Char> class generic_context;
-+template <typename Char> class parse_context;
-+
-+// Longer aliases for C++20 compatibility.
-+template <typename Char> using basic_format_parse_context =3D parse_con=
text<Char>;
-+using format_parse_context =3D parse_context<char>;
-+template <typename OutputIt, typename Char>
-+using basic_format_context =3D
-+    conditional_t<std::is_same<OutputIt, appender>::value, context,
-+                  generic_context<OutputIt, Char>>;
-+using format_context =3D context;
-+
-+template <typename Char>
-+using buffered_context =3D
-+    conditional_t<std::is_same<Char, char>::value, context,
-+                  generic_context<basic_appender<Char>, Char>>;
-+
-+template <typename Context> class basic_format_arg;
-+template <typename Context> class basic_format_args;
-+
-+// A separate type would result in shorter symbols but break ABI compat=
ibility
-+// between clang and gcc on ARM (#1919).
-+using format_args =3D basic_format_args<context>;
-+
-+// A formatter for objects of type T.
-+template <typename T, typename Char =3D char, typename Enable =3D void>
-+struct formatter {
-+  // A deleted default constructor indicates a disabled formatter.
-+  formatter() =3D delete;
-+};
-+
-+/// Reports a format error at compile time or, via a `format_error` exc=
eption,
-+/// at runtime.
-+// This function is intentionally not constexpr to give a compile-time =
error.
-+FMT_NORETURN FMT_API void report_error(const char* message);
-+
-+enum class presentation_type : unsigned char {
-+  // Common specifiers:
-+  none =3D 0,
-+  debug =3D 1,   // '?'
-+  string =3D 2,  // 's' (string, bool)
-+
-+  // Integral, bool and character specifiers:
-+  dec =3D 3,  // 'd'
-+  hex,      // 'x' or 'X'
-+  oct,      // 'o'
-+  bin,      // 'b' or 'B'
-+  chr,      // 'c'
-+
-+  // String and pointer specifiers:
-+  pointer =3D 3,  // 'p'
-+
-+  // Floating-point specifiers:
-+  exp =3D 1,  // 'e' or 'E' (1 since there is no FP debug presentation)
-+  fixed,    // 'f' or 'F'
-+  general,  // 'g' or 'G'
-+  hexfloat  // 'a' or 'A'
-+};
-+
-+enum class align { none, left, right, center, numeric };
-+enum class sign { none, minus, plus, space };
-+enum class arg_id_kind { none, index, name };
-+
-+// Basic format specifiers for built-in and string types.
-+class basic_specs {
-+ private:
-+  // Data is arranged as follows:
-+  //
-+  //  0                   1                   2                   3
-+  //  0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
-+  // +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
-+  // |type |align| w | p | s |u|#|L|  f  |          unused           |
-+  // +-----+-----+---+---+---+-+-+-+-----+---------------------------+
-+  //
-+  //   w - dynamic width info
-+  //   p - dynamic precision info
-+  //   s - sign
-+  //   u - uppercase (e.g. 'X' for 'x')
-+  //   # - alternate form ('#')
-+  //   L - localized
-+  //   f - fill size
-+  //
-+  // Bitfields are not used because of compiler bugs such as gcc bug 61=
414.
-+  enum : unsigned {
-+    type_mask =3D 0x00007,
-+    align_mask =3D 0x00038,
-+    width_mask =3D 0x000C0,
-+    precision_mask =3D 0x00300,
-+    sign_mask =3D 0x00C00,
-+    uppercase_mask =3D 0x01000,
-+    alternate_mask =3D 0x02000,
-+    localized_mask =3D 0x04000,
-+    fill_size_mask =3D 0x38000,
-+
-+    align_shift =3D 3,
-+    width_shift =3D 6,
-+    precision_shift =3D 8,
-+    sign_shift =3D 10,
-+    fill_size_shift =3D 15,
-+
-+    max_fill_size =3D 4
-+  };
-+
-+  unsigned data_ =3D 1 << fill_size_shift;
-+  static_assert(sizeof(basic_specs::data_) * CHAR_BIT >=3D 18, "");
-+
-+  // Character (code unit) type is erased to prevent template bloat.
-+  char fill_data_[max_fill_size] =3D {' '};
-+
-+  FMT_CONSTEXPR void set_fill_size(size_t size) {
-+    data_ =3D (data_ & ~fill_size_mask) |
-+            (static_cast<unsigned>(size) << fill_size_shift);
-+  }
-+
-+ public:
-+  constexpr auto type() const -> presentation_type {
-+    return static_cast<presentation_type>(data_ & type_mask);
-+  }
-+  FMT_CONSTEXPR void set_type(presentation_type t) {
-+    data_ =3D (data_ & ~type_mask) | static_cast<unsigned>(t);
-+  }
-+
-+  constexpr auto align() const -> align {
-+    return static_cast<fmt::align>((data_ & align_mask) >> align_shift)=
;
-+  }
-+  FMT_CONSTEXPR void set_align(fmt::align a) {
-+    data_ =3D (data_ & ~align_mask) | (static_cast<unsigned>(a) << alig=
n_shift);
-+  }
-+
-+  constexpr auto dynamic_width() const -> arg_id_kind {
-+    return static_cast<arg_id_kind>((data_ & width_mask) >> width_shift=
);
-+  }
-+  FMT_CONSTEXPR void set_dynamic_width(arg_id_kind w) {
-+    data_ =3D (data_ & ~width_mask) | (static_cast<unsigned>(w) << widt=
h_shift);
-+  }
-+
-+  FMT_CONSTEXPR auto dynamic_precision() const -> arg_id_kind {
-+    return static_cast<arg_id_kind>((data_ & precision_mask) >>
-+                                    precision_shift);
-+  }
-+  FMT_CONSTEXPR void set_dynamic_precision(arg_id_kind p) {
-+    data_ =3D (data_ & ~precision_mask) |
-+            (static_cast<unsigned>(p) << precision_shift);
-+  }
-+
-+  constexpr bool dynamic() const {
-+    return (data_ & (width_mask | precision_mask)) !=3D 0;
-+  }
-+
-+  constexpr auto sign() const -> sign {
-+    return static_cast<fmt::sign>((data_ & sign_mask) >> sign_shift);
-+  }
-+  FMT_CONSTEXPR void set_sign(fmt::sign s) {
-+    data_ =3D (data_ & ~sign_mask) | (static_cast<unsigned>(s) << sign_=
shift);
-+  }
-+
-+  constexpr auto upper() const -> bool { return (data_ & uppercase_mask=
) !=3D 0; }
-+  FMT_CONSTEXPR void set_upper() { data_ |=3D uppercase_mask; }
-+
-+  constexpr auto alt() const -> bool { return (data_ & alternate_mask) =
!=3D 0; }
-+  FMT_CONSTEXPR void set_alt() { data_ |=3D alternate_mask; }
-+  FMT_CONSTEXPR void clear_alt() { data_ &=3D ~alternate_mask; }
-+
-+  constexpr auto localized() const -> bool {
-+    return (data_ & localized_mask) !=3D 0;
-+  }
-+  FMT_CONSTEXPR void set_localized() { data_ |=3D localized_mask; }
-+
-+  constexpr auto fill_size() const -> size_t {
-+    return (data_ & fill_size_mask) >> fill_size_shift;
-+  }
-+
-+  template <typename Char, FMT_ENABLE_IF(std::is_same<Char, char>::valu=
e)>
-+  constexpr auto fill() const -> const Char* {
-+    return fill_data_;
-+  }
-+  template <typename Char, FMT_ENABLE_IF(!std::is_same<Char, char>::val=
ue)>
-+  constexpr auto fill() const -> const Char* {
-+    return nullptr;
-+  }
-+
-+  template <typename Char> constexpr auto fill_unit() const -> Char {
-+    using uchar =3D unsigned char;
-+    return static_cast<Char>(static_cast<uchar>(fill_data_[0]) |
-+                             (static_cast<uchar>(fill_data_[1]) << 8) |
-+                             (static_cast<uchar>(fill_data_[2]) << 16))=
;
-+  }
-+
-+  FMT_CONSTEXPR void set_fill(char c) {
-+    fill_data_[0] =3D c;
-+    set_fill_size(1);
-+  }
-+
-+  template <typename Char>
-+  FMT_CONSTEXPR void set_fill(basic_string_view<Char> s) {
-+    auto size =3D s.size();
-+    set_fill_size(size);
-+    if (size =3D=3D 1) {
-+      unsigned uchar =3D static_cast<detail::unsigned_char<Char>>(s[0])=
;
-+      fill_data_[0] =3D static_cast<char>(uchar);
-+      fill_data_[1] =3D static_cast<char>(uchar >> 8);
-+      fill_data_[2] =3D static_cast<char>(uchar >> 16);
-+      return;
-+    }
-+    FMT_ASSERT(size <=3D max_fill_size, "invalid fill");
-+    for (size_t i =3D 0; i < size; ++i)
-+      fill_data_[i & 3] =3D static_cast<char>(s[i]);
-+  }
-+
-+  FMT_CONSTEXPR void copy_fill_from(const basic_specs& specs) {
-+    set_fill_size(specs.fill_size());
-+    for (size_t i =3D 0; i < max_fill_size; ++i)
-+      fill_data_[i] =3D specs.fill_data_[i];
-+  }
-+};
-+
-+// Format specifiers for built-in and string types.
-+struct format_specs : basic_specs {
-+  int width;
-+  int precision;
-+
-+  constexpr format_specs() : width(0), precision(-1) {}
-+};
-+
-+/**
-+ * Parsing context consisting of a format string range being parsed and=
 an
-+ * argument counter for automatic indexing.
-+ */
-+template <typename Char =3D char> class parse_context {
-+ private:
-+  basic_string_view<Char> fmt_;
-+  int next_arg_id_;
-+
-+  enum { use_constexpr_cast =3D !FMT_GCC_VERSION || FMT_GCC_VERSION >=3D=
 1200 };
-+
-+  FMT_CONSTEXPR void do_check_arg_id(int arg_id);
-+
-+ public:
-+  using char_type =3D Char;
-+  using iterator =3D const Char*;
-+
-+  constexpr explicit parse_context(basic_string_view<Char> fmt,
-+                                   int next_arg_id =3D 0)
-+      : fmt_(fmt), next_arg_id_(next_arg_id) {}
-+
-+  /// Returns an iterator to the beginning of the format string range b=
eing
-+  /// parsed.
-+  constexpr auto begin() const noexcept -> iterator { return fmt_.begin=
(); }
-+
-+  /// Returns an iterator past the end of the format string range being=
 parsed.
-+  constexpr auto end() const noexcept -> iterator { return fmt_.end(); =
}
-+
-+  /// Advances the begin iterator to `it`.
-+  FMT_CONSTEXPR void advance_to(iterator it) {
-+    fmt_.remove_prefix(detail::to_unsigned(it - begin()));
-+  }
-+
-+  /// Reports an error if using the manual argument indexing; otherwise=
 returns
-+  /// the next argument index and switches to the automatic indexing.
-+  FMT_CONSTEXPR auto next_arg_id() -> int {
-+    if (next_arg_id_ < 0) {
-+      report_error("cannot switch from manual to automatic argument ind=
exing");
-+      return 0;
-+    }
-+    int id =3D next_arg_id_++;
-+    do_check_arg_id(id);
-+    return id;
-+  }
-+
-+  /// Reports an error if using the automatic argument indexing; otherw=
ise
-+  /// switches to the manual indexing.
-+  FMT_CONSTEXPR void check_arg_id(int id) {
-+    if (next_arg_id_ > 0) {
-+      report_error("cannot switch from automatic to manual argument ind=
exing");
-+      return;
-+    }
-+    next_arg_id_ =3D -1;
-+    do_check_arg_id(id);
-+  }
-+  FMT_CONSTEXPR void check_arg_id(basic_string_view<Char>) {
-+    next_arg_id_ =3D -1;
-+  }
-+  FMT_CONSTEXPR void check_dynamic_spec(int arg_id);
-+};
-+
-+FMT_END_EXPORT
-+
-+namespace detail {
-+
-+// Constructs fmt::basic_string_view<Char> from types implicitly conver=
tible
-+// to it, deducing Char. Explicitly convertible types such as the ones =
returned
-+// from FMT_STRING are intentionally excluded.
-+template <typename Char, FMT_ENABLE_IF(is_char<Char>::value)>
-+constexpr auto to_string_view(const Char* s) -> basic_string_view<Char>=
 {
-+  return s;
-+}
-+template <typename T, FMT_ENABLE_IF(is_std_string_like<T>::value)>
-+constexpr auto to_string_view(const T& s)
-+    -> basic_string_view<typename T::value_type> {
-+  return s;
-+}
-+template <typename Char>
-+constexpr auto to_string_view(basic_string_view<Char> s)
-+    -> basic_string_view<Char> {
-+  return s;
-+}
-+
-+template <typename T, typename Enable =3D void>
-+struct has_to_string_view : std::false_type {};
-+// detail:: is intentional since to_string_view is not an extension poi=
nt.
-+template <typename T>
-+struct has_to_string_view<
-+    T, void_t<decltype(detail::to_string_view(std::declval<T>()))>>
-+    : std::true_type {};
-+
-+/// String's character (code unit) type. detail:: is intentional to pre=
vent ADL.
-+template <typename S,
-+          typename V =3D decltype(detail::to_string_view(std::declval<S=
>()))>
-+using char_t =3D typename V::value_type;
-+
-+enum class type {
-+  none_type,
-+  // Integer types should go first,
-+  int_type,
-+  uint_type,
-+  long_long_type,
-+  ulong_long_type,
-+  int128_type,
-+  uint128_type,
-+  bool_type,
-+  char_type,
-+  last_integer_type =3D char_type,
-+  // followed by floating-point types.
-+  float_type,
-+  double_type,
-+  long_double_type,
-+  last_numeric_type =3D long_double_type,
-+  cstring_type,
-+  string_type,
-+  pointer_type,
-+  custom_type
-+};
-+
-+// Maps core type T to the corresponding type enum constant.
-+template <typename T, typename Char>
-+struct type_constant : std::integral_constant<type, type::custom_type> =
{};
-+
-+#define FMT_TYPE_CONSTANT(Type, constant) \
-+  template <typename Char>                \
-+  struct type_constant<Type, Char>        \
-+      : std::integral_constant<type, type::constant> {}
-+
-+FMT_TYPE_CONSTANT(int, int_type);
-+FMT_TYPE_CONSTANT(unsigned, uint_type);
-+FMT_TYPE_CONSTANT(long long, long_long_type);
-+FMT_TYPE_CONSTANT(unsigned long long, ulong_long_type);
-+FMT_TYPE_CONSTANT(int128_opt, int128_type);
-+FMT_TYPE_CONSTANT(uint128_opt, uint128_type);
-+FMT_TYPE_CONSTANT(bool, bool_type);
-+FMT_TYPE_CONSTANT(Char, char_type);
-+FMT_TYPE_CONSTANT(float, float_type);
-+FMT_TYPE_CONSTANT(double, double_type);
-+FMT_TYPE_CONSTANT(long double, long_double_type);
-+FMT_TYPE_CONSTANT(const Char*, cstring_type);
-+FMT_TYPE_CONSTANT(basic_string_view<Char>, string_type);
-+FMT_TYPE_CONSTANT(const void*, pointer_type);
-+
-+constexpr auto is_integral_type(type t) -> bool {
-+  return t > type::none_type && t <=3D type::last_integer_type;
-+}
-+constexpr auto is_arithmetic_type(type t) -> bool {
-+  return t > type::none_type && t <=3D type::last_numeric_type;
-+}
-+
-+constexpr auto set(type rhs) -> int { return 1 << static_cast<int>(rhs)=
; }
-+constexpr auto in(type t, int set) -> bool {
-+  return ((set >> static_cast<int>(t)) & 1) !=3D 0;
-+}
-+
-+// Bitsets of types.
-+enum {
-+  sint_set =3D
-+      set(type::int_type) | set(type::long_long_type) | set(type::int12=
8_type),
-+  uint_set =3D set(type::uint_type) | set(type::ulong_long_type) |
-+             set(type::uint128_type),
-+  bool_set =3D set(type::bool_type),
-+  char_set =3D set(type::char_type),
-+  float_set =3D set(type::float_type) | set(type::double_type) |
-+              set(type::long_double_type),
-+  string_set =3D set(type::string_type),
-+  cstring_set =3D set(type::cstring_type),
-+  pointer_set =3D set(type::pointer_type)
-+};
-+
-+struct view {};
-+
-+template <typename Char, typename T> struct named_arg;
-+template <typename T> struct is_named_arg : std::false_type {};
-+template <typename T> struct is_static_named_arg : std::false_type {};
-+
-+template <typename Char, typename T>
-+struct is_named_arg<named_arg<Char, T>> : std::true_type {};
-+
-+template <typename Char, typename T> struct named_arg : view {
-+  const Char* name;
-+  const T& value;
-+
-+  named_arg(const Char* n, const T& v) : name(n), value(v) {}
-+  static_assert(!is_named_arg<T>::value, "nested named arguments");
-+};
-+
-+template <bool B =3D false> constexpr auto count() -> int { return B ? =
1 : 0; }
-+template <bool B1, bool B2, bool... Tail> constexpr auto count() -> int=
 {
-+  return (B1 ? 1 : 0) + count<B2, Tail...>();
-+}
-+
-+template <typename... Args> constexpr auto count_named_args() -> int {
-+  return count<is_named_arg<Args>::value...>();
-+}
-+template <typename... Args> constexpr auto count_static_named_args() ->=
 int {
-+  return count<is_static_named_arg<Args>::value...>();
-+}
-+
-+template <typename Char> struct named_arg_info {
-+  const Char* name;
-+  int id;
-+};
-+
-+// named_args is non-const to suppress a bogus -Wmaybe-uninitalized in =
gcc 13.
-+template <typename Char>
-+FMT_CONSTEXPR void check_for_duplicate(named_arg_info<Char>* named_args=
,
-+                                       int named_arg_index,
-+                                       basic_string_view<Char> arg_name=
) {
-+  for (int i =3D 0; i < named_arg_index; ++i) {
-+    if (named_args[i].name =3D=3D arg_name) report_error("duplicate nam=
ed arg");
-+  }
-+}
-+
-+template <typename Char, typename T, FMT_ENABLE_IF(!is_named_arg<T>::va=
lue)>
-+void init_named_arg(named_arg_info<Char>*, int& arg_index, int&, const =
T&) {
-+  ++arg_index;
-+}
-+template <typename Char, typename T, FMT_ENABLE_IF(is_named_arg<T>::val=
ue)>
-+void init_named_arg(named_arg_info<Char>* named_args, int& arg_index,
-+                    int& named_arg_index, const T& arg) {
-+  check_for_duplicate<Char>(named_args, named_arg_index, arg.name);
-+  named_args[named_arg_index++] =3D {arg.name, arg_index++};
-+}
-+
-+template <typename T, typename Char,
-+          FMT_ENABLE_IF(!is_static_named_arg<T>::value)>
-+FMT_CONSTEXPR void init_static_named_arg(named_arg_info<Char>*, int& ar=
g_index,
-+                                         int&) {
-+  ++arg_index;
-+}
-+template <typename T, typename Char,
-+          FMT_ENABLE_IF(is_static_named_arg<T>::value)>
-+FMT_CONSTEXPR void init_static_named_arg(named_arg_info<Char>* named_ar=
gs,
-+                                         int& arg_index, int& named_arg=
_index) {
-+  check_for_duplicate<Char>(named_args, named_arg_index, T::name);
-+  named_args[named_arg_index++] =3D {T::name, arg_index++};
-+}
-+
-+// To minimize the number of types we need to deal with, long is transl=
ated
-+// either to int or to long long depending on its size.
-+enum { long_short =3D sizeof(long) =3D=3D sizeof(int) };
-+using long_type =3D conditional_t<long_short, int, long long>;
-+using ulong_type =3D conditional_t<long_short, unsigned, unsigned long =
long>;
-+
-+template <typename T>
-+using format_as_result =3D
-+    remove_cvref_t<decltype(format_as(std::declval<const T&>()))>;
-+template <typename T>
-+using format_as_member_result =3D
-+    remove_cvref_t<decltype(formatter<T>::format_as(std::declval<const =
T&>()))>;
-+
-+template <typename T, typename Enable =3D std::true_type>
-+struct use_format_as : std::false_type {};
-+// format_as member is only used to avoid injection into the std namesp=
ace.
-+template <typename T, typename Enable =3D std::true_type>
-+struct use_format_as_member : std::false_type {};
-+
-+// Only map owning types because mapping views can be unsafe.
-+template <typename T>
-+struct use_format_as<
-+    T, bool_constant<std::is_arithmetic<format_as_result<T>>::value>>
-+    : std::true_type {};
-+template <typename T>
-+struct use_format_as_member<
-+    T, bool_constant<std::is_arithmetic<format_as_member_result<T>>::va=
lue>>
-+    : std::true_type {};
-+
-+template <typename T, typename U =3D remove_const_t<T>>
-+using use_formatter =3D
-+    bool_constant<(std::is_class<T>::value || std::is_enum<T>::value ||
-+                   std::is_union<T>::value || std::is_array<T>::value) =
&&
-+                  !has_to_string_view<T>::value && !is_named_arg<T>::va=
lue &&
-+                  !use_format_as<T>::value && !use_format_as_member<U>:=
:value>;
-+
-+template <typename Char, typename T, typename U =3D remove_const_t<T>>
-+auto has_formatter_impl(T* p, buffered_context<Char>* ctx =3D nullptr)
-+    -> decltype(formatter<U, Char>().format(*p, *ctx), std::true_type()=
);
-+template <typename Char> auto has_formatter_impl(...) -> std::false_typ=
e;
-+
-+// T can be const-qualified to check if it is const-formattable.
-+template <typename T, typename Char> constexpr auto has_formatter() -> =
bool {
-+  return decltype(has_formatter_impl<Char>(static_cast<T*>(nullptr)))::=
value;
-+}
-+
-+// Maps formatting argument types to natively supported types or user-d=
efined
-+// types with formatters. Returns void on errors to be SFINAE-friendly.
-+template <typename Char> struct type_mapper {
-+  static auto map(signed char) -> int;
-+  static auto map(unsigned char) -> unsigned;
-+  static auto map(short) -> int;
-+  static auto map(unsigned short) -> unsigned;
-+  static auto map(int) -> int;
-+  static auto map(unsigned) -> unsigned;
-+  static auto map(long) -> long_type;
-+  static auto map(unsigned long) -> ulong_type;
-+  static auto map(long long) -> long long;
-+  static auto map(unsigned long long) -> unsigned long long;
-+  static auto map(int128_opt) -> int128_opt;
-+  static auto map(uint128_opt) -> uint128_opt;
-+  static auto map(bool) -> bool;
-+
-+  template <int N>
-+  static auto map(bitint<N>) -> conditional_t<N <=3D 64, long long, voi=
d>;
-+  template <int N>
-+  static auto map(ubitint<N>)
-+      -> conditional_t<N <=3D 64, unsigned long long, void>;
-+
-+  template <typename T, FMT_ENABLE_IF(is_char<T>::value)>
-+  static auto map(T) -> conditional_t<
-+      std::is_same<T, char>::value || std::is_same<T, Char>::value, Cha=
r, void>;
-+
-+  static auto map(float) -> float;
-+  static auto map(double) -> double;
-+  static auto map(long double) -> long double;
-+
-+  static auto map(Char*) -> const Char*;
-+  static auto map(const Char*) -> const Char*;
-+  template <typename T, typename C =3D char_t<T>,
-+            FMT_ENABLE_IF(!std::is_pointer<T>::value)>
-+  static auto map(const T&) -> conditional_t<std::is_same<C, Char>::val=
ue,
-+                                             basic_string_view<C>, void=
>;
-+
-+  static auto map(void*) -> const void*;
-+  static auto map(const void*) -> const void*;
-+  static auto map(volatile void*) -> const void*;
-+  static auto map(const volatile void*) -> const void*;
-+  static auto map(nullptr_t) -> const void*;
-+  template <typename T, FMT_ENABLE_IF(std::is_pointer<T>::value ||
-+                                      std::is_member_pointer<T>::value)=
>
-+  static auto map(const T&) -> void;
-+
-+  template <typename T, FMT_ENABLE_IF(use_format_as<T>::value)>
-+  static auto map(const T& x) -> decltype(map(format_as(x)));
-+  template <typename T, FMT_ENABLE_IF(use_format_as_member<T>::value)>
-+  static auto map(const T& x) -> decltype(map(formatter<T>::format_as(x=
)));
-+
-+  template <typename T, FMT_ENABLE_IF(use_formatter<T>::value)>
-+  static auto map(T&) -> conditional_t<has_formatter<T, Char>(), T&, vo=
id>;
-+
-+  template <typename T, FMT_ENABLE_IF(is_named_arg<T>::value)>
-+  static auto map(const T& named_arg) -> decltype(map(named_arg.value))=
;
-+};
-+
-+// detail:: is used to workaround a bug in MSVC 2017.
-+template <typename T, typename Char>
-+using mapped_t =3D decltype(detail::type_mapper<Char>::map(std::declval=
<T&>()));
-+
-+// A type constant after applying type_mapper.
-+template <typename T, typename Char =3D char>
-+using mapped_type_constant =3D type_constant<mapped_t<T, Char>, Char>;
-+
-+template <typename T, typename Context,
-+          type TYPE =3D
-+              mapped_type_constant<T, typename Context::char_type>::val=
ue>
-+using stored_type_constant =3D std::integral_constant<
-+    type, Context::builtin_types || TYPE =3D=3D type::int_type ? TYPE
-+                                                           : type::cust=
om_type>;
-+// A parse context with extra data used only in compile-time checks.
-+template <typename Char>
-+class compile_parse_context : public parse_context<Char> {
-+ private:
-+  int num_args_;
-+  const type* types_;
-+  using base =3D parse_context<Char>;
-+
-+ public:
-+  FMT_CONSTEXPR explicit compile_parse_context(basic_string_view<Char> =
fmt,
-+                                               int num_args, const type=
* types,
-+                                               int next_arg_id =3D 0)
-+      : base(fmt, next_arg_id), num_args_(num_args), types_(types) {}
-+
-+  constexpr auto num_args() const -> int { return num_args_; }
-+  constexpr auto arg_type(int id) const -> type { return types_[id]; }
-+
-+  FMT_CONSTEXPR auto next_arg_id() -> int {
-+    int id =3D base::next_arg_id();
-+    if (id >=3D num_args_) report_error("argument not found");
-+    return id;
-+  }
-+
-+  FMT_CONSTEXPR void check_arg_id(int id) {
-+    base::check_arg_id(id);
-+    if (id >=3D num_args_) report_error("argument not found");
-+  }
-+  using base::check_arg_id;
-+
-+  FMT_CONSTEXPR void check_dynamic_spec(int arg_id) {
-+    ignore_unused(arg_id);
-+    if (arg_id < num_args_ && types_ && !is_integral_type(types_[arg_id=
]))
-+      report_error("width/precision is not integer");
-+  }
-+};
-+
-+// An argument reference.
-+template <typename Char> union arg_ref {
-+  FMT_CONSTEXPR arg_ref(int idx =3D 0) : index(idx) {}
-+  FMT_CONSTEXPR arg_ref(basic_string_view<Char> n) : name(n) {}
-+
-+  int index;
-+  basic_string_view<Char> name;
-+};
-+
-+// Format specifiers with width and precision resolved at formatting ra=
ther
-+// than parsing time to allow reusing the same parsed specifiers with
-+// different sets of arguments (precompilation of format strings).
-+template <typename Char =3D char> struct dynamic_format_specs : format_=
specs {
-+  arg_ref<Char> width_ref;
-+  arg_ref<Char> precision_ref;
-+};
-+
-+// Converts a character to ASCII. Returns '\0' on conversion failure.
-+template <typename Char, FMT_ENABLE_IF(std::is_integral<Char>::value)>
-+constexpr auto to_ascii(Char c) -> char {
-+  return c <=3D 0xff ? static_cast<char>(c) : '\0';
-+}
-+
-+// Returns the number of code units in a code point or 1 on error.
-+template <typename Char>
-+FMT_CONSTEXPR auto code_point_length(const Char* begin) -> int {
-+  if (const_check(sizeof(Char) !=3D 1)) return 1;
-+  auto c =3D static_cast<unsigned char>(*begin);
-+  return static_cast<int>((0x3a55000000000000ull >> (2 * (c >> 3))) & 3=
) + 1;
-+}
-+
-+// Parses the range [begin, end) as an unsigned integer. This function =
assumes
-+// that the range is non-empty and the first character is a digit.
-+template <typename Char>
-+FMT_CONSTEXPR auto parse_nonnegative_int(const Char*& begin, const Char=
* end,
-+                                         int error_value) noexcept -> i=
nt {
-+  FMT_ASSERT(begin !=3D end && '0' <=3D *begin && *begin <=3D '9', "");
-+  unsigned value =3D 0, prev =3D 0;
-+  auto p =3D begin;
-+  do {
-+    prev =3D value;
-+    value =3D value * 10 + unsigned(*p - '0');
-+    ++p;
-+  } while (p !=3D end && '0' <=3D *p && *p <=3D '9');
-+  auto num_digits =3D p - begin;
-+  begin =3D p;
-+  int digits10 =3D static_cast<int>(sizeof(int) * CHAR_BIT * 3 / 10);
-+  if (num_digits <=3D digits10) return static_cast<int>(value);
-+  // Check for overflow.
-+  unsigned max =3D INT_MAX;
-+  return num_digits =3D=3D digits10 + 1 &&
-+                 prev * 10ull + unsigned(p[-1] - '0') <=3D max
-+             ? static_cast<int>(value)
-+             : error_value;
-+}
-+
-+FMT_CONSTEXPR inline auto parse_align(char c) -> align {
-+  switch (c) {
-+  case '<': return align::left;
-+  case '>': return align::right;
-+  case '^': return align::center;
-+  }
-+  return align::none;
-+}
-+
-+template <typename Char> constexpr auto is_name_start(Char c) -> bool {
-+  return ('a' <=3D c && c <=3D 'z') || ('A' <=3D c && c <=3D 'Z') || c =
=3D=3D '_';
-+}
-+
-+template <typename Char, typename Handler>
-+FMT_CONSTEXPR auto parse_arg_id(const Char* begin, const Char* end,
-+                                Handler&& handler) -> const Char* {
-+  Char c =3D *begin;
-+  if (c >=3D '0' && c <=3D '9') {
-+    int index =3D 0;
-+    if (c !=3D '0')
-+      index =3D parse_nonnegative_int(begin, end, INT_MAX);
-+    else
-+      ++begin;
-+    if (begin =3D=3D end || (*begin !=3D '}' && *begin !=3D ':'))
-+      report_error("invalid format string");
-+    else
-+      handler.on_index(index);
-+    return begin;
-+  }
-+  if (FMT_OPTIMIZE_SIZE > 1 || !is_name_start(c)) {
-+    report_error("invalid format string");
-+    return begin;
-+  }
-+  auto it =3D begin;
-+  do {
-+    ++it;
-+  } while (it !=3D end && (is_name_start(*it) || ('0' <=3D *it && *it <=
=3D '9')));
-+  handler.on_name({begin, to_unsigned(it - begin)});
-+  return it;
-+}
-+
-+template <typename Char> struct dynamic_spec_handler {
-+  parse_context<Char>& ctx;
-+  arg_ref<Char>& ref;
-+  arg_id_kind& kind;
-+
-+  FMT_CONSTEXPR void on_index(int id) {
-+    ref =3D id;
-+    kind =3D arg_id_kind::index;
-+    ctx.check_arg_id(id);
-+    ctx.check_dynamic_spec(id);
-+  }
-+  FMT_CONSTEXPR void on_name(basic_string_view<Char> id) {
-+    ref =3D id;
-+    kind =3D arg_id_kind::name;
-+    ctx.check_arg_id(id);
-+  }
-+};
-+
-+template <typename Char> struct parse_dynamic_spec_result {
-+  const Char* end;
-+  arg_id_kind kind;
-+};
-+
-+// Parses integer | "{" [arg_id] "}".
-+template <typename Char>
-+FMT_CONSTEXPR auto parse_dynamic_spec(const Char* begin, const Char* en=
d,
-+                                      int& value, arg_ref<Char>& ref,
-+                                      parse_context<Char>& ctx)
-+    -> parse_dynamic_spec_result<Char> {
-+  FMT_ASSERT(begin !=3D end, "");
-+  auto kind =3D arg_id_kind::none;
-+  if ('0' <=3D *begin && *begin <=3D '9') {
-+    int val =3D parse_nonnegative_int(begin, end, -1);
-+    if (val =3D=3D -1) report_error("number is too big");
-+    value =3D val;
-+  } else {
-+    if (*begin =3D=3D '{') {
-+      ++begin;
-+      if (begin !=3D end) {
-+        Char c =3D *begin;
-+        if (c =3D=3D '}' || c =3D=3D ':') {
-+          int id =3D ctx.next_arg_id();
-+          ref =3D id;
-+          kind =3D arg_id_kind::index;
-+          ctx.check_dynamic_spec(id);
-+        } else {
-+          begin =3D parse_arg_id(begin, end,
-+                               dynamic_spec_handler<Char>{ctx, ref, kin=
d});
-+        }
-+      }
-+      if (begin !=3D end && *begin =3D=3D '}') return {++begin, kind};
-+    }
-+    report_error("invalid format string");
-+  }
-+  return {begin, kind};
-+}
-+
-+template <typename Char>
-+FMT_CONSTEXPR auto parse_width(const Char* begin, const Char* end,
-+                               format_specs& specs, arg_ref<Char>& widt=
h_ref,
-+                               parse_context<Char>& ctx) -> const Char*=
 {
-+  auto result =3D parse_dynamic_spec(begin, end, specs.width, width_ref=
, ctx);
-+  specs.set_dynamic_width(result.kind);
-+  return result.end;
-+}
-+
-+template <typename Char>
-+FMT_CONSTEXPR auto parse_precision(const Char* begin, const Char* end,
-+                                   format_specs& specs,
-+                                   arg_ref<Char>& precision_ref,
-+                                   parse_context<Char>& ctx) -> const C=
har* {
-+  ++begin;
-+  if (begin =3D=3D end) {
-+    report_error("invalid precision");
-+    return begin;
-+  }
-+  auto result =3D
-+      parse_dynamic_spec(begin, end, specs.precision, precision_ref, ct=
x);
-+  specs.set_dynamic_precision(result.kind);
-+  return result.end;
-+}
-+
-+enum class state { start, align, sign, hash, zero, width, precision, lo=
cale };
-+
-+// Parses standard format specifiers.
-+template <typename Char>
-+FMT_CONSTEXPR auto parse_format_specs(const Char* begin, const Char* en=
d,
-+                                      dynamic_format_specs<Char>& specs=
,
-+                                      parse_context<Char>& ctx, type ar=
g_type)
-+    -> const Char* {
-+  auto c =3D '\0';
-+  if (end - begin > 1) {
-+    auto next =3D to_ascii(begin[1]);
-+    c =3D parse_align(next) =3D=3D align::none ? to_ascii(*begin) : '\0=
';
-+  } else {
-+    if (begin =3D=3D end) return begin;
-+    c =3D to_ascii(*begin);
-+  }
-+
-+  struct {
-+    state current_state =3D state::start;
-+    FMT_CONSTEXPR void operator()(state s, bool valid =3D true) {
-+      if (current_state >=3D s || !valid)
-+        report_error("invalid format specifier");
-+      current_state =3D s;
-+    }
-+  } enter_state;
-+
-+  using pres =3D presentation_type;
-+  constexpr auto integral_set =3D sint_set | uint_set | bool_set | char=
_set;
-+  struct {
-+    const Char*& begin;
-+    format_specs& specs;
-+    type arg_type;
-+
-+    FMT_CONSTEXPR auto operator()(pres pres_type, int set) -> const Cha=
r* {
-+      if (!in(arg_type, set)) report_error("invalid format specifier");
-+      specs.set_type(pres_type);
-+      return begin + 1;
-+    }
-+  } parse_presentation_type{begin, specs, arg_type};
-+
-+  for (;;) {
-+    switch (c) {
-+    case '<':
-+    case '>':
-+    case '^':
-+      enter_state(state::align);
-+      specs.set_align(parse_align(c));
-+      ++begin;
-+      break;
-+    case '+':
-+    case ' ':
-+      specs.set_sign(c =3D=3D ' ' ? sign::space : sign::plus);
-+      FMT_FALLTHROUGH;
-+    case '-':
-+      enter_state(state::sign, in(arg_type, sint_set | float_set));
-+      ++begin;
-+      break;
-+    case '#':
-+      enter_state(state::hash, is_arithmetic_type(arg_type));
-+      specs.set_alt();
-+      ++begin;
-+      break;
-+    case '0':
-+      enter_state(state::zero);
-+      if (!is_arithmetic_type(arg_type))
-+        report_error("format specifier requires numeric argument");
-+      if (specs.align() =3D=3D align::none) {
-+        // Ignore 0 if align is specified for compatibility with std::f=
ormat.
-+        specs.set_align(align::numeric);
-+        specs.set_fill('0');
-+      }
-+      ++begin;
-+      break;
-+      // clang-format off
-+    case '1': case '2': case '3': case '4': case '5':
-+    case '6': case '7': case '8': case '9': case '{':
-+      // clang-format on
-+      enter_state(state::width);
-+      begin =3D parse_width(begin, end, specs, specs.width_ref, ctx);
-+      break;
-+    case '.':
-+      enter_state(state::precision,
-+                  in(arg_type, float_set | string_set | cstring_set));
-+      begin =3D parse_precision(begin, end, specs, specs.precision_ref,=
 ctx);
-+      break;
-+    case 'L':
-+      enter_state(state::locale, is_arithmetic_type(arg_type));
-+      specs.set_localized();
-+      ++begin;
-+      break;
-+    case 'd': return parse_presentation_type(pres::dec, integral_set);
-+    case 'X': specs.set_upper(); FMT_FALLTHROUGH;
-+    case 'x': return parse_presentation_type(pres::hex, integral_set);
-+    case 'o': return parse_presentation_type(pres::oct, integral_set);
-+    case 'B': specs.set_upper(); FMT_FALLTHROUGH;
-+    case 'b': return parse_presentation_type(pres::bin, integral_set);
-+    case 'E': specs.set_upper(); FMT_FALLTHROUGH;
-+    case 'e': return parse_presentation_type(pres::exp, float_set);
-+    case 'F': specs.set_upper(); FMT_FALLTHROUGH;
-+    case 'f': return parse_presentation_type(pres::fixed, float_set);
-+    case 'G': specs.set_upper(); FMT_FALLTHROUGH;
-+    case 'g': return parse_presentation_type(pres::general, float_set);
-+    case 'A': specs.set_upper(); FMT_FALLTHROUGH;
-+    case 'a': return parse_presentation_type(pres::hexfloat, float_set)=
;
-+    case 'c':
-+      if (arg_type =3D=3D type::bool_type) report_error("invalid format=
 specifier");
-+      return parse_presentation_type(pres::chr, integral_set);
-+    case 's':
-+      return parse_presentation_type(pres::string,
-+                                     bool_set | string_set | cstring_se=
t);
-+    case 'p':
-+      return parse_presentation_type(pres::pointer, pointer_set | cstri=
ng_set);
-+    case '?':
-+      return parse_presentation_type(pres::debug,
-+                                     char_set | string_set | cstring_se=
t);
-+    case '}': return begin;
-+    default:  {
-+      if (*begin =3D=3D '}') return begin;
-+      // Parse fill and alignment.
-+      auto fill_end =3D begin + code_point_length(begin);
-+      if (end - fill_end <=3D 0) {
-+        report_error("invalid format specifier");
-+        return begin;
-+      }
-+      if (*begin =3D=3D '{') {
-+        report_error("invalid fill character '{'");
-+        return begin;
-+      }
-+      auto alignment =3D parse_align(to_ascii(*fill_end));
-+      enter_state(state::align, alignment !=3D align::none);
-+      specs.set_fill(
-+          basic_string_view<Char>(begin, to_unsigned(fill_end - begin))=
);
-+      specs.set_align(alignment);
-+      begin =3D fill_end + 1;
-+    }
-+    }
-+    if (begin =3D=3D end) return begin;
-+    c =3D to_ascii(*begin);
-+  }
-+}
-+
-+template <typename Char, typename Handler>
-+FMT_CONSTEXPR FMT_INLINE auto parse_replacement_field(const Char* begin=
,
-+                                                      const Char* end,
-+                                                      Handler&& handler=
)
-+    -> const Char* {
-+  ++begin;
-+  if (begin =3D=3D end) {
-+    handler.on_error("invalid format string");
-+    return end;
-+  }
-+  int arg_id =3D 0;
-+  switch (*begin) {
-+  case '}':
-+    handler.on_replacement_field(handler.on_arg_id(), begin);
-+    return begin + 1;
-+  case '{': handler.on_text(begin, begin + 1); return begin + 1;
-+  case ':': arg_id =3D handler.on_arg_id(); break;
-+  default:  {
-+    struct id_adapter {
-+      Handler& handler;
-+      int arg_id;
-+
-+      FMT_CONSTEXPR void on_index(int id) { arg_id =3D handler.on_arg_i=
d(id); }
-+      FMT_CONSTEXPR void on_name(basic_string_view<Char> id) {
-+        arg_id =3D handler.on_arg_id(id);
-+      }
-+    } adapter =3D {handler, 0};
-+    begin =3D parse_arg_id(begin, end, adapter);
-+    arg_id =3D adapter.arg_id;
-+    Char c =3D begin !=3D end ? *begin : Char();
-+    if (c =3D=3D '}') {
-+      handler.on_replacement_field(arg_id, begin);
-+      return begin + 1;
-+    }
-+    if (c !=3D ':') {
-+      handler.on_error("missing '}' in format string");
-+      return end;
-+    }
-+    break;
-+  }
-+  }
-+  begin =3D handler.on_format_specs(arg_id, begin + 1, end);
-+  if (begin =3D=3D end || *begin !=3D '}')
-+    return handler.on_error("unknown format specifier"), end;
-+  return begin + 1;
-+}
-+
-+template <typename Char, typename Handler>
-+FMT_CONSTEXPR void parse_format_string(basic_string_view<Char> fmt,
-+                                       Handler&& handler) {
-+  auto begin =3D fmt.data(), end =3D begin + fmt.size();
-+  auto p =3D begin;
-+  while (p !=3D end) {
-+    auto c =3D *p++;
-+    if (c =3D=3D '{') {
-+      handler.on_text(begin, p - 1);
-+      begin =3D p =3D parse_replacement_field(p - 1, end, handler);
-+    } else if (c =3D=3D '}') {
-+      if (p =3D=3D end || *p !=3D '}')
-+        return handler.on_error("unmatched '}' in format string");
-+      handler.on_text(begin, p);
-+      begin =3D ++p;
-+    }
-+  }
-+  handler.on_text(begin, end);
-+}
-+
-+// Checks char specs and returns true iff the presentation type is char=
-like.
-+FMT_CONSTEXPR inline auto check_char_specs(const format_specs& specs) -=
> bool {
-+  auto type =3D specs.type();
-+  if (type !=3D presentation_type::none && type !=3D presentation_type:=
:chr &&
-+      type !=3D presentation_type::debug) {
-+    return false;
-+  }
-+  if (specs.align() =3D=3D align::numeric || specs.sign() !=3D sign::no=
ne ||
-+      specs.alt()) {
-+    report_error("invalid format specifier for char");
-+  }
-+  return true;
-+}
-+
-+// A base class for compile-time strings.
-+struct compile_string {};
-+
-+template <typename T, typename Char>
-+FMT_VISIBILITY("hidden")  // Suppress an ld warning on macOS (#3769).
-+FMT_CONSTEXPR auto invoke_parse(parse_context<Char>& ctx) -> const Char=
* {
-+  using mapped_type =3D remove_cvref_t<mapped_t<T, Char>>;
-+  constexpr bool formattable =3D
-+      std::is_constructible<formatter<mapped_type, Char>>::value;
-+  if (!formattable) return ctx.begin();  // Error is reported in the va=
lue ctor.
-+  using formatted_type =3D conditional_t<formattable, mapped_type, int>=
;
-+  return formatter<formatted_type, Char>().parse(ctx);
-+}
-+
-+template <typename... T> struct arg_pack {};
-+
-+template <typename Char, int NUM_ARGS, int NUM_NAMED_ARGS, bool DYNAMIC=
_NAMES>
-+class format_string_checker {
-+ private:
-+  type types_[max_of(1, NUM_ARGS)];
-+  named_arg_info<Char> named_args_[max_of(1, NUM_NAMED_ARGS)];
-+  compile_parse_context<Char> context_;
-+
-+  using parse_func =3D auto (*)(parse_context<Char>&) -> const Char*;
-+  parse_func parse_funcs_[max_of(1, NUM_ARGS)];
-+
-+ public:
-+  template <typename... T>
-+  FMT_CONSTEXPR explicit format_string_checker(basic_string_view<Char> =
fmt,
-+                                               arg_pack<T...>)
-+      : types_{mapped_type_constant<T, Char>::value...},
-+        named_args_{},
-+        context_(fmt, NUM_ARGS, types_),
-+        parse_funcs_{&invoke_parse<T, Char>...} {
-+    int arg_index =3D 0, named_arg_index =3D 0;
-+    FMT_APPLY_VARIADIC(
-+        init_static_named_arg<T>(named_args_, arg_index, named_arg_inde=
x));
-+    ignore_unused(arg_index, named_arg_index);
-+  }
-+
-+  FMT_CONSTEXPR void on_text(const Char*, const Char*) {}
-+
-+  FMT_CONSTEXPR auto on_arg_id() -> int { return context_.next_arg_id()=
; }
-+  FMT_CONSTEXPR auto on_arg_id(int id) -> int {
-+    context_.check_arg_id(id);
-+    return id;
-+  }
-+  FMT_CONSTEXPR auto on_arg_id(basic_string_view<Char> id) -> int {
-+    for (int i =3D 0; i < NUM_NAMED_ARGS; ++i) {
-+      if (named_args_[i].name =3D=3D id) return named_args_[i].id;
-+    }
-+    if (!DYNAMIC_NAMES) on_error("argument not found");
-+    return -1;
-+  }
-+
-+  FMT_CONSTEXPR void on_replacement_field(int id, const Char* begin) {
-+    on_format_specs(id, begin, begin);  // Call parse() on empty specs.
-+  }
-+
-+  FMT_CONSTEXPR auto on_format_specs(int id, const Char* begin, const C=
har* end)
-+      -> const Char* {
-+    context_.advance_to(begin);
-+    if (id >=3D 0 && id < NUM_ARGS) return parse_funcs_[id](context_);
-+    while (begin !=3D end && *begin !=3D '}') ++begin;
-+    return begin;
-+  }
-+
-+  FMT_NORETURN FMT_CONSTEXPR void on_error(const char* message) {
-+    report_error(message);
-+  }
-+};
-+
-+/// A contiguous memory buffer with an optional growing ability. It is =
an
-+/// internal class and shouldn't be used directly, only via `memory_buf=
fer`.
-+template <typename T> class buffer {
-+ private:
-+  T* ptr_;
-+  size_t size_;
-+  size_t capacity_;
-+
-+  using grow_fun =3D void (*)(buffer& buf, size_t capacity);
-+  grow_fun grow_;
-+
-+ protected:
-+  // Don't initialize ptr_ since it is not accessed to save a few cycle=
s.
-+  FMT_MSC_WARNING(suppress : 26495)
-+  FMT_CONSTEXPR buffer(grow_fun grow, size_t sz) noexcept
-+      : size_(sz), capacity_(sz), grow_(grow) {}
-+
-+  constexpr buffer(grow_fun grow, T* p =3D nullptr, size_t sz =3D 0,
-+                   size_t cap =3D 0) noexcept
-+      : ptr_(p), size_(sz), capacity_(cap), grow_(grow) {}
-+
-+  FMT_CONSTEXPR20 ~buffer() =3D default;
-+  buffer(buffer&&) =3D default;
-+
-+  /// Sets the buffer data and capacity.
-+  FMT_CONSTEXPR void set(T* buf_data, size_t buf_capacity) noexcept {
-+    ptr_ =3D buf_data;
-+    capacity_ =3D buf_capacity;
-+  }
-+
-+ public:
-+  using value_type =3D T;
-+  using const_reference =3D const T&;
-+
-+  buffer(const buffer&) =3D delete;
-+  void operator=3D(const buffer&) =3D delete;
-+
-+  auto begin() noexcept -> T* { return ptr_; }
-+  auto end() noexcept -> T* { return ptr_ + size_; }
-+
-+  auto begin() const noexcept -> const T* { return ptr_; }
-+  auto end() const noexcept -> const T* { return ptr_ + size_; }
-+
-+  /// Returns the size of this buffer.
-+  constexpr auto size() const noexcept -> size_t { return size_; }
-+
-+  /// Returns the capacity of this buffer.
-+  constexpr auto capacity() const noexcept -> size_t { return capacity_=
; }
-+
-+  /// Returns a pointer to the buffer data (not null-terminated).
-+  FMT_CONSTEXPR auto data() noexcept -> T* { return ptr_; }
-+  FMT_CONSTEXPR auto data() const noexcept -> const T* { return ptr_; }
-+
-+  /// Clears this buffer.
-+  FMT_CONSTEXPR void clear() { size_ =3D 0; }
-+
-+  // Tries resizing the buffer to contain `count` elements. If T is a P=
OD type
-+  // the new elements may not be initialized.
-+  FMT_CONSTEXPR void try_resize(size_t count) {
-+    try_reserve(count);
-+    size_ =3D min_of(count, capacity_);
-+  }
-+
-+  // Tries increasing the buffer capacity to `new_capacity`. It can inc=
rease the
-+  // capacity by a smaller amount than requested but guarantees there i=
s space
-+  // for at least one additional element either by increasing the capac=
ity or by
-+  // flushing the buffer if it is full.
-+  FMT_CONSTEXPR void try_reserve(size_t new_capacity) {
-+    if (new_capacity > capacity_) grow_(*this, new_capacity);
-+  }
-+
-+  FMT_CONSTEXPR void push_back(const T& value) {
-+    try_reserve(size_ + 1);
-+    ptr_[size_++] =3D value;
-+  }
-+
-+  /// Appends data to the end of the buffer.
-+  template <typename U>
-+// Workaround for MSVC2019 to fix error C2893: Failed to specialize fun=
ction
-+// template 'void fmt::v11::detail::buffer<T>::append(const U *,const U=
 *)'.
-+#if !FMT_MSC_VERSION || FMT_MSC_VERSION >=3D 1940
-+  FMT_CONSTEXPR20
-+#endif
-+      void
-+      append(const U* begin, const U* end) {
-+    while (begin !=3D end) {
-+      auto count =3D to_unsigned(end - begin);
-+      try_reserve(size_ + count);
-+      auto free_cap =3D capacity_ - size_;
-+      if (free_cap < count) count =3D free_cap;
-+      // A loop is faster than memcpy on small sizes.
-+      T* out =3D ptr_ + size_;
-+      for (size_t i =3D 0; i < count; ++i) out[i] =3D begin[i];
-+      size_ +=3D count;
-+      begin +=3D count;
-+    }
-+  }
-+
-+  template <typename Idx> FMT_CONSTEXPR auto operator[](Idx index) -> T=
& {
-+    return ptr_[index];
-+  }
-+  template <typename Idx>
-+  FMT_CONSTEXPR auto operator[](Idx index) const -> const T& {
-+    return ptr_[index];
-+  }
-+};
-+
-+struct buffer_traits {
-+  constexpr explicit buffer_traits(size_t) {}
-+  constexpr auto count() const -> size_t { return 0; }
-+  constexpr auto limit(size_t size) const -> size_t { return size; }
-+};
-+
-+class fixed_buffer_traits {
-+ private:
-+  size_t count_ =3D 0;
-+  size_t limit_;
-+
-+ public:
-+  constexpr explicit fixed_buffer_traits(size_t limit) : limit_(limit) =
{}
-+  constexpr auto count() const -> size_t { return count_; }
-+  FMT_CONSTEXPR auto limit(size_t size) -> size_t {
-+    size_t n =3D limit_ > count_ ? limit_ - count_ : 0;
-+    count_ +=3D size;
-+    return min_of(size, n);
-+  }
-+};
-+
-+// A buffer that writes to an output iterator when flushed.
-+template <typename OutputIt, typename T, typename Traits =3D buffer_tra=
its>
-+class iterator_buffer : public Traits, public buffer<T> {
-+ private:
-+  OutputIt out_;
-+  enum { buffer_size =3D 256 };
-+  T data_[buffer_size];
-+
-+  static FMT_CONSTEXPR void grow(buffer<T>& buf, size_t) {
-+    if (buf.size() =3D=3D buffer_size) static_cast<iterator_buffer&>(bu=
f).flush();
-+  }
-+
-+  void flush() {
-+    auto size =3D this->size();
-+    this->clear();
-+    const T* begin =3D data_;
-+    const T* end =3D begin + this->limit(size);
-+    while (begin !=3D end) *out_++ =3D *begin++;
-+  }
-+
-+ public:
-+  explicit iterator_buffer(OutputIt out, size_t n =3D buffer_size)
-+      : Traits(n), buffer<T>(grow, data_, 0, buffer_size), out_(out) {}
-+  iterator_buffer(iterator_buffer&& other) noexcept
-+      : Traits(other),
-+        buffer<T>(grow, data_, 0, buffer_size),
-+        out_(other.out_) {}
-+  ~iterator_buffer() {
-+    // Don't crash if flush fails during unwinding.
-+    FMT_TRY { flush(); }
-+    FMT_CATCH(...) {}
-+  }
-+
-+  auto out() -> OutputIt {
-+    flush();
-+    return out_;
-+  }
-+  auto count() const -> size_t { return Traits::count() + this->size();=
 }
-+};
-+
-+template <typename T>
-+class iterator_buffer<T*, T, fixed_buffer_traits> : public fixed_buffer=
_traits,
-+                                                    public buffer<T> {
-+ private:
-+  T* out_;
-+  enum { buffer_size =3D 256 };
-+  T data_[buffer_size];
-+
-+  static FMT_CONSTEXPR void grow(buffer<T>& buf, size_t) {
-+    if (buf.size() =3D=3D buf.capacity())
-+      static_cast<iterator_buffer&>(buf).flush();
-+  }
-+
-+  void flush() {
-+    size_t n =3D this->limit(this->size());
-+    if (this->data() =3D=3D out_) {
-+      out_ +=3D n;
-+      this->set(data_, buffer_size);
-+    }
-+    this->clear();
-+  }
-+
-+ public:
-+  explicit iterator_buffer(T* out, size_t n =3D buffer_size)
-+      : fixed_buffer_traits(n), buffer<T>(grow, out, 0, n), out_(out) {=
}
-+  iterator_buffer(iterator_buffer&& other) noexcept
-+      : fixed_buffer_traits(other),
-+        buffer<T>(static_cast<iterator_buffer&&>(other)),
-+        out_(other.out_) {
-+    if (this->data() !=3D out_) {
-+      this->set(data_, buffer_size);
-+      this->clear();
-+    }
-+  }
-+  ~iterator_buffer() { flush(); }
-+
-+  auto out() -> T* {
-+    flush();
-+    return out_;
-+  }
-+  auto count() const -> size_t {
-+    return fixed_buffer_traits::count() + this->size();
-+  }
-+};
-+
-+template <typename T> class iterator_buffer<T*, T> : public buffer<T> {
-+ public:
-+  explicit iterator_buffer(T* out, size_t =3D 0)
-+      : buffer<T>([](buffer<T>&, size_t) {}, out, 0, ~size_t()) {}
-+
-+  auto out() -> T* { return &*this->end(); }
-+};
-+
-+template <typename Container>
-+class container_buffer : public buffer<typename Container::value_type> =
{
-+ private:
-+  using value_type =3D typename Container::value_type;
-+
-+  static FMT_CONSTEXPR void grow(buffer<value_type>& buf, size_t capaci=
ty) {
-+    auto& self =3D static_cast<container_buffer&>(buf);
-+    self.container.resize(capacity);
-+    self.set(&self.container[0], capacity);
-+  }
-+
-+ public:
-+  Container& container;
-+
-+  explicit container_buffer(Container& c)
-+      : buffer<value_type>(grow, c.size()), container(c) {}
-+};
-+
-+// A buffer that writes to a container with the contiguous storage.
-+template <typename OutputIt>
-+class iterator_buffer<
-+    OutputIt,
-+    enable_if_t<is_back_insert_iterator<OutputIt>::value &&
-+                    is_contiguous<typename OutputIt::container_type>::v=
alue,
-+                typename OutputIt::container_type::value_type>>
-+    : public container_buffer<typename OutputIt::container_type> {
-+ private:
-+  using base =3D container_buffer<typename OutputIt::container_type>;
-+
-+ public:
-+  explicit iterator_buffer(typename OutputIt::container_type& c) : base=
(c) {}
-+  explicit iterator_buffer(OutputIt out, size_t =3D 0)
-+      : base(get_container(out)) {}
-+
-+  auto out() -> OutputIt { return OutputIt(this->container); }
-+};
-+
-+// A buffer that counts the number of code units written discarding the=
 output.
-+template <typename T =3D char> class counting_buffer : public buffer<T>=
 {
-+ private:
-+  enum { buffer_size =3D 256 };
-+  T data_[buffer_size];
-+  size_t count_ =3D 0;
-+
-+  static FMT_CONSTEXPR void grow(buffer<T>& buf, size_t) {
-+    if (buf.size() !=3D buffer_size) return;
-+    static_cast<counting_buffer&>(buf).count_ +=3D buf.size();
-+    buf.clear();
-+  }
-+
-+ public:
-+  FMT_CONSTEXPR counting_buffer() : buffer<T>(grow, data_, 0, buffer_si=
ze) {}
-+
-+  constexpr auto count() const noexcept -> size_t {
-+    return count_ + this->size();
-+  }
-+};
-+
-+template <typename T>
-+struct is_back_insert_iterator<basic_appender<T>> : std::true_type {};
-+
-+template <typename OutputIt, typename InputIt, typename =3D void>
-+struct has_back_insert_iterator_container_append : std::false_type {};
-+template <typename OutputIt, typename InputIt>
-+struct has_back_insert_iterator_container_append<
-+    OutputIt, InputIt,
-+    void_t<decltype(get_container(std::declval<OutputIt>())
-+                        .append(std::declval<InputIt>(),
-+                                std::declval<InputIt>()))>> : std::true=
_type {};
-+
-+// An optimized version of std::copy with the output value type (T).
-+template <typename T, typename InputIt, typename OutputIt,
-+          FMT_ENABLE_IF(is_back_insert_iterator<OutputIt>::value&&
-+                            has_back_insert_iterator_container_append<
-+                                OutputIt, InputIt>::value)>
-+FMT_CONSTEXPR20 auto copy(InputIt begin, InputIt end, OutputIt out)
-+    -> OutputIt {
-+  get_container(out).append(begin, end);
-+  return out;
-+}
-+
-+template <typename T, typename InputIt, typename OutputIt,
-+          FMT_ENABLE_IF(is_back_insert_iterator<OutputIt>::value &&
-+                        !has_back_insert_iterator_container_append<
-+                            OutputIt, InputIt>::value)>
-+FMT_CONSTEXPR20 auto copy(InputIt begin, InputIt end, OutputIt out)
-+    -> OutputIt {
-+  auto& c =3D get_container(out);
-+  c.insert(c.end(), begin, end);
-+  return out;
-+}
-+
-+template <typename T, typename InputIt, typename OutputIt,
-+          FMT_ENABLE_IF(!is_back_insert_iterator<OutputIt>::value)>
-+FMT_CONSTEXPR auto copy(InputIt begin, InputIt end, OutputIt out) -> Ou=
tputIt {
-+  while (begin !=3D end) *out++ =3D static_cast<T>(*begin++);
-+  return out;
-+}
-+
-+template <typename T, typename V, typename OutputIt>
-+FMT_CONSTEXPR auto copy(basic_string_view<V> s, OutputIt out) -> Output=
It {
-+  return copy<T>(s.begin(), s.end(), out);
-+}
-+
-+template <typename It, typename Enable =3D std::true_type>
-+struct is_buffer_appender : std::false_type {};
-+template <typename It>
-+struct is_buffer_appender<
-+    It, bool_constant<
-+            is_back_insert_iterator<It>::value &&
-+            std::is_base_of<buffer<typename It::container_type::value_t=
ype>,
-+                            typename It::container_type>::value>>
-+    : std::true_type {};
-+
-+// Maps an output iterator to a buffer.
-+template <typename T, typename OutputIt,
-+          FMT_ENABLE_IF(!is_buffer_appender<OutputIt>::value)>
-+auto get_buffer(OutputIt out) -> iterator_buffer<OutputIt, T> {
-+  return iterator_buffer<OutputIt, T>(out);
-+}
-+template <typename T, typename OutputIt,
-+          FMT_ENABLE_IF(is_buffer_appender<OutputIt>::value)>
-+auto get_buffer(OutputIt out) -> buffer<T>& {
-+  return get_container(out);
-+}
-+
-+template <typename Buf, typename OutputIt>
-+auto get_iterator(Buf& buf, OutputIt) -> decltype(buf.out()) {
-+  return buf.out();
-+}
-+template <typename T, typename OutputIt>
-+auto get_iterator(buffer<T>&, OutputIt out) -> OutputIt {
-+  return out;
-+}
-+
-+// This type is intentionally undefined, only used for errors.
-+template <typename T, typename Char> struct type_is_unformattable_for;
-+
-+template <typename Char> struct string_value {
-+  const Char* data;
-+  size_t size;
-+  auto str() const -> basic_string_view<Char> { return {data, size}; }
-+};
-+
-+template <typename Context> struct custom_value {
-+  using char_type =3D typename Context::char_type;
-+  void* value;
-+  void (*format)(void* arg, parse_context<char_type>& parse_ctx, Contex=
t& ctx);
-+};
-+
-+template <typename Char> struct named_arg_value {
-+  const named_arg_info<Char>* data;
-+  size_t size;
-+};
-+
-+struct custom_tag {};
-+
-+#if !FMT_BUILTIN_TYPES
-+#  define FMT_BUILTIN , monostate
-+#else
-+#  define FMT_BUILTIN
-+#endif
-+
-+// A formatting argument value.
-+template <typename Context> class value {
-+ public:
-+  using char_type =3D typename Context::char_type;
-+
-+  union {
-+    monostate no_value;
-+    int int_value;
-+    unsigned uint_value;
-+    long long long_long_value;
-+    unsigned long long ulong_long_value;
-+    int128_opt int128_value;
-+    uint128_opt uint128_value;
-+    bool bool_value;
-+    char_type char_value;
-+    float float_value;
-+    double double_value;
-+    long double long_double_value;
-+    const void* pointer;
-+    string_value<char_type> string;
-+    custom_value<Context> custom;
-+    named_arg_value<char_type> named_args;
-+  };
-+
-+  constexpr FMT_INLINE value() : no_value() {}
-+  constexpr FMT_INLINE value(signed char x) : int_value(x) {}
-+  constexpr FMT_INLINE value(unsigned char x FMT_BUILTIN) : uint_value(=
x) {}
-+  constexpr FMT_INLINE value(signed short x) : int_value(x) {}
-+  constexpr FMT_INLINE value(unsigned short x FMT_BUILTIN) : uint_value=
(x) {}
-+  constexpr FMT_INLINE value(int x) : int_value(x) {}
-+  constexpr FMT_INLINE value(unsigned x FMT_BUILTIN) : uint_value(x) {}
-+  FMT_CONSTEXPR FMT_INLINE value(long x FMT_BUILTIN) : value(long_type(=
x)) {}
-+  FMT_CONSTEXPR FMT_INLINE value(unsigned long x FMT_BUILTIN)
-+      : value(ulong_type(x)) {}
-+  constexpr FMT_INLINE value(long long x FMT_BUILTIN) : long_long_value=
(x) {}
-+  constexpr FMT_INLINE value(unsigned long long x FMT_BUILTIN)
-+      : ulong_long_value(x) {}
-+  FMT_INLINE value(int128_opt x FMT_BUILTIN) : int128_value(x) {}
-+  FMT_INLINE value(uint128_opt x FMT_BUILTIN) : uint128_value(x) {}
-+  constexpr FMT_INLINE value(bool x FMT_BUILTIN) : bool_value(x) {}
-+
-+  template <int N>
-+  constexpr FMT_INLINE value(bitint<N> x FMT_BUILTIN) : long_long_value=
(x) {
-+    static_assert(N <=3D 64, "unsupported _BitInt");
-+  }
-+  template <int N>
-+  constexpr FMT_INLINE value(ubitint<N> x FMT_BUILTIN) : ulong_long_val=
ue(x) {
-+    static_assert(N <=3D 64, "unsupported _BitInt");
-+  }
-+
-+  template <typename T, FMT_ENABLE_IF(is_char<T>::value)>
-+  constexpr FMT_INLINE value(T x FMT_BUILTIN) : char_value(x) {
-+    static_assert(
-+        std::is_same<T, char>::value || std::is_same<T, char_type>::val=
ue,
-+        "mixing character types is disallowed");
-+  }
-+
-+  constexpr FMT_INLINE value(float x FMT_BUILTIN) : float_value(x) {}
-+  constexpr FMT_INLINE value(double x FMT_BUILTIN) : double_value(x) {}
-+  FMT_INLINE value(long double x FMT_BUILTIN) : long_double_value(x) {}
-+
-+  FMT_CONSTEXPR FMT_INLINE value(char_type* x FMT_BUILTIN) {
-+    string.data =3D x;
-+    if (is_constant_evaluated()) string.size =3D 0;
-+  }
-+  FMT_CONSTEXPR FMT_INLINE value(const char_type* x FMT_BUILTIN) {
-+    string.data =3D x;
-+    if (is_constant_evaluated()) string.size =3D 0;
-+  }
-+  template <typename T, typename C =3D char_t<T>,
-+            FMT_ENABLE_IF(!std::is_pointer<T>::value)>
-+  FMT_CONSTEXPR value(const T& x FMT_BUILTIN) {
-+    static_assert(std::is_same<C, char_type>::value,
-+                  "mixing character types is disallowed");
-+    auto sv =3D to_string_view(x);
-+    string.data =3D sv.data();
-+    string.size =3D sv.size();
-+  }
-+  FMT_INLINE value(void* x FMT_BUILTIN) : pointer(x) {}
-+  FMT_INLINE value(const void* x FMT_BUILTIN) : pointer(x) {}
-+  FMT_INLINE value(volatile void* x FMT_BUILTIN)
-+      : pointer(const_cast<const void*>(x)) {}
-+  FMT_INLINE value(const volatile void* x FMT_BUILTIN)
-+      : pointer(const_cast<const void*>(x)) {}
-+  FMT_INLINE value(nullptr_t) : pointer(nullptr) {}
-+
-+  template <typename T, FMT_ENABLE_IF(std::is_pointer<T>::value ||
-+                                      std::is_member_pointer<T>::value)=
>
-+  value(const T&) {
-+    // Formatting of arbitrary pointers is disallowed. If you want to f=
ormat a
-+    // pointer cast it to `void*` or `const void*`. In particular, this=
 forbids
-+    // formatting of `[const] volatile char*` printed as bool by iostre=
ams.
-+    static_assert(sizeof(T) =3D=3D 0,
-+                  "formatting of non-void pointers is disallowed");
-+  }
-+
-+  template <typename T, FMT_ENABLE_IF(use_format_as<T>::value)>
-+  value(const T& x) : value(format_as(x)) {}
-+  template <typename T, FMT_ENABLE_IF(use_format_as_member<T>::value)>
-+  value(const T& x) : value(formatter<T>::format_as(x)) {}
-+
-+  template <typename T, FMT_ENABLE_IF(is_named_arg<T>::value)>
-+  value(const T& named_arg) : value(named_arg.value) {}
-+
-+  template <typename T,
-+            FMT_ENABLE_IF(use_formatter<T>::value || !FMT_BUILTIN_TYPES=
)>
-+  FMT_CONSTEXPR20 FMT_INLINE value(T& x) : value(x, custom_tag()) {}
-+
-+  FMT_ALWAYS_INLINE value(const named_arg_info<char_type>* args, size_t=
 size)
-+      : named_args{args, size} {}
-+
-+ private:
-+  template <typename T, FMT_ENABLE_IF(has_formatter<T, char_type>())>
-+  FMT_CONSTEXPR value(T& x, custom_tag) {
-+    using value_type =3D remove_const_t<T>;
-+    // T may overload operator& e.g. std::vector<bool>::reference in li=
bc++.
-+    if (!is_constant_evaluated()) {
-+      custom.value =3D
-+          const_cast<char*>(&reinterpret_cast<const volatile char&>(x))=
;
-+    } else {
-+      custom.value =3D nullptr;
-+#if defined(__cpp_if_constexpr)
-+      if constexpr (std::is_same<decltype(&x), remove_reference_t<T>*>:=
:value)
-+        custom.value =3D const_cast<value_type*>(&x);
-+#endif
-+    }
-+    custom.format =3D format_custom<value_type, formatter<value_type, c=
har_type>>;
-+  }
-+
-+  template <typename T, FMT_ENABLE_IF(!has_formatter<T, char_type>())>
-+  FMT_CONSTEXPR value(const T&, custom_tag) {
-+    // Cannot format an argument; to make type T formattable provide a
-+    // formatter<T> specialization: https://fmt.dev/latest/api.html#udt=
.
-+    type_is_unformattable_for<T, char_type> _;
-+  }
-+
-+  // Formats an argument of a custom type, such as a user-defined class=
.
-+  template <typename T, typename Formatter>
-+  static void format_custom(void* arg, parse_context<char_type>& parse_=
ctx,
-+                            Context& ctx) {
-+    auto f =3D Formatter();
-+    parse_ctx.advance_to(f.parse(parse_ctx));
-+    using qualified_type =3D
-+        conditional_t<has_formatter<const T, char_type>(), const T, T>;
-+    // format must be const for compatibility with std::format and comp=
ilation.
-+    const auto& cf =3D f;
-+    ctx.advance_to(cf.format(*static_cast<qualified_type*>(arg), ctx));
-+  }
-+};
-+
-+enum { packed_arg_bits =3D 4 };
-+// Maximum number of arguments with packed types.
-+enum { max_packed_args =3D 62 / packed_arg_bits };
-+enum : unsigned long long { is_unpacked_bit =3D 1ULL << 63 };
-+enum : unsigned long long { has_named_args_bit =3D 1ULL << 62 };
-+
-+template <typename It, typename T, typename Enable =3D void>
-+struct is_output_iterator : std::false_type {};
-+
-+template <> struct is_output_iterator<appender, char> : std::true_type =
{};
-+
-+template <typename It, typename T>
-+struct is_output_iterator<
-+    It, T,
-+    enable_if_t<std::is_assignable<decltype(*std::declval<decay_t<It>&>=
()++),
-+                                   T>::value>> : std::true_type {};
-+
-+#ifndef FMT_USE_LOCALE
-+#  define FMT_USE_LOCALE (FMT_OPTIMIZE_SIZE <=3D 1)
-+#endif
-+
-+// A type-erased reference to an std::locale to avoid a heavy <locale> =
include.
-+class locale_ref {
-+#if FMT_USE_LOCALE
-+ private:
-+  const void* locale_;  // A type-erased pointer to std::locale.
-+
-+ public:
-+  constexpr locale_ref() : locale_(nullptr) {}
-+  template <typename Locale> locale_ref(const Locale& loc);
-+
-+  inline explicit operator bool() const noexcept { return locale_ !=3D =
nullptr; }
-+#endif  // FMT_USE_LOCALE
-+
-+ public:
-+  template <typename Locale> auto get() const -> Locale;
-+};
-+
-+template <typename> constexpr auto encode_types() -> unsigned long long=
 {
-+  return 0;
-+}
-+
-+template <typename Context, typename Arg, typename... Args>
-+constexpr auto encode_types() -> unsigned long long {
-+  return static_cast<unsigned>(stored_type_constant<Arg, Context>::valu=
e) |
-+         (encode_types<Context, Args...>() << packed_arg_bits);
-+}
-+
-+template <typename Context, typename... T, size_t NUM_ARGS =3D sizeof..=
.(T)>
-+constexpr auto make_descriptor() -> unsigned long long {
-+  return NUM_ARGS <=3D max_packed_args ? encode_types<Context, T...>()
-+                                     : is_unpacked_bit | NUM_ARGS;
-+}
-+
-+template <typename Context, int NUM_ARGS>
-+using arg_t =3D conditional_t<NUM_ARGS <=3D max_packed_args, value<Cont=
ext>,
-+                            basic_format_arg<Context>>;
-+
-+template <typename Context, int NUM_ARGS, int NUM_NAMED_ARGS,
-+          unsigned long long DESC>
-+struct named_arg_store {
-+  // args_[0].named_args points to named_args to avoid bloating format_=
args.
-+  arg_t<Context, NUM_ARGS> args[1 + NUM_ARGS];
-+  named_arg_info<typename Context::char_type> named_args[NUM_NAMED_ARGS=
];
-+
-+  template <typename... T>
-+  FMT_CONSTEXPR FMT_ALWAYS_INLINE named_arg_store(T&... values)
-+      : args{{named_args, NUM_NAMED_ARGS}, values...} {
-+    int arg_index =3D 0, named_arg_index =3D 0;
-+    FMT_APPLY_VARIADIC(
-+        init_named_arg(named_args, arg_index, named_arg_index, values))=
;
-+  }
-+
-+  named_arg_store(named_arg_store&& rhs) {
-+    args[0] =3D {named_args, NUM_NAMED_ARGS};
-+    for (size_t i =3D 1; i < sizeof(args) / sizeof(*args); ++i)
-+      args[i] =3D rhs.args[i];
-+    for (size_t i =3D 0; i < NUM_NAMED_ARGS; ++i)
-+      named_args[i] =3D rhs.named_args[i];
-+  }
-+
-+  named_arg_store(const named_arg_store& rhs) =3D delete;
-+  named_arg_store& operator=3D(const named_arg_store& rhs) =3D delete;
-+  named_arg_store& operator=3D(named_arg_store&& rhs) =3D delete;
-+  operator const arg_t<Context, NUM_ARGS>*() const { return args + 1; }
-+};
-+
-+// An array of references to arguments. It can be implicitly converted =
to
-+// `basic_format_args` for passing into type-erased formatting function=
s
-+// such as `vformat`. It is a plain struct to reduce binary size in deb=
ug mode.
-+template <typename Context, int NUM_ARGS, int NUM_NAMED_ARGS,
-+          unsigned long long DESC>
-+struct format_arg_store {
-+  // +1 to workaround a bug in gcc 7.5 that causes duplicated-branches =
warning.
-+  using type =3D
-+      conditional_t<NUM_NAMED_ARGS =3D=3D 0,
-+                    arg_t<Context, NUM_ARGS>[max_of(1, NUM_ARGS)],
-+                    named_arg_store<Context, NUM_ARGS, NUM_NAMED_ARGS, =
DESC>>;
-+  type args;
-+};
-+
-+// TYPE can be different from type_constant<T>, e.g. for __float128.
-+template <typename T, typename Char, type TYPE> struct native_formatter=
 {
-+ private:
-+  dynamic_format_specs<Char> specs_;
-+
-+ public:
-+  using nonlocking =3D void;
-+
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    if (ctx.begin() =3D=3D ctx.end() || *ctx.begin() =3D=3D '}') return=
 ctx.begin();
-+    auto end =3D parse_format_specs(ctx.begin(), ctx.end(), specs_, ctx=
, TYPE);
-+    if (const_check(TYPE =3D=3D type::char_type)) check_char_specs(spec=
s_);
-+    return end;
-+  }
-+
-+  template <type U =3D TYPE,
-+            FMT_ENABLE_IF(U =3D=3D type::string_type || U =3D=3D type::=
cstring_type ||
-+                          U =3D=3D type::char_type)>
-+  FMT_CONSTEXPR void set_debug_format(bool set =3D true) {
-+    specs_.set_type(set ? presentation_type::debug : presentation_type:=
:none);
-+  }
-+
-+  FMT_PRAGMA_CLANG(diagnostic ignored "-Wundefined-inline")
-+  template <typename FormatContext>
-+  FMT_CONSTEXPR auto format(const T& val, FormatContext& ctx) const
-+      -> decltype(ctx.out());
-+};
-+
-+template <typename T, typename Enable =3D void>
-+struct locking
-+    : bool_constant<mapped_type_constant<T>::value =3D=3D type::custom_=
type> {};
-+template <typename T>
-+struct locking<T, void_t<typename formatter<remove_cvref_t<T>>::nonlock=
ing>>
-+    : std::false_type {};
-+
-+template <typename T =3D int> FMT_CONSTEXPR inline auto is_locking() ->=
 bool {
-+  return locking<T>::value;
-+}
-+template <typename T1, typename T2, typename... Tail>
-+FMT_CONSTEXPR inline auto is_locking() -> bool {
-+  return locking<T1>::value || is_locking<T2, Tail...>();
-+}
-+
-+FMT_API void vformat_to(buffer<char>& buf, string_view fmt, format_args=
 args,
-+                        locale_ref loc =3D {});
-+
-+#if FMT_WIN32
-+FMT_API void vprint_mojibake(FILE*, string_view, format_args, bool);
-+#else  // format_args is passed by reference since it is defined later.
-+inline void vprint_mojibake(FILE*, string_view, const format_args&, boo=
l) {}
-+#endif
-+}  // namespace detail
-+
-+// The main public API.
-+
-+template <typename Char>
-+FMT_CONSTEXPR void parse_context<Char>::do_check_arg_id(int arg_id) {
-+  // Argument id is only checked at compile time during parsing because
-+  // formatting has its own validation.
-+  if (detail::is_constant_evaluated() && use_constexpr_cast) {
-+    auto ctx =3D static_cast<detail::compile_parse_context<Char>*>(this=
);
-+    if (arg_id >=3D ctx->num_args()) report_error("argument not found")=
;
-+  }
-+}
-+
-+template <typename Char>
-+FMT_CONSTEXPR void parse_context<Char>::check_dynamic_spec(int arg_id) =
{
-+  using detail::compile_parse_context;
-+  if (detail::is_constant_evaluated() && use_constexpr_cast)
-+    static_cast<compile_parse_context<Char>*>(this)->check_dynamic_spec=
(arg_id);
-+}
-+
-+FMT_BEGIN_EXPORT
-+
-+// An output iterator that appends to a buffer. It is used instead of
-+// back_insert_iterator to reduce symbol sizes and avoid <iterator> dep=
endency.
-+template <typename T> class basic_appender {
-+ protected:
-+  detail::buffer<T>* container;
-+
-+ public:
-+  using container_type =3D detail::buffer<T>;
-+
-+  FMT_CONSTEXPR basic_appender(detail::buffer<T>& buf) : container(&buf=
) {}
-+
-+  FMT_CONSTEXPR20 auto operator=3D(T c) -> basic_appender& {
-+    container->push_back(c);
-+    return *this;
-+  }
-+  FMT_CONSTEXPR20 auto operator*() -> basic_appender& { return *this; }
-+  FMT_CONSTEXPR20 auto operator++() -> basic_appender& { return *this; =
}
-+  FMT_CONSTEXPR20 auto operator++(int) -> basic_appender { return *this=
; }
-+};
-+
-+// A formatting argument. Context is a template parameter for the compi=
led API
-+// where output can be unbuffered.
-+template <typename Context> class basic_format_arg {
-+ private:
-+  detail::value<Context> value_;
-+  detail::type type_;
-+
-+  friend class basic_format_args<Context>;
-+
-+  using char_type =3D typename Context::char_type;
-+
-+ public:
-+  class handle {
-+   private:
-+    detail::custom_value<Context> custom_;
-+
-+   public:
-+    explicit handle(detail::custom_value<Context> custom) : custom_(cus=
tom) {}
-+
-+    void format(parse_context<char_type>& parse_ctx, Context& ctx) cons=
t {
-+      custom_.format(custom_.value, parse_ctx, ctx);
-+    }
-+  };
-+
-+  constexpr basic_format_arg() : type_(detail::type::none_type) {}
-+  basic_format_arg(const detail::named_arg_info<char_type>* args, size_=
t size)
-+      : value_(args, size) {}
-+  template <typename T>
-+  basic_format_arg(T&& val)
-+      : value_(val), type_(detail::stored_type_constant<T, Context>::va=
lue) {}
-+
-+  constexpr explicit operator bool() const noexcept {
-+    return type_ !=3D detail::type::none_type;
-+  }
-+  auto type() const -> detail::type { return type_; }
-+
-+  /**
-+   * Visits an argument dispatching to the appropriate visit method bas=
ed on
-+   * the argument type. For example, if the argument type is `double` t=
hen
-+   * `vis(value)` will be called with the value of type `double`.
-+   */
-+  template <typename Visitor>
-+  FMT_CONSTEXPR FMT_INLINE auto visit(Visitor&& vis) const -> decltype(=
vis(0)) {
-+    using detail::map;
-+    switch (type_) {
-+    case detail::type::none_type:        break;
-+    case detail::type::int_type:         return vis(value_.int_value);
-+    case detail::type::uint_type:        return vis(value_.uint_value);
-+    case detail::type::long_long_type:   return vis(value_.long_long_va=
lue);
-+    case detail::type::ulong_long_type:  return vis(value_.ulong_long_v=
alue);
-+    case detail::type::int128_type:      return vis(map(value_.int128_v=
alue));
-+    case detail::type::uint128_type:     return vis(map(value_.uint128_=
value));
-+    case detail::type::bool_type:        return vis(value_.bool_value);
-+    case detail::type::char_type:        return vis(value_.char_value);
-+    case detail::type::float_type:       return vis(value_.float_value)=
;
-+    case detail::type::double_type:      return vis(value_.double_value=
);
-+    case detail::type::long_double_type: return vis(value_.long_double_=
value);
-+    case detail::type::cstring_type:     return vis(value_.string.data)=
;
-+    case detail::type::string_type:      return vis(value_.string.str()=
);
-+    case detail::type::pointer_type:     return vis(value_.pointer);
-+    case detail::type::custom_type:      return vis(handle(value_.custo=
m));
-+    }
-+    return vis(monostate());
-+  }
-+
-+  auto format_custom(const char_type* parse_begin,
-+                     parse_context<char_type>& parse_ctx, Context& ctx)
-+      -> bool {
-+    if (type_ !=3D detail::type::custom_type) return false;
-+    parse_ctx.advance_to(parse_begin);
-+    value_.custom.format(value_.custom.value, parse_ctx, ctx);
-+    return true;
-+  }
-+};
-+
-+/**
-+ * A view of a collection of formatting arguments. To avoid lifetime is=
sues it
-+ * should only be used as a parameter type in type-erased functions suc=
h as
-+ * `vformat`:
-+ *
-+ *     void vlog(fmt::string_view fmt, fmt::format_args args);  // OK
-+ *     fmt::format_args args =3D fmt::make_format_args();  // Dangling =
reference
-+ */
-+template <typename Context> class basic_format_args {
-+ private:
-+  // A descriptor that contains information about formatting arguments.
-+  // If the number of arguments is less or equal to max_packed_args the=
n
-+  // argument types are passed in the descriptor. This reduces binary c=
ode size
-+  // per formatting function call.
-+  unsigned long long desc_;
-+  union {
-+    // If is_packed() returns true then argument values are stored in v=
alues_;
-+    // otherwise they are stored in args_. This is done to improve cach=
e
-+    // locality and reduce compiled code size since storing larger obje=
cts
-+    // may require more code (at least on x86-64) even if the same amou=
nt of
-+    // data is actually copied to stack. It saves ~10% on the bloat tes=
t.
-+    const detail::value<Context>* values_;
-+    const basic_format_arg<Context>* args_;
-+  };
-+
-+  constexpr auto is_packed() const -> bool {
-+    return (desc_ & detail::is_unpacked_bit) =3D=3D 0;
-+  }
-+  constexpr auto has_named_args() const -> bool {
-+    return (desc_ & detail::has_named_args_bit) !=3D 0;
-+  }
-+
-+  FMT_CONSTEXPR auto type(int index) const -> detail::type {
-+    int shift =3D index * detail::packed_arg_bits;
-+    unsigned mask =3D (1 << detail::packed_arg_bits) - 1;
-+    return static_cast<detail::type>((desc_ >> shift) & mask);
-+  }
-+
-+  template <int NUM_ARGS, int NUM_NAMED_ARGS, unsigned long long DESC>
-+  using store =3D
-+      detail::format_arg_store<Context, NUM_ARGS, NUM_NAMED_ARGS, DESC>=
;
-+
-+ public:
-+  using format_arg =3D basic_format_arg<Context>;
-+
-+  constexpr basic_format_args() : desc_(0), args_(nullptr) {}
-+
-+  /// Constructs a `basic_format_args` object from `format_arg_store`.
-+  template <int NUM_ARGS, int NUM_NAMED_ARGS, unsigned long long DESC,
-+            FMT_ENABLE_IF(NUM_ARGS <=3D detail::max_packed_args)>
-+  constexpr FMT_ALWAYS_INLINE basic_format_args(
-+      const store<NUM_ARGS, NUM_NAMED_ARGS, DESC>& s)
-+      : desc_(DESC | (NUM_NAMED_ARGS !=3D 0 ? +detail::has_named_args_b=
it : 0)),
-+        values_(s.args) {}
-+
-+  template <int NUM_ARGS, int NUM_NAMED_ARGS, unsigned long long DESC,
-+            FMT_ENABLE_IF(NUM_ARGS > detail::max_packed_args)>
-+  constexpr basic_format_args(const store<NUM_ARGS, NUM_NAMED_ARGS, DES=
C>& s)
-+      : desc_(DESC | (NUM_NAMED_ARGS !=3D 0 ? +detail::has_named_args_b=
it : 0)),
-+        args_(s.args) {}
-+
-+  /// Constructs a `basic_format_args` object from a dynamic list of ar=
guments.
-+  constexpr basic_format_args(const format_arg* args, int count,
-+                              bool has_named =3D false)
-+      : desc_(detail::is_unpacked_bit | detail::to_unsigned(count) |
-+              (has_named ? +detail::has_named_args_bit : 0)),
-+        args_(args) {}
-+
-+  /// Returns the argument with the specified id.
-+  FMT_CONSTEXPR auto get(int id) const -> format_arg {
-+    auto arg =3D format_arg();
-+    if (!is_packed()) {
-+      if (id < max_size()) arg =3D args_[id];
-+      return arg;
-+    }
-+    if (static_cast<unsigned>(id) >=3D detail::max_packed_args) return =
arg;
-+    arg.type_ =3D type(id);
-+    if (arg.type_ !=3D detail::type::none_type) arg.value_ =3D values_[=
id];
-+    return arg;
-+  }
-+
-+  template <typename Char>
-+  auto get(basic_string_view<Char> name) const -> format_arg {
-+    int id =3D get_id(name);
-+    return id >=3D 0 ? get(id) : format_arg();
-+  }
-+
-+  template <typename Char>
-+  FMT_CONSTEXPR auto get_id(basic_string_view<Char> name) const -> int =
{
-+    if (!has_named_args()) return -1;
-+    const auto& named_args =3D
-+        (is_packed() ? values_[-1] : args_[-1].value_).named_args;
-+    for (size_t i =3D 0; i < named_args.size; ++i) {
-+      if (named_args.data[i].name =3D=3D name) return named_args.data[i=
].id;
-+    }
-+    return -1;
-+  }
-+
-+  auto max_size() const -> int {
-+    unsigned long long max_packed =3D detail::max_packed_args;
-+    return static_cast<int>(is_packed() ? max_packed
-+                                        : desc_ & ~detail::is_unpacked_=
bit);
-+  }
-+};
-+
-+// A formatting context.
-+class context {
-+ private:
-+  appender out_;
-+  format_args args_;
-+  FMT_NO_UNIQUE_ADDRESS detail::locale_ref loc_;
-+
-+ public:
-+  /// The character type for the output.
-+  using char_type =3D char;
-+
-+  using iterator =3D appender;
-+  using format_arg =3D basic_format_arg<context>;
-+  using parse_context_type FMT_DEPRECATED =3D parse_context<>;
-+  template <typename T> using formatter_type FMT_DEPRECATED =3D formatt=
er<T>;
-+  enum { builtin_types =3D FMT_BUILTIN_TYPES };
-+
-+  /// Constructs a `context` object. References to the arguments are st=
ored
-+  /// in the object so make sure they have appropriate lifetimes.
-+  FMT_CONSTEXPR context(iterator out, format_args args,
-+                        detail::locale_ref loc =3D {})
-+      : out_(out), args_(args), loc_(loc) {}
-+  context(context&&) =3D default;
-+  context(const context&) =3D delete;
-+  void operator=3D(const context&) =3D delete;
-+
-+  FMT_CONSTEXPR auto arg(int id) const -> format_arg { return args_.get=
(id); }
-+  inline auto arg(string_view name) const -> format_arg {
-+    return args_.get(name);
-+  }
-+  FMT_CONSTEXPR auto arg_id(string_view name) const -> int {
-+    return args_.get_id(name);
-+  }
-+  auto args() const -> const format_args& { return args_; }
-+
-+  // Returns an iterator to the beginning of the output range.
-+  FMT_CONSTEXPR auto out() const -> iterator { return out_; }
-+
-+  // Advances the begin iterator to `it`.
-+  FMT_CONSTEXPR void advance_to(iterator) {}
-+
-+  FMT_CONSTEXPR auto locale() const -> detail::locale_ref { return loc_=
; }
-+};
-+
-+template <typename Char =3D char> struct runtime_format_string {
-+  basic_string_view<Char> str;
-+};
-+
-+/**
-+ * Creates a runtime format string.
-+ *
-+ * **Example**:
-+ *
-+ *     // Check format string at runtime instead of compile-time.
-+ *     fmt::print(fmt::runtime("{:d}"), "I am not a number");
-+ */
-+inline auto runtime(string_view s) -> runtime_format_string<> { return =
{{s}}; }
-+
-+/// A compile-time format string. Use `format_string` in the public API=
 to
-+/// prevent type deduction.
-+template <typename... T> struct fstring {
-+ private:
-+  static constexpr int num_static_named_args =3D
-+      detail::count_static_named_args<T...>();
-+
-+  using checker =3D detail::format_string_checker<
-+      char, static_cast<int>(sizeof...(T)), num_static_named_args,
-+      num_static_named_args !=3D detail::count_named_args<T...>()>;
-+
-+  using arg_pack =3D detail::arg_pack<T...>;
-+
-+ public:
-+  string_view str;
-+  using t =3D fstring;
-+
-+  // Reports a compile-time error if S is not a valid format string for=
 T.
-+  template <size_t N>
-+  FMT_CONSTEVAL FMT_ALWAYS_INLINE fstring(const char (&s)[N]) : str(s, =
N - 1) {
-+    using namespace detail;
-+    static_assert(count<(std::is_base_of<view, remove_reference_t<T>>::=
value &&
-+                         std::is_reference<T>::value)...>() =3D=3D 0,
-+                  "passing views as lvalues is disallowed");
-+    if (FMT_USE_CONSTEVAL) parse_format_string<char>(s, checker(s, arg_=
pack()));
-+#ifdef FMT_ENFORCE_COMPILE_STRING
-+    static_assert(
-+        FMT_USE_CONSTEVAL && sizeof(s) !=3D 0,
-+        "FMT_ENFORCE_COMPILE_STRING requires format strings to use FMT_=
STRING");
-+#endif
-+  }
-+  template <typename S,
-+            FMT_ENABLE_IF(std::is_convertible<const S&, string_view>::v=
alue)>
-+  FMT_CONSTEVAL FMT_ALWAYS_INLINE fstring(const S& s) : str(s) {
-+    auto sv =3D string_view(str);
-+    if (FMT_USE_CONSTEVAL)
-+      detail::parse_format_string<char>(sv, checker(sv, arg_pack()));
-+#ifdef FMT_ENFORCE_COMPILE_STRING
-+    static_assert(
-+        FMT_USE_CONSTEVAL && sizeof(s) !=3D 0,
-+        "FMT_ENFORCE_COMPILE_STRING requires format strings to use FMT_=
STRING");
-+#endif
-+  }
-+  template <typename S,
-+            FMT_ENABLE_IF(std::is_base_of<detail::compile_string, S>::v=
alue&&
-+                              std::is_same<typename S::char_type, char>=
::value)>
-+  FMT_ALWAYS_INLINE fstring(const S&) : str(S()) {
-+    FMT_CONSTEXPR auto sv =3D string_view(S());
-+    FMT_CONSTEXPR int unused =3D
-+        (parse_format_string(sv, checker(sv, arg_pack())), 0);
-+    detail::ignore_unused(unused);
-+  }
-+  fstring(runtime_format_string<> fmt) : str(fmt.str) {}
-+
-+  // Returning by reference generates better code in debug mode.
-+  FMT_ALWAYS_INLINE operator const string_view&() const { return str; }
-+  auto get() const -> string_view { return str; }
-+};
-+
-+template <typename... T> using format_string =3D typename fstring<T...>=
::t;
-+
-+template <typename T, typename Char =3D char>
-+using is_formattable =3D bool_constant<!std::is_same<
-+    detail::mapped_t<conditional_t<std::is_void<T>::value, int*, T>, Ch=
ar>,
-+    void>::value>;
-+#ifdef __cpp_concepts
-+template <typename T, typename Char =3D char>
-+concept formattable =3D is_formattable<remove_reference_t<T>, Char>::va=
lue;
-+#endif
-+
-+template <typename T, typename Char>
-+using has_formatter FMT_DEPRECATED =3D std::is_constructible<formatter<=
T, Char>>;
-+
-+// A formatter specialization for natively supported types.
-+template <typename T, typename Char>
-+struct formatter<T, Char,
-+                 enable_if_t<detail::type_constant<T, Char>::value !=3D
-+                             detail::type::custom_type>>
-+    : detail::native_formatter<T, Char, detail::type_constant<T, Char>:=
:value> {
-+};
-+
-+/**
-+ * Constructs an object that stores references to arguments and can be
-+ * implicitly converted to `format_args`. `Context` can be omitted in w=
hich case
-+ * it defaults to `context`. See `arg` for lifetime considerations.
-+ */
-+// Take arguments by lvalue references to avoid some lifetime issues, e=
.g.
-+//   auto args =3D make_format_args(std::string());
-+template <typename Context =3D context, typename... T,
-+          int NUM_ARGS =3D sizeof...(T),
-+          int NUM_NAMED_ARGS =3D detail::count_named_args<T...>(),
-+          unsigned long long DESC =3D detail::make_descriptor<Context, =
T...>()>
-+constexpr FMT_ALWAYS_INLINE auto make_format_args(T&... args)
-+    -> detail::format_arg_store<Context, NUM_ARGS, NUM_NAMED_ARGS, DESC=
> {
-+  // Suppress warnings for pathological types convertible to detail::va=
lue.
-+  FMT_PRAGMA_GCC(diagnostic ignored "-Wconversion")
-+  return {{args...}};
-+}
-+
-+template <typename... T>
-+using vargs =3D
-+    detail::format_arg_store<context, sizeof...(T),
-+                             detail::count_named_args<T...>(),
-+                             detail::make_descriptor<context, T...>()>;
-+
-+/**
-+ * Returns a named argument to be used in a formatting function.
-+ * It should only be used in a call to a formatting function.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print("The answer is {answer}.", fmt::arg("answer", 42));
-+ */
-+template <typename Char, typename T>
-+inline auto arg(const Char* name, const T& arg) -> detail::named_arg<Ch=
ar, T> {
-+  return {name, arg};
-+}
-+
-+/// Formats a string and writes the output to `out`.
-+template <typename OutputIt,
-+          FMT_ENABLE_IF(detail::is_output_iterator<remove_cvref_t<Outpu=
tIt>,
-+                                                   char>::value)>
-+auto vformat_to(OutputIt&& out, string_view fmt, format_args args)
-+    -> remove_cvref_t<OutputIt> {
-+  auto&& buf =3D detail::get_buffer<char>(out);
-+  detail::vformat_to(buf, fmt, args, {});
-+  return detail::get_iterator(buf, out);
-+}
-+
-+/**
-+ * Formats `args` according to specifications in `fmt`, writes the resu=
lt to
-+ * the output iterator `out` and returns the iterator past the end of t=
he output
-+ * range. `format_to` does not append a terminating null character.
-+ *
-+ * **Example**:
-+ *
-+ *     auto out =3D std::vector<char>();
-+ *     fmt::format_to(std::back_inserter(out), "{}", 42);
-+ */
-+template <typename OutputIt, typename... T,
-+          FMT_ENABLE_IF(detail::is_output_iterator<remove_cvref_t<Outpu=
tIt>,
-+                                                   char>::value)>
-+FMT_INLINE auto format_to(OutputIt&& out, format_string<T...> fmt, T&&.=
.. args)
-+    -> remove_cvref_t<OutputIt> {
-+  return vformat_to(out, fmt.str, vargs<T...>{{args...}});
-+}
-+
-+template <typename OutputIt> struct format_to_n_result {
-+  /// Iterator past the end of the output range.
-+  OutputIt out;
-+  /// Total (not truncated) output size.
-+  size_t size;
-+};
-+
-+template <typename OutputIt, typename... T,
-+          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
-+auto vformat_to_n(OutputIt out, size_t n, string_view fmt, format_args =
args)
-+    -> format_to_n_result<OutputIt> {
-+  using traits =3D detail::fixed_buffer_traits;
-+  auto buf =3D detail::iterator_buffer<OutputIt, char, traits>(out, n);
-+  detail::vformat_to(buf, fmt, args, {});
-+  return {buf.out(), buf.count()};
-+}
-+
-+/**
-+ * Formats `args` according to specifications in `fmt`, writes up to `n=
`
-+ * characters of the result to the output iterator `out` and returns th=
e total
-+ * (not truncated) output size and the iterator past the end of the out=
put
-+ * range. `format_to_n` does not append a terminating null character.
-+ */
-+template <typename OutputIt, typename... T,
-+          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
-+FMT_INLINE auto format_to_n(OutputIt out, size_t n, format_string<T...>=
 fmt,
-+                            T&&... args) -> format_to_n_result<OutputIt=
> {
-+  return vformat_to_n(out, n, fmt.str, vargs<T...>{{args...}});
-+}
-+
-+struct format_to_result {
-+  /// Pointer to just after the last successful write in the array.
-+  char* out;
-+  /// Specifies if the output was truncated.
-+  bool truncated;
-+
-+  FMT_CONSTEXPR operator char*() const {
-+    // Report truncation to prevent silent data loss.
-+    if (truncated) report_error("output is truncated");
-+    return out;
-+  }
-+};
-+
-+template <size_t N>
-+auto vformat_to(char (&out)[N], string_view fmt, format_args args)
-+    -> format_to_result {
-+  auto result =3D vformat_to_n(out, N, fmt, args);
-+  return {result.out, result.size > N};
-+}
-+
-+template <size_t N, typename... T>
-+FMT_INLINE auto format_to(char (&out)[N], format_string<T...> fmt, T&&.=
.. args)
-+    -> format_to_result {
-+  auto result =3D vformat_to_n(out, N, fmt.str, vargs<T...>{{args...}})=
;
-+  return {result.out, result.size > N};
-+}
-+
-+/// Returns the number of chars in the output of `format(fmt, args...)`=
.
-+template <typename... T>
-+FMT_NODISCARD FMT_INLINE auto formatted_size(format_string<T...> fmt,
-+                                             T&&... args) -> size_t {
-+  auto buf =3D detail::counting_buffer<>();
-+  detail::vformat_to(buf, fmt.str, vargs<T...>{{args...}}, {});
-+  return buf.count();
-+}
-+
-+FMT_API void vprint(string_view fmt, format_args args);
-+FMT_API void vprint(FILE* f, string_view fmt, format_args args);
-+FMT_API void vprintln(FILE* f, string_view fmt, format_args args);
-+FMT_API void vprint_buffered(FILE* f, string_view fmt, format_args args=
);
-+
-+/**
-+ * Formats `args` according to specifications in `fmt` and writes the o=
utput
-+ * to `stdout`.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print("The answer is {}.", 42);
-+ */
-+template <typename... T>
-+FMT_INLINE void print(format_string<T...> fmt, T&&... args) {
-+  vargs<T...> va =3D {{args...}};
-+  if (detail::const_check(!detail::use_utf8))
-+    return detail::vprint_mojibake(stdout, fmt.str, va, false);
-+  return detail::is_locking<T...>() ? vprint_buffered(stdout, fmt.str, =
va)
-+                                    : vprint(fmt.str, va);
-+}
-+
-+/**
-+ * Formats `args` according to specifications in `fmt` and writes the
-+ * output to the file `f`.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print(stderr, "Don't {}!", "panic");
-+ */
-+template <typename... T>
-+FMT_INLINE void print(FILE* f, format_string<T...> fmt, T&&... args) {
-+  vargs<T...> va =3D {{args...}};
-+  if (detail::const_check(!detail::use_utf8))
-+    return detail::vprint_mojibake(f, fmt.str, va, false);
-+  return detail::is_locking<T...>() ? vprint_buffered(f, fmt.str, va)
-+                                    : vprint(f, fmt.str, va);
-+}
-+
-+/// Formats `args` according to specifications in `fmt` and writes the =
output
-+/// to the file `f` followed by a newline.
-+template <typename... T>
-+FMT_INLINE void println(FILE* f, format_string<T...> fmt, T&&... args) =
{
-+  vargs<T...> va =3D {{args...}};
-+  return detail::const_check(detail::use_utf8)
-+             ? vprintln(f, fmt.str, va)
-+             : detail::vprint_mojibake(f, fmt.str, va, true);
-+}
-+
-+/// Formats `args` according to specifications in `fmt` and writes the =
output
-+/// to `stdout` followed by a newline.
-+template <typename... T>
-+FMT_INLINE void println(format_string<T...> fmt, T&&... args) {
-+  return fmt::println(stdout, fmt, static_cast<T&&>(args)...);
-+}
-+
-+FMT_END_EXPORT
-+FMT_PRAGMA_CLANG(diagnostic pop)
-+FMT_PRAGMA_GCC(pop_options)
-+FMT_END_NAMESPACE
-+
-+#ifdef FMT_HEADER_ONLY
-+#  include "format.h"
-+#endif
-+#endif  // FMT_BASE_H_
-diff --git a/include/fmt/chrono.h b/include/fmt/chrono.h
-index 43daeeb..50c777c 100644
---- a/include/fmt/chrono.h
-+++ b/include/fmt/chrono.h
-@@ -8,51 +8,36 @@
- #ifndef FMT_CHRONO_H_
- #define FMT_CHRONO_H_
-=20
--#include <algorithm>
--#include <chrono>
--#include <cmath>    // std::isfinite
--#include <cstring>  // std::memcpy
--#include <ctime>
--#include <iterator>
--#include <locale>
--#include <ostream>
--#include <type_traits>
-+#ifndef FMT_MODULE
-+#  include <algorithm>
-+#  include <chrono>
-+#  include <cmath>    // std::isfinite
-+#  include <cstring>  // std::memcpy
-+#  include <ctime>
-+#  include <iterator>
-+#  include <locale>
-+#  include <ostream>
-+#  include <type_traits>
-+#endif
-=20
- #include "format.h"
-=20
--FMT_BEGIN_NAMESPACE
--
--// Check if std::chrono::local_t is available.
--#ifndef FMT_USE_LOCAL_TIME
--#  ifdef __cpp_lib_chrono
--#    define FMT_USE_LOCAL_TIME (__cpp_lib_chrono >=3D 201907L)
--#  else
--#    define FMT_USE_LOCAL_TIME 0
--#  endif
--#endif
-+namespace fmt_detail {
-+struct time_zone {
-+  template <typename Duration, typename T>
-+  auto to_sys(T)
-+      -> std::chrono::time_point<std::chrono::system_clock, Duration> {
-+    return {};
-+  }
-+};
-+template <typename... T> inline auto current_zone(T...) -> time_zone* {
-+  return nullptr;
-+}
-=20
--// Check if std::chrono::utc_timestamp is available.
--#ifndef FMT_USE_UTC_TIME
--#  ifdef __cpp_lib_chrono
--#    define FMT_USE_UTC_TIME (__cpp_lib_chrono >=3D 201907L)
--#  else
--#    define FMT_USE_UTC_TIME 0
--#  endif
--#endif
-+template <typename... T> inline void _tzset(T...) {}
-+}  // namespace fmt_detail
-=20
--// Enable tzset.
--#ifndef FMT_USE_TZSET
--// UWP doesn't provide _tzset.
--#  if FMT_HAS_INCLUDE("winapifamily.h")
--#    include <winapifamily.h>
--#  endif
--#  if defined(_WIN32) && (!defined(WINAPI_FAMILY) || \
--                          (WINAPI_FAMILY =3D=3D WINAPI_FAMILY_DESKTOP_A=
PP))
--#    define FMT_USE_TZSET 1
--#  else
--#    define FMT_USE_TZSET 0
--#  endif
--#endif
-+FMT_BEGIN_NAMESPACE
-=20
- // Enable safe chrono durations, unless explicitly disabled.
- #ifndef FMT_SAFE_DURATION_CAST
-@@ -72,7 +57,8 @@ template <typename To, typename From,
-           FMT_ENABLE_IF(!std::is_same<From, To>::value &&
-                         std::numeric_limits<From>::is_signed =3D=3D
-                             std::numeric_limits<To>::is_signed)>
--FMT_CONSTEXPR To lossless_integral_conversion(const From from, int& ec)=
 {
-+FMT_CONSTEXPR auto lossless_integral_conversion(const From from, int& e=
c)
-+    -> To {
-   ec =3D 0;
-   using F =3D std::numeric_limits<From>;
-   using T =3D std::numeric_limits<To>;
-@@ -93,15 +79,14 @@ FMT_CONSTEXPR To lossless_integral_conversion(const =
From from, int& ec) {
-   return static_cast<To>(from);
- }
-=20
--/**
-- * converts From to To, without loss. If the dynamic value of from
-- * can't be converted to To without loss, ec is set.
-- */
-+/// Converts From to To, without loss. If the dynamic value of from
-+/// can't be converted to To without loss, ec is set.
- template <typename To, typename From,
-           FMT_ENABLE_IF(!std::is_same<From, To>::value &&
-                         std::numeric_limits<From>::is_signed !=3D
-                             std::numeric_limits<To>::is_signed)>
--FMT_CONSTEXPR To lossless_integral_conversion(const From from, int& ec)=
 {
-+FMT_CONSTEXPR auto lossless_integral_conversion(const From from, int& e=
c)
-+    -> To {
-   ec =3D 0;
-   using F =3D std::numeric_limits<From>;
-   using T =3D std::numeric_limits<To>;
-@@ -133,7 +118,8 @@ FMT_CONSTEXPR To lossless_integral_conversion(const =
From from, int& ec) {
-=20
- template <typename To, typename From,
-           FMT_ENABLE_IF(std::is_same<From, To>::value)>
--FMT_CONSTEXPR To lossless_integral_conversion(const From from, int& ec)=
 {
-+FMT_CONSTEXPR auto lossless_integral_conversion(const From from, int& e=
c)
-+    -> To {
-   ec =3D 0;
-   return from;
- }  // function
-@@ -154,7 +140,7 @@ FMT_CONSTEXPR To lossless_integral_conversion(const =
From from, int& ec) {
- // clang-format on
- template <typename To, typename From,
-           FMT_ENABLE_IF(!std::is_same<From, To>::value)>
--FMT_CONSTEXPR To safe_float_conversion(const From from, int& ec) {
-+FMT_CONSTEXPR auto safe_float_conversion(const From from, int& ec) -> T=
o {
-   ec =3D 0;
-   using T =3D std::numeric_limits<To>;
-   static_assert(std::is_floating_point<From>::value, "From must be floa=
ting");
-@@ -176,72 +162,18 @@ FMT_CONSTEXPR To safe_float_conversion(const From =
from, int& ec) {
-=20
- template <typename To, typename From,
-           FMT_ENABLE_IF(std::is_same<From, To>::value)>
--FMT_CONSTEXPR To safe_float_conversion(const From from, int& ec) {
-+FMT_CONSTEXPR auto safe_float_conversion(const From from, int& ec) -> T=
o {
-   ec =3D 0;
-   static_assert(std::is_floating_point<From>::value, "From must be floa=
ting");
-   return from;
- }
-=20
--/**
-- * safe duration cast between integral durations
-- */
--template <typename To, typename FromRep, typename FromPeriod,
--          FMT_ENABLE_IF(std::is_integral<FromRep>::value),
--          FMT_ENABLE_IF(std::is_integral<typename To::rep>::value)>
--To safe_duration_cast(std::chrono::duration<FromRep, FromPeriod> from,
--                      int& ec) {
--  using From =3D std::chrono::duration<FromRep, FromPeriod>;
--  ec =3D 0;
--  // the basic idea is that we need to convert from count() in the from=
 type
--  // to count() in the To type, by multiplying it with this:
--  struct Factor
--      : std::ratio_divide<typename From::period, typename To::period> {=
};
--
--  static_assert(Factor::num > 0, "num must be positive");
--  static_assert(Factor::den > 0, "den must be positive");
--
--  // the conversion is like this: multiply from.count() with Factor::nu=
m
--  // /Factor::den and convert it to To::rep, all this without
--  // overflow/underflow. let's start by finding a suitable type that ca=
n hold
--  // both To, From and Factor::num
--  using IntermediateRep =3D
--      typename std::common_type<typename From::rep, typename To::rep,
--                                decltype(Factor::num)>::type;
--
--  // safe conversion to IntermediateRep
--  IntermediateRep count =3D
--      lossless_integral_conversion<IntermediateRep>(from.count(), ec);
--  if (ec) return {};
--  // multiply with Factor::num without overflow or underflow
--  if (detail::const_check(Factor::num !=3D 1)) {
--    const auto max1 =3D detail::max_value<IntermediateRep>() / Factor::=
num;
--    if (count > max1) {
--      ec =3D 1;
--      return {};
--    }
--    const auto min1 =3D
--        (std::numeric_limits<IntermediateRep>::min)() / Factor::num;
--    if (detail::const_check(!std::is_unsigned<IntermediateRep>::value) =
&&
--        count < min1) {
--      ec =3D 1;
--      return {};
--    }
--    count *=3D Factor::num;
--  }
--
--  if (detail::const_check(Factor::den !=3D 1)) count /=3D Factor::den;
--  auto tocount =3D lossless_integral_conversion<typename To::rep>(count=
, ec);
--  return ec ? To() : To(tocount);
--}
--
--/**
-- * safe duration_cast between floating point durations
-- */
-+/// Safe duration_cast between floating point durations
- template <typename To, typename FromRep, typename FromPeriod,
-           FMT_ENABLE_IF(std::is_floating_point<FromRep>::value),
-           FMT_ENABLE_IF(std::is_floating_point<typename To::rep>::value=
)>
--To safe_duration_cast(std::chrono::duration<FromRep, FromPeriod> from,
--                      int& ec) {
-+auto safe_duration_cast(std::chrono::duration<FromRep, FromPeriod> from=
,
-+                        int& ec) -> To {
-   using From =3D std::chrono::duration<FromRep, FromPeriod>;
-   ec =3D 0;
-   if (std::isnan(from.count())) {
-@@ -315,18 +247,95 @@ To safe_duration_cast(std::chrono::duration<FromRe=
p, FromPeriod> from,
- }  // namespace safe_duration_cast
- #endif
-=20
-+namespace detail {
-+
-+// Check if std::chrono::utc_time is available.
-+#ifdef FMT_USE_UTC_TIME
-+// Use the provided definition.
-+#elif defined(__cpp_lib_chrono)
-+#  define FMT_USE_UTC_TIME (__cpp_lib_chrono >=3D 201907L)
-+#else
-+#  define FMT_USE_UTC_TIME 0
-+#endif
-+#if FMT_USE_UTC_TIME
-+using utc_clock =3D std::chrono::utc_clock;
-+#else
-+struct utc_clock {
-+  template <typename T> void to_sys(T);
-+};
-+#endif
-+
-+// Check if std::chrono::local_time is available.
-+#ifdef FMT_USE_LOCAL_TIME
-+// Use the provided definition.
-+#elif defined(__cpp_lib_chrono)
-+#  define FMT_USE_LOCAL_TIME (__cpp_lib_chrono >=3D 201907L)
-+#else
-+#  define FMT_USE_LOCAL_TIME 0
-+#endif
-+#if FMT_USE_LOCAL_TIME
-+using local_t =3D std::chrono::local_t;
-+#else
-+struct local_t {};
-+#endif
-+
-+}  // namespace detail
-+
-+template <typename Duration>
-+using sys_time =3D std::chrono::time_point<std::chrono::system_clock, D=
uration>;
-+
-+template <typename Duration>
-+using utc_time =3D std::chrono::time_point<detail::utc_clock, Duration>=
;
-+
-+template <class Duration>
-+using local_time =3D std::chrono::time_point<detail::local_t, Duration>=
;
-+
-+namespace detail {
-+
- // Prevents expansion of a preceding token as a function-style macro.
- // Usage: f FMT_NOMACRO()
- #define FMT_NOMACRO
-=20
--namespace detail {
- template <typename T =3D void> struct null {};
--inline null<> localtime_r FMT_NOMACRO(...) { return null<>(); }
--inline null<> localtime_s(...) { return null<>(); }
--inline null<> gmtime_r(...) { return null<>(); }
--inline null<> gmtime_s(...) { return null<>(); }
-+inline auto localtime_r FMT_NOMACRO(...) -> null<> { return null<>(); }
-+inline auto localtime_s(...) -> null<> { return null<>(); }
-+inline auto gmtime_r(...) -> null<> { return null<>(); }
-+inline auto gmtime_s(...) -> null<> { return null<>(); }
-+
-+// It is defined here and not in ostream.h because the latter has expen=
sive
-+// includes.
-+template <typename StreamBuf> class formatbuf : public StreamBuf {
-+ private:
-+  using char_type =3D typename StreamBuf::char_type;
-+  using streamsize =3D decltype(std::declval<StreamBuf>().sputn(nullptr=
, 0));
-+  using int_type =3D typename StreamBuf::int_type;
-+  using traits_type =3D typename StreamBuf::traits_type;
-=20
--inline const std::locale& get_classic_locale() {
-+  buffer<char_type>& buffer_;
-+
-+ public:
-+  explicit formatbuf(buffer<char_type>& buf) : buffer_(buf) {}
-+
-+ protected:
-+  // The put area is always empty. This makes the implementation simple=
r and has
-+  // the advantage that the streambuf and the buffer are always in sync=
 and
-+  // sputc never writes into uninitialized memory. A disadvantage is th=
at each
-+  // call to sputc always results in a (virtual) call to overflow. Ther=
e is no
-+  // disadvantage here for sputn since this always results in a call to=
 xsputn.
-+
-+  auto overflow(int_type ch) -> int_type override {
-+    if (!traits_type::eq_int_type(ch, traits_type::eof()))
-+      buffer_.push_back(static_cast<char_type>(ch));
-+    return ch;
-+  }
-+
-+  auto xsputn(const char_type* s, streamsize count) -> streamsize overr=
ide {
-+    buffer_.append(s, s + count);
-+    return count;
-+  }
-+};
-+
-+inline auto get_classic_locale() -> const std::locale& {
-   static const auto& locale =3D std::locale::classic();
-   return locale;
- }
-@@ -336,24 +345,18 @@ template <typename CodeUnit> struct codecvt_result=
 {
-   CodeUnit buf[max_size];
-   CodeUnit* end;
- };
--template <typename CodeUnit>
--constexpr const size_t codecvt_result<CodeUnit>::max_size;
-=20
- template <typename CodeUnit>
--void write_codecvt(codecvt_result<CodeUnit>& out, string_view in_buf,
-+void write_codecvt(codecvt_result<CodeUnit>& out, string_view in,
-                    const std::locale& loc) {
--#if FMT_CLANG_VERSION
--#  pragma clang diagnostic push
--#  pragma clang diagnostic ignored "-Wdeprecated"
-+  FMT_PRAGMA_CLANG(diagnostic push)
-+  FMT_PRAGMA_CLANG(diagnostic ignored "-Wdeprecated")
-   auto& f =3D std::use_facet<std::codecvt<CodeUnit, char, std::mbstate_=
t>>(loc);
--#  pragma clang diagnostic pop
--#else
--  auto& f =3D std::use_facet<std::codecvt<CodeUnit, char, std::mbstate_=
t>>(loc);
--#endif
-+  FMT_PRAGMA_CLANG(diagnostic pop)
-   auto mb =3D std::mbstate_t();
-   const char* from_next =3D nullptr;
--  auto result =3D f.in(mb, in_buf.begin(), in_buf.end(), from_next,
--                     std::begin(out.buf), std::end(out.buf), out.end);
-+  auto result =3D f.in(mb, in.begin(), in.end(), from_next, std::begin(=
out.buf),
-+                     std::end(out.buf), out.end);
-   if (result !=3D std::codecvt_base::ok)
-     FMT_THROW(format_error("failed to format time"));
- }
-@@ -361,11 +364,12 @@ void write_codecvt(codecvt_result<CodeUnit>& out, =
string_view in_buf,
- template <typename OutputIt>
- auto write_encoded_tm_str(OutputIt out, string_view in, const std::loca=
le& loc)
-     -> OutputIt {
--  if (detail::is_utf8() && loc !=3D get_classic_locale()) {
-+  if (const_check(detail::use_utf8) && loc !=3D get_classic_locale()) {
-     // char16_t and char32_t codecvts are broken in MSVC (linkage error=
s) and
-     // gcc-4.
--#if FMT_MSC_VERSION !=3D 0 || \
--    (defined(__GLIBCXX__) && !defined(_GLIBCXX_USE_DUAL_ABI))
-+#if FMT_MSC_VERSION !=3D 0 ||  \
-+    (defined(__GLIBCXX__) && \
-+     (!defined(_GLIBCXX_USE_DUAL_ABI) || _GLIBCXX_USE_DUAL_ABI =3D=3D 0=
))
-     // The _GLIBCXX_USE_DUAL_ABI macro is always defined in libstdc++ f=
rom gcc-5
-     // and newer.
-     using code_unit =3D wchar_t;
-@@ -381,9 +385,9 @@ auto write_encoded_tm_str(OutputIt out, string_view =
in, const std::locale& loc)
-         to_utf8<code_unit, basic_memory_buffer<char, unit_t::max_size *=
 4>>();
-     if (!u.convert({unit.buf, to_unsigned(unit.end - unit.buf)}))
-       FMT_THROW(format_error("failed to format time"));
--    return copy_str<char>(u.c_str(), u.c_str() + u.size(), out);
-+    return copy<char>(u.c_str(), u.c_str() + u.size(), out);
-   }
--  return copy_str<char>(in.data(), in.data() + in.size(), out);
-+  return copy<char>(in.data(), in.data() + in.size(), out);
- }
-=20
- template <typename Char, typename OutputIt,
-@@ -392,7 +396,7 @@ auto write_tm_str(OutputIt out, string_view sv, cons=
t std::locale& loc)
-     -> OutputIt {
-   codecvt_result<Char> unit;
-   write_codecvt(unit, sv, loc);
--  return copy_str<Char>(unit.buf, unit.end, out);
-+  return copy<Char>(unit.buf, unit.end, out);
- }
-=20
- template <typename Char, typename OutputIt,
-@@ -408,8 +412,7 @@ inline void do_write(buffer<Char>& buf, const std::t=
m& time,
-   auto&& format_buf =3D formatbuf<std::basic_streambuf<Char>>(buf);
-   auto&& os =3D std::basic_ostream<Char>(&format_buf);
-   os.imbue(loc);
--  using iterator =3D std::ostreambuf_iterator<Char>;
--  const auto& facet =3D std::use_facet<std::time_put<Char, iterator>>(l=
oc);
-+  const auto& facet =3D std::use_facet<std::time_put<Char>>(loc);
-   auto end =3D facet.put(os, os, Char(' '), &time, format, modifier);
-   if (end.failed()) FMT_THROW(format_error("failed to format time"));
- }
-@@ -432,38 +435,129 @@ auto write(OutputIt out, const std::tm& time, con=
st std::locale& loc,
-   return write_encoded_tm_str(out, string_view(buf.data(), buf.size()),=
 loc);
- }
-=20
-+template <typename Rep1, typename Rep2>
-+struct is_same_arithmetic_type
-+    : public std::integral_constant<bool,
-+                                    (std::is_integral<Rep1>::value &&
-+                                     std::is_integral<Rep2>::value) ||
-+                                        (std::is_floating_point<Rep1>::=
value &&
-+                                         std::is_floating_point<Rep2>::=
value)> {
-+};
-+
-+FMT_NORETURN inline void throw_duration_error() {
-+  FMT_THROW(format_error("cannot format duration"));
-+}
-+
-+// Cast one integral duration to another with an overflow check.
-+template <typename To, typename FromRep, typename FromPeriod,
-+          FMT_ENABLE_IF(std::is_integral<FromRep>::value&&
-+                            std::is_integral<typename To::rep>::value)>
-+auto duration_cast(std::chrono::duration<FromRep, FromPeriod> from) -> =
To {
-+#if !FMT_SAFE_DURATION_CAST
-+  return std::chrono::duration_cast<To>(from);
-+#else
-+  // The conversion factor: to.count() =3D=3D factor * from.count().
-+  using factor =3D std::ratio_divide<FromPeriod, typename To::period>;
-+
-+  using common_rep =3D typename std::common_type<FromRep, typename To::=
rep,
-+                                               decltype(factor::num)>::=
type;
-+
-+  int ec =3D 0;
-+  auto count =3D safe_duration_cast::lossless_integral_conversion<commo=
n_rep>(
-+      from.count(), ec);
-+  if (ec) throw_duration_error();
-+
-+  // Multiply from.count() by factor and check for overflow.
-+  if (const_check(factor::num !=3D 1)) {
-+    if (count > max_value<common_rep>() / factor::num) throw_duration_e=
rror();
-+    const auto min =3D (std::numeric_limits<common_rep>::min)() / facto=
r::num;
-+    if (const_check(!std::is_unsigned<common_rep>::value) && count < mi=
n)
-+      throw_duration_error();
-+    count *=3D factor::num;
-+  }
-+  if (const_check(factor::den !=3D 1)) count /=3D factor::den;
-+  auto to =3D
-+      To(safe_duration_cast::lossless_integral_conversion<typename To::=
rep>(
-+          count, ec));
-+  if (ec) throw_duration_error();
-+  return to;
-+#endif
-+}
-+
-+template <typename To, typename FromRep, typename FromPeriod,
-+          FMT_ENABLE_IF(std::is_floating_point<FromRep>::value&&
-+                            std::is_floating_point<typename To::rep>::v=
alue)>
-+auto duration_cast(std::chrono::duration<FromRep, FromPeriod> from) -> =
To {
-+#if FMT_SAFE_DURATION_CAST
-+  // Throwing version of safe_duration_cast is only available for
-+  // integer to integer or float to float casts.
-+  int ec;
-+  To to =3D safe_duration_cast::safe_duration_cast<To>(from, ec);
-+  if (ec) throw_duration_error();
-+  return to;
-+#else
-+  // Standard duration cast, may overflow.
-+  return std::chrono::duration_cast<To>(from);
-+#endif
-+}
-+
-+template <
-+    typename To, typename FromRep, typename FromPeriod,
-+    FMT_ENABLE_IF(!is_same_arithmetic_type<FromRep, typename To::rep>::=
value)>
-+auto duration_cast(std::chrono::duration<FromRep, FromPeriod> from) -> =
To {
-+  // Mixed integer <-> float cast is not supported by safe_duration_cas=
t.
-+  return std::chrono::duration_cast<To>(from);
-+}
-+
-+template <typename Duration>
-+auto to_time_t(sys_time<Duration> time_point) -> std::time_t {
-+  // Cannot use std::chrono::system_clock::to_time_t since this would f=
irst
-+  // require a cast to std::chrono::system_clock::time_point, which cou=
ld
-+  // overflow.
-+  return detail::duration_cast<std::chrono::duration<std::time_t>>(
-+             time_point.time_since_epoch())
-+      .count();
-+}
-+
-+// Workaround a bug in libstdc++ which sets __cpp_lib_chrono to 201907 =
without
-+// providing current_zone(): https://github.com/fmtlib/fmt/issues/4160.
-+template <typename T> FMT_CONSTEXPR auto has_current_zone() -> bool {
-+  using namespace std::chrono;
-+  using namespace fmt_detail;
-+  return !std::is_same<decltype(current_zone()), fmt_detail::time_zone*=
>::value;
-+}
- }  // namespace detail
-=20
- FMT_BEGIN_EXPORT
-=20
- /**
--  Converts given time since epoch as ``std::time_t`` value into calenda=
r time,
--  expressed in local time. Unlike ``std::localtime``, this function is
--  thread-safe on most platforms.
-+ * Converts given time since epoch as `std::time_t` value into calendar=
 time,
-+ * expressed in local time. Unlike `std::localtime`, this function is
-+ * thread-safe on most platforms.
-  */
--inline std::tm localtime(std::time_t time) {
-+inline auto localtime(std::time_t time) -> std::tm {
-   struct dispatcher {
-     std::time_t time_;
-     std::tm tm_;
-=20
--    dispatcher(std::time_t t) : time_(t) {}
-+    inline dispatcher(std::time_t t) : time_(t) {}
-=20
--    bool run() {
-+    inline auto run() -> bool {
-       using namespace fmt::detail;
-       return handle(localtime_r(&time_, &tm_));
-     }
-=20
--    bool handle(std::tm* tm) { return tm !=3D nullptr; }
-+    inline auto handle(std::tm* tm) -> bool { return tm !=3D nullptr; }
-=20
--    bool handle(detail::null<>) {
-+    inline auto handle(detail::null<>) -> bool {
-       using namespace fmt::detail;
-       return fallback(localtime_s(&tm_, &time_));
-     }
-=20
--    bool fallback(int res) { return res =3D=3D 0; }
-+    inline auto fallback(int res) -> bool { return res =3D=3D 0; }
-=20
- #if !FMT_MSC_VERSION
--    bool fallback(detail::null<>) {
-+    inline auto fallback(detail::null<>) -> bool {
-       using namespace fmt::detail;
-       std::tm* tm =3D std::localtime(&time_);
-       if (tm) tm_ =3D *tm;
-@@ -478,102 +572,61 @@ inline std::tm localtime(std::time_t time) {
- }
-=20
- #if FMT_USE_LOCAL_TIME
--template <typename Duration>
-+template <typename Duration,
-+          FMT_ENABLE_IF(detail::has_current_zone<Duration>())>
- inline auto localtime(std::chrono::local_time<Duration> time) -> std::t=
m {
--  return localtime(std::chrono::system_clock::to_time_t(
--      std::chrono::current_zone()->to_sys(time)));
-+  using namespace std::chrono;
-+  using namespace fmt_detail;
-+  return localtime(detail::to_time_t(current_zone()->to_sys<Duration>(t=
ime)));
- }
- #endif
-=20
- /**
--  Converts given time since epoch as ``std::time_t`` value into calenda=
r time,
--  expressed in Coordinated Universal Time (UTC). Unlike ``std::gmtime``=
, this
--  function is thread-safe on most platforms.
-+ * Converts given time since epoch as `std::time_t` value into calendar=
 time,
-+ * expressed in Coordinated Universal Time (UTC). Unlike `std::gmtime`,=
 this
-+ * function is thread-safe on most platforms.
-  */
--inline std::tm gmtime(std::time_t time) {
-+inline auto gmtime(std::time_t time) -> std::tm {
-   struct dispatcher {
-     std::time_t time_;
-     std::tm tm_;
-=20
--    dispatcher(std::time_t t) : time_(t) {}
-+    inline dispatcher(std::time_t t) : time_(t) {}
-=20
--    bool run() {
-+    inline auto run() -> bool {
-       using namespace fmt::detail;
-       return handle(gmtime_r(&time_, &tm_));
-     }
-=20
--    bool handle(std::tm* tm) { return tm !=3D nullptr; }
-+    inline auto handle(std::tm* tm) -> bool { return tm !=3D nullptr; }
-=20
--    bool handle(detail::null<>) {
-+    inline auto handle(detail::null<>) -> bool {
-       using namespace fmt::detail;
-       return fallback(gmtime_s(&tm_, &time_));
-     }
-=20
--    bool fallback(int res) { return res =3D=3D 0; }
-+    inline auto fallback(int res) -> bool { return res =3D=3D 0; }
-=20
- #if !FMT_MSC_VERSION
--    bool fallback(detail::null<>) {
-+    inline auto fallback(detail::null<>) -> bool {
-       std::tm* tm =3D std::gmtime(&time_);
-       if (tm) tm_ =3D *tm;
-       return tm !=3D nullptr;
-     }
- #endif
-   };
--  dispatcher gt(time);
-+  auto gt =3D dispatcher(time);
-   // Too big time values may be unsupported.
-   if (!gt.run()) FMT_THROW(format_error("time_t value out of range"));
-   return gt.tm_;
- }
-=20
--inline std::tm gmtime(
--    std::chrono::time_point<std::chrono::system_clock> time_point) {
--  return gmtime(std::chrono::system_clock::to_time_t(time_point));
-+template <typename Duration>
-+inline auto gmtime(sys_time<Duration> time_point) -> std::tm {
-+  return gmtime(detail::to_time_t(time_point));
- }
-=20
--FMT_BEGIN_DETAIL_NAMESPACE
--
--// DEPRECATED!
--template <typename Char>
--FMT_CONSTEXPR auto parse_align(const Char* begin, const Char* end,
--                               format_specs<Char>& specs) -> const Char=
* {
--  FMT_ASSERT(begin !=3D end, "");
--  auto align =3D align::none;
--  auto p =3D begin + code_point_length(begin);
--  if (end - p <=3D 0) p =3D begin;
--  for (;;) {
--    switch (to_ascii(*p)) {
--    case '<':
--      align =3D align::left;
--      break;
--    case '>':
--      align =3D align::right;
--      break;
--    case '^':
--      align =3D align::center;
--      break;
--    }
--    if (align !=3D align::none) {
--      if (p !=3D begin) {
--        auto c =3D *begin;
--        if (c =3D=3D '}') return begin;
--        if (c =3D=3D '{') {
--          throw_format_error("invalid fill character '{'");
--          return begin;
--        }
--        specs.fill =3D {begin, to_unsigned(p - begin)};
--        begin =3D p + 1;
--      } else {
--        ++begin;
--      }
--      break;
--    } else if (p =3D=3D begin) {
--      break;
--    }
--    p =3D begin;
--  }
--  specs.align =3D align;
--  return begin;
--}
-+namespace detail {
-=20
- // Writes two-digit numbers a, b and c separated by sep to buf.
- // The method by Pavel Novikov based on
-@@ -609,12 +662,14 @@ inline void write_digit2_separated(char* buf, unsi=
gned a, unsigned b,
-   }
- }
-=20
--template <typename Period> FMT_CONSTEXPR inline const char* get_units()=
 {
-+template <typename Period>
-+FMT_CONSTEXPR inline auto get_units() -> const char* {
-   if (std::is_same<Period, std::atto>::value) return "as";
-   if (std::is_same<Period, std::femto>::value) return "fs";
-   if (std::is_same<Period, std::pico>::value) return "ps";
-   if (std::is_same<Period, std::nano>::value) return "ns";
--  if (std::is_same<Period, std::micro>::value) return "=C2=B5s";
-+  if (std::is_same<Period, std::micro>::value)
-+    return detail::use_utf8 ? "=C2=B5s" : "us";
-   if (std::is_same<Period, std::milli>::value) return "ms";
-   if (std::is_same<Period, std::centi>::value) return "cs";
-   if (std::is_same<Period, std::deci>::value) return "ds";
-@@ -627,8 +682,9 @@ template <typename Period> FMT_CONSTEXPR inline cons=
t char* get_units() {
-   if (std::is_same<Period, std::tera>::value) return "Ts";
-   if (std::is_same<Period, std::peta>::value) return "Ps";
-   if (std::is_same<Period, std::exa>::value) return "Es";
--  if (std::is_same<Period, std::ratio<60>>::value) return "m";
-+  if (std::is_same<Period, std::ratio<60>>::value) return "min";
-   if (std::is_same<Period, std::ratio<3600>>::value) return "h";
-+  if (std::is_same<Period, std::ratio<86400>>::value) return "d";
-   return nullptr;
- }
-=20
-@@ -640,12 +696,10 @@ enum class numeric_system {
-=20
- // Glibc extensions for formatting numeric values.
- enum class pad_type {
--  unspecified,
-+  // Pad a numeric result string with zeros (the default).
-+  zero,
-   // Do not pad a numeric result string.
-   none,
--  // Pad a numeric result string with zeros even if the conversion spec=
ifier
--  // character uses space-padding by default.
--  zero,
-   // Pad a numeric result string with spaces.
-   space,
- };
-@@ -653,7 +707,7 @@ enum class pad_type {
- template <typename OutputIt>
- auto write_padding(OutputIt out, pad_type pad, int width) -> OutputIt {
-   if (pad =3D=3D pad_type::none) return out;
--  return std::fill_n(out, width, pad =3D=3D pad_type::space ? ' ' : '0'=
);
-+  return detail::fill_n(out, width, pad =3D=3D pad_type::space ? ' ' : =
'0');
- }
-=20
- template <typename OutputIt>
-@@ -664,14 +718,13 @@ auto write_padding(OutputIt out, pad_type pad) -> =
OutputIt {
-=20
- // Parses a put_time-like format string and invokes handler actions.
- template <typename Char, typename Handler>
--FMT_CONSTEXPR const Char* parse_chrono_format(const Char* begin,
--                                              const Char* end,
--                                              Handler&& handler) {
-+FMT_CONSTEXPR auto parse_chrono_format(const Char* begin, const Char* e=
nd,
-+                                       Handler&& handler) -> const Char=
* {
-   if (begin =3D=3D end || *begin =3D=3D '}') return begin;
-   if (*begin !=3D '%') FMT_THROW(format_error("invalid format"));
-   auto ptr =3D begin;
--  pad_type pad =3D pad_type::unspecified;
-   while (ptr !=3D end) {
-+    pad_type pad =3D pad_type::zero;
-     auto c =3D *ptr;
-     if (c =3D=3D '}') break;
-     if (c !=3D '%') {
-@@ -691,17 +744,11 @@ FMT_CONSTEXPR const Char* parse_chrono_format(cons=
t Char* begin,
-       pad =3D pad_type::none;
-       ++ptr;
-       break;
--    case '0':
--      pad =3D pad_type::zero;
--      ++ptr;
--      break;
-     }
-     if (ptr =3D=3D end) FMT_THROW(format_error("invalid format"));
-     c =3D *ptr++;
-     switch (c) {
--    case '%':
--      handler.on_text(ptr - 1, ptr);
--      break;
-+    case '%': handler.on_text(ptr - 1, ptr); break;
-     case 'n': {
-       const Char newline[] =3D {'\n'};
-       handler.on_text(newline, newline + 1);
-@@ -713,145 +760,66 @@ FMT_CONSTEXPR const Char* parse_chrono_format(con=
st Char* begin,
-       break;
-     }
-     // Year:
--    case 'Y':
--      handler.on_year(numeric_system::standard);
--      break;
--    case 'y':
--      handler.on_short_year(numeric_system::standard);
--      break;
--    case 'C':
--      handler.on_century(numeric_system::standard);
--      break;
--    case 'G':
--      handler.on_iso_week_based_year();
--      break;
--    case 'g':
--      handler.on_iso_week_based_short_year();
--      break;
-+    case 'Y': handler.on_year(numeric_system::standard, pad); break;
-+    case 'y': handler.on_short_year(numeric_system::standard); break;
-+    case 'C': handler.on_century(numeric_system::standard); break;
-+    case 'G': handler.on_iso_week_based_year(); break;
-+    case 'g': handler.on_iso_week_based_short_year(); break;
-     // Day of the week:
--    case 'a':
--      handler.on_abbr_weekday();
--      break;
--    case 'A':
--      handler.on_full_weekday();
--      break;
--    case 'w':
--      handler.on_dec0_weekday(numeric_system::standard);
--      break;
--    case 'u':
--      handler.on_dec1_weekday(numeric_system::standard);
--      break;
-+    case 'a': handler.on_abbr_weekday(); break;
-+    case 'A': handler.on_full_weekday(); break;
-+    case 'w': handler.on_dec0_weekday(numeric_system::standard); break;
-+    case 'u': handler.on_dec1_weekday(numeric_system::standard); break;
-     // Month:
-     case 'b':
--    case 'h':
--      handler.on_abbr_month();
--      break;
--    case 'B':
--      handler.on_full_month();
--      break;
--    case 'm':
--      handler.on_dec_month(numeric_system::standard);
--      break;
-+    case 'h': handler.on_abbr_month(); break;
-+    case 'B': handler.on_full_month(); break;
-+    case 'm': handler.on_dec_month(numeric_system::standard, pad); brea=
k;
-     // Day of the year/month:
-     case 'U':
--      handler.on_dec0_week_of_year(numeric_system::standard);
-+      handler.on_dec0_week_of_year(numeric_system::standard, pad);
-       break;
-     case 'W':
--      handler.on_dec1_week_of_year(numeric_system::standard);
--      break;
--    case 'V':
--      handler.on_iso_week_of_year(numeric_system::standard);
--      break;
--    case 'j':
--      handler.on_day_of_year();
--      break;
--    case 'd':
--      handler.on_day_of_month(numeric_system::standard);
-+      handler.on_dec1_week_of_year(numeric_system::standard, pad);
-       break;
-+    case 'V': handler.on_iso_week_of_year(numeric_system::standard, pad=
); break;
-+    case 'j': handler.on_day_of_year(pad); break;
-+    case 'd': handler.on_day_of_month(numeric_system::standard, pad); b=
reak;
-     case 'e':
--      handler.on_day_of_month_space(numeric_system::standard);
-+      handler.on_day_of_month(numeric_system::standard, pad_type::space=
);
-       break;
-     // Hour, minute, second:
--    case 'H':
--      handler.on_24_hour(numeric_system::standard, pad);
--      break;
--    case 'I':
--      handler.on_12_hour(numeric_system::standard, pad);
--      break;
--    case 'M':
--      handler.on_minute(numeric_system::standard, pad);
--      break;
--    case 'S':
--      handler.on_second(numeric_system::standard, pad);
--      break;
-+    case 'H': handler.on_24_hour(numeric_system::standard, pad); break;
-+    case 'I': handler.on_12_hour(numeric_system::standard, pad); break;
-+    case 'M': handler.on_minute(numeric_system::standard, pad); break;
-+    case 'S': handler.on_second(numeric_system::standard, pad); break;
-     // Other:
--    case 'c':
--      handler.on_datetime(numeric_system::standard);
--      break;
--    case 'x':
--      handler.on_loc_date(numeric_system::standard);
--      break;
--    case 'X':
--      handler.on_loc_time(numeric_system::standard);
--      break;
--    case 'D':
--      handler.on_us_date();
--      break;
--    case 'F':
--      handler.on_iso_date();
--      break;
--    case 'r':
--      handler.on_12_hour_time();
--      break;
--    case 'R':
--      handler.on_24_hour_time();
--      break;
--    case 'T':
--      handler.on_iso_time();
--      break;
--    case 'p':
--      handler.on_am_pm();
--      break;
--    case 'Q':
--      handler.on_duration_value();
--      break;
--    case 'q':
--      handler.on_duration_unit();
--      break;
--    case 'z':
--      handler.on_utc_offset(numeric_system::standard);
--      break;
--    case 'Z':
--      handler.on_tz_name();
--      break;
-+    case 'c': handler.on_datetime(numeric_system::standard); break;
-+    case 'x': handler.on_loc_date(numeric_system::standard); break;
-+    case 'X': handler.on_loc_time(numeric_system::standard); break;
-+    case 'D': handler.on_us_date(); break;
-+    case 'F': handler.on_iso_date(); break;
-+    case 'r': handler.on_12_hour_time(); break;
-+    case 'R': handler.on_24_hour_time(); break;
-+    case 'T': handler.on_iso_time(); break;
-+    case 'p': handler.on_am_pm(); break;
-+    case 'Q': handler.on_duration_value(); break;
-+    case 'q': handler.on_duration_unit(); break;
-+    case 'z': handler.on_utc_offset(numeric_system::standard); break;
-+    case 'Z': handler.on_tz_name(); break;
-     // Alternative representation:
-     case 'E': {
-       if (ptr =3D=3D end) FMT_THROW(format_error("invalid format"));
-       c =3D *ptr++;
-       switch (c) {
--      case 'Y':
--        handler.on_year(numeric_system::alternative);
--        break;
--      case 'y':
--        handler.on_offset_year();
--        break;
--      case 'C':
--        handler.on_century(numeric_system::alternative);
--        break;
--      case 'c':
--        handler.on_datetime(numeric_system::alternative);
--        break;
--      case 'x':
--        handler.on_loc_date(numeric_system::alternative);
--        break;
--      case 'X':
--        handler.on_loc_time(numeric_system::alternative);
--        break;
--      case 'z':
--        handler.on_utc_offset(numeric_system::alternative);
--        break;
--      default:
--        FMT_THROW(format_error("invalid format"));
-+      case 'Y': handler.on_year(numeric_system::alternative, pad); brea=
k;
-+      case 'y': handler.on_offset_year(); break;
-+      case 'C': handler.on_century(numeric_system::alternative); break;
-+      case 'c': handler.on_datetime(numeric_system::alternative); break=
;
-+      case 'x': handler.on_loc_date(numeric_system::alternative); break=
;
-+      case 'X': handler.on_loc_time(numeric_system::alternative); break=
;
-+      case 'z': handler.on_utc_offset(numeric_system::alternative); bre=
ak;
-+      default:  FMT_THROW(format_error("invalid format"));
-       }
-       break;
-     }
-@@ -859,54 +827,34 @@ FMT_CONSTEXPR const Char* parse_chrono_format(cons=
t Char* begin,
-       if (ptr =3D=3D end) FMT_THROW(format_error("invalid format"));
-       c =3D *ptr++;
-       switch (c) {
--      case 'y':
--        handler.on_short_year(numeric_system::alternative);
--        break;
--      case 'm':
--        handler.on_dec_month(numeric_system::alternative);
--        break;
-+      case 'y': handler.on_short_year(numeric_system::alternative); bre=
ak;
-+      case 'm': handler.on_dec_month(numeric_system::alternative, pad);=
 break;
-       case 'U':
--        handler.on_dec0_week_of_year(numeric_system::alternative);
-+        handler.on_dec0_week_of_year(numeric_system::alternative, pad);
-         break;
-       case 'W':
--        handler.on_dec1_week_of_year(numeric_system::alternative);
-+        handler.on_dec1_week_of_year(numeric_system::alternative, pad);
-         break;
-       case 'V':
--        handler.on_iso_week_of_year(numeric_system::alternative);
-+        handler.on_iso_week_of_year(numeric_system::alternative, pad);
-         break;
-       case 'd':
--        handler.on_day_of_month(numeric_system::alternative);
-+        handler.on_day_of_month(numeric_system::alternative, pad);
-         break;
-       case 'e':
--        handler.on_day_of_month_space(numeric_system::alternative);
--        break;
--      case 'w':
--        handler.on_dec0_weekday(numeric_system::alternative);
--        break;
--      case 'u':
--        handler.on_dec1_weekday(numeric_system::alternative);
--        break;
--      case 'H':
--        handler.on_24_hour(numeric_system::alternative, pad);
-+        handler.on_day_of_month(numeric_system::alternative, pad_type::=
space);
-         break;
--      case 'I':
--        handler.on_12_hour(numeric_system::alternative, pad);
--        break;
--      case 'M':
--        handler.on_minute(numeric_system::alternative, pad);
--        break;
--      case 'S':
--        handler.on_second(numeric_system::alternative, pad);
--        break;
--      case 'z':
--        handler.on_utc_offset(numeric_system::alternative);
--        break;
--      default:
--        FMT_THROW(format_error("invalid format"));
-+      case 'w': handler.on_dec0_weekday(numeric_system::alternative); b=
reak;
-+      case 'u': handler.on_dec1_weekday(numeric_system::alternative); b=
reak;
-+      case 'H': handler.on_24_hour(numeric_system::alternative, pad); b=
reak;
-+      case 'I': handler.on_12_hour(numeric_system::alternative, pad); b=
reak;
-+      case 'M': handler.on_minute(numeric_system::alternative, pad); br=
eak;
-+      case 'S': handler.on_second(numeric_system::alternative, pad); br=
eak;
-+      case 'z': handler.on_utc_offset(numeric_system::alternative); bre=
ak;
-+      default:  FMT_THROW(format_error("invalid format"));
-       }
-       break;
--    default:
--      FMT_THROW(format_error("invalid format"));
-+    default: FMT_THROW(format_error("invalid format"));
-     }
-     begin =3D ptr;
-   }
-@@ -918,7 +866,7 @@ template <typename Derived> struct null_chrono_spec_=
handler {
-   FMT_CONSTEXPR void unsupported() {
-     static_cast<Derived*>(this)->unsupported();
-   }
--  FMT_CONSTEXPR void on_year(numeric_system) { unsupported(); }
-+  FMT_CONSTEXPR void on_year(numeric_system, pad_type) { unsupported();=
 }
-   FMT_CONSTEXPR void on_short_year(numeric_system) { unsupported(); }
-   FMT_CONSTEXPR void on_offset_year() { unsupported(); }
-   FMT_CONSTEXPR void on_century(numeric_system) { unsupported(); }
-@@ -930,13 +878,20 @@ template <typename Derived> struct null_chrono_spe=
c_handler {
-   FMT_CONSTEXPR void on_dec1_weekday(numeric_system) { unsupported(); }
-   FMT_CONSTEXPR void on_abbr_month() { unsupported(); }
-   FMT_CONSTEXPR void on_full_month() { unsupported(); }
--  FMT_CONSTEXPR void on_dec_month(numeric_system) { unsupported(); }
--  FMT_CONSTEXPR void on_dec0_week_of_year(numeric_system) { unsupported=
(); }
--  FMT_CONSTEXPR void on_dec1_week_of_year(numeric_system) { unsupported=
(); }
--  FMT_CONSTEXPR void on_iso_week_of_year(numeric_system) { unsupported(=
); }
--  FMT_CONSTEXPR void on_day_of_year() { unsupported(); }
--  FMT_CONSTEXPR void on_day_of_month(numeric_system) { unsupported(); }
--  FMT_CONSTEXPR void on_day_of_month_space(numeric_system) { unsupporte=
d(); }
-+  FMT_CONSTEXPR void on_dec_month(numeric_system, pad_type) { unsupport=
ed(); }
-+  FMT_CONSTEXPR void on_dec0_week_of_year(numeric_system, pad_type) {
-+    unsupported();
-+  }
-+  FMT_CONSTEXPR void on_dec1_week_of_year(numeric_system, pad_type) {
-+    unsupported();
-+  }
-+  FMT_CONSTEXPR void on_iso_week_of_year(numeric_system, pad_type) {
-+    unsupported();
-+  }
-+  FMT_CONSTEXPR void on_day_of_year(pad_type) { unsupported(); }
-+  FMT_CONSTEXPR void on_day_of_month(numeric_system, pad_type) {
-+    unsupported();
-+  }
-   FMT_CONSTEXPR void on_24_hour(numeric_system) { unsupported(); }
-   FMT_CONSTEXPR void on_12_hour(numeric_system) { unsupported(); }
-   FMT_CONSTEXPR void on_minute(numeric_system) { unsupported(); }
-@@ -957,11 +912,13 @@ template <typename Derived> struct null_chrono_spe=
c_handler {
- };
-=20
- struct tm_format_checker : null_chrono_spec_handler<tm_format_checker> =
{
--  FMT_NORETURN void unsupported() { FMT_THROW(format_error("no format")=
); }
-+  FMT_NORETURN inline void unsupported() {
-+    FMT_THROW(format_error("no format"));
-+  }
-=20
-   template <typename Char>
-   FMT_CONSTEXPR void on_text(const Char*, const Char*) {}
--  FMT_CONSTEXPR void on_year(numeric_system) {}
-+  FMT_CONSTEXPR void on_year(numeric_system, pad_type) {}
-   FMT_CONSTEXPR void on_short_year(numeric_system) {}
-   FMT_CONSTEXPR void on_offset_year() {}
-   FMT_CONSTEXPR void on_century(numeric_system) {}
-@@ -973,13 +930,12 @@ struct tm_format_checker : null_chrono_spec_handle=
r<tm_format_checker> {
-   FMT_CONSTEXPR void on_dec1_weekday(numeric_system) {}
-   FMT_CONSTEXPR void on_abbr_month() {}
-   FMT_CONSTEXPR void on_full_month() {}
--  FMT_CONSTEXPR void on_dec_month(numeric_system) {}
--  FMT_CONSTEXPR void on_dec0_week_of_year(numeric_system) {}
--  FMT_CONSTEXPR void on_dec1_week_of_year(numeric_system) {}
--  FMT_CONSTEXPR void on_iso_week_of_year(numeric_system) {}
--  FMT_CONSTEXPR void on_day_of_year() {}
--  FMT_CONSTEXPR void on_day_of_month(numeric_system) {}
--  FMT_CONSTEXPR void on_day_of_month_space(numeric_system) {}
-+  FMT_CONSTEXPR void on_dec_month(numeric_system, pad_type) {}
-+  FMT_CONSTEXPR void on_dec0_week_of_year(numeric_system, pad_type) {}
-+  FMT_CONSTEXPR void on_dec1_week_of_year(numeric_system, pad_type) {}
-+  FMT_CONSTEXPR void on_iso_week_of_year(numeric_system, pad_type) {}
-+  FMT_CONSTEXPR void on_day_of_year(pad_type) {}
-+  FMT_CONSTEXPR void on_day_of_month(numeric_system, pad_type) {}
-   FMT_CONSTEXPR void on_24_hour(numeric_system, pad_type) {}
-   FMT_CONSTEXPR void on_12_hour(numeric_system, pad_type) {}
-   FMT_CONSTEXPR void on_minute(numeric_system, pad_type) {}
-@@ -997,25 +953,25 @@ struct tm_format_checker : null_chrono_spec_handle=
r<tm_format_checker> {
-   FMT_CONSTEXPR void on_tz_name() {}
- };
-=20
--inline const char* tm_wday_full_name(int wday) {
-+inline auto tm_wday_full_name(int wday) -> const char* {
-   static constexpr const char* full_name_list[] =3D {
-       "Sunday",   "Monday", "Tuesday", "Wednesday",
-       "Thursday", "Friday", "Saturday"};
-   return wday >=3D 0 && wday <=3D 6 ? full_name_list[wday] : "?";
- }
--inline const char* tm_wday_short_name(int wday) {
-+inline auto tm_wday_short_name(int wday) -> const char* {
-   static constexpr const char* short_name_list[] =3D {"Sun", "Mon", "Tu=
e", "Wed",
-                                                     "Thu", "Fri", "Sat"=
};
-   return wday >=3D 0 && wday <=3D 6 ? short_name_list[wday] : "???";
- }
-=20
--inline const char* tm_mon_full_name(int mon) {
-+inline auto tm_mon_full_name(int mon) -> const char* {
-   static constexpr const char* full_name_list[] =3D {
-       "January", "February", "March",     "April",   "May",      "June"=
,
-       "July",    "August",   "September", "October", "November", "Decem=
ber"};
-   return mon >=3D 0 && mon <=3D 11 ? full_name_list[mon] : "?";
- }
--inline const char* tm_mon_short_name(int mon) {
-+inline auto tm_mon_short_name(int mon) -> const char* {
-   static constexpr const char* short_name_list[] =3D {
-       "Jan", "Feb", "Mar", "Apr", "May", "Jun",
-       "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
-@@ -1035,33 +991,33 @@ template <typename T>
- struct has_member_data_tm_zone<T, void_t<decltype(T::tm_zone)>>
-     : std::true_type {};
-=20
--#if FMT_USE_TZSET
- inline void tzset_once() {
--  static bool init =3D []() -> bool {
-+  static bool init =3D []() {
-+    using namespace fmt_detail;
-     _tzset();
--    return true;
-+    return false;
-   }();
-   ignore_unused(init);
- }
--#endif
-=20
- // Converts value to Int and checks that it's in the range [0, upper).
- template <typename T, typename Int, FMT_ENABLE_IF(std::is_integral<T>::=
value)>
--inline Int to_nonnegative_int(T value, Int upper) {
--  FMT_ASSERT(std::is_unsigned<Int>::value ||
--                 (value >=3D 0 && to_unsigned(value) <=3D to_unsigned(u=
pper)),
--             "invalid value");
--  (void)upper;
-+inline auto to_nonnegative_int(T value, Int upper) -> Int {
-+  if (!std::is_unsigned<Int>::value &&
-+      (value < 0 || to_unsigned(value) > to_unsigned(upper))) {
-+    FMT_THROW(fmt::format_error("chrono value is out of range"));
-+  }
-   return static_cast<Int>(value);
- }
- template <typename T, typename Int, FMT_ENABLE_IF(!std::is_integral<T>:=
:value)>
--inline Int to_nonnegative_int(T value, Int upper) {
--  if (value < 0 || value > static_cast<T>(upper))
-+inline auto to_nonnegative_int(T value, Int upper) -> Int {
-+  auto int_value =3D static_cast<Int>(value);
-+  if (int_value < 0 || value > static_cast<T>(upper))
-     FMT_THROW(format_error("invalid value"));
--  return static_cast<Int>(value);
-+  return int_value;
- }
-=20
--constexpr long long pow10(std::uint32_t n) {
-+constexpr auto pow10(std::uint32_t n) -> long long {
-   return n =3D=3D 0 ? 1 : 10 * pow10(n - 1);
- }
-=20
-@@ -1093,17 +1049,16 @@ void write_fractional_seconds(OutputIt& out, Dur=
ation d, int precision =3D -1) {
-   using subsecond_precision =3D std::chrono::duration<
-       typename std::common_type<typename Duration::rep,
-                                 std::chrono::seconds::rep>::type,
--      std::ratio<1, detail::pow10(num_fractional_digits)>>;
-+      std::ratio<1, pow10(num_fractional_digits)>>;
-=20
--  const auto fractional =3D
--      d - std::chrono::duration_cast<std::chrono::seconds>(d);
-+  const auto fractional =3D d - detail::duration_cast<std::chrono::seco=
nds>(d);
-   const auto subseconds =3D
-       std::chrono::treat_as_floating_point<
-           typename subsecond_precision::rep>::value
-           ? fractional.count()
--          : std::chrono::duration_cast<subsecond_precision>(fractional)=
.count();
-+          : detail::duration_cast<subsecond_precision>(fractional).coun=
t();
-   auto n =3D static_cast<uint32_or_64_or_128_t<long long>>(subseconds);
--  const int num_digits =3D detail::count_digits(n);
-+  const int num_digits =3D count_digits(n);
-=20
-   int leading_zeroes =3D (std::max)(0, num_fractional_digits - num_digi=
ts);
-   if (precision < 0) {
-@@ -1111,22 +1066,25 @@ void write_fractional_seconds(OutputIt& out, Dur=
ation d, int precision =3D -1) {
-     if (std::ratio_less<typename subsecond_precision::period,
-                         std::chrono::seconds::period>::value) {
-       *out++ =3D '.';
--      out =3D std::fill_n(out, leading_zeroes, '0');
--      out =3D format_decimal<Char>(out, n, num_digits).end;
-+      out =3D detail::fill_n(out, leading_zeroes, '0');
-+      out =3D format_decimal<Char>(out, n, num_digits);
-     }
--  } else {
-+  } else if (precision > 0) {
-     *out++ =3D '.';
--    leading_zeroes =3D (std::min)(leading_zeroes, precision);
--    out =3D std::fill_n(out, leading_zeroes, '0');
-+    leading_zeroes =3D min_of(leading_zeroes, precision);
-     int remaining =3D precision - leading_zeroes;
--    if (remaining !=3D 0 && remaining < num_digits) {
--      n /=3D to_unsigned(detail::pow10(to_unsigned(num_digits - remaini=
ng)));
--      out =3D format_decimal<Char>(out, n, remaining).end;
-+    out =3D detail::fill_n(out, leading_zeroes, '0');
-+    if (remaining < num_digits) {
-+      int num_truncated_digits =3D num_digits - remaining;
-+      n /=3D to_unsigned(pow10(to_unsigned(num_truncated_digits)));
-+      if (n !=3D 0) out =3D format_decimal<Char>(out, n, remaining);
-       return;
-     }
--    out =3D format_decimal<Char>(out, n, num_digits).end;
--    remaining -=3D num_digits;
--    out =3D std::fill_n(out, remaining, '0');
-+    if (n !=3D 0) {
-+      out =3D format_decimal<Char>(out, n, num_digits);
-+      remaining -=3D num_digits;
-+    }
-+    out =3D detail::fill_n(out, remaining, '0');
-   }
- }
-=20
-@@ -1152,11 +1110,11 @@ void write_floating_seconds(memory_buffer& buf, =
Duration duration,
-       num_fractional_digits =3D 6;
-   }
-=20
--  format_to(std::back_inserter(buf), FMT_STRING("{:.{}f}"),
--            std::fmod(val * static_cast<rep>(Duration::period::num) /
--                          static_cast<rep>(Duration::period::den),
--                      static_cast<rep>(60)),
--            num_fractional_digits);
-+  fmt::format_to(std::back_inserter(buf), FMT_STRING("{:.{}f}"),
-+                 std::fmod(val * static_cast<rep>(Duration::period::num=
) /
-+                               static_cast<rep>(Duration::period::den),
-+                           static_cast<rep>(60)),
-+                 num_fractional_digits);
- }
-=20
- template <typename OutputIt, typename Char,
-@@ -1217,8 +1175,7 @@ class tm_writer {
-     return static_cast<int>(l);
-   }
-=20
--  // Algorithm:
--  // https://en.wikipedia.org/wiki/ISO_week_date#Calculating_the_week_n=
umber_from_a_month_and_day_of_the_month_or_ordinal_date
-+  // Algorithm: https://en.wikipedia.org/wiki/ISO_week_date.
-   auto iso_year_weeks(long long curr_year) const noexcept -> int {
-     const auto prev_year =3D curr_year - 1;
-     const auto curr_p =3D
-@@ -1268,29 +1225,28 @@ class tm_writer {
-     }
-   }
-=20
--  void write_year_extended(long long year) {
-+  void write_year_extended(long long year, pad_type pad) {
-     // At least 4 characters.
-     int width =3D 4;
--    if (year < 0) {
--      *out_++ =3D '-';
-+    bool negative =3D year < 0;
-+    if (negative) {
-       year =3D 0 - year;
-       --width;
-     }
-     uint32_or_64_or_128_t<long long> n =3D to_unsigned(year);
-     const int num_digits =3D count_digits(n);
--    if (width > num_digits) out_ =3D std::fill_n(out_, width - num_digi=
ts, '0');
--    out_ =3D format_decimal<Char>(out_, n, num_digits).end;
--  }
--  void write_year(long long year) {
--    if (year >=3D 0 && year < 10000) {
--      write2(static_cast<int>(year / 100));
--      write2(static_cast<int>(year % 100));
--    } else {
--      write_year_extended(year);
-+    if (negative && pad =3D=3D pad_type::zero) *out_++ =3D '-';
-+    if (width > num_digits) {
-+      out_ =3D detail::write_padding(out_, pad, width - num_digits);
-     }
-+    if (negative && pad !=3D pad_type::zero) *out_++ =3D '-';
-+    out_ =3D format_decimal<Char>(out_, n, num_digits);
-+  }
-+  void write_year(long long year, pad_type pad) {
-+    write_year_extended(year, pad);
-   }
-=20
--  void write_utc_offset(long offset, numeric_system ns) {
-+  void write_utc_offset(long long offset, numeric_system ns) {
-     if (offset < 0) {
-       *out_++ =3D '-';
-       offset =3D -offset;
-@@ -1302,6 +1258,7 @@ class tm_writer {
-     if (ns !=3D numeric_system::standard) *out_++ =3D ':';
-     write2(static_cast<int>(offset % 60));
-   }
-+
-   template <typename T, FMT_ENABLE_IF(has_member_data_tm_gmtoff<T>::val=
ue)>
-   void format_utc_offset_impl(const T& tm, numeric_system ns) {
-     write_utc_offset(tm.tm_gmtoff, ns);
-@@ -1309,9 +1266,7 @@ class tm_writer {
-   template <typename T, FMT_ENABLE_IF(!has_member_data_tm_gmtoff<T>::va=
lue)>
-   void format_utc_offset_impl(const T& tm, numeric_system ns) {
- #if defined(_WIN32) && defined(_UCRT)
--#  if FMT_USE_TZSET
-     tzset_once();
--#  endif
-     long offset =3D 0;
-     _get_timezone(&offset);
-     if (tm.tm_isdst) {
-@@ -1328,7 +1283,7 @@ class tm_writer {
-     std::time_t gt =3D std::mktime(&gtm);
-     std::tm ltm =3D gmtime(gt);
-     std::time_t lt =3D std::mktime(&ltm);
--    long offset =3D gt - lt;
-+    long long offset =3D gt - lt;
-     write_utc_offset(offset, ns);
- #endif
-   }
-@@ -1358,10 +1313,10 @@ class tm_writer {
-         subsecs_(subsecs),
-         tm_(tm) {}
-=20
--  OutputIt out() const { return out_; }
-+  auto out() const -> OutputIt { return out_; }
-=20
-   FMT_CONSTEXPR void on_text(const Char* begin, const Char* end) {
--    out_ =3D copy_str<Char>(begin, end, out_);
-+    out_ =3D copy<Char>(begin, end, out_);
-   }
-=20
-   void on_abbr_weekday() {
-@@ -1408,11 +1363,11 @@ class tm_writer {
-       *out_++ =3D ' ';
-       on_abbr_month();
-       *out_++ =3D ' ';
--      on_day_of_month_space(numeric_system::standard);
-+      on_day_of_month(numeric_system::standard, pad_type::space);
-       *out_++ =3D ' ';
-       on_iso_time();
-       *out_++ =3D ' ';
--      on_year(numeric_system::standard);
-+      on_year(numeric_system::standard, pad_type::space);
-     } else {
-       format_localized('c', ns =3D=3D numeric_system::standard ? '\0' :=
 'E');
-     }
-@@ -1434,31 +1389,31 @@ class tm_writer {
-     write_digit2_separated(buf, to_unsigned(tm_mon() + 1),
-                            to_unsigned(tm_mday()),
-                            to_unsigned(split_year_lower(tm_year())), '/=
');
--    out_ =3D copy_str<Char>(std::begin(buf), std::end(buf), out_);
-+    out_ =3D copy<Char>(std::begin(buf), std::end(buf), out_);
-   }
-   void on_iso_date() {
-     auto year =3D tm_year();
-     char buf[10];
-     size_t offset =3D 0;
-     if (year >=3D 0 && year < 10000) {
--      copy2(buf, digits2(static_cast<size_t>(year / 100)));
-+      write2digits(buf, static_cast<size_t>(year / 100));
-     } else {
-       offset =3D 4;
--      write_year_extended(year);
-+      write_year_extended(year, pad_type::zero);
-       year =3D 0;
-     }
-     write_digit2_separated(buf + 2, static_cast<unsigned>(year % 100),
-                            to_unsigned(tm_mon() + 1), to_unsigned(tm_md=
ay()),
-                            '-');
--    out_ =3D copy_str<Char>(std::begin(buf) + offset, std::end(buf), ou=
t_);
-+    out_ =3D copy<Char>(std::begin(buf) + offset, std::end(buf), out_);
-   }
-=20
-   void on_utc_offset(numeric_system ns) { format_utc_offset_impl(tm_, n=
s); }
-   void on_tz_name() { format_tz_name_impl(tm_); }
-=20
--  void on_year(numeric_system ns) {
-+  void on_year(numeric_system ns, pad_type pad) {
-     if (is_classic_ || ns =3D=3D numeric_system::standard)
--      return write_year(tm_year());
-+      return write_year(tm_year(), pad);
-     format_localized('Y', 'E');
-   }
-   void on_short_year(numeric_system ns) {
-@@ -1489,56 +1444,57 @@ class tm_writer {
-     }
-   }
-=20
--  void on_dec_month(numeric_system ns) {
-+  void on_dec_month(numeric_system ns, pad_type pad) {
-     if (is_classic_ || ns =3D=3D numeric_system::standard)
--      return write2(tm_mon() + 1);
-+      return write2(tm_mon() + 1, pad);
-     format_localized('m', 'O');
-   }
-=20
--  void on_dec0_week_of_year(numeric_system ns) {
-+  void on_dec0_week_of_year(numeric_system ns, pad_type pad) {
-     if (is_classic_ || ns =3D=3D numeric_system::standard)
--      return write2((tm_yday() + days_per_week - tm_wday()) / days_per_=
week);
-+      return write2((tm_yday() + days_per_week - tm_wday()) / days_per_=
week,
-+                    pad);
-     format_localized('U', 'O');
-   }
--  void on_dec1_week_of_year(numeric_system ns) {
-+  void on_dec1_week_of_year(numeric_system ns, pad_type pad) {
-     if (is_classic_ || ns =3D=3D numeric_system::standard) {
-       auto wday =3D tm_wday();
-       write2((tm_yday() + days_per_week -
-               (wday =3D=3D 0 ? (days_per_week - 1) : (wday - 1))) /
--             days_per_week);
-+                 days_per_week,
-+             pad);
-     } else {
-       format_localized('W', 'O');
-     }
-   }
--  void on_iso_week_of_year(numeric_system ns) {
-+  void on_iso_week_of_year(numeric_system ns, pad_type pad) {
-     if (is_classic_ || ns =3D=3D numeric_system::standard)
--      return write2(tm_iso_week_of_year());
-+      return write2(tm_iso_week_of_year(), pad);
-     format_localized('V', 'O');
-   }
-=20
--  void on_iso_week_based_year() { write_year(tm_iso_week_year()); }
-+  void on_iso_week_based_year() {
-+    write_year(tm_iso_week_year(), pad_type::zero);
-+  }
-   void on_iso_week_based_short_year() {
-     write2(split_year_lower(tm_iso_week_year()));
-   }
-=20
--  void on_day_of_year() {
-+  void on_day_of_year(pad_type pad) {
-     auto yday =3D tm_yday() + 1;
--    write1(yday / 100);
--    write2(yday % 100);
--  }
--  void on_day_of_month(numeric_system ns) {
--    if (is_classic_ || ns =3D=3D numeric_system::standard) return write=
2(tm_mday());
--    format_localized('d', 'O');
--  }
--  void on_day_of_month_space(numeric_system ns) {
--    if (is_classic_ || ns =3D=3D numeric_system::standard) {
--      auto mday =3D to_unsigned(tm_mday()) % 100;
--      const char* d2 =3D digits2(mday);
--      *out_++ =3D mday < 10 ? ' ' : d2[0];
--      *out_++ =3D d2[1];
-+    auto digit1 =3D yday / 100;
-+    if (digit1 !=3D 0) {
-+      write1(digit1);
-     } else {
--      format_localized('e', 'O');
-+      out_ =3D detail::write_padding(out_, pad);
-     }
-+    write2(yday % 100, pad);
-+  }
-+
-+  void on_day_of_month(numeric_system ns, pad_type pad) {
-+    if (is_classic_ || ns =3D=3D numeric_system::standard)
-+      return write2(tm_mday(), pad);
-+    format_localized('d', 'O');
-   }
-=20
-   void on_24_hour(numeric_system ns, pad_type pad) {
-@@ -1566,7 +1522,7 @@ class tm_writer {
-           write_floating_seconds(buf, *subsecs_);
-           if (buf.size() > 1) {
-             // Remove the leading "0", write something like ".123".
--            out_ =3D std::copy(buf.begin() + 1, buf.end(), out_);
-+            out_ =3D copy<Char>(buf.begin() + 1, buf.end(), out_);
-           }
-         } else {
-           write_fractional_seconds<Char>(out_, *subsecs_);
-@@ -1583,7 +1539,7 @@ class tm_writer {
-       char buf[8];
-       write_digit2_separated(buf, to_unsigned(tm_hour12()),
-                              to_unsigned(tm_min()), to_unsigned(tm_sec(=
)), ':');
--      out_ =3D copy_str<Char>(std::begin(buf), std::end(buf), out_);
-+      out_ =3D copy<Char>(std::begin(buf), std::end(buf), out_);
-       *out_++ =3D ' ';
-       on_am_pm();
-     } else {
-@@ -1598,7 +1554,7 @@ class tm_writer {
-   void on_iso_time() {
-     on_24_hour_time();
-     *out_++ =3D ':';
--    on_second(numeric_system::standard, pad_type::unspecified);
-+    on_second(numeric_system::standard, pad_type::zero);
-   }
-=20
-   void on_am_pm() {
-@@ -1618,10 +1574,11 @@ class tm_writer {
- struct chrono_format_checker : null_chrono_spec_handler<chrono_format_c=
hecker> {
-   bool has_precision_integral =3D false;
-=20
--  FMT_NORETURN void unsupported() { FMT_THROW(format_error("no date"));=
 }
-+  FMT_NORETURN inline void unsupported() { FMT_THROW(format_error("no d=
ate")); }
-=20
-   template <typename Char>
-   FMT_CONSTEXPR void on_text(const Char*, const Char*) {}
-+  FMT_CONSTEXPR void on_day_of_year(pad_type) {}
-   FMT_CONSTEXPR void on_24_hour(numeric_system, pad_type) {}
-   FMT_CONSTEXPR void on_12_hour(numeric_system, pad_type) {}
-   FMT_CONSTEXPR void on_minute(numeric_system, pad_type) {}
-@@ -1631,25 +1588,24 @@ struct chrono_format_checker : null_chrono_spec_=
handler<chrono_format_checker> {
-   FMT_CONSTEXPR void on_iso_time() {}
-   FMT_CONSTEXPR void on_am_pm() {}
-   FMT_CONSTEXPR void on_duration_value() const {
--    if (has_precision_integral) {
-+    if (has_precision_integral)
-       FMT_THROW(format_error("precision not allowed for this argument t=
ype"));
--    }
-   }
-   FMT_CONSTEXPR void on_duration_unit() {}
- };
-=20
- template <typename T,
-           FMT_ENABLE_IF(std::is_integral<T>::value&& has_isfinite<T>::v=
alue)>
--inline bool isfinite(T) {
-+inline auto isfinite(T) -> bool {
-   return true;
- }
-=20
- template <typename T, FMT_ENABLE_IF(std::is_integral<T>::value)>
--inline T mod(T x, int y) {
-+inline auto mod(T x, int y) -> T {
-   return x % static_cast<T>(y);
- }
- template <typename T, FMT_ENABLE_IF(std::is_floating_point<T>::value)>
--inline T mod(T x, int y) {
-+inline auto mod(T x, int y) -> T {
-   return std::fmod(x, static_cast<T>(y));
- }
-=20
-@@ -1664,71 +1620,60 @@ template <typename T> struct make_unsigned_or_un=
changed<T, true> {
-   using type =3D typename std::make_unsigned<T>::type;
- };
-=20
--#if FMT_SAFE_DURATION_CAST
--// throwing version of safe_duration_cast
--template <typename To, typename FromRep, typename FromPeriod>
--To fmt_safe_duration_cast(std::chrono::duration<FromRep, FromPeriod> fr=
om) {
--  int ec;
--  To to =3D safe_duration_cast::safe_duration_cast<To>(from, ec);
--  if (ec) FMT_THROW(format_error("cannot format duration"));
--  return to;
--}
--#endif
--
- template <typename Rep, typename Period,
-           FMT_ENABLE_IF(std::is_integral<Rep>::value)>
--inline std::chrono::duration<Rep, std::milli> get_milliseconds(
--    std::chrono::duration<Rep, Period> d) {
-+inline auto get_milliseconds(std::chrono::duration<Rep, Period> d)
-+    -> std::chrono::duration<Rep, std::milli> {
-   // this may overflow and/or the result may not fit in the
-   // target type.
- #if FMT_SAFE_DURATION_CAST
-   using CommonSecondsType =3D
-       typename std::common_type<decltype(d), std::chrono::seconds>::typ=
e;
--  const auto d_as_common =3D fmt_safe_duration_cast<CommonSecondsType>(=
d);
-+  const auto d_as_common =3D detail::duration_cast<CommonSecondsType>(d=
);
-   const auto d_as_whole_seconds =3D
--      fmt_safe_duration_cast<std::chrono::seconds>(d_as_common);
-+      detail::duration_cast<std::chrono::seconds>(d_as_common);
-   // this conversion should be nonproblematic
-   const auto diff =3D d_as_common - d_as_whole_seconds;
-   const auto ms =3D
--      fmt_safe_duration_cast<std::chrono::duration<Rep, std::milli>>(di=
ff);
-+      detail::duration_cast<std::chrono::duration<Rep, std::milli>>(dif=
f);
-   return ms;
- #else
--  auto s =3D std::chrono::duration_cast<std::chrono::seconds>(d);
--  return std::chrono::duration_cast<std::chrono::milliseconds>(d - s);
-+  auto s =3D detail::duration_cast<std::chrono::seconds>(d);
-+  return detail::duration_cast<std::chrono::milliseconds>(d - s);
- #endif
- }
-=20
- template <typename Char, typename Rep, typename OutputIt,
-           FMT_ENABLE_IF(std::is_integral<Rep>::value)>
--OutputIt format_duration_value(OutputIt out, Rep val, int) {
-+auto format_duration_value(OutputIt out, Rep val, int) -> OutputIt {
-   return write<Char>(out, val);
- }
-=20
- template <typename Char, typename Rep, typename OutputIt,
-           FMT_ENABLE_IF(std::is_floating_point<Rep>::value)>
--OutputIt format_duration_value(OutputIt out, Rep val, int precision) {
--  auto specs =3D format_specs<Char>();
-+auto format_duration_value(OutputIt out, Rep val, int precision) -> Out=
putIt {
-+  auto specs =3D format_specs();
-   specs.precision =3D precision;
--  specs.type =3D precision >=3D 0 ? presentation_type::fixed_lower
--                              : presentation_type::general_lower;
-+  specs.set_type(precision >=3D 0 ? presentation_type::fixed
-+                                : presentation_type::general);
-   return write<Char>(out, val, specs);
- }
-=20
- template <typename Char, typename OutputIt>
--OutputIt copy_unit(string_view unit, OutputIt out, Char) {
--  return std::copy(unit.begin(), unit.end(), out);
-+auto copy_unit(string_view unit, OutputIt out, Char) -> OutputIt {
-+  return copy<Char>(unit.begin(), unit.end(), out);
- }
-=20
- template <typename OutputIt>
--OutputIt copy_unit(string_view unit, OutputIt out, wchar_t) {
-+auto copy_unit(string_view unit, OutputIt out, wchar_t) -> OutputIt {
-   // This works when wchar_t is UTF-32 because units only contain chara=
cters
-   // that have the same representation in UTF-16 and UTF-32.
-   utf8_to_utf16 u(unit);
--  return std::copy(u.c_str(), u.c_str() + u.size(), out);
-+  return copy<wchar_t>(u.c_str(), u.c_str() + u.size(), out);
- }
-=20
- template <typename Char, typename Period, typename OutputIt>
--OutputIt format_duration_unit(OutputIt out) {
-+auto format_duration_unit(OutputIt out) -> OutputIt {
-   if (const char* unit =3D get_units<Period>())
-     return copy_unit(string_view(unit), out, Char());
-   *out++ =3D '[';
-@@ -1750,14 +1695,14 @@ class get_locale {
-   bool has_locale_ =3D false;
-=20
-  public:
--  get_locale(bool localized, locale_ref loc) : has_locale_(localized) {
-+  inline get_locale(bool localized, locale_ref loc) : has_locale_(local=
ized) {
-     if (localized)
-       ::new (&locale_) std::locale(loc.template get<std::locale>());
-   }
--  ~get_locale() {
-+  inline ~get_locale() {
-     if (has_locale_) locale_.~locale();
-   }
--  operator const std::locale&() const {
-+  inline operator const std::locale&() const {
-     return has_locale_ ? locale_ : get_classic_locale();
-   }
- };
-@@ -1795,18 +1740,12 @@ struct chrono_formatter {
-=20
-     // this may overflow and/or the result may not fit in the
-     // target type.
--#if FMT_SAFE_DURATION_CAST
-     // might need checked conversion (rep!=3DRep)
--    auto tmpval =3D std::chrono::duration<rep, Period>(val);
--    s =3D fmt_safe_duration_cast<seconds>(tmpval);
--#else
--    s =3D std::chrono::duration_cast<seconds>(
--        std::chrono::duration<rep, Period>(val));
--#endif
-+    s =3D detail::duration_cast<seconds>(std::chrono::duration<rep, Per=
iod>(val));
-   }
-=20
-   // returns true if nan or inf, writes to out.
--  bool handle_nan_inf() {
-+  auto handle_nan_inf() -> bool {
-     if (isfinite(val)) {
-       return false;
-     }
-@@ -1823,17 +1762,22 @@ struct chrono_formatter {
-     return true;
-   }
-=20
--  Rep hour() const { return static_cast<Rep>(mod((s.count() / 3600), 24=
)); }
-+  auto days() const -> Rep { return static_cast<Rep>(s.count() / 86400)=
; }
-+  auto hour() const -> Rep {
-+    return static_cast<Rep>(mod((s.count() / 3600), 24));
-+  }
-=20
--  Rep hour12() const {
-+  auto hour12() const -> Rep {
-     Rep hour =3D static_cast<Rep>(mod((s.count() / 3600), 12));
-     return hour <=3D 0 ? 12 : hour;
-   }
-=20
--  Rep minute() const { return static_cast<Rep>(mod((s.count() / 60), 60=
)); }
--  Rep second() const { return static_cast<Rep>(mod(s.count(), 60)); }
-+  auto minute() const -> Rep {
-+    return static_cast<Rep>(mod((s.count() / 60), 60));
-+  }
-+  auto second() const -> Rep { return static_cast<Rep>(mod(s.count(), 6=
0)); }
-=20
--  std::tm time() const {
-+  auto time() const -> std::tm {
-     auto time =3D std::tm();
-     time.tm_hour =3D to_nonnegative_int(hour(), 24);
-     time.tm_min =3D to_nonnegative_int(minute(), 60);
-@@ -1848,7 +1792,7 @@ struct chrono_formatter {
-     }
-   }
-=20
--  void write(Rep value, int width, pad_type pad =3D pad_type::unspecifi=
ed) {
-+  void write(Rep value, int width, pad_type pad =3D pad_type::zero) {
-     write_sign();
-     if (isnan(value)) return write_nan();
-     uint32_or_64_or_128_t<int> n =3D
-@@ -1857,7 +1801,7 @@ struct chrono_formatter {
-     if (width > num_digits) {
-       out =3D detail::write_padding(out, pad, width - num_digits);
-     }
--    out =3D format_decimal<char_type>(out, n, num_digits).end;
-+    out =3D format_decimal<char_type>(out, n, num_digits);
-   }
-=20
-   void write_nan() { std::copy_n("nan", 3, out); }
-@@ -1874,7 +1818,7 @@ struct chrono_formatter {
-   }
-=20
-   void on_text(const char_type* begin, const char_type* end) {
--    std::copy(begin, end, out);
-+    copy<char_type>(begin, end, out);
-   }
-=20
-   // These are not implemented because durations don't have date inform=
ation.
-@@ -1891,19 +1835,22 @@ struct chrono_formatter {
-   void on_iso_date() {}
-   void on_utc_offset(numeric_system) {}
-   void on_tz_name() {}
--  void on_year(numeric_system) {}
-+  void on_year(numeric_system, pad_type) {}
-   void on_short_year(numeric_system) {}
-   void on_offset_year() {}
-   void on_century(numeric_system) {}
-   void on_iso_week_based_year() {}
-   void on_iso_week_based_short_year() {}
--  void on_dec_month(numeric_system) {}
--  void on_dec0_week_of_year(numeric_system) {}
--  void on_dec1_week_of_year(numeric_system) {}
--  void on_iso_week_of_year(numeric_system) {}
--  void on_day_of_year() {}
--  void on_day_of_month(numeric_system) {}
--  void on_day_of_month_space(numeric_system) {}
-+  void on_dec_month(numeric_system, pad_type) {}
-+  void on_dec0_week_of_year(numeric_system, pad_type) {}
-+  void on_dec1_week_of_year(numeric_system, pad_type) {}
-+  void on_iso_week_of_year(numeric_system, pad_type) {}
-+  void on_day_of_month(numeric_system, pad_type) {}
-+
-+  void on_day_of_year(pad_type) {
-+    if (handle_nan_inf()) return;
-+    write(days(), 0);
-+  }
-=20
-   void on_24_hour(numeric_system ns, pad_type pad) {
-     if (handle_nan_inf()) return;
-@@ -1944,7 +1891,7 @@ struct chrono_formatter {
-         if (buf.size() < 2 || buf[1] =3D=3D '.') {
-           out =3D detail::write_padding(out, pad);
-         }
--        out =3D std::copy(buf.begin(), buf.end(), out);
-+        out =3D copy<char_type>(buf.begin(), buf.end(), out);
-       } else {
-         write(second(), 2, pad);
-         write_fractional_seconds<char_type>(
-@@ -1978,7 +1925,7 @@ struct chrono_formatter {
-     on_24_hour_time();
-     *out++ =3D ':';
-     if (handle_nan_inf()) return;
--    on_second(numeric_system::standard, pad_type::unspecified);
-+    on_second(numeric_system::standard, pad_type::zero);
-   }
-=20
-   void on_am_pm() {
-@@ -1997,268 +1944,391 @@ struct chrono_formatter {
-   }
- };
-=20
--FMT_END_DETAIL_NAMESPACE
-+}  // namespace detail
-=20
- #if defined(__cpp_lib_chrono) && __cpp_lib_chrono >=3D 201907
- using weekday =3D std::chrono::weekday;
-+using day =3D std::chrono::day;
-+using month =3D std::chrono::month;
-+using year =3D std::chrono::year;
-+using year_month_day =3D std::chrono::year_month_day;
- #else
- // A fallback version of weekday.
- class weekday {
-  private:
--  unsigned char value;
-+  unsigned char value_;
-=20
-  public:
-   weekday() =3D default;
--  explicit constexpr weekday(unsigned wd) noexcept
--      : value(static_cast<unsigned char>(wd !=3D 7 ? wd : 0)) {}
--  constexpr unsigned c_encoding() const noexcept { return value; }
-+  constexpr explicit weekday(unsigned wd) noexcept
-+      : value_(static_cast<unsigned char>(wd !=3D 7 ? wd : 0)) {}
-+  constexpr auto c_encoding() const noexcept -> unsigned { return value=
_; }
-+};
-+
-+class day {
-+ private:
-+  unsigned char value_;
-+
-+ public:
-+  day() =3D default;
-+  constexpr explicit day(unsigned d) noexcept
-+      : value_(static_cast<unsigned char>(d)) {}
-+  constexpr explicit operator unsigned() const noexcept { return value_=
; }
-+};
-+
-+class month {
-+ private:
-+  unsigned char value_;
-+
-+ public:
-+  month() =3D default;
-+  constexpr explicit month(unsigned m) noexcept
-+      : value_(static_cast<unsigned char>(m)) {}
-+  constexpr explicit operator unsigned() const noexcept { return value_=
; }
-+};
-+
-+class year {
-+ private:
-+  int value_;
-+
-+ public:
-+  year() =3D default;
-+  constexpr explicit year(int y) noexcept : value_(y) {}
-+  constexpr explicit operator int() const noexcept { return value_; }
- };
-=20
--class year_month_day {};
-+class year_month_day {
-+ private:
-+  fmt::year year_;
-+  fmt::month month_;
-+  fmt::day day_;
-+
-+ public:
-+  year_month_day() =3D default;
-+  constexpr year_month_day(const year& y, const month& m, const day& d)=
 noexcept
-+      : year_(y), month_(m), day_(d) {}
-+  constexpr auto year() const noexcept -> fmt::year { return year_; }
-+  constexpr auto month() const noexcept -> fmt::month { return month_; =
}
-+  constexpr auto day() const noexcept -> fmt::day { return day_; }
-+};
- #endif
-=20
--// A rudimentary weekday formatter.
--template <typename Char> struct formatter<weekday, Char> {
-+template <typename Char>
-+struct formatter<weekday, Char> : private formatter<std::tm, Char> {
-  private:
--  bool localized =3D false;
-+  bool localized_ =3D false;
-+  bool use_tm_formatter_ =3D false;
-=20
-  public:
--  FMT_CONSTEXPR auto parse(basic_format_parse_context<Char>& ctx)
--      -> decltype(ctx.begin()) {
--    auto begin =3D ctx.begin(), end =3D ctx.end();
--    if (begin !=3D end && *begin =3D=3D 'L') {
--      ++begin;
--      localized =3D true;
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    if (it !=3D end && *it =3D=3D 'L') {
-+      ++it;
-+      localized_ =3D true;
-+      return it;
-     }
--    return begin;
-+    use_tm_formatter_ =3D it !=3D end && *it !=3D '}';
-+    return use_tm_formatter_ ? formatter<std::tm, Char>::parse(ctx) : i=
t;
-   }
-=20
-   template <typename FormatContext>
-   auto format(weekday wd, FormatContext& ctx) const -> decltype(ctx.out=
()) {
-     auto time =3D std::tm();
-     time.tm_wday =3D static_cast<int>(wd.c_encoding());
--    detail::get_locale loc(localized, ctx.locale());
-+    if (use_tm_formatter_) return formatter<std::tm, Char>::format(time=
, ctx);
-+    detail::get_locale loc(localized_, ctx.locale());
-     auto w =3D detail::tm_writer<decltype(ctx.out()), Char>(loc, ctx.ou=
t(), time);
-     w.on_abbr_weekday();
-     return w.out();
-   }
- };
-=20
-+template <typename Char>
-+struct formatter<day, Char> : private formatter<std::tm, Char> {
-+ private:
-+  bool use_tm_formatter_ =3D false;
-+
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    use_tm_formatter_ =3D it !=3D end && *it !=3D '}';
-+    return use_tm_formatter_ ? formatter<std::tm, Char>::parse(ctx) : i=
t;
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(day d, FormatContext& ctx) const -> decltype(ctx.out()) {
-+    auto time =3D std::tm();
-+    time.tm_mday =3D static_cast<int>(static_cast<unsigned>(d));
-+    if (use_tm_formatter_) return formatter<std::tm, Char>::format(time=
, ctx);
-+    detail::get_locale loc(false, ctx.locale());
-+    auto w =3D detail::tm_writer<decltype(ctx.out()), Char>(loc, ctx.ou=
t(), time);
-+    w.on_day_of_month(detail::numeric_system::standard, detail::pad_typ=
e::zero);
-+    return w.out();
-+  }
-+};
-+
-+template <typename Char>
-+struct formatter<month, Char> : private formatter<std::tm, Char> {
-+ private:
-+  bool localized_ =3D false;
-+  bool use_tm_formatter_ =3D false;
-+
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    if (it !=3D end && *it =3D=3D 'L') {
-+      ++it;
-+      localized_ =3D true;
-+      return it;
-+    }
-+    use_tm_formatter_ =3D it !=3D end && *it !=3D '}';
-+    return use_tm_formatter_ ? formatter<std::tm, Char>::parse(ctx) : i=
t;
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(month m, FormatContext& ctx) const -> decltype(ctx.out())=
 {
-+    auto time =3D std::tm();
-+    time.tm_mon =3D static_cast<int>(static_cast<unsigned>(m)) - 1;
-+    if (use_tm_formatter_) return formatter<std::tm, Char>::format(time=
, ctx);
-+    detail::get_locale loc(localized_, ctx.locale());
-+    auto w =3D detail::tm_writer<decltype(ctx.out()), Char>(loc, ctx.ou=
t(), time);
-+    w.on_abbr_month();
-+    return w.out();
-+  }
-+};
-+
-+template <typename Char>
-+struct formatter<year, Char> : private formatter<std::tm, Char> {
-+ private:
-+  bool use_tm_formatter_ =3D false;
-+
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    use_tm_formatter_ =3D it !=3D end && *it !=3D '}';
-+    return use_tm_formatter_ ? formatter<std::tm, Char>::parse(ctx) : i=
t;
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(year y, FormatContext& ctx) const -> decltype(ctx.out()) =
{
-+    auto time =3D std::tm();
-+    time.tm_year =3D static_cast<int>(y) - 1900;
-+    if (use_tm_formatter_) return formatter<std::tm, Char>::format(time=
, ctx);
-+    detail::get_locale loc(false, ctx.locale());
-+    auto w =3D detail::tm_writer<decltype(ctx.out()), Char>(loc, ctx.ou=
t(), time);
-+    w.on_year(detail::numeric_system::standard, detail::pad_type::zero)=
;
-+    return w.out();
-+  }
-+};
-+
-+template <typename Char>
-+struct formatter<year_month_day, Char> : private formatter<std::tm, Cha=
r> {
-+ private:
-+  bool use_tm_formatter_ =3D false;
-+
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    use_tm_formatter_ =3D it !=3D end && *it !=3D '}';
-+    return use_tm_formatter_ ? formatter<std::tm, Char>::parse(ctx) : i=
t;
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(year_month_day val, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    auto time =3D std::tm();
-+    time.tm_year =3D static_cast<int>(val.year()) - 1900;
-+    time.tm_mon =3D static_cast<int>(static_cast<unsigned>(val.month())=
) - 1;
-+    time.tm_mday =3D static_cast<int>(static_cast<unsigned>(val.day()))=
;
-+    if (use_tm_formatter_) return formatter<std::tm, Char>::format(time=
, ctx);
-+    detail::get_locale loc(true, ctx.locale());
-+    auto w =3D detail::tm_writer<decltype(ctx.out()), Char>(loc, ctx.ou=
t(), time);
-+    w.on_iso_date();
-+    return w.out();
-+  }
-+};
-+
- template <typename Rep, typename Period, typename Char>
- struct formatter<std::chrono::duration<Rep, Period>, Char> {
-  private:
--  format_specs<Char> specs;
--  int precision =3D -1;
--  using arg_ref_type =3D detail::arg_ref<Char>;
--  arg_ref_type width_ref;
--  arg_ref_type precision_ref;
--  bool localized =3D false;
--  basic_string_view<Char> format_str;
--  using duration =3D std::chrono::duration<Rep, Period>;
-+  format_specs specs_;
-+  detail::arg_ref<Char> width_ref_;
-+  detail::arg_ref<Char> precision_ref_;
-+  bool localized_ =3D false;
-+  basic_string_view<Char> fmt_;
-=20
--  using iterator =3D typename basic_format_parse_context<Char>::iterato=
r;
--  struct parse_range {
--    iterator begin;
--    iterator end;
--  };
--
--  FMT_CONSTEXPR parse_range do_parse(basic_format_parse_context<Char>& =
ctx) {
--    auto begin =3D ctx.begin(), end =3D ctx.end();
--    if (begin =3D=3D end || *begin =3D=3D '}') return {begin, begin};
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    if (it =3D=3D end || *it =3D=3D '}') return it;
-=20
--    begin =3D detail::parse_align(begin, end, specs);
--    if (begin =3D=3D end) return {begin, begin};
-+    it =3D detail::parse_align(it, end, specs_);
-+    if (it =3D=3D end) return it;
-=20
--    begin =3D detail::parse_dynamic_spec(begin, end, specs.width, width=
_ref, ctx);
--    if (begin =3D=3D end) return {begin, begin};
-+    Char c =3D *it;
-+    if ((c >=3D '0' && c <=3D '9') || c =3D=3D '{') {
-+      it =3D detail::parse_width(it, end, specs_, width_ref_, ctx);
-+      if (it =3D=3D end) return it;
-+    }
-=20
-     auto checker =3D detail::chrono_format_checker();
--    if (*begin =3D=3D '.') {
-+    if (*it =3D=3D '.') {
-       checker.has_precision_integral =3D !std::is_floating_point<Rep>::=
value;
--      begin =3D
--          detail::parse_precision(begin, end, precision, precision_ref,=
 ctx);
-+      it =3D detail::parse_precision(it, end, specs_, precision_ref_, c=
tx);
-     }
--    if (begin !=3D end && *begin =3D=3D 'L') {
--      ++begin;
--      localized =3D true;
-+    if (it !=3D end && *it =3D=3D 'L') {
-+      localized_ =3D true;
-+      ++it;
-     }
--    end =3D detail::parse_chrono_format(begin, end, checker);
--    return {begin, end};
--  }
--
-- public:
--  FMT_CONSTEXPR auto parse(basic_format_parse_context<Char>& ctx)
--      -> decltype(ctx.begin()) {
--    auto range =3D do_parse(ctx);
--    format_str =3D basic_string_view<Char>(
--        &*range.begin, detail::to_unsigned(range.end - range.begin));
--    return range.end;
-+    end =3D detail::parse_chrono_format(it, end, checker);
-+    fmt_ =3D {it, detail::to_unsigned(end - it)};
-+    return end;
-   }
-=20
-   template <typename FormatContext>
--  auto format(const duration& d, FormatContext& ctx) const
-+  auto format(std::chrono::duration<Rep, Period> d, FormatContext& ctx)=
 const
-       -> decltype(ctx.out()) {
--    auto specs_copy =3D specs;
--    auto precision_copy =3D precision;
--    auto begin =3D format_str.begin(), end =3D format_str.end();
-+    auto specs =3D specs_;
-+    auto precision =3D specs.precision;
-+    specs.precision =3D -1;
-+    auto begin =3D fmt_.begin(), end =3D fmt_.end();
-     // As a possible future optimization, we could avoid extra copying =
if width
-     // is not specified.
--    basic_memory_buffer<Char> buf;
--    auto out =3D std::back_inserter(buf);
--    detail::handle_dynamic_spec<detail::width_checker>(specs_copy.width=
,
--                                                       width_ref, ctx);
--    detail::handle_dynamic_spec<detail::precision_checker>(precision_co=
py,
--                                                           precision_re=
f, ctx);
-+    auto buf =3D basic_memory_buffer<Char>();
-+    auto out =3D basic_appender<Char>(buf);
-+    detail::handle_dynamic_spec(specs.dynamic_width(), specs.width, wid=
th_ref_,
-+                                ctx);
-+    detail::handle_dynamic_spec(specs.dynamic_precision(), precision,
-+                                precision_ref_, ctx);
-     if (begin =3D=3D end || *begin =3D=3D '}') {
--      out =3D detail::format_duration_value<Char>(out, d.count(), preci=
sion_copy);
-+      out =3D detail::format_duration_value<Char>(out, d.count(), preci=
sion);
-       detail::format_duration_unit<Char, Period>(out);
-     } else {
--      detail::chrono_formatter<FormatContext, decltype(out), Rep, Perio=
d> f(
--          ctx, out, d);
--      f.precision =3D precision_copy;
--      f.localized =3D localized;
-+      using chrono_formatter =3D
-+          detail::chrono_formatter<FormatContext, decltype(out), Rep, P=
eriod>;
-+      auto f =3D chrono_formatter(ctx, out, d);
-+      f.precision =3D precision;
-+      f.localized =3D localized_;
-       detail::parse_chrono_format(begin, end, f);
-     }
-     return detail::write(
--        ctx.out(), basic_string_view<Char>(buf.data(), buf.size()), spe=
cs_copy);
-+        ctx.out(), basic_string_view<Char>(buf.data(), buf.size()), spe=
cs);
-   }
- };
-=20
--template <typename Char, typename Duration>
--struct formatter<std::chrono::time_point<std::chrono::system_clock, Dur=
ation>,
--                 Char> : formatter<std::tm, Char> {
--  FMT_CONSTEXPR formatter() {
--    this->format_str =3D detail::string_literal<Char, '%', 'F', ' ', '%=
', 'T'>{};
-+template <typename Char> struct formatter<std::tm, Char> {
-+ private:
-+  format_specs specs_;
-+  detail::arg_ref<Char> width_ref_;
-+
-+ protected:
-+  basic_string_view<Char> fmt_;
-+
-+  template <typename Duration, typename FormatContext>
-+  auto do_format(const std::tm& tm, FormatContext& ctx,
-+                 const Duration* subsecs) const -> decltype(ctx.out()) =
{
-+    auto specs =3D specs_;
-+    auto buf =3D basic_memory_buffer<Char>();
-+    auto out =3D basic_appender<Char>(buf);
-+    detail::handle_dynamic_spec(specs.dynamic_width(), specs.width, wid=
th_ref_,
-+                                ctx);
-+
-+    auto loc_ref =3D ctx.locale();
-+    detail::get_locale loc(static_cast<bool>(loc_ref), loc_ref);
-+    auto w =3D
-+        detail::tm_writer<decltype(out), Char, Duration>(loc, out, tm, =
subsecs);
-+    detail::parse_chrono_format(fmt_.begin(), fmt_.end(), w);
-+    return detail::write(
-+        ctx.out(), basic_string_view<Char>(buf.data(), buf.size()), spe=
cs);
-   }
-=20
--  template <typename FormatContext>
--  auto format(std::chrono::time_point<std::chrono::system_clock, Durati=
on> val,
--              FormatContext& ctx) const -> decltype(ctx.out()) {
--    using period =3D typename Duration::period;
--    if (period::num !=3D 1 || period::den !=3D 1 ||
--        std::is_floating_point<typename Duration::rep>::value) {
--      const auto epoch =3D val.time_since_epoch();
--      auto subsecs =3D std::chrono::duration_cast<Duration>(
--          epoch - std::chrono::duration_cast<std::chrono::seconds>(epoc=
h));
--
--      if (subsecs.count() < 0) {
--        auto second =3D std::chrono::duration_cast<Duration>(
--            std::chrono::seconds(1));
--        if (epoch.count() < ((Duration::min)() + second).count())
--          FMT_THROW(format_error("duration is too small"));
--        subsecs +=3D second;
--        val -=3D second;
--      }
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    if (it =3D=3D end || *it =3D=3D '}') return it;
-=20
--      return formatter<std::tm, Char>::do_format(
--          gmtime(std::chrono::time_point_cast<std::chrono::seconds>(val=
)), ctx,
--          &subsecs);
-+    it =3D detail::parse_align(it, end, specs_);
-+    if (it =3D=3D end) return it;
-+
-+    Char c =3D *it;
-+    if ((c >=3D '0' && c <=3D '9') || c =3D=3D '{') {
-+      it =3D detail::parse_width(it, end, specs_, width_ref_, ctx);
-+      if (it =3D=3D end) return it;
-     }
-=20
--    return formatter<std::tm, Char>::format(
--        gmtime(std::chrono::time_point_cast<std::chrono::seconds>(val))=
, ctx);
-+    end =3D detail::parse_chrono_format(it, end, detail::tm_format_chec=
ker());
-+    // Replace the default format string only if the new spec is not em=
pty.
-+    if (end !=3D it) fmt_ =3D {it, detail::to_unsigned(end - it)};
-+    return end;
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(const std::tm& tm, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return do_format<std::chrono::seconds>(tm, ctx, nullptr);
-   }
- };
-=20
--#if FMT_USE_LOCAL_TIME
- template <typename Char, typename Duration>
--struct formatter<std::chrono::local_time<Duration>, Char>
--    : formatter<std::tm, Char> {
-+struct formatter<sys_time<Duration>, Char> : formatter<std::tm, Char> {
-   FMT_CONSTEXPR formatter() {
--    this->format_str =3D detail::string_literal<Char, '%', 'F', ' ', '%=
', 'T'>{};
-+    this->fmt_ =3D detail::string_literal<Char, '%', 'F', ' ', '%', 'T'=
>();
-   }
-=20
-   template <typename FormatContext>
--  auto format(std::chrono::local_time<Duration> val, FormatContext& ctx=
) const
-+  auto format(sys_time<Duration> val, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
-+    std::tm tm =3D gmtime(val);
-     using period =3D typename Duration::period;
--    if (period::num !=3D 1 || period::den !=3D 1 ||
--        std::is_floating_point<typename Duration::rep>::value) {
--      const auto epoch =3D val.time_since_epoch();
--      const auto subsecs =3D std::chrono::duration_cast<Duration>(
--          epoch - std::chrono::duration_cast<std::chrono::seconds>(epoc=
h));
--
--      return formatter<std::tm, Char>::do_format(
--          localtime(std::chrono::time_point_cast<std::chrono::seconds>(=
val)),
--          ctx, &subsecs);
-+    if (detail::const_check(
-+            period::num =3D=3D 1 && period::den =3D=3D 1 &&
-+            !std::is_floating_point<typename Duration::rep>::value)) {
-+      return formatter<std::tm, Char>::format(tm, ctx);
-     }
--
--    return formatter<std::tm, Char>::format(
--        localtime(std::chrono::time_point_cast<std::chrono::seconds>(va=
l)),
--        ctx);
-+    Duration epoch =3D val.time_since_epoch();
-+    Duration subsecs =3D detail::duration_cast<Duration>(
-+        epoch - detail::duration_cast<std::chrono::seconds>(epoch));
-+    if (subsecs.count() < 0) {
-+      auto second =3D detail::duration_cast<Duration>(std::chrono::seco=
nds(1));
-+      if (tm.tm_sec !=3D 0)
-+        --tm.tm_sec;
-+      else
-+        tm =3D gmtime(val - second);
-+      subsecs +=3D detail::duration_cast<Duration>(std::chrono::seconds=
(1));
-+    }
-+    return formatter<std::tm, Char>::do_format(tm, ctx, &subsecs);
-   }
- };
--#endif
-=20
--#if FMT_USE_UTC_TIME
--template <typename Char, typename Duration>
--struct formatter<std::chrono::time_point<std::chrono::utc_clock, Durati=
on>,
--                 Char>
--    : formatter<std::chrono::time_point<std::chrono::system_clock, Dura=
tion>,
--                Char> {
-+template <typename Duration, typename Char>
-+struct formatter<utc_time<Duration>, Char>
-+    : formatter<sys_time<Duration>, Char> {
-   template <typename FormatContext>
--  auto format(std::chrono::time_point<std::chrono::utc_clock, Duration>=
 val,
--              FormatContext& ctx) const -> decltype(ctx.out()) {
--    return formatter<
--        std::chrono::time_point<std::chrono::system_clock, Duration>,
--        Char>::format(std::chrono::utc_clock::to_sys(val), ctx);
-+  auto format(utc_time<Duration> val, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return formatter<sys_time<Duration>, Char>::format(
-+        detail::utc_clock::to_sys(val), ctx);
-   }
- };
--#endif
--
--template <typename Char> struct formatter<std::tm, Char> {
-- private:
--  format_specs<Char> specs;
--  detail::arg_ref<Char> width_ref;
--
-- protected:
--  basic_string_view<Char> format_str;
--
--  FMT_CONSTEXPR auto do_parse(basic_format_parse_context<Char>& ctx)
--      -> decltype(ctx.begin()) {
--    auto begin =3D ctx.begin(), end =3D ctx.end();
--    if (begin =3D=3D end || *begin =3D=3D '}') return begin;
--
--    begin =3D detail::parse_align(begin, end, specs);
--    if (begin =3D=3D end) return end;
--
--    begin =3D detail::parse_dynamic_spec(begin, end, specs.width, width=
_ref, ctx);
--    if (begin =3D=3D end) return end;
--
--    end =3D detail::parse_chrono_format(begin, end, detail::tm_format_c=
hecker());
--    // Replace default format_str only if the new spec is not empty.
--    if (end !=3D begin) format_str =3D {begin, detail::to_unsigned(end =
- begin)};
--    return end;
--  }
--
--  template <typename FormatContext, typename Duration>
--  auto do_format(const std::tm& tm, FormatContext& ctx,
--                 const Duration* subsecs) const -> decltype(ctx.out()) =
{
--    auto specs_copy =3D specs;
--    basic_memory_buffer<Char> buf;
--    auto out =3D std::back_inserter(buf);
--    detail::handle_dynamic_spec<detail::width_checker>(specs_copy.width=
,
--                                                       width_ref, ctx);
-=20
--    const auto loc_ref =3D ctx.locale();
--    detail::get_locale loc(static_cast<bool>(loc_ref), loc_ref);
--    auto w =3D
--        detail::tm_writer<decltype(out), Char, Duration>(loc, out, tm, =
subsecs);
--    detail::parse_chrono_format(format_str.begin(), format_str.end(), w=
);
--    return detail::write(
--        ctx.out(), basic_string_view<Char>(buf.data(), buf.size()), spe=
cs_copy);
--  }
--
-- public:
--  FMT_CONSTEXPR auto parse(basic_format_parse_context<Char>& ctx)
--      -> decltype(ctx.begin()) {
--    return this->do_parse(ctx);
-+template <typename Duration, typename Char>
-+struct formatter<local_time<Duration>, Char> : formatter<std::tm, Char>=
 {
-+  FMT_CONSTEXPR formatter() {
-+    this->fmt_ =3D detail::string_literal<Char, '%', 'F', ' ', '%', 'T'=
>();
-   }
-=20
-   template <typename FormatContext>
--  auto format(const std::tm& tm, FormatContext& ctx) const
-+  auto format(local_time<Duration> val, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
--    return do_format<FormatContext, std::chrono::seconds>(tm, ctx, null=
ptr);
-+    using period =3D typename Duration::period;
-+    if (period::num =3D=3D 1 && period::den =3D=3D 1 &&
-+        !std::is_floating_point<typename Duration::rep>::value) {
-+      return formatter<std::tm, Char>::format(localtime(val), ctx);
-+    }
-+    auto epoch =3D val.time_since_epoch();
-+    auto subsecs =3D detail::duration_cast<Duration>(
-+        epoch - detail::duration_cast<std::chrono::seconds>(epoch));
-+    return formatter<std::tm, Char>::do_format(localtime(val), ctx, &su=
bsecs);
-   }
- };
-=20
-diff --git a/include/fmt/color.h b/include/fmt/color.h
-index d175448..638f15b 100644
---- a/include/fmt/color.h
-+++ b/include/fmt/color.h
-@@ -190,11 +190,11 @@ enum class emphasis : uint8_t {
- // rgb is a struct for red, green and blue colors.
- // Using the name "rgb" makes some editors show the color in a tooltip.
- struct rgb {
--  FMT_CONSTEXPR rgb() : r(0), g(0), b(0) {}
--  FMT_CONSTEXPR rgb(uint8_t r_, uint8_t g_, uint8_t b_) : r(r_), g(g_),=
 b(b_) {}
--  FMT_CONSTEXPR rgb(uint32_t hex)
-+  constexpr rgb() : r(0), g(0), b(0) {}
-+  constexpr rgb(uint8_t r_, uint8_t g_, uint8_t b_) : r(r_), g(g_), b(b=
_) {}
-+  constexpr rgb(uint32_t hex)
-       : r((hex >> 16) & 0xFF), g((hex >> 8) & 0xFF), b(hex & 0xFF) {}
--  FMT_CONSTEXPR rgb(color hex)
-+  constexpr rgb(color hex)
-       : r((uint32_t(hex) >> 16) & 0xFF),
-         g((uint32_t(hex) >> 8) & 0xFF),
-         b(uint32_t(hex) & 0xFF) {}
-@@ -203,136 +203,174 @@ struct rgb {
-   uint8_t b;
- };
-=20
--FMT_BEGIN_DETAIL_NAMESPACE
-+namespace detail {
-=20
--// color is a struct of either a rgb color or a terminal color.
-+// A bit-packed variant of an RGB color, a terminal color, or unset col=
or.
-+// see text_style for the bit-packing scheme.
- struct color_type {
--  FMT_CONSTEXPR color_type() noexcept : is_rgb(), value{} {}
--  FMT_CONSTEXPR color_type(color rgb_color) noexcept : is_rgb(true), va=
lue{} {
--    value.rgb_color =3D static_cast<uint32_t>(rgb_color);
-+  constexpr color_type() noexcept =3D default;
-+  constexpr color_type(color rgb_color) noexcept
-+      : value_(static_cast<uint32_t>(rgb_color) | (1 << 24)) {}
-+  constexpr color_type(rgb rgb_color) noexcept
-+      : color_type(static_cast<color>(
-+            (static_cast<uint32_t>(rgb_color.r) << 16) |
-+            (static_cast<uint32_t>(rgb_color.g) << 8) | rgb_color.b)) {=
}
-+  constexpr color_type(terminal_color term_color) noexcept
-+      : value_(static_cast<uint32_t>(term_color) | (3 << 24)) {}
-+
-+  constexpr auto is_terminal_color() const noexcept -> bool {
-+    return (value_ & (1 << 25)) !=3D 0;
-   }
--  FMT_CONSTEXPR color_type(rgb rgb_color) noexcept : is_rgb(true), valu=
e{} {
--    value.rgb_color =3D (static_cast<uint32_t>(rgb_color.r) << 16) |
--                      (static_cast<uint32_t>(rgb_color.g) << 8) | rgb_c=
olor.b;
--  }
--  FMT_CONSTEXPR color_type(terminal_color term_color) noexcept
--      : is_rgb(), value{} {
--    value.term_color =3D static_cast<uint8_t>(term_color);
-+
-+  constexpr auto value() const noexcept -> uint32_t {
-+    return value_ & 0xFFFFFF;
-   }
--  bool is_rgb;
--  union color_union {
--    uint8_t term_color;
--    uint32_t rgb_color;
--  } value;
--};
-=20
--FMT_END_DETAIL_NAMESPACE
-+  constexpr color_type(uint32_t value) noexcept : value_(value) {}
-+
-+  uint32_t value_ =3D 0;
-+};
-+}  // namespace detail
-=20
--/** A text style consisting of foreground and background colors and emp=
hasis. */
-+/// A text style consisting of foreground and background colors and emp=
hasis.
- class text_style {
-+  // The information is packed as follows:
-+  // =E2=94=8C=E2=94=80=E2=94=80=E2=94=90
-+  // =E2=94=82 0=E2=94=82=E2=94=80=E2=94=90
-+  // =E2=94=82..=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 foreground color =
value
-+  // =E2=94=8223=E2=94=82=E2=94=80=E2=94=98
-+  // =E2=94=9C=E2=94=80=E2=94=80=E2=94=A4
-+  // =E2=94=8224=E2=94=82=E2=94=80=E2=94=AC=E2=94=80=E2=94=80 discrimin=
ator for the above value. 00 if unset, 01 if it's
-+  // =E2=94=8225=E2=94=82=E2=94=80=E2=94=98   an RGB color, or 11 if it=
's a terminal color (10 is unused)
-+  // =E2=94=9C=E2=94=80=E2=94=80=E2=94=A4
-+  // =E2=94=8226=E2=94=82=E2=94=80=E2=94=80=E2=94=80=E2=94=80 overflow =
bit, always zero (see below)
-+  // =E2=94=9C=E2=94=80=E2=94=80=E2=94=A4
-+  // =E2=94=8227=E2=94=82=E2=94=80=E2=94=90
-+  // =E2=94=82..=E2=94=82 =E2=94=82
-+  // =E2=94=8250=E2=94=82 =E2=94=82
-+  // =E2=94=9C=E2=94=80=E2=94=80=E2=94=A4 =E2=94=82
-+  // =E2=94=8251=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 background color =
(same format as the foreground color)
-+  // =E2=94=8252=E2=94=82 =E2=94=82
-+  // =E2=94=9C=E2=94=80=E2=94=80=E2=94=A4 =E2=94=82
-+  // =E2=94=8253=E2=94=82=E2=94=80=E2=94=98
-+  // =E2=94=9C=E2=94=80=E2=94=80=E2=94=A4
-+  // =E2=94=8254=E2=94=82=E2=94=80=E2=94=90
-+  // =E2=94=82..=E2=94=82 =E2=94=9C=E2=94=80=E2=94=80 emphases
-+  // =E2=94=8261=E2=94=82=E2=94=80=E2=94=98
-+  // =E2=94=9C=E2=94=80=E2=94=80=E2=94=A4
-+  // =E2=94=8262=E2=94=82=E2=94=80=E2=94=AC=E2=94=80=E2=94=80 unused
-+  // =E2=94=8263=E2=94=82=E2=94=80=E2=94=98
-+  // =E2=94=94=E2=94=80=E2=94=80=E2=94=98
-+  // The overflow bits are there to make operator|=3D efficient.
-+  // When ORing, we must throw if, for either the foreground or backgro=
und,
-+  // one style specifies a terminal color and the other specifies any c=
olor
-+  // (terminal or RGB); in other words, if one discriminator is 11 and =
the
-+  // other is 11 or 01.
-+  //
-+  // We do that check by adding the styles. Consider what adding does t=
o each
-+  // possible pair of discriminators:
-+  //    00 + 00 =3D 000
-+  //    01 + 00 =3D 001
-+  //    11 + 00 =3D 011
-+  //    01 + 01 =3D 010
-+  //    11 + 01 =3D 100 (!!)
-+  //    11 + 11 =3D 110 (!!)
-+  // In the last two cases, the ones we want to catch, the third bit=E2=
=80=94=E2=80=94the
-+  // overflow bit=E2=80=94=E2=80=94is set. Bingo.
-+  //
-+  // We must take into account the possible carry bit from the bits
-+  // before the discriminator. The only potentially problematic case is
-+  // 11 + 00 =3D 011 (a carry bit would make it 100, not good!), but a =
carry
-+  // bit is impossible in that case, because 00 (unset color) means the
-+  // 24 bits that precede the discriminator are all zero.
-+  //
-+  // This test can be applied to both colors simultaneously.
-+
-  public:
-   FMT_CONSTEXPR text_style(emphasis em =3D emphasis()) noexcept
--      : set_foreground_color(), set_background_color(), ems(em) {}
--
--  FMT_CONSTEXPR text_style& operator|=3D(const text_style& rhs) {
--    if (!set_foreground_color) {
--      set_foreground_color =3D rhs.set_foreground_color;
--      foreground_color =3D rhs.foreground_color;
--    } else if (rhs.set_foreground_color) {
--      if (!foreground_color.is_rgb || !rhs.foreground_color.is_rgb)
--        FMT_THROW(format_error("can't OR a terminal color"));
--      foreground_color.value.rgb_color |=3D rhs.foreground_color.value.=
rgb_color;
--    }
-+      : style_(static_cast<uint64_t>(em) << 54) {}
-=20
--    if (!set_background_color) {
--      set_background_color =3D rhs.set_background_color;
--      background_color =3D rhs.background_color;
--    } else if (rhs.set_background_color) {
--      if (!background_color.is_rgb || !rhs.background_color.is_rgb)
--        FMT_THROW(format_error("can't OR a terminal color"));
--      background_color.value.rgb_color |=3D rhs.background_color.value.=
rgb_color;
--    }
--
--    ems =3D static_cast<emphasis>(static_cast<uint8_t>(ems) |
--                                static_cast<uint8_t>(rhs.ems));
-+  FMT_CONSTEXPR auto operator|=3D(text_style rhs) -> text_style& {
-+    if (((style_ + rhs.style_) & ((1ULL << 26) | (1ULL << 53))) !=3D 0)
-+      report_error("can't OR a terminal color");
-+    style_ |=3D rhs.style_;
-     return *this;
-   }
-=20
--  friend FMT_CONSTEXPR text_style operator|(text_style lhs,
--                                            const text_style& rhs) {
-+  friend FMT_CONSTEXPR auto operator|(text_style lhs, text_style rhs)
-+      -> text_style {
-     return lhs |=3D rhs;
-   }
-=20
--  FMT_CONSTEXPR bool has_foreground() const noexcept {
--    return set_foreground_color;
-+  FMT_CONSTEXPR auto operator=3D=3D(text_style rhs) const noexcept -> b=
ool {
-+    return style_ =3D=3D rhs.style_;
-+  }
-+
-+  FMT_CONSTEXPR auto operator!=3D(text_style rhs) const noexcept -> boo=
l {
-+    return !(*this =3D=3D rhs);
-   }
--  FMT_CONSTEXPR bool has_background() const noexcept {
--    return set_background_color;
-+
-+  FMT_CONSTEXPR auto has_foreground() const noexcept -> bool {
-+    return (style_ & (1 << 24)) !=3D 0;
-   }
--  FMT_CONSTEXPR bool has_emphasis() const noexcept {
--    return static_cast<uint8_t>(ems) !=3D 0;
-+  FMT_CONSTEXPR auto has_background() const noexcept -> bool {
-+    return (style_ & (1ULL << 51)) !=3D 0;
-   }
--  FMT_CONSTEXPR detail::color_type get_foreground() const noexcept {
-+  FMT_CONSTEXPR auto has_emphasis() const noexcept -> bool {
-+    return (style_ >> 54) !=3D 0;
-+  }
-+  FMT_CONSTEXPR auto get_foreground() const noexcept -> detail::color_t=
ype {
-     FMT_ASSERT(has_foreground(), "no foreground specified for this styl=
e");
--    return foreground_color;
-+    return style_ & 0x3FFFFFF;
-   }
--  FMT_CONSTEXPR detail::color_type get_background() const noexcept {
-+  FMT_CONSTEXPR auto get_background() const noexcept -> detail::color_t=
ype {
-     FMT_ASSERT(has_background(), "no background specified for this styl=
e");
--    return background_color;
-+    return (style_ >> 27) & 0x3FFFFFF;
-   }
--  FMT_CONSTEXPR emphasis get_emphasis() const noexcept {
-+  FMT_CONSTEXPR auto get_emphasis() const noexcept -> emphasis {
-     FMT_ASSERT(has_emphasis(), "no emphasis specified for this style");
--    return ems;
-+    return static_cast<emphasis>(style_ >> 54);
-   }
-=20
-  private:
--  FMT_CONSTEXPR text_style(bool is_foreground,
--                           detail::color_type text_color) noexcept
--      : set_foreground_color(), set_background_color(), ems() {
--    if (is_foreground) {
--      foreground_color =3D text_color;
--      set_foreground_color =3D true;
--    } else {
--      background_color =3D text_color;
--      set_background_color =3D true;
--    }
--  }
-+  FMT_CONSTEXPR text_style(uint64_t style) noexcept : style_(style) {}
-=20
--  friend FMT_CONSTEXPR text_style fg(detail::color_type foreground) noe=
xcept;
-+  friend FMT_CONSTEXPR auto fg(detail::color_type foreground) noexcept
-+      -> text_style;
-=20
--  friend FMT_CONSTEXPR text_style bg(detail::color_type background) noe=
xcept;
-+  friend FMT_CONSTEXPR auto bg(detail::color_type background) noexcept
-+      -> text_style;
-=20
--  detail::color_type foreground_color;
--  detail::color_type background_color;
--  bool set_foreground_color;
--  bool set_background_color;
--  emphasis ems;
-+  uint64_t style_ =3D 0;
- };
-=20
--/** Creates a text style from the foreground (text) color. */
--FMT_CONSTEXPR inline text_style fg(detail::color_type foreground) noexc=
ept {
--  return text_style(true, foreground);
-+/// Creates a text style from the foreground (text) color.
-+FMT_CONSTEXPR inline auto fg(detail::color_type foreground) noexcept
-+    -> text_style {
-+  return foreground.value_;
- }
-=20
--/** Creates a text style from the background color. */
--FMT_CONSTEXPR inline text_style bg(detail::color_type background) noexc=
ept {
--  return text_style(false, background);
-+/// Creates a text style from the background color.
-+FMT_CONSTEXPR inline auto bg(detail::color_type background) noexcept
-+    -> text_style {
-+  return static_cast<uint64_t>(background.value_) << 27;
- }
-=20
--FMT_CONSTEXPR inline text_style operator|(emphasis lhs, emphasis rhs) n=
oexcept {
-+FMT_CONSTEXPR inline auto operator|(emphasis lhs, emphasis rhs) noexcep=
t
-+    -> text_style {
-   return text_style(lhs) | rhs;
- }
-=20
--FMT_BEGIN_DETAIL_NAMESPACE
-+namespace detail {
-=20
- template <typename Char> struct ansi_color_escape {
--  FMT_CONSTEXPR ansi_color_escape(detail::color_type text_color,
-+  FMT_CONSTEXPR ansi_color_escape(color_type text_color,
-                                   const char* esc) noexcept {
-     // If we have a terminal color, we need to output another escape co=
de
-     // sequence.
--    if (!text_color.is_rgb) {
-+    if (text_color.is_terminal_color()) {
-       bool is_background =3D esc =3D=3D string_view("\x1b[48;2;");
--      uint32_t value =3D text_color.value.term_color;
-+      uint32_t value =3D text_color.value();
-       // Background ASCII codes are the same as the foreground ones but=
 with
-       // 10 more.
-       if (is_background) value +=3D 10u;
-@@ -356,7 +394,7 @@ template <typename Char> struct ansi_color_escape {
-     for (int i =3D 0; i < 7; i++) {
-       buffer[i] =3D static_cast<Char>(esc[i]);
-     }
--    rgb color(text_color.value.rgb_color);
-+    rgb color(text_color.value());
-     to_esc(color.r, buffer + 7, ';');
-     to_esc(color.g, buffer + 11, ';');
-     to_esc(color.b, buffer + 15, 'm');
-@@ -385,9 +423,9 @@ template <typename Char> struct ansi_color_escape {
-   }
-   FMT_CONSTEXPR operator const Char*() const noexcept { return buffer; =
}
-=20
--  FMT_CONSTEXPR const Char* begin() const noexcept { return buffer; }
--  FMT_CONSTEXPR_CHAR_TRAITS const Char* end() const noexcept {
--    return buffer + std::char_traits<Char>::length(buffer);
-+  FMT_CONSTEXPR auto begin() const noexcept -> const Char* { return buf=
fer; }
-+  FMT_CONSTEXPR20 auto end() const noexcept -> const Char* {
-+    return buffer + basic_string_view<Char>(buffer).size();
-   }
-=20
-  private:
-@@ -401,25 +439,27 @@ template <typename Char> struct ansi_color_escape =
{
-     out[2] =3D static_cast<Char>('0' + c % 10);
-     out[3] =3D static_cast<Char>(delimiter);
-   }
--  static FMT_CONSTEXPR bool has_emphasis(emphasis em, emphasis mask) no=
except {
-+  static FMT_CONSTEXPR auto has_emphasis(emphasis em, emphasis mask) no=
except
-+      -> bool {
-     return static_cast<uint8_t>(em) & static_cast<uint8_t>(mask);
-   }
- };
-=20
- template <typename Char>
--FMT_CONSTEXPR ansi_color_escape<Char> make_foreground_color(
--    detail::color_type foreground) noexcept {
-+FMT_CONSTEXPR auto make_foreground_color(color_type foreground) noexcep=
t
-+    -> ansi_color_escape<Char> {
-   return ansi_color_escape<Char>(foreground, "\x1b[38;2;");
- }
-=20
- template <typename Char>
--FMT_CONSTEXPR ansi_color_escape<Char> make_background_color(
--    detail::color_type background) noexcept {
-+FMT_CONSTEXPR auto make_background_color(color_type background) noexcep=
t
-+    -> ansi_color_escape<Char> {
-   return ansi_color_escape<Char>(background, "\x1b[48;2;");
- }
-=20
- template <typename Char>
--FMT_CONSTEXPR ansi_color_escape<Char> make_emphasis(emphasis em) noexce=
pt {
-+FMT_CONSTEXPR auto make_emphasis(emphasis em) noexcept
-+    -> ansi_color_escape<Char> {
-   return ansi_color_escape<Char>(em);
- }
-=20
-@@ -428,149 +468,116 @@ template <typename Char> inline void reset_color=
(buffer<Char>& buffer) {
-   buffer.append(reset_color.begin(), reset_color.end());
- }
-=20
--template <typename T> struct styled_arg {
-+template <typename T> struct styled_arg : view {
-   const T& value;
-   text_style style;
-+  styled_arg(const T& v, text_style s) : value(v), style(s) {}
- };
-=20
- template <typename Char>
--void vformat_to(buffer<Char>& buf, const text_style& ts,
--                basic_string_view<Char> format_str,
--                basic_format_args<buffer_context<type_identity_t<Char>>=
> args) {
--  bool has_style =3D false;
-+void vformat_to(buffer<Char>& buf, text_style ts, basic_string_view<Cha=
r> fmt,
-+                basic_format_args<buffered_context<Char>> args) {
-   if (ts.has_emphasis()) {
--    has_style =3D true;
--    auto emphasis =3D detail::make_emphasis<Char>(ts.get_emphasis());
-+    auto emphasis =3D make_emphasis<Char>(ts.get_emphasis());
-     buf.append(emphasis.begin(), emphasis.end());
-   }
-   if (ts.has_foreground()) {
--    has_style =3D true;
--    auto foreground =3D detail::make_foreground_color<Char>(ts.get_fore=
ground());
-+    auto foreground =3D make_foreground_color<Char>(ts.get_foreground()=
);
-     buf.append(foreground.begin(), foreground.end());
-   }
-   if (ts.has_background()) {
--    has_style =3D true;
--    auto background =3D detail::make_background_color<Char>(ts.get_back=
ground());
-+    auto background =3D make_background_color<Char>(ts.get_background()=
);
-     buf.append(background.begin(), background.end());
-   }
--  detail::vformat_to(buf, format_str, args, {});
--  if (has_style) detail::reset_color<Char>(buf);
-+  vformat_to(buf, fmt, args);
-+  if (ts !=3D text_style()) reset_color<Char>(buf);
- }
-+}  // namespace detail
-=20
--FMT_END_DETAIL_NAMESPACE
--
--inline void vprint(std::FILE* f, const text_style& ts, string_view fmt,
--                   format_args args) {
--  // Legacy wide streams are not supported.
-+inline void vprint(FILE* f, text_style ts, string_view fmt, format_args=
 args) {
-   auto buf =3D memory_buffer();
-   detail::vformat_to(buf, ts, fmt, args);
--  if (detail::is_utf8()) {
--    detail::print(f, string_view(buf.begin(), buf.size()));
--    return;
--  }
--  buf.push_back('\0');
--  int result =3D std::fputs(buf.data(), f);
--  if (result < 0)
--    FMT_THROW(system_error(errno, FMT_STRING("cannot write to file")));
-+  print(f, FMT_STRING("{}"), string_view(buf.begin(), buf.size()));
- }
-=20
- /**
--  \rst
--  Formats a string and prints it to the specified file stream using ANS=
I
--  escape sequences to specify text formatting.
--
--  **Example**::
--
--    fmt::print(fmt::emphasis::bold | fg(fmt::color::red),
--               "Elapsed time: {0:.2f} seconds", 1.23);
--  \endrst
-+ * Formats a string and prints it to the specified file stream using AN=
SI
-+ * escape sequences to specify text formatting.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print(fmt::emphasis::bold | fg(fmt::color::red),
-+ *                "Elapsed time: {0:.2f} seconds", 1.23);
-  */
--template <typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_string<S>::value)>
--void print(std::FILE* f, const text_style& ts, const S& format_str,
--           const Args&... args) {
--  vprint(f, ts, format_str,
--         fmt::make_format_args<buffer_context<char_t<S>>>(args...));
-+template <typename... T>
-+void print(FILE* f, text_style ts, format_string<T...> fmt, T&&... args=
) {
-+  vprint(f, ts, fmt.str, vargs<T...>{{args...}});
- }
-=20
- /**
--  \rst
--  Formats a string and prints it to stdout using ANSI escape sequences =
to
--  specify text formatting.
--
--  **Example**::
--
--    fmt::print(fmt::emphasis::bold | fg(fmt::color::red),
--               "Elapsed time: {0:.2f} seconds", 1.23);
--  \endrst
-+ * Formats a string and prints it to stdout using ANSI escape sequences=
 to
-+ * specify text formatting.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print(fmt::emphasis::bold | fg(fmt::color::red),
-+ *                "Elapsed time: {0:.2f} seconds", 1.23);
-  */
--template <typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_string<S>::value)>
--void print(const text_style& ts, const S& format_str, const Args&... ar=
gs) {
--  return print(stdout, ts, format_str, args...);
-+template <typename... T>
-+void print(text_style ts, format_string<T...> fmt, T&&... args) {
-+  return print(stdout, ts, fmt, std::forward<T>(args)...);
- }
-=20
--template <typename S, typename Char =3D char_t<S>>
--inline std::basic_string<Char> vformat(
--    const text_style& ts, const S& format_str,
--    basic_format_args<buffer_context<type_identity_t<Char>>> args) {
--  basic_memory_buffer<Char> buf;
--  detail::vformat_to(buf, ts, detail::to_string_view(format_str), args)=
;
-+inline auto vformat(text_style ts, string_view fmt, format_args args)
-+    -> std::string {
-+  auto buf =3D memory_buffer();
-+  detail::vformat_to(buf, ts, fmt, args);
-   return fmt::to_string(buf);
- }
-=20
- /**
--  \rst
--  Formats arguments and returns the result as a string using ANSI
--  escape sequences to specify text formatting.
--
--  **Example**::
--
--    #include <fmt/color.h>
--    std::string message =3D fmt::format(fmt::emphasis::bold | fg(fmt::c=
olor::red),
--                                      "The answer is {}", 42);
--  \endrst
--*/
--template <typename S, typename... Args, typename Char =3D char_t<S>>
--inline std::basic_string<Char> format(const text_style& ts, const S& fo=
rmat_str,
--                                      const Args&... args) {
--  return fmt::vformat(ts, detail::to_string_view(format_str),
--                      fmt::make_format_args<buffer_context<Char>>(args.=
..));
-+ * Formats arguments and returns the result as a string using ANSI esca=
pe
-+ * sequences to specify text formatting.
-+ *
-+ * **Example**:
-+ *
-+ * ```
-+ * #include <fmt/color.h>
-+ * std::string message =3D fmt::format(fmt::emphasis::bold | fg(fmt::co=
lor::red),
-+ *                                   "The answer is {}", 42);
-+ * ```
-+ */
-+template <typename... T>
-+inline auto format(text_style ts, format_string<T...> fmt, T&&... args)
-+    -> std::string {
-+  return fmt::vformat(ts, fmt.str, vargs<T...>{{args...}});
- }
-=20
--/**
--  Formats a string with the given text_style and writes the output to `=
`out``.
-- */
--template <typename OutputIt, typename Char,
--          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, Char>::val=
ue)>
--OutputIt vformat_to(
--    OutputIt out, const text_style& ts, basic_string_view<Char> format_=
str,
--    basic_format_args<buffer_context<type_identity_t<Char>>> args) {
--  auto&& buf =3D detail::get_buffer<Char>(out);
--  detail::vformat_to(buf, ts, format_str, args);
-+/// Formats a string with the given text_style and writes the output to=
 `out`.
-+template <typename OutputIt,
-+          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
-+auto vformat_to(OutputIt out, text_style ts, string_view fmt, format_ar=
gs args)
-+    -> OutputIt {
-+  auto&& buf =3D detail::get_buffer<char>(out);
-+  detail::vformat_to(buf, ts, fmt, args);
-   return detail::get_iterator(buf, out);
- }
-=20
- /**
--  \rst
--  Formats arguments with the given text_style, writes the result to the=
 output
--  iterator ``out`` and returns the iterator past the end of the output =
range.
--
--  **Example**::
--
--    std::vector<char> out;
--    fmt::format_to(std::back_inserter(out),
--                   fmt::emphasis::bold | fg(fmt::color::red), "{}", 42)=
;
--  \endrst
--*/
--template <typename OutputIt, typename S, typename... Args,
--          bool enable =3D detail::is_output_iterator<OutputIt, char_t<S=
>>::value&&
--              detail::is_string<S>::value>
--inline auto format_to(OutputIt out, const text_style& ts, const S& form=
at_str,
--                      Args&&... args) ->
--    typename std::enable_if<enable, OutputIt>::type {
--  return vformat_to(out, ts, detail::to_string_view(format_str),
--                    fmt::make_format_args<buffer_context<char_t<S>>>(ar=
gs...));
-+ * Formats arguments with the given text style, writes the result to th=
e output
-+ * iterator `out` and returns the iterator past the end of the output r=
ange.
-+ *
-+ * **Example**:
-+ *
-+ *     std::vector<char> out;
-+ *     fmt::format_to(std::back_inserter(out),
-+ *                    fmt::emphasis::bold | fg(fmt::color::red), "{}", =
42);
-+ */
-+template <typename OutputIt, typename... T,
-+          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
-+inline auto format_to(OutputIt out, text_style ts, format_string<T...> =
fmt,
-+                      T&&... args) -> OutputIt {
-+  return vformat_to(out, ts, fmt.str, vargs<T...>{{args...}});
- }
-=20
- template <typename T, typename Char>
-@@ -579,47 +586,44 @@ struct formatter<detail::styled_arg<T>, Char> : fo=
rmatter<T, Char> {
-   auto format(const detail::styled_arg<T>& arg, FormatContext& ctx) con=
st
-       -> decltype(ctx.out()) {
-     const auto& ts =3D arg.style;
--    const auto& value =3D arg.value;
-     auto out =3D ctx.out();
-=20
-     bool has_style =3D false;
-     if (ts.has_emphasis()) {
-       has_style =3D true;
-       auto emphasis =3D detail::make_emphasis<Char>(ts.get_emphasis());
--      out =3D std::copy(emphasis.begin(), emphasis.end(), out);
-+      out =3D detail::copy<Char>(emphasis.begin(), emphasis.end(), out)=
;
-     }
-     if (ts.has_foreground()) {
-       has_style =3D true;
-       auto foreground =3D
-           detail::make_foreground_color<Char>(ts.get_foreground());
--      out =3D std::copy(foreground.begin(), foreground.end(), out);
-+      out =3D detail::copy<Char>(foreground.begin(), foreground.end(), =
out);
-     }
-     if (ts.has_background()) {
-       has_style =3D true;
-       auto background =3D
-           detail::make_background_color<Char>(ts.get_background());
--      out =3D std::copy(background.begin(), background.end(), out);
-+      out =3D detail::copy<Char>(background.begin(), background.end(), =
out);
-     }
--    out =3D formatter<T, Char>::format(value, ctx);
-+    out =3D formatter<T, Char>::format(arg.value, ctx);
-     if (has_style) {
-       auto reset_color =3D string_view("\x1b[0m");
--      out =3D std::copy(reset_color.begin(), reset_color.end(), out);
-+      out =3D detail::copy<Char>(reset_color.begin(), reset_color.end()=
, out);
-     }
-     return out;
-   }
- };
-=20
- /**
--  \rst
--  Returns an argument that will be formatted using ANSI escape sequence=
s,
--  to be used in a formatting function.
--
--  **Example**::
--
--    fmt::print("Elapsed time: {0:.2f} seconds",
--               fmt::styled(1.23, fmt::fg(fmt::color::green) |
--                                 fmt::bg(fmt::color::blue)));
--  \endrst
-+ * Returns an argument that will be formatted using ANSI escape sequenc=
es,
-+ * to be used in a formatting function.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print("Elapsed time: {0:.2f} seconds",
-+ *                fmt::styled(1.23, fmt::fg(fmt::color::green) |
-+ *                                  fmt::bg(fmt::color::blue)));
-  */
- template <typename T>
- FMT_CONSTEXPR auto styled(const T& value, text_style ts)
-diff --git a/include/fmt/compile.h b/include/fmt/compile.h
-index 34a581d..08d9427 100644
---- a/include/fmt/compile.h
-+++ b/include/fmt/compile.h
-@@ -8,134 +8,41 @@
- #ifndef FMT_COMPILE_H_
- #define FMT_COMPILE_H_
-=20
-+#ifndef FMT_MODULE
-+#  include <iterator>  // std::back_inserter
-+#endif
-+
- #include "format.h"
-=20
- FMT_BEGIN_NAMESPACE
--namespace detail {
--
--template <typename Char, typename InputIt>
--FMT_CONSTEXPR inline counting_iterator copy_str(InputIt begin, InputIt =
end,
--                                                counting_iterator it) {
--  return it + (end - begin);
--}
--
--template <typename OutputIt> class truncating_iterator_base {
-- protected:
--  OutputIt out_;
--  size_t limit_;
--  size_t count_ =3D 0;
--
--  truncating_iterator_base() : out_(), limit_(0) {}
--
--  truncating_iterator_base(OutputIt out, size_t limit)
--      : out_(out), limit_(limit) {}
--
-- public:
--  using iterator_category =3D std::output_iterator_tag;
--  using value_type =3D typename std::iterator_traits<OutputIt>::value_t=
ype;
--  using difference_type =3D std::ptrdiff_t;
--  using pointer =3D void;
--  using reference =3D void;
--  FMT_UNCHECKED_ITERATOR(truncating_iterator_base);
--
--  OutputIt base() const { return out_; }
--  size_t count() const { return count_; }
--};
--
--// An output iterator that truncates the output and counts the number o=
f objects
--// written to it.
--template <typename OutputIt,
--          typename Enable =3D typename std::is_void<
--              typename std::iterator_traits<OutputIt>::value_type>::typ=
e>
--class truncating_iterator;
--
--template <typename OutputIt>
--class truncating_iterator<OutputIt, std::false_type>
--    : public truncating_iterator_base<OutputIt> {
--  mutable typename truncating_iterator_base<OutputIt>::value_type black=
hole_;
--
-- public:
--  using value_type =3D typename truncating_iterator_base<OutputIt>::val=
ue_type;
--
--  truncating_iterator() =3D default;
--
--  truncating_iterator(OutputIt out, size_t limit)
--      : truncating_iterator_base<OutputIt>(out, limit) {}
--
--  truncating_iterator& operator++() {
--    if (this->count_++ < this->limit_) ++this->out_;
--    return *this;
--  }
--
--  truncating_iterator operator++(int) {
--    auto it =3D *this;
--    ++*this;
--    return it;
--  }
--
--  value_type& operator*() const {
--    return this->count_ < this->limit_ ? *this->out_ : blackhole_;
--  }
--};
--
--template <typename OutputIt>
--class truncating_iterator<OutputIt, std::true_type>
--    : public truncating_iterator_base<OutputIt> {
-- public:
--  truncating_iterator() =3D default;
--
--  truncating_iterator(OutputIt out, size_t limit)
--      : truncating_iterator_base<OutputIt>(out, limit) {}
--
--  template <typename T> truncating_iterator& operator=3D(T val) {
--    if (this->count_++ < this->limit_) *this->out_++ =3D val;
--    return *this;
--  }
--
--  truncating_iterator& operator++() { return *this; }
--  truncating_iterator& operator++(int) { return *this; }
--  truncating_iterator& operator*() { return *this; }
--};
-=20
- // A compile-time string which is compiled into fast formatting code.
--class compiled_string {};
-+FMT_EXPORT class compiled_string {};
-=20
- template <typename S>
- struct is_compiled_string : std::is_base_of<compiled_string, S> {};
-=20
--/**
--  \rst
--  Converts a string literal *s* into a format string that will be parse=
d at
--  compile time and converted into efficient formatting code. Requires C=
++17
--  ``constexpr if`` compiler support.
--
--  **Example**::
-+namespace detail {
-=20
--    // Converts 42 into std::string using the most efficient method and=
 no
--    // runtime format string processing.
--    std::string s =3D fmt::format(FMT_COMPILE("{}"), 42);
--  \endrst
-+/**
-+ * Converts a string literal `s` into a format string that will be pars=
ed at
-+ * compile time and converted into efficient formatting code. Requires =
C++17
-+ * `constexpr if` compiler support.
-+ *
-+ * **Example**:
-+ *
-+ *     // Converts 42 into std::string using the most efficient method =
and no
-+ *     // runtime format string processing.
-+ *     std::string s =3D fmt::format(FMT_COMPILE("{}"), 42);
-  */
- #if defined(__cpp_if_constexpr) && defined(__cpp_return_type_deduction)
--#  define FMT_COMPILE(s) \
--    FMT_STRING_IMPL(s, fmt::detail::compiled_string, explicit)
-+#  define FMT_COMPILE(s) FMT_STRING_IMPL(s, fmt::compiled_string)
- #else
- #  define FMT_COMPILE(s) FMT_STRING(s)
- #endif
-=20
--#if FMT_USE_NONTYPE_TEMPLATE_ARGS
--template <typename Char, size_t N,
--          fmt::detail_exported::fixed_string<Char, N> Str>
--struct udl_compiled_string : compiled_string {
--  using char_type =3D Char;
--  explicit constexpr operator basic_string_view<char_type>() const {
--    return {Str.data, N - 1};
--  }
--};
--#endif
--
- template <typename T, typename... Tail>
--const T& first(const T& value, const Tail&...) {
-+auto first(const T& value, const Tail&...) -> const T& {
-   return value;
- }
-=20
-@@ -153,6 +60,29 @@ constexpr const auto& get([[maybe_unused]] const T& =
first,
-     return detail::get<N - 1>(rest...);
- }
-=20
-+#  if FMT_USE_NONTYPE_TEMPLATE_ARGS
-+template <int N, typename T, typename... Args, typename Char>
-+constexpr auto get_arg_index_by_name(basic_string_view<Char> name) -> i=
nt {
-+  if constexpr (is_static_named_arg<T>()) {
-+    if (name =3D=3D T::name) return N;
-+  }
-+  if constexpr (sizeof...(Args) > 0)
-+    return get_arg_index_by_name<N + 1, Args...>(name);
-+  (void)name;  // Workaround an MSVC bug about "unused" parameter.
-+  return -1;
-+}
-+#  endif
-+
-+template <typename... Args, typename Char>
-+FMT_CONSTEXPR auto get_arg_index_by_name(basic_string_view<Char> name) =
-> int {
-+#  if FMT_USE_NONTYPE_TEMPLATE_ARGS
-+  if constexpr (sizeof...(Args) > 0)
-+    return get_arg_index_by_name<0, Args...>(name);
-+#  endif
-+  (void)name;
-+  return -1;
-+}
-+
- template <typename Char, typename... Args>
- constexpr int get_arg_index_by_name(basic_string_view<Char> name,
-                                     type_list<Args...>) {
-@@ -196,7 +126,8 @@ template <typename Char> struct code_unit {
-=20
-   template <typename OutputIt, typename... Args>
-   constexpr OutputIt format(OutputIt out, const Args&...) const {
--    return write<Char>(out, value);
-+    *out++ =3D value;
-+    return out;
-   }
- };
-=20
-@@ -220,7 +151,13 @@ template <typename Char, typename T, int N> struct =
field {
-=20
-   template <typename OutputIt, typename... Args>
-   constexpr OutputIt format(OutputIt out, const Args&... args) const {
--    return write<Char>(out, get_arg_checked<T, N>(args...));
-+    const T& arg =3D get_arg_checked<T, N>(args...);
-+    if constexpr (std::is_convertible<T, basic_string_view<Char>>::valu=
e) {
-+      auto s =3D basic_string_view<Char>(arg);
-+      return copy<Char>(s.begin(), s.end(), out);
-+    } else {
-+      return write<Char>(out, arg);
-+    }
-   }
- };
-=20
-@@ -308,13 +245,12 @@ constexpr size_t parse_text(basic_string_view<Char=
> str, size_t pos) {
- }
-=20
- template <typename Args, size_t POS, int ID, typename S>
--constexpr auto compile_format_string(S format_str);
-+constexpr auto compile_format_string(S fmt);
-=20
- template <typename Args, size_t POS, int ID, typename T, typename S>
--constexpr auto parse_tail(T head, S format_str) {
--  if constexpr (POS !=3D
--                basic_string_view<typename S::char_type>(format_str).si=
ze()) {
--    constexpr auto tail =3D compile_format_string<Args, POS, ID>(format=
_str);
-+constexpr auto parse_tail(T head, S fmt) {
-+  if constexpr (POS !=3D basic_string_view<typename S::char_type>(fmt).=
size()) {
-+    constexpr auto tail =3D compile_format_string<Args, POS, ID>(fmt);
-     if constexpr (std::is_same<remove_cvref_t<decltype(tail)>,
-                                unknown_format>())
-       return tail;
-@@ -346,6 +282,7 @@ constexpr parse_specs_result<T, Char> parse_specs(ba=
sic_string_view<Char> str,
- }
-=20
- template <typename Char> struct arg_id_handler {
-+  arg_id_kind kind;
-   arg_ref<Char> arg_id;
-=20
-   constexpr int on_auto() {
-@@ -353,25 +290,28 @@ template <typename Char> struct arg_id_handler {
-     return 0;
-   }
-   constexpr int on_index(int id) {
-+    kind =3D arg_id_kind::index;
-     arg_id =3D arg_ref<Char>(id);
-     return 0;
-   }
-   constexpr int on_name(basic_string_view<Char> id) {
-+    kind =3D arg_id_kind::name;
-     arg_id =3D arg_ref<Char>(id);
-     return 0;
-   }
- };
-=20
- template <typename Char> struct parse_arg_id_result {
-+  arg_id_kind kind;
-   arg_ref<Char> arg_id;
-   const Char* arg_id_end;
- };
-=20
- template <int ID, typename Char>
- constexpr auto parse_arg_id(const Char* begin, const Char* end) {
--  auto handler =3D arg_id_handler<Char>{arg_ref<Char>{}};
-+  auto handler =3D arg_id_handler<Char>{arg_id_kind::none, arg_ref<Char=
>{}};
-   auto arg_id_end =3D parse_arg_id(begin, end, handler);
--  return parse_arg_id_result<Char>{handler.arg_id, arg_id_end};
-+  return parse_arg_id_result<Char>{handler.kind, handler.arg_id, arg_id=
_end};
- }
-=20
- template <typename T, typename Enable =3D void> struct field_type {
-@@ -385,14 +325,13 @@ struct field_type<T, enable_if_t<detail::is_named_=
arg<T>::value>> {
-=20
- template <typename T, typename Args, size_t END_POS, int ARG_INDEX, int=
 NEXT_ID,
-           typename S>
--constexpr auto parse_replacement_field_then_tail(S format_str) {
-+constexpr auto parse_replacement_field_then_tail(S fmt) {
-   using char_type =3D typename S::char_type;
--  constexpr auto str =3D basic_string_view<char_type>(format_str);
-+  constexpr auto str =3D basic_string_view<char_type>(fmt);
-   constexpr char_type c =3D END_POS !=3D str.size() ? str[END_POS] : ch=
ar_type();
-   if constexpr (c =3D=3D '}') {
-     return parse_tail<Args, END_POS + 1, NEXT_ID>(
--        field<char_type, typename field_type<T>::type, ARG_INDEX>(),
--        format_str);
-+        field<char_type, typename field_type<T>::type, ARG_INDEX>(), fm=
t);
-   } else if constexpr (c !=3D ':') {
-     FMT_THROW(format_error("expected ':'"));
-   } else {
-@@ -405,7 +344,7 @@ constexpr auto parse_replacement_field_then_tail(S f=
ormat_str) {
-       return parse_tail<Args, result.end + 1, result.next_arg_id>(
-           spec_field<char_type, typename field_type<T>::type, ARG_INDEX=
>{
-               result.fmt},
--          format_str);
-+          fmt);
-     }
-   }
- }
-@@ -413,22 +352,21 @@ constexpr auto parse_replacement_field_then_tail(S=
 format_str) {
- // Compiles a non-empty format string and returns the compiled represen=
tation
- // or unknown_format() on unrecognized input.
- template <typename Args, size_t POS, int ID, typename S>
--constexpr auto compile_format_string(S format_str) {
-+constexpr auto compile_format_string(S fmt) {
-   using char_type =3D typename S::char_type;
--  constexpr auto str =3D basic_string_view<char_type>(format_str);
-+  constexpr auto str =3D basic_string_view<char_type>(fmt);
-   if constexpr (str[POS] =3D=3D '{') {
-     if constexpr (POS + 1 =3D=3D str.size())
-       FMT_THROW(format_error("unmatched '{' in format string"));
-     if constexpr (str[POS + 1] =3D=3D '{') {
--      return parse_tail<Args, POS + 2, ID>(make_text(str, POS, 1), form=
at_str);
-+      return parse_tail<Args, POS + 2, ID>(make_text(str, POS, 1), fmt)=
;
-     } else if constexpr (str[POS + 1] =3D=3D '}' || str[POS + 1] =3D=3D=
 ':') {
-       static_assert(ID !=3D manual_indexing_id,
-                     "cannot switch from manual to automatic argument in=
dexing");
-       constexpr auto next_id =3D
-           ID !=3D manual_indexing_id ? ID + 1 : manual_indexing_id;
-       return parse_replacement_field_then_tail<get_type<ID, Args>, Args=
,
--                                               POS + 1, ID, next_id>(
--          format_str);
-+                                               POS + 1, ID, next_id>(fm=
t);
-     } else {
-       constexpr auto arg_id_result =3D
-           parse_arg_id<ID>(str.data() + POS + 1, str.data() + str.size(=
));
-@@ -436,28 +374,27 @@ constexpr auto compile_format_string(S format_str)=
 {
-       constexpr char_type c =3D
-           arg_id_end_pos !=3D str.size() ? str[arg_id_end_pos] : char_t=
ype();
-       static_assert(c =3D=3D '}' || c =3D=3D ':', "missing '}' in forma=
t string");
--      if constexpr (arg_id_result.arg_id.kind =3D=3D arg_id_kind::index=
) {
-+      if constexpr (arg_id_result.kind =3D=3D arg_id_kind::index) {
-         static_assert(
-             ID =3D=3D manual_indexing_id || ID =3D=3D 0,
-             "cannot switch from automatic to manual argument indexing")=
;
--        constexpr auto arg_index =3D arg_id_result.arg_id.val.index;
-+        constexpr auto arg_index =3D arg_id_result.arg_id.index;
-         return parse_replacement_field_then_tail<get_type<arg_index, Ar=
gs>,
-                                                  Args, arg_id_end_pos,
-                                                  arg_index, manual_inde=
xing_id>(
--            format_str);
--      } else if constexpr (arg_id_result.arg_id.kind =3D=3D arg_id_kind=
::name) {
-+            fmt);
-+      } else if constexpr (arg_id_result.kind =3D=3D arg_id_kind::name)=
 {
-         constexpr auto arg_index =3D
--            get_arg_index_by_name(arg_id_result.arg_id.val.name, Args{}=
);
-+            get_arg_index_by_name(arg_id_result.arg_id.name, Args{});
-         if constexpr (arg_index >=3D 0) {
-           constexpr auto next_id =3D
-               ID !=3D manual_indexing_id ? ID + 1 : manual_indexing_id;
-           return parse_replacement_field_then_tail<
-               decltype(get_type<arg_index, Args>::value), Args, arg_id_=
end_pos,
--              arg_index, next_id>(format_str);
-+              arg_index, next_id>(fmt);
-         } else if constexpr (c =3D=3D '}') {
-           return parse_tail<Args, arg_id_end_pos + 1, ID>(
--              runtime_named_field<char_type>{arg_id_result.arg_id.val.n=
ame},
--              format_str);
-+              runtime_named_field<char_type>{arg_id_result.arg_id.name}=
, fmt);
-         } else if constexpr (c =3D=3D ':') {
-           return unknown_format();  // no type info for specs parsing
-         }
-@@ -466,29 +403,26 @@ constexpr auto compile_format_string(S format_str)=
 {
-   } else if constexpr (str[POS] =3D=3D '}') {
-     if constexpr (POS + 1 =3D=3D str.size())
-       FMT_THROW(format_error("unmatched '}' in format string"));
--    return parse_tail<Args, POS + 2, ID>(make_text(str, POS, 1), format=
_str);
-+    return parse_tail<Args, POS + 2, ID>(make_text(str, POS, 1), fmt);
-   } else {
-     constexpr auto end =3D parse_text(str, POS + 1);
-     if constexpr (end - POS > 1) {
--      return parse_tail<Args, end, ID>(make_text(str, POS, end - POS),
--                                       format_str);
-+      return parse_tail<Args, end, ID>(make_text(str, POS, end - POS), =
fmt);
-     } else {
--      return parse_tail<Args, end, ID>(code_unit<char_type>{str[POS]},
--                                       format_str);
-+      return parse_tail<Args, end, ID>(code_unit<char_type>{str[POS]}, =
fmt);
-     }
-   }
- }
-=20
- template <typename... Args, typename S,
--          FMT_ENABLE_IF(detail::is_compiled_string<S>::value)>
--constexpr auto compile(S format_str) {
--  constexpr auto str =3D basic_string_view<typename S::char_type>(forma=
t_str);
-+          FMT_ENABLE_IF(is_compiled_string<S>::value)>
-+constexpr auto compile(S fmt) {
-+  constexpr auto str =3D basic_string_view<typename S::char_type>(fmt);
-   if constexpr (str.size() =3D=3D 0) {
-     return detail::make_text(str, 0, 0);
-   } else {
-     constexpr auto result =3D
--        detail::compile_format_string<detail::type_list<Args...>, 0, 0>=
(
--            format_str);
-+        detail::compile_format_string<detail::type_list<Args...>, 0, 0>=
(fmt);
-     return result;
-   }
- }
-@@ -517,7 +451,7 @@ constexpr FMT_INLINE OutputIt format_to(OutputIt out=
, const CompiledFormat& cf,
- }
-=20
- template <typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_compiled_string<S>::value)>
-+          FMT_ENABLE_IF(is_compiled_string<S>::value)>
- FMT_INLINE std::basic_string<typename S::char_type> format(const S&,
-                                                            Args&&... ar=
gs) {
-   if constexpr (std::is_same<typename S::char_type, char>::value) {
-@@ -544,7 +478,7 @@ FMT_INLINE std::basic_string<typename S::char_type> =
format(const S&,
- }
-=20
- template <typename OutputIt, typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_compiled_string<S>::value)>
-+          FMT_ENABLE_IF(is_compiled_string<S>::value)>
- FMT_CONSTEXPR OutputIt format_to(OutputIt out, const S&, Args&&... args=
) {
-   constexpr auto compiled =3D detail::compile<Args...>(S());
-   if constexpr (std::is_same<remove_cvref_t<decltype(compiled)>,
-@@ -559,42 +493,42 @@ FMT_CONSTEXPR OutputIt format_to(OutputIt out, con=
st S&, Args&&... args) {
- #endif
-=20
- template <typename OutputIt, typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_compiled_string<S>::value)>
--format_to_n_result<OutputIt> format_to_n(OutputIt out, size_t n,
--                                         const S& format_str, Args&&...=
 args) {
--  auto it =3D fmt::format_to(detail::truncating_iterator<OutputIt>(out,=
 n),
--                           format_str, std::forward<Args>(args)...);
--  return {it.base(), it.count()};
-+          FMT_ENABLE_IF(is_compiled_string<S>::value)>
-+auto format_to_n(OutputIt out, size_t n, const S& fmt, Args&&... args)
-+    -> format_to_n_result<OutputIt> {
-+  using traits =3D detail::fixed_buffer_traits;
-+  auto buf =3D detail::iterator_buffer<OutputIt, char, traits>(out, n);
-+  fmt::format_to(std::back_inserter(buf), fmt, std::forward<Args>(args)=
...);
-+  return {buf.out(), buf.count()};
- }
-=20
- template <typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_compiled_string<S>::value)>
--FMT_CONSTEXPR20 size_t formatted_size(const S& format_str,
--                                      const Args&... args) {
--  return fmt::format_to(detail::counting_iterator(), format_str, args..=
.)
--      .count();
-+          FMT_ENABLE_IF(is_compiled_string<S>::value)>
-+FMT_CONSTEXPR20 auto formatted_size(const S& fmt, const Args&... args)
-+    -> size_t {
-+  auto buf =3D detail::counting_buffer<>();
-+  fmt::format_to(appender(buf), fmt, args...);
-+  return buf.count();
- }
-=20
- template <typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_compiled_string<S>::value)>
--void print(std::FILE* f, const S& format_str, const Args&... args) {
--  memory_buffer buffer;
--  fmt::format_to(std::back_inserter(buffer), format_str, args...);
--  detail::print(f, {buffer.data(), buffer.size()});
-+          FMT_ENABLE_IF(is_compiled_string<S>::value)>
-+void print(std::FILE* f, const S& fmt, const Args&... args) {
-+  auto buf =3D memory_buffer();
-+  fmt::format_to(appender(buf), fmt, args...);
-+  detail::print(f, {buf.data(), buf.size()});
- }
-=20
- template <typename S, typename... Args,
--          FMT_ENABLE_IF(detail::is_compiled_string<S>::value)>
--void print(const S& format_str, const Args&... args) {
--  print(stdout, format_str, args...);
-+          FMT_ENABLE_IF(is_compiled_string<S>::value)>
-+void print(const S& fmt, const Args&... args) {
-+  print(stdout, fmt, args...);
- }
-=20
- #if FMT_USE_NONTYPE_TEMPLATE_ARGS
- inline namespace literals {
--template <detail_exported::fixed_string Str> constexpr auto operator""_=
cf() {
--  using char_t =3D remove_cvref_t<decltype(Str.data[0])>;
--  return detail::udl_compiled_string<char_t, sizeof(Str.data) / sizeof(=
char_t),
--                                     Str>();
-+template <detail::fixed_string Str> constexpr auto operator""_cf() {
-+  return FMT_COMPILE(Str.data);
- }
- }  // namespace literals
- #endif
-diff --git a/include/fmt/core.h b/include/fmt/core.h
-index 4c31964..8ca735f 100644
---- a/include/fmt/core.h
-+++ b/include/fmt/core.h
-@@ -1,2905 +1,5 @@
--// Formatting library for C++ - the core API for char/UTF-8
--//
--// Copyright (c) 2012 - present, Victor Zverovich
--// All rights reserved.
--//
--// For the license information refer to format.h.
-+// This file is only provided for compatibility and may be removed in f=
uture
-+// versions. Use fmt/base.h if you don't need fmt::format and fmt/forma=
t.h
-+// otherwise.
-=20
--#ifndef FMT_CORE_H_
--#define FMT_CORE_H_
--
--#include <cstddef>  // std::byte
--#include <cstdio>   // std::FILE
--#include <cstring>  // std::strlen
--#include <iterator>
--#include <limits>
--#include <string>
--#include <type_traits>
--
--// The fmt library version in the form major * 10000 + minor * 100 + pa=
tch.
--#define FMT_VERSION 100001
--
--#if defined(__clang__) && !defined(__ibmxl__)
--#  define FMT_CLANG_VERSION (__clang_major__ * 100 + __clang_minor__)
--#else
--#  define FMT_CLANG_VERSION 0
--#endif
--
--#if defined(__GNUC__) && !defined(__clang__) && !defined(__INTEL_COMPIL=
ER) && \
--    !defined(__NVCOMPILER)
--#  define FMT_GCC_VERSION (__GNUC__ * 100 + __GNUC_MINOR__)
--#else
--#  define FMT_GCC_VERSION 0
--#endif
--
--#ifndef FMT_GCC_PRAGMA
--// Workaround _Pragma bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
59884.
--#  if FMT_GCC_VERSION >=3D 504
--#    define FMT_GCC_PRAGMA(arg) _Pragma(arg)
--#  else
--#    define FMT_GCC_PRAGMA(arg)
--#  endif
--#endif
--
--#ifdef __ICL
--#  define FMT_ICC_VERSION __ICL
--#elif defined(__INTEL_COMPILER)
--#  define FMT_ICC_VERSION __INTEL_COMPILER
--#else
--#  define FMT_ICC_VERSION 0
--#endif
--
--#ifdef _MSC_VER
--#  define FMT_MSC_VERSION _MSC_VER
--#  define FMT_MSC_WARNING(...) __pragma(warning(__VA_ARGS__))
--#else
--#  define FMT_MSC_VERSION 0
--#  define FMT_MSC_WARNING(...)
--#endif
--
--#ifdef _MSVC_LANG
--#  define FMT_CPLUSPLUS _MSVC_LANG
--#else
--#  define FMT_CPLUSPLUS __cplusplus
--#endif
--
--#ifdef __has_feature
--#  define FMT_HAS_FEATURE(x) __has_feature(x)
--#else
--#  define FMT_HAS_FEATURE(x) 0
--#endif
--
--#if defined(__has_include) || FMT_ICC_VERSION >=3D 1600 || FMT_MSC_VERS=
ION > 1900
--#  define FMT_HAS_INCLUDE(x) __has_include(x)
--#else
--#  define FMT_HAS_INCLUDE(x) 0
--#endif
--
--#ifdef __has_cpp_attribute
--#  define FMT_HAS_CPP_ATTRIBUTE(x) __has_cpp_attribute(x)
--#else
--#  define FMT_HAS_CPP_ATTRIBUTE(x) 0
--#endif
--
--#define FMT_HAS_CPP14_ATTRIBUTE(attribute) \
--  (FMT_CPLUSPLUS >=3D 201402L && FMT_HAS_CPP_ATTRIBUTE(attribute))
--
--#define FMT_HAS_CPP17_ATTRIBUTE(attribute) \
--  (FMT_CPLUSPLUS >=3D 201703L && FMT_HAS_CPP_ATTRIBUTE(attribute))
--
--// Check if relaxed C++14 constexpr is supported.
--// GCC doesn't allow throw in constexpr until version 6 (bug 67371).
--#ifndef FMT_USE_CONSTEXPR
--#  if (FMT_HAS_FEATURE(cxx_relaxed_constexpr) || FMT_MSC_VERSION >=3D 1=
912 || \
--       (FMT_GCC_VERSION >=3D 600 && FMT_CPLUSPLUS >=3D 201402L)) &&    =
         \
--      !FMT_ICC_VERSION && !defined(__NVCC__)
--#    define FMT_USE_CONSTEXPR 1
--#  else
--#    define FMT_USE_CONSTEXPR 0
--#  endif
--#endif
--#if FMT_USE_CONSTEXPR
--#  define FMT_CONSTEXPR constexpr
--#else
--#  define FMT_CONSTEXPR
--#endif
--
--#if ((FMT_CPLUSPLUS >=3D 202002L) &&                            \
--     (!defined(_GLIBCXX_RELEASE) || _GLIBCXX_RELEASE > 9)) || \
--    (FMT_CPLUSPLUS >=3D 201709L && FMT_GCC_VERSION >=3D 1002)
--#  define FMT_CONSTEXPR20 constexpr
--#else
--#  define FMT_CONSTEXPR20
--#endif
--
--// Check if constexpr std::char_traits<>::{compare,length} are supporte=
d.
--#if defined(__GLIBCXX__)
--#  if FMT_CPLUSPLUS >=3D 201703L && defined(_GLIBCXX_RELEASE) && \
--      _GLIBCXX_RELEASE >=3D 7  // GCC 7+ libstdc++ has _GLIBCXX_RELEASE=
.
--#    define FMT_CONSTEXPR_CHAR_TRAITS constexpr
--#  endif
--#elif defined(_LIBCPP_VERSION) && FMT_CPLUSPLUS >=3D 201703L && \
--    _LIBCPP_VERSION >=3D 4000
--#  define FMT_CONSTEXPR_CHAR_TRAITS constexpr
--#elif FMT_MSC_VERSION >=3D 1914 && FMT_CPLUSPLUS >=3D 201703L
--#  define FMT_CONSTEXPR_CHAR_TRAITS constexpr
--#endif
--#ifndef FMT_CONSTEXPR_CHAR_TRAITS
--#  define FMT_CONSTEXPR_CHAR_TRAITS
--#endif
--
--// Check if exceptions are disabled.
--#ifndef FMT_EXCEPTIONS
--#  if (defined(__GNUC__) && !defined(__EXCEPTIONS)) || \
--      (FMT_MSC_VERSION && !_HAS_EXCEPTIONS)
--#    define FMT_EXCEPTIONS 0
--#  else
--#    define FMT_EXCEPTIONS 1
--#  endif
--#endif
--
--// Disable [[noreturn]] on MSVC/NVCC because of bogus unreachable code =
warnings.
--#if FMT_EXCEPTIONS && FMT_HAS_CPP_ATTRIBUTE(noreturn) && !FMT_MSC_VERSI=
ON && \
--    !defined(__NVCC__)
--#  define FMT_NORETURN [[noreturn]]
--#else
--#  define FMT_NORETURN
--#endif
--
--#ifndef FMT_NODISCARD
--#  if FMT_HAS_CPP17_ATTRIBUTE(nodiscard)
--#    define FMT_NODISCARD [[nodiscard]]
--#  else
--#    define FMT_NODISCARD
--#  endif
--#endif
--
--#ifndef FMT_INLINE
--#  if FMT_GCC_VERSION || FMT_CLANG_VERSION
--#    define FMT_INLINE inline __attribute__((always_inline))
--#  else
--#    define FMT_INLINE inline
--#  endif
--#endif
--
--#ifdef _MSC_VER
--#  define FMT_UNCHECKED_ITERATOR(It) \
--    using _Unchecked_type =3D It  // Mark iterator as checked.
--#else
--#  define FMT_UNCHECKED_ITERATOR(It) using unchecked_type =3D It
--#endif
--
--#ifndef FMT_BEGIN_NAMESPACE
--#  define FMT_BEGIN_NAMESPACE \
--    namespace fmt {           \
--    inline namespace v10 {
--#  define FMT_END_NAMESPACE \
--    }                       \
--    }
--#endif
--
--#ifndef FMT_EXPORT
--#  define FMT_EXPORT
--#  define FMT_BEGIN_EXPORT
--#  define FMT_END_EXPORT
--#endif
--
--#if !defined(FMT_HEADER_ONLY) && defined(_WIN32)
--#  ifdef FMT_LIB_EXPORT
--#    define FMT_API __declspec(dllexport)
--#  elif defined(FMT_SHARED)
--#    define FMT_API __declspec(dllimport)
--#  endif
--#else
--#  if defined(FMT_LIB_EXPORT) || defined(FMT_SHARED)
--#    if defined(__GNUC__) || defined(__clang__)
--#      define FMT_API __attribute__((visibility("default")))
--#    endif
--#  endif
--#endif
--#ifndef FMT_API
--#  define FMT_API
--#endif
--
--// libc++ supports string_view in pre-c++17.
--#if FMT_HAS_INCLUDE(<string_view>) && \
--    (FMT_CPLUSPLUS >=3D 201703L || defined(_LIBCPP_VERSION))
--#  include <string_view>
--#  define FMT_USE_STRING_VIEW
--#elif FMT_HAS_INCLUDE("experimental/string_view") && FMT_CPLUSPLUS >=3D=
 201402L
--#  include <experimental/string_view>
--#  define FMT_USE_EXPERIMENTAL_STRING_VIEW
--#endif
--
--#ifndef FMT_UNICODE
--#  define FMT_UNICODE !FMT_MSC_VERSION
--#endif
--
--#ifndef FMT_CONSTEVAL
--#  if ((FMT_GCC_VERSION >=3D 1000 || FMT_CLANG_VERSION >=3D 1101) && \
--       (!defined(__apple_build_version__) ||                     \
--        __apple_build_version__ >=3D 14000029L) &&                 \
--       FMT_CPLUSPLUS >=3D 202002L) ||                              \
--      (defined(__cpp_consteval) &&                               \
--       (!FMT_MSC_VERSION || _MSC_FULL_VER >=3D 193030704))
--// consteval is broken in MSVC before VS2022 and Apple clang before 14.
--#    define FMT_CONSTEVAL consteval
--#    define FMT_HAS_CONSTEVAL
--#  else
--#    define FMT_CONSTEVAL
--#  endif
--#endif
--
--#ifndef FMT_USE_NONTYPE_TEMPLATE_ARGS
--#  if defined(__cpp_nontype_template_args) &&                  \
--      ((FMT_GCC_VERSION >=3D 903 && FMT_CPLUSPLUS >=3D 201709L) || \
--       __cpp_nontype_template_args >=3D 201911L) &&              \
--      !defined(__NVCOMPILER) && !defined(__LCC__)
--#    define FMT_USE_NONTYPE_TEMPLATE_ARGS 1
--#  else
--#    define FMT_USE_NONTYPE_TEMPLATE_ARGS 0
--#  endif
--#endif
--
--// Enable minimal optimizations for more compact code in debug mode.
--FMT_GCC_PRAGMA("GCC push_options")
--#if !defined(__OPTIMIZE__) && !defined(__NVCOMPILER) && !defined(__LCC_=
_) && \
--    !defined(__CUDACC__)
--FMT_GCC_PRAGMA("GCC optimize(\"Og\")")
--#endif
--
--FMT_BEGIN_NAMESPACE
--
--// Implementations of enable_if_t and other metafunctions for older sys=
tems.
--template <bool B, typename T =3D void>
--using enable_if_t =3D typename std::enable_if<B, T>::type;
--template <bool B, typename T, typename F>
--using conditional_t =3D typename std::conditional<B, T, F>::type;
--template <bool B> using bool_constant =3D std::integral_constant<bool, =
B>;
--template <typename T>
--using remove_reference_t =3D typename std::remove_reference<T>::type;
--template <typename T>
--using remove_const_t =3D typename std::remove_const<T>::type;
--template <typename T>
--using remove_cvref_t =3D typename std::remove_cv<remove_reference_t<T>>=
::type;
--template <typename T> struct type_identity { using type =3D T; };
--template <typename T> using type_identity_t =3D typename type_identity<=
T>::type;
--template <typename T>
--using underlying_t =3D typename std::underlying_type<T>::type;
--
--// Checks whether T is a container with contiguous storage.
--template <typename T> struct is_contiguous : std::false_type {};
--template <typename Char>
--struct is_contiguous<std::basic_string<Char>> : std::true_type {};
--
--struct monostate {
--  constexpr monostate() {}
--};
--
--// An enable_if helper to be used in template parameters which results =
in much
--// shorter symbols: https://godbolt.org/z/sWw4vP. Extra parentheses are=
 needed
--// to workaround a bug in MSVC 2019 (see #1140 and #1186).
--#ifdef FMT_DOC
--#  define FMT_ENABLE_IF(...)
--#else
--#  define FMT_ENABLE_IF(...) fmt::enable_if_t<(__VA_ARGS__), int> =3D 0
--#endif
--
--// This is defined in core.h instead of format.h to avoid injecting in =
std.
--#ifdef __cpp_lib_byte
--inline auto format_as(std::byte b) -> unsigned char {
--  return static_cast<unsigned char>(b);
--}
--#endif
--
--namespace detail {
--// Suppresses "unused variable" warnings with the method described in
--// https://herbsutter.com/2009/10/18/mailbag-shutting-up-compiler-warni=
ngs/.
--// (void)var does not work on many Intel compilers.
--template <typename... T> FMT_CONSTEXPR void ignore_unused(const T&...) =
{}
--
--constexpr FMT_INLINE auto is_constant_evaluated(
--    bool default_value =3D false) noexcept -> bool {
--// Workaround for incompatibility between libstdc++ consteval-based
--// std::is_constant_evaluated() implementation and clang-14.
--// https://github.com/fmtlib/fmt/issues/3247
--#if FMT_CPLUSPLUS >=3D 202002L && defined(_GLIBCXX_RELEASE) && \
--    _GLIBCXX_RELEASE >=3D 12 &&                                \
--    (FMT_CLANG_VERSION >=3D 1400 && FMT_CLANG_VERSION < 1500)
--  ignore_unused(default_value);
--  return __builtin_is_constant_evaluated();
--#elif defined(__cpp_lib_is_constant_evaluated)
--  ignore_unused(default_value);
--  return std::is_constant_evaluated();
--#else
--  return default_value;
--#endif
--}
--
--// Suppresses "conditional expression is constant" warnings.
--template <typename T> constexpr FMT_INLINE auto const_check(T value) ->=
 T {
--  return value;
--}
--
--FMT_NORETURN FMT_API void assert_fail(const char* file, int line,
--                                      const char* message);
--
--#ifndef FMT_ASSERT
--#  ifdef NDEBUG
--// FMT_ASSERT is not empty to avoid -Wempty-body.
--#    define FMT_ASSERT(condition, message) \
--      fmt::detail::ignore_unused((condition), (message))
--#  else
--#    define FMT_ASSERT(condition, message)                             =
       \
--      ((condition) /* void() fails with -Winvalid-constexpr on clang 4.=
0.1 */ \
--           ? (void)0                                                   =
       \
--           : fmt::detail::assert_fail(__FILE__, __LINE__, (message)))
--#  endif
--#endif
--
--#if defined(FMT_USE_STRING_VIEW)
--template <typename Char> using std_string_view =3D std::basic_string_vi=
ew<Char>;
--#elif defined(FMT_USE_EXPERIMENTAL_STRING_VIEW)
--template <typename Char>
--using std_string_view =3D std::experimental::basic_string_view<Char>;
--#else
--template <typename T> struct std_string_view {};
--#endif
--
--#ifdef FMT_USE_INT128
--// Do nothing.
--#elif defined(__SIZEOF_INT128__) && !defined(__NVCC__) && \
--    !(FMT_CLANG_VERSION && FMT_MSC_VERSION)
--#  define FMT_USE_INT128 1
--using int128_opt =3D __int128_t;  // An optional native 128-bit integer=
.
--using uint128_opt =3D __uint128_t;
--template <typename T> inline auto convert_for_visit(T value) -> T {
--  return value;
--}
--#else
--#  define FMT_USE_INT128 0
--#endif
--#if !FMT_USE_INT128
--enum class int128_opt {};
--enum class uint128_opt {};
--// Reduce template instantiations.
--template <typename T> auto convert_for_visit(T) -> monostate { return {=
}; }
--#endif
--
--// Casts a nonnegative integer to unsigned.
--template <typename Int>
--FMT_CONSTEXPR auto to_unsigned(Int value) ->
--    typename std::make_unsigned<Int>::type {
--  FMT_ASSERT(std::is_unsigned<Int>::value || value >=3D 0, "negative va=
lue");
--  return static_cast<typename std::make_unsigned<Int>::type>(value);
--}
--
--FMT_CONSTEXPR inline auto is_utf8() -> bool {
--  FMT_MSC_WARNING(suppress : 4566) constexpr unsigned char section[] =3D=
 "\u00A7";
--
--  // Avoid buggy sign extensions in MSVC's constant evaluation mode (#2=
297).
--  using uchar =3D unsigned char;
--  return FMT_UNICODE || (sizeof(section) =3D=3D 3 && uchar(section[0]) =
=3D=3D 0xC2 &&
--                         uchar(section[1]) =3D=3D 0xA7);
--}
--}  // namespace detail
--
--/**
--  An implementation of ``std::basic_string_view`` for pre-C++17. It pro=
vides a
--  subset of the API. ``fmt::basic_string_view`` is used for format stri=
ngs even
--  if ``std::string_view`` is available to prevent issues when a library=
 is
--  compiled with a different ``-std`` option than the client code (which=
 is not
--  recommended).
-- */
--FMT_EXPORT
--template <typename Char> class basic_string_view {
-- private:
--  const Char* data_;
--  size_t size_;
--
-- public:
--  using value_type =3D Char;
--  using iterator =3D const Char*;
--
--  constexpr basic_string_view() noexcept : data_(nullptr), size_(0) {}
--
--  /** Constructs a string reference object from a C string and a size. =
*/
--  constexpr basic_string_view(const Char* s, size_t count) noexcept
--      : data_(s), size_(count) {}
--
--  /**
--    \rst
--    Constructs a string reference object from a C string computing
--    the size with ``std::char_traits<Char>::length``.
--    \endrst
--   */
--  FMT_CONSTEXPR_CHAR_TRAITS
--  FMT_INLINE
--  basic_string_view(const Char* s)
--      : data_(s),
--        size_(detail::const_check(std::is_same<Char, char>::value &&
--                                  !detail::is_constant_evaluated(true))
--                  ? std::strlen(reinterpret_cast<const char*>(s))
--                  : std::char_traits<Char>::length(s)) {}
--
--  /** Constructs a string reference from a ``std::basic_string`` object=
. */
--  template <typename Traits, typename Alloc>
--  FMT_CONSTEXPR basic_string_view(
--      const std::basic_string<Char, Traits, Alloc>& s) noexcept
--      : data_(s.data()), size_(s.size()) {}
--
--  template <typename S, FMT_ENABLE_IF(std::is_same<
--                                      S, detail::std_string_view<Char>>=
::value)>
--  FMT_CONSTEXPR basic_string_view(S s) noexcept
--      : data_(s.data()), size_(s.size()) {}
--
--  /** Returns a pointer to the string data. */
--  constexpr auto data() const noexcept -> const Char* { return data_; }
--
--  /** Returns the string size. */
--  constexpr auto size() const noexcept -> size_t { return size_; }
--
--  constexpr auto begin() const noexcept -> iterator { return data_; }
--  constexpr auto end() const noexcept -> iterator { return data_ + size=
_; }
--
--  constexpr auto operator[](size_t pos) const noexcept -> const Char& {
--    return data_[pos];
--  }
--
--  FMT_CONSTEXPR void remove_prefix(size_t n) noexcept {
--    data_ +=3D n;
--    size_ -=3D n;
--  }
--
--  FMT_CONSTEXPR_CHAR_TRAITS bool starts_with(
--      basic_string_view<Char> sv) const noexcept {
--    return size_ >=3D sv.size_ &&
--           std::char_traits<Char>::compare(data_, sv.data_, sv.size_) =3D=
=3D 0;
--  }
--  FMT_CONSTEXPR_CHAR_TRAITS bool starts_with(Char c) const noexcept {
--    return size_ >=3D 1 && std::char_traits<Char>::eq(*data_, c);
--  }
--  FMT_CONSTEXPR_CHAR_TRAITS bool starts_with(const Char* s) const {
--    return starts_with(basic_string_view<Char>(s));
--  }
--
--  // Lexicographically compare this string reference to other.
--  FMT_CONSTEXPR_CHAR_TRAITS auto compare(basic_string_view other) const=
 -> int {
--    size_t str_size =3D size_ < other.size_ ? size_ : other.size_;
--    int result =3D std::char_traits<Char>::compare(data_, other.data_, =
str_size);
--    if (result =3D=3D 0)
--      result =3D size_ =3D=3D other.size_ ? 0 : (size_ < other.size_ ? =
-1 : 1);
--    return result;
--  }
--
--  FMT_CONSTEXPR_CHAR_TRAITS friend auto operator=3D=3D(basic_string_vie=
w lhs,
--                                                   basic_string_view rh=
s)
--      -> bool {
--    return lhs.compare(rhs) =3D=3D 0;
--  }
--  friend auto operator!=3D(basic_string_view lhs, basic_string_view rhs=
) -> bool {
--    return lhs.compare(rhs) !=3D 0;
--  }
--  friend auto operator<(basic_string_view lhs, basic_string_view rhs) -=
> bool {
--    return lhs.compare(rhs) < 0;
--  }
--  friend auto operator<=3D(basic_string_view lhs, basic_string_view rhs=
) -> bool {
--    return lhs.compare(rhs) <=3D 0;
--  }
--  friend auto operator>(basic_string_view lhs, basic_string_view rhs) -=
> bool {
--    return lhs.compare(rhs) > 0;
--  }
--  friend auto operator>=3D(basic_string_view lhs, basic_string_view rhs=
) -> bool {
--    return lhs.compare(rhs) >=3D 0;
--  }
--};
--
--FMT_EXPORT
--using string_view =3D basic_string_view<char>;
--
--/** Specifies if ``T`` is a character type. Can be specialized by users=
. */
--FMT_EXPORT
--template <typename T> struct is_char : std::false_type {};
--template <> struct is_char<char> : std::true_type {};
--
--namespace detail {
--
--// A base class for compile-time strings.
--struct compile_string {};
--
--template <typename S>
--struct is_compile_string : std::is_base_of<compile_string, S> {};
--
--template <typename Char, FMT_ENABLE_IF(is_char<Char>::value)>
--FMT_INLINE auto to_string_view(const Char* s) -> basic_string_view<Char=
> {
--  return s;
--}
--template <typename Char, typename Traits, typename Alloc>
--inline auto to_string_view(const std::basic_string<Char, Traits, Alloc>=
& s)
--    -> basic_string_view<Char> {
--  return s;
--}
--template <typename Char>
--constexpr auto to_string_view(basic_string_view<Char> s)
--    -> basic_string_view<Char> {
--  return s;
--}
--template <typename Char,
--          FMT_ENABLE_IF(!std::is_empty<std_string_view<Char>>::value)>
--inline auto to_string_view(std_string_view<Char> s) -> basic_string_vie=
w<Char> {
--  return s;
--}
--template <typename S, FMT_ENABLE_IF(is_compile_string<S>::value)>
--constexpr auto to_string_view(const S& s)
--    -> basic_string_view<typename S::char_type> {
--  return basic_string_view<typename S::char_type>(s);
--}
--void to_string_view(...);
--
--// Specifies whether S is a string type convertible to fmt::basic_strin=
g_view.
--// It should be a constexpr function but MSVC 2017 fails to compile it =
in
--// enable_if and MSVC 2015 fails to compile it as an alias template.
--// ADL is intentionally disabled as to_string_view is not an extension =
point.
--template <typename S>
--struct is_string
--    : std::is_class<decltype(detail::to_string_view(std::declval<S>()))=
> {};
--
--template <typename S, typename =3D void> struct char_t_impl {};
--template <typename S> struct char_t_impl<S, enable_if_t<is_string<S>::v=
alue>> {
--  using result =3D decltype(to_string_view(std::declval<S>()));
--  using type =3D typename result::value_type;
--};
--
--enum class type {
--  none_type,
--  // Integer types should go first,
--  int_type,
--  uint_type,
--  long_long_type,
--  ulong_long_type,
--  int128_type,
--  uint128_type,
--  bool_type,
--  char_type,
--  last_integer_type =3D char_type,
--  // followed by floating-point types.
--  float_type,
--  double_type,
--  long_double_type,
--  last_numeric_type =3D long_double_type,
--  cstring_type,
--  string_type,
--  pointer_type,
--  custom_type
--};
--
--// Maps core type T to the corresponding type enum constant.
--template <typename T, typename Char>
--struct type_constant : std::integral_constant<type, type::custom_type> =
{};
--
--#define FMT_TYPE_CONSTANT(Type, constant) \
--  template <typename Char>                \
--  struct type_constant<Type, Char>        \
--      : std::integral_constant<type, type::constant> {}
--
--FMT_TYPE_CONSTANT(int, int_type);
--FMT_TYPE_CONSTANT(unsigned, uint_type);
--FMT_TYPE_CONSTANT(long long, long_long_type);
--FMT_TYPE_CONSTANT(unsigned long long, ulong_long_type);
--FMT_TYPE_CONSTANT(int128_opt, int128_type);
--FMT_TYPE_CONSTANT(uint128_opt, uint128_type);
--FMT_TYPE_CONSTANT(bool, bool_type);
--FMT_TYPE_CONSTANT(Char, char_type);
--FMT_TYPE_CONSTANT(float, float_type);
--FMT_TYPE_CONSTANT(double, double_type);
--FMT_TYPE_CONSTANT(long double, long_double_type);
--FMT_TYPE_CONSTANT(const Char*, cstring_type);
--FMT_TYPE_CONSTANT(basic_string_view<Char>, string_type);
--FMT_TYPE_CONSTANT(const void*, pointer_type);
--
--constexpr bool is_integral_type(type t) {
--  return t > type::none_type && t <=3D type::last_integer_type;
--}
--constexpr bool is_arithmetic_type(type t) {
--  return t > type::none_type && t <=3D type::last_numeric_type;
--}
--
--constexpr auto set(type rhs) -> int { return 1 << static_cast<int>(rhs)=
; }
--constexpr auto in(type t, int set) -> bool {
--  return ((set >> static_cast<int>(t)) & 1) !=3D 0;
--}
--
--// Bitsets of types.
--enum {
--  sint_set =3D
--      set(type::int_type) | set(type::long_long_type) | set(type::int12=
8_type),
--  uint_set =3D set(type::uint_type) | set(type::ulong_long_type) |
--             set(type::uint128_type),
--  bool_set =3D set(type::bool_type),
--  char_set =3D set(type::char_type),
--  float_set =3D set(type::float_type) | set(type::double_type) |
--              set(type::long_double_type),
--  string_set =3D set(type::string_type),
--  cstring_set =3D set(type::cstring_type),
--  pointer_set =3D set(type::pointer_type)
--};
--
--FMT_NORETURN FMT_API void throw_format_error(const char* message);
--
--struct error_handler {
--  constexpr error_handler() =3D default;
--
--  // This function is intentionally not constexpr to give a compile-tim=
e error.
--  FMT_NORETURN void on_error(const char* message) {
--    throw_format_error(message);
--  }
--};
--}  // namespace detail
--
--/** String's character type. */
--template <typename S> using char_t =3D typename detail::char_t_impl<S>:=
:type;
--
--/**
--  \rst
--  Parsing context consisting of a format string range being parsed and =
an
--  argument counter for automatic indexing.
--  You can use the ``format_parse_context`` type alias for ``char`` inst=
ead.
--  \endrst
-- */
--FMT_EXPORT
--template <typename Char> class basic_format_parse_context {
-- private:
--  basic_string_view<Char> format_str_;
--  int next_arg_id_;
--
--  FMT_CONSTEXPR void do_check_arg_id(int id);
--
-- public:
--  using char_type =3D Char;
--  using iterator =3D const Char*;
--
--  explicit constexpr basic_format_parse_context(
--      basic_string_view<Char> format_str, int next_arg_id =3D 0)
--      : format_str_(format_str), next_arg_id_(next_arg_id) {}
--
--  /**
--    Returns an iterator to the beginning of the format string range bei=
ng
--    parsed.
--   */
--  constexpr auto begin() const noexcept -> iterator {
--    return format_str_.begin();
--  }
--
--  /**
--    Returns an iterator past the end of the format string range being p=
arsed.
--   */
--  constexpr auto end() const noexcept -> iterator { return format_str_.=
end(); }
--
--  /** Advances the begin iterator to ``it``. */
--  FMT_CONSTEXPR void advance_to(iterator it) {
--    format_str_.remove_prefix(detail::to_unsigned(it - begin()));
--  }
--
--  /**
--    Reports an error if using the manual argument indexing; otherwise r=
eturns
--    the next argument index and switches to the automatic indexing.
--   */
--  FMT_CONSTEXPR auto next_arg_id() -> int {
--    if (next_arg_id_ < 0) {
--      detail::throw_format_error(
--          "cannot switch from manual to automatic argument indexing");
--      return 0;
--    }
--    int id =3D next_arg_id_++;
--    do_check_arg_id(id);
--    return id;
--  }
--
--  /**
--    Reports an error if using the automatic argument indexing; otherwis=
e
--    switches to the manual indexing.
--   */
--  FMT_CONSTEXPR void check_arg_id(int id) {
--    if (next_arg_id_ > 0) {
--      detail::throw_format_error(
--          "cannot switch from automatic to manual argument indexing");
--      return;
--    }
--    next_arg_id_ =3D -1;
--    do_check_arg_id(id);
--  }
--  FMT_CONSTEXPR void check_arg_id(basic_string_view<Char>) {}
--  FMT_CONSTEXPR void check_dynamic_spec(int arg_id);
--};
--
--FMT_EXPORT
--using format_parse_context =3D basic_format_parse_context<char>;
--
--namespace detail {
--// A parse context with extra data used only in compile-time checks.
--template <typename Char>
--class compile_parse_context : public basic_format_parse_context<Char> {
-- private:
--  int num_args_;
--  const type* types_;
--  using base =3D basic_format_parse_context<Char>;
--
-- public:
--  explicit FMT_CONSTEXPR compile_parse_context(
--      basic_string_view<Char> format_str, int num_args, const type* typ=
es,
--      int next_arg_id =3D 0)
--      : base(format_str, next_arg_id), num_args_(num_args), types_(type=
s) {}
--
--  constexpr auto num_args() const -> int { return num_args_; }
--  constexpr auto arg_type(int id) const -> type { return types_[id]; }
--
--  FMT_CONSTEXPR auto next_arg_id() -> int {
--    int id =3D base::next_arg_id();
--    if (id >=3D num_args_) throw_format_error("argument not found");
--    return id;
--  }
--
--  FMT_CONSTEXPR void check_arg_id(int id) {
--    base::check_arg_id(id);
--    if (id >=3D num_args_) throw_format_error("argument not found");
--  }
--  using base::check_arg_id;
--
--  FMT_CONSTEXPR void check_dynamic_spec(int arg_id) {
--    detail::ignore_unused(arg_id);
--#if !defined(__LCC__)
--    if (arg_id < num_args_ && types_ && !is_integral_type(types_[arg_id=
]))
--      throw_format_error("width/precision is not integer");
--#endif
--  }
--};
--
--// Extracts a reference to the container from back_insert_iterator.
--template <typename Container>
--inline auto get_container(std::back_insert_iterator<Container> it)
--    -> Container& {
--  using base =3D std::back_insert_iterator<Container>;
--  struct accessor : base {
--    accessor(base b) : base(b) {}
--    using base::container;
--  };
--  return *accessor(it).container;
--}
--
--template <typename Char, typename InputIt, typename OutputIt>
--FMT_CONSTEXPR auto copy_str(InputIt begin, InputIt end, OutputIt out)
--    -> OutputIt {
--  while (begin !=3D end) *out++ =3D static_cast<Char>(*begin++);
--  return out;
--}
--
--template <typename Char, typename T, typename U,
--          FMT_ENABLE_IF(
--              std::is_same<remove_const_t<T>, U>::value&& is_char<U>::v=
alue)>
--FMT_CONSTEXPR auto copy_str(T* begin, T* end, U* out) -> U* {
--  if (is_constant_evaluated()) return copy_str<Char, T*, U*>(begin, end=
, out);
--  auto size =3D to_unsigned(end - begin);
--  if (size > 0) memcpy(out, begin, size * sizeof(U));
--  return out + size;
--}
--
--/**
--  \rst
--  A contiguous memory buffer with an optional growing ability. It is an=
 internal
--  class and shouldn't be used directly, only via `~fmt::basic_memory_bu=
ffer`.
--  \endrst
-- */
--template <typename T> class buffer {
-- private:
--  T* ptr_;
--  size_t size_;
--  size_t capacity_;
--
-- protected:
--  // Don't initialize ptr_ since it is not accessed to save a few cycle=
s.
--  FMT_MSC_WARNING(suppress : 26495)
--  buffer(size_t sz) noexcept : size_(sz), capacity_(sz) {}
--
--  FMT_CONSTEXPR20 buffer(T* p =3D nullptr, size_t sz =3D 0, size_t cap =
=3D 0) noexcept
--      : ptr_(p), size_(sz), capacity_(cap) {}
--
--  FMT_CONSTEXPR20 ~buffer() =3D default;
--  buffer(buffer&&) =3D default;
--
--  /** Sets the buffer data and capacity. */
--  FMT_CONSTEXPR void set(T* buf_data, size_t buf_capacity) noexcept {
--    ptr_ =3D buf_data;
--    capacity_ =3D buf_capacity;
--  }
--
--  /** Increases the buffer capacity to hold at least *capacity* element=
s. */
--  virtual FMT_CONSTEXPR20 void grow(size_t capacity) =3D 0;
--
-- public:
--  using value_type =3D T;
--  using const_reference =3D const T&;
--
--  buffer(const buffer&) =3D delete;
--  void operator=3D(const buffer&) =3D delete;
--
--  FMT_INLINE auto begin() noexcept -> T* { return ptr_; }
--  FMT_INLINE auto end() noexcept -> T* { return ptr_ + size_; }
--
--  FMT_INLINE auto begin() const noexcept -> const T* { return ptr_; }
--  FMT_INLINE auto end() const noexcept -> const T* { return ptr_ + size=
_; }
--
--  /** Returns the size of this buffer. */
--  constexpr auto size() const noexcept -> size_t { return size_; }
--
--  /** Returns the capacity of this buffer. */
--  constexpr auto capacity() const noexcept -> size_t { return capacity_=
; }
--
--  /** Returns a pointer to the buffer data. */
--  FMT_CONSTEXPR auto data() noexcept -> T* { return ptr_; }
--
--  /** Returns a pointer to the buffer data. */
--  FMT_CONSTEXPR auto data() const noexcept -> const T* { return ptr_; }
--
--  /** Clears this buffer. */
--  void clear() { size_ =3D 0; }
--
--  // Tries resizing the buffer to contain *count* elements. If T is a P=
OD type
--  // the new elements may not be initialized.
--  FMT_CONSTEXPR20 void try_resize(size_t count) {
--    try_reserve(count);
--    size_ =3D count <=3D capacity_ ? count : capacity_;
--  }
--
--  // Tries increasing the buffer capacity to *new_capacity*. It can inc=
rease the
--  // capacity by a smaller amount than requested but guarantees there i=
s space
--  // for at least one additional element either by increasing the capac=
ity or by
--  // flushing the buffer if it is full.
--  FMT_CONSTEXPR20 void try_reserve(size_t new_capacity) {
--    if (new_capacity > capacity_) grow(new_capacity);
--  }
--
--  FMT_CONSTEXPR20 void push_back(const T& value) {
--    try_reserve(size_ + 1);
--    ptr_[size_++] =3D value;
--  }
--
--  /** Appends data to the end of the buffer. */
--  template <typename U> void append(const U* begin, const U* end);
--
--  template <typename Idx> FMT_CONSTEXPR auto operator[](Idx index) -> T=
& {
--    return ptr_[index];
--  }
--  template <typename Idx>
--  FMT_CONSTEXPR auto operator[](Idx index) const -> const T& {
--    return ptr_[index];
--  }
--};
--
--struct buffer_traits {
--  explicit buffer_traits(size_t) {}
--  auto count() const -> size_t { return 0; }
--  auto limit(size_t size) -> size_t { return size; }
--};
--
--class fixed_buffer_traits {
-- private:
--  size_t count_ =3D 0;
--  size_t limit_;
--
-- public:
--  explicit fixed_buffer_traits(size_t limit) : limit_(limit) {}
--  auto count() const -> size_t { return count_; }
--  auto limit(size_t size) -> size_t {
--    size_t n =3D limit_ > count_ ? limit_ - count_ : 0;
--    count_ +=3D size;
--    return size < n ? size : n;
--  }
--};
--
--// A buffer that writes to an output iterator when flushed.
--template <typename OutputIt, typename T, typename Traits =3D buffer_tra=
its>
--class iterator_buffer final : public Traits, public buffer<T> {
-- private:
--  OutputIt out_;
--  enum { buffer_size =3D 256 };
--  T data_[buffer_size];
--
-- protected:
--  FMT_CONSTEXPR20 void grow(size_t) override {
--    if (this->size() =3D=3D buffer_size) flush();
--  }
--
--  void flush() {
--    auto size =3D this->size();
--    this->clear();
--    out_ =3D copy_str<T>(data_, data_ + this->limit(size), out_);
--  }
--
-- public:
--  explicit iterator_buffer(OutputIt out, size_t n =3D buffer_size)
--      : Traits(n), buffer<T>(data_, 0, buffer_size), out_(out) {}
--  iterator_buffer(iterator_buffer&& other)
--      : Traits(other), buffer<T>(data_, 0, buffer_size), out_(other.out=
_) {}
--  ~iterator_buffer() { flush(); }
--
--  auto out() -> OutputIt {
--    flush();
--    return out_;
--  }
--  auto count() const -> size_t { return Traits::count() + this->size();=
 }
--};
--
--template <typename T>
--class iterator_buffer<T*, T, fixed_buffer_traits> final
--    : public fixed_buffer_traits,
--      public buffer<T> {
-- private:
--  T* out_;
--  enum { buffer_size =3D 256 };
--  T data_[buffer_size];
--
-- protected:
--  FMT_CONSTEXPR20 void grow(size_t) override {
--    if (this->size() =3D=3D this->capacity()) flush();
--  }
--
--  void flush() {
--    size_t n =3D this->limit(this->size());
--    if (this->data() =3D=3D out_) {
--      out_ +=3D n;
--      this->set(data_, buffer_size);
--    }
--    this->clear();
--  }
--
-- public:
--  explicit iterator_buffer(T* out, size_t n =3D buffer_size)
--      : fixed_buffer_traits(n), buffer<T>(out, 0, n), out_(out) {}
--  iterator_buffer(iterator_buffer&& other)
--      : fixed_buffer_traits(other),
--        buffer<T>(std::move(other)),
--        out_(other.out_) {
--    if (this->data() !=3D out_) {
--      this->set(data_, buffer_size);
--      this->clear();
--    }
--  }
--  ~iterator_buffer() { flush(); }
--
--  auto out() -> T* {
--    flush();
--    return out_;
--  }
--  auto count() const -> size_t {
--    return fixed_buffer_traits::count() + this->size();
--  }
--};
--
--template <typename T> class iterator_buffer<T*, T> final : public buffe=
r<T> {
-- protected:
--  FMT_CONSTEXPR20 void grow(size_t) override {}
--
-- public:
--  explicit iterator_buffer(T* out, size_t =3D 0) : buffer<T>(out, 0, ~s=
ize_t()) {}
--
--  auto out() -> T* { return &*this->end(); }
--};
--
--// A buffer that writes to a container with the contiguous storage.
--template <typename Container>
--class iterator_buffer<std::back_insert_iterator<Container>,
--                      enable_if_t<is_contiguous<Container>::value,
--                                  typename Container::value_type>>
--    final : public buffer<typename Container::value_type> {
-- private:
--  Container& container_;
--
-- protected:
--  FMT_CONSTEXPR20 void grow(size_t capacity) override {
--    container_.resize(capacity);
--    this->set(&container_[0], capacity);
--  }
--
-- public:
--  explicit iterator_buffer(Container& c)
--      : buffer<typename Container::value_type>(c.size()), container_(c)=
 {}
--  explicit iterator_buffer(std::back_insert_iterator<Container> out, si=
ze_t =3D 0)
--      : iterator_buffer(get_container(out)) {}
--
--  auto out() -> std::back_insert_iterator<Container> {
--    return std::back_inserter(container_);
--  }
--};
--
--// A buffer that counts the number of code units written discarding the=
 output.
--template <typename T =3D char> class counting_buffer final : public buf=
fer<T> {
-- private:
--  enum { buffer_size =3D 256 };
--  T data_[buffer_size];
--  size_t count_ =3D 0;
--
-- protected:
--  FMT_CONSTEXPR20 void grow(size_t) override {
--    if (this->size() !=3D buffer_size) return;
--    count_ +=3D this->size();
--    this->clear();
--  }
--
-- public:
--  counting_buffer() : buffer<T>(data_, 0, buffer_size) {}
--
--  auto count() -> size_t { return count_ + this->size(); }
--};
--}  // namespace detail
--
--template <typename Char>
--FMT_CONSTEXPR void basic_format_parse_context<Char>::do_check_arg_id(in=
t id) {
--  // Argument id is only checked at compile-time during parsing because
--  // formatting has its own validation.
--  if (detail::is_constant_evaluated() &&
--      (!FMT_GCC_VERSION || FMT_GCC_VERSION >=3D 1200)) {
--    using context =3D detail::compile_parse_context<Char>;
--    if (id >=3D static_cast<context*>(this)->num_args())
--      detail::throw_format_error("argument not found");
--  }
--}
--
--template <typename Char>
--FMT_CONSTEXPR void basic_format_parse_context<Char>::check_dynamic_spec=
(
--    int arg_id) {
--  if (detail::is_constant_evaluated() &&
--      (!FMT_GCC_VERSION || FMT_GCC_VERSION >=3D 1200)) {
--    using context =3D detail::compile_parse_context<Char>;
--    static_cast<context*>(this)->check_dynamic_spec(arg_id);
--  }
--}
--
--FMT_EXPORT template <typename Context> class basic_format_arg;
--FMT_EXPORT template <typename Context> class basic_format_args;
--FMT_EXPORT template <typename Context> class dynamic_format_arg_store;
--
--// A formatter for objects of type T.
--FMT_EXPORT
--template <typename T, typename Char =3D char, typename Enable =3D void>
--struct formatter {
--  // A deleted default constructor indicates a disabled formatter.
--  formatter() =3D delete;
--};
--
--// Specifies if T has an enabled formatter specialization. A type can b=
e
--// formattable even if it doesn't have a formatter e.g. via a conversio=
n.
--template <typename T, typename Context>
--using has_formatter =3D
--    std::is_constructible<typename Context::template formatter_type<T>>=
;
--
--// An output iterator that appends to a buffer.
--// It is used to reduce symbol sizes for the common case.
--class appender : public std::back_insert_iterator<detail::buffer<char>>=
 {
--  using base =3D std::back_insert_iterator<detail::buffer<char>>;
--
-- public:
--  using std::back_insert_iterator<detail::buffer<char>>::back_insert_it=
erator;
--  appender(base it) noexcept : base(it) {}
--  FMT_UNCHECKED_ITERATOR(appender);
--
--  auto operator++() noexcept -> appender& { return *this; }
--  auto operator++(int) noexcept -> appender { return *this; }
--};
--
--namespace detail {
--
--template <typename Context, typename T>
--constexpr auto has_const_formatter_impl(T*)
--    -> decltype(typename Context::template formatter_type<T>().format(
--                    std::declval<const T&>(), std::declval<Context&>())=
,
--                true) {
--  return true;
--}
--template <typename Context>
--constexpr auto has_const_formatter_impl(...) -> bool {
--  return false;
--}
--template <typename T, typename Context>
--constexpr auto has_const_formatter() -> bool {
--  return has_const_formatter_impl<Context>(static_cast<T*>(nullptr));
--}
--
--template <typename T>
--using buffer_appender =3D conditional_t<std::is_same<T, char>::value, a=
ppender,
--                                      std::back_insert_iterator<buffer<=
T>>>;
--
--// Maps an output iterator to a buffer.
--template <typename T, typename OutputIt>
--auto get_buffer(OutputIt out) -> iterator_buffer<OutputIt, T> {
--  return iterator_buffer<OutputIt, T>(out);
--}
--template <typename T, typename Buf,
--          FMT_ENABLE_IF(std::is_base_of<buffer<char>, Buf>::value)>
--auto get_buffer(std::back_insert_iterator<Buf> out) -> buffer<char>& {
--  return get_container(out);
--}
--
--template <typename Buf, typename OutputIt>
--FMT_INLINE auto get_iterator(Buf& buf, OutputIt) -> decltype(buf.out())=
 {
--  return buf.out();
--}
--template <typename T, typename OutputIt>
--auto get_iterator(buffer<T>&, OutputIt out) -> OutputIt {
--  return out;
--}
--
--struct view {};
--
--template <typename Char, typename T> struct named_arg : view {
--  const Char* name;
--  const T& value;
--  named_arg(const Char* n, const T& v) : name(n), value(v) {}
--};
--
--template <typename Char> struct named_arg_info {
--  const Char* name;
--  int id;
--};
--
--template <typename T, typename Char, size_t NUM_ARGS, size_t NUM_NAMED_=
ARGS>
--struct arg_data {
--  // args_[0].named_args points to named_args_ to avoid bloating format=
_args.
--  // +1 to workaround a bug in gcc 7.5 that causes duplicated-branches =
warning.
--  T args_[1 + (NUM_ARGS !=3D 0 ? NUM_ARGS : +1)];
--  named_arg_info<Char> named_args_[NUM_NAMED_ARGS];
--
--  template <typename... U>
--  arg_data(const U&... init) : args_{T(named_args_, NUM_NAMED_ARGS), in=
it...} {}
--  arg_data(const arg_data& other) =3D delete;
--  auto args() const -> const T* { return args_ + 1; }
--  auto named_args() -> named_arg_info<Char>* { return named_args_; }
--};
--
--template <typename T, typename Char, size_t NUM_ARGS>
--struct arg_data<T, Char, NUM_ARGS, 0> {
--  // +1 to workaround a bug in gcc 7.5 that causes duplicated-branches =
warning.
--  T args_[NUM_ARGS !=3D 0 ? NUM_ARGS : +1];
--
--  template <typename... U>
--  FMT_CONSTEXPR FMT_INLINE arg_data(const U&... init) : args_{init...} =
{}
--  FMT_CONSTEXPR FMT_INLINE auto args() const -> const T* { return args_=
; }
--  FMT_CONSTEXPR FMT_INLINE auto named_args() -> std::nullptr_t {
--    return nullptr;
--  }
--};
--
--template <typename Char>
--inline void init_named_args(named_arg_info<Char>*, int, int) {}
--
--template <typename T> struct is_named_arg : std::false_type {};
--template <typename T> struct is_statically_named_arg : std::false_type =
{};
--
--template <typename T, typename Char>
--struct is_named_arg<named_arg<Char, T>> : std::true_type {};
--
--template <typename Char, typename T, typename... Tail,
--          FMT_ENABLE_IF(!is_named_arg<T>::value)>
--void init_named_args(named_arg_info<Char>* named_args, int arg_count,
--                     int named_arg_count, const T&, const Tail&... args=
) {
--  init_named_args(named_args, arg_count + 1, named_arg_count, args...);
--}
--
--template <typename Char, typename T, typename... Tail,
--          FMT_ENABLE_IF(is_named_arg<T>::value)>
--void init_named_args(named_arg_info<Char>* named_args, int arg_count,
--                     int named_arg_count, const T& arg, const Tail&... =
args) {
--  named_args[named_arg_count++] =3D {arg.name, arg_count};
--  init_named_args(named_args, arg_count + 1, named_arg_count, args...);
--}
--
--template <typename... Args>
--FMT_CONSTEXPR FMT_INLINE void init_named_args(std::nullptr_t, int, int,
--                                              const Args&...) {}
--
--template <bool B =3D false> constexpr auto count() -> size_t { return B=
 ? 1 : 0; }
--template <bool B1, bool B2, bool... Tail> constexpr auto count() -> siz=
e_t {
--  return (B1 ? 1 : 0) + count<B2, Tail...>();
--}
--
--template <typename... Args> constexpr auto count_named_args() -> size_t=
 {
--  return count<is_named_arg<Args>::value...>();
--}
--
--template <typename... Args>
--constexpr auto count_statically_named_args() -> size_t {
--  return count<is_statically_named_arg<Args>::value...>();
--}
--
--struct unformattable {};
--struct unformattable_char : unformattable {};
--struct unformattable_pointer : unformattable {};
--
--template <typename Char> struct string_value {
--  const Char* data;
--  size_t size;
--};
--
--template <typename Char> struct named_arg_value {
--  const named_arg_info<Char>* data;
--  size_t size;
--};
--
--template <typename Context> struct custom_value {
--  using parse_context =3D typename Context::parse_context_type;
--  void* value;
--  void (*format)(void* arg, parse_context& parse_ctx, Context& ctx);
--};
--
--// A formatting argument value.
--template <typename Context> class value {
-- public:
--  using char_type =3D typename Context::char_type;
--
--  union {
--    monostate no_value;
--    int int_value;
--    unsigned uint_value;
--    long long long_long_value;
--    unsigned long long ulong_long_value;
--    int128_opt int128_value;
--    uint128_opt uint128_value;
--    bool bool_value;
--    char_type char_value;
--    float float_value;
--    double double_value;
--    long double long_double_value;
--    const void* pointer;
--    string_value<char_type> string;
--    custom_value<Context> custom;
--    named_arg_value<char_type> named_args;
--  };
--
--  constexpr FMT_INLINE value() : no_value() {}
--  constexpr FMT_INLINE value(int val) : int_value(val) {}
--  constexpr FMT_INLINE value(unsigned val) : uint_value(val) {}
--  constexpr FMT_INLINE value(long long val) : long_long_value(val) {}
--  constexpr FMT_INLINE value(unsigned long long val) : ulong_long_value=
(val) {}
--  FMT_INLINE value(int128_opt val) : int128_value(val) {}
--  FMT_INLINE value(uint128_opt val) : uint128_value(val) {}
--  constexpr FMT_INLINE value(float val) : float_value(val) {}
--  constexpr FMT_INLINE value(double val) : double_value(val) {}
--  FMT_INLINE value(long double val) : long_double_value(val) {}
--  constexpr FMT_INLINE value(bool val) : bool_value(val) {}
--  constexpr FMT_INLINE value(char_type val) : char_value(val) {}
--  FMT_CONSTEXPR FMT_INLINE value(const char_type* val) {
--    string.data =3D val;
--    if (is_constant_evaluated()) string.size =3D {};
--  }
--  FMT_CONSTEXPR FMT_INLINE value(basic_string_view<char_type> val) {
--    string.data =3D val.data();
--    string.size =3D val.size();
--  }
--  FMT_INLINE value(const void* val) : pointer(val) {}
--  FMT_INLINE value(const named_arg_info<char_type>* args, size_t size)
--      : named_args{args, size} {}
--
--  template <typename T> FMT_CONSTEXPR FMT_INLINE value(T& val) {
--    using value_type =3D remove_const_t<T>;
--    custom.value =3D const_cast<value_type*>(&val);
--    // Get the formatter type through the context to allow different co=
ntexts
--    // have different extension points, e.g. `formatter<T>` for `format=
` and
--    // `printf_formatter<T>` for `printf`.
--    custom.format =3D format_custom_arg<
--        value_type, typename Context::template formatter_type<value_typ=
e>>;
--  }
--  value(unformattable);
--  value(unformattable_char);
--  value(unformattable_pointer);
--
-- private:
--  // Formats an argument of a custom type, such as a user-defined class=
.
--  template <typename T, typename Formatter>
--  static void format_custom_arg(void* arg,
--                                typename Context::parse_context_type& p=
arse_ctx,
--                                Context& ctx) {
--    auto f =3D Formatter();
--    parse_ctx.advance_to(f.parse(parse_ctx));
--    using qualified_type =3D
--        conditional_t<has_const_formatter<T, Context>(), const T, T>;
--    ctx.advance_to(f.format(*static_cast<qualified_type*>(arg), ctx));
--  }
--};
--
--// To minimize the number of types we need to deal with, long is transl=
ated
--// either to int or to long long depending on its size.
--enum { long_short =3D sizeof(long) =3D=3D sizeof(int) };
--using long_type =3D conditional_t<long_short, int, long long>;
--using ulong_type =3D conditional_t<long_short, unsigned, unsigned long =
long>;
--
--template <typename T> struct format_as_result {
--  template <typename U,
--            FMT_ENABLE_IF(std::is_enum<U>::value || std::is_class<U>::v=
alue)>
--  static auto map(U*) -> decltype(format_as(std::declval<U>()));
--  static auto map(...) -> void;
--
--  using type =3D decltype(map(static_cast<T*>(nullptr)));
--};
--template <typename T> using format_as_t =3D typename format_as_result<T=
>::type;
--
--template <typename T>
--struct has_format_as
--    : bool_constant<!std::is_same<format_as_t<T>, void>::value> {};
--
--// Maps formatting arguments to core types.
--// arg_mapper reports errors by returning unformattable instead of usin=
g
--// static_assert because it's used in the is_formattable trait.
--template <typename Context> struct arg_mapper {
--  using char_type =3D typename Context::char_type;
--
--  FMT_CONSTEXPR FMT_INLINE auto map(signed char val) -> int { return va=
l; }
--  FMT_CONSTEXPR FMT_INLINE auto map(unsigned char val) -> unsigned {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(short val) -> int { return val; }
--  FMT_CONSTEXPR FMT_INLINE auto map(unsigned short val) -> unsigned {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(int val) -> int { return val; }
--  FMT_CONSTEXPR FMT_INLINE auto map(unsigned val) -> unsigned { return =
val; }
--  FMT_CONSTEXPR FMT_INLINE auto map(long val) -> long_type { return val=
; }
--  FMT_CONSTEXPR FMT_INLINE auto map(unsigned long val) -> ulong_type {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(long long val) -> long long { retur=
n val; }
--  FMT_CONSTEXPR FMT_INLINE auto map(unsigned long long val)
--      -> unsigned long long {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(int128_opt val) -> int128_opt {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(uint128_opt val) -> uint128_opt {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(bool val) -> bool { return val; }
--
--  template <typename T, FMT_ENABLE_IF(std::is_same<T, char>::value ||
--                                      std::is_same<T, char_type>::value=
)>
--  FMT_CONSTEXPR FMT_INLINE auto map(T val) -> char_type {
--    return val;
--  }
--  template <typename T, enable_if_t<(std::is_same<T, wchar_t>::value ||
--#ifdef __cpp_char8_t
--                                     std::is_same<T, char8_t>::value ||
--#endif
--                                     std::is_same<T, char16_t>::value |=
|
--                                     std::is_same<T, char32_t>::value) =
&&
--                                        !std::is_same<T, char_type>::va=
lue,
--                                    int> =3D 0>
--  FMT_CONSTEXPR FMT_INLINE auto map(T) -> unformattable_char {
--    return {};
--  }
--
--  FMT_CONSTEXPR FMT_INLINE auto map(float val) -> float { return val; }
--  FMT_CONSTEXPR FMT_INLINE auto map(double val) -> double { return val;=
 }
--  FMT_CONSTEXPR FMT_INLINE auto map(long double val) -> long double {
--    return val;
--  }
--
--  FMT_CONSTEXPR FMT_INLINE auto map(char_type* val) -> const char_type*=
 {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(const char_type* val) -> const char=
_type* {
--    return val;
--  }
--  template <typename T,
--            FMT_ENABLE_IF(is_string<T>::value && !std::is_pointer<T>::v=
alue &&
--                          std::is_same<char_type, char_t<T>>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto map(const T& val)
--      -> basic_string_view<char_type> {
--    return to_string_view(val);
--  }
--  template <typename T,
--            FMT_ENABLE_IF(is_string<T>::value && !std::is_pointer<T>::v=
alue &&
--                          !std::is_same<char_type, char_t<T>>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto map(const T&) -> unformattable_char {
--    return {};
--  }
--
--  FMT_CONSTEXPR FMT_INLINE auto map(void* val) -> const void* { return =
val; }
--  FMT_CONSTEXPR FMT_INLINE auto map(const void* val) -> const void* {
--    return val;
--  }
--  FMT_CONSTEXPR FMT_INLINE auto map(std::nullptr_t val) -> const void* =
{
--    return val;
--  }
--
--  // Use SFINAE instead of a const T* parameter to avoid a conflict wit=
h the
--  // array overload.
--  template <
--      typename T,
--      FMT_ENABLE_IF(
--          std::is_pointer<T>::value || std::is_member_pointer<T>::value=
 ||
--          std::is_function<typename std::remove_pointer<T>::type>::valu=
e ||
--          (std::is_convertible<const T&, const void*>::value &&
--           !std::is_convertible<const T&, const char_type*>::value &&
--           !has_formatter<T, Context>::value))>
--  FMT_CONSTEXPR auto map(const T&) -> unformattable_pointer {
--    return {};
--  }
--
--  template <typename T, std::size_t N,
--            FMT_ENABLE_IF(!std::is_same<T, wchar_t>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto map(const T (&values)[N]) -> const T (&=
)[N] {
--    return values;
--  }
--
--  // Only map owning types because mapping views can be unsafe.
--  template <typename T, typename U =3D format_as_t<T>,
--            FMT_ENABLE_IF(std::is_arithmetic<U>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto map(const T& val) -> decltype(this->map=
(U())) {
--    return map(format_as(val));
--  }
--
--  template <typename T, typename U =3D remove_const_t<T>>
--  struct formattable : bool_constant<has_const_formatter<U, Context>() =
||
--                                     (has_formatter<U, Context>::value =
&&
--                                      !std::is_const<T>::value)> {};
--
--  template <typename T, FMT_ENABLE_IF(formattable<T>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto do_map(T& val) -> T& {
--    return val;
--  }
--  template <typename T, FMT_ENABLE_IF(!formattable<T>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto do_map(T&) -> unformattable {
--    return {};
--  }
--
--  template <typename T, typename U =3D remove_const_t<T>,
--            FMT_ENABLE_IF((std::is_class<U>::value || std::is_enum<U>::=
value ||
--                           std::is_union<U>::value) &&
--                          !is_string<U>::value && !is_char<U>::value &&
--                          !is_named_arg<U>::value &&
--                          !std::is_arithmetic<format_as_t<U>>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto map(T& val) -> decltype(this->do_map(va=
l)) {
--    return do_map(val);
--  }
--
--  template <typename T, FMT_ENABLE_IF(is_named_arg<T>::value)>
--  FMT_CONSTEXPR FMT_INLINE auto map(const T& named_arg)
--      -> decltype(this->map(named_arg.value)) {
--    return map(named_arg.value);
--  }
--
--  auto map(...) -> unformattable { return {}; }
--};
--
--// A type constant after applying arg_mapper<Context>.
--template <typename T, typename Context>
--using mapped_type_constant =3D
--    type_constant<decltype(arg_mapper<Context>().map(std::declval<const=
 T&>())),
--                  typename Context::char_type>;
--
--enum { packed_arg_bits =3D 4 };
--// Maximum number of arguments with packed types.
--enum { max_packed_args =3D 62 / packed_arg_bits };
--enum : unsigned long long { is_unpacked_bit =3D 1ULL << 63 };
--enum : unsigned long long { has_named_args_bit =3D 1ULL << 62 };
--
--template <typename Char, typename InputIt>
--auto copy_str(InputIt begin, InputIt end, appender out) -> appender {
--  get_container(out).append(begin, end);
--  return out;
--}
--
--template <typename Char, typename R, typename OutputIt>
--FMT_CONSTEXPR auto copy_str(R&& rng, OutputIt out) -> OutputIt {
--  return detail::copy_str<Char>(rng.begin(), rng.end(), out);
--}
--
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 500
--// A workaround for gcc 4.8 to make void_t work in a SFINAE context.
--template <typename...> struct void_t_impl { using type =3D void; };
--template <typename... T> using void_t =3D typename void_t_impl<T...>::t=
ype;
--#else
--template <typename...> using void_t =3D void;
--#endif
--
--template <typename It, typename T, typename Enable =3D void>
--struct is_output_iterator : std::false_type {};
--
--template <typename It, typename T>
--struct is_output_iterator<
--    It, T,
--    void_t<typename std::iterator_traits<It>::iterator_category,
--           decltype(*std::declval<It>() =3D std::declval<T>())>>
--    : std::true_type {};
--
--template <typename It> struct is_back_insert_iterator : std::false_type=
 {};
--template <typename Container>
--struct is_back_insert_iterator<std::back_insert_iterator<Container>>
--    : std::true_type {};
--
--// A type-erased reference to an std::locale to avoid a heavy <locale> =
include.
--class locale_ref {
-- private:
--  const void* locale_;  // A type-erased pointer to std::locale.
--
-- public:
--  constexpr FMT_INLINE locale_ref() : locale_(nullptr) {}
--  template <typename Locale> explicit locale_ref(const Locale& loc);
--
--  explicit operator bool() const noexcept { return locale_ !=3D nullptr=
; }
--
--  template <typename Locale> auto get() const -> Locale;
--};
--
--template <typename> constexpr auto encode_types() -> unsigned long long=
 {
--  return 0;
--}
--
--template <typename Context, typename Arg, typename... Args>
--constexpr auto encode_types() -> unsigned long long {
--  return static_cast<unsigned>(mapped_type_constant<Arg, Context>::valu=
e) |
--         (encode_types<Context, Args...>() << packed_arg_bits);
--}
--
--template <bool PACKED, typename Context, typename T, FMT_ENABLE_IF(PACK=
ED)>
--FMT_CONSTEXPR FMT_INLINE auto make_arg(T& val) -> value<Context> {
--  using arg_type =3D remove_cvref_t<decltype(arg_mapper<Context>().map(=
val))>;
--
--  constexpr bool formattable_char =3D
--      !std::is_same<arg_type, unformattable_char>::value;
--  static_assert(formattable_char, "Mixing character types is disallowed=
.");
--
--  // Formatting of arbitrary pointers is disallowed. If you want to for=
mat a
--  // pointer cast it to `void*` or `const void*`. In particular, this f=
orbids
--  // formatting of `[const] volatile char*` printed as bool by iostream=
s.
--  constexpr bool formattable_pointer =3D
--      !std::is_same<arg_type, unformattable_pointer>::value;
--  static_assert(formattable_pointer,
--                "Formatting of non-void pointers is disallowed.");
--
--  constexpr bool formattable =3D !std::is_same<arg_type, unformattable>=
::value;
--  static_assert(
--      formattable,
--      "Cannot format an argument. To make type T formattable provide a =
"
--      "formatter<T> specialization: https://fmt.dev/latest/api.html#udt=
");
--  return {arg_mapper<Context>().map(val)};
--}
--
--template <typename Context, typename T>
--FMT_CONSTEXPR auto make_arg(T& val) -> basic_format_arg<Context> {
--  auto arg =3D basic_format_arg<Context>();
--  arg.type_ =3D mapped_type_constant<T, Context>::value;
--  arg.value_ =3D make_arg<true, Context>(val);
--  return arg;
--}
--
--template <bool PACKED, typename Context, typename T, FMT_ENABLE_IF(!PAC=
KED)>
--FMT_CONSTEXPR inline auto make_arg(T& val) -> basic_format_arg<Context>=
 {
--  return make_arg<Context>(val);
--}
--}  // namespace detail
--FMT_BEGIN_EXPORT
--
--// A formatting argument. It is a trivially copyable/constructible type=
 to
--// allow storage in basic_memory_buffer.
--template <typename Context> class basic_format_arg {
-- private:
--  detail::value<Context> value_;
--  detail::type type_;
--
--  template <typename ContextType, typename T>
--  friend FMT_CONSTEXPR auto detail::make_arg(T& value)
--      -> basic_format_arg<ContextType>;
--
--  template <typename Visitor, typename Ctx>
--  friend FMT_CONSTEXPR auto visit_format_arg(Visitor&& vis,
--                                             const basic_format_arg<Ctx=
>& arg)
--      -> decltype(vis(0));
--
--  friend class basic_format_args<Context>;
--  friend class dynamic_format_arg_store<Context>;
--
--  using char_type =3D typename Context::char_type;
--
--  template <typename T, typename Char, size_t NUM_ARGS, size_t NUM_NAME=
D_ARGS>
--  friend struct detail::arg_data;
--
--  basic_format_arg(const detail::named_arg_info<char_type>* args, size_=
t size)
--      : value_(args, size) {}
--
-- public:
--  class handle {
--   public:
--    explicit handle(detail::custom_value<Context> custom) : custom_(cus=
tom) {}
--
--    void format(typename Context::parse_context_type& parse_ctx,
--                Context& ctx) const {
--      custom_.format(custom_.value, parse_ctx, ctx);
--    }
--
--   private:
--    detail::custom_value<Context> custom_;
--  };
--
--  constexpr basic_format_arg() : type_(detail::type::none_type) {}
--
--  constexpr explicit operator bool() const noexcept {
--    return type_ !=3D detail::type::none_type;
--  }
--
--  auto type() const -> detail::type { return type_; }
--
--  auto is_integral() const -> bool { return detail::is_integral_type(ty=
pe_); }
--  auto is_arithmetic() const -> bool {
--    return detail::is_arithmetic_type(type_);
--  }
--};
--
--/**
--  \rst
--  Visits an argument dispatching to the appropriate visit method based =
on
--  the argument type. For example, if the argument type is ``double`` th=
en
--  ``vis(value)`` will be called with the value of type ``double``.
--  \endrst
-- */
--FMT_EXPORT
--template <typename Visitor, typename Context>
--FMT_CONSTEXPR FMT_INLINE auto visit_format_arg(
--    Visitor&& vis, const basic_format_arg<Context>& arg) -> decltype(vi=
s(0)) {
--  switch (arg.type_) {
--  case detail::type::none_type:
--    break;
--  case detail::type::int_type:
--    return vis(arg.value_.int_value);
--  case detail::type::uint_type:
--    return vis(arg.value_.uint_value);
--  case detail::type::long_long_type:
--    return vis(arg.value_.long_long_value);
--  case detail::type::ulong_long_type:
--    return vis(arg.value_.ulong_long_value);
--  case detail::type::int128_type:
--    return vis(detail::convert_for_visit(arg.value_.int128_value));
--  case detail::type::uint128_type:
--    return vis(detail::convert_for_visit(arg.value_.uint128_value));
--  case detail::type::bool_type:
--    return vis(arg.value_.bool_value);
--  case detail::type::char_type:
--    return vis(arg.value_.char_value);
--  case detail::type::float_type:
--    return vis(arg.value_.float_value);
--  case detail::type::double_type:
--    return vis(arg.value_.double_value);
--  case detail::type::long_double_type:
--    return vis(arg.value_.long_double_value);
--  case detail::type::cstring_type:
--    return vis(arg.value_.string.data);
--  case detail::type::string_type:
--    using sv =3D basic_string_view<typename Context::char_type>;
--    return vis(sv(arg.value_.string.data, arg.value_.string.size));
--  case detail::type::pointer_type:
--    return vis(arg.value_.pointer);
--  case detail::type::custom_type:
--    return vis(typename basic_format_arg<Context>::handle(arg.value_.cu=
stom));
--  }
--  return vis(monostate());
--}
--
--// Formatting context.
--template <typename OutputIt, typename Char> class basic_format_context =
{
-- private:
--  OutputIt out_;
--  basic_format_args<basic_format_context> args_;
--  detail::locale_ref loc_;
--
-- public:
--  using iterator =3D OutputIt;
--  using format_arg =3D basic_format_arg<basic_format_context>;
--  using format_args =3D basic_format_args<basic_format_context>;
--  using parse_context_type =3D basic_format_parse_context<Char>;
--  template <typename T> using formatter_type =3D formatter<T, Char>;
--
--  /** The character type for the output. */
--  using char_type =3D Char;
--
--  basic_format_context(basic_format_context&&) =3D default;
--  basic_format_context(const basic_format_context&) =3D delete;
--  void operator=3D(const basic_format_context&) =3D delete;
--  /**
--    Constructs a ``basic_format_context`` object. References to the arg=
uments
--    are stored in the object so make sure they have appropriate lifetim=
es.
--   */
--  constexpr basic_format_context(OutputIt out, format_args ctx_args,
--                                 detail::locale_ref loc =3D {})
--      : out_(out), args_(ctx_args), loc_(loc) {}
--
--  constexpr auto arg(int id) const -> format_arg { return args_.get(id)=
; }
--  FMT_CONSTEXPR auto arg(basic_string_view<Char> name) -> format_arg {
--    return args_.get(name);
--  }
--  FMT_CONSTEXPR auto arg_id(basic_string_view<Char> name) -> int {
--    return args_.get_id(name);
--  }
--  auto args() const -> const format_args& { return args_; }
--
--  FMT_CONSTEXPR auto error_handler() -> detail::error_handler { return =
{}; }
--  void on_error(const char* message) { error_handler().on_error(message=
); }
--
--  // Returns an iterator to the beginning of the output range.
--  FMT_CONSTEXPR auto out() -> iterator { return out_; }
--
--  // Advances the begin iterator to ``it``.
--  void advance_to(iterator it) {
--    if (!detail::is_back_insert_iterator<iterator>()) out_ =3D it;
--  }
--
--  FMT_CONSTEXPR auto locale() -> detail::locale_ref { return loc_; }
--};
--
--template <typename Char>
--using buffer_context =3D
--    basic_format_context<detail::buffer_appender<Char>, Char>;
--using format_context =3D buffer_context<char>;
--
--template <typename T, typename Char =3D char>
--using is_formattable =3D bool_constant<!std::is_base_of<
--    detail::unformattable, decltype(detail::arg_mapper<buffer_context<C=
har>>()
--                                        .map(std::declval<T&>()))>::val=
ue>;
--
--/**
--  \rst
--  An array of references to arguments. It can be implicitly converted i=
nto
--  `~fmt::basic_format_args` for passing into type-erased formatting fun=
ctions
--  such as `~fmt::vformat`.
--  \endrst
-- */
--template <typename Context, typename... Args>
--class format_arg_store
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 409
--    // Workaround a GCC template argument substitution bug.
--    : public basic_format_args<Context>
--#endif
--{
-- private:
--  static const size_t num_args =3D sizeof...(Args);
--  static constexpr size_t num_named_args =3D detail::count_named_args<A=
rgs...>();
--  static const bool is_packed =3D num_args <=3D detail::max_packed_args=
;
--
--  using value_type =3D conditional_t<is_packed, detail::value<Context>,
--                                   basic_format_arg<Context>>;
--
--  detail::arg_data<value_type, typename Context::char_type, num_args,
--                   num_named_args>
--      data_;
--
--  friend class basic_format_args<Context>;
--
--  static constexpr unsigned long long desc =3D
--      (is_packed ? detail::encode_types<Context, Args...>()
--                 : detail::is_unpacked_bit | num_args) |
--      (num_named_args !=3D 0
--           ? static_cast<unsigned long long>(detail::has_named_args_bit=
)
--           : 0);
--
-- public:
--  template <typename... T>
--  FMT_CONSTEXPR FMT_INLINE format_arg_store(T&... args)
--      :
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 409
--        basic_format_args<Context>(*this),
--#endif
--        data_{detail::make_arg<is_packed, Context>(args)...} {
--    if (num_named_args !=3D 0)
--      detail::init_named_args(data_.named_args(), 0, 0, args...);
--  }
--};
--
--/**
--  \rst
--  Constructs a `~fmt::format_arg_store` object that contains references=
 to
--  arguments and can be implicitly converted to `~fmt::format_args`. `Co=
ntext`
--  can be omitted in which case it defaults to `~fmt::format_context`.
--  See `~fmt::arg` for lifetime considerations.
--  \endrst
-- */
--// Arguments are taken by lvalue references to avoid some lifetime issu=
es.
--template <typename Context =3D format_context, typename... T>
--constexpr auto make_format_args(T&... args)
--    -> format_arg_store<Context, remove_cvref_t<T>...> {
--  return {args...};
--}
--
--/**
--  \rst
--  Returns a named argument to be used in a formatting function.
--  It should only be used in a call to a formatting function or
--  `dynamic_format_arg_store::push_back`.
--
--  **Example**::
--
--    fmt::print("Elapsed time: {s:.2f} seconds", fmt::arg("s", 1.23));
--  \endrst
-- */
--template <typename Char, typename T>
--inline auto arg(const Char* name, const T& arg) -> detail::named_arg<Ch=
ar, T> {
--  static_assert(!detail::is_named_arg<T>(), "nested named arguments");
--  return {name, arg};
--}
--FMT_END_EXPORT
--
--/**
--  \rst
--  A view of a collection of formatting arguments. To avoid lifetime iss=
ues it
--  should only be used as a parameter type in type-erased functions such=
 as
--  ``vformat``::
--
--    void vlog(string_view format_str, format_args args);  // OK
--    format_args args =3D make_format_args();  // Error: dangling refere=
nce
--  \endrst
-- */
--template <typename Context> class basic_format_args {
-- public:
--  using size_type =3D int;
--  using format_arg =3D basic_format_arg<Context>;
--
-- private:
--  // A descriptor that contains information about formatting arguments.
--  // If the number of arguments is less or equal to max_packed_args the=
n
--  // argument types are passed in the descriptor. This reduces binary c=
ode size
--  // per formatting function call.
--  unsigned long long desc_;
--  union {
--    // If is_packed() returns true then argument values are stored in v=
alues_;
--    // otherwise they are stored in args_. This is done to improve cach=
e
--    // locality and reduce compiled code size since storing larger obje=
cts
--    // may require more code (at least on x86-64) even if the same amou=
nt of
--    // data is actually copied to stack. It saves ~10% on the bloat tes=
t.
--    const detail::value<Context>* values_;
--    const format_arg* args_;
--  };
--
--  constexpr auto is_packed() const -> bool {
--    return (desc_ & detail::is_unpacked_bit) =3D=3D 0;
--  }
--  auto has_named_args() const -> bool {
--    return (desc_ & detail::has_named_args_bit) !=3D 0;
--  }
--
--  FMT_CONSTEXPR auto type(int index) const -> detail::type {
--    int shift =3D index * detail::packed_arg_bits;
--    unsigned int mask =3D (1 << detail::packed_arg_bits) - 1;
--    return static_cast<detail::type>((desc_ >> shift) & mask);
--  }
--
--  constexpr FMT_INLINE basic_format_args(unsigned long long desc,
--                                         const detail::value<Context>* =
values)
--      : desc_(desc), values_(values) {}
--  constexpr basic_format_args(unsigned long long desc, const format_arg=
* args)
--      : desc_(desc), args_(args) {}
--
-- public:
--  constexpr basic_format_args() : desc_(0), args_(nullptr) {}
--
--  /**
--   \rst
--   Constructs a `basic_format_args` object from `~fmt::format_arg_store=
`.
--   \endrst
--   */
--  template <typename... Args>
--  constexpr FMT_INLINE basic_format_args(
--      const format_arg_store<Context, Args...>& store)
--      : basic_format_args(format_arg_store<Context, Args...>::desc,
--                          store.data_.args()) {}
--
--  /**
--   \rst
--   Constructs a `basic_format_args` object from
--   `~fmt::dynamic_format_arg_store`.
--   \endrst
--   */
--  constexpr FMT_INLINE basic_format_args(
--      const dynamic_format_arg_store<Context>& store)
--      : basic_format_args(store.get_types(), store.data()) {}
--
--  /**
--   \rst
--   Constructs a `basic_format_args` object from a dynamic set of argume=
nts.
--   \endrst
--   */
--  constexpr basic_format_args(const format_arg* args, int count)
--      : basic_format_args(detail::is_unpacked_bit | detail::to_unsigned=
(count),
--                          args) {}
--
--  /** Returns the argument with the specified id. */
--  FMT_CONSTEXPR auto get(int id) const -> format_arg {
--    format_arg arg;
--    if (!is_packed()) {
--      if (id < max_size()) arg =3D args_[id];
--      return arg;
--    }
--    if (id >=3D detail::max_packed_args) return arg;
--    arg.type_ =3D type(id);
--    if (arg.type_ =3D=3D detail::type::none_type) return arg;
--    arg.value_ =3D values_[id];
--    return arg;
--  }
--
--  template <typename Char>
--  auto get(basic_string_view<Char> name) const -> format_arg {
--    int id =3D get_id(name);
--    return id >=3D 0 ? get(id) : format_arg();
--  }
--
--  template <typename Char>
--  auto get_id(basic_string_view<Char> name) const -> int {
--    if (!has_named_args()) return -1;
--    const auto& named_args =3D
--        (is_packed() ? values_[-1] : args_[-1].value_).named_args;
--    for (size_t i =3D 0; i < named_args.size; ++i) {
--      if (named_args.data[i].name =3D=3D name) return named_args.data[i=
].id;
--    }
--    return -1;
--  }
--
--  auto max_size() const -> int {
--    unsigned long long max_packed =3D detail::max_packed_args;
--    return static_cast<int>(is_packed() ? max_packed
--                                        : desc_ & ~detail::is_unpacked_=
bit);
--  }
--};
--
--/** An alias to ``basic_format_args<format_context>``. */
--// A separate type would result in shorter symbols but break ABI compat=
ibility
--// between clang and gcc on ARM (#1919).
--FMT_EXPORT using format_args =3D basic_format_args<format_context>;
--
--// We cannot use enum classes as bit fields because of a gcc bug, so we=
 put them
--// in namespaces instead (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D=
61414).
--// Additionally, if an underlying type is specified, older gcc incorrec=
tly warns
--// that the type is too small. Both bugs are fixed in gcc 9.3.
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 903
--#  define FMT_ENUM_UNDERLYING_TYPE(type)
--#else
--#  define FMT_ENUM_UNDERLYING_TYPE(type) : type
--#endif
--namespace align {
--enum type FMT_ENUM_UNDERLYING_TYPE(unsigned char){none, left, right, ce=
nter,
--                                                  numeric};
--}
--using align_t =3D align::type;
--namespace sign {
--enum type FMT_ENUM_UNDERLYING_TYPE(unsigned char){none, minus, plus, sp=
ace};
--}
--using sign_t =3D sign::type;
--
--namespace detail {
--
--// Workaround an array initialization issue in gcc 4.8.
--template <typename Char> struct fill_t {
-- private:
--  enum { max_size =3D 4 };
--  Char data_[max_size] =3D {Char(' '), Char(0), Char(0), Char(0)};
--  unsigned char size_ =3D 1;
--
-- public:
--  FMT_CONSTEXPR void operator=3D(basic_string_view<Char> s) {
--    auto size =3D s.size();
--    FMT_ASSERT(size <=3D max_size, "invalid fill");
--    for (size_t i =3D 0; i < size; ++i) data_[i] =3D s[i];
--    size_ =3D static_cast<unsigned char>(size);
--  }
--
--  constexpr auto size() const -> size_t { return size_; }
--  constexpr auto data() const -> const Char* { return data_; }
--
--  FMT_CONSTEXPR auto operator[](size_t index) -> Char& { return data_[i=
ndex]; }
--  FMT_CONSTEXPR auto operator[](size_t index) const -> const Char& {
--    return data_[index];
--  }
--};
--}  // namespace detail
--
--enum class presentation_type : unsigned char {
--  none,
--  dec,             // 'd'
--  oct,             // 'o'
--  hex_lower,       // 'x'
--  hex_upper,       // 'X'
--  bin_lower,       // 'b'
--  bin_upper,       // 'B'
--  hexfloat_lower,  // 'a'
--  hexfloat_upper,  // 'A'
--  exp_lower,       // 'e'
--  exp_upper,       // 'E'
--  fixed_lower,     // 'f'
--  fixed_upper,     // 'F'
--  general_lower,   // 'g'
--  general_upper,   // 'G'
--  chr,             // 'c'
--  string,          // 's'
--  pointer,         // 'p'
--  debug            // '?'
--};
--
--// Format specifiers for built-in and string types.
--template <typename Char =3D char> struct format_specs {
--  int width;
--  int precision;
--  presentation_type type;
--  align_t align : 4;
--  sign_t sign : 3;
--  bool alt : 1;  // Alternate form ('#').
--  bool localized : 1;
--  detail::fill_t<Char> fill;
--
--  constexpr format_specs()
--      : width(0),
--        precision(-1),
--        type(presentation_type::none),
--        align(align::none),
--        sign(sign::none),
--        alt(false),
--        localized(false) {}
--};
--
--namespace detail {
--
--enum class arg_id_kind { none, index, name };
--
--// An argument reference.
--template <typename Char> struct arg_ref {
--  FMT_CONSTEXPR arg_ref() : kind(arg_id_kind::none), val() {}
--
--  FMT_CONSTEXPR explicit arg_ref(int index)
--      : kind(arg_id_kind::index), val(index) {}
--  FMT_CONSTEXPR explicit arg_ref(basic_string_view<Char> name)
--      : kind(arg_id_kind::name), val(name) {}
--
--  FMT_CONSTEXPR auto operator=3D(int idx) -> arg_ref& {
--    kind =3D arg_id_kind::index;
--    val.index =3D idx;
--    return *this;
--  }
--
--  arg_id_kind kind;
--  union value {
--    FMT_CONSTEXPR value(int idx =3D 0) : index(idx) {}
--    FMT_CONSTEXPR value(basic_string_view<Char> n) : name(n) {}
--
--    int index;
--    basic_string_view<Char> name;
--  } val;
--};
--
--// Format specifiers with width and precision resolved at formatting ra=
ther
--// than parsing time to allow reusing the same parsed specifiers with
--// different sets of arguments (precompilation of format strings).
--template <typename Char =3D char>
--struct dynamic_format_specs : format_specs<Char> {
--  arg_ref<Char> width_ref;
--  arg_ref<Char> precision_ref;
--};
--
--// Converts a character to ASCII. Returns '\0' on conversion failure.
--template <typename Char, FMT_ENABLE_IF(std::is_integral<Char>::value)>
--constexpr auto to_ascii(Char c) -> char {
--  return c <=3D 0xff ? static_cast<char>(c) : '\0';
--}
--template <typename Char, FMT_ENABLE_IF(std::is_enum<Char>::value)>
--constexpr auto to_ascii(Char c) -> char {
--  return c <=3D 0xff ? static_cast<char>(c) : '\0';
--}
--
--// Returns the number of code units in a code point or 1 on error.
--template <typename Char>
--FMT_CONSTEXPR auto code_point_length(const Char* begin) -> int {
--  if (const_check(sizeof(Char) !=3D 1)) return 1;
--  auto c =3D static_cast<unsigned char>(*begin);
--  return static_cast<int>((0x3a55000000000000ull >> (2 * (c >> 3))) & 0=
x3) + 1;
--}
--
--// Return the result via the out param to workaround gcc bug 77539.
--template <bool IS_CONSTEXPR, typename T, typename Ptr =3D const T*>
--FMT_CONSTEXPR auto find(Ptr first, Ptr last, T value, Ptr& out) -> bool=
 {
--  for (out =3D first; out !=3D last; ++out) {
--    if (*out =3D=3D value) return true;
--  }
--  return false;
--}
--
--template <>
--inline auto find<false, char>(const char* first, const char* last, char=
 value,
--                              const char*& out) -> bool {
--  out =3D static_cast<const char*>(
--      std::memchr(first, value, to_unsigned(last - first)));
--  return out !=3D nullptr;
--}
--
--// Parses the range [begin, end) as an unsigned integer. This function =
assumes
--// that the range is non-empty and the first character is a digit.
--template <typename Char>
--FMT_CONSTEXPR auto parse_nonnegative_int(const Char*& begin, const Char=
* end,
--                                         int error_value) noexcept -> i=
nt {
--  FMT_ASSERT(begin !=3D end && '0' <=3D *begin && *begin <=3D '9', "");
--  unsigned value =3D 0, prev =3D 0;
--  auto p =3D begin;
--  do {
--    prev =3D value;
--    value =3D value * 10 + unsigned(*p - '0');
--    ++p;
--  } while (p !=3D end && '0' <=3D *p && *p <=3D '9');
--  auto num_digits =3D p - begin;
--  begin =3D p;
--  if (num_digits <=3D std::numeric_limits<int>::digits10)
--    return static_cast<int>(value);
--  // Check for overflow.
--  const unsigned max =3D to_unsigned((std::numeric_limits<int>::max)())=
;
--  return num_digits =3D=3D std::numeric_limits<int>::digits10 + 1 &&
--                 prev * 10ull + unsigned(p[-1] - '0') <=3D max
--             ? static_cast<int>(value)
--             : error_value;
--}
--
--FMT_CONSTEXPR inline auto parse_align(char c) -> align_t {
--  switch (c) {
--  case '<':
--    return align::left;
--  case '>':
--    return align::right;
--  case '^':
--    return align::center;
--  }
--  return align::none;
--}
--
--template <typename Char> constexpr auto is_name_start(Char c) -> bool {
--  return ('a' <=3D c && c <=3D 'z') || ('A' <=3D c && c <=3D 'Z') || c =
=3D=3D '_';
--}
--
--template <typename Char, typename Handler>
--FMT_CONSTEXPR auto do_parse_arg_id(const Char* begin, const Char* end,
--                                   Handler&& handler) -> const Char* {
--  Char c =3D *begin;
--  if (c >=3D '0' && c <=3D '9') {
--    int index =3D 0;
--    constexpr int max =3D (std::numeric_limits<int>::max)();
--    if (c !=3D '0')
--      index =3D parse_nonnegative_int(begin, end, max);
--    else
--      ++begin;
--    if (begin =3D=3D end || (*begin !=3D '}' && *begin !=3D ':'))
--      throw_format_error("invalid format string");
--    else
--      handler.on_index(index);
--    return begin;
--  }
--  if (!is_name_start(c)) {
--    throw_format_error("invalid format string");
--    return begin;
--  }
--  auto it =3D begin;
--  do {
--    ++it;
--  } while (it !=3D end && (is_name_start(*it) || ('0' <=3D *it && *it <=
=3D '9')));
--  handler.on_name({begin, to_unsigned(it - begin)});
--  return it;
--}
--
--template <typename Char, typename Handler>
--FMT_CONSTEXPR FMT_INLINE auto parse_arg_id(const Char* begin, const Cha=
r* end,
--                                           Handler&& handler) -> const =
Char* {
--  FMT_ASSERT(begin !=3D end, "");
--  Char c =3D *begin;
--  if (c !=3D '}' && c !=3D ':') return do_parse_arg_id(begin, end, hand=
ler);
--  handler.on_auto();
--  return begin;
--}
--
--template <typename Char> struct dynamic_spec_id_handler {
--  basic_format_parse_context<Char>& ctx;
--  arg_ref<Char>& ref;
--
--  FMT_CONSTEXPR void on_auto() {
--    int id =3D ctx.next_arg_id();
--    ref =3D arg_ref<Char>(id);
--    ctx.check_dynamic_spec(id);
--  }
--  FMT_CONSTEXPR void on_index(int id) {
--    ref =3D arg_ref<Char>(id);
--    ctx.check_arg_id(id);
--    ctx.check_dynamic_spec(id);
--  }
--  FMT_CONSTEXPR void on_name(basic_string_view<Char> id) {
--    ref =3D arg_ref<Char>(id);
--    ctx.check_arg_id(id);
--  }
--};
--
--// Parses [integer | "{" [arg_id] "}"].
--template <typename Char>
--FMT_CONSTEXPR auto parse_dynamic_spec(const Char* begin, const Char* en=
d,
--                                      int& value, arg_ref<Char>& ref,
--                                      basic_format_parse_context<Char>&=
 ctx)
--    -> const Char* {
--  FMT_ASSERT(begin !=3D end, "");
--  if ('0' <=3D *begin && *begin <=3D '9') {
--    int val =3D parse_nonnegative_int(begin, end, -1);
--    if (val !=3D -1)
--      value =3D val;
--    else
--      throw_format_error("number is too big");
--  } else if (*begin =3D=3D '{') {
--    ++begin;
--    auto handler =3D dynamic_spec_id_handler<Char>{ctx, ref};
--    if (begin !=3D end) begin =3D parse_arg_id(begin, end, handler);
--    if (begin !=3D end && *begin =3D=3D '}') return ++begin;
--    throw_format_error("invalid format string");
--  }
--  return begin;
--}
--
--template <typename Char>
--FMT_CONSTEXPR auto parse_precision(const Char* begin, const Char* end,
--                                   int& value, arg_ref<Char>& ref,
--                                   basic_format_parse_context<Char>& ct=
x)
--    -> const Char* {
--  ++begin;
--  if (begin =3D=3D end || *begin =3D=3D '}') {
--    throw_format_error("invalid precision");
--    return begin;
--  }
--  return parse_dynamic_spec(begin, end, value, ref, ctx);
--}
--
--enum class state { start, align, sign, hash, zero, width, precision, lo=
cale };
--
--// Parses standard format specifiers.
--template <typename Char>
--FMT_CONSTEXPR FMT_INLINE auto parse_format_specs(
--    const Char* begin, const Char* end, dynamic_format_specs<Char>& spe=
cs,
--    basic_format_parse_context<Char>& ctx, type arg_type) -> const Char=
* {
--  auto c =3D '\0';
--  if (end - begin > 1) {
--    auto next =3D to_ascii(begin[1]);
--    c =3D parse_align(next) =3D=3D align::none ? to_ascii(*begin) : '\0=
';
--  } else {
--    if (begin =3D=3D end) return begin;
--    c =3D to_ascii(*begin);
--  }
--
--  struct {
--    state current_state =3D state::start;
--    FMT_CONSTEXPR void operator()(state s, bool valid =3D true) {
--      if (current_state >=3D s || !valid)
--        throw_format_error("invalid format specifier");
--      current_state =3D s;
--    }
--  } enter_state;
--
--  using pres =3D presentation_type;
--  constexpr auto integral_set =3D sint_set | uint_set | bool_set | char=
_set;
--  struct {
--    const Char*& begin;
--    dynamic_format_specs<Char>& specs;
--    type arg_type;
--
--    FMT_CONSTEXPR auto operator()(pres type, int set) -> const Char* {
--      if (!in(arg_type, set)) throw_format_error("invalid format specif=
ier");
--      specs.type =3D type;
--      return begin + 1;
--    }
--  } parse_presentation_type{begin, specs, arg_type};
--
--  for (;;) {
--    switch (c) {
--    case '<':
--    case '>':
--    case '^':
--      enter_state(state::align);
--      specs.align =3D parse_align(c);
--      ++begin;
--      break;
--    case '+':
--    case '-':
--    case ' ':
--      enter_state(state::sign, in(arg_type, sint_set | float_set));
--      switch (c) {
--      case '+':
--        specs.sign =3D sign::plus;
--        break;
--      case '-':
--        specs.sign =3D sign::minus;
--        break;
--      case ' ':
--        specs.sign =3D sign::space;
--        break;
--      }
--      ++begin;
--      break;
--    case '#':
--      enter_state(state::hash, is_arithmetic_type(arg_type));
--      specs.alt =3D true;
--      ++begin;
--      break;
--    case '0':
--      enter_state(state::zero);
--      if (!is_arithmetic_type(arg_type))
--        throw_format_error("format specifier requires numeric argument"=
);
--      if (specs.align =3D=3D align::none) {
--        // Ignore 0 if align is specified for compatibility with std::f=
ormat.
--        specs.align =3D align::numeric;
--        specs.fill[0] =3D Char('0');
--      }
--      ++begin;
--      break;
--    case '1':
--    case '2':
--    case '3':
--    case '4':
--    case '5':
--    case '6':
--    case '7':
--    case '8':
--    case '9':
--    case '{':
--      enter_state(state::width);
--      begin =3D parse_dynamic_spec(begin, end, specs.width, specs.width=
_ref, ctx);
--      break;
--    case '.':
--      enter_state(state::precision,
--                  in(arg_type, float_set | string_set | cstring_set));
--      begin =3D parse_precision(begin, end, specs.precision, specs.prec=
ision_ref,
--                              ctx);
--      break;
--    case 'L':
--      enter_state(state::locale, is_arithmetic_type(arg_type));
--      specs.localized =3D true;
--      ++begin;
--      break;
--    case 'd':
--      return parse_presentation_type(pres::dec, integral_set);
--    case 'o':
--      return parse_presentation_type(pres::oct, integral_set);
--    case 'x':
--      return parse_presentation_type(pres::hex_lower, integral_set);
--    case 'X':
--      return parse_presentation_type(pres::hex_upper, integral_set);
--    case 'b':
--      return parse_presentation_type(pres::bin_lower, integral_set);
--    case 'B':
--      return parse_presentation_type(pres::bin_upper, integral_set);
--    case 'a':
--      return parse_presentation_type(pres::hexfloat_lower, float_set);
--    case 'A':
--      return parse_presentation_type(pres::hexfloat_upper, float_set);
--    case 'e':
--      return parse_presentation_type(pres::exp_lower, float_set);
--    case 'E':
--      return parse_presentation_type(pres::exp_upper, float_set);
--    case 'f':
--      return parse_presentation_type(pres::fixed_lower, float_set);
--    case 'F':
--      return parse_presentation_type(pres::fixed_upper, float_set);
--    case 'g':
--      return parse_presentation_type(pres::general_lower, float_set);
--    case 'G':
--      return parse_presentation_type(pres::general_upper, float_set);
--    case 'c':
--      return parse_presentation_type(pres::chr, integral_set);
--    case 's':
--      return parse_presentation_type(pres::string,
--                                     bool_set | string_set | cstring_se=
t);
--    case 'p':
--      return parse_presentation_type(pres::pointer, pointer_set | cstri=
ng_set);
--    case '?':
--      return parse_presentation_type(pres::debug,
--                                     char_set | string_set | cstring_se=
t);
--    case '}':
--      return begin;
--    default: {
--      if (*begin =3D=3D '}') return begin;
--      // Parse fill and alignment.
--      auto fill_end =3D begin + code_point_length(begin);
--      if (end - fill_end <=3D 0) {
--        throw_format_error("invalid format specifier");
--        return begin;
--      }
--      if (*begin =3D=3D '{') {
--        throw_format_error("invalid fill character '{'");
--        return begin;
--      }
--      auto align =3D parse_align(to_ascii(*fill_end));
--      enter_state(state::align, align !=3D align::none);
--      specs.fill =3D {begin, to_unsigned(fill_end - begin)};
--      specs.align =3D align;
--      begin =3D fill_end + 1;
--    }
--    }
--    if (begin =3D=3D end) return begin;
--    c =3D to_ascii(*begin);
--  }
--}
--
--template <typename Char, typename Handler>
--FMT_CONSTEXPR auto parse_replacement_field(const Char* begin, const Cha=
r* end,
--                                           Handler&& handler) -> const =
Char* {
--  struct id_adapter {
--    Handler& handler;
--    int arg_id;
--
--    FMT_CONSTEXPR void on_auto() { arg_id =3D handler.on_arg_id(); }
--    FMT_CONSTEXPR void on_index(int id) { arg_id =3D handler.on_arg_id(=
id); }
--    FMT_CONSTEXPR void on_name(basic_string_view<Char> id) {
--      arg_id =3D handler.on_arg_id(id);
--    }
--  };
--
--  ++begin;
--  if (begin =3D=3D end) return handler.on_error("invalid format string"=
), end;
--  if (*begin =3D=3D '}') {
--    handler.on_replacement_field(handler.on_arg_id(), begin);
--  } else if (*begin =3D=3D '{') {
--    handler.on_text(begin, begin + 1);
--  } else {
--    auto adapter =3D id_adapter{handler, 0};
--    begin =3D parse_arg_id(begin, end, adapter);
--    Char c =3D begin !=3D end ? *begin : Char();
--    if (c =3D=3D '}') {
--      handler.on_replacement_field(adapter.arg_id, begin);
--    } else if (c =3D=3D ':') {
--      begin =3D handler.on_format_specs(adapter.arg_id, begin + 1, end)=
;
--      if (begin =3D=3D end || *begin !=3D '}')
--        return handler.on_error("unknown format specifier"), end;
--    } else {
--      return handler.on_error("missing '}' in format string"), end;
--    }
--  }
--  return begin + 1;
--}
--
--template <bool IS_CONSTEXPR, typename Char, typename Handler>
--FMT_CONSTEXPR FMT_INLINE void parse_format_string(
--    basic_string_view<Char> format_str, Handler&& handler) {
--  auto begin =3D format_str.data();
--  auto end =3D begin + format_str.size();
--  if (end - begin < 32) {
--    // Use a simple loop instead of memchr for small strings.
--    const Char* p =3D begin;
--    while (p !=3D end) {
--      auto c =3D *p++;
--      if (c =3D=3D '{') {
--        handler.on_text(begin, p - 1);
--        begin =3D p =3D parse_replacement_field(p - 1, end, handler);
--      } else if (c =3D=3D '}') {
--        if (p =3D=3D end || *p !=3D '}')
--          return handler.on_error("unmatched '}' in format string");
--        handler.on_text(begin, p);
--        begin =3D ++p;
--      }
--    }
--    handler.on_text(begin, end);
--    return;
--  }
--  struct writer {
--    FMT_CONSTEXPR void operator()(const Char* from, const Char* to) {
--      if (from =3D=3D to) return;
--      for (;;) {
--        const Char* p =3D nullptr;
--        if (!find<IS_CONSTEXPR>(from, to, Char('}'), p))
--          return handler_.on_text(from, to);
--        ++p;
--        if (p =3D=3D to || *p !=3D '}')
--          return handler_.on_error("unmatched '}' in format string");
--        handler_.on_text(from, p);
--        from =3D p + 1;
--      }
--    }
--    Handler& handler_;
--  } write =3D {handler};
--  while (begin !=3D end) {
--    // Doing two passes with memchr (one for '{' and another for '}') i=
s up to
--    // 2.5x faster than the naive one-pass implementation on big format=
 strings.
--    const Char* p =3D begin;
--    if (*begin !=3D '{' && !find<IS_CONSTEXPR>(begin + 1, end, Char('{'=
), p))
--      return write(begin, end);
--    write(begin, p);
--    begin =3D parse_replacement_field(p, end, handler);
--  }
--}
--
--template <typename T, bool =3D is_named_arg<T>::value> struct strip_nam=
ed_arg {
--  using type =3D T;
--};
--template <typename T> struct strip_named_arg<T, true> {
--  using type =3D remove_cvref_t<decltype(T::value)>;
--};
--
--template <typename T, typename ParseContext>
--FMT_CONSTEXPR auto parse_format_specs(ParseContext& ctx)
--    -> decltype(ctx.begin()) {
--  using char_type =3D typename ParseContext::char_type;
--  using context =3D buffer_context<char_type>;
--  using mapped_type =3D conditional_t<
--      mapped_type_constant<T, context>::value !=3D type::custom_type,
--      decltype(arg_mapper<context>().map(std::declval<const T&>())),
--      typename strip_named_arg<T>::type>;
--  return formatter<mapped_type, char_type>().parse(ctx);
--}
--
--// Checks char specs and returns true iff the presentation type is char=
-like.
--template <typename Char>
--FMT_CONSTEXPR auto check_char_specs(const format_specs<Char>& specs) ->=
 bool {
--  if (specs.type !=3D presentation_type::none &&
--      specs.type !=3D presentation_type::chr &&
--      specs.type !=3D presentation_type::debug) {
--    return false;
--  }
--  if (specs.align =3D=3D align::numeric || specs.sign !=3D sign::none |=
| specs.alt)
--    throw_format_error("invalid format specifier for char");
--  return true;
--}
--
--#if FMT_USE_NONTYPE_TEMPLATE_ARGS
--template <int N, typename T, typename... Args, typename Char>
--constexpr auto get_arg_index_by_name(basic_string_view<Char> name) -> i=
nt {
--  if constexpr (is_statically_named_arg<T>()) {
--    if (name =3D=3D T::name) return N;
--  }
--  if constexpr (sizeof...(Args) > 0)
--    return get_arg_index_by_name<N + 1, Args...>(name);
--  (void)name;  // Workaround an MSVC bug about "unused" parameter.
--  return -1;
--}
--#endif
--
--template <typename... Args, typename Char>
--FMT_CONSTEXPR auto get_arg_index_by_name(basic_string_view<Char> name) =
-> int {
--#if FMT_USE_NONTYPE_TEMPLATE_ARGS
--  if constexpr (sizeof...(Args) > 0)
--    return get_arg_index_by_name<0, Args...>(name);
--#endif
--  (void)name;
--  return -1;
--}
--
--template <typename Char, typename... Args> class format_string_checker =
{
-- private:
--  using parse_context_type =3D compile_parse_context<Char>;
--  static constexpr int num_args =3D sizeof...(Args);
--
--  // Format specifier parsing function.
--  // In the future basic_format_parse_context will replace compile_pars=
e_context
--  // here and will use is_constant_evaluated and downcasting to access =
the data
--  // needed for compile-time checks: https://godbolt.org/z/GvWzcTjh1.
--  using parse_func =3D const Char* (*)(parse_context_type&);
--
--  parse_context_type context_;
--  parse_func parse_funcs_[num_args > 0 ? static_cast<size_t>(num_args) =
: 1];
--  type types_[num_args > 0 ? static_cast<size_t>(num_args) : 1];
--
-- public:
--  explicit FMT_CONSTEXPR format_string_checker(basic_string_view<Char> =
fmt)
--      : context_(fmt, num_args, types_),
--        parse_funcs_{&parse_format_specs<Args, parse_context_type>...},
--        types_{mapped_type_constant<Args, buffer_context<Char>>::value.=
..} {}
--
--  FMT_CONSTEXPR void on_text(const Char*, const Char*) {}
--
--  FMT_CONSTEXPR auto on_arg_id() -> int { return context_.next_arg_id()=
; }
--  FMT_CONSTEXPR auto on_arg_id(int id) -> int {
--    return context_.check_arg_id(id), id;
--  }
--  FMT_CONSTEXPR auto on_arg_id(basic_string_view<Char> id) -> int {
--#if FMT_USE_NONTYPE_TEMPLATE_ARGS
--    auto index =3D get_arg_index_by_name<Args...>(id);
--    if (index < 0) on_error("named argument is not found");
--    return index;
--#else
--    (void)id;
--    on_error("compile-time checks for named arguments require C++20 sup=
port");
--    return 0;
--#endif
--  }
--
--  FMT_CONSTEXPR void on_replacement_field(int, const Char*) {}
--
--  FMT_CONSTEXPR auto on_format_specs(int id, const Char* begin, const C=
har*)
--      -> const Char* {
--    context_.advance_to(begin);
--    // id >=3D 0 check is a workaround for gcc 10 bug (#2065).
--    return id >=3D 0 && id < num_args ? parse_funcs_[id](context_) : be=
gin;
--  }
--
--  FMT_CONSTEXPR void on_error(const char* message) {
--    throw_format_error(message);
--  }
--};
--
--// Reports a compile-time error if S is not a valid format string.
--template <typename..., typename S, FMT_ENABLE_IF(!is_compile_string<S>:=
:value)>
--FMT_INLINE void check_format_string(const S&) {
--#ifdef FMT_ENFORCE_COMPILE_STRING
--  static_assert(is_compile_string<S>::value,
--                "FMT_ENFORCE_COMPILE_STRING requires all format strings=
 to use "
--                "FMT_STRING.");
--#endif
--}
--template <typename... Args, typename S,
--          FMT_ENABLE_IF(is_compile_string<S>::value)>
--void check_format_string(S format_str) {
--  using char_t =3D typename S::char_type;
--  FMT_CONSTEXPR auto s =3D basic_string_view<char_t>(format_str);
--  using checker =3D format_string_checker<char_t, remove_cvref_t<Args>.=
..>;
--  FMT_CONSTEXPR bool error =3D (parse_format_string<true>(s, checker(s)=
), true);
--  ignore_unused(error);
--}
--
--template <typename Char =3D char> struct vformat_args {
--  using type =3D basic_format_args<
--      basic_format_context<std::back_insert_iterator<buffer<Char>>, Cha=
r>>;
--};
--template <> struct vformat_args<char> { using type =3D format_args; };
--
--// Use vformat_args and avoid type_identity to keep symbols short.
--template <typename Char>
--void vformat_to(buffer<Char>& buf, basic_string_view<Char> fmt,
--                typename vformat_args<Char>::type args, locale_ref loc =
=3D {});
--
--FMT_API void vprint_mojibake(std::FILE*, string_view, format_args);
--#ifndef _WIN32
--inline void vprint_mojibake(std::FILE*, string_view, format_args) {}
--#endif
--}  // namespace detail
--
--FMT_BEGIN_EXPORT
--
--// A formatter specialization for natively supported types.
--template <typename T, typename Char>
--struct formatter<T, Char,
--                 enable_if_t<detail::type_constant<T, Char>::value !=3D
--                             detail::type::custom_type>> {
-- private:
--  detail::dynamic_format_specs<Char> specs_;
--
-- public:
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> const Char* {
--    auto type =3D detail::type_constant<T, Char>::value;
--    auto end =3D
--        detail::parse_format_specs(ctx.begin(), ctx.end(), specs_, ctx,=
 type);
--    if (type =3D=3D detail::type::char_type) detail::check_char_specs(s=
pecs_);
--    return end;
--  }
--
--  template <detail::type U =3D detail::type_constant<T, Char>::value,
--            FMT_ENABLE_IF(U =3D=3D detail::type::string_type ||
--                          U =3D=3D detail::type::cstring_type ||
--                          U =3D=3D detail::type::char_type)>
--  FMT_CONSTEXPR void set_debug_format(bool set =3D true) {
--    specs_.type =3D set ? presentation_type::debug : presentation_type:=
:none;
--  }
--
--  template <typename FormatContext>
--  FMT_CONSTEXPR auto format(const T& val, FormatContext& ctx) const
--      -> decltype(ctx.out());
--};
--
--#define FMT_FORMAT_AS(Type, Base) \
--  template <typename Char>        \
--  struct formatter<Type, Char> : formatter<Base, Char> {}
--
--FMT_FORMAT_AS(signed char, int);
--FMT_FORMAT_AS(unsigned char, unsigned);
--FMT_FORMAT_AS(short, int);
--FMT_FORMAT_AS(unsigned short, unsigned);
--FMT_FORMAT_AS(long, detail::long_type);
--FMT_FORMAT_AS(unsigned long, detail::ulong_type);
--FMT_FORMAT_AS(Char*, const Char*);
--FMT_FORMAT_AS(std::basic_string<Char>, basic_string_view<Char>);
--FMT_FORMAT_AS(std::nullptr_t, const void*);
--FMT_FORMAT_AS(detail::std_string_view<Char>, basic_string_view<Char>);
--
--template <typename Char =3D char> struct runtime_format_string {
--  basic_string_view<Char> str;
--};
--
--/** A compile-time format string. */
--template <typename Char, typename... Args> class basic_format_string {
-- private:
--  basic_string_view<Char> str_;
--
-- public:
--  template <typename S,
--            FMT_ENABLE_IF(
--                std::is_convertible<const S&, basic_string_view<Char>>:=
:value)>
--  FMT_CONSTEVAL FMT_INLINE basic_format_string(const S& s) : str_(s) {
--    static_assert(
--        detail::count<
--            (std::is_base_of<detail::view, remove_reference_t<Args>>::v=
alue &&
--             std::is_reference<Args>::value)...>() =3D=3D 0,
--        "passing views as lvalues is disallowed");
--#ifdef FMT_HAS_CONSTEVAL
--    if constexpr (detail::count_named_args<Args...>() =3D=3D
--                  detail::count_statically_named_args<Args...>()) {
--      using checker =3D
--          detail::format_string_checker<Char, remove_cvref_t<Args>...>;
--      detail::parse_format_string<true>(str_, checker(s));
--    }
--#else
--    detail::check_format_string<Args...>(s);
--#endif
--  }
--  basic_format_string(runtime_format_string<Char> fmt) : str_(fmt.str) =
{}
--
--  FMT_INLINE operator basic_string_view<Char>() const { return str_; }
--  FMT_INLINE auto get() const -> basic_string_view<Char> { return str_;=
 }
--};
--
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 409
--// Workaround broken conversion on older gcc.
--template <typename...> using format_string =3D string_view;
--inline auto runtime(string_view s) -> string_view { return s; }
--#else
--template <typename... Args>
--using format_string =3D basic_format_string<char, type_identity_t<Args>=
...>;
--/**
--  \rst
--  Creates a runtime format string.
--
--  **Example**::
--
--    // Check format string at runtime instead of compile-time.
--    fmt::print(fmt::runtime("{:d}"), "I am not a number");
--  \endrst
-- */
--inline auto runtime(string_view s) -> runtime_format_string<> { return =
{{s}}; }
--#endif
--
--FMT_API auto vformat(string_view fmt, format_args args) -> std::string;
--
--/**
--  \rst
--  Formats ``args`` according to specifications in ``fmt`` and returns t=
he result
--  as a string.
--
--  **Example**::
--
--    #include <fmt/core.h>
--    std::string message =3D fmt::format("The answer is {}.", 42);
--  \endrst
--*/
--template <typename... T>
--FMT_NODISCARD FMT_INLINE auto format(format_string<T...> fmt, T&&... ar=
gs)
--    -> std::string {
--  return vformat(fmt, fmt::make_format_args(args...));
--}
--
--/** Formats a string and writes the output to ``out``. */
--template <typename OutputIt,
--          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
--auto vformat_to(OutputIt out, string_view fmt, format_args args) -> Out=
putIt {
--  auto&& buf =3D detail::get_buffer<char>(out);
--  detail::vformat_to(buf, fmt, args, {});
--  return detail::get_iterator(buf, out);
--}
--
--/**
-- \rst
-- Formats ``args`` according to specifications in ``fmt``, writes the re=
sult to
-- the output iterator ``out`` and returns the iterator past the end of t=
he output
-- range. `format_to` does not append a terminating null character.
--
-- **Example**::
--
--   auto out =3D std::vector<char>();
--   fmt::format_to(std::back_inserter(out), "{}", 42);
-- \endrst
-- */
--template <typename OutputIt, typename... T,
--          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
--FMT_INLINE auto format_to(OutputIt out, format_string<T...> fmt, T&&...=
 args)
--    -> OutputIt {
--  return vformat_to(out, fmt, fmt::make_format_args(args...));
--}
--
--template <typename OutputIt> struct format_to_n_result {
--  /** Iterator past the end of the output range. */
--  OutputIt out;
--  /** Total (not truncated) output size. */
--  size_t size;
--};
--
--template <typename OutputIt, typename... T,
--          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
--auto vformat_to_n(OutputIt out, size_t n, string_view fmt, format_args =
args)
--    -> format_to_n_result<OutputIt> {
--  using traits =3D detail::fixed_buffer_traits;
--  auto buf =3D detail::iterator_buffer<OutputIt, char, traits>(out, n);
--  detail::vformat_to(buf, fmt, args, {});
--  return {buf.out(), buf.count()};
--}
--
--/**
--  \rst
--  Formats ``args`` according to specifications in ``fmt``, writes up to=
 ``n``
--  characters of the result to the output iterator ``out`` and returns t=
he total
--  (not truncated) output size and the iterator past the end of the outp=
ut range.
--  `format_to_n` does not append a terminating null character.
--  \endrst
-- */
--template <typename OutputIt, typename... T,
--          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
--FMT_INLINE auto format_to_n(OutputIt out, size_t n, format_string<T...>=
 fmt,
--                            T&&... args) -> format_to_n_result<OutputIt=
> {
--  return vformat_to_n(out, n, fmt, fmt::make_format_args(args...));
--}
--
--/** Returns the number of chars in the output of ``format(fmt, args...)=
``. */
--template <typename... T>
--FMT_NODISCARD FMT_INLINE auto formatted_size(format_string<T...> fmt,
--                                             T&&... args) -> size_t {
--  auto buf =3D detail::counting_buffer<>();
--  detail::vformat_to<char>(buf, fmt, fmt::make_format_args(args...), {}=
);
--  return buf.count();
--}
--
--FMT_API void vprint(string_view fmt, format_args args);
--FMT_API void vprint(std::FILE* f, string_view fmt, format_args args);
--
--/**
--  \rst
--  Formats ``args`` according to specifications in ``fmt`` and writes th=
e output
--  to ``stdout``.
--
--  **Example**::
--
--    fmt::print("Elapsed time: {0:.2f} seconds", 1.23);
--  \endrst
-- */
--template <typename... T>
--FMT_INLINE void print(format_string<T...> fmt, T&&... args) {
--  const auto& vargs =3D fmt::make_format_args(args...);
--  return detail::is_utf8() ? vprint(fmt, vargs)
--                           : detail::vprint_mojibake(stdout, fmt, vargs=
);
--}
--
--/**
--  \rst
--  Formats ``args`` according to specifications in ``fmt`` and writes th=
e
--  output to the file ``f``.
--
--  **Example**::
--
--    fmt::print(stderr, "Don't {}!", "panic");
--  \endrst
-- */
--template <typename... T>
--FMT_INLINE void print(std::FILE* f, format_string<T...> fmt, T&&... arg=
s) {
--  const auto& vargs =3D fmt::make_format_args(args...);
--  return detail::is_utf8() ? vprint(f, fmt, vargs)
--                           : detail::vprint_mojibake(f, fmt, vargs);
--}
--
--/**
--  Formats ``args`` according to specifications in ``fmt`` and writes th=
e
--  output to the file ``f`` followed by a newline.
-- */
--template <typename... T>
--FMT_INLINE void println(std::FILE* f, format_string<T...> fmt, T&&... a=
rgs) {
--  return fmt::print(f, "{}\n", fmt::format(fmt, std::forward<T>(args)..=
.));
--}
--
--/**
--  Formats ``args`` according to specifications in ``fmt`` and writes th=
e output
--  to ``stdout`` followed by a newline.
-- */
--template <typename... T>
--FMT_INLINE void println(format_string<T...> fmt, T&&... args) {
--  return fmt::println(stdout, fmt, std::forward<T>(args)...);
--}
--
--FMT_END_EXPORT
--FMT_GCC_PRAGMA("GCC pop_options")
--FMT_END_NAMESPACE
--
--#ifdef FMT_HEADER_ONLY
--#  include "format.h"
--#endif
--#endif  // FMT_CORE_H_
-+#include "format.h"
-diff --git a/include/fmt/format-inl.h b/include/fmt/format-inl.h
-index dac2d43..66ee747 100644
---- a/include/fmt/format-inl.h
-+++ b/include/fmt/format-inl.h
-@@ -8,36 +8,36 @@
- #ifndef FMT_FORMAT_INL_H_
- #define FMT_FORMAT_INL_H_
-=20
--#include <algorithm>
--#include <cerrno>  // errno
--#include <climits>
--#include <cmath>
--#include <exception>
--
--#ifndef FMT_STATIC_THOUSANDS_SEPARATOR
--#  include <locale>
-+#ifndef FMT_MODULE
-+#  include <algorithm>
-+#  include <cerrno>  // errno
-+#  include <climits>
-+#  include <cmath>
-+#  include <exception>
- #endif
-=20
--#ifdef _WIN32
-+#if defined(_WIN32) && !defined(FMT_USE_WRITE_CONSOLE)
- #  include <io.h>  // _isatty
- #endif
-=20
- #include "format.h"
-=20
-+#if FMT_USE_LOCALE
-+#  include <locale>
-+#endif
-+
-+#ifndef FMT_FUNC
-+#  define FMT_FUNC
-+#endif
-+
- FMT_BEGIN_NAMESPACE
- namespace detail {
-=20
- FMT_FUNC void assert_fail(const char* file, int line, const char* messa=
ge) {
-   // Use unchecked std::fprintf to avoid triggering another assertion w=
hen
--  // writing to stderr fails
--  std::fprintf(stderr, "%s:%d: assertion failed: %s", file, line, messa=
ge);
--  // Chosen instead of std::abort to satisfy Clang in CUDA mode during =
device
--  // code pass.
--  std::terminate();
--}
--
--FMT_FUNC void throw_format_error(const char* message) {
--  FMT_THROW(format_error(message));
-+  // writing to stderr fails.
-+  fprintf(stderr, "%s:%d: assertion failed: %s", file, line, message);
-+  abort();
- }
-=20
- FMT_FUNC void format_error_code(detail::buffer<char>& out, int error_co=
de,
-@@ -56,112 +56,129 @@ FMT_FUNC void format_error_code(detail::buffer<cha=
r>& out, int error_code,
-     ++error_code_size;
-   }
-   error_code_size +=3D detail::to_unsigned(detail::count_digits(abs_val=
ue));
--  auto it =3D buffer_appender<char>(out);
-+  auto it =3D appender(out);
-   if (message.size() <=3D inline_buffer_size - error_code_size)
--    format_to(it, FMT_STRING("{}{}"), message, SEP);
--  format_to(it, FMT_STRING("{}{}"), ERROR_STR, error_code);
-+    fmt::format_to(it, FMT_STRING("{}{}"), message, SEP);
-+  fmt::format_to(it, FMT_STRING("{}{}"), ERROR_STR, error_code);
-   FMT_ASSERT(out.size() <=3D inline_buffer_size, "");
- }
-=20
--FMT_FUNC void report_error(format_func func, int error_code,
--                           const char* message) noexcept {
-+FMT_FUNC void do_report_error(format_func func, int error_code,
-+                              const char* message) noexcept {
-   memory_buffer full_message;
-   func(full_message, error_code, message);
--  // Don't use fwrite_fully because the latter may throw.
-+  // Don't use fwrite_all because the latter may throw.
-   if (std::fwrite(full_message.data(), full_message.size(), 1, stderr) =
> 0)
-     std::fputc('\n', stderr);
- }
-=20
- // A wrapper around fwrite that throws on error.
--inline void fwrite_fully(const void* ptr, size_t size, size_t count,
--                         FILE* stream) {
--  size_t written =3D std::fwrite(ptr, size, count, stream);
-+inline void fwrite_all(const void* ptr, size_t count, FILE* stream) {
-+  size_t written =3D std::fwrite(ptr, 1, count, stream);
-   if (written < count)
-     FMT_THROW(system_error(errno, FMT_STRING("cannot write to file")));
- }
-=20
--#ifndef FMT_STATIC_THOUSANDS_SEPARATOR
-+#if FMT_USE_LOCALE
-+using std::locale;
-+using std::numpunct;
-+using std::use_facet;
-+
- template <typename Locale>
- locale_ref::locale_ref(const Locale& loc) : locale_(&loc) {
--  static_assert(std::is_same<Locale, std::locale>::value, "");
-+  static_assert(std::is_same<Locale, locale>::value, "");
- }
-+#else
-+struct locale {};
-+template <typename Char> struct numpunct {
-+  auto grouping() const -> std::string { return "\03"; }
-+  auto thousands_sep() const -> Char { return ','; }
-+  auto decimal_point() const -> Char { return '.'; }
-+};
-+template <typename Facet> Facet use_facet(locale) { return {}; }
-+#endif  // FMT_USE_LOCALE
-=20
--template <typename Locale> Locale locale_ref::get() const {
--  static_assert(std::is_same<Locale, std::locale>::value, "");
--  return locale_ ? *static_cast<const std::locale*>(locale_) : std::loc=
ale();
-+template <typename Locale> auto locale_ref::get() const -> Locale {
-+  static_assert(std::is_same<Locale, locale>::value, "");
-+#if FMT_USE_LOCALE
-+  if (locale_) return *static_cast<const locale*>(locale_);
-+#endif
-+  return locale();
- }
-=20
- template <typename Char>
- FMT_FUNC auto thousands_sep_impl(locale_ref loc) -> thousands_sep_resul=
t<Char> {
--  auto& facet =3D std::use_facet<std::numpunct<Char>>(loc.get<std::loca=
le>());
-+  auto&& facet =3D use_facet<numpunct<Char>>(loc.get<locale>());
-   auto grouping =3D facet.grouping();
-   auto thousands_sep =3D grouping.empty() ? Char() : facet.thousands_se=
p();
-   return {std::move(grouping), thousands_sep};
- }
--template <typename Char> FMT_FUNC Char decimal_point_impl(locale_ref lo=
c) {
--  return std::use_facet<std::numpunct<Char>>(loc.get<std::locale>())
--      .decimal_point();
--}
--#else
- template <typename Char>
--FMT_FUNC auto thousands_sep_impl(locale_ref) -> thousands_sep_result<Ch=
ar> {
--  return {"\03", FMT_STATIC_THOUSANDS_SEPARATOR};
-+FMT_FUNC auto decimal_point_impl(locale_ref loc) -> Char {
-+  return use_facet<numpunct<Char>>(loc.get<locale>()).decimal_point();
- }
--template <typename Char> FMT_FUNC Char decimal_point_impl(locale_ref) {
--  return '.';
--}
--#endif
-=20
-+#if FMT_USE_LOCALE
- FMT_FUNC auto write_loc(appender out, loc_value value,
--                        const format_specs<>& specs, locale_ref loc) ->=
 bool {
--#ifndef FMT_STATIC_THOUSANDS_SEPARATOR
-+                        const format_specs& specs, locale_ref loc) -> b=
ool {
-   auto locale =3D loc.get<std::locale>();
-   // We cannot use the num_put<char> facet because it may produce outpu=
t in
-   // a wrong encoding.
-   using facet =3D format_facet<std::locale>;
-   if (std::has_facet<facet>(locale))
--    return std::use_facet<facet>(locale).put(out, value, specs);
-+    return use_facet<facet>(locale).put(out, value, specs);
-   return facet(locale).put(out, value, specs);
--#endif
--  return false;
- }
-+#endif
- }  // namespace detail
-=20
-+FMT_FUNC void report_error(const char* message) {
-+#if FMT_USE_EXCEPTIONS
-+  // Use FMT_THROW instead of throw to avoid bogus unreachable code war=
nings
-+  // from MSVC.
-+  FMT_THROW(format_error(message));
-+#else
-+  fputs(message, stderr);
-+  abort();
-+#endif
-+}
-+
- template <typename Locale> typename Locale::id format_facet<Locale>::id=
;
-=20
--#ifndef FMT_STATIC_THOUSANDS_SEPARATOR
- template <typename Locale> format_facet<Locale>::format_facet(Locale& l=
oc) {
--  auto& numpunct =3D std::use_facet<std::numpunct<char>>(loc);
--  grouping_ =3D numpunct.grouping();
--  if (!grouping_.empty()) separator_ =3D std::string(1, numpunct.thousa=
nds_sep());
-+  auto& np =3D detail::use_facet<detail::numpunct<char>>(loc);
-+  grouping_ =3D np.grouping();
-+  if (!grouping_.empty()) separator_ =3D std::string(1, np.thousands_se=
p());
- }
-=20
-+#if FMT_USE_LOCALE
- template <>
- FMT_API FMT_FUNC auto format_facet<std::locale>::do_put(
--    appender out, loc_value val, const format_specs<>& specs) const -> =
bool {
-+    appender out, loc_value val, const format_specs& specs) const -> bo=
ol {
-   return val.visit(
-       detail::loc_writer<>{out, specs, separator_, grouping_, decimal_p=
oint_});
- }
- #endif
-=20
--FMT_FUNC std::system_error vsystem_error(int error_code, string_view fm=
t,
--                                         format_args args) {
-+FMT_FUNC auto vsystem_error(int error_code, string_view fmt, format_arg=
s args)
-+    -> std::system_error {
-   auto ec =3D std::error_code(error_code, std::generic_category());
-   return std::system_error(ec, vformat(fmt, args));
- }
-=20
- namespace detail {
-=20
--template <typename F> inline bool operator=3D=3D(basic_fp<F> x, basic_f=
p<F> y) {
-+template <typename F>
-+inline auto operator=3D=3D(basic_fp<F> x, basic_fp<F> y) -> bool {
-   return x.f =3D=3D y.f && x.e =3D=3D y.e;
- }
-=20
- // Compilers should be able to optimize this into the ror instruction.
--FMT_CONSTEXPR inline uint32_t rotr(uint32_t n, uint32_t r) noexcept {
-+FMT_CONSTEXPR inline auto rotr(uint32_t n, uint32_t r) noexcept -> uint=
32_t {
-   r &=3D 31;
-   return (n >> r) | (n << (32 - r));
- }
--FMT_CONSTEXPR inline uint64_t rotr(uint64_t n, uint32_t r) noexcept {
-+FMT_CONSTEXPR inline auto rotr(uint64_t n, uint32_t r) noexcept -> uint=
64_t {
-   r &=3D 63;
-   return (n >> r) | (n << (64 - r));
- }
-@@ -170,14 +187,14 @@ FMT_CONSTEXPR inline uint64_t rotr(uint64_t n, uin=
t32_t r) noexcept {
- namespace dragonbox {
- // Computes upper 64 bits of multiplication of a 32-bit unsigned intege=
r and a
- // 64-bit unsigned integer.
--inline uint64_t umul96_upper64(uint32_t x, uint64_t y) noexcept {
-+inline auto umul96_upper64(uint32_t x, uint64_t y) noexcept -> uint64_t=
 {
-   return umul128_upper64(static_cast<uint64_t>(x) << 32, y);
- }
-=20
- // Computes lower 128 bits of multiplication of a 64-bit unsigned integ=
er and a
- // 128-bit unsigned integer.
--inline uint128_fallback umul192_lower128(uint64_t x,
--                                         uint128_fallback y) noexcept {
-+inline auto umul192_lower128(uint64_t x, uint128_fallback y) noexcept
-+    -> uint128_fallback {
-   uint64_t high =3D x * y.high();
-   uint128_fallback high_low =3D umul128(x, y.low());
-   return {high + high_low.high(), high_low.low()};
-@@ -185,17 +202,17 @@ inline uint128_fallback umul192_lower128(uint64_t =
x,
-=20
- // Computes lower 64 bits of multiplication of a 32-bit unsigned intege=
r and a
- // 64-bit unsigned integer.
--inline uint64_t umul96_lower64(uint32_t x, uint64_t y) noexcept {
-+inline auto umul96_lower64(uint32_t x, uint64_t y) noexcept -> uint64_t=
 {
-   return x * y;
- }
-=20
- // Various fast log computations.
--inline int floor_log10_pow2_minus_log10_4_over_3(int e) noexcept {
-+inline auto floor_log10_pow2_minus_log10_4_over_3(int e) noexcept -> in=
t {
-   FMT_ASSERT(e <=3D 2936 && e >=3D -2985, "too large exponent");
-   return (e * 631305 - 261663) >> 21;
- }
-=20
--FMT_INLINE_VARIABLE constexpr struct {
-+FMT_INLINE_VARIABLE constexpr struct div_small_pow10_infos_struct {
-   uint32_t divisor;
-   int shift_amount;
- } div_small_pow10_infos[] =3D {{10, 16}, {100, 16}};
-@@ -204,7 +221,7 @@ FMT_INLINE_VARIABLE constexpr struct {
- // divisible by pow(10, N).
- // Precondition: n <=3D pow(10, N + 1).
- template <int N>
--bool check_divisibility_and_divide_by_pow10(uint32_t& n) noexcept {
-+auto check_divisibility_and_divide_by_pow10(uint32_t& n) noexcept -> bo=
ol {
-   // The numbers below are chosen such that:
-   //   1. floor(n/d) =3D floor(nm / 2^k) where d=3D10 or d=3D100,
-   //   2. nm mod 2^k < m if and only if n is divisible by d,
-@@ -229,7 +246,7 @@ bool check_divisibility_and_divide_by_pow10(uint32_t=
& n) noexcept {
-=20
- // Computes floor(n / pow(10, N)) for small n and N.
- // Precondition: n <=3D pow(10, N + 1).
--template <int N> uint32_t small_division_by_pow10(uint32_t n) noexcept =
{
-+template <int N> auto small_division_by_pow10(uint32_t n) noexcept -> u=
int32_t {
-   constexpr auto info =3D div_small_pow10_infos[N - 1];
-   FMT_ASSERT(n <=3D info.divisor * 10, "n is too large");
-   constexpr uint32_t magic_number =3D
-@@ -238,12 +255,12 @@ template <int N> uint32_t small_division_by_pow10(=
uint32_t n) noexcept {
- }
-=20
- // Computes floor(n / 10^(kappa + 1)) (float)
--inline uint32_t divide_by_10_to_kappa_plus_1(uint32_t n) noexcept {
-+inline auto divide_by_10_to_kappa_plus_1(uint32_t n) noexcept -> uint32=
_t {
-   // 1374389535 =3D ceil(2^37/100)
-   return static_cast<uint32_t>((static_cast<uint64_t>(n) * 1374389535) =
>> 37);
- }
- // Computes floor(n / 10^(kappa + 1)) (double)
--inline uint64_t divide_by_10_to_kappa_plus_1(uint64_t n) noexcept {
-+inline auto divide_by_10_to_kappa_plus_1(uint64_t n) noexcept -> uint64=
_t {
-   // 2361183241434822607 =3D ceil(2^(64+7)/1000)
-   return umul128_upper64(n, 2361183241434822607ull) >> 7;
- }
-@@ -255,7 +272,7 @@ template <> struct cache_accessor<float> {
-   using carrier_uint =3D float_info<float>::carrier_uint;
-   using cache_entry_type =3D uint64_t;
-=20
--  static uint64_t get_cached_power(int k) noexcept {
-+  static auto get_cached_power(int k) noexcept -> uint64_t {
-     FMT_ASSERT(k >=3D float_info<float>::min_k && k <=3D float_info<flo=
at>::max_k,
-                "k is out of range");
-     static constexpr const uint64_t pow10_significands[] =3D {
-@@ -297,20 +314,23 @@ template <> struct cache_accessor<float> {
-     bool is_integer;
-   };
-=20
--  static compute_mul_result compute_mul(
--      carrier_uint u, const cache_entry_type& cache) noexcept {
-+  static auto compute_mul(carrier_uint u,
-+                          const cache_entry_type& cache) noexcept
-+      -> compute_mul_result {
-     auto r =3D umul96_upper64(u, cache);
-     return {static_cast<carrier_uint>(r >> 32),
-             static_cast<carrier_uint>(r) =3D=3D 0};
-   }
-=20
--  static uint32_t compute_delta(const cache_entry_type& cache,
--                                int beta) noexcept {
-+  static auto compute_delta(const cache_entry_type& cache, int beta) no=
except
-+      -> uint32_t {
-     return static_cast<uint32_t>(cache >> (64 - 1 - beta));
-   }
-=20
--  static compute_mul_parity_result compute_mul_parity(
--      carrier_uint two_f, const cache_entry_type& cache, int beta) noex=
cept {
-+  static auto compute_mul_parity(carrier_uint two_f,
-+                                 const cache_entry_type& cache,
-+                                 int beta) noexcept
-+      -> compute_mul_parity_result {
-     FMT_ASSERT(beta >=3D 1, "");
-     FMT_ASSERT(beta < 64, "");
-=20
-@@ -319,22 +339,22 @@ template <> struct cache_accessor<float> {
-             static_cast<uint32_t>(r >> (32 - beta)) =3D=3D 0};
-   }
-=20
--  static carrier_uint compute_left_endpoint_for_shorter_interval_case(
--      const cache_entry_type& cache, int beta) noexcept {
-+  static auto compute_left_endpoint_for_shorter_interval_case(
-+      const cache_entry_type& cache, int beta) noexcept -> carrier_uint=
 {
-     return static_cast<carrier_uint>(
-         (cache - (cache >> (num_significand_bits<float>() + 2))) >>
-         (64 - num_significand_bits<float>() - 1 - beta));
-   }
-=20
--  static carrier_uint compute_right_endpoint_for_shorter_interval_case(
--      const cache_entry_type& cache, int beta) noexcept {
-+  static auto compute_right_endpoint_for_shorter_interval_case(
-+      const cache_entry_type& cache, int beta) noexcept -> carrier_uint=
 {
-     return static_cast<carrier_uint>(
-         (cache + (cache >> (num_significand_bits<float>() + 1))) >>
-         (64 - num_significand_bits<float>() - 1 - beta));
-   }
-=20
--  static carrier_uint compute_round_up_for_shorter_interval_case(
--      const cache_entry_type& cache, int beta) noexcept {
-+  static auto compute_round_up_for_shorter_interval_case(
-+      const cache_entry_type& cache, int beta) noexcept -> carrier_uint=
 {
-     return (static_cast<carrier_uint>(
-                 cache >> (64 - num_significand_bits<float>() - 2 - beta=
)) +
-             1) /
-@@ -346,7 +366,7 @@ template <> struct cache_accessor<double> {
-   using carrier_uint =3D float_info<double>::carrier_uint;
-   using cache_entry_type =3D uint128_fallback;
-=20
--  static uint128_fallback get_cached_power(int k) noexcept {
-+  static auto get_cached_power(int k) noexcept -> uint128_fallback {
-     FMT_ASSERT(k >=3D float_info<double>::min_k && k <=3D float_info<do=
uble>::max_k,
-                "k is out of range");
-=20
-@@ -985,8 +1005,7 @@ template <> struct cache_accessor<double> {
-       {0xe0accfa875af45a7, 0x93eb1b80a33b8606},
-       {0x8c6c01c9498d8b88, 0xbc72f130660533c4},
-       {0xaf87023b9bf0ee6a, 0xeb8fad7c7f8680b5},
--      { 0xdb68c2ca82ed2a05,
--        0xa67398db9f6820e2 }
-+      {0xdb68c2ca82ed2a05, 0xa67398db9f6820e2},
- #else
-       {0xff77b1fcbebcdc4f, 0x25e8e89c13bb0f7b},
-       {0xce5d73ff402d98e3, 0xfb0a3d212dc81290},
-@@ -1071,19 +1090,22 @@ template <> struct cache_accessor<double> {
-     bool is_integer;
-   };
-=20
--  static compute_mul_result compute_mul(
--      carrier_uint u, const cache_entry_type& cache) noexcept {
-+  static auto compute_mul(carrier_uint u,
-+                          const cache_entry_type& cache) noexcept
-+      -> compute_mul_result {
-     auto r =3D umul192_upper128(u, cache);
-     return {r.high(), r.low() =3D=3D 0};
-   }
-=20
--  static uint32_t compute_delta(cache_entry_type const& cache,
--                                int beta) noexcept {
-+  static auto compute_delta(cache_entry_type const& cache, int beta) no=
except
-+      -> uint32_t {
-     return static_cast<uint32_t>(cache.high() >> (64 - 1 - beta));
-   }
-=20
--  static compute_mul_parity_result compute_mul_parity(
--      carrier_uint two_f, const cache_entry_type& cache, int beta) noex=
cept {
-+  static auto compute_mul_parity(carrier_uint two_f,
-+                                 const cache_entry_type& cache,
-+                                 int beta) noexcept
-+      -> compute_mul_parity_result {
-     FMT_ASSERT(beta >=3D 1, "");
-     FMT_ASSERT(beta < 64, "");
-=20
-@@ -1092,35 +1114,35 @@ template <> struct cache_accessor<double> {
-             ((r.high() << beta) | (r.low() >> (64 - beta))) =3D=3D 0};
-   }
-=20
--  static carrier_uint compute_left_endpoint_for_shorter_interval_case(
--      const cache_entry_type& cache, int beta) noexcept {
-+  static auto compute_left_endpoint_for_shorter_interval_case(
-+      const cache_entry_type& cache, int beta) noexcept -> carrier_uint=
 {
-     return (cache.high() -
-             (cache.high() >> (num_significand_bits<double>() + 2))) >>
-            (64 - num_significand_bits<double>() - 1 - beta);
-   }
-=20
--  static carrier_uint compute_right_endpoint_for_shorter_interval_case(
--      const cache_entry_type& cache, int beta) noexcept {
-+  static auto compute_right_endpoint_for_shorter_interval_case(
-+      const cache_entry_type& cache, int beta) noexcept -> carrier_uint=
 {
-     return (cache.high() +
-             (cache.high() >> (num_significand_bits<double>() + 1))) >>
-            (64 - num_significand_bits<double>() - 1 - beta);
-   }
-=20
--  static carrier_uint compute_round_up_for_shorter_interval_case(
--      const cache_entry_type& cache, int beta) noexcept {
-+  static auto compute_round_up_for_shorter_interval_case(
-+      const cache_entry_type& cache, int beta) noexcept -> carrier_uint=
 {
-     return ((cache.high() >> (64 - num_significand_bits<double>() - 2 -=
 beta)) +
-             1) /
-            2;
-   }
- };
-=20
--FMT_FUNC uint128_fallback get_cached_power(int k) noexcept {
-+FMT_FUNC auto get_cached_power(int k) noexcept -> uint128_fallback {
-   return cache_accessor<double>::get_cached_power(k);
- }
-=20
- // Various integer checks
- template <typename T>
--bool is_left_endpoint_integer_shorter_interval(int exponent) noexcept {
-+auto is_left_endpoint_integer_shorter_interval(int exponent) noexcept -=
> bool {
-   const int case_shorter_interval_left_endpoint_lower_threshold =3D 2;
-   const int case_shorter_interval_left_endpoint_upper_threshold =3D 3;
-   return exponent >=3D case_shorter_interval_left_endpoint_lower_thresh=
old &&
-@@ -1132,7 +1154,7 @@ FMT_INLINE int remove_trailing_zeros(uint32_t& n, =
int s =3D 0) noexcept {
-   FMT_ASSERT(n !=3D 0, "");
-   // Modular inverse of 5 (mod 2^32): (mod_inv_5 * 5) mod 2^32 =3D 1.
-   constexpr uint32_t mod_inv_5 =3D 0xcccccccd;
--  constexpr uint32_t mod_inv_25 =3D 0xc28f5c29; // =3D mod_inv_5 * mod_=
inv_5
-+  constexpr uint32_t mod_inv_25 =3D 0xc28f5c29;  // =3D mod_inv_5 * mod=
_inv_5
-=20
-   while (true) {
-     auto q =3D rotr(n * mod_inv_25, 2);
-@@ -1168,7 +1190,7 @@ FMT_INLINE int remove_trailing_zeros(uint64_t& n) =
noexcept {
-=20
-   // If n is not divisible by 10^8, work with n itself.
-   constexpr uint64_t mod_inv_5 =3D 0xcccccccccccccccd;
--  constexpr uint64_t mod_inv_25 =3D 0x8f5c28f5c28f5c29; // =3D mod_inv_=
5 * mod_inv_5
-+  constexpr uint64_t mod_inv_25 =3D 0x8f5c28f5c28f5c29;  // mod_inv_5 *=
 mod_inv_5
-=20
-   int s =3D 0;
-   while (true) {
-@@ -1234,7 +1256,7 @@ FMT_INLINE decimal_fp<T> shorter_interval_case(int=
 exponent) noexcept {
-   return ret_value;
- }
-=20
--template <typename T> decimal_fp<T> to_decimal(T x) noexcept {
-+template <typename T> auto to_decimal(T x) noexcept -> decimal_fp<T> {
-   // Step 1: integer promotion & Schubfach multiplier calculation.
-=20
-   using carrier_uint =3D typename float_info<T>::carrier_uint;
-@@ -1373,15 +1395,15 @@ template <> struct formatter<detail::bigint> {
-     for (auto i =3D n.bigits_.size(); i > 0; --i) {
-       auto value =3D n.bigits_[i - 1u];
-       if (first) {
--        out =3D format_to(out, FMT_STRING("{:x}"), value);
-+        out =3D fmt::format_to(out, FMT_STRING("{:x}"), value);
-         first =3D false;
-         continue;
-       }
--      out =3D format_to(out, FMT_STRING("{:08x}"), value);
-+      out =3D fmt::format_to(out, FMT_STRING("{:08x}"), value);
-     }
-     if (n.exp_ > 0)
--      out =3D format_to(out, FMT_STRING("p{}"),
--                      n.exp_ * detail::bigint::bigit_bits);
-+      out =3D fmt::format_to(out, FMT_STRING("p{}"),
-+                           n.exp_ * detail::bigint::bigit_bits);
-     return out;
-   }
- };
-@@ -1405,7 +1427,7 @@ FMT_FUNC void format_system_error(detail::buffer<c=
har>& out, int error_code,
-                                   const char* message) noexcept {
-   FMT_TRY {
-     auto ec =3D std::error_code(error_code, std::generic_category());
--    write(std::back_inserter(out), std::system_error(ec, message).what(=
));
-+    detail::write(appender(out), std::system_error(ec, message).what())=
;
-     return;
-   }
-   FMT_CATCH(...) {}
-@@ -1414,10 +1436,10 @@ FMT_FUNC void format_system_error(detail::buffer=
<char>& out, int error_code,
-=20
- FMT_FUNC void report_system_error(int error_code,
-                                   const char* message) noexcept {
--  report_error(format_system_error, error_code, message);
-+  do_report_error(format_system_error, error_code, message);
- }
-=20
--FMT_FUNC std::string vformat(string_view fmt, format_args args) {
-+FMT_FUNC auto vformat(string_view fmt, format_args args) -> std::string=
 {
-   // Don't optimize the "{}" case to keep the binary size small and bec=
ause it
-   // can be better optimized in fmt::format anyway.
-   auto buffer =3D memory_buffer();
-@@ -1426,39 +1448,304 @@ FMT_FUNC std::string vformat(string_view fmt, f=
ormat_args args) {
- }
-=20
- namespace detail {
--#ifndef _WIN32
--FMT_FUNC bool write_console(std::FILE*, string_view) { return false; }
-+
-+FMT_FUNC void vformat_to(buffer<char>& buf, string_view fmt, format_arg=
s args,
-+                         locale_ref loc) {
-+  auto out =3D appender(buf);
-+  if (fmt.size() =3D=3D 2 && equal2(fmt.data(), "{}"))
-+    return args.get(0).visit(default_arg_formatter<char>{out});
-+  parse_format_string(
-+      fmt, format_handler<char>{parse_context<char>(fmt), {out, args, l=
oc}});
-+}
-+
-+template <typename T> struct span {
-+  T* data;
-+  size_t size;
-+};
-+
-+template <typename F> auto flockfile(F* f) -> decltype(_lock_file(f)) {
-+  _lock_file(f);
-+}
-+template <typename F> auto funlockfile(F* f) -> decltype(_unlock_file(f=
)) {
-+  _unlock_file(f);
-+}
-+
-+#ifndef getc_unlocked
-+template <typename F> auto getc_unlocked(F* f) -> decltype(_fgetc_noloc=
k(f)) {
-+  return _fgetc_nolock(f);
-+}
-+#endif
-+
-+template <typename F =3D FILE, typename Enable =3D void>
-+struct has_flockfile : std::false_type {};
-+
-+template <typename F>
-+struct has_flockfile<F, void_t<decltype(flockfile(&std::declval<F&>()))=
>>
-+    : std::true_type {};
-+
-+// A FILE wrapper. F is FILE defined as a template parameter to make sy=
stem API
-+// detection work.
-+template <typename F> class file_base {
-+ public:
-+  F* file_;
-+
-+ public:
-+  file_base(F* file) : file_(file) {}
-+  operator F*() const { return file_; }
-+
-+  // Reads a code unit from the stream.
-+  auto get() -> int {
-+    int result =3D getc_unlocked(file_);
-+    if (result =3D=3D EOF && ferror(file_) !=3D 0)
-+      FMT_THROW(system_error(errno, FMT_STRING("getc failed")));
-+    return result;
-+  }
-+
-+  // Puts the code unit back into the stream buffer.
-+  void unget(char c) {
-+    if (ungetc(c, file_) =3D=3D EOF)
-+      FMT_THROW(system_error(errno, FMT_STRING("ungetc failed")));
-+  }
-+
-+  void flush() { fflush(this->file_); }
-+};
-+
-+// A FILE wrapper for glibc.
-+template <typename F> class glibc_file : public file_base<F> {
-+ private:
-+  enum {
-+    line_buffered =3D 0x200,  // _IO_LINE_BUF
-+    unbuffered =3D 2          // _IO_UNBUFFERED
-+  };
-+
-+ public:
-+  using file_base<F>::file_base;
-+
-+  auto is_buffered() const -> bool {
-+    return (this->file_->_flags & unbuffered) =3D=3D 0;
-+  }
-+
-+  void init_buffer() {
-+    if (this->file_->_IO_write_ptr) return;
-+    // Force buffer initialization by placing and removing a char in a =
buffer.
-+    assume(this->file_->_IO_write_ptr >=3D this->file_->_IO_write_end);
-+    putc_unlocked(0, this->file_);
-+    --this->file_->_IO_write_ptr;
-+  }
-+
-+  // Returns the file's read buffer.
-+  auto get_read_buffer() const -> span<const char> {
-+    auto ptr =3D this->file_->_IO_read_ptr;
-+    return {ptr, to_unsigned(this->file_->_IO_read_end - ptr)};
-+  }
-+
-+  // Returns the file's write buffer.
-+  auto get_write_buffer() const -> span<char> {
-+    auto ptr =3D this->file_->_IO_write_ptr;
-+    return {ptr, to_unsigned(this->file_->_IO_buf_end - ptr)};
-+  }
-+
-+  void advance_write_buffer(size_t size) { this->file_->_IO_write_ptr +=
=3D size; }
-+
-+  bool needs_flush() const {
-+    if ((this->file_->_flags & line_buffered) =3D=3D 0) return false;
-+    char* end =3D this->file_->_IO_write_end;
-+    return memchr(end, '\n', to_unsigned(this->file_->_IO_write_ptr - e=
nd));
-+  }
-+
-+  void flush() { fflush_unlocked(this->file_); }
-+};
-+
-+// A FILE wrapper for Apple's libc.
-+template <typename F> class apple_file : public file_base<F> {
-+ private:
-+  enum {
-+    line_buffered =3D 1,  // __SNBF
-+    unbuffered =3D 2      // __SLBF
-+  };
-+
-+ public:
-+  using file_base<F>::file_base;
-+
-+  auto is_buffered() const -> bool {
-+    return (this->file_->_flags & unbuffered) =3D=3D 0;
-+  }
-+
-+  void init_buffer() {
-+    if (this->file_->_p) return;
-+    // Force buffer initialization by placing and removing a char in a =
buffer.
-+    putc_unlocked(0, this->file_);
-+    --this->file_->_p;
-+    ++this->file_->_w;
-+  }
-+
-+  auto get_read_buffer() const -> span<const char> {
-+    return {reinterpret_cast<char*>(this->file_->_p),
-+            to_unsigned(this->file_->_r)};
-+  }
-+
-+  auto get_write_buffer() const -> span<char> {
-+    return {reinterpret_cast<char*>(this->file_->_p),
-+            to_unsigned(this->file_->_bf._base + this->file_->_bf._size=
 -
-+                        this->file_->_p)};
-+  }
-+
-+  void advance_write_buffer(size_t size) {
-+    this->file_->_p +=3D size;
-+    this->file_->_w -=3D size;
-+  }
-+
-+  bool needs_flush() const {
-+    if ((this->file_->_flags & line_buffered) =3D=3D 0) return false;
-+    return memchr(this->file_->_p + this->file_->_w, '\n',
-+                  to_unsigned(-this->file_->_w));
-+  }
-+};
-+
-+// A fallback FILE wrapper.
-+template <typename F> class fallback_file : public file_base<F> {
-+ private:
-+  char next_;  // The next unconsumed character in the buffer.
-+  bool has_next_ =3D false;
-+
-+ public:
-+  using file_base<F>::file_base;
-+
-+  auto is_buffered() const -> bool { return false; }
-+  auto needs_flush() const -> bool { return false; }
-+  void init_buffer() {}
-+
-+  auto get_read_buffer() const -> span<const char> {
-+    return {&next_, has_next_ ? 1u : 0u};
-+  }
-+
-+  auto get_write_buffer() const -> span<char> { return {nullptr, 0}; }
-+
-+  void advance_write_buffer(size_t) {}
-+
-+  auto get() -> int {
-+    has_next_ =3D false;
-+    return file_base<F>::get();
-+  }
-+
-+  void unget(char c) {
-+    file_base<F>::unget(c);
-+    next_ =3D c;
-+    has_next_ =3D true;
-+  }
-+};
-+
-+#ifndef FMT_USE_FALLBACK_FILE
-+#  define FMT_USE_FALLBACK_FILE 0
-+#endif
-+
-+template <typename F,
-+          FMT_ENABLE_IF(sizeof(F::_p) !=3D 0 && !FMT_USE_FALLBACK_FILE)=
>
-+auto get_file(F* f, int) -> apple_file<F> {
-+  return f;
-+}
-+template <typename F,
-+          FMT_ENABLE_IF(sizeof(F::_IO_read_ptr) !=3D 0 && !FMT_USE_FALL=
BACK_FILE)>
-+inline auto get_file(F* f, int) -> glibc_file<F> {
-+  return f;
-+}
-+
-+inline auto get_file(FILE* f, ...) -> fallback_file<FILE> { return f; }
-+
-+using file_ref =3D decltype(get_file(static_cast<FILE*>(nullptr), 0));
-+
-+template <typename F =3D FILE, typename Enable =3D void>
-+class file_print_buffer : public buffer<char> {
-+ public:
-+  explicit file_print_buffer(F*) : buffer(nullptr, size_t()) {}
-+};
-+
-+template <typename F>
-+class file_print_buffer<F, enable_if_t<has_flockfile<F>::value>>
-+    : public buffer<char> {
-+ private:
-+  file_ref file_;
-+
-+  static void grow(buffer<char>& base, size_t) {
-+    auto& self =3D static_cast<file_print_buffer&>(base);
-+    self.file_.advance_write_buffer(self.size());
-+    if (self.file_.get_write_buffer().size =3D=3D 0) self.file_.flush()=
;
-+    auto buf =3D self.file_.get_write_buffer();
-+    FMT_ASSERT(buf.size > 0, "");
-+    self.set(buf.data, buf.size);
-+    self.clear();
-+  }
-+
-+ public:
-+  explicit file_print_buffer(F* f) : buffer(grow, size_t()), file_(f) {
-+    flockfile(f);
-+    file_.init_buffer();
-+    auto buf =3D file_.get_write_buffer();
-+    set(buf.data, buf.size);
-+  }
-+  ~file_print_buffer() {
-+    file_.advance_write_buffer(size());
-+    bool flush =3D file_.needs_flush();
-+    F* f =3D file_;    // Make funlockfile depend on the template param=
eter F
-+    funlockfile(f);  // for the system API detection to work.
-+    if (flush) fflush(file_);
-+  }
-+};
-+
-+#if !defined(_WIN32) || defined(FMT_USE_WRITE_CONSOLE)
-+FMT_FUNC auto write_console(int, string_view) -> bool { return false; }
- #else
- using dword =3D conditional_t<sizeof(long) =3D=3D 4, unsigned long, uns=
igned>;
- extern "C" __declspec(dllimport) int __stdcall WriteConsoleW(  //
-     void*, const void*, dword, dword*, void*);
-=20
--FMT_FUNC bool write_console(std::FILE* f, string_view text) {
--  auto fd =3D _fileno(f);
--  if (!_isatty(fd)) return false;
-+FMT_FUNC bool write_console(int fd, string_view text) {
-   auto u16 =3D utf8_to_utf16(text);
--  auto written =3D dword();
-   return WriteConsoleW(reinterpret_cast<void*>(_get_osfhandle(fd)), u16=
.c_str(),
--                       static_cast<uint32_t>(u16.size()), &written, nul=
lptr) !=3D 0;
-+                       static_cast<dword>(u16.size()), nullptr, nullptr=
) !=3D 0;
- }
-+#endif
-=20
-+#ifdef _WIN32
- // Print assuming legacy (non-Unicode) encoding.
--FMT_FUNC void vprint_mojibake(std::FILE* f, string_view fmt, format_arg=
s args) {
-+FMT_FUNC void vprint_mojibake(std::FILE* f, string_view fmt, format_arg=
s args,
-+                              bool newline) {
-   auto buffer =3D memory_buffer();
--  detail::vformat_to(buffer, fmt,
--                     basic_format_args<buffer_context<char>>(args));
--  fwrite_fully(buffer.data(), 1, buffer.size(), f);
-+  detail::vformat_to(buffer, fmt, args);
-+  if (newline) buffer.push_back('\n');
-+  fwrite_all(buffer.data(), buffer.size(), f);
- }
- #endif
-=20
- FMT_FUNC void print(std::FILE* f, string_view text) {
--  if (!write_console(f, text)) fwrite_fully(text.data(), 1, text.size()=
, f);
-+#if defined(_WIN32) && !defined(FMT_USE_WRITE_CONSOLE)
-+  int fd =3D _fileno(f);
-+  if (_isatty(fd)) {
-+    std::fflush(f);
-+    if (write_console(fd, text)) return;
-+  }
-+#endif
-+  fwrite_all(text.data(), text.size(), f);
- }
- }  // namespace detail
-=20
-+FMT_FUNC void vprint_buffered(std::FILE* f, string_view fmt, format_arg=
s args) {
-+  auto buffer =3D memory_buffer();
-+  detail::vformat_to(buffer, fmt, args);
-+  detail::print(f, {buffer.data(), buffer.size()});
-+}
-+
- FMT_FUNC void vprint(std::FILE* f, string_view fmt, format_args args) {
-+  if (!detail::file_ref(f).is_buffered() || !detail::has_flockfile<>())
-+    return vprint_buffered(f, fmt, args);
-+  auto&& buffer =3D detail::file_print_buffer<>(f);
-+  return detail::vformat_to(buffer, fmt, args);
-+}
-+
-+FMT_FUNC void vprintln(std::FILE* f, string_view fmt, format_args args)=
 {
-   auto buffer =3D memory_buffer();
-   detail::vformat_to(buffer, fmt, args);
-+  buffer.push_back('\n');
-   detail::print(f, {buffer.data(), buffer.size()});
- }
-=20
-diff --git a/include/fmt/format.h b/include/fmt/format.h
-index a65d376..287e716 100644
---- a/include/fmt/format.h
-+++ b/include/fmt/format.h
-@@ -33,24 +33,58 @@
- #ifndef FMT_FORMAT_H_
- #define FMT_FORMAT_H_
-=20
--#include <cmath>             // std::signbit
--#include <cstdint>           // uint32_t
--#include <cstring>           // std::memcpy
--#include <initializer_list>  // std::initializer_list
--#include <limits>            // std::numeric_limits
--#include <memory>            // std::uninitialized_copy
--#include <stdexcept>         // std::runtime_error
--#include <system_error>      // std::system_error
--
--#ifdef __cpp_lib_bit_cast
--#  include <bit>  // std::bitcast
-+#ifndef _LIBCPP_REMOVE_TRANSITIVE_INCLUDES
-+#  define _LIBCPP_REMOVE_TRANSITIVE_INCLUDES
-+#  define FMT_REMOVE_TRANSITIVE_INCLUDES
- #endif
-=20
--#include "core.h"
-+#include "base.h"
-+
-+#ifndef FMT_MODULE
-+#  include <cmath>    // std::signbit
-+#  include <cstddef>  // std::byte
-+#  include <cstdint>  // uint32_t
-+#  include <cstring>  // std::memcpy
-+#  include <limits>   // std::numeric_limits
-+#  include <new>      // std::bad_alloc
-+#  if defined(__GLIBCXX__) && !defined(_GLIBCXX_USE_DUAL_ABI)
-+// Workaround for pre gcc 5 libstdc++.
-+#    include <memory>  // std::allocator_traits
-+#  endif
-+#  include <stdexcept>     // std::runtime_error
-+#  include <string>        // std::string
-+#  include <system_error>  // std::system_error
-+
-+// Check FMT_CPLUSPLUS to avoid a warning in MSVC.
-+#  if FMT_HAS_INCLUDE(<bit>) && FMT_CPLUSPLUS > 201703L
-+#    include <bit>  // std::bit_cast
-+#  endif
-+
-+// libc++ supports string_view in pre-c++17.
-+#  if FMT_HAS_INCLUDE(<string_view>) && \
-+      (FMT_CPLUSPLUS >=3D 201703L || defined(_LIBCPP_VERSION))
-+#    include <string_view>
-+#    define FMT_USE_STRING_VIEW
-+#  endif
-=20
--#ifndef FMT_BEGIN_DETAIL_NAMESPACE
--#  define FMT_BEGIN_DETAIL_NAMESPACE namespace detail {
--#  define FMT_END_DETAIL_NAMESPACE }
-+#  if FMT_MSC_VERSION
-+#    include <intrin.h>  // _BitScanReverse[64], _umul128
-+#  endif
-+#endif  // FMT_MODULE
-+
-+#if defined(FMT_USE_NONTYPE_TEMPLATE_ARGS)
-+// Use the provided definition.
-+#elif defined(__NVCOMPILER)
-+#  define FMT_USE_NONTYPE_TEMPLATE_ARGS 0
-+#elif FMT_GCC_VERSION >=3D 903 && FMT_CPLUSPLUS >=3D 201709L
-+#  define FMT_USE_NONTYPE_TEMPLATE_ARGS 1
-+#elif defined(__cpp_nontype_template_args) && \
-+    __cpp_nontype_template_args >=3D 201911L
-+#  define FMT_USE_NONTYPE_TEMPLATE_ARGS 1
-+#elif FMT_CLANG_VERSION >=3D 1200 && FMT_CPLUSPLUS >=3D 202002L
-+#  define FMT_USE_NONTYPE_TEMPLATE_ARGS 1
-+#else
-+#  define FMT_USE_NONTYPE_TEMPLATE_ARGS 0
- #endif
-=20
- #if defined __cpp_inline_variables && __cpp_inline_variables >=3D 20160=
6L
-@@ -59,41 +93,22 @@
- #  define FMT_INLINE_VARIABLE
- #endif
-=20
--#if FMT_HAS_CPP17_ATTRIBUTE(fallthrough)
--#  define FMT_FALLTHROUGH [[fallthrough]]
--#elif defined(__clang__)
--#  define FMT_FALLTHROUGH [[clang::fallthrough]]
--#elif FMT_GCC_VERSION >=3D 700 && \
--    (!defined(__EDG_VERSION__) || __EDG_VERSION__ >=3D 520)
--#  define FMT_FALLTHROUGH [[gnu::fallthrough]]
--#else
--#  define FMT_FALLTHROUGH
--#endif
--
--#ifndef FMT_DEPRECATED
--#  if FMT_HAS_CPP14_ATTRIBUTE(deprecated) || FMT_MSC_VERSION >=3D 1900
--#    define FMT_DEPRECATED [[deprecated]]
--#  else
--#    if (defined(__GNUC__) && !defined(__LCC__)) || defined(__clang__)
--#      define FMT_DEPRECATED __attribute__((deprecated))
--#    elif FMT_MSC_VERSION
--#      define FMT_DEPRECATED __declspec(deprecated)
--#    else
--#      define FMT_DEPRECATED /* deprecated */
--#    endif
--#  endif
--#endif
--
--#if FMT_GCC_VERSION || defined(__clang__)
--#  define FMT_VISIBILITY(value) __attribute__((visibility(value)))
-+// Check if RTTI is disabled.
-+#ifdef FMT_USE_RTTI
-+// Use the provided definition.
-+#elif defined(__GXX_RTTI) || FMT_HAS_FEATURE(cxx_rtti) || defined(_CPPR=
TTI) || \
-+    defined(__INTEL_RTTI__) || defined(__RTTI)
-+// __RTTI is for EDG compilers. _CPPRTTI is for MSVC.
-+#  define FMT_USE_RTTI 1
- #else
--#  define FMT_VISIBILITY(value)
-+#  define FMT_USE_RTTI 0
- #endif
-=20
--#ifdef __has_builtin
--#  define FMT_HAS_BUILTIN(x) __has_builtin(x)
-+// Visibility when compiled as a shared library/object.
-+#if defined(FMT_LIB_EXPORT) || defined(FMT_SHARED)
-+#  define FMT_SO_VISIBILITY(value) FMT_VISIBILITY(value)
- #else
--#  define FMT_HAS_BUILTIN(x) 0
-+#  define FMT_SO_VISIBILITY(value)
- #endif
-=20
- #if FMT_GCC_VERSION || FMT_CLANG_VERSION
-@@ -102,8 +117,19 @@
- #  define FMT_NOINLINE
- #endif
-=20
-+namespace std {
-+template <typename T> struct iterator_traits<fmt::basic_appender<T>> {
-+  using iterator_category =3D output_iterator_tag;
-+  using value_type =3D T;
-+  using difference_type =3D
-+      decltype(static_cast<int*>(nullptr) - static_cast<int*>(nullptr))=
;
-+  using pointer =3D void;
-+  using reference =3D void;
-+};
-+}  // namespace std
-+
- #ifndef FMT_THROW
--#  if FMT_EXCEPTIONS
-+#  if FMT_USE_EXCEPTIONS
- #    if FMT_MSC_VERSION || defined(__NVCC__)
- FMT_BEGIN_NAMESPACE
- namespace detail {
-@@ -122,35 +148,8 @@ FMT_END_NAMESPACE
- #  else
- #    define FMT_THROW(x) \
-       ::fmt::detail::assert_fail(__FILE__, __LINE__, (x).what())
--#  endif
--#endif
--
--#if FMT_EXCEPTIONS
--#  define FMT_TRY try
--#  define FMT_CATCH(x) catch (x)
--#else
--#  define FMT_TRY if (true)
--#  define FMT_CATCH(x) if (false)
--#endif
--
--#ifndef FMT_MAYBE_UNUSED
--#  if FMT_HAS_CPP17_ATTRIBUTE(maybe_unused)
--#    define FMT_MAYBE_UNUSED [[maybe_unused]]
--#  else
--#    define FMT_MAYBE_UNUSED
--#  endif
--#endif
--
--#ifndef FMT_USE_USER_DEFINED_LITERALS
--// EDG based compilers (Intel, NVIDIA, Elbrus, etc), GCC and MSVC suppo=
rt UDLs.
--#  if (FMT_HAS_FEATURE(cxx_user_literals) || FMT_GCC_VERSION >=3D 407 |=
| \
--       FMT_MSC_VERSION >=3D 1900) &&                                   =
  \
--      (!defined(__EDG_VERSION__) || __EDG_VERSION__ >=3D /* UDL feature=
 */ 480)
--#    define FMT_USE_USER_DEFINED_LITERALS 1
--#  else
--#    define FMT_USE_USER_DEFINED_LITERALS 0
--#  endif
--#endif
-+#  endif  // FMT_USE_EXCEPTIONS
-+#endif    // FMT_THROW
-=20
- // Defining FMT_REDUCE_INT_INSTANTIATIONS to 1, will reduce the number =
of
- // integer formatter template instantiations to just one by only using =
the
-@@ -160,7 +159,15 @@ FMT_END_NAMESPACE
- #  define FMT_REDUCE_INT_INSTANTIATIONS 0
- #endif
-=20
--// __builtin_clz is broken in clang with Microsoft CodeGen:
-+FMT_BEGIN_NAMESPACE
-+
-+template <typename Char, typename Traits, typename Allocator>
-+struct is_contiguous<std::basic_string<Char, Traits, Allocator>>
-+    : std::true_type {};
-+
-+namespace detail {
-+
-+// __builtin_clz is broken in clang with Microsoft codegen:
- // https://github.com/fmtlib/fmt/issues/519.
- #if !FMT_MSC_VERSION
- #  if FMT_HAS_BUILTIN(__builtin_clz) || FMT_GCC_VERSION || FMT_ICC_VERS=
ION
-@@ -171,53 +178,30 @@ FMT_END_NAMESPACE
- #  endif
- #endif
-=20
--// __builtin_ctz is broken in Intel Compiler Classic on Windows:
--// https://github.com/fmtlib/fmt/issues/2510.
--#ifndef __ICL
--#  if FMT_HAS_BUILTIN(__builtin_ctz) || FMT_GCC_VERSION || FMT_ICC_VERS=
ION || \
--      defined(__NVCOMPILER)
--#    define FMT_BUILTIN_CTZ(n) __builtin_ctz(n)
--#  endif
--#  if FMT_HAS_BUILTIN(__builtin_ctzll) || FMT_GCC_VERSION || \
--      FMT_ICC_VERSION || defined(__NVCOMPILER)
--#    define FMT_BUILTIN_CTZLL(n) __builtin_ctzll(n)
--#  endif
--#endif
--
--#if FMT_MSC_VERSION
--#  include <intrin.h>  // _BitScanReverse[64], _BitScanForward[64], _um=
ul128
--#endif
--
--// Some compilers masquerade as both MSVC and GCC-likes or otherwise su=
pport
-+// Some compilers masquerade as both MSVC and GCC but otherwise support
- // __builtin_clz and __builtin_clzll, so only define FMT_BUILTIN_CLZ us=
ing the
- // MSVC intrinsics if the clz and clzll builtins are not available.
--#if FMT_MSC_VERSION && !defined(FMT_BUILTIN_CLZLL) && \
--    !defined(FMT_BUILTIN_CTZLL)
--FMT_BEGIN_NAMESPACE
--namespace detail {
-+#if FMT_MSC_VERSION && !defined(FMT_BUILTIN_CLZLL)
- // Avoid Clang with Microsoft CodeGen's -Wunknown-pragmas warning.
--#  if !defined(__clang__)
--#    pragma intrinsic(_BitScanForward)
-+#  ifndef __clang__
- #    pragma intrinsic(_BitScanReverse)
--#    if defined(_WIN64)
--#      pragma intrinsic(_BitScanForward64)
-+#    ifdef _WIN64
- #      pragma intrinsic(_BitScanReverse64)
- #    endif
- #  endif
-=20
- inline auto clz(uint32_t x) -> int {
-+  FMT_ASSERT(x !=3D 0, "");
-+  FMT_MSC_WARNING(suppress : 6102)  // Suppress a bogus static analysis=
 warning.
-   unsigned long r =3D 0;
-   _BitScanReverse(&r, x);
--  FMT_ASSERT(x !=3D 0, "");
--  // Static analysis complains about using uninitialized data
--  // "r", but the only way that can happen is if "x" is 0,
--  // which the callers guarantee to not happen.
--  FMT_MSC_WARNING(suppress : 6102)
-   return 31 ^ static_cast<int>(r);
- }
- #  define FMT_BUILTIN_CLZ(n) detail::clz(n)
-=20
- inline auto clzll(uint64_t x) -> int {
-+  FMT_ASSERT(x !=3D 0, "");
-+  FMT_MSC_WARNING(suppress : 6102)  // Suppress a bogus static analysis=
 warning.
-   unsigned long r =3D 0;
- #  ifdef _WIN64
-   _BitScanReverse64(&r, x);
-@@ -228,56 +212,10 @@ inline auto clzll(uint64_t x) -> int {
-   // Scan the low 32 bits.
-   _BitScanReverse(&r, static_cast<uint32_t>(x));
- #  endif
--  FMT_ASSERT(x !=3D 0, "");
--  FMT_MSC_WARNING(suppress : 6102)  // Suppress a bogus static analysis=
 warning.
-   return 63 ^ static_cast<int>(r);
- }
- #  define FMT_BUILTIN_CLZLL(n) detail::clzll(n)
--
--inline auto ctz(uint32_t x) -> int {
--  unsigned long r =3D 0;
--  _BitScanForward(&r, x);
--  FMT_ASSERT(x !=3D 0, "");
--  FMT_MSC_WARNING(suppress : 6102)  // Suppress a bogus static analysis=
 warning.
--  return static_cast<int>(r);
--}
--#  define FMT_BUILTIN_CTZ(n) detail::ctz(n)
--
--inline auto ctzll(uint64_t x) -> int {
--  unsigned long r =3D 0;
--  FMT_ASSERT(x !=3D 0, "");
--  FMT_MSC_WARNING(suppress : 6102)  // Suppress a bogus static analysis=
 warning.
--#  ifdef _WIN64
--  _BitScanForward64(&r, x);
--#  else
--  // Scan the low 32 bits.
--  if (_BitScanForward(&r, static_cast<uint32_t>(x))) return static_cast=
<int>(r);
--  // Scan the high 32 bits.
--  _BitScanForward(&r, static_cast<uint32_t>(x >> 32));
--  r +=3D 32;
--#  endif
--  return static_cast<int>(r);
--}
--#  define FMT_BUILTIN_CTZLL(n) detail::ctzll(n)
--}  // namespace detail
--FMT_END_NAMESPACE
--#endif
--
--FMT_BEGIN_NAMESPACE
--
--template <typename...> struct disjunction : std::false_type {};
--template <typename P> struct disjunction<P> : P {};
--template <typename P1, typename... Pn>
--struct disjunction<P1, Pn...>
--    : conditional_t<bool(P1::value), P1, disjunction<Pn...>> {};
--
--template <typename...> struct conjunction : std::true_type {};
--template <typename P> struct conjunction<P> : P {};
--template <typename P1, typename... Pn>
--struct conjunction<P1, Pn...>
--    : conditional_t<bool(P1::value), conjunction<Pn...>, P1> {};
--
--namespace detail {
-+#endif  // FMT_MSC_VERSION && !defined(FMT_BUILTIN_CLZLL)
-=20
- FMT_CONSTEXPR inline void abort_fuzzing_if(bool condition) {
-   ignore_unused(condition);
-@@ -286,48 +224,24 @@ FMT_CONSTEXPR inline void abort_fuzzing_if(bool co=
ndition) {
- #endif
- }
-=20
--template <typename CharT, CharT... C> struct string_literal {
--  static constexpr CharT value[sizeof...(C)] =3D {C...};
--  constexpr operator basic_string_view<CharT>() const {
--    return {value, sizeof...(C)};
--  }
-+#if defined(FMT_USE_STRING_VIEW)
-+template <typename Char> using std_string_view =3D std::basic_string_vi=
ew<Char>;
-+#else
-+template <typename Char> struct std_string_view {
-+  operator basic_string_view<Char>() const;
- };
--
--#if FMT_CPLUSPLUS < 201703L
--template <typename CharT, CharT... C>
--constexpr CharT string_literal<CharT, C...>::value[sizeof...(C)];
- #endif
-=20
--template <typename Streambuf> class formatbuf : public Streambuf {
-- private:
--  using char_type =3D typename Streambuf::char_type;
--  using streamsize =3D decltype(std::declval<Streambuf>().sputn(nullptr=
, 0));
--  using int_type =3D typename Streambuf::int_type;
--  using traits_type =3D typename Streambuf::traits_type;
--
--  buffer<char_type>& buffer_;
--
-- public:
--  explicit formatbuf(buffer<char_type>& buf) : buffer_(buf) {}
--
-- protected:
--  // The put area is always empty. This makes the implementation simple=
r and has
--  // the advantage that the streambuf and the buffer are always in sync=
 and
--  // sputc never writes into uninitialized memory. A disadvantage is th=
at each
--  // call to sputc always results in a (virtual) call to overflow. Ther=
e is no
--  // disadvantage here for sputn since this always results in a call to=
 xsputn.
--
--  auto overflow(int_type ch) -> int_type override {
--    if (!traits_type::eq_int_type(ch, traits_type::eof()))
--      buffer_.push_back(static_cast<char_type>(ch));
--    return ch;
--  }
--
--  auto xsputn(const char_type* s, streamsize count) -> streamsize overr=
ide {
--    buffer_.append(s, s + count);
--    return count;
-+template <typename Char, Char... C> struct string_literal {
-+  static constexpr Char value[sizeof...(C)] =3D {C...};
-+  constexpr operator basic_string_view<Char>() const {
-+    return {value, sizeof...(C)};
-   }
- };
-+#if FMT_CPLUSPLUS < 201703L
-+template <typename Char, Char... C>
-+constexpr Char string_literal<Char, C...>::value[sizeof...(C)];
-+#endif
-=20
- // Implementation of std::bit_cast for pre-C++20.
- template <typename To, typename From, FMT_ENABLE_IF(sizeof(To) =3D=3D s=
izeof(From))>
-@@ -360,14 +274,12 @@ class uint128_fallback {
-  private:
-   uint64_t lo_, hi_;
-=20
--  friend uint128_fallback umul128(uint64_t x, uint64_t y) noexcept;
--
-  public:
-   constexpr uint128_fallback(uint64_t hi, uint64_t lo) : lo_(lo), hi_(h=
i) {}
-   constexpr uint128_fallback(uint64_t value =3D 0) : lo_(value), hi_(0)=
 {}
-=20
--  constexpr uint64_t high() const noexcept { return hi_; }
--  constexpr uint64_t low() const noexcept { return lo_; }
-+  constexpr auto high() const noexcept -> uint64_t { return hi_; }
-+  constexpr auto low() const noexcept -> uint64_t { return lo_; }
-=20
-   template <typename T, FMT_ENABLE_IF(std::is_integral<T>::value)>
-   constexpr explicit operator T() const {
-@@ -400,13 +312,14 @@ class uint128_fallback {
-       -> uint128_fallback {
-     return {~n.hi_, ~n.lo_};
-   }
--  friend auto operator+(const uint128_fallback& lhs,
--                        const uint128_fallback& rhs) -> uint128_fallbac=
k {
-+  friend FMT_CONSTEXPR auto operator+(const uint128_fallback& lhs,
-+                                      const uint128_fallback& rhs)
-+      -> uint128_fallback {
-     auto result =3D uint128_fallback(lhs);
-     result +=3D rhs;
-     return result;
-   }
--  friend auto operator*(const uint128_fallback& lhs, uint32_t rhs)
-+  friend FMT_CONSTEXPR auto operator*(const uint128_fallback& lhs, uint=
32_t rhs)
-       -> uint128_fallback {
-     FMT_ASSERT(lhs.hi_ =3D=3D 0, "");
-     uint64_t hi =3D (lhs.lo_ >> 32) * rhs;
-@@ -414,7 +327,7 @@ class uint128_fallback {
-     uint64_t new_lo =3D (hi << 32) + lo;
-     return {(hi >> 32) + (new_lo < lo ? 1 : 0), new_lo};
-   }
--  friend auto operator-(const uint128_fallback& lhs, uint64_t rhs)
-+  friend constexpr auto operator-(const uint128_fallback& lhs, uint64_t=
 rhs)
-       -> uint128_fallback {
-     return {lhs.hi_ - (lhs.lo_ < rhs ? 1 : 0), lhs.lo_ - rhs};
-   }
-@@ -443,7 +356,7 @@ class uint128_fallback {
-     hi_ &=3D n.hi_;
-   }
-=20
--  FMT_CONSTEXPR20 uint128_fallback& operator+=3D(uint64_t n) noexcept {
-+  FMT_CONSTEXPR20 auto operator+=3D(uint64_t n) noexcept -> uint128_fal=
lback& {
-     if (is_constant_evaluated()) {
-       lo_ +=3D n;
-       hi_ +=3D (lo_ < n ? 1 : 0);
-@@ -487,23 +400,24 @@ template <typename T> constexpr auto num_bits() ->=
 int {
- }
- // std::numeric_limits<T>::digits may return 0 for 128-bit ints.
- template <> constexpr auto num_bits<int128_opt>() -> int { return 128; =
}
--template <> constexpr auto num_bits<uint128_t>() -> int { return 128; }
-+template <> constexpr auto num_bits<uint128_opt>() -> int { return 128;=
 }
-+template <> constexpr auto num_bits<uint128_fallback>() -> int { return=
 128; }
-=20
- // A heterogeneous bit_cast used for converting 96-bit long double to u=
int128_t
- // and 128-bit pointers to uint128_fallback.
- template <typename To, typename From, FMT_ENABLE_IF(sizeof(To) > sizeof=
(From))>
- inline auto bit_cast(const From& from) -> To {
--  constexpr auto size =3D static_cast<int>(sizeof(From) / sizeof(unsign=
ed));
-+  constexpr auto size =3D static_cast<int>(sizeof(From) / sizeof(unsign=
ed short));
-   struct data_t {
--    unsigned value[static_cast<unsigned>(size)];
-+    unsigned short value[static_cast<unsigned>(size)];
-   } data =3D bit_cast<data_t>(from);
-   auto result =3D To();
-   if (const_check(is_big_endian())) {
-     for (int i =3D 0; i < size; ++i)
--      result =3D (result << num_bits<unsigned>()) | data.value[i];
-+      result =3D (result << num_bits<unsigned short>()) | data.value[i]=
;
-   } else {
-     for (int i =3D size - 1; i >=3D 0; --i)
--      result =3D (result << num_bits<unsigned>()) | data.value[i];
-+      result =3D (result << num_bits<unsigned short>()) | data.value[i]=
;
-   }
-   return result;
- }
-@@ -534,55 +448,30 @@ FMT_INLINE void assume(bool condition) {
-   (void)condition;
- #if FMT_HAS_BUILTIN(__builtin_assume) && !FMT_ICC_VERSION
-   __builtin_assume(condition);
-+#elif FMT_GCC_VERSION
-+  if (!condition) __builtin_unreachable();
- #endif
- }
-=20
--// An approximation of iterator_t for pre-C++20 systems.
--template <typename T>
--using iterator_t =3D decltype(std::begin(std::declval<T&>()));
--template <typename T> using sentinel_t =3D decltype(std::end(std::declv=
al<T&>()));
--
--// A workaround for std::string not having mutable data() until C++17.
--template <typename Char>
--inline auto get_data(std::basic_string<Char>& s) -> Char* {
--  return &s[0];
--}
--template <typename Container>
--inline auto get_data(Container& c) -> typename Container::value_type* {
--  return c.data();
--}
--
--#if defined(_SECURE_SCL) && _SECURE_SCL
--// Make a checked iterator to avoid MSVC warnings.
--template <typename T> using checked_ptr =3D stdext::checked_array_itera=
tor<T*>;
--template <typename T>
--constexpr auto make_checked(T* p, size_t size) -> checked_ptr<T> {
--  return {p, size};
--}
--#else
--template <typename T> using checked_ptr =3D T*;
--template <typename T> constexpr auto make_checked(T* p, size_t) -> T* {
--  return p;
--}
--#endif
--
- // Attempts to reserve space for n extra characters in the output range=
.
- // Returns a pointer to the reserved range or a reference to it.
--template <typename Container, FMT_ENABLE_IF(is_contiguous<Container>::v=
alue)>
-+template <typename OutputIt,
-+          FMT_ENABLE_IF(is_back_insert_iterator<OutputIt>::value&&
-+                            is_contiguous<typename OutputIt::container>=
::value)>
- #if FMT_CLANG_VERSION >=3D 307 && !FMT_ICC_VERSION
- __attribute__((no_sanitize("undefined")))
- #endif
--inline auto
--reserve(std::back_insert_iterator<Container> it, size_t n)
--    -> checked_ptr<typename Container::value_type> {
--  Container& c =3D get_container(it);
-+FMT_CONSTEXPR20 inline auto
-+reserve(OutputIt it, size_t n) -> typename OutputIt::value_type* {
-+  auto& c =3D get_container(it);
-   size_t size =3D c.size();
-   c.resize(size + n);
--  return make_checked(get_data(c) + size, n);
-+  return &c[size];
- }
-=20
- template <typename T>
--inline auto reserve(buffer_appender<T> it, size_t n) -> buffer_appender=
<T> {
-+FMT_CONSTEXPR20 inline auto reserve(basic_appender<T> it, size_t n)
-+    -> basic_appender<T> {
-   buffer<T>& buf =3D get_container(it);
-   buf.try_reserve(buf.size() + n);
-   return it;
-@@ -601,18 +490,22 @@ template <typename T, typename OutputIt>
- constexpr auto to_pointer(OutputIt, size_t) -> T* {
-   return nullptr;
- }
--template <typename T> auto to_pointer(buffer_appender<T> it, size_t n) =
-> T* {
-+template <typename T>
-+FMT_CONSTEXPR20 auto to_pointer(basic_appender<T> it, size_t n) -> T* {
-   buffer<T>& buf =3D get_container(it);
-+  buf.try_reserve(buf.size() + n);
-   auto size =3D buf.size();
-   if (buf.capacity() < size + n) return nullptr;
-   buf.try_resize(size + n);
-   return buf.data() + size;
- }
-=20
--template <typename Container, FMT_ENABLE_IF(is_contiguous<Container>::v=
alue)>
--inline auto base_iterator(std::back_insert_iterator<Container>& it,
--                          checked_ptr<typename Container::value_type>)
--    -> std::back_insert_iterator<Container> {
-+template <typename OutputIt,
-+          FMT_ENABLE_IF(is_back_insert_iterator<OutputIt>::value&&
-+                            is_contiguous<typename OutputIt::container>=
::value)>
-+inline auto base_iterator(OutputIt it,
-+                          typename OutputIt::container_type::value_type=
*)
-+    -> OutputIt {
-   return it;
- }
-=20
-@@ -631,23 +524,15 @@ FMT_CONSTEXPR auto fill_n(OutputIt out, Size count=
, const T& value)
- }
- template <typename T, typename Size>
- FMT_CONSTEXPR20 auto fill_n(T* out, Size count, char value) -> T* {
--  if (is_constant_evaluated()) {
--    return fill_n<T*, Size, T>(out, count, value);
--  }
-+  if (is_constant_evaluated()) return fill_n<T*, Size, T>(out, count, v=
alue);
-   std::memset(out, value, to_unsigned(count));
-   return out + count;
- }
-=20
--#ifdef __cpp_char8_t
--using char8_type =3D char8_t;
--#else
--enum char8_type : unsigned char {};
--#endif
--
- template <typename OutChar, typename InputIt, typename OutputIt>
--FMT_CONSTEXPR FMT_NOINLINE auto copy_str_noinline(InputIt begin, InputI=
t end,
--                                                  OutputIt out) -> Outp=
utIt {
--  return copy_str<OutChar>(begin, end, out);
-+FMT_CONSTEXPR FMT_NOINLINE auto copy_noinline(InputIt begin, InputIt en=
d,
-+                                              OutputIt out) -> OutputIt=
 {
-+  return copy<OutChar>(begin, end, out);
- }
-=20
- // A public domain branchless UTF-8 decoder by Christopher Wellons:
-@@ -718,6 +603,7 @@ FMT_CONSTEXPR void for_each_codepoint(string_view s,=
 F f) {
-                     string_view(ptr, error ? 1 : to_unsigned(end - buf_=
ptr)));
-     return result ? (error ? buf_ptr + 1 : end) : nullptr;
-   };
-+
-   auto p =3D s.data();
-   const size_t block_size =3D 4;  // utf8_decode always reads blocks of=
 4 chars.
-   if (s.size() >=3D block_size) {
-@@ -726,17 +612,20 @@ FMT_CONSTEXPR void for_each_codepoint(string_view =
s, F f) {
-       if (!p) return;
-     }
-   }
--  if (auto num_chars_left =3D s.data() + s.size() - p) {
--    char buf[2 * block_size - 1] =3D {};
--    copy_str<char>(p, p + num_chars_left, buf);
--    const char* buf_ptr =3D buf;
--    do {
--      auto end =3D decode(buf_ptr, p);
--      if (!end) return;
--      p +=3D end - buf_ptr;
--      buf_ptr =3D end;
--    } while (buf_ptr - buf < num_chars_left);
--  }
-+  auto num_chars_left =3D to_unsigned(s.data() + s.size() - p);
-+  if (num_chars_left =3D=3D 0) return;
-+
-+  // Suppress bogus -Wstringop-overflow.
-+  if (FMT_GCC_VERSION) num_chars_left &=3D 3;
-+  char buf[2 * block_size - 1] =3D {};
-+  copy<char>(p, p + num_chars_left, buf);
-+  const char* buf_ptr =3D buf;
-+  do {
-+    auto end =3D decode(buf_ptr, p);
-+    if (!end) return;
-+    p +=3D end - buf_ptr;
-+    buf_ptr =3D end;
-+  } while (buf_ptr < buf + num_chars_left);
- }
-=20
- template <typename Char>
-@@ -745,13 +634,13 @@ inline auto compute_width(basic_string_view<Char> =
s) -> size_t {
- }
-=20
- // Computes approximate display width of a UTF-8 string.
--FMT_CONSTEXPR inline size_t compute_width(string_view s) {
-+FMT_CONSTEXPR inline auto compute_width(string_view s) -> size_t {
-   size_t num_code_points =3D 0;
-   // It is not a lambda for compatibility with C++14.
-   struct count_code_points {
-     size_t* count;
-     FMT_CONSTEXPR auto operator()(uint32_t cp, string_view) const -> bo=
ol {
--      *count +=3D detail::to_unsigned(
-+      *count +=3D to_unsigned(
-           1 +
-           (cp >=3D 0x1100 &&
-            (cp <=3D 0x115f ||  // Hangul Jamo init. consonants
-@@ -779,31 +668,24 @@ FMT_CONSTEXPR inline size_t compute_width(string_v=
iew s) {
-   return num_code_points;
- }
-=20
--inline auto compute_width(basic_string_view<char8_type> s) -> size_t {
--  return compute_width(
--      string_view(reinterpret_cast<const char*>(s.data()), s.size()));
--}
--
- template <typename Char>
- inline auto code_point_index(basic_string_view<Char> s, size_t n) -> si=
ze_t {
--  size_t size =3D s.size();
--  return n < size ? n : size;
-+  return min_of(n, s.size());
- }
-=20
- // Calculates the index of the nth code point in a UTF-8 string.
- inline auto code_point_index(string_view s, size_t n) -> size_t {
--  const char* data =3D s.data();
--  size_t num_code_points =3D 0;
--  for (size_t i =3D 0, size =3D s.size(); i !=3D size; ++i) {
--    if ((data[i] & 0xc0) !=3D 0x80 && ++num_code_points > n) return i;
--  }
--  return s.size();
--}
--
--inline auto code_point_index(basic_string_view<char8_type> s, size_t n)
--    -> size_t {
--  return code_point_index(
--      string_view(reinterpret_cast<const char*>(s.data()), s.size()), n=
);
-+  size_t result =3D s.size();
-+  const char* begin =3D s.begin();
-+  for_each_codepoint(s, [begin, &n, &result](uint32_t, string_view sv) =
{
-+    if (n !=3D 0) {
-+      --n;
-+      return true;
-+    }
-+    result =3D to_unsigned(sv.begin() - begin);
-+    return false;
-+  });
-+  return result;
- }
-=20
- template <typename T> struct is_integral : std::is_integral<T> {};
-@@ -821,38 +703,22 @@ using is_integer =3D
-                   !std::is_same<T, char>::value &&
-                   !std::is_same<T, wchar_t>::value>;
-=20
--#ifndef FMT_USE_FLOAT
--#  define FMT_USE_FLOAT 1
--#endif
--#ifndef FMT_USE_DOUBLE
--#  define FMT_USE_DOUBLE 1
--#endif
--#ifndef FMT_USE_LONG_DOUBLE
--#  define FMT_USE_LONG_DOUBLE 1
--#endif
--
--#ifndef FMT_USE_FLOAT128
--#  ifdef __clang__
--// Clang emulates GCC, so it has to appear early.
--#    if FMT_HAS_INCLUDE(<quadmath.h>)
--#      define FMT_USE_FLOAT128 1
--#    endif
--#  elif defined(__GNUC__)
--// GNU C++:
--#    if defined(_GLIBCXX_USE_FLOAT128) && !defined(__STRICT_ANSI__)
--#      define FMT_USE_FLOAT128 1
--#    endif
--#  endif
--#  ifndef FMT_USE_FLOAT128
--#    define FMT_USE_FLOAT128 0
--#  endif
-+#if defined(FMT_USE_FLOAT128)
-+// Use the provided definition.
-+#elif FMT_CLANG_VERSION && FMT_HAS_INCLUDE(<quadmath.h>)
-+#  define FMT_USE_FLOAT128 1
-+#elif FMT_GCC_VERSION && defined(_GLIBCXX_USE_FLOAT128) && \
-+    !defined(__STRICT_ANSI__)
-+#  define FMT_USE_FLOAT128 1
-+#else
-+#  define FMT_USE_FLOAT128 0
- #endif
--
- #if FMT_USE_FLOAT128
- using float128 =3D __float128;
- #else
--using float128 =3D void;
-+struct float128 {};
- #endif
-+
- template <typename T> using is_float128 =3D std::is_same<T, float128>;
-=20
- template <typename T>
-@@ -871,24 +737,21 @@ using is_double_double =3D bool_constant<std::nume=
ric_limits<T>::digits =3D=3D 106>;
- #  define FMT_USE_FULL_CACHE_DRAGONBOX 0
- #endif
-=20
--template <typename T>
--template <typename U>
--void buffer<T>::append(const U* begin, const U* end) {
--  while (begin !=3D end) {
--    auto count =3D to_unsigned(end - begin);
--    try_reserve(size_ + count);
--    auto free_cap =3D capacity_ - size_;
--    if (free_cap < count) count =3D free_cap;
--    std::uninitialized_copy_n(begin, count, make_checked(ptr_ + size_, =
count));
--    size_ +=3D count;
--    begin +=3D count;
-+// An allocator that uses malloc/free to allow removing dependency on t=
he C++
-+// standard libary runtime.
-+template <typename T> struct allocator {
-+  using value_type =3D T;
-+
-+  T* allocate(size_t n) {
-+    FMT_ASSERT(n <=3D max_value<size_t>() / sizeof(T), "");
-+    T* p =3D static_cast<T*>(malloc(n * sizeof(T)));
-+    if (!p) FMT_THROW(std::bad_alloc());
-+    return p;
-   }
--}
-=20
--template <typename T, typename Enable =3D void>
--struct is_locale : std::false_type {};
--template <typename T>
--struct is_locale<T, void_t<decltype(T::classic())>> : std::true_type {}=
;
-+  void deallocate(T* p, size_t) { free(p); }
-+};
-+
- }  // namespace detail
-=20
- FMT_BEGIN_EXPORT
-@@ -898,34 +761,26 @@ FMT_BEGIN_EXPORT
- enum { inline_buffer_size =3D 500 };
-=20
- /**
--  \rst
--  A dynamically growing memory buffer for trivially copyable/constructi=
ble types
--  with the first ``SIZE`` elements stored in the object itself.
--
--  You can use the ``memory_buffer`` type alias for ``char`` instead.
--
--  **Example**::
--
--     auto out =3D fmt::memory_buffer();
--     format_to(std::back_inserter(out), "The answer is {}.", 42);
--
--  This will append the following output to the ``out`` object:
--
--  .. code-block:: none
--
--     The answer is 42.
--
--  The output can be converted to an ``std::string`` with ``to_string(ou=
t)``.
--  \endrst
-+ * A dynamically growing memory buffer for trivially copyable/construct=
ible
-+ * types with the first `SIZE` elements stored in the object itself. Mo=
st
-+ * commonly used via the `memory_buffer` alias for `char`.
-+ *
-+ * **Example**:
-+ *
-+ *     auto out =3D fmt::memory_buffer();
-+ *     fmt::format_to(std::back_inserter(out), "The answer is {}.", 42)=
;
-+ *
-+ * This will append "The answer is 42." to `out`. The buffer content ca=
n be
-+ * converted to `std::string` with `to_string(out)`.
-  */
- template <typename T, size_t SIZE =3D inline_buffer_size,
--          typename Allocator =3D std::allocator<T>>
--class basic_memory_buffer final : public detail::buffer<T> {
-+          typename Allocator =3D detail::allocator<T>>
-+class basic_memory_buffer : public detail::buffer<T> {
-  private:
-   T store_[SIZE];
-=20
--  // Don't inherit from Allocator avoid generating type_info for it.
--  Allocator alloc_;
-+  // Don't inherit from Allocator to avoid generating type_info for it.
-+  FMT_NO_UNIQUE_ADDRESS Allocator alloc_;
-=20
-   // Deallocate memory allocated by the buffer.
-   FMT_CONSTEXPR20 void deallocate() {
-@@ -933,36 +788,37 @@ class basic_memory_buffer final : public detail::b=
uffer<T> {
-     if (data !=3D store_) alloc_.deallocate(data, this->capacity());
-   }
-=20
-- protected:
--  FMT_CONSTEXPR20 void grow(size_t size) override {
-+  static FMT_CONSTEXPR20 void grow(detail::buffer<T>& buf, size_t size)=
 {
-     detail::abort_fuzzing_if(size > 5000);
--    const size_t max_size =3D std::allocator_traits<Allocator>::max_siz=
e(alloc_);
--    size_t old_capacity =3D this->capacity();
-+    auto& self =3D static_cast<basic_memory_buffer&>(buf);
-+    const size_t max_size =3D
-+        std::allocator_traits<Allocator>::max_size(self.alloc_);
-+    size_t old_capacity =3D buf.capacity();
-     size_t new_capacity =3D old_capacity + old_capacity / 2;
-     if (size > new_capacity)
-       new_capacity =3D size;
-     else if (new_capacity > max_size)
--      new_capacity =3D size > max_size ? size : max_size;
--    T* old_data =3D this->data();
--    T* new_data =3D
--        std::allocator_traits<Allocator>::allocate(alloc_, new_capacity=
);
-+      new_capacity =3D max_of(size, max_size);
-+    T* old_data =3D buf.data();
-+    T* new_data =3D self.alloc_.allocate(new_capacity);
-+    // Suppress a bogus -Wstringop-overflow in gcc 13.1 (#3481).
-+    detail::assume(buf.size() <=3D new_capacity);
-     // The following code doesn't throw, so the raw pointer above doesn=
't leak.
--    std::uninitialized_copy(old_data, old_data + this->size(),
--                            detail::make_checked(new_data, new_capacity=
));
--    this->set(new_data, new_capacity);
-+    memcpy(new_data, old_data, buf.size() * sizeof(T));
-+    self.set(new_data, new_capacity);
-     // deallocate must not throw according to the standard, but even if=
 it does,
-     // the buffer already uses the new storage and will deallocate it i=
n
-     // destructor.
--    if (old_data !=3D store_) alloc_.deallocate(old_data, old_capacity)=
;
-+    if (old_data !=3D self.store_) self.alloc_.deallocate(old_data, old=
_capacity);
-   }
-=20
-  public:
-   using value_type =3D T;
-   using const_reference =3D const T&;
-=20
--  FMT_CONSTEXPR20 explicit basic_memory_buffer(
-+  FMT_CONSTEXPR explicit basic_memory_buffer(
-       const Allocator& alloc =3D Allocator())
--      : alloc_(alloc) {
-+      : detail::buffer<T>(grow), alloc_(alloc) {
-     this->set(store_, SIZE);
-     if (detail::is_constant_evaluated()) detail::fill_n(store_, SIZE, T=
());
-   }
-@@ -976,8 +832,7 @@ class basic_memory_buffer final : public detail::buf=
fer<T> {
-     size_t size =3D other.size(), capacity =3D other.capacity();
-     if (data =3D=3D other.store_) {
-       this->set(store_, capacity);
--      detail::copy_str<T>(other.store_, other.store_ + size,
--                          detail::make_checked(store_, capacity));
-+      detail::copy<T>(other.store_, other.store_ + size, store_);
-     } else {
-       this->set(data, capacity);
-       // Set pointer to the inline array so that delete is not called
-@@ -989,21 +844,14 @@ class basic_memory_buffer final : public detail::b=
uffer<T> {
-   }
-=20
-  public:
--  /**
--    \rst
--    Constructs a :class:`fmt::basic_memory_buffer` object moving the co=
ntent
--    of the other object to it.
--    \endrst
--   */
--  FMT_CONSTEXPR20 basic_memory_buffer(basic_memory_buffer&& other) noex=
cept {
-+  /// Constructs a `basic_memory_buffer` object moving the content of t=
he other
-+  /// object to it.
-+  FMT_CONSTEXPR20 basic_memory_buffer(basic_memory_buffer&& other) noex=
cept
-+      : detail::buffer<T>(grow) {
-     move(other);
-   }
-=20
--  /**
--    \rst
--    Moves the content of the other ``basic_memory_buffer`` object to th=
is one.
--    \endrst
--   */
-+  /// Moves the content of the other `basic_memory_buffer` object to th=
is one.
-   auto operator=3D(basic_memory_buffer&& other) noexcept -> basic_memor=
y_buffer& {
-     FMT_ASSERT(this !=3D &other, "");
-     deallocate();
-@@ -1014,119 +862,108 @@ class basic_memory_buffer final : public detail=
::buffer<T> {
-   // Returns a copy of the allocator associated with this buffer.
-   auto get_allocator() const -> Allocator { return alloc_; }
-=20
--  /**
--    Resizes the buffer to contain *count* elements. If T is a POD type =
new
--    elements may not be initialized.
--   */
--  FMT_CONSTEXPR20 void resize(size_t count) { this->try_resize(count); =
}
-+  /// Resizes the buffer to contain `count` elements. If T is a POD typ=
e new
-+  /// elements may not be initialized.
-+  FMT_CONSTEXPR void resize(size_t count) { this->try_resize(count); }
-=20
--  /** Increases the buffer capacity to *new_capacity*. */
-+  /// Increases the buffer capacity to `new_capacity`.
-   void reserve(size_t new_capacity) { this->try_reserve(new_capacity); =
}
-=20
--  // Directly append data into the buffer
-   using detail::buffer<T>::append;
-   template <typename ContiguousRange>
--  void append(const ContiguousRange& range) {
-+  FMT_CONSTEXPR20 void append(const ContiguousRange& range) {
-     append(range.data(), range.data() + range.size());
-   }
- };
-=20
- using memory_buffer =3D basic_memory_buffer<char>;
-=20
-+template <size_t SIZE>
-+FMT_NODISCARD auto to_string(const basic_memory_buffer<char, SIZE>& buf=
)
-+    -> std::string {
-+  auto size =3D buf.size();
-+  detail::assume(size < std::string().max_size());
-+  return {buf.data(), size};
-+}
-+
-+// A writer to a buffered stream. It doesn't own the underlying stream.
-+class writer {
-+ private:
-+  detail::buffer<char>* buf_;
-+
-+  // We cannot create a file buffer in advance because any write to a F=
ILE may
-+  // invalidate it.
-+  FILE* file_;
-+
-+ public:
-+  inline writer(FILE* f) : buf_(nullptr), file_(f) {}
-+  inline writer(detail::buffer<char>& buf) : buf_(&buf) {}
-+
-+  /// Formats `args` according to specifications in `fmt` and writes th=
e
-+  /// output to the file.
-+  template <typename... T> void print(format_string<T...> fmt, T&&... a=
rgs) {
-+    if (buf_)
-+      fmt::format_to(appender(*buf_), fmt, std::forward<T>(args)...);
-+    else
-+      fmt::print(file_, fmt, std::forward<T>(args)...);
-+  }
-+};
-+
-+class string_buffer {
-+ private:
-+  std::string str_;
-+  detail::container_buffer<std::string> buf_;
-+
-+ public:
-+  inline string_buffer() : buf_(str_) {}
-+
-+  inline operator writer() { return buf_; }
-+  inline std::string& str() { return str_; }
-+};
-+
- template <typename T, size_t SIZE, typename Allocator>
- struct is_contiguous<basic_memory_buffer<T, SIZE, Allocator>> : std::tr=
ue_type {
- };
-=20
--FMT_END_EXPORT
--namespace detail {
--FMT_API bool write_console(std::FILE* f, string_view text);
--FMT_API void print(std::FILE*, string_view);
--}  // namespace detail
--FMT_BEGIN_EXPORT
--
- // Suppress a misleading warning in older versions of clang.
--#if FMT_CLANG_VERSION
--#  pragma clang diagnostic ignored "-Wweak-vtables"
--#endif
-+FMT_PRAGMA_CLANG(diagnostic ignored "-Wweak-vtables")
-=20
--/** An error reported from a formatting function. */
--class FMT_VISIBILITY("default") format_error : public std::runtime_erro=
r {
-+/// An error reported from a formatting function.
-+class FMT_SO_VISIBILITY("default") format_error : public std::runtime_e=
rror {
-  public:
-   using std::runtime_error::runtime_error;
- };
-=20
--namespace detail_exported {
--#if FMT_USE_NONTYPE_TEMPLATE_ARGS
-+class loc_value;
-+
-+FMT_END_EXPORT
-+namespace detail {
-+FMT_API auto write_console(int fd, string_view text) -> bool;
-+FMT_API void print(FILE*, string_view);
-+}  // namespace detail
-+
-+namespace detail {
- template <typename Char, size_t N> struct fixed_string {
--  constexpr fixed_string(const Char (&str)[N]) {
--    detail::copy_str<Char, const Char*, Char*>(static_cast<const Char*>=
(str),
--                                               str + N, data);
-+  FMT_CONSTEXPR20 fixed_string(const Char (&s)[N]) {
-+    detail::copy<Char, const Char*, Char*>(static_cast<const Char*>(s),=
 s + N,
-+                                           data);
-   }
-   Char data[N] =3D {};
- };
--#endif
-=20
- // Converts a compile-time string to basic_string_view.
--template <typename Char, size_t N>
-+FMT_EXPORT template <typename Char, size_t N>
- constexpr auto compile_string_to_view(const Char (&s)[N])
-     -> basic_string_view<Char> {
-   // Remove trailing NUL character if needed. Won't be present if this =
is used
-   // with a raw character array (i.e. not defined as a string).
-   return {s, N - (std::char_traits<Char>::to_int_type(s[N - 1]) =3D=3D =
0 ? 1 : 0)};
- }
--template <typename Char>
--constexpr auto compile_string_to_view(detail::std_string_view<Char> s)
-+FMT_EXPORT template <typename Char>
-+constexpr auto compile_string_to_view(basic_string_view<Char> s)
-     -> basic_string_view<Char> {
--  return {s.data(), s.size()};
-+  return s;
- }
--}  // namespace detail_exported
--
--class loc_value {
-- private:
--  basic_format_arg<format_context> value_;
--
-- public:
--  template <typename T, FMT_ENABLE_IF(!detail::is_float128<T>::value)>
--  loc_value(T value) : value_(detail::make_arg<format_context>(value)) =
{}
--
--  template <typename T, FMT_ENABLE_IF(detail::is_float128<T>::value)>
--  loc_value(T) {}
--
--  template <typename Visitor> auto visit(Visitor&& vis) -> decltype(vis=
(0)) {
--    return visit_format_arg(vis, value_);
--  }
--};
--
--// A locale facet that formats values in UTF-8.
--// It is parameterized on the locale to avoid the heavy <locale> includ=
e.
--template <typename Locale> class format_facet : public Locale::facet {
-- private:
--  std::string separator_;
--  std::string grouping_;
--  std::string decimal_point_;
--
-- protected:
--  virtual auto do_put(appender out, loc_value val,
--                      const format_specs<>& specs) const -> bool;
--
-- public:
--  static FMT_API typename Locale::id id;
--
--  explicit format_facet(Locale& loc);
--  explicit format_facet(string_view sep =3D "",
--                        std::initializer_list<unsigned char> g =3D {3},
--                        std::string decimal_point =3D ".")
--      : separator_(sep.data(), sep.size()),
--        grouping_(g.begin(), g.end()),
--        decimal_point_(decimal_point) {}
--
--  auto put(appender out, loc_value val, const format_specs<>& specs) co=
nst
--      -> bool {
--    return do_put(out, val, specs);
--  }
--};
--
--FMT_BEGIN_DETAIL_NAMESPACE
-=20
- // Returns true if value is negative, false otherwise.
- // Same as `value < 0` but doesn't produce warnings if T is an unsigned=
 type.
-@@ -1139,14 +976,6 @@ constexpr auto is_negative(T) -> bool {
-   return false;
- }
-=20
--template <typename T>
--FMT_CONSTEXPR auto is_supported_floating_point(T) -> bool {
--  if (std::is_same<T, float>()) return FMT_USE_FLOAT;
--  if (std::is_same<T, double>()) return FMT_USE_DOUBLE;
--  if (std::is_same<T, long double>()) return FMT_USE_LONG_DOUBLE;
--  return true;
--}
--
- // Smallest of uint32_t, uint64_t, uint128_t that is large enough to
- // represent all values of an integral type T.
- template <typename T>
-@@ -1157,27 +986,28 @@ using uint32_or_64_or_128_t =3D
- template <typename T>
- using uint64_or_128_t =3D conditional_t<num_bits<T>() <=3D 64, uint64_t=
, uint128_t>;
-=20
--#define FMT_POWERS_OF_10(factor)                                       =
      \
--  factor * 10, (factor)*100, (factor)*1000, (factor)*10000, (factor)*10=
0000, \
--      (factor)*1000000, (factor)*10000000, (factor)*100000000,         =
      \
--      (factor)*1000000000
-+#define FMT_POWERS_OF_10(factor)                                  \
-+  factor * 10, (factor) * 100, (factor) * 1000, (factor) * 10000, \
-+      (factor) * 100000, (factor) * 1000000, (factor) * 10000000, \
-+      (factor) * 100000000, (factor) * 1000000000
-=20
- // Converts value in the range [0, 100) to a string.
--constexpr const char* digits2(size_t value) {
--  // GCC generates slightly better code when value is pointer-size.
--  return &"0001020304050607080910111213141516171819"
--         "2021222324252627282930313233343536373839"
--         "4041424344454647484950515253545556575859"
--         "6061626364656667686970717273747576777879"
--         "8081828384858687888990919293949596979899"[value * 2];
--}
--
--// Sign is a template parameter to workaround a bug in gcc 4.8.
--template <typename Char, typename Sign> constexpr Char sign(Sign s) {
--#if !FMT_GCC_VERSION || FMT_GCC_VERSION >=3D 604
--  static_assert(std::is_same<Sign, sign_t>::value, "");
--#endif
--  return static_cast<Char>("\0-+ "[s]);
-+// GCC generates slightly better code when value is pointer-size.
-+inline auto digits2(size_t value) -> const char* {
-+  // Align data since unaligned access may be slower when crossing a
-+  // hardware-specific boundary.
-+  alignas(2) static const char data[] =3D
-+      "0001020304050607080910111213141516171819"
-+      "2021222324252627282930313233343536373839"
-+      "4041424344454647484950515253545556575859"
-+      "6061626364656667686970717273747576777879"
-+      "8081828384858687888990919293949596979899";
-+  return &data[value * 2];
-+}
-+
-+template <typename Char> constexpr auto getsign(sign s) -> Char {
-+  return static_cast<char>(((' ' << 24) | ('+' << 16) | ('-' << 8)) >>
-+                           (static_cast<int>(s) * 8));
- }
-=20
- template <typename T> FMT_CONSTEXPR auto count_digits_fallback(T n) -> =
int {
-@@ -1225,9 +1055,7 @@ inline auto do_count_digits(uint64_t n) -> int {
- // except for n =3D=3D 0 in which case count_digits returns 1.
- FMT_CONSTEXPR20 inline auto count_digits(uint64_t n) -> int {
- #ifdef FMT_BUILTIN_CLZLL
--  if (!is_constant_evaluated()) {
--    return do_count_digits(n);
--  }
-+  if (!is_constant_evaluated() && !FMT_OPTIMIZE_SIZE) return do_count_d=
igits(n);
- #endif
-   return count_digits_fallback(n);
- }
-@@ -1255,7 +1083,7 @@ FMT_CONSTEXPR auto count_digits(UInt n) -> int {
- FMT_INLINE auto do_count_digits(uint32_t n) -> int {
- // An optimization by Kendall Willets from https://bit.ly/3uOIQrB.
- // This increments the upper 32 bits (log10(T) - 1) when >=3D T is adde=
d.
--#  define FMT_INC(T) (((sizeof(#  T) - 1ull) << 32) - T)
-+#  define FMT_INC(T) (((sizeof(#T) - 1ull) << 32) - T)
-   static constexpr uint64_t table[] =3D {
-       FMT_INC(0),          FMT_INC(0),          FMT_INC(0),           /=
/ 8
-       FMT_INC(10),         FMT_INC(10),         FMT_INC(10),          /=
/ 64
-@@ -1277,9 +1105,7 @@ FMT_INLINE auto do_count_digits(uint32_t n) -> int=
 {
- // Optional version of count_digits for better performance on 32-bit pl=
atforms.
- FMT_CONSTEXPR20 inline auto count_digits(uint32_t n) -> int {
- #ifdef FMT_BUILTIN_CLZ
--  if (!is_constant_evaluated()) {
--    return do_count_digits(n);
--  }
-+  if (!is_constant_evaluated() && !FMT_OPTIMIZE_SIZE) return do_count_d=
igits(n);
- #endif
-   return count_digits_fallback(n);
- }
-@@ -1316,91 +1142,118 @@ template <> inline auto decimal_point(locale_re=
f loc) -> wchar_t {
-   return decimal_point_impl<wchar_t>(loc);
- }
-=20
--// Compares two characters for equality.
--template <typename Char> auto equal2(const Char* lhs, const char* rhs) =
-> bool {
--  return lhs[0] =3D=3D Char(rhs[0]) && lhs[1] =3D=3D Char(rhs[1]);
--}
--inline auto equal2(const char* lhs, const char* rhs) -> bool {
-+#ifndef FMT_HEADER_ONLY
-+FMT_BEGIN_EXPORT
-+extern template FMT_API auto thousands_sep_impl<char>(locale_ref)
-+    -> thousands_sep_result<char>;
-+extern template FMT_API auto thousands_sep_impl<wchar_t>(locale_ref)
-+    -> thousands_sep_result<wchar_t>;
-+extern template FMT_API auto decimal_point_impl(locale_ref) -> char;
-+extern template FMT_API auto decimal_point_impl(locale_ref) -> wchar_t;
-+FMT_END_EXPORT
-+#endif  // FMT_HEADER_ONLY
-+
-+// Compares two characters for equality.
-+template <typename Char> auto equal2(const Char* lhs, const char* rhs) =
-> bool {
-+  return lhs[0] =3D=3D Char(rhs[0]) && lhs[1] =3D=3D Char(rhs[1]);
-+}
-+inline auto equal2(const char* lhs, const char* rhs) -> bool {
-   return memcmp(lhs, rhs, 2) =3D=3D 0;
- }
-=20
--// Copies two characters from src to dst.
-+// Writes a two-digit value to out.
- template <typename Char>
--FMT_CONSTEXPR20 FMT_INLINE void copy2(Char* dst, const char* src) {
--  if (!is_constant_evaluated() && sizeof(Char) =3D=3D sizeof(char)) {
--    memcpy(dst, src, 2);
-+FMT_CONSTEXPR20 FMT_INLINE void write2digits(Char* out, size_t value) {
-+  if (!is_constant_evaluated() && std::is_same<Char, char>::value &&
-+      !FMT_OPTIMIZE_SIZE) {
-+    memcpy(out, digits2(value), 2);
-     return;
-   }
--  *dst++ =3D static_cast<Char>(*src++);
--  *dst =3D static_cast<Char>(*src);
-+  *out++ =3D static_cast<Char>('0' + value / 10);
-+  *out =3D static_cast<Char>('0' + value % 10);
- }
-=20
--template <typename Iterator> struct format_decimal_result {
--  Iterator begin;
--  Iterator end;
--};
--
--// Formats a decimal unsigned integer value writing into out pointing t=
o a
--// buffer of specified size. The caller must ensure that the buffer is =
large
--// enough.
-+// Formats a decimal unsigned integer value writing to out pointing to =
a buffer
-+// of specified size. The caller must ensure that the buffer is large e=
nough.
- template <typename Char, typename UInt>
--FMT_CONSTEXPR20 auto format_decimal(Char* out, UInt value, int size)
--    -> format_decimal_result<Char*> {
-+FMT_CONSTEXPR20 auto do_format_decimal(Char* out, UInt value, int size)
-+    -> Char* {
-   FMT_ASSERT(size >=3D count_digits(value), "invalid digit count");
--  out +=3D size;
--  Char* end =3D out;
-+  unsigned n =3D to_unsigned(size);
-   while (value >=3D 100) {
-     // Integer division is slow so do it for a group of two digits inst=
ead
-     // of for every digit. The idea comes from the talk by Alexandrescu
-     // "Three Optimization Tips for C++". See speed-test for a comparis=
on.
--    out -=3D 2;
--    copy2(out, digits2(static_cast<size_t>(value % 100)));
-+    n -=3D 2;
-+    write2digits(out + n, static_cast<unsigned>(value % 100));
-     value /=3D 100;
-   }
--  if (value < 10) {
--    *--out =3D static_cast<Char>('0' + value);
--    return {out, end};
-+  if (value >=3D 10) {
-+    n -=3D 2;
-+    write2digits(out + n, static_cast<unsigned>(value));
-+  } else {
-+    out[--n] =3D static_cast<Char>('0' + value);
-   }
--  out -=3D 2;
--  copy2(out, digits2(static_cast<size_t>(value)));
--  return {out, end};
-+  return out + n;
-+}
-+
-+template <typename Char, typename UInt>
-+FMT_CONSTEXPR FMT_INLINE auto format_decimal(Char* out, UInt value,
-+                                             int num_digits) -> Char* {
-+  do_format_decimal(out, value, num_digits);
-+  return out + num_digits;
- }
-=20
--template <typename Char, typename UInt, typename Iterator,
--          FMT_ENABLE_IF(!std::is_pointer<remove_cvref_t<Iterator>>::val=
ue)>
--FMT_CONSTEXPR inline auto format_decimal(Iterator out, UInt value, int =
size)
--    -> format_decimal_result<Iterator> {
-+template <typename Char, typename UInt, typename OutputIt,
-+          FMT_ENABLE_IF(!std::is_pointer<remove_cvref_t<OutputIt>>::val=
ue)>
-+FMT_CONSTEXPR auto format_decimal(OutputIt out, UInt value, int num_dig=
its)
-+    -> OutputIt {
-+  if (auto ptr =3D to_pointer<Char>(out, to_unsigned(num_digits))) {
-+    do_format_decimal(ptr, value, num_digits);
-+    return out;
-+  }
-   // Buffer is large enough to hold all digits (digits10 + 1).
--  Char buffer[digits10<UInt>() + 1] =3D {};
--  auto end =3D format_decimal(buffer, value, size).end;
--  return {out, detail::copy_str_noinline<Char>(buffer, end, out)};
-+  char buffer[digits10<UInt>() + 1];
-+  if (is_constant_evaluated()) fill_n(buffer, sizeof(buffer), '\0');
-+  do_format_decimal(buffer, value, num_digits);
-+  return copy_noinline<Char>(buffer, buffer + num_digits, out);
- }
-=20
--template <unsigned BASE_BITS, typename Char, typename UInt>
--FMT_CONSTEXPR auto format_uint(Char* buffer, UInt value, int num_digits=
,
--                               bool upper =3D false) -> Char* {
--  buffer +=3D num_digits;
--  Char* end =3D buffer;
-+template <typename Char, typename UInt>
-+FMT_CONSTEXPR auto do_format_base2e(int base_bits, Char* out, UInt valu=
e,
-+                                    int size, bool upper =3D false) -> =
Char* {
-+  out +=3D size;
-   do {
-     const char* digits =3D upper ? "0123456789ABCDEF" : "0123456789abcd=
ef";
--    unsigned digit =3D static_cast<unsigned>(value & ((1 << BASE_BITS) =
- 1));
--    *--buffer =3D static_cast<Char>(BASE_BITS < 4 ? static_cast<char>('=
0' + digit)
--                                                : digits[digit]);
--  } while ((value >>=3D BASE_BITS) !=3D 0);
--  return end;
-+    unsigned digit =3D static_cast<unsigned>(value & ((1 << base_bits) =
- 1));
-+    *--out =3D static_cast<Char>(base_bits < 4 ? static_cast<char>('0' =
+ digit)
-+                                             : digits[digit]);
-+  } while ((value >>=3D base_bits) !=3D 0);
-+  return out;
-+}
-+
-+// Formats an unsigned integer in the power of two base (binary, octal,=
 hex).
-+template <typename Char, typename UInt>
-+FMT_CONSTEXPR auto format_base2e(int base_bits, Char* out, UInt value,
-+                                 int num_digits, bool upper =3D false) =
-> Char* {
-+  do_format_base2e(base_bits, out, value, num_digits, upper);
-+  return out + num_digits;
- }
-=20
--template <unsigned BASE_BITS, typename Char, typename It, typename UInt=
>
--inline auto format_uint(It out, UInt value, int num_digits, bool upper =
=3D false)
--    -> It {
-+template <typename Char, typename OutputIt, typename UInt,
-+          FMT_ENABLE_IF(is_back_insert_iterator<OutputIt>::value)>
-+FMT_CONSTEXPR inline auto format_base2e(int base_bits, OutputIt out, UI=
nt value,
-+                                        int num_digits, bool upper =3D =
false)
-+    -> OutputIt {
-   if (auto ptr =3D to_pointer<Char>(out, to_unsigned(num_digits))) {
--    format_uint<BASE_BITS>(ptr, value, num_digits, upper);
-+    format_base2e(base_bits, ptr, value, num_digits, upper);
-     return out;
-   }
--  // Buffer should be large enough to hold all digits (digits / BASE_BI=
TS + 1).
--  char buffer[num_bits<UInt>() / BASE_BITS + 1];
--  format_uint<BASE_BITS>(buffer, value, num_digits, upper);
--  return detail::copy_str_noinline<Char>(buffer, buffer + num_digits, o=
ut);
-+  // Make buffer large enough for any base.
-+  char buffer[num_bits<UInt>()];
-+  if (is_constant_evaluated()) fill_n(buffer, sizeof(buffer), '\0');
-+  format_base2e(base_bits, buffer, value, num_digits, upper);
-+  return detail::copy_noinline<Char>(buffer, buffer + num_digits, out);
- }
-=20
- // A converter from UTF-8 to UTF-16.
-@@ -1410,12 +1263,16 @@ class utf8_to_utf16 {
-=20
-  public:
-   FMT_API explicit utf8_to_utf16(string_view s);
--  operator basic_string_view<wchar_t>() const { return {&buffer_[0], si=
ze()}; }
--  auto size() const -> size_t { return buffer_.size() - 1; }
--  auto c_str() const -> const wchar_t* { return &buffer_[0]; }
--  auto str() const -> std::wstring { return {&buffer_[0], size()}; }
-+  inline operator basic_string_view<wchar_t>() const {
-+    return {&buffer_[0], size()};
-+  }
-+  inline auto size() const -> size_t { return buffer_.size() - 1; }
-+  inline auto c_str() const -> const wchar_t* { return &buffer_[0]; }
-+  inline auto str() const -> std::wstring { return {&buffer_[0], size()=
}; }
- };
-=20
-+enum class to_utf8_error_policy { abort, replace };
-+
- // A converter from UTF-16/UTF-32 (host endian) to UTF-8.
- template <typename WChar, typename Buffer =3D memory_buffer> class to_u=
tf8 {
-  private:
-@@ -1423,37 +1280,45 @@ template <typename WChar, typename Buffer =3D me=
mory_buffer> class to_utf8 {
-=20
-  public:
-   to_utf8() {}
--  explicit to_utf8(basic_string_view<WChar> s) {
-+  explicit to_utf8(basic_string_view<WChar> s,
-+                   to_utf8_error_policy policy =3D to_utf8_error_policy=
::abort) {
-     static_assert(sizeof(WChar) =3D=3D 2 || sizeof(WChar) =3D=3D 4,
-                   "Expect utf16 or utf32");
--
--    if (!convert(s))
-+    if (!convert(s, policy))
-       FMT_THROW(std::runtime_error(sizeof(WChar) =3D=3D 2 ? "invalid ut=
f16"
-                                                       : "invalid utf32"=
));
-   }
-   operator string_view() const { return string_view(&buffer_[0], size()=
); }
--  size_t size() const { return buffer_.size() - 1; }
--  const char* c_str() const { return &buffer_[0]; }
--  std::string str() const { return std::string(&buffer_[0], size()); }
-+  auto size() const -> size_t { return buffer_.size() - 1; }
-+  auto c_str() const -> const char* { return &buffer_[0]; }
-+  auto str() const -> std::string { return std::string(&buffer_[0], siz=
e()); }
-=20
-   // Performs conversion returning a bool instead of throwing exception=
 on
-   // conversion error. This method may still throw in case of memory al=
location
-   // error.
--  bool convert(basic_string_view<WChar> s) {
--    if (!convert(buffer_, s)) return false;
-+  auto convert(basic_string_view<WChar> s,
-+               to_utf8_error_policy policy =3D to_utf8_error_policy::ab=
ort)
-+      -> bool {
-+    if (!convert(buffer_, s, policy)) return false;
-     buffer_.push_back(0);
-     return true;
-   }
--  static bool convert(Buffer& buf, basic_string_view<WChar> s) {
-+  static auto convert(Buffer& buf, basic_string_view<WChar> s,
-+                      to_utf8_error_policy policy =3D to_utf8_error_pol=
icy::abort)
-+      -> bool {
-     for (auto p =3D s.begin(); p !=3D s.end(); ++p) {
-       uint32_t c =3D static_cast<uint32_t>(*p);
-       if (sizeof(WChar) =3D=3D 2 && c >=3D 0xd800 && c <=3D 0xdfff) {
--        // surrogate pair
-+        // Handle a surrogate pair.
-         ++p;
-         if (p =3D=3D s.end() || (c & 0xfc00) !=3D 0xd800 || (*p & 0xfc0=
0) !=3D 0xdc00) {
--          return false;
-+          if (policy =3D=3D to_utf8_error_policy::abort) return false;
-+          buf.append(string_view("\xEF\xBF\xBD"));
-+          --p;
-+          continue;
-+        } else {
-+          c =3D (c << 10) + static_cast<uint32_t>(*p) - 0x35fdc00;
-         }
--        c =3D (c << 10) + static_cast<uint32_t>(*p) - 0x35fdc00;
-       }
-       if (c < 0x80) {
-         buf.push_back(static_cast<char>(c));
-@@ -1478,14 +1343,14 @@ template <typename WChar, typename Buffer =3D me=
mory_buffer> class to_utf8 {
- };
-=20
- // Computes 128-bit result of multiplication of two 64-bit unsigned int=
egers.
--inline uint128_fallback umul128(uint64_t x, uint64_t y) noexcept {
-+inline auto umul128(uint64_t x, uint64_t y) noexcept -> uint128_fallbac=
k {
- #if FMT_USE_INT128
-   auto p =3D static_cast<uint128_opt>(x) * static_cast<uint128_opt>(y);
-   return {static_cast<uint64_t>(p >> 64), static_cast<uint64_t>(p)};
- #elif defined(_MSC_VER) && defined(_M_X64)
--  auto result =3D uint128_fallback();
--  result.lo_ =3D _umul128(x, y, &result.hi_);
--  return result;
-+  auto hi =3D uint64_t();
-+  auto lo =3D _umul128(x, y, &hi);
-+  return {hi, lo};
- #else
-   const uint64_t mask =3D static_cast<uint64_t>(max_value<uint32_t>());
-=20
-@@ -1509,19 +1374,19 @@ inline uint128_fallback umul128(uint64_t x, uint=
64_t y) noexcept {
- namespace dragonbox {
- // Computes floor(log10(pow(2, e))) for e in [-2620, 2620] using the me=
thod from
- // https://fmt.dev/papers/Dragonbox.pdf#page=3D28, section 6.1.
--inline int floor_log10_pow2(int e) noexcept {
-+inline auto floor_log10_pow2(int e) noexcept -> int {
-   FMT_ASSERT(e <=3D 2620 && e >=3D -2620, "too large exponent");
-   static_assert((-1 >> 1) =3D=3D -1, "right shift is not arithmetic");
-   return (e * 315653) >> 20;
- }
-=20
--inline int floor_log2_pow10(int e) noexcept {
-+inline auto floor_log2_pow10(int e) noexcept -> int {
-   FMT_ASSERT(e <=3D 1233 && e >=3D -1233, "too large exponent");
-   return (e * 1741647) >> 19;
- }
-=20
- // Computes upper 64 bits of multiplication of two 64-bit unsigned inte=
gers.
--inline uint64_t umul128_upper64(uint64_t x, uint64_t y) noexcept {
-+inline auto umul128_upper64(uint64_t x, uint64_t y) noexcept -> uint64_=
t {
- #if FMT_USE_INT128
-   auto p =3D static_cast<uint128_opt>(x) * static_cast<uint128_opt>(y);
-   return static_cast<uint64_t>(p >> 64);
-@@ -1534,14 +1399,14 @@ inline uint64_t umul128_upper64(uint64_t x, uint=
64_t y) noexcept {
-=20
- // Computes upper 128 bits of multiplication of a 64-bit unsigned integ=
er and a
- // 128-bit unsigned integer.
--inline uint128_fallback umul192_upper128(uint64_t x,
--                                         uint128_fallback y) noexcept {
-+inline auto umul192_upper128(uint64_t x, uint128_fallback y) noexcept
-+    -> uint128_fallback {
-   uint128_fallback r =3D umul128(x, y.high());
-   r +=3D umul128_upper64(x, y.low());
-   return r;
- }
-=20
--FMT_API uint128_fallback get_cached_power(int k) noexcept;
-+FMT_API auto get_cached_power(int k) noexcept -> uint128_fallback;
-=20
- // Type-specific information that Dragonbox uses.
- template <typename T, typename Enable =3D void> struct float_info;
-@@ -1595,14 +1460,14 @@ template <typename T> FMT_API auto to_decimal(T =
x) noexcept -> decimal_fp<T>;
- }  // namespace dragonbox
-=20
- // Returns true iff Float has the implicit bit which is not stored.
--template <typename Float> constexpr bool has_implicit_bit() {
-+template <typename Float> constexpr auto has_implicit_bit() -> bool {
-   // An 80-bit FP number has a 64-bit significand an no implicit bit.
-   return std::numeric_limits<Float>::digits !=3D 64;
- }
-=20
- // Returns the number of significand bits stored in Float. The implicit=
 bit is
- // not counted since it is not stored.
--template <typename Float> constexpr int num_significand_bits() {
-+template <typename Float> constexpr auto num_significand_bits() -> int =
{
-   // std::numeric_limits may not support __float128.
-   return is_float128<Float>() ? 112
-                               : (std::numeric_limits<Float>::digits -
-@@ -1623,25 +1488,30 @@ template <typename Float> constexpr auto exponen=
t_bias() -> int {
- }
-=20
- // Writes the exponent exp in the form "[+-]d{2,3}" to buffer.
--template <typename Char, typename It>
--FMT_CONSTEXPR auto write_exponent(int exp, It it) -> It {
-+template <typename Char, typename OutputIt>
-+FMT_CONSTEXPR auto write_exponent(int exp, OutputIt out) -> OutputIt {
-   FMT_ASSERT(-10000 < exp && exp < 10000, "exponent out of range");
-   if (exp < 0) {
--    *it++ =3D static_cast<Char>('-');
-+    *out++ =3D static_cast<Char>('-');
-     exp =3D -exp;
-   } else {
--    *it++ =3D static_cast<Char>('+');
-+    *out++ =3D static_cast<Char>('+');
-   }
--  if (exp >=3D 100) {
--    const char* top =3D digits2(to_unsigned(exp / 100));
--    if (exp >=3D 1000) *it++ =3D static_cast<Char>(top[0]);
--    *it++ =3D static_cast<Char>(top[1]);
--    exp %=3D 100;
--  }
--  const char* d =3D digits2(to_unsigned(exp));
--  *it++ =3D static_cast<Char>(d[0]);
--  *it++ =3D static_cast<Char>(d[1]);
--  return it;
-+  auto uexp =3D static_cast<uint32_t>(exp);
-+  if (is_constant_evaluated()) {
-+    if (uexp < 10) *out++ =3D '0';
-+    return format_decimal<Char>(out, uexp, count_digits(uexp));
-+  }
-+  if (uexp >=3D 100u) {
-+    const char* top =3D digits2(uexp / 100);
-+    if (uexp >=3D 1000u) *out++ =3D static_cast<Char>(top[0]);
-+    *out++ =3D static_cast<Char>(top[1]);
-+    uexp %=3D 100;
-+  }
-+  const char* d =3D digits2(uexp);
-+  *out++ =3D static_cast<Char>(d[0]);
-+  *out++ =3D static_cast<Char>(d[1]);
-+  return out;
- }
-=20
- // A floating-point number f * pow(2, e) where F is an unsigned type.
-@@ -1695,7 +1565,7 @@ using fp =3D basic_fp<unsigned long long>;
-=20
- // Normalizes the value converted from double and multiplied by (1 << S=
HIFT).
- template <int SHIFT =3D 0, typename F>
--FMT_CONSTEXPR basic_fp<F> normalize(basic_fp<F> value) {
-+FMT_CONSTEXPR auto normalize(basic_fp<F> value) -> basic_fp<F> {
-   // Handle subnormals.
-   const auto implicit_bit =3D F(1) << num_significand_bits<double>();
-   const auto shifted_implicit_bit =3D implicit_bit << SHIFT;
-@@ -1712,7 +1582,7 @@ FMT_CONSTEXPR basic_fp<F> normalize(basic_fp<F> va=
lue) {
- }
-=20
- // Computes lhs * rhs / pow(2, 64) rounded to nearest with half-up tie =
breaking.
--FMT_CONSTEXPR inline uint64_t multiply(uint64_t lhs, uint64_t rhs) {
-+FMT_CONSTEXPR inline auto multiply(uint64_t lhs, uint64_t rhs) -> uint6=
4_t {
- #if FMT_USE_INT128
-   auto product =3D static_cast<__uint128_t>(lhs) * rhs;
-   auto f =3D static_cast<uint64_t>(product >> 64);
-@@ -1729,191 +1599,82 @@ FMT_CONSTEXPR inline uint64_t multiply(uint64_t=
 lhs, uint64_t rhs) {
- #endif
- }
-=20
--FMT_CONSTEXPR inline fp operator*(fp x, fp y) {
-+FMT_CONSTEXPR inline auto operator*(fp x, fp y) -> fp {
-   return {multiply(x.f, y.f), x.e + y.e + 64};
- }
-=20
--template <typename T =3D void> struct basic_data {
--  // Normalized 64-bit significands of pow(10, k), for k =3D -348, -340=
, ..., 340.
--  // These are generated by support/compute-powers.py.
--  static constexpr uint64_t pow10_significands[87] =3D {
--      0xfa8fd5a0081c0288, 0xbaaee17fa23ebf76, 0x8b16fb203055ac76,
--      0xcf42894a5dce35ea, 0x9a6bb0aa55653b2d, 0xe61acf033d1a45df,
--      0xab70fe17c79ac6ca, 0xff77b1fcbebcdc4f, 0xbe5691ef416bd60c,
--      0x8dd01fad907ffc3c, 0xd3515c2831559a83, 0x9d71ac8fada6c9b5,
--      0xea9c227723ee8bcb, 0xaecc49914078536d, 0x823c12795db6ce57,
--      0xc21094364dfb5637, 0x9096ea6f3848984f, 0xd77485cb25823ac7,
--      0xa086cfcd97bf97f4, 0xef340a98172aace5, 0xb23867fb2a35b28e,
--      0x84c8d4dfd2c63f3b, 0xc5dd44271ad3cdba, 0x936b9fcebb25c996,
--      0xdbac6c247d62a584, 0xa3ab66580d5fdaf6, 0xf3e2f893dec3f126,
--      0xb5b5ada8aaff80b8, 0x87625f056c7c4a8b, 0xc9bcff6034c13053,
--      0x964e858c91ba2655, 0xdff9772470297ebd, 0xa6dfbd9fb8e5b88f,
--      0xf8a95fcf88747d94, 0xb94470938fa89bcf, 0x8a08f0f8bf0f156b,
--      0xcdb02555653131b6, 0x993fe2c6d07b7fac, 0xe45c10c42a2b3b06,
--      0xaa242499697392d3, 0xfd87b5f28300ca0e, 0xbce5086492111aeb,
--      0x8cbccc096f5088cc, 0xd1b71758e219652c, 0x9c40000000000000,
--      0xe8d4a51000000000, 0xad78ebc5ac620000, 0x813f3978f8940984,
--      0xc097ce7bc90715b3, 0x8f7e32ce7bea5c70, 0xd5d238a4abe98068,
--      0x9f4f2726179a2245, 0xed63a231d4c4fb27, 0xb0de65388cc8ada8,
--      0x83c7088e1aab65db, 0xc45d1df942711d9a, 0x924d692ca61be758,
--      0xda01ee641a708dea, 0xa26da3999aef774a, 0xf209787bb47d6b85,
--      0xb454e4a179dd1877, 0x865b86925b9bc5c2, 0xc83553c5c8965d3d,
--      0x952ab45cfa97a0b3, 0xde469fbd99a05fe3, 0xa59bc234db398c25,
--      0xf6c69a72a3989f5c, 0xb7dcbf5354e9bece, 0x88fcf317f22241e2,
--      0xcc20ce9bd35c78a5, 0x98165af37b2153df, 0xe2a0b5dc971f303a,
--      0xa8d9d1535ce3b396, 0xfb9b7cd9a4a7443c, 0xbb764c4ca7a44410,
--      0x8bab8eefb6409c1a, 0xd01fef10a657842c, 0x9b10a4e5e9913129,
--      0xe7109bfba19c0c9d, 0xac2820d9623bf429, 0x80444b5e7aa7cf85,
--      0xbf21e44003acdd2d, 0x8e679c2f5e44ff8f, 0xd433179d9c8cb841,
--      0x9e19db92b4e31ba9, 0xeb96bf6ebadf77d9, 0xaf87023b9bf0ee6b,
--  };
--
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 409
--#  pragma GCC diagnostic push
--#  pragma GCC diagnostic ignored "-Wnarrowing"
--#endif
--  // Binary exponents of pow(10, k), for k =3D -348, -340, ..., 340, co=
rresponding
--  // to significands above.
--  static constexpr int16_t pow10_exponents[87] =3D {
--      -1220, -1193, -1166, -1140, -1113, -1087, -1060, -1034, -1007, -9=
80, -954,
--      -927,  -901,  -874,  -847,  -821,  -794,  -768,  -741,  -715,  -6=
88, -661,
--      -635,  -608,  -582,  -555,  -529,  -502,  -475,  -449,  -422,  -3=
96, -369,
--      -343,  -316,  -289,  -263,  -236,  -210,  -183,  -157,  -130,  -1=
03, -77,
--      -50,   -24,   3,     30,    56,    83,    109,   136,   162,   18=
9,  216,
--      242,   269,   295,   322,   348,   375,   402,   428,   455,   48=
1,  508,
--      534,   561,   588,   614,   641,   667,   694,   720,   747,   77=
4,  800,
--      827,   853,   880,   907,   933,   960,   986,   1013,  1039,  10=
66};
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 409
--#  pragma GCC diagnostic pop
--#endif
--
--  static constexpr uint64_t power_of_10_64[20] =3D {
--      1, FMT_POWERS_OF_10(1ULL), FMT_POWERS_OF_10(1000000000ULL),
--      10000000000000000000ULL};
--
--  // For checking rounding thresholds.
--  // The kth entry is chosen to be the smallest integer such that the
--  // upper 32-bits of 10^(k+1) times it is strictly bigger than 5 * 10^=
k.
--  static constexpr uint32_t fractional_part_rounding_thresholds[8] =3D =
{
--      2576980378,  // ceil(2^31 + 2^32/10^1)
--      2190433321,  // ceil(2^31 + 2^32/10^2)
--      2151778616,  // ceil(2^31 + 2^32/10^3)
--      2147913145,  // ceil(2^31 + 2^32/10^4)
--      2147526598,  // ceil(2^31 + 2^32/10^5)
--      2147487943,  // ceil(2^31 + 2^32/10^6)
--      2147484078,  // ceil(2^31 + 2^32/10^7)
--      2147483691   // ceil(2^31 + 2^32/10^8)
--  };
--};
--
--#if FMT_CPLUSPLUS < 201703L
--template <typename T> constexpr uint64_t basic_data<T>::pow10_significa=
nds[];
--template <typename T> constexpr int16_t basic_data<T>::pow10_exponents[=
];
--template <typename T> constexpr uint64_t basic_data<T>::power_of_10_64[=
];
--template <typename T>
--constexpr uint32_t basic_data<T>::fractional_part_rounding_thresholds[]=
;
--#endif
--
--// This is a struct rather than an alias to avoid shadowing warnings in=
 gcc.
--struct data : basic_data<> {};
--
--// Returns a cached power of 10 `c_k =3D c_k.f * pow(2, c_k.e)` such th=
at its
--// (binary) exponent satisfies `min_exponent <=3D c_k.e <=3D min_expone=
nt + 28`.
--FMT_CONSTEXPR inline fp get_cached_power(int min_exponent,
--                                         int& pow10_exponent) {
--  const int shift =3D 32;
--  // log10(2) =3D 0x0.4d104d427de7fbcc...
--  const int64_t significand =3D 0x4d104d427de7fbcc;
--  int index =3D static_cast<int>(
--      ((min_exponent + fp::num_significand_bits - 1) * (significand >> =
shift) +
--       ((int64_t(1) << shift) - 1))  // ceil
--      >> 32                          // arithmetic shift
--  );
--  // Decimal exponent of the first (smallest) cached power of 10.
--  const int first_dec_exp =3D -348;
--  // Difference between 2 consecutive decimal exponents in cached power=
s of 10.
--  const int dec_exp_step =3D 8;
--  index =3D (index - first_dec_exp - 1) / dec_exp_step + 1;
--  pow10_exponent =3D first_dec_exp + index * dec_exp_step;
--  // Using *(x + index) instead of x[index] avoids an issue with some c=
ompilers
--  // using the EDG frontend (e.g. nvhpc/22.3 in C++17 mode).
--  return {*(data::pow10_significands + index),
--          *(data::pow10_exponents + index)};
--}
--
--template <typename T>
-+template <typename T, bool doublish =3D num_bits<T>() =3D=3D num_bits<d=
ouble>()>
- using convert_float_result =3D
--    conditional_t<std::is_same<T, float>::value ||
--                      std::numeric_limits<T>::digits =3D=3D
--                          std::numeric_limits<double>::digits,
--                  double, T>;
-+    conditional_t<std::is_same<T, float>::value || doublish, double, T>=
;
-=20
- template <typename T>
- constexpr auto convert_float(T value) -> convert_float_result<T> {
-   return static_cast<convert_float_result<T>>(value);
- }
-=20
--template <typename OutputIt, typename Char>
-+template <typename Char, typename OutputIt>
- FMT_NOINLINE FMT_CONSTEXPR auto fill(OutputIt it, size_t n,
--                                     const fill_t<Char>& fill) -> Outpu=
tIt {
--  auto fill_size =3D fill.size();
--  if (fill_size =3D=3D 1) return detail::fill_n(it, n, fill[0]);
--  auto data =3D fill.data();
--  for (size_t i =3D 0; i < n; ++i)
--    it =3D copy_str<Char>(data, data + fill_size, it);
-+                                     const basic_specs& specs) -> Outpu=
tIt {
-+  auto fill_size =3D specs.fill_size();
-+  if (fill_size =3D=3D 1) return detail::fill_n(it, n, specs.fill_unit<=
Char>());
-+  if (const Char* data =3D specs.fill<Char>()) {
-+    for (size_t i =3D 0; i < n; ++i) it =3D copy<Char>(data, data + fil=
l_size, it);
-+  }
-   return it;
- }
-=20
- // Writes the output of f, padded according to format specifications in=
 specs.
- // size: output size in code units.
- // width: output display width in (terminal) column positions.
--template <align::type align =3D align::left, typename OutputIt, typenam=
e Char,
-+template <typename Char, align default_align =3D align::left, typename =
OutputIt,
-           typename F>
--FMT_CONSTEXPR auto write_padded(OutputIt out, const format_specs<Char>&=
 specs,
-+FMT_CONSTEXPR auto write_padded(OutputIt out, const format_specs& specs=
,
-                                 size_t size, size_t width, F&& f) -> Ou=
tputIt {
--  static_assert(align =3D=3D align::left || align =3D=3D align::right, =
"");
-+  static_assert(default_align =3D=3D align::left || default_align =3D=3D=
 align::right,
-+                "");
-   unsigned spec_width =3D to_unsigned(specs.width);
-   size_t padding =3D spec_width > width ? spec_width - width : 0;
-   // Shifts are encoded as string literals because static constexpr is =
not
-   // supported in constexpr functions.
--  auto* shifts =3D align =3D=3D align::left ? "\x1f\x1f\x00\x01" : "\x0=
0\x1f\x00\x01";
--  size_t left_padding =3D padding >> shifts[specs.align];
-+  auto* shifts =3D
-+      default_align =3D=3D align::left ? "\x1f\x1f\x00\x01" : "\x00\x1f=
\x00\x01";
-+  size_t left_padding =3D padding >> shifts[static_cast<int>(specs.alig=
n())];
-   size_t right_padding =3D padding - left_padding;
--  auto it =3D reserve(out, size + padding * specs.fill.size());
--  if (left_padding !=3D 0) it =3D fill(it, left_padding, specs.fill);
-+  auto it =3D reserve(out, size + padding * specs.fill_size());
-+  if (left_padding !=3D 0) it =3D fill<Char>(it, left_padding, specs);
-   it =3D f(it);
--  if (right_padding !=3D 0) it =3D fill(it, right_padding, specs.fill);
-+  if (right_padding !=3D 0) it =3D fill<Char>(it, right_padding, specs)=
;
-   return base_iterator(out, it);
- }
-=20
--template <align::type align =3D align::left, typename OutputIt, typenam=
e Char,
-+template <typename Char, align default_align =3D align::left, typename =
OutputIt,
-           typename F>
--constexpr auto write_padded(OutputIt out, const format_specs<Char>& spe=
cs,
-+constexpr auto write_padded(OutputIt out, const format_specs& specs,
-                             size_t size, F&& f) -> OutputIt {
--  return write_padded<align>(out, specs, size, size, f);
-+  return write_padded<Char, default_align>(out, specs, size, size, f);
- }
-=20
--template <align::type align =3D align::left, typename Char, typename Ou=
tputIt>
-+template <typename Char, align default_align =3D align::left, typename =
OutputIt>
- FMT_CONSTEXPR auto write_bytes(OutputIt out, string_view bytes,
--                               const format_specs<Char>& specs) -> Outp=
utIt {
--  return write_padded<align>(
-+                               const format_specs& specs =3D {}) -> Out=
putIt {
-+  return write_padded<Char, default_align>(
-       out, specs, bytes.size(), [bytes](reserve_iterator<OutputIt> it) =
{
-         const char* data =3D bytes.data();
--        return copy_str<Char>(data, data + bytes.size(), it);
-+        return copy<Char>(data, data + bytes.size(), it);
-       });
- }
-=20
- template <typename Char, typename OutputIt, typename UIntPtr>
--auto write_ptr(OutputIt out, UIntPtr value, const format_specs<Char>* s=
pecs)
-+auto write_ptr(OutputIt out, UIntPtr value, const format_specs* specs)
-     -> OutputIt {
-   int num_digits =3D count_digits<4>(value);
-   auto size =3D to_unsigned(num_digits) + size_t(2);
-   auto write =3D [=3D](reserve_iterator<OutputIt> it) {
-     *it++ =3D static_cast<Char>('0');
-     *it++ =3D static_cast<Char>('x');
--    return format_uint<4, Char>(it, value, num_digits);
-+    return format_base2e<Char>(4, it, value, num_digits);
-   };
--  return specs ? write_padded<align::right>(out, *specs, size, write)
-+  return specs ? write_padded<Char, align::right>(out, *specs, size, wr=
ite)
-                : base_iterator(out, write(reserve(out, size)));
- }
-=20
-@@ -1921,8 +1682,9 @@ auto write_ptr(OutputIt out, UIntPtr value, const =
format_specs<Char>* specs)
- FMT_API auto is_printable(uint32_t cp) -> bool;
-=20
- inline auto needs_escape(uint32_t cp) -> bool {
--  return cp < 0x20 || cp =3D=3D 0x7f || cp =3D=3D '"' || cp =3D=3D '\\'=
 ||
--         !is_printable(cp);
-+  if (cp < 0x20 || cp =3D=3D 0x7f || cp =3D=3D '"' || cp =3D=3D '\\') r=
eturn true;
-+  if (const_check(FMT_OPTIMIZE_SIZE > 1)) return false;
-+  return !is_printable(cp);
- }
-=20
- template <typename Char> struct find_escape_result {
-@@ -1931,17 +1693,11 @@ template <typename Char> struct find_escape_resu=
lt {
-   uint32_t cp;
- };
-=20
--template <typename Char>
--using make_unsigned_char =3D
--    typename conditional_t<std::is_integral<Char>::value,
--                           std::make_unsigned<Char>,
--                           type_identity<uint32_t>>::type;
--
- template <typename Char>
- auto find_escape(const Char* begin, const Char* end)
-     -> find_escape_result<Char> {
-   for (; begin !=3D end; ++begin) {
--    uint32_t cp =3D static_cast<make_unsigned_char<Char>>(*begin);
-+    uint32_t cp =3D static_cast<unsigned_char<Char>>(*begin);
-     if (const_check(sizeof(Char) =3D=3D 1) && cp >=3D 0x80) continue;
-     if (needs_escape(cp)) return {begin, begin + 1, cp};
-   }
-@@ -1950,7 +1706,7 @@ auto find_escape(const Char* begin, const Char* en=
d)
-=20
- inline auto find_escape(const char* begin, const char* end)
-     -> find_escape_result<char> {
--  if (!is_utf8()) return find_escape<char>(begin, end);
-+  if (const_check(!use_utf8)) return find_escape<char>(begin, end);
-   auto result =3D find_escape_result<char>{end, nullptr, 0};
-   for_each_codepoint(string_view(begin, to_unsigned(end - begin)),
-                      [&](uint32_t cp, string_view sv) {
-@@ -1963,40 +1719,14 @@ inline auto find_escape(const char* begin, const=
 char* end)
-   return result;
- }
-=20
--#define FMT_STRING_IMPL(s, base, explicit)                             =
       \
--  [] {                                                                 =
       \
--    /* Use the hidden visibility as a workaround for a GCC bug (#1973).=
 */    \
--    /* Use a macro-like name to avoid shadowing warnings. */           =
       \
--    struct FMT_VISIBILITY("hidden") FMT_COMPILE_STRING : base {        =
       \
--      using char_type FMT_MAYBE_UNUSED =3D fmt::remove_cvref_t<decltype=
(s[0])>; \
--      FMT_MAYBE_UNUSED FMT_CONSTEXPR explicit                          =
       \
--      operator fmt::basic_string_view<char_type>() const {             =
       \
--        return fmt::detail_exported::compile_string_to_view<char_type>(=
s);    \
--      }                                                                =
       \
--    };                                                                 =
       \
--    return FMT_COMPILE_STRING();                                       =
       \
--  }()
--
--/**
--  \rst
--  Constructs a compile-time format string from a string literal *s*.
--
--  **Example**::
--
--    // A compile-time error because 'd' is an invalid specifier for str=
ings.
--    std::string s =3D fmt::format(FMT_STRING("{:d}"), "foo");
--  \endrst
-- */
--#define FMT_STRING(s) FMT_STRING_IMPL(s, fmt::detail::compile_string, )
--
- template <size_t width, typename Char, typename OutputIt>
- auto write_codepoint(OutputIt out, char prefix, uint32_t cp) -> OutputI=
t {
-   *out++ =3D static_cast<Char>('\\');
-   *out++ =3D static_cast<Char>(prefix);
-   Char buf[width];
-   fill_n(buf, width, static_cast<Char>('0'));
--  format_uint<4>(buf, cp, width);
--  return copy_str<Char>(buf, buf + width, out);
-+  format_base2e(4, buf, cp, width);
-+  return copy<Char>(buf, buf + width, out);
- }
-=20
- template <typename OutputIt, typename Char>
-@@ -2016,23 +1746,15 @@ auto write_escaped_cp(OutputIt out, const find_e=
scape_result<Char>& escape)
-     *out++ =3D static_cast<Char>('\\');
-     c =3D static_cast<Char>('t');
-     break;
--  case '"':
--    FMT_FALLTHROUGH;
--  case '\'':
--    FMT_FALLTHROUGH;
--  case '\\':
--    *out++ =3D static_cast<Char>('\\');
--    break;
-+  case '"':  FMT_FALLTHROUGH;
-+  case '\'': FMT_FALLTHROUGH;
-+  case '\\': *out++ =3D static_cast<Char>('\\'); break;
-   default:
--    if (escape.cp < 0x100) {
--      return write_codepoint<2, Char>(out, 'x', escape.cp);
--    }
--    if (escape.cp < 0x10000) {
-+    if (escape.cp < 0x100) return write_codepoint<2, Char>(out, 'x', es=
cape.cp);
-+    if (escape.cp < 0x10000)
-       return write_codepoint<4, Char>(out, 'u', escape.cp);
--    }
--    if (escape.cp < 0x110000) {
-+    if (escape.cp < 0x110000)
-       return write_codepoint<8, Char>(out, 'U', escape.cp);
--    }
-     for (Char escape_char : basic_string_view<Char>(
-              escape.begin, to_unsigned(escape.end - escape.begin))) {
-       out =3D write_codepoint<2, Char>(out, 'x',
-@@ -2051,7 +1773,7 @@ auto write_escaped_string(OutputIt out, basic_stri=
ng_view<Char> str)
-   auto begin =3D str.begin(), end =3D str.end();
-   do {
-     auto escape =3D find_escape(begin, end);
--    out =3D copy_str<Char>(begin, escape.begin, out);
-+    out =3D copy<Char>(begin, escape.begin, out);
-     begin =3D escape.end;
-     if (!begin) break;
-     out =3D write_escaped_cp<OutputIt, Char>(out, escape);
-@@ -2062,11 +1784,13 @@ auto write_escaped_string(OutputIt out, basic_st=
ring_view<Char> str)
-=20
- template <typename Char, typename OutputIt>
- auto write_escaped_char(OutputIt out, Char v) -> OutputIt {
-+  Char v_array[1] =3D {v};
-   *out++ =3D static_cast<Char>('\'');
-   if ((needs_escape(static_cast<uint32_t>(v)) && v !=3D static_cast<Cha=
r>('"')) ||
-       v =3D=3D static_cast<Char>('\'')) {
--    out =3D write_escaped_cp(
--        out, find_escape_result<Char>{&v, &v + 1, static_cast<uint32_t>=
(v)});
-+    out =3D write_escaped_cp(out,
-+                           find_escape_result<Char>{v_array, v_array + =
1,
-+                                                    static_cast<uint32_=
t>(v)});
-   } else {
-     *out++ =3D v;
-   }
-@@ -2076,74 +1800,23 @@ auto write_escaped_char(OutputIt out, Char v) ->=
 OutputIt {
-=20
- template <typename Char, typename OutputIt>
- FMT_CONSTEXPR auto write_char(OutputIt out, Char value,
--                              const format_specs<Char>& specs) -> Outpu=
tIt {
--  bool is_debug =3D specs.type =3D=3D presentation_type::debug;
--  return write_padded(out, specs, 1, [=3D](reserve_iterator<OutputIt> i=
t) {
-+                              const format_specs& specs) -> OutputIt {
-+  bool is_debug =3D specs.type() =3D=3D presentation_type::debug;
-+  return write_padded<Char>(out, specs, 1, [=3D](reserve_iterator<Outpu=
tIt> it) {
-     if (is_debug) return write_escaped_char(it, value);
-     *it++ =3D value;
-     return it;
-   });
- }
- template <typename Char, typename OutputIt>
--FMT_CONSTEXPR auto write(OutputIt out, Char value,
--                         const format_specs<Char>& specs, locale_ref lo=
c =3D {})
--    -> OutputIt {
-+FMT_CONSTEXPR auto write(OutputIt out, Char value, const format_specs& =
specs,
-+                         locale_ref loc =3D {}) -> OutputIt {
-   // char is formatted as unsigned char for consistency across platform=
s.
-   using unsigned_type =3D
-       conditional_t<std::is_same<Char, char>::value, unsigned char, uns=
igned>;
-   return check_char_specs(specs)
--             ? write_char(out, value, specs)
--             : write(out, static_cast<unsigned_type>(value), specs, loc=
);
--}
--
--// Data for write_int that doesn't depend on output iterator type. It i=
s used to
--// avoid template code bloat.
--template <typename Char> struct write_int_data {
--  size_t size;
--  size_t padding;
--
--  FMT_CONSTEXPR write_int_data(int num_digits, unsigned prefix,
--                               const format_specs<Char>& specs)
--      : size((prefix >> 24) + to_unsigned(num_digits)), padding(0) {
--    if (specs.align =3D=3D align::numeric) {
--      auto width =3D to_unsigned(specs.width);
--      if (width > size) {
--        padding =3D width - size;
--        size =3D width;
--      }
--    } else if (specs.precision > num_digits) {
--      size =3D (prefix >> 24) + to_unsigned(specs.precision);
--      padding =3D to_unsigned(specs.precision - num_digits);
--    }
--  }
--};
--
--// Writes an integer in the format
--//   <left-padding><prefix><numeric-padding><digits><right-padding>
--// where <digits> are written by write_digits(it).
--// prefix contains chars in three lower bytes and the size in the fourt=
h byte.
--template <typename OutputIt, typename Char, typename W>
--FMT_CONSTEXPR FMT_INLINE auto write_int(OutputIt out, int num_digits,
--                                        unsigned prefix,
--                                        const format_specs<Char>& specs=
,
--                                        W write_digits) -> OutputIt {
--  // Slightly faster check for specs.width =3D=3D 0 && specs.precision =
=3D=3D -1.
--  if ((specs.width | (specs.precision + 1)) =3D=3D 0) {
--    auto it =3D reserve(out, to_unsigned(num_digits) + (prefix >> 24));
--    if (prefix !=3D 0) {
--      for (unsigned p =3D prefix & 0xffffff; p !=3D 0; p >>=3D 8)
--        *it++ =3D static_cast<Char>(p & 0xff);
--    }
--    return base_iterator(out, write_digits(it));
--  }
--  auto data =3D write_int_data<Char>(num_digits, prefix, specs);
--  return write_padded<align::right>(
--      out, specs, data.size, [=3D](reserve_iterator<OutputIt> it) {
--        for (unsigned p =3D prefix & 0xffffff; p !=3D 0; p >>=3D 8)
--          *it++ =3D static_cast<Char>(p & 0xff);
--        it =3D detail::fill_n(it, data.padding, static_cast<Char>('0'))=
;
--        return write_digits(it);
--      });
-+             ? write_char<Char>(out, value, specs)
-+             : write<Char>(out, static_cast<unsigned_type>(value), spec=
s, loc);
- }
-=20
- template <typename Char> class digit_grouping {
-@@ -2155,10 +1828,10 @@ template <typename Char> class digit_grouping {
-     std::string::const_iterator group;
-     int pos;
-   };
--  next_state initial_state() const { return {grouping_.begin(), 0}; }
-+  auto initial_state() const -> next_state { return {grouping_.begin(),=
 0}; }
-=20
-   // Returns the next digit group separator position.
--  int next(next_state& state) const {
-+  auto next(next_state& state) const -> int {
-     if (thousands_sep_.empty()) return max_value<int>();
-     if (state.group =3D=3D grouping_.end()) return state.pos +=3D group=
ing_.back();
-     if (*state.group <=3D 0 || *state.group =3D=3D max_value<char>())
-@@ -2168,7 +1841,9 @@ template <typename Char> class digit_grouping {
-   }
-=20
-  public:
--  explicit digit_grouping(locale_ref loc, bool localized =3D true) {
-+  template <typename Locale,
-+            FMT_ENABLE_IF(std::is_same<Locale, locale_ref>::value)>
-+  explicit digit_grouping(Locale loc, bool localized =3D true) {
-     if (!localized) return;
-     auto sep =3D thousands_sep<Char>(loc);
-     grouping_ =3D sep.grouping;
-@@ -2177,9 +1852,9 @@ template <typename Char> class digit_grouping {
-   digit_grouping(std::string grouping, std::basic_string<Char> sep)
-       : grouping_(std::move(grouping)), thousands_sep_(std::move(sep)) =
{}
-=20
--  bool has_separator() const { return !thousands_sep_.empty(); }
-+  auto has_separator() const -> bool { return !thousands_sep_.empty(); =
}
-=20
--  int count_separators(int num_digits) const {
-+  auto count_separators(int num_digits) const -> int {
-     int count =3D 0;
-     auto state =3D initial_state();
-     while (num_digits > next(state)) ++count;
-@@ -2188,7 +1863,7 @@ template <typename Char> class digit_grouping {
-=20
-   // Applies grouping to digits and write the output to out.
-   template <typename Out, typename C>
--  Out apply(Out out, basic_string_view<C> digits) const {
-+  auto apply(Out out, basic_string_view<C> digits) const -> Out {
-     auto num_digits =3D static_cast<int>(digits.size());
-     auto separators =3D basic_memory_buffer<int>();
-     separators.push_back(0);
-@@ -2200,9 +1875,8 @@ template <typename Char> class digit_grouping {
-     for (int i =3D 0, sep_index =3D static_cast<int>(separators.size() =
- 1);
-          i < num_digits; ++i) {
-       if (num_digits - i =3D=3D separators[sep_index]) {
--        out =3D
--            copy_str<Char>(thousands_sep_.data(),
--                           thousands_sep_.data() + thousands_sep_.size(=
), out);
-+        out =3D copy<Char>(thousands_sep_.data(),
-+                         thousands_sep_.data() + thousands_sep_.size(),=
 out);
-         --sep_index;
-       }
-       *out++ =3D static_cast<Char>(digits[to_unsigned(i)]);
-@@ -2211,48 +1885,78 @@ template <typename Char> class digit_grouping {
-   }
- };
-=20
-+FMT_CONSTEXPR inline void prefix_append(unsigned& prefix, unsigned valu=
e) {
-+  prefix |=3D prefix !=3D 0 ? value << 8 : value;
-+  prefix +=3D (1u + (value > 0xff ? 1 : 0)) << 24;
-+}
-+
- // Writes a decimal integer with digit grouping.
- template <typename OutputIt, typename UInt, typename Char>
- auto write_int(OutputIt out, UInt value, unsigned prefix,
--               const format_specs<Char>& specs,
--               const digit_grouping<Char>& grouping) -> OutputIt {
-+               const format_specs& specs, const digit_grouping<Char>& g=
rouping)
-+    -> OutputIt {
-   static_assert(std::is_same<uint64_or_128_t<UInt>, UInt>::value, "");
--  int num_digits =3D count_digits(value);
--  char digits[40];
--  format_decimal(digits, value, num_digits);
--  unsigned size =3D to_unsigned((prefix !=3D 0 ? 1 : 0) + num_digits +
--                              grouping.count_separators(num_digits));
--  return write_padded<align::right>(
-+  int num_digits =3D 0;
-+  auto buffer =3D memory_buffer();
-+  switch (specs.type()) {
-+  default: FMT_ASSERT(false, ""); FMT_FALLTHROUGH;
-+  case presentation_type::none:
-+  case presentation_type::dec:
-+    num_digits =3D count_digits(value);
-+    format_decimal<char>(appender(buffer), value, num_digits);
-+    break;
-+  case presentation_type::hex:
-+    if (specs.alt())
-+      prefix_append(prefix, unsigned(specs.upper() ? 'X' : 'x') << 8 | =
'0');
-+    num_digits =3D count_digits<4>(value);
-+    format_base2e<char>(4, appender(buffer), value, num_digits, specs.u=
pper());
-+    break;
-+  case presentation_type::oct:
-+    num_digits =3D count_digits<3>(value);
-+    // Octal prefix '0' is counted as a digit, so only add it if precis=
ion
-+    // is not greater than the number of digits.
-+    if (specs.alt() && specs.precision <=3D num_digits && value !=3D 0)
-+      prefix_append(prefix, '0');
-+    format_base2e<char>(3, appender(buffer), value, num_digits);
-+    break;
-+  case presentation_type::bin:
-+    if (specs.alt())
-+      prefix_append(prefix, unsigned(specs.upper() ? 'B' : 'b') << 8 | =
'0');
-+    num_digits =3D count_digits<1>(value);
-+    format_base2e<char>(1, appender(buffer), value, num_digits);
-+    break;
-+  case presentation_type::chr:
-+    return write_char<Char>(out, static_cast<Char>(value), specs);
-+  }
-+
-+  unsigned size =3D (prefix !=3D 0 ? prefix >> 24 : 0) + to_unsigned(nu=
m_digits) +
-+                  to_unsigned(grouping.count_separators(num_digits));
-+  return write_padded<Char, align::right>(
-       out, specs, size, size, [&](reserve_iterator<OutputIt> it) {
--        if (prefix !=3D 0) {
--          char sign =3D static_cast<char>(prefix);
--          *it++ =3D static_cast<Char>(sign);
--        }
--        return grouping.apply(it, string_view(digits, to_unsigned(num_d=
igits)));
-+        for (unsigned p =3D prefix & 0xffffff; p !=3D 0; p >>=3D 8)
-+          *it++ =3D static_cast<Char>(p & 0xff);
-+        return grouping.apply(it, string_view(buffer.data(), buffer.siz=
e()));
-       });
- }
-=20
-+#if FMT_USE_LOCALE
- // Writes a localized value.
--FMT_API auto write_loc(appender out, loc_value value,
--                       const format_specs<>& specs, locale_ref loc) -> =
bool;
--template <typename OutputIt, typename Char>
--inline auto write_loc(OutputIt, loc_value, const format_specs<Char>&,
-+FMT_API auto write_loc(appender out, loc_value value, const format_spec=
s& specs,
-+                       locale_ref loc) -> bool;
-+#endif
-+template <typename OutputIt>
-+inline auto write_loc(OutputIt, const loc_value&, const format_specs&,
-                       locale_ref) -> bool {
-   return false;
- }
-=20
--FMT_CONSTEXPR inline void prefix_append(unsigned& prefix, unsigned valu=
e) {
--  prefix |=3D prefix !=3D 0 ? value << 8 : value;
--  prefix +=3D (1u + (value > 0xff ? 1 : 0)) << 24;
--}
--
- template <typename UInt> struct write_int_arg {
-   UInt abs_value;
-   unsigned prefix;
- };
-=20
- template <typename T>
--FMT_CONSTEXPR auto make_write_int_arg(T value, sign_t sign)
-+FMT_CONSTEXPR auto make_write_int_arg(T value, sign s)
-     -> write_int_arg<uint32_or_64_or_128_t<T>> {
-   auto prefix =3D 0u;
-   auto abs_value =3D static_cast<uint32_or_64_or_128_t<T>>(value);
-@@ -2262,21 +1966,21 @@ FMT_CONSTEXPR auto make_write_int_arg(T value, s=
ign_t sign)
-   } else {
-     constexpr const unsigned prefixes[4] =3D {0, 0, 0x1000000u | '+',
-                                             0x1000000u | ' '};
--    prefix =3D prefixes[sign];
-+    prefix =3D prefixes[static_cast<int>(s)];
-   }
-   return {abs_value, prefix};
- }
-=20
- template <typename Char =3D char> struct loc_writer {
--  buffer_appender<Char> out;
--  const format_specs<Char>& specs;
-+  basic_appender<Char> out;
-+  const format_specs& specs;
-   std::basic_string<Char> sep;
-   std::string grouping;
-   std::basic_string<Char> decimal_point;
-=20
-   template <typename T, FMT_ENABLE_IF(is_integer<T>::value)>
-   auto operator()(T value) -> bool {
--    auto arg =3D make_write_int_arg(value, specs.sign);
-+    auto arg =3D make_write_int_arg(value, specs.sign());
-     write_int(out, static_cast<uint64_or_128_t<T>>(arg.abs_value), arg.=
prefix,
-               specs, digit_grouping<Char>(grouping, sep));
-     return true;
-@@ -2288,166 +1992,162 @@ template <typename Char =3D char> struct loc_w=
riter {
-   }
- };
-=20
-+// Size and padding computation separate from write_int to avoid templa=
te bloat.
-+struct size_padding {
-+  unsigned size;
-+  unsigned padding;
-+
-+  FMT_CONSTEXPR size_padding(int num_digits, unsigned prefix,
-+                             const format_specs& specs)
-+      : size((prefix >> 24) + to_unsigned(num_digits)), padding(0) {
-+    if (specs.align() =3D=3D align::numeric) {
-+      auto width =3D to_unsigned(specs.width);
-+      if (width > size) {
-+        padding =3D width - size;
-+        size =3D width;
-+      }
-+    } else if (specs.precision > num_digits) {
-+      size =3D (prefix >> 24) + to_unsigned(specs.precision);
-+      padding =3D to_unsigned(specs.precision - num_digits);
-+    }
-+  }
-+};
-+
- template <typename Char, typename OutputIt, typename T>
- FMT_CONSTEXPR FMT_INLINE auto write_int(OutputIt out, write_int_arg<T> =
arg,
--                                        const format_specs<Char>& specs=
,
--                                        locale_ref) -> OutputIt {
-+                                        const format_specs& specs) -> O=
utputIt {
-   static_assert(std::is_same<T, uint32_or_64_or_128_t<T>>::value, "");
-+
-+  constexpr int buffer_size =3D num_bits<T>();
-+  char buffer[buffer_size];
-+  if (is_constant_evaluated()) fill_n(buffer, buffer_size, '\0');
-+  const char* begin =3D nullptr;
-+  const char* end =3D buffer + buffer_size;
-+
-   auto abs_value =3D arg.abs_value;
-   auto prefix =3D arg.prefix;
--  switch (specs.type) {
-+  switch (specs.type()) {
-+  default: FMT_ASSERT(false, ""); FMT_FALLTHROUGH;
-   case presentation_type::none:
--  case presentation_type::dec: {
--    auto num_digits =3D count_digits(abs_value);
--    return write_int(
--        out, num_digits, prefix, specs, [=3D](reserve_iterator<OutputIt=
> it) {
--          return format_decimal<Char>(it, abs_value, num_digits).end;
--        });
--  }
--  case presentation_type::hex_lower:
--  case presentation_type::hex_upper: {
--    bool upper =3D specs.type =3D=3D presentation_type::hex_upper;
--    if (specs.alt)
--      prefix_append(prefix, unsigned(upper ? 'X' : 'x') << 8 | '0');
--    int num_digits =3D count_digits<4>(abs_value);
--    return write_int(
--        out, num_digits, prefix, specs, [=3D](reserve_iterator<OutputIt=
> it) {
--          return format_uint<4, Char>(it, abs_value, num_digits, upper)=
;
--        });
--  }
--  case presentation_type::bin_lower:
--  case presentation_type::bin_upper: {
--    bool upper =3D specs.type =3D=3D presentation_type::bin_upper;
--    if (specs.alt)
--      prefix_append(prefix, unsigned(upper ? 'B' : 'b') << 8 | '0');
--    int num_digits =3D count_digits<1>(abs_value);
--    return write_int(out, num_digits, prefix, specs,
--                     [=3D](reserve_iterator<OutputIt> it) {
--                       return format_uint<1, Char>(it, abs_value, num_d=
igits);
--                     });
--  }
-+  case presentation_type::dec:
-+    begin =3D do_format_decimal(buffer, abs_value, buffer_size);
-+    break;
-+  case presentation_type::hex:
-+    begin =3D do_format_base2e(4, buffer, abs_value, buffer_size, specs=
.upper());
-+    if (specs.alt())
-+      prefix_append(prefix, unsigned(specs.upper() ? 'X' : 'x') << 8 | =
'0');
-+    break;
-   case presentation_type::oct: {
--    int num_digits =3D count_digits<3>(abs_value);
-+    begin =3D do_format_base2e(3, buffer, abs_value, buffer_size);
-     // Octal prefix '0' is counted as a digit, so only add it if precis=
ion
-     // is not greater than the number of digits.
--    if (specs.alt && specs.precision <=3D num_digits && abs_value !=3D =
0)
-+    auto num_digits =3D end - begin;
-+    if (specs.alt() && specs.precision <=3D num_digits && abs_value !=3D=
 0)
-       prefix_append(prefix, '0');
--    return write_int(out, num_digits, prefix, specs,
--                     [=3D](reserve_iterator<OutputIt> it) {
--                       return format_uint<3, Char>(it, abs_value, num_d=
igits);
--                     });
-+    break;
-   }
-+  case presentation_type::bin:
-+    begin =3D do_format_base2e(1, buffer, abs_value, buffer_size);
-+    if (specs.alt())
-+      prefix_append(prefix, unsigned(specs.upper() ? 'B' : 'b') << 8 | =
'0');
-+    break;
-   case presentation_type::chr:
--    return write_char(out, static_cast<Char>(abs_value), specs);
--  default:
--    throw_format_error("invalid format specifier");
-+    return write_char<Char>(out, static_cast<Char>(abs_value), specs);
-   }
--  return out;
-+
-+  // Write an integer in the format
-+  //   <left-padding><prefix><numeric-padding><digits><right-padding>
-+  // prefix contains chars in three lower bytes and the size in the fou=
rth byte.
-+  int num_digits =3D static_cast<int>(end - begin);
-+  // Slightly faster check for specs.width =3D=3D 0 && specs.precision =
=3D=3D -1.
-+  if ((specs.width | (specs.precision + 1)) =3D=3D 0) {
-+    auto it =3D reserve(out, to_unsigned(num_digits) + (prefix >> 24));
-+    for (unsigned p =3D prefix & 0xffffff; p !=3D 0; p >>=3D 8)
-+      *it++ =3D static_cast<Char>(p & 0xff);
-+    return base_iterator(out, copy<Char>(begin, end, it));
-+  }
-+  auto sp =3D size_padding(num_digits, prefix, specs);
-+  unsigned padding =3D sp.padding;
-+  return write_padded<Char, align::right>(
-+      out, specs, sp.size, [=3D](reserve_iterator<OutputIt> it) {
-+        for (unsigned p =3D prefix & 0xffffff; p !=3D 0; p >>=3D 8)
-+          *it++ =3D static_cast<Char>(p & 0xff);
-+        it =3D detail::fill_n(it, padding, static_cast<Char>('0'));
-+        return copy<Char>(begin, end, it);
-+      });
- }
-+
- template <typename Char, typename OutputIt, typename T>
--FMT_CONSTEXPR FMT_NOINLINE auto write_int_noinline(
--    OutputIt out, write_int_arg<T> arg, const format_specs<Char>& specs=
,
--    locale_ref loc) -> OutputIt {
--  return write_int(out, arg, specs, loc);
-+FMT_CONSTEXPR FMT_NOINLINE auto write_int_noinline(OutputIt out,
-+                                                   write_int_arg<T> arg=
,
-+                                                   const format_specs& =
specs)
-+    -> OutputIt {
-+  return write_int<Char>(out, arg, specs);
- }
--template <typename Char, typename OutputIt, typename T,
-+
-+template <typename Char, typename T,
-           FMT_ENABLE_IF(is_integral<T>::value &&
-                         !std::is_same<T, bool>::value &&
--                        std::is_same<OutputIt, buffer_appender<Char>>::=
value)>
--FMT_CONSTEXPR FMT_INLINE auto write(OutputIt out, T value,
--                                    const format_specs<Char>& specs,
--                                    locale_ref loc) -> OutputIt {
--  if (specs.localized && write_loc(out, value, specs, loc)) return out;
--  return write_int_noinline(out, make_write_int_arg(value, specs.sign),=
 specs,
--                            loc);
-+                        !std::is_same<T, Char>::value)>
-+FMT_CONSTEXPR FMT_INLINE auto write(basic_appender<Char> out, T value,
-+                                    const format_specs& specs, locale_r=
ef loc)
-+    -> basic_appender<Char> {
-+  if (specs.localized() && write_loc(out, value, specs, loc)) return ou=
t;
-+  return write_int_noinline<Char>(out, make_write_int_arg(value, specs.=
sign()),
-+                                  specs);
- }
-+
- // An inlined version of write used in format string compilation.
- template <typename Char, typename OutputIt, typename T,
-           FMT_ENABLE_IF(is_integral<T>::value &&
-                         !std::is_same<T, bool>::value &&
--                        !std::is_same<OutputIt, buffer_appender<Char>>:=
:value)>
-+                        !std::is_same<T, Char>::value &&
-+                        !std::is_same<OutputIt, basic_appender<Char>>::=
value)>
- FMT_CONSTEXPR FMT_INLINE auto write(OutputIt out, T value,
--                                    const format_specs<Char>& specs,
--                                    locale_ref loc) -> OutputIt {
--  if (specs.localized && write_loc(out, value, specs, loc)) return out;
--  return write_int(out, make_write_int_arg(value, specs.sign), specs, l=
oc);
-+                                    const format_specs& specs, locale_r=
ef loc)
-+    -> OutputIt {
-+  if (specs.localized() && write_loc(out, value, specs, loc)) return ou=
t;
-+  return write_int<Char>(out, make_write_int_arg(value, specs.sign()), =
specs);
- }
-=20
--// An output iterator that counts the number of objects written to it a=
nd
--// discards them.
--class counting_iterator {
-- private:
--  size_t count_;
--
-- public:
--  using iterator_category =3D std::output_iterator_tag;
--  using difference_type =3D std::ptrdiff_t;
--  using pointer =3D void;
--  using reference =3D void;
--  FMT_UNCHECKED_ITERATOR(counting_iterator);
--
--  struct value_type {
--    template <typename T> FMT_CONSTEXPR void operator=3D(const T&) {}
--  };
--
--  FMT_CONSTEXPR counting_iterator() : count_(0) {}
--
--  FMT_CONSTEXPR size_t count() const { return count_; }
--
--  FMT_CONSTEXPR counting_iterator& operator++() {
--    ++count_;
--    return *this;
--  }
--  FMT_CONSTEXPR counting_iterator operator++(int) {
--    auto it =3D *this;
--    ++*this;
--    return it;
--  }
--
--  FMT_CONSTEXPR friend counting_iterator operator+(counting_iterator it=
,
--                                                   difference_type n) {
--    it.count_ +=3D static_cast<size_t>(n);
--    return it;
--  }
--
--  FMT_CONSTEXPR value_type operator*() const { return {}; }
--};
--
- template <typename Char, typename OutputIt>
- FMT_CONSTEXPR auto write(OutputIt out, basic_string_view<Char> s,
--                         const format_specs<Char>& specs) -> OutputIt {
-+                         const format_specs& specs) -> OutputIt {
-   auto data =3D s.data();
-   auto size =3D s.size();
-   if (specs.precision >=3D 0 && to_unsigned(specs.precision) < size)
-     size =3D code_point_index(s, to_unsigned(specs.precision));
--  bool is_debug =3D specs.type =3D=3D presentation_type::debug;
-+
-+  bool is_debug =3D specs.type() =3D=3D presentation_type::debug;
-+  if (is_debug) {
-+    auto buf =3D counting_buffer<Char>();
-+    write_escaped_string(basic_appender<Char>(buf), s);
-+    size =3D buf.count();
-+  }
-+
-   size_t width =3D 0;
-   if (specs.width !=3D 0) {
--    if (is_debug)
--      width =3D write_escaped_string(counting_iterator{}, s).count();
--    else
--      width =3D compute_width(basic_string_view<Char>(data, size));
-+    width =3D
-+        is_debug ? size : compute_width(basic_string_view<Char>(data, s=
ize));
-   }
--  return write_padded(out, specs, size, width,
--                      [=3D](reserve_iterator<OutputIt> it) {
--                        if (is_debug) return write_escaped_string(it, s=
);
--                        return copy_str<Char>(data, data + size, it);
--                      });
-+  return write_padded<Char>(
-+      out, specs, size, width, [=3D](reserve_iterator<OutputIt> it) {
-+        return is_debug ? write_escaped_string(it, s)
-+                        : copy<Char>(data, data + size, it);
-+      });
- }
- template <typename Char, typename OutputIt>
--FMT_CONSTEXPR auto write(OutputIt out,
--                         basic_string_view<type_identity_t<Char>> s,
--                         const format_specs<Char>& specs, locale_ref)
--    -> OutputIt {
--  return write(out, s, specs);
-+FMT_CONSTEXPR auto write(OutputIt out, basic_string_view<Char> s,
-+                         const format_specs& specs, locale_ref) -> Outp=
utIt {
-+  return write<Char>(out, s, specs);
- }
- template <typename Char, typename OutputIt>
--FMT_CONSTEXPR auto write(OutputIt out, const Char* s,
--                         const format_specs<Char>& specs, locale_ref)
--    -> OutputIt {
--  return specs.type !=3D presentation_type::pointer
--             ? write(out, basic_string_view<Char>(s), specs, {})
--             : write_ptr<Char>(out, bit_cast<uintptr_t>(s), &specs);
-+FMT_CONSTEXPR auto write(OutputIt out, const Char* s, const format_spec=
s& specs,
-+                         locale_ref) -> OutputIt {
-+  if (specs.type() =3D=3D presentation_type::pointer)
-+    return write_ptr<Char>(out, bit_cast<uintptr_t>(s), &specs);
-+  if (!s) report_error("string pointer is null");
-+  return write<Char>(out, basic_string_view<Char>(s), specs, {});
- }
-=20
- template <typename Char, typename OutputIt, typename T,
-@@ -2461,96 +2161,68 @@ FMT_CONSTEXPR auto write(OutputIt out, T value) =
-> OutputIt {
-   if (negative) abs_value =3D ~abs_value + 1;
-   int num_digits =3D count_digits(abs_value);
-   auto size =3D (negative ? 1 : 0) + static_cast<size_t>(num_digits);
--  auto it =3D reserve(out, size);
--  if (auto ptr =3D to_pointer<Char>(it, size)) {
-+  if (auto ptr =3D to_pointer<Char>(out, size)) {
-     if (negative) *ptr++ =3D static_cast<Char>('-');
-     format_decimal<Char>(ptr, abs_value, num_digits);
-     return out;
-   }
--  if (negative) *it++ =3D static_cast<Char>('-');
--  it =3D format_decimal<Char>(it, abs_value, num_digits).end;
--  return base_iterator(out, it);
-+  if (negative) *out++ =3D static_cast<Char>('-');
-+  return format_decimal<Char>(out, abs_value, num_digits);
- }
-=20
--// A floating-point presentation format.
--enum class float_format : unsigned char {
--  general,  // General: exponent notation or fixed point based on magni=
tude.
--  exp,      // Exponent notation with the default precision of 6, e.g. =
1.2e-3.
--  fixed,    // Fixed point with the default precision of 6, e.g. 0.0012=
.
--  hex
--};
--
--struct float_specs {
--  int precision;
--  float_format format : 8;
--  sign_t sign : 8;
--  bool upper : 1;
--  bool locale : 1;
--  bool binary32 : 1;
--  bool showpoint : 1;
--};
--
--template <typename ErrorHandler =3D error_handler, typename Char>
--FMT_CONSTEXPR auto parse_float_type_spec(const format_specs<Char>& spec=
s,
--                                         ErrorHandler&& eh =3D {})
--    -> float_specs {
--  auto result =3D float_specs();
--  result.showpoint =3D specs.alt;
--  result.locale =3D specs.localized;
--  switch (specs.type) {
--  case presentation_type::none:
--    result.format =3D float_format::general;
--    break;
--  case presentation_type::general_upper:
--    result.upper =3D true;
--    FMT_FALLTHROUGH;
--  case presentation_type::general_lower:
--    result.format =3D float_format::general;
--    break;
--  case presentation_type::exp_upper:
--    result.upper =3D true;
--    FMT_FALLTHROUGH;
--  case presentation_type::exp_lower:
--    result.format =3D float_format::exp;
--    result.showpoint |=3D specs.precision !=3D 0;
--    break;
--  case presentation_type::fixed_upper:
--    result.upper =3D true;
--    FMT_FALLTHROUGH;
--  case presentation_type::fixed_lower:
--    result.format =3D float_format::fixed;
--    result.showpoint |=3D specs.precision !=3D 0;
--    break;
--  case presentation_type::hexfloat_upper:
--    result.upper =3D true;
--    FMT_FALLTHROUGH;
--  case presentation_type::hexfloat_lower:
--    result.format =3D float_format::hex;
--    break;
--  default:
--    eh.on_error("invalid format specifier");
--    break;
-+template <typename Char>
-+FMT_CONSTEXPR auto parse_align(const Char* begin, const Char* end,
-+                               format_specs& specs) -> const Char* {
-+  FMT_ASSERT(begin !=3D end, "");
-+  auto alignment =3D align::none;
-+  auto p =3D begin + code_point_length(begin);
-+  if (end - p <=3D 0) p =3D begin;
-+  for (;;) {
-+    switch (to_ascii(*p)) {
-+    case '<': alignment =3D align::left; break;
-+    case '>': alignment =3D align::right; break;
-+    case '^': alignment =3D align::center; break;
-+    }
-+    if (alignment !=3D align::none) {
-+      if (p !=3D begin) {
-+        auto c =3D *begin;
-+        if (c =3D=3D '}') return begin;
-+        if (c =3D=3D '{') {
-+          report_error("invalid fill character '{'");
-+          return begin;
-+        }
-+        specs.set_fill(basic_string_view<Char>(begin, to_unsigned(p - b=
egin)));
-+        begin =3D p + 1;
-+      } else {
-+        ++begin;
-+      }
-+      break;
-+    } else if (p =3D=3D begin) {
-+      break;
-+    }
-+    p =3D begin;
-   }
--  return result;
-+  specs.set_align(alignment);
-+  return begin;
- }
-=20
- template <typename Char, typename OutputIt>
- FMT_CONSTEXPR20 auto write_nonfinite(OutputIt out, bool isnan,
--                                     format_specs<Char> specs,
--                                     const float_specs& fspecs) -> Outp=
utIt {
-+                                     format_specs specs, sign s) -> Out=
putIt {
-   auto str =3D
--      isnan ? (fspecs.upper ? "NAN" : "nan") : (fspecs.upper ? "INF" : =
"inf");
-+      isnan ? (specs.upper() ? "NAN" : "nan") : (specs.upper() ? "INF" =
: "inf");
-   constexpr size_t str_size =3D 3;
--  auto sign =3D fspecs.sign;
--  auto size =3D str_size + (sign ? 1 : 0);
-+  auto size =3D str_size + (s !=3D sign::none ? 1 : 0);
-   // Replace '0'-padding with space for non-finite values.
-   const bool is_zero_fill =3D
--      specs.fill.size() =3D=3D 1 && *specs.fill.data() =3D=3D static_ca=
st<Char>('0');
--  if (is_zero_fill) specs.fill[0] =3D static_cast<Char>(' ');
--  return write_padded(out, specs, size, [=3D](reserve_iterator<OutputIt=
> it) {
--    if (sign) *it++ =3D detail::sign<Char>(sign);
--    return copy_str<Char>(str, str + str_size, it);
--  });
-+      specs.fill_size() =3D=3D 1 && specs.fill_unit<Char>() =3D=3D '0';
-+  if (is_zero_fill) specs.set_fill(' ');
-+  return write_padded<Char>(out, specs, size,
-+                            [=3D](reserve_iterator<OutputIt> it) {
-+                              if (s !=3D sign::none)
-+                                *it++ =3D detail::getsign<Char>(s);
-+                              return copy<Char>(str, str + str_size, it=
);
-+                            });
- }
-=20
- // A decimal floating-point number significand * pow(10, exp).
-@@ -2571,12 +2243,12 @@ inline auto get_significand_size(const dragonbox=
::decimal_fp<T>& f) -> int {
- template <typename Char, typename OutputIt>
- constexpr auto write_significand(OutputIt out, const char* significand,
-                                  int significand_size) -> OutputIt {
--  return copy_str<Char>(significand, significand + significand_size, ou=
t);
-+  return copy<Char>(significand, significand + significand_size, out);
- }
- template <typename Char, typename OutputIt, typename UInt>
- inline auto write_significand(OutputIt out, UInt significand,
-                               int significand_size) -> OutputIt {
--  return format_decimal<Char>(out, significand, significand_size).end;
-+  return format_decimal<Char>(out, significand, significand_size);
- }
- template <typename Char, typename OutputIt, typename T, typename Groupi=
ng>
- FMT_CONSTEXPR20 auto write_significand(OutputIt out, T significand,
-@@ -2596,14 +2268,13 @@ template <typename Char, typename UInt,
-           FMT_ENABLE_IF(std::is_integral<UInt>::value)>
- inline auto write_significand(Char* out, UInt significand, int signific=
and_size,
-                               int integral_size, Char decimal_point) ->=
 Char* {
--  if (!decimal_point)
--    return format_decimal(out, significand, significand_size).end;
-+  if (!decimal_point) return format_decimal(out, significand, significa=
nd_size);
-   out +=3D significand_size + 1;
-   Char* end =3D out;
-   int floating_size =3D significand_size - integral_size;
-   for (int i =3D floating_size / 2; i > 0; --i) {
-     out -=3D 2;
--    copy2(out, digits2(static_cast<std::size_t>(significand % 100)));
-+    write2digits(out, static_cast<std::size_t>(significand % 100));
-     significand /=3D 100;
-   }
-   if (floating_size % 2 !=3D 0) {
-@@ -2624,19 +2295,19 @@ inline auto write_significand(OutputIt out, UInt=
 significand,
-   Char buffer[digits10<UInt>() + 2];
-   auto end =3D write_significand(buffer, significand, significand_size,
-                                integral_size, decimal_point);
--  return detail::copy_str_noinline<Char>(buffer, end, out);
-+  return detail::copy_noinline<Char>(buffer, end, out);
- }
-=20
- template <typename OutputIt, typename Char>
- FMT_CONSTEXPR auto write_significand(OutputIt out, const char* signific=
and,
-                                      int significand_size, int integral=
_size,
-                                      Char decimal_point) -> OutputIt {
--  out =3D detail::copy_str_noinline<Char>(significand,
--                                        significand + integral_size, ou=
t);
-+  out =3D detail::copy_noinline<Char>(significand, significand + integr=
al_size,
-+                                    out);
-   if (!decimal_point) return out;
-   *out++ =3D decimal_point;
--  return detail::copy_str_noinline<Char>(significand + integral_size,
--                                         significand + significand_size=
, out);
-+  return detail::copy_noinline<Char>(significand + integral_size,
-+                                     significand + significand_size, ou=
t);
- }
-=20
- template <typename OutputIt, typename Char, typename T, typename Groupi=
ng>
-@@ -2649,44 +2320,42 @@ FMT_CONSTEXPR20 auto write_significand(OutputIt =
out, T significand,
-                              decimal_point);
-   }
-   auto buffer =3D basic_memory_buffer<Char>();
--  write_significand(buffer_appender<Char>(buffer), significand,
--                    significand_size, integral_size, decimal_point);
-+  write_significand(basic_appender<Char>(buffer), significand, signific=
and_size,
-+                    integral_size, decimal_point);
-   grouping.apply(
-       out, basic_string_view<Char>(buffer.data(), to_unsigned(integral_=
size)));
--  return detail::copy_str_noinline<Char>(buffer.data() + integral_size,
--                                         buffer.end(), out);
-+  return detail::copy_noinline<Char>(buffer.data() + integral_size,
-+                                     buffer.end(), out);
- }
-=20
--template <typename OutputIt, typename DecimalFP, typename Char,
-+template <typename Char, typename OutputIt, typename DecimalFP,
-           typename Grouping =3D digit_grouping<Char>>
- FMT_CONSTEXPR20 auto do_write_float(OutputIt out, const DecimalFP& f,
--                                    const format_specs<Char>& specs,
--                                    float_specs fspecs, locale_ref loc)
--    -> OutputIt {
-+                                    const format_specs& specs, sign s,
-+                                    int exp_upper, locale_ref loc) -> O=
utputIt {
-   auto significand =3D f.significand;
-   int significand_size =3D get_significand_size(f);
-   const Char zero =3D static_cast<Char>('0');
--  auto sign =3D fspecs.sign;
--  size_t size =3D to_unsigned(significand_size) + (sign ? 1 : 0);
-+  size_t size =3D to_unsigned(significand_size) + (s !=3D sign::none ? =
1 : 0);
-   using iterator =3D reserve_iterator<OutputIt>;
-=20
--  Char decimal_point =3D
--      fspecs.locale ? detail::decimal_point<Char>(loc) : static_cast<Ch=
ar>('.');
-+  Char decimal_point =3D specs.localized() ? detail::decimal_point<Char=
>(loc)
-+                                         : static_cast<Char>('.');
-=20
-   int output_exp =3D f.exponent + significand_size - 1;
-   auto use_exp_format =3D [=3D]() {
--    if (fspecs.format =3D=3D float_format::exp) return true;
--    if (fspecs.format !=3D float_format::general) return false;
-+    if (specs.type() =3D=3D presentation_type::exp) return true;
-+    if (specs.type() =3D=3D presentation_type::fixed) return false;
-     // Use the fixed notation if the exponent is in [exp_lower, exp_upp=
er),
-     // e.g. 0.0001 instead of 1e-04. Otherwise use the exponent notatio=
n.
--    const int exp_lower =3D -4, exp_upper =3D 16;
-+    const int exp_lower =3D -4;
-     return output_exp < exp_lower ||
--           output_exp >=3D (fspecs.precision > 0 ? fspecs.precision : e=
xp_upper);
-+           output_exp >=3D (specs.precision > 0 ? specs.precision : exp=
_upper);
-   };
-   if (use_exp_format()) {
-     int num_zeros =3D 0;
--    if (fspecs.showpoint) {
--      num_zeros =3D fspecs.precision - significand_size;
-+    if (specs.alt()) {
-+      num_zeros =3D specs.precision - significand_size;
-       if (num_zeros < 0) num_zeros =3D 0;
-       size +=3D to_unsigned(num_zeros);
-     } else if (significand_size =3D=3D 1) {
-@@ -2697,9 +2366,9 @@ FMT_CONSTEXPR20 auto do_write_float(OutputIt out, =
const DecimalFP& f,
-     if (abs_output_exp >=3D 100) exp_digits =3D abs_output_exp >=3D 100=
0 ? 4 : 3;
-=20
-     size +=3D to_unsigned((decimal_point ? 1 : 0) + 2 + exp_digits);
--    char exp_char =3D fspecs.upper ? 'E' : 'e';
-+    char exp_char =3D specs.upper() ? 'E' : 'e';
-     auto write =3D [=3D](iterator it) {
--      if (sign) *it++ =3D detail::sign<Char>(sign);
-+      if (s !=3D sign::none) *it++ =3D detail::getsign<Char>(s);
-       // Insert a decimal point after the first digit and add an expone=
nt.
-       it =3D write_significand(it, significand, significand_size, 1,
-                              decimal_point);
-@@ -2707,39 +2376,41 @@ FMT_CONSTEXPR20 auto do_write_float(OutputIt out=
, const DecimalFP& f,
-       *it++ =3D static_cast<Char>(exp_char);
-       return write_exponent<Char>(output_exp, it);
-     };
--    return specs.width > 0 ? write_padded<align::right>(out, specs, siz=
e, write)
--                           : base_iterator(out, write(reserve(out, size=
)));
-+    return specs.width > 0
-+               ? write_padded<Char, align::right>(out, specs, size, wri=
te)
-+               : base_iterator(out, write(reserve(out, size)));
-   }
-=20
-   int exp =3D f.exponent + significand_size;
-   if (f.exponent >=3D 0) {
-     // 1234e5 -> 123400000[.0+]
-     size +=3D to_unsigned(f.exponent);
--    int num_zeros =3D fspecs.precision - exp;
-+    int num_zeros =3D specs.precision - exp;
-     abort_fuzzing_if(num_zeros > 5000);
--    if (fspecs.showpoint) {
-+    if (specs.alt()) {
-       ++size;
--      if (num_zeros <=3D 0 && fspecs.format !=3D float_format::fixed) n=
um_zeros =3D 0;
-+      if (num_zeros <=3D 0 && specs.type() !=3D presentation_type::fixe=
d)
-+        num_zeros =3D 0;
-       if (num_zeros > 0) size +=3D to_unsigned(num_zeros);
-     }
--    auto grouping =3D Grouping(loc, fspecs.locale);
-+    auto grouping =3D Grouping(loc, specs.localized());
-     size +=3D to_unsigned(grouping.count_separators(exp));
--    return write_padded<align::right>(out, specs, size, [&](iterator it=
) {
--      if (sign) *it++ =3D detail::sign<Char>(sign);
-+    return write_padded<Char, align::right>(out, specs, size, [&](itera=
tor it) {
-+      if (s !=3D sign::none) *it++ =3D detail::getsign<Char>(s);
-       it =3D write_significand<Char>(it, significand, significand_size,
-                                    f.exponent, grouping);
--      if (!fspecs.showpoint) return it;
-+      if (!specs.alt()) return it;
-       *it++ =3D decimal_point;
-       return num_zeros > 0 ? detail::fill_n(it, num_zeros, zero) : it;
-     });
-   } else if (exp > 0) {
-     // 1234e-2 -> 12.34[0+]
--    int num_zeros =3D fspecs.showpoint ? fspecs.precision - significand=
_size : 0;
--    size +=3D 1 + to_unsigned(num_zeros > 0 ? num_zeros : 0);
--    auto grouping =3D Grouping(loc, fspecs.locale);
-+    int num_zeros =3D specs.alt() ? specs.precision - significand_size =
: 0;
-+    size +=3D 1 + static_cast<unsigned>(max_of(num_zeros, 0));
-+    auto grouping =3D Grouping(loc, specs.localized());
-     size +=3D to_unsigned(grouping.count_separators(exp));
--    return write_padded<align::right>(out, specs, size, [&](iterator it=
) {
--      if (sign) *it++ =3D detail::sign<Char>(sign);
-+    return write_padded<Char, align::right>(out, specs, size, [&](itera=
tor it) {
-+      if (s !=3D sign::none) *it++ =3D detail::getsign<Char>(s);
-       it =3D write_significand(it, significand, significand_size, exp,
-                              decimal_point, grouping);
-       return num_zeros > 0 ? detail::fill_n(it, num_zeros, zero) : it;
-@@ -2747,14 +2418,14 @@ FMT_CONSTEXPR20 auto do_write_float(OutputIt out=
, const DecimalFP& f,
-   }
-   // 1234e-6 -> 0.001234
-   int num_zeros =3D -exp;
--  if (significand_size =3D=3D 0 && fspecs.precision >=3D 0 &&
--      fspecs.precision < num_zeros) {
--    num_zeros =3D fspecs.precision;
-+  if (significand_size =3D=3D 0 && specs.precision >=3D 0 &&
-+      specs.precision < num_zeros) {
-+    num_zeros =3D specs.precision;
-   }
--  bool pointy =3D num_zeros !=3D 0 || significand_size !=3D 0 || fspecs=
.showpoint;
-+  bool pointy =3D num_zeros !=3D 0 || significand_size !=3D 0 || specs.=
alt();
-   size +=3D 1 + (pointy ? 1 : 0) + to_unsigned(num_zeros);
--  return write_padded<align::right>(out, specs, size, [&](iterator it) =
{
--    if (sign) *it++ =3D detail::sign<Char>(sign);
-+  return write_padded<Char, align::right>(out, specs, size, [&](iterato=
r it) {
-+    if (s !=3D sign::none) *it++ =3D detail::getsign<Char>(s);
-     *it++ =3D zero;
-     if (!pointy) return it;
-     *it++ =3D decimal_point;
-@@ -2767,32 +2438,31 @@ template <typename Char> class fallback_digit_gr=
ouping {
-  public:
-   constexpr fallback_digit_grouping(locale_ref, bool) {}
-=20
--  constexpr bool has_separator() const { return false; }
-+  constexpr auto has_separator() const -> bool { return false; }
-=20
--  constexpr int count_separators(int) const { return 0; }
-+  constexpr auto count_separators(int) const -> int { return 0; }
-=20
-   template <typename Out, typename C>
--  constexpr Out apply(Out out, basic_string_view<C>) const {
-+  constexpr auto apply(Out out, basic_string_view<C>) const -> Out {
-     return out;
-   }
- };
-=20
--template <typename OutputIt, typename DecimalFP, typename Char>
-+template <typename Char, typename OutputIt, typename DecimalFP>
- FMT_CONSTEXPR20 auto write_float(OutputIt out, const DecimalFP& f,
--                                 const format_specs<Char>& specs,
--                                 float_specs fspecs, locale_ref loc)
--    -> OutputIt {
-+                                 const format_specs& specs, sign s,
-+                                 int exp_upper, locale_ref loc) -> Outp=
utIt {
-   if (is_constant_evaluated()) {
--    return do_write_float<OutputIt, DecimalFP, Char,
--                          fallback_digit_grouping<Char>>(out, f, specs,=
 fspecs,
--                                                         loc);
-+    return do_write_float<Char, OutputIt, DecimalFP,
-+                          fallback_digit_grouping<Char>>(out, f, specs,=
 s,
-+                                                         exp_upper, loc=
);
-   } else {
--    return do_write_float(out, f, specs, fspecs, loc);
-+    return do_write_float<Char>(out, f, specs, s, exp_upper, loc);
-   }
- }
-=20
--template <typename T> constexpr bool isnan(T value) {
--  return !(value >=3D value);  // std::isnan doesn't support __float128=
.
-+template <typename T> constexpr auto isnan(T value) -> bool {
-+  return value !=3D value;  // std::isnan doesn't support __float128.
- }
-=20
- template <typename T, typename Enable =3D void>
-@@ -2804,14 +2474,14 @@ struct has_isfinite<T, enable_if_t<sizeof(std::i=
sfinite(T())) !=3D 0>>
-=20
- template <typename T, FMT_ENABLE_IF(std::is_floating_point<T>::value&&
-                                         has_isfinite<T>::value)>
--FMT_CONSTEXPR20 bool isfinite(T value) {
-+FMT_CONSTEXPR20 auto isfinite(T value) -> bool {
-   constexpr T inf =3D T(std::numeric_limits<double>::infinity());
-   if (is_constant_evaluated())
-     return !detail::isnan(value) && value < inf && value > -inf;
-   return std::isfinite(value);
- }
- template <typename T, FMT_ENABLE_IF(!has_isfinite<T>::value)>
--FMT_CONSTEXPR bool isfinite(T value) {
-+FMT_CONSTEXPR auto isfinite(T value) -> bool {
-   T inf =3D T(std::numeric_limits<double>::infinity());
-   // std::isfinite doesn't support __float128.
-   return !detail::isnan(value) && value < inf && value > -inf;
-@@ -2830,78 +2500,6 @@ FMT_INLINE FMT_CONSTEXPR bool signbit(T value) {
-   return std::signbit(static_cast<double>(value));
- }
-=20
--enum class round_direction { unknown, up, down };
--
--// Given the divisor (normally a power of 10), the remainder =3D v % di=
visor for
--// some number v and the error, returns whether v should be rounded up,=
 down, or
--// whether the rounding direction can't be determined due to error.
--// error should be less than divisor / 2.
--FMT_CONSTEXPR inline round_direction get_round_direction(uint64_t divis=
or,
--                                                         uint64_t remai=
nder,
--                                                         uint64_t error=
) {
--  FMT_ASSERT(remainder < divisor, "");  // divisor - remainder won't ov=
erflow.
--  FMT_ASSERT(error < divisor, "");      // divisor - error won't overfl=
ow.
--  FMT_ASSERT(error < divisor - error, "");  // error * 2 won't overflow=
.
--  // Round down if (remainder + error) * 2 <=3D divisor.
--  if (remainder <=3D divisor - remainder && error * 2 <=3D divisor - re=
mainder * 2)
--    return round_direction::down;
--  // Round up if (remainder - error) * 2 >=3D divisor.
--  if (remainder >=3D error &&
--      remainder - error >=3D divisor - (remainder - error)) {
--    return round_direction::up;
--  }
--  return round_direction::unknown;
--}
--
--namespace digits {
--enum result {
--  more,  // Generate more digits.
--  done,  // Done generating digits.
--  error  // Digit generation cancelled due to an error.
--};
--}
--
--struct gen_digits_handler {
--  char* buf;
--  int size;
--  int precision;
--  int exp10;
--  bool fixed;
--
--  FMT_CONSTEXPR digits::result on_digit(char digit, uint64_t divisor,
--                                        uint64_t remainder, uint64_t er=
ror,
--                                        bool integral) {
--    FMT_ASSERT(remainder < divisor, "");
--    buf[size++] =3D digit;
--    if (!integral && error >=3D remainder) return digits::error;
--    if (size < precision) return digits::more;
--    if (!integral) {
--      // Check if error * 2 < divisor with overflow prevention.
--      // The check is not needed for the integral part because error =3D=
 1
--      // and divisor > (1 << 32) there.
--      if (error >=3D divisor || error >=3D divisor - error) return digi=
ts::error;
--    } else {
--      FMT_ASSERT(error =3D=3D 1 && divisor > 2, "");
--    }
--    auto dir =3D get_round_direction(divisor, remainder, error);
--    if (dir !=3D round_direction::up)
--      return dir =3D=3D round_direction::down ? digits::done : digits::=
error;
--    ++buf[size - 1];
--    for (int i =3D size - 1; i > 0 && buf[i] > '9'; --i) {
--      buf[i] =3D '0';
--      ++buf[i - 1];
--    }
--    if (buf[0] > '9') {
--      buf[0] =3D '1';
--      if (fixed)
--        buf[size++] =3D '0';
--      else
--        ++exp10;
--    }
--    return digits::done;
--  }
--};
--
- inline FMT_CONSTEXPR20 void adjust_precision(int& precision, int exp10)=
 {
-   // Adjust fixed precision by exponent because it is relative to decim=
al
-   // point.
-@@ -2910,149 +2508,50 @@ inline FMT_CONSTEXPR20 void adjust_precision(in=
t& precision, int exp10) {
-   precision +=3D exp10;
- }
-=20
--// Generates output using the Grisu digit-gen algorithm.
--// error: the size of the region (lower, upper) outside of which number=
s
--// definitely do not round to value (Delta in Grisu3).
--FMT_INLINE FMT_CONSTEXPR20 auto grisu_gen_digits(fp value, uint64_t err=
or,
--                                                 int& exp,
--                                                 gen_digits_handler& ha=
ndler)
--    -> digits::result {
--  const fp one(1ULL << -value.e, value.e);
--  // The integral part of scaled value (p1 in Grisu) =3D value / one. I=
t cannot be
--  // zero because it contains a product of two 64-bit numbers with MSB =
set (due
--  // to normalization) - 1, shifted right by at most 60 bits.
--  auto integral =3D static_cast<uint32_t>(value.f >> -one.e);
--  FMT_ASSERT(integral !=3D 0, "");
--  FMT_ASSERT(integral =3D=3D value.f >> -one.e, "");
--  // The fractional part of scaled value (p2 in Grisu) c =3D value % on=
e.
--  uint64_t fractional =3D value.f & (one.f - 1);
--  exp =3D count_digits(integral);  // kappa in Grisu.
--  // Non-fixed formats require at least one digit and no precision adju=
stment.
--  if (handler.fixed) {
--    adjust_precision(handler.precision, exp + handler.exp10);
--    // Check if precision is satisfied just by leading zeros, e.g.
--    // format("{:.2f}", 0.001) gives "0.00" without generating any digi=
ts.
--    if (handler.precision <=3D 0) {
--      if (handler.precision < 0) return digits::done;
--      // Divide by 10 to prevent overflow.
--      uint64_t divisor =3D data::power_of_10_64[exp - 1] << -one.e;
--      auto dir =3D get_round_direction(divisor, value.f / 10, error * 1=
0);
--      if (dir =3D=3D round_direction::unknown) return digits::error;
--      handler.buf[handler.size++] =3D dir =3D=3D round_direction::up ? =
'1' : '0';
--      return digits::done;
--    }
--  }
--  // Generate digits for the integral part. This can produce up to 10 d=
igits.
--  do {
--    uint32_t digit =3D 0;
--    auto divmod_integral =3D [&](uint32_t divisor) {
--      digit =3D integral / divisor;
--      integral %=3D divisor;
--    };
--    // This optimization by Milo Yip reduces the number of integer divi=
sions by
--    // one per iteration.
--    switch (exp) {
--    case 10:
--      divmod_integral(1000000000);
--      break;
--    case 9:
--      divmod_integral(100000000);
--      break;
--    case 8:
--      divmod_integral(10000000);
--      break;
--    case 7:
--      divmod_integral(1000000);
--      break;
--    case 6:
--      divmod_integral(100000);
--      break;
--    case 5:
--      divmod_integral(10000);
--      break;
--    case 4:
--      divmod_integral(1000);
--      break;
--    case 3:
--      divmod_integral(100);
--      break;
--    case 2:
--      divmod_integral(10);
--      break;
--    case 1:
--      digit =3D integral;
--      integral =3D 0;
--      break;
--    default:
--      FMT_ASSERT(false, "invalid number of digits");
--    }
--    --exp;
--    auto remainder =3D (static_cast<uint64_t>(integral) << -one.e) + fr=
actional;
--    auto result =3D handler.on_digit(static_cast<char>('0' + digit),
--                                   data::power_of_10_64[exp] << -one.e,
--                                   remainder, error, true);
--    if (result !=3D digits::more) return result;
--  } while (exp > 0);
--  // Generate digits for the fractional part.
--  for (;;) {
--    fractional *=3D 10;
--    error *=3D 10;
--    char digit =3D static_cast<char>('0' + (fractional >> -one.e));
--    fractional &=3D one.f - 1;
--    --exp;
--    auto result =3D handler.on_digit(digit, one.f, fractional, error, f=
alse);
--    if (result !=3D digits::more) return result;
--  }
--}
--
- class bigint {
-  private:
--  // A bigint is stored as an array of bigits (big digits), with bigit =
at index
--  // 0 being the least significant one.
--  using bigit =3D uint32_t;
-+  // A bigint is a number in the form bigit_[N - 1] ... bigit_[0] * 32^=
exp_.
-+  using bigit =3D uint32_t;  // A big digit.
-   using double_bigit =3D uint64_t;
-+  enum { bigit_bits =3D num_bits<bigit>() };
-   enum { bigits_capacity =3D 32 };
-   basic_memory_buffer<bigit, bigits_capacity> bigits_;
-   int exp_;
-=20
--  FMT_CONSTEXPR20 bigit operator[](int index) const {
--    return bigits_[to_unsigned(index)];
--  }
--  FMT_CONSTEXPR20 bigit& operator[](int index) {
--    return bigits_[to_unsigned(index)];
--  }
--
--  static constexpr const int bigit_bits =3D num_bits<bigit>();
--
-   friend struct formatter<bigint>;
-=20
--  FMT_CONSTEXPR20 void subtract_bigits(int index, bigit other, bigit& b=
orrow) {
--    auto result =3D static_cast<double_bigit>((*this)[index]) - other -=
 borrow;
--    (*this)[index] =3D static_cast<bigit>(result);
-+  FMT_CONSTEXPR auto get_bigit(int i) const -> bigit {
-+    return i >=3D exp_ && i < num_bigits() ? bigits_[i - exp_] : 0;
-+  }
-+
-+  FMT_CONSTEXPR void subtract_bigits(int index, bigit other, bigit& bor=
row) {
-+    auto result =3D double_bigit(bigits_[index]) - other - borrow;
-+    bigits_[index] =3D static_cast<bigit>(result);
-     borrow =3D static_cast<bigit>(result >> (bigit_bits * 2 - 1));
-   }
-=20
--  FMT_CONSTEXPR20 void remove_leading_zeros() {
-+  FMT_CONSTEXPR void remove_leading_zeros() {
-     int num_bigits =3D static_cast<int>(bigits_.size()) - 1;
--    while (num_bigits > 0 && (*this)[num_bigits] =3D=3D 0) --num_bigits=
;
-+    while (num_bigits > 0 && bigits_[num_bigits] =3D=3D 0) --num_bigits=
;
-     bigits_.resize(to_unsigned(num_bigits + 1));
-   }
-=20
-   // Computes *this -=3D other assuming aligned bigints and *this >=3D =
other.
--  FMT_CONSTEXPR20 void subtract_aligned(const bigint& other) {
-+  FMT_CONSTEXPR void subtract_aligned(const bigint& other) {
-     FMT_ASSERT(other.exp_ >=3D exp_, "unaligned bigints");
-     FMT_ASSERT(compare(*this, other) >=3D 0, "");
-     bigit borrow =3D 0;
-     int i =3D other.exp_ - exp_;
-     for (size_t j =3D 0, n =3D other.bigits_.size(); j !=3D n; ++i, ++j=
)
-       subtract_bigits(i, other.bigits_[j], borrow);
--    while (borrow > 0) subtract_bigits(i, 0, borrow);
-+    if (borrow !=3D 0) subtract_bigits(i, 0, borrow);
-+    FMT_ASSERT(borrow =3D=3D 0, "");
-     remove_leading_zeros();
-   }
-=20
--  FMT_CONSTEXPR20 void multiply(uint32_t value) {
--    const double_bigit wide_value =3D value;
-+  FMT_CONSTEXPR void multiply(uint32_t value) {
-     bigit carry =3D 0;
-+    const double_bigit wide_value =3D value;
-     for (size_t i =3D 0, n =3D bigits_.size(); i < n; ++i) {
-       double_bigit result =3D bigits_[i] * wide_value + carry;
-       bigits_[i] =3D static_cast<bigit>(result);
-@@ -3063,7 +2562,7 @@ class bigint {
-=20
-   template <typename UInt, FMT_ENABLE_IF(std::is_same<UInt, uint64_t>::=
value ||
-                                          std::is_same<UInt, uint128_t>:=
:value)>
--  FMT_CONSTEXPR20 void multiply(UInt value) {
-+  FMT_CONSTEXPR void multiply(UInt value) {
-     using half_uint =3D
-         conditional_t<std::is_same<UInt, uint128_t>::value, uint64_t, u=
int32_t>;
-     const int shift =3D num_bits<half_uint>() - bigit_bits;
-@@ -3084,7 +2583,7 @@ class bigint {
-=20
-   template <typename UInt, FMT_ENABLE_IF(std::is_same<UInt, uint64_t>::=
value ||
-                                          std::is_same<UInt, uint128_t>:=
:value)>
--  FMT_CONSTEXPR20 void assign(UInt n) {
-+  FMT_CONSTEXPR void assign(UInt n) {
-     size_t num_bigits =3D 0;
-     do {
-       bigits_[num_bigits++] =3D static_cast<bigit>(n);
-@@ -3095,30 +2594,30 @@ class bigint {
-   }
-=20
-  public:
--  FMT_CONSTEXPR20 bigint() : exp_(0) {}
-+  FMT_CONSTEXPR bigint() : exp_(0) {}
-   explicit bigint(uint64_t n) { assign(n); }
-=20
-   bigint(const bigint&) =3D delete;
-   void operator=3D(const bigint&) =3D delete;
-=20
--  FMT_CONSTEXPR20 void assign(const bigint& other) {
-+  FMT_CONSTEXPR void assign(const bigint& other) {
-     auto size =3D other.bigits_.size();
-     bigits_.resize(size);
-     auto data =3D other.bigits_.data();
--    std::copy(data, data + size, make_checked(bigits_.data(), size));
-+    copy<bigit>(data, data + size, bigits_.data());
-     exp_ =3D other.exp_;
-   }
-=20
--  template <typename Int> FMT_CONSTEXPR20 void operator=3D(Int n) {
-+  template <typename Int> FMT_CONSTEXPR void operator=3D(Int n) {
-     FMT_ASSERT(n > 0, "");
-     assign(uint64_or_128_t<Int>(n));
-   }
-=20
--  FMT_CONSTEXPR20 int num_bigits() const {
-+  FMT_CONSTEXPR auto num_bigits() const -> int {
-     return static_cast<int>(bigits_.size()) + exp_;
-   }
-=20
--  FMT_NOINLINE FMT_CONSTEXPR20 bigint& operator<<=3D(int shift) {
-+  FMT_CONSTEXPR auto operator<<=3D(int shift) -> bigint& {
-     FMT_ASSERT(shift >=3D 0, "");
-     exp_ +=3D shift / bigit_bits;
-     shift %=3D bigit_bits;
-@@ -3133,46 +2632,39 @@ class bigint {
-     return *this;
-   }
-=20
--  template <typename Int> FMT_CONSTEXPR20 bigint& operator*=3D(Int valu=
e) {
-+  template <typename Int> FMT_CONSTEXPR auto operator*=3D(Int value) ->=
 bigint& {
-     FMT_ASSERT(value > 0, "");
-     multiply(uint32_or_64_or_128_t<Int>(value));
-     return *this;
-   }
-=20
--  friend FMT_CONSTEXPR20 int compare(const bigint& lhs, const bigint& r=
hs) {
--    int num_lhs_bigits =3D lhs.num_bigits(), num_rhs_bigits =3D rhs.num=
_bigits();
--    if (num_lhs_bigits !=3D num_rhs_bigits)
--      return num_lhs_bigits > num_rhs_bigits ? 1 : -1;
--    int i =3D static_cast<int>(lhs.bigits_.size()) - 1;
--    int j =3D static_cast<int>(rhs.bigits_.size()) - 1;
-+  friend FMT_CONSTEXPR auto compare(const bigint& b1, const bigint& b2)=
 -> int {
-+    int num_bigits1 =3D b1.num_bigits(), num_bigits2 =3D b2.num_bigits(=
);
-+    if (num_bigits1 !=3D num_bigits2) return num_bigits1 > num_bigits2 =
? 1 : -1;
-+    int i =3D static_cast<int>(b1.bigits_.size()) - 1;
-+    int j =3D static_cast<int>(b2.bigits_.size()) - 1;
-     int end =3D i - j;
-     if (end < 0) end =3D 0;
-     for (; i >=3D end; --i, --j) {
--      bigit lhs_bigit =3D lhs[i], rhs_bigit =3D rhs[j];
--      if (lhs_bigit !=3D rhs_bigit) return lhs_bigit > rhs_bigit ? 1 : =
-1;
-+      bigit b1_bigit =3D b1.bigits_[i], b2_bigit =3D b2.bigits_[j];
-+      if (b1_bigit !=3D b2_bigit) return b1_bigit > b2_bigit ? 1 : -1;
-     }
-     if (i !=3D j) return i > j ? 1 : -1;
-     return 0;
-   }
-=20
-   // Returns compare(lhs1 + lhs2, rhs).
--  friend FMT_CONSTEXPR20 int add_compare(const bigint& lhs1, const bigi=
nt& lhs2,
--                                         const bigint& rhs) {
--    auto minimum =3D [](int a, int b) { return a < b ? a : b; };
--    auto maximum =3D [](int a, int b) { return a > b ? a : b; };
--    int max_lhs_bigits =3D maximum(lhs1.num_bigits(), lhs2.num_bigits()=
);
-+  friend FMT_CONSTEXPR auto add_compare(const bigint& lhs1, const bigin=
t& lhs2,
-+                                        const bigint& rhs) -> int {
-+    int max_lhs_bigits =3D max_of(lhs1.num_bigits(), lhs2.num_bigits())=
;
-     int num_rhs_bigits =3D rhs.num_bigits();
-     if (max_lhs_bigits + 1 < num_rhs_bigits) return -1;
-     if (max_lhs_bigits > num_rhs_bigits) return 1;
--    auto get_bigit =3D [](const bigint& n, int i) -> bigit {
--      return i >=3D n.exp_ && i < n.num_bigits() ? n[i - n.exp_] : 0;
--    };
-     double_bigit borrow =3D 0;
--    int min_exp =3D minimum(minimum(lhs1.exp_, lhs2.exp_), rhs.exp_);
-+    int min_exp =3D min_of(min_of(lhs1.exp_, lhs2.exp_), rhs.exp_);
-     for (int i =3D num_rhs_bigits - 1; i >=3D min_exp; --i) {
--      double_bigit sum =3D
--          static_cast<double_bigit>(get_bigit(lhs1, i)) + get_bigit(lhs=
2, i);
--      bigit rhs_bigit =3D get_bigit(rhs, i);
-+      double_bigit sum =3D double_bigit(lhs1.get_bigit(i)) + lhs2.get_b=
igit(i);
-+      bigit rhs_bigit =3D rhs.get_bigit(i);
-       if (sum > rhs_bigit + borrow) return 1;
-       borrow =3D rhs_bigit + borrow - sum;
-       if (borrow > 1) return -1;
-@@ -3185,10 +2677,8 @@ class bigint {
-   FMT_CONSTEXPR20 void assign_pow10(int exp) {
-     FMT_ASSERT(exp >=3D 0, "");
-     if (exp =3D=3D 0) return *this =3D 1;
--    // Find the top bit.
--    int bitmask =3D 1;
--    while (exp >=3D bitmask) bitmask <<=3D 1;
--    bitmask >>=3D 1;
-+    int bitmask =3D 1 << (num_bits<unsigned>() -
-+                        countl_zero(static_cast<uint32_t>(exp)) - 1);
-     // pow(10, exp) =3D pow(5, exp) * pow(2, exp). First compute pow(5,=
 exp) by
-     // repeated squaring and multiplication.
-     *this =3D 5;
-@@ -3212,17 +2702,17 @@ class bigint {
-       // cross-product terms n[i] * n[j] such that i + j =3D=3D bigit_i=
ndex.
-       for (int i =3D 0, j =3D bigit_index; j >=3D 0; ++i, --j) {
-         // Most terms are multiplied twice which can be optimized in th=
e future.
--        sum +=3D static_cast<double_bigit>(n[i]) * n[j];
-+        sum +=3D double_bigit(n[i]) * n[j];
-       }
--      (*this)[bigit_index] =3D static_cast<bigit>(sum);
-+      bigits_[bigit_index] =3D static_cast<bigit>(sum);
-       sum >>=3D num_bits<bigit>();  // Compute the carry.
-     }
-     // Do the same for the top half.
-     for (int bigit_index =3D num_bigits; bigit_index < num_result_bigit=
s;
-          ++bigit_index) {
-       for (int j =3D num_bigits - 1, i =3D bigit_index - j; i < num_big=
its;)
--        sum +=3D static_cast<double_bigit>(n[i++]) * n[j--];
--      (*this)[bigit_index] =3D static_cast<bigit>(sum);
-+        sum +=3D double_bigit(n[i++]) * n[j--];
-+      bigits_[bigit_index] =3D static_cast<bigit>(sum);
-       sum >>=3D num_bits<bigit>();
-     }
-     remove_leading_zeros();
-@@ -3231,20 +2721,20 @@ class bigint {
-=20
-   // If this bigint has a bigger exponent than other, adds trailing zer=
o to make
-   // exponents equal. This simplifies some operations such as subtracti=
on.
--  FMT_CONSTEXPR20 void align(const bigint& other) {
-+  FMT_CONSTEXPR void align(const bigint& other) {
-     int exp_difference =3D exp_ - other.exp_;
-     if (exp_difference <=3D 0) return;
-     int num_bigits =3D static_cast<int>(bigits_.size());
-     bigits_.resize(to_unsigned(num_bigits + exp_difference));
-     for (int i =3D num_bigits - 1, j =3D i + exp_difference; i >=3D 0; =
--i, --j)
-       bigits_[j] =3D bigits_[i];
--    std::uninitialized_fill_n(bigits_.data(), exp_difference, 0);
-+    memset(bigits_.data(), 0, to_unsigned(exp_difference) * sizeof(bigi=
t));
-     exp_ -=3D exp_difference;
-   }
-=20
-   // Divides this bignum by divisor, assigning the remainder to this an=
d
-   // returning the quotient.
--  FMT_CONSTEXPR20 int divmod_assign(const bigint& divisor) {
-+  FMT_CONSTEXPR auto divmod_assign(const bigint& divisor) -> int {
-     FMT_ASSERT(this !=3D &divisor, "");
-     if (compare(*this, divisor) < 0) return 0;
-     FMT_ASSERT(divisor.bigits_[divisor.bigits_.size() - 1u] !=3D 0, "")=
;
-@@ -3319,6 +2809,7 @@ FMT_CONSTEXPR20 inline void format_dragon(basic_fp=
<uint128_t> value,
-   }
-   int even =3D static_cast<int>((value.f & 1) =3D=3D 0);
-   if (!upper) upper =3D &lower;
-+  bool shortest =3D num_digits < 0;
-   if ((flags & dragon::fixup) !=3D 0) {
-     if (add_compare(numerator, *upper, denominator) + even <=3D 0) {
-       --exp10;
-@@ -3331,7 +2822,7 @@ FMT_CONSTEXPR20 inline void format_dragon(basic_fp=
<uint128_t> value,
-     if ((flags & dragon::fixed) !=3D 0) adjust_precision(num_digits, ex=
p10 + 1);
-   }
-   // Invariant: value =3D=3D (numerator / denominator) * pow(10, exp10)=
.
--  if (num_digits < 0) {
-+  if (shortest) {
-     // Generate the shortest representation.
-     num_digits =3D 0;
-     char* data =3D buf.data();
-@@ -3361,9 +2852,12 @@ FMT_CONSTEXPR20 inline void format_dragon(basic_f=
p<uint128_t> value,
-   }
-   // Generate the given number of digits.
-   exp10 -=3D num_digits - 1;
--  if (num_digits =3D=3D 0) {
--    denominator *=3D 10;
--    auto digit =3D add_compare(numerator, numerator, denominator) > 0 ?=
 '1' : '0';
-+  if (num_digits <=3D 0) {
-+    auto digit =3D '0';
-+    if (num_digits =3D=3D 0) {
-+      denominator *=3D 10;
-+      digit =3D add_compare(numerator, numerator, denominator) > 0 ? '1=
' : '0';
-+    }
-     buf.push_back(digit);
-     return;
-   }
-@@ -3386,7 +2880,10 @@ FMT_CONSTEXPR20 inline void format_dragon(basic_f=
p<uint128_t> value,
-       }
-       if (buf[0] =3D=3D overflow) {
-         buf[0] =3D '1';
--        ++exp10;
-+        if ((flags & dragon::fixed) !=3D 0)
-+          buf.push_back('0');
-+        else
-+          ++exp10;
-       }
-       return;
-     }
-@@ -3397,8 +2894,8 @@ FMT_CONSTEXPR20 inline void format_dragon(basic_fp=
<uint128_t> value,
-=20
- // Formats a floating-point number using the hexfloat format.
- template <typename Float, FMT_ENABLE_IF(!is_double_double<Float>::value=
)>
--FMT_CONSTEXPR20 void format_hexfloat(Float value, int precision,
--                                     float_specs specs, buffer<char>& b=
uf) {
-+FMT_CONSTEXPR20 void format_hexfloat(Float value, format_specs specs,
-+                                     buffer<char>& buf) {
-   // float is passed as double to reduce the number of instantiations a=
nd to
-   // simplify implementation.
-   static_assert(!std::is_same<Float, float>::value, "");
-@@ -3408,26 +2905,25 @@ FMT_CONSTEXPR20 void format_hexfloat(Float value=
, int precision,
-   // Assume Float is in the format [sign][exponent][significand].
-   using carrier_uint =3D typename info::carrier_uint;
-=20
--  constexpr auto num_float_significand_bits =3D
--      detail::num_significand_bits<Float>();
-+  const auto num_float_significand_bits =3D detail::num_significand_bit=
s<Float>();
-=20
-   basic_fp<carrier_uint> f(value);
-   f.e +=3D num_float_significand_bits;
-   if (!has_implicit_bit<Float>()) --f.e;
-=20
--  constexpr auto num_fraction_bits =3D
-+  const auto num_fraction_bits =3D
-       num_float_significand_bits + (has_implicit_bit<Float>() ? 1 : 0);
--  constexpr auto num_xdigits =3D (num_fraction_bits + 3) / 4;
-+  const auto num_xdigits =3D (num_fraction_bits + 3) / 4;
-=20
--  constexpr auto leading_shift =3D ((num_xdigits - 1) * 4);
-+  const auto leading_shift =3D ((num_xdigits - 1) * 4);
-   const auto leading_mask =3D carrier_uint(0xF) << leading_shift;
-   const auto leading_xdigit =3D
-       static_cast<uint32_t>((f.f & leading_mask) >> leading_shift);
-   if (leading_xdigit > 1) f.e -=3D (32 - countl_zero(leading_xdigit) - =
1);
-=20
-   int print_xdigits =3D num_xdigits - 1;
--  if (precision >=3D 0 && print_xdigits > precision) {
--    const int shift =3D ((print_xdigits - precision - 1) * 4);
-+  if (specs.precision >=3D 0 && print_xdigits > specs.precision) {
-+    const int shift =3D ((print_xdigits - specs.precision - 1) * 4);
-     const auto mask =3D carrier_uint(0xF) << shift;
-     const auto v =3D static_cast<uint32_t>((f.f & mask) >> shift);
-=20
-@@ -3446,25 +2942,25 @@ FMT_CONSTEXPR20 void format_hexfloat(Float value=
, int precision,
-       }
-     }
-=20
--    print_xdigits =3D precision;
-+    print_xdigits =3D specs.precision;
-   }
-=20
-   char xdigits[num_bits<carrier_uint>() / 4];
-   detail::fill_n(xdigits, sizeof(xdigits), '0');
--  format_uint<4>(xdigits, f.f, num_xdigits, specs.upper);
-+  format_base2e(4, xdigits, f.f, num_xdigits, specs.upper());
-=20
-   // Remove zero tail
-   while (print_xdigits > 0 && xdigits[print_xdigits] =3D=3D '0') --prin=
t_xdigits;
-=20
-   buf.push_back('0');
--  buf.push_back(specs.upper ? 'X' : 'x');
-+  buf.push_back(specs.upper() ? 'X' : 'x');
-   buf.push_back(xdigits[0]);
--  if (specs.showpoint || print_xdigits > 0 || print_xdigits < precision=
)
-+  if (specs.alt() || print_xdigits > 0 || print_xdigits < specs.precisi=
on)
-     buf.push_back('.');
-   buf.append(xdigits + 1, xdigits + 1 + print_xdigits);
--  for (; print_xdigits < precision; ++print_xdigits) buf.push_back('0')=
;
-+  for (; print_xdigits < specs.precision; ++print_xdigits) buf.push_bac=
k('0');
-=20
--  buf.push_back(specs.upper ? 'P' : 'p');
-+  buf.push_back(specs.upper() ? 'P' : 'p');
-=20
-   uint32_t abs_e;
-   if (f.e < 0) {
-@@ -3478,21 +2974,32 @@ FMT_CONSTEXPR20 void format_hexfloat(Float value=
, int precision,
- }
-=20
- template <typename Float, FMT_ENABLE_IF(is_double_double<Float>::value)=
>
--FMT_CONSTEXPR20 void format_hexfloat(Float value, int precision,
--                                     float_specs specs, buffer<char>& b=
uf) {
--  format_hexfloat(static_cast<double>(value), precision, specs, buf);
-+FMT_CONSTEXPR20 void format_hexfloat(Float value, format_specs specs,
-+                                     buffer<char>& buf) {
-+  format_hexfloat(static_cast<double>(value), specs, buf);
-+}
-+
-+constexpr auto fractional_part_rounding_thresholds(int index) -> uint32=
_t {
-+  // For checking rounding thresholds.
-+  // The kth entry is chosen to be the smallest integer such that the
-+  // upper 32-bits of 10^(k+1) times it is strictly bigger than 5 * 10^=
k.
-+  // It is equal to ceil(2^31 + 2^32/10^(k + 1)).
-+  // These are stored in a string literal because we cannot have static=
 arrays
-+  // in constexpr functions and non-static ones are poorly optimized.
-+  return U"\x9999999a\x828f5c29\x80418938\x80068db9\x8000a7c6\x800010c7=
"
-+         U"\x800001ae\x8000002b"[index];
- }
-=20
- template <typename Float>
--FMT_CONSTEXPR20 auto format_float(Float value, int precision, float_spe=
cs specs,
-+FMT_CONSTEXPR20 auto format_float(Float value, int precision,
-+                                  const format_specs& specs, bool binar=
y32,
-                                   buffer<char>& buf) -> int {
-   // float is passed as double to reduce the number of instantiations.
-   static_assert(!std::is_same<Float, float>::value, "");
--  FMT_ASSERT(value >=3D 0, "value is negative");
-   auto converted_value =3D convert_float(value);
-=20
--  const bool fixed =3D specs.format =3D=3D float_format::fixed;
--  if (value <=3D 0) {  // <=3D instead of =3D=3D to silence a warning.
-+  const bool fixed =3D specs.type() =3D=3D presentation_type::fixed;
-+  if (value =3D=3D 0) {
-     if (precision <=3D 0 || !fixed) {
-       buf.push_back('0');
-       return 0;
-@@ -3505,7 +3012,7 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-   int exp =3D 0;
-   bool use_dragon =3D true;
-   unsigned dragon_flags =3D 0;
--  if (!is_fast_float<Float>()) {
-+  if (!is_fast_float<Float>() || is_constant_evaluated()) {
-     const auto inv_log2_10 =3D 0.3010299956639812;  // 1 / log2(10)
-     using info =3D dragonbox::float_info<decltype(converted_value)>;
-     const auto f =3D basic_fp<typename info::carrier_uint>(converted_va=
lue);
-@@ -3513,38 +3020,10 @@ FMT_CONSTEXPR20 auto format_float(Float value, i=
nt precision, float_specs specs,
-     //   10^(exp - 1) <=3D value < 10^exp or 10^exp <=3D value < 10^(ex=
p + 1).
-     // This is based on log10(value) =3D=3D log2(value) / log2(10) and =
approximation
-     // of log2(value) by e + num_fraction_bits idea from double-convers=
ion.
--    exp =3D static_cast<int>(
--        std::ceil((f.e + count_digits<1>(f.f) - 1) * inv_log2_10 - 1e-1=
0));
-+    auto e =3D (f.e + count_digits<1>(f.f) - 1) * inv_log2_10 - 1e-10;
-+    exp =3D static_cast<int>(e);
-+    if (e > exp) ++exp;  // Compute ceil.
-     dragon_flags =3D dragon::fixup;
--  } else if (!is_constant_evaluated() && precision < 0) {
--    // Use Dragonbox for the shortest format.
--    if (specs.binary32) {
--      auto dec =3D dragonbox::to_decimal(static_cast<float>(value));
--      write<char>(buffer_appender<char>(buf), dec.significand);
--      return dec.exponent;
--    }
--    auto dec =3D dragonbox::to_decimal(static_cast<double>(value));
--    write<char>(buffer_appender<char>(buf), dec.significand);
--    return dec.exponent;
--  } else if (is_constant_evaluated()) {
--    // Use Grisu + Dragon4 for the given precision:
--    // https://www.cs.tufts.edu/~nr/cs257/archive/florian-loitsch/print=
f.pdf.
--    const int min_exp =3D -60;  // alpha in Grisu.
--    int cached_exp10 =3D 0;     // K in Grisu.
--    fp normalized =3D normalize(fp(converted_value));
--    const auto cached_pow =3D get_cached_power(
--        min_exp - (normalized.e + fp::num_significand_bits), cached_exp=
10);
--    normalized =3D normalized * cached_pow;
--    gen_digits_handler handler{buf.data(), 0, precision, -cached_exp10,=
 fixed};
--    if (grisu_gen_digits(normalized, 1, exp, handler) !=3D digits::erro=
r &&
--        !is_constant_evaluated()) {
--      exp +=3D handler.exp10;
--      buf.try_resize(to_unsigned(handler.size));
--      use_dragon =3D false;
--    } else {
--      exp +=3D handler.size - cached_exp10 - 1;
--      precision =3D handler.precision;
--    }
-   } else {
-     // Extract significand bits and exponent bits.
-     using info =3D dragonbox::float_info<double>;
-@@ -3563,7 +3042,7 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-       significand <<=3D 1;
-     } else {
-       // Normalize subnormal inputs.
--      FMT_ASSERT(significand !=3D 0, "zeros should not appear hear");
-+      FMT_ASSERT(significand !=3D 0, "zeros should not appear here");
-       int shift =3D countl_zero(significand);
-       FMT_ASSERT(shift >=3D num_bits<uint64_t>() - num_significand_bits=
<double>(),
-                  "");
-@@ -3600,9 +3079,7 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-     }
-=20
-     // Compute the actual number of decimal digits to print.
--    if (fixed) {
--      adjust_precision(precision, exp + digits_in_the_first_segment);
--    }
-+    if (fixed) adjust_precision(precision, exp + digits_in_the_first_se=
gment);
-=20
-     // Use Dragon4 only when there might be not enough digits in the fi=
rst
-     // segment.
-@@ -3645,7 +3122,7 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-         uint64_t prod;
-         uint32_t digits;
-         bool should_round_up;
--        int number_of_digits_to_print =3D precision > 9 ? 9 : precision=
;
-+        int number_of_digits_to_print =3D min_of(precision, 9);
-=20
-         // Print a 9-digits subsegment, either the first or the second.
-         auto print_subsegment =3D [&](uint32_t subsegment, char* buffer=
) {
-@@ -3673,7 +3150,7 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-             // for details.
-             prod =3D ((subsegment * static_cast<uint64_t>(450359963)) >=
> 20) + 1;
-             digits =3D static_cast<uint32_t>(prod >> 32);
--            copy2(buffer, digits2(digits));
-+            write2digits(buffer, digits);
-             number_of_digits_printed +=3D 2;
-           }
-=20
-@@ -3681,7 +3158,7 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-           while (number_of_digits_printed < number_of_digits_to_print) =
{
-             prod =3D static_cast<uint32_t>(prod) * static_cast<uint64_t=
>(100);
-             digits =3D static_cast<uint32_t>(prod >> 32);
--            copy2(buffer + number_of_digits_printed, digits2(digits));
-+            write2digits(buffer + number_of_digits_printed, digits);
-             number_of_digits_printed +=3D 2;
-           }
-         };
-@@ -3707,12 +3184,12 @@ FMT_CONSTEXPR20 auto format_float(Float value, i=
nt precision, float_specs specs,
-           //    fractional part is strictly larger than 1/2.
-           if (precision < 9) {
-             uint32_t fractional_part =3D static_cast<uint32_t>(prod);
--            should_round_up =3D fractional_part >=3D
--                                  data::fractional_part_rounding_thresh=
olds
--                                      [8 - number_of_digits_to_print] |=
|
--                              ((fractional_part >> 31) &
--                               ((digits & 1) | (second_third_subsegment=
s !=3D 0) |
--                                has_more_segments)) !=3D 0;
-+            should_round_up =3D
-+                fractional_part >=3D fractional_part_rounding_threshold=
s(
-+                                       8 - number_of_digits_to_print) |=
|
-+                ((fractional_part >> 31) &
-+                 ((digits & 1) | (second_third_subsegments !=3D 0) |
-+                  has_more_segments)) !=3D 0;
-           }
-           // Rounding at the subsegment boundary.
-           // In this case, the fractional part is at least 1/2 if and o=
nly if
-@@ -3747,12 +3224,12 @@ FMT_CONSTEXPR20 auto format_float(Float value, i=
nt precision, float_specs specs,
-             // of 19 digits, so in this case the third segment should b=
e
-             // consisting of a genuine digit from the input.
-             uint32_t fractional_part =3D static_cast<uint32_t>(prod);
--            should_round_up =3D fractional_part >=3D
--                                  data::fractional_part_rounding_thresh=
olds
--                                      [8 - number_of_digits_to_print] |=
|
--                              ((fractional_part >> 31) &
--                               ((digits & 1) | (third_subsegment !=3D 0=
) |
--                                has_more_segments)) !=3D 0;
-+            should_round_up =3D
-+                fractional_part >=3D fractional_part_rounding_threshold=
s(
-+                                       8 - number_of_digits_to_print) |=
|
-+                ((fractional_part >> 31) &
-+                 ((digits & 1) | (third_subsegment !=3D 0) |
-+                  has_more_segments)) !=3D 0;
-           }
-           // Rounding at the subsegment boundary.
-           else {
-@@ -3790,9 +3267,8 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-   }
-   if (use_dragon) {
-     auto f =3D basic_fp<uint128_t>();
--    bool is_predecessor_closer =3D specs.binary32
--                                     ? f.assign(static_cast<float>(valu=
e))
--                                     : f.assign(converted_value);
-+    bool is_predecessor_closer =3D binary32 ? f.assign(static_cast<floa=
t>(value))
-+                                          : f.assign(converted_value);
-     if (is_predecessor_closer) dragon_flags |=3D dragon::predecessor_cl=
oser;
-     if (fixed) dragon_flags |=3D dragon::fixed;
-     // Limit precision to the maximum possible number of significant di=
gits in
-@@ -3801,7 +3277,7 @@ FMT_CONSTEXPR20 auto format_float(Float value, int=
 precision, float_specs specs,
-     if (precision > max_double_digits) precision =3D max_double_digits;
-     format_dragon(f, dragon_flags, precision, buf, exp);
-   }
--  if (!fixed && !specs.showpoint) {
-+  if (!fixed && !specs.alt()) {
-     // Remove trailing zeros.
-     auto num_digits =3D buf.size();
-     while (num_digits > 0 && buf[num_digits - 1] =3D=3D '0') {
-@@ -3812,97 +3288,106 @@ FMT_CONSTEXPR20 auto format_float(Float value, =
int precision, float_specs specs,
-   }
-   return exp;
- }
-+
-+// Numbers with exponents greater or equal to the returned value will u=
se
-+// the exponential notation.
-+template <typename T> constexpr auto exp_upper() -> int {
-+  return std::numeric_limits<T>::digits10 !=3D 0
-+             ? min_of(16, std::numeric_limits<T>::digits10 + 1)
-+             : 16;
-+}
-+
- template <typename Char, typename OutputIt, typename T>
--FMT_CONSTEXPR20 auto write_float(OutputIt out, T value,
--                                 format_specs<Char> specs, locale_ref l=
oc)
--    -> OutputIt {
--  float_specs fspecs =3D parse_float_type_spec(specs);
--  fspecs.sign =3D specs.sign;
--  if (detail::signbit(value)) {  // value < 0 is false for NaN so use s=
ignbit.
--    fspecs.sign =3D sign::minus;
--    value =3D -value;
--  } else if (fspecs.sign =3D=3D sign::minus) {
--    fspecs.sign =3D sign::none;
--  }
-+FMT_CONSTEXPR20 auto write_float(OutputIt out, T value, format_specs sp=
ecs,
-+                                 locale_ref loc) -> OutputIt {
-+  // Use signbit because value < 0 is false for NaN.
-+  sign s =3D detail::signbit(value) ? sign::minus : specs.sign();
-=20
-   if (!detail::isfinite(value))
--    return write_nonfinite(out, detail::isnan(value), specs, fspecs);
-+    return write_nonfinite<Char>(out, detail::isnan(value), specs, s);
-=20
--  if (specs.align =3D=3D align::numeric && fspecs.sign) {
--    auto it =3D reserve(out, 1);
--    *it++ =3D detail::sign<Char>(fspecs.sign);
--    out =3D base_iterator(out, it);
--    fspecs.sign =3D sign::none;
-+  if (specs.align() =3D=3D align::numeric && s !=3D sign::none) {
-+    *out++ =3D detail::getsign<Char>(s);
-+    s =3D sign::none;
-     if (specs.width !=3D 0) --specs.width;
-   }
-=20
-+  constexpr int exp_upper =3D detail::exp_upper<T>();
-+  int precision =3D specs.precision;
-+  if (precision < 0) {
-+    if (specs.type() !=3D presentation_type::none) {
-+      precision =3D 6;
-+    } else if (is_fast_float<T>::value && !is_constant_evaluated()) {
-+      // Use Dragonbox for the shortest format.
-+      using floaty =3D conditional_t<sizeof(T) >=3D sizeof(double), dou=
ble, float>;
-+      auto dec =3D dragonbox::to_decimal(static_cast<floaty>(value));
-+      return write_float<Char>(out, dec, specs, s, exp_upper, loc);
-+    }
-+  }
-+
-   memory_buffer buffer;
--  if (fspecs.format =3D=3D float_format::hex) {
--    if (fspecs.sign) buffer.push_back(detail::sign<char>(fspecs.sign));
--    format_hexfloat(convert_float(value), specs.precision, fspecs, buff=
er);
--    return write_bytes<align::right>(out, {buffer.data(), buffer.size()=
},
--                                     specs);
--  }
--  int precision =3D specs.precision >=3D 0 || specs.type =3D=3D present=
ation_type::none
--                      ? specs.precision
--                      : 6;
--  if (fspecs.format =3D=3D float_format::exp) {
-+  if (specs.type() =3D=3D presentation_type::hexfloat) {
-+    if (s !=3D sign::none) buffer.push_back(detail::getsign<char>(s));
-+    format_hexfloat(convert_float(value), specs, buffer);
-+    return write_bytes<Char, align::right>(out, {buffer.data(), buffer.=
size()},
-+                                           specs);
-+  }
-+
-+  if (specs.type() =3D=3D presentation_type::exp) {
-     if (precision =3D=3D max_value<int>())
--      throw_format_error("number is too big");
-+      report_error("number is too big");
-     else
-       ++precision;
--  } else if (fspecs.format !=3D float_format::fixed && precision =3D=3D=
 0) {
-+    if (specs.precision !=3D 0) specs.set_alt();
-+  } else if (specs.type() =3D=3D presentation_type::fixed) {
-+    if (specs.precision !=3D 0) specs.set_alt();
-+  } else if (precision =3D=3D 0) {
-     precision =3D 1;
-   }
--  if (const_check(std::is_same<T, float>())) fspecs.binary32 =3D true;
--  int exp =3D format_float(convert_float(value), precision, fspecs, buf=
fer);
--  fspecs.precision =3D precision;
-+  int exp =3D format_float(convert_float(value), precision, specs,
-+                         std::is_same<T, float>(), buffer);
-+
-+  specs.precision =3D precision;
-   auto f =3D big_decimal_fp{buffer.data(), static_cast<int>(buffer.size=
()), exp};
--  return write_float(out, f, specs, fspecs, loc);
-+  return write_float<Char>(out, f, specs, s, exp_upper, loc);
- }
-=20
- template <typename Char, typename OutputIt, typename T,
-           FMT_ENABLE_IF(is_floating_point<T>::value)>
--FMT_CONSTEXPR20 auto write(OutputIt out, T value, format_specs<Char> sp=
ecs,
-+FMT_CONSTEXPR20 auto write(OutputIt out, T value, format_specs specs,
-                            locale_ref loc =3D {}) -> OutputIt {
--  if (const_check(!is_supported_floating_point(value))) return out;
--  return specs.localized && write_loc(out, value, specs, loc)
-+  return specs.localized() && write_loc(out, value, specs, loc)
-              ? out
--             : write_float(out, value, specs, loc);
-+             : write_float<Char>(out, value, specs, loc);
- }
-=20
- template <typename Char, typename OutputIt, typename T,
-           FMT_ENABLE_IF(is_fast_float<T>::value)>
- FMT_CONSTEXPR20 auto write(OutputIt out, T value) -> OutputIt {
--  if (is_constant_evaluated()) return write(out, value, format_specs<Ch=
ar>());
--  if (const_check(!is_supported_floating_point(value))) return out;
-+  if (is_constant_evaluated()) return write<Char>(out, value, format_sp=
ecs());
-=20
--  auto fspecs =3D float_specs();
--  if (detail::signbit(value)) {
--    fspecs.sign =3D sign::minus;
--    value =3D -value;
--  }
-+  auto s =3D detail::signbit(value) ? sign::minus : sign::none;
-=20
--  constexpr auto specs =3D format_specs<Char>();
--  using floaty =3D conditional_t<std::is_same<T, long double>::value, d=
ouble, T>;
-+  constexpr auto specs =3D format_specs();
-+  using floaty =3D conditional_t<sizeof(T) >=3D sizeof(double), double,=
 float>;
-   using floaty_uint =3D typename dragonbox::float_info<floaty>::carrier=
_uint;
-   floaty_uint mask =3D exponent_mask<floaty>();
-   if ((bit_cast<floaty_uint>(value) & mask) =3D=3D mask)
--    return write_nonfinite(out, std::isnan(value), specs, fspecs);
-+    return write_nonfinite<Char>(out, std::isnan(value), specs, s);
-=20
-   auto dec =3D dragonbox::to_decimal(static_cast<floaty>(value));
--  return write_float(out, dec, specs, fspecs, {});
-+  return write_float<Char>(out, dec, specs, s, exp_upper<T>(), {});
- }
-=20
- template <typename Char, typename OutputIt, typename T,
-           FMT_ENABLE_IF(is_floating_point<T>::value &&
-                         !is_fast_float<T>::value)>
- inline auto write(OutputIt out, T value) -> OutputIt {
--  return write(out, value, format_specs<Char>());
-+  return write<Char>(out, value, format_specs());
- }
-=20
- template <typename Char, typename OutputIt>
--auto write(OutputIt out, monostate, format_specs<Char> =3D {}, locale_r=
ef =3D {})
-+auto write(OutputIt out, monostate, format_specs =3D {}, locale_ref =3D=
 {})
-     -> OutputIt {
-   FMT_ASSERT(false, "");
-   return out;
-@@ -3911,13 +3396,11 @@ auto write(OutputIt out, monostate, format_specs=
<Char> =3D {}, locale_ref =3D {})
- template <typename Char, typename OutputIt>
- FMT_CONSTEXPR auto write(OutputIt out, basic_string_view<Char> value)
-     -> OutputIt {
--  auto it =3D reserve(out, value.size());
--  it =3D copy_str_noinline<Char>(value.begin(), value.end(), it);
--  return base_iterator(out, it);
-+  return copy_noinline<Char>(value.begin(), value.end(), out);
- }
-=20
- template <typename Char, typename OutputIt, typename T,
--          FMT_ENABLE_IF(is_string<T>::value)>
-+          FMT_ENABLE_IF(has_to_string_view<T>::value)>
- constexpr auto write(OutputIt out, const T& value) -> OutputIt {
-   return write<Char>(out, to_string_view(value));
- }
-@@ -3925,10 +3408,8 @@ constexpr auto write(OutputIt out, const T& value=
) -> OutputIt {
- // FMT_ENABLE_IF() condition separated to workaround an MSVC bug.
- template <
-     typename Char, typename OutputIt, typename T,
--    bool check =3D
--        std::is_enum<T>::value && !std::is_same<T, Char>::value &&
--        mapped_type_constant<T, basic_format_context<OutputIt, Char>>::=
value !=3D
--            type::custom_type,
-+    bool check =3D std::is_enum<T>::value && !std::is_same<T, Char>::va=
lue &&
-+                 mapped_type_constant<T, Char>::value !=3D type::custom=
_type,
-     FMT_ENABLE_IF(check)>
- FMT_CONSTEXPR auto write(OutputIt out, T value) -> OutputIt {
-   return write<Char>(out, static_cast<underlying_t<T>>(value));
-@@ -3936,13 +3417,12 @@ FMT_CONSTEXPR auto write(OutputIt out, T value) =
-> OutputIt {
-=20
- template <typename Char, typename OutputIt, typename T,
-           FMT_ENABLE_IF(std::is_same<T, bool>::value)>
--FMT_CONSTEXPR auto write(OutputIt out, T value,
--                         const format_specs<Char>& specs =3D {}, locale=
_ref =3D {})
--    -> OutputIt {
--  return specs.type !=3D presentation_type::none &&
--                 specs.type !=3D presentation_type::string
--             ? write(out, value ? 1 : 0, specs, {})
--             : write_bytes(out, value ? "true" : "false", specs);
-+FMT_CONSTEXPR auto write(OutputIt out, T value, const format_specs& spe=
cs =3D {},
-+                         locale_ref =3D {}) -> OutputIt {
-+  return specs.type() !=3D presentation_type::none &&
-+                 specs.type() !=3D presentation_type::string
-+             ? write<Char>(out, value ? 1 : 0, specs, {})
-+             : write_bytes<Char>(out, value ? "true" : "false", specs);
- }
-=20
- template <typename Char, typename OutputIt>
-@@ -3953,202 +3433,150 @@ FMT_CONSTEXPR auto write(OutputIt out, Char va=
lue) -> OutputIt {
- }
-=20
- template <typename Char, typename OutputIt>
--FMT_CONSTEXPR_CHAR_TRAITS auto write(OutputIt out, const Char* value)
--    -> OutputIt {
-+FMT_CONSTEXPR20 auto write(OutputIt out, const Char* value) -> OutputIt=
 {
-   if (value) return write(out, basic_string_view<Char>(value));
--  throw_format_error("string pointer is null");
-+  report_error("string pointer is null");
-   return out;
- }
-=20
- template <typename Char, typename OutputIt, typename T,
-           FMT_ENABLE_IF(std::is_same<T, void>::value)>
--auto write(OutputIt out, const T* value, const format_specs<Char>& spec=
s =3D {},
-+auto write(OutputIt out, const T* value, const format_specs& specs =3D =
{},
-            locale_ref =3D {}) -> OutputIt {
-   return write_ptr<Char>(out, bit_cast<uintptr_t>(value), &specs);
- }
-=20
--// A write overload that handles implicit conversions.
- template <typename Char, typename OutputIt, typename T,
--          typename Context =3D basic_format_context<OutputIt, Char>>
--FMT_CONSTEXPR auto write(OutputIt out, const T& value) -> enable_if_t<
--    std::is_class<T>::value && !is_string<T>::value &&
--        !is_floating_point<T>::value && !std::is_same<T, Char>::value &=
&
--        !std::is_same<T, remove_cvref_t<decltype(arg_mapper<Context>().=
map(
--                             value))>>::value,
--    OutputIt> {
--  return write<Char>(out, arg_mapper<Context>().map(value));
-+          FMT_ENABLE_IF(mapped_type_constant<T, Char>::value =3D=3D
-+                            type::custom_type &&
-+                        !std::is_fundamental<T>::value)>
-+FMT_CONSTEXPR auto write(OutputIt out, const T& value) -> OutputIt {
-+  auto f =3D formatter<T, Char>();
-+  auto parse_ctx =3D parse_context<Char>({});
-+  f.parse(parse_ctx);
-+  auto ctx =3D basic_format_context<OutputIt, Char>(out, {}, {});
-+  return f.format(value, ctx);
- }
-=20
--template <typename Char, typename OutputIt, typename T,
--          typename Context =3D basic_format_context<OutputIt, Char>>
--FMT_CONSTEXPR auto write(OutputIt out, const T& value)
--    -> enable_if_t<mapped_type_constant<T, Context>::value =3D=3D type:=
:custom_type,
--                   OutputIt> {
--  auto ctx =3D Context(out, {}, {});
--  return typename Context::template formatter_type<T>().format(value, c=
tx);
--}
-+template <typename T>
-+using is_builtin =3D
-+    bool_constant<std::is_same<T, int>::value || FMT_BUILTIN_TYPES>;
-=20
- // An argument visitor that formats the argument and writes it via the =
output
- // iterator. It's a class and not a generic lambda for compatibility wi=
th C++11.
- template <typename Char> struct default_arg_formatter {
--  using iterator =3D buffer_appender<Char>;
--  using context =3D buffer_context<Char>;
-+  using context =3D buffered_context<Char>;
-=20
--  iterator out;
--  basic_format_args<context> args;
--  locale_ref loc;
-+  basic_appender<Char> out;
-=20
--  template <typename T> auto operator()(T value) -> iterator {
--    return write<Char>(out, value);
--  }
--  auto operator()(typename basic_format_arg<context>::handle h) -> iter=
ator {
--    basic_format_parse_context<Char> parse_ctx({});
--    context format_ctx(out, args, loc);
--    h.format(parse_ctx, format_ctx);
--    return format_ctx.out();
--  }
--};
--
--template <typename Char> struct arg_formatter {
--  using iterator =3D buffer_appender<Char>;
--  using context =3D buffer_context<Char>;
-+  void operator()(monostate) { report_error("argument not found"); }
-=20
--  iterator out;
--  const format_specs<Char>& specs;
--  locale_ref locale;
--
--  template <typename T>
--  FMT_CONSTEXPR FMT_INLINE auto operator()(T value) -> iterator {
--    return detail::write(out, value, specs, locale);
--  }
--  auto operator()(typename basic_format_arg<context>::handle) -> iterat=
or {
--    // User-defined types are handled separately because they require a=
ccess
--    // to the parse context.
--    return out;
-+  template <typename T, FMT_ENABLE_IF(is_builtin<T>::value)>
-+  void operator()(T value) {
-+    write<Char>(out, value);
-   }
--};
-=20
--template <typename Char> struct custom_formatter {
--  basic_format_parse_context<Char>& parse_ctx;
--  buffer_context<Char>& ctx;
-+  template <typename T, FMT_ENABLE_IF(!is_builtin<T>::value)>
-+  void operator()(T) {
-+    FMT_ASSERT(false, "");
-+  }
-=20
--  void operator()(
--      typename basic_format_arg<buffer_context<Char>>::handle h) const =
{
--    h.format(parse_ctx, ctx);
-+  void operator()(typename basic_format_arg<context>::handle h) {
-+    // Use a null locale since the default format must be unlocalized.
-+    auto parse_ctx =3D parse_context<Char>({});
-+    auto format_ctx =3D context(out, {}, {});
-+    h.format(parse_ctx, format_ctx);
-   }
--  template <typename T> void operator()(T) const {}
- };
-=20
--template <typename ErrorHandler> class width_checker {
-- public:
--  explicit FMT_CONSTEXPR width_checker(ErrorHandler& eh) : handler_(eh)=
 {}
-+template <typename Char> struct arg_formatter {
-+  basic_appender<Char> out;
-+  const format_specs& specs;
-+  FMT_NO_UNIQUE_ADDRESS locale_ref locale;
-=20
--  template <typename T, FMT_ENABLE_IF(is_integer<T>::value)>
--  FMT_CONSTEXPR auto operator()(T value) -> unsigned long long {
--    if (is_negative(value)) handler_.on_error("negative width");
--    return static_cast<unsigned long long>(value);
-+  template <typename T, FMT_ENABLE_IF(is_builtin<T>::value)>
-+  FMT_CONSTEXPR FMT_INLINE void operator()(T value) {
-+    detail::write<Char>(out, value, specs, locale);
-   }
-=20
--  template <typename T, FMT_ENABLE_IF(!is_integer<T>::value)>
--  FMT_CONSTEXPR auto operator()(T) -> unsigned long long {
--    handler_.on_error("width is not integer");
--    return 0;
-+  template <typename T, FMT_ENABLE_IF(!is_builtin<T>::value)>
-+  void operator()(T) {
-+    FMT_ASSERT(false, "");
-   }
-=20
-- private:
--  ErrorHandler& handler_;
-+  void operator()(typename basic_format_arg<buffered_context<Char>>::ha=
ndle) {
-+    // User-defined types are handled separately because they require a=
ccess
-+    // to the parse context.
-+  }
- };
-=20
--template <typename ErrorHandler> class precision_checker {
-- public:
--  explicit FMT_CONSTEXPR precision_checker(ErrorHandler& eh) : handler_=
(eh) {}
--
-+struct dynamic_spec_getter {
-   template <typename T, FMT_ENABLE_IF(is_integer<T>::value)>
-   FMT_CONSTEXPR auto operator()(T value) -> unsigned long long {
--    if (is_negative(value)) handler_.on_error("negative precision");
--    return static_cast<unsigned long long>(value);
-+    return is_negative(value) ? ~0ull : static_cast<unsigned long long>=
(value);
-   }
-=20
-   template <typename T, FMT_ENABLE_IF(!is_integer<T>::value)>
-   FMT_CONSTEXPR auto operator()(T) -> unsigned long long {
--    handler_.on_error("precision is not integer");
-+    report_error("width/precision is not integer");
-     return 0;
-   }
--
-- private:
--  ErrorHandler& handler_;
- };
-=20
--template <template <typename> class Handler, typename FormatArg,
--          typename ErrorHandler>
--FMT_CONSTEXPR auto get_dynamic_spec(FormatArg arg, ErrorHandler eh) -> =
int {
--  unsigned long long value =3D visit_format_arg(Handler<ErrorHandler>(e=
h), arg);
--  if (value > to_unsigned(max_value<int>())) eh.on_error("number is too=
 big");
--  return static_cast<int>(value);
--}
--
- template <typename Context, typename ID>
--FMT_CONSTEXPR auto get_arg(Context& ctx, ID id) -> decltype(ctx.arg(id)=
) {
-+FMT_CONSTEXPR auto get_arg(Context& ctx, ID id) -> basic_format_arg<Con=
text> {
-   auto arg =3D ctx.arg(id);
--  if (!arg) ctx.on_error("argument not found");
-+  if (!arg) report_error("argument not found");
-   return arg;
- }
-=20
--template <template <typename> class Handler, typename Context>
--FMT_CONSTEXPR void handle_dynamic_spec(int& value,
--                                       arg_ref<typename Context::char_t=
ype> ref,
--                                       Context& ctx) {
--  switch (ref.kind) {
--  case arg_id_kind::none:
--    break;
--  case arg_id_kind::index:
--    value =3D detail::get_dynamic_spec<Handler>(get_arg(ctx, ref.val.in=
dex),
--                                              ctx.error_handler());
--    break;
--  case arg_id_kind::name:
--    value =3D detail::get_dynamic_spec<Handler>(get_arg(ctx, ref.val.na=
me),
--                                              ctx.error_handler());
--    break;
--  }
-+template <typename Context>
-+FMT_CONSTEXPR int get_dynamic_spec(
-+    arg_id_kind kind, const arg_ref<typename Context::char_type>& ref,
-+    Context& ctx) {
-+  FMT_ASSERT(kind !=3D arg_id_kind::none, "");
-+  auto arg =3D
-+      kind =3D=3D arg_id_kind::index ? ctx.arg(ref.index) : ctx.arg(ref=
.name);
-+  if (!arg) report_error("argument not found");
-+  unsigned long long value =3D arg.visit(dynamic_spec_getter());
-+  if (value > to_unsigned(max_value<int>()))
-+    report_error("width/precision is out of range");
-+  return static_cast<int>(value);
- }
-=20
--#if FMT_USE_USER_DEFINED_LITERALS
--template <typename Char> struct udl_formatter {
--  basic_string_view<Char> str;
--
--  template <typename... T>
--  auto operator()(T&&... args) const -> std::basic_string<Char> {
--    return vformat(str, fmt::make_format_args<buffer_context<Char>>(arg=
s...));
--  }
--};
-+template <typename Context>
-+FMT_CONSTEXPR void handle_dynamic_spec(
-+    arg_id_kind kind, int& value,
-+    const arg_ref<typename Context::char_type>& ref, Context& ctx) {
-+  if (kind !=3D arg_id_kind::none) value =3D get_dynamic_spec(kind, ref=
, ctx);
-+}
-=20
--#  if FMT_USE_NONTYPE_TEMPLATE_ARGS
-+#if FMT_USE_NONTYPE_TEMPLATE_ARGS
- template <typename T, typename Char, size_t N,
--          fmt::detail_exported::fixed_string<Char, N> Str>
--struct statically_named_arg : view {
-+          fmt::detail::fixed_string<Char, N> Str>
-+struct static_named_arg : view {
-   static constexpr auto name =3D Str.data;
-=20
-   const T& value;
--  statically_named_arg(const T& v) : value(v) {}
-+  static_named_arg(const T& v) : value(v) {}
- };
-=20
- template <typename T, typename Char, size_t N,
--          fmt::detail_exported::fixed_string<Char, N> Str>
--struct is_named_arg<statically_named_arg<T, Char, N, Str>> : std::true_=
type {};
-+          fmt::detail::fixed_string<Char, N> Str>
-+struct is_named_arg<static_named_arg<T, Char, N, Str>> : std::true_type=
 {};
-=20
- template <typename T, typename Char, size_t N,
--          fmt::detail_exported::fixed_string<Char, N> Str>
--struct is_statically_named_arg<statically_named_arg<T, Char, N, Str>>
--    : std::true_type {};
-+          fmt::detail::fixed_string<Char, N> Str>
-+struct is_static_named_arg<static_named_arg<T, Char, N, Str>> : std::tr=
ue_type {
-+};
-=20
--template <typename Char, size_t N,
--          fmt::detail_exported::fixed_string<Char, N> Str>
-+template <typename Char, size_t N, fmt::detail::fixed_string<Char, N> S=
tr>
- struct udl_arg {
-   template <typename T> auto operator=3D(T&& value) const {
--    return statically_named_arg<T, Char, N, Str>(std::forward<T>(value)=
);
-+    return static_named_arg<T, Char, N, Str>(std::forward<T>(value));
-   }
- };
--#  else
-+#else
- template <typename Char> struct udl_arg {
-   const Char* str;
-=20
-@@ -4156,195 +3584,258 @@ template <typename Char> struct udl_arg {
-     return {str, std::forward<T>(value)};
-   }
- };
--#  endif
--#endif  // FMT_USE_USER_DEFINED_LITERALS
-+#endif  // FMT_USE_NONTYPE_TEMPLATE_ARGS
-=20
--template <typename Locale, typename Char>
--auto vformat(const Locale& loc, basic_string_view<Char> fmt,
--             basic_format_args<buffer_context<type_identity_t<Char>>> a=
rgs)
--    -> std::basic_string<Char> {
--  auto buf =3D basic_memory_buffer<Char>();
--  detail::vformat_to(buf, fmt, args, detail::locale_ref(loc));
--  return {buf.data(), buf.size()};
--}
-+template <typename Char> struct format_handler {
-+  parse_context<Char> parse_ctx;
-+  buffered_context<Char> ctx;
-+
-+  void on_text(const Char* begin, const Char* end) {
-+    copy_noinline<Char>(begin, end, ctx.out());
-+  }
-+
-+  FMT_CONSTEXPR auto on_arg_id() -> int { return parse_ctx.next_arg_id(=
); }
-+  FMT_CONSTEXPR auto on_arg_id(int id) -> int {
-+    parse_ctx.check_arg_id(id);
-+    return id;
-+  }
-+  FMT_CONSTEXPR auto on_arg_id(basic_string_view<Char> id) -> int {
-+    parse_ctx.check_arg_id(id);
-+    int arg_id =3D ctx.arg_id(id);
-+    if (arg_id < 0) report_error("argument not found");
-+    return arg_id;
-+  }
-+
-+  FMT_INLINE void on_replacement_field(int id, const Char*) {
-+    ctx.arg(id).visit(default_arg_formatter<Char>{ctx.out()});
-+  }
-+
-+  auto on_format_specs(int id, const Char* begin, const Char* end)
-+      -> const Char* {
-+    auto arg =3D get_arg(ctx, id);
-+    // Not using a visitor for custom types gives better codegen.
-+    if (arg.format_custom(begin, parse_ctx, ctx)) return parse_ctx.begi=
n();
-+
-+    auto specs =3D dynamic_format_specs<Char>();
-+    begin =3D parse_format_specs(begin, end, specs, parse_ctx, arg.type=
());
-+    if (specs.dynamic()) {
-+      handle_dynamic_spec(specs.dynamic_width(), specs.width, specs.wid=
th_ref,
-+                          ctx);
-+      handle_dynamic_spec(specs.dynamic_precision(), specs.precision,
-+                          specs.precision_ref, ctx);
-+    }
-+
-+    arg.visit(arg_formatter<Char>{ctx.out(), specs, ctx.locale()});
-+    return begin;
-+  }
-+
-+  FMT_NORETURN void on_error(const char* message) { report_error(messag=
e); }
-+};
-=20
- using format_func =3D void (*)(detail::buffer<char>&, int, const char*)=
;
-+FMT_API void do_report_error(format_func func, int error_code,
-+                             const char* message) noexcept;
-=20
- FMT_API void format_error_code(buffer<char>& out, int error_code,
-                                string_view message) noexcept;
-=20
--FMT_API void report_error(format_func func, int error_code,
--                          const char* message) noexcept;
--FMT_END_DETAIL_NAMESPACE
-+template <typename T, typename Char, type TYPE>
-+template <typename FormatContext>
-+FMT_CONSTEXPR auto native_formatter<T, Char, TYPE>::format(
-+    const T& val, FormatContext& ctx) const -> decltype(ctx.out()) {
-+  if (!specs_.dynamic())
-+    return write<Char>(ctx.out(), val, specs_, ctx.locale());
-+  auto specs =3D format_specs(specs_);
-+  handle_dynamic_spec(specs.dynamic_width(), specs.width, specs_.width_=
ref,
-+                      ctx);
-+  handle_dynamic_spec(specs.dynamic_precision(), specs.precision,
-+                      specs_.precision_ref, ctx);
-+  return write<Char>(ctx.out(), val, specs, ctx.locale());
-+}
-+
-+// DEPRECATED! https://github.com/fmtlib/fmt/issues/4292.
-+template <typename T, typename Enable =3D void>
-+struct is_locale : std::false_type {};
-+template <typename T>
-+struct is_locale<T, void_t<decltype(T::classic())>> : std::true_type {}=
;
-=20
--FMT_API auto vsystem_error(int error_code, string_view format_str,
--                           format_args args) -> std::system_error;
-+// DEPRECATED!
-+template <typename Char =3D char> struct vformat_args {
-+  using type =3D basic_format_args<buffered_context<Char>>;
-+};
-+template <> struct vformat_args<char> {
-+  using type =3D format_args;
-+};
-=20
--/**
--  \rst
--  Constructs :class:`std::system_error` with a message formatted with
--  ``fmt::format(fmt, args...)``.
--  *error_code* is a system error code as given by ``errno``.
--
--  **Example**::
--
--    // This throws std::system_error with the description
--    //   cannot open file 'madeup': No such file or directory
--    // or similar (system message may vary).
--    const char* filename =3D "madeup";
--    std::FILE* file =3D std::fopen(filename, "r");
--    if (!file)
--      throw fmt::system_error(errno, "cannot open file '{}'", filename)=
;
--  \endrst
-- */
--template <typename... T>
--auto system_error(int error_code, format_string<T...> fmt, T&&... args)
--    -> std::system_error {
--  return vsystem_error(error_code, fmt, fmt::make_format_args(args...))=
;
-+template <typename Char>
-+void vformat_to(buffer<Char>& buf, basic_string_view<Char> fmt,
-+                typename vformat_args<Char>::type args, locale_ref loc =
=3D {}) {
-+  auto out =3D basic_appender<Char>(buf);
-+  parse_format_string(
-+      fmt, format_handler<Char>{parse_context<Char>(fmt), {out, args, l=
oc}});
- }
-+}  // namespace detail
-=20
--/**
--  \rst
--  Formats an error message for an error returned by an operating system=
 or a
--  language runtime, for example a file opening error, and writes it to =
*out*.
--  The format is the same as the one used by ``std::system_error(ec, mes=
sage)``
--  where ``ec`` is ``std::error_code(error_code, std::generic_category()=
})``.
--  It is implementation-defined but normally looks like:
--
--  .. parsed-literal::
--     *<message>*: *<system-message>*
--
--  where *<message>* is the passed message and *<system-message>* is the=
 system
--  message corresponding to the error code.
--  *error_code* is a system error code as given by ``errno``.
--  \endrst
-- */
--FMT_API void format_system_error(detail::buffer<char>& out, int error_c=
ode,
--                                 const char* message) noexcept;
--
--// Reports a system error without throwing an exception.
--// Can be used to report errors from destructors.
--FMT_API void report_system_error(int error_code, const char* message) n=
oexcept;
-+FMT_BEGIN_EXPORT
-=20
--/** Fast integer formatter. */
--class format_int {
-+// A generic formatting context with custom output iterator and charact=
er
-+// (code unit) support. Char is the format string code unit type which =
can be
-+// different from OutputIt::value_type.
-+template <typename OutputIt, typename Char> class generic_context {
-  private:
--  // Buffer should be large enough to hold all digits (digits10 + 1),
--  // a sign and a null character.
--  enum { buffer_size =3D std::numeric_limits<unsigned long long>::digit=
s10 + 3 };
--  mutable char buffer_[buffer_size];
--  char* str_;
--
--  template <typename UInt> auto format_unsigned(UInt value) -> char* {
--    auto n =3D static_cast<detail::uint32_or_64_or_128_t<UInt>>(value);
--    return detail::format_decimal(buffer_, n, buffer_size - 1).begin;
--  }
--
--  template <typename Int> auto format_signed(Int value) -> char* {
--    auto abs_value =3D static_cast<detail::uint32_or_64_or_128_t<Int>>(=
value);
--    bool negative =3D value < 0;
--    if (negative) abs_value =3D 0 - abs_value;
--    auto begin =3D format_unsigned(abs_value);
--    if (negative) *--begin =3D '-';
--    return begin;
--  }
-+  OutputIt out_;
-+  basic_format_args<generic_context> args_;
-+  detail::locale_ref loc_;
-=20
-  public:
--  explicit format_int(int value) : str_(format_signed(value)) {}
--  explicit format_int(long value) : str_(format_signed(value)) {}
--  explicit format_int(long long value) : str_(format_signed(value)) {}
--  explicit format_int(unsigned value) : str_(format_unsigned(value)) {}
--  explicit format_int(unsigned long value) : str_(format_unsigned(value=
)) {}
--  explicit format_int(unsigned long long value)
--      : str_(format_unsigned(value)) {}
-+  using char_type =3D Char;
-+  using iterator =3D OutputIt;
-+  using parse_context_type FMT_DEPRECATED =3D parse_context<Char>;
-+  template <typename T>
-+  using formatter_type FMT_DEPRECATED =3D formatter<T, Char>;
-+  enum { builtin_types =3D FMT_BUILTIN_TYPES };
-=20
--  /** Returns the number of characters written to the output buffer. */
--  auto size() const -> size_t {
--    return detail::to_unsigned(buffer_ - str_ + buffer_size - 1);
-+  constexpr generic_context(OutputIt out,
-+                            basic_format_args<generic_context> args,
-+                            detail::locale_ref loc =3D {})
-+      : out_(out), args_(args), loc_(loc) {}
-+  generic_context(generic_context&&) =3D default;
-+  generic_context(const generic_context&) =3D delete;
-+  void operator=3D(const generic_context&) =3D delete;
-+
-+  constexpr auto arg(int id) const -> basic_format_arg<generic_context>=
 {
-+    return args_.get(id);
-+  }
-+  auto arg(basic_string_view<Char> name) const
-+      -> basic_format_arg<generic_context> {
-+    return args_.get(name);
-+  }
-+  constexpr auto arg_id(basic_string_view<Char> name) const -> int {
-+    return args_.get_id(name);
-   }
-=20
--  /**
--    Returns a pointer to the output buffer content. No terminating null
--    character is appended.
--   */
--  auto data() const -> const char* { return str_; }
-+  constexpr auto out() const -> iterator { return out_; }
-=20
--  /**
--    Returns a pointer to the output buffer content with terminating nul=
l
--    character appended.
--   */
--  auto c_str() const -> const char* {
--    buffer_[buffer_size - 1] =3D '\0';
--    return str_;
-+  void advance_to(iterator it) {
-+    if (!detail::is_back_insert_iterator<iterator>()) out_ =3D it;
-   }
-=20
--  /**
--    \rst
--    Returns the content of the output buffer as an ``std::string``.
--    \endrst
--   */
--  auto str() const -> std::string { return std::string(str_, size()); }
-+  constexpr auto locale() const -> detail::locale_ref { return loc_; }
- };
-=20
--template <typename T, typename Char>
--struct formatter<T, Char, enable_if_t<detail::has_format_as<T>::value>>
--    : private formatter<detail::format_as_t<T>> {
--  using base =3D formatter<detail::format_as_t<T>>;
--  using base::parse;
-+class loc_value {
-+ private:
-+  basic_format_arg<context> value_;
-=20
--  template <typename FormatContext>
--  auto format(const T& value, FormatContext& ctx) const -> decltype(ctx=
.out()) {
--    return base::format(format_as(value), ctx);
-+ public:
-+  template <typename T, FMT_ENABLE_IF(!detail::is_float128<T>::value)>
-+  loc_value(T value) : value_(value) {}
-+
-+  template <typename T, FMT_ENABLE_IF(detail::is_float128<T>::value)>
-+  loc_value(T) {}
-+
-+  template <typename Visitor> auto visit(Visitor&& vis) -> decltype(vis=
(0)) {
-+    return value_.visit(vis);
-   }
- };
-=20
--template <typename Char>
--struct formatter<void*, Char> : formatter<const void*, Char> {
--  template <typename FormatContext>
--  auto format(void* val, FormatContext& ctx) const -> decltype(ctx.out(=
)) {
--    return formatter<const void*, Char>::format(val, ctx);
-+// A locale facet that formats values in UTF-8.
-+// It is parameterized on the locale to avoid the heavy <locale> includ=
e.
-+template <typename Locale> class format_facet : public Locale::facet {
-+ private:
-+  std::string separator_;
-+  std::string grouping_;
-+  std::string decimal_point_;
-+
-+ protected:
-+  virtual auto do_put(appender out, loc_value val,
-+                      const format_specs& specs) const -> bool;
-+
-+ public:
-+  static FMT_API typename Locale::id id;
-+
-+  explicit format_facet(Locale& loc);
-+  explicit format_facet(string_view sep =3D "", std::string grouping =3D=
 "\3",
-+                        std::string decimal_point =3D ".")
-+      : separator_(sep.data(), sep.size()),
-+        grouping_(grouping),
-+        decimal_point_(decimal_point) {}
-+
-+  auto put(appender out, loc_value val, const format_specs& specs) cons=
t
-+      -> bool {
-+    return do_put(out, val, specs);
-   }
- };
-=20
-+#define FMT_FORMAT_AS(Type, Base)                                   \
-+  template <typename Char>                                          \
-+  struct formatter<Type, Char> : formatter<Base, Char> {            \
-+    template <typename FormatContext>                               \
-+    FMT_CONSTEXPR auto format(Type value, FormatContext& ctx) const \
-+        -> decltype(ctx.out()) {                                    \
-+      return formatter<Base, Char>::format(value, ctx);             \
-+    }                                                               \
-+  }
-+
-+FMT_FORMAT_AS(signed char, int);
-+FMT_FORMAT_AS(unsigned char, unsigned);
-+FMT_FORMAT_AS(short, int);
-+FMT_FORMAT_AS(unsigned short, unsigned);
-+FMT_FORMAT_AS(long, detail::long_type);
-+FMT_FORMAT_AS(unsigned long, detail::ulong_type);
-+FMT_FORMAT_AS(Char*, const Char*);
-+FMT_FORMAT_AS(detail::std_string_view<Char>, basic_string_view<Char>);
-+FMT_FORMAT_AS(std::nullptr_t, const void*);
-+FMT_FORMAT_AS(void*, const void*);
-+
- template <typename Char, size_t N>
--struct formatter<Char[N], Char> : formatter<basic_string_view<Char>, Ch=
ar> {
-+struct formatter<Char[N], Char> : formatter<basic_string_view<Char>, Ch=
ar> {};
-+
-+template <typename Char, typename Traits, typename Allocator>
-+class formatter<std::basic_string<Char, Traits, Allocator>, Char>
-+    : public formatter<basic_string_view<Char>, Char> {};
-+
-+template <int N, typename Char>
-+struct formatter<detail::bitint<N>, Char> : formatter<long long, Char> =
{};
-+template <int N, typename Char>
-+struct formatter<detail::ubitint<N>, Char>
-+    : formatter<unsigned long long, Char> {};
-+
-+template <typename Char>
-+struct formatter<detail::float128, Char>
-+    : detail::native_formatter<detail::float128, Char,
-+                               detail::type::float_type> {};
-+
-+template <typename T, typename Char>
-+struct formatter<T, Char, void_t<detail::format_as_result<T>>>
-+    : formatter<detail::format_as_result<T>, Char> {
-   template <typename FormatContext>
--  FMT_CONSTEXPR auto format(const Char* val, FormatContext& ctx) const
-+  FMT_CONSTEXPR auto format(const T& value, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
--    return formatter<basic_string_view<Char>, Char>::format(val, ctx);
-+    auto&& val =3D format_as(value);  // Make an lvalue reference for f=
ormat.
-+    return formatter<detail::format_as_result<T>, Char>::format(val, ct=
x);
-   }
- };
-=20
- /**
--  \rst
--  Converts ``p`` to ``const void*`` for pointer formatting.
--
--  **Example**::
--
--    auto s =3D fmt::format("{}", fmt::ptr(p));
--  \endrst
-+ * Converts `p` to `const void*` for pointer formatting.
-+ *
-+ * **Example**:
-+ *
-+ *     auto s =3D fmt::format("{}", fmt::ptr(p));
-  */
- template <typename T> auto ptr(T p) -> const void* {
-   static_assert(std::is_pointer<T>::value, "");
-   return detail::bit_cast<const void*>(p);
- }
--template <typename T, typename Deleter>
--auto ptr(const std::unique_ptr<T, Deleter>& p) -> const void* {
--  return p.get();
--}
--template <typename T> auto ptr(const std::shared_ptr<T>& p) -> const vo=
id* {
--  return p.get();
--}
-=20
- /**
--  \rst
--  Converts ``e`` to the underlying type.
--
--  **Example**::
--
--    enum class color { red, green, blue };
--    auto s =3D fmt::format("{}", fmt::underlying(color::red));
--  \endrst
-+ * Converts `e` to the underlying type.
-+ *
-+ * **Example**:
-+ *
-+ *     enum class color { red, green, blue };
-+ *     auto s =3D fmt::format("{}", fmt::underlying(color::red));  // s=
 =3D=3D "0"
-  */
- template <typename Enum>
- constexpr auto underlying(Enum e) noexcept -> underlying_t<Enum> {
-@@ -4358,13 +3849,22 @@ constexpr auto format_as(Enum e) noexcept -> und=
erlying_t<Enum> {
- }
- }  // namespace enums
-=20
--class bytes {
-- private:
--  string_view data_;
--  friend struct formatter<bytes>;
-+#ifdef __cpp_lib_byte
-+template <> struct formatter<std::byte> : formatter<unsigned> {
-+  static auto format_as(std::byte b) -> unsigned char {
-+    return static_cast<unsigned char>(b);
-+  }
-+  template <typename Context>
-+  auto format(std::byte b, Context& ctx) const -> decltype(ctx.out()) {
-+    return formatter<unsigned>::format(format_as(b), ctx);
-+  }
-+};
-+#endif
-=20
-- public:
--  explicit bytes(string_view data) : data_(data) {}
-+struct bytes {
-+  string_view data;
-+
-+  inline explicit bytes(string_view s) : data(s) {}
- };
-=20
- template <> struct formatter<bytes> {
-@@ -4372,35 +3872,35 @@ template <> struct formatter<bytes> {
-   detail::dynamic_format_specs<> specs_;
-=20
-  public:
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> const char* {
-+  FMT_CONSTEXPR auto parse(parse_context<>& ctx) -> const char* {
-     return parse_format_specs(ctx.begin(), ctx.end(), specs_, ctx,
-                               detail::type::string_type);
-   }
-=20
-   template <typename FormatContext>
--  auto format(bytes b, FormatContext& ctx) -> decltype(ctx.out()) {
--    detail::handle_dynamic_spec<detail::width_checker>(specs_.width,
--                                                       specs_.width_ref=
, ctx);
--    detail::handle_dynamic_spec<detail::precision_checker>(
--        specs_.precision, specs_.precision_ref, ctx);
--    return detail::write_bytes(ctx.out(), b.data_, specs_);
-+  auto format(bytes b, FormatContext& ctx) const -> decltype(ctx.out())=
 {
-+    auto specs =3D specs_;
-+    detail::handle_dynamic_spec(specs.dynamic_width(), specs.width,
-+                                specs.width_ref, ctx);
-+    detail::handle_dynamic_spec(specs.dynamic_precision(), specs.precis=
ion,
-+                                specs.precision_ref, ctx);
-+    return detail::write_bytes<char>(ctx.out(), b.data, specs);
-   }
- };
-=20
- // group_digits_view is not derived from view because it copies the arg=
ument.
--template <typename T> struct group_digits_view { T value; };
-+template <typename T> struct group_digits_view {
-+  T value;
-+};
-=20
- /**
--  \rst
--  Returns a view that formats an integer value using ',' as a locale-in=
dependent
--  thousands separator.
--
--  **Example**::
--
--    fmt::print("{}", fmt::group_digits(12345));
--    // Output: "12,345"
--  \endrst
-+ * Returns a view that formats an integer value using ',' as a
-+ * locale-independent thousands separator.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print("{}", fmt::group_digits(12345));
-+ *     // Output: "12,345"
-  */
- template <typename T> auto group_digits(T value) -> group_digits_view<T=
> {
-   return {value};
-@@ -4411,269 +3911,255 @@ template <typename T> struct formatter<group_d=
igits_view<T>> : formatter<T> {
-   detail::dynamic_format_specs<> specs_;
-=20
-  public:
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> const char* {
-+  FMT_CONSTEXPR auto parse(parse_context<>& ctx) -> const char* {
-     return parse_format_specs(ctx.begin(), ctx.end(), specs_, ctx,
-                               detail::type::int_type);
-   }
-=20
-   template <typename FormatContext>
--  auto format(group_digits_view<T> t, FormatContext& ctx)
-+  auto format(group_digits_view<T> view, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
--    detail::handle_dynamic_spec<detail::width_checker>(specs_.width,
--                                                       specs_.width_ref=
, ctx);
--    detail::handle_dynamic_spec<detail::precision_checker>(
--        specs_.precision, specs_.precision_ref, ctx);
-+    auto specs =3D specs_;
-+    detail::handle_dynamic_spec(specs.dynamic_width(), specs.width,
-+                                specs.width_ref, ctx);
-+    detail::handle_dynamic_spec(specs.dynamic_precision(), specs.precis=
ion,
-+                                specs.precision_ref, ctx);
-+    auto arg =3D detail::make_write_int_arg(view.value, specs.sign());
-     return detail::write_int(
--        ctx.out(), static_cast<detail::uint64_or_128_t<T>>(t.value), 0,=
 specs_,
--        detail::digit_grouping<char>("\3", ","));
-+        ctx.out(), static_cast<detail::uint64_or_128_t<T>>(arg.abs_valu=
e),
-+        arg.prefix, specs, detail::digit_grouping<char>("\3", ","));
-   }
- };
-=20
--// DEPRECATED! join_view will be moved to ranges.h.
--template <typename It, typename Sentinel, typename Char =3D char>
--struct join_view : detail::view {
--  It begin;
--  Sentinel end;
--  basic_string_view<Char> sep;
-+template <typename T, typename Char> struct nested_view {
-+  const formatter<T, Char>* fmt;
-+  const T* value;
-+};
-=20
--  join_view(It b, Sentinel e, basic_string_view<Char> s)
--      : begin(b), end(e), sep(s) {}
-+template <typename T, typename Char>
-+struct formatter<nested_view<T, Char>, Char> {
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    return ctx.begin();
-+  }
-+  template <typename FormatContext>
-+  auto format(nested_view<T, Char> view, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return view.fmt->format(*view.value, ctx);
-+  }
- };
-=20
--template <typename It, typename Sentinel, typename Char>
--struct formatter<join_view<It, Sentinel, Char>, Char> {
-+template <typename T, typename Char =3D char> struct nested_formatter {
-  private:
--  using value_type =3D
--#ifdef __cpp_lib_ranges
--      std::iter_value_t<It>;
--#else
--      typename std::iterator_traits<It>::value_type;
--#endif
--  formatter<remove_cvref_t<value_type>, Char> value_formatter_;
-+  basic_specs specs_;
-+  int width_;
-+  formatter<T, Char> formatter_;
-=20
-  public:
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> const Char* {
--    return value_formatter_.parse(ctx);
-+  constexpr nested_formatter() : width_(0) {}
-+
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    if (it =3D=3D end) return it;
-+    auto specs =3D format_specs();
-+    it =3D detail::parse_align(it, end, specs);
-+    specs_ =3D specs;
-+    Char c =3D *it;
-+    auto width_ref =3D detail::arg_ref<Char>();
-+    if ((c >=3D '0' && c <=3D '9') || c =3D=3D '{') {
-+      it =3D detail::parse_width(it, end, specs, width_ref, ctx);
-+      width_ =3D specs.width;
-+    }
-+    ctx.advance_to(it);
-+    return formatter_.parse(ctx);
-   }
-=20
--  template <typename FormatContext>
--  auto format(const join_view<It, Sentinel, Char>& value,
--              FormatContext& ctx) const -> decltype(ctx.out()) {
--    auto it =3D value.begin;
--    auto out =3D ctx.out();
--    if (it !=3D value.end) {
--      out =3D value_formatter_.format(*it, ctx);
--      ++it;
--      while (it !=3D value.end) {
--        out =3D detail::copy_str<Char>(value.sep.begin(), value.sep.end=
(), out);
--        ctx.advance_to(out);
--        out =3D value_formatter_.format(*it, ctx);
--        ++it;
--      }
--    }
--    return out;
-+  template <typename FormatContext, typename F>
-+  auto write_padded(FormatContext& ctx, F write) const -> decltype(ctx.=
out()) {
-+    if (width_ =3D=3D 0) return write(ctx.out());
-+    auto buf =3D basic_memory_buffer<Char>();
-+    write(basic_appender<Char>(buf));
-+    auto specs =3D format_specs();
-+    specs.width =3D width_;
-+    specs.copy_fill_from(specs_);
-+    specs.set_align(specs_.align());
-+    return detail::write<Char>(
-+        ctx.out(), basic_string_view<Char>(buf.data(), buf.size()), spe=
cs);
-+  }
-+
-+  auto nested(const T& value) const -> nested_view<T, Char> {
-+    return nested_view<T, Char>{&formatter_, &value};
-   }
- };
-=20
--/**
--  Returns a view that formats the iterator range `[begin, end)` with el=
ements
--  separated by `sep`.
-- */
--template <typename It, typename Sentinel>
--auto join(It begin, Sentinel end, string_view sep) -> join_view<It, Sen=
tinel> {
--  return {begin, end, sep};
-+inline namespace literals {
-+#if FMT_USE_NONTYPE_TEMPLATE_ARGS
-+template <detail::fixed_string S> constexpr auto operator""_a() {
-+  using char_t =3D remove_cvref_t<decltype(*S.data)>;
-+  return detail::udl_arg<char_t, sizeof(S.data) / sizeof(char_t), S>();
- }
--
-+#else
- /**
--  \rst
--  Returns a view that formats `range` with elements separated by `sep`.
--
--  **Example**::
--
--    std::vector<int> v =3D {1, 2, 3};
--    fmt::print("{}", fmt::join(v, ", "));
--    // Output: "1, 2, 3"
--
--  ``fmt::join`` applies passed format specifiers to the range elements:=
:
--
--    fmt::print("{:02}", fmt::join(v, ", "));
--    // Output: "01, 02, 03"
--  \endrst
-+ * User-defined literal equivalent of `fmt::arg`.
-+ *
-+ * **Example**:
-+ *
-+ *     using namespace fmt::literals;
-+ *     fmt::print("The answer is {answer}.", "answer"_a=3D42);
-  */
--template <typename Range>
--auto join(Range&& range, string_view sep)
--    -> join_view<detail::iterator_t<Range>, detail::sentinel_t<Range>> =
{
--  return join(std::begin(range), std::end(range), sep);
-+constexpr auto operator""_a(const char* s, size_t) -> detail::udl_arg<c=
har> {
-+  return {s};
- }
-+#endif  // FMT_USE_NONTYPE_TEMPLATE_ARGS
-+}  // namespace literals
-=20
--/**
--  \rst
--  Converts *value* to ``std::string`` using the default format for type=
 *T*.
--
--  **Example**::
-+/// A fast integer formatter.
-+class format_int {
-+ private:
-+  // Buffer should be large enough to hold all digits (digits10 + 1),
-+  // a sign and a null character.
-+  enum { buffer_size =3D std::numeric_limits<unsigned long long>::digit=
s10 + 3 };
-+  mutable char buffer_[buffer_size];
-+  char* str_;
-=20
--    #include <fmt/format.h>
-+  template <typename UInt>
-+  FMT_CONSTEXPR20 auto format_unsigned(UInt value) -> char* {
-+    auto n =3D static_cast<detail::uint32_or_64_or_128_t<UInt>>(value);
-+    return detail::do_format_decimal(buffer_, n, buffer_size - 1);
-+  }
-=20
--    std::string answer =3D fmt::to_string(42);
--  \endrst
-- */
--template <typename T, FMT_ENABLE_IF(!std::is_integral<T>::value)>
--inline auto to_string(const T& value) -> std::string {
--  auto buffer =3D memory_buffer();
--  detail::write<char>(appender(buffer), value);
--  return {buffer.data(), buffer.size()};
--}
-+  template <typename Int>
-+  FMT_CONSTEXPR20 auto format_signed(Int value) -> char* {
-+    auto abs_value =3D static_cast<detail::uint32_or_64_or_128_t<Int>>(=
value);
-+    bool negative =3D value < 0;
-+    if (negative) abs_value =3D 0 - abs_value;
-+    auto begin =3D format_unsigned(abs_value);
-+    if (negative) *--begin =3D '-';
-+    return begin;
-+  }
-=20
--template <typename T, FMT_ENABLE_IF(std::is_integral<T>::value)>
--FMT_NODISCARD inline auto to_string(T value) -> std::string {
--  // The buffer should be large enough to store the number including th=
e sign
--  // or "false" for bool.
--  constexpr int max_size =3D detail::digits10<T>() + 2;
--  char buffer[max_size > 5 ? static_cast<unsigned>(max_size) : 5];
--  char* begin =3D buffer;
--  return std::string(begin, detail::write<char>(begin, value));
--}
-+ public:
-+  FMT_CONSTEXPR20 explicit format_int(int value) : str_(format_signed(v=
alue)) {}
-+  FMT_CONSTEXPR20 explicit format_int(long value)
-+      : str_(format_signed(value)) {}
-+  FMT_CONSTEXPR20 explicit format_int(long long value)
-+      : str_(format_signed(value)) {}
-+  FMT_CONSTEXPR20 explicit format_int(unsigned value)
-+      : str_(format_unsigned(value)) {}
-+  FMT_CONSTEXPR20 explicit format_int(unsigned long value)
-+      : str_(format_unsigned(value)) {}
-+  FMT_CONSTEXPR20 explicit format_int(unsigned long long value)
-+      : str_(format_unsigned(value)) {}
-=20
--template <typename Char, size_t SIZE>
--FMT_NODISCARD auto to_string(const basic_memory_buffer<Char, SIZE>& buf=
)
--    -> std::basic_string<Char> {
--  auto size =3D buf.size();
--  detail::assume(size < std::basic_string<Char>().max_size());
--  return std::basic_string<Char>(buf.data(), size);
--}
-+  /// Returns the number of characters written to the output buffer.
-+  FMT_CONSTEXPR20 auto size() const -> size_t {
-+    return detail::to_unsigned(buffer_ - str_ + buffer_size - 1);
-+  }
-=20
--FMT_BEGIN_DETAIL_NAMESPACE
-+  /// Returns a pointer to the output buffer content. No terminating nu=
ll
-+  /// character is appended.
-+  FMT_CONSTEXPR20 auto data() const -> const char* { return str_; }
-=20
--template <typename Char>
--void vformat_to(buffer<Char>& buf, basic_string_view<Char> fmt,
--                typename vformat_args<Char>::type args, locale_ref loc)=
 {
--  auto out =3D buffer_appender<Char>(buf);
--  if (fmt.size() =3D=3D 2 && equal2(fmt.data(), "{}")) {
--    auto arg =3D args.get(0);
--    if (!arg) error_handler().on_error("argument not found");
--    visit_format_arg(default_arg_formatter<Char>{out, args, loc}, arg);
--    return;
-+  /// Returns a pointer to the output buffer content with terminating n=
ull
-+  /// character appended.
-+  FMT_CONSTEXPR20 auto c_str() const -> const char* {
-+    buffer_[buffer_size - 1] =3D '\0';
-+    return str_;
-   }
-=20
--  struct format_handler : error_handler {
--    basic_format_parse_context<Char> parse_context;
--    buffer_context<Char> context;
--
--    format_handler(buffer_appender<Char> p_out, basic_string_view<Char>=
 str,
--                   basic_format_args<buffer_context<Char>> p_args,
--                   locale_ref p_loc)
--        : parse_context(str), context(p_out, p_args, p_loc) {}
-+  /// Returns the content of the output buffer as an `std::string`.
-+  inline auto str() const -> std::string { return {str_, size()}; }
-+};
-=20
--    void on_text(const Char* begin, const Char* end) {
--      auto text =3D basic_string_view<Char>(begin, to_unsigned(end - be=
gin));
--      context.advance_to(write<Char>(context.out(), text));
--    }
-+#define FMT_STRING_IMPL(s, base)                                       =
       \
-+  [] {                                                                 =
       \
-+    /* Use the hidden visibility as a workaround for a GCC bug (#1973).=
 */    \
-+    /* Use a macro-like name to avoid shadowing warnings. */           =
       \
-+    struct FMT_VISIBILITY("hidden") FMT_COMPILE_STRING : base {        =
       \
-+      using char_type =3D fmt::remove_cvref_t<decltype(s[0])>;         =
         \
-+      constexpr explicit operator fmt::basic_string_view<char_type>() c=
onst { \
-+        return fmt::detail::compile_string_to_view<char_type>(s);      =
       \
-+      }                                                                =
       \
-+    };                                                                 =
       \
-+    using FMT_STRING_VIEW =3D                                          =
         \
-+        fmt::basic_string_view<typename FMT_COMPILE_STRING::char_type>;=
       \
-+    fmt::detail::ignore_unused(FMT_STRING_VIEW(FMT_COMPILE_STRING())); =
       \
-+    return FMT_COMPILE_STRING();                                       =
       \
-+  }()
-=20
--    FMT_CONSTEXPR auto on_arg_id() -> int {
--      return parse_context.next_arg_id();
--    }
--    FMT_CONSTEXPR auto on_arg_id(int id) -> int {
--      return parse_context.check_arg_id(id), id;
--    }
--    FMT_CONSTEXPR auto on_arg_id(basic_string_view<Char> id) -> int {
--      int arg_id =3D context.arg_id(id);
--      if (arg_id < 0) on_error("argument not found");
--      return arg_id;
--    }
-+/**
-+ * Constructs a legacy compile-time format string from a string literal=
 `s`.
-+ *
-+ * **Example**:
-+ *
-+ *     // A compile-time error because 'd' is an invalid specifier for =
strings.
-+ *     std::string s =3D fmt::format(FMT_STRING("{:d}"), "foo");
-+ */
-+#define FMT_STRING(s) FMT_STRING_IMPL(s, fmt::detail::compile_string)
-=20
--    FMT_INLINE void on_replacement_field(int id, const Char*) {
--      auto arg =3D get_arg(context, id);
--      context.advance_to(visit_format_arg(
--          default_arg_formatter<Char>{context.out(), context.args(),
--                                      context.locale()},
--          arg));
--    }
-+FMT_API auto vsystem_error(int error_code, string_view fmt, format_args=
 args)
-+    -> std::system_error;
-=20
--    auto on_format_specs(int id, const Char* begin, const Char* end)
--        -> const Char* {
--      auto arg =3D get_arg(context, id);
--      if (arg.type() =3D=3D type::custom_type) {
--        parse_context.advance_to(begin);
--        visit_format_arg(custom_formatter<Char>{parse_context, context}=
, arg);
--        return parse_context.begin();
--      }
--      auto specs =3D detail::dynamic_format_specs<Char>();
--      begin =3D parse_format_specs(begin, end, specs, parse_context, ar=
g.type());
--      detail::handle_dynamic_spec<detail::width_checker>(
--          specs.width, specs.width_ref, context);
--      detail::handle_dynamic_spec<detail::precision_checker>(
--          specs.precision, specs.precision_ref, context);
--      if (begin =3D=3D end || *begin !=3D '}')
--        on_error("missing '}' in format string");
--      auto f =3D arg_formatter<Char>{context.out(), specs, context.loca=
le()};
--      context.advance_to(visit_format_arg(f, arg));
--      return begin;
--    }
--  };
--  detail::parse_format_string<false>(fmt, format_handler(out, fmt, args=
, loc));
-+/**
-+ * Constructs `std::system_error` with a message formatted with
-+ * `fmt::format(fmt, args...)`.
-+ * `error_code` is a system error code as given by `errno`.
-+ *
-+ * **Example**:
-+ *
-+ *     // This throws std::system_error with the description
-+ *     //   cannot open file 'madeup': No such file or directory
-+ *     // or similar (system message may vary).
-+ *     const char* filename =3D "madeup";
-+ *     FILE* file =3D fopen(filename, "r");
-+ *     if (!file)
-+ *       throw fmt::system_error(errno, "cannot open file '{}'", filena=
me);
-+ */
-+template <typename... T>
-+auto system_error(int error_code, format_string<T...> fmt, T&&... args)
-+    -> std::system_error {
-+  return vsystem_error(error_code, fmt.str, vargs<T...>{{args...}});
- }
-=20
--#ifndef FMT_HEADER_ONLY
--extern template FMT_API void vformat_to(buffer<char>&, string_view,
--                                        typename vformat_args<>::type,
--                                        locale_ref);
--extern template FMT_API auto thousands_sep_impl<char>(locale_ref)
--    -> thousands_sep_result<char>;
--extern template FMT_API auto thousands_sep_impl<wchar_t>(locale_ref)
--    -> thousands_sep_result<wchar_t>;
--extern template FMT_API auto decimal_point_impl(locale_ref) -> char;
--extern template FMT_API auto decimal_point_impl(locale_ref) -> wchar_t;
--#endif  // FMT_HEADER_ONLY
--
--FMT_END_DETAIL_NAMESPACE
--
--#if FMT_USE_USER_DEFINED_LITERALS
--inline namespace literals {
- /**
--  \rst
--  User-defined literal equivalent of :func:`fmt::arg`.
--
--  **Example**::
--
--    using namespace fmt::literals;
--    fmt::print("Elapsed time: {s:.2f} seconds", "s"_a=3D1.23);
--  \endrst
-+ * Formats an error message for an error returned by an operating syste=
m or a
-+ * language runtime, for example a file opening error, and writes it to=
 `out`.
-+ * The format is the same as the one used by `std::system_error(ec, mes=
sage)`
-+ * where `ec` is `std::error_code(error_code, std::generic_category())`=
.
-+ * It is implementation-defined but normally looks like:
-+ *
-+ *     <message>: <system-message>
-+ *
-+ * where `<message>` is the passed message and `<system-message>` is th=
e system
-+ * message corresponding to the error code.
-+ * `error_code` is a system error code as given by `errno`.
-  */
--#  if FMT_USE_NONTYPE_TEMPLATE_ARGS
--template <detail_exported::fixed_string Str> constexpr auto operator""_=
a() {
--  using char_t =3D remove_cvref_t<decltype(Str.data[0])>;
--  return detail::udl_arg<char_t, sizeof(Str.data) / sizeof(char_t), Str=
>();
--}
--#  else
--constexpr auto operator"" _a(const char* s, size_t) -> detail::udl_arg<=
char> {
--  return {s};
--}
--#  endif
--}  // namespace literals
--#endif  // FMT_USE_USER_DEFINED_LITERALS
-+FMT_API void format_system_error(detail::buffer<char>& out, int error_c=
ode,
-+                                 const char* message) noexcept;
-+
-+// Reports a system error without throwing an exception.
-+// Can be used to report errors from destructors.
-+FMT_API void report_system_error(int error_code, const char* message) n=
oexcept;
-=20
- template <typename Locale, FMT_ENABLE_IF(detail::is_locale<Locale>::val=
ue)>
- inline auto vformat(const Locale& loc, string_view fmt, format_args arg=
s)
-     -> std::string {
--  return detail::vformat(loc, fmt, args);
-+  auto buf =3D memory_buffer();
-+  detail::vformat_to(buf, fmt, args, detail::locale_ref(loc));
-+  return {buf.data(), buf.size()};
- }
-=20
- template <typename Locale, typename... T,
-           FMT_ENABLE_IF(detail::is_locale<Locale>::value)>
--inline auto format(const Locale& loc, format_string<T...> fmt, T&&... a=
rgs)
-+FMT_INLINE auto format(const Locale& loc, format_string<T...> fmt, T&&.=
.. args)
-     -> std::string {
--  return fmt::vformat(loc, string_view(fmt), fmt::make_format_args(args=
...));
-+  return vformat(loc, fmt.str, vargs<T...>{{args...}});
- }
-=20
- template <typename OutputIt, typename Locale,
--          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue&&
--                            detail::is_locale<Locale>::value)>
-+          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, char>::val=
ue)>
- auto vformat_to(OutputIt out, const Locale& loc, string_view fmt,
-                 format_args args) -> OutputIt {
--  using detail::get_buffer;
--  auto&& buf =3D get_buffer<char>(out);
-+  auto&& buf =3D detail::get_buffer<char>(out);
-   detail::vformat_to(buf, fmt, args, detail::locale_ref(loc));
-   return detail::get_iterator(buf, out);
- }
-@@ -4683,7 +4169,7 @@ template <typename OutputIt, typename Locale, type=
name... T,
-                             detail::is_locale<Locale>::value)>
- FMT_INLINE auto format_to(OutputIt out, const Locale& loc,
-                           format_string<T...> fmt, T&&... args) -> Outp=
utIt {
--  return vformat_to(out, loc, fmt, fmt::make_format_args(args...));
-+  return fmt::vformat_to(out, loc, fmt.str, vargs<T...>{{args...}});
- }
-=20
- template <typename Locale, typename... T,
-@@ -4692,40 +4178,67 @@ FMT_NODISCARD FMT_INLINE auto formatted_size(con=
st Locale& loc,
-                                              format_string<T...> fmt,
-                                              T&&... args) -> size_t {
-   auto buf =3D detail::counting_buffer<>();
--  detail::vformat_to<char>(buf, fmt, fmt::make_format_args(args...),
--                           detail::locale_ref(loc));
-+  detail::vformat_to(buf, fmt.str, vargs<T...>{{args...}},
-+                     detail::locale_ref(loc));
-   return buf.count();
- }
-=20
--FMT_END_EXPORT
-+FMT_API auto vformat(string_view fmt, format_args args) -> std::string;
-=20
--template <typename T, typename Char>
--template <typename FormatContext>
--FMT_CONSTEXPR FMT_INLINE auto
--formatter<T, Char,
--          enable_if_t<detail::type_constant<T, Char>::value !=3D
--                      detail::type::custom_type>>::format(const T& val,
--                                                          FormatContext=
& ctx)
--    const -> decltype(ctx.out()) {
--  if (specs_.width_ref.kind !=3D detail::arg_id_kind::none ||
--      specs_.precision_ref.kind !=3D detail::arg_id_kind::none) {
--    auto specs =3D specs_;
--    detail::handle_dynamic_spec<detail::width_checker>(specs.width,
--                                                       specs.width_ref,=
 ctx);
--    detail::handle_dynamic_spec<detail::precision_checker>(
--        specs.precision, specs.precision_ref, ctx);
--    return detail::write<Char>(ctx.out(), val, specs, ctx.locale());
--  }
--  return detail::write<Char>(ctx.out(), val, specs_, ctx.locale());
-+/**
-+ * Formats `args` according to specifications in `fmt` and returns the =
result
-+ * as a string.
-+ *
-+ * **Example**:
-+ *
-+ *     #include <fmt/format.h>
-+ *     std::string message =3D fmt::format("The answer is {}.", 42);
-+ */
-+template <typename... T>
-+FMT_NODISCARD FMT_INLINE auto format(format_string<T...> fmt, T&&... ar=
gs)
-+    -> std::string {
-+  return vformat(fmt.str, vargs<T...>{{args...}});
-+}
-+
-+/**
-+ * Converts `value` to `std::string` using the default format for type =
`T`.
-+ *
-+ * **Example**:
-+ *
-+ *     std::string answer =3D fmt::to_string(42);
-+ */
-+template <typename T, FMT_ENABLE_IF(std::is_integral<T>::value)>
-+FMT_NODISCARD auto to_string(T value) -> std::string {
-+  // The buffer should be large enough to store the number including th=
e sign
-+  // or "false" for bool.
-+  char buffer[max_of(detail::digits10<T>() + 2, 5)];
-+  return {buffer, detail::write<char>(buffer, value)};
-+}
-+
-+template <typename T, FMT_ENABLE_IF(detail::use_format_as<T>::value)>
-+FMT_NODISCARD auto to_string(const T& value) -> std::string {
-+  return to_string(format_as(value));
-+}
-+
-+template <typename T, FMT_ENABLE_IF(!std::is_integral<T>::value &&
-+                                    !detail::use_format_as<T>::value)>
-+FMT_NODISCARD auto to_string(const T& value) -> std::string {
-+  auto buffer =3D memory_buffer();
-+  detail::write<char>(appender(buffer), value);
-+  return {buffer.data(), buffer.size()};
- }
-=20
-+FMT_END_EXPORT
- FMT_END_NAMESPACE
-=20
- #ifdef FMT_HEADER_ONLY
- #  define FMT_FUNC inline
- #  include "format-inl.h"
--#else
--#  define FMT_FUNC
-+#endif
-+
-+// Restore _LIBCPP_REMOVE_TRANSITIVE_INCLUDES.
-+#ifdef FMT_REMOVE_TRANSITIVE_INCLUDES
-+#  undef _LIBCPP_REMOVE_TRANSITIVE_INCLUDES
- #endif
-=20
- #endif  // FMT_FORMAT_H_
-diff --git a/include/fmt/os.h b/include/fmt/os.h
-index ec29040..b2cc5e4 100644
---- a/include/fmt/os.h
-+++ b/include/fmt/os.h
-@@ -8,16 +8,18 @@
- #ifndef FMT_OS_H_
- #define FMT_OS_H_
-=20
--#include <cerrno>
--#include <cstddef>
--#include <cstdio>
--#include <system_error>  // std::system_error
-+#include "format.h"
-=20
--#if defined __APPLE__ || defined(__FreeBSD__)
--#  include <xlocale.h>  // for LC_NUMERIC_MASK on OS X
--#endif
-+#ifndef FMT_MODULE
-+#  include <cerrno>
-+#  include <cstddef>
-+#  include <cstdio>
-+#  include <system_error>  // std::system_error
-=20
--#include "format.h"
-+#  if FMT_HAS_INCLUDE(<xlocale.h>)
-+#    include <xlocale.h>  // LC_NUMERIC_MASK on macOS
-+#  endif
-+#endif  // FMT_MODULE
-=20
- #ifndef FMT_USE_FCNTL
- // UWP doesn't provide _pipe.
-@@ -46,6 +48,7 @@
-=20
- // Calls to system functions are wrapped in FMT_SYSTEM for testability.
- #ifdef FMT_SYSTEM
-+#  define FMT_HAS_SYSTEM
- #  define FMT_POSIX_CALL(call) FMT_SYSTEM(call)
- #else
- #  define FMT_SYSTEM(call) ::call
-@@ -74,47 +77,34 @@ FMT_BEGIN_NAMESPACE
- FMT_BEGIN_EXPORT
-=20
- /**
--  \rst
--  A reference to a null-terminated string. It can be constructed from a=
 C
--  string or ``std::string``.
--
--  You can use one of the following type aliases for common character ty=
pes:
--
--  +---------------+-----------------------------+
--  | Type          | Definition                  |
--  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
--  | cstring_view  | basic_cstring_view<char>    |
--  +---------------+-----------------------------+
--  | wcstring_view | basic_cstring_view<wchar_t> |
--  +---------------+-----------------------------+
--
--  This class is most useful as a parameter type to allow passing
--  different types of strings to a function, for example::
--
--    template <typename... Args>
--    std::string format(cstring_view format_str, const Args & ... args);
--
--    format("{}", 42);
--    format(std::string("{}"), 42);
--  \endrst
-+ * A reference to a null-terminated string. It can be constructed from =
a C
-+ * string or `std::string`.
-+ *
-+ * You can use one of the following type aliases for common character t=
ypes:
-+ *
-+ * +---------------+-----------------------------+
-+ * | Type          | Definition                  |
-+ * +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
-+ * | cstring_view  | basic_cstring_view<char>    |
-+ * +---------------+-----------------------------+
-+ * | wcstring_view | basic_cstring_view<wchar_t> |
-+ * +---------------+-----------------------------+
-+ *
-+ * This class is most useful as a parameter type for functions that wra=
p C APIs.
-  */
- template <typename Char> class basic_cstring_view {
-  private:
-   const Char* data_;
-=20
-  public:
--  /** Constructs a string reference object from a C string. */
-+  /// Constructs a string reference object from a C string.
-   basic_cstring_view(const Char* s) : data_(s) {}
-=20
--  /**
--    \rst
--    Constructs a string reference from an ``std::string`` object.
--    \endrst
--   */
-+  /// Constructs a string reference from an `std::string` object.
-   basic_cstring_view(const std::basic_string<Char>& s) : data_(s.c_str(=
)) {}
-=20
--  /** Returns the pointer to a C string. */
--  const Char* c_str() const { return data_; }
-+  /// Returns the pointer to a C string.
-+  auto c_str() const -> const Char* { return data_; }
- };
-=20
- using cstring_view =3D basic_cstring_view<char>;
-@@ -123,53 +113,50 @@ using wcstring_view =3D basic_cstring_view<wchar_t=
>;
- #ifdef _WIN32
- FMT_API const std::error_category& system_category() noexcept;
-=20
--FMT_BEGIN_DETAIL_NAMESPACE
-+namespace detail {
- FMT_API void format_windows_error(buffer<char>& out, int error_code,
-                                   const char* message) noexcept;
--FMT_END_DETAIL_NAMESPACE
-+}
-=20
--FMT_API std::system_error vwindows_error(int error_code, string_view fo=
rmat_str,
-+FMT_API std::system_error vwindows_error(int error_code, string_view fm=
t,
-                                          format_args args);
-=20
- /**
-- \rst
-- Constructs a :class:`std::system_error` object with the description
-- of the form
--
-- .. parsed-literal::
--   *<message>*: *<system-message>*
--
-- where *<message>* is the formatted message and *<system-message>* is t=
he
-- system message corresponding to the error code.
-- *error_code* is a Windows error code as given by ``GetLastError``.
-- If *error_code* is not a valid error code such as -1, the system messa=
ge
-- will look like "error -1".
--
-- **Example**::
--
--   // This throws a system_error with the description
--   //   cannot open file 'madeup': The system cannot find the file spec=
ified.
--   // or similar (system message may vary).
--   const char *filename =3D "madeup";
--   LPOFSTRUCT of =3D LPOFSTRUCT();
--   HFILE file =3D OpenFile(filename, &of, OF_READ);
--   if (file =3D=3D HFILE_ERROR) {
--     throw fmt::windows_error(GetLastError(),
--                              "cannot open file '{}'", filename);
--   }
-- \endrst
--*/
--template <typename... Args>
--std::system_error windows_error(int error_code, string_view message,
--                                const Args&... args) {
--  return vwindows_error(error_code, message, fmt::make_format_args(args=
...));
-+ * Constructs a `std::system_error` object with the description of the =
form
-+ *
-+ *     <message>: <system-message>
-+ *
-+ * where `<message>` is the formatted message and `<system-message>` is=
 the
-+ * system message corresponding to the error code.
-+ * `error_code` is a Windows error code as given by `GetLastError`.
-+ * If `error_code` is not a valid error code such as -1, the system mes=
sage
-+ * will look like "error -1".
-+ *
-+ * **Example**:
-+ *
-+ *     // This throws a system_error with the description
-+ *     //   cannot open file 'madeup': The system cannot find the file
-+ * specified.
-+ *     // or similar (system message may vary).
-+ *     const char *filename =3D "madeup";
-+ *     LPOFSTRUCT of =3D LPOFSTRUCT();
-+ *     HFILE file =3D OpenFile(filename, &of, OF_READ);
-+ *     if (file =3D=3D HFILE_ERROR) {
-+ *       throw fmt::windows_error(GetLastError(),
-+ *                                "cannot open file '{}'", filename);
-+ *     }
-+ */
-+template <typename... T>
-+auto windows_error(int error_code, string_view message, const T&... arg=
s)
-+    -> std::system_error {
-+  return vwindows_error(error_code, message, vargs<T...>{{args...}});
- }
-=20
- // Reports a Windows error without throwing an exception.
- // Can be used to report errors from destructors.
- FMT_API void report_windows_error(int error_code, const char* message) =
noexcept;
- #else
--inline const std::error_category& system_category() noexcept {
-+inline auto system_category() noexcept -> const std::error_category& {
-   return std::system_category();
- }
- #endif  // _WIN32
-@@ -177,8 +164,8 @@ inline const std::error_category& system_category() =
noexcept {
- // std::system is not available on some platforms such as iOS (#2248).
- #ifdef __OSX__
- template <typename S, typename... Args, typename Char =3D char_t<S>>
--void say(const S& format_str, Args&&... args) {
--  std::system(format("say \"{}\"", format(format_str, args...)).c_str()=
);
-+void say(const S& fmt, Args&&... args) {
-+  std::system(format("say \"{}\"", format(fmt, args...)).c_str());
- }
- #endif
-=20
-@@ -189,24 +176,24 @@ class buffered_file {
-=20
-   friend class file;
-=20
--  explicit buffered_file(FILE* f) : file_(f) {}
-+  inline explicit buffered_file(FILE* f) : file_(f) {}
-=20
-  public:
-   buffered_file(const buffered_file&) =3D delete;
-   void operator=3D(const buffered_file&) =3D delete;
-=20
-   // Constructs a buffered_file object which doesn't represent any file=
.
--  buffered_file() noexcept : file_(nullptr) {}
-+  inline buffered_file() noexcept : file_(nullptr) {}
-=20
-   // Destroys the object closing the file it represents if any.
-   FMT_API ~buffered_file() noexcept;
-=20
-  public:
--  buffered_file(buffered_file&& other) noexcept : file_(other.file_) {
-+  inline buffered_file(buffered_file&& other) noexcept : file_(other.fi=
le_) {
-     other.file_ =3D nullptr;
-   }
-=20
--  buffered_file& operator=3D(buffered_file&& other) {
-+  inline auto operator=3D(buffered_file&& other) -> buffered_file& {
-     close();
-     file_ =3D other.file_;
-     other.file_ =3D nullptr;
-@@ -220,21 +207,20 @@ class buffered_file {
-   FMT_API void close();
-=20
-   // Returns the pointer to a FILE object representing this file.
--  FILE* get() const noexcept { return file_; }
--
--  FMT_API int descriptor() const;
-+  inline auto get() const noexcept -> FILE* { return file_; }
-=20
--  void vprint(string_view format_str, format_args args) {
--    fmt::vprint(file_, format_str, args);
--  }
-+  FMT_API auto descriptor() const -> int;
-=20
--  template <typename... Args>
--  inline void print(string_view format_str, const Args&... args) {
--    vprint(format_str, fmt::make_format_args(args...));
-+  template <typename... T>
-+  inline void print(string_view fmt, const T&... args) {
-+    fmt::vargs<T...> vargs =3D {{args...}};
-+    detail::is_locking<T...>() ? fmt::vprint_buffered(file_, fmt, vargs=
)
-+                               : fmt::vprint(file_, fmt, vargs);
-   }
- };
-=20
- #if FMT_USE_FCNTL
-+
- // A file. Closed file is represented by a file object with descriptor =
-1.
- // Methods that are not declared with noexcept may throw
- // fmt::system_error in case of failure. Note that some errors such as
-@@ -248,6 +234,8 @@ class FMT_API file {
-   // Constructs a file object with a given descriptor.
-   explicit file(int fd) : fd_(fd) {}
-=20
-+  friend struct pipe;
-+
-  public:
-   // Possible values for the oflag argument to the constructor.
-   enum {
-@@ -260,7 +248,7 @@ class FMT_API file {
-   };
-=20
-   // Constructs a file object which doesn't represent any file.
--  file() noexcept : fd_(-1) {}
-+  inline file() noexcept : fd_(-1) {}
-=20
-   // Opens a file and constructs a file object representing this file.
-   file(cstring_view path, int oflag);
-@@ -269,10 +257,10 @@ class FMT_API file {
-   file(const file&) =3D delete;
-   void operator=3D(const file&) =3D delete;
-=20
--  file(file&& other) noexcept : fd_(other.fd_) { other.fd_ =3D -1; }
-+  inline file(file&& other) noexcept : fd_(other.fd_) { other.fd_ =3D -=
1; }
-=20
-   // Move assignment is not noexcept because close may throw.
--  file& operator=3D(file&& other) {
-+  inline auto operator=3D(file&& other) -> file& {
-     close();
-     fd_ =3D other.fd_;
-     other.fd_ =3D -1;
-@@ -283,24 +271,24 @@ class FMT_API file {
-   ~file() noexcept;
-=20
-   // Returns the file descriptor.
--  int descriptor() const noexcept { return fd_; }
-+  inline auto descriptor() const noexcept -> int { return fd_; }
-=20
-   // Closes the file.
-   void close();
-=20
-   // Returns the file size. The size has signed type for consistency wi=
th
-   // stat::st_size.
--  long long size() const;
-+  auto size() const -> long long;
-=20
-   // Attempts to read count bytes from the file into the specified buff=
er.
--  size_t read(void* buffer, size_t count);
-+  auto read(void* buffer, size_t count) -> size_t;
-=20
-   // Attempts to write count bytes from the specified buffer to the fil=
e.
--  size_t write(const void* buffer, size_t count);
-+  auto write(const void* buffer, size_t count) -> size_t;
-=20
-   // Duplicates a file descriptor with the dup function and returns
-   // the duplicate as a file object.
--  static file dup(int fd);
-+  static auto dup(int fd) -> file;
-=20
-   // Makes fd be the copy of this file descriptor, closing fd first if
-   // necessary.
-@@ -310,13 +298,9 @@ class FMT_API file {
-   // necessary.
-   void dup2(int fd, std::error_code& ec) noexcept;
-=20
--  // Creates a pipe setting up read_end and write_end file objects for =
reading
--  // and writing respectively.
--  static void pipe(file& read_end, file& write_end);
--
-   // Creates a buffered_file object associated with this file and detac=
hes
-   // this file object from the file.
--  buffered_file fdopen(const char* mode);
-+  auto fdopen(const char* mode) -> buffered_file;
-=20
- #  if defined(_WIN32) && !defined(__MINGW32__)
-   // Opens a file and constructs a file object representing this file b=
y
-@@ -325,15 +309,24 @@ class FMT_API file {
- #  endif
- };
-=20
-+struct FMT_API pipe {
-+  file read_end;
-+  file write_end;
-+
-+  // Creates a pipe setting up read_end and write_end file objects for =
reading
-+  // and writing respectively.
-+  pipe();
-+};
-+
- // Returns the memory page size.
--long getpagesize();
-+auto getpagesize() -> long;
-=20
--FMT_BEGIN_DETAIL_NAMESPACE
-+namespace detail {
-=20
- struct buffer_size {
--  buffer_size() =3D default;
-+  constexpr buffer_size() =3D default;
-   size_t value =3D 0;
--  buffer_size operator=3D(size_t val) const {
-+  FMT_CONSTEXPR auto operator=3D(size_t val) const -> buffer_size {
-     auto bs =3D buffer_size();
-     bs.value =3D val;
-     return bs;
-@@ -344,7 +337,7 @@ struct ostream_params {
-   int oflag =3D file::WRONLY | file::CREATE | file::TRUNC;
-   size_t buffer_size =3D BUFSIZ > 32768 ? BUFSIZ : 32768;
-=20
--  ostream_params() {}
-+  constexpr ostream_params() {}
-=20
-   template <typename... T>
-   ostream_params(T... params, int new_oflag) : ostream_params(params...=
) {
-@@ -365,82 +358,65 @@ struct ostream_params {
- #  endif
- };
-=20
--class file_buffer final : public buffer<char> {
-+}  // namespace detail
-+
-+FMT_INLINE_VARIABLE constexpr auto buffer_size =3D detail::buffer_size(=
);
-+
-+/// A fast buffered output stream for writing from a single thread. Wri=
ting from
-+/// multiple threads without external synchronization may result in a d=
ata race.
-+class FMT_API ostream : private detail::buffer<char> {
-+ private:
-   file file_;
-=20
--  FMT_API void grow(size_t) override;
-+  ostream(cstring_view path, const detail::ostream_params& params);
-+
-+  static void grow(buffer<char>& buf, size_t);
-=20
-  public:
--  FMT_API file_buffer(cstring_view path, const ostream_params& params);
--  FMT_API file_buffer(file_buffer&& other);
--  FMT_API ~file_buffer();
-+  ostream(ostream&& other) noexcept;
-+  ~ostream();
-=20
--  void flush() {
-+  operator writer() {
-+    detail::buffer<char>& buf =3D *this;
-+    return buf;
-+  }
-+
-+  inline void flush() {
-     if (size() =3D=3D 0) return;
-     file_.write(data(), size() * sizeof(data()[0]));
-     clear();
-   }
-=20
--  void close() {
-+  template <typename... T>
-+  friend auto output_file(cstring_view path, T... params) -> ostream;
-+
-+  inline void close() {
-     flush();
-     file_.close();
-   }
--};
--
--FMT_END_DETAIL_NAMESPACE
--
--// Added {} below to work around default constructor error known to
--// occur in Xcode versions 7.2.1 and 8.2.1.
--constexpr detail::buffer_size buffer_size{};
--
--/** A fast output stream which is not thread-safe. */
--class FMT_API ostream {
-- private:
--  FMT_MSC_WARNING(suppress : 4251)
--  detail::file_buffer buffer_;
-=20
--  ostream(cstring_view path, const detail::ostream_params& params)
--      : buffer_(path, params) {}
--
-- public:
--  ostream(ostream&& other) : buffer_(std::move(other.buffer_)) {}
--
--  ~ostream();
--
--  void flush() { buffer_.flush(); }
--
--  template <typename... T>
--  friend ostream output_file(cstring_view path, T... params);
--
--  void close() { buffer_.close(); }
--
--  /**
--    Formats ``args`` according to specifications in ``fmt`` and writes =
the
--    output to the file.
--   */
-+  /// Formats `args` according to specifications in `fmt` and writes th=
e
-+  /// output to the file.
-   template <typename... T> void print(format_string<T...> fmt, T&&... a=
rgs) {
--    vformat_to(detail::buffer_appender<char>(buffer_), fmt,
--               fmt::make_format_args(args...));
-+    vformat_to(appender(*this), fmt.str, vargs<T...>{{args...}});
-   }
- };
-=20
- /**
--  \rst
--  Opens a file for writing. Supported parameters passed in *params*:
--
--  * ``<integer>``: Flags passed to `open
--    <https://pubs.opengroup.org/onlinepubs/007904875/functions/open.htm=
l>`_
--    (``file::WRONLY | file::CREATE | file::TRUNC`` by default)
--  * ``buffer_size=3D<integer>``: Output buffer size
--
--  **Example**::
--
--    auto out =3D fmt::output_file("guide.txt");
--    out.print("Don't {}", "Panic");
--  \endrst
-+ * Opens a file for writing. Supported parameters passed in `params`:
-+ *
-+ * - `<integer>`: Flags passed to [open](
-+ *   https://pubs.opengroup.org/onlinepubs/007904875/functions/open.htm=
l)
-+ *   (`file::WRONLY | file::CREATE | file::TRUNC` by default)
-+ * - `buffer_size=3D<integer>`: Output buffer size
-+ *
-+ * **Example**:
-+ *
-+ *     auto out =3D fmt::output_file("guide.txt");
-+ *     out.print("Don't {}", "Panic");
-  */
- template <typename... T>
--inline ostream output_file(cstring_view path, T... params) {
-+inline auto output_file(cstring_view path, T... params) -> ostream {
-   return {path, detail::ostream_params(params...)};
- }
- #endif  // FMT_USE_FCNTL
-diff --git a/include/fmt/ostream.h b/include/fmt/ostream.h
-index a112fe7..71fd6c8 100644
---- a/include/fmt/ostream.h
-+++ b/include/fmt/ostream.h
-@@ -8,19 +8,29 @@
- #ifndef FMT_OSTREAM_H_
- #define FMT_OSTREAM_H_
-=20
--#include <fstream>  // std::filebuf
-+#ifndef FMT_MODULE
-+#  include <fstream>  // std::filebuf
-+#endif
-=20
--#if defined(_WIN32) && defined(__GLIBCXX__)
--#  include <ext/stdio_filebuf.h>
--#  include <ext/stdio_sync_filebuf.h>
--#elif defined(_WIN32) && defined(_LIBCPP_VERSION)
--#  include <__std_stream>
-+#ifdef _WIN32
-+#  ifdef __GLIBCXX__
-+#    include <ext/stdio_filebuf.h>
-+#    include <ext/stdio_sync_filebuf.h>
-+#  endif
-+#  include <io.h>
- #endif
-=20
--#include "format.h"
-+#include "chrono.h"  // formatbuf
-=20
--FMT_BEGIN_NAMESPACE
-+#ifdef _MSVC_STL_UPDATE
-+#  define FMT_MSVC_STL_UPDATE _MSVC_STL_UPDATE
-+#elif defined(_MSC_VER) && _MSC_VER < 1912  // VS 15.5
-+#  define FMT_MSVC_STL_UPDATE _MSVC_LANG
-+#else
-+#  define FMT_MSVC_STL_UPDATE 0
-+#endif
-=20
-+FMT_BEGIN_NAMESPACE
- namespace detail {
-=20
- // Generate a unique explicit instantion in every translation unit usin=
g a tag
-@@ -33,49 +43,18 @@ class file_access {
-   friend auto get_file(BufType& obj) -> FILE* { return obj.*FileMemberP=
tr; }
- };
-=20
--#if FMT_MSC_VERSION
-+#if FMT_MSVC_STL_UPDATE
- template class file_access<file_access_tag, std::filebuf,
-                            &std::filebuf::_Myfile>;
- auto get_file(std::filebuf&) -> FILE*;
--#elif defined(_WIN32) && defined(_LIBCPP_VERSION)
--template class file_access<file_access_tag, std::__stdoutbuf<char>,
--                           &std::__stdoutbuf<char>::__file_>;
--auto get_file(std::__stdoutbuf<char>&) -> FILE*;
--#endif
--
--inline bool write_ostream_unicode(std::ostream& os, fmt::string_view da=
ta) {
--#if FMT_MSC_VERSION
--  if (auto* buf =3D dynamic_cast<std::filebuf*>(os.rdbuf()))
--    if (FILE* f =3D get_file(*buf)) return write_console(f, data);
--#elif defined(_WIN32) && defined(__GLIBCXX__)
--  auto* rdbuf =3D os.rdbuf();
--  FILE* c_file;
--  if (auto* sfbuf =3D dynamic_cast<__gnu_cxx::stdio_sync_filebuf<char>*=
>(rdbuf))
--    c_file =3D sfbuf->file();
--  else if (auto* fbuf =3D dynamic_cast<__gnu_cxx::stdio_filebuf<char>*>=
(rdbuf))
--    c_file =3D fbuf->file();
--  else
--    return false;
--  if (c_file) return write_console(c_file, data);
--#elif defined(_WIN32) && defined(_LIBCPP_VERSION)
--  if (auto* buf =3D dynamic_cast<std::__stdoutbuf<char>*>(os.rdbuf()))
--    if (FILE* f =3D get_file(*buf)) return write_console(f, data);
--#else
--  ignore_unused(os, data);
- #endif
--  return false;
--}
--inline bool write_ostream_unicode(std::wostream&,
--                                  fmt::basic_string_view<wchar_t>) {
--  return false;
--}
-=20
- // Write the content of buf to os.
- // It is a separate function rather than a part of vprint to simplify t=
esting.
- template <typename Char>
- void write_buffer(std::basic_ostream<Char>& os, buffer<Char>& buf) {
-   const Char* buf_data =3D buf.data();
--  using unsigned_streamsize =3D std::make_unsigned<std::streamsize>::ty=
pe;
-+  using unsigned_streamsize =3D make_unsigned_t<std::streamsize>;
-   unsigned_streamsize size =3D buf.size();
-   unsigned_streamsize max_size =3D to_unsigned(max_value<std::streamsiz=
e>());
-   do {
-@@ -86,20 +65,9 @@ void write_buffer(std::basic_ostream<Char>& os, buffe=
r<Char>& buf) {
-   } while (size !=3D 0);
- }
-=20
--template <typename Char, typename T>
--void format_value(buffer<Char>& buf, const T& value,
--                  locale_ref loc =3D locale_ref()) {
--  auto&& format_buf =3D formatbuf<std::basic_streambuf<Char>>(buf);
--  auto&& output =3D std::basic_ostream<Char>(&format_buf);
--#if !defined(FMT_STATIC_THOUSANDS_SEPARATOR)
--  if (loc) output.imbue(loc.get<std::locale>());
--#endif
--  output << value;
--  output.exceptions(std::ios_base::failbit | std::ios_base::badbit);
--}
--
--template <typename T> struct streamed_view { const T& value; };
--
-+template <typename T> struct streamed_view {
-+  const T& value;
-+};
- }  // namespace detail
-=20
- // Formats an object of type T that has an overloaded ostream operator<=
<.
-@@ -107,11 +75,14 @@ template <typename Char>
- struct basic_ostream_formatter : formatter<basic_string_view<Char>, Cha=
r> {
-   void set_debug_format() =3D delete;
-=20
--  template <typename T, typename OutputIt>
--  auto format(const T& value, basic_format_context<OutputIt, Char>& ctx=
) const
--      -> OutputIt {
-+  template <typename T, typename Context>
-+  auto format(const T& value, Context& ctx) const -> decltype(ctx.out()=
) {
-     auto buffer =3D basic_memory_buffer<Char>();
--    detail::format_value(buffer, value, ctx.locale());
-+    auto&& formatbuf =3D detail::formatbuf<std::basic_streambuf<Char>>(=
buffer);
-+    auto&& output =3D std::basic_ostream<Char>(&formatbuf);
-+    output.imbue(std::locale::classic());  // The default is always unl=
ocalized.
-+    output << value;
-+    output.exceptions(std::ios_base::failbit | std::ios_base::badbit);
-     return formatter<basic_string_view<Char>, Char>::format(
-         {buffer.data(), buffer.size()}, ctx);
-   }
-@@ -122,73 +93,67 @@ using ostream_formatter =3D basic_ostream_formatter=
<char>;
- template <typename T, typename Char>
- struct formatter<detail::streamed_view<T>, Char>
-     : basic_ostream_formatter<Char> {
--  template <typename OutputIt>
--  auto format(detail::streamed_view<T> view,
--              basic_format_context<OutputIt, Char>& ctx) const -> Outpu=
tIt {
-+  template <typename Context>
-+  auto format(detail::streamed_view<T> view, Context& ctx) const
-+      -> decltype(ctx.out()) {
-     return basic_ostream_formatter<Char>::format(view.value, ctx);
-   }
- };
-=20
- /**
--  \rst
--  Returns a view that formats `value` via an ostream ``operator<<``.
--
--  **Example**::
--
--    fmt::print("Current thread id: {}\n",
--               fmt::streamed(std::this_thread::get_id()));
--  \endrst
-+ * Returns a view that formats `value` via an ostream `operator<<`.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print("Current thread id: {}\n",
-+ *                fmt::streamed(std::this_thread::get_id()));
-  */
- template <typename T>
--auto streamed(const T& value) -> detail::streamed_view<T> {
-+constexpr auto streamed(const T& value) -> detail::streamed_view<T> {
-   return {value};
- }
-=20
--namespace detail {
--
--inline void vprint_directly(std::ostream& os, string_view format_str,
--                            format_args args) {
-+inline void vprint(std::ostream& os, string_view fmt, format_args args)=
 {
-   auto buffer =3D memory_buffer();
--  detail::vformat_to(buffer, format_str, args);
--  detail::write_buffer(os, buffer);
--}
--
--}  // namespace detail
--
--FMT_EXPORT template <typename Char>
--void vprint(std::basic_ostream<Char>& os,
--            basic_string_view<type_identity_t<Char>> format_str,
--            basic_format_args<buffer_context<type_identity_t<Char>>> ar=
gs) {
--  auto buffer =3D basic_memory_buffer<Char>();
--  detail::vformat_to(buffer, format_str, args);
--  if (detail::write_ostream_unicode(os, {buffer.data(), buffer.size()})=
) return;
-+  detail::vformat_to(buffer, fmt, args);
-+  FILE* f =3D nullptr;
-+#if FMT_MSVC_STL_UPDATE && FMT_USE_RTTI
-+  if (auto* buf =3D dynamic_cast<std::filebuf*>(os.rdbuf()))
-+    f =3D detail::get_file(*buf);
-+#elif defined(_WIN32) && defined(__GLIBCXX__) && FMT_USE_RTTI
-+  auto* rdbuf =3D os.rdbuf();
-+  if (auto* sfbuf =3D dynamic_cast<__gnu_cxx::stdio_sync_filebuf<char>*=
>(rdbuf))
-+    f =3D sfbuf->file();
-+  else if (auto* fbuf =3D dynamic_cast<__gnu_cxx::stdio_filebuf<char>*>=
(rdbuf))
-+    f =3D fbuf->file();
-+#endif
-+#ifdef _WIN32
-+  if (f) {
-+    int fd =3D _fileno(f);
-+    if (_isatty(fd)) {
-+      os.flush();
-+      if (detail::write_console(fd, {buffer.data(), buffer.size()})) re=
turn;
-+    }
-+  }
-+#endif
-+  detail::ignore_unused(f);
-   detail::write_buffer(os, buffer);
- }
-=20
- /**
--  \rst
--  Prints formatted data to the stream *os*.
--
--  **Example**::
--
--    fmt::print(cerr, "Don't {}!", "panic");
--  \endrst
-+ * Prints formatted data to the stream `os`.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print(cerr, "Don't {}!", "panic");
-  */
- FMT_EXPORT template <typename... T>
- void print(std::ostream& os, format_string<T...> fmt, T&&... args) {
--  const auto& vargs =3D fmt::make_format_args(args...);
--  if (detail::is_utf8())
--    vprint(os, fmt, vargs);
--  else
--    detail::vprint_directly(os, fmt, vargs);
--}
--
--FMT_EXPORT
--template <typename... Args>
--void print(std::wostream& os,
--           basic_format_string<wchar_t, type_identity_t<Args>...> fmt,
--           Args&&... args) {
--  vprint(os, fmt, fmt::make_format_args<buffer_context<wchar_t>>(args..=
.));
-+  fmt::vargs<T...> vargs =3D {{args...}};
-+  if (detail::const_check(detail::use_utf8)) return vprint(os, fmt.str,=
 vargs);
-+  auto buffer =3D memory_buffer();
-+  detail::vformat_to(buffer, fmt.str, vargs);
-+  detail::write_buffer(os, buffer);
- }
-=20
- FMT_EXPORT template <typename... T>
-@@ -196,14 +161,6 @@ void println(std::ostream& os, format_string<T...> =
fmt, T&&... args) {
-   fmt::print(os, "{}\n", fmt::format(fmt, std::forward<T>(args)...));
- }
-=20
--FMT_EXPORT
--template <typename... Args>
--void println(std::wostream& os,
--             basic_format_string<wchar_t, type_identity_t<Args>...> fmt=
,
--             Args&&... args) {
--  print(os, L"{}\n", fmt::format(fmt, std::forward<Args>(args)...));
--}
--
- FMT_END_NAMESPACE
-=20
- #endif  // FMT_OSTREAM_H_
-diff --git a/include/fmt/printf.h b/include/fmt/printf.h
-index 5d1aeb7..e726840 100644
---- a/include/fmt/printf.h
-+++ b/include/fmt/printf.h
-@@ -8,60 +8,78 @@
- #ifndef FMT_PRINTF_H_
- #define FMT_PRINTF_H_
-=20
--#include <algorithm>  // std::max
--#include <limits>     // std::numeric_limits
-+#ifndef FMT_MODULE
-+#  include <algorithm>  // std::max
-+#  include <limits>     // std::numeric_limits
-+#endif
-=20
- #include "format.h"
-=20
- FMT_BEGIN_NAMESPACE
- FMT_BEGIN_EXPORT
-=20
--template <typename T> struct printf_formatter { printf_formatter() =3D =
delete; };
-+template <typename T> struct printf_formatter {
-+  printf_formatter() =3D delete;
-+};
-=20
- template <typename Char> class basic_printf_context {
-  private:
--  detail::buffer_appender<Char> out_;
-+  basic_appender<Char> out_;
-   basic_format_args<basic_printf_context> args_;
-=20
-+  static_assert(std::is_same<Char, char>::value ||
-+                    std::is_same<Char, wchar_t>::value,
-+                "Unsupported code unit type.");
-+
-  public:
-   using char_type =3D Char;
--  using parse_context_type =3D basic_format_parse_context<Char>;
-+  using parse_context_type =3D parse_context<Char>;
-   template <typename T> using formatter_type =3D printf_formatter<T>;
-+  enum { builtin_types =3D 1 };
-=20
--  /**
--    \rst
--    Constructs a ``printf_context`` object. References to the arguments=
 are
--    stored in the context object so make sure they have appropriate lif=
etimes.
--    \endrst
--   */
--  basic_printf_context(detail::buffer_appender<Char> out,
-+  /// Constructs a `printf_context` object. References to the arguments=
 are
-+  /// stored in the context object so make sure they have appropriate l=
ifetimes.
-+  basic_printf_context(basic_appender<Char> out,
-                        basic_format_args<basic_printf_context> args)
-       : out_(out), args_(args) {}
-=20
--  auto out() -> detail::buffer_appender<Char> { return out_; }
--  void advance_to(detail::buffer_appender<Char>) {}
-+  auto out() -> basic_appender<Char> { return out_; }
-+  void advance_to(basic_appender<Char>) {}
-=20
-   auto locale() -> detail::locale_ref { return {}; }
-=20
-   auto arg(int id) const -> basic_format_arg<basic_printf_context> {
-     return args_.get(id);
-   }
-+};
-=20
--  FMT_CONSTEXPR void on_error(const char* message) {
--    detail::error_handler().on_error(message);
-+namespace detail {
-+
-+// Return the result via the out param to workaround gcc bug 77539.
-+template <bool IS_CONSTEXPR, typename T, typename Ptr =3D const T*>
-+FMT_CONSTEXPR auto find(Ptr first, Ptr last, T value, Ptr& out) -> bool=
 {
-+  for (out =3D first; out !=3D last; ++out) {
-+    if (*out =3D=3D value) return true;
-   }
--};
-+  return false;
-+}
-=20
--FMT_BEGIN_DETAIL_NAMESPACE
-+template <>
-+inline auto find<false, char>(const char* first, const char* last, char=
 value,
-+                              const char*& out) -> bool {
-+  out =3D
-+      static_cast<const char*>(memchr(first, value, to_unsigned(last - =
first)));
-+  return out !=3D nullptr;
-+}
-=20
- // Checks if a value fits in int - used to avoid warnings about compari=
ng
- // signed and unsigned integers.
- template <bool IsSigned> struct int_checker {
-   template <typename T> static auto fits_in_int(T value) -> bool {
--    unsigned max =3D max_value<int>();
-+    unsigned max =3D to_unsigned(max_value<int>());
-     return value <=3D max;
-   }
--  static auto fits_in_int(bool) -> bool { return true; }
-+  inline static auto fits_in_int(bool) -> bool { return true; }
- };
-=20
- template <> struct int_checker<true> {
-@@ -69,20 +87,20 @@ template <> struct int_checker<true> {
-     return value >=3D (std::numeric_limits<int>::min)() &&
-            value <=3D max_value<int>();
-   }
--  static auto fits_in_int(int) -> bool { return true; }
-+  inline static auto fits_in_int(int) -> bool { return true; }
- };
-=20
- struct printf_precision_handler {
-   template <typename T, FMT_ENABLE_IF(std::is_integral<T>::value)>
-   auto operator()(T value) -> int {
-     if (!int_checker<std::numeric_limits<T>::is_signed>::fits_in_int(va=
lue))
--      throw_format_error("number is too big");
-+      report_error("number is too big");
-     return (std::max)(static_cast<int>(value), 0);
-   }
-=20
-   template <typename T, FMT_ENABLE_IF(!std::is_integral<T>::value)>
-   auto operator()(T) -> int {
--    throw_format_error("precision is not integer");
-+    report_error("precision is not integer");
-     return 0;
-   }
- };
-@@ -102,7 +120,9 @@ struct is_zero_int {
-=20
- template <typename T> struct make_unsigned_or_bool : std::make_unsigned=
<T> {};
-=20
--template <> struct make_unsigned_or_bool<bool> { using type =3D bool; }=
;
-+template <> struct make_unsigned_or_bool<bool> {
-+  using type =3D bool;
-+};
-=20
- template <typename T, typename Context> class arg_converter {
-  private:
-@@ -125,25 +145,19 @@ template <typename T, typename Context> class arg_=
converter {
-     using target_type =3D conditional_t<std::is_same<T, void>::value, U=
, T>;
-     if (const_check(sizeof(target_type) <=3D sizeof(int))) {
-       // Extra casts are used to silence warnings.
--      if (is_signed) {
--        auto n =3D static_cast<int>(static_cast<target_type>(value));
--        arg_ =3D detail::make_arg<Context>(n);
--      } else {
--        using unsigned_type =3D typename make_unsigned_or_bool<target_t=
ype>::type;
--        auto n =3D static_cast<unsigned>(static_cast<unsigned_type>(val=
ue));
--        arg_ =3D detail::make_arg<Context>(n);
--      }
-+      using unsigned_type =3D typename make_unsigned_or_bool<target_typ=
e>::type;
-+      if (is_signed)
-+        arg_ =3D static_cast<int>(static_cast<target_type>(value));
-+      else
-+        arg_ =3D static_cast<unsigned>(static_cast<unsigned_type>(value=
));
-     } else {
--      if (is_signed) {
--        // glibc's printf doesn't sign extend arguments of smaller type=
s:
--        //   std::printf("%lld", -42);  // prints "4294967254"
--        // but we don't have to do the same because it's a UB.
--        auto n =3D static_cast<long long>(value);
--        arg_ =3D detail::make_arg<Context>(n);
--      } else {
--        auto n =3D static_cast<typename make_unsigned_or_bool<U>::type>=
(value);
--        arg_ =3D detail::make_arg<Context>(n);
--      }
-+      // glibc's printf doesn't sign extend arguments of smaller types:
-+      //   std::printf("%lld", -42);  // prints "4294967254"
-+      // but we don't have to do the same because it's a UB.
-+      if (is_signed)
-+        arg_ =3D static_cast<long long>(value);
-+      else
-+        arg_ =3D static_cast<typename make_unsigned_or_bool<U>::type>(v=
alue);
-     }
-   }
-=20
-@@ -157,7 +171,7 @@ template <typename T, typename Context> class arg_co=
nverter {
- // unsigned).
- template <typename T, typename Context, typename Char>
- void convert_arg(basic_format_arg<Context>& arg, Char type) {
--  visit_format_arg(arg_converter<T, Context>(arg, type), arg);
-+  arg.visit(arg_converter<T, Context>(arg, type));
- }
-=20
- // Converts an integer argument to char for printf.
-@@ -170,8 +184,7 @@ template <typename Context> class char_converter {
-=20
-   template <typename T, FMT_ENABLE_IF(std::is_integral<T>::value)>
-   void operator()(T value) {
--    auto c =3D static_cast<typename Context::char_type>(value);
--    arg_ =3D detail::make_arg<Context>(c);
-+    arg_ =3D static_cast<typename Context::char_type>(value);
-   }
-=20
-   template <typename T, FMT_ENABLE_IF(!std::is_integral<T>::value)>
-@@ -187,28 +200,28 @@ template <typename Char> struct get_cstring {
-=20
- // Checks if an argument is a valid printf width specifier and sets
- // left alignment if it is negative.
--template <typename Char> class printf_width_handler {
-+class printf_width_handler {
-  private:
--  format_specs<Char>& specs_;
-+  format_specs& specs_;
-=20
-  public:
--  explicit printf_width_handler(format_specs<Char>& specs) : specs_(spe=
cs) {}
-+  inline explicit printf_width_handler(format_specs& specs) : specs_(sp=
ecs) {}
-=20
-   template <typename T, FMT_ENABLE_IF(std::is_integral<T>::value)>
-   auto operator()(T value) -> unsigned {
-     auto width =3D static_cast<uint32_or_64_or_128_t<T>>(value);
-     if (detail::is_negative(value)) {
--      specs_.align =3D align::left;
-+      specs_.set_align(align::left);
-       width =3D 0 - width;
-     }
--    unsigned int_max =3D max_value<int>();
--    if (width > int_max) throw_format_error("number is too big");
-+    unsigned int_max =3D to_unsigned(max_value<int>());
-+    if (width > int_max) report_error("number is too big");
-     return static_cast<unsigned>(width);
-   }
-=20
-   template <typename T, FMT_ENABLE_IF(!std::is_integral<T>::value)>
-   auto operator()(T) -> unsigned {
--    throw_format_error("width is not integer");
-+    report_error("width is not integer");
-     return 0;
-   }
- };
-@@ -216,12 +229,12 @@ template <typename Char> class printf_width_handle=
r {
- // Workaround for a bug with the XL compiler when initializing
- // printf_arg_formatter's base class.
- template <typename Char>
--auto make_arg_formatter(buffer_appender<Char> iter, format_specs<Char>&=
 s)
-+auto make_arg_formatter(basic_appender<Char> iter, format_specs& s)
-     -> arg_formatter<Char> {
-   return {iter, s, locale_ref()};
- }
-=20
--// The ``printf`` argument formatter.
-+// The `printf` argument formatter.
- template <typename Char>
- class printf_arg_formatter : public arg_formatter<Char> {
-  private:
-@@ -232,105 +245,96 @@ class printf_arg_formatter : public arg_formatter=
<Char> {
-=20
-   void write_null_pointer(bool is_string =3D false) {
-     auto s =3D this->specs;
--    s.type =3D presentation_type::none;
--    write_bytes(this->out, is_string ? "(null)" : "(nil)", s);
-+    s.set_type(presentation_type::none);
-+    write_bytes<Char>(this->out, is_string ? "(null)" : "(nil)", s);
-+  }
-+
-+  template <typename T> void write(T value) {
-+    detail::write<Char>(this->out, value, this->specs, this->locale);
-   }
-=20
-  public:
--  printf_arg_formatter(buffer_appender<Char> iter, format_specs<Char>& =
s,
-+  printf_arg_formatter(basic_appender<Char> iter, format_specs& s,
-                        context_type& ctx)
-       : base(make_arg_formatter(iter, s)), context_(ctx) {}
-=20
--  void operator()(monostate value) { base::operator()(value); }
-+  void operator()(monostate value) { write(value); }
-=20
-   template <typename T, FMT_ENABLE_IF(detail::is_integral<T>::value)>
-   void operator()(T value) {
-     // MSVC2013 fails to compile separate overloads for bool and Char s=
o use
-     // std::is_same instead.
-     if (!std::is_same<T, Char>::value) {
--      base::operator()(value);
-+      write(value);
-       return;
-     }
--    format_specs<Char> fmt_specs =3D this->specs;
--    if (fmt_specs.type !=3D presentation_type::none &&
--        fmt_specs.type !=3D presentation_type::chr) {
-+    format_specs s =3D this->specs;
-+    if (s.type() !=3D presentation_type::none &&
-+        s.type() !=3D presentation_type::chr) {
-       return (*this)(static_cast<int>(value));
-     }
--    fmt_specs.sign =3D sign::none;
--    fmt_specs.alt =3D false;
--    fmt_specs.fill[0] =3D ' ';  // Ignore '0' flag for char types.
-+    s.set_sign(sign::none);
-+    s.clear_alt();
-+    s.set_fill(' ');  // Ignore '0' flag for char types.
-     // align::numeric needs to be overwritten here since the '0' flag i=
s
-     // ignored for non-numeric types
--    if (fmt_specs.align =3D=3D align::none || fmt_specs.align =3D=3D al=
ign::numeric)
--      fmt_specs.align =3D align::right;
--    write<Char>(this->out, static_cast<Char>(value), fmt_specs);
-+    if (s.align() =3D=3D align::none || s.align() =3D=3D align::numeric=
)
-+      s.set_align(align::right);
-+    detail::write<Char>(this->out, static_cast<Char>(value), s);
-   }
-=20
-   template <typename T, FMT_ENABLE_IF(std::is_floating_point<T>::value)=
>
-   void operator()(T value) {
--    base::operator()(value);
-+    write(value);
-   }
-=20
--  /** Formats a null-terminated C string. */
-   void operator()(const char* value) {
-     if (value)
--      base::operator()(value);
-+      write(value);
-     else
--      write_null_pointer(this->specs.type !=3D presentation_type::point=
er);
-+      write_null_pointer(this->specs.type() !=3D presentation_type::poi=
nter);
-   }
-=20
--  /** Formats a null-terminated wide C string. */
-   void operator()(const wchar_t* value) {
-     if (value)
--      base::operator()(value);
-+      write(value);
-     else
--      write_null_pointer(this->specs.type !=3D presentation_type::point=
er);
-+      write_null_pointer(this->specs.type() !=3D presentation_type::poi=
nter);
-   }
-=20
--  void operator()(basic_string_view<Char> value) { base::operator()(val=
ue); }
-+  void operator()(basic_string_view<Char> value) { write(value); }
-=20
--  /** Formats a pointer. */
-   void operator()(const void* value) {
-     if (value)
--      base::operator()(value);
-+      write(value);
-     else
-       write_null_pointer();
-   }
-=20
--  /** Formats an argument of a custom (user-defined) type. */
-   void operator()(typename basic_format_arg<context_type>::handle handl=
e) {
--    auto parse_ctx =3D basic_format_parse_context<Char>({});
-+    auto parse_ctx =3D parse_context<Char>({});
-     handle.format(parse_ctx, context_);
-   }
- };
-=20
- template <typename Char>
--void parse_flags(format_specs<Char>& specs, const Char*& it, const Char=
* end) {
-+void parse_flags(format_specs& specs, const Char*& it, const Char* end)=
 {
-   for (; it !=3D end; ++it) {
-     switch (*it) {
--    case '-':
--      specs.align =3D align::left;
--      break;
--    case '+':
--      specs.sign =3D sign::plus;
--      break;
--    case '0':
--      specs.fill[0] =3D '0';
--      break;
-+    case '-': specs.set_align(align::left); break;
-+    case '+': specs.set_sign(sign::plus); break;
-+    case '0': specs.set_fill('0'); break;
-     case ' ':
--      if (specs.sign !=3D sign::plus) specs.sign =3D sign::space;
--      break;
--    case '#':
--      specs.alt =3D true;
-+      if (specs.sign() !=3D sign::plus) specs.set_sign(sign::space);
-       break;
--    default:
--      return;
-+    case '#': specs.set_alt(); break;
-+    default:  return;
-     }
-   }
- }
-=20
- template <typename Char, typename GetArg>
--auto parse_header(const Char*& it, const Char* end, format_specs<Char>&=
 specs,
-+auto parse_header(const Char*& it, const Char* end, format_specs& specs=
,
-                   GetArg get_arg) -> int {
-   int arg_index =3D -1;
-   Char c =3D *it;
-@@ -342,11 +346,11 @@ auto parse_header(const Char*& it, const Char* end=
, format_specs<Char>& specs,
-       ++it;
-       arg_index =3D value !=3D -1 ? value : max_value<int>();
-     } else {
--      if (c =3D=3D '0') specs.fill[0] =3D '0';
-+      if (c =3D=3D '0') specs.set_fill('0');
-       if (value !=3D 0) {
-         // Nonzero value means that we parsed width and don't need to
-         // parse it or flags again, so return now.
--        if (value =3D=3D -1) throw_format_error("number is too big");
-+        if (value =3D=3D -1) report_error("number is too big");
-         specs.width =3D value;
-         return arg_index;
-       }
-@@ -357,63 +361,47 @@ auto parse_header(const Char*& it, const Char* end=
, format_specs<Char>& specs,
-   if (it !=3D end) {
-     if (*it >=3D '0' && *it <=3D '9') {
-       specs.width =3D parse_nonnegative_int(it, end, -1);
--      if (specs.width =3D=3D -1) throw_format_error("number is too big"=
);
-+      if (specs.width =3D=3D -1) report_error("number is too big");
-     } else if (*it =3D=3D '*') {
-       ++it;
--      specs.width =3D static_cast<int>(visit_format_arg(
--          detail::printf_width_handler<Char>(specs), get_arg(-1)));
-+      specs.width =3D static_cast<int>(
-+          get_arg(-1).visit(detail::printf_width_handler(specs)));
-     }
-   }
-   return arg_index;
- }
-=20
--inline auto parse_printf_presentation_type(char c, type t)
-+inline auto parse_printf_presentation_type(char c, type t, bool& upper)
-     -> presentation_type {
-   using pt =3D presentation_type;
-   constexpr auto integral_set =3D sint_set | uint_set | bool_set | char=
_set;
-   switch (c) {
--  case 'd':
--    return in(t, integral_set) ? pt::dec : pt::none;
--  case 'o':
--    return in(t, integral_set) ? pt::oct : pt::none;
--  case 'x':
--    return in(t, integral_set) ? pt::hex_lower : pt::none;
--  case 'X':
--    return in(t, integral_set) ? pt::hex_upper : pt::none;
--  case 'a':
--    return in(t, float_set) ? pt::hexfloat_lower : pt::none;
--  case 'A':
--    return in(t, float_set) ? pt::hexfloat_upper : pt::none;
--  case 'e':
--    return in(t, float_set) ? pt::exp_lower : pt::none;
--  case 'E':
--    return in(t, float_set) ? pt::exp_upper : pt::none;
--  case 'f':
--    return in(t, float_set) ? pt::fixed_lower : pt::none;
--  case 'F':
--    return in(t, float_set) ? pt::fixed_upper : pt::none;
--  case 'g':
--    return in(t, float_set) ? pt::general_lower : pt::none;
--  case 'G':
--    return in(t, float_set) ? pt::general_upper : pt::none;
--  case 'c':
--    return in(t, integral_set) ? pt::chr : pt::none;
--  case 's':
--    return in(t, string_set | cstring_set) ? pt::string : pt::none;
--  case 'p':
--    return in(t, pointer_set | cstring_set) ? pt::pointer : pt::none;
--  default:
--    return pt::none;
-+  case 'd': return in(t, integral_set) ? pt::dec : pt::none;
-+  case 'o': return in(t, integral_set) ? pt::oct : pt::none;
-+  case 'X': upper =3D true; FMT_FALLTHROUGH;
-+  case 'x': return in(t, integral_set) ? pt::hex : pt::none;
-+  case 'E': upper =3D true; FMT_FALLTHROUGH;
-+  case 'e': return in(t, float_set) ? pt::exp : pt::none;
-+  case 'F': upper =3D true; FMT_FALLTHROUGH;
-+  case 'f': return in(t, float_set) ? pt::fixed : pt::none;
-+  case 'G': upper =3D true; FMT_FALLTHROUGH;
-+  case 'g': return in(t, float_set) ? pt::general : pt::none;
-+  case 'A': upper =3D true; FMT_FALLTHROUGH;
-+  case 'a': return in(t, float_set) ? pt::hexfloat : pt::none;
-+  case 'c': return in(t, integral_set) ? pt::chr : pt::none;
-+  case 's': return in(t, string_set | cstring_set) ? pt::string : pt::n=
one;
-+  case 'p': return in(t, pointer_set | cstring_set) ? pt::pointer : pt:=
:none;
-+  default:  return pt::none;
-   }
- }
-=20
- template <typename Char, typename Context>
- void vprintf(buffer<Char>& buf, basic_string_view<Char> format,
-              basic_format_args<Context> args) {
--  using iterator =3D buffer_appender<Char>;
-+  using iterator =3D basic_appender<Char>;
-   auto out =3D iterator(buf);
-   auto context =3D basic_printf_context<Char>(out, args);
--  auto parse_ctx =3D basic_format_parse_context<Char>(format);
-+  auto parse_ctx =3D parse_context<Char>(format);
-=20
-   // Returns the argument with specified index or, if arg_index is -1, =
the next
-   // argument.
-@@ -441,12 +429,12 @@ void vprintf(buffer<Char>& buf, basic_string_view<=
Char> format,
-     }
-     write(out, basic_string_view<Char>(start, to_unsigned(it - 1 - star=
t)));
-=20
--    auto specs =3D format_specs<Char>();
--    specs.align =3D align::right;
-+    auto specs =3D format_specs();
-+    specs.set_align(align::right);
-=20
-     // Parse argument index, flags and width.
-     int arg_index =3D parse_header(it, end, specs, get_arg);
--    if (arg_index =3D=3D 0) throw_format_error("argument not found");
-+    if (arg_index =3D=3D 0) report_error("argument not found");
-=20
-     // Parse precision.
-     if (it !=3D end && *it =3D=3D '.') {
-@@ -456,8 +444,8 @@ void vprintf(buffer<Char>& buf, basic_string_view<Ch=
ar> format,
-         specs.precision =3D parse_nonnegative_int(it, end, 0);
-       } else if (c =3D=3D '*') {
-         ++it;
--        specs.precision =3D static_cast<int>(
--            visit_format_arg(printf_precision_handler(), get_arg(-1)));
-+        specs.precision =3D
-+            static_cast<int>(get_arg(-1).visit(printf_precision_handler=
()));
-       } else {
-         specs.precision =3D 0;
-       }
-@@ -466,25 +454,26 @@ void vprintf(buffer<Char>& buf, basic_string_view<=
Char> format,
-     auto arg =3D get_arg(arg_index);
-     // For d, i, o, u, x, and X conversion specifiers, if a precision i=
s
-     // specified, the '0' flag is ignored
--    if (specs.precision >=3D 0 && arg.is_integral()) {
-+    if (specs.precision >=3D 0 && is_integral_type(arg.type())) {
-       // Ignore '0' for non-numeric types or if '-' present.
--      specs.fill[0] =3D ' ';
-+      specs.set_fill(' ');
-     }
-     if (specs.precision >=3D 0 && arg.type() =3D=3D type::cstring_type)=
 {
--      auto str =3D visit_format_arg(get_cstring<Char>(), arg);
-+      auto str =3D arg.visit(get_cstring<Char>());
-       auto str_end =3D str + specs.precision;
-       auto nul =3D std::find(str, str_end, Char());
-       auto sv =3D basic_string_view<Char>(
-           str, to_unsigned(nul !=3D str_end ? nul - str : specs.precisi=
on));
--      arg =3D make_arg<basic_printf_context<Char>>(sv);
-+      arg =3D sv;
-     }
--    if (specs.alt && visit_format_arg(is_zero_int(), arg)) specs.alt =3D=
 false;
--    if (specs.fill[0] =3D=3D '0') {
--      if (arg.is_arithmetic() && specs.align !=3D align::left)
--        specs.align =3D align::numeric;
--      else
--        specs.fill[0] =3D ' ';  // Ignore '0' flag for non-numeric type=
s or if '-'
--                              // flag is also present.
-+    if (specs.alt() && arg.visit(is_zero_int())) specs.clear_alt();
-+    if (specs.fill_unit<Char>() =3D=3D '0') {
-+      if (is_arithmetic_type(arg.type()) && specs.align() !=3D align::l=
eft) {
-+        specs.set_align(align::numeric);
-+      } else {
-+        // Ignore '0' flag for non-numeric types or if '-' flag is also=
 present.
-+        specs.set_fill(' ');
-+      }
-     }
-=20
-     // Parse length and convert the argument to the required type.
-@@ -509,51 +498,43 @@ void vprintf(buffer<Char>& buf, basic_string_view<=
Char> format,
-         convert_arg<long>(arg, t);
-       }
-       break;
--    case 'j':
--      convert_arg<intmax_t>(arg, t);
--      break;
--    case 'z':
--      convert_arg<size_t>(arg, t);
--      break;
--    case 't':
--      convert_arg<std::ptrdiff_t>(arg, t);
--      break;
-+    case 'j': convert_arg<intmax_t>(arg, t); break;
-+    case 'z': convert_arg<size_t>(arg, t); break;
-+    case 't': convert_arg<std::ptrdiff_t>(arg, t); break;
-     case 'L':
-       // printf produces garbage when 'L' is omitted for long double, n=
o
-       // need to do the same.
-       break;
--    default:
--      --it;
--      convert_arg<void>(arg, c);
-+    default: --it; convert_arg<void>(arg, c);
-     }
-=20
-     // Parse type.
--    if (it =3D=3D end) throw_format_error("invalid format string");
-+    if (it =3D=3D end) report_error("invalid format string");
-     char type =3D static_cast<char>(*it++);
--    if (arg.is_integral()) {
-+    if (is_integral_type(arg.type())) {
-       // Normalize type.
-       switch (type) {
-       case 'i':
--      case 'u':
--        type =3D 'd';
--        break;
-+      case 'u': type =3D 'd'; break;
-       case 'c':
--        visit_format_arg(char_converter<basic_printf_context<Char>>(arg=
), arg);
-+        arg.visit(char_converter<basic_printf_context<Char>>(arg));
-         break;
-       }
-     }
--    specs.type =3D parse_printf_presentation_type(type, arg.type());
--    if (specs.type =3D=3D presentation_type::none)
--      throw_format_error("invalid format specifier");
-+    bool upper =3D false;
-+    specs.set_type(parse_printf_presentation_type(type, arg.type(), upp=
er));
-+    if (specs.type() =3D=3D presentation_type::none)
-+      report_error("invalid format specifier");
-+    if (upper) specs.set_upper();
-=20
-     start =3D it;
-=20
-     // Format argument.
--    visit_format_arg(printf_arg_formatter<Char>(out, specs, context), a=
rg);
-+    arg.visit(printf_arg_formatter<Char>(out, specs, context));
-   }
-   write(out, basic_string_view<Char>(start, to_unsigned(it - start)));
- }
--FMT_END_DETAIL_NAMESPACE
-+}  // namespace detail
-=20
- using printf_context =3D basic_printf_context<char>;
- using wprintf_context =3D basic_printf_context<wchar_t>;
-@@ -561,56 +542,44 @@ using wprintf_context =3D basic_printf_context<wch=
ar_t>;
- using printf_args =3D basic_format_args<printf_context>;
- using wprintf_args =3D basic_format_args<wprintf_context>;
-=20
--/**
--  \rst
--  Constructs an `~fmt::format_arg_store` object that contains reference=
s to
--  arguments and can be implicitly converted to `~fmt::printf_args`.
--  \endrst
-- */
--template <typename... T>
--inline auto make_printf_args(const T&... args)
--    -> format_arg_store<printf_context, T...> {
--  return {args...};
-+/// Constructs an `format_arg_store` object that contains references to
-+/// arguments and can be implicitly converted to `printf_args`.
-+template <typename Char =3D char, typename... T>
-+inline auto make_printf_args(T&... args)
-+    -> decltype(fmt::make_format_args<basic_printf_context<Char>>(args.=
..)) {
-+  return fmt::make_format_args<basic_printf_context<Char>>(args...);
- }
-=20
--// DEPRECATED!
--template <typename... T>
--inline auto make_wprintf_args(const T&... args)
--    -> format_arg_store<wprintf_context, T...> {
--  return {args...};
--}
-+template <typename Char> struct vprintf_args {
-+  using type =3D basic_format_args<basic_printf_context<Char>>;
-+};
-=20
- template <typename Char>
--inline auto vsprintf(
--    basic_string_view<Char> fmt,
--    basic_format_args<basic_printf_context<type_identity_t<Char>>> args=
)
-+inline auto vsprintf(basic_string_view<Char> fmt,
-+                     typename vprintf_args<Char>::type args)
-     -> std::basic_string<Char> {
-   auto buf =3D basic_memory_buffer<Char>();
-   detail::vprintf(buf, fmt, args);
--  return to_string(buf);
-+  return {buf.data(), buf.size()};
- }
-=20
- /**
--  \rst
--  Formats arguments and returns the result as a string.
--
--  **Example**::
--
--    std::string message =3D fmt::sprintf("The answer is %d", 42);
--  \endrst
--*/
--template <typename S, typename... T,
--          typename Char =3D enable_if_t<detail::is_string<S>::value, ch=
ar_t<S>>>
-+ * Formats `args` according to specifications in `fmt` and returns the =
result
-+ * as as string.
-+ *
-+ * **Example**:
-+ *
-+ *     std::string message =3D fmt::sprintf("The answer is %d", 42);
-+ */
-+template <typename S, typename... T, typename Char =3D detail::char_t<S=
>>
- inline auto sprintf(const S& fmt, const T&... args) -> std::basic_strin=
g<Char> {
-   return vsprintf(detail::to_string_view(fmt),
-                   fmt::make_format_args<basic_printf_context<Char>>(arg=
s...));
- }
-=20
- template <typename Char>
--inline auto vfprintf(
--    std::FILE* f, basic_string_view<Char> fmt,
--    basic_format_args<basic_printf_context<type_identity_t<Char>>> args=
)
--    -> int {
-+inline auto vfprintf(std::FILE* f, basic_string_view<Char> fmt,
-+                     typename vprintf_args<Char>::type args) -> int {
-   auto buf =3D basic_memory_buffer<Char>();
-   detail::vprintf(buf, fmt, args);
-   size_t size =3D buf.size();
-@@ -620,36 +589,33 @@ inline auto vfprintf(
- }
-=20
- /**
--  \rst
--  Prints formatted data to the file *f*.
--
--  **Example**::
--
--    fmt::fprintf(stderr, "Don't %s!", "panic");
--  \endrst
-+ * Formats `args` according to specifications in `fmt` and writes the o=
utput
-+ * to `f`.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::fprintf(stderr, "Don't %s!", "panic");
-  */
--template <typename S, typename... T, typename Char =3D char_t<S>>
-+template <typename S, typename... T, typename Char =3D detail::char_t<S=
>>
- inline auto fprintf(std::FILE* f, const S& fmt, const T&... args) -> in=
t {
-   return vfprintf(f, detail::to_string_view(fmt),
--                  fmt::make_format_args<basic_printf_context<Char>>(arg=
s...));
-+                  make_printf_args<Char>(args...));
- }
-=20
- template <typename Char>
--FMT_DEPRECATED inline auto vprintf(
--    basic_string_view<Char> fmt,
--    basic_format_args<basic_printf_context<type_identity_t<Char>>> args=
)
-+FMT_DEPRECATED inline auto vprintf(basic_string_view<Char> fmt,
-+                                   typename vprintf_args<Char>::type ar=
gs)
-     -> int {
-   return vfprintf(stdout, fmt, args);
- }
-=20
- /**
--  \rst
--  Prints formatted data to ``stdout``.
--
--  **Example**::
--
--    fmt::printf("Elapsed time: %.2f seconds", 1.23);
--  \endrst
-+ * Formats `args` according to specifications in `fmt` and writes the o=
utput
-+ * to `stdout`.
-+ *
-+ * **Example**:
-+ *
-+ *   fmt::printf("Elapsed time: %.2f seconds", 1.23);
-  */
- template <typename... T>
- inline auto printf(string_view fmt, const T&... args) -> int {
-@@ -658,7 +624,7 @@ inline auto printf(string_view fmt, const T&... args=
) -> int {
- template <typename... T>
- FMT_DEPRECATED inline auto printf(basic_string_view<wchar_t> fmt,
-                                   const T&... args) -> int {
--  return vfprintf(stdout, fmt, make_wprintf_args(args...));
-+  return vfprintf(stdout, fmt, make_printf_args<wchar_t>(args...));
- }
-=20
- FMT_END_EXPORT
-diff --git a/include/fmt/ranges.h b/include/fmt/ranges.h
-index 266b9e1..77d645f 100644
---- a/include/fmt/ranges.h
-+++ b/include/fmt/ranges.h
-@@ -1,78 +1,38 @@
--// Formatting library for C++ - experimental range support
-+// Formatting library for C++ - range and tuple support
- //
--// Copyright (c) 2012 - present, Victor Zverovich
-+// Copyright (c) 2012 - present, Victor Zverovich and {fmt} contributor=
s
- // All rights reserved.
- //
- // For the license information refer to format.h.
--//
--// Copyright (c) 2018 - present, Remotion (Igor Schulz)
--// All Rights Reserved
--// {fmt} support for ranges, containers and types tuple interface.
-=20
- #ifndef FMT_RANGES_H_
- #define FMT_RANGES_H_
-=20
--#include <initializer_list>
--#include <tuple>
--#include <type_traits>
-+#ifndef FMT_MODULE
-+#  include <initializer_list>
-+#  include <iterator>
-+#  include <string>
-+#  include <tuple>
-+#  include <type_traits>
-+#  include <utility>
-+#endif
-=20
- #include "format.h"
-=20
- FMT_BEGIN_NAMESPACE
-=20
--namespace detail {
--
--template <typename Range, typename OutputIt>
--auto copy(const Range& range, OutputIt out) -> OutputIt {
--  for (auto it =3D range.begin(), end =3D range.end(); it !=3D end; ++i=
t)
--    *out++ =3D *it;
--  return out;
--}
--
--template <typename OutputIt>
--auto copy(const char* str, OutputIt out) -> OutputIt {
--  while (*str) *out++ =3D *str++;
--  return out;
--}
--
--template <typename OutputIt> auto copy(char ch, OutputIt out) -> Output=
It {
--  *out++ =3D ch;
--  return out;
--}
--
--template <typename OutputIt> auto copy(wchar_t ch, OutputIt out) -> Out=
putIt {
--  *out++ =3D ch;
--  return out;
--}
--
--// Returns true if T has a std::string-like interface, like std::string=
_view.
--template <typename T> class is_std_string_like {
--  template <typename U>
--  static auto check(U* p)
--      -> decltype((void)p->find('a'), p->length(), (void)p->data(), int=
());
--  template <typename> static void check(...);
--
-- public:
--  static constexpr const bool value =3D
--      is_string<T>::value ||
--      std::is_convertible<T, std_string_view<char>>::value ||
--      !std::is_void<decltype(check<T>(nullptr))>::value;
--};
-+FMT_EXPORT
-+enum class range_format { disabled, map, set, sequence, string, debug_s=
tring };
-=20
--template <typename Char>
--struct is_std_string_like<fmt::basic_string_view<Char>> : std::true_typ=
e {};
-+namespace detail {
-=20
- template <typename T> class is_map {
-   template <typename U> static auto check(U*) -> typename U::mapped_typ=
e;
-   template <typename> static void check(...);
-=20
-  public:
--#ifdef FMT_FORMAT_MAP_AS_LIST  // DEPRECATED!
--  static constexpr const bool value =3D false;
--#else
-   static constexpr const bool value =3D
-       !std::is_void<decltype(check<T>(nullptr))>::value;
--#endif
- };
-=20
- template <typename T> class is_set {
-@@ -80,26 +40,10 @@ template <typename T> class is_set {
-   template <typename> static void check(...);
-=20
-  public:
--#ifdef FMT_FORMAT_SET_AS_LIST  // DEPRECATED!
--  static constexpr const bool value =3D false;
--#else
-   static constexpr const bool value =3D
-       !std::is_void<decltype(check<T>(nullptr))>::value && !is_map<T>::=
value;
--#endif
- };
-=20
--template <typename... Ts> struct conditional_helper {};
--
--template <typename T, typename _ =3D void> struct is_range_ : std::fals=
e_type {};
--
--#if !FMT_MSC_VERSION || FMT_MSC_VERSION > 1800
--
--#  define FMT_DECLTYPE_RETURN(val)  \
--    ->decltype(val) { return val; } \
--    static_assert(                  \
--        true, "")  // This makes it so that a semicolon is required aft=
er the
--                   // macro, which helps clang-format handle the format=
ting.
--
- // C array overload
- template <typename T, std::size_t N>
- auto range_begin(const T (&arr)[N]) -> const T* {
-@@ -114,17 +58,21 @@ template <typename T, typename Enable =3D void>
- struct has_member_fn_begin_end_t : std::false_type {};
-=20
- template <typename T>
--struct has_member_fn_begin_end_t<T, void_t<decltype(std::declval<T>().b=
egin()),
-+struct has_member_fn_begin_end_t<T, void_t<decltype(*std::declval<T>().=
begin()),
-                                            decltype(std::declval<T>().e=
nd())>>
-     : std::true_type {};
-=20
--// Member function overload
-+// Member function overloads.
- template <typename T>
--auto range_begin(T&& rng) FMT_DECLTYPE_RETURN(static_cast<T&&>(rng).beg=
in());
-+auto range_begin(T&& rng) -> decltype(static_cast<T&&>(rng).begin()) {
-+  return static_cast<T&&>(rng).begin();
-+}
- template <typename T>
--auto range_end(T&& rng) FMT_DECLTYPE_RETURN(static_cast<T&&>(rng).end()=
);
-+auto range_end(T&& rng) -> decltype(static_cast<T&&>(rng).end()) {
-+  return static_cast<T&&>(rng).end();
-+}
-=20
--// ADL overload. Only participates in overload resolution if member fun=
ctions
-+// ADL overloads. Only participate in overload resolution if member fun=
ctions
- // are not found.
- template <typename T>
- auto range_begin(T&& rng)
-@@ -145,31 +93,30 @@ struct has_mutable_begin_end : std::false_type {};
-=20
- template <typename T>
- struct has_const_begin_end<
--    T,
--    void_t<
--        decltype(detail::range_begin(std::declval<const remove_cvref_t<=
T>&>())),
--        decltype(detail::range_end(std::declval<const remove_cvref_t<T>=
&>()))>>
-+    T, void_t<decltype(*detail::range_begin(
-+                  std::declval<const remove_cvref_t<T>&>())),
-+              decltype(detail::range_end(
-+                  std::declval<const remove_cvref_t<T>&>()))>>
-     : std::true_type {};
-=20
- template <typename T>
- struct has_mutable_begin_end<
--    T, void_t<decltype(detail::range_begin(std::declval<T>())),
--              decltype(detail::range_end(std::declval<T>())),
-+    T, void_t<decltype(*detail::range_begin(std::declval<T&>())),
-+              decltype(detail::range_end(std::declval<T&>())),
-               // the extra int here is because older versions of MSVC d=
on't
-               // SFINAE properly unless there are distinct types
-               int>> : std::true_type {};
-=20
-+template <typename T, typename _ =3D void> struct is_range_ : std::fals=
e_type {};
- template <typename T>
- struct is_range_<T, void>
-     : std::integral_constant<bool, (has_const_begin_end<T>::value ||
-                                     has_mutable_begin_end<T>::value)> {=
};
--#  undef FMT_DECLTYPE_RETURN
--#endif
-=20
- // tuple_size and tuple_element check.
- template <typename T> class is_tuple_like_ {
--  template <typename U>
--  static auto check(U* p) -> decltype(std::tuple_size<U>::value, int())=
;
-+  template <typename U, typename V =3D typename std::remove_cv<U>::type=
>
-+  static auto check(U* p) -> decltype(std::tuple_size<V>::value, 0);
-   template <typename> static void check(...);
-=20
-  public:
-@@ -187,7 +134,7 @@ template <size_t N> using make_index_sequence =3D st=
d::make_index_sequence<N>;
- template <typename T, T... N> struct integer_sequence {
-   using value_type =3D T;
-=20
--  static FMT_CONSTEXPR size_t size() { return sizeof...(N); }
-+  static FMT_CONSTEXPR auto size() -> size_t { return sizeof...(N); }
- };
-=20
- template <size_t... N> using index_sequence =3D integer_sequence<size_t=
, N...>;
-@@ -210,16 +157,17 @@ class is_tuple_formattable_ {
-   static constexpr const bool value =3D false;
- };
- template <typename T, typename C> class is_tuple_formattable_<T, C, tru=
e> {
--  template <std::size_t... Is>
--  static std::true_type check2(index_sequence<Is...>,
--                               integer_sequence<bool, (Is =3D=3D Is)...=
>);
--  static std::false_type check2(...);
--  template <std::size_t... Is>
--  static decltype(check2(
-+  template <size_t... Is>
-+  static auto all_true(index_sequence<Is...>,
-+                       integer_sequence<bool, (Is >=3D 0)...>) -> std::=
true_type;
-+  static auto all_true(...) -> std::false_type;
-+
-+  template <size_t... Is>
-+  static auto check(index_sequence<Is...>) -> decltype(all_true(
-       index_sequence<Is...>{},
--      integer_sequence<
--          bool, (is_formattable<typename std::tuple_element<Is, T>::typ=
e,
--                                C>::value)...>{})) check(index_sequence=
<Is...>);
-+      integer_sequence<bool,
-+                       (is_formattable<typename std::tuple_element<Is, =
T>::type,
-+                                       C>::value)...>{}));
-=20
-  public:
-   static constexpr const bool value =3D
-@@ -296,21 +244,32 @@ FMT_CONSTEXPR auto maybe_set_debug_format(Formatte=
r& f, bool set)
- template <typename Formatter>
- FMT_CONSTEXPR void maybe_set_debug_format(Formatter&, ...) {}
-=20
-+template <typename T>
-+struct range_format_kind_
-+    : std::integral_constant<range_format,
-+                             std::is_same<uncvref_type<T>, T>::value
-+                                 ? range_format::disabled
-+                             : is_map<T>::value ? range_format::map
-+                             : is_set<T>::value ? range_format::set
-+                                                : range_format::sequenc=
e> {};
-+
-+template <range_format K>
-+using range_format_constant =3D std::integral_constant<range_format, K>=
;
-+
- // These are not generic lambdas for compatibility with C++11.
--template <typename ParseContext> struct parse_empty_specs {
-+template <typename Char> struct parse_empty_specs {
-   template <typename Formatter> FMT_CONSTEXPR void operator()(Formatter=
& f) {
-     f.parse(ctx);
-     detail::maybe_set_debug_format(f, true);
-   }
--  ParseContext& ctx;
-+  parse_context<Char>& ctx;
- };
- template <typename FormatContext> struct format_tuple_element {
-   using char_type =3D typename FormatContext::char_type;
-=20
-   template <typename T>
-   void operator()(const formatter<T, char_type>& f, const T& v) {
--    if (i > 0)
--      ctx.advance_to(detail::copy_str<char_type>(separator, ctx.out()))=
;
-+    if (i > 0) ctx.advance_to(detail::copy<char_type>(separator, ctx.ou=
t()));
-     ctx.advance_to(f.format(v, ctx));
-     ++i;
-   }
-@@ -359,68 +318,56 @@ struct formatter<Tuple, Char,
-     closing_bracket_ =3D close;
-   }
-=20
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> decltype(ctx.begin()) =
{
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-     auto it =3D ctx.begin();
--    if (it !=3D ctx.end() && *it !=3D '}')
--      FMT_THROW(format_error("invalid format specifier"));
--    detail::for_each(formatters_, detail::parse_empty_specs<ParseContex=
t>{ctx});
-+    auto end =3D ctx.end();
-+    if (it !=3D end && detail::to_ascii(*it) =3D=3D 'n') {
-+      ++it;
-+      set_brackets({}, {});
-+      set_separator({});
-+    }
-+    if (it !=3D end && *it !=3D '}') report_error("invalid format speci=
fier");
-+    ctx.advance_to(it);
-+    detail::for_each(formatters_, detail::parse_empty_specs<Char>{ctx})=
;
-     return it;
-   }
-=20
-   template <typename FormatContext>
-   auto format(const Tuple& value, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
--    ctx.advance_to(detail::copy_str<Char>(opening_bracket_, ctx.out()))=
;
-+    ctx.advance_to(detail::copy<Char>(opening_bracket_, ctx.out()));
-     detail::for_each2(
-         formatters_, value,
-         detail::format_tuple_element<FormatContext>{0, ctx, separator_}=
);
--    return detail::copy_str<Char>(closing_bracket_, ctx.out());
-+    return detail::copy<Char>(closing_bracket_, ctx.out());
-   }
- };
-=20
- template <typename T, typename Char> struct is_range {
-   static constexpr const bool value =3D
--      detail::is_range_<T>::value && !detail::is_std_string_like<T>::va=
lue &&
--      !std::is_convertible<T, std::basic_string<Char>>::value &&
--      !std::is_convertible<T, detail::std_string_view<Char>>::value;
-+      detail::is_range_<T>::value && !detail::has_to_string_view<T>::va=
lue;
- };
-=20
- namespace detail {
--template <typename Context> struct range_mapper {
--  using mapper =3D arg_mapper<Context>;
--
--  template <typename T,
--            FMT_ENABLE_IF(has_formatter<remove_cvref_t<T>, Context>::va=
lue)>
--  static auto map(T&& value) -> T&& {
--    return static_cast<T&&>(value);
--  }
--  template <typename T,
--            FMT_ENABLE_IF(!has_formatter<remove_cvref_t<T>, Context>::v=
alue)>
--  static auto map(T&& value)
--      -> decltype(mapper().map(static_cast<T&&>(value))) {
--    return mapper().map(static_cast<T&&>(value));
--  }
--};
-=20
- template <typename Char, typename Element>
--using range_formatter_type =3D
--    formatter<remove_cvref_t<decltype(range_mapper<buffer_context<Char>=
>{}.map(
--                  std::declval<Element>()))>,
--              Char>;
-+using range_formatter_type =3D formatter<remove_cvref_t<Element>, Char>=
;
-=20
- template <typename R>
- using maybe_const_range =3D
-     conditional_t<has_const_begin_end<R>::value, const R, R>;
-=20
--// Workaround a bug in MSVC 2015 and earlier.
--#if !FMT_MSC_VERSION || FMT_MSC_VERSION >=3D 1910
- template <typename R, typename Char>
- struct is_formattable_delayed
-     : is_formattable<uncvref_type<maybe_const_range<R>>, Char> {};
--#endif
- }  // namespace detail
-=20
-+template <typename...> struct conjunction : std::true_type {};
-+template <typename P> struct conjunction<P> : P {};
-+template <typename P1, typename... Pn>
-+struct conjunction<P1, Pn...>
-+    : conditional_t<bool(P1::value), conjunction<Pn...>, P1> {};
-+
- template <typename T, typename Char, typename Enable =3D void>
- struct range_formatter;
-=20
-@@ -436,6 +383,24 @@ struct range_formatter<
-       detail::string_literal<Char, '['>{};
-   basic_string_view<Char> closing_bracket_ =3D
-       detail::string_literal<Char, ']'>{};
-+  bool is_debug =3D false;
-+
-+  template <typename Output, typename It, typename Sentinel, typename U=
 =3D T,
-+            FMT_ENABLE_IF(std::is_same<U, Char>::value)>
-+  auto write_debug_string(Output& out, It it, Sentinel end) const -> Ou=
tput {
-+    auto buf =3D basic_memory_buffer<Char>();
-+    for (; it !=3D end; ++it) buf.push_back(*it);
-+    auto specs =3D format_specs();
-+    specs.set_type(presentation_type::debug);
-+    return detail::write<Char>(
-+        out, basic_string_view<Char>(buf.data(), buf.size()), specs);
-+  }
-+
-+  template <typename Output, typename It, typename Sentinel, typename U=
 =3D T,
-+            FMT_ENABLE_IF(!std::is_same<U, Char>::value)>
-+  auto write_debug_string(Output& out, It, Sentinel) const -> Output {
-+    return out;
-+  }
-=20
-  public:
-   FMT_CONSTEXPR range_formatter() {}
-@@ -454,21 +419,40 @@ struct range_formatter<
-     closing_bracket_ =3D close;
-   }
-=20
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> decltype(ctx.begin()) =
{
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-     auto it =3D ctx.begin();
-     auto end =3D ctx.end();
-+    detail::maybe_set_debug_format(underlying_, true);
-+    if (it =3D=3D end) return underlying_.parse(ctx);
-=20
--    if (it !=3D end && *it =3D=3D 'n') {
-+    switch (detail::to_ascii(*it)) {
-+    case 'n':
-+      set_brackets({}, {});
-+      ++it;
-+      break;
-+    case '?':
-+      is_debug =3D true;
-       set_brackets({}, {});
-       ++it;
-+      if (it =3D=3D end || *it !=3D 's') report_error("invalid format s=
pecifier");
-+      FMT_FALLTHROUGH;
-+    case 's':
-+      if (!std::is_same<T, Char>::value)
-+        report_error("invalid format specifier");
-+      if (!is_debug) {
-+        set_brackets(detail::string_literal<Char, '"'>{},
-+                     detail::string_literal<Char, '"'>{});
-+        set_separator({});
-+        detail::maybe_set_debug_format(underlying_, false);
-+      }
-+      ++it;
-+      return it;
-     }
-=20
-     if (it !=3D end && *it !=3D '}') {
--      if (*it !=3D ':') FMT_THROW(format_error("invalid format specifie=
r"));
-+      if (*it !=3D ':') report_error("invalid format specifier");
-+      detail::maybe_set_debug_format(underlying_, false);
-       ++it;
--    } else {
--      detail::maybe_set_debug_format(underlying_, true);
-     }
-=20
-     ctx.advance_to(it);
-@@ -477,105 +461,220 @@ struct range_formatter<
-=20
-   template <typename R, typename FormatContext>
-   auto format(R&& range, FormatContext& ctx) const -> decltype(ctx.out(=
)) {
--    detail::range_mapper<buffer_context<Char>> mapper;
-     auto out =3D ctx.out();
--    out =3D detail::copy_str<Char>(opening_bracket_, out);
--    int i =3D 0;
-     auto it =3D detail::range_begin(range);
-     auto end =3D detail::range_end(range);
-+    if (is_debug) return write_debug_string(out, std::move(it), end);
-+
-+    out =3D detail::copy<Char>(opening_bracket_, out);
-+    int i =3D 0;
-     for (; it !=3D end; ++it) {
--      if (i > 0) out =3D detail::copy_str<Char>(separator_, out);
-+      if (i > 0) out =3D detail::copy<Char>(separator_, out);
-       ctx.advance_to(out);
--      out =3D underlying_.format(mapper.map(*it), ctx);
-+      auto&& item =3D *it;  // Need an lvalue
-+      out =3D underlying_.format(item, ctx);
-       ++i;
-     }
--    out =3D detail::copy_str<Char>(closing_bracket_, out);
-+    out =3D detail::copy<Char>(closing_bracket_, out);
-     return out;
-   }
- };
-=20
--enum class range_format { disabled, map, set, sequence, string, debug_s=
tring };
-+FMT_EXPORT
-+template <typename T, typename Char, typename Enable =3D void>
-+struct range_format_kind
-+    : conditional_t<
-+          is_range<T, Char>::value, detail::range_format_kind_<T>,
-+          std::integral_constant<range_format, range_format::disabled>>=
 {};
-=20
--namespace detail {
--template <typename T>
--struct range_format_kind_
--    : std::integral_constant<range_format,
--                             std::is_same<uncvref_type<T>, T>::value
--                                 ? range_format::disabled
--                             : is_map<T>::value ? range_format::map
--                             : is_set<T>::value ? range_format::set
--                                                : range_format::sequenc=
e> {};
-+template <typename R, typename Char>
-+struct formatter<
-+    R, Char,
-+    enable_if_t<conjunction<
-+        bool_constant<
-+            range_format_kind<R, Char>::value !=3D range_format::disabl=
ed &&
-+            range_format_kind<R, Char>::value !=3D range_format::map &&
-+            range_format_kind<R, Char>::value !=3D range_format::string=
 &&
-+            range_format_kind<R, Char>::value !=3D range_format::debug_=
string>,
-+        detail::is_formattable_delayed<R, Char>>::value>> {
-+ private:
-+  using range_type =3D detail::maybe_const_range<R>;
-+  range_formatter<detail::uncvref_type<range_type>, Char> range_formatt=
er_;
-=20
--template <range_format K, typename R, typename Char, typename Enable =3D=
 void>
--struct range_default_formatter;
-+ public:
-+  using nonlocking =3D void;
-+
-+  FMT_CONSTEXPR formatter() {
-+    if (detail::const_check(range_format_kind<R, Char>::value !=3D
-+                            range_format::set))
-+      return;
-+    range_formatter_.set_brackets(detail::string_literal<Char, '{'>{},
-+                                  detail::string_literal<Char, '}'>{});
-+  }
-=20
--template <range_format K>
--using range_format_constant =3D std::integral_constant<range_format, K>=
;
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    return range_formatter_.parse(ctx);
-+  }
-=20
--template <range_format K, typename R, typename Char>
--struct range_default_formatter<
--    K, R, Char,
--    enable_if_t<(K =3D=3D range_format::sequence || K =3D=3D range_form=
at::map ||
--                 K =3D=3D range_format::set)>> {
--  using range_type =3D detail::maybe_const_range<R>;
--  range_formatter<detail::uncvref_type<range_type>, Char> underlying_;
-+  template <typename FormatContext>
-+  auto format(range_type& range, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return range_formatter_.format(range, ctx);
-+  }
-+};
-+
-+// A map formatter.
-+template <typename R, typename Char>
-+struct formatter<
-+    R, Char,
-+    enable_if_t<conjunction<
-+        bool_constant<range_format_kind<R, Char>::value =3D=3D range_fo=
rmat::map>,
-+        detail::is_formattable_delayed<R, Char>>::value>> {
-+ private:
-+  using map_type =3D detail::maybe_const_range<R>;
-+  using element_type =3D detail::uncvref_type<map_type>;
-=20
--  FMT_CONSTEXPR range_default_formatter() { init(range_format_constant<=
K>()); }
-+  decltype(detail::tuple::get_formatters<element_type, Char>(
-+      detail::tuple_index_sequence<element_type>())) formatters_;
-+  bool no_delimiters_ =3D false;
-=20
--  FMT_CONSTEXPR void init(range_format_constant<range_format::set>) {
--    underlying_.set_brackets(detail::string_literal<Char, '{'>{},
--                             detail::string_literal<Char, '}'>{});
-+ public:
-+  FMT_CONSTEXPR formatter() {}
-+
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    auto it =3D ctx.begin();
-+    auto end =3D ctx.end();
-+    if (it !=3D end) {
-+      if (detail::to_ascii(*it) =3D=3D 'n') {
-+        no_delimiters_ =3D true;
-+        ++it;
-+      }
-+      if (it !=3D end && *it !=3D '}') {
-+        if (*it !=3D ':') report_error("invalid format specifier");
-+        ++it;
-+      }
-+      ctx.advance_to(it);
-+    }
-+    detail::for_each(formatters_, detail::parse_empty_specs<Char>{ctx})=
;
-+    return it;
-   }
-=20
--  FMT_CONSTEXPR void init(range_format_constant<range_format::map>) {
--    underlying_.set_brackets(detail::string_literal<Char, '{'>{},
--                             detail::string_literal<Char, '}'>{});
--    underlying_.underlying().set_brackets({}, {});
--    underlying_.underlying().set_separator(
--        detail::string_literal<Char, ':', ' '>{});
-+  template <typename FormatContext>
-+  auto format(map_type& map, FormatContext& ctx) const -> decltype(ctx.=
out()) {
-+    auto out =3D ctx.out();
-+    basic_string_view<Char> open =3D detail::string_literal<Char, '{'>{=
};
-+    if (!no_delimiters_) out =3D detail::copy<Char>(open, out);
-+    int i =3D 0;
-+    basic_string_view<Char> sep =3D detail::string_literal<Char, ',', '=
 '>{};
-+    for (auto&& value : map) {
-+      if (i > 0) out =3D detail::copy<Char>(sep, out);
-+      ctx.advance_to(out);
-+      detail::for_each2(formatters_, value,
-+                        detail::format_tuple_element<FormatContext>{
-+                            0, ctx, detail::string_literal<Char, ':', '=
 '>{}});
-+      ++i;
-+    }
-+    basic_string_view<Char> close =3D detail::string_literal<Char, '}'>=
{};
-+    if (!no_delimiters_) out =3D detail::copy<Char>(close, out);
-+    return out;
-   }
-+};
-=20
--  FMT_CONSTEXPR void init(range_format_constant<range_format::sequence>=
) {}
-+// A (debug_)string formatter.
-+template <typename R, typename Char>
-+struct formatter<
-+    R, Char,
-+    enable_if_t<range_format_kind<R, Char>::value =3D=3D range_format::=
string ||
-+                range_format_kind<R, Char>::value =3D=3D
-+                    range_format::debug_string>> {
-+ private:
-+  using range_type =3D detail::maybe_const_range<R>;
-+  using string_type =3D
-+      conditional_t<std::is_constructible<
-+                        detail::std_string_view<Char>,
-+                        decltype(detail::range_begin(std::declval<R>())=
),
-+                        decltype(detail::range_end(std::declval<R>()))>=
::value,
-+                    detail::std_string_view<Char>, std::basic_string<Ch=
ar>>;
-=20
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> decltype(ctx.begin()) =
{
-+  formatter<string_type, Char> underlying_;
-+
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-     return underlying_.parse(ctx);
-   }
-=20
-   template <typename FormatContext>
-   auto format(range_type& range, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
--    return underlying_.format(range, ctx);
-+    auto out =3D ctx.out();
-+    if (detail::const_check(range_format_kind<R, Char>::value =3D=3D
-+                            range_format::debug_string))
-+      *out++ =3D '"';
-+    out =3D underlying_.format(
-+        string_type{detail::range_begin(range), detail::range_end(range=
)}, ctx);
-+    if (detail::const_check(range_format_kind<R, Char>::value =3D=3D
-+                            range_format::debug_string))
-+      *out++ =3D '"';
-+    return out;
-   }
- };
--}  // namespace detail
-=20
--template <typename T, typename Char, typename Enable =3D void>
--struct range_format_kind
--    : conditional_t<
--          is_range<T, Char>::value, detail::range_format_kind_<T>,
--          std::integral_constant<range_format, range_format::disabled>>=
 {};
-+template <typename It, typename Sentinel, typename Char =3D char>
-+struct join_view : detail::view {
-+  It begin;
-+  Sentinel end;
-+  basic_string_view<Char> sep;
-=20
--template <typename R, typename Char>
--struct formatter<
--    R, Char,
--    enable_if_t<conjunction<bool_constant<range_format_kind<R, Char>::v=
alue !=3D
--                                          range_format::disabled>
--// Workaround a bug in MSVC 2015 and earlier.
--#if !FMT_MSC_VERSION || FMT_MSC_VERSION >=3D 1910
--                            ,
--                            detail::is_formattable_delayed<R, Char>
-+  join_view(It b, Sentinel e, basic_string_view<Char> s)
-+      : begin(std::move(b)), end(e), sep(s) {}
-+};
-+
-+template <typename It, typename Sentinel, typename Char>
-+struct formatter<join_view<It, Sentinel, Char>, Char> {
-+ private:
-+  using value_type =3D
-+#ifdef __cpp_lib_ranges
-+      std::iter_value_t<It>;
-+#else
-+      typename std::iterator_traits<It>::value_type;
- #endif
--                            >::value>>
--    : detail::range_default_formatter<range_format_kind<R, Char>::value=
, R,
--                                      Char> {
-+  formatter<remove_cvref_t<value_type>, Char> value_formatter_;
-+
-+  using view =3D conditional_t<std::is_copy_constructible<It>::value,
-+                             const join_view<It, Sentinel, Char>,
-+                             join_view<It, Sentinel, Char>>;
-+
-+ public:
-+  using nonlocking =3D void;
-+
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    return value_formatter_.parse(ctx);
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(view& value, FormatContext& ctx) const -> decltype(ctx.ou=
t()) {
-+    using iter =3D
-+        conditional_t<std::is_copy_constructible<view>::value, It, It&>=
;
-+    iter it =3D value.begin;
-+    auto out =3D ctx.out();
-+    if (it =3D=3D value.end) return out;
-+    out =3D value_formatter_.format(*it, ctx);
-+    ++it;
-+    while (it !=3D value.end) {
-+      out =3D detail::copy<Char>(value.sep.begin(), value.sep.end(), ou=
t);
-+      ctx.advance_to(out);
-+      out =3D value_formatter_.format(*it, ctx);
-+      ++it;
-+    }
-+    return out;
-+  }
- };
-=20
--template <typename Char, typename... T> struct tuple_join_view : detail=
::view {
--  const std::tuple<T...>& tuple;
-+template <typename Char, typename Tuple> struct tuple_join_view : detai=
l::view {
-+  const Tuple& tuple;
-   basic_string_view<Char> sep;
-=20
--  tuple_join_view(const std::tuple<T...>& t, basic_string_view<Char> s)
-+  tuple_join_view(const Tuple& t, basic_string_view<Char> s)
-       : tuple(t), sep{s} {}
- };
-=20
-@@ -586,65 +685,64 @@ template <typename Char, typename... T> struct tup=
le_join_view : detail::view {
- #  define FMT_TUPLE_JOIN_SPECIFIERS 0
- #endif
-=20
--template <typename Char, typename... T>
--struct formatter<tuple_join_view<Char, T...>, Char> {
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> decltype(ctx.begin()) =
{
--    return do_parse(ctx, std::integral_constant<size_t, sizeof...(T)>()=
);
-+template <typename Char, typename Tuple>
-+struct formatter<tuple_join_view<Char, Tuple>, Char,
-+                 enable_if_t<is_tuple_like<Tuple>::value>> {
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    return do_parse(ctx, std::tuple_size<Tuple>());
-   }
-=20
-   template <typename FormatContext>
--  auto format(const tuple_join_view<Char, T...>& value,
-+  auto format(const tuple_join_view<Char, Tuple>& value,
-               FormatContext& ctx) const -> typename FormatContext::iter=
ator {
--    return do_format(value, ctx,
--                     std::integral_constant<size_t, sizeof...(T)>());
-+    return do_format(value, ctx, std::tuple_size<Tuple>());
-   }
-=20
-  private:
--  std::tuple<formatter<typename std::decay<T>::type, Char>...> formatte=
rs_;
-+  decltype(detail::tuple::get_formatters<Tuple, Char>(
-+      detail::tuple_index_sequence<Tuple>())) formatters_;
-=20
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto do_parse(ParseContext& ctx,
-+  FMT_CONSTEXPR auto do_parse(parse_context<Char>& ctx,
-                               std::integral_constant<size_t, 0>)
--      -> decltype(ctx.begin()) {
-+      -> const Char* {
-     return ctx.begin();
-   }
-=20
--  template <typename ParseContext, size_t N>
--  FMT_CONSTEXPR auto do_parse(ParseContext& ctx,
-+  template <size_t N>
-+  FMT_CONSTEXPR auto do_parse(parse_context<Char>& ctx,
-                               std::integral_constant<size_t, N>)
--      -> decltype(ctx.begin()) {
-+      -> const Char* {
-     auto end =3D ctx.begin();
- #if FMT_TUPLE_JOIN_SPECIFIERS
--    end =3D std::get<sizeof...(T) - N>(formatters_).parse(ctx);
-+    end =3D std::get<std::tuple_size<Tuple>::value - N>(formatters_).pa=
rse(ctx);
-     if (N > 1) {
-       auto end1 =3D do_parse(ctx, std::integral_constant<size_t, N - 1>=
());
-       if (end !=3D end1)
--        FMT_THROW(format_error("incompatible format specs for tuple ele=
ments"));
-+        report_error("incompatible format specs for tuple elements");
-     }
- #endif
-     return end;
-   }
-=20
-   template <typename FormatContext>
--  auto do_format(const tuple_join_view<Char, T...>&, FormatContext& ctx=
,
-+  auto do_format(const tuple_join_view<Char, Tuple>&, FormatContext& ct=
x,
-                  std::integral_constant<size_t, 0>) const ->
-       typename FormatContext::iterator {
-     return ctx.out();
-   }
-=20
-   template <typename FormatContext, size_t N>
--  auto do_format(const tuple_join_view<Char, T...>& value, FormatContex=
t& ctx,
-+  auto do_format(const tuple_join_view<Char, Tuple>& value, FormatConte=
xt& ctx,
-                  std::integral_constant<size_t, N>) const ->
-       typename FormatContext::iterator {
--    auto out =3D std::get<sizeof...(T) - N>(formatters_)
--                   .format(std::get<sizeof...(T) - N>(value.tuple), ctx=
);
--    if (N > 1) {
--      out =3D std::copy(value.sep.begin(), value.sep.end(), out);
--      ctx.advance_to(out);
--      return do_format(value, ctx, std::integral_constant<size_t, N - 1=
>());
--    }
--    return out;
-+    using std::get;
-+    auto out =3D
-+        std::get<std::tuple_size<Tuple>::value - N>(formatters_)
-+            .format(get<std::tuple_size<Tuple>::value - N>(value.tuple)=
, ctx);
-+    if (N <=3D 1) return out;
-+    out =3D detail::copy<Char>(value.sep, out);
-+    ctx.advance_to(out);
-+    return do_format(value, ctx, std::integral_constant<size_t, N - 1>(=
));
-   }
- };
-=20
-@@ -668,8 +766,11 @@ template <typename Container> struct all {
- }  // namespace detail
-=20
- template <typename T, typename Char>
--struct formatter<T, Char,
--                 enable_if_t<detail::is_container_adaptor_like<T>::valu=
e>>
-+struct formatter<
-+    T, Char,
-+    enable_if_t<conjunction<detail::is_container_adaptor_like<T>,
-+                            bool_constant<range_format_kind<T, Char>::v=
alue =3D=3D
-+                                          range_format::disabled>>::val=
ue>>
-     : formatter<detail::all<typename T::container_type>, Char> {
-   using all =3D detail::all<typename T::container_type>;
-   template <typename FormatContext>
-@@ -685,40 +786,57 @@ struct formatter<T, Char,
-=20
- FMT_BEGIN_EXPORT
-=20
--/**
--  \rst
--  Returns an object that formats `tuple` with elements separated by `se=
p`.
--
--  **Example**::
-+/// Returns a view that formats the iterator range `[begin, end)` with =
elements
-+/// separated by `sep`.
-+template <typename It, typename Sentinel>
-+auto join(It begin, Sentinel end, string_view sep) -> join_view<It, Sen=
tinel> {
-+  return {std::move(begin), end, sep};
-+}
-=20
--    std::tuple<int, char> t =3D {1, 'a'};
--    fmt::print("{}", fmt::join(t, ", "));
--    // Output: "1, a"
--  \endrst
-+/**
-+ * Returns a view that formats `range` with elements separated by `sep`=
.
-+ *
-+ * **Example**:
-+ *
-+ *     auto v =3D std::vector<int>{1, 2, 3};
-+ *     fmt::print("{}", fmt::join(v, ", "));
-+ *     // Output: 1, 2, 3
-+ *
-+ * `fmt::join` applies passed format specifiers to the range elements:
-+ *
-+ *     fmt::print("{:02}", fmt::join(v, ", "));
-+ *     // Output: 01, 02, 03
-  */
--template <typename... T>
--FMT_CONSTEXPR auto join(const std::tuple<T...>& tuple, string_view sep)
--    -> tuple_join_view<char, T...> {
--  return {tuple, sep};
-+template <typename Range, FMT_ENABLE_IF(!is_tuple_like<Range>::value)>
-+auto join(Range&& r, string_view sep)
-+    -> join_view<decltype(detail::range_begin(r)),
-+                 decltype(detail::range_end(r))> {
-+  return {detail::range_begin(r), detail::range_end(r), sep};
- }
-=20
--template <typename... T>
--FMT_CONSTEXPR auto join(const std::tuple<T...>& tuple,
--                        basic_string_view<wchar_t> sep)
--    -> tuple_join_view<wchar_t, T...> {
-+/**
-+ * Returns an object that formats `std::tuple` with elements separated =
by `sep`.
-+ *
-+ * **Example**:
-+ *
-+ *     auto t =3D std::tuple<int, char>{1, 'a'};
-+ *     fmt::print("{}", fmt::join(t, ", "));
-+ *     // Output: 1, a
-+ */
-+template <typename Tuple, FMT_ENABLE_IF(is_tuple_like<Tuple>::value)>
-+FMT_CONSTEXPR auto join(const Tuple& tuple, string_view sep)
-+    -> tuple_join_view<char, Tuple> {
-   return {tuple, sep};
- }
-=20
- /**
--  \rst
--  Returns an object that formats `initializer_list` with elements separ=
ated by
--  `sep`.
--
--  **Example**::
--
--    fmt::print("{}", fmt::join({1, 2, 3}, ", "));
--    // Output: "1, 2, 3"
--  \endrst
-+ * Returns an object that formats `std::initializer_list` with elements
-+ * separated by `sep`.
-+ *
-+ * **Example**:
-+ *
-+ *     fmt::print("{}", fmt::join({1, 2, 3}, ", "));
-+ *     // Output: "1, 2, 3"
-  */
- template <typename T>
- auto join(std::initializer_list<T> list, string_view sep)
-diff --git a/include/fmt/std.h b/include/fmt/std.h
-index ac39565..1b0ea5a 100644
---- a/include/fmt/std.h
-+++ b/include/fmt/std.h
-@@ -8,30 +8,48 @@
- #ifndef FMT_STD_H_
- #define FMT_STD_H_
-=20
--#include <cstdlib>
--#include <exception>
--#include <memory>
--#include <thread>
--#include <type_traits>
--#include <typeinfo>
--#include <utility>
--
-+#include "format.h"
- #include "ostream.h"
-=20
--#if FMT_HAS_INCLUDE(<version>)
--#  include <version>
--#endif
--// Checking FMT_CPLUSPLUS for warning suppression in MSVC.
--#if FMT_CPLUSPLUS >=3D 201703L
--#  if FMT_HAS_INCLUDE(<filesystem>)
--#    include <filesystem>
-+#ifndef FMT_MODULE
-+#  include <atomic>
-+#  include <bitset>
-+#  include <complex>
-+#  include <cstdlib>
-+#  include <exception>
-+#  include <functional>
-+#  include <memory>
-+#  include <thread>
-+#  include <type_traits>
-+#  include <typeinfo>
-+#  include <utility>
-+#  include <vector>
-+
-+// Check FMT_CPLUSPLUS to suppress a bogus warning in MSVC.
-+#  if FMT_CPLUSPLUS >=3D 201703L
-+#    if FMT_HAS_INCLUDE(<filesystem>) && \
-+        (!defined(FMT_CPP_LIB_FILESYSTEM) || FMT_CPP_LIB_FILESYSTEM !=3D=
 0)
-+#      include <filesystem>
-+#    endif
-+#    if FMT_HAS_INCLUDE(<variant>)
-+#      include <variant>
-+#    endif
-+#    if FMT_HAS_INCLUDE(<optional>)
-+#      include <optional>
-+#    endif
- #  endif
--#  if FMT_HAS_INCLUDE(<variant>)
--#    include <variant>
-+// Use > instead of >=3D in the version check because <source_location>=
 may be
-+// available after C++17 but before C++20 is marked as implemented.
-+#  if FMT_CPLUSPLUS > 201703L && FMT_HAS_INCLUDE(<source_location>)
-+#    include <source_location>
- #  endif
--#  if FMT_HAS_INCLUDE(<optional>)
--#    include <optional>
-+#  if FMT_CPLUSPLUS > 202002L && FMT_HAS_INCLUDE(<expected>)
-+#    include <expected>
- #  endif
-+#endif  // FMT_MODULE
-+
-+#if FMT_HAS_INCLUDE(<version>)
-+#  include <version>
- #endif
-=20
- // GCC 4 does not support FMT_HAS_INCLUDE.
-@@ -44,67 +62,157 @@
- #  endif
- #endif
-=20
--#ifdef __cpp_lib_filesystem
-+// For older Xcode versions, __cpp_lib_xxx flags are inaccurately defin=
ed.
-+#ifndef FMT_CPP_LIB_FILESYSTEM
-+#  ifdef __cpp_lib_filesystem
-+#    define FMT_CPP_LIB_FILESYSTEM __cpp_lib_filesystem
-+#  else
-+#    define FMT_CPP_LIB_FILESYSTEM 0
-+#  endif
-+#endif
-+
-+#ifndef FMT_CPP_LIB_VARIANT
-+#  ifdef __cpp_lib_variant
-+#    define FMT_CPP_LIB_VARIANT __cpp_lib_variant
-+#  else
-+#    define FMT_CPP_LIB_VARIANT 0
-+#  endif
-+#endif
-+
-+#if FMT_CPP_LIB_FILESYSTEM
- FMT_BEGIN_NAMESPACE
-=20
- namespace detail {
-=20
--template <typename Char>
--void write_escaped_path(basic_memory_buffer<Char>& quoted,
--                        const std::filesystem::path& p) {
--  write_escaped_string<Char>(std::back_inserter(quoted), p.string<Char>=
());
--}
--#  ifdef _WIN32
--template <>
--inline void write_escaped_path<char>(memory_buffer& quoted,
--                                     const std::filesystem::path& p) {
--  auto buf =3D basic_memory_buffer<wchar_t>();
--  write_escaped_string<wchar_t>(std::back_inserter(buf), p.native());
--  // Convert UTF-16 to UTF-8.
--  if (!to_utf8<wchar_t>::convert(quoted, {buf.data(), buf.size()}))
--    FMT_THROW(std::runtime_error("invalid utf16"));
-+template <typename Char, typename PathChar>
-+auto get_path_string(const std::filesystem::path& p,
-+                     const std::basic_string<PathChar>& native) {
-+  if constexpr (std::is_same_v<Char, char> && std::is_same_v<PathChar, =
wchar_t>)
-+    return to_utf8<wchar_t>(native, to_utf8_error_policy::replace);
-+  else
-+    return p.string<Char>();
- }
--#  endif
--template <>
--inline void write_escaped_path<std::filesystem::path::value_type>(
--    basic_memory_buffer<std::filesystem::path::value_type>& quoted,
--    const std::filesystem::path& p) {
--  write_escaped_string<std::filesystem::path::value_type>(
--      std::back_inserter(quoted), p.native());
-+
-+template <typename Char, typename PathChar>
-+void write_escaped_path(basic_memory_buffer<Char>& quoted,
-+                        const std::filesystem::path& p,
-+                        const std::basic_string<PathChar>& native) {
-+  if constexpr (std::is_same_v<Char, char> &&
-+                std::is_same_v<PathChar, wchar_t>) {
-+    auto buf =3D basic_memory_buffer<wchar_t>();
-+    write_escaped_string<wchar_t>(std::back_inserter(buf), native);
-+    bool valid =3D to_utf8<wchar_t>::convert(quoted, {buf.data(), buf.s=
ize()});
-+    FMT_ASSERT(valid, "invalid utf16");
-+  } else if constexpr (std::is_same_v<Char, PathChar>) {
-+    write_escaped_string<std::filesystem::path::value_type>(
-+        std::back_inserter(quoted), native);
-+  } else {
-+    write_escaped_string<Char>(std::back_inserter(quoted), p.string<Cha=
r>());
-+  }
- }
-=20
- }  // namespace detail
-=20
--FMT_EXPORT
--template <typename Char>
--struct formatter<std::filesystem::path, Char>
--    : formatter<basic_string_view<Char>> {
--  template <typename ParseContext> FMT_CONSTEXPR auto parse(ParseContex=
t& ctx) {
--    auto out =3D formatter<basic_string_view<Char>>::parse(ctx);
--    this->set_debug_format(false);
--    return out;
-+template <typename Char> struct formatter<std::filesystem::path, Char> =
{
-+ private:
-+  format_specs specs_;
-+  detail::arg_ref<Char> width_ref_;
-+  bool debug_ =3D false;
-+  char path_type_ =3D 0;
-+
-+ public:
-+  FMT_CONSTEXPR void set_debug_format(bool set =3D true) { debug_ =3D s=
et; }
-+
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    if (it =3D=3D end) return it;
-+
-+    it =3D detail::parse_align(it, end, specs_);
-+    if (it =3D=3D end) return it;
-+
-+    Char c =3D *it;
-+    if ((c >=3D '0' && c <=3D '9') || c =3D=3D '{')
-+      it =3D detail::parse_width(it, end, specs_, width_ref_, ctx);
-+    if (it !=3D end && *it =3D=3D '?') {
-+      debug_ =3D true;
-+      ++it;
-+    }
-+    if (it !=3D end && (*it =3D=3D 'g')) path_type_ =3D detail::to_asci=
i(*it++);
-+    return it;
-   }
-+
-   template <typename FormatContext>
--  auto format(const std::filesystem::path& p, FormatContext& ctx) const=
 ->
--      typename FormatContext::iterator {
-+  auto format(const std::filesystem::path& p, FormatContext& ctx) const=
 {
-+    auto specs =3D specs_;
-+    auto path_string =3D
-+        !path_type_ ? p.native()
-+                    : p.generic_string<std::filesystem::path::value_typ=
e>();
-+
-+    detail::handle_dynamic_spec(specs.dynamic_width(), specs.width, wid=
th_ref_,
-+                                ctx);
-+    if (!debug_) {
-+      auto s =3D detail::get_path_string<Char>(p, path_string);
-+      return detail::write(ctx.out(), basic_string_view<Char>(s), specs=
);
-+    }
-     auto quoted =3D basic_memory_buffer<Char>();
--    detail::write_escaped_path(quoted, p);
--    return formatter<basic_string_view<Char>>::format(
--        basic_string_view<Char>(quoted.data(), quoted.size()), ctx);
-+    detail::write_escaped_path(quoted, p, path_string);
-+    return detail::write(ctx.out(),
-+                         basic_string_view<Char>(quoted.data(), quoted.=
size()),
-+                         specs);
-   }
- };
-+
-+class path : public std::filesystem::path {
-+ public:
-+  auto display_string() const -> std::string {
-+    const std::filesystem::path& base =3D *this;
-+    return fmt::format(FMT_STRING("{}"), base);
-+  }
-+  auto system_string() const -> std::string { return string(); }
-+
-+  auto generic_display_string() const -> std::string {
-+    const std::filesystem::path& base =3D *this;
-+    return fmt::format(FMT_STRING("{:g}"), base);
-+  }
-+  auto generic_system_string() const -> std::string { return generic_st=
ring(); }
-+};
-+
- FMT_END_NAMESPACE
--#endif
-+#endif  // FMT_CPP_LIB_FILESYSTEM
-=20
- FMT_BEGIN_NAMESPACE
--FMT_EXPORT
-+template <std::size_t N, typename Char>
-+struct formatter<std::bitset<N>, Char>
-+    : nested_formatter<basic_string_view<Char>, Char> {
-+ private:
-+  // Functor because C++11 doesn't support generic lambdas.
-+  struct writer {
-+    const std::bitset<N>& bs;
-+
-+    template <typename OutputIt>
-+    FMT_CONSTEXPR auto operator()(OutputIt out) -> OutputIt {
-+      for (auto pos =3D N; pos > 0; --pos) {
-+        out =3D detail::write<Char>(out, bs[pos - 1] ? Char('1') : Char=
('0'));
-+      }
-+
-+      return out;
-+    }
-+  };
-+
-+ public:
-+  template <typename FormatContext>
-+  auto format(const std::bitset<N>& bs, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return this->write_padded(ctx, writer{bs});
-+  }
-+};
-+
- template <typename Char>
- struct formatter<std::thread::id, Char> : basic_ostream_formatter<Char>=
 {};
- FMT_END_NAMESPACE
-=20
- #ifdef __cpp_lib_optional
- FMT_BEGIN_NAMESPACE
--FMT_EXPORT
- template <typename T, typename Char>
- struct formatter<std::optional<T>, Char,
-                  std::enable_if_t<is_formattable<T, Char>::value>> {
-@@ -126,13 +234,13 @@ struct formatter<std::optional<T>, Char,
-   FMT_CONSTEXPR static void maybe_set_debug_format(U&, ...) {}
-=20
-  public:
--  template <typename ParseContext> FMT_CONSTEXPR auto parse(ParseContex=
t& ctx) {
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) {
-     maybe_set_debug_format(underlying_, true);
-     return underlying_.parse(ctx);
-   }
-=20
-   template <typename FormatContext>
--  auto format(std::optional<T> const& opt, FormatContext& ctx) const
-+  auto format(const std::optional<T>& opt, FormatContext& ctx) const
-       -> decltype(ctx.out()) {
-     if (!opt) return detail::write<Char>(ctx.out(), none);
-=20
-@@ -146,24 +254,80 @@ struct formatter<std::optional<T>, Char,
- FMT_END_NAMESPACE
- #endif  // __cpp_lib_optional
-=20
--#ifdef __cpp_lib_variant
-+#if defined(__cpp_lib_expected) || FMT_CPP_LIB_VARIANT
-+
- FMT_BEGIN_NAMESPACE
--FMT_EXPORT
--template <typename Char> struct formatter<std::monostate, Char> {
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> decltype(ctx.begin()) =
{
-+namespace detail {
-+
-+template <typename Char, typename OutputIt, typename T>
-+auto write_escaped_alternative(OutputIt out, const T& v) -> OutputIt {
-+  if constexpr (has_to_string_view<T>::value)
-+    return write_escaped_string<Char>(out, detail::to_string_view(v));
-+  if constexpr (std::is_same_v<T, Char>) return write_escaped_char(out,=
 v);
-+  return write<Char>(out, v);
-+}
-+
-+}  // namespace detail
-+
-+FMT_END_NAMESPACE
-+#endif
-+
-+#ifdef __cpp_lib_expected
-+FMT_BEGIN_NAMESPACE
-+
-+template <typename T, typename E, typename Char>
-+struct formatter<std::expected<T, E>, Char,
-+                 std::enable_if_t<(std::is_void<T>::value ||
-+                                   is_formattable<T, Char>::value) &&
-+                                  is_formattable<E, Char>::value>> {
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-     return ctx.begin();
-   }
-=20
-   template <typename FormatContext>
--  auto format(const std::monostate&, FormatContext& ctx) const
-+  auto format(const std::expected<T, E>& value, FormatContext& ctx) con=
st
-+      -> decltype(ctx.out()) {
-+    auto out =3D ctx.out();
-+
-+    if (value.has_value()) {
-+      out =3D detail::write<Char>(out, "expected(");
-+      if constexpr (!std::is_void<T>::value)
-+        out =3D detail::write_escaped_alternative<Char>(out, *value);
-+    } else {
-+      out =3D detail::write<Char>(out, "unexpected(");
-+      out =3D detail::write_escaped_alternative<Char>(out, value.error(=
));
-+    }
-+    *out++ =3D ')';
-+    return out;
-+  }
-+};
-+FMT_END_NAMESPACE
-+#endif  // __cpp_lib_expected
-+
-+#ifdef __cpp_lib_source_location
-+FMT_BEGIN_NAMESPACE
-+template <> struct formatter<std::source_location> {
-+  FMT_CONSTEXPR auto parse(parse_context<>& ctx) { return ctx.begin(); =
}
-+
-+  template <typename FormatContext>
-+  auto format(const std::source_location& loc, FormatContext& ctx) cons=
t
-       -> decltype(ctx.out()) {
-     auto out =3D ctx.out();
--    out =3D detail::write<Char>(out, "monostate");
-+    out =3D detail::write(out, loc.file_name());
-+    out =3D detail::write(out, ':');
-+    out =3D detail::write<char>(out, loc.line());
-+    out =3D detail::write(out, ':');
-+    out =3D detail::write<char>(out, loc.column());
-+    out =3D detail::write(out, ": ");
-+    out =3D detail::write(out, loc.function_name());
-     return out;
-   }
- };
-+FMT_END_NAMESPACE
-+#endif
-=20
-+#if FMT_CPP_LIB_VARIANT
-+FMT_BEGIN_NAMESPACE
- namespace detail {
-=20
- template <typename T>
-@@ -186,17 +350,8 @@ template <typename T, typename C> class is_variant_=
formattable_ {
-       decltype(check(variant_index_sequence<T>{}))::value;
- };
-=20
--template <typename Char, typename OutputIt, typename T>
--auto write_variant_alternative(OutputIt out, const T& v) -> OutputIt {
--  if constexpr (is_string<T>::value)
--    return write_escaped_string<Char>(out, detail::to_string_view(v));
--  else if constexpr (std::is_same_v<T, Char>)
--    return write_escaped_char(out, v);
--  else
--    return write<Char>(out, v);
--}
--
- }  // namespace detail
-+
- template <typename T> struct is_variant_like {
-   static constexpr const bool value =3D detail::is_variant_like_<T>::va=
lue;
- };
-@@ -206,14 +361,24 @@ template <typename T, typename C> struct is_varian=
t_formattable {
-       detail::is_variant_formattable_<T, C>::value;
- };
-=20
--FMT_EXPORT
-+template <typename Char> struct formatter<std::monostate, Char> {
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    return ctx.begin();
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(const std::monostate&, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return detail::write<Char>(ctx.out(), "monostate");
-+  }
-+};
-+
- template <typename Variant, typename Char>
- struct formatter<
-     Variant, Char,
-     std::enable_if_t<std::conjunction_v<
-         is_variant_like<Variant>, is_variant_formattable<Variant, Char>=
>>> {
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> decltype(ctx.begin()) =
{
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-     return ctx.begin();
-   }
-=20
-@@ -223,13 +388,14 @@ struct formatter<
-     auto out =3D ctx.out();
-=20
-     out =3D detail::write<Char>(out, "variant(");
--    try {
-+    FMT_TRY {
-       std::visit(
-           [&](const auto& v) {
--            out =3D detail::write_variant_alternative<Char>(out, v);
-+            out =3D detail::write_escaped_alternative<Char>(out, v);
-           },
-           value);
--    } catch (const std::bad_variant_access&) {
-+    }
-+    FMT_CATCH(const std::bad_variant_access&) {
-       detail::write<Char>(out, "valueless by exception");
-     }
-     *out++ =3D ')';
-@@ -237,113 +403,308 @@ struct formatter<
-   }
- };
- FMT_END_NAMESPACE
--#endif  // __cpp_lib_variant
-+#endif  // FMT_CPP_LIB_VARIANT
-=20
- FMT_BEGIN_NAMESPACE
--FMT_EXPORT
--template <typename Char> struct formatter<std::error_code, Char> {
--  template <typename ParseContext>
--  FMT_CONSTEXPR auto parse(ParseContext& ctx) -> decltype(ctx.begin()) =
{
--    return ctx.begin();
-+template <> struct formatter<std::error_code> {
-+ private:
-+  format_specs specs_;
-+  detail::arg_ref<char> width_ref_;
-+
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<>& ctx) -> const char* {
-+    auto it =3D ctx.begin(), end =3D ctx.end();
-+    if (it =3D=3D end) return it;
-+
-+    it =3D detail::parse_align(it, end, specs_);
-+    if (it =3D=3D end) return it;
-+
-+    char c =3D *it;
-+    if ((c >=3D '0' && c <=3D '9') || c =3D=3D '{')
-+      it =3D detail::parse_width(it, end, specs_, width_ref_, ctx);
-+    return it;
-   }
-=20
-   template <typename FormatContext>
--  FMT_CONSTEXPR auto format(const std::error_code& ec, FormatContext& c=
tx) const
-+  FMT_CONSTEXPR20 auto format(const std::error_code& ec,
-+                              FormatContext& ctx) const -> decltype(ctx=
.out()) {
-+    auto specs =3D specs_;
-+    detail::handle_dynamic_spec(specs.dynamic_width(), specs.width, wid=
th_ref_,
-+                                ctx);
-+    memory_buffer buf;
-+    buf.append(string_view(ec.category().name()));
-+    buf.push_back(':');
-+    detail::write<char>(appender(buf), ec.value());
-+    return detail::write<char>(ctx.out(), string_view(buf.data(), buf.s=
ize()),
-+                               specs);
-+  }
-+};
-+
-+#if FMT_USE_RTTI
-+namespace detail {
-+
-+template <typename Char, typename OutputIt>
-+auto write_demangled_name(OutputIt out, const std::type_info& ti) -> Ou=
tputIt {
-+#  ifdef FMT_HAS_ABI_CXA_DEMANGLE
-+  int status =3D 0;
-+  std::size_t size =3D 0;
-+  std::unique_ptr<char, void (*)(void*)> demangled_name_ptr(
-+      abi::__cxa_demangle(ti.name(), nullptr, &size, &status), &std::fr=
ee);
-+
-+  string_view demangled_name_view;
-+  if (demangled_name_ptr) {
-+    demangled_name_view =3D demangled_name_ptr.get();
-+
-+    // Normalization of stdlib inline namespace names.
-+    // libc++ inline namespaces.
-+    //  std::__1::*       -> std::*
-+    //  std::__1::__fs::* -> std::*
-+    // libstdc++ inline namespaces.
-+    //  std::__cxx11::*             -> std::*
-+    //  std::filesystem::__cxx11::* -> std::filesystem::*
-+    if (demangled_name_view.starts_with("std::")) {
-+      char* begin =3D demangled_name_ptr.get();
-+      char* to =3D begin + 5;  // std::
-+      for (char *from =3D to, *end =3D begin + demangled_name_view.size=
();
-+           from < end;) {
-+        // This is safe, because demangled_name is NUL-terminated.
-+        if (from[0] =3D=3D '_' && from[1] =3D=3D '_') {
-+          char* next =3D from + 1;
-+          while (next < end && *next !=3D ':') next++;
-+          if (next[0] =3D=3D ':' && next[1] =3D=3D ':') {
-+            from =3D next + 2;
-+            continue;
-+          }
-+        }
-+        *to++ =3D *from++;
-+      }
-+      demangled_name_view =3D {begin, detail::to_unsigned(to - begin)};
-+    }
-+  } else {
-+    demangled_name_view =3D string_view(ti.name());
-+  }
-+  return detail::write_bytes<Char>(out, demangled_name_view);
-+#  elif FMT_MSC_VERSION
-+  const string_view demangled_name(ti.name());
-+  for (std::size_t i =3D 0; i < demangled_name.size(); ++i) {
-+    auto sub =3D demangled_name;
-+    sub.remove_prefix(i);
-+    if (sub.starts_with("enum ")) {
-+      i +=3D 4;
-+      continue;
-+    }
-+    if (sub.starts_with("class ") || sub.starts_with("union ")) {
-+      i +=3D 5;
-+      continue;
-+    }
-+    if (sub.starts_with("struct ")) {
-+      i +=3D 6;
-+      continue;
-+    }
-+    if (*sub.begin() !=3D ' ') *out++ =3D *sub.begin();
-+  }
-+  return out;
-+#  else
-+  return detail::write_bytes<Char>(out, string_view(ti.name()));
-+#  endif
-+}
-+
-+}  // namespace detail
-+
-+template <typename Char>
-+struct formatter<std::type_info, Char  // DEPRECATED! Mixing code unit =
types.
-+                 > {
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    return ctx.begin();
-+  }
-+
-+  template <typename Context>
-+  auto format(const std::type_info& ti, Context& ctx) const
-       -> decltype(ctx.out()) {
--    auto out =3D ctx.out();
--    out =3D detail::write_bytes(out, ec.category().name(), format_specs=
<Char>());
--    out =3D detail::write<Char>(out, Char(':'));
--    out =3D detail::write<Char>(out, ec.value());
--    return out;
-+    return detail::write_demangled_name<Char>(ctx.out(), ti);
-   }
- };
-+#endif
-=20
--FMT_EXPORT
- template <typename T, typename Char>
- struct formatter<
--    T, Char,
-+    T, Char,  // DEPRECATED! Mixing code unit types.
-     typename std::enable_if<std::is_base_of<std::exception, T>::value>:=
:type> {
-  private:
-   bool with_typename_ =3D false;
-=20
-  public:
--  FMT_CONSTEXPR auto parse(basic_format_parse_context<Char>& ctx)
--      -> decltype(ctx.begin()) {
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-     auto it =3D ctx.begin();
-     auto end =3D ctx.end();
-     if (it =3D=3D end || *it =3D=3D '}') return it;
-     if (*it =3D=3D 't') {
-       ++it;
--      with_typename_ =3D true;
-+      with_typename_ =3D FMT_USE_RTTI !=3D 0;
-     }
-     return it;
-   }
-=20
--  template <typename OutputIt>
--  auto format(const std::exception& ex,
--              basic_format_context<OutputIt, Char>& ctx) const -> Outpu=
tIt {
--    format_specs<Char> spec;
-+  template <typename Context>
-+  auto format(const std::exception& ex, Context& ctx) const
-+      -> decltype(ctx.out()) {
-     auto out =3D ctx.out();
--    if (!with_typename_)
--      return detail::write_bytes(out, string_view(ex.what()), spec);
--
--    const std::type_info& ti =3D typeid(ex);
--#ifdef FMT_HAS_ABI_CXA_DEMANGLE
--    int status =3D 0;
--    std::size_t size =3D 0;
--    std::unique_ptr<char, decltype(&std::free)> demangled_name_ptr(
--        abi::__cxa_demangle(ti.name(), nullptr, &size, &status), &std::=
free);
--
--    string_view demangled_name_view;
--    if (demangled_name_ptr) {
--      demangled_name_view =3D demangled_name_ptr.get();
--
--      // Normalization of stdlib inline namespace names.
--      // libc++ inline namespaces.
--      //  std::__1::*       -> std::*
--      //  std::__1::__fs::* -> std::*
--      // libstdc++ inline namespaces.
--      //  std::__cxx11::*             -> std::*
--      //  std::filesystem::__cxx11::* -> std::filesystem::*
--      if (demangled_name_view.starts_with("std::")) {
--        char* begin =3D demangled_name_ptr.get();
--        char* to =3D begin + 5;  // std::
--        for (char *from =3D to, *end =3D begin + demangled_name_view.si=
ze();
--             from < end;) {
--          // This is safe, because demangled_name is NUL-terminated.
--          if (from[0] =3D=3D '_' && from[1] =3D=3D '_') {
--            char* next =3D from + 1;
--            while (next < end && *next !=3D ':') next++;
--            if (next[0] =3D=3D ':' && next[1] =3D=3D ':') {
--              from =3D next + 2;
--              continue;
--            }
--          }
--          *to++ =3D *from++;
--        }
--        demangled_name_view =3D {begin, detail::to_unsigned(to - begin)=
};
--      }
--    } else {
--      demangled_name_view =3D string_view(ti.name());
-+#if FMT_USE_RTTI
-+    if (with_typename_) {
-+      out =3D detail::write_demangled_name<Char>(out, typeid(ex));
-+      *out++ =3D ':';
-+      *out++ =3D ' ';
-     }
--    out =3D detail::write_bytes(out, demangled_name_view, spec);
--#elif FMT_MSC_VERSION
--    string_view demangled_name_view(ti.name());
--    if (demangled_name_view.starts_with("class "))
--      demangled_name_view.remove_prefix(6);
--    else if (demangled_name_view.starts_with("struct "))
--      demangled_name_view.remove_prefix(7);
--    out =3D detail::write_bytes(out, demangled_name_view, spec);
--#else
--    out =3D detail::write_bytes(out, string_view(ti.name()), spec);
- #endif
--    out =3D detail::write<Char>(out, Char(':'));
--    out =3D detail::write<Char>(out, Char(' '));
--    out =3D detail::write_bytes(out, string_view(ex.what()), spec);
-+    return detail::write_bytes<Char>(out, string_view(ex.what()));
-+  }
-+};
-+
-+namespace detail {
-+
-+template <typename T, typename Enable =3D void>
-+struct has_flip : std::false_type {};
-+
-+template <typename T>
-+struct has_flip<T, void_t<decltype(std::declval<T>().flip())>>
-+    : std::true_type {};
-+
-+template <typename T> struct is_bit_reference_like {
-+  static constexpr const bool value =3D
-+      std::is_convertible<T, bool>::value &&
-+      std::is_nothrow_assignable<T, bool>::value && has_flip<T>::value;
-+};
-+
-+#ifdef _LIBCPP_VERSION
-+
-+// Workaround for libc++ incompatibility with C++ standard.
-+// According to the Standard, `bitset::operator[] const` returns bool.
-+template <typename C>
-+struct is_bit_reference_like<std::__bit_const_reference<C>> {
-+  static constexpr const bool value =3D true;
-+};
-+
-+#endif
-+
-+}  // namespace detail
-+
-+// We can't use std::vector<bool, Allocator>::reference and
-+// std::bitset<N>::reference because the compiler can't deduce Allocato=
r and N
-+// in partial specialization.
-+template <typename BitRef, typename Char>
-+struct formatter<BitRef, Char,
-+                 enable_if_t<detail::is_bit_reference_like<BitRef>::val=
ue>>
-+    : formatter<bool, Char> {
-+  template <typename FormatContext>
-+  FMT_CONSTEXPR auto format(const BitRef& v, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return formatter<bool, Char>::format(v, ctx);
-+  }
-+};
-+
-+template <typename T, typename Deleter>
-+auto ptr(const std::unique_ptr<T, Deleter>& p) -> const void* {
-+  return p.get();
-+}
-+template <typename T> auto ptr(const std::shared_ptr<T>& p) -> const vo=
id* {
-+  return p.get();
-+}
-+
-+template <typename T, typename Char>
-+struct formatter<std::atomic<T>, Char,
-+                 enable_if_t<is_formattable<T, Char>::value>>
-+    : formatter<T, Char> {
-+  template <typename FormatContext>
-+  auto format(const std::atomic<T>& v, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return formatter<T, Char>::format(v.load(), ctx);
-+  }
-+};
-+
-+#ifdef __cpp_lib_atomic_flag_test
-+template <typename Char>
-+struct formatter<std::atomic_flag, Char> : formatter<bool, Char> {
-+  template <typename FormatContext>
-+  auto format(const std::atomic_flag& v, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return formatter<bool, Char>::format(v.test(), ctx);
-+  }
-+};
-+#endif  // __cpp_lib_atomic_flag_test
-=20
-+template <typename T, typename Char> struct formatter<std::complex<T>, =
Char> {
-+ private:
-+  detail::dynamic_format_specs<Char> specs_;
-+
-+  template <typename FormatContext, typename OutputIt>
-+  FMT_CONSTEXPR auto do_format(const std::complex<T>& c,
-+                               detail::dynamic_format_specs<Char>& spec=
s,
-+                               FormatContext& ctx, OutputIt out) const
-+      -> OutputIt {
-+    if (c.real() !=3D 0) {
-+      *out++ =3D Char('(');
-+      out =3D detail::write<Char>(out, c.real(), specs, ctx.locale());
-+      specs.set_sign(sign::plus);
-+      out =3D detail::write<Char>(out, c.imag(), specs, ctx.locale());
-+      if (!detail::isfinite(c.imag())) *out++ =3D Char(' ');
-+      *out++ =3D Char('i');
-+      *out++ =3D Char(')');
-+      return out;
-+    }
-+    out =3D detail::write<Char>(out, c.imag(), specs, ctx.locale());
-+    if (!detail::isfinite(c.imag())) *out++ =3D Char(' ');
-+    *out++ =3D Char('i');
-     return out;
-   }
-+
-+ public:
-+  FMT_CONSTEXPR auto parse(parse_context<Char>& ctx) -> const Char* {
-+    if (ctx.begin() =3D=3D ctx.end() || *ctx.begin() =3D=3D '}') return=
 ctx.begin();
-+    return parse_format_specs(ctx.begin(), ctx.end(), specs_, ctx,
-+                              detail::type_constant<T, Char>::value);
-+  }
-+
-+  template <typename FormatContext>
-+  auto format(const std::complex<T>& c, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    auto specs =3D specs_;
-+    if (specs.dynamic()) {
-+      detail::handle_dynamic_spec(specs.dynamic_width(), specs.width,
-+                                  specs.width_ref, ctx);
-+      detail::handle_dynamic_spec(specs.dynamic_precision(), specs.prec=
ision,
-+                                  specs.precision_ref, ctx);
-+    }
-+
-+    if (specs.width =3D=3D 0) return do_format(c, specs, ctx, ctx.out()=
);
-+    auto buf =3D basic_memory_buffer<Char>();
-+
-+    auto outer_specs =3D format_specs();
-+    outer_specs.width =3D specs.width;
-+    outer_specs.copy_fill_from(specs);
-+    outer_specs.set_align(specs.align());
-+
-+    specs.width =3D 0;
-+    specs.set_fill({});
-+    specs.set_align(align::none);
-+
-+    do_format(c, specs, ctx, basic_appender<Char>(buf));
-+    return detail::write<Char>(ctx.out(),
-+                               basic_string_view<Char>(buf.data(), buf.=
size()),
-+                               outer_specs);
-+  }
-+};
-+
-+template <typename T, typename Char>
-+struct formatter<std::reference_wrapper<T>, Char,
-+                 enable_if_t<is_formattable<remove_cvref_t<T>, Char>::v=
alue>>
-+    : formatter<remove_cvref_t<T>, Char> {
-+  template <typename FormatContext>
-+  auto format(std::reference_wrapper<T> ref, FormatContext& ctx) const
-+      -> decltype(ctx.out()) {
-+    return formatter<remove_cvref_t<T>, Char>::format(ref.get(), ctx);
-+  }
- };
--FMT_END_NAMESPACE
-=20
-+FMT_END_NAMESPACE
- #endif  // FMT_STD_H_
-diff --git a/include/fmt/xchar.h b/include/fmt/xchar.h
-index 625ec36..d959010 100644
---- a/include/fmt/xchar.h
-+++ b/include/fmt/xchar.h
-@@ -8,12 +8,16 @@
- #ifndef FMT_XCHAR_H_
- #define FMT_XCHAR_H_
-=20
--#include <cwchar>
--
-+#include "color.h"
- #include "format.h"
--
--#ifndef FMT_STATIC_THOUSANDS_SEPARATOR
--#  include <locale>
-+#include "ostream.h"
-+#include "ranges.h"
-+
-+#ifndef FMT_MODULE
-+#  include <cwchar>
-+#  if FMT_USE_LOCALE
-+#    include <locale>
-+#  endif
- #endif
-=20
- FMT_BEGIN_NAMESPACE
-@@ -22,10 +26,26 @@ namespace detail {
- template <typename T>
- using is_exotic_char =3D bool_constant<!std::is_same<T, char>::value>;
-=20
--inline auto write_loc(std::back_insert_iterator<detail::buffer<wchar_t>=
> out,
--                      loc_value value, const format_specs<wchar_t>& spe=
cs,
--                      locale_ref loc) -> bool {
--#ifndef FMT_STATIC_THOUSANDS_SEPARATOR
-+template <typename S, typename =3D void> struct format_string_char {};
-+
-+template <typename S>
-+struct format_string_char<
-+    S, void_t<decltype(sizeof(detail::to_string_view(std::declval<S>())=
))>> {
-+  using type =3D char_t<S>;
-+};
-+
-+template <typename S>
-+struct format_string_char<
-+    S, enable_if_t<std::is_base_of<detail::compile_string, S>::value>> =
{
-+  using type =3D typename S::char_type;
-+};
-+
-+template <typename S>
-+using format_string_char_t =3D typename format_string_char<S>::type;
-+
-+inline auto write_loc(basic_appender<wchar_t> out, loc_value value,
-+                      const format_specs& specs, locale_ref loc) -> boo=
l {
-+#if FMT_USE_LOCALE
-   auto& numpunct =3D
-       std::use_facet<std::numpunct<wchar_t>>(loc.get<std::locale>());
-   auto separator =3D std::wstring();
-@@ -40,41 +60,79 @@ inline auto write_loc(std::back_insert_iterator<deta=
il::buffer<wchar_t>> out,
- FMT_BEGIN_EXPORT
-=20
- using wstring_view =3D basic_string_view<wchar_t>;
--using wformat_parse_context =3D basic_format_parse_context<wchar_t>;
--using wformat_context =3D buffer_context<wchar_t>;
-+using wformat_parse_context =3D parse_context<wchar_t>;
-+using wformat_context =3D buffered_context<wchar_t>;
- using wformat_args =3D basic_format_args<wformat_context>;
- using wmemory_buffer =3D basic_memory_buffer<wchar_t>;
-=20
--#if FMT_GCC_VERSION && FMT_GCC_VERSION < 409
--// Workaround broken conversion on older gcc.
--template <typename... Args> using wformat_string =3D wstring_view;
--inline auto runtime(wstring_view s) -> wstring_view { return s; }
--#else
--template <typename... Args>
--using wformat_string =3D basic_format_string<wchar_t, type_identity_t<A=
rgs>...>;
-+template <typename Char, typename... T> struct basic_fstring {
-+ private:
-+  basic_string_view<Char> str_;
-+
-+  static constexpr int num_static_named_args =3D
-+      detail::count_static_named_args<T...>();
-+
-+  using checker =3D detail::format_string_checker<
-+      Char, static_cast<int>(sizeof...(T)), num_static_named_args,
-+      num_static_named_args !=3D detail::count_named_args<T...>()>;
-+
-+  using arg_pack =3D detail::arg_pack<T...>;
-+
-+ public:
-+  using t =3D basic_fstring;
-+
-+  template <typename S,
-+            FMT_ENABLE_IF(
-+                std::is_convertible<const S&, basic_string_view<Char>>:=
:value)>
-+  FMT_CONSTEVAL FMT_ALWAYS_INLINE basic_fstring(const S& s) : str_(s) {
-+    if (FMT_USE_CONSTEVAL)
-+      detail::parse_format_string<Char>(s, checker(s, arg_pack()));
-+  }
-+  template <typename S,
-+            FMT_ENABLE_IF(std::is_base_of<detail::compile_string, S>::v=
alue&&
-+                              std::is_same<typename S::char_type, Char>=
::value)>
-+  FMT_ALWAYS_INLINE basic_fstring(const S&) : str_(S()) {
-+    FMT_CONSTEXPR auto sv =3D basic_string_view<Char>(S());
-+    FMT_CONSTEXPR int ignore =3D
-+        (parse_format_string(sv, checker(sv, arg_pack())), 0);
-+    detail::ignore_unused(ignore);
-+  }
-+  basic_fstring(runtime_format_string<Char> fmt) : str_(fmt.str) {}
-+
-+  operator basic_string_view<Char>() const { return str_; }
-+  auto get() const -> basic_string_view<Char> { return str_; }
-+};
-+
-+template <typename Char, typename... T>
-+using basic_format_string =3D basic_fstring<Char, T...>;
-+
-+template <typename... T>
-+using wformat_string =3D typename basic_format_string<wchar_t, T...>::t=
;
- inline auto runtime(wstring_view s) -> runtime_format_string<wchar_t> {
-   return {{s}};
- }
--#endif
-=20
- template <> struct is_char<wchar_t> : std::true_type {};
--template <> struct is_char<detail::char8_type> : std::true_type {};
- template <> struct is_char<char16_t> : std::true_type {};
- template <> struct is_char<char32_t> : std::true_type {};
-=20
-+#ifdef __cpp_char8_t
-+template <> struct is_char<char8_t> : bool_constant<detail::is_utf8_ena=
bled> {};
-+#endif
-+
- template <typename... T>
--constexpr format_arg_store<wformat_context, T...> make_wformat_args(
--    const T&... args) {
--  return {args...};
-+constexpr auto make_wformat_args(T&... args)
-+    -> decltype(fmt::make_format_args<wformat_context>(args...)) {
-+  return fmt::make_format_args<wformat_context>(args...);
- }
-=20
-+#if !FMT_USE_NONTYPE_TEMPLATE_ARGS
- inline namespace literals {
--#if FMT_USE_USER_DEFINED_LITERALS && !FMT_USE_NONTYPE_TEMPLATE_ARGS
--constexpr detail::udl_arg<wchar_t> operator"" _a(const wchar_t* s, size=
_t) {
-+inline auto operator""_a(const wchar_t* s, size_t) -> detail::udl_arg<w=
char_t> {
-   return {s};
- }
--#endif
- }  // namespace literals
-+#endif
-=20
- template <typename It, typename Sentinel>
- auto join(It begin, Sentinel end, wstring_view sep)
-@@ -82,9 +140,9 @@ auto join(It begin, Sentinel end, wstring_view sep)
-   return {begin, end, sep};
- }
-=20
--template <typename Range>
-+template <typename Range, FMT_ENABLE_IF(!is_tuple_like<Range>::value)>
- auto join(Range&& range, wstring_view sep)
--    -> join_view<detail::iterator_t<Range>, detail::sentinel_t<Range>,
-+    -> join_view<decltype(std::begin(range)), decltype(std::end(range))=
,
-                  wchar_t> {
-   return join(std::begin(range), std::end(range), sep);
- }
-@@ -95,13 +153,19 @@ auto join(std::initializer_list<T> list, wstring_vi=
ew sep)
-   return join(std::begin(list), std::end(list), sep);
- }
-=20
-+template <typename Tuple, FMT_ENABLE_IF(is_tuple_like<Tuple>::value)>
-+auto join(const Tuple& tuple, basic_string_view<wchar_t> sep)
-+    -> tuple_join_view<wchar_t, Tuple> {
-+  return {tuple, sep};
-+}
-+
- template <typename Char, FMT_ENABLE_IF(!std::is_same<Char, char>::value=
)>
--auto vformat(basic_string_view<Char> format_str,
--             basic_format_args<buffer_context<type_identity_t<Char>>> a=
rgs)
-+auto vformat(basic_string_view<Char> fmt,
-+             typename detail::vformat_args<Char>::type args)
-     -> std::basic_string<Char> {
-   auto buf =3D basic_memory_buffer<Char>();
--  detail::vformat_to(buf, format_str, args);
--  return to_string(buf);
-+  detail::vformat_to(buf, fmt, args);
-+  return {buf.data(), buf.size()};
- }
-=20
- template <typename... T>
-@@ -109,110 +173,122 @@ auto format(wformat_string<T...> fmt, T&&... arg=
s) -> std::wstring {
-   return vformat(fmt::wstring_view(fmt), fmt::make_wformat_args(args...=
));
- }
-=20
-+template <typename OutputIt, typename... T>
-+auto format_to(OutputIt out, wformat_string<T...> fmt, T&&... args)
-+    -> OutputIt {
-+  return vformat_to(out, fmt::wstring_view(fmt),
-+                    fmt::make_wformat_args(args...));
-+}
-+
- // Pass char_t as a default template parameter instead of using
- // std::basic_string<char_t<S>> to reduce the symbol size.
--template <typename S, typename... T, typename Char =3D char_t<S>,
-+template <typename S, typename... T,
-+          typename Char =3D detail::format_string_char_t<S>,
-           FMT_ENABLE_IF(!std::is_same<Char, char>::value &&
-                         !std::is_same<Char, wchar_t>::value)>
--auto format(const S& format_str, T&&... args) -> std::basic_string<Char=
> {
--  return vformat(detail::to_string_view(format_str),
--                 fmt::make_format_args<buffer_context<Char>>(args...));
-+auto format(const S& fmt, T&&... args) -> std::basic_string<Char> {
-+  return vformat(detail::to_string_view(fmt),
-+                 fmt::make_format_args<buffered_context<Char>>(args...)=
);
- }
-=20
--template <typename Locale, typename S, typename Char =3D char_t<S>,
-+template <typename Locale, typename S,
-+          typename Char =3D detail::format_string_char_t<S>,
-           FMT_ENABLE_IF(detail::is_locale<Locale>::value&&
-                             detail::is_exotic_char<Char>::value)>
--inline auto vformat(
--    const Locale& loc, const S& format_str,
--    basic_format_args<buffer_context<type_identity_t<Char>>> args)
-+inline auto vformat(const Locale& loc, const S& fmt,
-+                    typename detail::vformat_args<Char>::type args)
-     -> std::basic_string<Char> {
--  return detail::vformat(loc, detail::to_string_view(format_str), args)=
;
-+  auto buf =3D basic_memory_buffer<Char>();
-+  detail::vformat_to(buf, detail::to_string_view(fmt), args,
-+                     detail::locale_ref(loc));
-+  return {buf.data(), buf.size()};
- }
-=20
--template <typename Locale, typename S, typename... T, typename Char =3D=
 char_t<S>,
-+template <typename Locale, typename S, typename... T,
-+          typename Char =3D detail::format_string_char_t<S>,
-           FMT_ENABLE_IF(detail::is_locale<Locale>::value&&
-                             detail::is_exotic_char<Char>::value)>
--inline auto format(const Locale& loc, const S& format_str, T&&... args)
-+inline auto format(const Locale& loc, const S& fmt, T&&... args)
-     -> std::basic_string<Char> {
--  return detail::vformat(loc, detail::to_string_view(format_str),
--                         fmt::make_format_args<buffer_context<Char>>(ar=
gs...));
-+  return vformat(loc, detail::to_string_view(fmt),
-+                 fmt::make_format_args<buffered_context<Char>>(args...)=
);
- }
-=20
--template <typename OutputIt, typename S, typename Char =3D char_t<S>,
-+template <typename OutputIt, typename S,
-+          typename Char =3D detail::format_string_char_t<S>,
-           FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, Char>::val=
ue&&
-                             detail::is_exotic_char<Char>::value)>
--auto vformat_to(OutputIt out, const S& format_str,
--                basic_format_args<buffer_context<type_identity_t<Char>>=
> args)
--    -> OutputIt {
-+auto vformat_to(OutputIt out, const S& fmt,
-+                typename detail::vformat_args<Char>::type args) -> Outp=
utIt {
-   auto&& buf =3D detail::get_buffer<Char>(out);
--  detail::vformat_to(buf, detail::to_string_view(format_str), args);
-+  detail::vformat_to(buf, detail::to_string_view(fmt), args);
-   return detail::get_iterator(buf, out);
- }
-=20
- template <typename OutputIt, typename S, typename... T,
--          typename Char =3D char_t<S>,
--          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, Char>::val=
ue&&
--                            detail::is_exotic_char<Char>::value)>
-+          typename Char =3D detail::format_string_char_t<S>,
-+          FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, Char>::val=
ue &&
-+                        !std::is_same<Char, char>::value &&
-+                        !std::is_same<Char, wchar_t>::value)>
- inline auto format_to(OutputIt out, const S& fmt, T&&... args) -> Outpu=
tIt {
-   return vformat_to(out, detail::to_string_view(fmt),
--                    fmt::make_format_args<buffer_context<Char>>(args...=
));
-+                    fmt::make_format_args<buffered_context<Char>>(args.=
..));
- }
-=20
- template <typename Locale, typename S, typename OutputIt, typename... A=
rgs,
--          typename Char =3D char_t<S>,
-+          typename Char =3D detail::format_string_char_t<S>,
-           FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, Char>::val=
ue&&
-                             detail::is_locale<Locale>::value&&
-                                 detail::is_exotic_char<Char>::value)>
--inline auto vformat_to(
--    OutputIt out, const Locale& loc, const S& format_str,
--    basic_format_args<buffer_context<type_identity_t<Char>>> args) -> O=
utputIt {
-+inline auto vformat_to(OutputIt out, const Locale& loc, const S& fmt,
-+                       typename detail::vformat_args<Char>::type args)
-+    -> OutputIt {
-   auto&& buf =3D detail::get_buffer<Char>(out);
--  vformat_to(buf, detail::to_string_view(format_str), args,
--             detail::locale_ref(loc));
-+  vformat_to(buf, detail::to_string_view(fmt), args, detail::locale_ref=
(loc));
-   return detail::get_iterator(buf, out);
- }
-=20
--template <
--    typename OutputIt, typename Locale, typename S, typename... T,
--    typename Char =3D char_t<S>,
--    bool enable =3D detail::is_output_iterator<OutputIt, Char>::value&&
--        detail::is_locale<Locale>::value&& detail::is_exotic_char<Char>=
::value>
--inline auto format_to(OutputIt out, const Locale& loc, const S& format_=
str,
-+template <typename Locale, typename OutputIt, typename S, typename... T=
,
-+          typename Char =3D detail::format_string_char_t<S>,
-+          bool enable =3D detail::is_output_iterator<OutputIt, Char>::v=
alue &&
-+                        detail::is_locale<Locale>::value &&
-+                        detail::is_exotic_char<Char>::value>
-+inline auto format_to(OutputIt out, const Locale& loc, const S& fmt,
-                       T&&... args) ->
-     typename std::enable_if<enable, OutputIt>::type {
--  return vformat_to(out, loc, detail::to_string_view(format_str),
--                    fmt::make_format_args<buffer_context<Char>>(args...=
));
-+  return vformat_to(out, loc, detail::to_string_view(fmt),
-+                    fmt::make_format_args<buffered_context<Char>>(args.=
..));
- }
-=20
- template <typename OutputIt, typename Char, typename... Args,
-           FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, Char>::val=
ue&&
-                             detail::is_exotic_char<Char>::value)>
--inline auto vformat_to_n(
--    OutputIt out, size_t n, basic_string_view<Char> format_str,
--    basic_format_args<buffer_context<type_identity_t<Char>>> args)
-+inline auto vformat_to_n(OutputIt out, size_t n, basic_string_view<Char=
> fmt,
-+                         typename detail::vformat_args<Char>::type args=
)
-     -> format_to_n_result<OutputIt> {
-   using traits =3D detail::fixed_buffer_traits;
-   auto buf =3D detail::iterator_buffer<OutputIt, Char, traits>(out, n);
--  detail::vformat_to(buf, format_str, args);
-+  detail::vformat_to(buf, fmt, args);
-   return {buf.out(), buf.count()};
- }
-=20
- template <typename OutputIt, typename S, typename... T,
--          typename Char =3D char_t<S>,
-+          typename Char =3D detail::format_string_char_t<S>,
-           FMT_ENABLE_IF(detail::is_output_iterator<OutputIt, Char>::val=
ue&&
-                             detail::is_exotic_char<Char>::value)>
- inline auto format_to_n(OutputIt out, size_t n, const S& fmt, T&&... ar=
gs)
-     -> format_to_n_result<OutputIt> {
--  return vformat_to_n(out, n, detail::to_string_view(fmt),
--                      fmt::make_format_args<buffer_context<Char>>(args.=
..));
-+  return vformat_to_n(out, n, fmt::basic_string_view<Char>(fmt),
-+                      fmt::make_format_args<buffered_context<Char>>(arg=
s...));
- }
-=20
--template <typename S, typename... T, typename Char =3D char_t<S>,
-+template <typename S, typename... T,
-+          typename Char =3D detail::format_string_char_t<S>,
-           FMT_ENABLE_IF(detail::is_exotic_char<Char>::value)>
- inline auto formatted_size(const S& fmt, T&&... args) -> size_t {
-   auto buf =3D detail::counting_buffer<Char>();
-   detail::vformat_to(buf, detail::to_string_view(fmt),
--                     fmt::make_format_args<buffer_context<Char>>(args..=
.));
-+                     fmt::make_format_args<buffered_context<Char>>(args=
...));
-   return buf.count();
- }
-=20
-@@ -246,9 +322,48 @@ template <typename... T> void println(wformat_strin=
g<T...> fmt, T&&... args) {
-   return print(L"{}\n", fmt::format(fmt, std::forward<T>(args)...));
- }
-=20
--/**
--  Converts *value* to ``std::wstring`` using the default format for typ=
e *T*.
-- */
-+inline auto vformat(text_style ts, wstring_view fmt, wformat_args args)
-+    -> std::wstring {
-+  auto buf =3D wmemory_buffer();
-+  detail::vformat_to(buf, ts, fmt, args);
-+  return {buf.data(), buf.size()};
-+}
-+
-+template <typename... T>
-+inline auto format(text_style ts, wformat_string<T...> fmt, T&&... args=
)
-+    -> std::wstring {
-+  return fmt::vformat(ts, fmt, fmt::make_wformat_args(args...));
-+}
-+
-+template <typename... T>
-+FMT_DEPRECATED void print(std::FILE* f, text_style ts, wformat_string<T=
...> fmt,
-+                          const T&... args) {
-+  vprint(f, ts, fmt, fmt::make_wformat_args(args...));
-+}
-+
-+template <typename... T>
-+FMT_DEPRECATED void print(text_style ts, wformat_string<T...> fmt,
-+                          const T&... args) {
-+  return print(stdout, ts, fmt, args...);
-+}
-+
-+inline void vprint(std::wostream& os, wstring_view fmt, wformat_args ar=
gs) {
-+  auto buffer =3D basic_memory_buffer<wchar_t>();
-+  detail::vformat_to(buffer, fmt, args);
-+  detail::write_buffer(os, buffer);
-+}
-+
-+template <typename... T>
-+void print(std::wostream& os, wformat_string<T...> fmt, T&&... args) {
-+  vprint(os, fmt, fmt::make_format_args<buffered_context<wchar_t>>(args=
...));
-+}
-+
-+template <typename... T>
-+void println(std::wostream& os, wformat_string<T...> fmt, T&&... args) =
{
-+  print(os, L"{}\n", fmt::format(fmt, std::forward<T>(args)...));
-+}
-+
-+/// Converts `value` to `std::wstring` using the default format for typ=
e `T`.
- template <typename T> inline auto to_wstring(const T& value) -> std::ws=
tring {
-   return format(FMT_STRING(L"{}"), value);
- }
diff --git a/meta-oe/recipes-support/btop/btop_1.4.0.bb b/meta-oe/recipes=
-support/btop/btop_1.4.2.bb
similarity index 86%
rename from meta-oe/recipes-support/btop/btop_1.4.0.bb
rename to meta-oe/recipes-support/btop/btop_1.4.2.bb
index 8afda1c5d3..6fa76ac8ad 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.0.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.2.bb
@@ -5,9 +5,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
 SECTION =3D "console/utils"
=20
 SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bra=
nch=3Dmain \
-           file://0001-fmt-Update-headers-from-11.1.4.patch \
            "
-SRCREV =3D "6c0cedd8912785f0f353af389e72a0ffc69984a2"
+SRCREV =3D "274d0c78e5f18514dfbea23cee9d1c5431eb75e0"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.49.0


