Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EF5C43217
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:47:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.15442.1641941259595656806
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:47:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=Z0Y2OOwR;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2E7FB80FDA;
	Tue, 11 Jan 2022 23:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1641941255;
	bh=b8HfVP71LFMBQkGfOg/Ma0GcrVA1SM9wDcEFroqqs9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z0Y2OOwRw3cIzvPzu/C6y3C/9U8hc2ylpkb8sK1AgsyKrIPBFZ0xSg0I1BGyiBi6O
	 Y8OK+wkqW7B3dE062C+Su6XWvpASHxv6ONCLgsi7Gc4O6DVRV6bj0j0H1OdW4aDg8/
	 CJMGwbyyXYfs76hDntOYIkU5n+efHMnZ5NNGg4tDLl7NChh9Bgxc/6b/qSacakHJBc
	 L52eHlA9iiM9MB3xAM3w/BUYg8iWP9nKYp0H+Q958K//1kXLfHYDFV4DtL96TnVCWl
	 WBGGShsAzDcbu49+PBN7EX+1z1zjxlwSp7wujk8M/mBxn+vEJbLyzUVY486iHTeRjt
	 Wb2phlh2Y59EQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Marek Vasut <marex@denx.de>
Subject: [meta-oe][dunfell][PATCH 3/5] freerdp: backport openssl 3.x patches
Date: Tue, 11 Jan 2022 23:47:12 +0100
Message-Id: <20220111224714.1289840-3-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111224714.1289840-1-marex@denx.de>
References: <20220111224714.1289840-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jan 2022 22:47:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94765

From: Alexander Kanavin <alex.kanavin@gmail.com>

(cherry picked from commit 17ad891757f0a66fabcb7f224c4d36fe6d69ba3b)
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
 ...e-support-and-build-with-OpenSSL-3.0.patch | 43 +++++++++++++++++++
 ...d-calling-FIPS_mode-with-OpenSSL-3.0.patch | 28 ++++++++++++
 .../recipes-support/freerdp/freerdp_2.3.0.bb  |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS=
-mode-support-and-build-with-OpenSSL-3.0.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/0002-winpr-av=
oid-calling-FIPS_mode-with-OpenSSL-3.0.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-s=
upport-and-build-with-OpenSSL-3.0.patch b/meta-oe/recipes-support/freerdp=
/freerdp/0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch
new file mode 100644
index 000000000..04fe644d4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0001-Fix-FIPS-mode-support-=
and-build-with-OpenSSL-3.0.patch
@@ -0,0 +1,43 @@
+From f703b1184229796d504a2e833f72ace4cc605d15 Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Wed, 12 May 2021 12:48:15 +0200
+Subject: [PATCH 1/2] Fix FIPS mode support and build with OpenSSL 3.0
+
+FreeRDP fails to build with OpenSSL 3.0 because of usage of the `FIPS_mo=
de`
+and `FIPS_mode_set` functions, which were removed there. Just a note tha=
t
+the FIPS mode is not supported by OpenSSL 1.1.* although the mentioned
+functions are still there (see https://wiki.openssl.org/index.php/FIPS_m=
odules).
+Let's make FreeRDP build with OpenSSL 3.0 and fix the FIPS mode support.
+
+See: https://bugzilla.redhat.com/show_bug.cgi?id=3D1952937
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ winpr/libwinpr/utils/ssl.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/winpr/libwinpr/utils/ssl.c b/winpr/libwinpr/utils/ssl.c
+index 3a8590390..03b23af43 100644
+--- a/winpr/libwinpr/utils/ssl.c
++++ b/winpr/libwinpr/utils/ssl.c
+@@ -244,9 +244,17 @@ static BOOL winpr_enable_fips(DWORD flags)
+ #else
+ 		WLog_DBG(TAG, "Ensuring openssl fips mode is ENabled");
+=20
++#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >=3D 3)
++		if (!EVP_default_properties_is_fips_enabled(NULL))
++#else
+ 		if (FIPS_mode() !=3D 1)
++#endif
+ 		{
++#if defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >=3D 3)
++			if (EVP_set_default_properties(NULL, "fips=3Dyes"))
++#else
+ 			if (FIPS_mode_set(1))
++#endif
+ 				WLog_INFO(TAG, "Openssl fips mode ENabled!");
+ 			else
+ 			{
+--=20
+2.20.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-cal=
ling-FIPS_mode-with-OpenSSL-3.0.patch b/meta-oe/recipes-support/freerdp/f=
reerdp/0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch
new file mode 100644
index 000000000..728638e15
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/0002-winpr-avoid-calling-FI=
PS_mode-with-OpenSSL-3.0.patch
@@ -0,0 +1,28 @@
+From 4dbf108c0ae5e997d5c432f3da4b4c5fd7b35373 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Sun, 1 Aug 2021 12:14:43 -0400
+Subject: [PATCH 2/2] winpr: avoid calling FIPS_mode() with OpenSSL 3.0
+
+Fixes: 26bf2816c3e0daeaf524c47cf0fcda8ae13b65ad
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ winpr/libwinpr/utils/ssl.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/winpr/libwinpr/utils/ssl.c b/winpr/libwinpr/utils/ssl.c
+index 03b23af43..74ef156e7 100644
+--- a/winpr/libwinpr/utils/ssl.c
++++ b/winpr/libwinpr/utils/ssl.c
+@@ -364,6 +364,8 @@ BOOL winpr_FIPSMode(void)
+ {
+ #if (OPENSSL_VERSION_NUMBER < 0x10001000L) || defined(LIBRESSL_VERSION_=
NUMBER)
+ 	return FALSE;
++#elif defined(OPENSSL_VERSION_MAJOR) && (OPENSSL_VERSION_MAJOR >=3D 3)
++	return (EVP_default_properties_is_fips_enabled(NULL) =3D=3D 1);
+ #else
+ 	return (FIPS_mode() =3D=3D 1);
+ #endif
+--=20
+2.20.1
+
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb b/meta-oe/r=
ecipes-support/freerdp/freerdp_2.3.0.bb
index e37e71b32..57170f68a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.3.0.bb
@@ -16,6 +16,8 @@ PKGV =3D "${GITPKGVTAG}"
 SRCREV =3D "14c7f7aed7dd4e2454ee0cd81028b9f790885021"
 SRC_URI =3D "git://github.com/FreeRDP/FreeRDP.git;branch=3Dstable-2.0;pr=
otocol=3Dhttps \
     file://winpr-makecert-Build-with-install-RPATH.patch \
+    file://0001-Fix-FIPS-mode-support-and-build-with-OpenSSL-3.0.patch \
+    file://0002-winpr-avoid-calling-FIPS_mode-with-OpenSSL-3.0.patch \
 "
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


