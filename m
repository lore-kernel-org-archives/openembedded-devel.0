Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C29FCDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:31:42 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.13251.1697121096244768975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout03.t-online.de (Postfix) with SMTP id 512553D0A4
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 16:31:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.39.41]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qqwio-3aWxsX0; Thu, 12 Oct 2023 16:31:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libdecor: Upgrade 0.1.99 -> 0.2.0
Date: Thu, 12 Oct 2023 16:31:27 +0200
Message-ID: <20231012143127.998303-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1697121091-59FF4ED2-44E69E9A/0/0 CLEAN NORMAL
X-TOI-MSGID: a45693af-851c-4f9d-9cf2-6d1475c31202
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 14:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105455

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libdecor/{libdecor_0.1.99.bb =3D> libdecor_0.2.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.1.99.bb =3D> libdec=
or_0.2.0.bb} (94%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb b/meta-=
oe/recipes-graphics/libdecor/libdecor_0.2.0.bb
similarity index 94%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.2.0.bb
index 078058e8b..7c1ebc159 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.1.99.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.0.bb
@@ -15,7 +15,7 @@ DEPENDS =3D " \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "0d63d125f899dbb1b932468f2f3b911f9c121e58"
+SRCREV =3D "ad320fc0e0ec2cd75a87fed454a9c7d6d1921464"
=20
 PACKAGECONFIG ?=3D "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', =
d)}"
=20
--=20
2.42.0


