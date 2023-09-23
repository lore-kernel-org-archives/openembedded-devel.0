Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334F3CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 00:32:50 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.12371.1695429163812083864
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 17:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 07FC514EB3
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 02:32:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjqZd-4S7qsL0; Sat, 23 Sep 2023 02:32:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] evince: Upgrade 44.2 -> 45.0
Date: Sat, 23 Sep 2023 02:32:30 +0200
Message-ID: <20230923003230.3249946-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695429161-1F7F176E-B356C722/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b6910c5-342e-4a71-89db-44a334260493
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 00:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105084

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/evince/{evince_44.2.bb =3D> evince_45.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_44.2.bb =3D> evince_45.0.=
bb} (94%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_44.2.bb b/meta-gnome/=
recipes-gnome/evince/evince_45.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/evince/evince_44.2.bb
rename to meta-gnome/recipes-gnome/evince/evince_45.0.bb
index 67449be23..d97a8a0cf 100644
--- a/meta-gnome/recipes-gnome/evince/evince_44.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
@@ -34,7 +34,7 @@ REQUIRED_DISTRO_FEATURES =3D "${@bb.utils.contains('DIS=
TRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "9a75c7ff8f599218d070e09fb4082cb26f9b8637=
0a9bfae98e1aacb564d675dd"
+SRC_URI[archive.sha256sum] =3D "d18647d4275cbddf0d32817b1d04e307342a85be=
914ec4dad2d8082aaf8aa4a8"
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
--=20
2.42.0


