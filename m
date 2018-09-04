Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id CD76A762B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 18:58:07 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l63-v6so2105859pga.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rwj+uRLNV7MaS7jumjyhAXsBfZVX1A1EGfHBDB1enos=;
	b=XdQ73HmGsUXHFbDeaVW64DwwGjXa/CkYBgNxa2aRc66gqGWkBGhFQw51FtAVZtA2dQ
	UN3FUkSMfo+1QEX2ZaRlxqMVnFGjWMisJSD3fMHTG8LASAnkGSDLozYlftwEOBL8wL7v
	ebQFZM5zpZQ7sb1J6RSvRzcX6TYgf4Yizpgv9NG4otpbYBDkPX8sY+O0bSYGWSDQTSvC
	1ZjYPDEUXKcHezEWhiHHFl6xyKgYxsSca8HJmE4qfAPk4x+mgSDWYWo6nDNDucaaa5wn
	WlWn1s627qmyjylbnGw42rMUjAH2b746Lcj6M8WyXQRJJT9aclg8qTJpZ9GtotaLmvGu
	6x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rwj+uRLNV7MaS7jumjyhAXsBfZVX1A1EGfHBDB1enos=;
	b=kvhZpLuBXSOb8JR3mCyJ7tzrzX7ktwMIjJN3oqeRHFLqI8DPdauy/huUNttBhbZHED
	fOx6/7FlwuFg/tChpnPqpqWqfa8aOLCU4XKL9XdPNr3AON2r8KmZmJEXPyMNTTx/lWf5
	O/SKZ/bZn+FwoiUrPiuGRiL25WkT4aC4rxJDt8ZPTR6dvrYGDtrr/UTwvelHMyMn0nWl
	lJ24B9AMrPPkN5MzVZvFGWZoKYZwGxm8oCa6HakecV/tIm8IgZLgSR8396h4VAdqAgRn
	9FfE+oLWzQL260rp0r27vxMypepcsKqXDikkXsQeRENt9r7YNMJQ+qMxTqFfp/+ooVO1
	uPlg==
X-Gm-Message-State: APzg51Ce5BHv8IX5WQgtZgNSjcFRPGU7t6ZgraDueyTXP1Ej3lwM5jfF
	xi5sUmcXJ5MTeAu1Vzjfo7a8n/hj
X-Google-Smtp-Source: ANB0Vdb4fq7zw1Wu9QWGvhthsQPBR82mUoFdwcOjGEkhNXN/r4Vq7MN/67/TDkj6Bzvkls80jPL3WA==
X-Received: by 2002:a65:490e:: with SMTP id
	p14-v6mr32175176pgs.437.1536087488366; 
	Tue, 04 Sep 2018 11:58:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	v7-v6sm33722784pgh.57.2018.09.04.11.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 11:58:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 11:57:48 -0700
Message-Id: <20180904185750.23747-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180904185750.23747-1-raj.khem@gmail.com>
References: <20180904185750.23747-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/6] cyrus-sasl: Update to 2.1.27-rc7
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
X-List-Received-Date: Tue, 04 Sep 2018 18:58:08 -0000

This update also fixes build failures with openSSL 1.1.x
Drop patches which are not required anymore
Backport a proposed patch to fix build on musl
Readjust configure options since some of the options are not available
anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-condition-for-suppliment-snprintf-i.patch | 28 +++++++++++++
 .../cyrus-sasl/Fix-hardcoded-libdir.patch     | 21 +++++-----
 .../cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch | 31 +++++++-------
 .../debian_patches_0009_sasldb_al.diff        | 14 -------
 ...bian_patches_0014_avoid_pic_overwrite.diff | 27 ++++++------
 ...nclude-stddef.h-for-size_t-on-NetBSD.patch | 31 --------------
 ...us-sasl_2.1.26.bb => cyrus-sasl_2.1.27.bb} | 42 +++++++++----------
 7 files changed, 89 insertions(+), 105 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch
 delete mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff
 delete mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch
 rename meta-networking/recipes-daemons/cyrus-sasl/{cyrus-sasl_2.1.26.bb => cyrus-sasl_2.1.27.bb} (73%)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch
new file mode 100644
index 0000000000..68d09c385b
--- /dev/null
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch
@@ -0,0 +1,28 @@
+From 98082f81da1b49876081ff1ab340e952755f985a Mon Sep 17 00:00:00 2001
+From: OBATA Akio <obache@users.noreply.github.com>
+Date: Fri, 11 May 2018 18:36:26 +0900
+Subject: [PATCH] configure.ac: fix condition for suppliment snprintf
+ implementation
+
+$sasl_cv_snprintf means requremnt of suppliment snprintf
+implementation, not existence of system snprintf implementation,
+
+Upstream-Status: Submitted [https://github.com/cyrusimap/cyrus-sasl/pull/512]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index ac59f14..9804e98 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1264,7 +1264,7 @@ SNPRINTFOBJS=""
+ LTSNPRINTFOBJS=""
+ AC_CHECK_FUNC(snprintf, [AC_DEFINE(HAVE_SNPRINTF,[],[Does the system have snprintf()?])], [sasl_cv_snprintf=yes])
+ AC_CHECK_FUNC(vsnprintf, [AC_DEFINE(HAVE_VSNPRINTF,[],[Does the system have vsnprintf()?])], [sasl_cv_snprintf=yes])
+-if test $sasl_cv_snprintf = no; then
++if test $sasl_cv_snprintf = yes; then
+        AC_LIBOBJ(snprintf)
+        SNPRINTFOBJS="snprintf.o"
+        LTSNPRINTFOBJS="snprintf.lo"
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
index 3fa8431c34..f172362f4e 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/Fix-hardcoded-libdir.patch
@@ -1,25 +1,26 @@
-Fix hardcoded libdir.
+From 188ad4497947259811ad32faeee95c20f9a44046 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Fri, 19 Jul 2013 14:29:31 +0800
+Subject: [PATCH] Fix hardcoded libdir.
 
-Upstream-Status: Pending 
+Upstream-Status: Pending
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
 ---
- plugins/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ plugins/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/plugins/Makefile.am b/plugins/Makefile.am
-index b00915f..25262a1 100644
+index 2b02a52..929f6a4 100644
 --- a/plugins/Makefile.am
 +++ b/plugins/Makefile.am
-@@ -62,7 +62,7 @@ plugindir = @plugindir@
+@@ -65,7 +65,7 @@ LIB_MYSQL = @LIB_MYSQL@
  
- common_sources = plugin_common.c plugin_common.h
+ plugindir = @plugindir@
  
 -sasldir = $(prefix)/lib/sasl2
 +sasldir = $(libdir)/sasl2
  sasl_LTLIBRARIES = @SASL_MECHS@
  EXTRA_LTLIBRARIES = libplain.la libanonymous.la libkerberos4.la libcrammd5.la \
  	libgs2.la libgssapiv2.la libdigestmd5.la liblogin.la libsrp.la libotp.la \
--- 
-1.7.4.1
-
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
index 6407721ae3..aa271b8fb0 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/avoid-to-call-AC_TRY_RUN.patch
@@ -1,4 +1,7 @@
-Avoid to call AC_TRY_RUN
+From 288430d3c2d3f36a4c9d40c4fffa85288f44549a Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Tue, 25 Jun 2013 09:22:59 +0800
+Subject: [PATCH] Avoid to call AC_TRY_RUN
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -6,18 +9,20 @@ Avoid to call AC_TRY_RUN to check if GSSAPI libraries support SPNEGO
 on cross-compile environment by definition AC_ARG_ENABLE enable-spnego
 
 Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
 ---
- cmulocal/sasl2.m4 |   13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
+ m4/sasl2.m4 | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
 
-diff --git a/cmulocal/sasl2.m4 b/cmulocal/sasl2.m4
-index 3c2841a..a5ecf81 100644
---- a/cmulocal/sasl2.m4
-+++ b/cmulocal/sasl2.m4
-@@ -281,6 +281,17 @@ if test "$gssapi" != no; then
- 
+diff --git a/m4/sasl2.m4 b/m4/sasl2.m4
+index 56e0504..cf62607 100644
+--- a/m4/sasl2.m4
++++ b/m4/sasl2.m4
+@@ -314,7 +314,18 @@ if test "$gssapi" != no; then
    cmu_save_LIBS="$LIBS"
    LIBS="$LIBS $GSSAPIBASE_LIBS"
+ 
+-  AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
 +  AC_ARG_ENABLE([spnego],
 +              [AC_HELP_STRING([--enable-spnego=<DIR>],
 +                              [enable SPNEGO support in GSSAPI libraries [no]])],
@@ -29,10 +34,11 @@ index 3c2841a..a5ecf81 100644
 +  elif test "$spnego" = yes; then
 +       AC_DEFINE(HAVE_GSS_SPNEGO,,[Define if your GSSAPI implementation supports SPNEGO])
 +  else
-   AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
++       AC_MSG_CHECKING([for SPNEGO support in GSSAPI libraries])
    AC_TRY_RUN([
  #ifdef HAVE_GSSAPI_H
-@@ -308,7 +319,7 @@ int main(void)
+ #include <gssapi.h>
+@@ -341,7 +352,7 @@ int main(void)
  	AC_MSG_RESULT(yes) ],
  	AC_MSG_RESULT(no))
    LIBS="$cmu_save_LIBS"
@@ -41,6 +47,3 @@ index 3c2841a..a5ecf81 100644
  else
    AC_MSG_RESULT([disabled])
  fi
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff
deleted file mode 100644
index 8eff5a8bdd..0000000000
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0009_sasldb_al.diff
+++ /dev/null
@@ -1,14 +0,0 @@
-Author: Fabian Fagerholm <fabbe@debian.org>
-Description: Fix linking with libsasldb.a when saslauthd is built with sasldb
-support.
---- a/saslauthd/configure.in
-+++ b/saslauthd/configure.in
-@@ -77,7 +77,7 @@ if test "$authsasldb" != no; then
-   AC_DEFINE(AUTH_SASLDB,[],[Include SASLdb Support])
-   SASL_DB_PATH_CHECK()
-   SASL_DB_CHECK()
--  SASL_DB_LIB="$SASL_DB_LIB ../sasldb/.libs/libsasldb.al"
-+  SASL_DB_LIB="$SASL_DB_LIB ../sasldb/.libs/libsasldb.a"
- fi
- 
- AC_ARG_ENABLE(httpform, [  --enable-httpform       enable HTTP form authentication [[no]] ],
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
index 2e5b1750d0..0479acfb09 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/debian_patches_0014_avoid_pic_overwrite.diff
@@ -1,27 +1,28 @@
-Author: Fabian Fagerholm <fabbe@debian.org>
+From 1a5f3004e9081eab6263a29cd5be792f06441e36 Mon Sep 17 00:00:00 2001
+From: Fabian Fagerholm <fabbe@debian.org>
+Date: Wed, 24 Jul 2013 11:38:25 -0400
+Subject: [PATCH] cyrus-sasl: Add patches from Debian to fix linking
+
 Description: This patch makes sure the non-PIC version of libsasldb.a, which
 is created out of non-PIC objects, is not going to overwrite the PIC version,
 which is created out of PIC objects. The PIC version is placed in .libs, and
 the non-PIC version in the current directory.  This ensures that both non-PIC
 and PIC versions are available in the correct locations.
+
+---
+ lib/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index a158ca3..3137e19 100644
 --- a/lib/Makefile.am
 +++ b/lib/Makefile.am
-@@ -78,7 +78,7 @@ endif
+@@ -99,7 +99,7 @@ endif
  
  libsasl2.a: libsasl2.la $(SASL_STATIC_OBJS)
  	@echo adding static plugins and dependencies
 -	$(AR) cru .libs/$@ $(SASL_STATIC_OBJS)
 +	$(AR) cru $@ $(SASL_STATIC_OBJS)
- 	@for i in ./libsasl2.la ../sasldb/libsasldb.la ../plugins/lib*.la; do \
+ 	@for i in ./libsasl2.la ../common/libplugin_common.la ../sasldb/libsasldb.la ../plugins/lib*.la; do \
  	if test ! -f $$i; then continue; fi; . $$i; \
  	for j in $$dependency_libs foo; do \
---- a/sasldb/Makefile.am
-+++ b/sasldb/Makefile.am
-@@ -63,6 +63,6 @@ libsasldb_a_SOURCES =
- EXTRA_libsasldb_a_SOURCES =
- 
- libsasldb.a: libsasldb.la $(SASL_DB_BACKEND_STATIC)
--	$(AR) cru .libs/$@ $(SASL_DB_BACKEND_STATIC)
-+	$(AR) cru $@ $(SASL_DB_BACKEND_STATIC)
- 
- 
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch
deleted file mode 100644
index ecbab845d0..0000000000
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 92d72789c811b0d55f624a8bac5ccc4412f5996e Mon Sep 17 00:00:00 2001
-From: Ken Murchison <murch@andrew.cmu.edu>
-Date: Thu, 20 Dec 2012 18:14:50 -0500
-Subject: [PATCH] sasl.h: #include <stddef.h> for size_t on NetBSD
-
-This patch was imported from git://git.cyrusimap.org/cyrus-sasl
-commit 67a188693796a14e3a76ac603104807fbbfddfc4
-
-Upstream-Status: Backport
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- include/sasl.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/sasl.h b/include/sasl.h
-index fef4d51..8b8a63f 100755
---- a/include/sasl.h
-+++ b/include/sasl.h
-@@ -121,6 +121,8 @@
- #ifndef SASL_H
- #define SASL_H 1
- 
-+#include <stddef.h>  /* For size_t */
-+
- /* Keep in sync with win32/common.mak */
- #define SASL_VERSION_MAJOR 2
- #define SASL_VERSION_MINOR 1
--- 
-1.8.3.2
-
diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
similarity index 73%
rename from meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
rename to meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
index 3391da0ff1..86928294bf 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
@@ -1,59 +1,55 @@
 SUMMARY = "Generic client/server library for SASL authentication"
 SECTION = "libs"
 HOMEPAGE = "http://asg.web.cmu.edu/sasl/"
-DEPENDS = "openssl db"
+DEPENDS = "openssl db groff-native"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
 
-SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
-    file://avoid-to-call-AC_TRY_RUN.patch \
-    file://Fix-hardcoded-libdir.patch \
-    file://debian_patches_0009_sasldb_al.diff \
-    file://debian_patches_0014_avoid_pic_overwrite.diff \
-    file://sasl.h-include-stddef.h-for-size_t-on-NetBSD.patch \
-    file://saslauthd.service \
-    file://saslauthd.conf \
-"
+SRCREV = "e41cfb986c1b1935770de554872247453fdbb079"
+
+SRC_URI = "git://github.com/cyrusimap/cyrus-sasl;protocol=https \
+           file://avoid-to-call-AC_TRY_RUN.patch \
+           file://Fix-hardcoded-libdir.patch \
+           file://debian_patches_0014_avoid_pic_overwrite.diff \
+           file://saslauthd.service \
+           file://saslauthd.conf \
+           file://0004-configure.ac-fix-condition-for-suppliment-snprintf-i.patch \
+           "
 
-UPSTREAM_CHECK_REGEX = "cyrus-sasl-(?P<pver>(\d+(\.\d+)+))\.tar"
+UPSTREAM_CHECK_URI = "https://github.com/cyrusimap/cyrus-sasl/archives"
 
-inherit autotools-brokensep pkgconfig useradd systemd
+S = "${WORKDIR}/git"
 
 CLEANBROKEN = "1"
+inherit autotools pkgconfig useradd systemd
 
 EXTRA_OECONF += "--with-dblib=berkeley \
-                 --with-bdb-libdir=${STAGING_LIBDIR} \
-                 --with-bdb-incdir=${STAGING_INCDIR} \
-                 --with-bdb=db-5.3 \
-                 --with-plugindir="${libdir}/sasl2" \
+                 --with-plugindir='${libdir}/sasl2' \
                  andrew_cv_runpath_switch=none"
 
 PACKAGECONFIG ??= "ntlm \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 ldap pam', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam', d)} \
 "
 PACKAGECONFIG[gssapi] = "--enable-gssapi=yes,--enable-gssapi=no,krb5,"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam,"
 PACKAGECONFIG[opie] = "--with-opie,--without-opie,opie,"
 PACKAGECONFIG[des] = "--with-des,--without-des,,"
 PACKAGECONFIG[ldap] = "--with-ldap=${STAGING_LIBDIR} --enable-ldapdb,--without-ldap --disable-ldapdb,openldap,"
-PACKAGECONFIG[ntlm] = "--with-ntlm,--without-ntlm,,"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[ntlm] = "--enable-ntlm=yes,--enable-ntlm=no,,"
 
 CFLAGS += "-fPIC"
 
 do_configure_prepend () {
-    rm -f acinclude.m4 config/libtool.m4
-
     # make it be able to work with db 5.0 version
     local sed_files="sasldb/db_berkeley.c utils/dbconverter-2.c"
     for sed_file in $sed_files; do
-        sed -i 's#DB_VERSION_MAJOR == 4.*#(&) || DB_VERSION_MAJOR == 5#' $sed_file
+        sed -i 's#DB_VERSION_MAJOR == 4.*#(&) || DB_VERSION_MAJOR == 5#' ${S}/$sed_file
     done
 }
 
 do_compile_prepend () {
     cd include
-    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} makemd5.c -o makemd5
+    ${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} ${S}/include/makemd5.c -o makemd5
     touch makemd5.o makemd5.lo makemd5
     cd ..
 }
-- 
2.18.0


