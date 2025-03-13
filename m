Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8D6C35FF5
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 07:43:48 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.9437.1741851819864611158
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 00:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id F13D11021;
	Thu, 13 Mar 2025 08:43:37 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsdE8-4WdEZ80; Thu, 13 Mar 2025 08:43:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFC][gnome48][meta-gnome][PATCH 2/8] gdm: update 47.0 -> 48.beta
Date: Thu, 13 Mar 2025 08:44:05 +0100
Message-ID: <20250313074411.5600-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313074411.5600-1-f_l_k@t-online.de>
References: <20250313074411.5600-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741851816-EFFFD466-2F561CA9/0/0 CLEAN NORMAL
X-TOI-MSGID: 3391668d-9f40-4703-b9b7-501499a42e8f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 07:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115954

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
 meta-gnome/recipes-gnome/gdm/{gdm_47.0.bb =3D> gdm_48.beta.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gdm/{gdm_47.0.bb =3D> gdm_48.beta.bb} (9=
5%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_48.beta.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_48.beta.bb
index 9aefeed7d2..22048dbfcf 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_48.beta.bb
@@ -21,7 +21,7 @@ GIR_MESON_OPTION =3D ""
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI[archive.sha256sum] =3D "c5858326bfbcc8ace581352e2be44622dc0e9e5c=
2801c8690fd2eed502607f84"
+SRC_URI[archive.sha256sum] =3D "acd6728240d3424cf8b93479a81afcb22f05c361=
0a23d83094afe3a026f9ce6d"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[plymouth] =3D "-Dplymouth=3Denabled,-Dplymouth=3Ddisabled,=
plymouth"
--=20
2.48.1


