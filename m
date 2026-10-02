Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64379CA5FE9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 20:40:51 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3917.1790973645342485181
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 13:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=DlLkpx+C;
 spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 7EED1C36
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Oct 2026 22:40:42 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.227.105]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xCk3b-2JxvX80; Fri, 2 Oct 2026 22:40:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/5] gtksourceview5: upgrade 5.21.0 -> 5.22.0
Date: Fri,  2 Oct 2026 22:40:19 +0200
Message-ID: <20261002204022.70439-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002204022.70439-1-f_l_k@t-online.de>
References: <20261002204022.70439-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790973639-DF7FD9F1-6DA6CDE7/0/0 CLEAN NORMAL
X-TOI-MSGID: d191209e-46df-4381-b415-107a4f44f93f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790973642; i=f_l_k@t-online.de;
	bh=DVYkEBF/2edeSdd7hsWvUfFLhD+4fe1P8jPNGy2ma2E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DlLkpx+COQf6UOH/oCX+XrrBtFBqEW4WRmUqxRmUvn94CRGLZqQ0V4neA/HzPbVy/
	 UpOzG7zEZhg0nAsOWEfB0h7bxWcTnd037AbFLLgNSbDKRXhzy4lJeemEYYqbeoNHUr
	 2rcbZWBcmd5rOyqADp7QbCx/0irl0IpMtc2GfgF1so6ZSIT6UEB0CkXvsMQb6ZVIa9
	 ChJ2i21yfNJ0zTwJ/02zaHYRWcvKiOERUxBEnPuE+JZI1ki/7HLtNuSsz8Nxh/N90Y
	 dHr6UZIl5wAkjEYMqnMCo8g4Y2CviH/LD/KO09vsJeCWY21Wfb24HHF1JA/rF30x27
	 zeeI76bXnmNlQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 20:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130612

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gtksourceview5_5.21.0.bb =3D> gtksourceview5_5.22.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.21.0.bb =
=3D> gtksourceview5_5.22.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.21.0=
.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.22.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.21.0.=
bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.22.0.bb
index 103c933b60..e3c485abec 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.21.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.22.0.bb
@@ -20,7 +20,7 @@ REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
 GNOMEBN =3D "gtksourceview"
=20
-SRC_URI[archive.sha256sum] =3D "65f7ce9d2ec683c6ff9b27a50d909f3abef65f74=
2d11011e1b8f8b848cadf0f7"
+SRC_URI[archive.sha256sum] =3D "3ebce33c781e65590a450ecd3ffade480d8e3135=
b52ee996f1620d6c7dffbbff"
 S =3D "${UNPACKDIR}/gtksourceview-${PV}"
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
--=20
2.55.0


