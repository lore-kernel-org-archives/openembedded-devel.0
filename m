Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0EDD42BBA
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 17:46:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.93119.1731433561959301341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 09:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 603EF1650
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 09:46:31 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 16B6C3F59E
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 09:46:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] iksemel: remove
Date: Tue, 12 Nov 2024 17:45:54 +0000
Message-Id: <20241112174555.1525173-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 17:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113797

Iksemel is a XML parser library that was designed for Jabber applications=
,
but it has no users and hasn't been maintained for 13 years.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../iksemel/avoid-obsolete-gnutls-apis.patch  | 55 ----------------
 .../fix-configure-option-parsing.patch        | 62 -------------------
 .../recipes-support/iksemel/iksemel_1.5.bb    | 27 --------
 4 files changed, 145 deletions(-)
 delete mode 100644 meta-oe/recipes-support/iksemel/iksemel/avoid-obsolet=
e-gnutls-apis.patch
 delete mode 100644 meta-oe/recipes-support/iksemel/iksemel/fix-configure=
-option-parsing.patch
 delete mode 100644 meta-oe/recipes-support/iksemel/iksemel_1.5.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 178256c83f..7071fa814e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -765,7 +765,6 @@ RDEPENDS:packagegroup-meta-oe-support =3D "\
     hunspell-dictionaries \
     hwdata \
     icyque \
-    iksemel \
     imagemagick \
     imapfilter \
     iniparser \
diff --git a/meta-oe/recipes-support/iksemel/iksemel/avoid-obsolete-gnutl=
s-apis.patch b/meta-oe/recipes-support/iksemel/iksemel/avoid-obsolete-gnu=
tls-apis.patch
deleted file mode 100644
index 41fccc3ab0..0000000000
--- a/meta-oe/recipes-support/iksemel/iksemel/avoid-obsolete-gnutls-apis.=
patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 7136a908a056d0e36c89b6e1c39adff8ce2bb1d4 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Wed, 1 Nov 2017 13:17:34 -0700
-Subject: [PATCH] avoid obsolete gnutls apis
-
-The gnutls_*_set_priority() family of functions was marked deprecated
-in gnutls 2.12.x and removed completely in 3.5.x. These functions
-have been superceded by gnutls_priority_set_direct(), which was added
-in gnutls 2.2.0 (released 2007-12-14).
-
-Rather than simply update the custom gnutls_*_set_priority() calls to
-use gnutls_priority_set_direct(), drop the custom priority selection
-completely and use the recommended approach of letting gnutls pick a
-reasonable set of defaults.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- src/tls-gnutls.c | 12 ++----------
- 1 file changed, 2 insertions(+), 10 deletions(-)
-
-diff --git a/src/tls-gnutls.c b/src/tls-gnutls.c
-index d7b7c91..749e9ef 100644
---- a/src/tls-gnutls.c
-+++ b/src/tls-gnutls.c
-@@ -48,11 +48,6 @@ tls_pull (struct ikstls_data *data, char *buffer, siz=
e_t len)
- static int
- tls_handshake (struct ikstls_data **datap, ikstransport *trans, void *s=
ock)
- {
--	const int protocol_priority[] =3D { GNUTLS_TLS1, GNUTLS_SSL3, 0 };
--	const int kx_priority[] =3D { GNUTLS_KX_RSA, 0 };
--	const int cipher_priority[] =3D { GNUTLS_CIPHER_3DES_CBC, GNUTLS_CIPHE=
R_ARCFOUR, 0};
--	const int comp_priority[] =3D { GNUTLS_COMP_ZLIB, GNUTLS_COMP_NULL, 0 =
};
--	const int mac_priority[] =3D { GNUTLS_MAC_SHA, GNUTLS_MAC_MD5, 0 };
- 	struct ikstls_data *data;
- 	int ret;
-=20
-@@ -81,11 +76,8 @@ tls_handshake (struct ikstls_data **datap, ikstranspo=
rt *trans, void *sock)
- 		return IKS_NOMEM;
- 	}
-=20
--	gnutls_protocol_set_priority (data->sess, protocol_priority);
--	gnutls_cipher_set_priority(data->sess, cipher_priority);
--	gnutls_compression_set_priority(data->sess, comp_priority);
--	gnutls_kx_set_priority(data->sess, kx_priority);
--	gnutls_mac_set_priority(data->sess, mac_priority);
-+	gnutls_set_default_priority (data->sess);
-+
- 	gnutls_credentials_set (data->sess, GNUTLS_CRD_CERTIFICATE, data->cred=
);
-=20
- 	gnutls_transport_set_push_function (data->sess, (gnutls_push_func) tls=
_push);
---=20
-1.9.1
-
diff --git a/meta-oe/recipes-support/iksemel/iksemel/fix-configure-option=
-parsing.patch b/meta-oe/recipes-support/iksemel/iksemel/fix-configure-op=
tion-parsing.patch
deleted file mode 100644
index 05accdd9c8..0000000000
--- a/meta-oe/recipes-support/iksemel/iksemel/fix-configure-option-parsin=
g.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 17a5cf8f70b86d8a2195562e2d9dcccb4fa35c83 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 31 Oct 2017 20:05:58 -0700
-Subject: [PATCH] fix configure option parsing
-
-Don't over-write with_openssl etc by trying to set to $enablevar
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- configure.ac | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 82e6d2d..823e6c1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,17 +56,17 @@ fi
- dnl Options for overriding TLS checks
- AC_ARG_WITH([openssl],
-   AS_HELP_STRING([--without-openssl],[disable checking for openssl]),
--  [with_openssl=3D$enableval],
--  [with_openssl=3Dyes]
-+  [],
-+  [with_openssl=3Dauto]
- )
- AC_ARG_WITH([gnutls],
-   AS_HELP_STRING([--without-gnutls],[disable checking for GNU TLS]),
--  [with_gnutls=3D$enableval],
--  [with_gnutls=3Dyes]
-+  [],
-+  [with_gnutls=3Dauto]
- )
-=20
- dnl Check OpenSSL
--if test "x$with_openssl" =3D "xyes"; then
-+if test "x$with_openssl" !=3D "xno"; then
-   PKG_CHECK_MODULES([OPENSSL], openssl >=3D 0.9.8, have_openssl=3Dyes, =
have_openssl=3Dno)
-   if test "x$have_openssl" =3D "xyes"; then
-     LIBOPENSSL_CFLAGS=3D"$OPENSSL_CFLAGS"
-@@ -78,7 +78,7 @@ if test "x$with_openssl" =3D "xyes"; then
- fi
-=20
- dnl Check GNU TLS
--if test "x$with_gnutls" =3D "xyes"; then
-+if test "x$with_gnutls" !=3D "xno"; then
-   if test "x$have_openssl" !=3D "xyes"; then
-     PKG_CHECK_MODULES([GNUTLS], gnutls >=3D 2.0.0, have_gnutls=3Dyes, h=
ave_gnutls=3Dno)
-     if test "x$have_gnutls" =3D "xyes"; then
-@@ -94,7 +94,7 @@ fi
- dnl Option for overriding Python check
- AC_ARG_ENABLE([python],
-   AS_HELP_STRING([--disable-python],[disable checking for Python bindin=
gs]),
--  [with_python=3D$enableval],
-+  [],
-   [with_python=3Dyes]
- )
-=20
---=20
-1.9.1
-
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb b/meta-oe/rec=
ipes-support/iksemel/iksemel_1.5.bb
deleted file mode 100644
index b27c2b2e8a..0000000000
--- a/meta-oe/recipes-support/iksemel/iksemel_1.5.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY =3D "Fast and portable XML parser and Jabber protocol library"
-HOMEPAGE =3D "https://github.com/meduketto/iksemel"
-SECTION =3D "libs"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b=
499"
-
-SRCREV =3D "978b733462e41efd5db72bc9974cb3b0d1d5f6fa"
-PV =3D "1.5+git"
-
-SRC_URI =3D "git://github.com/meduketto/iksemel.git;protocol=3Dhttps;bra=
nch=3Dmaster \
-           file://fix-configure-option-parsing.patch \
-           file://avoid-obsolete-gnutls-apis.patch"
-
-# The current PV is not a git tag but a README content
-UPSTREAM_CHECK_COMMITS =3D "1"
-
-S =3D "${WORKDIR}/git"
-
-inherit autotools pkgconfig lib_package texinfo
-
-# TLS support requires either openssl or gnutls (if both are enabled ope=
nssl will be used).
-PACKAGECONFIG ?=3D "gnutls"
-
-PACKAGECONFIG[gnutls] =3D "--with-gnutls,--without-gnutls,gnutls"
-PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
-
-EXTRA_OECONF =3D "--disable-python"
--=20
2.34.1


