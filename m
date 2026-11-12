Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8141.1794465777543615607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JN4MegKr;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so3099723a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465777; x=1795070577; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nyG1SV39VW4hAvKQDS6zKEp0wPylaReU3k+C8F44eiA=;
        b=JN4MegKrUF9kZP7Cik6IrAMuvrnsvVm+4z6Q+hSjyenm9Bt08BZ2TObSYt/NDaIIWA
         tTLswVxCiWlfbDsUxvxtJHfQ9dj16gO9CYsnK4xvrnncOHM6UkXiS7AYtV++hs05FfTt
         eDO50QygqwjKAJGwR3pSwsoreGm0SzBul02er6iXMeFwrQxsSoJ9fyYwC9Evvbka65Xk
         xlkaT1gHgyREK8TWgGy4Oc2FRX0u/8haCaeCghG1xyxyIxK+sfhoUj1R4KZnK1CoY6Wa
         TW1wKs3a8ZFtvvsIb3DaNb2KPcGpSTiHLkLwOUr0nh7V9zzYW7PeZ30iQtpf6JYLgzvS
         uUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465777; x=1795070577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nyG1SV39VW4hAvKQDS6zKEp0wPylaReU3k+C8F44eiA=;
        b=D3AQLsS9FC/Gixs0mhf+/CGWvP7br9F34tBRBbNSarylg5wasHMg22s+AiNQJh7RT1
         rh66oMRSzwkgtB5nGihMYDYbgV5kYxFAlgiH6DShn/TJJBTu+JVMsiFwroVZuIP74lpf
         7ZZwrwHpsseY7CKWMWGA8OLUOb8VAXJ3IdZbKGWsqHoGBViqDQj6AbDVrQ52tRr4J0jt
         StgqtTyS13aBvkqNwIAQWQkb6bru89xF3s7nIT7p4QChDaOp5Zt/dELhMzaxe7DJhFQA
         0B9cRMWxDVN0P/6qTOAa0qhzt90ABPaFUPuSt77CseUF1TKGSUXZBlUjhDAqyt0lrLKR
         mKTw==
X-Gm-Message-State: APuU4Z8X2VOeQ1X8AtDJmm7ZzErdPDLAC8Ksvq2zZQLPQ9hcWlbr7pFq
	jTqT6jOJ+wEPI2F6w/So4iKgwOQvGYyab7804qR3fY0PjwBw5p32C0DWAp1mNQ==
X-Gm-Gg: AYBFou0XUGq/+IClSxoVriM4ntk49htOsKuyb06whFGGmL+Hcy7cq7VHCUmOb02nw0V
	XRATMhih0tezeGQSDKfh3LpE76brvVxtbNZOZXbDdFCntz92kputcoZE5Tlj7xCnZEohyLo8G4D
	Zf0jTI81lm6b3YHROzFBi4pgKQIKkahVk9zjKpU2qOEOkhLuXIsFxIlgQB9BnRoaX15o6bfvoe9
	F63MDLjJujGAhbfugIgr9Yo6IxMvSimiPaCpsf3pRwlWcmOwTZN5X/JjYCt+8hfkHZSl+ej832e
	eprxxtDUQ7VGeT8UJyDEmWC86SkzplEBkL+iQfDt1ihVlQj4PlNDy8u5W787ml5SZ1VxwkyK20W
	05b1YSN99cZKH8xJDknU3xLqsDpowEnp36LHiJTxGu8eBQDFdfJGPpSWvAwIg/SQs1M0CaPaHGn
	l9Khm5aplGCrFDhMA3wDBseYMOr/z7eNsK9nxE/SjMGn+cMpiNL8vQYfRMq9sr2HZ1Vb9tKCDP2
	/Bziw56A7ARo3sf4e7jPUaYo0DWUqFnjz7QkAHpXFAEGz8gsMUcDEmwoOncumA1AGZUtUJQZg7t
	eag+33RcbDf1dOqxmJctHZo33HR34rPbwMeIx/bbCY4zEwyXUu6CYHEP5O7988esbznzAGxM/p8
	r4cBbC8hWdc6enmavYSJpazSnD4BXvwyKhs594ElPl3ukGSuBXoNh71vRUp6sIcA41XtDlPBmhu
	OFVfLaTZe6vgI8mee59qTN8Ou4KwSgpkxp4XReS4n/EoZvuC6KWcClyuEx5VBdqyC7s2qC4W8MZ
	hNk8EgFu/ioP9tWbzjnp67YwykA8NE3dzmIMUFr51mSTOSnWK/toVSgeCLJBMNFCnEAP9WuCZzq
	hEMYrYTqWy5g7epHgN13pZFE+w==
X-Received: by 2002:a17:90b:3ecd:b0:3b0:ae41:2706 with SMTP id 98e67ed59e1d1-3b182defae2mr4865230a91.4.1794465776717;
        Wed, 11 Nov 2026 22:42:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 22/24] ndpi, ntopng: upgrade to 6.0 and 7.0
Date: Wed, 11 Nov 2026 22:42:22 -0800
Message-ID: <20261112064225.2410019-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132191
Content-Type: text/plain; charset="utf-8"

ndpi: upgrade 5.0 -> 6.0
- Drop 0001-configure-Stop-embedding-pwd-at-configure-time.patch,
  NDPI_BASE_DIR is gone upstream.

ntopng: upgrade 6.6 -> 7.0
- Drop 0001-Fix-build-with-OpenSSL-4.0.patch, CVE-2026-84990.patch and
  CVE-2026-86090-CVE-2026-86091.patch, included in this release.
- Refresh the remaining patches.

They are upgraded together as ntopng 7.0 is built against nDPI 6.0.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...Stop-embedding-pwd-at-configure-time.patch | 55 ---------------
 ...Allow-dynamic-linking-against-ndpi-3.patch | 16 +++--
 ...nfigure.ac.in-fix-host-contamination.patch | 44 +++++++-----
 ...a-5.5-API-signature-for-lua_newstate.patch | 10 +--
 .../ntopng/files/CVE-2026-84990.patch         | 53 ---------------
 .../files/CVE-2026-86090-CVE-2026-86091.patch | 67 -------------------
 .../ntopng/{ndpi_5.0.bb => ndpi_6.0.bb}       |  5 +-
 .../0001-Fix-build-with-OpenSSL-4.0.patch     | 42 ------------
 .../ntopng/{ntopng_6.6.bb => ntopng_7.0.bb}   |  7 +-
 9 files changed, 45 insertions(+), 254 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch
 delete mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
 delete mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch
 rename meta-networking/recipes-support/ntopng/{ndpi_5.0.bb => ndpi_6.0.bb} (78%)
 delete mode 100644 meta-networking/recipes-support/ntopng/ntopng/0001-Fix-build-with-OpenSSL-4.0.patch
 rename meta-networking/recipes-support/ntopng/{ntopng_6.6.bb => ntopng_7.0.bb} (88%)

diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch b/meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch
deleted file mode 100644
index b8b0b04bf4..0000000000
--- a/meta-networking/recipes-support/ntopng/files/0001-configure-Stop-embedding-pwd-at-configure-time.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 25129a49bd220b4668e1df474b1b1549885aaced Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Mar 2026 09:47:12 -0700
-Subject: [PATCH] configure: Stop embedding pwd at configure time
-
-NDPI_BASE_DIR seems to unused and currently encodes hardcoded
-absolute paths in for it breaking repeoducible builds
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 10 ++--------
- 1 file changed, 2 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6984b38b5..1b9aae4df 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -353,7 +353,7 @@ case "$host" in
- 	 if test -f $PCAP_HOME/lib/libpfring.a; then :
-    	   PFRING_LIB=$PCAP_HOME/lib/libpfring.a
- 	 fi
--	 
-+
-          PCAP_LIB="$PCAP_HOME/libpcap/libpcap.a $PFRING_LIB $LIBNUMA `$PCAP_HOME/lib/pfring_config --libs`"
-          AC_CHECK_LIB([rt], [clock_gettime],   [PCAP_LIB="$PCAP_LIB -lrt"])
-          AC_CHECK_LIB([nl], [nl_handle_alloc], [PCAP_LIB="$PCAP_LIB -lnl"])
-@@ -438,7 +438,7 @@ PCRE2_ENABLED=0
- AC_ARG_WITH(pcre2, AS_HELP_STRING([--with-pcre2], [Enable nDPI build with libpcre2]))
- if test "${with_pcre2+set}" = set; then :
-   AC_CHECK_LIB(pcre2-8, pcre2_compile_8, AC_DEFINE_UNQUOTED(HAVE_PCRE2, 1, [libpcre2(-dev) is present]))
--  
-+
-  if test "x$ac_cv_lib_pcre2_8_pcre2_compile_8" = xyes; then :
-    ADDITIONAL_LIBS="${ADDITIONAL_LIBS} -lpcre2-8"
-    PCRE2_ENABLED=1
-@@ -456,11 +456,6 @@ if test "${with_maxminddb+set}" = set; then :
-   fi
- fi
- 
--dnl> Use absolute source directory for NDPI_BASE_DIR
--NDPI_ABS_SRCDIR="`cd ${srcdir} && pwd`"
--AC_DEFINE_UNQUOTED(NDPI_BASE_DIR, "${NDPI_ABS_SRCDIR}", [nDPI base directory])
--AC_SUBST(NDPI_BASE_DIR, "${NDPI_ABS_SRCDIR}")
--
- dnl> Curl
- dnl> AC_CHECK_LIB([curl], [curl_easy_perform])
- dnl> if test ${ac_cv_lib_curl_curl_easy_perform} = "no"; then
-@@ -515,5 +510,4 @@ AC_SUBST(DISABLE_NPCAP)
- AC_SUBST(EXE_SUFFIX)
- AC_SUBST(NDPI_CFLAGS)
- AC_SUBST(NDPI_LDFLAGS)
--AC_SUBST(NDPI_BASE_DIR)
- AC_OUTPUT
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
index b0cdcd8401..94ea1a81c2 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch
@@ -14,12 +14,14 @@ ipe-sysroot/usr/lib/libm.a(e_logf.o): in function `logf_ifunc_selector':
 Upstream-Status: Submitted [https://github.com/ntop/ntopng/pull/6318]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- configure.ac.in | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
+ configure.ac.in | 16 +++-------------
+ 1 file changed, 3 insertions(+), 13 deletions(-)
 
+diff --git a/configure.ac.in b/configure.ac.in
+index 9d284c4..1404ccb 100644
 --- a/configure.ac.in
 +++ b/configure.ac.in
-@@ -235,8 +235,9 @@ AC_ARG_WITH(ndpi-includes,
+@@ -232,8 +232,9 @@ AC_ARG_WITH(ndpi-includes,
        NDPI_CUST_INC="-I$withval -I$withval/../lib/third_party/include"
     ])
  
@@ -31,7 +33,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  NDPI_LIB_DEP=
  
  AS_VAR_IF(with_dynamic_ndpi, no, [
-@@ -267,11 +268,6 @@ AC_MSG_CHECKING(for nDPI source)
+@@ -264,11 +265,6 @@ AC_MSG_CHECKING(for nDPI source)
        fi
  ])
  
@@ -43,7 +45,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  if test ! -z "$NDPI_CUST_INC" ; then :
    NDPI_INC=$NDPI_CUST_INC
  fi
-@@ -280,12 +276,6 @@ if test ! -z "$NDPI_CUST_LIB" ; then :
+@@ -277,12 +273,6 @@ if test ! -z "$NDPI_CUST_LIB" ; then :
    NDPI_LIB=$NDPI_CUST_LIB
  fi
  
@@ -53,6 +55,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -  echo "and try again"
 -  exit 1
 -fi
- dnl finish: nDPI handling
  
- AC_ARG_WITH(json-c-static,
+ AC_MSG_CHECKING(for nDPI Pro)
+ if test -d "../ndpi-pro"; then
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
index e3c0534da8..03557d7576 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.ac.in-fix-host-contamination.patch
@@ -11,12 +11,14 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- configure.ac.in | 43 +++----------------------------------------
- 1 file changed, 3 insertions(+), 40 deletions(-)
+ configure.ac.in | 127 +++-----------------------------------------------------
+ 1 file changed, 5 insertions(+), 122 deletions(-)
 
+diff --git a/configure.ac.in b/configure.ac.in
+index b6ed6ce..9d284c4 100644
 --- a/configure.ac.in
 +++ b/configure.ac.in
-@@ -83,30 +83,6 @@ if test "$with_dynamic_ndpi" = "yes"; th
+@@ -89,36 +89,6 @@ if test "$with_dynamic_ndpi" = "yes"; then
    AC_DEFINE([HAVE_DYNAMIC_NDPI], [1], [Define if using dynamic linking with nDPI])
  fi
  
@@ -28,14 +30,20 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 -        CC=clang
 -        CXX="clang++ -fno-color-diagnostics -fPIE -stdlib=libc++"
 -    else
--       if test -x "/usr/bin/clang-10"; then
+-       if test -x "$(command -v clang)"; then
+-           CLANG_VERSION=$(echo -n | clang -dM -E - | sed  -n 's/^#define __clang_major__ \([0-9]\+\).*$/\1/gp')
+-       elif test -x "/usr/bin/clang-10"; then
 -           CLANG_VERSION=10
 -       elif test -x "/usr/bin/clang-13"; then
 -           CLANG_VERSION=13
 -       elif test -x "/usr/bin/clang-14"; then
 -           CLANG_VERSION=14
+-       elif test -x "/usr/bin/clang-19"; then
+-           CLANG_VERSION=19
+-       elif test -x "/usr/bin/clang-20"; then
+-           CLANG_VERSION=20
 -       else
--           echo "Could not find clang. Please install clang-14 clang-tools-14"
+-           echo "Could not find clang. Please install clang clang-tools"
 -           exit 1
 -       fi
 -
@@ -47,7 +55,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  CFLAGS="${CFLAGS} -I${HERE} -I${HERE}/include"
  CXXFLAGS="${CXXFLAGS} -I${HERE} -I${HERE}/include"
  
-@@ -122,7 +98,7 @@ fi
+@@ -134,7 +104,7 @@ fi
  
  if test -f /proc/device-tree/model; then
    IS_RASPBERRY=`cat /proc/device-tree/model | grep -a -e "Orange Pi" -e Raspberry | wc -l`
@@ -56,7 +64,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
    if test "$IS_RASPBERRY" = "1"; then
      CFLAGS="${CFLAGS} -DHAVE_EMBEDDED_SUPPORT"
      CXXFLAGS="${CXXFLAGS} -DHAVE_EMBEDDED_SUPPORT"
-@@ -158,39 +134,6 @@ MAKE=make
+@@ -170,39 +140,6 @@ MAKE=make
  BIN_PATH=/usr/bin
  LIBPCAP=-lpcap
  
@@ -96,7 +104,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  dnl> Remove spaces
  OS="${OS#"${OS%%[![:space:]]*}"}"
  
-@@ -237,31 +180,6 @@ if test "${with_nedge+set}" = set; then
+@@ -251,31 +188,6 @@ if test "${with_nedge+set}" = set; then
    LIBS="${LIBS} -lnetfilter_queue -lnfnetlink -lnetfilter_conntrack"
  fi
  
@@ -125,10 +133,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 -  fi
 -fi
 -
- if test -d "pro"; then
-   NTOPCLOUD_LIB=
-   NTOPCLOUD_HOME="../ntopcloud"
-@@ -317,10 +235,6 @@ AC_ARG_WITH(ndpi-includes,
+ JE=../jemalloc/lib/libjemalloc.a
+ if ! test -f "${JE}"; then
+  JE=
+@@ -320,10 +232,6 @@ AC_ARG_WITH(ndpi-includes,
        NDPI_CUST_INC="-I$withval -I$withval/../lib/third_party/include"
     ])
  
@@ -139,7 +147,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  NDPI_INC=`echo $NDPI_CFLAGS | sed -e "s/[ ]*$//"`
  NDPI_LIB=
  NDPI_LIB_DEP=
-@@ -387,7 +301,7 @@ fi
+@@ -399,7 +307,7 @@ fi
  pkg-config --exists libssl
  if test "$?" -ne 1; then
    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
@@ -148,7 +156,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
    SSL_LIB="`pkg-config --libs libssl` -lssl -lcrypto"
  else
    dnl Workaround for MacOS Brew
-@@ -408,10 +322,6 @@ else
+@@ -420,10 +328,6 @@ else
      SSL_INC="-I/usr/local/opt/openssl/include"
      SSL_LIB="-L/usr/local/opt/openssl/lib -lssl -lcrypto"
    dnl Workaround for FreeBSD
@@ -159,7 +167,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
    else
      echo "Please install openssl-dev(el) package prerequisite"
      exit -1
-@@ -433,13 +343,6 @@ fi
+@@ -447,13 +351,6 @@ fi
  AC_MSG_CHECKING(for ntopng professional edition)
  
  REDIS_SERVICE="redis.service"
@@ -173,7 +181,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  
  SERVICE_ALIAS=
  SERVICE_REQUIRES=
-@@ -497,7 +400,7 @@ fi
+@@ -514,7 +411,7 @@ fi
  echo "Using clickhouse-cpp stored at ${CLICKHOUSE_HOME}"
  
  dnl> fi dnl> test $SYSTEM = "Linux"
@@ -182,7 +190,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  AC_DEFINE_UNQUOTED(NTOPNG_PRO_GIT_RELEASE, "r${PRO_GIT_RELEASE}", [ntopng professional release])
  AC_DEFINE_UNQUOTED(NTOPNG_PRO_GIT_DATE, "${PRO_GIT_DATE}", [ntopng professional date])
  DUMMY=`cd ./pro; ${MAKE} build`
-@@ -531,21 +434,7 @@ if test -f ".git/index"; then
+@@ -548,21 +445,7 @@ if test -f ".git/index"; then
  fi
  
  if test $SYSTEM = "Linux"; then
@@ -205,7 +213,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  else
  dnl> wget -O config.guess 'http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD'
    if test $SYSTEM = "FreeBSD"; then
-@@ -575,7 +464,7 @@ AS_VAR_IF(with_hiredis, yes, [
+@@ -592,7 +475,7 @@ AS_VAR_IF(with_hiredis, yes, [
      else
        pkg-config --exists hiredis
        if test "$?" -ne 1; then
diff --git a/meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch b/meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch
index 8046d755c2..741b177c9d 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch
@@ -15,17 +15,19 @@ a third parameter.
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- src/LuaEngine.cpp | 64 +++++++++++++++++++++++------------------------
- 1 file changed, 32 insertions(+), 32 deletions(-)
+ src/LuaEngine.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/src/LuaEngine.cpp b/src/LuaEngine.cpp
+index 377712a..aeece85 100644
 --- a/src/LuaEngine.cpp
 +++ b/src/LuaEngine.cpp
 @@ -154,7 +154,7 @@ LuaEngine::LuaEngine() {
    is_system_vm = false;
    mem_used = 0;
-   
+ 
 -  L = lua_newstate(l_alloc, this);
 +  L = lua_newstate(l_alloc, this, luaL_makeseed(NULL));
  
    if (!L) {
-     ntop->getTrace()->traceEvent(TRACE_ERROR, "Unable to create a new Lua state.");
+     ntop->getTrace()->traceEvent(TRACE_ERROR,
diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
deleted file mode 100644
index 0b443e3050..0000000000
--- a/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 2f36e393fc35f576d7c447af337848e81990b084 Mon Sep 17 00:00:00 2001
-From: Alfredo Cardigliano <cardigliano@ntop.org>
-Date: Fri, 17 Jul 2026 11:51:03 +0200
-Subject: [PATCH] Add admin check in conf backup listing and download
-
-(cherry picked from commit f912ee93bc143330b6ff3bb946ee7211e5ee9e1a)
-
-CVE: CVE-2026-84990
-Upstream-Status: Backport [https://github.com/ntop/ntopng/commit/f912ee93bc143330b6ff3bb946ee7211e5ee9e1a]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- .../rest/v2/get/system/configurations/download_backup.lua   | 5 +++++
- .../v2/get/system/configurations/list_available_backups.lua | 6 ++++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/scripts/lua/rest/v2/get/system/configurations/download_backup.lua b/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
-index 1603a94c48..404b09ed97 100644
---- a/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
-+++ b/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
-@@ -12,6 +12,11 @@ local backup_config = require("backup_config")
- 
- -- ##############################################
- 
-+if not isAdministratorOrPrintErr() then
-+    rest_utils.answer(rest_utils.consts.err.not_granted)
-+    return
-+end
-+
- local download = _GET["download"]
- local epoch = _GET["epoch"]
- 
-diff --git a/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua b/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
-index d901a876b0..8a08ad15d5 100644
---- a/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
-+++ b/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
-@@ -8,11 +8,17 @@ package.path = dirs.installdir .. "/scripts/lua/modules/system_config/?.lua;" ..
- 
- -- ##############################################
- 
-+require "lua_utils"
- local backup_config = require("backup_config")
- local rest_utils = require("rest_utils")
- 
- -- ##############################################
- 
-+if not isAdministratorOrPrintErr() then
-+  rest_utils.answer(rest_utils.consts.err.not_granted)
-+  return
-+end
-+
- local rc = rest_utils.consts.success.ok
- 
- local order = _GET["order"] or "desc"
diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch
deleted file mode 100644
index a8a3ba72ac..0000000000
--- a/meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From c6f4d42e1bb029463f927532819c5f5b331ea066 Mon Sep 17 00:00:00 2001
-From: Alfredo Cardigliano <cardigliano@ntop.org>
-Date: Thu, 16 Jul 2026 14:42:29 +0200
-Subject: [PATCH] Fix user capability check for deleting notification endpoints
- and pools
-
-(cherry picked from commit 7d830f31af367745431c5d92e2e82fc432f6bdd8)
-
-CVE: CVE-2026-86090 CVE-2026-86091
-Upstream-Status: Backport [https://github.com/ntop/ntopng/commit/7d830f31af367745431c5d92e2e82fc432f6bdd8]
-Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
----
- scripts/lua/modules/pools/pools_rest_utils.lua | 5 +++++
- scripts/lua/rest/v2/delete/endpoints.lua       | 6 ++++++
- scripts/lua/rest/v2/delete/recipients.lua      | 6 ++++++
- 3 files changed, 17 insertions(+)
-
-diff --git a/scripts/lua/modules/pools/pools_rest_utils.lua b/scripts/lua/modules/pools/pools_rest_utils.lua
-index 9b692ea5db..73f08e0c8d 100644
---- a/scripts/lua/modules/pools/pools_rest_utils.lua
-+++ b/scripts/lua/modules/pools/pools_rest_utils.lua
-@@ -452,6 +452,11 @@ end
- 
- -- @brief Get all pools of all the available (currently implemented) pool instances
- function pools_rest_utils.delete_all_instances_pools()
-+   if not auth.has_capability(auth.capabilities.pools) then
-+      rest_utils.answer(rest_utils.consts.err.not_granted)
-+      return
-+   end
-+
-    local all_instances = pools_lua_utils.all_pool_instances_factory()
- 
-    for _, instance in pairs(all_instances) do
-diff --git a/scripts/lua/rest/v2/delete/endpoints.lua b/scripts/lua/rest/v2/delete/endpoints.lua
-index 31852cedab..6d25c01953 100644
---- a/scripts/lua/rest/v2/delete/endpoints.lua
-+++ b/scripts/lua/rest/v2/delete/endpoints.lua
-@@ -10,6 +10,12 @@ package.path = dirs.installdir .. "/scripts/lua/modules/notifications/?.lua;" ..
- local rest_utils = require "rest_utils"
- local endpoints = require("endpoints")
- local recipients = require "recipients"
-+local auth = require "auth"
-+
-+if not auth.has_capability(auth.capabilities.notifications) then
-+   rest_utils.answer(rest_utils.consts.err.not_granted)
-+   return
-+end
- 
- endpoints.reset_configs()
- recipients.cleanup()
-diff --git a/scripts/lua/rest/v2/delete/recipients.lua b/scripts/lua/rest/v2/delete/recipients.lua
-index cbdffcae4c..14b3956498 100644
---- a/scripts/lua/rest/v2/delete/recipients.lua
-+++ b/scripts/lua/rest/v2/delete/recipients.lua
-@@ -8,6 +8,12 @@ package.path = dirs.installdir .. "/scripts/lua/modules/notifications/?.lua;" ..
- 
- local rest_utils = require "rest_utils"
- local recipients = require "recipients"
-+local auth = require "auth"
-+
-+if not auth.has_capability(auth.capabilities.notifications) then
-+   rest_utils.answer(rest_utils.consts.err.not_granted)
-+   return
-+end
- 
- recipients.cleanup()
- rest_utils.answer(rest_utils.consts.success.ok)
diff --git a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb b/meta-networking/recipes-support/ntopng/ndpi_6.0.bb
similarity index 78%
rename from meta-networking/recipes-support/ntopng/ndpi_5.0.bb
rename to meta-networking/recipes-support/ntopng/ndpi_6.0.bb
index 80890b1f27..91828495f3 100644
--- a/meta-networking/recipes-support/ntopng/ndpi_5.0.bb
+++ b/meta-networking/recipes-support/ntopng/ndpi_6.0.bb
@@ -8,9 +8,8 @@ RDEPENDS:${PN} += " libpcap"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRCREV = "375f99ef9fb4999d778b57bbeece171b3fa9fba6"
-SRC_URI = "git://github.com/ntop/nDPI.git;branch=5.0-stable;protocol=https;tag=${PV} \
-           file://0001-configure-Stop-embedding-pwd-at-configure-time.patch \
+SRCREV = "1a5293396337f9a72dfee1fa070b2c4b0a0a3aaf"
+SRC_URI = "git://github.com/ntop/nDPI.git;branch=6.0-stable;protocol=https;tag=${PV} \
            file://CVE-2026-116744.patch \
           "
 
diff --git a/meta-networking/recipes-support/ntopng/ntopng/0001-Fix-build-with-OpenSSL-4.0.patch b/meta-networking/recipes-support/ntopng/ntopng/0001-Fix-build-with-OpenSSL-4.0.patch
deleted file mode 100644
index 4f142092c3..0000000000
--- a/meta-networking/recipes-support/ntopng/ntopng/0001-Fix-build-with-OpenSSL-4.0.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0c9dcc44df3592d8e08b46f5dfca664de5918bc5 Mon Sep 17 00:00:00 2001
-From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
-Date: Thu, 27 Aug 2026 09:13:35 +0000
-Subject: [PATCH] HTTPserver: fix const X509_NAME for OpenSSL 4.0
-
-OpenSSL 4.0 changed X509_get_subject_name() to return const X509_NAME*.
-Update the local variable to match and cast where non-const API requires it.
-
-Upstream-Status: Backport [https://github.com/ntop/ntopng/pull/10830]
-Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
----
- src/HTTPserver.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/HTTPserver.cpp b/src/HTTPserver.cpp
-index 21895bf10e..f7b4164ab4 100644
---- a/src/HTTPserver.cpp
-+++ b/src/HTTPserver.cpp
-@@ -403,7 +403,7 @@ static bool ssl_client_x509_auth(const struct mg_connection *const conn,
- 				 char *const group, bool *const localuser) {
-   bool ret = false;
-   X509 *cert = NULL;
--  X509_NAME *subj = NULL;
-+  const X509_NAME *subj = NULL;
-   char subject[256];
-   char key[CONST_MAX_LEN_REDIS_KEY];
- 
-@@ -411,12 +411,12 @@ static bool ssl_client_x509_auth(const struct mg_connection *const conn,
- 
-   if ((cert = SSL_get_peer_certificate(conn->ssl))) {
-     if ((subj = X509_get_subject_name(cert))) {
--      X509_NAME_oneline(subj, subject, sizeof(subject));
-+      X509_NAME_oneline((X509_NAME *)subj, subject, sizeof(subject));
-       
-       ntop->getTrace()->traceEvent(TRACE_INFO, "Client X.509 certificate subject name: '%s'", subject);
- 
-       if (SSL_get_verify_result(conn->ssl) == X509_V_OK &&
--          X509_NAME_get_text_by_NID(subj, NID_commonName, username, NTOP_USERNAME_MAXLEN) >= 0) {
-+          X509_NAME_get_text_by_NID((X509_NAME *)subj, NID_commonName, username, NTOP_USERNAME_MAXLEN) >= 0) {
-         snprintf(key, sizeof(key), CONST_STR_USER_GROUP, username);
-       
-         ntop->getTrace()->traceEvent(TRACE_INFO, "Client X.509 certificate CN: '%s'", username);
diff --git a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb b/meta-networking/recipes-support/ntopng/ntopng_7.0.bb
similarity index 88%
rename from meta-networking/recipes-support/ntopng/ntopng_6.6.bb
rename to meta-networking/recipes-support/ntopng/ntopng_7.0.bb
index 808967e969..ffc3d8432e 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_7.0.bb
@@ -11,16 +11,13 @@ RDEPENDS:${PN} = "bash redis"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "d3a1229954dd783af06c9fd2dcd9ce926826a228"
-SRC_URI = "gitsm://github.com/ntop/ntopng;protocol=https;branch=6.6-stable \
+SRCREV = "b4f7acda2feb75b9e2b93c06898e9ed3ae4bfef5"
+SRC_URI = "gitsm://github.com/ntop/ntopng;protocol=https;branch=7.0-stable \
            file://0001-configure.ac.in-fix-host-contamination.patch \
            file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
            file://0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch \
            file://0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch \
            file://ntopng.service \
-           file://0001-Fix-build-with-OpenSSL-4.0.patch \
-           file://CVE-2026-84990.patch \
-           file://CVE-2026-86090-CVE-2026-86091.patch \
            "
 
 # don't use the lua under thirdparty as it supports cross compiling badly
