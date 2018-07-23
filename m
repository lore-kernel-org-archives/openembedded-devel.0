Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id E4DF3744AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 16:47:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t13-v6so1359541wrv.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QqYpEUmk3O54fNLu5nfuDIXfJet0hDafYQyxfj6Gt+I=;
	b=cxhcFPvTzDp0LXBx0b+C/b3YI/o+w+AXCiCmSpOpgRL0MuhaxxwG4Nd6+vZFcdCtah
	WntMDryrNHjGAJUxFZb3jKuQGtCw8eE2l2cYLMrR52r+mNSOTuqoHGUJs/fmiLhYCjNV
	0PIUt/EXFmw12uj7/dyOPVenKAyLmhnOsYsRt2i1uwTX8I20fc5PNsGmqvr6G4Lutuis
	rjWzfiqj+BJ4a96SxmVQZuMZMKJnPHX1wTkx5udQ26rgGl+kUTBnqiDdJ1gGiJ3iBW2P
	uljiC5gSGjoJQJ2LdCwJ113Og9qKwKLzH4CsXvyJ4qnxRi+LxQRLisMWgw2RnNLkbuo1
	qmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QqYpEUmk3O54fNLu5nfuDIXfJet0hDafYQyxfj6Gt+I=;
	b=FKgYZF2euuCUuvIku6974xGDQO5X9sWt1yJ92Arszi5ZJWi3GhgBP/E3mcY3GPuG/Z
	eagdKdE0cJCvuLOQVoVj0HRQFuyc79B5gcrTswau+24LJ4E0AAnLdETgEaLbvWJ9a4CK
	CXuJlI9lMILFp/hIetka/y7uYVCKV/ZqcDpI2gm+gYn2FIWf96X+5VTvrCirQStBKXT7
	lSaN1FBiASfJ/z5qqnp3S2jUOs6oMe8KT3cTLHXyXptb0kUDxy288jc2gK7zKfzXvWW1
	iie1TXtNf6vE+rL+wPRsfMVXJtog1jS/MDLGjnW+xorqroNbLdkBdwTSUi9o6TiJlVnr
	lLTw==
X-Gm-Message-State: AOUpUlFiZeTlhLdXzvHmyZ8FEYVO2NmKQ17aZZgI0xLkxsr3o1FZk4dq
	i5sRxrekXDT1vCKuoW1HITisXeZ2
X-Google-Smtp-Source: AAOMgpcUjFB7xq83umVbfmNnLSNwRNRyccBHYxQDmklnhJ7Ek41mDJTeuEVNntW/uZUvd4RgI/Xa/w==
X-Received: by 2002:a5d:438d:: with SMTP id
	i13-v6mr9529459wrq.156.1532364479096; 
	Mon, 23 Jul 2018 09:47:59 -0700 (PDT)
Received: from localhost.localdomain ([2.43.248.104])
	by smtp.gmail.com with ESMTPSA id
	a9-v6sm6706961wrp.55.2018.07.23.09.47.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 09:47:58 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jul 2018 18:47:54 +0200
Message-Id: <20180723164754.29131-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] meta-oe: update cpprest with patches uploaded in Debian, add upstream proposed gcc-8 patch, add boost 1.63 build fix patch
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
X-List-Received-Date: Mon, 23 Jul 2018 16:47:59 -0000

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../0001-disable-more-Werror-warnings.patch   |  48 ------
 .../0002-Define-virtual-destructor.patch      |  28 ----
 ...build-problem-on-Clang.patch => 732.patch} |   5 +-
 .../cpprest/cpprest-2.10.2/747.patch          |  12 ++
 .../cpprest/cpprest-2.10.2/787.patch          |  32 ++++
 .../cpprest/cpprest-2.10.2/boost-fix.patch    |  14 ++
 .../cpprest-2.10.2/disable-float-tests.patch  |  25 +++
 .../disable-outside-tests.patch               | 142 ++++++++++++++++++
 .../disable-test-timeouts.patch               | 103 +++++++++++++
 .../cpprest-2.10.2/fix-cmake-install.patch    |  50 +++++-
 .../recipes-support/cpprest/cpprest_2.10.2.bb |  11 +-
 11 files changed, 382 insertions(+), 88 deletions(-)
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
 delete mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch
 rename meta-oe/recipes-support/cpprest/cpprest-2.10.2/{0001-Fix-a-build-problem-on-Clang.patch => 732.patch} (82%)
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/747.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-float-tests.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-outside-tests.patch
 create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-test-timeouts.patch

diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
deleted file mode 100644
index febfd5bc9..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-Werror-warnings.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ee92f84a96a507b0a7a3c54929ce190ee28b4ecd Mon Sep 17 00:00:00 2001
-From: Alexander Moriarty <amoriarty@fetchrobotics.com>
-Date: Wed, 6 Jun 2018 10:38:43 -0700
-Subject: [PATCH] disable more -Werror warnings
-
-gcc-8: -Wno-format-truncation
-
-clang-6: -Wdelete-non-virtual-dtor
-clang-6: -Wunused-lambda-capture
-
-removed duplicated: -Wno-reorder
-
-This fixes #778
-
-Upstream-Status: Pending [https://github.com/Microsoft/cpprestsdk/pull/779]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Release/CMakeLists.txt | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
-index 1267aff1..fb291ccd 100644
---- a/Release/CMakeLists.txt
-+++ b/Release/CMakeLists.txt
-@@ -166,12 +166,12 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-attributes -Wno-pointer-arith")
-   elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
-     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls)
--    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unused-local-typedefs)
-+    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
-     set(WARNINGS ${WARNINGS} ${LINUX_SUPPRESSIONS})
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration")
-   else()
-     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls)
--    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unused-local-typedefs)
-+    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unused-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-typedefs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
-     set(WARNINGS ${WARNINGS} ${OSX_SUPPRESSIONS})
- 
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++ -Wno-return-type-c-linkage -Wno-unneeded-internal-declaration")
-@@ -184,7 +184,7 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
- elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
-   message("-- Setting gcc options")
- 
--  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code)
-+  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qual -Wconversion -Wformat=2 -Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code -Wno-format-truncation)
-   set(LD_FLAGS "${LD_FLAGS} -Wl,-z,defs")
- 
-   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fno-strict-aliasing")
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch
deleted file mode 100644
index 34cbe6697..000000000
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0002-Define-virtual-destructor.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 816d183eb0fe9ab4607cb049b4b792f8df84d5fe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 22 May 2018 22:17:43 -0700
-Subject: [PATCH] Define virtual destructor
-
-Fixes
-error: destructor called on non-final 'pplx::details::linux_scheduler' that has virtual functions but non-virtual destructor [-Werror,-Wdelete-non-virtual-dtor]
-    __data_.second().~_Tp();
-
-Upstream-Status: Pending [https://github.com/Microsoft/cpprestsdk/issues/747]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Release/include/pplx/pplxlinux.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Release/include/pplx/pplxlinux.h b/Release/include/pplx/pplxlinux.h
-index 6aa1ba35..f3f8d70d 100644
---- a/Release/include/pplx/pplxlinux.h
-+++ b/Release/include/pplx/pplxlinux.h
-@@ -240,6 +240,7 @@ namespace platform
-     {
-     public:
-         _PPLXIMP virtual void schedule( TaskProc_t proc, _In_ void* param);
-+    virtual ~linux_scheduler() {}
-     };
- 
- } // namespace details
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-Fix-a-build-problem-on-Clang.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/732.patch
similarity index 82%
rename from meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-Fix-a-build-problem-on-Clang.patch
rename to meta-oe/recipes-support/cpprest/cpprest-2.10.2/732.patch
index dc6b9dfca..9fcffbfed 100644
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-Fix-a-build-problem-on-Clang.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/732.patch
@@ -1,4 +1,4 @@
-From 0c07931f77aa9df2da065b633ae66faad5a570ec Mon Sep 17 00:00:00 2001
+From 3d8caad3f459d8b2136c5bc9be7fdec53e5d777d Mon Sep 17 00:00:00 2001
 From: Wu Yongwei <wuyongwei@gmail.com>
 Date: Tue, 10 Apr 2018 11:29:12 +0800
 Subject: [PATCH] Fix a build problem on Clang.
@@ -6,9 +6,6 @@ Subject: [PATCH] Fix a build problem on Clang.
 AND_CAPTURE_MEMBER_FUNCTION_POINTERS workaround had a check for GCC,
 but did not exclude Clang.  Clang has a fake GCC version of 4.2, thus
 caused problems.
-
-Upstream-Status: Backport [https://github.com/Microsoft/cpprestsdk/pull/732]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Release/src/http/client/http_client_asio.cpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/747.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/747.patch
new file mode 100644
index 000000000..94bb00598
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/747.patch
@@ -0,0 +1,12 @@
+Description: fix for upstream issue 747, clang 6 build error
+From: rozhuk-im
+--- a/Release/include/pplx/pplxlinux.h	2018-04-29 16:22:39.927675000 +0300
++++ b/Release/include/pplx/pplxlinux.h	2018-04-29 16:22:57.809537000 +0300
+@@ -240,6 +240,7 @@
+     {
+     public:
+         _PPLXIMP virtual void schedule( TaskProc_t proc, _In_ void* param);
++    virtual ~linux_scheduler() {}
+     };
+ 
+ } // namespace details
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch
new file mode 100644
index 000000000..359a3ba52
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/787.patch
@@ -0,0 +1,32 @@
+From 212536f9d66400bef4400c55efd05dd01303c035 Mon Sep 17 00:00:00 2001
+From: Andreas Stieger <astieger@suse.com>
+Date: Sun, 17 Jun 2018 13:00:05 +0200
+Subject: [PATCH] Fix gcc8 error/warning -Werror=format-truncation=
+
+utilities::datetime::to_string(): datetime_str and buf were oversized
+for fitting into output without possible trunctation
+---
+ Release/src/utilities/asyncrt_utils.cpp | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Release/src/utilities/asyncrt_utils.cpp b/Release/src/utilities/asyncrt_utils.cpp
+index 0e62bdee..be38907c 100644
+--- a/Release/src/utilities/asyncrt_utils.cpp
++++ b/Release/src/utilities/asyncrt_utils.cpp
+@@ -691,12 +691,13 @@ utility::string_t datetime::to_string(date_format format) const
+     {
+         // Append fractional second, which is a 7-digit value with no trailing zeros
+         // This way, '1200' becomes '00012'
+-        char buf[9] = { 0 };
++        const int max_frac_length = 8;
++        char buf[max_frac_length+1] = { 0 };
+         snprintf(buf, sizeof(buf), ".%07ld", (long int)frac_sec);
+         // trim trailing zeros
+-        for (int i = 7; buf[i] == '0'; i--) buf[i] = '\0';
++        for (int i = max_frac_length-1; buf[i] == '0'; i--) buf[i] = '\0';
+         // format the datetime into a separate buffer
+-        char datetime_str[max_dt_length+1] = {0};
++        char datetime_str[max_dt_length-max_frac_length-1+1] = {0};
+         strftime(datetime_str, sizeof(datetime_str), "%Y-%m-%dT%H:%M:%S", &datetime);
+         // now print this buffer into the output buffer
+         snprintf(output, sizeof(output), "%s%sZ", datetime_str, buf);
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch
new file mode 100644
index 000000000..5318a6a10
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/boost-fix.patch
@@ -0,0 +1,14 @@
+Origin: https://github.com/Microsoft/cpprestsdk/issues/813
+Last-Update: 2018-07-23
+
+--- cpprest-2.10.2.orig/Release/libs/websocketpp/websocketpp/transport/asio/security/tls.hpp
++++ cpprest-2.10.2/Release/libs/websocketpp/websocketpp/transport/asio/security/tls.hpp
+@@ -312,7 +312,7 @@ protected:
+                 return make_error_code(transport::error::tls_short_read);
+ #else
+             if (ERR_GET_REASON(ec.value()) == boost::asio::ssl::error::stream_truncated) {
+-                return make_error_code(boost::asio::ssl::error::stream_truncated);
++                return make_error_code(static_cast<std::errc>(boost::asio::ssl::error::stream_truncated));
+ #endif
+             } else {
+                 // We know it is a TLS related error, but otherwise don't know
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-float-tests.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-float-tests.patch
new file mode 100644
index 000000000..75f74ec65
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-float-tests.patch
@@ -0,0 +1,25 @@
+Description: new toolchain might have increased the float precision
+Author: Gianfranco Costamagna <locutusofborg@debian.org>
+Last-Update: 2017-10-28
+Forwarded: https://github.com/Microsoft/cpprestsdk/issues/576
+
+--- casablanca-2.10.0.orig/Release/tests/functional/streams/istream_tests.cpp
++++ casablanca-2.10.0/Release/tests/functional/streams/istream_tests.cpp
+@@ -1302,7 +1302,7 @@ void compare_float(float expected, float
+ {
+     compare_floating(expected, actual, FLT_EPSILON);
+ }
+-
++/*
+ TEST(extract_floating_point)
+ {
+     std::string test_string;
+@@ -1349,7 +1349,7 @@ TEST(extract_floating_point)
+             VERIFY_ARE_EQUAL(1 / expected, 1 / actual);
+     } while (!std_istream.eof());
+ }
+-
++*/
+ TEST(extract_floating_point_with_exceptions)
+ {
+     std::vector<std::pair<std::string, std::string>> tests;
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-outside-tests.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-outside-tests.patch
new file mode 100644
index 000000000..b9b3591c3
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-outside-tests.patch
@@ -0,0 +1,142 @@
+Description: Debian forbids calls to external websites.
+
+Author: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Origin: Debian
+Forwarded: not-needed
+Reviewed-By: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
+Last-Update: 2015-11-25
+
+Index: casablanca/Release/tests/functional/http/client/CMakeLists.txt
+===================================================================
+--- casablanca.orig/Release/tests/functional/http/client/CMakeLists.txt
++++ casablanca/Release/tests/functional/http/client/CMakeLists.txt
+@@ -9,7 +9,6 @@
+   multiple_requests.cpp
+   oauth1_tests.cpp
+   oauth2_tests.cpp
+-  outside_tests.cpp
+   pipeline_stage_tests.cpp
+   progress_handler_tests.cpp
+   proxy_tests.cpp
+Index: casablanca/Release/tests/functional/http/client/authentication_tests.cpp
+===================================================================
+--- casablanca.orig/Release/tests/functional/http/client/authentication_tests.cpp
++++ casablanca/Release/tests/functional/http/client/authentication_tests.cpp
+@@ -663,15 +663,19 @@
+     VERIFY_ARE_EQUAL(return_code, response.status_code());
+ }
+ 
++/*
+ TEST(auth_no_data)
+ {
+     auth_test_impl(false);
+ }
++*/
+ 
++/*
+ TEST(unsuccessful_auth_with_basic_cred)
+ {
+     auth_test_impl(true);
+ }
++*/
+ 
+ TEST_FIXTURE(uri_address, set_user_options_asio_http)
+ {
+@@ -692,7 +696,7 @@
+     auto response = client.request(methods::GET).get();
+     VERIFY_ARE_EQUAL(200, response.status_code());
+ }
+-
++/*
+ TEST_FIXTURE(uri_address, set_user_options_asio_https)
+ {
+     handle_timeout([]
+@@ -714,7 +718,7 @@
+         VERIFY_IS_FALSE(v.empty());
+     });
+ }
+-
++*/
+ #endif
+ 
+ } // SUITE(authentication_tests)
+Index: casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
+===================================================================
+--- casablanca.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
++++ casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
+@@ -86,7 +86,7 @@
+     }
+     return false;
+ }
+-
++/*
+ TEST(ssl_test)
+ {
+     websocket_client client;
+@@ -122,7 +122,7 @@
+         throw;
+     }
+ }
+-
++*/
+ // These tests are specific to our websocketpp based implementation.
+ #if !defined(__cplusplus_winrt)
+ 
+@@ -153,14 +153,15 @@
+         throw;
+     }
+ }
+-
++/*
+ // Test specifically for server SignalR team hit interesting cases with.
+ TEST(sni_with_older_server_test)
+ {
+     websocket_client client;
+     sni_test_impl(client);
+ }
+-
++*/
++/*
+ // WinRT doesn't expose option for disabling.
+ // No stable server is available to reliably test this.
+ // The configuration below relies on a timeout in the success case.
+@@ -188,7 +189,8 @@
+         throw;
+     }
+ }
+-
++*/
++/*
+ // Winrt doesn't allow explicitly setting server host for SNI.
+ TEST(sni_explicit_hostname)
+ {
+@@ -199,7 +201,7 @@
+     websocket_client client(config);
+     sni_test_impl(client);
+ }
+-
++*/
+ void handshake_error_test_impl(const ::utility::string_t &host)
+ {
+     websocket_client client;
+Index: casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
+===================================================================
+--- casablanca.orig/Release/tests/functional/http/client/connections_and_errors.cpp
++++ casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
+@@ -415,6 +415,7 @@
+ }
+ #endif
+ 
++/*
+ // Try to connect to a server on a closed port and cancel the operation.
+ TEST_FIXTURE(uri_address, cancel_bad_port)
+ {
+@@ -446,7 +447,7 @@
+ 
+     VERIFY_THROWS_HTTP_ERROR_CODE(t.get(), std::errc::operation_canceled);
+ }
+-
++*/
+ } // SUITE(connections_and_errors)
+ 
+ }}}}
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-test-timeouts.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-test-timeouts.patch
new file mode 100644
index 000000000..93c3e8a26
--- /dev/null
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/disable-test-timeouts.patch
@@ -0,0 +1,103 @@
+Description: Some tests takes too long on slow architectures and timeouts
+ We can safely disable them.
+ e.g.
+ Release/tests/functional/http/client/connections_and_errors.cpp:142: error: Failure in request_timeout_microsecond: Test case timed out and is hung. Aborting all remaining test cases. Expected under 180000ms. FAILED
+
+Index: casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
+===================================================================
+--- casablanca.orig/Release/tests/functional/http/client/connections_and_errors.cpp
++++ casablanca/Release/tests/functional/http/client/connections_and_errors.cpp
+@@ -127,7 +127,7 @@
+     // Try sending another request.
+     VERIFY_THROWS(client.request(methods::GET).wait(), web::http::http_exception);
+ }
+-
++/*
+ TEST_FIXTURE(uri_address, request_timeout)
+ {
+     test_http_server::scoped_server scoped(m_uri);
+@@ -146,7 +146,8 @@
+ #endif
+     t.get();
+ }
+-
++*/
++/*
+ TEST_FIXTURE(uri_address, request_timeout_microsecond)
+ {
+     pplx::task<test_request*> t;
+@@ -168,7 +169,7 @@
+     try { t.get(); }
+     catch (...) {}
+ }
+-
++*/
+ TEST_FIXTURE(uri_address, invalid_method)
+ {
+     web::http::uri uri(U("http://www.bing.com/"));
+Index: casablanca/Release/tests/functional/http/listener/requests_tests.cpp
+===================================================================
+--- casablanca.orig/Release/tests/functional/http/listener/requests_tests.cpp
++++ casablanca/Release/tests/functional/http/listener/requests_tests.cpp
+@@ -173,7 +173,7 @@
+ 
+     listener.close().wait();
+ }
+-
++/*
+ TEST_FIXTURE(uri_address, response_order)
+ {
+     http_listener listener(m_uri);
+@@ -217,7 +217,7 @@
+ 
+     listener.close().wait();
+ }
+-
++*/
+ TEST_FIXTURE(uri_address, uri_encoding, "Ignore", "Codeplex 201")
+ {
+     http_listener listener(m_uri);
+Index: casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
+===================================================================
+--- casablanca.orig/Release/tests/functional/websockets/client/authentication_tests.cpp
++++ casablanca/Release/tests/functional/websockets/client/authentication_tests.cpp
+@@ -221,7 +221,7 @@
+         VERIFY_ARE_EQUAL("TLS handshake failed", e.error_code().message());
+     }
+ }
+-
++/*
+ TEST(self_signed_cert)
+ {
+     handshake_error_test_impl(U("wss://self-signed.badssl.com/"));
+@@ -236,7 +236,7 @@
+ {
+     handshake_error_test_impl(U("wss://expired.badssl.com/"));
+ }
+-
++*/
+ #endif
+ 
+ } // SUITE(authentication_tests)
+Index: casablanca/Release/tests/functional/websockets/client/client_construction.cpp
+===================================================================
+--- casablanca.orig/Release/tests/functional/websockets/client/client_construction.cpp
++++ casablanca/Release/tests/functional/websockets/client/client_construction.cpp
+@@ -81,7 +81,7 @@
+     VERIFY_ARE_EQUAL(config2.credentials().username(), cred.username());
+ }
+ 
+-
++/*
+ // Verify that we can get the baseuri from websocket_client connect.
+ TEST_FIXTURE(uri_address, uri_test)
+ {
+@@ -101,7 +101,7 @@
+     VERIFY_ARE_EQUAL(client2.uri(), m_uri);
+     client2.close().wait();
+ }
+-
++*/
+ TEST_FIXTURE(uri_address, move_operations)
+ {
+     std::string body("hello");
diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
index 0feafef5b..ab9227680 100644
--- a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
+++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/fix-cmake-install.patch
@@ -4,14 +4,56 @@ Upstream-Status: https://github.com/Microsoft/cpprestsdk/pull/737
 Forwarded: https://github.com/Microsoft/cpprestsdk/pull/737
 Last-Update: 2018-04-19
 
---- cpprest-2.10.2.orig/CMakeLists.txt
-+++ cpprest-2.10.2/CMakeLists.txt
-@@ -18,7 +18,7 @@ enable_testing()
+Index: cpprest/Release/CMakeLists.txt
+===================================================================
+--- cpprest.orig/Release/CMakeLists.txt
++++ cpprest/Release/CMakeLists.txt
+@@ -18,7 +18,6 @@
  set(WERROR ON CACHE BOOL "Treat Warnings as Errors.")
  set(CPPREST_EXCLUDE_WEBSOCKETS OFF CACHE BOOL "Exclude websockets functionality.")
  set(CPPREST_EXCLUDE_COMPRESSION OFF CACHE BOOL "Exclude compression functionality.")
 -set(CPPREST_EXPORT_DIR lib/cpprestsdk CACHE STRING "Directory to install CMake config files.")
-+set(CPPREST_EXPORT_DIR lib/cmake/cpprestsdk CACHE STRING "Directory to install CMake config files.")
  set(CPPREST_INSTALL_HEADERS ON CACHE BOOL "Install header files.")
  set(CPPREST_INSTALL ON CACHE BOOL "Add install commands.")
  
+@@ -63,6 +62,9 @@
+ include(cmake/cpprest_find_openssl.cmake)
+ include(cmake/cpprest_find_websocketpp.cmake)
+ include(CheckIncludeFiles)
++if(UNIX)
++include(GNUInstallDirs)
++endif(UNIX)
+ 
+ find_package(Threads REQUIRED)
+ if(THREADS_HAVE_PTHREAD_ARG)
+Index: cpprest/Release/src/CMakeLists.txt
+===================================================================
+--- cpprest.orig/Release/src/CMakeLists.txt
++++ cpprest/Release/src/CMakeLists.txt
+@@ -250,21 +250,21 @@
+   install(
+     TARGETS ${CPPREST_TARGETS}
+     EXPORT cpprestsdk-targets
+-    RUNTIME DESTINATION bin
+-    LIBRARY DESTINATION lib
+-    ARCHIVE DESTINATION lib
++    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
++    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+   )
+ 
+   configure_file(../cmake/cpprestsdk-config.in.cmake "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake" @ONLY)
+ 
+   install(
+     FILES "${CMAKE_CURRENT_BINARY_DIR}/cpprestsdk-config.cmake"
+-    DESTINATION ${CPPREST_EXPORT_DIR}
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
+   )
+   install(
+     EXPORT cpprestsdk-targets
+     FILE cpprestsdk-targets.cmake
+     NAMESPACE cpprestsdk::
+-    DESTINATION ${CPPREST_EXPORT_DIR}
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
+   )
+ endif()
diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
index fea5d4b2e..47183c576 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
@@ -6,10 +6,13 @@ LIC_FILES_CHKSUM = "file://${S}/../license.txt;md5=a2e15b954769218ff912468eecd6a
 DEPENDS = "openssl websocketpp zlib boost"
 
 SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=master \
-           file://fix-cmake-install.patch \
-           file://0001-Fix-a-build-problem-on-Clang.patch;patchdir=.. \
-           file://0002-Define-virtual-destructor.patch;patchdir=.. \
-           file://0001-disable-more-Werror-warnings.patch;patchdir=.. \
+           file://disable-outside-tests.patch;patchdir=.. \
+           file://disable-test-timeouts.patch;patchdir=.. \
+           file://disable-float-tests.patch;patchdir=.. \
+           file://fix-cmake-install.patch;patchdir=.. \
+           file://747.patch;patchdir=.. \
+           file://732.patch;patchdir=.. \
+           file://787.patch;patchdir=.. \
            "
 
 # tag 2.10.2
-- 
2.17.1


