Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8757275F3A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 17:57:45 +0000 (UTC)
Received: by pacik9 with SMTP id ik9so16220726pac.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2015 10:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=JNSXPG/d/Jxoao5nkaB46jwqb4av1//GWwSZGpGaAUY=;
	b=t0fA5IBY/Ji/4I24CW8cMJnCDgmYk/v8ETWCtqQu17xOCznooae68SRP838d3E3AVw
	nmCpIwyCmkpxbo+5f4AHbW+eTWV5aC6yNSr45RghvZqFj88ugDNI4gHs8jQ5tJYFsWYr
	u0zWneu49nBudqPBaRJ/4YK1P7tB0KxecV1VvcIWDT0sVWXluH46/fsjjCdbWGg9XDYc
	ZSMJ4UYxW9TljCabhqCzmANoknpubRDOe2PDqQcp0Ref2mwKiVb93ec5jSyBERx7dLsn
	LQCWEOuTBAJNL8dPqIElDVnUW5tszrcoD0zSccCpznt/k9/1GaxYTPrSTNzBmAxjkMQ3
	fGFA==
X-Received: by 10.66.243.225 with SMTP id xb1mr12155039pac.1.1445709465460;
	Sat, 24 Oct 2015 10:57:45 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id bz1sm559946pab.20.2015.10.24.10.57.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Oct 2015 10:57:40 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id E3905FC66DA; Sat, 24 Oct 2015 10:57:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 24 Oct 2015 10:57:24 -0700
Message-Id: <c861a8b583046c879ba711a9986fcb7510601dc6.1445709055.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
In-Reply-To: <cover.1445709055.git.akuster808@gmail.com>
References: <cover.1445709055.git.akuster808@gmail.com>
Subject: [PATCH 6/7] ntp: uprev to 4.2.8p2
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
X-List-Received-Date: Sat, 24 Oct 2015 17:57:45 -0000

From: Roy Li <rongqing.li@windriver.com>

ntp 4.2.8p2 has more CVE fixes, like CVE-2015-1799, CVE-2015-1798;
and remove ntp-4.2.8-ntp-keygen-no-openssl.patch which 4.2.8p2 has integrated

4.2.8.p1 included CVE-2014-9297, CVE-2014-9298 (ak).

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch  | 168 ---------------------
 .../ntp/{ntp_4.2.8.bb => ntp_4.2.8p2.bb}           |   7 +-
 2 files changed, 3 insertions(+), 172 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8.bb => ntp_4.2.8p2.bb} (95%)

diff --git a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch b/meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
deleted file mode 100644
index 9b9af63..0000000
--- a/meta-networking/recipes-support/ntp/ntp/ntp-4.2.8-ntp-keygen-no-openssl.patch
+++ /dev/null
@@ -1,168 +0,0 @@
-Fix ntp-keygen build without OpenSSL
-
-Patch borrowed from Gentoo, originally from upstream
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Upstream-Status: Backport
-
-Upstream commit:
-http://bk1.ntp.org/ntp-stable/?PAGE=patch&REV=5497b345z5MNTuNvJWuqPSje25NQTg
-Gentoo bugzilla: https://bugs.gentoo.org/show_bug.cgi?id=533238
-
-Signed-off-by: Markos Chandras <hwoarang@gentoo.org>
-Index: ntp-4.2.8/Makefile.am
-===================================================================
---- ntp-4.2.8.orig/Makefile.am
-+++ ntp-4.2.8/Makefile.am
-@@ -2,7 +2,10 @@ ACLOCAL_AMFLAGS = -I sntp/m4 -I sntp/lib
- 
- NULL =
- 
-+# moved sntp first to get libtool and libevent built.
-+
- SUBDIRS =		\
-+	sntp		\
- 	scripts		\
- 	include		\
- 	libntp		\
-@@ -17,7 +20,6 @@ SUBDIRS =		\
- 	clockstuff	\
- 	kernel		\
- 	util		\
--	sntp		\
- 	tests		\
- 	$(NULL)
- 
-@@ -64,7 +66,6 @@ BUILT_SOURCES =				\
- 	.gcc-warning			\
- 	'libtool				\
- 	html/.datecheck			\
--	sntp/built-sources-only		\
- 	$(srcdir)/COPYRIGHT		\
- 	$(srcdir)/.checkChangeLog	\
- 	$(NULL)
-Index: ntp-4.2.8/configure.ac
-===================================================================
---- ntp-4.2.8.orig/configure.ac
-+++ ntp-4.2.8/configure.ac
-@@ -102,7 +102,7 @@ esac
- enable_nls=no
- LIBOPTS_CHECK_NOBUILD([sntp/libopts])
- 
--NTP_ENABLE_LOCAL_LIBEVENT
-+NTP_LIBEVENT_CHECK_NOBUILD([2], [sntp/libevent])
- 
- NTP_LIBNTP
- 
-@@ -771,6 +771,10 @@ esac
- 
- #### 
- 
-+AC_CHECK_FUNCS([arc4random_buf])
-+
-+#### 
-+
- saved_LIBS="$LIBS"
- LIBS="$LIBS $LDADD_LIBNTP"
- AC_CHECK_FUNCS([daemon])
-Index: ntp-4.2.8/libntp/ntp_crypto_rnd.c
-===================================================================
---- ntp-4.2.8.orig/libntp/ntp_crypto_rnd.c
-+++ ntp-4.2.8/libntp/ntp_crypto_rnd.c
-@@ -24,6 +24,21 @@
- int crypto_rand_init = 0;
- #endif
- 
-+#ifndef HAVE_ARC4RANDOM_BUF
-+static void
-+arc4random_buf(void *buf, size_t nbytes);
-+
-+void
-+evutil_secure_rng_get_bytes(void *buf, size_t nbytes);
-+
-+static void
-+arc4random_buf(void *buf, size_t nbytes)
-+{
-+	evutil_secure_rng_get_bytes(buf, nbytes);
-+	return;
-+}
-+#endif
-+
- /*
-  * As of late 2014, here's how we plan to provide cryptographic-quality
-  * random numbers:
-Index: ntp-4.2.8/sntp/configure.ac
-===================================================================
---- ntp-4.2.8.orig/sntp/configure.ac
-+++ ntp-4.2.8/sntp/configure.ac
-@@ -97,11 +97,14 @@ esac
- enable_nls=no
- LIBOPTS_CHECK
- 
--AM_COND_IF(
--    [BUILD_SNTP],
--    [NTP_LIBEVENT_CHECK],
--    [NTP_LIBEVENT_CHECK_NOBUILD]
--)
-+# From when we only used libevent for sntp:
-+#AM_COND_IF(
-+#    [BUILD_SNTP],
-+#    [NTP_LIBEVENT_CHECK],
-+#    [NTP_LIBEVENT_CHECK_NOBUILD]
-+#)
-+
-+NTP_LIBEVENT_CHECK([2])
- 
- # Checks for libraries.
- 
-Index: ntp-4.2.8/sntp/m4/ntp_libevent.m4
-===================================================================
---- ntp-4.2.8.orig/sntp/m4/ntp_libevent.m4
-+++ ntp-4.2.8/sntp/m4/ntp_libevent.m4
-@@ -1,4 +1,25 @@
--dnl NTP_ENABLE_LOCAL_LIBEVENT				     -*- Autoconf -*-
-+# SYNOPSIS						-*- Autoconf -*-
-+#
-+#  NTP_ENABLE_LOCAL_LIBEVENT
-+#  NTP_LIBEVENT_CHECK([MINVERSION [, DIR]])
-+#  NTP_LIBEVENT_CHECK_NOBUILD([MINVERSION [, DIR]])
-+#
-+# DESCRIPTION
-+#
-+# AUTHOR
-+#
-+#  Harlan Stenn
-+#
-+# LICENSE
-+#
-+#  This file is Copyright (c) 2014 Network Time Foundation
-+# 
-+#  Copying and distribution of this file, with or without modification, are
-+#  permitted in any medium without royalty provided the copyright notice,
-+#  author attribution and this notice are preserved.  This file is offered
-+#  as-is, without any warranty.
-+
-+dnl NTP_ENABLE_LOCAL_LIBEVENT
- dnl
- dnl Provide only the --enable-local-libevent command-line option.
- dnl
-@@ -29,7 +50,7 @@ dnl If NOBUILD is provided as the 3rd ar
- dnl but DO NOT invoke DIR/configure if we are going to use our bundled
- dnl version.  This may be the case for nested packages.
- dnl
--dnl provide --enable-local-libevent .
-+dnl provides --enable-local-libevent .
- dnl
- dnl Examples:
- dnl
-Index: ntp-4.2.8/util/Makefile.am
-===================================================================
---- ntp-4.2.8.orig/util/Makefile.am
-+++ ntp-4.2.8/util/Makefile.am
-@@ -19,6 +19,7 @@ AM_LDFLAGS = $(LDFLAGS_NTP)
- LDADD=		../libntp/libntp.a $(LDADD_LIBNTP) $(LIBM) $(PTHREAD_LIBS)
- tg2_LDADD=	../libntp/libntp.a $(LDADD_LIBNTP) $(LIBM)
- ntp_keygen_LDADD  = version.o $(LIBOPTS_LDADD) ../libntp/libntp.a
-+ntp_keygen_LDADD += $(LDADD_LIBEVENT)
- ntp_keygen_LDADD += $(LDADD_LIBNTP) $(PTHREAD_LIBS) $(LDADD_NTP) $(LIBM)
- ntp_keygen_SOURCES = ntp-keygen.c ntp-keygen-opts.c ntp-keygen-opts.h
- 
diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
similarity index 95%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
index e802ee7..693bdbb 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p2.bb
@@ -6,7 +6,7 @@ or satellite receiver or modem."
 HOMEPAGE = "http://support.ntp.org"
 SECTION = "console/network"
 LICENSE = "NTP"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ebe123f74017224947c78d472407c10f"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f41fedb22dffefcbfafecc85b0f79cfa"
 
 DEPENDS = "pps-tools libevent"
 
@@ -21,11 +21,10 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://sntp.service \
            file://sntp \
            file://ntpd.list \
-           file://ntp-4.2.8-ntp-keygen-no-openssl.patch \
 "
 
-SRC_URI[md5sum] = "6972a626be6150db8cfbd0b63d8719e7"
-SRC_URI[sha256sum] = "2e920df8b6a5a410567a73767fa458c00c7f0acec3213e69ed0134414a50d8ee"
+SRC_URI[md5sum] = "fa37049383316322d060ec9061ac23a9"
+SRC_URI[sha256sum] = "0d69bc0e95caad43ea04fdad410e756bae1a71e67b1c2bd799b76b55e04c9b31"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
1.9.1


