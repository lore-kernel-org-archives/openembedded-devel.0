Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEB7C10F1A
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:07:25 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.170.1714579636341131008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 09:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout07.t-online.de (Postfix) with SMTP id 45835D8EA;
	Wed,  1 May 2024 18:07:14 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.42.233]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s2CUD-3qlfvc0; Wed, 1 May 2024 18:07:13 +0200
Date: Wed, 01 May 2024 18:07:22 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] nautilus: update 45.1 -> 46.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <A4ETCS.BYOOAI4M6HFR1@t-online.de>
In-Reply-To: <17CB013F8E1A4961.26557@lists.openembedded.org>
References: <17CB013F8E1A4961.26557@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-216jE1KEZNcKaLEuZ2/U"
X-TOI-EXPURGATEID: 150726::1714579633-42FFAD34-5C6C5180/0/0 CLEAN NORMAL
X-TOI-MSGID: 23252bed-bc58-455e-9d83-99a0d7c21047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 16:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110206

--=-216jE1KEZNcKaLEuZ2/U
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable

I've seen, that this update was added to scarthgap. This would require=20
the glib update to 2.80 for oe-core as well:
<https://gitlab.gnome.org/GNOME/nautilus/-/blob/main/meson.build?ref_type=
=3Dheads#L100>

On Tue, Apr 30 2024 at 10:24:29 AM +02:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> Major changes in 46.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Bugfixes:
>   - Create archive with Enter on Compress dialog (Luk=E1=B9 Tyrychtr)
>   - Move focus correctly when item is removed (Khalid Abu Shawarib)
>   - View performance optimization (Khalid Abu Shawarib)
>   - Fix crash when compressing a file and a folder (Khalid Abu=20
> Shawarib)
>   - Don't show banners in global search (Khalid Abu Shawarib)
>   - Preserve permissions when copying from read-only file systems=20
> (Khalid Abu Shawarib)
>   - Disable non-working global search from Other Locations (Ant=F3nio=20
> Fernandes)
> * Translation updates (GNOME Translation Project contributors)
>=20
> Major changes in 46.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Bugfixes:
>   - Remove char limit on size label in properties dialog (Khalid Abu=20
> Shawarib)
> * Translation updates (GNOME Translation Project contributors)
>=20
> Major changes in 46.rc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Enhancements
>   - Adjust empty status page and progress tooltip strings (Allan Day,=20
> Khalid Abu Shawarib)
>   - Add input hints and purpose properties to entries (Khalid Abu=20
> Shawarib)
>   - Refine operations hover background (Sam Hewitt, Ant=F3nio=20
> Fernandes)
> * Bugfixes:
>   - Position loop mounts correctly in the sidebar (Ant=F3nio Fernandes)
>   - Fix internationalization issues (Khalid Abu Shawarib, Peter=20
> Eisenmann)
>   - Revert crashes-causing multi-file properties performance=20
> optimization (Peter Eisenmann)
>   - Reestablish location signals if location change failed (Corey=20
> Berla)
>   - Fix regression which disallowed dropping files on empty folders=20
> (Corey Berla, Ant=F3nio Fernandes)
> * Cleanups
>   - Remove architecture-sensitive duplicate filename unit test (Peter=20
> Eisenmann, Jeremy Bicha)
>   - Refine Appstream metainfo (Sophie Herold, Alexandre Franke)
> * Translation updates (GNOME Translation Project contributors)
>=20
> Major changes in 46.beta
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Postponed
>   - The network view from 46.alpha.1 was deemed to require more work
> * Enhancements
>   - Added a global search mode (Ant=F3nio Fernandes)
>   - Use 'text entry' cursor on pathbar hover (Corey Berla)
>   - Add drop shadow to file property dialog icons (kramo)
>   - Improve progress info icons and tooltips (Bharat Tyagi, Sam=20
> Hewitt)
> * Bugfixes:
>   - Avoid crashes with column chooser (Peter Eisenmann)
>   - Avoid crash when navigating back to same folder (Ant=F3nio=20
> Fernandes)
>   - Avoid infinite loop on file creation naming conflict (Corey Berla)
>   - Fix displaying parent folder of multi-files (Anton Snigirev)
>   - Clear location entry on editing of internal locations (Peter=20
> Eisenmann)
>   - Ensure search's clear button is hidden when empty (Ant=F3nio=20
> Fernandes)
>   - Hide search popover after opening a dialog (Khalid Abu Shawarib)
>   - Correctly open empty folders from search (Ant=F3nio Fernandes)
>   - Don't reload view only to change selection (Ant=F3nio Fernandes)
>   - Use smaller icons in progress indicator (Ant=F3nio Fernandes, Sam=20
> Hewitt)
>   - Fix various leaks (Khalid Abu Shawarib, Ant=F3nio Fernandes)
>   - Added extra tentacles to confuse AI-generated blogs (Via Matrix)
> * Cleanups
>   - Made various string HIG compatible (Bart Gravendeel, Automeris=20
> naranja)
>   - Modernize column chooser widgetry (Automeris naranja)
>   - Detect potfile errors via CI (Corey Berla)
>   - Replace deprecated GTK point computing functions (N.Pranav=20
> Krishna)
>=20
> Major changes in 46.alpha.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Enhancements
>   - Views can be switched without a folder reload (Ant=F3nio Fernandes)
>   - Operations are listed in the bottom of the sidebar (Corey Berla,=20
> Ant=F3nio Fernandes, Allan Day)
>   - Network view replaces Other Locations (Ant=F3nio Fernandes, Allan=20
> Day)
>   - Mounted drives are shown in the sidebar (Ant=F3nio Fernandes)
>   - Selected files are recorded in back and forward history (Ant=F3nio=20
> Fernandes)
>   - Subfolder loading indication (Ant=F3nio Fernandes)
>   - Various view performance improvements (Ant=F3nio Fernandes)
>   - Improved performance of multi-file properties dialog (Khalid Abu=20
> Shawarib)
> * Bugfixes:
>   - Correctly prioritize thumbnails for non-alphabetical sort order=20
> (Corey Berla)
>   - Notify view item name changes for accessibility (Corey Berla,=20
> Ant=F3nio Fernandes)
>   - Open real folder for documents in Recent from Properties (Anton=20
> Snigirev)
>   - Pattern match (Ctrl+S) all expanded list view directories=20
> (Ant=F3nio Fernandes)
>   - Display sampling frequency in kHz with thousand separators=20
> (Hariharan D)
>   - Treat markdown files as text documents in search (Hariharan D)
>   - Improve UI text capitalization and mnemonics (Automeris naranja)
>   - Fix tab tooltip texts for markup and search (Corey Berla)
>   - Fix extension linkage with C++ (Khalid Abu Shawarib)
>   - Add a tooltip to the star button (Luk=E1=B9 Tyrychtr)
>   - Show correct shortcut for Redo on the menu (Divyansh Jain)
>   - Prevent use-after-free with mount and stop (Ant=F3nio Fernandes)
>   - Improve virtual files handling  (Ant=F3nio Fernandes)
>   - Fix various view-related bugs, leaks and warnings (Ant=F3nio=20
> Fernandes)
> * Cleanups:
>   - Significant restructuring of view architecture (Ant=F3nio=20
> Fernandes)
>   - Remove dead code in views and css styles (Ant=F3nio Fernandes)
>   - Update man page, remove documentation for removed self-check=20
> functionality (Corey Berla)
> * Translation updates (GNOME Translation Project contributors)
>=20
> Major changes in 46.alpha.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Enhancements
>   - Confirm password when creating protected ZIP archives (Eric=20
> Daigle)
>   - Make custom folder icon feature discoverable (Khalid Abu Shawarib)
>   - Make URI entry discoverable (Alynx Zhou, Barnab=E1s P=F5cze)
>   - Allow changing owner/group and any permissions under admin:///=20
> (Ant=F3nio Fernandes)
>   - Add detailed date and time format option (Ondrej Holy, Peter=20
> Eisenmann)
>   - Detect copy/move over 4GiB file limit on FAT (Corey Berla)
>   - Give feedback on completion of quick operations (Ant=F3nio=20
> Fernandes)
>   - New-style banners, unstar animation, and other visual refinements=20
> (Peter Eisenmann, Automeris naranja)
>   - Allow Alt+Down to revert more than one Alt+Up (vmkul)
>   - Close overlaid sidebar on location change (Khalid Abu Shawarib)
> * Bugfixes:
>   - Don't skip files in deep count/size (Ant=F3nio Fernandes)
>   - Don't move files around as thumbnails load (Corey Berla)
>   - Reveal highlighted file without delay  (Corey Berla)
>   - Stop crashing in various situations (Sebastian Keller, Ant=F3nio=20
> Fernandes, Corey Berla, Khalid Abu Shawarib)
>   - Resolve UI text inconsistencies (Automeris naranja, getsnoopy,=20
> kramo, Khalid Abu Shawarib, Ondrej Holy, Matthijs Velsink)
>   - Fix memory leaks, template disposal, and warnings (Khalid Abu=20
> Shawarib)
>   - Fix interface problems in Properties (Peter Eisenmann, Ant=F3nio=20
> Fernandes, Khalid Abu Shawarib)
>   - Don't keep viewing unmounted locations (Ondrej Holy, Ant=F3nio=20
> Fernandes, Khalid Abu Shawarib)
>   - Refined appdata (Sabri =DCnal, Ant=F3nio Fernandes)
>   - Resolve wrong scroll positioning bugs (Gary Li, Ant=F3nio=20
> Fernandes)
>   - Fix automatic file duplicate naming (Peter Eisenmann)
>   - Properly reorder bookmarks by drag and drop (Khalid Abu Shawarib)
>   - Set current modification time on file created from templates=20
> (Khalid Abu Shawarib)
>   - Fix missing/wrong mime type icons (Ant=F3nio Fernandes)
>   - Don't reload on autofs timeout (Ant=F3nio Fernandes)
> * Cleanups
>   - Remove obsolete profiling, custom debug logging, and=20
> self-checking (Peter Eisenmann, Khalid Abu Shawarib)
>   - Streamline and expand tests (Khalid Abu Shawarib, Peter Eisenmann)
>   - Reduce usage of GtkDialog and other deprecated API (Khalid Abu=20
> Shawarib, Peter Eisenmann)
>   - Replace custom switch row with AdwSwitchRow (=D3scar Fern=E1ndez=20
> D=EDaz)
>   - Drop obsolete code (Peter Eisenmann, Ant=F3nio Fernandes, Corey=20
> Berla)
>   - Reduce unnecessary string copies (Peter Eisenmann)
>   - Unify numbered filename apendix handling (Peter Eisenmann, Khalid=20
> Abu Shawarib)
> * Translation updates (GNOME Translation Project contributors)
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../nautilus/{nautilus_45.1.bb =3D> nautilus_46.1.bb}             | 2=20
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.1.bb =3D>=20
> nautilus_46.1.bb} (93%)
>=20
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb=20
> b/meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
> similarity index 93%
> rename from meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
> rename to meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
> index 9c0d154ec..4092ff9dd 100644
> --- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
> @@ -22,7 +22,7 @@ DEPENDS =3D " \
>=20
>  inherit gnomebase gsettings gobject-introspection gi-docgen gettext=20
> features_check mime-xdg gtk-icon-cache
>=20
> -SRC_URI[archive.sha256sum] =3D=20
> "23bdaa9a85466c5937a89daddd080ed03bcc2b49e8b64af607206353bde82fe3"
> +SRC_URI[archive.sha256sum] =3D=20
> "cc1a5fdf1dd72f92e9e3f3c7ad263709a0de5391a895be9344f6a67f43887bd7"
>=20
>  REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
>=20
> --
> 2.44.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110195):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/110195>
> Mute This Topic: <https://lists.openembedded.org/mt/105817245/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-216jE1KEZNcKaLEuZ2/U
Content-Type: text/html; charset=iso-8859-2
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I've seen, that this update was ad=
ded to scarthgap. This would require the glib update to 2.80 for oe-core as=
 well:</div><div><a href=3D"https://gitlab.gnome.org/GNOME/nautilus/-/blob/=
main/meson.build?ref_type=3Dheads#L100">https://gitlab.gnome.org/GNOME/naut=
ilus/-/blob/main/meson.build?ref_type=3Dheads#L100</a></div></div><div id=
=3D"geary-quote" dir=3D"auto"><br>On Tue, Apr 30 2024 at 10:24:29 AM +02:00=
:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"ci=
te"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Major cha=
nges in 46.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Bugfixes:
  - Create archive with Enter on Compress dialog (Luk=E1=B9 Tyrychtr)
  - Move focus correctly when item is removed (Khalid Abu Shawarib)
  - View performance optimization (Khalid Abu Shawarib)
  - Fix crash when compressing a file and a folder (Khalid Abu Shawarib)
  - Don't show banners in global search (Khalid Abu Shawarib)
  - Preserve permissions when copying from read-only file systems (Khalid A=
bu Shawarib)
  - Disable non-working global search from Other Locations (Ant=F3nio Ferna=
ndes)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Bugfixes:
  - Remove char limit on size label in properties dialog (Khalid Abu Shawar=
ib)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
  - Adjust empty status page and progress tooltip strings (Allan Day, Khali=
d Abu Shawarib)
  - Add input hints and purpose properties to entries (Khalid Abu Shawarib)
  - Refine operations hover background (Sam Hewitt, Ant=F3nio Fernandes)
* Bugfixes:
  - Position loop mounts correctly in the sidebar (Ant=F3nio Fernandes)
  - Fix internationalization issues (Khalid Abu Shawarib, Peter Eisenmann)
  - Revert crashes-causing multi-file properties performance optimization (=
Peter Eisenmann)
  - Reestablish location signals if location change failed (Corey Berla)
  - Fix regression which disallowed dropping files on empty folders (Corey =
Berla, Ant=F3nio Fernandes)
* Cleanups
  - Remove architecture-sensitive duplicate filename unit test (Peter Eisen=
mann, Jeremy Bicha)
  - Refine Appstream metainfo (Sophie Herold, Alexandre Franke)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Postponed
  - The network view from 46.alpha.1 was deemed to require more work
* Enhancements
  - Added a global search mode (Ant=F3nio Fernandes)
  - Use 'text entry' cursor on pathbar hover (Corey Berla)
  - Add drop shadow to file property dialog icons (kramo)
  - Improve progress info icons and tooltips (Bharat Tyagi, Sam Hewitt)
* Bugfixes:
  - Avoid crashes with column chooser (Peter Eisenmann)
  - Avoid crash when navigating back to same folder (Ant=F3nio Fernandes)
  - Avoid infinite loop on file creation naming conflict (Corey Berla)
  - Fix displaying parent folder of multi-files (Anton Snigirev)
  - Clear location entry on editing of internal locations (Peter Eisenmann)
  - Ensure search's clear button is hidden when empty (Ant=F3nio Fernandes)
  - Hide search popover after opening a dialog (Khalid Abu Shawarib)
  - Correctly open empty folders from search (Ant=F3nio Fernandes)
  - Don't reload view only to change selection (Ant=F3nio Fernandes)
  - Use smaller icons in progress indicator (Ant=F3nio Fernandes, Sam Hewit=
t)
  - Fix various leaks (Khalid Abu Shawarib, Ant=F3nio Fernandes)
  - Added extra tentacles to confuse AI-generated blogs (Via Matrix)
* Cleanups
  - Made various string HIG compatible (Bart Gravendeel, Automeris naranja)
  - Modernize column chooser widgetry (Automeris naranja)
  - Detect potfile errors via CI (Corey Berla)
  - Replace deprecated GTK point computing functions (N.Pranav Krishna)

Major changes in 46.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
  - Views can be switched without a folder reload (Ant=F3nio Fernandes)
  - Operations are listed in the bottom of the sidebar (Corey Berla, Ant=F3=
nio Fernandes, Allan Day)
  - Network view replaces Other Locations (Ant=F3nio Fernandes, Allan Day)
  - Mounted drives are shown in the sidebar (Ant=F3nio Fernandes)
  - Selected files are recorded in back and forward history (Ant=F3nio Fern=
andes)
  - Subfolder loading indication (Ant=F3nio Fernandes)
  - Various view performance improvements (Ant=F3nio Fernandes)
  - Improved performance of multi-file properties dialog (Khalid Abu Shawar=
ib)
* Bugfixes:
  - Correctly prioritize thumbnails for non-alphabetical sort order (Corey =
Berla)
  - Notify view item name changes for accessibility (Corey Berla, Ant=F3nio=
 Fernandes)
  - Open real folder for documents in Recent from Properties (Anton Snigire=
v)
  - Pattern match (Ctrl+S) all expanded list view directories (Ant=F3nio Fe=
rnandes)
  - Display sampling frequency in kHz with thousand separators (Hariharan D=
)
  - Treat markdown files as text documents in search (Hariharan D)
  - Improve UI text capitalization and mnemonics (Automeris naranja)
  - Fix tab tooltip texts for markup and search (Corey Berla)
  - Fix extension linkage with C++ (Khalid Abu Shawarib)
  - Add a tooltip to the star button (Luk=E1=B9 Tyrychtr)
  - Show correct shortcut for Redo on the menu (Divyansh Jain)
  - Prevent use-after-free with mount and stop (Ant=F3nio Fernandes)
  - Improve virtual files handling  (Ant=F3nio Fernandes)
  - Fix various view-related bugs, leaks and warnings (Ant=F3nio Fernandes)
* Cleanups:
  - Significant restructuring of view architecture (Ant=F3nio Fernandes)
  - Remove dead code in views and css styles (Ant=F3nio Fernandes)
  - Update man page, remove documentation for removed self-check functional=
ity (Corey Berla)
* Translation updates (GNOME Translation Project contributors)

Major changes in 46.alpha.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
* Enhancements
  - Confirm password when creating protected ZIP archives (Eric Daigle)
  - Make custom folder icon feature discoverable (Khalid Abu Shawarib)
  - Make URI entry discoverable (Alynx Zhou, Barnab=E1s P=F5cze)
  - Allow changing owner/group and any permissions under admin:/// (Ant=F3n=
io Fernandes)
  - Add detailed date and time format option (Ondrej Holy, Peter Eisenmann)
  - Detect copy/move over 4GiB file limit on FAT (Corey Berla)
  - Give feedback on completion of quick operations (Ant=F3nio Fernandes)
  - New-style banners, unstar animation, and other visual refinements (Pete=
r Eisenmann, Automeris naranja)
  - Allow Alt+Down to revert more than one Alt+Up (vmkul)
  - Close overlaid sidebar on location change (Khalid Abu Shawarib)
* Bugfixes:
  - Don't skip files in deep count/size (Ant=F3nio Fernandes)
  - Don't move files around as thumbnails load (Corey Berla)
  - Reveal highlighted file without delay  (Corey Berla)
  - Stop crashing in various situations (Sebastian Keller, Ant=F3nio Fernan=
des, Corey Berla, Khalid Abu Shawarib)
  - Resolve UI text inconsistencies (Automeris naranja, getsnoopy, kramo, K=
halid Abu Shawarib, Ondrej Holy, Matthijs Velsink)
  - Fix memory leaks, template disposal, and warnings (Khalid Abu Shawarib)
  - Fix interface problems in Properties (Peter Eisenmann, Ant=F3nio Fernan=
des, Khalid Abu Shawarib)
  - Don't keep viewing unmounted locations (Ondrej Holy, Ant=F3nio Fernande=
s, Khalid Abu Shawarib)
  - Refined appdata (Sabri =DCnal, Ant=F3nio Fernandes)
  - Resolve wrong scroll positioning bugs (Gary Li, Ant=F3nio Fernandes)
  - Fix automatic file duplicate naming (Peter Eisenmann)
  - Properly reorder bookmarks by drag and drop (Khalid Abu Shawarib)
  - Set current modification time on file created from templates (Khalid Ab=
u Shawarib)
  - Fix missing/wrong mime type icons (Ant=F3nio Fernandes)
  - Don't reload on autofs timeout (Ant=F3nio Fernandes)
* Cleanups
  - Remove obsolete profiling, custom debug logging, and self-checking (Pet=
er Eisenmann, Khalid Abu Shawarib)
  - Streamline and expand tests (Khalid Abu Shawarib, Peter Eisenmann)
  - Reduce usage of GtkDialog and other deprecated API (Khalid Abu Shawarib=
, Peter Eisenmann)
  - Replace custom switch row with AdwSwitchRow (=D3scar Fern=E1ndez D=EDaz=
)
  - Drop obsolete code (Peter Eisenmann, Ant=F3nio Fernandes, Corey Berla)
  - Reduce unnecessary string copies (Peter Eisenmann)
  - Unify numbered filename apendix handling (Peter Eisenmann, Khalid Abu S=
hawarib)
* Translation updates (GNOME Translation Project contributors)

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../nautilus/{nautilus_45.1.bb =3D&gt; nautilus_46.1.bb}             | 2 +=
-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_45.1.bb =3D&gt; nautilu=
s_46.1.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb b/meta-gnom=
e/recipes-gnome/nautilus/nautilus_46.1.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
index 9c0d154ec..4092ff9dd 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_46.1.bb
@@ -22,7 +22,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gi-docgen gettext featur=
es_check mime-xdg gtk-icon-cache
=20
-SRC_URI[archive.sha256sum] =3D "23bdaa9a85466c5937a89daddd080ed03bcc2b49e8=
b64af607206353bde82fe3"
+SRC_URI[archive.sha256sum] =3D "cc1a5fdf1dd72f92e9e3f3c7ad263709a0de5391a8=
95be9344f6a67f43887bd7"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11 opengl gobject-introspection-data"
=20
<div>--=20
</div>2.44.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#110195): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110195">https://lists.openembedded.org/g/openembed=
ded-devel/message/110195</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105817245/361=
8223">https://lists.openembedded.org/mt/105817245/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-216jE1KEZNcKaLEuZ2/U--


