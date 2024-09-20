Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41530CF9C47
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:21 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20392.1726844891926735171
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id D008E2E7E0
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEV-3JaG0a0; Fri, 20 Sep 2024 17:07:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 20/23] nautilus: update 46.2 -> 47.0
Date: Fri, 20 Sep 2024 17:08:19 +0200
Message-ID: <20240920150822.1131707-20-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1726844863-37FFD467-403451E6/0/0 CLEAN NORMAL
X-TOI-MSGID: acc9fbb5-4caa-4981-b485-0d51fec85b92
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112424

Major changes in 47.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
 - Show new folder button in Open Folder(s) modes (Corey Berla)
 - Persist window size for file chooser (Corey Berla)
* Bugfixes:
 - Fix grammar error (Khalid Abu Shawarib)
 - Fix build error (Jami Kettunen)
 - Escape toast button mnemonics (Khalid Abu Shawarib)
 * File chooser fixes:
  - Don't show undo button when suggested name doesn't exist (Corey Berla=
)
  - Show filter name more consistently (Corey Berla)
  - Stop crashing when using "Open Item Location" (Corey Berla)
  - Fix issue where new folder button disappears (Corey Berla)
  - Fix flat dropdown styles (Alice Mikhaylenko)
* Translation updates (GNOME Translation Project contributors)
Major changes in 47.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
- Polish the file chooser (Ant=C3=B3nio Fernandes)
- Implement file chooser "choices" menu (Corey Berla)
- Allow extracting bzip2 tar files (Khalid Abu Shawarib)
- Allow dropping items into the file chooser (Corey Berla)
- Add the background menu to the file chooser (Corey Berla)
- Allow vertical scrolling in the pathbar (Liam Rust)
- Activate the accept button by default in file chooser (Dylan McCall)
* Bugfixes:
- Fix various file chooser crashes (Corey Berla)
- Don't hide file chooser filters with long filenames or in narrow mode (=
Corey Berla)
- Make sure the pathbar always shows the current folder (Corey Berla)
- Fix overlapping filename widget in file chooser (Corey Berla)
- Make nautilus previewer work between the main window and file chooser (=
Ant=C3=B3nio Fernandes)
- Various fixes for file chooser paths and save locations (Corey Berla)
- Set focus correctly in file chooser (Corey Berla)
- Allow unselecting an item in file chooser (Corey Berla)
- Add a tooltip to the network address bar button (Automeris naranja)
- Disallow conventional DnD into the pathbar in file chooser mode (Corey =
Berla)
- Don't overflow window in file chooser (Corey Berla)
* Translation updates (GNOME Translation Project contributors)
Major changes in 47.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
- Implement file chooser portal and introduce file chooser ui (Ant=C3=B3n=
io Fernandes)
- Redesign and modernize the compression dialog (Automeris naranja)
- Modernize the new folder dialog (Automeris naranja, Ant=C3=B3nio Fernan=
des)
- Replace Search Banner with Search Info Popover (Anuraag Reddy Patllollu=
)
- Redesign "Other Types" search (Khalid Abu Shawarib)
- Port to new adwaita widgets (Automeris naranja, Khalid Abu Shawarib, Pe=
ter Eisenmann)
- Update emblems with symbolics (Sam Hewitt, Khalid Abu Shawarib, Peter E=
isenmann)
* Bugfixes:
- Use correct path for email (Peter Eisenmann)
- File chooser bug fixes (Corey Berla)
- Disable bookmarking the network view (Corey Berla)
- Change files view accent to grey (Alice Mikhaylenko)
- Fix dragging on touch devices (Lukas Swierzy, Gary Li)
- Misc bugfixes (Khalid Abu Shawarib, Peter Eisenmann, Ant=C3=B3nio Ferna=
ndes, Corey Berla)
* Translation updates (GNOME Translation Project contributors)
Major changes in 47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
 - Add the Network view (Ant=C3=B3nio Fernandes, Allan Day)
 - Show xdg dirs in sidebar as regular (removable) bookmarks (Ant=C3=B3ni=
o Fernandes)
 - Show sidebar bookmarks before mounts (Ant=C3=B3nio Fernandes)
 - Remove "Other Locations" and show mounts directly on the sidebar (Ant=C3=
=B3nio Fernandes)
 - Improve view performance (Khalid Abu Shawarib)
 - Use new adw views (Automeris naranja)
 - Improve internal NautilusFile performance (Peter Eisenmann)

 - Improve ui for progress indicator (Peter Eisenmann)
 - Improve ui to floating bar (Sam Hewitt, piegames)
 - Allow staring from the context menu (Jos=C3=A9 Guilherme)
 - Redesign trash dialog (Anuraag Reddy Patllollu, Allan Day)
 - Allow Scripts in flatpak (Anuraag Reddy Patllollu)
 - Open mounts in original tab instead of focused tab (Gary Li)
 - Allow simultaneous mounting (Khalid Abu Shawarib)
* Bugfixes:
  - Create archive with Enter on Compress dialog (Luk=C3=A1=C5=A1 Tyrycht=
r)
  - Accessibility fixes (Automeris naranja, Sabri =C3=9Cnal)
  - Move focus correctly when item is removed (Khalid Abu Shawarib)
  - Don't reset permissions when copying from a non-isofs readonly filesy=
stem (Fina Wilke)
  - Open correct panel in GNOME Settings for trash settings (Khalid Abu S=
hawarib)
  - Disable paste in Trash, Recent, and Starred (Jonathan Lin)
  - Fix error when passing invalid location to portals (Khalid Abu Shawar=
ib)
  - Fix memory leaks (Khalid Abu Shawarib, Ant=C3=B3nio Fernandes)
  - Call shutdown() on modules (Corey Berla)
  - Don't show banners in global search (Khalid Abu Shawarib)
  - Prevent a crash (Khalid Abu Shawarib, Gary Li)
  - Keep correct file list order in a DnD (Khalid Abu Shawarib)
  - Don't display future dates as "Today" or "Yesterday" (Grey Nicholson)
  - Prevent freeze (Peter Eisenmann)
  - Fix broken sort order when switching views (Gary Li)
  - Don't irreversibly hide sidebar with touch gesture (Khalid Abu Shawar=
ib)
  - Don't unnecessarily re-set selection in search (Gary Li)
  - Don't scale up images in properties preview (Khalid Abu Shawarib)
  - Actually drop wayland export handles (Ant=C3=B3nio Fernandes)
  - Fix potentially incorrect file operation (Khalid Abu Shawarib)
  - Batch rename fix tags, and allow illegal characters (Anuraag Reddy Pa=
tllollu)
  - Allow xdp to fail (Ball=C3=B3 Gy=C3=B6rgy)
  - Fix typo (Alexandre Franke)
* Cleanups
  - Use property styling for adw rows (Automeris naranja, Anton Snigirev)
  - Code cleanup (Khalid Abu Shawarib, Peter Eisenmann, Corey Berla, Ant=C3=
=B3nio Fernandes)
  - Significant refactoring and cleanup to prepare to Nautilus as a file =
chooser (Ant=C3=B3nio Fernandes)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_46.2.bb =3D> nautilus_47.0.bb}    | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_46.2.bb =3D> nautilus=
_47.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_46.2.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_47.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_46.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_47.0.bb
index 30e0681ae..b8df8419b 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_46.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_47.0.bb
@@ -17,12 +17,14 @@ DEPENDS =3D " \
     libhandy \
     libportal \
     libxml2 \
-    tracker \
+    tinysparql \
+    wayland \
+    wayland-native \
 "
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "6ee8c99019b9e3447f6918d68232a20deca89e55=
25c05805432b7d8840ca71fa"
+SRC_URI[archive.sha256sum] =3D "334264cdd9edbfd95ee7bcaafe442ebed31acca3=
f2d9b90f3eda30eacfd0387a"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
@@ -46,9 +48,9 @@ FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/metainfo \
     ${datadir}/gnome-shell \
-    ${datadir}/tracker3 \
+    ${datadir}/localsearch3 \
 "
=20
 # mandatory - not checked during configuration:
 # | (org.gnome.Nautilus:863): GLib-GIO-ERROR **: 21:03:52.326: Settings =
schema 'org.freedesktop.Tracker.Miner.Files' is not installed
-RDEPENDS:${PN} +=3D "tracker-miners bubblewrap"
+RDEPENDS:${PN} +=3D "localsearch bubblewrap"
--=20
2.46.0


