Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B417910ED67D
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 00:40:43 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2692.1774658434685539677
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=WKFuEa2L;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id DF3AF38FE4
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 01:40:32 +0100 (CET)
Received: from fedora.fritz.box ([84.163.35.64]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w6Hj4-2mww8w0; Sat, 28 Mar 2026 01:40:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] xdg-dbus-proxy: fix issue with glibc >= 2.43
Date: Sat, 28 Mar 2026 01:40:25 +0100
Message-ID: <20260328004025.592494-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328004025.592494-1-f_l_k@t-online.de>
References: <20260328004025.592494-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774658430-C9FF880B-B6A4B7DA/0/0 CLEAN NORMAL
X-TOI-MSGID: f3c9609f-a588-4e91-babb-47887bb2cfc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774658432; i=f_l_k@t-online.de;
	bh=Q9KYDkYYtRYy9JTNjwOyynJFFgC4mPLrH2LgzhibLpU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=WKFuEa2LiVIgRFI6EuRcafHYQaZnpR1Bg+d1gBQNrwE9R8icNU4yzvpdB7PQx8krO
	 bMbjKcfR/q2p/q57cZGI4uU4zHypsepG7AASoFyNo+1/o82xVZTJ/a441GkOCOtuPP
	 eP0Iq/QunC2Rb+zpijnIueoDXOSSfpL2vMR3k9Z/iB9bIh+NfLyr3Q6etWv/wBd/jW
	 C2+NvCCGIUizf7qB46qe2vKZRx2vTks1VwrHqihNG5W+SfwXxJuFydqTtoa/lLyNFc
	 hz6+ZYwoNW1VraTissMkK4k/AieR2afoGezvF1jNfG6z9m3MCRlRg7sxdIdfamsbOf
	 wwI7RYMIIwKDw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 00:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125793

Add a backport patch to fix an issue with glibc >=3D 2.43

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...b9f68664166badfdfaa7e69efcedf750f1e3.patch | 33 +++++++++++++++++++
 .../xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy=
/99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/99f9b9=
f68664166badfdfaa7e69efcedf750f1e3.patch b/meta-oe/recipes-support/xdg-db=
us-proxy/xdg-dbus-proxy/99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch
new file mode 100644
index 0000000000..5ae21b5989
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/99f9b9f686641=
66badfdfaa7e69efcedf750f1e3.patch
@@ -0,0 +1,33 @@
+From 99f9b9f68664166badfdfaa7e69efcedf750f1e3 Mon Sep 17 00:00:00 2001
+From: Brahmajit Das <listout@listout.xyz>
+Date: Wed, 4 Mar 2026 06:27:54 +0530
+Subject: [PATCH] dbus-proxy: fix build with glibc >=3D 2.43
+
+memchr() returns const void * when passed const input, but the result
+was assigned to guchar *. This triggers
+-Wincompatible-pointer-types-discards-qualifiers when building with
+clang and -Werror.
+
+Make the pointer const to preserve const correctness.
+
+Closes: https://github.com/flatpak/xdg-dbus-proxy/issues/70
+Signed-off-by: Brahmajit Das <listout@listout.xyz>
+
+Upstream-Status: Backport [https://github.com/flatpak/xdg-dbus-proxy/com=
mit/99f9b9f68664166badfdfaa7e69efcedf750f1e3]
+---
+ dbus-proxy.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbus-proxy.c b/dbus-proxy.c
+index 53d5c01..b32df34 100644
+--- a/dbus-proxy.c
++++ b/dbus-proxy.c
+@@ -133,7 +133,7 @@ add_args (GBytes    *bytes,
+ {
+   gsize data_len, remainder_len;
+   const guchar *data =3D g_bytes_get_data (bytes, &data_len);
+-  guchar *s;
++  const guchar *s;
+   const guchar *remainder;
+=20
+   remainder =3D data;
diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.=
bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
index 28773163c5..617d29bd84 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
@@ -13,6 +13,7 @@ inherit meson pkgconfig ptest-gnome
=20
 SRC_URI =3D " \
     git://github.com/flatpak/xdg-dbus-proxy.git;protocol=3Dhttps;branch=3D=
main \
+    file://99f9b9f68664166badfdfaa7e69efcedf750f1e3.patch \
     file://run-ptest \
     "
=20
--=20
2.53.0


