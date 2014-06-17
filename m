Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7107F6FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 06:58:03 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so6638883wgg.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 23:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FIk5jwD2O8+JwnCNXNTuuw7K/fYGDK0u72BoqcSqnRA=;
	b=YhJ7gsYR8atqMYDJKeYtzUrb7K6ufmsXYChDTXMBQdFGuuctRgNPw5wapiznGVxpZ5
	OrNgggaMFwCTBrcezbZ0Ok3gyUmIKuzSP3pY/qQ7VPw4K0dq2r0mipHsACss8IFEudGM
	nzZVS6J5Jb5CuwvWvY7e4B/8NgsOz1okrs690J9LHLbjG3tpzBP0bGr4u1MlXQplOajN
	pd9GrYnOYKnLvFWHW6oEjE4jxdw6DS4T/e3e0+8vyHG3tO+YHu3L6TSkbbF11FORLhFw
	Qqs2qzVBi8adRvbz4rUm7ddT/KDyz3lZxaI+RWfzIbo2hYNAxTLtG9EEUQOzXco2fNun
	OnkQ==
X-Gm-Message-State: ALoCoQltGAweJG9qVA0i6y1scDQ+Tm8i4V8c7cf4TMUxpWVdZ6g0FkliQKpAVyF8irVSpEDlD+2N
X-Received: by 10.180.83.131 with SMTP id q3mr33326820wiy.31.1402988284172;
	Mon, 16 Jun 2014 23:58:04 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id
	dy10sm18484732wib.3.2014.06.16.23.58.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 23:58:03 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 08:57:59 +0200
Message-Id: <1402988279-31972-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] swig: use pkg-config for pcre detection.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jun 2014 06:58:09 -0000

OE-core commit 5870bd272b0b077d0826fb900b251884c1c05061 sabotaged the binconfig way.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...nfigure-use-pkg-config-for-pcre-detection.patch | 64 ++++++++++++++++++++++
 meta-oe/recipes-devtools/swig/swig_2.0.12.bb       |  5 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch

diff --git a/meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch b/meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
new file mode 100644
index 0000000..1b1128a
--- /dev/null
+++ b/meta-oe/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for-pcre-detection.patch
@@ -0,0 +1,64 @@
+From 5c4d6d8538994d5fe9b3b46bfafaf0a605e3bda6 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Tue, 17 Jun 2014 08:18:17 +0200
+Subject: [PATCH] configure: use pkg-config for pcre detection
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+Upstream-Status: pending
+---
+ configure.ac | 38 +++++++-------------------------------
+ 1 file changed, 7 insertions(+), 31 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0c984b7..6edcec1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -70,38 +70,14 @@ AC_MSG_RESULT([$with_pcre])
+ 
+ dnl To make configuring easier, check for a locally built PCRE using the Tools/pcre-build.sh script
+ if test x"${with_pcre}" = xyes ; then
+-  AC_MSG_CHECKING([whether to use local PCRE])
+-  local_pcre_config=no
+-  if test -z $PCRE_CONFIG; then
+-    if test -f `pwd`/pcre/pcre-swig-install/bin/pcre-config; then
+-      PCRE_CONFIG=`pwd`/pcre/pcre-swig-install/bin/pcre-config
+-      local_pcre_config=$PCRE_CONFIG
+-    fi
+-  fi
+-  AC_MSG_RESULT([$local_pcre_config])
+-fi
+-AS_IF([test "x$with_pcre" != xno],
+-  [AX_PATH_GENERIC([pcre],
+-    [], dnl Minimal version of PCRE we need -- accept any
+-    [], dnl custom sed script for version parsing is not needed
+-    [AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
+-     LIBS="$LIBS $PCRE_LIBS"
+-     CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
+-    ],
+-    [AC_MSG_FAILURE([
+-        Cannot find pcre-config script from PCRE (Perl Compatible Regular Expressions)
+-        library package. This dependency is needed for configure to complete,
+-        Either:
+-        - Install the PCRE developer package on your system (preferred approach).
+-        - Download the PCRE source tarball, build and install on your system
+-          as you would for any package built from source distribution.
+-        - Use the Tools/pcre-build.sh script to build PCRE just for SWIG to statically
+-          link against. Run 'Tools/pcre-build.sh --help' for instructions.
+-          (quite easy and does not require privileges to install PCRE on your system)
+-        - Use configure --without-pcre to disable regular expressions support in SWIG
+-          (not recommended).])
+-    ])
++  PKG_CHECK_MODULES([PCRE], [libpcre], [
++    AC_DEFINE([HAVE_PCRE], [1], [Define if you have PCRE library])
++    LIBS="$LIBS $PCRE_LIBS"
++    CPPFLAGS="$CPPFLAGS $PCRE_CFLAGS"
++  ], [
++    AC_MSG_WARN([$PCRE_PKG_ERRORS])
+   ])
++fi
+ 
+ 
+ dnl CCache
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.12.bb b/meta-oe/recipes-devtools/swig/swig_2.0.12.bb
index 0fbcfa1..d3707ee 100644
--- a/meta-oe/recipes-devtools/swig/swig_2.0.12.bb
+++ b/meta-oe/recipes-devtools/swig/swig_2.0.12.bb
@@ -1,6 +1,9 @@
 require ${BPN}.inc
 
-SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
+SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
+            file://0001-configure-use-pkg-config-for-pcre-detection.patch \
+           "
+
 
 SRC_URI[md5sum] = "c3fb0b2d710cc82ed0154b91e43085a4"
 SRC_URI[sha256sum] = "65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c602821a541817a4317f7"
-- 
1.9.3


