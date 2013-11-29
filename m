Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 458326D138
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 06:23:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAT6Ns2B000375
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 22:23:54 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 28 Nov 2013 22:23:53 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 29 Nov 2013 14:23:53 +0800
Message-ID: <1385706233-21009-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] tcpdump: enable crypto
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
X-List-Received-Date: Fri, 29 Nov 2013 06:23:54 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. enable crypto based on PACKAGECONFIG openssl
2. port check-openssl.diff from debian to fix configuration failure when
enable crypto

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../tcpdump/tcpdump-4.3.0/check-openssl.diff       |   84 ++++++++++++++++++++
 .../recipes-support/tcpdump/tcpdump_4.3.0.bb       |    6 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/check-openssl.diff

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/check-openssl.diff b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/check-openssl.diff
new file mode 100644
index 0000000..8fc3d6f
--- /dev/null
+++ b/meta-networking/recipes-support/tcpdump/tcpdump-4.3.0/check-openssl.diff
@@ -0,0 +1,84 @@
+fix-check-openssl
+
+Upstream-Status: Inappropriate [configuration]
+
+patch is from http://ftp.de.debian.org/debian/pool/main/t/tcpdump/tcpdump_4.3.0-1.debian.tar.gz
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.in |   59 ++--------------------------------------------------------
+ 1 file changed, 2 insertions(+), 57 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 9600d6a..eace9ed 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1028,63 +1028,8 @@ AC_ARG_WITH(crypto,
+ 	AC_MSG_RESULT([yes, if available])
+ ])
+ if test "$want_libcrypto" != "no"; then
+-	ac_cv_ssleay_path=no
+-	incdir=no
+-	if test "x$crypto_dir" = x; then
+-		#
+-		# Location not specified; check the default locations.
+-		#
+-		AC_MSG_CHECKING(where SSLeay is located)
+-		dirs="/usr /usr/local /usr/local/ssl /usr/pkg"
+-		if test "x${host_alias}" != x; then
+-			dirs="/usr/${host_alias} $dirs"
+-		fi
+-		for dir in $dirs; do
+-			AC_LBL_SSLEAY($dir)
+-
+-			if test "$ac_cv_ssleay_path" != "no" -a "$incdir" != "no"; then
+-				break;
+-			else
+-				ac_cv_ssleay_path=no
+-				incdir=no
+-			fi
+-		done
+-		if test "$ac_cv_ssleay_path" != no; then
+-			AC_MSG_RESULT($ac_cv_ssleay_path)
+-		fi
+-	else
+-		AC_MSG_CHECKING(for SSLeay in $crypto_dir)
+-		AC_LBL_SSLEAY($crypto_dir)
+-		if test "$ac_cv_ssleay_path" != no; then
+-			AC_MSG_RESULT(found)
+-		fi
+-	fi
+-	if test "$ac_cv_ssleay_path" != no; then
+-		V_INCLS="$V_INCLS $incdir"
+-		if test "$dir" != "/usr"; then
+-			LDFLAGS="-L$dir/lib $LDFLAGS"
+-		fi
+-		if test -f $ac_cv_ssleay_path/lib/libRSAglue.a; then
+-			LIBS="$LIBS -lRSAglue"
+-		fi
+-		if test -f $ac_cv_ssleay_path/lib/librsaref.a; then
+-			LIBS="$LIBS -lrsaref"
+-		fi
+-		AC_CHECK_LIB(crypto, DES_cbc_encrypt)
+-
+-		savedcppflags="$CPPFLAGS"
+-		CPPFLAGS="$CPPFLAGS $V_INCLS"
+-		AC_CHECK_HEADERS(openssl/evp.h)
+-		CPPFLAGS="$savedcppflags"
+-	else
+-		#
+-		# Not found.  Did the user explicitly ask for it?
+-		#
+-		AC_MSG_RESULT(not found)
+-		if test "$want_libcrypto" = yes; then
+-			AC_MSG_ERROR(SSLeay not found)
+-		fi
+-	fi
++	AC_CHECK_LIB(crypto, DES_cbc_encrypt)
++	AC_CHECK_HEADERS(openssl/evp.h)
+ fi
+ 
+ dnl
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
index 1da8194..b7eee60 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.3.0.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://0001-minimal-IEEE802.15.4-allowed.patch \
     file://ipv6-cross.patch \
     file://configure.patch \
+    file://check-openssl.diff \
 "
 SRC_URI[md5sum] = "a3fe4d30ac85ff5467c889ff46b7e1e8"
 SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712dba4286"
@@ -18,9 +19,12 @@ SRC_URI[sha256sum] = "efd08b610210d39977ec3175fa82dad9fbd33587930081be2a905a712d
 inherit autotools
 CACHED_CONFIGUREVARS = "ac_cv_linux_vers=${ac_cv_linux_vers=2}"
 
-EXTRA_OECONF = "--without-crypto --disable-rpath \
+EXTRA_OECONF = "--disable-rpath \
         ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6', '--disable-ipv6', d)}"
 
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-crypto=yes, --without-openssl --without-crypto, openssl"
+
 EXTRA_AUTORECONF += " -I m4"
 
 do_configure_prepend() {
-- 
1.7.10.4


