Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD9DC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:32:09 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.11229.1741861928308704331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 03:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id F3D28FFE
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 11:32:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsfrB-3UGxs30; Thu, 13 Mar 2025 11:32:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][gnome48][meta-gnome][PATCH 3/3] nautilus: update 47.2 ->> 48.rc
Date: Thu, 13 Mar 2025 11:32:48 +0100
Message-ID: <20250313103248.2116871-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313103248.2116871-1-f_l_k@t-online.de>
References: <20250313103248.2116871-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1741861925-E17F8459-7C1B2149/0/0 CLEAN NORMAL
X-TOI-MSGID: 905b381e-fff5-4e7c-9e8e-2ce2af3c21b8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 10:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115964

Major Changes in 48.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements:
- Run code formatting in parallel (Khalid Abu Shawarib)
- Rework CI image job to freedesktop template (Khalid Abu Shawarib)
- Rework and speedup adding of files to view (Khalid Abu Shawarib)
- Add basic unit tests for files view (Khalid Abu Shawarib)
- Load thumbnail info separate from other file infos (Khalid Abu Shawarib=
)

* Reversals:
- Revert port of properties dialog to AdwDialog due to outstanding issues

* Bugfixes:
- Fix app chooser widget sizing (Automeris naranja)
- Fix free space calculation for archive extraction (Peter Eisenmann)
- Fix shell sesrch result order (Khalid Abu Shawarib)
- Fix floating bar style when unfocused (Peter Eisenmann)

* Cleanups:
- Rework view switching code of window-slot (Ant=C3=B3nio Fernandes)
- Use AdwSpinner in floating bar (Automeris naranja)

* Translation updates (GNOME Translation Project contributors)

Major Changes in 48.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements:
- Improve directory loading performance (Khalid Abu Shawarib, Peter Eisen=
mann)
- Use AdwDialog for list view column chooser and properties dialog (Autom=
eris naranja)
- Change tab behavior for the sidebar (Luk=C3=A1=C5=A1 Tyrychtr)
- Create about dialog from appdata (Felipe Borges, Matthijs Velsink, Pete=
r Eisenmann)
- Port various dialogs to AdwAlertDialog (Automeris naranja)
- Keep mount monitor around for caching in gvfs to work (Khalid Abu Shawa=
rib)
- Adjust to localsearch changes (Bobby Rong, Carlos Garnacho, Khalid Abu =
Shawarib, Sam Thursfield)
- Hide Trash banner when empty (Isaac Yeo)
- Ellipsize sidebar labels in the middle (Peter Eisenmann)
- Add a CONTRIBUTING file (Corey Berla)
- Allow removing bookmarks from pathbar (Isaac Yeo)
- Various UI tweaks and label changes (Automeris naranja, Brage Fuglseth,=
 Jamie Gravendeel, Khalid Abu Shawarib)
- Various speedups (Corey Berla, Khalid Abu Shawarib)

* Bugfixes:
- Fix unintended grid relayouting on thumbnail loading (Calvin Walton)
- Fix double a11y presentation of the filename in grid view (Luk=C3=A1=C5=
=A1 Tyrychtr)
- Keep CI running (Khalid Abu Shawarib, Peter Eisenmann)
- Fix query editor translation (Aleksandr Melman)
- Hide empty extensions list in properties (Khalid Abu Shawarib)
- Fix NULL dereference with extensions (Philipp Unger)

* Cleanups:
- Improve grid selection implementation (Adrien Plazas)
- Avoid setting up unnecessary directory monitors (Corey Berla)
- Replace uselocale with Glib gettext variant (Khalid Abu Shawarib)
- Stop setting invisible menu icons (Khalid Abu Shawarib)

* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_47.2.bb =3D> nautilus_48.rc.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_47.2.bb =3D> nautilus=
_48.rc.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_48.rc.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_48.rc.bb
index 9f44dcb114..9bbf5e26dd 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.rc.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "7f3203474f2e6374a11c6754ef33f3360eaf7f5b=
5e85f5e477e8a0ae0fa764d9"
+SRC_URI[archive.sha256sum] =3D "8131b37f46eb4aa61aac997d6ce8a1facbd3604d=
177f61bd3b17620435baa99e"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
--=20
2.48.1


