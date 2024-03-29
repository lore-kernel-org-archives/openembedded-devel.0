Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84514C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 19:12:20 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.3940.1711739532881661696
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Mar 2024 12:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout05.t-online.de (Postfix) with SMTP id 51B2264
	for <openembedded-devel@lists.openembedded.org>; Fri, 29 Mar 2024 20:12:11 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.175.79]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rqHe6-1ysw4n0; Fri, 29 Mar 2024 20:12:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gdm: update 45.0.1 -> 46.0
Date: Fri, 29 Mar 2024 20:12:24 +0100
Message-ID: <20240329191224.3767110-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1711739530-58D8F94C-C50ECD66/0/0 CLEAN NORMAL
X-TOI-MSGID: b2d3af38-1196-4daa-917e-86cbd61bd845
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Mar 2024 19:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109683

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- PAM improvements
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Support for killing conflicting sessions at login time.
- XDMCP fix
- Use wayland by default on certain server chips
- Fix pam extension size computation
- Introspection fix
- Fix for homed users
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Support remote login from gnome-remote-desktop (and hopefuly nicedcv in=
 the future)
- Support new JSON pam extension
- Fix build with user-display-server=3Dfalse
- Minor clean ups
- Move private D-Bus sockets to private directory
- Build goo fixes
- Warning fixes
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/{gdm_45.0.1.bb =3D> gdm_46.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_45.0.1.bb =3D> gdm_46.0.bb} (90=
%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb b/meta-gnome/reci=
pes-gnome/gdm/gdm_46.0.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
index d95ea9013..469281624 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
@@ -19,8 +19,8 @@ GIR_MESON_OPTION =3D ""
=20
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
-SRC_URI =3D "https://download.gnome.org/sources/gdm/${@oe.utils.trim_ver=
sion("${PV}", 1)}/gdm-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "6572578c05e3c6569d6ed269f7de2aaf3a035657654586d8=
243907bb7a6ffa85"
+
+SRC_URI[archive.sha256sum] =3D "8d6cb52176eca48b6bbf1cfe2fdae08d9677b5a0=
f2bca600dee4604de0dd1efc"
=20
 EXTRA_OEMESON =3D " \
     -Dplymouth=3Ddisabled \
--=20
2.44.0


