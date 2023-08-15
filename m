Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6FBC0015E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:22:43 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.138690.1692116556694126781
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 0F5881D5D9
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 18:22:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.225.50]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qVwoR-0pSLQH0; Tue, 15 Aug 2023 18:22:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] libgweather4: fix api-documentation build
Date: Tue, 15 Aug 2023 18:22:21 +0200
Message-ID: <20230815162221.2209655-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1692116551-EA7F5029-C8E7CE80/0/0 CLEAN NORMAL
X-TOI-MSGID: 6c2f4aa7-ed3f-4fd2-b0c9-b8a43cfc776c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 16:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104360

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb b=
/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
index 824269e68a..f2ffcfdd79 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.2.0.bb
@@ -7,7 +7,7 @@ GNOMEBASEBUILDCLASS =3D "meson"
 GNOMEBN =3D "libgweather"
 S =3D "${WORKDIR}/${GNOMEBN}-${PV}"
=20
-inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala f=
eatures_check
+inherit gnomebase gsettings gobject-introspection gettext gi-docgen vala=
 features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
--=20
2.41.0


