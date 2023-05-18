Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18274C77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 05:40:35 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.10515.1684388427502720173
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 22:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout03.t-online.de (Postfix) with SMTP id 758724CD10
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 07:40:25 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.44.3]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pzWNE-1WvioT0; Thu, 18 May 2023 07:40:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCH 1/2] evince: edit include path for debug package
Date: Thu, 18 May 2023 07:40:14 +0200
Message-Id: <20230518054015.81043-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684388424-5A7F357F-A02DEEDC/0/0 CLEAN NORMAL
X-TOI-MSGID: beecffde-7066-4121-a15d-8c15f94aabdc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 05:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102652

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/evince/evince_44.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_44.1.bb b/meta-gnome/=
recipes-gnome/evince/evince_44.1.bb
index a2a6f9aae7..a844324ade 100644
--- a/meta-gnome/recipes-gnome/evince/evince_44.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_44.1.bb
@@ -47,8 +47,8 @@ RRECOMMENDS:${PN} =3D "adwaita-icon-theme"
 PACKAGES =3D+ "${PN}-nautilus-extension"
=20
 do_install:prepend() {
-    sed -i -e 's|${B}/||g' ${B}/libview/ev-view-type-builtins.c
-    sed -i -e 's|${B}/||g' ${B}/libdocument/ev-document-type-builtins.c
+    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/libview/ev-view-type-builtins.c
+    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/libdocument/ev-document-type-builtins.c
 }
=20
 FILES:${PN} +=3D "${datadir}/dbus-1 \
--=20
2.34.1


