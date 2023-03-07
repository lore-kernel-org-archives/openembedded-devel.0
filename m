Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4928FC6FA99
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 20:33:35 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.5242.1678221210371094012
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Mar 2023 12:33:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 52D62F184
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Mar 2023 21:33:28 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.81]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pZdzz-4JMlHe0; Tue, 7 Mar 2023 21:33:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] libnice: upgrade 0.1.18 -> 0.1.21
Date: Tue,  7 Mar 2023 21:33:18 +0100
Message-Id: <20230307203318.689651-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307203318.689651-1-f_l_k@t-online.de>
References: <20230307203318.689651-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678221207-B73A5DF7-A4F474CC/0/0 CLEAN NORMAL
X-TOI-MSGID: f8563ae0-5bf8-4ae9-896c-3e1b5c66302a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 20:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101408

webkitgtk 2.40 will require the update

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../farsight/{libnice_0.1.18.bb =3D> libnice_0.1.21.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/farsight/{libnice_0.1.18.bb =3D> libnice_=
0.1.21.bb} (94%)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.18.bb b/meta-oe=
/recipes-support/farsight/libnice_0.1.21.bb
similarity index 94%
rename from meta-oe/recipes-support/farsight/libnice_0.1.18.bb
rename to meta-oe/recipes-support/farsight/libnice_0.1.21.bb
index e7eaf0392..210d4d822 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.18.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9c42325015702f=
eda4f4d2f19a55b767 \
 "
=20
 SRC_URI =3D "http://nice.freedesktop.org/releases/libnice-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "5eabd25ba2b54e817699832826269241abaa1cf78f9b240d=
1435f936569273f4"
+SRC_URI[sha256sum] =3D "72e73a2acf20f59093e21d5601606e405873503eb35f346f=
a621de23e99b3b39"
=20
 DEPENDS =3D "glib-2.0 gnutls"
=20
--=20
2.34.1


