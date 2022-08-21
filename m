Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFC6C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 10:13:37 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web12.5400.1661076813628203985
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 03:13:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout07.t-online.de (Postfix) with SMTP id 8E4B28F83
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 12:13:31 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.36.214]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oPhxH-2R1QLR0; Sun, 21 Aug 2022 12:13:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire: install as configured
Date: Sun, 21 Aug 2022 12:13:03 +0200
Message-Id: <20220821101303.4155-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661076799-01447F1E-0F207CC3/0/0 CLEAN NORMAL
X-TOI-MSGID: ddb83e25-0a21-46bc-b8f1-5ed546245a7c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Aug 2022 10:13:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98343

This is to make sure that all configured parts of pipewire are installed =
on the target.
For the systemd case, it would then just be a matter of starting the pipe=
wire user services,
to get it running.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pipewire/pipewire-media-session_0.4.1.bb          |  1 +
 .../recipes-multimedia/pipewire/pipewire_0.3.56.bb    | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-me=
dia-session_0.4.1.bb
index 5dd1eb160..2facf8529 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
@@ -11,6 +11,7 @@ DEPENDS =3D " \
 "
=20
 RRECOMMENDS:${PN} +=3D "pipewire"
+RPROVIDES:${PN} =3D "media-session"
=20
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;pro=
tocol=3Dhttps;branch=3Dmaster"
=20
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
index eb8c9d01a..4dca6cc97 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
@@ -319,6 +319,17 @@ FILES:${PN}-jack =3D "\
     ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
 "
=20
+RRECOMMENDS:${PN}:class-target =3D " \
+	pipewire-alsa-card-profile \
+	pipewire-modules-meta \
+	pipewire-spa-plugins-meta \
+	${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'pipewire-alsa', '', d)=
} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer1.0-pipe=
wire', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'jack', 'pipewire-jack', '', d)=
} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pipewire-pulse',=
 '', d)} \
+	${PIPEWIRE_SESSION_MANAGER} \
+"
+
 # Dynamic SPA plugin packages (see set_dynamic_metapkg_rdepends).
 FILES:${PN}-spa-plugins =3D ""
 RRECOMMENDS:${PN}-spa-plugins +=3D "${PN}-spa-plugins-meta"
--=20
2.34.1


