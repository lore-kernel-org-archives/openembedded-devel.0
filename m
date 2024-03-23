Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259E3C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 14:19:19 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.9570.1711203558144881035
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 07:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout05.t-online.de (Postfix) with SMTP id 48C8822E99
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 15:19:13 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ro2DI-1tkEOP0; Sat, 23 Mar 2024 15:19:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libcloudproviders: update 0.3.5 -> 0.3.6
Date: Sat, 23 Mar 2024 15:19:32 +0100
Message-ID: <20240323141932.924965-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711203552-49A21820-BD5CCBED/0/0 CLEAN NORMAL
X-TOI-MSGID: d34f63a6-e686-45ac-b093-d38a0693bf5b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 14:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109551

0.3.6
-----
* Plug several memory leaks
* Avoid use-after-free within the Proxy
* Renamespace CloudProvidersProvider
* Reduce a bit the CloudProvidersAccount memory footprint

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libcloudproviders_0.3.5.bb =3D> libcloudproviders_0.3.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libcloudproviders/{libcloudproviders_0=
.3.5.bb =3D> libcloudproviders_0.3.6.bb} (76%)

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudprovide=
rs_0.3.5.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudprovid=
ers_0.3.6.bb
similarity index 76%
rename from meta-gnome/recipes-support/libcloudproviders/libcloudprovider=
s_0.3.5.bb
rename to meta-gnome/recipes-support/libcloudproviders/libcloudproviders_=
0.3.6.bb
index 7f9bb2638..f5660b526 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.=
5.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.=
6.bb
@@ -8,4 +8,4 @@ DEPENDS =3D "glib-2.0"
=20
 inherit gnomebase gobject-introspection vala
=20
-SRC_URI[archive.sha256sum] =3D "b987456eddaf715ba9d623aa2bc501ab1b697dff=
eb11aaa783a637275df186da"
+SRC_URI[archive.sha256sum] =3D "3b75110b3a4fdef4c5c5a440e48701fe054d2ae0=
61d156c89136bb5ba05e74b7"
--=20
2.44.0


