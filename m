Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650DEC282C5
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 10:42:24 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.50641.1740998537526193109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Mar 2025 02:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 58306AFD
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Mar 2025 11:42:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.236.152]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tp3FW-0z69kP0; Mon, 3 Mar 2025 11:42:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] mypaint: add m4 dir to autoconf macro search paths
Date: Mon,  3 Mar 2025 11:42:52 +0100
Message-ID: <20250303104252.3045713-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1740998534-08FF697D-63DE51D3/0/0 CLEAN NORMAL
X-TOI-MSGID: a83ad787-52cc-4c5e-9621-eda9b885c12c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Mar 2025 10:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115724

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb b/meta-gno=
me/recipes-gimp/mypaint/libmypaint_git.bb
index d509aa3dd0..ca6a115dd3 100644
--- a/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
+++ b/meta-gnome/recipes-gimp/mypaint/libmypaint_git.bb
@@ -19,6 +19,9 @@ SRCREV =3D "2768251dacce3939136c839aeca413f4aa4241d0"
 PV =3D "1.6.1"
 S =3D "${WORKDIR}/git"
=20
+# Needed for introspection.m4
+EXTRA_AUTORECONF +=3D "-I m4"
+
 do_configure:append() {
     # autogen uses python2 so generate headers ourselves
     cd ${S}
--=20
2.48.1


