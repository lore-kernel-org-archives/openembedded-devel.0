Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552D0C982C7
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18119.1789458273915707452
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=MjktfcS5;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 372E01C45A
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Npr-00ds5x0; Tue, 15 Sep 2026 09:44:11 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 18/31] gnome-system-monitor: upgrade 50.0 -> 51.0
Date: Tue, 15 Sep 2026 09:43:34 +0200
Message-ID: <20260915074347.6003-18-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458251-077FD9B9-BCE2BE7C/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ce9a80f-d7dd-4748-a0ef-35acce9c345f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=uL0wfQ1OKexdWnUoZZjKnwaUaLXefBMmolufx2nlKYA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MjktfcS5CtqA59PxENGnqvGVS7B+Q2lrfLjSfvMAnl8guuuft3RQhaHX3cq63WNtF
	 Z9TByY0+ProS+SCiyNNmcHofNR0gLoiwQq9f6foM7wzKuqnVgJi2Yc9Ph9LouHVWjR
	 5zJHP9Cz/Al3jupHMan7Vk+AWJvhAEPdcHXrTghyen+SNLfYCKG8Tu2CfmF3nNi4zF
	 lTlEc4jH1/WP37IRqgChPZq9UzaxHNz3yxfhGMVTNDKnDPyw5Pjil3lbiWkUdXByaz
	 oTjz6Y+sQNV6yv9XzuwKJ/sIJlHWIAmg9RWamPPdpHEI1Jno8gbxyPQHafXWQaxePZ
	 eK2YKGtbp919w==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130059

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-system-monitor_50.0.bb =3D> gnome-system-monitor_51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monit=
or_50.0.bb =3D> gnome-system-monitor_51.0.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_50.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_51.0.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-mo=
nitor_50.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-moni=
tor_51.0.bb
index 29918605ef..5853bca36b 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
50.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
51.0.bb
@@ -19,7 +19,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon=
-cache features_check get
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "a4138aa754b4584c46de91fad1d685e27b12bc24=
57de761863b6be02d84c4862"
+SRC_URI[archive.sha256sum] =3D "8887b03427230ac0816d4b0c801ce6628ad1fc91=
39ed3072914e9faa881ba868"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
--=20
2.55.0


