Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4C4CD128A
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 20:24:47 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.23845.1711916685054986453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Mar 2024 13:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout03.t-online.de (Postfix) with SMTP id C9DC4E9DA
	for <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 22:23:56 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.46.245]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rr1ie-1IuEAT0; Sun, 31 Mar 2024 22:23:56 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] ghex: update 45.1 -> 46.0
Date: Sun, 31 Mar 2024 22:24:10 +0200
Message-ID: <20240331202410.209036-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711916636-BFFFC921-E1D65D6B/0/0 CLEAN NORMAL
X-TOI-MSGID: 6660e3ed-2214-4fa0-a38c-e05b90a35ccf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Mar 2024 20:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109694

=3D=3D=3D=3D=3D=3D=3D=3D=3D
GHex 46.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes and bugfixes since 46.alpha:
- widget: Fade zeroes in the hex display (Logan Rathbone)
- data: add 'hexadecimal' keyword to .desktop file (Nelson Ben=C3=ADtez L=
e=C3=B3n)
- appdata: Remove none OARS tags (Sabri =C3=9Cnal)
- appdata: Update appdata (Sabri =C3=9Cnal)
- appwin: Don't let AdwTabView trample over shortcuts (Logan Rathbone)
- lib: Fix PANGO_COLOR_FROM_FLOAT macro (Logan Rathbone)
- docs: GI tweaks and fixes (Logan Rathbone)
- lib/app: Initial support for marks (Logan Rathbone)
- help: Add marks section (Logan Rathbone)
- i18n: Remove domain that prevented use of translations (#66) (Anders Jo=
nsson)
- appwin: Allow dropping multiple files (Guldoman)
- widget/doc: Set widget busy state while file is mid-save (#76) (Logan R=
athbone)
- Code and documentation cleanups (Logan Rathbone)

Translation updates:
- Anders Jonsson (sv)
- Bal=C3=A1zs =C3=9Ar (hu)
- Christian Kirbach (de)
- Daniel Mustieles (es)
- Evangelos Skarmoutsos (el)
- Jiri Gr=C3=B6nroos (fi)
- J=C3=BCrgen Benvenuti (de)
- Sabri =C3=9Cnal (tr)
- Sergej A. (ru)
- Yuri Chornoivan (uk)

This release includes libgtkhex 4.8.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
GHex 46.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Changes and bugfixes since 45.0:
- GObject property getter fixes (Logan Rathbone)
- buf-malloc/mmap: Implement GObject 'file' property getter properly (Log=
an
  Rathbone)
- hex-buf/doc: Clarify GI transfer annotations (Logan Rathbone)
- hex-doc/buf: Support opening zero-length files (See: #73) (Logan Rathbo=
ne)
- hex-buf-iface: More appropriate messages when selecting backend (Logan
  Rathbone)
- hex-doc: Allow setting HEX_BUFFER env var to specify default backend (L=
ogan
  Rathbone)
- Remove almost all remaining GtkDialog use (Logan Rathbone)
- about: port dialog to libadwaita (Titouan Real)
- Update POTFILES.in (Logan Rathbone)
- chartable: Port to GtkColumnView (Logan Rathbone)
- gtkhex: Local variables in switch statement should be in own scope (ie,=
 fix
  clang build issues) (Fixes: #74) (David C. Manuelda, Logan Rathbone)
- appwin: Mark error message string properly translatable (Logan Rathbone=
)

Translation updates:
- Alan Mortensen (da)
- Anders Jonsson (sv)
- Emin Tufan =C3=87etin (tr)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/ghex/{ghex_45.1.bb =3D> ghex_46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/ghex/{ghex_45.1.bb =3D> ghex_46.0.bb} (8=
3%)

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb b/meta-gnome/reci=
pes-gnome/ghex/ghex_46.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
rename to meta-gnome/recipes-gnome/ghex/ghex_46.0.bb
index 5901e3c09..41d839163 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_45.1.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_46.0.bb
@@ -15,7 +15,7 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 inherit gnomebase gsettings gtk-icon-cache gnome-help gettext gobject-in=
trospection vala gi-docgen
=20
-SRC_URI[archive.sha256sum] =3D "fb2b0823cd16249edbeaee8302f9bd5005e01503=
68b35f1e47c26680cacac2fa"
+SRC_URI[archive.sha256sum] =3D "a1c46f3020cb358b8323025db3a539c97d994a4c=
46f701f48edc6357f7fbcbd1"
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
--=20
2.44.0


