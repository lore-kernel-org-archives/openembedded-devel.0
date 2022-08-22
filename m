Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68CEC3F6B0
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 15:50:05 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web12.19722.1661183401746457989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 08:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85,
 mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 0E3C5E011
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 17:50:00 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.154.174.226]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQ9gd-1GgBcI0; Mon, 22 Aug 2022 17:49:59 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCHv11 2/2] pipewire: install as configured
Date: Mon, 22 Aug 2022 17:49:41 +0200
Message-Id: <20220822154941.37013-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822154941.37013-1-f_l_k@t-online.de>
References: <20220822154941.37013-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1661183399-01452558-15C44181/0/0 CLEAN NORMAL
X-TOI-MSGID: 80791c7e-a009-45dc-862d-3a728f3b3e0f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 15:50:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98370

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
index 9fdb60380..ea8518f06 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
@@ -23,3 +23,4 @@ FILES:${PN} +=3D " \
 "
=20
 RRECOMMENDS:${PN} +=3D "pipewire"
+RPROVIDES:${PN} =3D "media-session"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.=
bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
index bf7bae80f..3e926783a 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
@@ -318,6 +318,17 @@ FILES:${PN}-jack =3D "\
     ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
 "
=20
+RRECOMMENDS:${PN}:class-target =3D " \
+	gstreamer1.0-pipewire \
+	pipewire-alsa-card-profile \
+	pipewire-jack \
+	pipewire-modules-meta \
+	pipewire-spa-plugins-meta \
+	${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'pipewire-alsa', '', d)=
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


