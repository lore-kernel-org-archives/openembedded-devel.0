Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id BEB5A6CC4C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 23:34:16 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so20763eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 16:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BoWt4bJ/IhGWPltueO9Db5kv8OJaEFRt0VFYDRt/WsE=;
	b=MJ4NFy9SGNyXwzazo9MFBweqAKqhGQRn56tH6PG8CqvUQ1clkbj8pcKd5prXwAeoZs
	aZgektGUjwEJusAWILAgIwPlNXkaar8bKnp8HeMnbZ1SR/5GVkwqoE63aQC+b0mAPaGY
	REVUgGcEAVOXtPs2nRhWTooijkkimw+gu0cdZqPLICr55pyzo8EbssZtozQOEwuHzg6Y
	uzXofsj977JbQ4xRHEsiK7J0tKtTABiS87hhMyyWt9ReCouO/UCOX+rqStOXjvuegQf8
	+TtCVCuHbkbUgN7Ie/WesR71bFu934kMPCS/Ipb2gQNX02lO4a7kbk5AkRrVoS34V3Jj
	aHHA==
X-Received: by 10.14.122.132 with SMTP id t4mr50404779eeh.20.1380670457948;
	Tue, 01 Oct 2013 16:34:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm18446284eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 16:34:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Oct 2013 01:34:10 +0200
Message-Id: <1380670450-16802-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1380670450-16802-1-git-send-email-Martin.Jansa@gmail.com>
References: <1380670450-16802-1-git-send-email-Martin.Jansa@gmail.com>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 2/2] krb5: Add PACKAGECONFIG and new configure param to disable keyutils detection
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
X-List-Received-Date: Tue, 01 Oct 2013 23:34:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...d-parameter-to-disable-keyutils-detection.patch | 33 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb     |  3 ++
 2 files changed, 36 insertions(+)
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
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
index 63676fd..00ad9f9 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
@@ -11,6 +11,7 @@ PR = "r2"
 
 SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${PV}/${P}-signed.tar \
            file://055d1ffa81d0730e92aa3f1ed5045cd805c74957.patch \
+           file://0001-aclocal-Add-parameter-to-disable-keyutils-detection.patch \
 "
 SRC_URI[md5sum] = "1a13c53899806c4da99a798a04d25545"
 SRC_URI[sha256sum] = "fe37fb93b398db98a1b23f814673ea2ae4b90138f85e1a4027ef639456a78651"
@@ -20,6 +21,7 @@ S = "${WORKDIR}/${P}/src/"
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
 PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
+PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
 
 EXTRA_OECONF += " --without-tcl --with-system-et --disable-rpath"
 CACHED_CONFIGUREVARS += "krb5_cv_attr_constructor_destructor=yes ac_cv_func_regcomp=yes \
@@ -45,5 +47,6 @@ python do_unpack() {
 
 do_configure() {
     gnu-configize --force
+    autoreconf
     oe_runconf
 }
-- 
1.8.3.2


