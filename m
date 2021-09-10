Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.3655.1631239401775167231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 19:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18A23JhO021092
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 19:03:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 19:03:19 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 19:03:18 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 2/2] ntopng: upgrade 4.2 -> 5.0
Date: Fri, 10 Sep 2021 09:59:04 +0800
Message-ID: <20210910015904.3378-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210910015904.3378-1-changqing.li@windriver.com>
References: <20210910015904.3378-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...kefile.in-don-t-use-the-internal-lua.patch | 16 ++++++------
 ...onfigure.seed-fix-host-contamination.patch | 16 ++++++------
 ...nfigure.seed-not-check-clang-on-host.patch | 25 ++++++++-----------
 .../ntopng/{ntopng_4.2.bb => ntopng_5.0.bb}   |  4 +--
 4 files changed, 29 insertions(+), 32 deletions(-)
 rename meta-networking/recipes-support/ntopng/{ntopng_4.2.bb => ntopng_5.0.bb} (96%)

diff --git a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
index 46724558c..0f1ca8d32 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-Makefile.in-don-t-use-the-internal-lua.patch
@@ -1,4 +1,4 @@
-From 65c15247d268566b79e4595b8e734b7e40679d75 Mon Sep 17 00:00:00 2001
+From 52953ab99c727a19e88243dda2702d6814f7974d Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 4 Nov 2020 08:55:10 +0000
 Subject: [PATCH] Makefile.in: don't use the internal lua
@@ -15,18 +15,18 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 143535746..fc06a5341 100755
+index e67623bec..99cb9f06e 100755
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -40,7 +40,6 @@ endif
- 
+@@ -31,7 +31,6 @@ MONGOOSE_INC=-I$(MONGOOSE_HOME)
+ LUA_PLATFORM=generi
  LUA_HOME=${PWD}/third-party/lua-5.3.5
  LUA_INC=-I$(LUA_HOME)/src
 -LUA_LIB=$(LUA_HOME)/src/liblua.a
  
- ######
- LIBRRDTOOL_HOME=${PWD}/third-party/rrdtool-1.4.8
-@@ -118,7 +117,6 @@ RPM_PKG = $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(PLATFORM).rpm
+ ifeq ($(OS),Linux)
+ 	LUA_PLATFORM=linux
+@@ -123,7 +122,6 @@ RPM_PKG = $(TARGET)-$(NTOPNG_VERSION)-@REVISION@.$(PLATFORM).rpm
  RPM_DATA_PKG = $(TARGET)-data-$(NTOPNG_VERSION)-@REVISION@.noarch.rpm
  ######
  
@@ -35,5 +35,5 @@ index 143535746..fc06a5341 100755
  ifneq ($(HAS_ZEROMQ), 0)
  LIB_TARGETS += $(ZEROMQ_LIB)
 -- 
-2.26.2
+2.17.1
 
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
index a5ac59fb3..02cd94a06 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-fix-host-contamination.patch
@@ -1,4 +1,4 @@
-From 81e3512718f80965c26ccb1f9d694c91b121fea0 Mon Sep 17 00:00:00 2001
+From d9458227ddb4bbb8c63c607202a6854886d66090 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 4 Nov 2020 06:28:28 +0000
 Subject: [PATCH] configure.seed: fix host contamination
@@ -11,14 +11,14 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- configure.seed | 47 +++++------------------------------------------
- 1 file changed, 5 insertions(+), 42 deletions(-)
+ configure.seed | 43 +++----------------------------------------
+ 1 file changed, 3 insertions(+), 40 deletions(-)
 
 diff --git a/configure.seed b/configure.seed
-index 03f9a31b0..58aebb5b8 100644
+index a148c530a..55bd49678 100644
 --- a/configure.seed
 +++ b/configure.seed
-@@ -79,31 +79,6 @@ fi
+@@ -144,31 +144,6 @@ fi
  #
  REVISION=`git log --pretty=oneline | wc -l`
  
@@ -50,7 +50,7 @@ index 03f9a31b0..58aebb5b8 100644
  SHORT_MACHINE=`uname -m | cut -b1-3`
  
  GIT_RELEASE="@GIT_RELEASE@"
-@@ -214,23 +189,11 @@ dnl> fi
+@@ -293,23 +268,11 @@ fi
  pkg-config --exists libssl
  if test "$?" -ne 1; then
    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
@@ -62,7 +62,7 @@ index 03f9a31b0..58aebb5b8 100644
 -  if test -d "/usr/local/opt/openssl/lib"; then
 -    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
 -    SSL_INC="-I/usr/local/opt/openssl/include"
--    SSL_LIB="-L/usr/local/opt/openssl/lib -lssl"
+-    SSL_LIB="-L/usr/local/opt/openssl/lib -lssl -lcrypto"
 -  dnl Workaround for FreeBSD
 -  elif test -f "/usr/lib/libssl.so"; then
 -    AC_DEFINE_UNQUOTED(NO_SSL_DL, 1, [has openssl])
@@ -78,5 +78,5 @@ index 03f9a31b0..58aebb5b8 100644
  
  AC_CHECK_LIB([gcrypt], [gcry_cipher_checktag], [LDFLAGS="${LDFLAGS} -lgcrypt"])
 -- 
-2.26.2
+2.17.1
 
diff --git a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
index 95d1f9948..80761abd5 100644
--- a/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
+++ b/meta-networking/recipes-support/ntopng/files/0001-configure.seed-not-check-clang-on-host.patch
@@ -1,4 +1,4 @@
-From eead0c589b71d4256bf9f16492164786b0ee07e4 Mon Sep 17 00:00:00 2001
+From 5867be19e53a3cc09730b83282c83bdd26147cc3 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 9 Nov 2020 04:05:25 +0000
 Subject: [PATCH] configure.seed: not check clang on host
@@ -9,14 +9,14 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- configure.seed | 19 -------------------
- 1 file changed, 19 deletions(-)
+ configure.seed | 16 ----------------
+ 1 file changed, 16 deletions(-)
 
 diff --git a/configure.seed b/configure.seed
-index d0335b599..cb97adca2 100644
+index 55bd49678..94bc0bc48 100644
 --- a/configure.seed
 +++ b/configure.seed
-@@ -509,25 +509,6 @@ if test $SYSTEM = "Darwin"; then
+@@ -90,22 +90,6 @@ if test $SYSTEM = "FreeBSD" || test $SYSTEM = "Darwin"; then
              CFLAGS="-fno-color-diagnostics $CFLAGS"
        fi
     fi
@@ -27,21 +27,18 @@ index d0335b599..cb97adca2 100644
 -      CXX=clang++
 -      AC_MSG_RESULT(Using clang++ compiler)
 -    fi
--    
+-
 -    if [ test -f /etc/redhat-release ]; then
--       if [ test -f /usr/bin/lsb_release ]; then
--       	  dnl> CentOS 7
--	  CENTOS_N2N_DEP=", n2n"
--       fi
+-      OS=`cat /etc/redhat-release`
 -    else
--        if [ test -f /usr/bin/lsb_release ]; then
--         OS=`/usr/bin/lsb_release -d|cut -d ':' -f 2`
--        fi
+-      if [ test -f /usr/bin/lsb_release ]; then
+-        OS=`/usr/bin/lsb_release -d|cut -d ':' -f 2`
+-      fi
 -    fi
 -  fi
  fi
  
  dnl> Remove spaces
 -- 
-2.26.2
+2.17.1
 
diff --git a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb b/meta-networking/recipes-support/ntopng/ntopng_5.0.bb
similarity index 96%
rename from meta-networking/recipes-support/ntopng/ntopng_4.2.bb
rename to meta-networking/recipes-support/ntopng/ntopng_5.0.bb
index cc2320788..89107430e 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_4.2.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_5.0.bb
@@ -11,8 +11,8 @@ RDEPENDS:${PN} = "bash redis"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "5e649a2d1130b4a3ab0c5bb673d615172cc0bdbb"
-SRC_URI = "git://github.com/ntop/ntopng.git;protocol=git;branch=4.2-stable \
+SRCREV = "85867090d92df4365c0af8d47f54ab3106117e59"
+SRC_URI = "git://github.com/ntop/ntopng.git;protocol=git;branch=5.0-stable \
            file://0001-configure.seed-fix-configure-error.patch \
            file://0001-configure.seed-fix-host-contamination.patch \
            file://0001-Makefile.in-don-t-use-the-internal-lua.patch \
-- 
2.17.1

