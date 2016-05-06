Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A35B876EBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:34:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w143so9121468wmw.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QJAumuXQerwwHGSbxg5kIWBKgB8iKRC/olqZa7rROdQ=;
	b=cxDTr019F6FDh/cadRwcpNBdWspcehjnSE2f65pAZ1zOoJZPEwKwFSHZo5m73kRKl+
	16a7tXhHUPqpA0QsUuSdQnd+Ww/5EW32hxfHFmAw+/FTWB5JKq5erBFt0724Pk094HhG
	J2FmEtc5kUSaXw38hwzomDcBmUxi2rUAwHigh2FYvFvvxuoH8rsY9TrL1mCAADDQw/dT
	EZAAumShGyitdGIA51LSB2tDTju/grxLjlxvzIyKGLxk33QUdZwPOnfZBwNlGIdYX5jh
	Sx7tWBjaayFRxeSJ7kRys1eGbyMCAcUTYtehBVS/h+A/90cm8DGDo7ZhZQjD0lbSK5qv
	YqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QJAumuXQerwwHGSbxg5kIWBKgB8iKRC/olqZa7rROdQ=;
	b=HLImjOhyCFQBpyKJRHT01liQsEcTAZtqv9ae2CSzPQl+t6AtDcRBCQxLHqUiiyUSoo
	U/r9ZMbgT+oDLavzNTfB4RygCe0BY1kOoqL0if/9xhgX9RzYsedZXthEHAW7Q1hwCh0i
	U1FoXDQHzDTkK9eAtHC3LCtz6PXPVmw35a9jbkgAShPdTmz+qc0AJr8qUT0w4eTHBg6z
	1NX3X0nAta625zioLFBhmeG15YKpbvLgqTHpIz79//rFU3su5IOe+9xmGb0IyWD6uNrp
	KL/ekUZaSbXatFcPmOEzuCdOC3cBZjEy3bsI0t83ByTO1cyhT9BNUdCBHx/NiPuT0RTU
	pKxA==
X-Gm-Message-State: AOPr4FXMO4s5KHDH0ONgUtqYlZXXtGt70/kwRB2xOLQi/ybJOvBezEtcr94aK5X3P7PhUg==
X-Received: by 10.194.173.161 with SMTP id bl1mr20480959wjc.11.1462545240957; 
	Fri, 06 May 2016 07:34:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xt9sm15240998wjb.17.2016.05.06.07.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:33:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 16:35:24 +0200
Message-Id: <1462545324-27232-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
References: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][krogoth][meta-oe 3/3] pidgin: use pkg-config instead of hardcoded paths or python-config
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
X-List-Received-Date: Fri, 06 May 2016 14:34:01 -0000

* also fix following QA warning:
WARNING: pidgin-2.10.12-r0 do_package: QA Issue: pidgin: Files/directories were installed but not shipped in any package:
  /usr/share/appdata
  /usr/share/appdata/pidgin.appdata.xml
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
pidgin: 2 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pidgin/pidgin/pidgin-cross-python-265.patch    | 51 ++++++++++++----------
 meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb   |  2 +-
 2 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
index cfc681c..72bf4ed 100644
--- a/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
+++ b/meta-oe/recipes-support/pidgin/pidgin/pidgin-cross-python-265.patch
@@ -1,27 +1,34 @@
-From 428836ba7f9048970626ef0d6b805107f7c52d33 Mon Sep 17 00:00:00 2001
-From: Herrie <github.com@herrie.org>
-Date: Thu, 5 May 2016 13:33:29 +0200
-Subject: [PATCH] Updated python patch
+Use pkg-config instead of ${PYTHON}-config to find python
 
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 94ea8cf..2285adb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1587,9 +1587,9 @@ dnl (Thanks to XChat)
+diff -uNr pidgin-2.10.12.orig/configure.ac pidgin-2.10.12/configure.ac
+--- pidgin-2.10.12.orig/configure.ac	2016-01-01 00:19:40.000000000 +0100
++++ pidgin-2.10.12/configure.ac	2016-05-05 16:55:13.258945925 +0200
+@@ -1585,20 +1585,15 @@
+ dnl Check for Python headers (currently useful only for libgnt)
+ dnl (Thanks to XChat)
  if test "x$enable_consoleui" = "xyes" -a ! -z "$PYTHON" -a x"$PYTHON" != x"no" ; then
- 	AC_MSG_CHECKING(for Python compile flags)
- 	if test -f ${PYTHON}-config; then
+-	AC_MSG_CHECKING(for Python compile flags)
+-	if test -f ${PYTHON}-config; then
 -		PY_CFLAGS=`${PYTHON}-config --includes`
 -		PY_LIBS=`${PYTHON}-config --libs`
 -		AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
-+		m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
-+		PY_LIBS="-L$PKG_CONFIG_SYSROOT_DIR/usr/lib/python$PY_VERSION/config -lpython$PY_VERSION"
-+		PY_CFLAGS="-I$PKG_CONFIG_SYSROOT_DIR/usr/include/python$PY_VERSION"		AC_DEFINE(USE_PYTHON, [1], [Define if python headers are available.])
- 		AC_MSG_RESULT(ok)
- 	else
- 		AC_MSG_RESULT([Cannot find ${PYTHON}-config])
-
+-		AC_MSG_RESULT(ok)
+-	else
+-		AC_MSG_RESULT([Cannot find ${PYTHON}-config])
+-		PY_CFLAGS=""
+-		PY_LIBS=""
+-	fi
++        AC_MSG_CHECKING(for Python compile flags)
++        PKG_CHECK_MODULES(PY, python, [
++                AC_SUBST(PY_CFLAGS)
++                AC_SUBST(PY_LIBS)
++        ], [
++                AC_MSG_RESULT(no)
++                AC_MSG_ERROR([Can't find python])
++        ])
+ fi
+-AC_SUBST(PY_CFLAGS)
+-AC_SUBST(PY_LIBS)
+ 
+ dnl #######################################################################
+ dnl # Check for Mono support
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
index ac0871f..cd46140 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
@@ -83,7 +83,7 @@ FILES_${PN} = "${bindir} ${datadir}/${PN} ${libdir}/${PN}/*.so \
            ${datadir}/applications"
 RRECOMMENDS_${PN} = "${PN}-data libpurple-plugin-ssl-gnutls libpurple-protocol-irc libpurple-protocol-xmpp"
 
-FILES_${PN}-data = "${datadir}/pixmaps ${datadir}/sounds ${datadir}/icons"
+FILES_${PN}-data = "${datadir}/pixmaps ${datadir}/sounds ${datadir}/icons ${datadir}/appdata"
 FILES_${PN}-dev += "${libdir}/${PN}/*.la"
 
 PACKAGES_DYNAMIC += "^libpurple-protocol-.* ^libpurple-plugin-.* ^pidgin-plugin-.* ^finch-plugin-.*"
-- 
2.8.2


