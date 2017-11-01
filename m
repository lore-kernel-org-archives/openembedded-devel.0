Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72CBF77BC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 22:08:47 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a8so2997255pfc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ES5SXPdKJWVLo+N9i238JGbeVfd2moeyOj/z7m+S/DU=;
	b=kko+ob+J8sdUqqMYbY8mKtZ3/PTgNNfWKXCE6rZ6eohzwTIltUIfhshVXKtoat0Hbb
	gdwfp7hpThkQwge4JtInhbmHuDxUxc3amDjmA2Fc76MbrHCZXfs7IBSPSu75xI2MFJF8
	HidJw6+CIr7EpBvfa1ApyachTKpCNaOsiVMR2leUYH2U4KqkGKeO87P41F47g0dxxoGc
	O83J3pFS+0iZRGsSYaHUBaroChapObkfiJcTyW/XV1iyGxwr+Oql4kB3xJ4cYkT9uRU+
	f1JiuWXBcsyf8E9+0zXe6DF+gwMH3FRayTOdibXdtdFwNhexDs0GWqqUw9eShhIexxxz
	01zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ES5SXPdKJWVLo+N9i238JGbeVfd2moeyOj/z7m+S/DU=;
	b=NW2dLNS/A+GUAK8/HDfqsCirAYNb8ZhBt3weQUWQU7rXx9S+tiWfnklfy2HnYE7Bd1
	AjVVjbKFyLEQyg3I61Enxp/gsuLWcOrK0MFYM3p1s6f4Xrfh4ZbGVXPwYsNUoZp9z5VK
	/t6ZXVBjJfIDHw52VJgJzt1UOmD8wGsi3iAfgbYEPM4w2CdbCn6nrL6E6HLjXGqYr+16
	4NF59n3XDdvsSx+z0C/bDEsFY4Z+N+N8Aun0QaQM0VyD94pJj0niQXuSTuS1MFTMjAva
	6FxlIOr7eo+lWpFN0kxkWGsMqTiGXbjxJy5OQLJHpiCmP1m8Cx3hSt18fAHtr3HMqj03
	8mAw==
X-Gm-Message-State: AMCzsaXBMh+u2pz0/s1zxb6oOR5HAQniVjK5cMl/s8gO8ivQyVhBd9eC
	rizOyO0VpHJIh7/H8XtT6rvq0g==
X-Google-Smtp-Source: ABhQp+Q9tshaJ7BYZrJ0h3mO77KsdbqdvaWcvBLEt5C9dAq2UK/nzRBbSok6APBS7lPjJc2Sbflh3A==
X-Received: by 10.98.217.78 with SMTP id s75mr1395576pfg.40.1509574128125;
	Wed, 01 Nov 2017 15:08:48 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i187sm2613991pfc.96.2017.11.01.15.08.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 15:08:47 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 15:08:37 -0700
Message-Id: <1509574117-5004-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1509574117-5004-1-git-send-email-armccurdy@gmail.com>
References: <1509574117-5004-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 2/2] iksemel: reinstate recipe with build fixes and update 1.4 -> 1.5
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
X-List-Received-Date: Wed, 01 Nov 2017 22:08:47 -0000

The recipe for iksemel 1.4 was blacklisted and eventually removed as
it depended on an older version of gnutls which was no longer
available in oe-core.

Reinstate iksemel with a new recipe for iksemel 1.5, which can use
either openssl or gnutls for TLS support. Fix build issues.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../iksemel/avoid-obsolete-gnutls-apis.patch       | 55 +++++++++++++++++++
 .../iksemel/fix-configure-option-parsing.patch     | 62 ++++++++++++++++++++++
 meta-oe/recipes-support/iksemel/iksemel_1.5.bb     | 24 +++++++++
 3 files changed, 141 insertions(+)
 create mode 100644 meta-oe/recipes-support/iksemel/iksemel/avoid-obsolete-gnutls-apis.patch
 create mode 100644 meta-oe/recipes-support/iksemel/iksemel/fix-configure-option-parsing.patch
 create mode 100644 meta-oe/recipes-support/iksemel/iksemel_1.5.bb

diff --git a/meta-oe/recipes-support/iksemel/iksemel/avoid-obsolete-gnutls-apis.patch b/meta-oe/recipes-support/iksemel/iksemel/avoid-obsolete-gnutls-apis.patch
new file mode 100644
index 0000000..41fccc3
--- /dev/null
+++ b/meta-oe/recipes-support/iksemel/iksemel/avoid-obsolete-gnutls-apis.patch
@@ -0,0 +1,55 @@
+From 7136a908a056d0e36c89b6e1c39adff8ce2bb1d4 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 1 Nov 2017 13:17:34 -0700
+Subject: [PATCH] avoid obsolete gnutls apis
+
+The gnutls_*_set_priority() family of functions was marked deprecated
+in gnutls 2.12.x and removed completely in 3.5.x. These functions
+have been superceded by gnutls_priority_set_direct(), which was added
+in gnutls 2.2.0 (released 2007-12-14).
+
+Rather than simply update the custom gnutls_*_set_priority() calls to
+use gnutls_priority_set_direct(), drop the custom priority selection
+completely and use the recommended approach of letting gnutls pick a
+reasonable set of defaults.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ src/tls-gnutls.c | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/src/tls-gnutls.c b/src/tls-gnutls.c
+index d7b7c91..749e9ef 100644
+--- a/src/tls-gnutls.c
++++ b/src/tls-gnutls.c
+@@ -48,11 +48,6 @@ tls_pull (struct ikstls_data *data, char *buffer, size_t len)
+ static int
+ tls_handshake (struct ikstls_data **datap, ikstransport *trans, void *sock)
+ {
+-	const int protocol_priority[] = { GNUTLS_TLS1, GNUTLS_SSL3, 0 };
+-	const int kx_priority[] = { GNUTLS_KX_RSA, 0 };
+-	const int cipher_priority[] = { GNUTLS_CIPHER_3DES_CBC, GNUTLS_CIPHER_ARCFOUR, 0};
+-	const int comp_priority[] = { GNUTLS_COMP_ZLIB, GNUTLS_COMP_NULL, 0 };
+-	const int mac_priority[] = { GNUTLS_MAC_SHA, GNUTLS_MAC_MD5, 0 };
+ 	struct ikstls_data *data;
+ 	int ret;
+ 
+@@ -81,11 +76,8 @@ tls_handshake (struct ikstls_data **datap, ikstransport *trans, void *sock)
+ 		return IKS_NOMEM;
+ 	}
+ 
+-	gnutls_protocol_set_priority (data->sess, protocol_priority);
+-	gnutls_cipher_set_priority(data->sess, cipher_priority);
+-	gnutls_compression_set_priority(data->sess, comp_priority);
+-	gnutls_kx_set_priority(data->sess, kx_priority);
+-	gnutls_mac_set_priority(data->sess, mac_priority);
++	gnutls_set_default_priority (data->sess);
++
+ 	gnutls_credentials_set (data->sess, GNUTLS_CRD_CERTIFICATE, data->cred);
+ 
+ 	gnutls_transport_set_push_function (data->sess, (gnutls_push_func) tls_push);
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/iksemel/iksemel/fix-configure-option-parsing.patch b/meta-oe/recipes-support/iksemel/iksemel/fix-configure-option-parsing.patch
new file mode 100644
index 0000000..05accdd
--- /dev/null
+++ b/meta-oe/recipes-support/iksemel/iksemel/fix-configure-option-parsing.patch
@@ -0,0 +1,62 @@
+From 17a5cf8f70b86d8a2195562e2d9dcccb4fa35c83 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 31 Oct 2017 20:05:58 -0700
+Subject: [PATCH] fix configure option parsing
+
+Don't over-write with_openssl etc by trying to set to $enablevar
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.ac | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 82e6d2d..823e6c1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,17 +56,17 @@ fi
+ dnl Options for overriding TLS checks
+ AC_ARG_WITH([openssl],
+   AS_HELP_STRING([--without-openssl],[disable checking for openssl]),
+-  [with_openssl=$enableval],
+-  [with_openssl=yes]
++  [],
++  [with_openssl=auto]
+ )
+ AC_ARG_WITH([gnutls],
+   AS_HELP_STRING([--without-gnutls],[disable checking for GNU TLS]),
+-  [with_gnutls=$enableval],
+-  [with_gnutls=yes]
++  [],
++  [with_gnutls=auto]
+ )
+ 
+ dnl Check OpenSSL
+-if test "x$with_openssl" = "xyes"; then
++if test "x$with_openssl" != "xno"; then
+   PKG_CHECK_MODULES([OPENSSL], openssl >= 0.9.8, have_openssl=yes, have_openssl=no)
+   if test "x$have_openssl" = "xyes"; then
+     LIBOPENSSL_CFLAGS="$OPENSSL_CFLAGS"
+@@ -78,7 +78,7 @@ if test "x$with_openssl" = "xyes"; then
+ fi
+ 
+ dnl Check GNU TLS
+-if test "x$with_gnutls" = "xyes"; then
++if test "x$with_gnutls" != "xno"; then
+   if test "x$have_openssl" != "xyes"; then
+     PKG_CHECK_MODULES([GNUTLS], gnutls >= 2.0.0, have_gnutls=yes, have_gnutls=no)
+     if test "x$have_gnutls" = "xyes"; then
+@@ -94,7 +94,7 @@ fi
+ dnl Option for overriding Python check
+ AC_ARG_ENABLE([python],
+   AS_HELP_STRING([--disable-python],[disable checking for Python bindings]),
+-  [with_python=$enableval],
++  [],
+   [with_python=yes]
+ )
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
new file mode 100644
index 0000000..0903e90
--- /dev/null
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Fast and portable XML parser and Jabber protocol library"
+HOMEPAGE = "https://github.com/meduketto/iksemel"
+SECTION = "libs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
+
+SRCREV = "978b733462e41efd5db72bc9974cb3b0d1d5f6fa"
+PV = "1.5+git${SRCPV}"
+
+SRC_URI = "git://github.com/meduketto/iksemel.git;protocol=https \
+           file://fix-configure-option-parsing.patch \
+           file://avoid-obsolete-gnutls-apis.patch"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig lib_package
+
+# TLS support requires either openssl or gnutls (if both are enabled openssl will be used).
+PACKAGECONFIG ?= "gnutls"
+
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl"
+
+EXTRA_OECONF = "--disable-python"
-- 
1.9.1


