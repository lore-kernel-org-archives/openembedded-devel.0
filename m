Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CA2C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:09:14 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.1726.1709924948365515999
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 11:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 76B2BDF97
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 20:08:23 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rifZv-1zryvy0; Fri, 8 Mar 2024 20:08:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/5] gnome-disk-utility: fix reproducibility issue
Date: Fri,  8 Mar 2024 20:08:26 +0100
Message-ID: <20240308190829.2442866-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308190829.2442866-1-f_l_k@t-online.de>
References: <20240308190829.2442866-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709924903-2F7FD9FB-71A25CD3/0/0 CLEAN NORMAL
X-TOI-MSGID: de627243-583d-4cee-b405-9d2482a10b10
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 19:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109238

gnome-disk-utility inserts lines containing ${S} into the source. Althoug=
h required for
compilation, it affects reproducibility for the	src package.

Fix this by simply not packaging the modified source code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_45.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_45.0.bb
index 4f3738cfb..856d29e7c 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0=
.bb
@@ -33,6 +33,8 @@ SRC_URI[archive.sha256sum] =3D "3d8625faa99047bc4aefd29=
921ad728ab4d700cff86e0f2ec6
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
=20
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
+
 FILES:${PN} +=3D " \
     ${datadir}/metainfo \
     ${datadir}/dbus-1 \
--=20
2.44.0


