Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 261506FD62
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 07:47:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5I7lokc029809
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 00:47:50 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 18 Jun 2014 00:47:49 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jun 2014 15:48:04 +0800
Message-ID: <1403077684-32640-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] rsyslog: use pkgconfig to check libgcrypt
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
X-List-Received-Date: Wed, 18 Jun 2014 07:47:53 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

libgcrypt does no longer provide libgcrypt-config, and provide
*.pc, so we should use pkgconfig to check

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../rsyslog/use-pkgconfig-to-check-libgcrypt.patch |   48 ++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb  |    1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
new file mode 100644
index 0000000..ebc1070
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
@@ -0,0 +1,48 @@
+From 5c3ba79177f7d1763db33c4358af2af60ff214b7 Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com> 
+Date: Wed, 18 Jun 2014 13:46:52 +0800
+Subject: [PATCH] use pkgconfig to check libgcrypt
+
+Upstream-status: Inappropriate [configuration]
+
+libgcrypt does no longer provide libgcrypt-config, and provide
+*.pc, so we should use pkgconfig to check
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.ac |   19 +------------------
+ 1 file changed, 1 insertion(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 017116e..1b880f8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -784,24 +784,7 @@ AC_ARG_ENABLE(libgcrypt,
+         [enable_libgcrypt=yes]
+ )
+ if test "x$enable_libgcrypt" = "xyes"; then
+-        AC_CHECK_PROG(
+-      	    [HAVE_LIBGCRYPT_CONFIG],
+-            [libgcrypt-config],
+-            [yes],,,
+-            )
+-        if test "x${HAVE_LIBGCRYPT_CONFIG}" != "xyes"; then
+-           AC_MSG_FAILURE([libgcrypt-config not found in PATH])
+-        fi
+-        AC_CHECK_LIB(
+-		[gcrypt],
+-        	[gcry_cipher_open],
+-        	[LIBGCRYPT_CFLAGS="`libgcrypt-config --cflags`"
+-        	LIBGCRYPT_LIBS="`libgcrypt-config --libs`"
+-        	],
+-        	[AC_MSG_FAILURE([libgcrypt is missing])],
+-        	[`libgcrypt-config --libs --cflags`]
+-        	)
+-	AC_DEFINE([ENABLE_LIBGCRYPT], [1], [Indicator that LIBGCRYPT is present])
++	PKG_CHECK_MODULES(LIBGCRYPT, libgcrypt)
+ fi
+ AM_CONDITIONAL(ENABLE_LIBGCRYPT, test x$enable_libgcrypt = xyes)
+ AC_SUBST(LIBGCRYPT_CFLAGS)
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 344a131..3bb92fa 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://initscript \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
+           file://use-pkgconfig-to-check-libgcrypt.patch \
 "
 
 SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
-- 
1.7.10.4


