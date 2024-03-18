Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC460C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:23:41 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.34231.1710728614575807022
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout02.t-online.de (Postfix) with SMTP id 21935114E4
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 03:23:33 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm2ey-0Sh8Qk0; Mon, 18 Mar 2024 03:23:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] evince: update 45.0 -> 46.0
Date: Mon, 18 Mar 2024 03:23:56 +0100
Message-ID: <20240318022356.655978-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318022356.655978-1-f_l_k@t-online.de>
References: <20240318022356.655978-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710728612-DD9C5917-E9233F2A/0/0 CLEAN NORMAL
X-TOI-MSGID: da82aa69-4ca0-4417-82f6-05d22cd7f48a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 02:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109398

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/evince/{evince_45.0.bb =3D> evince_46.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_45.0.bb =3D> evince_46.0.=
bb} (94%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_45.0.bb b/meta-gnome/=
recipes-gnome/evince/evince_46.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/evince/evince_45.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_46.0.bb
index 8b4024175..57eb994e1 100644
--- a/meta-gnome/recipes-gnome/evince/evince_45.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_46.0.bb
@@ -33,7 +33,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "d18647d4275cbddf0d32817b1d04e307342a85be=
914ec4dad2d8082aaf8aa4a8"
+SRC_URI[archive.sha256sum] =3D "aff6af69392c04956bfad976dec5d1583b41d5a3=
34e937995f7c3ca0740de221"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.44.0


