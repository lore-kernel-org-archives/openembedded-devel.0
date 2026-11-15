Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3891.1794729072290348352
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Vnt4+Jmt;
 spf=pass (domain: gmail.com, ip: 74.125.82.181, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso2949178eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729072; x=1795333872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baPBPDuQ+7Z9a7CYgSZYqOwSPeXAwgA456MFT6OOjXg=;
        b=Vnt4+Jmt65/3182AWS29u2Jfg06LsAZEAIiN24tMo4V4yT8fu0752B1b9URhliWefa
         Oo3WxkN0pc+z/pAQt4t+E3hNJ/YuBOoc18MW14X5XbBtruttb2mz1guSzZMtMGAZQqfy
         6zf9vlb4lItVZA/w4z9cQdO4na/cY5hC451aa4elfuw3x1DtWGf21YTdJrhRnVf8W1E5
         86t60DSqS8bpF7i3GY3rZdz1aSdSNswwT4vg9dFGonZMPxCIcKk6EE4QyXctTG6SLT5Z
         2LjvUX9kSt5jWAnbmGTEbL7Vl8w8ohb47Ddh4guRzBOy2ODpxp0v4YHU60APBmAjUKcQ
         UPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729072; x=1795333872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=baPBPDuQ+7Z9a7CYgSZYqOwSPeXAwgA456MFT6OOjXg=;
        b=TpEKCA1zDQFW9W2+IXgi1CsObdaYwPIHHdX4rES9iW3p9uOnTEqhvVTNb/C8CR4uMA
         Jf4mOHV5L6GlvCyUyswVPGiAhXhcImXAV/XrqpJ5/NmRVcYfOS6SGfczXUUuAxbPNphS
         LJTNG8EiAcEQEHvkgN+i56Bl+tQDwAm6J+glSQk3aeyHpxbS2hPfHdGIvHDgvoTzhMZd
         Yccz7msPh8vmJf7PxJrF5hKCN5vZ895o2o5oKRlbmpUZ66w3zF/+1OV9rS7rFxwhEtkf
         Gl8Zq/R8YGFHno7b4TH+SQsas7xQSalnIx6vdZ6E3s0euWn0B6tAPuZVSRzHUI6OsW3s
         w33w==
X-Gm-Message-State: APuU4Z/dA0HcZlvZS71Y0BTyA2HXWSJc22XVPO1dlEjVREEzO8hztKoa
	FZqnlVJkZZboHQPVCh/LE7vjwCDHwAuBe8cqy+Zqxva7NhPsFK5b5x+9ORS1tCXl
X-Gm-Gg: AYBFou0WtuHS7kPZnN9glh001qZd7anbM6aI7zE3+sWNKVLs7E4opiO0LVju7O2Xgsz
	jSJwBODf2safG8iMnov8+EEKViYt1s+BibK3SXxpiavbG8NxTXi9aEmGUVLiMOp0zyYNlDE1iLd
	Vlie3jMGad9yNOKEcfZnrCQ+I3vfgFQTxKl09MzaMa+5L2O9mBuma9k34SxAZnUtxztQEBZkxyT
	pJl5v9bhnZC8f+CKxwkqNMG4N+wGxKH20u/J8qs4Sx/JacwgEMlGv3ACKUZO9DJQs+minaKe1wc
	uw0/kzhQ0CO5dBzw+KNmWn3cZ6osFCT2pEE1XOCe6nm8kdbVra9zUF4d5IGQp4HkkHHKAC4irKD
	tZOlRl10tFIOSbe6k/PGoDNHFxjEP5btxMxVAy3E0hYNDlui2P/TaJBGzqCgBRaAofTkO756tYE
	pzreYfJJEDb5Ro02DMId9z8G2OnSiSEiiIuYtSWLk+7kx3Vtkj/MAzkJ+IE/MuaXOzVUsuLMCdD
	WmSD0dktQjvAIZM7iHqoskBIqJHmiZx1ob0UL2fOficP2AyfMSrnO70+UyJLwxJ04ipKpgHOFy+
	BAIDzmNlgyihuPhtrqmbC+8na6R5vaJA5rY359ZbCnpuh5CTOlpklDMdAKutIaVgqXVzDig2Qh9
	6dYDa9K8kCBhdB8DyDDMgwltxUKzK6/lmFsW9Uj4hkJNULVn28orpke3V+hsoPW2d7GOzAMjNPj
	PRpedbtieCJQZa+iYS2RFR2GosO2Yzhpn/rXeT1AMVHTZjALs5bmuISQ5HVDJwDki9bwRqedaVv
	UFP3hXcpxf11sk9RMFeUcsi/O3pR/aisSnNboaY7C0ETGd30q+w4i4VSVTvXcbBSn0isB2hkmeH
	1N22
X-Received: by 2002:a05:7300:7481:b0:36a:1f4f:3e9 with SMTP id 5a478bee46e88-379677f25d5mr10388638eec.20.1794729071414;
        Sat, 14 Nov 2026 23:51:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 68/96] jemalloc: upgrade 5.3.1 -> 5.4.0
Date: Sat, 14 Nov 2026 23:48:46 -0800
Message-ID: <20261115074918.2932593-68-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132338
Content-Type: text/plain; charset="utf-8"

Drop 1a15fe33a48c52bfe26ea83e49f0d317a47da3ea.patch, included in this
release.

ptests pass on qemux86-64.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...fe33a48c52bfe26ea83e49f0d317a47da3ea.patch | 158 ------------------
 .../{jemalloc_5.3.1.bb => jemalloc_5.4.0.bb}  |   3 +-
 2 files changed, 1 insertion(+), 160 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/jemalloc/files/1a15fe33a48c52bfe26ea83e49f0d317a47da3ea.patch
 rename meta-oe/recipes-devtools/jemalloc/{jemalloc_5.3.1.bb => jemalloc_5.4.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/jemalloc/files/1a15fe33a48c52bfe26ea83e49f0d317a47da3ea.patch b/meta-oe/recipes-devtools/jemalloc/files/1a15fe33a48c52bfe26ea83e49f0d317a47da3ea.patch
deleted file mode 100644
index a4fad4af61..0000000000
--- a/meta-oe/recipes-devtools/jemalloc/files/1a15fe33a48c52bfe26ea83e49f0d317a47da3ea.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 1a15fe33a48c52bfe26ea83e49f0d317a47da3ea Mon Sep 17 00:00:00 2001
-From: lexprfuncall <cshapiro@meta.com>
-Date: Mon, 27 Apr 2026 11:50:27 -0700
-Subject: [PATCH] Replace std::__throw_bad_alloc call with standard C++ (#2900)
-
-* Replace std::__throw_bad_alloc call with standard C++
-
-Since December of 2025, std::__throw_bad_alloc is no longer visible
-through #include <new> causing jemalloc build failures with gcc 16.
-As far as I can tell, all std::__throw_bad_alloc did was arrange to
-raise a std::bad_alloc exception if exceptions are enabled.  I am not
-sure whether its usage was truly meaningful in jemalloc since the call
-is wrapped in a try catch and any usage of try catch is considered an
-error when compiling with -fno-exceptions on gcc, at least.
-
-This change adds a check to configure.ac that determines whether
-exceptions are enabled by compiling a simple try catch that raises a
-std::bad_alloc exception.  If that test succeeds, the macro
-JEMALLOC_HAVE_CXX_EXCEPTIONS is defined, and jemalloc will raise an
-exception.  Otherwise, we call std::terminate() to abort.
-
-This was tested on FreeBSD with the gcc16 port with and without exceptions
-enabled.
-
-* Replace std::set_new_handler calls with std::get_new_handler
-
-Previously, std::set_new_handler was used as a workaround for
-compilers with only partial support for C++11.  Now that C++14 is a
-requirement to enable C++ support, we can assume std::get_new_handler
-is available.
-
-Upstream-Status: Backport [https://github.com/jemalloc/jemalloc/commit/1a15fe33a48c52bfe26ea83e49f0d317a47da3ea]
----
- Makefile.in                                   |  6 +++--
- configure.ac                                  | 23 +++++++++++++++++
- .../internal/jemalloc_internal_defs.h.in      |  3 +++
- src/jemalloc_cpp.cpp                          | 25 ++++++++++---------
- 4 files changed, 43 insertions(+), 14 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index a93048d7b8..1f9d14f1f2 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -337,9 +337,11 @@ TESTS_INTEGRATION += \
- endif
- ifeq (@enable_cxx@, 1)
- CPP_SRCS := $(srcroot)src/jemalloc_cpp.cpp
--TESTS_INTEGRATION_CPP := $(srcroot)test/integration/cpp/basic.cpp \
--	$(srcroot)test/integration/cpp/infallible_new_true.cpp \
-+TESTS_INTEGRATION_CPP := $(srcroot)test/integration/cpp/basic.cpp
-+ifeq (@enable_cxx_exceptions@, 1)
-+TESTS_INTEGRATION_CPP += $(srcroot)test/integration/cpp/infallible_new_true.cpp \
- 	$(srcroot)test/integration/cpp/infallible_new_false.cpp
-+endif
- else
- CPP_SRCS :=
- TESTS_INTEGRATION_CPP :=
-diff --git a/configure.ac b/configure.ac
-index 321a729012..d151829832 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -374,7 +374,30 @@ fi
- if test "x$enable_cxx" = "x1"; then
-   AC_DEFINE([JEMALLOC_ENABLE_CXX], [ ], [ ])
- fi
-+if test "x$enable_cxx" = "x1"; then
-+  dnl Now check whether the C++ compiler has exceptions enabled.
-+  AC_LANG_PUSH([C++])
-+  SAVED_CXXFLAGS="${CXXFLAGS}"
-+  CXXFLAGS="${CXXFLAGS} ${EXTRA_CXXFLAGS}"
-+  JE_COMPILABLE([C++ exception support], [
-+#include <new>
-+], [
-+	try {
-+		throw std::bad_alloc();
-+	} catch (const std::bad_alloc &) {
-+	}
-+], [je_cv_cxx_exceptions])
-+  CXXFLAGS="${SAVED_CXXFLAGS}"
-+  AC_LANG_POP([C++])
-+  if test "x${je_cv_cxx_exceptions}" = "xyes" ; then
-+    AC_DEFINE([JEMALLOC_HAVE_CXX_EXCEPTIONS], [ ], [ ])
-+    enable_cxx_exceptions="1"
-+  else
-+    enable_cxx_exceptions="0"
-+  fi
-+fi
- AC_SUBST([enable_cxx])
-+AC_SUBST([enable_cxx_exceptions])
- AC_SUBST([CONFIGURE_CXXFLAGS])
- AC_SUBST([SPECIFIED_CXXFLAGS])
- AC_SUBST([EXTRA_CXXFLAGS])
-diff --git a/include/jemalloc/internal/jemalloc_internal_defs.h.in b/include/jemalloc/internal/jemalloc_internal_defs.h.in
-index 31ae2e8ed2..54d4da2032 100644
---- a/include/jemalloc/internal/jemalloc_internal_defs.h.in
-+++ b/include/jemalloc/internal/jemalloc_internal_defs.h.in
-@@ -465,6 +465,9 @@
- /* Is C++ support being built? */
- #undef JEMALLOC_ENABLE_CXX
- 
-+/* Are C++ exceptions enabled? */
-+#undef JEMALLOC_HAVE_CXX_EXCEPTIONS
-+
- /* Performs additional size checks when defined. */
- #undef JEMALLOC_OPT_SIZE_CHECKS
- 
-diff --git a/src/jemalloc_cpp.cpp b/src/jemalloc_cpp.cpp
-index 4e838d3b51..ac109bb28e 100644
---- a/src/jemalloc_cpp.cpp
-+++ b/src/jemalloc_cpp.cpp
-@@ -1,4 +1,4 @@
--#include <mutex>
-+#include <exception>
- #include <new>
- // NOLINTBEGIN(misc-use-anonymous-namespace)
- 
-@@ -78,29 +78,30 @@ handleOOM(std::size_t size, bool nothrow) {
- 	void *ptr = nullptr;
- 
- 	while (ptr == nullptr) {
--		std::new_handler handler;
--		// GCC-4.8 and clang 4.0 do not have std::get_new_handler.
--		{
--			static std::mutex           mtx;
--			std::lock_guard<std::mutex> lock(mtx);
--
--			handler = std::set_new_handler(nullptr);
--			std::set_new_handler(handler);
--		}
-+		std::new_handler handler = std::get_new_handler();
- 		if (handler == nullptr)
- 			break;
- 
-+#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
- 		try {
- 			handler();
- 		} catch (const std::bad_alloc &) {
- 			break;
- 		}
-+#else
-+		handler();
-+#endif
- 
- 		ptr = je_malloc(size);
- 	}
- 
--	if (ptr == nullptr && !nothrow)
--		std::__throw_bad_alloc();
-+	if (ptr == nullptr && !nothrow) {
-+#ifdef JEMALLOC_HAVE_CXX_EXCEPTIONS
-+		throw std::bad_alloc();
-+#else
-+		std::terminate();
-+#endif
-+	}
- 	return ptr;
- }
- 
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.4.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
rename to meta-oe/recipes-devtools/jemalloc/jemalloc_5.4.0.bb
index f3a310029f..772cb3ff84 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.4.0.bb
@@ -14,10 +14,9 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ea061f8731d5e6a5761dfad951ef5f5f"
 
 SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https;tag=${PV} \
-	   file://1a15fe33a48c52bfe26ea83e49f0d317a47da3ea.patch \
            file://run-ptest \
            "
-SRCREV = "81034ce1f1373e37dc865038e1bc8eeecf559ce8"
+SRCREV = "7a34f18502e7b222724097cdcd499b437d189acc"
 PV_LONG := "${PV}-0-g${SRCREV}"
 
 inherit autotools ptest
