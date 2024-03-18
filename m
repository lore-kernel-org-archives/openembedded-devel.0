Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC99EC54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:23:31 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.34223.1710728611097051387
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 6F6BD1CA56
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 03:23:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm2ev-0Sh8Qj0; Mon, 18 Mar 2024 03:23:29 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] gnome-calculator: update 45.0.2 -> 46.0
Date: Mon, 18 Mar 2024 03:23:55 +0100
Message-ID: <20240318022356.655978-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710728609-DD9C5917-9D2C9D4E/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e3144fc-8e3e-4d48-88c3-552cc338c944
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 02:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109397

- libsoup is required to be built with vapi support

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-calculator_45.0.2.bb =3D> gnome-calculator_46.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-calculator/{gnome-calculator_45.0.=
2.bb =3D> gnome-calculator_46.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_4=
5.0.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.=
0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45=
.0.2.bb
rename to meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.0=
.bb
index 30f532c63..5c7e27378 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.b=
b
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_46.0.bb
@@ -29,7 +29,7 @@ def gnome_verdir(v):
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
=20
-SRC_URI[archive.sha256sum] =3D "7dcbf32384897171cbe5483ec664d994e5e755e9=
12ae1df911624f03c90867c2"
+SRC_URI[archive.sha256sum] =3D "44694fda6b6233923f5c10a48d02d2cf5724e011=
a8a85789074c953101f33bf1"
=20
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
--=20
2.44.0


