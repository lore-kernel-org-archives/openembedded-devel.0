Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B76C77B62
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17407.1679731394417246999
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4BBE61CBED
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrn-0RoPhX0; Sat, 25 Mar 2023 09:03:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 15/32] gnome-photos: update 43.0 -> 44.0
Date: Sat, 25 Mar 2023 09:02:39 +0100
Message-Id: <20230325080256.923752-15-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731391-85D6DC08-6FB91435/0/0 CLEAN NORMAL
X-TOI-MSGID: f821499e-85b9-498f-a41d-9f9b16a4998c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101728

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-photos/{gnome-photos_43.0.bb =3D> gnome-photos_44.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-photos/{gnome-photos_43.0.bb =3D> =
gnome-photos_44.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb b=
/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
rename to meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 72ab2eaaf..cdf9780ab 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -36,7 +36,7 @@ REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[doc] =3D "-Dmanuals=3Dtrue,-Dmanuals=3Dfalse,libxslt-nativ=
e docbook-xsl-stylesheets-native"
=20
-SRC_URI[archive.sha256sum] =3D "c7ac7458d533f29d955011c74b76224d79ea31bc=
c12e9d6d0ce7b6c3704d08e1"
+SRC_URI[archive.sha256sum] =3D "e78e210397d3c62809c6cd5521da6eccb4a11dde=
a5bf2af8632a47f4da5c829e"
=20
 do_install:append() {
     # make gnome-photos available on all desktops
--=20
2.34.1


