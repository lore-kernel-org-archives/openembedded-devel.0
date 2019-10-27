Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 27 Oct 2019 05:56:14 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
	[66.111.4.229])
	by mail.openembedded.org (Postfix) with ESMTP id B3EBC7F696
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 05:56:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 93CC55B71
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 01:48:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sun, 27 Oct 2019 01:48:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pth/llqbolV2rhfAR
	28x5PjmlGXleY6fAeQe5k90CpQ=; b=ZfEySpoNmY8a1tNrJtTqUKrezAdvb6ZJ+
	47/q991TSbwUB0WBFPBrMDUCfoIIEnSCmtus4tnnMj9wLsq95AXoEqAIvRdibUyr
	g6Yrq3WaVEMg6J5ED9qgtHSPvXPtNgTRlJT2au/ekpZZNfKAArr9909/8Gf4YffO
	4A/LFgbwTI7YOZdG1Sq/M3X6euu5+OlvzZKIb9+qnBC/F2JWL451KyYJ2MvUsgAQ
	4UW5vJtPyMLTFYsI8R4JW9vCpfxfvzQpoVua8IpVIv2InwwLNv1289RJ5PIhGhBm
	1nskmsX622m9uNLL9ML436YPn7VVBMxlsL93e8Zg3vrAkc4E75uYA==
X-ME-Sender: <xms:ty-1XaKlmQRLxyoAbQdgxmsO_jewrI7oC_ndvsSaLQ-hivMAqaY4xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrleeigdellecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecuogfrhhhishhhihhnghdqkfhppfgvthifohhrkhculd
	eftddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepvfgr
	nhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpe
	hfrhgvvgguvghskhhtohhprdhorhhgpdhsthgrtghkohhvvghrfhhlohifrdgtohhmpdhh
	phdrtghomhdpghhnuhdrohhrghenucfkphepudeliedrvdeggedrudeluddruddtnecurf
	grrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenucevlhhushhtvghr
	ufhiiigvpedt
X-ME-Proxy: <xmx:ty-1Xd-Z5EHMVFSbS7LtdzpYKsQQ7KKcyQ1s3ByzL9JeHi7dOXyz_Q>
	<xmx:ty-1XQMcrouhuqKX1CH7JwyZdSUhNk1ov9FsPhsZnb7QHqEaBKWbeQ>
	<xmx:ty-1XR27DMlgdO8gwWXhfM9SfgXHePnUxDeK2p8nnbvVBzff_wfIzw>
	<xmx:ty-1XeWS64uqqbtI4yWuX4RfHPlxNUOruSZJO-mB6COMWY4CsJ7EbA>
Received: from localhost.localdomain (unknown [196.244.191.10])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9073080059
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 01:48:38 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Oct 2019 07:48:20 +0200
Message-Id: <20191027054820.13233-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pavucontrol: polish the recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Oct 2019 05:56:14 -0000
Content-Transfer-Encoding: 8bit

Removed an unused patch file:
0002-build-sys-Add-m4-file-for-AX_CXX_COMPILE_STDCXX_11.patch

I believe gtk+3-native was added to DEPENDS to get glib-gettextize,
which is actually provided by glib-2.0-native.

Pavucontrol is not a part of GNOME, it just uses GTK, so it seems
slightly wrong to inherit gnomebase. The only thing we need from
gnomebase is the autotools inherit, which we can do directly. The
gnomebase class automatically set the SECTION to "x11/gnome", but I
think "x11/multimedia" is better.

Added HOMEPAGE.

Fixed LICENSE. Pavucontrol allows choosing later GPL versions as well.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...m4-file-for-AX_CXX_COMPILE_STDCXX_11.patch | 624 ------------------
 .../pulseaudio/pavucontrol_4.0.bb             |  12 +-
 2 files changed, 9 insertions(+), 627 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0002-build-sys-Add-m4-file-for-AX_CXX_COMPILE_STDCXX_11.patch

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0002-build-sys-Add-m4-file-for-AX_CXX_COMPILE_STDCXX_11.patch b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0002-build-sys-Add-m4-file-for-AX_CXX_COMPILE_STDCXX_11.patch
deleted file mode 100644
index 97ec37d4c9..0000000000
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol/0002-build-sys-Add-m4-file-for-AX_CXX_COMPILE_STDCXX_11.patch
+++ /dev/null
@@ -1,624 +0,0 @@
-From ccb3eb7b4ff65414a56e2294080885b8966da52b Mon Sep 17 00:00:00 2001
-From: Arun Raghavan <git@arunraghavan.net>
-Date: Tue, 2 Feb 2016 17:01:47 +0530
-Subject: [PATCH 2/2] build-sys: Add m4 file for AX_CXX_COMPILE_STDCXX_11
-
----
- m4/ax_cxx_compile_stdcxx.m4    | 558 +++++++++++++++++++++++++++++++++++++++++
- m4/ax_cxx_compile_stdcxx_11.m4 |  39 +++
- 2 files changed, 597 insertions(+)
- create mode 100644 m4/ax_cxx_compile_stdcxx.m4
- create mode 100644 m4/ax_cxx_compile_stdcxx_11.m4
-
-diff --git a/m4/ax_cxx_compile_stdcxx.m4 b/m4/ax_cxx_compile_stdcxx.m4
-new file mode 100644
-index 0000000..079e17d
---- /dev/null
-+++ b/m4/ax_cxx_compile_stdcxx.m4
-@@ -0,0 +1,558 @@
-+# ===========================================================================
-+#   http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx.html
-+# ===========================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_CXX_COMPILE_STDCXX(VERSION, [ext|noext], [mandatory|optional])
-+#
-+# DESCRIPTION
-+#
-+#   Check for baseline language coverage in the compiler for the specified
-+#   version of the C++ standard.  If necessary, add switches to CXXFLAGS to
-+#   enable support.  VERSION may be '11' (for the C++11 standard) or '14'
-+#   (for the C++14 standard).
-+#
-+#   The second argument, if specified, indicates whether you insist on an
-+#   extended mode (e.g. -std=gnu++11) or a strict conformance mode (e.g.
-+#   -std=c++11).  If neither is specified, you get whatever works, with
-+#   preference for an extended mode.
-+#
-+#   The third argument, if specified 'mandatory' or if left unspecified,
-+#   indicates that baseline support for the specified C++ standard is
-+#   required and that the macro should error out if no mode with that
-+#   support is found.  If specified 'optional', then configuration proceeds
-+#   regardless, after defining HAVE_CXX${VERSION} if and only if a
-+#   supporting mode is found.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
-+#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
-+#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
-+#   Copyright (c) 2014, 2015 Google Inc.; contributed by Alexey Sokolov <sokolov@google.com>
-+#   Copyright (c) 2015 Paul Norman <penorman@mac.com>
-+#   Copyright (c) 2015 Moritz Klammler <moritz@klammler.eu>
-+#
-+#   Copying and distribution of this file, with or without modification, are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved.  This file is offered as-is, without any
-+#   warranty.
-+
-+#serial 1
-+
-+dnl  This macro is based on the code from the AX_CXX_COMPILE_STDCXX_11 macro
-+dnl  (serial version number 13).
-+
-+AC_DEFUN([AX_CXX_COMPILE_STDCXX], [dnl
-+  m4_if([$1], [11], [],
-+        [$1], [14], [],
-+        [$1], [17], [m4_fatal([support for C++17 not yet implemented in AX_CXX_COMPILE_STDCXX])],
-+        [m4_fatal([invalid first argument `$1' to AX_CXX_COMPILE_STDCXX])])dnl
-+  m4_if([$2], [], [],
-+        [$2], [ext], [],
-+        [$2], [noext], [],
-+        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX])])dnl
-+  m4_if([$3], [], [ax_cxx_compile_cxx$1_required=true],
-+        [$3], [mandatory], [ax_cxx_compile_cxx$1_required=true],
-+        [$3], [optional], [ax_cxx_compile_cxx$1_required=false],
-+        [m4_fatal([invalid third argument `$3' to AX_CXX_COMPILE_STDCXX])])
-+  AC_LANG_PUSH([C++])dnl
-+  ac_success=no
-+  AC_CACHE_CHECK(whether $CXX supports C++$1 features by default,
-+  ax_cv_cxx_compile_cxx$1,
-+  [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_testbody_$1])],
-+    [ax_cv_cxx_compile_cxx$1=yes],
-+    [ax_cv_cxx_compile_cxx$1=no])])
-+  if test x$ax_cv_cxx_compile_cxx$1 = xyes; then
-+    ac_success=yes
-+  fi
-+
-+  m4_if([$2], [noext], [], [dnl
-+  if test x$ac_success = xno; then
-+    for switch in -std=gnu++$1 -std=gnu++0x; do
-+      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx$1_$switch])
-+      AC_CACHE_CHECK(whether $CXX supports C++$1 features with $switch,
-+                     $cachevar,
-+        [ac_save_CXXFLAGS="$CXXFLAGS"
-+         CXXFLAGS="$CXXFLAGS $switch"
-+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_testbody_$1])],
-+          [eval $cachevar=yes],
-+          [eval $cachevar=no])
-+         CXXFLAGS="$ac_save_CXXFLAGS"])
-+      if eval test x\$$cachevar = xyes; then
-+        CXXFLAGS="$CXXFLAGS $switch"
-+        ac_success=yes
-+        break
-+      fi
-+    done
-+  fi])
-+
-+  m4_if([$2], [ext], [], [dnl
-+  if test x$ac_success = xno; then
-+    dnl HP's aCC needs +std=c++11 according to:
-+    dnl http://h21007.www2.hp.com/portal/download/files/unprot/aCxx/PDF_Release_Notes/769149-001.pdf
-+    dnl Cray's crayCC needs "-h std=c++11"
-+    for switch in -std=c++$1 -std=c++0x +std=c++$1 "-h std=c++$1"; do
-+      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx$1_$switch])
-+      AC_CACHE_CHECK(whether $CXX supports C++$1 features with $switch,
-+                     $cachevar,
-+        [ac_save_CXXFLAGS="$CXXFLAGS"
-+         CXXFLAGS="$CXXFLAGS $switch"
-+         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_testbody_$1])],
-+          [eval $cachevar=yes],
-+          [eval $cachevar=no])
-+         CXXFLAGS="$ac_save_CXXFLAGS"])
-+      if eval test x\$$cachevar = xyes; then
-+        CXXFLAGS="$CXXFLAGS $switch"
-+        ac_success=yes
-+        break
-+      fi
-+    done
-+  fi])
-+  AC_LANG_POP([C++])
-+  if test x$ax_cxx_compile_cxx$1_required = xtrue; then
-+    if test x$ac_success = xno; then
-+      AC_MSG_ERROR([*** A compiler with support for C++$1 language features is required.])
-+    fi
-+  else
-+    if test x$ac_success = xno; then
-+      HAVE_CXX$1=0
-+      AC_MSG_NOTICE([No compiler with C++$1 support was found])
-+    else
-+      HAVE_CXX$1=1
-+      AC_DEFINE(HAVE_CXX$1,1,
-+                [define if the compiler supports basic C++$1 syntax])
-+    fi
-+
-+    AC_SUBST(HAVE_CXX$1)
-+  fi
-+])
-+
-+
-+dnl  Test body for checking C++11 support
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_11],
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
-+)
-+
-+
-+dnl  Test body for checking C++14 support
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_14],
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_11
-+  _AX_CXX_COMPILE_STDCXX_testbody_new_in_14
-+)
-+
-+
-+dnl  Tests for new features in C++11
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_new_in_11], [[
-+
-+// If the compiler admits that it is not ready for C++11, why torture it?
-+// Hopefully, this will speed up the test.
-+
-+#ifndef __cplusplus
-+
-+#error "This is not a C++ compiler"
-+
-+#elif __cplusplus < 201103L
-+
-+#error "This is not a C++11 compiler"
-+
-+#else
-+
-+namespace cxx11
-+{
-+
-+  namespace test_static_assert
-+  {
-+
-+    template <typename T>
-+    struct check
-+    {
-+      static_assert(sizeof(int) <= sizeof(T), "not big enough");
-+    };
-+
-+  }
-+
-+  namespace test_final_override
-+  {
-+
-+    struct Base
-+    {
-+      virtual void f() {}
-+    };
-+
-+    struct Derived : public Base
-+    {
-+      virtual void f() override {}
-+    };
-+
-+  }
-+
-+  namespace test_double_right_angle_brackets
-+  {
-+
-+    template < typename T >
-+    struct check {};
-+
-+    typedef check<void> single_type;
-+    typedef check<check<void>> double_type;
-+    typedef check<check<check<void>>> triple_type;
-+    typedef check<check<check<check<void>>>> quadruple_type;
-+
-+  }
-+
-+  namespace test_decltype
-+  {
-+
-+    int
-+    f()
-+    {
-+      int a = 1;
-+      decltype(a) b = 2;
-+      return a + b;
-+    }
-+
-+  }
-+
-+  namespace test_type_deduction
-+  {
-+
-+    template < typename T1, typename T2 >
-+    struct is_same
-+    {
-+      static const bool value = false;
-+    };
-+
-+    template < typename T >
-+    struct is_same<T, T>
-+    {
-+      static const bool value = true;
-+    };
-+
-+    template < typename T1, typename T2 >
-+    auto
-+    add(T1 a1, T2 a2) -> decltype(a1 + a2)
-+    {
-+      return a1 + a2;
-+    }
-+
-+    int
-+    test(const int c, volatile int v)
-+    {
-+      static_assert(is_same<int, decltype(0)>::value == true, "");
-+      static_assert(is_same<int, decltype(c)>::value == false, "");
-+      static_assert(is_same<int, decltype(v)>::value == false, "");
-+      auto ac = c;
-+      auto av = v;
-+      auto sumi = ac + av + 'x';
-+      auto sumf = ac + av + 1.0;
-+      static_assert(is_same<int, decltype(ac)>::value == true, "");
-+      static_assert(is_same<int, decltype(av)>::value == true, "");
-+      static_assert(is_same<int, decltype(sumi)>::value == true, "");
-+      static_assert(is_same<int, decltype(sumf)>::value == false, "");
-+      static_assert(is_same<int, decltype(add(c, v))>::value == true, "");
-+      return (sumf > 0.0) ? sumi : add(c, v);
-+    }
-+
-+  }
-+
-+  namespace test_noexcept
-+  {
-+
-+    int f() { return 0; }
-+    int g() noexcept { return 0; }
-+
-+    static_assert(noexcept(f()) == false, "");
-+    static_assert(noexcept(g()) == true, "");
-+
-+  }
-+
-+  namespace test_constexpr
-+  {
-+
-+    template < typename CharT >
-+    unsigned long constexpr
-+    strlen_c_r(const CharT *const s, const unsigned long acc) noexcept
-+    {
-+      return *s ? strlen_c_r(s + 1, acc + 1) : acc;
-+    }
-+
-+    template < typename CharT >
-+    unsigned long constexpr
-+    strlen_c(const CharT *const s) noexcept
-+    {
-+      return strlen_c_r(s, 0UL);
-+    }
-+
-+    static_assert(strlen_c("") == 0UL, "");
-+    static_assert(strlen_c("1") == 1UL, "");
-+    static_assert(strlen_c("example") == 7UL, "");
-+    static_assert(strlen_c("another\0example") == 7UL, "");
-+
-+  }
-+
-+  namespace test_rvalue_references
-+  {
-+
-+    template < int N >
-+    struct answer
-+    {
-+      static constexpr int value = N;
-+    };
-+
-+    answer<1> f(int&)       { return answer<1>(); }
-+    answer<2> f(const int&) { return answer<2>(); }
-+    answer<3> f(int&&)      { return answer<3>(); }
-+
-+    void
-+    test()
-+    {
-+      int i = 0;
-+      const int c = 0;
-+      static_assert(decltype(f(i))::value == 1, "");
-+      static_assert(decltype(f(c))::value == 2, "");
-+      static_assert(decltype(f(0))::value == 3, "");
-+    }
-+
-+  }
-+
-+  namespace test_uniform_initialization
-+  {
-+
-+    struct test
-+    {
-+      static const int zero {};
-+      static const int one {1};
-+    };
-+
-+    static_assert(test::zero == 0, "");
-+    static_assert(test::one == 1, "");
-+
-+  }
-+
-+  namespace test_lambdas
-+  {
-+
-+    void
-+    test1()
-+    {
-+      auto lambda1 = [](){};
-+      auto lambda2 = lambda1;
-+      lambda1();
-+      lambda2();
-+    }
-+
-+    int
-+    test2()
-+    {
-+      auto a = [](int i, int j){ return i + j; }(1, 2);
-+      auto b = []() -> int { return '0'; }();
-+      auto c = [=](){ return a + b; }();
-+      auto d = [&](){ return c; }();
-+      auto e = [a, &b](int x) mutable {
-+        const auto identity = [](int y){ return y; };
-+        for (auto i = 0; i < a; ++i)
-+          a += b--;
-+        return x + identity(a + b);
-+      }(0);
-+      return a + b + c + d + e;
-+    }
-+
-+    int
-+    test3()
-+    {
-+      const auto nullary = [](){ return 0; };
-+      const auto unary = [](int x){ return x; };
-+      using nullary_t = decltype(nullary);
-+      using unary_t = decltype(unary);
-+      const auto higher1st = [](nullary_t f){ return f(); };
-+      const auto higher2nd = [unary](nullary_t f1){
-+        return [unary, f1](unary_t f2){ return f2(unary(f1())); };
-+      };
-+      return higher1st(nullary) + higher2nd(nullary)(unary);
-+    }
-+
-+  }
-+
-+  namespace test_variadic_templates
-+  {
-+
-+    template <int...>
-+    struct sum;
-+
-+    template <int N0, int... N1toN>
-+    struct sum<N0, N1toN...>
-+    {
-+      static constexpr auto value = N0 + sum<N1toN...>::value;
-+    };
-+
-+    template <>
-+    struct sum<>
-+    {
-+      static constexpr auto value = 0;
-+    };
-+
-+    static_assert(sum<>::value == 0, "");
-+    static_assert(sum<1>::value == 1, "");
-+    static_assert(sum<23>::value == 23, "");
-+    static_assert(sum<1, 2>::value == 3, "");
-+    static_assert(sum<5, 5, 11>::value == 21, "");
-+    static_assert(sum<2, 3, 5, 7, 11, 13>::value == 41, "");
-+
-+  }
-+
-+  // http://stackoverflow.com/questions/13728184/template-aliases-and-sfinae
-+  // Clang 3.1 fails with headers of libstd++ 4.8.3 when using std::function
-+  // because of this.
-+  namespace test_template_alias_sfinae
-+  {
-+
-+    struct foo {};
-+
-+    template<typename T>
-+    using member = typename T::member_type;
-+
-+    template<typename T>
-+    void func(...) {}
-+
-+    template<typename T>
-+    void func(member<T>*) {}
-+
-+    void test();
-+
-+    void test() { func<foo>(0); }
-+
-+  }
-+
-+}  // namespace cxx11
-+
-+#endif  // __cplusplus >= 201103L
-+
-+]])
-+
-+
-+dnl  Tests for new features in C++14
-+
-+m4_define([_AX_CXX_COMPILE_STDCXX_testbody_new_in_14], [[
-+
-+// If the compiler admits that it is not ready for C++14, why torture it?
-+// Hopefully, this will speed up the test.
-+
-+#ifndef __cplusplus
-+
-+#error "This is not a C++ compiler"
-+
-+#elif __cplusplus < 201402L
-+
-+#error "This is not a C++14 compiler"
-+
-+#else
-+
-+namespace cxx14
-+{
-+
-+  namespace test_polymorphic_lambdas
-+  {
-+
-+    int
-+    test()
-+    {
-+      const auto lambda = [](auto&&... args){
-+        const auto istiny = [](auto x){
-+          return (sizeof(x) == 1UL) ? 1 : 0;
-+        };
-+        const int aretiny[] = { istiny(args)... };
-+        return aretiny[0];
-+      };
-+      return lambda(1, 1L, 1.0f, '1');
-+    }
-+
-+  }
-+
-+  namespace test_binary_literals
-+  {
-+
-+    constexpr auto ivii = 0b0000000000101010;
-+    static_assert(ivii == 42, "wrong value");
-+
-+  }
-+
-+  namespace test_generalized_constexpr
-+  {
-+
-+    template < typename CharT >
-+    constexpr unsigned long
-+    strlen_c(const CharT *const s) noexcept
-+    {
-+      auto length = 0UL;
-+      for (auto p = s; *p; ++p)
-+        ++length;
-+      return length;
-+    }
-+
-+    static_assert(strlen_c("") == 0UL, "");
-+    static_assert(strlen_c("x") == 1UL, "");
-+    static_assert(strlen_c("test") == 4UL, "");
-+    static_assert(strlen_c("another\0test") == 7UL, "");
-+
-+  }
-+
-+  namespace test_lambda_init_capture
-+  {
-+
-+    int
-+    test()
-+    {
-+      auto x = 0;
-+      const auto lambda1 = [a = x](int b){ return a + b; };
-+      const auto lambda2 = [a = lambda1(x)](){ return a; };
-+      return lambda2();
-+    }
-+
-+  }
-+
-+  namespace test_digit_seperators
-+  {
-+
-+    constexpr auto ten_million = 100'000'000;
-+    static_assert(ten_million == 100000000, "");
-+
-+  }
-+
-+  namespace test_return_type_deduction
-+  {
-+
-+    auto f(int& x) { return x; }
-+    decltype(auto) g(int& x) { return x; }
-+
-+    template < typename T1, typename T2 >
-+    struct is_same
-+    {
-+      static constexpr auto value = false;
-+    };
-+
-+    template < typename T >
-+    struct is_same<T, T>
-+    {
-+      static constexpr auto value = true;
-+    };
-+
-+    int
-+    test()
-+    {
-+      auto x = 0;
-+      static_assert(is_same<int, decltype(f(x))>::value, "");
-+      static_assert(is_same<int&, decltype(g(x))>::value, "");
-+      return x;
-+    }
-+
-+  }
-+
-+}  // namespace cxx14
-+
-+#endif  // __cplusplus >= 201402L
-+
-+]])
-diff --git a/m4/ax_cxx_compile_stdcxx_11.m4 b/m4/ax_cxx_compile_stdcxx_11.m4
-new file mode 100644
-index 0000000..09db383
---- /dev/null
-+++ b/m4/ax_cxx_compile_stdcxx_11.m4
-@@ -0,0 +1,39 @@
-+# ============================================================================
-+#  http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_11.html
-+# ============================================================================
-+#
-+# SYNOPSIS
-+#
-+#   AX_CXX_COMPILE_STDCXX_11([ext|noext], [mandatory|optional])
-+#
-+# DESCRIPTION
-+#
-+#   Check for baseline language coverage in the compiler for the C++11
-+#   standard; if necessary, add switches to CXXFLAGS to enable support.
-+#
-+#   This macro is a convenience alias for calling the AX_CXX_COMPILE_STDCXX
-+#   macro with the version set to C++11.  The two optional arguments are
-+#   forwarded literally as the second and third argument respectively.
-+#   Please see the documentation for the AX_CXX_COMPILE_STDCXX macro for
-+#   more information.  If you want to use this macro, you also need to
-+#   download the ax_cxx_compile_stdcxx.m4 file.
-+#
-+# LICENSE
-+#
-+#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
-+#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
-+#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
-+#   Copyright (c) 2014, 2015 Google Inc.; contributed by Alexey Sokolov <sokolov@google.com>
-+#   Copyright (c) 2015 Paul Norman <penorman@mac.com>
-+#   Copyright (c) 2015 Moritz Klammler <moritz@klammler.eu>
-+#
-+#   Copying and distribution of this file, with or without modification, are
-+#   permitted in any medium without royalty provided the copyright notice
-+#   and this notice are preserved. This file is offered as-is, without any
-+#   warranty.
-+
-+#serial 14
-+
-+include([ax_cxx_compile_stdcxx.m4])
-+
-+AC_DEFUN([AX_CXX_COMPILE_STDCXX_11], [AX_CXX_COMPILE_STDCXX([11], [$1], [$2])])
--- 
-2.12.1
-
diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
index 421ea9d5c6..3588ce7233 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
@@ -1,10 +1,16 @@
 DESCRIPTION = "PulseAudio Volume Control (pavucontrol) is a simple GTK based volume control tool ("mixer") for the PulseAudio sound server."
-LICENSE = "GPLv2"
+HOMEPAGE = "https://freedesktop.org/software/pulseaudio/pavucontrol/"
+SECTION = "x11/multimedia"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "intltool-native gtk+3-native gtkmm3 libcanberra pulseaudio"
+# glib-2.0-native is required for glib-gettextize, which is used by the
+# AM_GLIB_GNU_GETTEXT macro in configure.ac. That macro is deprecated, so the
+# glib-2.0-native dependency may go away at some point (something to keep in
+# mind when doing version upgrades).
+DEPENDS = "intltool-native glib-2.0-native gtkmm3 libcanberra pulseaudio"
 
-inherit gnomebase distro_features_check
+inherit autotools distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.20.1


