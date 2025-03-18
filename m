Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674A2C35FFA
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:34:13 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.6806.1742286845470136847
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 01:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id C09A615B0;
	Tue, 18 Mar 2025 09:33:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuSOT-2EPvLv0; Tue, 18 Mar 2025 09:33:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 11/11] nautilus: update 47.2 ->> 48.0
Date: Tue, 18 Mar 2025 09:34:30 +0100
Message-ID: <20250318083430.544906-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318083430.544906-1-f_l_k@t-online.de>
References: <20250318083430.544906-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1742286829-72FFB450-601A303D/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e97e229-dee4-44c2-92d9-809b55a3547e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 08:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116049

Major Changes in 48
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Reversals:
- Replace uselocale with Glib gettext variant (Khalid Abu Shawarib)
* Bugfixes:
- Generate thumbnails by order in view (Khalid Abu Shawarib)
- Try more icons before using generic fallback (Khalid Abu Shawarib)
- Focus filename entry in save mode by default (Ian Off)
- Fix tree view and outdated file info crashes introduced in 48.rc (Khali=
d Abu Shawarib)
- Use colored icon for filesystem root properties (Khalid Abu Shawarib)
- Set search popover row heights (Khalid Abu Shawarib)
* Cleanups:
- Various performance enhancements around sorting, hidden files and image=
 decoding (Khalid Abu Shawarib)
- Add build summary (Khalid Abu Shawarib)
* Translation updates (GNOME Translation Project contributors)

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nautilus/{nautilus_47.2.bb =3D> nautilus_48.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_47.2.bb =3D> nautilus=
_48.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_48.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb
index 9f44dcb114..4b9f9fcf26 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_47.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_48.0.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "7f3203474f2e6374a11c6754ef33f3360eaf7f5b=
5e85f5e477e8a0ae0fa764d9"
+SRC_URI[archive.sha256sum] =3D "f9e6a4cbe1d5bb7ad59ac44f0d439edd4b0507bf=
07d3d90a2e7e7e6d3f416d57"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
--=20
2.48.1


