Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169E3C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 21:46:56 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.10625.1744321606166851079
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 14:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout10.t-online.de (Postfix) with SMTP id 79F29E66
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 23:46:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.172]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u2zjM-3QlB8T0; Thu, 10 Apr 2025 23:46:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-session: update 46.0 -> 47.0.1
Date: Thu, 10 Apr 2025 23:46:33 +0200
Message-ID: <20250410214633.3408298-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1744321600-BD7ECA6A-354CFEFC/0/0 CLEAN NORMAL
X-TOI-MSGID: 17849aa1-a982-4265-b07b-349fe5b1965a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 21:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116772

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.0.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	Add back gnome-session-ctl (oops)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 47.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	Allow to disable X11 sessions
	CI updates
	Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-session_46.0.bb =3D> gnome-session_47.0.1.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_46.0.bb =3D=
> gnome-session_47.0.1.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb=
 b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
index 94e639456f..3bb1cb1651 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_47.0.1.bb
@@ -19,7 +19,8 @@ inherit gnomebase gettext gsettings upstream-version-is=
-even features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam gobject-introspection-d=
ata"
=20
-SRC_URI[archive.sha256sum] =3D "c6e1624af6090bc4e1a191fe2268abfa7a8de078=
31ca7a57f217e679bf7b9a54"
+SRC_URI =3D "https://download.gnome.org/sources/gnome-session/${@oe.util=
s.trim_version('${PV}', 1)}/gnome-session-${PV}.tar.xz"
+SRC_URI[sha256sum] =3D "56ae9c68e49995793eb2096bcdc4533b111669e1e54c8b6e=
0b1d952f6a5e8a70"
=20
 PACKAGECONFIG ??=3D ""
=20
--=20
2.49.0


