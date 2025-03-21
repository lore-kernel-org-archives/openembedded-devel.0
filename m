Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550CDC35FF3
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 06:42:08 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.15285.1742539321187790956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 23:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id 61B455DF
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 07:41:59 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.175]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tvW4r-1MIaaA0; Fri, 21 Mar 2025 07:41:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] libspelling: update 0.4.6 -> 0.4.7
Date: Fri, 21 Mar 2025 07:42:45 +0100
Message-ID: <20250321064245.55252-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321064245.55252-1-f_l_k@t-online.de>
References: <20250321064245.55252-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742539317-6CFFCAA0-459B6B4C/0/0 CLEAN NORMAL
X-TOI-MSGID: 59b9a9df-697e-45df-a235-7161ffb1e956
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 06:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116166

libspelling 0.4.7
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This is a bug-fix release for GNOME 47 and newer
 * Fix a potential assertion failure in B+Tree item removal
 * Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libspelling/{libspelling_0.4.6.bb =3D> libspelling_0.4.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.6.bb =3D> l=
ibspelling_0.4.7.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb b/=
meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
index b19c5f51e0..38476a6787 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION =3D 'docs'
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Dtrue,-Dsysprof=3Dfalse,sysprof"
=20
-SRC_URI[archive.sha256sum] =3D "3248a9b5336ea2f727d2db912d2f0083accc0505=
ce707679b3d9b8266c0101f5"
+SRC_URI[archive.sha256sum] =3D "42f130f295f5addb6e9e8e74ccfbb709794bd2df=
d021293e2875b9481bbd4e88"
--=20
2.48.1


