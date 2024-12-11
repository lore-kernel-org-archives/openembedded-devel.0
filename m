Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C6CE77184
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 08:07:13 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.5740.1733904429415566493
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Dec 2024 00:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 5831DAB3
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 09:07:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.33.231]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tLHkL-0OXTbY0; Wed, 11 Dec 2024 09:07:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] gnome-software: update 47.1 -> 47.2
Date: Wed, 11 Dec 2024 09:07:00 +0100
Message-ID: <20241211080700.104771-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211080700.104771-1-f_l_k@t-online.de>
References: <20241211080700.104771-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1733904422-78FF686F-E168A31C/0/0 CLEAN NORMAL
X-TOI-MSGID: d07226d4-a611-41db-9e72-05095ba58863
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Dec 2024 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114274

Version 47.2
~~~~~~~~~~~~
Released: 2024-11-25

This is a stable release with the following changes:
 * Fix distro upgrade when certain version of PackageKit is used
 * Fix a crash when uninstalling a Snap app
 * Make uninstall dialog adaptive for small screens
 * Prefer Appstream data from swcatalog instead of app-info directories

This release also updates translations:
 * Dutch (Nathan Follens)
 * French (Vincent Chatelain)
 * Friulian (Fabio Tomat)
 * Latvian (R=C5=ABdolfs Mazurs)
 * Malay (Ahmed Noor Kader Mustajir Md Eusoff)
 * Portuguese (Hugo Carvalho)
 * Portuguese (Brazil) (Rafael Fontenelle)
 * Serbian (=D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=B2=
=D0=B8=D1=9B, =D0=9C=D0=B0=D1=80=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=
=D1=9B)
 * Thai (Aefgh Threenine)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-software_47.1.bb =3D> gnome-software_47.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_47.1.bb =3D=
> gnome-software_47.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.1.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-software/gnome-software_47.1.b=
b
rename to meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb
index a18d6db66..31b13accf 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_47.2.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} =3D "iso-codes"
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
=20
-SRC_URI[archive.sha256sum] =3D "93ca500366316745594ef05fcad1c05cf43f02ef=
8f66080c17f7ebb8ca3f34bf"
+SRC_URI[archive.sha256sum] =3D "112338f8a98e7e5125de3f57229873534215b77e=
eef37d3fd4262f02151c7cea"
=20
 PACKAGECONFIG ?=3D "flatpak"
 PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
--=20
2.47.0


