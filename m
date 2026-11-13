Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7428.1794562073918400751
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Nov 2026 01:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=YhOd2HnJ;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout05.t-online.de (Postfix) with SMTP id ABA221F00
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 10:27:47 +0100 (CET)
Received: from localhost.localdomain ([79.219.233.205]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xRnZN-2DfB2T0; Fri, 13 Nov 2026 10:27:41 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 14/16] gthumb: upgrade 4.0 -> 4.0.2
Date: Fri, 13 Nov 2026 10:27:29 +0100
Message-ID: <20261113092732.3895896-14-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113092732.3895896-1-f_l_k@t-online.de>
References: <20261113092732.3895896-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1794562061-52FFA82B-769F0987/0/0 CLEAN NORMAL
X-TOI-MSGID: c0c4b902-2f34-49f1-9d47-74684ecf78a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1794562067; i=f_l_k@t-online.de;
	bh=vHsMLXI4rJNzaer0lCyLCdW8bX6s/K9o6v3pbY2KShk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YhOd2HnJKXKyNxyihaIypd3vXsudQa1UiDVONnlPqLN3sW5ONLd2Fb/Fs0RMVR69R
	 XglAeubJ3Q8fTNT3jkM5LxKMCFMNuDjfDrLEq61w70PLyR8MOKNTBkuy7RNAojmeYc
	 gPS8wdkEs+KDYfXc38OBdxQ5/YDhsQU0fN01UnaYalugBp7Jnj+wxCgSw6urkwXpWZ
	 KVqEPpcDbKTCc48vCoF6F2v7Ny4hWKP99fQGFPpQSajn70SuupC9YXNPlC2Srh1EqB
	 TqwPMFieh1l5929bCclMXA0LbhKN6aR/DGb/aICKKoTEyj5jnRpTCV1XvxgRTO+gt8
	 sZKUqUybezhFQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 09:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132230
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gthumb/{gthumb_4.0.bb =3D> gthumb_4.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gthumb/{gthumb_4.0.bb =3D> gthumb_4.0.2.=
bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb b/meta-gnome/r=
ecipes-gnome/gthumb/gthumb_4.0.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb
rename to meta-gnome/recipes-gnome/gthumb/gthumb_4.0.2.bb
index c3340551aa..5323451ef6 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_4.0.2.bb
@@ -34,6 +34,6 @@ inherit gnomebase gsettings gtk-icon-cache mime-xdg val=
a features_check
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 SRC_URI +=3D "file://0001-util.h-Include-stdbool.h-for-bool.patch"
-SRC_URI[archive.sha256sum] =3D "a24aaa72b5637f49097dedc9c141a33615da770d=
029315f3285ebf2156cf7b61"
+SRC_URI[archive.sha256sum] =3D "13cd9d6ce111262c25f4ff325bf36e9b806eec2d=
9b50be3c459cc2e69d4bbf69"
=20
 FILES:${PN} +=3D "${datadir}/metainfo"
--=20
2.56.0

