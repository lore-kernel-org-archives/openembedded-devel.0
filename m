Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F025C04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 12:10:15 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.59380.1716207010165970019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 May 2024 05:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 6F4B74968
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 14:10:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.45.105]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s91q9-4I9Psn0; Mon, 20 May 2024 14:10:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] malcontent-ui: fix lib install
Date: Mon, 20 May 2024 14:10:42 +0200
Message-ID: <20240520121042.44382-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1716207005-153EF352-081261D4/0/0 CLEAN NORMAL
X-TOI-MSGID: cbbf8d4e-e313-446b-bea5-b148a00f914f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 May 2024 12:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110440

- Add a suitable link for libmalcontent-ui-1.so.1
- Use PV for libmalcontent-ui-1.so.0.12.0 to eventually make life a littl=
e easier
  when updating recipes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb b/m=
eta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
index 13bfe7853..ca3bf081d 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent-ui_0.12.0.bb
@@ -35,9 +35,9 @@ do_install() {
 	install -d ${D}${datadir}/polkit-1/actions ${D}${datadir}/metainfo ${D}=
${datadir}/applications
 	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.gir ${D}${datadir}=
/gir-1.0
 	install -m 0644 ${B}/libmalcontent-ui/MalcontentUi-1.typelib ${D}${libd=
ir}/girepository-1.0
-	ln -sf libmalcontent-ui-1.so.1 ${D}${libdir}/libmalcontent-ui-1.so
-	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.1 ${D}${lib=
dir}
-	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.0.12.0 ${D}=
${libdir}
+	install -m 0644 ${B}/libmalcontent-ui/libmalcontent-ui-1.so.${PV} ${D}$=
{libdir}
+	ln -sf libmalcontent-ui-1.so.${PV} ${D}${libdir}/libmalcontent-ui-1.so
+	ln -sf libmalcontent-ui-1.so.${PV} ${D}${libdir}/libmalcontent-ui-1.so.=
1
 	install -m 0755 ${B}/malcontent-control/malcontent-control ${D}${bindir=
}
 	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.policy ${D}${datadir}/polkit-1/actions
 	install -m 0644 ${B}/malcontent-control/org.freedesktop.MalcontentContr=
ol.appdata.xml ${D}${datadir}/metainfo
--=20
2.44.0


