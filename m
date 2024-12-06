Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFB4E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 11:40:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.35228.1733485232976928289
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Dec 2024 03:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout08.t-online.de (Postfix) with SMTP id 9B29D688
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Dec 2024 12:40:30 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.241]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tJWh9-166LyN0; Fri, 6 Dec 2024 12:40:27 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 3/3] libspelling: update 0.4.2 -> 0.4.5
Date: Fri,  6 Dec 2024 12:40:26 +0100
Message-ID: <20241206114026.2441-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206114026.2441-1-f_l_k@t-online.de>
References: <20241206114026.2441-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1733485227-067FB9EF-EBC1DDE9/0/0 CLEAN NORMAL
X-TOI-MSGID: 1ae766bd-3426-4738-8be6-e7f9bc89ce1a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Dec 2024 11:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114218

libspelling 0.4.5
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is a bug-fix release for GNOME 47

 * Various robustness fixes for weak ref tracking
 * Various GObject Introspection fixes
 * A new build option to install a static library (libspelling-1.a)
 * Fix a minor leak of extra_word_chars for a language dictionary
 * Fix ICU success check
 * Translation updates

libspelling 0.4.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is a bug-fix release for GNOME 47

 * Adds a few dozen translations for menu items

libspelling 0.4.3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is a bug-fix release for GNOME 47

 * Fix build to disable assertions in release builds
 * Fix an off-by-one in assertion
 * Add i18n for translations of menu entries
 * Ignore empty strings when building job list

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libspelling/{libspelling_0.4.2.bb =3D> libspelling_0.4.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.2.bb =3D> l=
ibspelling_0.4.5.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb b/=
meta-gnome/recipes-gnome/libspelling/libspelling_0.4.5.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.5.bb
index 11ac08656..064dd0018 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.2.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.5.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION =3D 'docs'
 PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Dtrue,-Dsysprof=3Dfalse,sysprof"
=20
-SRC_URI[archive.sha256sum] =3D "b3e609b1a247e71bc097e262564f33f51fd7db56=
6eeb0cd74ae5021536b878b5"
+SRC_URI[archive.sha256sum] =3D "ec0372d83f42b65aee3734248ef8e2ffbfba4ea9=
1268419c98ea44a00ef3e83f"
--=20
2.47.0


