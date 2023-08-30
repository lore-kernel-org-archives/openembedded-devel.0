Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE55C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 08:16:21 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.9388.1693383379404105863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 01:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 33FB64D9D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 10:16:05 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.36.217]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qbGMp-2QwTSs0; Wed, 30 Aug 2023 10:15:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] spice-guest-vdagent: add missing dependencies
Date: Wed, 30 Aug 2023 10:15:49 +0200
Message-ID: <20230830081550.1364085-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830081550.1364085-1-f_l_k@t-online.de>
References: <20230830081550.1364085-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693383359-299F3649-6F08BB35/0/0 CLEAN NORMAL
X-TOI-MSGID: a32a9b33-f946-4fed-8609-42e8b1e36715
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104663

add x11 to REQUIRED_DISTRO_FEATURES

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/spice/spice-guest-vdagent_0.22.1.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.=
22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.=
1.bb
index b51e03899..3af973eed 100644
--- a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
+++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
@@ -10,11 +10,11 @@ SRC_URI =3D "git://gitlab.freedesktop.org/spice/linux=
/vd_agent.git;protocol=3Dhttps;
 S =3D "${WORKDIR}/git"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES =3D "opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
 inherit autotools pkgconfig features_check
=20
-DEPENDS =3D "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol"
+DEPENDS =3D "glib-2.0 alsa-lib gtk4 dbus libdrm spice-protocol libxfixes=
 xrandr xinerama libx11"
=20
 EXTRA_OECONF =3D " \
 	--with-gtk4 \
--=20
2.41.0


