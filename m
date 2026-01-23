Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6AC9D72352
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 08:48:16 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63524.1769158086691708305
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 00:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 8B819F231
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:48:04 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.163.28]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vjCpj-240GW10; Fri, 23 Jan 2026 09:47:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] libgtop: fix build without x11
Date: Fri, 23 Jan 2026 09:47:53 +0100
Message-ID: <20260123084753.275355-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769158079-4AFFA9A0-E0356F87/0/0 CLEAN NORMAL
X-TOI-MSGID: 211686fe-6864-483f-8d18-b72268e33fd7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 08:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123772

add PACKAGECONFIG for xauth and make it dependent on x11 in DISTRO_FEATUR=
ES

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb b/meta-gn=
ome/recipes-gnome/libgtop/libgtop_2.41.3.bb
index e7b61a7b20..7131078994 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.41.3.bb
@@ -11,4 +11,7 @@ SRC_URI[archive.sha256sum] =3D "775676df958e2ea2452f756=
8f28b2ea581063d312773dd5c0b
=20
 UPSTREAM_CHECK_REGEX =3D "libgtop-(?P<pver>\d+(\.\d+)+).tar"
=20
-DEPENDS =3D "glib-2.0 libxau"
+DEPENDS =3D "glib-2.0"
+
+PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES','x11','xauth'=
,'',d)}"
+PACKAGECONFIG[xauth] =3D ",,libxau"
--=20
2.52.0


