Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6BFC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 12:05:02 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47560.1789992300666580276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2026 05:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=YVsdGRC9;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout04.t-online.de (Postfix) with SMTP id CF5B226E
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 14:04:58 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.133]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8clQ-1X5LWa0; Mon, 21 Sep 2026 14:04:52 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [qmeta-gnome][PATCH 1/2] rygel: upgrade 45.2 -> 46.0
Date: Mon, 21 Sep 2026 14:04:42 +0200
Message-ID: <20260921120443.57180-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789992292-B5FF89A7-23E8BC3E/0/0 CLEAN NORMAL
X-TOI-MSGID: aefca216-6495-4ab9-a6de-2424817f89a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789992298; i=f_l_k@t-online.de;
	bh=kVq4qVy/8t6XHlPqc9XDFaXydMyZVdvi4kgasKZI83k=;
	h=From:To:Subject:Date;
	b=YVsdGRC9sVtbPN43GWacdApOlCJ5Mnj+HXo21c14LqYlAdbED/WBOarp2X/d3Z7nQ
	 K05lS5SeL1Y47Cx71oZvzthJsmjtJpUMmxjcT91BQUtmm+/HkMstlH7+81dAVwDf4R
	 j6FEBl/A23LrhwQWp9Kf23bjpLaVom/KCaFzkLj2SZEzo0Q2X7NnrGX8tOqz3sQBOB
	 LgB+VVv+u5I0PbeIicLM4DRC4Iu6FZNh7RkH/dF/4lM0hqcMjAjvo5ZhVNuG6IhnQ+
	 ZcohwEUnhnW0fjhsJifNHEMkgmI2tUZXcJuwyTrzXpCgibFPwzyHFHt3C4w+zSjVhu
	 zMTnm1dpsdPmA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 12:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130159

The RUIH plugin is gone upstream, so drop its PACKAGECONFIG along with
the RYGEL_PLUGINS entry that referenced it.

Two new native dependencies: meson now looks for a python3 that provides
the yaml module, and the manpages are rst sources built with rst2man.

The library API version is still 2.8, so the engine and plugin paths in
FILES and do_install keep working. HOMEPAGE follows the project to its
own domain.

AI-Generated: Uses Claude Code
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb b/m=
eta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
index b27b452ed3..0087493109 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_46.0.bb
@@ -41,7 +41,6 @@ PACKAGECONFIG[gtk4] =3D "-Dgtk=3Denabled,-Dgtk=3Ddisabl=
ed,gtk4"
 RYGEL_PLUGINS =3D ""
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'externa=
l', ',external', '', d)}"
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'mpris',=
 ',mpris', '', d)}"
-RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'ruih', =
',ruih', '', d)}"
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'gst-lau=
nch', ',gst-launch', '', d)}"
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'media-e=
xport', ',media-export', '', d)}"
 RYGEL_PLUGINS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'localse=
arch', ',localsearch', '', d)}"
--=20
2.55.0


