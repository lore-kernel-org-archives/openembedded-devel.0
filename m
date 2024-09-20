Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394CFCF9C41
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:21 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20391.1726844891862755733
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id CB1572E7DD
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEU-3JaG0Y0; Fri, 20 Sep 2024 17:07:42 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 18/23] libspelling: update 1.2.1 ->> 1.4.0
Date: Fri, 20 Sep 2024 17:08:17 +0200
Message-ID: <20240920150822.1131707-18-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844862-877FC467-1EC7AB23/0/0 CLEAN NORMAL
X-TOI-MSGID: 793a6d21-b038-4ed4-bf1e-648249fc7a3f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112421

libspelling 0.4.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This is a stable release for GNOME 47.0
 * Protect the SpellingEngine from systems with misconfigured dictionarie=
s.
 * Protect the SpellingTextBufferAdapter from NULL language codes.
 * Protect the SpellingJob from uncooperative break chars which could
   result in zero length runs.
 * Fix some incorrect licenses.
libspelling 0.3.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This is an unstable release for GNOME 47.rc.
 * Immediately clear tags for invalidated regions without round-tripping
   to the checker thread.
 * Bump soname for ABI changes in 0.3
 * Fix licenses to be LGPLv2.1+
 * Add sysprof profiler marks for performance profiling
 * Update example so people know to copy the button-press work
   to update the menu immediately.
 * Fix pkg-config fields
 * Fix libspelling usage from subproject
 * Make introspection building optional
 * Documentation improvements
libspelling 0.3.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This is an unstable release for GNOME 47.beta.
The highlight for this release is a new threaded spellchecking
engine. It performs text analysis and dictionary lookups in
bulk off the UI thread. Care is taken to catch collisions in the
face of user editing while spellchecking operations are in flight.
I expect a significant reduction in initial spellchecking time
after opening a document. Opening `gtktextbuffer.c` in Text Editor
was more than 8x faster.
Currently, libspelling relies on GTK main until 4.15.5 is released
so do keep this in mind if you are a distributor.
Some API has changed, though that is unlikely to affect any known
applications using libspelling.
 * Many new unit tests are part of the testsuite
 * SpellingLanguage was renamed to SpellingDictionary
 * SpellingLanguageInfo was renamed to SpellingLanguage
 * Various helpers were added to SpellingTextBufferAdapter so
   that they can update spelling menus. Applications that update
   the cursor position on clicks before showing menus may want to
   force the menu updating before `menu.popup`.
 * SpellingTextBufferAdapter now uses the new GtkTextBufferCommitNotify
   API in GTK 4.15.5 and newer

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libspelling_0.2.1.bb =3D> libspelling_0.4.0.bb}           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.2.1.bb =3D> l=
ibspelling_0.4.0.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.2.1.bb b/=
meta-gnome/recipes-gnome/libspelling/libspelling_0.4.0.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.2.1.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.0.bb
index f5f8a3321..dd4c8891e 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.2.1.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.0.bb
@@ -10,4 +10,7 @@ inherit gnomebase pkgconfig gettext gi-docgen vala gobj=
ect-introspection
 GIR_MESON_OPTION =3D ''
 GIDOCGEN_MESON_OPTION =3D 'docs'
=20
-SRC_URI[archive.sha256sum] =3D "7a787b467bd493f6baffb44138dbc4bef78aaab6=
0efb76a7db88b243bf0f6343"
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[sysprof] =3D "-Dsysprof=3Dtrue,-Dsysprof=3Dfalse,sysprof"
+
+SRC_URI[archive.sha256sum] =3D "00c63970d708a0ef3bcba40e708a06d7030114cb=
9f210c74583ffad56d36e3dd"
--=20
2.46.0


