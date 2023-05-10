Return-Path: <ml@embed.me.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68039C7EE24
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 09:06:58 +0000 (UTC)
Received: from dane.soverin.net (dane.soverin.net [185.233.34.149])
 by mx.groups.io with SMTP id smtpd.web11.11847.1683709613609049119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 02:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 185.233.34.149, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (c04smtp-lb01.int.sover.in [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4QGTfz0d4czyfx;
	Wed, 10 May 2023 09:06:51 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.99]) by soverin.net (Postfix) with ESMTPSA id 4QGTfy2Td3zFX;
	Wed, 10 May 2023 09:06:50 +0000 (UTC)
X-Soverin-Authenticated: true
From: Jack Mitchell <ml@embed.me.uk>
To: "openembedded-devel@lists.openembedded.org"@lists.openembedded.org
Cc: Jack Mitchell <ml@embed.me.uk>
Subject: [meta-oe][dunfell][PATCH 1/2] nss: backport fix for native build failure due to implicit casting with gcc13
Date: Wed, 10 May 2023 10:06:47 +0100
Message-Id: <20230510090648.2762735-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 09:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102527

Upstream-Status: Backport
Link: https://github.com/nss-dev/nss/commit/4e7e332b25a2794f381323518e52d=
8d95273b69e

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 ...d-failure-while-implicitly-casting-S.patch | 46 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1812671-buil=
d-failure-while-implicitly-casting-S.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1812671-build-failu=
re-while-implicitly-casting-S.patch b/meta-oe/recipes-support/nss/nss/000=
1-Bug-1812671-build-failure-while-implicitly-casting-S.patch
new file mode 100644
index 000000000..b935d9eec
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1812671-build-failure-whil=
e-implicitly-casting-S.patch
@@ -0,0 +1,46 @@
+From 4e7e332b25a2794f381323518e52d8d95273b69e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Franti=3DC5=3DA1ek=3D20Kren=3DC5=3DBEelok?=3D <fkrenze=
l@redhat.com>
+Date: Mon, 30 Jan 2023 12:59:20 +0000
+Subject: [PATCH] Bug 1812671 - build failure while implicitly casting
+ SECStatus to PRUInt32. r=3Dnss-reviewers,mt
+
+Author of the patch: Bob Relyea <rrelyea@redhat.com>
+
+Differential Revision: https://phabricator.services.mozilla.com/D167983
+
+--HG--
+extra : moz-landing-system : lando
+---
+ lib/ssl/ssl3exthandle.c | 2 +-
+ lib/ssl/sslsnce.c       | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ssl/ssl3exthandle.c b/lib/ssl/ssl3exthandle.c
+index b5ae62f39..7134447bf 100644
+--- a/lib/ssl/ssl3exthandle.c
++++ b/lib/ssl/ssl3exthandle.c
+@@ -201,7 +201,7 @@ ssl3_FreeSniNameArray(TLSExtensionData *xtnData)
+  * Clients sends a filled in session ticket if one is available, and ot=
herwise
+  * sends an empty ticket.  Servers always send empty tickets.
+  */
+-PRInt32
++SECStatus
+ ssl3_ClientSendSessionTicketXtn(const sslSocket *ss, TLSExtensionData *=
xtnData,
+                                 sslBuffer *buf, PRBool *added)
+ {
+diff --git a/lib/ssl/sslsnce.c b/lib/ssl/sslsnce.c
+index 56edafa1f..49f041c97 100644
+--- a/lib/ssl/sslsnce.c
++++ b/lib/ssl/sslsnce.c
+@@ -1820,7 +1820,7 @@ ssl_GetSelfEncryptKeyPair(SECKEYPublicKey **pubKey=
,
+     return SECSuccess;
+ }
+=20
+-static PRBool
++static SECStatus
+ ssl_GenerateSelfEncryptKeys(void *pwArg, PRUint8 *keyName,
+                             PK11SymKey **aesKey, PK11SymKey **macKey);
+=20
+--=20
+2.40.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-=
support/nss/nss_3.51.1.bb
index 1de2a4009..721b38ddb 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -43,6 +43,7 @@ SRC_URI =3D "http://ftp.mozilla.org/pub/mozilla.org/sec=
urity/nss/releases/${VERSIO
            file://CVE-2021-43527.patch \
            file://CVE-2022-22747.patch \
            file://CVE-2023-0767.patch \
+           file://0001-Bug-1812671-build-failure-while-implicitly-castin=
g-S.patch;patchdir=3Dnss \
            "
=20
 SRC_URI[md5sum] =3D "6acaf1ddff69306ae30a908881c6f233"
--=20
2.40.1


