Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF58CA5FE7
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 20:40:51 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3849.1790973645318147594
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 13:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=J5XfmWdP;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 8D9F4C37
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Oct 2026 22:40:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.227.105]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xCk3b-2JxvX90; Fri, 2 Oct 2026 22:40:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/5] dconf: upgrade 0.49.0 -> 51.0
Date: Fri,  2 Oct 2026 22:40:20 +0200
Message-ID: <20261002204022.70439-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002204022.70439-1-f_l_k@t-online.de>
References: <20261002204022.70439-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790973639-ACFF69F1-B227AEED/0/0 CLEAN NORMAL
X-TOI-MSGID: fd1363da-e922-4cfc-af11-458e30e0950f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790973642; i=f_l_k@t-online.de;
	bh=8b9eytZqFO/H5GLE+OlKd0A9tBMgdj58WdGEFi212js=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J5XfmWdPrdvBtIbD11DscLfrjyYxW+nYybIWqXxy9D7gEfCs9viC+8cVULy2LvIz6
	 hjGQISD3qcWG+RHgipalALJZ6xeSYwETbxTHlBsgO4IKDPJwOr3XuMhrmRUJQP7IYC
	 NkJSlXCsGqMBUB4kffe4PLiIPaLENpw6D+2+pZGCoHtwGRZUMud7h/OM8aurwdh0DG
	 /uF6Llaf0X0PXw2OtM/C4Ji07+3z6td8mKiytopNBbRBSI3AAcGUo9af1keYd0DYB4
	 T6TeOi6BHf5QOiADq440pWCHHogUuJ7BBAl4JihMKoJG0UOFsCfbJHpLe24MwHi19Y
	 Xz1G+aiHQL2TA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 20:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130608

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/dconf/{dconf_0.49.0.bb =3D> dconf_51.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf_0.49.0.bb =3D> dconf_51.0.b=
b} (86%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.49.0.bb b/meta-gnome/=
recipes-gnome/dconf/dconf_51.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/dconf/dconf_0.49.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf_51.0.bb
index 43a680d202..3e25020ba4 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.49.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_51.0.bb
@@ -3,7 +3,7 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
 SECTION =3D "x11/gnome"
=20
-SRC_URI[archive.sha256sum] =3D "16a47e49a58156dbb96578e1708325299e4c19ee=
a9be128d5bd12fd0963d6c36"
+SRC_URI[archive.sha256sum] =3D "e65c1b7867f836faad9f9ee04acf5c5a6cae2bbc=
784833fe093207e0cb590248"
=20
 DEPENDS =3D "dbus glib-2.0 intltool-native"
=20
--=20
2.55.0


