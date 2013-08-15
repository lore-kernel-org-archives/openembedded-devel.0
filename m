Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id C3D486B5F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:18:55 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so183405eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=eg5DMjaFPTcnh0vTjMYCZ9poKM3hrd8/LjhGgpuaTdo=;
	b=LtpQbZquqadnqXXeLTACa38NifrV4FbvoLqT54zaWaQLkbKGdIU9pqT+zd3CsMn/rF
	8RKuIT2QPDvNA/zXu1RuZly+X62QJJuCILyk47XG7jmLwYDIruBKzTJ1KEAYVibCGPfG
	3kaj1fEPOR1UuR5yiErWaihSexcLNNJxWRLmGyGGWCr09bdZyAK1reYJJEf4eIfWbgQF
	udS8rTWceoncF8D4Gp5H0Ejyj6p8Idlcpk8ppZX25sdAxwCKMC+k/8nFYl/VrKx8Trpy
	hDba0oh4iVVuMY2CrNi8lQ2TZENPCoaeaAD+pVt0sFPvKADCmLOYEVb1QtAqh/UlEHrT
	pLUQ==
X-Received: by 10.14.113.137 with SMTP id a9mr20466494eeh.3.1376551136195;
	Thu, 15 Aug 2013 00:18:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm81923361eeb.4.2013.08.15.00.18.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:18:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:42 +0200
Message-Id: <d29b8b5213080607f5ff9e8b9f208e61aa26513d.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 02/60] cyrus-sasl: Avoid to call AC_TRY_RUN
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
X-List-Received-Date: Thu, 15 Aug 2013 07:18:56 -0000

From: "Roy.Li" <rongqing.li@windriver.com>

If the gssapi libraries are compiled before cyrus-sasl, configure will call
AC_TRY_RUN to check if gssapi libraries support SPNEGO, but calling AC_TRY_RUN
will fail on cross-compile environment.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com>
---
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  6 ++-
 .../files/avoid-to-call-AC_TRY_RUN.patch           | 46 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index 0113025..6793e85 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -4,7 +4,8 @@ DEPENDS = "openssl virtual/db"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
-SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz "
+SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
+	   file://avoid-to-call-AC_TRY_RUN.patch"
 
 inherit autotools pkgconfig
 
@@ -14,6 +15,9 @@ EXTRA_OECONF += "--with-dblib=berkeley \
                  --without-pam --without-opie --without-des \
                  andrew_cv_runpath_switch=none"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
+
 do_configure_prepend () {
     rm -f acinclude.m4 config/libtool.m4
 }
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch b/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch
new file mode 100644
index 0000000..6407721
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/files/avoid-to-call-AC_TRY_RUN.patch
@@ -0,0 +1,46 @@
+Avoid to call AC_TRY_RUN
+
+Upstream-Status: Inappropriate [configuration]
+
+Avoid to call AC_TRY_RUN to check if GSSAPI libraries support SPNEGO
+on cross-compile environment by definition AC_ARG_ENABLE enable-spnego
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ cmulocal/sasl2.m4 |   13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/cmulocal/sasl2.m4 b/cmulocal/sasl2.m4
+index 3c2841a..a5ecf81 100644
+--- a/cmulocal/sasl2.m4
++++ b/cmulocal/sasl2.m4
+@@ -281,6 +281,17 @@ if test "$gssapi" != no; then
+ 
+   cmu_save_LIBS="$LIBS"
+   LIBS="$LIBS $GSSAPIBASE_LIBS"
++  AC_ARG_ENABLE([spnego],
++              [AC_HELP_STRING([--enable-spnego=<DIR>],
++                              [enable SPNEGO support in GSSAPI libraries [no]])],
++              [spnego=$enableval],
++              [spnego=no])
++
++  if test "$spnego" = no; then
++       echo "no"
++  elif test "$spnego" = yes; then
++       AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
++  else
+   AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
+   AC_TRY_RUN([
+ #ifdef HAVE_GSSAPI_H
+@@ -308,7 +319,7 @@ int main(void)
+ 	AC_MSG_RESULT(yes) ],
+ 	AC_MSG_RESULT(no))
+   LIBS="$cmu_save_LIBS"
+-
++   fi
+ else
+   AC_MSG_RESULT([disabled])
+ fi
+-- 
+1.7.10.4
+
-- 
1.8.3.2


