Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B05C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 08:24:17 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.10270.1714465455072034368
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 01:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout02.t-online.de (Postfix) with SMTP id A32ED1D84
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 10:24:12 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.33.47]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s1imX-18dMtl0; Tue, 30 Apr 2024 10:24:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] nautilus: update 45.1 -> 46.1
Date: Tue, 30 Apr 2024 10:24:29 +0200
Message-ID: <20240430082429.1798605-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1714465449-62FFB3C7-7570BB6A/0/0 CLEAN NORMAL
X-TOI-MSGID: 515a1f00-5ebb-4ffc-987f-55a4fd9619f5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 08:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110195

Major changes in 46.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Bugfixes:
  - Create archive with Enter on Compress dialog (Luk=C3=A1=C5=A1 Tyrycht=
r)
  - Move focus correctly when item is removed (Khalid Abu Shawarib)
  - View performance optimization (Khalid Abu Shawarib)
  - Fix crash when compressing a file and a folder (Khalid Abu Shawarib)
  - Don't show banners in global search (Khalid Abu Shawarib)
  - Preserve permissions when copying from read-only file systems (Khalid=
 Abu Shawarib)
  - Disable non-working global search from Other Locations (Ant=C3=B3nio =
Fernandes)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Bugfixes:
  - Remove char limit on size label in properties dialog (Khalid Abu Shaw=
arib)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
  - Adjust empty status page and progress tooltip strings (Allan Day, Kha=
lid Abu Shawarib)
  - Add input hints and purpose properties to entries (Khalid Abu Shawari=
b)
  - Refine operations hover background (Sam Hewitt, Ant=C3=B3nio Fernande=
s)
* Bugfixes:
  - Position loop mounts correctly in the sidebar (Ant=C3=B3nio Fernandes=
)
  - Fix internationalization issues (Khalid Abu Shawarib, Peter Eisenmann=
)
  - Revert crashes-causing multi-file properties performance optimization=
 (Peter Eisenmann)
  - Reestablish location signals if location change failed (Corey Berla)
  - Fix regression which disallowed dropping files on empty folders (Core=
y Berla, Ant=C3=B3nio Fernandes)
* Cleanups
  - Remove architecture-sensitive duplicate filename unit test (Peter Eis=
enmann, Jeremy Bicha)
  - Refine Appstream metainfo (Sophie Herold, Alexandre Franke)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Postponed
  - The network view from 46.alpha.1 was deemed to require more work
* Enhancements
  - Added a global search mode (Ant=C3=B3nio Fernandes)
  - Use 'text entry' cursor on pathbar hover (Corey Berla)
  - Add drop shadow to file property dialog icons (kramo)
  - Improve progress info icons and tooltips (Bharat Tyagi, Sam Hewitt)
* Bugfixes:
  - Avoid crashes with column chooser (Peter Eisenmann)
  - Avoid crash when navigating back to same folder (Ant=C3=B3nio Fernand=
es)
  - Avoid infinite loop on file creation naming conflict (Corey Berla)
  - Fix displaying parent folder of multi-files (Anton Snigirev)
  - Clear location entry on editing of internal locations (Peter Eisenman=
n)
  - Ensure search's clear button is hidden when empty (Ant=C3=B3nio Ferna=
ndes)
  - Hide search popover after opening a dialog (Khalid Abu Shawarib)
  - Correctly open empty folders from search (Ant=C3=B3nio Fernandes)
  - Don't reload view only to change selection (Ant=C3=B3nio Fernandes)
  - Use smaller icons in progress indicator (Ant=C3=B3nio Fernandes, Sam =
Hewitt)
  - Fix various leaks (Khalid Abu Shawarib, Ant=C3=B3nio Fernandes)
  - Added extra tentacles to confuse AI-generated blogs (Via Matrix)
* Cleanups
  - Made various string HIG compatible (Bart Gravendeel, Automeris naranj=
a)
  - Modernize column chooser widgetry (Automeris naranja)
  - Detect potfile errors via CI (Corey Berla)
  - Replace deprecated GTK point computing functions (N.Pranav Krishna)

Major changes in 46.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
  - Views can be switched without a folder reload (Ant=C3=B3nio Fernandes=
)
  - Operations are listed in the bottom of the sidebar (Corey Berla, Ant=C3=
=B3nio Fernandes, Allan Day)
  - Network view replaces Other Locations (Ant=C3=B3nio Fernandes, Allan =
Day)
  - Mounted drives are shown in the sidebar (Ant=C3=B3nio Fernandes)
  - Selected files are recorded in back and forward history (Ant=C3=B3nio=
 Fernandes)
  - Subfolder loading indication (Ant=C3=B3nio Fernandes)
  - Various view performance improvements (Ant=C3=B3nio Fernandes)
  - Improved performance of multi-file properties dialog (Khalid Abu Shaw=
arib)
* Bugfixes:
  - Correctly prioritize thumbnails for non-alphabetical sort order (Core=
y Berla)
  - Notify view item name changes for accessibility (Corey Berla, Ant=C3=B3=
nio Fernandes)
  - Open real folder for documents in Recent from Properties (Anton Snigi=
rev)
  - Pattern match (Ctrl+S) all expanded list view directories (Ant=C3=B3n=
io Fernandes)
  - Display sampling frequency in kHz with thousand separators (Hariharan=
 D)
  - Treat markdown files as text documents in search (Hariharan D)
  - Improve UI text capitalization and mnemonics (Automeris naranja)
  - Fix tab tooltip texts for markup and search (Corey Berla)
  - Fix extension linkage with C++ (Khalid Abu Shawarib)
  - Add a tooltip to the star button (Luk=C3=A1=C5=A1 Tyrychtr)
  - Show correct shortcut for Redo on the menu (Divyansh Jain)
  - Prevent use-after-free with mount and stop (Ant=C3=B3nio Fernandes)
  - Improve virtual files handling  (Ant=C3=B3nio Fernandes)
  - Fix various view-related bugs, leaks and warnings (Ant=C3=B3nio Ferna=
ndes)
* Cleanups:
  - Significant restructuring of view architecture (Ant=C3=B3nio Fernande=
s)
  - Remove dead code in views and css styles (Ant=C3=B3nio Fernandes)
  - Update man page, remove documentation for removed self-check function=
ality (Corey Berla)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.alpha.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
  - Confirm password when creating protected ZIP archives (Eric Daigle)
  - Make custom folder icon feature discoverable (Khalid Abu Shawarib)
  - Make URI entry discoverable (Alynx Zhou, Barnab=C3=A1s P=C5=91cze)
  - Allow changing owner/group and any permissions under admin:/// (Ant=C3=
=B3nio Fernandes)
  - Add detailed date and time format option (Ondrej Holy, Peter Eisenman=
n)
  - Detect copy/move over 4GiB file limit on FAT (Corey Berla)
  - Give feedback on completion of quick operations (Ant=C3=B3nio Fernand=
es)
  - New-style banners, unstar animation, and other visual refinements (Pe=
ter Eisenmann, Automeris naranja)
  - Allow Alt+Down to revert more than one Alt+Up (vmkul)
  - Close overlaid sidebar on location change (Khalid Abu Shawarib)
* Bugfixes:
  - Don't skip files in deep count/size (Ant=C3=B3nio Fernandes)
  - Don't move files around as thumbnails load (Corey Berla)
  - Reveal highlighted file without delay  (Corey Berla)
  - Stop crashing in various situations (Sebastian Keller, Ant=C3=B3nio F=
ernandes, Corey Berla, Khalid Abu Shawarib)
  - Resolve UI text inconsistencies (Automeris naranja, getsnoopy, kramo,=
 Khalid Abu Shawarib, Ondrej Holy, Matthijs Velsink)
  - Fix memory leaks, template disposal, and warnings (Khalid Abu Shawari=
b)
  - Fix interface problems in Properties (Peter Eisenmann, Ant=C3=B3nio F=
ernandes, Khalid Abu Shawarib)
  - Don't keep viewing unmounted locations (Ondrej Holy, Ant=C3=B3nio Fer=
nandes, Khalid Abu Shawarib)
  - Refined appdata (Sabri =C3=9Cnal, Ant=C3=B3nio Fernandes)
  - Resolve wrong scroll positioning bugs (Gary Li, Ant=C3=B3nio Fernande=
s)
  - Fix automatic file duplicate naming (Peter Eisenmann)
  - Properly reorder bookmarks by drag and drop (Khalid Abu Shawarib)
  - Set current modification time on file created from templates (Khalid =
Abu Shawarib)
  - Fix missing/wrong mime type icons (Ant=C3=B3nio Fernandes)
  - Don't reload on autofs timeout (Ant=C3=B3nio Fernandes)
* Cleanups
  - Remove obsolete profiling, custom debug logging, and self-checking (P=
eter Eisenmann, Khalid Abu Shawarib)
  - Streamline and expand tests (Khalid Abu Shawarib, Peter Eisenmann)
  - Reduce usage of GtkDialog and other deprecated API (Khalid Abu Shawar=
ib, Peter Eisenmann)
  - Replace custom switch row with AdwSwitchRow (=C3=93scar Fern=C3=A1nde=
z D=C3=ADaz)
  - Drop obsolete code (Peter Eisenmann, Ant=C3=B3nio Fernandes, Corey Be=
rla)
  - Reduce unnecessary string copies (Peter Eisenmann)
  - Unify numbered filename apendix handling (Peter Eisenmann, Khalid Abu=
 Shawarib)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nautilus/{nautilus_45.1.bb =3D> nautilus_46.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.1.bb =3D> nautilus=
_46.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb b/meta-gn=
ome/recipes-gnome/nautilus/nautilus_46.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
index 9c0d154ec..4092ff9dd 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
@@ -22,7 +22,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext feat=
ures_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "23bdaa9a85466c5937a89daddd080ed03bcc2b49=
e8b64af607206353bde82fe3"
+SRC_URI[archive.sha256sum] =3D "cc1a5fdf1dd72f92e9e3f3c7ad263709a0de5391=
a895be9344f6a67f43887bd7"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
--=20
2.44.0


