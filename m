Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70153CD6E4A
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 07:18:49 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2148.1780125522259051380
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2026 00:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=E0wOq1vY;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd93.aul.t-online.de (fwd93.aul.t-online.de [10.223.144.119])
	by mailout11.t-online.de (Postfix) with SMTP id D86041C2EC
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 09:18:39 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.169.166]) by fwd93.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wTDxt-3RJYFV0; Sat, 30 May 2026 09:18:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] jemalloc: add backport patch to fix build with gcc 16
Date: Sat, 30 May 2026 09:18:30 +0200
Message-ID: <20260530071830.1515286-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1780125517-097F9F9B-76B3FFB8/0/0 CLEAN NORMAL
X-TOI-MSGID: 378c9e67-9de7-4d30-810e-fb11d112ca6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780125519; i=f_l_k@t-online.de;
	bh=k/qS0YEFB3EPHaEr/FCTjxa3/s8rKyVPsSfObXvRLsc=;
	h=From:To:Subject:Date;
	b=E0wOq1vYVTc2rsZ73YufygtudpvYvK0Af8WGzK6LS3RXHULLXYkAbGWaucw2u46hB
	 MT3iY4faokR2kNkGy1LOOZWD49CyL0Z/odnLVGWDKn/VHq+pYPJ+9vn1sLCRfvutbQ
	 z9PlffXUwMKGCMCWOdoDVTXqZEyZPwT5oP8D88Hn0AnQYcRdunxoYx1aJaklmUzL5M
	 +a3hAxFa/+0D7+Lc/M+idKIKl6BGBt7o7XNTtO5kA1S501lRe1hEQO6S1FCIt7a5Ub
	 fhNWXWJp/5uKj3FdTokHQB0Z7kyJ2NJ4xAUK0D5vxMqZtjpHlI08KArxaaPCwyXCVh
	 vq5lnKAx8Ohng==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2026 07:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127293

This patch replaces std::__throw_bad_alloc call with standard C++

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...fe33a48c52bfe26ea83e49f0d317a47da3ea.patch | 158 ++++++++++++++++++
 .../jemalloc/jemalloc_5.3.1.bb                |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jemalloc/files/1a15fe33a48c5=
2bfe26ea83e49f0d317a47da3ea.patch

diff --git a/meta-oe/recipes-devtools/jemalloc/files/1a15fe33a48c52bfe26e=
a83e49f0d317a47da3ea.patch b/meta-oe/recipes-devtools/jemalloc/files/1a15=
fe33a48c52bfe26ea83e49f0d317a47da3ea.patch
new file mode 100644
index 0000000000..a4fad4af61
--- /dev/null
+++ b/meta-oe/recipes-devtools/jemalloc/files/1a15fe33a48c52bfe26ea83e49f=
0d317a47da3ea.patch
@@ -0,0 +1,158 @@
+From 1a15fe33a48c52bfe26ea83e49f0d317a47da3ea Mon Sep 17 00:00:00 2001
+From: lexprfuncall <cshapiro@meta.com>
+Date: Mon, 27 Apr 2026 11:50:27 -0700
+Subject: [PATCH] Replace std::__throw_bad_alloc call with standard C++ (=
#2900)
+
+* Replace std::__throw_bad_alloc call with standard C++
+
+Since December of 2025, std::__throw_bad_alloc is no longer visible
+through #include <new> causing jemalloc build failures with gcc 16.
+As far as I can tell, all std::__throw_bad_alloc did was arrange to
+raise a std::bad_alloc exception if exceptions are enabled.  I am not
+sure whether its usage was truly meaningful in jemalloc since the call
+is wrapped in a try catch and any usage of try catch is considered an
+error when compiling with -fno-exceptions on gcc, at least.
+
+This change adds a check to configure.ac that determines whether
+exceptions are enabled by compiling a simple try catch that raises a
+std::bad_alloc exception.  If that test succeeds, the macro
+JEMALLOC_HAVE_CXX_EXCEPTIONS is defined, and jemalloc will raise an
+exception.  Otherwise, we call std::terminate() to abort.
+
+This was tested on FreeBSD with the gcc16 port with and without exceptio=
ns
+enabled.
+
+* Replace std::set_new_handler calls with std::get_new_handler
+
+Previously, std::set_new_handler was used as a workaround for
+compilers with only partial support for C++11.  Now that C++14 is a
+requirement to enable C++ support, we can assume std::get_new_handler
+is available.
+
+Upstream-Status: Backport [https://github.com/jemalloc/jemalloc/commit/1=
a15fe33a48c52bfe26ea83e49f0d317a47da3ea]
+---
+ Makefile.in                                   |  6 +++--
+ configure.ac                                  | 23 +++++++++++++++++
+ .../internal/jemalloc_internal_defs.h.in      |  3 +++
+ src/jemalloc_cpp.cpp                          | 25 ++++++++++---------
+ 4 files changed, 43 insertions(+), 14 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index a93048d7b8..1f9d14f1f2 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -337,9 +337,11 @@ TESTS_INTEGRATION +=3D \
+ endif
+ ifeq (@enable_cxx@, 1)
+ CPP_SRCS :=3D $(srcroot)src/jemalloc_cpp.cpp
+-TESTS_INTEGRATION_CPP :=3D $(srcroot)test/integration/cpp/basic.cpp \
+-	$(srcroot)test/integration/cpp/infallible_new_true.cpp \
++TESTS_INTEGRATION_CPP :=3D $(srcroot)test/integration/cpp/basic.cpp
++ifeq (@enable_cxx_exceptions@, 1)
++TESTS_INTEGRATION_CPP +=3D $(srcroot)test/integration/cpp/infallible_ne=
w_true.cpp \
+ 	$(srcroot)test/integration/cpp/infallible_new_false.cpp
++endif
+ else
+ CPP_SRCS :=3D
+ TESTS_INTEGRATION_CPP :=3D
+diff --git a/configure.ac b/configure.ac
+index 321a729012..d151829832 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -374,7 +374,30 @@ fi
+ if test "x$enable_cxx" =3D "x1"; then
+   AC_DEFINE([JEMALLOC_ENABLE_CXX], [ ], [ ])
+ fi
++if test "x$enable_cxx" =3D "x1"; then
++  dnl Now check whether the C++ compiler has exceptions enabled.
++  AC_LANG_PUSH([C++])
++  SAVED_CXXFLAGS=3D"${CXXFLAGS}"
++  CXXFLAGS=3D"${CXXFLAGS} ${EXTRA_CXXFLAGS}"
++  JE_COMPILABLE([C++ exception support], [
++#include <new>
++], [
++	try {
++		throw std::bad_alloc();
++	} catch (const std::bad_alloc &) {
++	}
++], [je_cv_cxx_exceptions])
++  CXXFLAGS=3D"${SAVED_CXXFLAGS}"
++  AC_LANG_POP([C++])
++  if test "x${je_cv_cxx_exceptions}" =3D "xyes" ; then
++    AC_DEFINE([JEMALLOC_HAVE_CXX_EXCEPTIONS], [ ], [ ])
++    enable_cxx_exceptions=3D"1"
++  else
++    enable_cxx_exceptions=3D"0"
++  fi
++fi
+ AC_SUBST([enable_cxx])
++AC_SUBST([enable_cxx_exceptions])
+ AC_SUBST([CONFIGURE_CXXFLAGS])
+ AC_SUBST([SPECIFIED_CXXFLAGS])
+ AC_SUBST([EXTRA_CXXFLAGS])
+diff --git a/include/jemalloc/internal/jemalloc_internal_defs.h.in b/inc=
lude/jemalloc/internal/jemalloc_internal_defs.h.in
+index 31ae2e8ed2..54d4da2032 100644
+--- a/include/jemalloc/internal/jemalloc_internal_defs.h.in
++++ b/include/jemalloc/internal/jemalloc_internal_defs.h.in
+@@ -465,6 +465,9 @@
+ /* Is C++ support being built? */
+ #undef JEMALLOC_ENABLE_CXX
+=20
++/* Are C++ exceptions enabled? */
++#undef JEMALLOC_HAVE_CXX_EXCEPTIONS
++
+ /* Performs additional size checks when defined. */
+ #undef JEMALLOC_OPT_SIZE_CHECKS
+=20
+diff --git a/src/jemalloc_cpp.cpp b/src/jemalloc_cpp.cpp
+index 4e838d3b51..ac109bb28e 100644
+--- a/src/jemalloc_cpp.cpp
++++ b/src/jemalloc_cpp.cpp
+@@ -1,4 +1,4 @@
+-#include <mutex>
++#include <exception>
+ #include <new>
+ // NOLINTBEGIN(misc-use-anonymous-namespace)
+=20
+@@ -78,29 +78,30 @@ handleOOM(std::size_t size, bool nothrow) {
+ 	void *ptr =3D nullptr;
+=20
+ 	while (ptr =3D=3D nullptr) {
+-		std::new_handler handler;
+-		// GCC-4.8 and clang 4.0 do not have std::get_new_handler.
+-		{
+-			static std::mutex           mtx;
+-			std::lock_guard<std::mutex> lock(mtx);
+-
+-			handler =3D std::set_new_handler(nullptr);
+-			std::set_new_handler(handler);
+-		}
++		std::new_handler handler =3D std::get_new_handler();
+ 		if (handler =3D=3D nullptr)
+ 			break;
+=20
++#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
+ 		try {
+ 			handler();
+ 		} catch (const std::bad_alloc &) {
+ 			break;
+ 		}
++#else
++		handler();
++#endif
+=20
+ 		ptr =3D je_malloc(size);
+ 	}
+=20
+-	if (ptr =3D=3D nullptr && !nothrow)
+-		std::__throw_bad_alloc();
++	if (ptr =3D=3D nullptr && !nothrow) {
++#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
++		throw std::bad_alloc();
++#else
++		std::terminate();
++#endif
++	}
+ 	return ptr;
+ }
+=20
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb b/meta-o=
e/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
index a369650ec5..fe03653cc9 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
@@ -14,6 +14,7 @@ SECTION =3D "libs"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dea061f8731d5e6a5761dfad951ef5=
f5f"
=20
 SRC_URI =3D "git://github.com/jemalloc/jemalloc.git;branch=3Dmaster;prot=
ocol=3Dhttps;tag=3D${PV} \
+	   file://1a15fe33a48c52bfe26ea83e49f0d317a47da3ea.patch \
            file://run-ptest \
            "
 SRCREV =3D "81034ce1f1373e37dc865038e1bc8eeecf559ce8"
--=20
2.54.0


