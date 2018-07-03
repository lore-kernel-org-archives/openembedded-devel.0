Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2FDB27754B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 09:20:24 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id s11-v6so1171615wra.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OTWptpO0kg7NwDmQwRQHMWy7dKRrwOVDZXDtj/kp6SU=;
	b=YIcfbpRv0rB87ZmbjYhpiI3vR+Cofs2cu6EtVbvsyPshZ9L+9Z1MK4kqximynaBRFK
	e+UD7DufXo89h08Zrg5BwmEzNfpPbECImoYWEKN4IAbGcWPsfTJutnov2A1JbpX8aa4B
	cwtfl44DDJCeymV1If3w2nvF1OqoDBcvD2EhPtVwaI6M8s7OW331c0fF2XYlZUMJbTm3
	jeIGd7aVK8ZviYZla3Rw+jRoZ2UmVYrDTE/p0/U4w/0LYfIuwV2RkG688wx+3gTWEgnt
	OuR0IGPiXVotLy6N1UscuvG4ylUWMkoG+IWy89N3qYFAX4IM4or0DttoMYAcYbAoQ72p
	2oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OTWptpO0kg7NwDmQwRQHMWy7dKRrwOVDZXDtj/kp6SU=;
	b=bYGFH/hpZiUFFLsk2XTN8JcjYqD4DgjDKGlgl/u7r84a3n1Cy0bJsNMZ7JSGMtSL7T
	kD+F0J/EYlp44H7ihAei70A3G9fybW8ISxW344+o4/mIUVbMyRdXI0VeMSLjX0k/F5du
	sUSDLiwCVZL6NS07J5HKkp4aqd3fj/xripI3+0vU+LR0XoccLKt1HBXRog7ZRJ7UcVQJ
	wCkyemCILLwzynm9fBFodGR6AzbsudD18Zm44h8Q8MVrmVSxUp2jLJ6nCHKWoS05A8uA
	66RFyZMtfAaR+uL21aApI1uOhRv9GSWFoIjDEcrJ6kvddInWp8ByzumF+9Vr+GDt3dDV
	eYpg==
X-Gm-Message-State: APt69E1lAtufginhKygKXOvuZbH/yknT+kKiPptyceWq8yddcQ0GaMaH
	7kHpkvHenI5pISrsGdUmoNQtqpTZ
X-Google-Smtp-Source: AAOMgpf01dlfD0+fWc7Vqw3bYhFj66PIdZ9tmQVeOIcfDT1WRw30zM/YaTY2Smnw+bsEkq+nJ0MEag==
X-Received: by 2002:adf:d4c5:: with SMTP id
	w5-v6mr21239469wrk.185.1530609624487; 
	Tue, 03 Jul 2018 02:20:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g75-v6sm1041872wmd.38.2018.07.03.02.20.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 02:20:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jul 2018 10:20:16 +0100
Message-Id: <20180703092018.5018-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180703092018.5018-1-ross.burton@intel.com>
References: <20180703092018.5018-1-ross.burton@intel.com>
Subject: [PATCH 2/4] php: disable non-deterministic valgrind
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
X-List-Received-Date: Tue, 03 Jul 2018 09:20:24 -0000

Valgrind support in PHP looks on the host for Valgrind headers, backport a patch
from upstream so that Valgrind support is disabled by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/recipes-devtools/php/php.inc            |   1 +
 meta-oe/recipes-devtools/php/php/valgrind.patch | 115 ++++++++++++++++++++++++
 2 files changed, 116 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/valgrind.patch

diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
index 066b97cd26..f262d60d15 100644
--- a/meta-oe/recipes-devtools/php/php.inc
+++ b/meta-oe/recipes-devtools/php/php.inc
@@ -24,6 +24,7 @@ SRC_URI_append_class-target = " \
             file://0001-acinclude.m4-don-t-unset-cache-variables.patch \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
             file://php-fpm.service \
+            file://valgrind.patch \
           "
 S = "${WORKDIR}/php-${PV}"
 
diff --git a/meta-oe/recipes-devtools/php/php/valgrind.patch b/meta-oe/recipes-devtools/php/php/valgrind.patch
new file mode 100644
index 0000000000..c3e232ba23
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/valgrind.patch
@@ -0,0 +1,115 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 25ba60b1479eb332a7388732f3ee5467000fbe73 Mon Sep 17 00:00:00 2001
+From: Michael Heimpold <mhei@heimpold.de>
+Date: Wed, 14 Feb 2018 14:46:17 +0100
+Subject: [PATCH] Fixed bug #75722: Rework valgrind detection
+
+As described in bug report #75722, the configure script (acinclude.m4)
+currently searches for the valgrind header file and enables valgrind
+support if found.
+
+When cross-compiling the searched paths are invalid for the target
+platform because they belong to the host system. At the moment, there is
+no way to tell the build system a dedicated path where to look for the
+header file.
+
+This leads to the issue, that when cross-compiling eg. for ARMv5 platform,
+that valgrind header file is detected - e.g. because host system is amd64 -
+and support is enabled - but target platform will never support valgrind
+(valgrind requires e.g. at least ARMv7).
+
+This change reworks the detection so that user could manually opt-in
+valgrind support and optionally specify a directory where the build system
+should look for the header file using the --with-valgrind option.
+---
+ NEWS         |  4 ++++
+ acinclude.m4 | 20 --------------------
+ configure.ac | 30 +++++++++++++++++++++++++++++-
+ 3 files changed, 33 insertions(+), 21 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 1faf13831ebd..5d65fd083357 100644
+--- a/NEWS
++++ b/NEWS
+@@ -2,6 +2,10 @@ PHP                                                                        NEWS
+ |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
+ ?? ??? 2018, PHP 7.2.5
+ 
++- Core:
++  . Fixed bug #75722 (Convert valgrind detection to configure option).
++    (Michael Heimpold)
++
+ - Mbstring:
+   . Fixed bug #75944 (Wrong cp1251 detection). (dmk001)
+   . Fixed bug #76113 (mbstring does not build with Oniguruma 6.8.1).
+diff --git a/acinclude.m4 b/acinclude.m4
+index d42d70853515..eb06cb7e363f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -3249,23 +3249,3 @@ AC_DEFUN([PHP_CHECK_BUILTIN_SSUBLL_OVERFLOW], [
+ 
+ dnl Load the AX_CHECK_COMPILE_FLAG macro from the autoconf archive.
+ m4_include([build/ax_check_compile_flag.m4])
+-
+-dnl PHP_CHECK_VALGRIND
+-AC_DEFUN([PHP_CHECK_VALGRIND], [
+-  AC_MSG_CHECKING([for valgrind])
+-
+-  SEARCH_PATH="/usr/local /usr"
+-  SEARCH_FOR="/include/valgrind/valgrind.h"
+-  for i in $SEARCH_PATH ; do
+-    if test -r $i/$SEARCH_FOR; then
+-      VALGRIND_DIR=$i
+-    fi
+-  done
+-
+-  if test -z "$VALGRIND_DIR"; then
+-    AC_MSG_RESULT([not found])
+-  else
+-    AC_MSG_RESULT(found in $VALGRIND_DIR)
+-    AC_DEFINE(HAVE_VALGRIND, 1, [ ])
+-  fi
+-])
+diff --git a/configure.ac b/configure.ac
+index 05f94f08a9c8..c5d9be978bda 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -753,7 +753,35 @@ if test "x$php_crypt_r" = "x1"; then
+   PHP_CRYPT_R_STYLE
+ fi
+ 
+-PHP_CHECK_VALGRIND
++dnl Check valgrind support
++PHP_ARG_WITH(valgrind, [whether to enable valgrind support],
++[  --with-valgrind=DIR     Enable valgrind support], yes, no)
++
++if test "$PHP_VALGRIND" != "no"; then
++
++  AC_MSG_CHECKING([for valgrind header])
++
++  if test "$PHP_VALGRIND" = "yes"; then
++    SEARCH_PATH="/usr/local /usr"
++  else
++    SEARCH_PATH="$PHP_VALGRIND"
++  fi
++
++  SEARCH_FOR="/include/valgrind/valgrind.h"
++  for i in $SEARCH_PATH ; do
++    if test -r $i/$SEARCH_FOR; then
++      VALGRIND_DIR=$i
++    fi
++  done
++
++  if test -z "$VALGRIND_DIR"; then
++    AC_MSG_RESULT([not found])
++  else
++    AC_MSG_RESULT(found in $VALGRIND_DIR)
++    AC_DEFINE(HAVE_VALGRIND, 1, [ ])
++  fi
++
++fi
+ 
+ dnl General settings.
+ dnl -------------------------------------------------------------------------
\ No newline at end of file
-- 
2.11.0


