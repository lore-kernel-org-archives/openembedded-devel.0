Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id D82AB74D6E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 13:41:29 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id bi12-v6so8831503plb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 06:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BdRBIxHm+9enKsNLeVeLzy5GZ0kgCO+QbXCLrmAZxGo=;
	b=gHk2ViYlp/TZta+/tkgxhd8iWMXYvogTcxTIxG74BTfZOrkVHfgzMYVtO+FqSjiiHZ
	pTHGK47jzy9TdECwl4aqqZ572j4FfxU7KTxBFZpIDbe+ho5ZGq0xqFw39pwKdP6OCGFk
	Q5fOS/F+IN88qjjZX9/MDDv91+jF+rtr/INsCUXfpTjOrPaP7IyKr5j2HUiT2iHlSsJb
	4NA/CLXP3HTnU++z5BuerOJALZy13kmlq8owLpubXqfYGacIXyqvOiHvzPDml1611+3Y
	2dwCbCTimsNmKRC8kY4n6yU87hUWN5jutu5bpA/Ak7ecCYNxn5XsotM7YBe6AyAVqQJe
	zeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BdRBIxHm+9enKsNLeVeLzy5GZ0kgCO+QbXCLrmAZxGo=;
	b=nH0TKMlP/PZCczoazY3lLctmVANZYKkHDx9gO4Fgef9eDpX1TZRHbW3sgyneWXFqyJ
	2N84suJWUIcrKEWKQeh0arblKYsKJj+nG3jo9V9fyx8ZvzMxVZUQXnM1MmKlCJv+0WbN
	AOsiHMa+zsmfRWEEbHC0s1F5zIDmVvasHPCcfwVs/dHsjiXHl0LDLLVt+OLbbk1UB2uf
	vaFTNWdB1yjc7jk5SHiKB5DTcWzP6SqtwIaT74ip6oP15dVCrQ4k1ty26QJ21ogZwIFI
	ujtXV9N74dDk9N/Gztm9tfnT/3tuyyNUDeVsbFng9OK0rm2kphLilFFA/B3eP8iF24kU
	aYOw==
X-Gm-Message-State: ALKqPwd+BABGSzc1SJr52RPTZIKx3HGClLSo7Qn6AQ1mrzyFq70kZsE3
	LMz8Lz62hz0oPi+G0ARXL3y19Q==
X-Google-Smtp-Source: AB8JxZr7CL6NAf/g0OwKgXNay4EUJKZ77+HZDleEbe5MPs1q+Kw5ODC3EJxHch0aCru1skbUrODT7g==
X-Received: by 2002:a17:902:6ac3:: with SMTP id
	i3-v6mr20218238plt.378.1526910090195; 
	Mon, 21 May 2018 06:41:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	f29-v6sm31287446pff.169.2018.05.21.06.41.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 06:41:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 May 2018 06:41:21 -0700
Message-Id: <20180521134121.27759-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180521134121.27759-1-raj.khem@gmail.com>
References: <20180521134121.27759-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] abiword: Fix build with clang
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
X-List-Received-Date: Mon, 21 May 2018 13:41:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Bug-13770-Require-C-11-from-now-on.patch | 180 ++++++++++++++++++
 .../recipes-gnome/abiword/abiword_3.0.2.bb    |   8 +-
 2 files changed, 184 insertions(+), 4 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch b/meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch
new file mode 100644
index 0000000000..3731a23f19
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/0001-Bug-13770-Require-C-11-from-now-on.patch
@@ -0,0 +1,180 @@
+From f6d0dc338fe867c1b064682ae7f15bffe019b306 Mon Sep 17 00:00:00 2001
+From: Hubert Figuiere <hub@figuiere.net>
+Date: Tue, 12 Apr 2016 02:55:47 +0000
+Subject: [PATCH] Bug 13770 - Require C++11 from now on.
+
+git-svn-id: svn+ssh://svn.abisource.com/svnroot/abiword/trunk@35197 bcba8976-2d24-0410-9c9c-aab3bd5fdfd6
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ax_cxx_compile_stdcxx_11.m4  | 133 +++++++++++++++++++++++++++++++++++
+ configure.ac                 |   1 +
+ src/wp/ap/gtk/ap_UnixApp.cpp |   2 +-
+ 3 files changed, 135 insertions(+), 1 deletion(-)
+ create mode 100644 ax_cxx_compile_stdcxx_11.m4
+
+diff --git a/ax_cxx_compile_stdcxx_11.m4 b/ax_cxx_compile_stdcxx_11.m4
+new file mode 100644
+index 0000000..af37acd
+--- /dev/null
++++ b/ax_cxx_compile_stdcxx_11.m4
+@@ -0,0 +1,133 @@
++# ============================================================================
++#  http://www.gnu.org/software/autoconf-archive/ax_cxx_compile_stdcxx_11.html
++# ============================================================================
++#
++# SYNOPSIS
++#
++#   AX_CXX_COMPILE_STDCXX_11([ext|noext],[mandatory|optional])
++#
++# DESCRIPTION
++#
++#   Check for baseline language coverage in the compiler for the C++11
++#   standard; if necessary, add switches to CXXFLAGS to enable support.
++#
++#   The first argument, if specified, indicates whether you insist on an
++#   extended mode (e.g. -std=gnu++11) or a strict conformance mode (e.g.
++#   -std=c++11).  If neither is specified, you get whatever works, with
++#   preference for an extended mode.
++#
++#   The second argument, if specified 'mandatory' or if left unspecified,
++#   indicates that baseline C++11 support is required and that the macro
++#   should error out if no mode with that support is found.  If specified
++#   'optional', then configuration proceeds regardless, after defining
++#   HAVE_CXX11 if and only if a supporting mode is found.
++#
++# LICENSE
++#
++#   Copyright (c) 2008 Benjamin Kosnik <bkoz@redhat.com>
++#   Copyright (c) 2012 Zack Weinberg <zackw@panix.com>
++#   Copyright (c) 2013 Roy Stogner <roystgnr@ices.utexas.edu>
++#
++#   Copying and distribution of this file, with or without modification, are
++#   permitted in any medium without royalty provided the copyright notice
++#   and this notice are preserved. This file is offered as-is, without any
++#   warranty.
++
++#serial 3
++
++m4_define([_AX_CXX_COMPILE_STDCXX_11_testbody], [
++  template <typename T>
++    struct check
++    {
++      static_assert(sizeof(int) <= sizeof(T), "not big enough");
++    };
++
++    typedef check<check<bool>> right_angle_brackets;
++
++    int a;
++    decltype(a) b;
++
++    typedef check<int> check_type;
++    check_type c;
++    check_type&& cr = static_cast<check_type&&>(c);
++
++    auto d = a;
++])
++
++AC_DEFUN([AX_CXX_COMPILE_STDCXX_11], [dnl
++  m4_if([$1], [], [],
++        [$1], [ext], [],
++        [$1], [noext], [],
++        [m4_fatal([invalid argument `$1' to AX_CXX_COMPILE_STDCXX_11])])dnl
++  m4_if([$2], [], [ax_cxx_compile_cxx11_required=true],
++        [$2], [mandatory], [ax_cxx_compile_cxx11_required=true],
++        [$2], [optional], [ax_cxx_compile_cxx11_required=false],
++        [m4_fatal([invalid second argument `$2' to AX_CXX_COMPILE_STDCXX_11])])dnl
++  AC_LANG_PUSH([C++])dnl
++  ac_success=no
++  AC_CACHE_CHECK(whether $CXX supports C++11 features by default,
++  ax_cv_cxx_compile_cxx11,
++  [AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
++    [ax_cv_cxx_compile_cxx11=yes],
++    [ax_cv_cxx_compile_cxx11=no])])
++  if test x$ax_cv_cxx_compile_cxx11 = xyes; then
++    ac_success=yes
++  fi
++
++  m4_if([$1], [noext], [], [dnl
++  if test x$ac_success = xno; then
++    for switch in -std=gnu++11 -std=gnu++0x; do
++      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
++      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
++                     $cachevar,
++        [ac_save_CXXFLAGS="$CXXFLAGS"
++         CXXFLAGS="$CXXFLAGS $switch"
++         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
++          [eval $cachevar=yes],
++          [eval $cachevar=no])
++         CXXFLAGS="$ac_save_CXXFLAGS"])
++      if eval test x\$$cachevar = xyes; then
++        CXXFLAGS="$CXXFLAGS $switch"
++        ac_success=yes
++        break
++      fi
++    done
++  fi])
++
++  m4_if([$1], [ext], [], [dnl
++  if test x$ac_success = xno; then
++    for switch in -std=c++11 -std=c++0x; do
++      cachevar=AS_TR_SH([ax_cv_cxx_compile_cxx11_$switch])
++      AC_CACHE_CHECK(whether $CXX supports C++11 features with $switch,
++                     $cachevar,
++        [ac_save_CXXFLAGS="$CXXFLAGS"
++         CXXFLAGS="$CXXFLAGS $switch"
++         AC_COMPILE_IFELSE([AC_LANG_SOURCE([_AX_CXX_COMPILE_STDCXX_11_testbody])],
++          [eval $cachevar=yes],
++          [eval $cachevar=no])
++         CXXFLAGS="$ac_save_CXXFLAGS"])
++      if eval test x\$$cachevar = xyes; then
++        CXXFLAGS="$CXXFLAGS $switch"
++        ac_success=yes
++        break
++      fi
++    done
++  fi])
++  AC_LANG_POP([C++])
++  if test x$ax_cxx_compile_cxx11_required = xtrue; then
++    if test x$ac_success = xno; then
++      AC_MSG_ERROR([*** A compiler with support for C++11 language features is required.])
++    fi
++  else
++    if test x$ac_success = xno; then
++      HAVE_CXX11=0
++      AC_MSG_NOTICE([No compiler with C++11 support was found])
++    else
++      HAVE_CXX11=1
++      AC_DEFINE(HAVE_CXX11,1,
++                [define if the compiler supports basic C++11 syntax])
++    fi
++
++    AC_SUBST(HAVE_CXX11)
++  fi
++])
+diff --git a/configure.ac b/configure.ac
+index 48228be..f7be7de 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -131,6 +131,7 @@ win_pkgs="$enchant_req"
+ 
+ AC_PROG_CC
+ AC_PROG_CXX
++AX_CXX_COMPILE_STDCXX_11(noext,mandatory)
+ #AC_PROG_OBJC
+ AC_PROG_INSTALL
+ # For libtool 1.5.x compatability (AC_PROG_LIBTOOL is deprecated version of LT_INIT)
+diff --git a/src/wp/ap/gtk/ap_UnixApp.cpp b/src/wp/ap/gtk/ap_UnixApp.cpp
+index 061a304..260f8e5 100644
+--- a/src/wp/ap/gtk/ap_UnixApp.cpp
++++ b/src/wp/ap/gtk/ap_UnixApp.cpp
+@@ -863,7 +863,7 @@ static bool is_so (const char *file) {
+ 	if (len < (strlen(G_MODULE_SUFFIX) + 2)) // this is ".so" and at least one char for the filename
+ 		return false;
+ 	const char *suffix = file+(len-3);
+-	if(0 == strcmp (suffix, "."G_MODULE_SUFFIX))
++	if(0 == strcmp (suffix, "." G_MODULE_SUFFIX))
+ 		return true;
+ 	return false;
+ }
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
index d2c0186b5a..0f3f507f3d 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.2.bb
@@ -24,10 +24,10 @@ RDEPENDS_${PN}_append_libc-glibc = " \
 "
 RCONFLICTS_${PN} = "${PN}-embedded"
 
-SRC_URI = " \
-    http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
-    file://0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch \
-"
+SRC_URI = "http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
+           file://0001-plugins-aiksaurus-Makefile.am-remove-uncomplete-opti.patch \
+           file://0001-Bug-13770-Require-C-11-from-now-on.patch \
+           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c5edcc3ccd864b19004d14e9c1c9a26a"
 
-- 
2.17.0


