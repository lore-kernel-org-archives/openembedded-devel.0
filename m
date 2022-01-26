Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53E4C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 06:01:27 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web09.9123.1643176886721980680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout01.t-online.de (Postfix) with SMTP id 3FB355B2C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 07:01:24 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.134]) by fwd82.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nCbMs-2JJEIL0; Wed, 26 Jan 2022 07:01:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] evolution-data-server: try to fix g-i data
 generation
Date: Wed, 26 Jan 2022 07:01:04 +0100
Message-Id: <20220126060104.578932-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1643176878-0000B8A1-C11B3DDD/0/0 CLEAN NORMAL
X-TOI-MSGID: 27bbd665-0de4-4925-b34a-13db04474d41
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 06:01:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95097

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.bb           | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 9ccaedbcc..c5c7d947f 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -27,14 +27,15 @@ EXTRA_OECMAKE =3D " \
     -DENABLE_UOA=3DOFF \
     -DENABLE_GOOGLE_AUTH=3DOFF \
     -DENABLE_WEATHER=3DOFF \
-    -DG_IR_COMPILER=3D${STAGING_BINDIR}/g-ir-compiler-wrapper \
-    -DG_IR_SCANNER=3D${STAGING_BINDIR}/g-ir-scanner-wrapper \
     -DVAPIGEN=3D${STAGING_BINDIR_NATIVE}/vapigen \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECT=
ION=3DON -DENABLE_VALA_BINDINGS=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)=
} \
     -D${LKSTRFTIME} \
     -DLIB_SUFFIX=3D${@d.getVar('baselib').replace('lib', '')} \
 "
=20
+EXTRA_OECMAKE:append:class-target =3D " -DG_IR_COMPILER=3D${STAGING_BIND=
IR}/g-ir-compiler-wrapper"
+EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D${STAGING_BINDI=
R}/g-ir-scanner-wrapper"
+
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
 PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2=3DON,-DENABLE_OAUTH2=3DOFF,=
webkitgtk json-glib"
 PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
--=20
2.25.1


