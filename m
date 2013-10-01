Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id A4C956C7BC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 23:36:40 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so22474eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 16:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=T/wQdtf2W1mpTtMTuoIJUpgGSM2BPolq3uVJcj0E914=;
	b=sdONVn+KDIZXzby6MnLDz9KhgZKMYwUfkwdkkbZe8oaPDSy4TBLflanuK10b4QJfD2
	WjInhIRPWLJxoWgy+Xh7H2fhthvwgFFpsAg56ynV0FWvZoFFLyJaXv+gcj93fj45kpaJ
	8oqYuOT6rXrGsWt9pTeb3h3shvJAqUp8iS+vOz0zR/wu9Wrlg+ARUfcCKOm1V0ta2nnA
	19M7GzLdTothKFlx0Agkp0AF5sDIcIkjyC2Reg3kNfbNLkgHbxCu5jQPnkzP2EHxv83H
	yin1qVCumyBX8xQ+IVSj3L9Y0/WAUUgJs2ZpaGooUqaqwoNNm2p+STRYV+2b0zIQguXD
	yhFg==
X-Received: by 10.14.9.72 with SMTP id 48mr49273593ees.42.1380670601870;
	Tue, 01 Oct 2013 16:36:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v8sm18445805eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 16:36:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Oct 2013 01:36:44 +0200
Message-Id: <1380670604-17092-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] krb5: Add PACKAGECONFIG and new configure param to disable keyutils detection
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
X-List-Received-Date: Tue, 01 Oct 2013 23:36:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...d-parameter-to-disable-keyutils-detection.patch | 33 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb   |  6 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
new file mode 100644
index 0000000..f0c310c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch
@@ -0,0 +1,33 @@
+From ecb62f3467f493cc0d679323f05367eebbf0fb67 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 1 Oct 2013 22:22:57 +0200
+Subject: [PATCH] aclocal: Add parameter to disable keyutils detection
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ aclocal.m4 | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 210c473..83b1f02 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -1650,11 +1650,15 @@ fi
+ dnl
+ dnl If libkeyutils exists (on Linux) include it and use keyring ccache
+ AC_DEFUN(KRB5_AC_KEYRING_CCACHE,[
++AC_ARG_ENABLE([keyutils],
++AC_HELP_STRING([--disable-keyutils],don't enable using keyutils for keyring ccache @<:@enabled@:>@), , enable_keyutils=yes)
++if test "$enable_keyutils" = yes; then
+   AC_CHECK_HEADERS([keyutils.h],
+     AC_CHECK_LIB(keyutils, add_key, 
+       [dnl Pre-reqs were found
+        AC_DEFINE(USE_KEYRING_CCACHE, 1, [Define if the keyring ccache should be enabled])
+        LIBS="-lkeyutils $LIBS"
+       ]))
++fi
+ ])dnl
+ dnl
+-- 
+1.8.3.2
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
index 820a135..d0dfc46 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
@@ -8,7 +8,9 @@ DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 inherit autotools binconfig perlnative
 
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${SHRT_VER}/${P}-signed.tar"
+SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${SHRT_VER}/${P}-signed.tar \
+           file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
+"
 SRC_URI[md5sum] = "56f0ae274b285320b8a597cb89442449"
 SRC_URI[sha256sum] = "9abd94bb94a70996da0f8d90408957154bb543271b097e86c63eb33e5f5751b5"
 
@@ -17,6 +19,7 @@ S = "${WORKDIR}/${P}/src/"
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
+PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
 
 EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
@@ -42,5 +45,6 @@ python do_unpack() {
 
 do_configure() {
     gnu-configize --force
+    autoreconf
     oe_runconf
 }
-- 
1.8.3.2


