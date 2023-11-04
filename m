Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E985C0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 14:59:25 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.11015.1699109961208036236
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 07:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout03.t-online.de (Postfix) with SMTP id 25DE325EB6
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 15:59:19 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzI7I-00YN750; Sat, 4 Nov 2023 15:59:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gtksourceview5: Upgrade 5.7.1 -> 5.10.0
Date: Sat,  4 Nov 2023 15:59:32 +0100
Message-ID: <20231104145932.128150-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104145932.128150-1-f_l_k@t-online.de>
References: <20231104145932.128150-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699109957-58FF2ED2-879A4305/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d6c8723-0ffb-4d39-8424-698bcf8c696b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 14:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106373

News in 5.10.0, 2023-09-16
--------------------------

5.10.0 corresponds with GNOME 45.0 and is meant for end-user
distribution.

Changes since 5.9.0:

 * Translation updates

News in 5.9.0, 2023-09-01
-------------------------

5.9.0 is a release candidate for GNOME 45.

 * Documentation improvements
 * Various introspection improvements
 * New languages: Blueprint
 * Updated languages: C, C++, Rust, Python3, Shell, Java, OCaml
 * Updated style schemes: cobalt
 * GtkSourceBuffer gained a "loading" property which is
   toggled when GtkSourceFileLoader is loading the buffer
   from storage.
 * More defensiveness improvements in GtkSourceBufferOutputStream.
 * A leak in Vim emulation has been fixed.
 * Vim emulation now supports visual replace.
 * Scheduling of batched workers has been improved with
   gtk_source_scheduler_add().
 * Snippets are now initialized from GtkSourceView.constructed()
   to allow for applications to hook buffer creation.
 * Translation updates

News in 5.8.0, 2023-03-17
-------------------------

5.8.0 is meant for end-users which corresponds to the GNOME 44.0 release.

 * vim: avoid large numbers of small deletions in filter command
 * adwaita.xml: add missing def:deletion style
 * todotxt.lang: add support for todo.txt format

News in 5.7.2, 2023-03-03
-------------------------

5.7.2 is a development release of GtkSourceView intended for application
developers and unstable distributions alike.

 * Documentation improvements
 * Updated languages: java.lang, html.lang
 * Fix Y offset calculation when GtkTextView:top-margin is set
 * Completion now requeries providers upon manual activation
 * CSS updates for completion popover to reduce allocation jitter
 * Assistants will more aggresively update positioning. It is heavily
   suggested that you have GNOME/gtk!5564 in whatever GTK you are
   linking against to reduce the potential for frames rendered with
   missing allocations/text.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gtksourceview5_5.7.1.bb =3D> gtksourceview5_5.10.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.7.1.bb =3D=
> gtksourceview5_5.10.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.=
bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.b=
b
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
index 4eaecbf08..33830c6a2 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.7.1.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
@@ -25,8 +25,8 @@ inherit gnomebase lib_package gettext features_check gi=
-docgen gtk-icon-cache go
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.7/${PNAM=
E}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "3b42541964db9c2fa50a9658d4886bdf77d023fe4e96c5b1=
7bce51c9f58c48e6"
+SRC_URI =3D "https://download.gnome.org/sources/gtksourceview/5.10/${PNA=
ME}-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "b38a3010c34f59e13b05175e9d20ca02a3110443fec2b1e5=
747413801bc9c23f"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
--=20
2.42.0


