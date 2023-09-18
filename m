Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF38DCD3423
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.4198.1695073932077533865
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 928F854F1
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:09 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiMA1-3qxV2B0; Mon, 18 Sep 2023 23:52:05 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/18] gnome-calendar: upgrade 44.0 -> 45.0
Date: Mon, 18 Sep 2023 23:51:46 +0200
Message-ID: <20230918215156.1920452-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073925-44FF45E3-B9EEB817/0/0 CLEAN NORMAL
X-TOI-MSGID: 51b69e9a-9d88-44e2-b5be-4598890de7ff
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104938

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calendar_44.0.bb =3D> gnome-calendar_45.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_44.0.bb =3D=
> gnome-calendar_45.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.=
bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.b=
b
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
index dcf5ba7d6..7efd486b5 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.0.bb
@@ -23,7 +23,7 @@ inherit gnomebase gsettings gtk-icon-cache gettext feat=
ures_check upstream-versi
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "96acd74cbf45652934515cc3447a3b895e933f86=
324ca92436f67ddd63c3a802"
+SRC_URI[archive.sha256sum] =3D "8c1483cbba4388db410875ed09d64e9003f929b5=
55d704076a6fe7bd7c1e65b2"
=20
 FILES:${PN} +=3D " \
     ${datadir}/gnome-shell \
--=20
2.41.0


