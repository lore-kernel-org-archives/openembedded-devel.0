Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FECC02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:47:48 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.7995.1737110865432065843
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 02:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 645F353C
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 11:47:43 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.164.202]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tYjt8-3dtx330; Fri, 17 Jan 2025 11:47:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] polkit: dont add mozjs PACKAGECONFIG
Date: Fri, 17 Jan 2025 11:48:01 +0100
Message-ID: <20250117104801.650817-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1737110862-997F9A80-35B370C9/0/0 CLEAN NORMAL
X-TOI-MSGID: c7c08c1e-0e7d-4bb4-8d24-bc1b31b2166a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jan 2025 10:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114919

fixes:
ERROR: polkit-126-r0 do_configure: QA Issue: polkit: invalid PACKAGECONFI=
G: mozjs [invalid-packageconfig]
ERROR: polkit-126-r0 do_configure: Fatal QA errors were found, failing ta=
sk.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/polkit/polkit_126.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_126.bb b/meta-oe/reci=
pes-extended/polkit/polkit_126.bb
index a2f5449c2f..64aba7b2dd 100644
--- a/meta-oe/recipes-extended/polkit/polkit_126.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_126.bb
@@ -24,7 +24,6 @@ PACKAGECONFIG =3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolek=
it', d)} \
 	dbus \
-	mozjs \
 "
 PACKAGECONFIG[dbus] =3D ",,dbus"
 PACKAGECONFIG[gtk-doc] =3D "-Dgtk_doc=3Dtrue,-Dgtk_doc=3Dfalse,gtk-doc-n=
ative"
--=20
2.47.1


