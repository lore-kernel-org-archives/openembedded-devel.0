Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8025.1792577262557785178
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=r+7XyFO1;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id 09E3BE3A9
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEJ-0cELaB0; Wed, 21 Oct 2026 12:07:32 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 08/26] gnome-system-monitor: upgrade 51.0 -> 51.1
Date: Wed, 21 Oct 2026 12:06:56 +0200
Message-ID: <20261021100717.11068-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1792577252-84FF6903-E4DE5800/0/0 CLEAN NORMAL
X-TOI-MSGID: 1c4de62d-bdb5-491a-ab34-8bc7b93bfcee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577259; i=f_l_k@t-online.de;
	bh=N3Avw7nKfdZRJEXWJIHjw9dfLIRMj/GZmoCpXn4vTro=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=r+7XyFO1ckrtZeIhShhsyNdaEIxq6xBfR+QXpqmj2EDqV/XtAnfub/Pglt7Tiy84U
	 IZkfFspWQsxwB5nSbahBb0XJB0kcX9sy+boUISBW6lGh9Qi0Wx7ZyspBF9Ed2yj7Z0
	 Js1nuBH2YLPFGtyT1OWkSWqsKKGBZ0Xx5S0zh/VpbDD/+tvxCtw2dC2UcqwEzIckRP
	 wRzyn2aaoH5UjKwKEzRAgOLNfxvR+cU/Zxbmrup67erEpgwyMy+xIxldwjs6ZBnbMZ
	 yT+/fHNqKxW8KZkC/9R03OWtWHWjNM0AIukX5C85y+kfh33d7GbEqlezgvOD2Earre
	 67URX0jdiYiFA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131247
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nome-system-monitor_51.0.bb =3D> gnome-system-monitor_51.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-system-monitor/{gnome-system-monit=
or_51.0.bb =3D> gnome-system-monitor_51.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_51.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_51.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-mo=
nitor_51.0.bb
rename to meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-moni=
tor_51.1.bb
index 5853bca36b..c5f8eb901f 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
51.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
51.1.bb
@@ -19,7 +19,7 @@ inherit gnomebase gsettings gnome-help itstool gtk-icon=
-cache features_check get
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
-SRC_URI[archive.sha256sum] =3D "8887b03427230ac0816d4b0c801ce6628ad1fc91=
39ed3072914e9faa881ba868"
+SRC_URI[archive.sha256sum] =3D "acf0a61b02b18d20e29cc36cd275ed48fe5e2bee=
aac99140b299e659cb6493c6"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
--=20
2.56.0

