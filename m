Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C73CD98CC
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 10:55:49 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42782.1781175340142376174
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 03:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=qptRXPQU;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout02.t-online.de (Postfix) with SMTP id A9A6CF0F1
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 12:55:36 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXd4R-05scqn0; Thu, 11 Jun 2026 12:55:35 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] eog: update 49.3 -> 50.1
Date: Thu, 11 Jun 2026 12:55:31 +0200
Message-ID: <20260611105531.870988-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781175335-A09BEBA7-0DBA7ED8/0/0 CLEAN NORMAL
X-TOI-MSGID: c8d02765-ecab-45db-b599-cc3278c6e791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781175336; i=f_l_k@t-online.de;
	bh=7p8qJ+iz/+UPYdTMGAY0/S8tefpJpxsOJTBAA4nTIes=;
	h=From:To:Subject:Date;
	b=qptRXPQUvTZ1rcr4h8cbCFvN7PQQh9WrNo3c3wCxD8aWzLBD18dH3wzxuMfWgeTF7
	 yJZsys5B5Z5Zklmb6hTetb39pnuG6DaG+Ky3vez01aJNrbtq+OcLTmHrGUXGiFicra
	 YISX0nnXXtVb4HeojGBuIR1oeDZ59hbC9Y2P+boL0BLT7lTA0wrLlXSAx/DxgCmFZS
	 ZWKC7VovnjD1ySEUC+a78BDI+Y56PDI54rN9YuWVtcQRHlOzw9lwC7XH49JXY81GtO
	 O9Bu4yLsU7zI/SehLqUWoHqy4/OHX6o2lh+syrLFUnPqbDng4LBS94IifqOfoMt0d5
	 0j97wDGk9SvqQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 10:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127528

This avoids gi redefinition trouble
---
 meta-gnome/recipes-gnome/eog/{eog_49.3.bb =3D> eog_50.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/eog/{eog_49.3.bb =3D> eog_50.1.bb} (90%)

diff --git a/meta-gnome/recipes-gnome/eog/eog_49.3.bb b/meta-gnome/recipe=
s-gnome/eog/eog_50.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/eog/eog_49.3.bb
rename to meta-gnome/recipes-gnome/eog/eog_50.1.bb
index eee6c14459..5d454f6236 100644
--- a/meta-gnome/recipes-gnome/eog/eog_49.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_50.1.bb
@@ -23,7 +23,7 @@ inherit gnomebase pkgconfig gsettings gobject-introspec=
tion gettext mime-xdg fea
 # FIXME: whilst eog uses libpeas <2, g-i is needed. This can be removed =
when libpeas2 is used.
 REQUIRED_DISTRO_FEATURES =3D "opengl gobject-introspection-data"
=20
-SRC_URI[archive.sha256sum] =3D "6b4e69c7a8086ae85d556ca4a24daa665b5622c4=
097e1ee59564bff4cc963124"
+SRC_URI[archive.sha256sum] =3D "6f5ee6d756548b88e25a987e0d06dabc3c6c3259=
8fb7df49fb08945c1fe94a55"
=20
 PACKAGECONFIG =3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11','cms', =
'', d)}"
=20
--=20
2.54.0


