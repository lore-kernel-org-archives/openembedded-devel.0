Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327EACF9C4B
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20591.1726844888086264903
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id B2F6BDE40
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfET-3JaG0K0; Fri, 20 Sep 2024 17:07:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/23] gdm: update 46.0 -> 47.0
Date: Fri, 20 Sep 2024 17:08:03 +0200
Message-ID: <20240920150822.1131707-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844861-76FFB467-87B04597/0/0 CLEAN NORMAL
X-TOI-MSGID: f6c86324-e2c3-45d2-ad60-10b2d2f07997
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112407

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Fix X11 support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Make X11 support optional
- Support logind secure attention key
- Drop gdm-screenshot
- Don't hardcode g-r-d in dbus policy
- Fix numeric local address resolution
- Docs updates
- Translation updates

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Support for gnome-remote-desktop persistent sessions
- Misc changes
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/{gdm_46.0.bb =3D> gdm_47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_46.0.bb =3D> gdm_47.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_47.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
index ec1d6ad39..94836cdbc 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_46.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "8d6cb52176eca48b6bbf1cfe2fdae08d9677b5a0=
f2bca600dee4604de0dd1efc"
+SRC_URI[archive.sha256sum] =3D "c5858326bfbcc8ace581352e2be44622dc0e9e5c=
2801c8690fd2eed502607f84"
=20
 EXTRA_OEMESON =3D " \
     -Dplymouth=3Ddisabled \
--=20
2.46.0


