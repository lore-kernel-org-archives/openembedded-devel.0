Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5782EC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 08:34:13 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.6841.1742286843352873947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 01:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 375AF153A;
	Tue, 18 Mar 2025 09:33:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.234.59]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tuSOS-2EPvLm0; Tue, 18 Mar 2025 09:33:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 02/11] gdm: update 47.0 -> 48.0
Date: Tue, 18 Mar 2025 09:34:21 +0100
Message-ID: <20250318083430.544906-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318083430.544906-1-f_l_k@t-online.de>
References: <20250318083430.544906-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1742286828-5B7FC450-89DFD185/0/0 CLEAN NORMAL
X-TOI-MSGID: eb4fefe7-99a9-4be9-882b-c59a8e89f955
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 08:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116042

=3D=3D=3D=3D=3D=3D=3D
Version 48.0
=3D=3D=3D=3D=3D=3D=3D
- Allow changing global network settings
- Translation updates

=3D=3D=3D=3D=3D=3D=3D
48.beta
=3D=3D=3D=3D=3D=3D=3D
 - Don't require Xwayland if wayland-only
 - Fix pam_syslog detection
 - Fix Solaris build
 - Fix udev rules for disabling wayland
 - Add 'banner-message-path' and '-source' settings

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gdm/{gdm_47.0.bb =3D> gdm_48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_47.0.bb =3D> gdm_48.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_48.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
index 9aefeed7d2..eea4196c80 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "c5858326bfbcc8ace581352e2be44622dc0e9e5c=
2801c8690fd2eed502607f84"
+SRC_URI[archive.sha256sum] =3D "1bc06daff093ec7b5e37ecb4f92e5da3474a1b1b=
a076edb9151ee967d1c30adf"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[plymouth] =3D "-Dplymouth=3Denabled,-Dplymouth=3Ddisabled,=
plymouth"
--=20
2.48.1


