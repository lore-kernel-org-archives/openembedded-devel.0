Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F0AFC72CB
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 17:15:24 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34251.1774199719511991135
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 10:15:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HzeqnW8J;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3921828eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774199719; x=1774804519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEjw2SAqYTpq4jU3xK6mpVCyHkRM8Nnbx3ioNxoVflA=;
        b=HzeqnW8JAiRgYrzez08zV4iiJS/+Wod+U+ESCsi+lNVZ5OTNS8nLcvlZ8LvrW5/aOK
         d6VeegqMcCjK0WLlE1HgCceI/sm/uqIu89c9lhQSAzzZZMUP83iOGaIzRyuAkS6QLGV7
         xSayaRgjn9uIbshAnZ59eP7n8wYMFhap9LWW8/84PWN8cCaH4RW5YB6gV12Nz7fAW4z8
         SiCfZmYtNE+vUnpedQdfUIZ/8mz4uybZnnImDx4KquYSaqEFvRZPiylJBeHAdCzuEnIl
         9RoJH8NgJD4cV0EwbSEac7ddEFctliohEGpeRgjn2SxoF/+cC21hFshIYOhf/oTGfZML
         wtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774199719; x=1774804519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEjw2SAqYTpq4jU3xK6mpVCyHkRM8Nnbx3ioNxoVflA=;
        b=MKlZlUa9MH0zDh6LMeyUVBAOXw9VhIJ7N/T7X3H3F6QRdYEKJ2sjaYAADV6dF+yj4m
         pBSU+PF26Uv0sBT8M0TKb6/wRHqwZHgGjxILILDpPJheU+30Uw6V0FwgH5/TPP6RRuSw
         ULZA2f+gikIlk4uaX8bNZIimWeVakEuS+/GIwMZlO6WRvJqyfAdIE1Ebcjal11pfv5lK
         fPCfO5LMRfQHQAGf7zOprDVh4H76KZotLeGkolOvcOipXBcXdYiZU1W6dKa/oUxpWXqI
         zFkiHeDeR4IzbLqaAd3imC0CMCyGejUjTkNODxu0KW8BOl1LF7mBYHsuFYwKIie05bc9
         Iq8g==
X-Gm-Message-State: AOJu0YzFL9j35l1OP/O2Rvucm/SQwJtfE+XbkV+zuGYQezGxY0+SvLAB
	b8Sn2r2qj01g3nZh4LafUzJ1AN4i3mNBg6x7N9AmHGizKzRBAT1QWyy8bLURFLOCnAQaLw==
X-Gm-Gg: ATEYQzyP5zH8ar867iq9ssr4vlfP34oW5jO2v8TLejreU8NHL+DHzhE0huN8vDN7dQj
	1N6Do/4U+SXrDVLR1S1sYii0TivxpU1oTki2bYFyOk9Kk/3dIDpWVRKHwrMZyMwjpKst2dQnqBl
	1nDSSbT8KGfyh+36F8DoTPmeqg13w615CvwXxMJE7gGY30QU7jFPWEy5rJOmJAZ6hCJOYoMjbKD
	WQM0GY1D7B1TleBR+9JVaOS46KFHWttq7aQDHhBetDikMirrNDbrB6Udq4cyV5gBGFjDS6Wm+mF
	LLlnsbGAVk2UHh1mAkkPAqzxUWlwkzhthbiDhkt1LsjwEu4ikvEEN0NAP8qscLxKn/grLwnl63f
	jn7n1VKL8KtKBoSQ9eMb3+4H+DbfPenjTZGfQ/pZCIBlo0xtn41XPCasI+IaT2CouCKXvr8qqDk
	Tsaz0dBu0DCneaDE2C3X4+BeiDu+cXHjHIBBgWVNp7fOjHkqHdT6JQGEzqgQuqq+zXNayut3Swl
	9VeZ++w7rqBlPOnleDuGg1y6lrwCilhoao1JQlJuxlXb3tgpe9l6hMZ6EJC
X-Received: by 2002:a05:693c:6201:b0:2c1:2999:498e with SMTP id 5a478bee46e88-2c129995ffemr1136953eec.18.1774199718154;
        Sun, 22 Mar 2026 10:15:18 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b353fb4sm11323411eec.31.2026.03.22.10.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:15:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] ntopng: Upgrade to 6.6
Date: Sun, 22 Mar 2026 10:15:15 -0700
Message-ID: <20260322171515.1955265-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 17:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125486

Fix build with Lua 5.5
Add fixes to build with ndpi 5.0

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Follow-rrd-post-1.8-change.patch     |  32 ---
 ...kefile.in-don-t-use-the-internal-lua.patch |  36 +--
 ...utogen.sh-generate-configure.ac-only.patch |  36 ---
 ...Allow-dynamic-linking-against-ndpi-3.patch |  51 ++--
 ...-configure.ac.in-fix-configure-error.patch |  42 ---
 ...nfigure.ac.in-fix-host-contamination.patch | 188 +++++++++++--
 ...figure.ac.in-not-check-clang-on-host.patch |  44 ----
 ...a-5.5-API-signature-for-lua_newstate.patch | 247 ++++++++++++++++++
 .../recipes-support/ntopng/ndpi_5.0.bb        |   4 +
 .../ntopng/{ntopng_5.2.1.bb => ntopng_6.6.bb} |  19 +-
 10 files changed, 478 insertions(+), 221 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch
 delete mode 100644 meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
 delete mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-configure-error.patch
 delete mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-not-check-clang-on-host.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch
 rename meta-networking/recipes-support/ntopng/{ntopng_5.2.1.bb => ntopng_6.6.bb} (76%)

diff --git a/meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch b/meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch
deleted file mode 100644
index eefd4e1ab2..0000000000
--- a/meta-networking/recipes-support/ntopng/files/0001-Follow-rrd-post-1.8-change.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a3bd9efe78f9c381f19b99c8ceb7f52b4c2a52b8 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Date: Wed, 5 Jun 2024 09:40:17 +0300
-Subject: [PATCH] Follow rrd post-1.8 change
-
-Git version of rrdtool has changed rrd_tune argument from char pointer
-to const char pointer. GCC 14 is more strict regarding the pointer
-constantness checks and errors out in such a case. Update rrd_tune
-invokation.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Upstream-Status: Pending [CLA is not signed on our side]
----
- src/LuaEngineNtop.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/LuaEngineNtop.cpp b/src/LuaEngineNtop.cpp
-index bd2de79e3021..dd00f1608f78 100644
---- a/src/LuaEngineNtop.cpp
-+++ b/src/LuaEngineNtop.cpp
-@@ -5427,7 +5427,7 @@ static int ntop_rrd_tune(lua_State* vm) {
-   filename = argv[1];
-
-   reset_rrd_state();
--  status = rrd_tune(argc, (char**)argv);
-+  status = rrd_tune(argc, (const char**)argv);
-
-   if(status != 0) {
-     char *err = rrd_get_error();
---
-2.39.2
-
diff --git a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
index bb5bcfbd63..402d679a90 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
@@ -14,26 +14,32 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  Makefile.in | 2 --
  1 file changed, 2 deletions(-)

-diff --git a/Makefile.in b/Makefile.in
-index d737e74..a611b16 100755
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -36,7 +36,6 @@ MONGOOSE_INC=-I$(MONGOOSE_HOME)
+@@ -31,8 +31,6 @@ MONGOOSE_INC=-I$(MONGOOSE_HOME)
+
  LUA_PLATFORM=generic
- LUA_HOME=${PWD}/third-party/lua-5.4.3
- LUA_INC=-I$(LUA_HOME)/src
+ LUA_HOME=${PWD}/third-party/lua-5.4.6
+-LUA_INC=-I$(LUA_HOME)/src
 -LUA_LIB=$(LUA_HOME)/src/liblua.a

- ifeq ($(OS),Linux)
- 	LUA_PLATFORM=linux
-@@ -102,7 +101,6 @@ RPM_PKG = $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(PLATFORM).rpm
- RPM_DATA_PKG = $(TARGET)-data-$(NTOPNG_VERSION)-@REVISION@.noarch.rpm
+ HAVE_CLICKHOUSE=@HAVE_CLICKHOUSE@
+ CLICKHOUSE_HOME=
+@@ -52,7 +50,7 @@ else ifeq ($(OS),Darwin)
+ 	LUA_PLATFORM=macosx
+ else ifeq ($(OS), $(filter $(OS), FreeBSD))
+ 	LUA_PLATFORM=freebsd
+-	LUA_LIB=/usr/local/lib/liblua-5.3.a
++	LUA_LIB=liblua.a
+ endif
+
  ######
+@@ -138,7 +136,7 @@ HEADERS = $(wildcard include/*.h) $(wild
+ INC     = $(wildcard src/*.inc)
+ OBJECTS_NO_MAIN := $(filter-out src/main.o,$(OBJECTS))

--LIB_TARGETS = $(LUA_LIB)
+-TEST_FILES = $(wildcard tests/src/*.cpp)
++TEST_FILES = $(wildcard tests/src/*.cpp)
+ TEST_HEADERS = $(wildcard tests/include/*.h)

- ifneq ($(HAS_ZEROMQ), 0)
- LIB_TARGETS += $(ZEROMQ_LIB)
---
-2.25.1
-
+ %.o: %.c $(HEADERS) $(INC) Makefile
diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
deleted file mode 100644
index 8d62147b9e..0000000000
--- a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-generate-configure.ac-only.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 22f0bec462763f1b0b92daa33133e274d3b45f4f Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 5 Nov 2020 00:05:21 -0800
-Subject: [PATCH] autogen.sh: generate configure.ac only
-
-The autogen.sh should only generate configure.ac and the
-logic used to generate configure script should follow the
-autotools.bbclass in oe. Otherwise there may comes below
-do_configure error:
- | checking whether we are cross compiling... configure: error: in `/path/tmp/work/core2-64-poky-linux/ndpi/3.4-r0/git':
- | configure: error: cannot run C compiled programs.
- | If you meant to cross compile, use `--host'.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- autogen.sh | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/autogen.sh b/autogen.sh
-index 73f8d0ebe..15ff0aa84 100755
---- a/autogen.sh
-+++ b/autogen.sh
-@@ -73,8 +73,3 @@ cat configure.seed | sed \
-     > configure.ac
-
- rm -f config.h config.h.in *~ #*
--
--echo "Wait please..."
--autoreconf -if
--echo ""
--echo "Now run ./configure"
---
-2.17.1
-
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
index c645110f22..b0cdcd8401 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
@@ -17,23 +17,42 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac.in | 6 ++----
  1 file changed, 2 insertions(+), 4 deletions(-)

-diff --git a/configure.ac.in b/configure.ac.in
-index 7f4c0f893..c3299fda2 100644
 --- a/configure.ac.in
 +++ b/configure.ac.in
-@@ -193,10 +193,8 @@ if test -d /usr/local/include/ndpi ; then :
+@@ -235,8 +235,9 @@ AC_ARG_WITH(ndpi-includes,
+       NDPI_CUST_INC="-I$withval -I$withval/../lib/third_party/include"
+    ])
+
+-NDPI_INC=`echo $NDPI_CFLAGS | sed -e "s/[ ]*$//"`
+-NDPI_LIB=
++NDPI_INC="$NDPI_CFLAGS"
++NDPI_LIB="$NDPI_LIBS"
++
+ NDPI_LIB_DEP=
+
+ AS_VAR_IF(with_dynamic_ndpi, no, [
+@@ -267,11 +268,6 @@ AC_MSG_CHECKING(for nDPI source)
+       fi
+ ])
+
+-AS_VAR_IF(with_dynamic_ndpi, yes, [
+-      NDPI_LIB="-lndpi"
+-      NDPI_LIB_DEP=$NDPI_LIB
+-])
+-
+ if test ! -z "$NDPI_CUST_INC" ; then :
+   NDPI_INC=$NDPI_CUST_INC
+ fi
+@@ -280,12 +276,6 @@ if test ! -z "$NDPI_CUST_LIB" ; then :
+   NDPI_LIB=$NDPI_CUST_LIB
  fi

- PKG_CHECK_MODULES([NDPI], [libndpi >= 2.0], [
--   NDPI_INC=`echo $NDPI_CFLAGS | sed -e "s/[ ]*$//"`
--   # Use static libndpi library as building against the dynamic library fails
--   NDPI_LIB="-Wl,-Bstatic $NDPI_LIBS -Wl,-Bdynamic"
--   #NDPI_LIB="$NDPI_LIBS"
-+   NDPI_INC="$NDPI_CFLAGS"
-+   NDPI_LIB="$NDPI_LIBS"
-    NDPI_LIB_DEP=
-    ], [
-       AC_MSG_CHECKING(for nDPI source)
---
-2.35.1
-
+-if test -z "$NDPI_LIB" ; then :
+-  echo "Could not find nDPI"
+-  echo "Please do cd ..; git clone https://github.com/ntop/nDPI.git; cd nDPI; ./autogen.sh; ${MAKE}; cd ../ntopng"
+-  echo "and try again"
+-  exit 1
+-fi
+ dnl finish: nDPI handling
+
+ AC_ARG_WITH(json-c-static,
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-configure-error.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-configure-error.patch
deleted file mode 100644
index d4908e3227..0000000000
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-configure-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 29797dd037009d38e4976249ed21b2076240751e Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 4 Nov 2020 04:36:46 +0000
-Subject: [PATCH] configure.ac.in: fix configure error
-
-fix the below error:
-configure: error: cannot run test program while cross compiling
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- configure.ac.in | 13 +------------
- 1 file changed, 1 insertion(+), 12 deletions(-)
-
-diff --git a/configure.ac.in b/configure.ac.in
-index a321f9bbf..03f9a31b0 100644
---- a/configure.ac.in
-+++ b/configure.ac.in
-@@ -642,18 +642,7 @@ if test x$radcli = xtrue; then
-   fi
- fi
-
--AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_supported], [
--  AC_TRY_RUN([
--  #include <pthread.h>
--
--  int main() {
--    pthread_rwlock_t t;
--    return 0;
--  }
--]
--, [my_cv_rw_locks_supported=yes], [my_cv_rw_locks_supported=no])
--]
--)
-+AC_CACHE_CHECK([if pthread rwlocks are supported], [my_cv_rw_locks_supported])
-
- if test "$my_cv_rw_locks_supported" = yes; then
-   AC_DEFINE_UNQUOTED(HAVE_RW_LOCK, 1, [pthread rwlocks supported])
---
-2.26.2
-
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
index 5e1440b3d6..e3c0534da8 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
@@ -14,17 +14,95 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  configure.ac.in | 43 +++----------------------------------------
  1 file changed, 3 insertions(+), 40 deletions(-)

-diff --git a/configure.ac.in b/configure.ac.in
-index 1d6380c..beffc6c 100644
 --- a/configure.ac.in
 +++ b/configure.ac.in
-@@ -167,31 +167,6 @@ fi
- #
- REVISION=`git log --pretty=oneline | wc -l`
+@@ -83,30 +83,6 @@ if test "$with_dynamic_ndpi" = "yes"; th
+   AC_DEFINE([HAVE_DYNAMIC_NDPI], [1], [Define if using dynamic linking with nDPI])
+ fi
+
+-dnl> CLANG_STDLIB="-stdlib=libc++"
+-
+-dnl> On Ubuntu do sudo apt-get install -y clang-14  clang-tools-14
+-if test "x$USE_CLANG" = xyes; then
+-    if test $SYSTEM = "Darwin"; then
+-        CC=clang
+-        CXX="clang++ -fno-color-diagnostics -fPIE -stdlib=libc++"
+-    else
+-       if test -x "/usr/bin/clang-10"; then
+-           CLANG_VERSION=10
+-       elif test -x "/usr/bin/clang-13"; then
+-           CLANG_VERSION=13
+-       elif test -x "/usr/bin/clang-14"; then
+-           CLANG_VERSION=14
+-       else
+-           echo "Could not find clang. Please install clang-14 clang-tools-14"
+-           exit 1
+-       fi
+-
+-       CC=clang-$CLANG_VERSION
+-       CXX="clang++-$CLANG_VERSION -fno-color-diagnostics -fPIE $CLANG_STDLIB"
+-    fi
+-fi
+-
+ CFLAGS="${CFLAGS} -I${HERE} -I${HERE}/include"
+ CXXFLAGS="${CXXFLAGS} -I${HERE} -I${HERE}/include"
+
+@@ -122,7 +98,7 @@ fi
+
+ if test -f /proc/device-tree/model; then
+   IS_RASPBERRY=`cat /proc/device-tree/model | grep -a -e "Orange Pi" -e Raspberry | wc -l`
+-
++
+   if test "$IS_RASPBERRY" = "1"; then
+     CFLAGS="${CFLAGS} -DHAVE_EMBEDDED_SUPPORT"
+     CXXFLAGS="${CXXFLAGS} -DHAVE_EMBEDDED_SUPPORT"
+@@ -158,39 +134,6 @@ MAKE=make
+ BIN_PATH=/usr/bin
+ LIBPCAP=-lpcap
+
+-if test $SYSTEM = "FreeBSD" || test $SYSTEM = "Darwin"; then
+-   CFLAGS="${CFLAGS} -I/usr/local/include"
+-   LDFLAGS="${LDFLAGS} -L/usr/local/lib"
+-
+-   dnl> https://github.com/google/sanitizers/wiki/AddressSanitizerFlags
+-   CC=clang
+-   CXX="clang++ -fpie -fno-color-diagnostics $CLANG_STDLIB"
+-   if test $SYSTEM = "FreeBSD"; then
+-    MAKE=gmake
+-    BIN_PATH=/usr/local/bin
+-   else
+-     dnl> Adds /opt if MacPorts is installed
+-     if [ test -f /opt/local/bin/port ]; then
+-       CFLAGS="${CFLAGS} -I/opt/local/include"
+-       LDFLAGS="${LDFLAGS} -L/opt/local/lib"
+-     fi
+-   fi
+-   dnl> CXX=clang++ -fsanitize=address -fsanitize-address-use-after-scope
+-   OSXV=`sw_vers -productVersion`
+-   if test $SYSTEM = "Darwin"; then
+-     OS="macOS $OSXV"
+-   else
+-     OS=`uname -or | cut -d '-' -f 1`
+-   fi
+-   if test $MACHINE = "x86_64"; then
+-      LDFLAGS="${LDFLAGS} -L/usr/local/opt/ntopng"
+-      RES=`g++ -Wall -fno-color-diagnostics Prefs.cpp 2>&1 | grep "unrecognized command line option "|wc -l`
+-      if test $RES -eq 0; then
+-            CFLAGS="-fno-color-diagnostics $CFLAGS"
+-      fi
+-   fi
+-fi
+-
+ dnl> Remove spaces
+ OS="${OS#"${OS%%[![:space:]]*}"}"
+
+@@ -237,31 +180,6 @@ if test "${with_nedge+set}" = set; then
+   LIBS="${LIBS} -lnetfilter_queue -lnfnetlink -lnetfilter_conntrack"
+ fi

 -if test -d "/usr/local/include"; then
 -  CFLAGS="${CFLAGS} -I/usr/local/include"
--  CPPFLAGS="${CPPFLAGS} -I/usr/local/include"
+-  CXXFLAGS="${CXXFLAGS} -I/usr/local/include"
 -fi
 -
 -if test -d "/usr/local/lib"; then
@@ -33,7 +111,7 @@ index 1d6380c..beffc6c 100644
 -
 -if test -d /opt/local/include; then :
 -  CFLAGS="${CFLAGS} -I/opt/local/include"
--  CPPFLAGS="${CPPFLAGS} -I/opt/local/include"
+-  CXXFLAGS="${CXXFLAGS} -I/opt/local/include"
 -fi
 -
 -if test -d /opt/local/lib; then :
@@ -42,15 +120,26 @@ index 1d6380c..beffc6c 100644
 -
 -if [ test -f /usr/bin/lsb_release ]; then
 -  CODENAME=`/usr/bin/lsb_release -c|cut -f 2`
--  if [[ $CODENAME == "wheezy" ]]; then :
--    CPPFLAGS="${CPPFLAGS} -DOLD_NETFILTER_INTERFACE=1"
+-  if test $CODENAME = "wheezy" ; then
+-    CXXFLAGS="${CXXFLAGS} -DOLD_NETFILTER_INTERFACE=1"
 -  fi
 -fi
 -
- SHORT_MACHINE=`uname -m | cut -b1-3`
+ if test -d "pro"; then
+   NTOPCLOUD_LIB=
+   NTOPCLOUD_HOME="../ntopcloud"
+@@ -317,10 +235,6 @@ AC_ARG_WITH(ndpi-includes,
+       NDPI_CUST_INC="-I$withval -I$withval/../lib/third_party/include"
+    ])

- GIT_RELEASE="@GIT_RELEASE@"
-@@ -300,23 +275,11 @@ fi
+-if test -d /usr/local/include/ndpi ; then :
+-   echo "WARNING: /usr/local/include/ndpi is present and might lead to compile errors"
+-fi
+-
+ NDPI_INC=`echo $NDPI_CFLAGS | sed -e "s/[ ]*$//"`
+ NDPI_LIB=
+ NDPI_LIB_DEP=
+@@ -387,7 +301,7 @@ fi
  pkg-config --exists libssl
  if test "$?" -ne 1; then
    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
@@ -58,25 +147,70 @@ index 1d6380c..beffc6c 100644
 +  SSL_INC="`pkg-config --cflags libssl`"
    SSL_LIB="`pkg-config --libs libssl` -lssl -lcrypto"
  else
--  dnl Workaround for MacOS Brew
--  if test -d "/usr/local/opt/openssl/lib"; then
--    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
--    SSL_INC="-I/usr/local/opt/openssl/include"
--    SSL_LIB="-L/usr/local/opt/openssl/lib -lssl -lcrypto"
--  dnl Workaround for FreeBSD
+   dnl Workaround for MacOS Brew
+@@ -408,10 +322,6 @@ else
+     SSL_INC="-I/usr/local/opt/openssl/include"
+     SSL_LIB="-L/usr/local/opt/openssl/lib -lssl -lcrypto"
+   dnl Workaround for FreeBSD
 -  elif test -f "/usr/lib/libssl.so"; then
 -    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
 -    SSL_INC="-I/usr/include"
 -    SSL_LIB="-L/usr/lib -lssl -lcrypto"
--  else
--    echo "Please install openssl-dev(el) package prerequisite"
--    exit -1
+   else
+     echo "Please install openssl-dev(el) package prerequisite"
+     exit -1
+@@ -433,13 +343,6 @@ fi
+ AC_MSG_CHECKING(for ntopng professional edition)
+
+ REDIS_SERVICE="redis.service"
+-if [ test -f /usr/bin/lsb_release ]; then
+-  UBUNTU_RELEASE=`lsb_release -r|cut -f 2`
+-  UBUNTU_SUB_RELEASE=`echo $UBUNTU_RELEASE|cut -f 1 -d '.'`
+-  if test "$UBUNTU_SUB_RELEASE" = "8" || test "$UBUNTU_SUB_RELEASE" = "10"; then
+-    REDIS_SERVICE="redis-server.service"
 -  fi
-+  echo "Please install openssl-dev(el) package prerequisite"
-+  exit -1
+-fi
+
+ SERVICE_ALIAS=
+ SERVICE_REQUIRES=
+@@ -497,7 +400,7 @@ fi
+ echo "Using clickhouse-cpp stored at ${CLICKHOUSE_HOME}"
+
+ dnl> fi dnl> test $SYSTEM = "Linux"
+-
++
+ AC_DEFINE_UNQUOTED(NTOPNG_PRO_GIT_RELEASE, "r${PRO_GIT_RELEASE}", [ntopng professional release])
+ AC_DEFINE_UNQUOTED(NTOPNG_PRO_GIT_DATE, "${PRO_GIT_DATE}", [ntopng professional date])
+ DUMMY=`cd ./pro; ${MAKE} build`
+@@ -531,21 +434,7 @@ if test -f ".git/index"; then
  fi

- AC_CHECK_LIB([gcrypt], [gcry_cipher_checktag], [LIBS="${LIBS} -lgcrypt"])
---
-2.25.1
-
+ if test $SYSTEM = "Linux"; then
+-  if [ test -f /usr/bin/lsb_release ]; then
+-      OSNAME=`/usr/bin/lsb_release -d|cut -d ':' -f 2| sed -e 's/^[[[:space:]]]*//'`
+-      OS="$OSNAME"
+-  else
+-    if test -f /etc/debian_version; then
+-       DEBIAN_VERSION=`cat /etc/debian_version`
+-       OSNAME="Debian $DEBIAN_VERSION"
+-    else
+-        if test -f /etc/redhat-release; then
+-          OS=`cat /etc/redhat-release | cut -d '(' -f 1 | awk '{$1=$1};1'`
+-        else
+-          OS=`./config.guess`
+-        fi
+-   fi
+-  fi
++  OS=`./config.guess`
+ else
+ dnl> wget -O config.guess 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
+   if test $SYSTEM = "FreeBSD"; then
+@@ -575,7 +464,7 @@ AS_VAR_IF(with_hiredis, yes, [
+     else
+       pkg-config --exists hiredis
+       if test "$?" -ne 1; then
+-      HIREDIS_INC="`pkg-config --cflags hiredis` -I/usr/include/hiredis"
++      HIREDIS_INC="`pkg-config --cflags hiredis`"
+       if test $SYSTEM = "FreeBSD" && $FREEBSD_VERSION != "15"; then
+ 	dnl> Note: on freebsd 15 .a is not installed
+         HIREDIS_LIB="/usr/local/lib/libhiredis.a"
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-not-check-clang-on-host.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-not-check-clang-on-host.patch
deleted file mode 100644
index ffb106723c..0000000000
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-not-check-clang-on-host.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5867be19e53a3cc09730b83282c83bdd26147cc3 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 9 Nov 2020 04:05:25 +0000
-Subject: [PATCH] configure.ac.in: not check clang on host
-
-Don't check clang on host to avoid host contamination.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- configure.ac.in | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/configure.ac.in b/configure.ac.in
-index 55bd49678..94bc0bc48 100644
---- a/configure.ac.in
-+++ b/configure.ac.in
-@@ -90,22 +90,6 @@ if test $SYSTEM = "FreeBSD" || test $SYSTEM = "Darwin"; then
-             CFLAGS="-fno-color-diagnostics $CFLAGS"
-       fi
-    fi
--else
--  if test $SYSTEM = "Linux"; then
--    if [ test -f /usr/bin/clang++ ]; then
--      CC=clang
--      CXX=clang++
--      AC_MSG_RESULT(Using clang++ compiler)
--    fi
--
--    if [ test -f /etc/redhat-release ]; then
--      OS=`cat /etc/redhat-release`
--    else
--      if [ test -f /usr/bin/lsb_release ]; then
--        OS=`/usr/bin/lsb_release -d|cut -d ':' -f 2`
--      fi
--    fi
--  fi
- fi
-
- dnl> Remove spaces
---
-2.17.1
-
diff --git a/meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch b/meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch
new file mode 100644
index 0000000000..cb842ed377
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch
@@ -0,0 +1,247 @@
+From 6c4806436c3214e32487d05ce099ac86b0b2519c Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 22 Mar 2026 10:08:01 -0700
+Subject: [PATCH] luaengine: Use lua 5.5 API signature for lua_newstate
+
+in Lua 5.5 lua_newstate gained a third argument,
+
+lua_State *lua_newstate(lua_Alloc f, void *ud, unsigned int seed);
+
+The 5.5 manual says that third argument, seed,
+is "a seed for the hashing of strings," and the 5.5 incompatibilities
+section explicitly calls out that lua_newstate now has
+a third parameter.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/LuaEngine.cpp | 64 +++++++++++++++++++++++------------------------
+ 1 file changed, 32 insertions(+), 32 deletions(-)
+
+diff --git a/src/LuaEngine.cpp b/src/LuaEngine.cpp
+index 36de6e368..0c44b77fe 100644
+--- a/src/LuaEngine.cpp
++++ b/src/LuaEngine.cpp
+@@ -50,7 +50,7 @@ extern luaL_Reg *ntop_cloud_reg;
+ NtopngLuaContext *getUserdata(struct lua_State *vm) {
+   if (vm) {
+     NtopngLuaContext *userdata;
+-
++
+     lua_getglobal(vm, "userdata");
+     userdata = (NtopngLuaContext *)lua_touserdata(vm, lua_gettop(vm));
+     lua_pop(vm, 1);  // undo the push done by lua_getglobal
+@@ -105,7 +105,7 @@ static u_int32_t upper_power_of_two(u_int32_t n) {
+   n |= n >> 8;
+   n |= n >> 16;
+   n++;
+-
++
+   return n;
+ }
+
+@@ -129,12 +129,12 @@ static void *l_alloc(void *ud, void *ptr, size_t old_size, size_t new_size) {
+       new_size = 32;
+     else
+       new_size = upper_power_of_two(new_size);
+-
++
+ #if 0
+     ntop->getTrace()->traceEvent(TRACE_NORMAL,
+ 				 "[Lua realloc] new size: %d ptr %p / tot: %d",
+ 				 new_size, ptr, le->getMemUsed());
+-#endif
++#endif
+
+     return(realloc(ptr, new_size));
+   }
+@@ -146,15 +146,15 @@ LuaEngine::LuaEngine() {
+   std::bad_alloc bax;
+
+   // if(trace_new_delete) ntop->getTrace()->traceEvent(TRACE_NORMAL, "[new] %s", __FILE__);
+-
++
+   ntop->incNumLuaVMs();
+   start_epoch= (u_int32_t)time(NULL);
+-
++
+   loaded_script_path = NULL;
+   is_system_vm = false;
+   mem_used = 0;
+-
+-  L = lua_newstate(l_alloc, this);
++
++  L = lua_newstate(l_alloc, this, luaL_makeseed(NULL));
+
+   if (!L) {
+     ntop->getTrace()->traceEvent(TRACE_ERROR, "Unable to create a new Lua state.");
+@@ -177,17 +177,17 @@ LuaEngine::LuaEngine() {
+
+ LuaEngine::~LuaEngine() {
+   // if(trace_new_delete) ntop->getTrace()->traceEvent(TRACE_NORMAL, "[delete] %s", __FILE__);
+-
++
+   if (L) {
+     lua_settop(L, 0);
+
+ #ifdef DUMP_STACK
+     stackDump(L);
+ #endif
+-
++
+     if(lua_context)
+-      delete lua_context;
+-
++      delete lua_context;
++
+     ntop->decNumLuaVMs();
+
+ #ifdef TRACE_VM_ENGINES
+@@ -333,7 +333,7 @@ static int ntop_lua_http_print(lua_State *vm) {
+           mg_printf(conn, "%s", key);
+           // PrintTable(vm);
+         }
+-
++
+         lua_pop(vm, 1);
+       }
+     } break;
+@@ -382,7 +382,7 @@ int ntop_lua_cli_print(lua_State *vm) {
+ int ntop_lua_cloud_print(lua_State *vm) {
+   int t;
+   LuaEngine *engine = getLuaVMUserdata(vm, engine);
+-
++
+   ntop->getTrace()->traceEvent(TRACE_DEBUG, "%s() called", __FUNCTION__);
+
+   switch (t = lua_type(vm, 1)) {
+@@ -434,11 +434,11 @@ static int ntop_lua_require(lua_State *L) {
+       || (script_name = (char *)lua_tostring(L, 1)) == NULL)
+     return 0;
+
+-  if(engine->require(std::string(script_name))) {
++  if(engine->require(std::string(script_name))) {
+     ntop->getTrace()->traceEvent(TRACE_NORMAL, "Circular dependency found %s\n", script_name);
+     // return(0); /* Already loaded */
+   }
+-
++
+   ntop->getTrace()->traceEvent(TRACE_DEBUG, "%s(%s)", __FUNCTION__, script_name);
+
+   lua_getglobal(L, "package");
+@@ -451,7 +451,7 @@ static int ntop_lua_require(lua_State *L) {
+     /* Example: package.path = dirs.installdir .. "/scripts/lua/modules/?.lua;"
+      * .. package.path */
+     unsigned found = parsed.find_last_of("?");
+-
++
+     if (found) {
+       string s = parsed.substr(0, found) + script_name + ".lua";
+       size_t first_dot = s.find("."), last_dot = s.rfind(".");
+@@ -534,7 +534,7 @@ void LuaEngine::lua_register_classes(lua_State *L, LuaEngineMode mode) {
+   if (!L) return;
+
+   getLuaVMContext(L)->engine = this;
+-
++
+   /* ntop add-ons */
+   luaRegister(L, "interface", ntop_interface_reg);
+   luaRegister(L, "ntop",      ntop_reg);
+@@ -544,23 +544,23 @@ void LuaEngine::lua_register_classes(lua_State *L, LuaEngineMode mode) {
+ #ifdef HAVE_NTOP_CLOUD
+   luaRegister(L, "cloud",     ntop_cloud_reg);
+ #endif
+-
++
+   switch(mode) {
+   case lua_engine_mode_http:
+     /* Overload the standard Lua print() with ntop_lua_http_print that dumps
+      * data on HTTP server */
+     lua_register(L, "print", ntop_lua_http_print);
+     break;
+-
++
+   case lua_engine_mode_callback:
+     lua_register(L, "print", ntop_lua_cli_print);
+     break;
+
+   case lua_engine_mode_cloud:
+-    lua_register(L, "print", ntop_lua_cloud_print);
++    lua_register(L, "print", ntop_lua_cloud_print);
+     break;
+   }
+-
++
+ #if defined(NTOPNG_PRO) || defined(HAVE_NEDGE)
+   if (ntop->getPro()->has_valid_license()) {
+     lua_register(L, "ntopRequire", ntop_lua_require);
+@@ -698,7 +698,7 @@ int LuaEngine::run_loaded_script() {
+
+       if(err) {
+         ntop->getTrace()->traceEvent(TRACE_WARNING, "%s [%s]", err, loaded_script_path);
+-        ntop->getRedis()->lpush(ALERT_TRACE_ERRORS, err, 50 /* No Trim */);
++        ntop->getRedis()->lpush(ALERT_TRACE_ERRORS, err, 50 /* No Trim */);
+       }
+     }
+
+@@ -710,7 +710,7 @@ int LuaEngine::run_loaded_script() {
+ #ifndef HAS_LUAJIT
+   lua_gc(L, LUA_GCCOLLECT); /* Run garbage collector */
+ #endif
+-
++
+   return (rv);
+ }
+
+@@ -1041,10 +1041,10 @@ void build_redirect(const char *url, const char *query_string,
+     Inside ntopng
+     - we cannot redirect outside of the application
+     - no paramenters or anything else should be allowed
+-
++
+     hence we implement a lighweighted URL checker that
+   */
+-
++
+   if((url[0] != '/') || strchr(url, '%')) {
+     ntop->getTrace()->traceEvent(TRACE_WARNING, "Invalid redirect URL: %s", url);
+     url = "/"; /* Let's redirect to the root page */
+@@ -1265,7 +1265,7 @@ int LuaEngine::handle_script_request(struct mg_connection *conn,
+           lua_newtable(L);
+
+ 	  /* This payload is NOT parsed, checked or verified against attacks */
+-          lua_push_str_table_entry(L, "payload", post_data);
++          lua_push_str_table_entry(L, "payload", post_data);
+           lua_setglobal(L, "_POST");
+         }
+
+@@ -1502,7 +1502,7 @@ int LuaEngine::handle_script_request(struct mg_connection *conn,
+
+     ntop->getTrace()->traceEvent(TRACE_WARNING, "Script failure [%s][%s]",
+                                  script_path, err ? err : "Unknown error");
+-
++
+     return (redirect_to_error_page(conn, request_info, "internal_error",
+                                    script_path, (char *)err));
+   }
+@@ -1584,16 +1584,16 @@ Host* LuaEngine::getHost() {
+ NetworkInterface* LuaEngine::getNetworkInterface() {
+   return (getLuaVMContext(L)->iface);
+ }
+-
++
+ /* ****************************************** */
+
+-bool LuaEngine::require(std::string name) {
++bool LuaEngine::require(std::string name) {
+   std::set<std::string>::iterator it = require_list.find(name);
+
+   if(it != require_list.end())
+     return(true);
+-
++
+   require_list.insert(name);
+   return(false);
+ }
+-
++
diff --git a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
index e2040eda18..6eadf8ba62 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
@@ -21,6 +21,10 @@ do_configure:prepend() {
     (cd ${S} && ${S}/autogen.sh)
 }

+do_install:append() {
+    install -Dm 0644 ${B}/src/include/ndpi_define.h ${D}${includedir}/ndpi/ndpi_define.h
+}
+
 EXTRA_OEMAKE = " \
     libdir=${libdir} \
 "
diff --git a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
similarity index 76%
rename from meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
rename to meta-networking/recipes-support/ntopng/ntopng_6.6.bb
index 014706893a..3c039781d8 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_5.2.1.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
@@ -11,27 +11,28 @@ RDEPENDS:${PN} = "bash redis"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

-SRCREV = "d3ce78948e8d81dc1e2c5298ce556f9f2247aac1"
-SRC_URI = "git://github.com/ntop/ntopng.git;protocol=https;branch=5.2-stable \
-           file://0001-configure.ac.in-fix-configure-error.patch \
+SRCREV = "d3a1229954dd783af06c9fd2dcd9ce926826a228"
+SRC_URI = "gitsm://github.com/ntop/ntopng;protocol=https;branch=6.6-stable \
            file://0001-configure.ac.in-fix-host-contamination.patch \
            file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
-           file://0001-autogen.sh-generate-configure.ac-only.patch \
-           file://0001-configure.ac.in-not-check-clang-on-host.patch \
            file://0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch \
-           file://0001-Follow-rrd-post-1.8-change.patch \
+           file://0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch \
            file://ntopng.service \
            "

-
 # don't use the lua under thirdparty as it supports cross compiling badly
-export LUA_LIB = "${STAGING_LIBDIR}/liblua.a"
-
+export LUA_LIB = "-llua"
+export LUA_INC = "-I${STAGING_INCDIR}"
+export NDPI_CUST_INC = "-I${STAGING_INCDIR}/ndpi"
+export NDPI_CUST_LIB = "-lndpi"
 LDFLAGS:append:mipsarch = " -latomic"
 LDFLAGS:append:powerpc = " -latomic"
 LDFLAGS:append:riscv32 = " -latomic"
+
 inherit autotools-brokensep gettext pkgconfig systemd

+EXTRA_OECONF += "--with-dynamic-ndpi"
+
 do_install:append() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${UNPACKDIR}/ntopng.service ${D}${systemd_unitdir}/system

