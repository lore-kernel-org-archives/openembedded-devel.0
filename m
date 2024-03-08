Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CC4C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:08:54 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.1715.1709924924528836347
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 11:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id AE7C95A7E
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 20:08:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rifZv-1zryvz0; Fri, 8 Mar 2024 20:08:23 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/5] gnome-settings-daemon: fix reproducibility issue
Date: Fri,  8 Mar 2024 20:08:27 +0100
Message-ID: <20240308190829.2442866-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308190829.2442866-1-f_l_k@t-online.de>
References: <20240308190829.2442866-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709924903-2F7FD9FB-5252949A/0/0 CLEAN NORMAL
X-TOI-MSGID: bd5c6af5-0977-4fca-9e4e-83171f5250ce
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 19:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109235

gnome-settings-daemon inserts lines containing ${S} into the source.
Although required for compilation, it affects reproducibility for
the src package.

Fix this by simply not packaging the modified source code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-settings-daemon/gnome-settings-daemon_45.0.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_45.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_45.0.bb
index 90df8bbd0..15651ba2a 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_45.0.bb
@@ -42,6 +42,8 @@ PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=3D=
false,wayland"
 def gnome_verdir(v):
    return oe.utils.trim_version(v, 1)
=20
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
+
 FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
     ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so =
\
--=20
2.44.0


