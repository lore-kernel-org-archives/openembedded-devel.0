Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9D4C54E69
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 01:21:20 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.33093.1710724873915084209
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 18:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id 502B08D76
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 02:21:11 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.38.150]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rm1gb-20evdj0; Mon, 18 Mar 2024 02:21:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gnome-settings-daemon: update 45.0 -> 46.0
Date: Mon, 18 Mar 2024 02:21:26 +0100
Message-ID: <20240318012126.1924855-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318012126.1924855-1-f_l_k@t-online.de>
References: <20240318012126.1924855-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1710724869-3DA409FB-1428D894/0/0 CLEAN NORMAL
X-TOI-MSGID: 49c97f73-0fb0-48ea-9822-35b82b0c2742
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Mar 2024 01:21:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109394

- requires gsettings-desktop-schemas-46.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- Build improvements
- Fixed glib deprecation warnings

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Smartcard:
- Don't lose track of token name on card removal

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates
- CI fixes

Xsettings:
- Expose setting for switch shapes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 46.alpha
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Translation updates

Sharing:
- Add support for gnome-remote-desktop headless mode

Power:
- Don't show notifications on mobile hardware

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...me-settings-daemon_45.0.bb =3D> gnome-settings-daemon_46.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_45.0.bb =3D> gnome-settings-daemon_46.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_45.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_46.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_45.0.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_46.0.bb
index 15651ba2a..d409e77ea 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_46.0.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "bb4dc46950e2a90f38f23225848856d2a7b1b718=
c89d0285ce197b7016bb1dc8"
+SRC_URI[archive.sha256sum] =3D "0b9a0f64fa18a8e7e09b4c95a3f754fa033c2cdb=
d2dc35701f0618572c1cb3d7"
=20
 PACKAGECONFIG ??=3D " \
     cups nm \
--=20
2.44.0


