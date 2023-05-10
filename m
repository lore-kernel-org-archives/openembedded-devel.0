Return-Path: <ml@embed.me.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670B3C7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 09:06:58 +0000 (UTC)
Received: from dane.soverin.net (dane.soverin.net [185.233.34.148])
 by mx.groups.io with SMTP id smtpd.web10.11943.1683709614857245042
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 02:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 185.233.34.148, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (c04smtp-lb01.int.sover.in [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4QGTg12phnz2xyD;
	Wed, 10 May 2023 09:06:53 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.99]) by soverin.net (Postfix) with ESMTPSA id 4QGTg003FzzFX;
	Wed, 10 May 2023 09:06:51 +0000 (UTC)
X-Soverin-Authenticated: true
From: Jack Mitchell <ml@embed.me.uk>
To: "openembedded-devel@lists.openembedded.org"@lists.openembedded.org
Cc: Jack Mitchell <ml@embed.me.uk>
Subject: [meta-oe][dunfell][PATCH 2/2] nss: backport fix for native build failure due to dangling pointer with gcc13
Date: Wed, 10 May 2023 10:06:48 +0100
Message-Id: <20230510090648.2762735-2-ml@embed.me.uk>
In-Reply-To: <20230510090648.2762735-1-ml@embed.me.uk>
References: <20230510090648.2762735-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 09:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102528

Upstream-Status: Backport
Link: https://github.com/nss-dev/nss/commit/cbf5a2bce75ca2c2fd3e247796b98=
92f5298584e

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 ...ecperf-fix-dangling-pointer-warning-.patch | 75 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-=
ecperf-fix-dangling-pointer-warning-.patch

diff --git a/meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-=
fix-dangling-pointer-warning-.patch b/meta-oe/recipes-support/nss/nss/000=
1-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warning-.patch
new file mode 100644
index 000000000..dc7e172aa
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/0001-Bug-1826650-cmd-ecperf-fix-dan=
gling-pointer-warning-.patch
@@ -0,0 +1,75 @@
+From cbf5a2bce75ca2c2fd3e247796b9892f5298584e Mon Sep 17 00:00:00 2001
+From: "John M. Schanck" <jschanck@mozilla.com>
+Date: Thu, 13 Apr 2023 17:43:46 +0000
+Subject: [PATCH] Bug 1826650 - cmd/ecperf: fix dangling pointer warning =
on gcc
+ 13. r=3Ddjackson
+
+Differential Revision: https://phabricator.services.mozilla.com/D174822
+
+--HG--
+extra : moz-landing-system : lando
+---
+ cmd/ecperf/ecperf.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/cmd/ecperf/ecperf.c b/cmd/ecperf/ecperf.c
+index 705d68f35..a07004d8e 100644
+--- a/cmd/ecperf/ecperf.c
++++ b/cmd/ecperf/ecperf.c
+@@ -53,6 +53,7 @@ PKCS11Thread(void *data)
+     SECItem sig;
+     CK_SESSION_HANDLE session;
+     CK_RV crv;
++    void *tmp =3D NULL;
+=20
+     threadData->status =3D SECSuccess;
+     threadData->count =3D 0;
+@@ -68,6 +69,7 @@ PKCS11Thread(void *data)
+     if (threadData->isSign) {
+         sig.data =3D sigData;
+         sig.len =3D sizeof(sigData);
++        tmp =3D threadData->p2;
+         threadData->p2 =3D (void *)&sig;
+     }
+=20
+@@ -79,6 +81,10 @@ PKCS11Thread(void *data)
+         }
+         threadData->count++;
+     }
++
++    if (threadData->isSign) {
++        threadData->p2 =3D tmp;
++    }
+     return;
+ }
+=20
+@@ -89,6 +95,7 @@ genericThread(void *data)
+     int iters =3D threadData->iters;
+     unsigned char sigData[256];
+     SECItem sig;
++    void *tmp =3D NULL;
+=20
+     threadData->status =3D SECSuccess;
+     threadData->count =3D 0;
+@@ -96,6 +103,7 @@ genericThread(void *data)
+     if (threadData->isSign) {
+         sig.data =3D sigData;
+         sig.len =3D sizeof(sigData);
++        tmp =3D threadData->p2;
+         threadData->p2 =3D (void *)&sig;
+     }
+=20
+@@ -107,6 +115,10 @@ genericThread(void *data)
+         }
+         threadData->count++;
+     }
++
++    if (threadData->isSign) {
++        threadData->p2 =3D tmp;
++    }
+     return;
+ }
+=20
+--=20
+2.40.1
+
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-=
support/nss/nss_3.51.1.bb
index 721b38ddb..af842ee67 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -44,6 +44,7 @@ SRC_URI =3D "http://ftp.mozilla.org/pub/mozilla.org/sec=
urity/nss/releases/${VERSIO
            file://CVE-2022-22747.patch \
            file://CVE-2023-0767.patch \
            file://0001-Bug-1812671-build-failure-while-implicitly-castin=
g-S.patch;patchdir=3Dnss \
+           file://0001-Bug-1826650-cmd-ecperf-fix-dangling-pointer-warni=
ng-.patch;patchdir=3Dnss \
            "
=20
 SRC_URI[md5sum] =3D "6acaf1ddff69306ae30a908881c6f233"
--=20
2.40.1


