Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7035E6FF72
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 22:30:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n24so5452851pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2016 15:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d1pnOofSho29wwSJsjOr4J2MpJtKXEF3YNMIWvH1+60=;
	b=FvLiZlw6XFXNUmsNu1f3Iy8wGchxe252x4v7oXCwI35E5bxGpZt6a/hObXKKzsbEqC
	OJSzdQdgxyetFGEVpVvn2P4m/PhlY74QY11s8MIRBTfl02TFFEn8yiw0Rcj5BnFiElHy
	YPdeLcQop+RMdDc64u2TOpETaz+L6ccYKg4HyAn3MOjhY4MCyksBhoZA9P+NQuAj6ne4
	HQAI/xwjEkh9kmBx2wk7z6RBOHBAzXhnl9vyh5fKx9MsaTKJSTrqnf9/8mVF+2Rn2zQg
	KsnPJOKUIb4UK1RF8c2TSZtk7ZmPNzPOTe9sBS+plwbApgiDv5ICoMzJbAcl6D/H9YxK
	c7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d1pnOofSho29wwSJsjOr4J2MpJtKXEF3YNMIWvH1+60=;
	b=kq9kfDh+zAc/LYNfN2T63fKcTwKrYWt3oPdnee2FcGq0UmHygYYyB54WVexlslTezg
	PCDjAcqG3blD+UuO7laKaRnaw81odVRVtDBl/QcxnMijiRsQ/nS/X2ILKqSf7ljE8+jP
	YqwKHtNZK5JOzi7LTjcSJtrF4mr61dQUO5K0hRa3jULPmmpbjKf37xe/EJiI54vUA6qB
	6pah/AOH196zk7FYLu0PJG6dsYZNBkZOMC5DlKPNr8TgrTIf25q+ZYT1WLxgEPj0BdVY
	sXzr4lym1+IDOAgmvzHK8k46vCBq+fHI6VnQHoFgXm4LNBdZCXBJAe40rxNNnYCiojzs
	Zbww==
X-Gm-Message-State: AA6/9RnMl/ijm4nMMOuPigB0UC9e9cpfLGkG1FSRIumMG164I+Xs3uwW42lBbl6Bnln/Vw==
X-Received: by 10.98.68.8 with SMTP id r8mr15786680pfa.0.1475274631837;
	Fri, 30 Sep 2016 15:30:31 -0700 (PDT)
Received: from e6520.adbgroup.pl
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	h82sm30125150pfh.22.2016.09.30.15.30.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 15:30:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2016 15:30:14 -0700
Message-Id: <1475274614-10777-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475274614-10777-1-git-send-email-armccurdy@gmail.com>
References: <1475274614-10777-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 3/3] jq: add support for jq-native + misc minor fixes
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
X-List-Received-Date: Fri, 30 Sep 2016 22:30:30 -0000

 - Add PACKAGECONFIG options for docs, maintainer-mode and oniguruma

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../jq/jq/Support-without-oniguruma.patch          | 68 ++++++++++++++++++++++
 meta-oe/recipes-devtools/jq/jq_1.5.bb              | 21 ++++---
 2 files changed, 82 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch

diff --git a/meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch b/meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch
new file mode 100644
index 0000000..1dfd955
--- /dev/null
+++ b/meta-oe/recipes-devtools/jq/jq/Support-without-oniguruma.patch
@@ -0,0 +1,68 @@
+From 18b4b18b41f5ed396d73449ce8d6ec408d95d6b2 Mon Sep 17 00:00:00 2001
+From: David Tolnay <dtolnay@gmail.com>
+Date: Sat, 21 Nov 2015 10:05:37 -0800
+Subject: [PATCH] Support --without-oniguruma
+
+Upstream-Status: Backport
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+---
+ configure.ac | 41 ++++++++++++++++++++---------------------
+ 1 file changed, 20 insertions(+), 21 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9e2c8cf..7f6be34 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,27 +52,26 @@ fi
+ AC_ARG_WITH([oniguruma],
+     [AS_HELP_STRING([--with-oniguruma=prefix],
+         [try this for a non-standard install prefix of the oniguruma library])],
+-    [ONIGURUMAPATHSET=1],
+-    [ONIGURUMAPATHSET=0])
+-
+-if test $ONIGURUMAPATHSET = 1; then
+-  CFLAGS="$CFLAGS -I${with_oniguruma}/include"
+-  LDFLAGS="$LDFLAGS -L${with_oniguruma}/lib"
+-fi
+-
+-# check for ONIGURUMA library
+-HAVE_ONIGURUMA=0
+-AC_CHECK_HEADER("oniguruma.h",
+-    AC_CHECK_LIB([onig],[onig_version],[LIBS="$LIBS -lonig"; HAVE_ONIGURUMA=1;]))
+-
+-# handle check results
+-if test $HAVE_ONIGURUMA != 1; then
+-    AC_MSG_NOTICE([Oniguruma was not found.])
+-    AC_MSG_NOTICE([ Try setting the location using '--with-oniguruma=PREFIX' ])
+-else
+-    AC_DEFINE([HAVE_ONIGURUMA],1,[Define to 1 if Oniguruma is installed])
+-fi
+-
++    [],
++    [with_oniguruma=yes])
++
++AS_IF([test "x$with_oniguruma" != xno], [
++    AS_IF([test "x$with_oniguruma" != xyes], [
++        CFLAGS="$CFLAGS -I${with_oniguruma}/include"
++        LDFLAGS="$LDFLAGS -L${with_oniguruma}/lib"
++    ])
++    # check for ONIGURUMA library
++    have_oniguruma=0
++    AC_CHECK_HEADER("oniguruma.h",
++        AC_CHECK_LIB([onig],[onig_version],[LIBS="$LIBS -lonig"; have_oniguruma=1;]))
++    # handle check results
++    AS_IF([test $have_oniguruma = 1], [
++        AC_DEFINE([HAVE_ONIGURUMA], 1, [Define to 1 if Oniguruma is installed])
++    ], [
++        AC_MSG_NOTICE([Oniguruma was not found.])
++        AC_MSG_NOTICE([Try setting the location using '--with-oniguruma=PREFIX'])
++    ])
++])
+ 
+ dnl Check for valgrind
+ AC_CHECK_PROGS(valgrind_cmd, valgrind)
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/jq/jq_1.5.bb b/meta-oe/recipes-devtools/jq/jq_1.5.bb
index 612eaf3..0f40815 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.5.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.5.bb
@@ -2,16 +2,14 @@ SUMMARY = "Lightweight and flexible command-line JSON processor"
 DESCRIPTION = "jq is like sed for JSON data, you can use it to slice and \
                filter and map and transform structured data with the same \
                ease that sed, awk, grep and friends let you play with text."
-HOMEPAGE = "http://stedolan.github.io/jq/"
+HOMEPAGE = "https://stedolan.github.io/jq/"
 BUGTRACKER = "https://github.com/stedolan/jq/issues"
 SECTION = "utils"
-
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=29dd0c35d7e391bb8d515eacf7592e00"
 
-DEPENDS = "flex-native bison-native onig"
-
-SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://github.com/stedolan/${BPN}/releases/download/${BP}/${BP}.tar.gz \
+           file://Support-without-oniguruma.patch \
 "
 
 SRC_URI[md5sum] = "0933532b086bd8b6a41c1b162b1731f9"
@@ -19,5 +17,14 @@ SRC_URI[sha256sum] = "c4d2bfec6436341113419debf479d833692cc5cdab7eb0326b5a4d4fbe
 
 inherit autotools
 
-# Don't build documentation (generation requires ruby)
-EXTRA_OECONF = "--disable-docs --disable-maintainer-mode"
+PACKAGECONFIG ?= "oniguruma"
+
+PACKAGECONFIG[docs] = "--enable-docs,--disable-docs,ruby-native"
+PACKAGECONFIG[maintainer-mode] = "--enable-maintainer-mode,--disable-maintainer-mode,flex-native bison-native"
+PACKAGECONFIG[oniguruma] = "--with-oniguruma,--without-oniguruma,onig"
+
+OE_EXTRACONF += " \
+    --disable-valgrind \
+"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


