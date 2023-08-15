Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6DBC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 15:00:02 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.136357.1692111599839549599
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 08:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout10.t-online.de (Postfix) with SMTP id D7FC11BBD9
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 16:59:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.50]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVvWX-3eS3730; Tue, 15 Aug 2023 16:59:57 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libnice: add graphviz-native dependency
Date: Tue, 15 Aug 2023 16:59:45 +0200
Message-ID: <20230815145945.1564940-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692111597-EF7F1670-634AE9FE/0/0 CLEAN NORMAL
X-TOI-MSGID: db28fefb-5860-4014-83ba-b093d4be9235
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 15:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104356

If building the api-documentation libnice requests dot or the build fails=
 with:

| ../libnice-0.1.21/docs/reference/libnice/meson.build:70:0: ERROR: Progr=
am 'dot' not found or not executable

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/farsight/libnice_0.1.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb b/meta-oe=
/recipes-support/farsight/libnice_0.1.21.bb
index f319b994bd..4a5227f206 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
@@ -12,7 +12,7 @@ SRC_URI =3D "http://nice.freedesktop.org/releases/libni=
ce-${PV}.tar.gz \
            file://0001-agent-meson-Replace-filename-with-basename.patch"
 SRC_URI[sha256sum] =3D "72e73a2acf20f59093e21d5601606e405873503eb35f346f=
a621de23e99b3b39"
=20
-DEPENDS =3D "glib-2.0 gnutls"
+DEPENDS =3D "glib-2.0 gnutls ${@bb.utils.contains('DISTRO_FEATURES', 'ap=
i-documentation', 'graphviz-native', '', d)}"
=20
 PACKAGECONFIG[gupnp] =3D "-Dgupnp=3Denabled,-Dgupnp=3Ddisabled,gupnp"
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabl=
ed,gstreamer1.0"
--=20
2.41.0


