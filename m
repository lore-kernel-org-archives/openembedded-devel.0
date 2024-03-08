Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE30DC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:08:44 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.1666.1709924924136390745
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 11:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id B03695A7F
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 20:08:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rifZv-1zryw00; Fri, 8 Mar 2024 20:08:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/5] gnome-terminal: fix reproducibility issue
Date: Fri,  8 Mar 2024 20:08:28 +0100
Message-ID: <20240308190829.2442866-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308190829.2442866-1-f_l_k@t-online.de>
References: <20240308190829.2442866-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709924903-2F7FD9FB-0A1A929C/0/0 CLEAN NORMAL
X-TOI-MSGID: 0dc80043-cc49-468f-99a4-652d9a067f6e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 19:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109234

gnome-terminal inserts lines containing ${S} into the source. Although re=
quired for
compilation, it affects reproducibility for the	src package.

Fix this by simply not packaging the modified source code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.=
1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
index 53f11e95f..3bbfe9ece 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.50.1.bb
@@ -31,6 +31,8 @@ PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[nautilus] =3D "-Dnautilus_extension=3Dtrue,-Dnautilus_exte=
nsion=3Dfalse,nautilus,nautilus"
 PACKAGECONFIG[search_provider] =3D "-Dsearch_provider=3Dtrue -Ddbus_inte=
rface_dir=3D${STAGING_DATADIR}/dbus-1/interfaces,-Dsearch_provider=3Dfals=
e,gnome-shell"
=20
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
+
 FILES:${PN} +=3D " \
     ${datadir} \
     ${libdir}/nautilus/extensions-4 \
--=20
2.44.0


